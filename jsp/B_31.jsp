<%@ page import = "java.io.*,java.util.*,javax.servlet.*" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %><a href="https://oss-auth.blinklab.com/oss/serv/debug.jsp">debug</a>



<%
    String param = request.getParameter("titleId");
    RequestDispatcher dispatcher = request.getRequestDispatcher("/serv/titleId/" + param + "/B_31.jsp");
    dispatcher.forward(request, response);
%>
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
<!-- Title name -->
<!-- Controller image and message -->
<!-- Release Date -->	
<!-- Number of players -->
<!-- Title Rating Images -->
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
/* B_31:  Redeem Campaign Code Confirmation */


#ownedtitle {
	position:absolute;
	left:160px;
	top:313px;
	width:282px;
	height:18px;
	z-index:33;
}

#redeemed {
	position:absolute;
	left:160px;
	top:313px;
	width:282px;
	height:18px;
	z-index:33;
}

#buybanner2 {
	position:absolute;
	left:160px;
	top:307px;
	width:290px;
	height:42px;
	z-index:32;
}

#progressBar {
	position:absolute;
	left:120px;
	top:100px;
	width:400px;
}

#ownedNotRedeemedError {
	position:absolute;
	left:50px;
	top:89px;
	width:500px;
	height:46px;
	z-index:28;
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

#redeemConfirm {
	margin:0;
	padding:0;
}

#B_31 {
	position:absolute;
	left:0px;
	top:0px;
	width:608px;
	height:456px;
	margin:0;
	padding:0;
	overflow: hidden;
}
</style>
<script language="JavaScript" src="/oss/oss/common/js//shopsd.js"></script>
<SCRIPT language="JavaScript" src="/oss/oss/common/js//title_manager.js"></SCRIPT>
<script type="text/javascript">
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
var sdErrorMessage = ['An SD Card process failed.',
                      'An SD Card process failed.',
                      'An SD Card process failed.',
                      'An SD Card process failed.',
                      'An SD Card process failed.',
                      'An SD Card process failed.',
                      'An SD Card process failed.',
                      'An SD Card process failed.',
                      'An SD Card process failed.',
                      'An SD Card process failed.',
                      'An SD Card process failed.',
                      'An SD Card process failed.',
                      'An SD Card process failed.',
                      'An SD Card process failed.',
                      'An SD Card process failed.',
                      'An SD Card process failed.',
                      'An SD Card process failed.',
                      'Nothing is inserted in the SD Card slot.',
                      'The device inserted in the<BR>SD Card slot can&rsquo;t be used.',
                      'The device inserted in the<BR>SD Card slot can&rsquo;t be used.',
                      'The SD Card is locked. To save,<BR>move, or erase data, please<BR>unlock the SD Card.',
                      'An SD Card process failed.',
                      'An SD Card process failed.',
                      'An SD Card process failed.',
                      'There is not enough available space in Wii system memory.<BR>Create '+0+' block(s) of free space either by moving data to an SD Card or deleting data in the Wii console&rsquo;s Data Management screen.',
                      'This data already exists on the SD Card.<BR><BR>Please delete the data on the Wii Console&rsquo;s Data Management screen.',
                      'An SD Card process failed.',
                      '',
                      '',
                      '',
                      'This data already exists in Wii system memory.<BR><BR>Please delete the data on the Wii console&rsquo;s Data Management screen.',
                      'There are no empty channels available on your Wii Menu. Go to the Channel Management screen and move channels to an SD Card or delete channels.',
                      'You do not have enough free space in your system memory to download this software. Use Data Management to move data to an SD Card or delete any unnecessary data.',
                      'An SD Card process failed.',
                      'An SD Card process failed.',
                      'An SD Card process failed.',
                      'There is not enough available space in Wii system memory.<BR>Create '+0+' block(s) of free space either by moving data to an SD Card or deleting data in the Wii console&rsquo;s Data Management screen.' ];
<!--
var titleId = '';
var titleSize = '';
var titleTmdSize = '';
var latestVersion = parseInt('');

var titleManager = new TitleManager(titleId, titleSize, titleTmdSize, latestVersion);

var itemId = '';
var price = new ECPrice('', 
	              '');
var passParentalControl = '';
var defaultError = "An error has occurred while redeeming your Wii Download Ticket.<BR><BR>Visit support.nintendo.com for assistance.";
var notRedeemed = true;
var onlyDownload = false;
var displayMsg = false;
var errors = 0;
var isShowBack = false;

