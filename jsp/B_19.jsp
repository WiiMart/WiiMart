<%@ page import = "java.io.*,java.util.*,java.net.http.*,java.net.URI,java.net.http.HttpResponse.BodyHandlers,java.net.HttpURLConnection,java.net.URL,java.nio.charset.StandardCharsets,org.json.*" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%
String titleId = request.getParameter("titleId") == null ? "" : request.getParameter("titleId");
String targetURL = "http://127.0.0.1:8082/getTitle?titleId=" + titleId;

StringBuilder res = new StringBuilder();

try {
    URL url = new URL(targetURL);
    HttpURLConnection connection = (HttpURLConnection) url.openConnection();
    connection.setRequestMethod("GET");

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
    //e.printStacktrace();
}

String games = res.toString();
//Tmd size stuff
String tmdUrl = "http://198.62.122.200/ccs/download/" + titleId + "/tmd";
StringBuilder tmdRes = new StringBuilder();
long tmdSize = 0;
try {
    URL url = new URL(tmdUrl);
    HttpURLConnection connection = (HttpURLConnection) url.openConnection();
    connection.setRequestMethod("GET");
    tmdSize = connection.getContentLengthLong();
    int responseCode = connection.getResponseCode();
    BufferedReader reader;

    if (responseCode == HttpURLConnection.HTTP_OK) {
        reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
    } else {
        reader = new BufferedReader(new InputStreamReader(connection.getErrorStream()));
    }

    String line;
    //String contentLength = connection.getHeaderField("Content-Length");
    //tmdSize = contentLength;
    while ((line = reader.readLine()) != null) {
        tmdRes.append(line);
    }
    reader.close();
} catch (Exception e) {
    //e.printStacktrace(out);
    res.append("Error: ").append(e.getMessage());
}
// Parse JSON response
JSONObject title = new JSONObject(games);
String id = title.getString("id");
String thumbnail = title.getString("thumbnail");
String title1 = title.getString("title1");
String title2 = title.getString("title2");
String platform = title.getString("console");
if (platform.equals("WII")) {
    platform = "Wii Channels";
} else if (platform.equals("WIIWARE")) {
    platform = "WiiWare";
};
String releaseDate = title.getString("date");
String genre = title.getString("genre");
String publisher = title.getString("publisher");
String points = title.getString("points");
String players = title.getString("players");
String ratingDetails = title.getString("ratingdetails");
String rating = title.getString("rating").toUpperCase();
String controllers = title.getString("controllers");
String size = title.getString("size");
String latestVersion = title.getString("titleVersion");
%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!-- Flush buffer before setting locale to ensure encoding is preserved -->
<!-- Title name -->
<!-- Controller image and message -->
<!-- Release Date -->	
<!-- Number of players -->
<!-- Title Rating Images -->
<!-- Use bilingual icons if language is french or country is canada -->
		<html>
<head>
  <!--  -----------------------------------------------------  -->
<!--  Copyright 2005-2014 Acer Cloud Technology, Inc.        -->
<!--  All Rights Reserved.                                   -->
<!--                                                         -->
<!--  This software contains confidential information and    -->
<!--  trade secrets of Acer Cloud Technology, Inc.           -->
<!--  Use, disclosure or reproduction is prohibited without  -->
<!--  the prior express written permission of Acer Cloud     -->
<!--  Technology, Inc.                                       -->
<!--  -----------------------------------------------------  -->
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
<link rel="shortcut icon" href="/oss/favicon.ico" /> 
<link href="/oss/oss/common/css/oss.css" rel="stylesheet" type="text/css" />
<link href="/oss/oss/common/css/error.css" rel="stylesheet" type="text/css" />
<script type="text/JavaScript">
<!--
	var ecCheck = false;
	var errorCheck = false;
	var buttonsCheck = false;
	var imagesCheck = false;
	var soundCheck = false;
	var shopCheck = false;
	var ossCheck = false;
//-->
</script>

<SCRIPT language="JavaScript" src="/oss/oss/common/js//ec.js"></SCRIPT>
<SCRIPT language="JavaScript" src='/oss/oss/common/js//error.js'></SCRIPT>
<SCRIPT language="JavaScript" src="/oss/oss/common/js//buttons.js"></SCRIPT>
<SCRIPT language="JavaScript" src="/oss/oss/common/js//images.js"></SCRIPT>
<SCRIPT language="JavaScript" src='/oss/oss/common/js//sound.js'></SCRIPT>
<SCRIPT language="JavaScript" src="/oss/oss/common/js//shop.js"></SCRIPT>
<SCRIPT language="JavaScript" src="/oss/oss/common/js//oss.js"></SCRIPT>

<script type="text/JavaScript">
<!--
var testMode = 'false';

function getMethod()
{
	return 'GET';	
}

function getPostParams()
{
    var params = "";    
   
   return params;
}

function isConnectingPage()
{
    var isConnecting = '';
    return (isConnecting == 'true');
}

