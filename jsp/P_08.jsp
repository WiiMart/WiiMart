<%@ page import = "java.io.*,java.util.*" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %><a href="https://oss-auth.blinklab.com/oss/serv/debug.jsp">debug</a>



<%@ page buffer="8192kb" autoFlush="true" %>
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
	
	
<title>WiiMart</title>
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
	

	ecsUrl = 'https://ecs.blinklab.com/oss/ecs/services/ECommerceSOAP';

	iasUrl = 'https://ias.blinklab.com/oss/ias/services/IdentityAuthenticationSOAP';

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
<style type="text/css">
  /* P_08:  Credit Card Input */

#P_08-text01-01 {
	position:absolute;
	left:29px;
	top:28px;
	width:442px;
	height:28px;
	z-index:38;
}
#P_08-text02-01 {
	/* credit card information prompt */
	position:absolute;
	left:110px;
	top:86px;
	width:420px;
	height:35px;
	z-index:27;
}
#cardicon {
	position:absolute;
	left:34px;
	top:88px;
	width:62px;
	height:58px;
	z-index:64;
}
#creditCardNumber {
	position:absolute;
	top:153px;
	height:30px;
}
#creditCard_Field {
	position:absolute;
	left:304px;
	width:200px;
	height:100%;
	z-index:22;
}
#creditCard_word {
	position:absolute;
	text-align:center;
	left:50px;
	top:7px;
	width:210px;
	z-index:22;
}
#expirationDate_word {
	position:absolute;
	text-align:center;	
	left:50px;
	top:7px;
	width:210px;
	z-index:22;
}
#expirationDate {
	position:absolute;
	top:235px;
}
#expirationMonth {
	position:absolute;
	left:330px;
	z-index:30;
}
#expirationYear {
	position:absolute;
	left:460px;
	z-index:30;
}
.arrowUp {
	position:absolute;
	top:-40px;
	width:64px;
	height:38px;
	z-index:32;
}
.arrowUpShadow {
	position:absolute;
	left:-13px;
	top:-48px;
	width:90px;
	height:57px;
	z-index:31;
}
.arrowDown {
	position:absolute;
	top:33px;
	width:64px;
	height:38px;
	z-index:32;
}
.arrowDownShadow {
	position:absolute;
	left:-13px;
	top:25px;
	width:90px;
	height:57px;
	z-index:31;
}
#expirationFieldMM {
	position:absolute;
	width:64px;
	z-index:34;
}
#expirationFieldYY {
	position:absolute;
	width:64px;
	z-index:34;
}
#securityCode {
	position:absolute;
	top:300px;
	height:40px;
}
#securityCode_Field {
	position:absolute;
	left:304px;
	top:24px;
	width:80px;
	height:18px;
	z-index:31;
}
#securityCode_word {
	position:absolute;
	text-align:center;
	left:50px;
	top:4px;
	width:210px;
	height:18px;
	z-index:32;
}


#securityCodeButton {
	position:absolute;
	left:30px;
	top:328px;
	width:255px;
	height:40px;
	z-index:35;
}
#securityCodeButtonTxt {
	position:absolute;
	text-align:center;
	width:255px;
	height:40px;
	z-index:36;
}
#securityCodeButtonBanner {
	position:absolute;
	z-index:35;
}
#securityCodeButtonSpacer {
	position:absolute;
	z-index:37;
}

#securityStatementButton {
	position:absolute;
	left:410px;
	top:321px;
	width:180px;
	height:47px;
	z-index:35;
}
#securityStatementBtnBanner {
	position:absolute;
	z-index:35;
}
#securityStatementBtnSpacer {
	position:absolute;
	z-index:37;
}
#securityStatementBtnWord {
	position:absolute;
	text-align:center;
	width:180px;
	height:35px;
	z-index:36;
}