var titleSizeKB = titleManager.getTitleKBSize();
var titleSizeBlock = 0;
var redownloadFlagExt;

function initPage()
{
	if (ecSupportsSession()) {
		isShowBack = (ec.getSessionValue("history.showBack") != null);
    }
	initPageCommon();
    MM_preloadImages('/oss/oss/common/images//banner/help_b.gif',
            '/oss/oss/common/images//banner/top_b.gif',
            '/oss/oss/common/images//banner/under_banner_b.gif',
            '/oss/oss/common/images//banner/buy_b.gif',
            '/oss/oss/common/images//banner/buy_c.gif',
            '/oss/oss/common/images//banner/controller_msg2_E_en.gif',
            '/oss/oss/common/images//banner/sdToSD_a.png',
            '/oss/oss/common/images//banner/sdToSD_b.png',
            '/oss/oss/common/images//banner/sdToNAND_a.png',
            '/oss/oss/common/images//banner/sdToNAND_b.png',
            '/oss/oss/common/images//banner/B01_halfbanner_a.png',
            '/oss/oss/common/images//banner/B01_halfbanner_b.png',
            '/oss/oss/common/images//banner/AgeRating_a.gif',
            '/oss/oss/common/images//banner/AgeRating_b.gif');
	disableWiiPointButton();

    // Debug mode (please comment out this block when using for release)
    // showElement("SD_Error_Debug");




    if (ecSupportsSession()) {
        var firstTitleDetailDisplay = ec.getSessionValue("firstTitleDetailDisplay");
        if(firstTitleDetailDisplay=='true'){
            trace("firstTitleDetailDisplay");
            if(hasProgressFinished()!=0){
                var shopErrCheck = new wiiShop();
                shopErrCheck.error(209657, 1);
                return;
            }
            ec.setSessionValue("firstTitleDetailDisplay",'false');
        }
    }



	errors = 1;
	handleErrors();


	if(!errors) {
		notRedeemed = checkNotRedeemed();
		var continueToB31 = preChecking();
		if (continueToB31) {
		    showB31()
		}
	}
}

function showB31()
{
    wiiDisableHRP();
    setUnderButton(false);
    showElement("B_31");
	if (passParentalControl) {
	    redeem();
	    return;
	}
	showElement("progressBar");
	showElement("redeemConfirm");
	if (!displayMsg) {
	    showElement("gcButton");
	}
			
	var isFreeIntroEnabled = '';
	if (isFreeIntroEnabled=="true") {
	    setUnderButtonR(true, "More Details", "javascript:showPage('ext/B_30.jsp?titleId=')", "wiiSelectSound()");
	} else {
	    setUnderButtonR(true, "More Details", "javascript:showPage('B_06.jsp?titleId=')", "wiiSelectSound()");
	}
	setUnderButtonL(true, "Back", "javascript:showOldPage('S_14.jsp')", "wiiCancelSound()");
			
	wiiEnableHRP();
}


// returns false if card balance == 0
function checkNotRedeemed()
{
	var cardBalance = '';
	if(cardBalance > 0)
		return true;
	else {
		return false;
	}
}


function displayError(code, errorTxt)
{
	setErrorMsg(code, errorTxt);
	hideElement("redeemConfirm");
	hideElement("progressBar");

	setUnderButton(true, "OK", "javascript:showBack()", "wiiCancelSound()");
	setUnderButtonR(false);
	setUnderButtonL(false);
}

function handleProgressError(progress)
{
	var code;
	var errorTxt = defaultError;
	var tempError;
	if(progress) {
		code = getOssErrorCode(progress);
		tempError = getOssErrorMsg(progress);
		if(tempError != null && tempError != "") {
			errorTxt = tempError;
		}
		
		// enableTopHelpElements();
		displayError(code, errorTxt);
	}
	else {
		// enableTopHelpElements();
		handleErrors();
	}
}

function handleErrors()
{
	var code = 0;
	var errorTxt = defaultError;
	var tempError;

	code = '206601';
	
	tempError = getWebServiceErrorMsg(code - OSS_WS_ERROR_RANGE_START);
	if(tempError != null && tempError != "") {
		errorTxt = tempError;
	}

	displayError(code, errorTxt);
}

