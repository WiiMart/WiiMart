<%@ page import = "java.io.*,java.util.*" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<a href="https://oss-auth.blinklab.com/oss/serv/debug.jsp">debug</a>
<button onclick="window.location.reload()">reload</button>



<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!-- Flush buffer before setting locale to ensure encoding is preserved -->
<html>
    <head>
        <script>
          // prevent 209601 (idle on a page, times the user out)
          var wiishop = new wiiShop();
          const unused = wiishop.connecting;
        </script>
      
      
  

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
	

	ecsUrl = 'https://oss-auth.blinklab.com/ecs/services/ECommerceSOAP';

	iasUrl = 'https://oss-auth.blinklab.com/ias/services/IdentityAuthenticationSOAP';

	ccsUrl = 'http://ccs.cdn.blinklab.com/ccs/download';

	ucsUrl = 'https://ccs.larsenv.com/ccs/download';
	

	ec.setWebSvcUrls(ecsUrl, iasUrl);
	ec.setContentUrls (ccsUrl, ucsUrl);
	
	

	imagesPath = "/oss/oss/common/images/";
	htmlPath = "/oss/oss/common/html";
	ossPath = "https://oss-auth.blinklab.com/oss/serv/";
	secureOssPath = "https://oss-auth.blinklab.com/oss/serv/";	

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
	var supportsCreditCard = 'true';
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
	a[-(EC_ERROR_ALREADY_OWN)] = "An error has occurred1 that cannot be resolved at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance if this continues.";
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
    		    msg = "An error has occurred2 that cannot be resolved at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance if this continues.";
    		}
    	}
    }
        
    if (msg == null || msg == '') {
    	msg = "An error has occurred3 that cannot be resolved at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance if this continues.";
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
	a[621] = "An error has occurred4 that cannot be resolved at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance if this continues.";
	a[623]	= "You have downloaded this title before, and your trial period has expired. You cannot redownload it.<BR><BR>Visit support.nintendo.com for assistance.";
	a[642] = "An error has occurred5 that cannot be resolved at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance if this continues.";
	a[643] = "An error has occurred6 that cannot be resolved at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance if this continues.";
	a[644] = "Credit cards cannot be used on this console.<BR><BR>Please visit support.nintendo.com for assistance.";
	a[645] = "An error has occurred7 that cannot be resolved at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance if this continues.";
	
	// ECS Gift Errors
	a[646] = "An error has occurred8 that cannot be resolved at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance if this continues.";
	a[621] = "An error has occurred9 that cannot be resolved at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance if this continues.";
	a[626] = "An error has occurred10 that cannot be resolved at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance if this continues.";
	a[625] = "An error has occurred11 that cannot be resolved at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance if this continues.";
	
	// ETS Errors
	a[705] = "An error has occurred12 that cannot be resolved at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance if this continues.";
	a[706] = "An error has occurred13 that cannot be resolved at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance if this continues.";
	a[707] = "An error has occurred14 that cannot be resolved at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance if this continues.";
	
	// PAS Errors
	a[810]	= "An error has occurred15 while redeeming your Wii Download Ticket.<BR><BR>Visit support.nintendo.com for assistance.";
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
	a[903]	= "An error has occurred16 that cannot be resolved at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance if this continues.";
	a[928] = "An error has occurred17 that cannot be resolved at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance if this continues.";
	a[958]	= "An error has occurred18 that cannot be resolved at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance if this continues.";
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
<title>Welcome to WiiMart</title>
<style type="text/css">
  /* W_01: Welcome Page */
.invisible {
	visibility: hidden;
	left:0px;
	top:0px;
	width:0px;
	height:0px;
	z-index:2;
}
#bg {
	position:absolute;
	left:0px;
	top:0px;
	width:608px;
	height:456px;
	z-index:3;
	visibility: visible;
}
#info01 {
	position:absolute;
	left:107px;
	top:263px;
	width:438px;
	height:25px;
	z-index:4;
	overflow: hidden;
}
#info02 {
	position:absolute;
	left:107px;
	top:288px;
	width:438px;
	height:25px;
	z-index:4;
	overflow: hidden;
}
#info03 {
	position:absolute;
	left:107px;
	top:313px;
	width:438px;
	height:25px;
	z-index:4;
	overflow: hidden;
}
#info04 {
	position:absolute;
	left:107px;
	top:338px;
	width:438px;
	height:25px;
	z-index:4;
	overflow: hidden;
}
#info01n {
	position:absolute;
	left:47px;
	top:268px;
	width:60px;
	height:14px;
	z-index:4;
	overflow: hidden;
}
#info02n {
	position:absolute;
	left:47px;
	top:293px;
	width:60px;
	height:14px;
	z-index:4;
	overflow: hidden;
}
#info03n {
	position:absolute;
	left:47px;
	top:318px;
	width:60px;
	height:14px;
	z-index:4;
	overflow: hidden;
}
#info04n {
	position:absolute;
	left:47px;
	top:343px;
	width:60px;
	height:14px;
	z-index:4;
	overflow: hidden;
}
#infoSpacer01 {
	position:absolute;
	left:47px;
	top:263px;
	width:514px;
	height:25px;
	z-index:5;
	
}
#infoSpacer02 {
	position:absolute;
	left:47px;
	top:288px;
	width:514px;
	height:25px;
	z-index:5;
}
#infoSpacer03 {
	position:absolute;
	left:47px;
	top:313px;
	width:514px;
	height:25px;
	z-index:5;
}
#infoSpacer04 {
	position:absolute;
	left:47px;
	top:338px;
	width:514px;
	height:25px;
	z-index:5;
}
#infoShadow01 {
	position:absolute;
	left:47px;
	top:263px;
	width:514px;
	height:25px;
	z-index:2;
	
}
#infoShadow02 {
	position:absolute;
	left:47px;
	top:288px;
	width:514px;
	height:25px;
	z-index:2;
}
#infoShadow03 {
	position:absolute;
	left:47px;
	top:313px;
	width:514px;
	height:25px;
	z-index:2;
}
#infoShadow04 {
	position:absolute;
	left:47px;
	top:338px;
	width:514px;
	height:25px;
	z-index:2;
}
.posLeftArrow {
	position:absolute;
	left:15px;
	top:118px;
	z-index:10;
}
.posRightArrow {
	position:absolute;
	left:537px;
	top:118px;
	z-index:10;
}
.posStopLeftArrow {
	position:absolute;
	left:10px;
	top:108px;
	width:62px;
	height:88px;
	z-index:11;
}
.posStopRightArrow {
	position:absolute;
	left:524px;
	top:108px;
	width:62px;
	height:88px;
	z-index:11;
}
#recroot {
	position:absolute;
	left:18px;
	top:70px;
}
#rec01 {
	position:absolute;
	left:0px;
	top:0px;
    	width:282px;
	height:81px;
        max-width:282px;
}
#rec02 {
	position:absolute;
	left:282px;
	top:0px;
    	width:282px;
	height:81px;
        max-width:282px;
}
#rec03 {
	position:absolute;
	left:0px;
	top:81px;
    	width:282px;
	height:81px;
        max-width:282px;
}
#rec04 {
	position:absolute;
	left:282px;
	top:81px;
    	width:282px;
	height:81px;
        max-width:282px;
}
.posTitleSoft {
    	position:absolute;
	left:9px;
	top:3px;
        z-index:5;
}
.posTitleNew {
    	position:absolute;
	left:9px;
	top:3px;
        z-index:7;
}
.posTitleSoftShadow{
    	position:absolute;
	left:9px;
	top:3px;
        z-index:3;
}
.posTitleSoftSpacer {
    	position:absolute;
	left:9px;
	top:3px;
        z-index:8;
}
.posTitleSoftFocusImage {
    	position:absolute;
	left:9px;
	top:3px;
        z-index:3;
}
.posTitleDetails{
        position:absolute;
	left:99px;
	top:10px;
        z-index:5;
}


.style1 {
	font-size: 30px;
	font-family: "PW-RodinNTLG TT M";
	font-weight: bold;
	color: #34BEED;
	margin-top: 8px;
        max-width:590px;
        max-height:42px;
}
.style1UDLR1 {font-size: 30px; font-family: "PW-RodinNTLG TT M"; font-weight: bold; color: #DDDDDD; margin-top: 8px;}
.style1UDLR2 {font-size: 30px; font-family: "PW-RodinNTLG TT M"; font-weight: bold; color: #EEEEEE; margin-top: 8px;}
.style2 {
	color: #34BEED;
	font-family: "PW-RodinNTLG TT M";
	font-size: 16px;
	margin-top: 8px;
}
.style2UDLR1 {color: #DDDDDD; font-family: "PW-RodinNTLG TT M"; font-size: 16px; margin-top: 8px;}
.style2UDLR2 {color: #EEEEEE; font-family: "PW-RodinNTLG TT M"; font-size: 16px; margin-top: 8px;}
.style4 {
	color: #999999;
	font-size: 17px;
	font-weight: bold;
	font-family: "PW-RodinNTLG TT M";
}
.style5 {
	color: #333333;
	font-size: 24px;
	font-family: "PW-RodinNTLG TT M";
	margin-top: 12px;
}
.style13 {
	font-weight: bold;
	color: #333333;
	font-family: "PW-RodinNTLG TT M";
	font-size: 14px;
}
.style15 {
	font-size: 20px;
	color: #FFFFFF;
}
#SofList01 {
	position:absolute;
	width:551px;
	height:42px;
        max-width:590px;
        max-height:42px;
	z-index:3;
	left: 29px;
	top: 25px;	
}
#SoftListSpacer {
	position:absolute;
	width:551px;
	height:42px;
        max-width:590px;
        max-height:42px;
	z-index:5;
	left: 29px;
	top: 25px;
}
#txtSoftList {
	position:absolute;
	width:551px;
	height:42px;
        max-width:590px;
        max-height:42px;
	z-index:4;
	left: 29px;
	top: 25px;
	margin-top: 2px;
}


#cssbutton {
    position:absolute;
    left:32px;
    top:370px;
    width:231px;
    height:64px;
}
#icrButton {              /* ICR style */
    position:absolute;
    left:32px;
    top:370px;
    width:231px;
    height:64px;
}