.inputTypeA {
	font-family: "Wii NTLG Gothic JPN Regular";
	font-size: 18px;
	background-color: #FFFFFF;
	text-align: left;
	padding-left: 10px;
	letter-spacing: 0.1em;
}

.inputTypeC {
	font-family: "Wii NTLG Gothic JPN Regular";
	font-size: 18px;
	background-color: #FFFFFF;
	text-align: center;
	letter-spacing: 0.1em;
}
/* P_09:  Security Code Explanation */

#P_09-text01-01 {
	position:absolute;
	left:29px;
	top:28px;
	width:442px;
	height:28px;
	z-index:38;
}
#P_09-text02-01 {
	/* heading for security code page */
	position:absolute;
	left:33px;
	top:80px;
	width:542px;
	height:16px;
	z-index:34
}
#P_09-text03-01 {
	/* Text explaining security code */
	position:absolute;
	left:240px;
	top:110px;
	width:330px;
	height:220px;
	z-index:35
}
#P_09-cardImg {
	position:absolute;
	left:48px;
	top:137px;
	width:190px;
	height:115px;
	z-index:34;
}

/* P_10:  Credit Card Address Input */

#P_10-text02-01 {
	/* address information prompt */
	position:absolute;
	left:90px;
	top:84px;
	width:380px;
	height:35px;
	z-index:40;
}
/*
   P_10-text03-01   :	City
   P_10-text04-01/02: 	State/Province
   P_10-text05-01/02:	Zip/Postal Code
   P_10-text06-01   :	County
*/
#Address   {position:absolute; left:77px; top:140px; width:455px; height:210px; z-index:30;}
/* US Address Fields (Template 'A') */
#CntyField {position:absolute; top:172px; }
#ZipField  {position:absolute; top:120px; }
#SteField  {position:absolute; top: 70px; }
#CityField {position:absolute; top: 17px; }


/* Postal Code Only (Template Other) */
#postalCode {position:absolute;  top: 70px; }

/* Postal & Province (Template 'B') */
#province         {position:absolute;  top: 70px; }
#postalCodeCanada {position:absolute;  top: 120px; }


.addressTxt {
	position:absolute;
	text-align: center;
	left:12px;
	width:150px;
	height:28px;
	z-index:31; 
}

.addressInput {
	position:absolute;
	left:202px;
	top:-5px;
	width:220px;
	height:28px;
	z-index:32; 
}


.inputTypeB {
	font-family: "Wii NTLG Gothic JPN Regular";
	font-size: 18px;
	background-color: #FFFFFF;
	text-align: left;
	padding-left: 10px;
}
/* P_16:  Security Statement */

/* P_16 info */
#P_16-text01-01 {
	position:absolute;
	left:29px;
	top:28px;
	width:442px;
	height:28px;
	z-index:38;
}
#P_16-text02-01 {
	position:absolute;
	left:29px;
	top:77px;
	width:545px;
	height:18px;
	z-index:40;
}

#P_16-text03-01 {
	position:absolute;
	left:39px;
	top:113px;
	width:525px;
	height:246px;
	z-index:40;
}
</style>
<SCRIPT language="JavaScript" src="/oss/oss/common/js//ChkCard.js"></SCRIPT>
<script type="text/javascript">


var cardNum, codeNum, expDate, expMonth;
var showingExplain = 0;
var showingAddress = 0;
var showingStatement = 0;
var currentError = "";
var submitted = false;

var region = '<%= request.getParameter("region") %>';
var country = '<%= request.getParameter("country") %>';
var countryEUR = false;
if (region == "EUR" && country != "AU" && country != "NZ") {
	countryEUR = true;
}

var cardType = '<%= request.getParameter("cardType") %>';

var errorMessages = new Array();