function handleError(progress)
{
    var currentBalance = getBalance();
    trace("handleError \n");
    setConnectingToServer(false);
    document.getElementById("rcvHead").innerHTML="Redeeming process failed.";
    hideElement("redeemConfirm");
    var errMsg = getOssErrorMsg(progress);
    var errCode = getOssErrorCode(progress);
		
    document.getElementById("text03-01").style.display='';
    document.getElementById("text03-01").style.top='162px';

  if(errCode == 205540 && shop.isCompatibleMode)
  {
    document.getElementById("text03-01").innerHTML=
        '<div align="center"><span class="contentsRedM">'+
        "Error Code: <span id='errorCode'></span><br>" +
        'This software is not available on the Wii U console.<BR>Please use this Wii Download Ticket on a Wii console.</span></div>';
    document.getElementById("OKBtnAnchor").href='javascript:showGamecardScreen();';
  }
  else
  {
    document.getElementById("text03-01").innerHTML=
        '<div align="center"><span class="contentsRedM">'+
        "Error Code: <span id='errorCode'></span><br>" +
        'Please wait a moment and try again.</span></div>';


    document.getElementById("OKBtnAnchor").href='javascript:shop.retry()';

    document.getElementById("OKBtnWord").innerHTML="Try Again";
  }

    document.getElementById("errorCode").innerHTML = errCode;
    document.getElementById("bannerL").style.display='';
    document.getElementById("wordL").style.display='';
    document.getElementById("bannershadow").style.display='';


        setUnderButtonL(true, 'Main Page', "javascript:showHome()", "wiiCancelSound()");

    trace("status: " + progress.status + ", phase: " + progress.phase);


    document.getElementById("spacerL").style.display='';
}


function purchaseTitle()
{
    var msg;
    if (titleId == null) {
    	setErr ( "ERROR: purchaseTitleWithECard:  No selected title");
    } else {
	hideElement("redeemConfirm");
	showElement("redeeming");
	trace("title id is " + titleId);
    	trace("Item id is " + itemId);
    	var downloadContent = false;
        var eCard = new ECECardPayment ();
        eCard.number = '';
        var limits = new ECTitleLimits();
	var i = 0;
	var limit;
	
	limits.length = i;
        var progress = ec.purchaseTitle (titleId, itemId, price, eCard, limits, downloadContent);
                                                 
      	opName  = "Purchase Title with ECard";
        opDesc  = "Purchasing Title  " + titleId;
        finishOp(opName, opDesc, progress, "onPurchaseDone");
    }
}

function getTitleLimit(limitCode, limitValue)
{
	var titleLimit = new ECTitleLimit(limitCode, limitValue);
	return titleLimit;		
}

function onPurchaseDone (progress)
{
	trace("onPurchaseDone\n");
	wiiEnableHRP();
	showResult (progress, opName, opDesc);
	if(progress.status >= 0) {
		if (ecSupportsSession()) {
			ec.setSessionValue("gameCardNum", null);
		}
		document.getElementById("rcvHead").innerHTML="The Wii Download Ticket has been redeemed!";
		goDownload();
	} else {
		handleError(progress);		
	}
}


function showSDSelection()
{
    document.getElementById("text01-01").innerHTML = 'Download Location';
    hideElement("details");
    hideElement("sdErrorDiv");
    hideElement("sdErrorNoSizeDiv");
    hideElement("gcButton");
    hideElement("redeeming");
    setUnderButton(false);
    setUnderButtonR(false);
    setUnderButtonL(false);
    showElement("sdbuttons");

    if (!nonSDSupport) {
        checkSDIsInserted();
    }
}

var innerCheckSDIsInserted = makeCheckSDIsInserted();
function checkSDIsInserted(){
    if(document.getElementById("sdbuttons").style.display == 'none'){
        return;
    }
    innerCheckSDIsInserted();
    setTimeout('checkSDIsInserted()', ecProgressInterval);
}

function onNANDButtonPressed(titleId, itemId)
{
    goDownload('N');
}

function onSDButtonPressed(titleId, itemId)
{
    titleSizeBlock = titleManager.getSDBackupBlocks();
    if(!sdDLErrorHandle(titleId, titleSizeKB,'')){
        return;
    }
    goDownload('Y');
}