.cssStyle {
	color: #333333;
	font-size: 18px;
	font-family: "PW-RodinNTLG TT M";
    line-height:18px;
}
/*
//#bannerCss {
//	position:absolute;
//	left:0px;
//	top:0px;
//	width:100%;
//	height:100%;
//	z-index:3;
//}
*/
#txtGoCss {
	position:absolute;
	left:63px;
	top:4px;
	width:164px;
	height:56px;
	z-index:4;
}
#txtGoIcr {                /* ICR style */
	position:absolute;
	left:83px;
	top:4px;
	width:144px;
	height:56px;
	z-index:4;
}


#bannerspacerCss {
	position:absolute;
	left:4px;
	top:4px;
	width:223px;
	height:56px;
	z-index:5;
}
#bannerSpacerIcr {           /* ICR style */
	position:absolute;
	left:4px;
	top:4px;
	width:223px;
	height:56px;
	z-index:5;
}





#shopwithcssbutton{
    position:absolute;
    left:269px;
    top:370px;
    width:302px;
    height:64px;
}
#shopWithIcrButton{        /* ICR style */
    position:absolute;
    left:269px;
    top:370px;
    width:302px;
    height:64px;
}



.shopWithCssStyle {
	color: #333333;
	font-size: 24px;
	font-family: "PW-RodinNTLG TT M";
}

.bannerShopwithCss {
	position:absolute;
	left:0px;
	top:0px;
	width:100%;
	height:100%;
	z-index:3;
}
#txtGoShoppingwithCss{
    display:table;
	position:absolute;
	left:4px;
	top:4px;
	width:294px;
	height:56px;
	z-index:4;
}
#txtGoShoppingWithIcr{      /* ICR style */
    display:table;
	position:absolute;
	left:4px;
	top:4px;
	width:294px;
	height:56px;
	z-index:4;
}




#bannerspacerShopwithCss {
	position:absolute;
	left:4px;
	top:4px;
	width:294px;
	height:56px;
	z-index:5;
}
#bannerSpacerShopWithIcr {    /* ICR style */
	position:absolute;
	left:4px;
	top:4px;
	width:294px;
	height:56px;
	z-index:5;
}


#banner {
	position:absolute;
	left:123px;
	top:365px;
	width:365px;
	height:76px;
	z-index:3;
}
#txtGoShopping {
	position:absolute;
	left:129px;
	top:375px;
	width:352px;
	height:56px;
	z-index:4;
}
#bannerspacer {
	position:absolute;
	left:129px;
	top:375px;
	width:352px;
	height:56px;
	z-index:5;
}
#txtNews {
	position:absolute;
	left:73px;
	top:235px;
	width:462px;
	height:28px;
	z-index:5;
}
.txt_info {
	font-size: 14px;
	color: #333333;
	font-family: "PW-RodinNTLG TT M";
	margin-top: 2px;
}
</style>




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



<script type="text/javascript">
function TitleInfo()
{
}
var WiiU_flag=false;

var TitleListNumbers;
var TitleListNumber_now;
var TitleList1_flag=false;
var TitleList2_flag=false;
var TitleList3_flag=false;
var TitleList4_flag=false;

var titlesRec;
var titles1;
var titles2;
var titles3;
var titles4;

var scroll_counter=-8
const SCROLL_COUNT=36;
const SCROLL_STOP_PLUS=12;

var moveleft_flag=false;
var arrowforcedislight_flag=false;

function init_title(listname)
{

  function exist_initial_titlelist(name)
  {
    if(name == "titlelist1" && !TitleList1_flag)
    {
        return false;
    }
    else if(name == "titlelist2" && !TitleList2_flag)
    {
        return false;
    }
    else if(name == "titlelist3" && !TitleList3_flag)
    {
        return false;
    }
    else if(name == "titlelist4" && !TitleList4_flag)
    {
        return false;
    }
    else
    {
        return true;
    }
  }


    titlesRec = initRecommendedTitles();
    titles1 = inittitlelist1();
    titles2 = inittitlelist2();
    titles3 = inittitlelist3();
    titles4 = inittitlelist4();

    if(listname == "titlelist1")
    {
        TitleListNumber_now = 1;
    }
    else if(listname == "titlelist2")
    {
        TitleListNumber_now = 2;
    }
    else if(listname == "titlelist3")
    {
        TitleListNumber_now = 3;
    }
    else if(listname == "titlelist4")
    {
        TitleListNumber_now = 4;
    }
    else
    {
        TitleListNumber_now = 0;
    }

    TitleListNumbers = 0;
    if(titles1[1])
    {
        TitleList1_flag=true;
        TitleListNumbers++;
    }
    if(titles2[1])
    {
        TitleList2_flag=true;
        TitleListNumbers++;
    }
    if(titles3[1])
    {
        TitleList3_flag=true;
        TitleListNumbers++;
    }
    if(titles4[1])
    {
        TitleList4_flag=true;
        TitleListNumbers++;
    }
    if(TitleListNumbers>=1)
    {
        exist_right_arrow_flag=true;
    }
    if(TitleListNumbers>=2)
    {
        exist_left_arrow_flag=true;
    }

    if(!exist_initial_titlelist(listname) )
    {
        TitleListNumber_now = 0;
    }
    refresh_Titleshow();
}

function refresh_Titleshow()
{
    clear_Title();
    if(TitleListNumber_now==0)
    {
        showRecommendedTitles(titlesRec, 4);
        change_Header_titlelistName0();
        if(ecSupportsSession()) {
            ec.setSessionValue("previousDisplayedListName","recommended");
        }
    }
    else if(TitleListNumber_now==1)
    {
        showRecommendedTitles(titles1, 4);
        change_Header_titlelistName1();
        if(ecSupportsSession()) {
            ec.setSessionValue("previousDisplayedListName","titlelist1");
        }
    }
    else if(TitleListNumber_now==2)
    {
        showRecommendedTitles(titles2, 4);
        change_Header_titlelistName2();
        if(ecSupportsSession()) {
            ec.setSessionValue("previousDisplayedListName","titlelist2");
        }
    }
    else if(TitleListNumber_now==3)
    {
        showRecommendedTitles(titles3, 4);
        change_Header_titlelistName3();
        if(ecSupportsSession()) {
            ec.setSessionValue("previousDisplayedListName","titlelist3");
        }
    }
    else if(TitleListNumber_now==4)
    {
        showRecommendedTitles(titles4, 4);
        change_Header_titlelistName4();
        if(ecSupportsSession()) {
            ec.setSessionValue("previousDisplayedListName","titlelist4");
        }
    }

    if(TitleListNumbers>=2 || (TitleListNumbers==1 && TitleListNumber_now==0) )
    {
        exist_right_arrow_flag=true;
        showRightArrow();
        showStopRightArrow();
    }
    else
    {
        exist_right_arrow_flag=false;
        hideRightArrow();
        hideStopRightArrow();
    }
    if(TitleListNumbers==1 && TitleListNumber_now!=0)
    {
        moveleft_flag=true;
    }
    else
    {
        moveleft_flag=false;
    }
    if(TitleListNumbers>=2 || (TitleListNumbers==1 && TitleListNumber_now!=0) )
    {
        exist_left_arrow_flag=true;
        showLeftArrow();
        showStopLeftArrow();
    }
    else
    {
        exist_left_arrow_flag=false;
        hideLeftArrow();
        hideStopLeftArrow();
    }
    start_animation_arrow();
}

function change_Header_titlelistName0()
{
    var titleElem = document.getElementById("txtSoftList");
    var headerURLElem = document.getElementById("headerURL");
    titleElem.innerHTML="<span class='style1'>WiiMart</span><span class='style2'>Recommended Titles</span>";
    headerURLElem.href = "javascript:showPage('B_04.jsp?p=1&rec=true')"
}

function change_Header_titlelistName1()
{
  

    var titleElem = document.getElementById("txtSoftList");
    var headerURLElem = document.getElementById("headerURL");

      titleElem.innerHTML="<nobr><span class='style1'>" + "Pokémon" + "</span></nobr>";
      headerURLElem.href = "javascript:showPage('B_04.jsp?p=1&titlelist1=true')";
  
}

