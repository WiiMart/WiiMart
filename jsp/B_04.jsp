<%@ page import = "java.io.*,java.util.*,java.net.http.*,java.net.URI,java.net.URLEncoder,java.net.URLDecoder,java.net.http.HttpResponse.BodyHandlers,java.net.HttpURLConnection,java.net.URL,java.nio.charset.StandardCharsets,org.json.*,java.util.stream.Collectors" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% if ((request.getParameter("og") == null ? "false" : request.getParameter("og")).equals("false")) {%><a href="https://oss-auth.thecheese.io/oss/serv/debug.jsp">debug</a><% } %>
<%@ page buffer="8192kb" autoFlush="true" %>
<%
String customHeader1 = "platform";
String customValue1 = request.getParameter("platform") == null ? "WII" : request.getParameter("platform");
String targetURL = "http://127.0.0.1:8082/getTitles?" + request.getQueryString();
String vcParam = request.getParameter("vc") != null ? "&vc=true" : "";
boolean noResults = false;
if (customValue1.equals("WIIWARE")) {
	targetURL = "http://127.0.0.1:8082/getTitlesWiiWare?" + request.getQueryString();
}
if (customValue1.equals("WII")) {
	targetURL = "http://127.0.0.1:8082/getTitlesWiiChannels?" + request.getQueryString();
}
if (request.getParameter("vc") != null && request.getParameter("vc").equals("true")) {
	targetURL = "http://127.0.0.1:8082/getTitlesVc?" + request.getQueryString();
	
}

%>
<%
StringBuilder res = new StringBuilder();
String games = "";
String totalPages = "";
try {
    URL url = new URL(targetURL);
    HttpURLConnection connection = (HttpURLConnection) url.openConnection();
    connection.setRequestMethod("GET");

    int responseCode = connection.getResponseCode();
	totalPages = connection.getHeaderField("Total-Pages");
    BufferedReader reader;

    if (responseCode == HttpURLConnection.HTTP_OK) {
        reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
	String line;
	while ((line = reader.readLine()) != null) {
	    res.append(line);
	}
	reader.close();
	games = res.toString();
    } else {
        reader = new BufferedReader(new InputStreamReader(connection.getErrorStream()));
    }

} catch (Exception e) {
	e.printStackTrace();
	res.append("Error: ").append(e.getMessage());
}

//Now for the tmd size
if (games.equals("[]")) {
	noResults = true;
}
%>
<script>console.log("total pages: <%= totalPages %>")</script>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:c="http://java.sun.com/jsp/jstl/core">
<!-- Flush buffer before setting locale to ensure encoding is preserved -->
<html>
<head>
  
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
<link rel="shortcut icon" href="/oss/favicon.ico" /> 
<link href="/oss/oss/common/css/oss.css" rel="stylesheet"/>
<link href="/oss/oss/common/css/error.css" rel="stylesheet"/>
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

<SCRIPT language="JavaScript" src="/oss/oss/common/js/ec.js"></SCRIPT>
<SCRIPT language="JavaScript" src='/oss/oss/common/js/error.js'></SCRIPT>
<SCRIPT language="JavaScript" src="/oss/oss/common/js/buttons.js"></SCRIPT>
<SCRIPT language="JavaScript" src="/oss/oss/common/js/images.js"></SCRIPT>
<SCRIPT language="JavaScript" src='/oss/oss/common/js/sound.js'></SCRIPT>
<SCRIPT language="JavaScript" src="/oss/oss/common/js/shop.js"></SCRIPT>
<SCRIPT language="JavaScript" src="/oss/oss/common/js/oss.js"></SCRIPT>

<script type="text/JavaScript">
<!--
var testMode = 'false';