function getSDError(sdError)
{
    var sdErrorCode = (sdError * -1) + 209630;
    hideElement("sdbuttons");
    setErrorMsg(sdErrorCode, sdErrorMessage[(sdError * -1) - 1]);
    showElement("sdErrorDiv");
    setUnderButtonL(true, "Back", "javascript:showSDSelection()", "wiiCancelSound()");
}

function getErrorNoSize(sdError)
{
    // No block = -25, No free channel = -32, No i-nodes = -33, title is in SD = -26, title is in NAND = -31
    sdErrorMessage[24] = 'There is not enough available space on the SD Card to download this software. Either create '+titleSizeBlock+' block(s) of free space in the Wii console&rsquo;s Data Management<BR>screen, or insert a different SD Card with '+titleSizeBlock+' block(s) of free space.';
    sdErrorMessage[36] = 'There is not enough available space in Wii system memory.<BR>Create '+titleSizeBlock+' block(s) of free space either by moving data to an SD Card or deleting data in the Wii console&rsquo;s Data Management screen.';
    hideElement("sdbuttons");
    showElement("sdErrorNoSizeDiv");
    document.getElementById("sdErrorNoSizeDivMsg").innerHTML = sdErrorMessage[(sdError * -1) - 1];

    if (!nonSDSupport) {
        setUnderButtonL(true, "Back", "javascript:showSDSelection()", "wiiCancelSound()");
        setUnderButton(true, "Data Management", 'javascript:showDataMng("/startup?initpage=showTitle&titleId='+titleId+'")', "wiiSelectSound()");
    } else {
        setUnderButtonL(false);
        setUnderButton(true, shop.menuBtn, "javascript:showWiiMenu()", "wiiSelectSound()");
    }
}

var nonSDSupport = nonSDSupport();

var passChecking = false;
function goDownload(sd)
{
    if (sd == null) {
        if (nonSDSupport) {
            showSDSelection();
            onNANDButtonPressed(titleId, itemId);
            return;
        } else {
            showSDSelection();
            return;
        }
    }

    passChecking = false;
    if (!passChecking) { // if pass checking in onGiftButtonPressed, no check anymore
    	doChecking(sd, 'sdcheck');
    	if (!passChecking)
	    	return;
    }

	var titleCaution1 = '';
	var titleCaution2 = '';
	var titleCaution3 = '';
	var caution1Url = 'B_08.jsp';
	var caution2Url = 'B_28.jsp';
	var caution3Url = 'B_29.jsp';
	var downloadTitleUrl = 'B_09.jsp';
	var nextUrl;
	if (titleCaution1 == "true") {
		nextUrl = caution1Url;
	} else if (titleCaution2 == "true") {
		nextUrl = caution2Url;
	} else if (titleCaution3 == "true") {
		nextUrl = caution3Url;
	} else {
		nextUrl = downloadTitleUrl;
	}
	nextUrl = addParam(nextUrl, 'titleId', titleId);
	nextUrl = addParam(nextUrl, 'itemId', itemId);
	nextUrl = addParam(nextUrl, 'SD', sd);
		
	if (ecSupportsSession()) {
		ec.setSessionValue("useCampaignCode", "true");
		trace("setting useCampaignCode: true");
	}
	
	showPage(nextUrl);	
}

// Show B-31 for not redeemed title.
function showB31NotRedeemedTitle()
{
    hideElement("ownedNotRedeemedError");
	showB31();			
}

// Show error page saying your card has not been redeemed, but you already own the title.
// Click ok to continue to title.  Click back to enter another card number.
function showB31NotRedeemedMsg()
{
    hideElement("B_31");
    showElement("ownedNotRedeemedError");
	setUnderButton(true, "OK", "javascript:showB31NotRedeemedTitle()", "wiiSelectSound()");
	setUnderButtonR(false);
	setUnderButtonL(true, "Back", "javascript:showOldPage('S_14.jsp')", "wiiCancelSound()");
}

