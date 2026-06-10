<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import = "java.io.*,java.util.*,java.sql.*,java.net.http.*,java.net.URI,java.net.http.HttpResponse.BodyHandlers,java.net.HttpURLConnection,java.net.URL,java.nio.charset.StandardCharsets,org.json.*" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ page buffer="8192kb" autoFlush="true" %>
<%
    String og = request.getParameter("og") == null ? "false" : request.getParameter("og");

    String fromparam = request.getParameter("from") == null ? "" : request.getParameter("from");
    String titleId = request.getParameter("titleId") == null ? "" : request.getParameter("titleId");

    String cmnToken = request.getParameter("token") == null ? "" : request.getParameter("token");
    String cmnAccountId = request.getParameter("accountId") == null ? "" : request.getParameter("accountId");
    String cmnDeviceId = request.getParameter("deviceId") == null ? "" : request.getParameter("deviceId");
    String cmnSerialNo = request.getParameter("serialNo") == null ? "" : request.getParameter("serialNo");

    // verify
    boolean ValidParameters = true;

    if (cmnAccountId == null || cmnAccountId.equals("") || cmnAccountId.length() != 8) ValidParameters = false;
    if (cmnDeviceId == null || cmnDeviceId.equals("") || cmnDeviceId.length() != 10) ValidParameters = false;
    if (cmnToken == null || cmnToken.equals("") || cmnToken.length() != 32) ValidParameters = false;
    if (cmnSerialNo == null || cmnSerialNo.equals("") || cmnSerialNo.length() != 13) ValidParameters = false;

    if (titleId == null || titleId.equals("") || titleId.length() != 16) ValidParameters = false;
    if (fromparam == null || fromparam.equals("")) ValidParameters = false;
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<% if ((request.getParameter("og") == null ? "false" : request.getParameter("og")).equals("false")) {%><a href="https://oss-auth.a.taur.cloud/oss/serv/debug.jsp">debug</a><% } %>
<!-- Flush buffer before setting locale to ensure encoding is preserved -->
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
	

	ecsUrl = 'https://oss-auth.a.taur.cloud.io/oss/ecs/services/ECommerceSOAP';

	iasUrl = 'https://oss-auth.a.taur.cloud/oss/ias/services/IdentityAuthenticationSOAP';

	ccsUrl = 'http://ccs.cdn.a.taur.cloud/ccs/download';

	ucsUrl = 'https://ccs.a.taur.cloud/ccs/download';
	

	ec.setWebSvcUrls(ecsUrl, iasUrl);
	ec.setContentUrls (ccsUrl, ucsUrl);
	
	

	imagesPath = "/oss/oss/common/images/";
	htmlPath = "/oss/oss/common/html";
	ossPath = "https://oss-auth.a.taur.cloud/oss/serv/";
	secureOssPath = "https://oss-auth.a.taur.cloud/oss/serv/";	

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
	a[-(EC_ERROR_NET_NA)] = "There was a network error. Please check your Internet settings and your network configuration.";
	a[-(EC_ERROR_ECARD)] = "The activation number you entered is incorrect.<BR><BR>Please try again.";
	a[-(EC_ERROR_REGISTER)] = "The Wii Number you entered is incorrect.";
	a[-(EC_ERROR_ALREADY_OWN)] = "An error has occurred that cannot be resolved at this time.<BR><BR>Please try again later. If this continues, please contact your local customer support centre. For contact details, visit support.nintendo.com.";
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
    		    msg = "There was a network error. Please check your Internet settings and your network configuration.";
    		} else if (nhttpStatus != 0) {
    		    msg = "An error has occurred that cannot be resolved at this time.<BR><BR>Please try again later. If this continues, please contact your local customer support centre. For contact details, visit support.nintendo.com.";
    		}
    	}
    }
        
    if (msg == null || msg == '') {
    	msg = "An error has occurred that cannot be resolved at this time.<BR><BR>Please try again later. If this continues, please contact your local customer support centre. For contact details, visit support.nintendo.com.";
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
	a[617] = "The activation number you entered is incorrect.<BR><BR>Please try again.";
	a[618] = "This Nintendo eShop Card cannot be used in your region.";
	a[621] = "An error has occurred that cannot be resolved at this time.<BR><BR>Please try again later. If this continues, please contact your local customer support centre. For contact details, visit support.nintendo.com.";
	a[623]	= "You have downloaded this title before, and your trial period has expired. You cannot re-download it.";
	a[642] = "An error has occurred that cannot be resolved at this time.<BR><BR>Please try again later. If this continues, please contact your local customer support centre. For contact details, visit support.nintendo.com.";
	a[643] = "An error has occurred that cannot be resolved at this time.<BR><BR>Please try again later. If this continues, please contact your local customer support centre. For contact details, visit support.nintendo.com.";
	a[644] = "Credit cards cannot be used with this console.<BR>Please contact your local customer support centre.<BR>For contact details, visit support.nintendo.com.";
	a[645] = "An error has occurred that cannot be resolved at this time.<BR><BR>Please try again later. If this continues, please contact your local customer support centre. For contact details, visit support.nintendo.com.";
	
	// ECS Gift Errors
	a[646] = "An error has occurred that cannot be resolved at this time. Please try again later.<BR><BR>If this continues, please contact your local customer support centre. For contact details, visit support.nintendo.com.";
	a[621] = "An error has occurred that cannot be resolved at this time.<BR><BR>Please try again later. If this continues, please contact your local customer support centre. For contact details, visit support.nintendo.com.";
	a[626] = "An error has occurred that cannot be resolved at this time.<BR><BR>Please try again later. If this continues, please contact your local customer support centre. For contact details, visit support.nintendo.com.";
	a[625] = "An error has occurred that cannot be resolved at this time.<BR><BR>Please try again later. If this continues, please contact your local customer support centre. For contact details, visit support.nintendo.com.";
	
	// ETS Errors
	a[705] = "An error has occurred that cannot be resolved at this time.<BR><BR>Please try again later. If this continues, please contact your local customer support centre. For contact details, visit support.nintendo.com.";
	a[706] = "An error has occurred that cannot be resolved at this time.<BR><BR>Please try again later. If this continues, please contact your local customer support centre. For contact details, visit support.nintendo.com.";
	a[707] = "An error has occurred that cannot be resolved at this time.<BR><BR>Please try again later. If this continues, please contact your local customer support centre. For contact details, visit support.nintendo.com.";
	
	// PAS Errors
	a[810]	= "An error occurred when processing Wii Points. Please try again.<BR><BR>If this continues, please contact your local customer support centre. For contact details, visit support.nintendo.com.";
	a[811]	= "The activation number you entered has expired.";
	//a[812]	= "???OSS_ERROR_ECARD_NOT_USABLE???";
	//a[813]	= "???OSS_ERROR_ECARD_NOT_USABLE???";
	//a[814]	= "???OSS_ERROR_ECARD_NOT_USABLE???";
	a[815]	= "This Nintendo eShop Card has already been redeemed.";
	a[819]	= "The activation number you entered is incorrect.<BR><BR>Please try again.";
	
	a[826]	= "The server is busy.<BR><BR>Please try again later.";
	a[829]	= "The server is busy.<BR><BR>Please try again later.";
	a[830]	= "The activation number you entered is incorrect.<BR><BR>Please try again.";
	a[831] = "This Nintendo eShop Card cannot be used in your region.";

	// IAS Errors 
	a[901]	= "The Wii Number you entered is incorrect.";
	a[903]	= "An error has occurred that cannot be resolved at this time.<BR><BR>Please try again later. If this continues, please contact your local customer support centre. For contact details, visit support.nintendo.com.";
	a[928] = "An error has occurred that cannot be resolved at this time.<BR><BR>Please try again later. If this continues, please contact your local customer support centre. For contact details, visit support.nintendo.com.";
	a[958]	= "An error has occurred that cannot be resolved at this time.<BR><BR>Please try again later. If this continues, please contact your local customer support centre. For contact details, visit support.nintendo.com.";
	a[942] = "Unable to confirm the e-mail address at this time because of a server error.<BR><BR>Please try again later.";
	a[943]	= "An error occurred while linking the e-mail address. Please check the e-mail address and password and try again. <BR><BR>If you have forgotten your e-mail address or password, please visit www.club-nintendo.com.";

	a[941] = "An error occurred while linking the e-mail address. Please check the e-mail address and password and try again. <BR><BR>If you have forgotten your e-mail address or password, please visit www.club-nintendo.com.";
	
	// More IAS Errors
	a[1401] = "An error occurred while linking the e-mail address. Please check the e-mail address and password and try again. <BR><BR>If you have forgotten your e-mail address or password, please visit www.club-nintendo.com.";
	a[1402] = "Due to restrictions on your Club Nintendo membership, it cannot be linked to this Wii Shop Channel Account.";
        a[1403] = "Due to restrictions on your My Nintendo membership, it cannot be linked to this Wii Shop Channel Account.<BR><BR>Visit support.nintendo.com for assistance.";
	a[1499] = "Unable to confirm the User Name at this time. The server is currently undergoing maintenance.<BR><BR>Sorry for the inconvenience. Please try again later.";
	
	// OSS Errors
	a[1610]	= "The Wii Download Ticket you entered has expired.";
	a[1611]	= "The Wii Download Ticket code you entered is incorrect.<BR><BR>Please verify the code and try again.";
	a[1612] = "The Wii Download Ticket you entered cannot be used in your region.<BR><BR>Please verify the code and try again.";
	a[1613] = "There is no software available at this time for the Wii Download Ticket code you entered. Please check you have entered the correct code.<BR><BR>NOTE: If you have activated Parental Controls, you may not be able to view all available software in the Wii Shop Channel. Please check your Parental Controls settings.";
	
	
	var msg = a[errCode];
	if(msg == null || msg == "") { // default errors
		if ((errCode >= 1400 && 
		     errCode <= 1499)) {
			msg = "Unable to confirm the e-mail address at this time because of a server error.<BR><BR>Please try again later.";
		}
	}
	return msg;
}

