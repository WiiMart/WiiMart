<%
        /*boolean credsCorrect = false;
        if (request.getParameter("accountId") != null || 
            request.getParameter("deviceId") != null || 
            request.getParameter("serialNo") != null ||
            request.getParameter("token") != null) {
                String accountId = request.getParameter("accountId");
                String deviceId = request.getParameter("deviceId");
                String serialNo = request.getParameter("serialNo");
                String token = request.getParameter("token");
                String region = request.getParameter("region") == null ? "USA" : request.getParameter("region");
                String body = "{\"accountId\": \"" + accountId + "\", \"deviceId\": \"" + deviceId + "\", \"serialNo\": \"" + serialNo + "\", \"token\": \"" + token + "\", \"region\": \"" + region + "\"}";
                String targetURL = "http://127.0.0.1:8082/checkAccountCreds";
                StringBuilder res = new StringBuilder();

                try {
                    URL url = new URL(targetURL);
                    HttpURLConnection connection = (HttpURLConnection) url.openConnection();
                    connection.setDoOutput(true);
                    connection.setRequestMethod("POST");
                    // Forward request body
                    try (OutputStream output = connection.getOutputStream()) {
                        output.write(body.getBytes());
                    }
                    int responseCode = connection.getResponseCode();
                    BufferedReader reader;

                    if (responseCode == HttpURLConnection.HTTP_OK) {
                        reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
                    } else {
                        reader = new BufferedReader(new InputStreamReader(connection.getErrorStream()));
                    }

                    String line;
                    while ((line = reader.readLine()) != null) {
                        res.append(line);
                    }
                    reader.close();
                } catch (Exception e) {
                    out.println("'There was an error: '" + e.getMessage());
                    //e.printStacktrace();
                }
                credsCorrect = Boolean.parseBoolean(res.toString());*/
                %>
                console.log(<%= credsCorrect %>);
                <% if (credsCorrect) { %>
                    shop.endWaiting();
    if (ecSupportsSession()) {
    // possibly set session variables in B_24, clear it in H_01 in case of Back button pressed.
        ec.setSessionValue("giftStatus", null);
        trace("clear giftStatus in H_01. ");
        ec.setSessionValue("redownloadFlag", null);
        trace("clear redownloadFlag in H_01. ");
        ec.setSessionValue("senderIndex", null);
        trace("clear senderIndex in H_01. ");
        ec.setSessionValue("transId", null);
        trace("clear transId in H_01. ");
        ec.setSessionValue("transType", null);
        trace("clear transType in H_01. ");
    }
    
                <% } else { %>
                    var errorMsg;
                    errorMsg = '???OSS_ERROR_TWL_REFUND_PASSWORD???';
                    setErrorMsg('205903', errorMsg);
                <% } %>
                
           <% } else { %>
    MM_preloadImages('/oss/oss/common/images//banner/under_banner_b.gif');

	var next = '';
	if (next == null || next == '') {
		if (isPageJump() || isFatalError()) {
	   		setUnderButton(true, shop.menuBtn, "javascript:showWiiMenu()", "wiiSelectSound()");
	   	} else {	
	 		setUnderButton(true, 'OK', "javascript:showBack()", "snd.playSE( cSE_Cancel );");
	 	}
	} else {
	 	setUnderButton(true, 'OK', "javascript:showPage(next)", "snd.playSE( cSE_Decide );");
	}
    var errorMsg;
                errorMsg = '???OSS_ERROR_TWL_REFUND_PASSWORD???';
    setErrorMsg('205903', errorMsg);
         <% } %>