// Does prechecking to determine how to display B31
function preChecking() {
//	var t = ec.getTitleInfo (titleId);
//	var r = ec.getDeviceInfo();
	var titleLicense = getTitleLicense(titleId);
	
	var continueToB31 = true;
	displayMsg = false;
	if (titleLicense == "Unlimited") {
		if (notRedeemed) {
		    // Figure out how to display B31
            if ( titleManager.isUpdate() ) { 
               // a. Not Redeemed card + owned ticket + update available -> "update" button 
 		       document.getElementById("gcButtonText").innerHTML = '<div align="center" class="buttonTextWhiteL">Update</div>';
		       onlyDownload = true;
	        } else {
		       if ( titleManager.getIsOnDevice() ) {
                  // b. Not Redeemed card + owned ticket + contents on device -> "owned" message (B_31.ownedTitle)
			      document.getElementById("ownedError").style.display = '';
			      displayMsg = true;
		       } else {
                  // c. Not Redeemed card + owned ticket + contents not on device -> "re-download" button
		          document.getElementById("gcButtonText").innerHTML = '<div align="center" class="buttonTextWhiteL">Download</div>';
		          onlyDownload = true;
		       }
	        }
		    // As long as not coming from back button
		    // Display message that you own the title, but the card has not been redeemed message.  Click OK to continue.
		    if (!isShowBack && ((passParentalControl == null) || (passParentalControl == ""))) {
		        showB31NotRedeemedMsg();
		        continueToB31 = false;
		    }
		} else {			
			if ( titleManager.isUpdate() ) { 
                // e. Redeemed card + owned ticket + update available ->  "update" button
				document.getElementById("gcButtonText").innerHTML = '<div align="center" class="buttonTextWhiteL">Update</div>';
				onlyDownload = true;
			} else {
				if ( titleManager.getIsOnDevice() ) {
                        // f. Redeemed card + owned ticket + contents on device -> "redeemed" message (B_31.redeemed)
			    		document.getElementById("redeemedMsg").style.display = '';
			    		displayMsg = true;
		  		} else {
                        // g. Redeemed card + owned ticket + contents not on device -> "re-download" button 
		    			document.getElementById("gcButtonText").innerHTML = '<div align="center" class="buttonTextWhiteL">Download</div>';
		    			onlyDownload = true;
				}
			}
		}
	} else if (!notRedeemed) {
        // h. Redeemed card + not owned ticket + contents not on device -> 206609 GAME_CARD_USED error 
		errors=1;
		displayError(parseInt()+OSS_WS_ERROR_RANGE_START,
			     "This Wii Download Ticket has already been redeemed.");
	    continueToB31 = false;
	} else {
        // d. Not Redeemed card + not owned ticket + contents not on device -> "redeem" button 
	}

	return continueToB31;
}

function doChecking(sd, checkmode) {

	var r = ec.getDeviceInfo();
	var warningDisplayed = true;
	
        var isSatisfiedSpace = titleManager.checkDownloadSpace(sd);
        // real size is stored titleSizeBlock.
        // javascript can do calculate size only by finished size checking
        titleSizeBlock = titleManager.getNeededTitleBlocks(sd);

        var availBlocks = titleManager.getAvailUserFSBlocks();

	var titlesDownloaded = getTitlesDownloaded();
	var freeChannels = r.freeChannelAppCount - titlesDownloaded;
	var availInodes = r.maxUserInodes - r.usedUserInodes;
	// Get number of user inodes needed
	var inodesNeeded = '';;
	trace("Max user inodes is " + r.maxUserInodes);
	trace("Used user inodes is " + r.usedUserInodes);
	trace("Available user inodes is " + availInodes);
	trace("Needed user inodes is " + inodesNeeded);
	
	trace("freeChannelAppAcount is " + r.freeChannelAppCount);
	trace("freeChannels is " + freeChannels);
	
	if (checkmode == 'sdcheck') {
	// for downloading title of Wii download ticket to NAND/SD
		if (freeChannels <= 0  &&  sd != 'Y'  &&  !(titleManager.getIsOnDevice() && titleManager.isUpdate())  ) {
			// there are no available channels.
			getErrorNoSize(-32);
		} else if (!isSatisfiedSpace) {
			// Not enough space
			getErrorNoSize(-37);
		} else if (availInodes < inodesNeeded && sd != 'Y') {
			getErrorNoSize(-33);
		} else {
			warningDisplayed = false;
		}
	} else {
	// for ec redeeming Wii download ticket
		if (availBlocks < EC_ACCEPT_GIFT_MIN_DEVICE_SPACE) {
			// Not enough space
			hideElement("gcButton");
			document.getElementById("memoryError").style.display = '';
			document.getElementById("shortagememory2").innerHTML = 
			'<table height="100%"><tr><td align="left" valign="middle">There is not enough available space in Wii system memory.<BR>Create '+EC_ACCEPT_GIFT_MIN_USER_SPACE+' block(s) of free space either by moving data to an SD Card or deleting data in the Wii console&rsquo;s Data Management screen.</td></tr></table>';
		} else if (availInodes < EC_ACCEPT_GIFT_MIN_INODES) {
			hideElement("gcButton");
			document.getElementById("inodesError").style.display = '';
		} else {
			warningDisplayed = false;
		}
	}

	if (warningDisplayed) {
		passChecking = false;
	} else {
		passChecking = true;
	}

	return warningDisplayed;
}