function change_Header_titlelistName2()
{
  

    var titleElem = document.getElementById("txtSoftList");
    var headerURLElem = document.getElementById("headerURL");

      titleElem.innerHTML="<nobr><span class='style1'>" + "A Bit Retro" + "</span></nobr>";
      headerURLElem.href = "javascript:showPage('B_04.jsp?p=1&titlelist2=true')";
  
}
function change_Header_titlelistName3()
{
  

    var titleElem = document.getElementById("txtSoftList");
    var headerURLElem = document.getElementById("headerURL");

      titleElem.innerHTML="<nobr><span class='style1'>" + "Digital Only" + "</span></nobr>";
      headerURLElem.href = "javascript:showPage('B_04.jsp?p=1&titlelist3=true')";
  
}
function change_Header_titlelistName4()
{
  

    var imageElem = document.getElementById("txtSoftList");
    var headerURLElem = document.getElementById("headerURL");

      imageElem.innerHTML="<nobr><span class='style1'>" + "Demos" + "</span></nobr>";
      headerURLElem.href = "javascript:showPage('B_04.jsp?p=1&titlelist4=true')";
  
}
function get_Rightposition()
{
    if(TitleListNumber_now==0)
    {
        if(TitleList1_flag)
            return 1;
        else if(TitleList2_flag)
            return 2;
        else if(TitleList3_flag)
            return 3;
        else if(TitleList4_flag)
            return 4;
        else
            return 0;
    }
    else if(TitleListNumber_now==1)
    {
        if(TitleList2_flag)
            return 2;
        else if(TitleList3_flag)
            return 3;
        else if(TitleList4_flag)
            return 4;
        else
            return 0;
    }
    else if(TitleListNumber_now==2)
    {
        if(TitleList3_flag)
            return 3;
        else if(TitleList4_flag)
            return 4;
        else
            return 0;
    }
    else if(TitleListNumber_now==3)
    {
        if(TitleList4_flag)
            return 4;
        else
            return 0;
    }
    else if(TitleListNumber_now==4)
    {
        return 0;
    }
    else
    {
        return 0;
    }
}

function get_Leftposition()
{
    if(TitleListNumber_now==0)
    {
        if(TitleList4_flag)
            return 4;
        else if(TitleList3_flag)
            return 3;
        else if(TitleList2_flag)
            return 2;
        else if(TitleList1_flag)
            return 1;
        else
            return 0;
    }
    else if(TitleListNumber_now==4)
    {
        if(TitleList3_flag)
            return 3;
        else if(TitleList2_flag)
            return 2;
        else if(TitleList1_flag)
            return 1;
        else
            return 0;
    }
    else if(TitleListNumber_now==3)
    {
        if(TitleList2_flag)
            return 2;
        else if(TitleList1_flag)
            return 1;
        else
            return 0;
    }
    else if(TitleListNumber_now==2)
    {
        if(TitleList1_flag)
            return 1;
        else
            return 0;
    }
    else if(TitleListNumber_now==1)
    {
        return 0;
    }
    else
    {
        return 0;
    }
}

function initRecommendedTitles()
{
  var recList = new Array();
  var title;
  
      title = new TitleInfo();
      title.titleId = '000100014642324A';

      title.nameFirstLine = 'Super Mario Bros. 2:';
      title.nameSecondLine = 'The Lost Levels';

	  title.titleImage = null;
    
      title.titleImage = '/oss/ccs/000100014642324A/FFFD0001';
      MM_preloadImages('/oss/ccs/000100014642324A/FFFD0001');
    
      title.isNew = 'true';
      title.price = '500';
      title.titleLicense = getTitleLicense(title.titleId);

      recList[1] = title;
  
      title = new TitleInfo();
      title.titleId = '000100014A385745';

      title.nameFirstLine = 'Super Mario All-Stars';
      title.nameSecondLine = '+ Super Mario World';

	  title.titleImage = null;
    
      title.titleImage = '/oss/ccs/000100014A385745/FFFD0001';
      MM_preloadImages('/oss/ccs/000100014A385745/FFFD0001');
    
      title.isNew = 'true';
      title.price = '800';
      title.titleLicense = getTitleLicense(title.titleId);

      recList[2] = title;
  
      title = new TitleInfo();
      title.titleId = '000100014F484243';

      title.nameFirstLine = 'The Homebrew Channel';
      title.nameSecondLine = 'Open Source Edition';

	  title.titleImage = null;
    
      title.titleImage = '/oss/ccs/000100014F484243/FFFD0001';
      MM_preloadImages('/oss/ccs/000100014F484243/FFFD0001');
    
      title.isNew = 'true';
      title.price = '0';
      title.titleLicense = getTitleLicense(title.titleId);

      recList[3] = title;
  
      title = new TitleInfo();
      title.titleId = '000100014E414545';

      title.nameFirstLine = 'Paper Mario';
      title.nameSecondLine = '';

	  title.titleImage = null;
    
      //title.titleImage = '/oss/ccs/000100014A385745/FFFD0001';
      title.titleImage = '/oss/ccs/000100014E414545/FFFD0001';
      MM_preloadImages('/oss/ccs/000100014E414545/FFFD0001');
    
      title.isNew = 'false';
      title.price = '1000';
      title.titleLicense = getTitleLicense(title.titleId);

      recList[4] = title;
  
  return recList;
}