// NOA errors
function getNOAError(code)
{
	var a=new Array();
	
	a[NOA_ERROR_CountyRequired] 				= "(N/A)";
	a[NOA_ERROR_FoundOnBlacklist]				= "This credit card cannot be used.<BR>Please contact your local customer support centre. For contact details, visit support.nintendo.com.";
	a[NOA_ERROR_BillingAddress]                             = "The address you&rsquo;ve entered is incorrect.<BR><BR>Please verify the information and try again.";
	a[NOA_ERROR_InvalidCardType]                            = "This credit card number is invalid.<BR><BR>Please verify the information and try again.";
	a[NOA_ERROR_InvalidVfyValue]                            = "The credit card information you&rsquo;ve entered is incorrect.<BR><BR>Please verify the information and try again.";
	a[NOA_ERROR_InvalidCcNumberAndExpDate]                  = "The credit card information you&rsquo;ve entered is incorrect.<BR><BR>Please verify the information and try again.";
	a[NOA_ERROR_InvalidCreditCardNumber]			= "This credit card number is invalid.<BR><BR>Please verify the information and try again.";
	a[NOA_ERROR_InvalidExpDate]				= "The credit card information you&rsquo;ve entered is incorrect.<BR><BR>Please verify the information and try again.";
	a[NOA_ERROR_InvalidPostalCode]                          = "The postcode does not match the country settings entered in your Wii Settings.<BR><BR>Please verify the information and try again.";
	a[NOA_ERROR_TechnicalDifficulties]			= "Unable to confirm credit card information at this time.<BR><BR>Please try again later.";
	a[NOA_ERROR_TryAgainLater]				= "Unable to confirm credit card information at this time.<BR><BR>Please try again later.";

	a[NOA_RESULT_ERROR_CreditCardDeclined]			= "This credit card can&rsquo;t be used.<BR><BR>Please contact your credit card company for more information.";
	a[NOA_RESULT_ERROR_CreditCardDeclined_Funds]		= "This credit card can&rsquo;t be used.<BR><BR>Please contact your credit card company for more information.";
	a[NOA_RESULT_ERROR_CreditCardDeclined_Inactive]		= "This credit card can&rsquo;t be used.<BR><BR>Please contact your credit card company for more information.";
	a[NOA_RESULT_ERROR_CreditCardDeclined_Exp]		= "The credit card expiration date is invalid.";
	a[NOA_RESULT_ERROR_CreditCardDeclined_Code]		= "The credit card information you&rsquo;ve entered is incorrect.<BR><BR>Please verify the information and try again.";
	a[NOA_RESULT_ERROR_CreditCardDeclined_CCNum]		= "This credit card number is invalid.<BR><BR>Please verify the information and try again.";
	a[NOA_RESULT_ERROR_CreditCardDeclined_Limit]            = "This credit card can&rsquo;t be used.<BR><BR>Please contact your credit card company for more information.";
	a[NOA_RESULT_ERROR_CreditCardDeclined_Invalid]		= "The credit card information you&rsquo;ve entered is incorrect.<BR><BR>Please verify the information and try again.";
	a[NOA_RESULT_ERROR_CreditCardDeclined_AVS]		= "(N/A)";

	a[NOA_ERROR_EmptyVfyValue]				= "Please enter the 3 digit security code.";

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
<title>Sending Message</title>
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
/* B_24:  Gift Software Accept/Reject and DL just like B_05 design */


#Genre_IMPORT_B_05_E {
	position:absolute;
	left:464px;
	top:170px;
	width:40px;
	height:38px;
	z-index:10;
}
#Genre_IMPORT_B_05_J {
	position:absolute;
	left:468px;
	top:171px;
	width:36px;
	height:36px;
	z-index:10;
}
#Genre_IMPORT_B_05_P {
	position:absolute;
	left:468px;
	top:171px;
	width:36px;
	height:36px;
	z-index:10;
}
#Genre_IMPORT_B_05_K {
	position:absolute;
	left:468px;
	top:171px;
	width:36px;
	height:36px;
	z-index:10;
}
#Genre_WIFIFREE_B_05_E {
	position:absolute;
	left:482px;
	top:166px;
	width:47px;
	height:47px;
	z-index:10;
}
#Genre_WIFIFREE_B_05_J {
	position:absolute;
	left:482px;
	top:166px;
	width:47px;
	height:47px;
	z-index:10;
}
#Genre_WIFIFREE_B_05_P {
	position:absolute;
	left:482px;
	top:166px;
	width:47px;
	height:47px;
	z-index:10;
}
#Genre_WIFIFREE_B_05_K {
	position:absolute;
	left:482px;
	top:166px;
	width:47px;
	height:47px;
	z-index:10;
}
#Genre_WIFIPAY_B_05_E {
	position:absolute;
	left:482px;
	top:166px;
	width:38px;
	height:47px;
	z-index:10;
}
#Genre_WIFIPAY_B_05_J {
	position:absolute;
	left:482px;
	top:166px;
	width:38px;
	height:47px;
	z-index:10;
}
#Genre_WIFIPAY_B_05_P {
	position:absolute;
	left:482px;
	top:166px;
	width:38px;
	height:47px;
	z-index:10;
}
#Genre_WIFIPAY_B_05_K {
	position:absolute;
	left:482px;
	top:166px;
	width:38px;
	height:47px;
	z-index:10;
}