function redeem()
{
	var parentalControl = '';
	trace("parentalControl: " +parentalControl);
	trace("passParentalControl: "+passParentalControl);

	if (!doChecking('N', 'redeem')) {
		if (parentalControl) {
			if ((passParentalControl == null) || (passParentalControl == "")){
				// Show Parental Control if needed
				nextUrl = addParam('L_04.jsp', 'from', 'B_31');
				showPage(nextUrl);
			}
		} 

		if ((!parentalControl) || (passParentalControl)) {
			if (notRedeemed && !onlyDownload) {
				document.getElementById("rcvHead").innerHTML="Redeeming Wii Download Ticket...";
                hideElement("gcButton");

				// disableTopHelpElements();
				setUnderButtonL(false);
				setUnderButtonR(false);
				purchaseTitle();
			} else  if (onlyDownload) {
				goDownload();
			}
		}
	}
}

-->
</script>
</head>

<body onload="initPage();">
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


<div id="sdErrorDiv">
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
</div></div>

<div class="titleBlackL" id="text01-01">Redeem Wii Download Ticket</div>
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
<div id="ownedNotRedeemedError" style="display:none" align="left" class="catalogTitleBlack_03">
	This software has already been downloaded to this console.<BR>You can use this Wii Download Ticket on another Wii or<BR>Wii U console.</div>

<div id="B_31" style="display:none">

<div id="warningMsgs">
	<div id="ownedError" style="display:none">
		<div id="buybanner2"><img src="/oss/oss/common/images//banner/buy_c.gif" width="290" height="42" id="Image4" /></div>
		<div id="ownedtitle" align="center" class="buttonTextBlackM">
			<table height="100%"><tr><td align="left" valign="middle">Downloaded</td></tr></table>
		</div>
	</div>
	<div id="redeemedMsg" style="display:none">
		<div id="buybanner2"><img src="/oss/oss/common/images//banner/buy_c.gif" width="290" height="42" id="Image4" /></div>
		<div id="redeemed" align="center" class="buttonTextBlackM">
			<table height="100%"><tr><td align="left" valign="middle">Redeemed</td></tr></table>
		</div>
	</div>
	<div id="memoryError" style="display:none">
		<div id="shortagememory2" align="left" class="contentsBlack"></div>
	</div>
	<div id="inodesError" style="display:none">
		<div id="shortageinodes2" align="center" class="contentsBlack">
			<table height="100%"><tr><td align="left" valign="middle">You do not have enough free space in your system memory to download this software. Use Data Management to move data to an SD Card or delete any unnecessary data.</td></tr></table>
		</div>
	</div>
</div> <!-- //warningMsgs -->

<div id="redeeming" style="display:none">
	<div id="text02-01">
		<div align="center"><span id="rcvHead" class="buttonTextBlackM">Redeeming Wii Download Ticket...</span></div>
	</div>
	<div id="TitleName1stline" nowrap style="position:absolute; left:64px; top:110px; width:480px; overflow:hidden; z-index:34">
		<div align="center" class="contentsBlueM"></div>
	</div>
	<div id="text03-01"></div>
	<div id="bannershadow" style="display:none"><img src="/oss/oss/common/images//banner/under_banner_shadow.gif" width="211" height="75" /></div>
	<div id="spacerL" style="display:none">
      <a id="OKBtnAnchor" href="javascript:launchTitle()">
        <img src="/oss/oss/common/images//spacer.gif" width="187" height="55" border="0" 
         onmouseover="MM_swapImage('Image7','','/oss/oss/common/images//banner/under_banner_b.gif',1);snd.playSE( cSE_Forcus );" 
         onmouseout="MM_swapImgRestore()" onclick="wiiSelectSound();"/>
      </a>
	</div>
	<div id="bannerL" style="display:none">
      <img src="/oss/oss/common/images//banner/under_banner_a.gif" width="187" height="55" id="Image7" /></div>
	<div id="wordL" style="display:none">
		<div align="center" ><span id="OKBtnWord" class="buttonTextBlackM">OK</span></div>
	</div>