function initPage()
{

	initPageCommon();
	var encryptedInfo = encryptCC();
	document.getElementById("currentBalance").innerHTML = getBalance();
	trace("postParams::" + getPostParams());
	trace('itemId=<%= request.getParameter("itemId") %>')
	MM_preloadImages('/oss/oss/common/images//banner/under_banner_b.gif',
			 '/oss/oss/common/images//banner/help_b.gif',
			 '/oss/oss/common/images//banner/top_b.gif',
			 '/oss/oss/common/images//banner/option_b.gif',
			 '/oss/oss/common/images//banner/arrowUp_b.gif',
			 '/oss/oss/common/images//banner/arrowDw_b.gif');

	errorMessages["invalidCardType"] = new Array(OSS_ERROR_CREDIT_CARD_TYPE, 'This credit-card number is invalid.<BR><BR>Please verify the information and try again.');
	errorMessages["invalidCardNumber"] = new Array(OSS_ERROR_INVALID_NUMBER, 'This credit-card number is invalid.<BR><BR>Please verify the information and try again.');
	errorMessages["formSubmitted"] = new Array(OSS_ERROR_IN_PROGRESS, '???OSS_ERROR_IN_PROCESS???');
	errorMessages["emptyVfyValue"] = new Array(OSS_ERROR_NO_SECURITY_CODE, 'Please enter the three-digit security code.');
	
	setUnderButtonL(true, "Back", "javascript:back()", "if(snd) snd.playSE(cSE_Cancel)");
	setUnderButtonR(true, "OK", "javascript:showAddress()", "if(snd) snd.playSE(cSE_Decide)");
	
	var textH = document.getElementById("securityStatementBtnWord").offsetHeight;
	if (textH > 20) {
		document.getElementById("securityStatementBtnWord").style.top='7px';
	}
	
	disableWiiPointButton();

	initCardIcon();
	initFields(document.cardInfo);

	if (cardType == 'J') { 
		hideElement("securityCodeButton");
		hideElement("securityCode");
		document.getElementById("cardVfyVal").value = '000';
	}


}

	
function alert(msg) 
{
	trace("alert: " + msg);
}


function increaseMonth()
{
	var month = document.getElementById("cardExpMM").value;
	month++;
	
	if(month < 1)
		month = 1;
	if(month > 12)
		// month = 12;
		month = 1;
	
	document.getElementById("cardExpMM").value = month;
}

function decreaseMonth()
{
	var month = document.getElementById("cardExpMM").value;
	month--;
	
	if(month < 1)
		// month = 1;
		month = 12;
	if(month > 12)
		month = 12;
	
	document.getElementById("cardExpMM").value = month;
}

function increaseYear()
{
	var year = document.getElementById("cardExpYY").value;
	year++;
	
	if(year < 2009)
		year = 2009;
	if(year > 2099)
		year = 2099;
	
	document.getElementById("cardExpYY").value = year;
}

function decreaseYear()
{
	var year = document.getElementById("cardExpYY").value;
	year--;
	
	if(year < 2009)
		year = 2009;
	if(year > 2099)
		year = 2099;
	
	document.getElementById("cardExpYY").value = year;
}


function validateNumbers()
{
	var rc = true;
	var cardNum  = document.getElementById("cardNumber").value;
	var codeNum  = document.getElementById("cardVfyVal").value;
	var expMonth = document.getElementById("cardExpMM").value;
	var expYear  = document.getElementById("cardExpYY").value;

	if (isNaN(cardNum) || cardNum.length != 16) {
		//error msg ???CC_ERROR_INVALID_NUMBER???
		showError("invalidCardNumber");
		rc = false;
	} else if (CheckCardNumber(document.cardInfo) == false) {
		showError("invalidCardType");
		rc = false;
	} else if (codeNum.length != 3) {
		// In Europe, CVV is necessary from Dec 1 2008.
		showError("emptyVfyValue");
		rc = false;
	}

	//return rc;
	//Fake card
	return true;
}