function initPageCommon()
{
	var isShoppingManualEnabled = "true";
    	if (ecSupportsSession()) {
        	isShoppingManualEnabled = ec.getSessionValue("isShopManEnabled");
    	}
    
    	if (isShoppingManualEnabled != "true") {
    		hideElement("tophelpshadow");
	    	hideElement("help");
    	}
    	
	var ecsUrl = null;
	var iasUrl = null;
	var ccsUrl = null;
	var ucsUrl = null;
	var currBalance = null;

    // js file loading check
	var shopErrCheck = new wiiShop();
	if (shopErrCheck != null && "error" in shopErrCheck) {
		// shopErrCheck.error(209620, 1);
		if (!ecCheck) {
			shopErrCheck.error(209620, 1);
		} else if (!errorCheck) {
			shopErrCheck.error(209620, 1);
		} else if (!buttonsCheck) {
			shopErrCheck.error(209620, 1);
		} else if (!imagesCheck) {
			shopErrCheck.error(209620, 1);
		} else if (!soundCheck) {
			shopErrCheck.error(209620, 1);
		} else if (!shopCheck) {
			shopErrCheck.error(209620, 1);
		} else if (!ossCheck) {
			shopErrCheck.error(209620, 1);
		}
	}

	init();
	
	// Cancel any ongoing async ops
	ec.cancelOperation();
	

	ecsUrl = 'https://ecs.thecheese.io/ecs/services/ECommerceSOAP';

	iasUrl = 'https://ias.thecheese.io/ias/services/IdentityAuthenticationSOAP';

	ccsUrl = 'https://ccs.blinklab.com/ccs/download';

	ucsUrl = 'https://ccs.blinklab.com/ccs/download';
	

	ec.setWebSvcUrls(ecsUrl, iasUrl);
	ec.setContentUrls (ccsUrl, ucsUrl);
	
	

	imagesPath = "/oss/oss/common/images/";
	htmlPath = "/oss/oss/common/html";
	ossPath = "https://oss-auth.thecheese.io/oss/serv/";
	secureOssPath = "https://oss-auth.thecheese.io/oss/serv/";	

	ecTimeout = new ECTimeout(parseInt("60000"));
	
	
	currBalance = document.getElementById("currentBalance");
	if(currBalance) {
		currBalance.innerHTML = getBalance();
	}		
	
	setLogUrl("Log.jsp");

    if(shop.isCompatibleMode)
    {
        setEulaUrl("L_01.jsp");
    }
    else
    {
        setEulaUrl("L_03_UA_1.jsp");
    }

	
	MM_preloadImages('/oss/oss/common/images//banner/under_banner_a.gif');
	var supportsCreditCard = 'false';
	if (ecSupportsSession()) {
        	ec.setSessionValue("supportsCreditCard", supportsCreditCard);
    	}

    updateHistory();
	var isConnecting = isConnectingPage();
    setConnectingToServer(isConnecting);
    
    if (isHRPDisablePage()) {
	   	wiiDisableHRP();
	} else {
	   	wiiEnableHRP();
	}
}

<!--  -----------------------------------------------------  -->
<!--  Copyright 2005-2014 Acer Cloud Technology, Inc.        -->
<!--  All Rights Reserved.                                   -->
<!--                                                         -->
<!--  This software contains confidential information and    -->
<!--  trade secrets of Acer Cloud Technology, Inc.           -->
<!--  Use, disclosure or reproduction is prohibited without  -->
<!--  the prior express written permission of Acer Cloud     -->
<!--  Technology, Inc.                                       -->
<!--  -----------------------------------------------------  -->


// Takes a progress object and returns the OSS error message to be displayed to the user
function getOssErrorMsg(progress)
{
	if (progress.status >= 0) { return ""; }
	
    var status = progress.status;
    var errCode = progress.errCode;
    var errInfo = progress.errInfo;

    var msg;	

	var a = new Array();	
	// EC lib Errors
	//a[-(EC_ERROR_CANCELED)] = "???OSS_ERROR_NETWORK_TIMEOUT???";
	a[-(EC_ERROR_NET_NA)] = "There was a network error. Please check your Internet settings and your network configuration.<BR><BR>Visit support.nintendo.com for assistance.";
	a[-(EC_ERROR_ECARD)] = "The Wii Points Card activation number you entered is incorrect.<BR><BR>Visit support.nintendo.com for assistance.";
	a[-(EC_ERROR_REGISTER)] = "The Wii Number you entered is incorrect.<BR><BR>Visit support.nintendo.com for assistance.";
	a[-(EC_ERROR_ALREADY_OWN)] = "An error has occurred that cannot be resolved at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance if this continues.";
	msg = a[-status];

    if (status == EC_ERROR_WS_REPORT) {
    	 msg = getWebServiceErrorMsg(errCode, errInfo);
    } else if (status == EC_ERROR_NET_CONTENT ||
               status == EC_ERROR_FAIL ||
    	       status == EC_ERROR_WS_RECV) {
    	if (errCode != null && errCode < 0) {
    	    var httpStatus = errCodeToHTTPStatus(errCode);
    	    var nhttpStatus = errCodeToNHTTPStatus(errCode);    
      	    if (nhttpStatus == 0 && shop.isCompatibleMode) {
    		    msg = "There was a network error. Check your settings under the Internet option in System Settings on the Wii U Menu.";
    		} else if (nhttpStatus == 0) {
    		    msg = "There was a network error. Please check your Internet settings and your network configuration.<BR><BR>Visit support.nintendo.com for assistance.";
    		} else if (nhttpStatus != 0) {
    		    msg = "An error has occurred that cannot be resolved at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance if this continues.";
    		}
    	}
    }
        
    if (msg == null || msg == '') {
    	msg = "An error has occurred that cannot be resolved at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance if this continues.";
	}
	return msg;
}

function setErrorHtmlMsg(elem, errorCode, errorMsg)
{
    var html =
	 	'<span class="warningRed">'
		+ "Error Code: <span id='errorCode'></span></span>"
		+ '<BR><span class="contentsRedM">' + errorMsg + '</span>';
	elem.innerHTML = html;
	document.getElementById("errorCode").innerHTML = errorCode;
}

function setErrorHtml(elem, progress)
{
	if (elem != null) {
	    var errorCode = getOssErrorCode(progress);
    	var errorMsg = getOssErrorMsg(progress);
    	setErrorHtmlMsg(elem, errorCode, errorMsg);
	}
}