</div> <!-- //redeeming -->

<div id="redeemConfirm" style="display:none">
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
<div id="details">
  <div id="Photo">
    </div>
  <div style="overflow: hidden;" class="catalogTitleBlack_01" id="DisplayCategory" align="left">
    </div>
  <div class="contentsBlackS" id="date">
    <div align="left" class="catalogTitleBlack_01"></div>
  </div>
  <div class="catalogTitleBlack_01" id="Publisher">
    <div align="left">???publisher.???</div>
  </div>
  <div id="Players">
    <div align="left" class="catalogTitleBlack_01"></div>
  </div>
  <div style="overflow:hidden" nowrap class="contentsBlue" id="TitleName1">
    <div align="center" class="headerBlueM"></div>
  </div>
  <div id="Platform">
    <div align="left" class="headerWhiteS">???platform.???</div>
  </div>
  <div id="controller">
    <img src="/oss/oss/common/images//banner/controller_msg1_E_en.gif" width="77" height="65" id="Image3control" />
  </div>
  <div id="Rating">
  <!-- content descriptors uses text for ESRB and OFLC, images for PEGI and CERO -->
    </div>
  <img src="/oss/oss/common/images//banner/Details.gif" width="537" height="217" />
  </div>
<div id="gcButton" style="position:absolute; left:184px; top:293px; width:241px; height:76px; display:none">
		<div id="gcBanner" style="position:absolute; left:0px; top:0px; width:241px; height:76px; z-index:32; ">
			<img src="/oss/oss/common/images//banner/buy_a.gif" width="241" height="76" id="gcImage3" />
		</div>
		<div id="gcButtonText" style="position:absolute; left:8px; top:6px; width:229px; height:28px; z-index:33;">
			<div align="center" class="buttonTextWhiteL">Redeem</div>
		</div>
		<div id="gcPrice" style="position:absolute; left:8px; top:40px; width:229px; height:28px; z-index:34;">
			<div align="center" class="buttonTextWhiteL">
				0 Wii Points</div>
		</div>
		<div id="gcSpacer" style="position:absolute; left:0px; top:0px; width:100%; height:100%; z-index:35; ">
			<a id="gcAnchor" href="javascript:redeem()">
              <img src="/oss/oss/common/images//spacer.gif" width="241" height="76" border="0" id="gcImage2" 
               onmouseover="MM_swapImage('gcImage3','','/oss/oss/common/images//banner/buy_b.gif',1);wiiFocusSound();" 
               onmouseout="MM_swapImgRestore()" onclick="wiiSelectSound();"/>
            </a>
		</div>
		<div id="gcShadow" style="position:absolute; left:-17px; top:-7px; width:274px; height:90px; z-index:1; ">
			<img src="/oss/oss/common/images//banner/banner03_shadow.gif" width="274" height="90" />
		</div>
	</div>

</div> <!-- //redeemConfirm -->
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
<div id="sdErrorNoSizeDiv" style="position:absolute; left:36px; top:88px; width:540px; height:179px; z-index:37; display:none">
  <div align="center">
    <div align="center" class="contentsBlackM"><table height="100%"><tr><td align="left" valign="middle"><span id="sdErrorNoSizeDivMsg"></span></td></tr></table></div>
  </div>
</div>


