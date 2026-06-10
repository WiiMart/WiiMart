<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import = "java.io.*,java.util.*" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<!-- Flush buffer before setting locale to ensure encoding is preserved -->
<!-- Main page -->
<html>
<head>
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
<script type="text/javascript">var shop = new wiiShop(); const l = shop.connecting;</script>
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
	

	ecsUrl = 'https://ecs.a.taur.cloud/ecs/services/ECommerceSOAP';

	iasUrl = 'https://ias.a.taur.cloud/ias/services/IdentityAuthenticationSOAP';

	ccsUrl = 'http://ccs.blinklab.com/ccs/download';

	ucsUrl = 'https://ccs.blinklab.com/ccs/download';
	

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
<title>Wii Shop Channel</title>
  <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
  <style type="text/css">
    /* GENERAL */

/* Limit page to 640 by 480 (NTSC TV resolution) */
/* Note: PAL resolution is 640 by 528 */
body {
	/*width: 608px; height: 456px; */
	background-repeat: no-repeat;
	background-color: #FFFFFF; 
}

FORM { display: inline; } 

/* PROGRESS BAR */

a:link {
	text-decoration: none;
}
a:visited {
	text-decoration: none;
}
a:hover {
	text-decoration: none;
}
a:active {
	text-decoration: none;
}


.bold {
	font-weight: bold;
}
.titleBlackL {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 28px;
	color: #323232;
	font-weight: bold;
}
.titleBlackM {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 24px;
	color: #323232;
	font-weight: bold;
}
.titleBlackS {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 18px;
	color: #323232;
	font-weight: bold;
    line-height:22px;
}
.titleBlueL {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 28px;
	color: #34BEED;
	font-weight: bold;
}

.headerBlueL {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 20px;
	color: #34BEED;
	font-weight: bold;
}
.headerBlueM {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 16px;
	color: #34BEED;
	font-weight: bold;
}
.headerBlueM_01 {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 16px;
	color: #34BEED;
	font-weight: bold;
}
.headerBlueS {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 14px;
	color: #34BEED;
	font-weight: bold;
}
.headerWhiteM {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 16px;
	color: #FFFFFF;
	font-weight: bold;
}

.headerWhiteS {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 14px;
	color: #FFFFFF;
	font-weight: bold;
}

.buttonTextBlackM {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 18px;
	color: #323232;
	font-weight: normal;
}
.buttonTextBlackL {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 22px;
	color: #323232;
	font-weight: normal;
}
.buttonTextWhiteL {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 24px;
	color: #FFFFFF;
	font-weight: normal;
}
.buttonTextWhiteS {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 14px;
	color: #FFFFFF;
	font-weight: bold;
}
.buttonTextWhiteS_01 {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 14px;
	color: #FFFFFF;
	font-weight: bold;
}

.warningRed {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 22px;
	color: #FF0000;
	font-weight: normal;
	line-height:25px;
}
.contentsRedM {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 16px;
	color: #FF0000;
	font-weight: normal;
}

.contentsBlack {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 14px;
	color: #323232;
	font-weight: normal;
	line-height:16px;
}

.contentsBlackL {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 20px;
	color: #323232;
	font-weight: normal;
}
.contentsBlackM {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 18px;
	color: #323232;
	font-weight: normal;
}
.contentsBlackS {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 16px;
	color: #323232;
	font-weight: normal;
}
.contentsBlackS_01 {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 16px;
	color: #323232;
	font-weight: normal;
}

.contentsBlueM {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 18px;
	color: #34BEED;
	font-weight: normal;
}
.contentsBlueS {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 14px;
	color: #34BEED;
	font-weight: normal;
}
.contentsBlueS_01 {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 14px;
	color: #34BEED;
	font-weight: normal;
}

.contentsGray {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 16px;
	color: #8C8C8C;
	font-weight: normal;
}
.contentsGrayL {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 20px;
	color: #8C8C8C;
	font-weight: normal;
}
.contentsGrayM {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 18px;
	color: #8C8C8C;
	font-weight: normal;
}
.contentsGrayS {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 16px;
	color: #8C8C8C;
	font-weight: normal;
}
.contentsOrangeL {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 20px;
	color: #AA4941;
	font-weight: normal;
}
.contentsOrangeM {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 16px;
	color: #AA4941;
	font-weight: normal;
}
.contentsOrangeS {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 14px;
	color: #AA4941;
	font-weight: normal;
}