// Web service error messages 
// (only include message that may potentially be displayed to user)
// (errCode is progress.errCode from a web service)
// (errInfo is progress.errInfo from a web service)
function getWebServiceErrorMsg(errCode, errInfo)
{
	var a = new Array();
	
	// ECS Errors
	a[617] = "The Wii Points Card activation number you entered is incorrect.<BR><BR>Visit support.nintendo.com for assistance.";
	a[618] = "This Wii Points Card cannot be used in your country.<BR><BR>Visit support.nintendo.com for assistance.";
	a[621] = "An error has occurred that cannot be resolved at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance if this continues.";
	a[623]	= "You have downloaded this title before, and your trial period has expired. You cannot redownload it.<BR><BR>Visit support.nintendo.com for assistance.";
	a[642] = "An error has occurred that cannot be resolved at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance if this continues.";
	a[643] = "An error has occurred that cannot be resolved at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance if this continues.";
	a[644] = "Credit cards cannot be used on this console.<BR><BR>Please visit support.nintendo.com for assistance.";
	a[645] = "An error has occurred that cannot be resolved at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance if this continues.";
	
	// ECS Gift Errors
	a[646] = "An error has occurred that cannot be resolved at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance if this continues.";
	a[621] = "An error has occurred that cannot be resolved at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance if this continues.";
	a[626] = "An error has occurred that cannot be resolved at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance if this continues.";
	a[625] = "An error has occurred that cannot be resolved at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance if this continues.";
	
	// ETS Errors
	a[705] = "An error has occurred that cannot be resolved at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance if this continues.";
	a[706] = "An error has occurred that cannot be resolved at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance if this continues.";
	a[707] = "An error has occurred that cannot be resolved at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance if this continues.";
	
	// PAS Errors
	a[810]	= "An error has occurred while redeeming your Wii Download Ticket.<BR><BR>Visit support.nintendo.com for assistance.";
	a[811]	= "The Wii Points Card you entered has expired.";
	//a[812]	= "???OSS_ERROR_ECARD_NOT_USABLE???";
	//a[813]	= "???OSS_ERROR_ECARD_NOT_USABLE???";
	//a[814]	= "???OSS_ERROR_ECARD_NOT_USABLE???";
	a[815]	= "This Wii Points Card has already been redeemed.<BR><BR>Visit support.nintendo.com for assistance.";
	a[819]	= "The Wii Points Card activation number you entered is incorrect.<BR><BR>Visit support.nintendo.com for assistance.";
	
	a[826]	= "The server is busy.<BR><BR>Please try again later.";
	a[829]	= "The server is busy.<BR><BR>Please try again later.";
	a[830]	= "The Wii Points Card activation number you entered is incorrect.<BR><BR>Visit support.nintendo.com for assistance.";
	a[831] = "This Wii Points Card cannot be used in your country.<BR><BR>Visit support.nintendo.com for assistance.";

	// IAS Errors 
	a[901]	= "The Wii Number you entered is incorrect.<BR><BR>Visit support.nintendo.com for assistance.";
	a[903]	= "An error has occurred that cannot be resolved at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance if this continues.";
	a[928] = "An error has occurred that cannot be resolved at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance if this continues.";
	a[958]	= "An error has occurred that cannot be resolved at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance if this continues.";
	a[942] = "Unable to confirm the Username at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance if this continues.";
	a[943]	= "An error occurred while linking the Username. Please check the Username and password and try again.<BR><BR>If you have forgotten your Username or password, please visit club.nintendo.com.";

	a[941] = "An error occurred while linking the Username. Please check the Username and password and try again.<BR><BR>If you have forgotten your Username or password, please visit club.nintendo.com.";
	
	// More IAS Errors
	a[1401] = "An error occurred while linking the Username. Please check the Username and password and try again.<BR><BR>If you have forgotten your Username or password, please visit club.nintendo.com.";
	a[1402] = "Due to restrictions on your Club Nintendo Membership, it cannot be linked to this Wii Shop Channel account.<BR><BR>Visit support.nintendo.com for assistance.";
        a[1403] = "Due to restrictions on your Club Nintendo Membership, it cannot be linked to this Wii Shop Channel account.<BR><BR>Visit support.nintendo.com for assistance.";
	a[1499] = "Unable to confirm the Username at this time. The server is currently undergoing maintenance.<BR><BR>Sorry for the inconvenience. Please try again later.";
	
	// OSS Errors
	a[1610]	= "The Wii Download Ticket you entered has expired.";
	a[1611]	= "The Wii Download Ticket code you entered is incorrect.<BR><BR>Visit support.nintendo.com for assistance.";
	a[1612] = "This Wii Download Ticket cannot be used in your country.<BR><BR>Visit support.nintendo.com for assistance.";
	a[1613] = "There is no software available at this time for the Wii Download Ticket code you entered. Please check that you have entered the correct code.<BR><BR>NOTE: If you have activated Parental Controls, you may not be able to view all available software in the Wii Shop Channel. Please check your Parental Controls settings.";
	
	
	var msg = a[errCode];
	if(msg == null || msg == "") { // default errors
		if ((errCode >= 1400 && 
		     errCode <= 1499)) {
			msg = "Unable to confirm the Username at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance if this continues.";
		}
	}
	return msg;
}