#text01-01P {
	position:absolute;
	left:29px;
	top:28px;
	width:550px;
	height:36px;
	z-index:36;
	overflow:hidden;
}
#details {
	position:absolute;
	left:36px;
	top:73px;
	width:537px;
	height:217px;
	z-index:9;
}
#text03-02 {
	position:absolute;
	left:160px;
	top:317px;
	width:282px;
	height:16px;
	z-index:33;
}
#shortagememory {
	position:absolute;
	left:34px;
	top:300px;
	width:540px;
	height:65px;
	z-index:28;
}
#shortagechannel {
	position:absolute;
	left:34px;
	top:88px;
	width:540px;
	height:180px;
	z-index:28;
}
#shortageinodes {
	position:absolute;
	left:34px;
	top:300px;
	width:540px;
	height:65px;
	z-index:28;
}

#shortagememory2 {
	position:absolute;
	left:36px;
	top:300px;
	width:537px;
	height:65px;
	z-index:28;
}
#shortagechannel2 {
	position:absolute;
	left:36px;
	top:300px;
	width:537px;
	height:65px;
	z-index:28;
}
#shortageinodes2 {
	position:absolute;
	left:36px;
	top:300px;
	width:537px;
	height:65px;
	z-index:28;
}


#date {
	position:absolute;
	left:171px;
	top:98px;
	width:210px;
	height:17px;
	z-index:13;
}
#Publisher {
	position:absolute;
	left:171px;
	top:119px;
	width:357px;
	height:13px;
	z-index:11;
}
#DisplayCategory {
	position:absolute;
	left:171px;
	top:140px;
	width:357px;
	z-index:10;
}
#Players {
	position:absolute;
	left:389px;
	top:98px;
	width:139px;
	height:13px;
	z-index:12;
}
#TitleName1 {
	position:absolute;
	left:11px;
	top:169px;
	width:515px;
	z-index:8;
}
#TitleName2 {
	position:absolute;
	left:11px;
	top:189px;
	width:515px;
	z-index:7;
}
#Platform {
	position:absolute;
	left:3px;
	top:2px;
	width:218px;
	height:13px;
	z-index:18;
}
#controller {
	position:absolute;
	left:171px;
	top:28px;
	width:77px;
	height:65px;
	z-index:17;
}
#controllerLink {
	position:absolute;
	left:171px;
	top:28px;
	width:77px;
	height:65px;
	z-index:18;
}
#UskInfo {
    position:absolute;
    left:73px;
    top:40px;
    width:204px;
    height:24px;
    z-index:15;
}
.ImgAgeRating {
    position:absolute;
    top:0px;
    left:0px;
}
.AgeInfoTxt {
    position:absolute;
    display:table;
    top:0px;
    left:0px;
    width:100%;
    height:100%;
}
.AgeInfoLink {
    position:absolute;
    top:0px;
    left:0px;
}
#PEGI_Rating {
	position:absolute;
	left:-1px;
	top:2px;
	width:282px;
	height:30px;
	z-index:15;
}
#GRB_Rating {
	position:absolute;
	left:1px;
	top:13px;
	width:282px;
	height:38px;
	z-index:15;
}
#Rating {
	position:absolute;
	left:250px;
	top:28px;
	width:46px;
	height:65px;
	z-index:15;
}
#BBFC_Img {
	position:absolute;
	left:0px;
	top:12px;
	height:50px;
	z-index:15;
}
#Descriptors {
	position:absolute;
	left:50px;
	top:0px;
	width:230px;
	height:65px;
	z-index:14;
	overflow:hidden;
}
#DescriptorsImage {
	position:absolute;
	left:56px;
	top:0px;
	width:230px;
	height:65px;
	z-index:14;
	overflow:hidden;
}
#DescriptorsImageLower {
	position:absolute;
	left:56px;
	top:34px;
	width:230px;
	height:65px;
	z-index:14;
	overflow:hidden;
}
#OFLC_Rating {
	position:absolute;
	left:-2px;
	top:0px;
	width:65px;
	height:65px;
	z-index:15;		
}
#OFLC_Descriptors {
	position:absolute;
	left:65px;
	top:0px;
	width:214px;
	height:65px;
	z-index:14;
	overflow:hidden;
}
#OFLC_NZ_Rating {
	position:absolute;
	left:-2px;
	top:0px;
	width:133px;
	height:63px;
	z-index:15;
}
#OFLC_NZ_Descriptors {
	position:absolute;
	left:133px;
	top:-2px;
	width:151px;
	height:66px;
	z-index:14;
	overflow:hidden;
}