.catalogTitleBlack {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 16px;
	color: #323232;
	font-weight: normal;
	line-height: 18px;
}

.catalogTitleBlack_01 {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 16px;
	color: #323232;
	font-weight: normal;
	line-height: 18px;
}
.catalogTitleBlack_02 {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 16px;
	color: #323232;
	font-weight: normal;
	line-height: 18px;
}
.catalogTitleBlack_03 {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 16px;
	color: #323232;
	font-weight: normal;
	line-height: 22px;
}
.catalogTitleBlack_04 {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 18px;
	color: #323232;
	font-weight: normal;
	line-height: 22px;
}

.catalogTitleBlackBold {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 16px;
	color: #323232;
	font-weight: bold;
}
.catalogTitleBlue {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 16px;
	color: #34BEED;
	font-weight: normal;
}
.catalogTitleBlueBold {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 16px;
	color: #34BEED;
	font-weight: bold;
}
.wiiPoint {
	/* style for current balance */
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 22px;
	color: #34BEED;
	font-weight: normal;
}

.fullScreenText {
    position:absolute;
    left:66px;
    top:85px;
    width:476px;
    height:202px;
}

#underButtonR {
	position:absolute;
	left:399px;
	top:378px;
	width:187px;
	height:55px;
}
#underButtonL {
	position:absolute;
	left:25px;
	top:378px;
	width:187px;
	height:55px;
}
#underButton {
	position:absolute;
	left:211px;
	top:294px;
	width:187px;
	height:55px;
}

.buttonBanner {
	position:absolute;
	left:0px;
	top:0px;
	width:100%;
	height:100%;
	z-index:22;
}
.buttonSpacer {
	position:absolute;
	left:0px;
	top:0px;
	width:100%;
	height:100%;
	z-index:25;
}
.buttonWord {
	position:absolute;
	left:0px;
	top:0px;
	width:100%;
	height:100%;
	line-height:19px;
	z-index:24;
}
.buttonBannerShadow {
	position:absolute;
	left:-12px;
	top:-9px;
	width:211px;
	height:75px;
	z-index:20;
}

.tcell {
    display:table-cell;
}

.h_inline_middle {
    text-align:center;
    width:auto;
    height:auto;
}

.h_block_middle {
    margin-left:auto;
    margin-right:auto;
    width:auto;
    height:auto;
}

.v_middle {
    vertical-align:middle;
    width:auto;
    height:auto;
}

.vh_inline_middle {
    text-align:center;
    vertical-align:middle;
    width:auto;
    height:auto;
}

.h_inline_left {
    text-align:left;
    width:auto;
    height:auto;
}

.v_middle_h_inline_left {
    text-align:left;
    vertical-align:middle;
    width:auto;
    height:auto;
}

#Wiipoint {
	/* location of "Wii Points" the word */
	text-align:center;
	position:absolute;
	left:241px;
	/* //top:396px; */
	top:401px;
	width:130px;
	height:20px;
	z-index:22;
}

#point {
	/* location of current balance */
	text-align:center;
	position:absolute;
	left:241px;
	top:378px;
	width:130px;
	height:22px;
	z-index:97;
}
.dot {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 16px;
	color: #8C8C8C;
}

#help {
	position:absolute;
	left:537px;
	top:23px;
	width:52px;
	height:55px;
	z-index:100;
}
#top {
	position:absolute;
	left:477px;
	top:23px;
	width:52px;
	height:55px;
	z-index:100;
}
#line01 {
	position:absolute;
	left:4px;
	top:59px;
	width:473px;
	height:10px;
	z-index:98;
}
#line02 {
	position:absolute;
	left:4px;
	top:363px;
	width:600px;
	height:10px;
	/* //z-index:21; */
	z-index:100;
}
#upperLineLong {
	position:absolute;
	left:4px;
	top:59px;
	width:600px;
	height:10px;
	/* //z-index:21; */
	z-index:100;
}
#tophelpshadow {
	position:absolute;
	left:467px;
	top:15px;
	width:132px;
	height:75px;
	z-index:24;
}

