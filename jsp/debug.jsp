<!DOCTYPE html>
<html>
    <head>
  <script>
    // prevent 209601 (idle on a page, times the user out)
    var wiishop = new wiiShop();
    const unused = wiishop.connecting;
  </script>

      <title>Debug</title>
        <style>
            #consoleOutput {
                top: 130px;
                z-index: 1;
            }
        </style>

    </head>    
    <body onload="var ec = new ECommerceInterface();document.getElementById('consoleOutput').value = ec.getLog();document.getElementById('myP').innerText = ec.getLog();">
        <a href="javascript:history.back()">Return to Shop</a>
        <a href="javascript:window.location.reload()">Reload</a>
        <textarea id="consoleOutput" rows="16" style="width: 100%" readonly>EC Logging</textarea>
        <!--xml.setRequestHeader('Content-Type', 'text/html');-->
        <script>
            function sendLog() {
                var xml = new XMLHttpRequest();
                xml.open('POST', 'https://oss-auth.blinklab.com/oss/ecs/log');
                xml.send(document.getElementById('myP').innerText);
                xml.onreadystatechange = function(event) {
                    if (xml.status == 302) {
                        document.getElementById("sendBtn").innerHTML = "Log sent!";
                        setTimeout(function() {
                            document.getElementById("sendBtn").innerHTML = "Send log to server for support (ONLY PRESS IF SUPPORT IS NEEDED)";
                        }, 1500);
                    }
                }
            }
        </script>
<!--        <button onclick="var x = new wiiShop();x.rebootSystem()/*sendLog();*/">DO NOT PUSH THIS BUTTON AT ALL COSTS!!!!!!!</button>-->
        <button id="sendBtn" onclick="sendLog();">Send log to server for support (ONLY PRESS IF SUPPORT IS NEEDED)</button>
	<p id="myP" style="display: none;"></p>
    </body>
</html>