function inittitlelist1()
{
  var recList = new Array();
  var title;
  
      title = new TitleInfo();
      title.titleId = '0001000157505345';

      title.nameFirstLine = 'Pokémon Rumble';
      title.nameSecondLine = '';

	  title.titleImage = null;
    
      title.titleImage = '/oss/ccs/0001000157505345/FFFD0001';
      MM_preloadImages('/oss/ccs/0001000157505345/FFFD0001');
    
      title.isNew = 'false';
      title.price = '1500';
      title.titleLicense = getTitleLicense(title.titleId);

      recList[1] = title;
  
      title = new TitleInfo();
      title.titleId = '0001000157424D45';

      title.nameFirstLine = 'My Pokémon Ranch';
      title.nameSecondLine = '';

	  title.titleImage = null;
    
      title.titleImage = '/oss/ccs/0001000157424D45/FFFD0000';
      MM_preloadImages('/oss/ccs/0001000157424D45/FFFD0000');
    
      title.isNew = 'false';
      title.price = '1000';
      title.titleLicense = getTitleLicense(title.titleId);

      recList[2] = title;
  
      title = new TitleInfo();
      title.titleId = '000100014E414B45';

      title.nameFirstLine = 'Pokémon Snap';
      title.nameSecondLine = '';

	  title.titleImage = null;
    
      title.titleImage = '/oss/ccs/000100014E414B45/FFFD0000';
      MM_preloadImages('/oss/ccs/000100014E414B45/FFFD0000');
    
      title.isNew = 'false';
      title.price = '1000';
      title.titleLicense = getTitleLicense(title.titleId);

      recList[3] = title;
  
      title = new TitleInfo();
      title.titleId = '000100014E414E45';

      title.nameFirstLine = 'Pokémon Puzzle';
      title.nameSecondLine = '';

	  title.titleImage = null;
    
      title.titleImage = '/oss/ccs/000100014E414E45/FFFD0000';
      MM_preloadImages('/oss/ccs/000100014E414E45/FFFD0000');
    
      title.isNew = 'false';
      title.price = '1000';
      title.titleLicense = getTitleLicense(title.titleId);

      recList[4] = title;
  
  return recList;
}
function inittitlelist2()
{
  var recList = new Array();
  var title;
  
      title = new TitleInfo();
      title.titleId = '000100014E414245';

      title.nameFirstLine = 'Mario Kart 64';
      title.nameSecondLine = '';

	  title.titleImage = null;
    
      title.titleImage = '/oss/ccs/000100014E414245/FFFD0000';
      MM_preloadImages('/oss/ccs/000100014E414245/FFFD0000');
    
      title.isNew = 'false';
      title.price = '1000';
      title.titleLicense = getTitleLicense(title.titleId);

      recList[1] = title;
  
      title = new TitleInfo();
      title.titleId = '0001000146435745';

      title.nameFirstLine = 'Super Mario Bros. 3';
      title.nameSecondLine = '';

	  title.titleImage = null;
    
      title.titleImage = '/oss/ccs/0001000146435745/FFFD0004';
      MM_preloadImages('/oss/ccs/0001000146435745/FFFD0004');
    
      title.isNew = 'false';
      title.price = '500';
      title.titleLicense = getTitleLicense(title.titleId);

      recList[2] = title;
  
      title = new TitleInfo();
      title.titleId = '0001000146414D45';

      title.nameFirstLine = 'Wario&#39;s Woods';
      title.nameSecondLine = '';

	  title.titleImage = null;
    
      title.titleImage = '/oss/ccs/0001000146414D45/FFFD0004';
      MM_preloadImages('/oss/ccs/0001000146414D45/FFFD0004');
    
      title.isNew = 'false';
      title.price = '500';
      title.titleLicense = getTitleLicense(title.titleId);

      recList[3] = title;
  
      title = new TitleInfo();
      title.titleId = '000100014D414845';

      title.nameFirstLine = 'Sonic The Hedgehog';
      title.nameSecondLine = '';

	  title.titleImage = null;
    
      title.titleImage = '/oss/ccs/000100014D414845/FFFD0000';
      MM_preloadImages('/oss/ccs/000100014D414845/FFFD0000');
    
      title.isNew = 'false';
      title.price = '800';
      title.titleLicense = getTitleLicense(title.titleId);

      recList[4] = title;

  return recList;
}
function inittitlelist3()
{
  var recList = new Array();
  var title;
  
      title = new TitleInfo();
      title.titleId = '0001000157505345';

      title.nameFirstLine = 'Pokémon Rumble';
      title.nameSecondLine = '';

	  title.titleImage = null;
    
      title.titleImage = '/oss/ccs/0001000157505345/FFFD0001';
      MM_preloadImages('/oss/ccs/0001000157505345/FFFD0001');
    
      title.isNew = 'false';
      title.price = '1500';
      title.titleLicense = getTitleLicense(title.titleId);

      recList[1] = title;
  
      title = new TitleInfo();
      title.titleId = '0001000157474F45';

      title.nameFirstLine = 'World of Goo';
      title.nameSecondLine = '';

	  title.titleImage = null;
    
      title.titleImage = '/oss/ccs/0001000157474F45/FFFD0001';
      MM_preloadImages('/oss/ccs/0001000157474F45/FFFD0001');
    
      title.isNew = 'false';
      title.price = '1500';
      title.titleLicense = getTitleLicense(title.titleId);

      recList[2] = title;
  
      title = new TitleInfo();
      title.titleId = '0001000157545045';

      title.nameFirstLine = 'Tetris Party';
      title.nameSecondLine = '';

	  title.titleImage = null;
    
      title.titleImage = '/oss/ccs/0001000157545045/FFFD0001';
      MM_preloadImages('/oss/ccs/0001000157545045/FFFD0001');
    
      title.isNew = 'false';
      title.price = '1200';
      title.titleLicense = getTitleLicense(title.titleId);

      recList[3] = title;
  
      title = new TitleInfo();
      title.titleId = '0001000157444D45';

      title.nameFirstLine = 'Dr. Mario Online Rx';
      title.nameSecondLine = '';

	  title.titleImage = null;
    
      title.titleImage = '/oss/ccs/0001000157444D45/FFFD0000';
      MM_preloadImages('/oss/ccs/0001000157444D45/FFFD0000');
    
      title.isNew = 'false';
      title.price = '1000';
      title.titleLicense = getTitleLicense(title.titleId);

      recList[4] = title;

  return recList;
}
function inittitlelist4()
{
  var recList = new Array();
  var title;
  
      title = new TitleInfo();
      title.titleId = '0001000158484145';

      title.nameFirstLine = 'Pokémon Rumble';
      title.nameSecondLine = 'Demo';
      MM_preloadImages('/oss/ccs/0001000158484145/FFFD0001');
	  title.titleImage = null;
    
      title.titleImage = '/oss/ccs/0001000158484145/FFFD0001';

    
      title.isNew = 'false';
      title.price = '0';
      title.titleLicense = getTitleLicense(title.titleId);

      recList[1] = title;
  
      title = new TitleInfo();
      title.titleId = '0001000158494A45';

      title.nameFirstLine = 'FAST - Racing League';
      title.nameSecondLine = 'Demo';
      MM_preloadImages('/oss/ccs/0001000158494A45/FFFD0001');
	  title.titleImage = null;
    
      title.titleImage = '/oss/ccs/0001000158494A45/FFFD0001';

    
      title.isNew = 'false';
      title.price = '0';
      title.titleLicense = getTitleLicense(title.titleId);

      recList[2] = title;
  
      title = new TitleInfo();
      title.titleId = '00010001584A4945';

      title.nameFirstLine = '2 Fast 4 Gnomz';
      title.nameSecondLine = 'Demo';
      MM_preloadImages('/oss/ccs/00010001584A4945/FFFD0001');
	  title.titleImage = null;
    
      title.titleImage = '/oss/ccs/00010001584A4945/FFFD0001';

    
      title.isNew = 'false';
      title.price = '0';
      title.titleLicense = getTitleLicense(title.titleId);

      recList[3] = title;
  
      title = new TitleInfo();
      title.titleId = '0001000158493245';

      title.nameFirstLine = 'Kyotokei';
      title.nameSecondLine = 'Demo';
      MM_preloadImages('/oss/ccs/0001000158493245/FFFD0001');
	  title.titleImage = null;
    
      title.titleImage = '/oss/ccs/0001000158493245/FFFD0001';

    
      title.isNew = 'false';
      title.price = '0';
      title.titleLicense = getTitleLicense(title.titleId);

      recList[4] = title;
  
  return recList;
}


/* Display the title at position pos */
function showRecommendedTitleURL(title,position)
{
    titleUrlElem = document.getElementById("titleUrl0" + position);
    if (titleUrlElem != null)
    {
        titleUrlElem.href = "javascript:showPage('B_05.jsp?p=4&titleId=" + title.titleId + "')";
        var var_src = "\"" + "/oss/oss/common/images//spacer.gif" + "\"" ;
        var var_onMouseDown = "\""  + "focus_Title(" + position + ");" + "\"" ;
        var var_onMouseUp = "\""  + "focus_Title(" + position + ");" + "\"" ;
        var var_onclick = "\""  + "snd.playSE(cSE_Decide);" + "\"" ;
        var var_onMouseOver = "\""  + "snd.playSE( cSE_Forcus );focus_Title(" + position + ");" + "\"" ;
        var var_onMouseOut = "\""  + "focusout_Title(" + position + ");" + "\"" ;
        titleUrlElem.innerHTML ="<img src=" + var_src + " width=\"273\" height=\"74\" border=\"0\"" + " onmousedown=" + var_onMouseDown + " onmouseup=" + var_onMouseUp + " onclick=" + var_onclick + " onmouseover=" + var_onMouseOver + " onmouseout=" + var_onMouseOut + " />";
    }

}
function hideRecommendedTitleURL(position)
{
    titleUrlElem = document.getElementById("titleUrl0" + position);
    if (titleUrlElem != null)
    {
        titleUrlElem.href = "";
        titleUrlElem.innerHTML = "";
    }
}

function showRecommendedTitle(title, position)
{
    var softElem;
    var titleUrlElem;
    var detailsElem;

        softElem = document.getElementById("soft0" + position);
        if (softElem != null && title.titleImage != null) {
            softElem.innerHTML="<img id='recImage0" + position + "' src='" + title.titleImage + "' width='72' height='54' border='0' hspace='9' vspace=10; />";
        } else {
             softElem.innerHTML="";
        }

        showRecommendedTitleURL(title,position);

        detailsElem = document.getElementById("details0" + position);
        if (detailsElem != null) {
            detailsElem.innerHTML = 
			'<span class="style13">' + title.nameFirstLine + '<br />' + title.nameSecondLine +
			'<br />' + title.price + ' Wii Points</span>';
	   }

        if (title.isNew == "true") {
           showElement("new0" + position);
        } else {
       	   hideElement("new0" + position);
       }
}

function showRecommendedTitles(titles, max)
{
  var i;
  var j=0;
  
  // Show recommended titles that we don't own
  for (i = 1; i <= titles.length; i++) {
    var title = titles[i];
    if (title != null && title.titleLicense == null && title.nameFirstLine!="[UNDELIVERABLE]") {
       // No license for this title, display
       j++;
       showRecommendedTitle(title, j);
       showElement("rec0" + j);
    }
    if (j >= max) {
	return;
    }
  }
  
  // Fill with titles that we do own
  for (i = 1; i <= titles.length; i++) {
    var title = titles[i];
    if (title != null && title.titleLicense != null && title.nameFirstLine!="[UNDELIVERABLE]") {
       j++;
       showRecommendedTitle(title, j);
       showElement("rec0" + j);
    }
    if (j >= max) {
    	return;
    }
  }
}

var flames_for_Arrow = 0;
var flames_for_fade = 0;

var mutex_animation_arrow=0;
var stop_animation_arrow_decide="not stop"
var state_scroll_titles = false;
var state_point_cursor = false;


var exist_left_arrow_flag=false;
var exist_right_arrow_flag=false;


function showRightArrow()
{
    if(exist_right_arrow_flag)
    {
        showElement("posRightArrowID");
    }
}
function showLeftArrow()
{
    if(exist_left_arrow_flag)
    {
        showElement("posLeftArrowID");
    }
}
function hideRightArrow()
{
    hideElement("posRightArrowID");
}
function hideLeftArrow()
{
    hideElement("posLeftArrowID");
}
function showStopRightArrow()
{
  var imageElem = document.getElementById("posStopRightArrowID");
    if(exist_right_arrow_flag)
    {
  imageElem.innerHTML="<img id='posStopRightArrowimageID' width='62' height='88' border='0' src='/oss/oss/common/images//banner/GifA_News_noAction.png' onMouseOver='pointonR(); play_SE_for_moving();' onMouseOut='pointout()' onMouseDown='pointonR()' onMouseUp='pointonR()' onClick='change_up_RecommendedTitles()' />";
    }
    else
    {
        imageElem.innerHTML="";
    }
}
function showStopLeftArrow()
{
  var imageElem = document.getElementById("posStopLeftArrowID");
    if(exist_left_arrow_flag)
    {
  imageElem.innerHTML="<img id='posStopLeftArrowimageID' width='62' height='88' border='0' src='/oss/oss/common/images//banner/GifA_News_noAction.png' onMouseOver='pointonL(); play_SE_for_moving();' onMouseOut='pointout()' onMouseDown='pointonL()' onMouseUp='pointonL()' onClick='change_down_RecommendedTitles()' />";
    }
    else
    {
        imageElem.innerHTML="";
    }
}
function hideStopRightArrow()
{
  var imageElem = document.getElementById("posStopRightArrowID");
    if(exist_right_arrow_flag)
    {
  imageElem.innerHTML="<img id='posStopRightArrowimageID' width='62' height='88' border='0' src='/oss/oss/common/images//banner/GifA_News_noAction.png' onMouseOver='pointonR(); play_SE_for_moving();' onMouseOut='pointout()' onMouseDown='pointonR()' onMouseUp='pointonR()' onClick='change_up_RecommendedTitles()' />";
    }
    else
    {
        imageElem.innerHTML="";
    }
}
function hideStopLeftArrow()
{
  var imageElem = document.getElementById("posStopLeftArrowID");
    if(exist_left_arrow_flag)
    {
  imageElem.innerHTML="<img id='posStopLeftArrowimageID' width='62' height='88' border='0' src='/oss/oss/common/images//banner/GifA_News_noAction.png' onMouseOver='pointonL(); play_SE_for_moving();' onMouseOut='pointout()' onMouseDown='pointonL()' onMouseUp='pointonL()' onClick='change_down_RecommendedTitles()' />";
    }
    else
    {
        imageElem.innerHTML="";
    }
}