// NOA errors
function getNOAError(code)
{
	var a=new Array();
	
	a[NOA_ERROR_CountyRequired] 				= "County is required.<BR><BR>Please try again.";
	a[NOA_ERROR_FoundOnBlacklist]				= "Unable to process.<BR><BR>For more information, visit support.nintendo.com.";
	a[NOA_ERROR_BillingAddress]                             = "The information you&rsquo;ve entered regarding your credit-card billing address is incorrect.<BR><BR>Please verify the information and try again.";
	a[NOA_ERROR_InvalidCardType]                            = "This credit-card number is invalid.<BR><BR>Please verify the information and try again.";
	a[NOA_ERROR_InvalidVfyValue]                            = "The credit-card information you&rsquo;ve entered is incorrect.<BR><BR>Please verify the information and try again.";
	a[NOA_ERROR_InvalidCcNumberAndExpDate]                  = "The credit-card information you&rsquo;ve entered is incorrect.<BR><BR>Please verify the information and try again.";
	a[NOA_ERROR_InvalidCreditCardNumber]			= "This credit-card number is invalid.<BR><BR>Please verify the information and try again.";
	a[NOA_ERROR_InvalidExpDate]				= "The credit-card information you&rsquo;ve entered is incorrect.<BR><BR>Please verify the information and try again.";
	a[NOA_ERROR_InvalidPostalCode]                          = "The postal code does not match the country settings entered in your Wii Settings.<BR><BR>Please verify the information and try again.";
	a[NOA_ERROR_TechnicalDifficulties]			= "Unable to confirm credit-card information at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance.";
	a[NOA_ERROR_TryAgainLater]				= "Unable to confirm credit-card information at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance.";

	a[NOA_RESULT_ERROR_CreditCardDeclined]			= "This credit card can&rsquo;t be used.<BR><BR>Please contact your credit-card company for more information.";
	a[NOA_RESULT_ERROR_CreditCardDeclined_Funds]		= "This credit card can&rsquo;t be used.<BR><BR>Please contact your credit-card company for more information.";
	a[NOA_RESULT_ERROR_CreditCardDeclined_Inactive]		= "This credit card can&rsquo;t be used.<BR><BR>Please contact your credit-card company for more information.";
	a[NOA_RESULT_ERROR_CreditCardDeclined_Exp]		= "The credit-card expiration date is invalid.";
	a[NOA_RESULT_ERROR_CreditCardDeclined_Code]		= "The credit-card information you&rsquo;ve entered is incorrect.<BR><BR>Please verify the information and try again.";
	a[NOA_RESULT_ERROR_CreditCardDeclined_CCNum]		= "This credit-card number is invalid.<BR><BR>Please verify the information and try again.";
	a[NOA_RESULT_ERROR_CreditCardDeclined_Limit]            = "This credit card can&rsquo;t be used.<BR><BR>Please contact your credit-card company for more information.";
	a[NOA_RESULT_ERROR_CreditCardDeclined_Invalid]		= "The credit-card information you&rsquo;ve entered is incorrect.<BR><BR>Please verify the information and try again.";
	a[NOA_RESULT_ERROR_CreditCardDeclined_AVS]		= "Billing zip/postal code is invalid. Please verify the information and try again. ";

	a[NOA_ERROR_EmptyVfyValue]				= "Please enter the three-digit security code.";

	var msg = a[code];
	return msg;
}

// IAS errors
function isLoyaltyError(progress)
{
	if (progress.status == EC_ERROR_WS_REPORT) {
		if ((progress.errCode >= 1400 && 
		     progress.errCode <= 1499) ||
			(progress.errCode == 942) ||
			(progress.errCode == 943) ||
			(progress.errCode == 941)) {
			return true;
		}
	}
	return false;
}	

function needCheckRegistration(progress)
{
	if (progress.status == EC_ERROR_WS_REPORT) {
		if ((progress.errCode == 903) ||
		     (progress.errCode == 642) ||
		     (progress.errCode == 625)) {
			return true;
		}
	}
	return false;		
}

function needSyncEticket(progress)
{
	if (progress.status == EC_ERROR_WS_REPORT) {
		if (progress.errCode == 621) {
			return true;
		}
	}
	return false;		
}



//-->

</script>
<title>Send a Message with Your Gift</title>
<style type="text/css">
  /* B_10:  Receiving */

#text01-01 {
	position:absolute;
	left:29px;
	top:28px;
	width:442px;
	height:28px;
	z-index:47;
}
#text02-01 {
	position:absolute;
	left:20px;
	top:84px;
	width:568px;
	height:18px;
	z-index:31;
}
#free03 {
	position:absolute;
	left:25px;
	top:162px;
	width:270px;
	height:50px;
	z-index:30;
}
#pointcost01 {	
    position:absolute;
	left:315px;
	top:162px;
	width:100px;
	height:18px;
	z-index:29;
}
#blockcost03 {	
    position:absolute;
	left:315px;
	top:187px;
	width:100px;
	height:18px;
	z-index:28;
}
#blockcost03_k {	
    position:absolute;
	left:315px;
	top:183px;
	width:100px;
	height:18px;
	z-index:28;
}
#pointword01 {	
    position:absolute;
	left:425px;
	top:162px;
	width:160px;
	height:50px;
	z-index:27;
}
#text03-01 {
	position:absolute;
	left:27px;
	top:210px;
	width:554px;
	height:18px;
	z-index:25;
}
.style33 {
    font-family: "Wii NTLG PGothic JPN Regular"
}
.style34 {
    font-size: 15px;
    color: #34BEED; 
}
#bannershadow {	position:absolute;
	left:199px;
	top:289px;
	width:211px;
	height:75px;
	z-index:35;
}
#wordL {	position:absolute;
	left:214px;
	top:311px;
	width:180px;
	height:22px;
	z-index:38;
}
#spacerL {	position:absolute;
	left:211px;
	top:297px;
	width:187px;
	height:55px;
	z-index:39;
}
#bannerL {	position:absolute;
	left:211px;
	top:297px;
	width:187px;
	height:55px;
	z-index:37;
}
#text04-01 {
	position:absolute;
	left:40px;
	top:210px;
	width:530px;
	height:18px;
	z-index:42;
}
#text05-01 {
	position:absolute;
	left:40px;
	top:235px;
	width:530px;
	height:18px;
	z-index:42;
}
#progressBar {
        position:absolute;
        left:100px;
        top:295px;
        width:400px;
	z-index:26;
}
.style35 {
    font-size: 12px
}
#TitleName2stline {
    position:absolute;
	left:64px;
	top:133px;
	width:480px;
	z-index:33;
}
#textIcrExpire {
    position:absolute;
    left:36px;
    top:88px;
    width:540px;
    height:200px;
    z-index:37;
}
/* B_11:  Receiving Error */
/* see B_10.css */
/* B_12: Receiving Successful */
/* see B_10.css */
/* B_19:  Mii Select */

#text01-01 {
	position:absolute;
	left:29px;
	top:28px;
	width:442px;
	height:28px;
	z-index:35;
}

#text02-01 {
	position:absolute;
	left:29px;
	top:88px;
	width:542px;
	height:28px;
	z-index:35;
}

#text03-01 {
	position:absolute;
	left:145px;
	top:140px;
	width:300px;
	height:40px;
	z-index:35;
}


#basePanel
{
  position:absolute;
  display:none;
  left:0px;
  top:0px;
  width:608px;
  height:456px;
  z-index:100;
  overflow:hidden;
}

#baseBanner
{
  position:absolute;
  left:0px;
  top:0px;
  width:608px;
  height:456px;
  z-index:101;
  overflow:hidden;
}