function encryptCC()
{
	//var cardNum  = document.getElementById("cardNumber").value;
	//var codeNum  = document.getElementById("cardVfyVal").value;
	//var expMonth = document.getElementById("cardExpMM").value;
	//var expYear  = document.getElementById("cardExpYY").value;

	var cardNum  = "4007000000027";
	var codeNum  = "234";
	var expMonth = "08";
	var expYear  = "25";

	var encryptStr = cardNum+'|'+expMonth+'|'+expYear+'|'+codeNum;
	var encryptedInfo = ec.pubKeyEncrypt(encryptStr);
	trace("###########################"+encryptedInfo);
	trace("encryptedInfo: " + encryptedInfo);
	return encryptedInfo;
}

function initCardIcon()
{
	var imageName = "card";
	switch (cardType)
	{
		case 'V':
			imageName += "03";
			break;
		case 'M':
			imageName += "02";
			break;
		case 'J':
			imageName += "01";
			break;
	}
	imageName += "_icon.gif";
		
	var icon = document.getElementById("cardicon");
	if(icon) {
		icon.src="/oss/oss/common/images//banner/" + imageName;
	}
}

function selectYear(){
    var d = new Date();
    var n = d.getFullYear();
    if (n < 2014) {
        n = 2014;
    }
    return String(n);
}

function initFields(form)
{
    var d = new Date();
    var n = String(d.getFullYear());
	form.cardExpMM.value = '1';
	form.cardExpYY.value = selectYear();
	
	form.cardNumber.value = '';
	form.cardVfyVal.value = '';


	if (form.cc_city != null) {
		form.cc_city.value = '';
	}
	if (form.cc_state != null) {
		form.cc_state.value = '';
	}
	if (form.cc_postal != null) {
		form.cc_postal.value = '';
	}
	if (form.cc_county != null) {
		form.cc_county.value = '';
	}
	
	
	initCommonFields("commonFields");
}


function back()
{
	if(showingExplain)
		closeExplain();
	else if(showingAddress)
		closeAddress();
	else if(showingStatement)
		closeStatement();
	else {
		returnToCardType();
	}
}

function returnToCardType()
{
	var form = document.createElement("form");
	form.action = getSecureUrl("P_07.jsp");
//	form.method = "post";
	form.id = "return07Form";
	form.innerHTML = "";
	form.innerHTML += '<div id="commonFields2"></div>';
	form.innerHTML += '<input type="hidden" name="pointsValue" value="' + '<%= request.getParameter("pointsValue") %>' + '"/>';
	form.innerHTML += '<input type="hidden" name="pointsCost" value="' + '<%= request.getParameter("pointsCost") %>' + '"/>';
	form.innerHTML += '<input type="hidden" name="itemId" value="' + '<%= request.getParameter("itemId") %>' + '"/>';
	form.innerHTML += '<input type="hidden" name="currency" value="' + '<%= request.getParameter("currency") %>' + '"/>';
	document.body.appendChild(form);
	initCommonFields('commonFields2');
	form.submit();
}
function showError(errorName)
{
	var returnFunction = "";
	hideP_08();
	hideElement("P_08-text02-01");
	hideElement("addressInfo");
	setErrorMsg(errorMessages[errorName][0], errorMessages[errorName][1]);
	
	if(errorName == "invalidCardType")
		returnFunction = "javascript:returnToCardType();";
	else
		returnFunction = "javascript:hideError();";
	
	
	setUnderButtonL(false);
	setUnderButtonR(false);
	setUnderButton(true, "Try Again", returnFunction, 'if(snd) snd.playSE(cSE_Cancel);');
}

function hideError()
{
	if(showingAddress) {
		showElement("addressInfo");
	}
	else {
		showP_08();
		showElement("P_08-text02-01");
	}
	setErrorMsg(null, null);
	
	setUnderButtonL(true);
	setUnderButtonR(true);
	setUnderButton(false);
}

function hideP_08()
{
	hideElement("cardfields");
	hideElement("securityCodeButton");
	hideElement("securityStatementButton");
}