.inputStyle {
	border-top-width: 2px;
	border-right-width: 2px;
	border-bottom-width: 2px;
	border-left-width: 2px;
	border-top-style: solid;
	border-right-style: solid;
	border-bottom-style: solid;
	border-left-style: solid;
	border-top-color: #CCCCCC;
	border-right-color: #CCCCCC;
	border-bottom-color: #EAEAEA;
	border-left-color: #CCCCCC;	
}

.spacecover {
    left:0px;
    top:0px;
    width:100%;
    height:100%;
}

div.page_area {
	position: absolute;
	left: 0px;
	top: 0px;
	width: 608px;
        height: 363px;
}

div.page_title_area {
	position: relative;
	left: 29px;
	top: 28px;
	width: 442px;
	height: 28px;
	text-align: left;
}

div.page_content_area {
	position: relative;
	top: 75px;
	left: 20px;
	text-align: center;
	width: 548px;
}

.bg_connect {
	background-image: url(../images/back/bg_connect.gif);
	background-repeat: no-repeat;
}

.bg_sca {
	background-image: url(../images/back/bg_sca.gif);
	background-repeat: no-repeat;
}

span.font14px{ font-size: 14px; }
span.font16px{ font-size: 16px; }
span.font18px{ font-size: 18px; }
span.font20px{ font-size: 20px; }
span.font22px{ font-size: 22px; }
span.font24px{ font-size: 24px; }


/* F_01:  Connecting to Server */
/* NOTE:  used by index.jsp, Register.jsp, CheckRegistered.jsp, and CheckBalance.jsp */


#text01-01 {
	position:absolute;
	left:29px;
	top:28px;
	width:546px;
	height:28px;
	z-index:27;
}
#text02-01 {
	position:absolute;
	left:25px;
	top:100px;
	width:560px;
	height:180px;
	z-index:31;
}</style>
  <link rel="shortcut icon" href="/oss/favicon.ico" /> 
</head>

<script type="text/JavaScript">
<!--
var shop = new wiiShop();	
var snd = new wiiSound();

var cSE_Forcus = 2;
var cSE_Decide = 3;

function MM_swapImgRestore() { //v3.0
    var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_findObj(n, d) { //v4.01
    var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
      d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
    if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
    for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
    if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
    var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
    if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

function MM_preloadImages() { //v3.0
    var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
      var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function isShowUpdateAvailable()
{
    if (shop != null && "returnToUpdate" in shop) {
        return true;
    } else {
        return false;
    }
}

function returnToMenuOrUpdate()
{
    if (isShowUpdateAvailable()) {
        shop.returnToUpdate();
    } else {
        shop.returnToMenu();
    }
}

function initPage()
{
    MM_preloadImages('/oss/oss/common/images//banner/under_banner_b.gif'); 
	var wiiTitle = document.getElementById("wiiTitle");
    wiiTitle.innerHTML = "WiiMart";
	
	if (shop && "endWaiting" in shop) {
	    shop.endWaiting();
	}
	
	if (shop && "enableHRP" in shop) {
		shop.enableHRP();
	}

    var upButtonTextElem = document.getElementById("upButtonText");
    if (isShowUpdateAvailable()) {
        if ( shop.isCompatibleMode )
        {
            setUnderButton(true, shop.menuBtn, "javascript:showWiiMenu()", "wiiSelectSound();");
        }
        else
        {
            setUnderButton(true, shop.menuBtn, "javascript:showWiiMenu()", "wiiSelectSound();");
        }

    } else {
        upButtonTextElem.innerHTML = shop.menuBtn;
    }


}


//-->
</script>

<body onload="initPage()">
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


<div class="dot" id="line01">･･･････････････････････････････････････････････････････････････････････････</div>
<div class="dot" id="line02">･･･････････････････････････････････････････････････････････････････････････</div>

<div class="titleBlueL" id="text01-01">
  <span id="wiiTitle"></span>
</div>
<div align="center" class="buttonTextBlackM" id="text02-01">
   <span id="updateMessage">WiiMart is currently undergoing maintenance.<BR><BR>Sorry for the inconvenience. Please try again later.</span>
</div>
</body>
</html>
</html>