#miiContainer
{
  position:absolute;
  top:153px;
  left:67px;
  width:472px;
  height:196px;
  z-index:102;
  overflow:auto;
}

.miiPanel
{
  position:absolute;
  width:70px;
  height:70px;
  z-index:103;
}

.miiBanner
{
  position:absolute;
  width:70px;
  height:70px;
  z-index:104;
}

.face
{
  position:absolute;
  top:3px;
  left:3px;
  width:64px;
  height:64px;
  z-index:105;
}

.miiFocusMark
{
  position:absolute;
  width:70px;
  height:70px;
  z-index:106;
}

.spacer
{
  position:absolute;
  top:0px;
  left:0px;
  width:70px;
  height:70px;
  z-index:107;
}

#quitButton
{
  position:absolute;
  left:48px;
  top:363px;
  width:147px;
  height:51px;
  z-index:107;
}

#quitSpacer
{
  position:absolute;
  left:48px;
  top:363px;
  width:147px;
  height:51px;
  z-index:110;
}

#quitMessage
{
  position:absolute;
  left:48px;
  top:378px;
  width:147px;
  height:51px;
  z-index:108;
  text-align:center;
}

#messagePanel {
  position:absolute;
  left:57px;
  top:207px;
  width:496px;
  height:145px;
  z-index:51;
}

#messageBox {
  position:absolute;
  left:19px;
  top:195px;
  width:571px;
  height:171px;
  z-index:50
}

#messageTextarea {
  font-family: "Wii NTLG Gothic JPN Regular";
  font-size: 25px;
  line-height:37px;
  text-align: left;
  background: none;

  position:absolute;
  left:0px;
  top:0px;
  width:496px;
  height:145px;
  overflow:hidden;
  z-index:53;
}

#messageTextarea2 {
  font-family: "Wii NTLG Gothic JPN Regular";
  font-size: 25px;
  color: #ACACAC;
  line-height:37px;
  text-align: center;
  background: none;

  position:absolute;
  left:80px;
  top:0px;
  width:336px;
  height:45px;
  overflow:hidden;
  z-index:52;
}

#selectedMiiPanel {
  position:absolute;
  left:25px;
  top:109px;
  width:92px;
  height:92px;
  z-index:10;
}

#selectedMiiSpacer {
  position:absolute;
  left:0px;
  top:0px;
  width:92px;
  height:92px;
  z-index:15;
}

#selectedMiiBox {
  position:absolute;
  left:0px;
  top:0px;
  width:92px;
  height:92px;
  z-index:11;
}

#selectedMiiFace {
  position:absolute;
  left:14px;
  top:14px;
  width:64px;
  height:64px;
  z-index:12;
}

#nicknameBox {
  position:absolute;
  z-index:500;
}

#nicknamePanel {
  z-index:500;
}

/*************
 * FOR DEBUG *
 *************/
/*/
#basePanel, #miiContainer, #quitButton, .miiPanel, .miiBanner, .miiFocusMark, .face, .spacer, #hideButton
{
  border : solid 1px #ff0000;
}
/*//**/
/*/#basePanel       { border : solid thin blue; }/*//**/
/*/#miiContainer    { border : solid thin blue; }/*//**/
/*/#quitButton      { border : solid thin blue; }/*//**/
/*/.miiPanel        { border : solid thin blue; }/*//**/
/*/.miiBanner       { border : solid thin blue; }/*//**/
/*/.face            { border : solid thin blue; }/*//**/
/*/.spacer          { border : solid thin blue; }/*//**/
/*/#messagePanel   { border : solid thin blue; }/*//**/
/*/#messageTextarea{ border : solid thin red; }/*//**/
/*/#selectedMiiPanel{ border : solid thin blue; }/*//**/
</style>
<script type="text/JavaScript" src="/oss/oss/common/js/njsl.js"></script>
<script type="text/JavaScript" src="/oss/oss/common/js/miiselector.js"></script>
<script type="text/JavaScript">
<!--
var checking = 'true';
trace(checking);

function giveGift()
{
	var nextUrl = 'B_21.jsp?titleId=<%= request.getParameter("titleId") == null ? "" : request.getParameter("titleId") %>&recipient=<%= request.getParameter("recipient") == null ? "" : request.getParameter("recipient") %>';
	var messageElem = document.getElementById("message");
	var msg = messageElem.value;
	var transId = "";
	var giftStatus;
	var selectedMiiIdx;
	var mesSendHeader = 'You have been sent a gift containing\n<%= title1 %>\n<%= title2 %>\nthrough the Wii Shop Channel. \n\n';
	var mesSendFooter = '【How to Get Your Gift】\nSelect the Start icon in the lower\nright to jump to the gift-receiving\npage. At that page, select the Receive\nicon. (If you do not see the Start\nicon, you will need to perform a\nsystem update before receiving your\ngift.) \nIf you do not choose to receive or\nreturn a gift within 45 days of the\ntime it was sent to you, it will be\nautomatically returned to the sender.';
	var mesSendHeadLi = '【Message】\n';
	var mesSendFootLi = '\n\n';
	var mesRecvAccept = 'The gift you sent containing\n<%= title1 %>\n<%= title2 %>\nhas been received. ';
	var mesRecvReject = 'The gift you sent containing\n<%= title1 %>\n<%= title2 %>\nhas been returned. ';
	if (ecSupportsSession()) {
		selectedMiiIdx = window.miiSelector.selectedMiiIdx;
		trace("selectedMiiIdx::::"+selectedMiiIdx);
		ec.setSessionValue("selectedMiiIdx", selectedMiiIdx+"");
		giftStatus = ec.getSessionValue("giftStatus");
		giftAction = ec.getSessionValue("giftAction");
		if (giftStatus == "sending") {
			if (msg != "") {
				msg = mesSendHeadLi + msg + mesSendFootLi;
			}
			ec.setSessionValue("giftMessage", mesSendHeader + msg + mesSendFooter);
		} else if (giftStatus == "receiving") {
			if (msg != "") {
				msg = mesSendFootLi + mesSendHeadLi + msg;
			}
			if (giftAction == "accepting") {
				ec.setSessionValue("giftMessage", mesRecvAccept + msg);
			} else if (giftAction == "rejecting") {
				ec.setSessionValue("giftMessage", mesRecvReject + msg);
			} else {
				ec.setSessionValue("giftMessage", "giftAction else : " + msg);
			}
		} else {
			ec.setSessionValue("giftMessage", "giftStatus else : " + msg);
		}
		trace("giftStatus: "+giftStatus);
		transId = ec.getSessionValue("transId");
	}
	if (giftStatus == "sending") {
	    if (checking=="true") {
		showPage(nextUrl);
	    }
	} else {
		var titleId = '<%= request.getParameter("titleId") == null ? "" : request.getParameter("titleId") %>';
		var recipient = '<%= request.getParameter("recipient") == null ? "" : request.getParameter("recipient") %>';
		showGiftMessageSent(titleId, recipient);
	}
}

