from flask import Flask, send_file, render_template, request, redirect, Response, json
from werkzeug.serving import WSGIRequestHandler
from urllib.request import Request, urlopen




import requests
import xml.etree.ElementTree as ET
import ssl
import logging
import os


# Setup our app
app = Flask(__name__)
application = app


#@app.route('/')
#def index():
    #return render_template ('index.jsp')

@app.route('/bnr')
def banner():
    with open('bnr/BNR.bin', 'rb') as f:
        data = f.read()
    return Response(data)

@app.route("/ccs/download/<string:titleid>/<string:file>")
def download(titleid, file):
    #file_path = "content/" + titleid + "/" + file
    file_path = f"/media/sdc1/hydrobleach/Local/ccs.cdn.shop.wii.com/ccs/download/{titleid}/{file}"

    if os.path.exists(file_path):
        # File exists, return it
        return send_file(file_path, as_attachment=True), 200, {'x-result': '0'}
    else:
        # File does not exist, download it from the specified URL
        download_url = f"http://ccs.cdn.shop.wii.com/ccs/download/{titleid}/{file}"
        
        try:
            response = requests.get(download_url)
            response.raise_for_status()  # Raise an error for bad responses unless title is 0000000100000001
        except requests.exceptions.RequestException as e:
            if download_url == "http://ccs.cdn.shop.wii.com/ccs/download/0000000100000001/crl":
                return "crl"
            else:
                return f"Error downloading file: {e}", 404, {'x-result': '1'}

        # Create the directories if they don't exist
        os.makedirs(os.path.dirname(file_path), exist_ok=True)

        # Save the downloaded content to the specified file path
        with open(file_path, 'wb') as f:
            f.write(response.content)

        # Return the downloaded file
        return send_file(file_path, as_attachment=True), 200, {'x-result': '0'}




if __name__ == '__main__':
    WSGIRequestHandler.protocol_version = "HTTP/1.1"
    context = ssl.SSLContext(ssl.PROTOCOL_TLSv1)
    # Hint that we are about to use very brittle ciphers.
    context.set_ciphers('ALL:@SECLEVEL=0')
    context.load_cert_chain('server.pem', 'server.key')
    
    app.run(host="0.0.0.0", port=9443, debug=True, ssl_context=context) # socket.gethostbyname(socket.gethostname()))