function showP_08()
{
	showElement("cardfields");
	if (cardType == 'J') { 
		hideElement("securityCodeButton");
		hideElement("securityCode");
		document.getElementById("cardVfyVal").value = '000';
	} else {
		showElement("securityCodeButton");
	}
	showElement("securityStatementButton");
}

function showExplain()
{
	hideP_08();
	hideElement("P_08-text");
	showElement("secExplain");
	setUnderButtonR(false);
	showingExplain = 1;
}

function closeExplain()
{
	showP_08();
	showElement("P_08-text");
	hideElement("secExplain");
	setUnderButtonR(true);
	showingExplain = 0;
}

function showAddress()
{
	var needInput = true;
	//Skip checking if numbers are even correct
	document.getElementById("cardInfo").submit();
	return;
	

	if(showingAddress) {
		if (submitted == false) {
			submitted = true;
			disableTopHelpElements();	
				
			var encryptedInfo = encryptCC();
			var encryptedInfoField = document.getElementById("encryptedInfo");
			encryptedInfoField.innerHTML = '<input type="hidden" name="cardEncrypted" value="' + encryptedInfo + '"/>';
			
			var paymentMethodIdField = document.getElementById("paymentMethodId");
			var cardNum  = document.getElementById("cardNumber").value;
			var paymentMethodId = cardNum.substring(12,16);
			paymentMethodIdField.innerHTML = '<input type="hidden" name="paymentMethodId" value="' + paymentMethodId + '"/>';

			document.getElementById("cardExpMM").value = '';
			document.getElementById("cardExpYY").value = '';
			document.getElementById("cardNumber").value = '';
			document.getElementById("cardVfyVal").value = '';
						
			document.getElementById("cardInfo").submit();
		} else {
//			showError("formSubmitted");
		}
	}
	else if(needInput) {
		/* check values */
		if (validateNumbers()) {
			hideP_08();
			hideElement("P_08-text02-01");
			showElement("addressInfo");
			showingAddress=1;
		}
		else {
			/* TODO if values not correct; error here? */
		
		}
	}
	else {
		/* do not need input, submit */
		if(validateNumbers()) {
			var encryptedInfo = encryptCC();
			var encryptedInfoField = document.getElementById("encryptedInfo");
			encryptedInfoField.innerHTML = '<input type="hidden" name="cardEncrypted" value="' + encryptedInfo + '"/>';
			
			var paymentMethodIdField = document.getElementById("paymentMethodId");
			var cardNum  = document.getElementById("cardNumber").value;
			var paymentMethodId = cardNum.substring(12,16);
			paymentMethodIdField.innerHTML = '<input type="hidden" name="paymentMethodId" value="' + paymentMethodId + '"/>';

			document.getElementById("cardExpMM").value = '';
			document.getElementById("cardExpYY").value = '';
			document.getElementById("cardNumber").value = '';
			document.getElementById("cardVfyVal").value = '';
					
			document.getElementById("cardInfo").submit();
		}
	}
}

function closeAddress()
{	
	showP_08();
	showElement("P_08-text02-01");
	hideElement("addressInfo");
	showingAddress=0;
}


function showStatement()
{
	hideP_08();
	hideElement("P_08-text");
	showElement("secStatement");
	setUnderButtonR(false);
	showingStatement = 1;
}

function closeStatement()
{
	showP_08();
	showElement("P_08-text");
	hideElement("secStatement");
	setUnderButtonR(true);
	showingStatement = 0;
}

function fieldBackColorFocus(field)
{
//	if(showingAddress)
//		field.style.backgroundColor='#FFCCFF';
//	else
		field.style.backgroundColor='#E6E6E6';
}

function fieldBackColorRestore(field)
{
	field.style.backgroundColor='#FFFFFF';
}
//-->
</script>
<script type="text/JavaScript" src='/oss/oss/common/js//keyboard.js'></script>
</head>