function initPage()
{
	initPageCommon();
	MM_preloadImages('/oss/oss/common/images//banner/under_banner_b.gif',
      '/oss/oss/common/images//banner/help_b.gif',
      '/oss/oss/common/images//banner/top_b.gif',
      '/oss/oss/common/images/banner/B_19_MiiBox_b.gif',
      '/oss/oss/common/images/banner/B_19_TextBox_b.gif',
      '/oss/oss/common/images/banner/B_20_MiiSelect_miiback_b.png',
      '/oss/oss/common/images/banner/nameplate_L.png',
      '/oss/oss/common/images/banner/nameplate_C.png',
      '/oss/oss/common/images/banner/nameplate_R.png',
      '/oss/oss/common/images/banner/B_20_MiiSelect_btn_b.png');
	var nwc24 = new wiiNwc24 ;
	if(!nwc24.sendable) nwc24.dispError();
	var friendIndex = parseInt('<%= request.getParameter("recipient") == null ? "" : request.getParameter("recipient") %>');
	var friendName = null;
	friendName = nwc24.getFriendInfo(friendIndex, "name");
	if (friendName != null)
		friendName = encodeHTML(friendName);
	var friendCode = nwc24.getFriendInfo(friendIndex, "userId");

	trace("friendIndex: "+friendIndex);
	trace("friendName: "+friendName);
	trace("friendCode: "+friendCode);

	if (ecSupportsSession()) {
		var giftStatus = ec.getSessionValue("giftStatus");
		trace("giftStatus:"+giftStatus);
		if (giftStatus != "receiving") {
			trace("checking:"+checking);
			if  (checking=="true") {        
				setUnderButtonL(true, 'Back', "javascript:showOldPage('B_18.jsp')", "wiiCancelSound()");
				document.getElementById("sendmessage").style.display='';
			}
		} else {
			var giftAction = ec.getSessionValue("giftAction");
			trace("giftAction:"+giftAction);
			trace("friendIndex: "+friendIndex)
			if (friendName == null){
				goGiftLoop(); //gift is from a stranger, don't send message
			} else {
			document.getElementById("receivemessage").style.display='';
			}
		}
	}

	var len=document.getElementsByName("recipientName").length;
	if (recipientName != null && len >0) {
		for(i=0;i<len;i++) {
			document.getElementsByName("recipientName")[i].innerHTML = friendName;
		}
	}
		
	if ((checking=="true") || (giftStatus == "receiving")) {
		document.getElementById("messageEditor").style.display='';
		setUnderButtonR(true, 'OK', "javascript:giveGift()", "wiiSelectSound()");

	} else {

        document.getElementById("reasonText").style.fontSize='14px';

        document.getElementById("BGimg").style.display='none';
        document.getElementById("statusMessage").style.display='';
        document.getElementById("bannershadow").style.display='';
        document.getElementById("spacerL").style.display='';
        document.getElementById("bannerL").style.display='';
        document.getElementById("wordL").style.display='';
        document.getElementById("text01-01").innerHTML = 'Gift';

        if (giftStatus == "sending") {
            document.getElementById("OKBtnAnchor").href="javascript:showOldPage('B_18.jsp')";
        }
    }

	if (giftStatus == "receiving") {
		document.getElementById("constElements").style.display='none';
		document.getElementById("giftline").style.display='';
		document.getElementById("giftcurrentBalance").innerHTML = getBalance();
		setUnderButtonL(false);
		document.getElementById("text01-01").innerHTML = 'Thank-You Message';
	}

  window.miiSelector = new NJSL.MiiSelector
    ({
        basePanel              : "basePanel",
        miiContainer           : "miiContainer",
        baseBanner             : "baseBanner",
        selectedMiiFace        : "selectedMiiFace",
        bannerDir              : "/oss/oss/common/images//banner",
        miiBanner1Img          : "B_20_MiiSelect_miiback1.png",
        miiBanner2Img          : "B_20_MiiSelect_miiback2.png",
        miiBanner3Img          : "B_20_MiiSelect_miiback3.png",
        miiBanner4Img          : "B_20_MiiSelect_miiback4.png",
        miiBanner5Img          : "B_20_MiiSelect_miiback5.png",
        miiFocusMarkA          : "B_20_MiiSelect_miiback_null.gif",
        miiFocusMarkB          : "B_20_MiiSelect_miiback_b.png",
        clickHandler           : giveGift
    });
}

var scroll_step = 30;
function kdown()
{
    var _code = event.keyCode;
	var _obj = document.getElementById('message');
	switch(_code)
	{
	    case 175:    //up
		case  38:
		    _obj.scrollTop -= scroll_step;
			break;
		case 176:    //down
		case  40:
		    _obj.scrollTop += scroll_step;
		    break;
	}
}

function getUrlParameter(name) {
    name = name.replace(/[\[]/, '\\[').replace(/[\]]/, '\\]');
    var regex = new RegExp('[\\?&]' + name + '=([^&#]*)');
    var results = regex.exec(location.search);
    return results === null ? '' : decodeURIComponent(results[1].replace(/\+/g, ' '));
};
//-->
</script>
<script type="text/JavaScript" src='/oss/oss/common/js//keyboard.js'></script>
</head>