function hide_elem(id)
{
    var Elem;
    Elem = document.getElementById(id);
    if(Elem != null)
    {
        hideElement("id");
    }
}
function clear_Title()
{
  hideElement("rec01");
  hideElement("rec02");
  hideElement("rec03");
  hideElement("rec04");
}
function move_fleeze_cursor()
{
  if(state_point_cursor && !state_scroll_titles)
  {
      state_point_cursor=false;
      start_animation_arrow();
  }
}

function focus_Header()
{
  clear_scroll_counter2();
  move_fleeze_cursor();
}

function focus_Title(position)
{
  clear_scroll_counter2();
  move_fleeze_cursor();
  var titleElem;
  titleElem = document.getElementById("softFocusImage0" + position);
  if(mutex_animation_arrow != 0 && titleElem != null)
  {
      var var_src = "\""  + "/oss/oss/common/images//banner/GifA_Soft_Over.png" + "\"" ;
      titleElem.innerHTML = "<img src=" + var_src + " width=\"273\" height=\"74\" border=\"0\"" + " />";
  }
}
function focusout_Title(position)
{
  var titleElem;
  titleElem = document.getElementById("softFocusImage0" + position);
  if(titleElem != null)
  {
      titleElem.innerHTML = "";
  }
}
function start_animation_arrow()
{
    if(mutex_animation_arrow==0)
    {
        mutex_animation_arrow++;
        stop_animation_arrow_decide="not stop"
        move_animation_arrow();
    }
}

function move_animation_arrow()
{
    flames_for_Arrow++;
    if(flames_for_Arrow>=79)
    {
        flames_for_Arrow=0;
    }

  var imageElemLeft = document.getElementById("posLeftArrowID");
  var imageElemRight = document.getElementById("posRightArrowID");
  if(stop_animation_arrow_decide == "left stop")
    {
        imageElemLeft.innerHTML="<img id='posLeftArrowimageID' border='0' src='/oss/oss/common/images//banner/top_L_arrow_S.png' />";
    }
  else if(stop_animation_arrow_decide == "right stop")
    {
        imageElemRight.innerHTML="<img id='posRightArrowimageID' border='0' src='/oss/oss/common/images//banner/top_R_arrow_S.png' />";
    }
  else if(flames_for_Arrow==0)
    {
        imageElemLeft.innerHTML="<img id='posLeftArrowimageID' border='0' src='/oss/oss/common/images//banner/top_L_arrow_00.png' />";
        imageElemRight.innerHTML="<img id='posRightArrowimageID' border='0' src='/oss/oss/common/images//banner/top_R_arrow_00.png' />";
    }
  else if(flames_for_Arrow==13)
    {
        imageElemLeft.innerHTML="<img id='posLeftArrowimageID' border='0' src='/oss/oss/common/images//banner/top_L_arrow_01.png' />";
        imageElemRight.innerHTML="<img id='posRightArrowimageID' border='0' src='/oss/oss/common/images//banner/top_R_arrow_01.png' />";
    }
  else if(flames_for_Arrow==20)
    {
        imageElemLeft.innerHTML="<img id='posLeftArrowimageID' border='0' src='/oss/oss/common/images//banner/top_L_arrow_02.png' />";
        imageElemRight.innerHTML="<img id='posRightArrowimageID' border='0' src='/oss/oss/common/images//banner/top_R_arrow_02.png' />";
    }
  else if(flames_for_Arrow==25)
    {
        imageElemLeft.innerHTML="<img id='posLeftArrowimageID' border='0' src='/oss/oss/common/images//banner/top_L_arrow_03.png' />";
        imageElemRight.innerHTML="<img id='posRightArrowimageID' border='0' src='/oss/oss/common/images//banner/top_R_arrow_03.png' />";
    }
  else if(flames_for_Arrow==30)
    {
        imageElemLeft.innerHTML="<img id='posLeftArrowimageID' border='0' src='/oss/oss/common/images//banner/top_L_arrow_04.png' />";
        imageElemRight.innerHTML="<img id='posRightArrowimageID' border='0' src='/oss/oss/common/images//banner/top_R_arrow_04.png' />";
    }
  else if(flames_for_Arrow==44)
    {
        imageElemLeft.innerHTML="<img id='posLeftArrowimageID' border='0' src='/oss/oss/common/images//banner/top_L_arrow_03.png' />";
        imageElemRight.innerHTML="<img id='posRightArrowimageID' border='0' src='/oss/oss/common/images//banner/top_R_arrow_03.png' />";
    }
  else if(flames_for_Arrow==59)
    {
        imageElemLeft.innerHTML="<img id='posLeftArrowimageID' border='0' src='/oss/oss/common/images//banner/top_L_arrow_02.png' />";
        imageElemRight.innerHTML="<img id='posRightArrowimageID' border='0' src='/oss/oss/common/images//banner/top_R_arrow_02.png' />";
    }
  else if(flames_for_Arrow==64)
    {
        imageElemLeft.innerHTML="<img id='posLeftArrowimageID' border='0' src='/oss/oss/common/images//banner/top_L_arrow_01.png' />";
        imageElemRight.innerHTML="<img id='posRightArrowimageID' border='0' src='/oss/oss/common/images//banner/top_R_arrow_01.png' />";
    }
  else if(flames_for_Arrow==71)
    {
        imageElemLeft.innerHTML="<img id='posLeftArrowimageID' border='0' src='/oss/oss/common/images//banner/top_L_arrow_00.png' />";
        imageElemRight.innerHTML="<img id='posRightArrowimageID' border='0' src='/oss/oss/common/images//banner/top_R_arrow_00.png' />";
    }

    var arrow_tag_Left = document.getElementById("posLeftArrowID");
    var arrow_tag_right = document.getElementById("posRightArrowID");
    if(flames_for_Arrow == 0){
        arrow_tag_Left.style.left = 15;
        arrow_tag_right.style.left = 537;
    } else if(flames_for_Arrow == 1){
        arrow_tag_Left.style.left = 16;
        arrow_tag_right.style.left = 536;
    } else if(flames_for_Arrow == 10){
        arrow_tag_Left.style.left = 17;
        arrow_tag_right.style.left = 535;
    } else if(flames_for_Arrow == 14){
        arrow_tag_Left.style.left = 18;
        arrow_tag_right.style.left = 534;
    } else if(flames_for_Arrow == 17){
        arrow_tag_Left.style.left = 19;
        arrow_tag_right.style.left = 533;
    } else if(flames_for_Arrow == 20){
        arrow_tag_Left.style.left = 20;
        arrow_tag_right.style.left = 532;
    } else if(flames_for_Arrow == 23){
        arrow_tag_Left.style.left = 21;
        arrow_tag_right.style.left = 531;
    } else if(flames_for_Arrow == 27){
        arrow_tag_Left.style.left = 22;
        arrow_tag_right.style.left = 530;
    } else if(flames_for_Arrow == 31){
        arrow_tag_Left.style.left = 23;
        arrow_tag_right.style.left = 529;
    } else if(flames_for_Arrow == 49){
        arrow_tag_Left.style.left = 22;
        arrow_tag_right.style.left = 530;
    } else if(flames_for_Arrow == 53){
        arrow_tag_Left.style.left = 21;
        arrow_tag_right.style.left = 531;
    } else if(flames_for_Arrow == 57){
        arrow_tag_Left.style.left = 20;
        arrow_tag_right.style.left = 532;
    } else if(flames_for_Arrow == 60){
        arrow_tag_Left.style.left = 19;
        arrow_tag_right.style.left = 533;
    } else if(flames_for_Arrow == 63){
        arrow_tag_Left.style.left = 18;
        arrow_tag_right.style.left = 534;
    } else if(flames_for_Arrow == 66){
        arrow_tag_Left.style.left = 17;
        arrow_tag_right.style.left = 535;
    } else if(flames_for_Arrow == 70){
        arrow_tag_Left.style.left = 16;
        arrow_tag_right.style.left = 536;
    }

    if(mutex_animation_arrow==1)
    {
        setTimeout(move_animation_arrow, 16);
    }
    else if(mutex_animation_arrow>1)
    {
        mutex_animation_arrow--;
    }
}