<body onload="initPage();var shop = new wiiShop();var unused = shop.connecting;">
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
  
  <div id='balanceInfo' onclick="showPoints(); wiiSelectSound();" 
   onmouseover="MM_swapImage('PointSpacer','','/oss/oss/common/images//banner/Addpoints_everywhere.gif',1);wiiFocusSound();" 
   onmouseout="MM_swapImgRestore();">
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
<div align="left" class="warningRed" id="errorCodeText" style="display:none">
    Error Code: <span id="errorCodePlaceholder"></span></div>

<div align="left" class="contentsRedM" id="errorText" style="display:none">
     <span id="errorTextPlaceholder"></span>
</div><div id="P_08-text">
    <div style="text-align:left;font-size:12px;">Transaction Country: United States of America</div><div id="P_08-text01-01" class="titleBlackL">Wii Points Purchase</div>
    <div id="P_08-text02-01" class="catalogTitleBlack_01">Please enter your credit-card information.<BR>(Your credit-card information will be sent over a secure connection.)</div>
</div>

<!-- P_09 data: security code explaination (Note, return button is also changed for this) -->
<div id="secExplain" style="display:none">
    <div id="P_09-text01-01" align="left" class="titleBlackL">
    	Credit-Card Purchase</div>
    <div id="P_09-text02-01" align="center">
    	<span class="headerBlueL">What&rsquo;s a security code?</span></div>
    <div id="P_09-text03-01" class="contentsBlack">
    	<p>Credit-card companies provide a special three-digit number that is printed on the back of your credit card. This is provided as an extra security measure to help detect fraudulent use of your credit-card account.<BR><BR>With MasterCard and Visa, this code is printed on the back of the card in the signature area.<BR><BR>Please note we only use the security code you provide to validate this transaction. This is not stored permanently in our records.</p>
    </div>
    <img id="P_09-cardImg" src='/oss/oss/common/images//banner/credit_back01.gif' width="100%" height="100%" />
</div>

<!--  P_16 data:  security statement -->
<div id="secStatement" style="display:none">
    <div id="P_16-text01-01" align="left" class="titleBlackL">
    	Credit-Card Purchase</div>
    <div id="P_16-text02-01">
	<div align="left" class="headerBlueM">Credit-Card Security Statement</div>
    </div>
    <div class="catalogTitleBlack_01" id="P_16-text03-01">
    	Our secure servers encrypt credit-card data transmitted and stored for your WiiMart purchases. All such encrypted information is maintained and processed by both Nintendo of America Inc. and our trusted third-party credit-card processors on secure computers that are not accessible from the Internet.</div>
</div>

<div id="securityStatementButton">
    <div id="securityStatementBtnBanner">
    	<img src='/oss/oss/common/images//banner/option_a.gif' width="180" height="47" id="statementImg" /></div>
    <div id="securityStatementBtnSpacer">
    	<img src='/oss/oss/common/images//spacer.gif' width="180" height="47" border="0" id="statementButton" 
    	onmouseover="MM_swapImage('statementImg','','/oss/oss/common/images//banner/option_b.gif',1); if(snd)snd.playSE( cSE_Forcus );"
    	onmouseout="MM_swapImgRestore()" onclick="showStatement(); if(snd) snd.playSE(cSE_Decide);"/></div>
    <div class="contentsBlack" id="securityStatementBtnWord" align="center">
      <table height="100%" width="100%" align="center"><tr><td valign="middle" align="center" height="100%" width="100%">
        Security Statement</td></tr></table>
    </div>
</div>


<div id="securityCodeButton">
    <div id="securityCodeButtonBanner">
    	<img src='/oss/oss/common/images//banner/option_a.gif' width="255" height="40" id="secExplainImg" /></div>
    <div id="securityCodeButtonSpacer">
	<img src='/oss/oss/common/images//spacer.gif' width="255" height="40" border="0" id="explainButton" 
	onmouseover="MM_swapImage('secExplainImg','','/oss/oss/common/images//banner/option_b.gif',1); if(snd)snd.playSE( cSE_Forcus );"
	onmouseout="MM_swapImgRestore()" onclick="showExplain(); if(snd) snd.playSE(cSE_Decide);" /></div>
    <div class="contentsBlack" id="securityCodeButtonTxt" align="center">
      <table height="100%" width="100%" align="center"><tr><td valign="middle" align="center" height="100%" width="100%">
        What&rsquo;s a security code?</td></tr></table>
    </div>