function getMethod()
{
	return '<%= request.getMethod() %>';	
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
	

	ecsUrl = 'http://ecs.thecheese.io/oss/ecs/services/ECommerceSOAP';

	iasUrl = 'http://ias.thecheese.io/oss/ias/services/IdentityAuthenticationSOAP';

	ccsUrl = 'https://ccs.blinklab.com/ccs/download';

	ucsUrl = 'https://ccs.blinklab.com/ccs/download';
	

	ec.setWebSvcUrls(ecsUrl, iasUrl);
	ec.setContentUrls (ccsUrl, ucsUrl);
	
	

	imagesPath = "/oss/oss/common/images/";
	htmlPath = "/oss/oss/common/html";
	ossPath = "https://oss-auth.thecheese.io/oss/serv/";
	secureOssPath = "https://oss-auth.thecheese.io/oss/serv/";	

	ecTimeout = new ECTimeout(parseInt("900000"));
	
	
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
	a[1402] = "Due to restrictions on your Club Nintendo Membership, it cannot be linked to this WiiMart account.<BR><BR>Visit support.nintendo.com for assistance.";
        a[1403] = "Due to restrictions on your Club Nintendo Membership, it cannot be linked to this WiiMart account.<BR><BR>Visit support.nintendo.com for assistance.";
	a[1499] = "Unable to confirm the Username at this time. The server is currently undergoing maintenance.<BR><BR>Sorry for the inconvenience. Please try again later.";
	
	// OSS Errors
	a[1610]	= "The Wii Download Ticket you entered has expired.";
	a[1611]	= "The Wii Download Ticket code you entered is incorrect.<BR><BR>Visit support.nintendo.com for assistance.";
	a[1612] = "This Wii Download Ticket cannot be used in your country.<BR><BR>Visit support.nintendo.com for assistance.";
	a[1613] = "There is no software available at this time for the Wii Download Ticket code you entered. Please check that you have entered the correct code.<BR><BR>NOTE: If you have activated Parental Controls, you may not be able to view all available software in the WiiMart. Please check your Parental Controls settings.";
	
	
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
<title>Catalog</title>
<style type="text/css">
  /* B_04:  Software Catalog */
#textIcrExpire {
    position:absolute;
    left:36px;
    top:88px;
    width:540px;
    height:200px;
    z-index:37;
}


#import-E {
	position:absolute;
	left:432px;
	top:9px;
	width:40px;
	height:31px;
	z-index:10;
}
#import-J {
	position:absolute;
	left:436px;
	top:6px;
	width:36px;
	height:36px;
	z-index:10;
}
#import-P {
	position:absolute;
	left:436px;
	top:6px;
	width:36px;
	height:36px;
	z-index:10;
}
.catalogFrame {
	position:absolute;
	border:solid 1px #35beed;
	left:36px;
	top:88px;
	width:540px;
	height:277px;
	z-index:44;
	overflow:auto;
}
#text01-01 {
	position:absolute;
	left:29px;
	top:28px;
	width:442px;
	height:36px;
	z-index:33;
	overflow:hidden;
}
#text01-02 {
	position:absolute;
	left:29px;
	top:28px;
	width:442px;
	height:36px;
	z-index:34;
	overflow:hidden;
}
#text02-01 {
	position:absolute;
	left:36px;
	top:88px;
	width:540px;
	height:277px;
	z-index:37
}
#page {
	position:absolute;
	left:428px;
	top:385px;
	width:92px;
	height:36px;
	z-index:20;
}

#arrowR {
	position:absolute;
	left:525px;
	top:385px;
	width:52px;
	height:52px;
	z-index:39;
}
#arrowRshadow {
	position:absolute;
	left:516px;
	top:377px;
	width:71px;
	height:72px;
	z-index:2;
}
#arrowL {
	position:absolute;
	left: 372px;
	top: 385px;
	width:52px;
	height:52px;
	z-index:38;
}
#arrowLshadow {
	position:absolute;
	left:362px;
	top:377px;
	width:71px;
	height:72px;
	z-index:1;
}
/* B_04:  Software Catalog */