function stop_animation_arrow(position)
{
    clear_scroll_counter2();
    mutex_animation_arrow = 0;
    if(position == "Left")
    {
      stop_animation_arrow_decide="left stop"
    }
    else if(position == "Right")
    {
      stop_animation_arrow_decide="right stop"
    }

}

function pointonR()
{
    if(!state_scroll_titles && !state_point_cursor)
    {
        state_point_cursor = true;
        stop_animation_arrow("Right");
    }
}
function pointonL()
{
    if(!state_scroll_titles && !state_point_cursor)
    {
        state_point_cursor = true;
        stop_animation_arrow("Left");
    }
}
function pointout()
{
    if(!state_scroll_titles && state_point_cursor)
    {
        state_point_cursor = false;
        start_animation_arrow();
    }
}

function play_SE_for_moving()
{
    if(!state_scroll_titles)
    {
        snd.playSE( cSE_Forcus );
    }
}

function cleanup_focus_before_scroll()
{
    hideRecommendedTitleURL(1);
    hideRecommendedTitleURL(2);
    hideRecommendedTitleURL(3);
    hideRecommendedTitleURL(4);
    focusout_Title(1);
    focusout_Title(2);
    focusout_Title(3);
    focusout_Title(4);
}

function change_up_RecommendedTitles()
{
    if(TitleListNumbers == 0 || (TitleListNumbers==1 && TitleListNumber_now!=0) )
        {return;}
    if(!arrowforcedislight_flag)
    {
        stop_animation_arrow("Right");
    }
    if(!state_scroll_titles)
    {
        state_scroll_titles=true;
        snd.playSE(cSE_Decide);
        cleanup_focus_before_scroll();
        flames_for_fade=0;
        fadeout_image_lefts();
    }
}

function change_down_RecommendedTitles()
{
    if(TitleListNumbers == 0 || (TitleListNumbers==1 && TitleListNumber_now==0) )
        {return;}
    if(!arrowforcedislight_flag)
    {
        stop_animation_arrow("Left");
    }
    if(!state_scroll_titles)
    {
        state_scroll_titles=true;
        snd.playSE(cSE_Decide);
        cleanup_focus_before_scroll();
        flames_for_fade=0;
        fadeout_image_rights();
    }
}

function change_header_style(left_position_absolute_for_recroot_css, top_position_absolute_for_recroot_css)
{
    var header=document.getElementById("txtSoftList");
    header.style.left=left_position_absolute_for_recroot_css;
    header.style.top=top_position_absolute_for_recroot_css;
    header=document.getElementById("SoftListSpacer");
    header.style.left=left_position_absolute_for_recroot_css;
    header.style.top=top_position_absolute_for_recroot_css;
}
function change_image_style(left_position_absolute_for_recroot_css, top_position_absolute_for_recroot_css)
{
    var root=document.getElementById("recroot");
    root.style.left=left_position_absolute_for_recroot_css;
    root.style.top=top_position_absolute_for_recroot_css;
}

function time_distortion(t)
{
    return Math.pow(t,0.25);
}
const total_fadeout_flames=12;
const total_fadein_flames=7;
const reproduced_fadeout_flames=12;
const reproduced_fadein_flames=6;

function fadeout_image_lefts()
{
    if(flames_for_fade<=0)
    {
        change_image_style( 18, 70);
        change_header_style( 29, 25);
    }
    else if(flames_for_fade==1)
    {
        change_image_style( 17, 70);
        change_header_style( 28, 25);
    }
    else if(flames_for_fade==2)
    {
        change_image_style( 13, 70);
        change_header_style( 24, 25);
    }
    else if(flames_for_fade==3)
    {
        change_image_style( -2, 70);
        change_header_style( 9, 25);
    }
    else if(flames_for_fade==4)
    {
        change_image_style( -37, 70);
        change_header_style( -26, 25);
    }
    else if(flames_for_fade==5)
    {
        change_image_style( -98, 70);
        change_header_style( -87, 25);
    }
    else if(flames_for_fade==6)
    {
        change_image_style( -185, 70);
        change_header_style( -174, 25);
    }
    else if(flames_for_fade==7)
    {
        change_image_style( -288, 70);
        change_header_style( -277, 25);
    }
    else if(flames_for_fade==8)
    {
        change_image_style( -393, 70);
        change_header_style( -382, 25);
    }
    else if(flames_for_fade==9)
    {
        change_image_style( -482, 70);
        change_header_style( -471, 25);
    }
    else if(flames_for_fade==10)
    {
        change_image_style( -541, 70);
        change_header_style( -530, 25);
    }
    else
    {
        change_image_style( -873, 70);
        change_header_style( -862, 25);
    }

    if(flames_for_fade < reproduced_fadeout_flames)
    {
        setTimeout(fadeout_image_lefts, 16);
    }
    else
    {
        flames_for_fade=0;
        TitleListNumber_now=get_Rightposition();
        refresh_Titleshow();
        fadein_image_rights();
    }
    flames_for_fade++;
}

function fadeout_image_rights()
{
    if(flames_for_fade<=0)
    {
        change_image_style( 18, 70);
        change_header_style( 29, 25);
    }
    else if(flames_for_fade==1)
    {
        change_image_style( 19, 70);
        change_header_style( 30, 25);
    }
    else if(flames_for_fade==2)
    {
        change_image_style( 23, 70);
        change_header_style( 34, 25);
    }
    else if(flames_for_fade==3)
    {
        change_image_style( 38, 70);
        change_header_style( 49, 25);
    }
    else if(flames_for_fade==4)
    {
        change_image_style( 74, 70);
        change_header_style( 85, 25);
    }
    else if(flames_for_fade==5)
    {
        change_image_style( 135, 70);
        change_header_style( 146, 25);
    }
    else if(flames_for_fade==6)
    {
        change_image_style( 221, 70);
        change_header_style( 232, 25);
    }
    else if(flames_for_fade==7)
    {
        change_image_style( 325, 70);
        change_header_style( 232, 25);
    }
    else if(flames_for_fade==8)
    {
        change_image_style( 430, 70);
        change_header_style( 441, 25);
    }
    else if(flames_for_fade==9)
    {
        change_image_style( 519, 70);
        change_header_style( 530, 25);
    }
    else if(flames_for_fade==10)
    {
        change_image_style( 578, 70);
        change_header_style( 589, 25);
    }
    else if(flames_for_fade==11)
    {
        change_image_style( 604, 70);
        change_header_style( 615, 25);
    }
    else
    {
        change_image_style( 612, 70);
        change_header_style( 623, 25);
    }

    if(flames_for_fade < reproduced_fadeout_flames)
    {
        setTimeout(fadeout_image_rights, 16);
    }
    else
    {
        flames_for_fade=0;
        TitleListNumber_now=get_Leftposition();
        refresh_Titleshow();
        fadein_image_lefts();
    }
    flames_for_fade++;
}
function focus_adjust(t)
{
    if(t==0)
    {
        focusout_Title(1);
        focusout_Title(2);
        focusout_Title(3);
        focusout_Title(4);
    }
}
function fadein_image_rights()
{
    focus_adjust(flames_for_fade);

    if(flames_for_fade>=6)
    {
        change_image_style( 18, 70);
        change_header_style( 29, 25);
    }
    else if(flames_for_fade==5)
    {
        change_image_style( 19, 70);
        change_header_style( 30, 25);
    }
    else if(flames_for_fade==4)
    {
        change_image_style( 23, 70);
        change_header_style( 34, 25);
    }
    else if(flames_for_fade==3)
    {
        change_image_style( 38, 70);
        change_header_style( 49, 25);
    }
    else if(flames_for_fade==2)
    {
        change_image_style( 74, 70);
        change_header_style( 85, 25);
    }
    else if(flames_for_fade==1)
    {
        change_image_style( 135, 70);
        change_header_style( 146, 25);
    }
    else
    {
        change_image_style( 221, 70);
        change_header_style( 232, 25);
    }

    if(flames_for_fade < 6)
    {
        setTimeout(fadein_image_rights, 16);
    }
    else
    {
        state_scroll_titles=false;
        state_point_cursor = false;
        start_animation_arrow();
        clear_scroll_counter();
        refresh_Titleshow();
        setTimeout(add_scroll_counter, 16);
    }
    flames_for_fade++;
}

function fadein_image_lefts()
{
    focus_adjust(flames_for_fade);
    if(flames_for_fade>=6)
    {
        change_image_style( 18, 70);
        change_header_style( 29, 25);
    }
    else if(flames_for_fade==5)
    {
        change_image_style( 17, 70);
        change_header_style( 28, 25);
    }
    else if(flames_for_fade==4)
    {
        change_image_style( 13, 70);
        change_header_style( 24, 25);
    }
    else if(flames_for_fade==3)
    {
        change_image_style( -2, 70);
        change_header_style( 9, 25);
    }
    else if(flames_for_fade==2)
    {
        change_image_style( -37, 70);
        change_header_style( -26, 25);
    }
    else if(flames_for_fade==1)
    {
        change_image_style( -98, 70);
        change_header_style( -87, 25);
    }
    else
    {
        change_image_style( -185, 70);
        change_header_style( -174, 25);
    }

    if(flames_for_fade < 6)
    {
        setTimeout(fadein_image_lefts, 16);
    }
    else
    {
        state_scroll_titles=false;
        state_point_cursor = false;
        start_animation_arrow();
        clear_scroll_counter();
        refresh_Titleshow();
        setTimeout(add_scroll_counter, 16);
    }
    flames_for_fade++;
}