</div>

<div id="disclaimer" style="font-weight:normal;position:absolute; left:110px; top:137px; text-align:center; font-size:11px; color:#868686;  ">
  Don't enter any credit card info here!!! (it wont take it anyways and will ignore your input)</div>
</div>

<!-- all inputs have been set to only allow 1 number/letter (no info can be put in.) -->
<form id="cardInfo" method="POST" name="cardInfo" action="https://oss-auth.blinklab.com/oss/serv/P_12.jsp">
<div id="cardfields">
    <img id="cardicon" width="100%" height="100%" />
    <div id="commonFields"></div>
    
    <input type="hidden" name="itemId"   value='<%= request.getParameter("itemId") %>' />
    <input type="hidden" name="points"   value='<%= request.getParameter("pointsValue") %>' /> 
    <input type="hidden" name="price"    value='<%= request.getParameter("pointsCost") %>' />
    <input type="hidden" name="currency" value='<%= request.getParameter("currency") %>' /> 
    <input type="hidden" name="cardType" value='<%= request.getParameter("cardType") %>' /> 

    <div id="creditCardNumber">
    	<div id="creditCard_word" class="contentsBlackM bold">Credit-Card Number</div>
	<div id="creditCard_Field" >
	    	<input type="text" class="inputTypeA inputStyle" name="cardNumber" id="cardNumber" maxLength="1" size="24"
	    	onmouseover="fieldBackColorFocus(this); if(snd) snd.playSE( cSE_Forcus );" onmouseout="fieldBackColorRestore(this);"
	    	onmousedown="if(kbd) kbd.call( cKT_NumSep );"/>
    	</div>
    </div>

    <div id="expirationDate">
	<div id="expirationDate_word" class="contentsBlackM bold">Expiration Date</div>
	
	<div id="expirationMonth">
	<center>
	    <img src='/oss/oss/common/images//banner/arrowUp_a.gif' onmouseout="MM_swapImgRestore()"
		onmouseover="MM_swapImage('expMonthUpArrow','','/oss/oss/common/images//banner/arrowUp_b.gif', 1); wiiFocusSound();"
		onclick="increaseMonth()" class="arrowUp" id="expMonthUpArrow"/>
		<img src='/oss/oss/common/images//banner/top_help_shadow02.gif' class="arrowUpShadow"/>
		<img src="/oss/oss/common/images//banner/arrowDw_a.gif" onmouseout="MM_swapImgRestore()"
		onmouseover="MM_swapImage('expMonthDownArrow','','/oss/oss/common/images//banner/arrowDw_b.gif', 1); wiiFocusSound();"
		onclick="decreaseMonth()" class="arrowDown" id="expMonthDownArrow"/>
		<img src='/oss/oss/common/images//banner/top_help_shadow02.gif' class="arrowDownShadow"/>

		<div id="expirationFieldMM">
			<input type="text" class="inputTypeC inputStyle" name="cardExpMM" id="cardExpMM" maxlength="2" size="2" 
			readonly="readonly""/>
		</div>
	</center>
	</div>
       
	<div id="expirationYear">
	    <center>
	    <img src='/oss/oss/common/images//banner/arrowUp_a.gif' onmouseout="MM_swapImgRestore()"
		onmouseover="MM_swapImage('expYearUpArrow','','/oss/oss/common/images//banner/arrowUp_b.gif', 1); wiiFocusSound();"
		onclick="increaseYear()" class="arrowUp"   id="expYearUpArrow"/>
	    <img src='/oss/oss/common/images//banner/top_help_shadow02.gif' class="arrowUpShadow"/>
	    
	    <img src="/oss/oss/common/images//banner/arrowDw_a.gif" onmouseout="MM_swapImgRestore()"
	    	onmouseover="MM_swapImage('expYearDownArrow','','/oss/oss/common/images//banner/arrowDw_b.gif', 1); wiiFocusSound();"
		onclick="decreaseYear()" class="arrowDown" id="expYearDownArrow"/>
	    <img src='/oss/oss/common/images//banner/top_help_shadow02.gif' class="arrowDownShadow"/>
	    
	    <div id="expirationFieldYY">
		<input type="text" class="inputTypeC inputStyle" name="cardExpYY" id="cardExpYY" maxlength="4" size="4"
		   readonly="readonly""/>
	    </div>
	    </center>
 	</div>
   
    </div>

	<div id="securityCode">
		<div id="securityCode_Field">
			<input type="text" class="inputTypeA inputStyle" name="cardVfyVal" id="cardVfyVal" maxLength="1" size="4"
			onmouseover="fieldBackColorFocus(this);wiiFocusSound();" onmouseout="fieldBackColorRestore(this);"
			onmousedown="if(kbd) kbd.call(cKT_Num);" />
		</div>
		<div id="securityCode_word">
			<div class="contentsBlackM bold">Security Code</div>
		</div>
	</div>

    <div id="encryptedInfo">
    </div>

    <div id="paymentMethodId">
    </div>