body {
	width: 500px; height: 400px;
	background-repeat: no-repeat;
	background-color: #FFFFFF; 
}
#Laypanel04er23 {
	position:absolute;
	left:0px;
	top:277px;
	width:488px;
	height:91px;
	z-index:1;
}
#ImageforCatalogpage {
	position:absolute;
	left:18px;
	top:9px;
	width:96px;
	height:72px;
	z-index:9;
}
#dammyImage {
	position:absolute;
	left:18px;
	top:194px;
	width:96px;
	height:72px;
	z-index:4;
}
#TitleName1stline {	position:absolute;
	left:120px;
	top:8px;
	width:350px;
	z-index:10;
}
#Publisher {
	position:absolute;
	left:120px;
	top:46px;
	width:350px;
	height:18px;
	z-index:12;
}
#Platform {
	position:absolute;
	left:120px;
	top:64px;
	width:220px;
	height:14px;
	z-index:13;
}
#points {
	position:absolute;
	left:264px;
	top:64px;
	width:206px;
	height:18px;
	z-index:2;
}
#TitleName2stline {
	position:absolute;
	left:120px;
	top:26px;
	width:350px;
	z-index:11;
}
#NEW1 {
	position:absolute;
	left:18px;
	top:-20px;
	width:150px;
	height:23px;
	z-index:6;
}
#NEW2 {
	position:absolute;
	left:176px;
	top:-20px;
	width:150px;
	height:16px;
	z-index:5;
}
#NEWtext1 {
	position:absolute;
	left:21px;
	top:-18px;
	width:145px;
	height:16px;
	z-index:7;
}
#NEWtext2 {
	position:absolute;
	left:179px;
	top:-18px;
	width:145px;
	height:16px;
	z-index:7;
}
#spacer {
	position:absolute;
	left:0px;
	top:0px;
	width:488px;
	height:91px;
	z-index:14;
}

</style>
<script type="text/javascript">
function initPage()
{
	initPageCommon();
        MM_preloadImages('/oss/oss/common/images//banner/under_banner_b.gif','/oss/oss/common/images//banner/help_b.gif',
                         '/oss/oss/common/images//banner/top_b.gif','/oss/oss/common/images//banner/arrowL_page_b.gif',
                         '/oss/oss/common/images//banner/B_04_softbanner_b.gif',
                         '/oss/oss/common/images//banner/B_04_softbanner_a.gif',
                         '/oss/oss/common/images//banner/arrowR_page_b.gif');

    setUnderButtonL(true, "Back", "javascript:showBack()", "wiiCancelSound()");
  

	if (ecSupportsSession()) {
		// possibly set session variables in B_24, clear them in B_04 in case of Back button pressed.
		ec.setSessionValue("giftStatus", null);
		trace("clear giftStatus in B_04. ");
		ec.setSessionValue("redownloadFlag", null);
		trace("clear redownloadFlag in B_04. ");
		ec.setSessionValue("senderIndex", null);
		trace("clear senderIndex in B_04. ");
		ec.setSessionValue("transId", null);
		trace("clear transId in B_04. ");	
		ec.setSessionValue("transType", null);
		trace("clear transType in B_04. ");
	}
		
	<% if (noResults)  {%>
	var pageCount = '0';
	if (pageCount > 0)
		document.getElementById("catalogFrame").focus();
	<% } else {%>
	var pageCount = '<%= request.getParameter("p") %>';
	if (pageCount > 0)
		document.getElementById("catalogFrame").focus();
	<% } %>
    
}



function showIcrExpirePage()
{
    
    hideTopHelpElements();
    hideElement("catalogFrame");
    hideElement("underButtonL");
    hideElement("page");
    hideElement("arrowR");
    hideElement("arrowRshadow");
    hideElement("arrowL");
    hideElement("arrowLshadow");
    hideElement("text02-01");
    disableWiiPointButton();

    
    showElement("icrExpirePage");
    setUnderButton(true, "Try Again", "javascript:shop.retry();", "wiiSelectSound()");
}



var scroll_step = 30;
function kdown()
{


	var _code = event.keyCode;
	var _obj = document.getElementById('catalogFrame');
	if (_obj != null) {
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
      case 178:
				document.getElementById('arrowLImg').click();
				break;

			case 177:
				document.getElementById('arrowRImg').click();
				break;
		}
	}
}