function initPage()
{
    // for Debug always true
    var shop = new wiiShop; 
  if ( shop.isCompatibleMode ) {
    var dom_obj=document.getElementById("cssbutton");
    if (dom_obj!=null){
    var dom_obj_parent=dom_obj.parentNode;
    dom_obj_parent.removeChild(dom_obj);
    }

    dom_obj=document.getElementById("shopwithcssbutton");
    if (dom_obj!=null){
    dom_obj.style.left = "123px";
    dom_obj.style.width = "375px";
    }
    dom_obj=document.getElementById("txtGoShoppingwithCss");
    if (dom_obj!=null){
    dom_obj.style.width = "352px";
    dom_obj.style.left = "0px";
    }
    dom_obj=document.getElementById("idGoShop");
    if (dom_obj!=null){
    dom_obj.style.width = "352px";
    }
    dom_obj=document.getElementById("idGoShopspacer");
    if (dom_obj!=null){
    dom_obj.style.width = "352px";
    }

  }

    trace("initPage in W_01.jsp");
    initPageCommon();

    // Show white wall paper
    if (shop && "setWallpaper" in shop) {
      shop.setWallpaper(cWP_White);
    }

    var previousDisplayedListName;
    if (ecSupportsSession()) {
        previousDisplayedListName = ec.getSessionValue("previousDisplayedListName");
        ec.setSessionValue("previousDisplayedListName", null);
        if(previousDisplayedListName == null){
            previousDisplayedListName = "recommended";
        }
    }

    MM_preloadImages('/oss/oss/common/images//banner/GifA_Soft_Press.png',
            '/oss/oss/common/images//banner/GifA_Soft_Over.png',
            '/oss/oss/common/images//banner/GifA_Soft_noAction.png',
            '/oss/oss/common/images//banner/GifA_GoShop_Over.png',
            '/oss/oss/common/images//banner/Ambassador_GoShop_Over.png',
            '/oss/oss/common/images//banner/ambassador_in_welcome_a.png',
            '/oss/oss/common/images//banner/ambassador_in_welcome_b.png',
            '/oss/oss/common/images//banner/icr_in_welcome_a_E.png',
            '/oss/oss/common/images//banner/icr_in_welcome_b_E.png',
            '/oss/oss/common/images//banner/GifA_GoShop_noAction.png',
            '/oss/oss/common/images//banner/GifA_SoftList_Press.png',
            '/oss/oss/common/images//banner/GifA_SoftList_Over.png',
            '/oss/oss/common/images//banner/GifA_SoftList_noAction.png',
            '/oss/oss/common/images//banner/NEW_en.gif',
            '/oss/oss/common/images//banner/GifA_News_Press.png',
            '/oss/oss/common/images//banner/GifA_News_Over.png',
            '/oss/oss/common/images//banner/GifA_News_noAction.png',
            '/oss/oss/common/images//banner/top_L_arrow_00.png',
            '/oss/oss/common/images//banner/top_L_arrow_01.png',
            '/oss/oss/common/images//banner/top_L_arrow_02.png',
            '/oss/oss/common/images//banner/top_L_arrow_03.png',
            '/oss/oss/common/images//banner/top_L_arrow_04.png',
            '/oss/oss/common/images//banner/top_L_arrow_S.png',
            '/oss/oss/common/images//banner/top_R_arrow_00.png',
            '/oss/oss/common/images//banner/top_R_arrow_01.png',
            '/oss/oss/common/images//banner/top_R_arrow_02.png',
            '/oss/oss/common/images//banner/top_R_arrow_03.png',
            '/oss/oss/common/images//banner/top_R_arrow_04.png',
            '/oss/oss/common/images//banner/top_R_arrow_S.png');

    init_title(previousDisplayedListName);


    if (ecSupportsSession()) {
	ec.setSessionValue("giftStatus", null);
    }

    if (snd && "playBGM" in snd) {
        snd.playBGM();
    }

    
    setupIcrButton();

    setTimeout(add_scroll_counter, 10);
}

function setupIcrButton() 
{
    
            if ( getICRUserStatus() == "ACTIVATED" ) {
                hideElement("banner");
                hideElement("txtGoShopping");
                hideElement("bannerspacer");
            } else {
                hideElement("icrButton");
                hideElement("shopWithIcrButton");
            }
        
}

function kdown()
{
	var _code = event.keyCode;
	switch(_code)
	{

		case 178:
			change_down_RecommendedTitles();
			break;

		case 177:
			change_up_RecommendedTitles();
			break;

	}
}
function clear_scroll_counter()
{
	scroll_counter=0;
}
function clear_scroll_counter2()
{
	scroll_counter=-SCROLL_STOP_PLUS;
}
function add_scroll_counter()
{

    if(scroll_counter>SCROLL_COUNT)
    {
        flames_for_fade=0;
        clear_scroll_counter();
        arrowforcedislight_flag=true;
        if(moveleft_flag)
        {
            change_down_RecommendedTitles();
        }
        else
        {
            change_up_RecommendedTitles();
        }
        arrowforcedislight_flag=false;
    }
    if(!state_scroll_titles)
    {
        scroll_counter++;
    }
    if(!state_scroll_titles)
    {
            setTimeout(add_scroll_counter, 160);
    }
}

//-->
</script>
</head>

<body link="black" vlink="black" alink="black" onkeypress="kdown();" onload="initPage();" style="overflow: hidden;">
<div id="bg"><img src="/oss/oss/ext/attributes/images/back/Welcome_BG_E.png" width="608" height="456" border="0" onmouseover="move_fleeze_cursor();" /></div>

<div id="posLeftArrowID" class="posLeftArrow">
<img id="posLeftArrowimageID" border='0'
	        src="/oss/oss/common/images//banner/top_L_arrow_00.png" />
</div>
<div id="posRightArrowID" class="posRightArrow">
<img id="posRightArrowimageID" border='0'
	        src="/oss/oss/common/images//banner/top_R_arrow_00.png" />
</div>

<div id="posStopLeftArrowID" class="posStopLeftArrow">
<img id="posLeftArrowimageID" border='0'
	        src="/oss/oss/common/images//banner/GifA_News_noAction.png" />
</div>
<div id="posStopRightArrowID" class="posStopRightArrow">
<img id="posRightArrowimageID" border='0'
	        src="/oss/oss/common/images//banner/GifA_News_noAction.png" />
</div>

<div id="recroot">
  <div id="rec01" style="">
      <div id="soft01" class="posTitleSoft"></div>
      <div align="left" id="new01" class="posTitleNew" style="display:none"> <img src="/oss/oss/common/images//banner/NEW_en.gif"></div>
      <div id="softShadow01" class="posTitleSoftShadow"><span class="btnSoft"><img name="btnSoft01" src="/oss/oss/common/images//banner/GifA_Soft_noAction.png" class="btnSoft" border="0" /></span></div>
      <div id="softSpacer01" class="posTitleSoftSpacer"><a id="titleUrl01" href=""></a></div>
      <div id="softFocusImage01" class="posTitleSoftFocusImage"></div>
      <div id="details01" class="posTitleDetails" nowrap><span class="style13"></span></div>
  </div>
  <div id="rec02" style="">
      <div id="soft02" class="posTitleSoft"></div>
      <div align="left" id="new02" class="posTitleNew" style="display:none"> <img src="/oss/oss/common/images//banner/NEW_en.gif"></div>
      <div id="softShadow02" class="posTitleSoftShadow"><span class="btnSoft"><img name="btnSoft02" src="/oss/oss/common/images//banner/GifA_Soft_noAction.png" class="btnSoft" border="0" /></span></div>
      <div id="softSpacer02" class="posTitleSoftSpacer"><a id="titleUrl02" href=""></a></div>
      <div id="softFocusImage02" class="posTitleSoftFocusImage"></div>
      <div id="details02" class="posTitleDetails" nowrap><span class="style13"></span></div>
  </div>
  <div id="rec03" style="">
      <div id="soft03" class="posTitleSoft"></div>
      <div align="left" id="new03" class="posTitleNew" style="display:none"> <img src="/oss/oss/common/images//banner/NEW_en.gif"></div>
      <div id="softShadow03" class="posTitleSoftShadow"><span class="btnSoft"><img name="btnSoft03" src="/oss/oss/common/images//banner/GifA_Soft_noAction.png" class="btnSoft" border="0" /></span></div>
      <div id="softSpacer03" class="posTitleSoftSpacer"><a id="titleUrl03" href=""></a></div>
      <div id="softFocusImage03" class="posTitleSoftFocusImage"></div>
      <div id="details03" class="posTitleDetails" nowrap><span class="style13"></span></div>
  </div>
  <div id="rec04" style="">
      <div id="soft04" class="posTitleSoft"></div>
      <div align="left" id="new04" class="posTitleNew" style="display:none"> <img src="/oss/oss/common/images//banner/NEW_en.gif"></div>
      <div id="softShadow04" class="posTitleSoftShadow"><span class="btnSoft"><img name="btnSoft04" src="/oss/oss/common/images//banner/GifA_Soft_noAction.png" class="btnSoft" border="0" /></span></div>
      <div id="softSpacer04" class="posTitleSoftSpacer"><a id="titleUrl04" href=""></a></div>
      <div id="softFocusImage04" class="posTitleSoftFocusImage"></div>
      <div id="details04" class="posTitleDetails" nowrap><span class="style13"></span></div>
  </div>