#selectionMessage {
    position:absolute;
    left:46px;
    top:71px;
    width:517px;
    height:98px;
}
#nandDLButton {
    position:absolute;
    left:46px;
    top:169px;
    width:236px;
    height:184px;
}
#banner01 {
    position:absolute;
    left:0px;
    top:0px;
    width:100%;
    height:100%;
    z-index:28;
}
#text01 {
    position:absolute;
    left:8px;
    top:116px;
    width:220px;
    height:54px;
    z-index:29;
}
#spacer01 {
    position:absolute;
    left:0px;
    top:0px;
    width:100%;
    height:100%;
    z-index:30;
}


#sdDLButton {
    position:absolute;
    left:326px;
    top:169px;
    width:236px;
    height:184px;
}
#banner02 {
    position:absolute;
    left:0px;
    top:0px;
    width:100%;
    height:100%;
    z-index:28;
}
#text02 {
    position:absolute;
    left:8px;
    top:116px;
    width:220px;
    height:54px;
    z-index:29;
}
#spacer02 {
    position:absolute;
    left:0px;
    top:0px;
    width:100%;
    height:100%;
    z-index:30;
}
#sdDisable {
	position:absolute;
	left:0px;
	top:0px;
	width:100%;
	height:100%;
	z-index:40;
}
.style8 {
    font-size: 12px; 
    color: #323232; 
    font-family: "Wii NTLG PGothic JPN Regular"; 
    line-height: 16px
}
#Photo {
	position:absolute;
	left:8px;
	top:31px;
	width:160px;
	height:120px;
	z-index:19;
}
#buyshadow {
	position:absolute;
	left:167px;
	top:286px;
	width:274px;
	height:90px;
	z-index:1;
}
#PegiInfo {
    position:absolute;
    left:13px;
    top:40px;
    width:256px;
    height:24px;
    z-index:15;
}
.ImgAgeRating {
    position:absolute;
    top:0px;
    left:0px;
}
.AgeInfoTxt {
    position:absolute;
    display:table;
    top:0px;
    left:0px;
    width:100%;
    height:100%;
}
.AgeInfoLink {
    position:absolute;
    top:0px;
    left:0px;
}
body {
	background-repeat: no-repeat;
}
</style>
<script type="text/JavaScript">
<!--
var nwc24 = new wiiNwc24 ;
var friendIndex = parseInt( 'Nintendo' ) ;
var friendName = nwc24.getFriendInfo(friendIndex, "name");
friendName = encodeHTML(friendName);
var friendCode = nwc24.getFriendInfo(friendIndex, "userId");
var titleId = '0001000148434D50';
var transId = 0;