function doPrePost() {
	var params = getPostParams();
	var currPath = location.pathname;
	var i = currPath.lastIndexOf("/");
        if (i >= 0) {
            page = currPath.substr(i+1);
        }
	var preParams = "";
	var paramArray = params.split("&");
	var j;

	var nowpreP = '0';
	if (nowpreP < 1) {
		nowpreP = '1';
	}

	var preP = 'p='+nowpreP;
	for (j in paramArray) {
	    var param = paramArray[j];
	    if (param.indexOf("p=") == 0) {
	        continue;
	    }
	    if (preParams != "") {
		preParams += "&";
	    }
		preParams += param;
	}
	if (preParams != "") {
	    preParams += "&";
  	}
  	preParams += preP;

	var secureUrl = getSecureUrl(page);
	trace("in B_04 doPrePost, secureUrl=" + secureUrl)
	trace("in B_04 doPrePost, preParams=" + preParams);
	doPost(secureUrl, preParams);
}
	
function doNextPost() {
	var params = getPostParams();
	var currPath = location.pathname;
	var i = currPath.lastIndexOf("/");
        if (i >= 0) {
            page = currPath.substr(i+1);
        }
	var nextParams = "";
	var paramArray = params.split("&");
	var j;

	var nownextP = '2';
	if (nownextP > 1) {
		nownextP = 1;
	}

	var nextP = 'p='+nownextP;
	for (j in paramArray) {
	    var param = paramArray[j];
	    if (param.indexOf("p=") == 0) {
	        continue;
	    }
	    if (nextParams != "") {
		nextParams += "&";
	    }
	    nextParams += param;
	}
	if (nextParams != "") {
	    nextParams += "&";
	}
	nextParams += nextP;
	
	var secureUrl = getSecureUrl(page);
	trace("in B_04 doNextPost, secureUrl=" + secureUrl)
	trace("in B_04 doNextPost, nextParams=" + nextParams);
	doPost(secureUrl, nextParams);
}
</script>
<script src="/oss/oss/common/js/json2.js"></script>
    <script src="/oss/oss/common/js/oss.js"></script>
    <script src="/oss/oss/common/js/shop.js"></script>
    
</head>

<body onkeypress="kdown();" onload="initPage();">

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


<div id="text01-01">
<div align="left" id="listinfo" class="titleBlackL">
<script language="JavaScript">
	<!--
	<%
		String t = "???platform.???";
		if (request.getParameter("order") != null || request.getParameter("rec") != null || request.getParameter("publisher") != null) {
			if (request.getParameter("order") != null && request.getParameter("order").equals("new")) {
				t = "Newest Additions";
			} else if (request.getParameter("rec") != null && request.getParameter("rec").equals("true")){
				t = "Recommended Titles";
			} else if (request.getParameter("publisher") != null) {
				t = request.getParameter("publisher").substring(0, 1).toUpperCase() + request.getParameter("publisher").substring(1);
			} else {
				t = "Catalog";
			}
		} else if (request.getParameter("title") != null) { 
			t = "Results for " + request.getParameter("title");
		} else {
			t = "Catalog";
		}
	%>
    document.write("<c:out value="${t}" escapeXml="true"/>");
	-->
</script>
        </div>
    </div>


<div style="position:absolute; left:0px; top:0px; width:1px; height:1px; z-index:6;">
    <img src="/oss/oss/common/images//spacer.gif" name="ktouch" width="1" height="1" border="0" id="ktouch"/>