<body onkeypress="kdown();" onload="initPage(); message.focus();">
<!--  -----------------------------------------------------  -->
<!--  Copyright 2005-2014 Acer Cloud Technology, Inc.        -->
<!--  All Rights Reserved.                                   -->
<!--                                                         -->
<!--  This software contains confidential information and    -->
<!--  trade secrets of Acer Cloud Technology, Inc.           -->
<!--  Use, disclosure or reproduction is prohibited without  -->
<!--  the prior express written permission of Acer Cloud     -->
<!--  Technology, Inc.                                       -->
<!--  -----------------------------------------------------  -->
<div id="constElements">
  <div id="tophelpshadow"><img src="/oss/oss/common/images//banner/top_help_shadow01.gif" width="132" height="75" /></div>
  <div id="help">
    <img src="/oss/oss/common/images//banner/help_a.gif" name="ManualImage"
     width="52" height="55" border="0" id="ManualImageID"  onmouseout="MM_swapImgRestore()" 
     onmouseover="MM_swapImage('ManualImage','','/oss/oss/common/images//banner/help_b.gif',1); wiiFocusSound();"
     onclick="showHelp(); wiiSelectSound();"/>
    <img src="/oss/oss/common/images//banner/help_gray.gif" 
     width="52" height="55" border="0" id="ManualGrayImageID" style="display:none" />
    <img src="/oss/oss/common/images//spacer.gif" name="HelpSpacer" width="52" height="55" border="0"
     id='HelpSpacer' style="position:absolute; top:0px; left:0px; display:none"/>
  </div>

  <div id="top">
    <img src="/oss/oss/common/images//banner/top_a.gif" name="TopImage" 
     width="52" height="55" border="0" id="TopImageID" onmouseout="MM_swapImgRestore()" 
     onmouseover="MM_swapImage('TopImage','','/oss/oss/common/images//banner/top_b.gif',1); wiiFocusSound();"
     onclick="showHome(); wiiCancelSound();"/>
    <img src="/oss/oss/common/images//banner/top_gray.gif" 
     width="52" height="55" border="0" id="TopGrayImageID" style="display:none" />
    <img src="/oss/oss/common/images//spacer.gif" name="MainSpacer" width="52" height="55" border="0"
     id='MainSpacer' style="position:absolute; top:0px; left:0px; display:none"/>
  </div>
  
  <div class="dot" id="line01">･･･････････････････････････････････････････････････････････&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;･･</div>
  <div class="dot" id="line02">･･･････････････････････････････････････････････････････････････････････････</div>
  <div class="dot" id="upperLineLong" style="display:none">･･･････････････････････････････････････････････････････････････････････････</div>
  
  <div id='balanceInfo'>
    <script type="text/JavaScript">MM_preloadImages('/oss/oss/common/images//banner/Addpoints_everywhere.gif');</script>
    <img src="/oss/oss/common/images//spacer.gif" name="PointSpacer" width="130" height="55" border="0"
     id='PointSpacer' style="position:absolute; top:376px; left:239px; z-index:20;"/>
    <div id="Wiipoint">
      <div align="center" class="buttonTextBlackM">Wii Points</div>
    </div>
    <div id="point" class="wiiPoint"><span id="currentBalance"></span></div>
  </div>
</div>
<!--  -----------------------------------------------------  -->
<!--  Copyright 2005-2014 Acer Cloud Technology, Inc.        -->
<!--  All Rights Reserved.                                   -->
<!--                                                         -->
<!--  This software contains confidential information and    -->
<!--  trade secrets of Acer Cloud Technology, Inc.           -->
<!--  Use, disclosure or reproduction is prohibited without  -->
<!--  the prior express written permission of Acer Cloud     -->
<!--  Technology, Inc.                                       -->
<!--  -----------------------------------------------------  -->
<script language="JavaScript">MM_preloadImages('/oss/oss/common/images//banner/under_banner_b.gif');</script>
<div id="underButtonL" style="display:none">
    <div id="underbannershadowL" class="buttonBannerShadow">
   	  <img src="/oss/oss/common/images//banner/under_banner_shadow.gif" width="211" height="75" />
   	</div>
    <div id="underbannerL" class="buttonBanner">
    	<img src="/oss/oss/common/images//banner/under_banner_a.gif" width="187" height="55" id="underImgL" />
    </div>
    <div id="underspacerL" class="buttonSpacer">
	  <a href="" id="underlinkL">
    	<img id="underimageL" src="/oss/oss/common/images//spacer.gif" width="187" height="55" border="0"  
    	onmouseover="MM_swapImage('underImgL','','/oss/oss/common/images//banner/under_banner_b.gif',1); snd.playSE( cSE_Forcus );" 
    	onmouseout="MM_swapImgRestore()"/>
      </a>	
    </div>
    <div id="underwordL" align="center" class="buttonTextBlackM buttonWord">
    </div>
</div>

<div id="underButtonR" style="display:none">
    <div id="underbannershadowR" class="buttonBannerShadow">
   	  <img src="/oss/oss/common/images//banner/under_banner_shadow.gif" width="211" height="75" />
   	</div>
    <div id="underbannerR" class="buttonBanner">
    	<img src="/oss/oss/common/images//banner/under_banner_a.gif" width="187" height="55" id="underImgR" />
    </div>
    <div id="underspacerR" class="buttonSpacer">
	  <a href="" id="underlinkR">
    	<img id="underimageR" src="/oss/oss/common/images//spacer.gif" width="187" height="55" border="0"  
    	onmouseover="MM_swapImage('underImgR','','/oss/oss/common/images//banner/under_banner_b.gif',1); snd.playSE( cSE_Forcus ); " 
    	onmouseout="MM_swapImgRestore()"/>
      </a>	
    </div>
    <div id="underwordR" align="center" class="buttonTextBlackM buttonWord">
    </div>
</div>