function onSendMailDone()
{
  shop.endWaiting();
  if( nwc24.mailErrNo == 0){
    wiiEnableHRP();
    document.getElementById("text03-01").style.display='';
    document.getElementById("text03-01").style.top='126px';
    document.getElementById("text03-01").innerHTML='<div align="center" class="headerBlueL"><table height="100%"><tr><td align="center" valign="middle">Your message was sent to '+friendName+'.</rd></tr></table></div>';
    document.getElementById("OKBtnWord").innerHTML="OK";
    document.getElementById("OKBtnAnchor").href='javascript:goGiftLoop()';
    document.getElementById("Progress").style.display='none';
    document.getElementById("bannershadow").style.display='';
    document.getElementById("spacerL").style.display='';
    document.getElementById("bannerL").style.display='';
    document.getElementById("wordL").style.display='';
    if(snd != null) {
      snd.playSE( cSE_AddPoint );
    }

  } else {
    wiiEnableHRP();
    nwc24.dispError();
  }
}

function initPage()
{
	initPageCommon();


	var giftListSize = '0';
	trace("get gift size again: "+giftListSize);
	var giftTransTitles = '';
        if (ecSupportsSession()) {
            ec.setSessionValue("giftListSize", giftListSize);
            ec.setSessionValue("giftTransTitles", giftTransTitles);
        }   
  

	MM_preloadImages('/oss/oss/common/images//banner/under_banner_b.gif');
	if (ecSupportsSession()) {
		transId = ec.getSessionValue("transId");
    	}
	document.getElementById("text03-01").style.top='126px';
	document.getElementById("text03-01").innerHTML='<div align="center" class="headerBlueL"><table height="100%"><tr><td align="left" valign="middle">Now sending message...</td></tr></table></div>';
    	shop.beginWaiting();
    	sendMail(transId, titleId, friendIndex, friendName, friendCode, onSendMailDone);
}
//-->
</script>
</head>