</div>
<% if (!noResults) { %>
<div id="page">
  <div align="right" class="buttonTextBlackM">
    <div align="center">
      <%= request.getParameter("p") == null ? "1" : request.getParameter("p") %>/<%= totalPages %></div>
  </div>
</div>
<div id="catalogFrame" class="catalogFrame">
<script type="text/JavaScript">
<!--

function getSCAUserStatus(){
  var isSilverSCA = "";
  var isGoldSCA = "";
  if(ecSupportsSession()){
    isSilverSCA = ec.getSessionValue("silverStatus");
            isGoldSCA = ec.getSessionValue("goldStatus");
  }
  if(isGoldSCA == "ACTIVATED"){
      return "SCAGOLD";
  }else if(isSilverSCA == "ACTIVATED"){
      return "SCASILVER";
  }else{
      return "";
  }
}
function getSCAUserDiscountType(){
  var status = getSCAUserStatus();
  if(status == "SCAGOLD") {
      return ec.getSessionValue("goldDiscountType");
  }else if(status == "SCASILVER"){
      return ec.getSessionValue("silverDiscountType");
  }else{
      return "";
  }
}

//-->
</script>
<script type="text/JavaScript">
<!--


function getICRUserStatus() {
    var status ;

    if ( ecSupportsSession() ){
        status =  ec.getSessionValue("icrStatus");

        if ( status == "ACTIVATED" || status == "COMPLETE" || status == "DISABLED" ){
            return status ;
        }
    }

    return "DISABLED";
}

function getICRUserDiscountType(){
    var status;
    if ( ecSupportsSession()){
        status=getICRUserStatus();
        if(status == "ACTIVATED"){
            return ec.getSessionValue("icrDiscountType");
        }
    }
    return "";
}



function isICRExpired(){
    
        trace("titleDetails is empty");
        return true;
        
}
//-->
</script>
<script type="text/JavaScript">
<!--

var supportSCA = ("false" == "true");

function isScaGiftable(titleId) {
	if(!supportSCA) {
		return false;
	}
	if(titleId == null || titleId == "") {
		return false;
	}
	if(getSCAUserStatus() == "") {
		return false;
	}

	var scaGiftableTitlesString = ec.getSessionValue("scaGiftableList"); 
	trace("giftTitle " + titleId); 
	trace("scaGiftableList: " + scaGiftableTitlesString); 

	if(scaGiftableTitlesString == null) {
		return false;
	}
	
	var scaGiftableTitleArray = scaGiftableTitlesString.split(","); 
	var size = scaGiftableTitleArray.length; 
	for(i=0; i<size; i++) { 
		if(scaGiftableTitleArray[i] == titleId) { 
			return true;
		} 
	} 

	return false;
}

function getScaDiscount() {
	if(!supportSCA) {
		return "0";
	}
	var discountList = new Array(); 
	discountList['SCA10']  = ec.getSessionValue("sca10DiscountAmount");
	discountList['SCA20']  = ec.getSessionValue("sca20DiscountAmount");
	discountList['SCA20B'] = ec.getSessionValue("sca20BDiscountAmount");

	var discount = discountList[getSCAUserDiscountType()]; 
	trace("SCA discount: " + discount); 
	if((typeof(discount) != 'undefined') && (discount != "") && (discount != null)) {
		return discount;
	} else {
		return "0";
	}
}

function getScaPurchaseInfo(){
	if(!supportSCA) {
		return "";
	}

	var purchaseInfoList = new Array(); 
	purchaseInfoList['SCA10']  = ec.getSessionValue("sca10DiscountXml");
	purchaseInfoList['SCA20']  = ec.getSessionValue("sca20DiscountXml");
	purchaseInfoList['SCA20B'] = ec.getSessionValue("sca20BDiscountXml");
   
	var purchaseInfo = purchaseInfoList[getSCAUserDiscountType()]; 
	trace("SCA purchaseInfo: " + purchaseInfo);	
	if((typeof(purchaseInfo) != 'undefined') && (purchaseInfo != null)) {
		return purchaseInfo;
	} else {
		return "";
	}
}

function getScaGiftDiscount(titleId) {
	if(isScaGiftable(titleId)) {
        return getScaDiscount();
	 } else {
		return "0";
	}	
}

function getScaGiftPurchaseInfo(titleId) {
	if(isScaGiftable(titleId)) {
        return getScaPurchaseInfo();
	} else {
		return "";
	}
}

function removeScaGiftableTitle(titleId) {
	var scaGiftableTitlesString = ec.getSessionValue("scaGiftableList"); 
	trace("scaGiftableList(old): " + scaGiftableTitlesString); 
    if(scaGiftableTitlesString != null){
	    scaGiftableTitlesString = scaGiftableTitlesString.replace(titleId, "").replace(",,", ",");
    }
	trace("scaGiftableList(new): " + scaGiftableTitlesString); 
	ec.setSessionValue("scaGiftableList", scaGiftableTitlesString);
}

function getIcrDiscount() {
    if(getICRUserDiscountType() == "ICR1"){
        return ec.getSessionValue("icrDiscountAmount");
    }else{
        return "0";
    }
}

function getIcrPurchaseInfo() {
    if(getICRUserDiscountType() == "ICR1"){
        return ec.getSessionValue("icrDiscountXml");
    }else{
        return "";
    }
}
//-->
</script>
<script type="text/javascript">

	var giftTransTitles = null;
	if (ecSupportsSession()) {
	        giftTransTitles = ec.getSessionValue("giftTransTitles");
	}
	var giftsArray = new Array();
	if (giftTransTitles != null) {
		var gifts = giftTransTitles.split(", ");
		for(i = 0; i < gifts.length; i++){
			if (gifts[i] != "") {
				var pair = gifts[i].split(":");
				giftsArray[pair[0]] = pair[1];
				trace("stored gift titleId: "+pair[0]+", transId: "+pair[1]);
			}
		}
	}
//-->
</script>
<%

JSONArray g = null;
// Parse JSON response
try {
    g = new JSONArray(games);
} catch (Exception e) {
    g = new JSONArray("[{ id: '', title1: '', title2: '', console: '', controllers: '', region: '', language: '', attributes: '', date: '', added: '', publisher: '', genre: '', points: '', players: '', rating: '', ratingdetails: '', thumbnail: '', size: '', titleVersion: -1, page: -1 }]");
}

%>
<script>console.log(`<%= games %>`)</script>
<% for (int i = 0; i < g.length(); i++) {

JSONObject game = g.getJSONObject(i);

// Break if we didn't get a successful catalog response
if (game.getString("id") == null) {
	noResults = true;
    break;
}
String platform = game.getString("console");
if (platform.equals("WII")) {
    platform = "Wii Channels";
} else if (platform.equals("WIIWARE")) {
    platform = "WiiWare";
}

String publisher = game.getString("publisher");
String title1 = game.getString("title1");
String title2 = game.getString("title2");
String titleId = game.getString("id");
String thumbnail = game.getString("thumbnail");
String points = game.getString("points");
// Add Virtual Console platforms for display
String vcPlatforms = "Nintendo 64, NES, Super NES, Super Nintendo, Master System, Sega Genesis, NEOGEO, Virtual Console Arcade, TurboGrafx16, Commodore 64";
boolean isVcTitle = vcPlatforms.toLowerCase().contains(platform.toLowerCase());

// Skip non-VC titles if vc=true is specified
if (vcParam.contains("true") && !isVcTitle) {
    continue;
}
%>
<div id="panel0<%= i+1 %>" style="position:absolute; left:0px; top:<%= 24 + (i * 112) %>px; width:488px; height:91px; z-index:1">
<div class="contentsBlack" id="Platform">
    <%= platform %>
</div>
<div class="contentsBlack" id="Publisher">
    <%= publisher %>
</div>
<%
if (!title2.equals("")) { %>
<div style="overflow:hidden" nowrap id="TitleName2stline">
    <span id="title2_1" class="catalogTitleBlack_01"><%= title2 %></span>
</div>
<% } %>
<div style="overflow:hidden" nowrap id="TitleName1stline">
    <span id="title1_1" class="catalogTitleBlack_01"><%= title1 %></span>
</div>

<div id="ImageforCatalogpage">
    <img src="/oss/ccs/<%= titleId %>/<%= thumbnail %>" width="96" height="72" />
</div>

<div id="regularTitle<%= i+1 %>">
    <div id="spacer">
        <a href="javascript:showPage('B_05.jsp?titleId=<%= titleId %>')" target="_top" name="goTitleDetailsLink2">
            <img name="ImageB<%= i+1 %>" src="/oss/oss/common/images//spacer.gif" width="488" height="91" border="0"
                 onmouseover="MM_swapImage('Image<%= i+1 %>','','/oss/oss/common/images//banner/B_04_softbanner_b.gif',1);wiiFocusSound();"
                 onmouseout="MM_swapImgRestore()" onclick="wiiSelectSound();"/>
        </a>
    </div>

    <div id="points">
        <div align="right" name="purchasePoint2" class="catalogTitleBlackBold">
            <%= points %> Wii Points
        </div>
    </div>
</div>
<img id="ImageA<%= i+1 %>" src="/oss/oss/common/images//banner/B_04_softbanner_a.gif" name="Image<%= i+1 %>" width="488" height="91" border="0"/>
</div>
<script type="text/javascript">
		var giftTrans = '';
		var titleId = '<%= titleId %>';
		var transId = giftsArray[titleId];
		
		if ((giftTrans != null) && (giftTrans != "")) {
			// list gifts only
			document.getElementById("giftTitle<%= i+1 %>").style.display = '';
		} else if (transId != null) {
			// has pending gift(s). B-24 should be displayed instead of B-05 for the pending gift titles
			document.getElementById("giftAnchor<%= i+1 %>").href = 'javascript:showGiftTrans('+transId+')';
			document.getElementById("storedGiftTitle<%= i+1 %>").style.display = '';
		} else {
			// no pending gift
			document.getElementById("regularTitle1").style.display = '';
			var titleInfoVar = ec.getTitleInfo ('<%= titleId %>');
			var latestVersion = parseInt('1');
			if (isTitleUpdateAvailable(titleInfoVar, latestVersion)) {
				document.getElementById('UPDATE1').style.display = ''; 
			}
			var titleLicense = getTitleLicense('<%= titleId %>');
			//trace("SCATitleStatus"+getSCATitleStatus());
			if (titleLicense == "Unlimited") {
				// Already own this title
				var len=document.getElementsByName('ImageB<%= i+1 %>').length;
				if (len >0) {
					for(j=0;j<len;j++) {
						document.getElementsByName('ImageB<%= i+1 %>')[j].onmouseover = 'MM_swapImage("'+ 'Image<%= i+1 %>' + '","","' + '/oss/oss/common/images//banner/B_04_softbanner_b.gif",1); wiiFocusSound();'; 
					}
				}
		
				len=document.getElementsByName('ImageA<%= i+1 %>').length;
				if (len >0) {
					for(j=0;j<len;j++) {
					document.getElementsByName('ImageA<%= i+1 %>')[j].src = '/oss/oss/common/images//banner/B_04_softbanner_a.gif'; 
					}
				}
		
				/*len=document.getElementsByName('purchasePoint<%= i+1 %>').length;
				if (!titleInfoVar.isOnDevice || isTitleUpdateAvailable(titleInfoVar, latestVersion)) {
					if (len >0) {
						for(j=0;j<len;j++) {
							document.getElementsByName('purchasePoint<%= i+1 %>')[j].innerHTML = 'Downloadable'; 
						}
					}
				} else {
					if (len >0) {
						for(j=0;j<len;j++) {
							document.getElementsByName('purchasePoint<%= i+1 %>')[j].innerHTML = 'Downloaded'; 
						}
					}
				}
	
	
				
				if ( "SCAGOLD" == getSCAUserStatus() || "SCASILVER" == getSCAUserStatus() ){ 
					if ( isScaGiftable(titleId) ) {
						len=document.getElementsByName('purchasePoint<%= i+1 %>').length;
						for(j=0;j<len;j++) {
							document.getElementsByName('purchasePoint<%= i+1 %>')[j].innerHTML = 'SCA Free Gift'; 
						}
					}
				}*/
	
				
	
	
			}else{
				
						var icr_title_status        = '' ;
						var sca_title_gold_status   = '' ; 
						var sca_title_silver_status = '' ;
	
						if ( "ACTIVATED" == getICRUserStatus() && "ICR" == icr_title_status ) {
							len=document.getElementsByName('purchasePoint1').length;
							for(j=0;j<len;j++) {
								document.getElementsByName('purchasePoint1')[j].innerHTML = 'One Free Title';
							}
						} else if ( "SCAGOLD" == getSCAUserStatus() && "SCAGOLD" == sca_title_gold_status )
						{
							len=document.getElementsByName('purchasePoint1').length;
							for(j=0;j<len;j++) {
								document.getElementsByName('purchasePoint1')[j].innerHTML = 'Connection Ambassador 20'; 
							}
						} else if ( "SCASILVER" == getSCAUserStatus() && "SCASILVER" == sca_title_silver_status )
						{
							len=document.getElementsByName('purchasePoint1').length;
							for(j=0;j<len;j++) {
								document.getElementsByName('purchasePoint1')[j].innerHTML = 'Connection Ambassador 10'; 
							}
						} 
	
						
			}
		}
	//-->
	</script>
<% } 
} else { %>
<div id="text02-01">
    <div align="center" class="contentsBlackM">
        <table height="100%">
        	<tbody>
				<tr>
          			<td align="left" valign="middle">
            Your search did not return any results.<br><br>NOTE: If you have activated Parental Controls, you may not be able to view all available software in the Wii Shop Channel. Please check your Parental Controls settings.</td>
        		</tr>
        	</tbody>
		</table>
    </div>
</div>
<% } %>

    </div>
    <%
	if (!noResults)  { 
	String pv = request.getParameter("p") == null ? "1" : request.getParameter("p");
    // Get the original query string from the request
    String query = request.getQueryString() == null ? "" : request.getQueryString(); // Example: "language=en&region=USA&country=US&p=1&publisher=BANDAI%20NAMCO%20ENTERTAINMENT&vc=true"
	String newQuery = "";
	if (!query.equals("")) {

        // Parameters to remove
        String[] removeKeys = {"language", "region", "country", "p"};

        // Parse the query string into a map
        Map<String, String> paramMap = new LinkedHashMap<>();
        for (String param : query.split("&")) {
            String[] pair = param.split("=", 2);
            if (pair.length == 2) {
                paramMap.put(URLDecoder.decode(pair[0], "UTF-8"), URLDecoder.decode(pair[1], "UTF-8"));
            }
        }

        // Remove unwanted parameters
        for (String key : removeKeys) {
            paramMap.remove(key);
        }

        // Rebuild query string
        newQuery = paramMap.entrySet().stream()
                .map(entry -> {
                    try {
                        return URLEncoder.encode(entry.getKey(), "UTF-8") + "=" + URLEncoder.encode(entry.getValue(), "UTF-8");
                    } catch (Exception e) {
                        return "";
                    }
                })
                .collect(Collectors.joining("&"));
		}
	%>
<% if (!pv.equals("1")) { %>
<div id="arrowL">
    <a href="javascript:replacePage('B_04.jsp?p=<%= Math.max(1, Integer.parseInt(pv) - 1)%>&<%= newQuery %>')" 
       onmouseout="MM_swapImgRestore()" 
       onmouseover="MM_swapImage('arrowLImg','','/oss/oss/common/images//banner/arrowL_page_b.gif',1);wiiFocusSound();"
       onclick="wiiSelectSound();">
        <input type=image src="/oss/oss/common/images//banner/arrowL_page_a.gif" name="ImageArrowL" width="52" height="52" border="0" id="arrowLImg" />
    </a>
</div>
<div id="arrowLshadow"><img src="/oss/oss/common/images//banner/top_help_shadow02.gif" width="71" height="72" /></div>
<% } %>
<% if (pv != null && !pv.isEmpty() && totalPages != null && !totalPages.isEmpty()) { 
	if (!pv.equals(totalPages)) {%>
<div id="arrowR">
    <a href="javascript:replacePage('B_04.jsp?p=<%= Integer.parseInt(pv) + 1 %>&<%= newQuery %>')" 
       onmouseout="MM_swapImgRestore()" 
       onmouseover="MM_swapImage('arrowRImg','','/oss/oss/common/images//banner/arrowR_page_b.gif',1);wiiFocusSound();"
       onclick="wiiSelectSound();">
        <input type=image src="/oss/oss/common/images//banner/arrowR_page_a.gif" name="ImageArrowR" width="52" height="52" border="0" id="arrowRImg" />
    </a>
</div>
<div id="arrowRshadow"><img src="/oss/oss/common/images//banner/top_help_shadow02.gif" width="71" height="72" /></div>
<% } %>
<% } %>
<% } %>
  <div id="icrExpirePage" style="display:none">
  <div id="textIcrExpire">
      <div align="center" class="contentsBlackM">
          <table height="100%">
              <tr>
                  <td align="left" valign="middle">
                      This offer has expired.<BR>You may no longer download a title for free.</td>
              </tr>
          </table>
      </div>
  </div>

</div>


</body>
</html>