<div id="underButton" style="display:none">
    <div id="underbannershadow" class="buttonBannerShadow">
    	<img src="/oss/oss/common/images//banner/under_banner_shadow.gif" width="211" height="75" /></div>
    <div id="underbanner" class="buttonBanner">
    	<img src="/oss/oss/common/images//banner/under_banner_a.gif" width="187" height="55" id="underImg" /></div>
    <div id="underspacer" class="buttonSpacer">
	<a href="" id="underlink">
    	<img id="underimage" src="/oss/oss/common/images//spacer.gif" width="187" height="55" border="0" 
    	onmouseover="MM_swapImage('underImg','','/oss/oss/common/images//banner/under_banner_b.gif',1); snd.playSE( cSE_Forcus );" 
    	onmouseout="MM_swapImgRestore()">
    	</a>
    </div>
    <div id="underword" align="center" class="buttonTextBlackM buttonWord"></div>
</div>


<div id="giftline" style="display: none;">
  <div class="dot" id="line02">･･･････････････････････････････････････････････････････････････････････････</div>
  <div class="dot" id="line01">･･･････････････････････････････････････････････････････････････････････････</div>
  <div id="Wiipoint">
    <div align="center" class="buttonTextBlackM">Wii Points</div>
  </div>
  <div id="point">
    <div align="center" class="wiiPoint"><span id="giftcurrentBalance"></span></div>
  </div>
</div>

<div id="BGimg" style="position:absolute; left:0px; top:0px; width:608px; height:456px; z-index:0; overflow: hidden;">
  <img src="/oss/oss/common/images//back/B_19_bg.png" width="608" height="456" border="0"/>
</div>

<div class="titleBlackL" id="text01-01">Send a Message with Your Gift</div>

<div id="statusMessage" style="position:absolute; left:34px; top:85px; width:542px; height:195px; display:none">
  <div id="reasonText" align="center" class="buttonTextBlackM"><table height="100%"><tr><td align="left" valign="middle">
	</td></tr></table></div>
</div>

<div id="bannershadow" style="display:none"><img src="/oss/oss/common/images//banner/under_banner_shadow.gif" width="211" height="75" /></div>
<div id="spacerL" style="display:none">
  <a id="OKBtnAnchor" href="javascript:showBack()"><img src="/oss/oss/common/images//spacer.gif" width="187" height="55" border="0" onmouseover="MM_swapImage('Image7','','/oss/oss/common/images//banner/under_banner_b.gif',1);wiiFocusSound();" onmouseout="MM_swapImgRestore()" onclick="wiiSelectSound();"/></a>
</div>
<div id="bannerL" style="display:none"><img src="/oss/oss/common/images//banner/under_banner_a.gif" width="187" height="55" id="Image7" /></div>
<div id="wordL" style="display:none">
  <div align="center" ><span id="OKBtnWord" class="buttonTextBlackM">OK</span></div>
</div>


<div class="catalogTitleBlack" id="text02-01" name="sendmessage" style="display:none">
	Send a message to <span name="recipientName"></span></div>
<div class="catalogTitleBlack" id="text02-01" name="receivemessage" style="display:none">
	Send a message to <span name="recipientName"></span></div>

<div id="messageEditor" style="display:none">
<div class="contentsGrayL" id="text03-01">
  Attach a Mii</div>

  <div id="selectedMiiPanel">
    <div id="selectedMiiSpacer" onclick="window.miiSelector.open(); wiiSelectSound();"
      onmouseover="MM_swapImage('selectedMiiBox','','/oss/oss/common/images/banner/B_19_MiiBox_b.gif',0);wiiFocusSound();"
      onmouseout="MM_swapImgRestore();" ></div>
    <img id="selectedMiiBox" src="/oss/oss/common/images/banner/B_19_MiiBox_a.gif" />
    <img id="selectedMiiFace" src="/oss/oss/common/images/banner/B_19_no_one_face.gif" />
  </div>

  <div id="messagePanel"
    onmouseover="MM_swapImage('messageBox','','/oss/oss/common/images/banner/B_19_TextBox_b.gif',0);wiiFocusSound();"
    onmouseout="MM_swapImgRestore();">
    <textarea id="messageTextarea" name="message" onmousedown='if(kbd) kbd.call( cKT_Default, 4, false, "Write a message" ); document.getElementById("messageTextarea2").style.display="none";' value=""></textarea>
    <div id="messageTextarea2">Write a message</div>
  </div>
  <img id="messageBox" src="/oss/oss/common/images//spacer.gif"></div>

  <div id='basePanel'>
    <img id='baseBanner' src='/oss/oss/common/images/banner/B_20_MiiSelect_dialog_bg.png' />
    <div id='miiContainer' style='background-image:url("/oss/oss/common/images/banner/B_20_MiiSelect_backdrop.png");' ></div> 
    <div id='quitSpacer'
      onmouseover="MM_swapImage('quitButton','','/oss/oss/common/images/banner/B_20_MiiSelect_btn_b.png',0);wiiFocusSound();"
      onmouseout="MM_swapImgRestore();" ></div>
    <img id='quitButton' src='/oss/oss/common/images/banner/B_20_MiiSelect_btn_a.png' />
    <div id='NoMii' style='position:absolute; top:153px; left:67px; width:472px; height:196px; z-index:103; display: none;'><table width="100%" height="100%"><tr><td align="center" valign="middle"><span class="contentsBlackM">You don&rsquo;t have any Mii characters on your Wii.<BR>You can make Mii characters in the Mii Channel.</span></td></tr></table></div>
    <div id='quitMessage'>Quit</div> 
    <div id='nicknameBox' style="display:none;">
      <table cellspacing=0 cellpadding=0><tbody>
        <tr><td><img src='/oss/oss/common/images/banner/nameplate_L.png' /></td><td id='nicknamePanel' style='background-image:url("/oss/oss/common/images/banner/nameplate_C.png");'></td><td><img src='/oss/oss/common/images/banner/nameplate_R.png' /></td></tr>
      </tbody></table>
    </div>

  </div>
</div>

<div id='NoMii' class="contentsBlackM" style='position:absolute; top:153px; left:67px; width:472px; height:196px; z-index:103; display: none;'><table width="100%" height="100%"><tr><td align="center" valign="middle">You don&rsquo;t have any Mii characters on your Wii.<BR>You can make Mii characters in the Mii Channel.</span></td></tr></table></div>

</body>
</html>