</div>
<div id="info01n" align="center">
        <script language="JavaScript">if ('[NEW]Reminder: Wii Shop Closes Jan. 30, 2019'.indexOf('[NEW]', 0) != -1) {document.write('<img src="/oss/oss/common/images//banner/NEW_en.gif"> ');};</script>
      </div>
      <div id="info01">
        <div nowrap align="left" class="txt_info">
          <script language="JavaScript">document.write('Catalog updated! Games added March 26.'.replace('[NEW]', ''));</script>
        </div>
      </div>
      <div id="infoShadow01"><img src="/oss/oss/common/images//spacer.gif" border="0" name="info01s" /></div>
      <div id="infoSpacer01"><a href="javascript:showPage('W_02.jsp?p=3')"><img src="/oss/oss/common/images//spacer.gif" width="514" height="25" border="0" onMouseDown="MM_swapImage('info01s','','/oss/oss/common/images//banner/GifA_News_Press.png',1);" onMouseUp="MM_swapImage('info01s','','/oss/oss/common/images//banner/GifA_News_Over.png',1)" onClick="snd.playSE(cSE_Decide);" onmouseover="snd.playSE( cSE_Forcus ); MM_swapImage('info01s','','/oss/oss/common/images//banner/GifA_News_Over.png',1);move_fleeze_cursor();" onMouseOut="MM_swapImage('info01s','','/oss/oss/common/images//banner/GifA_News_noAction.png',1);" /></a></div>

      <div id="info02n" align="center">
        <!--<script language="JavaScript">if ('[NEW]Reminder: Wii Shop Closes Jan. 30, 2019'.indexOf('[NEW]', 0) != -1) {document.write('<img src="/oss/oss/common/images//banner/NEW_en.gif"> ');};</script>-->
      </div>
      <div id="info02">
        <div nowrap align="left" class="txt_info">
          <script language="JavaScript">document.write('[NEW] Welcome to WiiMart!'.replace('[NEW]', ''));</script>
        </div>
      </div>
      <div id="infoShadow02"><img src="/oss/oss/common/images//spacer.gif" border="0" name="info02s" /></div>
      <div id="infoSpacer02"><a href="javascript:showPage('W_02.jsp?p=1')"><img src="/oss/oss/common/images//spacer.gif" width="514" height="25" border="0" onMouseDown="MM_swapImage('info02s','','/oss/oss/common/images//banner/GifA_News_Press.png',1);" onMouseUp="MM_swapImage('info02s','','/oss/oss/common/images//banner/GifA_News_Over.png',1)" onClick="snd.playSE(cSE_Decide);" onmouseover="snd.playSE( cSE_Forcus ); MM_swapImage('info02s','','/oss/oss/common/images//banner/GifA_News_Over.png',1);move_fleeze_cursor();" onMouseOut="MM_swapImage('info02s','','/oss/oss/common/images//banner/GifA_News_noAction.png',1);" /></a></div>

      <!--<div id="info03n" align="center">
        <script language="JavaScript">if ('[NEW]Reminder: Wii Shop Closes Jan. 30, 2019'.indexOf('[NEW]', 0) != -1) {document.write('<img src="/oss/oss/common/images//banner/NEW_en.gif"> ');};</script>
      </div>
      <div id="info03">
        <div nowrap align="left" class="txt_info">
          <script language="JavaScript">document.write('[NEW] Catalog fully updated!'.replace('[NEW]', ''));</script>
        </div>
      </div>
      <div id="infoShadow03"><img src="/oss/oss/common/images//spacer.gif" border="0" name="info03s" /></div>
      <div id="infoSpacer03"><a href="javascript:showPage('W_02.jsp?p=3')"><img src="/oss/oss/common/images//spacer.gif" width="514" height="25" border="0" onMouseDown="MM_swapImage('info03s','','/oss/oss/common/images//banner/GifA_News_Press.png',1);" onMouseUp="MM_swapImage('info03s','','/oss/oss/common/images//banner/GifA_News_Over.png',1)" onClick="snd.playSE(cSE_Decide);" onmouseover="snd.playSE( cSE_Forcus ); MM_swapImage('info03s','','/oss/oss/common/images//banner/GifA_News_Over.png',1);move_fleeze_cursor();" onMouseOut="MM_swapImage('info03s','','/oss/oss/common/images//banner/GifA_News_noAction.png',1);" /></a></div>-->
    <div id="SofList01"><img src="/oss/oss/common/images//banner/GifA_SoftList_noAction.png" name="SofList"/></div>
<div id="txtSoftList" align="center">
    <span class="style1">WiiMart</span>
    <span class="style2">Recommended Titles</span>
</div>
<div id="SoftListSpacer">
    <a id="headerURL" href="javascript:showPage('B_04.jsp?p=1&rec=true')">
        <img src="/oss/oss/common/images//spacer.gif" width="551" height="42" border="0" 
            onMouseDown="MM_swapImage('SofList','','/oss/oss/common/images//banner/GifA_SoftList_Press.png',1);focus_Header();" 
            onMouseUp="MM_swapImage('SofList','','/oss/oss/common/images//banner/GifA_SoftList_Over.png',1);focus_Header();" 
            onMouseOver="MM_swapImage('SofList','','/oss/oss/common/images//banner/GifA_SoftList_Over.png',1); snd.playSE( cSE_Forcus );move_fleeze_cursor();focus_Header();" 
            onMouseOut="MM_swapImage('SofList','','/oss/oss/common/images//banner/GifA_SoftList_noAction.png',1);" 
            onClick="snd.playSE(cSE_Decide);" 
        />
    </a>
</div>


<div class="style4" id="txtNews">
    <div align="center" valign="middle" class="style15">Important Info:</div>
</div>



<!--<div id="icrButton">
            <div class="bannerShopwithCss"> <img src="/oss/oss/common/images//banner/icr_in_welcome_a_E.png" width="231" height="64" border="0" name="GoIcr">
            </div>
            <div class="cssStyle" id="txtGoIcr">
                <div style="display:table;height:100%;z-index:4;" class="h_block_middle">
                    <div class="tcell v_middle_h_inline_left">
                        One Free Title</div>
                </div>

            </div>
            <div id="bannerSpacerIcr">
                <a href="javascript:showPage('S_30.jsp')" 
                    onClick="snd.playSE(cSE_Decide);" 
                    onMouseOver="snd.playSE( cSE_Forcus ); MM_swapImage('GoIcr','','/oss/oss/common/images//banner/icr_in_welcome_b_E.png',1);move_fleeze_cursor();" 
                    onMouseOut="MM_swapImage('GoIcr','','/oss/oss/common/images//banner/icr_in_welcome_a_E.png',1);">
                        <img src="/oss/oss/common/images//spacer.gif" width="231" height="64" border="0">
                </a>
            </div>
        </div>
        <div id="shopWithIcrButton"> <div class="bannerShopwithCss">
                <img src="/oss/oss/common/images//banner/Ambassador_GoShop_noAction.png" width="302" height="64" border="0" name="GoShop2">
            </div>
            <div class="shopWithCssStyle" id="txtGoShoppingWithIcr">
                <span class="tcell vh_inline_middle">
                    Start Shopping</span>
            </div>
            <div id="bannerSpacerShopWithIcr">
                <a href="javascript:showPage('W_03.jsp')" 
                onClick="snd.playSE(cSE_Decide);" 
                onMouseOver="snd.playSE( cSE_Forcus ); MM_swapImage('GoShop2','','/oss/oss/common/images//banner/Ambassador_GoShop_Over.png',1);move_fleeze_cursor();" 
                onMouseOut="MM_swapImage('GoShop2','','/oss/oss/common/images//banner/Ambassador_GoShop_noAction.png',1);">
                    <img src="/oss/oss/common/images//spacer.gif" width="302" height="64" border="0">
                </a>
            </div>
        </div>-->
<div id="banner">
            <img src="/oss/oss/common/images//banner/GifA_GoShop_noAction.png" border="0" name=GoShop>
        </div>
        <div class="style5" id="txtGoShopping" align="center">
            Start Shopping</div>
        <div id="bannerspacer">
            <a href="/oss/serv/W_03.jsp" 
            onClick="snd.playSE(cSE_Decide);" 
            onMouseOver="snd.playSE( cSE_Forcus ); MM_swapImage('GoShop','','/oss/oss/common/images//banner/GifA_GoShop_Over.png',1);move_fleeze_cursor();" 
            onMouseOut="MM_swapImage('GoShop','','/oss/oss/common/images//banner/GifA_GoShop_noAction.png',1);">
                <img src="/oss/oss/common/images//spacer.gif" width="352" height="56" border="0">
            </a>
        </div>
    <div id="layer"></div>
<div id="layer2"></div>
<button onclick="replacePage('W_03.jsp')">sdf</button>
</body>
</html>