<body onload="initPage();">
<% if (!ValidParameters) { %>
<div class="titleBlueL" id="text01-01">
  <div align="left">
    <% if (og.equals("true")) { %>
    Wii Shop Channel
    <% } else { %>
    WiiMart
    <% } %>
</div>
</div>
<SCRIPT language="JavaScript">setUnderButton(true, "OK", "javascript:showHome()", "wiiSelectSound()");</SCRIPT>
<div class="dot" id="line02">･･･････････････････････････････････････････････････････････････････････････</div>
<div class="dot" id="line01">･･･････････････････････････････････････････････････････････････････････････</div>
  
<div id="Wiipoint">
  <div align="center" class="buttonTextBlackM">Wii Points</div>
</div>
<div id="point">
  <div align="center" class="wiiPoint"><span id="currentBalance"></span></div>
</div>
<div align="left" class="warningRed" id="errorCodeText">
    Error Code: <span id="errorCodePlaceholder">206601</span></div>

<div align="left" class="contentsRedM" id="errorText">
     <span id="errorTextPlaceholder">An error has occurred that cannot be resolved at this time.<BR><BR>Please try again later. If this continues, please contact your local customer support centre. For contact details, visit support.nintendo.com</span>
</div>
<% } else { %>
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


<div id="text01-01P">
  <div align="left" class="titleBlackL">Sending Message</div>
</div>

<div id="text03-01">
</div>
<div id="text04-01">
</div>

<div class="dot" id="line02">･･･････････････････････････････････････････････････････････････････････････</div>
<div class="dot" id="line01">･･･････････････････････････････････････････････････････････････････････････</div>
  
<div id="Wiipoint">
  <div align="center" class="buttonTextBlackM">Wii Points</div>
</div>
<div id="point">
  <div align="center" class="wiiPoint"><span id="currentBalance"></span></div>
</div>

<div id="bannershadow" style="display:none"><img src="/oss/oss/common/images//banner/under_banner_shadow.gif" width="211" height="75" /></div>
<div id="spacerL" style="display:none">
  <a id="OKBtnAnchor" href="javascript:giftSuccessful()"><img src="/oss/oss/common/images//spacer.gif" width="187" height="55" border="0" onmouseover="MM_swapImage('Image7','','/oss/oss/common/images//banner/under_banner_b.gif',1);wiiFocusSound();" onmouseout="MM_swapImgRestore()" onclick="wiiSelectSound();"/></a>
</div>
<div id="bannerL" style="display:none"><img src="/oss/oss/common/images//banner/under_banner_a.gif" width="187" height="55" id="Image7" /></div>
<div id="wordL" style="display:none">
  <div align="center" ><span id="OKBtnWord" class="buttonTextBlackM">OK</span></div>
</div>

<div id="progressBar"><!--  -----------------------------------------------------  -->
<!--  Copyright 2005-2014 Acer Cloud Technology, Inc.        -->
<!--  All Rights Reserved.                                   -->
<!--                                                         -->
<!--  This software contains confidential information and    -->
<!--  trade secrets of Acer Cloud Technology, Inc.           -->
<!--  Use, disclosure or reproduction is prohibited without  -->
<!--  the prior express written permission of Acer Cloud     -->
<!--  Technology, Inc.                                       -->
<!--  -----------------------------------------------------  -->
<div id="Progress">
	<div id="dynDiv1" class="contentsBlackS"></div>
    <div id="dynDiv2" class="contentsBlackS"></div>
    <div id="errDiv" class="contentsBlackS"></div>
</div></div>
<% } %>
</body>
</html>