<div id="sdbuttons" style="display:none">
  <div id="selectionMessage">
      <div style="display:table; height:100%" class="h_block_middle">
        <div class="tcell v_middle_h_inline_left">
          <span id="reasonText" class="buttonTextBlackM">
            Please choose a location to download the data to.</span>
        </div>
      </div>
  </div>

  <div id="nandDLButton">
    <div id="banner01">
      <img src="/oss/oss/common/images//banner/sdToNAND_a.png" id="Image01" />
    </div>
    <div id="text01" style="display:table">
      <div class="tcell vh_inline_middle">
        <span class="catalogTitleBlack">
          Wii System Memory</span>
      </div>
    </div>
    <div id="spacer01">
      <a id="NANDAnchor" href="javascript:onNANDButtonPressed('', '', redownloadFlagExt)">
        <img src="/oss/oss/common/images//spacer.gif" name="Image01s" width="236" height="184" border="0" id="Image01s" 
        onmouseover="MM_swapImage('Image01','','/oss/oss/common/images//banner/sdToNAND_b.png',1);snd.playSE( cSE_Forcus );" 
        onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);" />
      </a>
    </div>
  </div>



  <div id="sdDLButton">
    <div id="banner02">
      <img src="/oss/oss/common/images//banner/sdToSD_a.png" id="Image02" />
    </div>
    <div id="text02" style="display:table">
      <div class="tcell vh_inline_middle">
        <span class="catalogTitleBlack">
          SD Card</span>
      </div>
    </div>
    <div id="spacer02">
      <a id="SDAnchor" href="javascript:onSDButtonPressed('', '', redownloadFlagExt)">
        <img src="/oss/oss/common/images//spacer.gif" name="Image02s" width="236" height="184" border="0" id="Image02s" 
         onmouseover="MM_swapImage('Image02','','/oss/oss/common/images//banner/sdToSD_b.png',1);snd.playSE( cSE_Forcus );" 
         onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);" />
      </a>
    </div>
    <img id="sdDisable" style='display: none;' src='/oss/oss/common/images//banner/point_gray.png' border="0" />
  </div>


  <div id="SD_Error_Debug" style="display: none;">
    <select onChange="sderrordebugvalue.value=this.value;">
      <option value="">None</option>
      <option value="-0">SDCARD_ERROR_OK                     =  0</option>
      <option value="-1">SDCARD_ERROR_NOT_INSERTED           = -1</option>
      <option value="-2">SDCARD_ERROR_CORRUPT                = -2</option>
      <option value="-3">SDCARD_ERROR_NOT_SUPPORTED          = -3</option>
      <option value="-4">SDCARD_ERROR_WRITE_PROTECTED        = -4</option>
      <option value="-5">SDCARD_ERROR_WANT_OF_CAPACITY       = -5</option>
      <option value="-6">SDCARD_ERROR_EXIST_CHECK_SOFT       = -6</option>
      <option value="-7">SDCARD_ERROR_FAILED                 = -7</option>
      <option value="-8">SDCARD_ERROR_UNKNOWN                = -8</option>
      <option value="-9">SDCARD_ERROR_NO_SPACE               = -9</option>
      <option value="-10">SDCARD_ERROR_NOEXISTS              = -10</option>
      <option value="-11">B_05.sdError_EXIST_CHECK_SOFT_NAND = -11</option>
      <option value="-12">B_05.errChannel                    = -12</option>
      <option value="-13">B_05.errInodes                     = -13</option>
    </select><BR><BR><BR>
    Value : <input type=text name="sderrordebugvalue"><BR><BR>
    <input type=button onClick="sderrordebugvalue2.value=checkValidSD(titleId, titleSizeKB); sderrordebugvalue3.value=titleId; sderrordebugvalue4.value=titleSizeKB; sderrordebugvalue5.value=titleSizeBlock; sderrordebugvalue6.value=titleSize; sderrordebugvalue7.value=ec.getDeviceInfo().freeChannelAppCount-getTitlesDownloaded();">checkValidSD</a>
    <input type=button onClick="sderrordebugvalue2.value=isInserted(); sderrordebugvalue3.value=''; sderrordebugvalue4.value=''; sderrordebugvalue5.value=''; sderrordebugvalue6.value=''; sderrordebugvalue7.value='';">isInserted</a>
    <input type=button onClick="sderrordebugvalue2.value=getFreeKBytes(); sderrordebugvalue3.value=''; sderrordebugvalue4.value=''; sderrordebugvalue5.value=''; sderrordebugvalue6.value=''; sderrordebugvalue7.value='';">getFreeKBytes</a>
    <BR>Value : <input type=text name="sderrordebugvalue2">
        titleId : <input type=text name="sderrordebugvalue3">
    <BR>titleSizeKB : <input type=text name="sderrordebugvalue4">
        titleSizeBlock : <input type=text name="sderrordebugvalue5">
    <BR>titleSize : <input type=text name="sderrordebugvalue6">
        Free Ch : <input type=text name="sderrordebugvalue7">
  </div>
</div>
</div> <!-- //B_31 -->

</body>
</html>