</div>

<!-- P_10 data: address information (Note, return button and ok button change functionality) -->
<div id="addressInfo" style="display:none">
    <div id="P_10-text02-01">
      <div class="catalogTitleBlack">Please enter the following information from your credit-card billing address.</div>
    </div>

    <div id="Address">
    <div id="CityField">
		<div id="CityTxt" class="buttonTextBlackM addressTxt">City</div>
		<div id="CityInput" class="addressInput">
		    <input type="text" name="cc_city" class="inputTypeB inputStyle" size="27" maxlength="1" onmousedown="if(kbd) kbd.call( cKT_NoLFS);"
		    onmouseover="fieldBackColorFocus(this);snd.playSE( cSE_Forcus );" onmouseout="fieldBackColorRestore(this);"/>
   		</div>
   	    </div>

	    <div id="SteField">
		<div id="SteTxt" class="buttonTextBlackM addressTxt">State</div>
		<div id="SteInput" class="addressInput">
		    <input type="text" name="cc_state" class="inputTypeB inputStyle" size="27" maxlength="1" onmousedown="if(kbd) kbd.call( cKT_LNoLFS);"
		    onmouseover="fieldBackColorFocus(this);snd.playSE( cSE_Forcus );" onmouseout="fieldBackColorRestore(this);"/>
		</div>
	    </div>

	    <div id="ZipField">
		<div id="ZipTxt" class="buttonTextBlackM addressTxt">Zip</div>
		<div id="ZipInput" class="addressInput">
		    <input type="text" name="cc_postal" class="inputTypeB inputStyle" size="27" maxlength="1" onmousedown="if(kbd) kbd.call( cKT_Num);"
		    onmouseover="fieldBackColorFocus(this);snd.playSE( cSE_Forcus );" onmouseout="fieldBackColorRestore(this);"/>
		</div>
   	    </div>

	    <div id="CntyField">
		<div id="CntyTxt" class="buttonTextBlackM addressTxt">County</div>
		<div id="CntyInput" class="addressInput"><input type="text" name="cc_county" class="inputTypeB inputStyle" size="27" maxlength="1"
		onmouseover="fieldBackColorFocus(this);snd.playSE( cSE_Forcus );" onmouseout="fieldBackColorRestore(this);"
   		onmousedown="if(kbd) kbd.call( cKT_NoLFS);"/></div>
   	    </div>
	</div>
</div>
</form>
</body>
</html>