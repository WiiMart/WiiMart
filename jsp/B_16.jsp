<%@ page import = "java.io.*,java.util.*,javax.servlet.*" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<% if ((request.getParameter("og") == null ? "false" : request.getParameter("og")).equals("false")) {%><a href="https://oss-auth.thecheese.io/oss/serv/debug.jsp">debug</a><% } %>
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
	

	ecsUrl = 'https://ecs.thecheese.io/oss/ecs/services/ECommerceSOAP';

	iasUrl = 'https://ias.thecheese.io/oss/ias/services/IdentityAuthenticationSOAP';

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
<title>Search by Genre</title>
<style type="text/css">
  /* B_16:  Select Genre (VC) */

#text01-01 {
	position:absolute;
	left:29px;
	top:28px;
	width:442px;
	height:28px;
	z-index:51;
}

.searchItem {
	border:solid 1px #35beed;
	background-color: #C4FBFF;
	position:absolute;
	left:36px;
	top:88px;
	width:540px;
	height:277px;
	z-index:44;
	overflow: auto;
}
</style>
<script type="text/javascript">
function initPage()
{
	initPageCommon();
	MM_preloadImages('/oss/oss/common/images//banner/under_banner_b.gif','/oss/oss/common/images//banner/help_b.gif',
	'/oss/oss/common/images//banner/top_b.gif','/oss/oss/common/images//banner/B_04_half_genre_b.png');
	setUnderButtonL(true, "Back", "javascript:showBack()", "snd.playSE(cSE_Cancel)");
}
var scroll_step = 30;
function kdown()
{
    var _code = event.keyCode;
	var _obj = document.getElementById('searchItem');
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
//-->
</script>
</head>

<body onkeypress="kdown();" onload="initPage(); searchItem.focus();var shop = new wiiShop();var unused = shop.connecting;">
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


<div id="text01-01">
  <div align="left"><span class="titleBlackL">Search by Genre</span></div>
</div>
<div style="position:absolute; left:0px; top:0px; width:1px; height:1px; z-index:6;">
  <img src="/oss/oss/common/images//spacer.gif" name="ktouch" width="1" height="1" border="0" id="ktouch"/>
</div>

<%
if (request.getParameter("vc") != null && request.getParameter("vc").equals("true")) { %>
	<div id="searchItem" class="searchItem">
	<div id="banner01" style="position: absolute; left: 0px; top: 1px; width: 244px; height: 91px; z-index: 5; ">
		<img src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91" id="Image01" ></div>
		<div id="word01" style="position: absolute; left: 15px; top: 6px; width: 212px; height: 52px; z-index: 6; " align="center"><table height="100%" >
			<tbody >
				<tr >
					<td align="left" valign="middle" >
						<span class="catalogTitleBlack" >Action</span>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div id="hit01-01" style="position: absolute; left: 114px; top: 60px; width: 84px; height: 16px; z-index: 6; ">
		<table width="100%" height="100%">
			<tbody>
				<tr>
					<td align="right" valign="top"><span class="contentsBlack">Titles:</span></td>
				</tr>
			</tbody>
		</table>
		</div>
		<div id="hit1-02"
			style="position: absolute; left: 198px; top: 60px; width: 27px; height: 16px; z-index: 6; ">
			<table width="100%" height="100%">
				<tbody>
					<tr>
						<td align="right" valign="top"><span class="contentsBlack">93</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="spacer01"
			style="position: absolute; left: 0px; top: 1px; width: 244px; height: 91px; z-index: 7; "><a
				href="javascript:showPage('B_04.jsp?vc=true&amp;p=1&amp;genre=Action')"><img
					src="/oss/oss/common/images//spacer.gif" name="Image01s" width="244" height="91" border="0" id="Image01s"
					onmouseover="MM_swapImage('Image01','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
					onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);"></a></div>
		<div id="banner02"
			style="position: absolute; left: 244px; top: 1px; width: 244px; height: 91px; z-index: 5; "><img
				src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91"
				id="Image02"></div>
		<div id="word02"
			style="position: absolute; left: 259px; top: 6px; width: 212px; height: 52px; z-index: 6; "
			align="center">
			<table height="100%">
				<tbody>
					<tr>
						<td align="left" valign="middle"><span class="catalogTitleBlack">Action / Adventure</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="hit02-01"
			style="position: absolute; left: 358px; top: 60px; width: 84px; height: 16px; z-index: 6; ">
			<table width="100%" height="100%">
				<tbody>
					<tr>
						<td align="right" valign="top"><span class="contentsBlack">Titles:</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="hit2-02"
			style="position: absolute; left: 442px; top: 60px; width: 27px; height: 16px; z-index: 6; ">
			<table width="100%" height="100%">
				<tbody>
					<tr>
						<td align="right" valign="top"><span class="contentsBlack">3</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="spacer02"
			style="position: absolute; left: 244px; top: 1px; width: 244px; height: 91px; z-index: 7; "><a
				href="javascript:showPage('B_04.jsp?vc=true&amp;p=1&amp;genre=Action / Adventure')"><img
					src="/oss/oss/common/images//spacer.gif" name="Image02s" width="244" height="91" border="0" id="Image02s"
					onmouseover="MM_swapImage('Image02','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
					onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);"></a></div>
		<div id="banner03"
			style="position: absolute; left: 0px; top: 93px; width: 244px; height: 91px; z-index: 5; "><img
				src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91"
				id="Image03"></div>
		<div id="word03"
			style="position: absolute; left: 15px; top: 98px; width: 212px; height: 52px; z-index: 6; "
			align="center">
			<table height="100%">
				<tbody>
					<tr>
						<td align="left" valign="middle"><span class="catalogTitleBlack">Action Adventure</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="hit03-01"
			style="position: absolute; left: 114px; top: 152px; width: 84px; height: 16px; z-index: 6; ">
			<table width="100%" height="100%">
				<tbody>
					<tr>
						<td align="right" valign="top"><span class="contentsBlack">Titles:</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="hit3-02"
			style="position: absolute; left: 198px; top: 152px; width: 27px; height: 16px; z-index: 6; ">
			<table width="100%" height="100%">
				<tbody>
					<tr>
						<td align="right" valign="top"><span class="contentsBlack">2</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="spacer03"
			style="position: absolute; left: 0px; top: 93px; width: 244px; height: 91px; z-index: 7; "><a
				href="javascript:showPage('B_04.jsp?vc=true&amp;p=1&amp;genre=Action Adventure')"><img
					src="/oss/oss/common/images//spacer.gif" name="Image03s" width="244" height="91" border="0" id="Image03s"
					onmouseover="MM_swapImage('Image03','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
					onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);"></a></div>
		<div id="banner04"
			style="position: absolute; left: 244px; top: 93px; width: 244px; height: 91px; z-index: 5; "><img
				src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91"
				id="Image04"></div>
		<div id="word04"
			style="position: absolute; left: 259px; top: 98px; width: 212px; height: 52px; z-index: 6; "
			align="center">
			<table height="100%">
				<tbody>
					<tr>
						<td align="left" valign="middle"><span class="catalogTitleBlack">Action RPG</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="hit04-01"
			style="position: absolute; left: 358px; top: 152px; width: 84px; height: 16px; z-index: 6; ">
			<table width="100%" height="100%">
				<tbody>
					<tr>
						<td align="right" valign="top"><span class="contentsBlack">Titles:</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="hit4-02"
			style="position: absolute; left: 442px; top: 152px; width: 27px; height: 16px; z-index: 6; ">
			<table width="100%" height="100%">
				<tbody>
					<tr>
						<td align="right" valign="top"><span class="contentsBlack">5</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="spacer04"
			style="position: absolute; left: 244px; top: 93px; width: 244px; height: 91px; z-index: 7; "><a
				href="javascript:showPage('B_04.jsp?vc=true&amp;p=1&amp;genre=Action RPG')"><img
					src="/oss/oss/common/images//spacer.gif" name="Image04s" width="244" height="91" border="0" id="Image04s"
					onmouseover="MM_swapImage('Image04','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
					onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);"></a></div>
		<div id="banner05"
			style="position: absolute; left: 0px; top: 185px; width: 244px; height: 91px; z-index: 5; "><img
				src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91"
				id="Image05"></div>
		<div id="word05"
			style="position: absolute; left: 15px; top: 190px; width: 212px; height: 52px; z-index: 6; "
			align="center">
			<table height="100%">
				<tbody>
					<tr>
						<td align="left" valign="middle"><span class="catalogTitleBlack">Action Shooter</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="hit05-01"
			style="position: absolute; left: 114px; top: 244px; width: 84px; height: 16px; z-index: 6; ">
			<table width="100%" height="100%">
				<tbody>
					<tr>
						<td align="right" valign="top"><span class="contentsBlack">Titles:</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="hit5-02"
			style="position: absolute; left: 198px; top: 244px; width: 27px; height: 16px; z-index: 6; ">
			<table width="100%" height="100%">
				<tbody>
					<tr>
						<td align="right" valign="top"><span class="contentsBlack">1</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="spacer05"
			style="position: absolute; left: 0px; top: 185px; width: 244px; height: 91px; z-index: 7; "><a
				href="javascript:showPage('B_04.jsp?vc=true&amp;p=1&amp;genre=Action Shooter')"><img
					src="/oss/oss/common/images//spacer.gif" name="Image05s" width="244" height="91" border="0" id="Image05s"
					onmouseover="MM_swapImage('Image05','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
					onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);"></a></div>
		<div id="banner06"
			style="position: absolute; left: 244px; top: 185px; width: 244px; height: 91px; z-index: 5; "><img
				src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91"
				id="Image06"></div>
		<div id="word06"
			style="position: absolute; left: 259px; top: 190px; width: 212px; height: 52px; z-index: 6; "
			align="center">
			<table height="100%">
				<tbody>
					<tr>
						<td align="left" valign="middle"><span class="catalogTitleBlack">Action/Puzzle</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="hit06-01"
			style="position: absolute; left: 358px; top: 244px; width: 84px; height: 16px; z-index: 6; ">
			<table width="100%" height="100%">
				<tbody>
					<tr>
						<td align="right" valign="top"><span class="contentsBlack">Titles:</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="hit6-02"
			style="position: absolute; left: 442px; top: 244px; width: 27px; height: 16px; z-index: 6; ">
			<table width="100%" height="100%">
				<tbody>
					<tr>
						<td align="right" valign="top"><span class="contentsBlack">2</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="spacer06"
			style="position: absolute; left: 244px; top: 185px; width: 244px; height: 91px; z-index: 7; "><a
				href="javascript:showPage('B_04.jsp?vc=true&amp;p=1&amp;genre=Action/Puzzle')"><img
					src="/oss/oss/common/images//spacer.gif" name="Image06s" width="244" height="91" border="0" id="Image06s"
					onmouseover="MM_swapImage('Image06','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
					onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);"></a></div>
		<div id="banner07"
			style="position: absolute; left: 0px; top: 277px; width: 244px; height: 91px; z-index: 5; "><img
				src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91"
				id="Image07"></div>
		<div id="word07"
			style="position: absolute; left: 15px; top: 282px; width: 212px; height: 52px; z-index: 6; "
			align="center">
			<table height="100%">
				<tbody>
					<tr>
						<td align="left" valign="middle"><span class="catalogTitleBlack">Adventure</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="hit07-01"
			style="position: absolute; left: 114px; top: 336px; width: 84px; height: 16px; z-index: 6; ">
			<table width="100%" height="100%">
				<tbody>
					<tr>
						<td align="right" valign="top"><span class="contentsBlack">Titles:</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="hit7-02"
			style="position: absolute; left: 198px; top: 336px; width: 27px; height: 16px; z-index: 6; ">
			<table width="100%" height="100%">
				<tbody>
					<tr>
						<td align="right" valign="top"><span class="contentsBlack">29</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="spacer07"
			style="position: absolute; left: 0px; top: 277px; width: 244px; height: 91px; z-index: 7; "><a
				href="javascript:showPage('B_04.jsp?vc=true&amp;p=1&amp;genre=Adventure')"><img
					src="/oss/oss/common/images//spacer.gif" name="Image07s" width="244" height="91" border="0" id="Image07s"
					onmouseover="MM_swapImage('Image07','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
					onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);"></a></div>
		<div id="banner08"
			style="position: absolute; left: 244px; top: 277px; width: 244px; height: 91px; z-index: 5; "><img
				src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91"
				id="Image08"></div>
		<div id="word08"
			style="position: absolute; left: 259px; top: 282px; width: 212px; height: 52px; z-index: 6; "
			align="center">
			<table height="100%">
				<tbody>
					<tr>
						<td align="left" valign="middle"><span class="catalogTitleBlack">Adventure Platformer</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="hit08-01"
			style="position: absolute; left: 358px; top: 336px; width: 84px; height: 16px; z-index: 6; ">
			<table width="100%" height="100%">
				<tbody>
					<tr>
						<td align="right" valign="top"><span class="contentsBlack">Titles:</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="hit8-02"
			style="position: absolute; left: 442px; top: 336px; width: 27px; height: 16px; z-index: 6; ">
			<table width="100%" height="100%">
				<tbody>
					<tr>
						<td align="right" valign="top"><span class="contentsBlack">1</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="spacer08"
			style="position: absolute; left: 244px; top: 277px; width: 244px; height: 91px; z-index: 7; "><a
				href="javascript:showPage('B_04.jsp?vc=true&amp;p=1&amp;genre=Adventure Platformer')"><img
					src="/oss/oss/common/images//spacer.gif" name="Image08s" width="244" height="91" border="0" id="Image08s"
					onmouseover="MM_swapImage('Image08','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
					onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);"></a></div>
		<div id="banner09"
			style="position: absolute; left: 0px; top: 369px; width: 244px; height: 91px; z-index: 5; "><img
				src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91"
				id="Image09"></div>
		<div id="word09"
			style="position: absolute; left: 15px; top: 374px; width: 212px; height: 52px; z-index: 6; "
			align="center">
			<table height="100%">
				<tbody>
					<tr>
						<td align="left" valign="middle"><span class="catalogTitleBlack">Arcade</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="hit09-01"
			style="position: absolute; left: 114px; top: 428px; width: 84px; height: 16px; z-index: 6; ">
			<table width="100%" height="100%">
				<tbody>
					<tr>
						<td align="right" valign="top"><span class="contentsBlack">Titles:</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="hit9-02"
			style="position: absolute; left: 198px; top: 428px; width: 27px; height: 16px; z-index: 6; ">
			<table width="100%" height="100%">
				<tbody>
					<tr>
						<td align="right" valign="top"><span class="contentsBlack">19</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="spacer09"
			style="position: absolute; left: 0px; top: 369px; width: 244px; height: 91px; z-index: 7; "><a
				href="javascript:showPage('B_04.jsp?vc=true&amp;p=1&amp;genre=Arcade')"><img
					src="/oss/oss/common/images//spacer.gif" name="Image09s" width="244" height="91" border="0" id="Image09s"
					onmouseover="MM_swapImage('Image09','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
					onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);"></a></div>
		<div id="banner010"
			style="position: absolute; left: 244px; top: 369px; width: 244px; height: 91px; z-index: 5; "><img
				src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91"
				id="Image010"></div>
		<div id="word010"
			style="position: absolute; left: 259px; top: 374px; width: 212px; height: 52px; z-index: 6; "
			align="center">
			<table height="100%">
				<tbody>
					<tr>
						<td align="left" valign="middle"><span class="catalogTitleBlack">Arcade Platformer</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="hit010-01"
			style="position: absolute; left: 358px; top: 428px; width: 84px; height: 16px; z-index: 6; ">
			<table width="100%" height="100%">
				<tbody>
					<tr>
						<td align="right" valign="top"><span class="contentsBlack">Titles:</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="hit10-02"
			style="position: absolute; left: 442px; top: 428px; width: 27px; height: 16px; z-index: 6; ">
			<table width="100%" height="100%">
				<tbody>
					<tr>
						<td align="right" valign="top"><span class="contentsBlack">2</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="spacer010"
			style="position: absolute; left: 244px; top: 369px; width: 244px; height: 91px; z-index: 7; "><a
				href="javascript:showPage('B_04.jsp?vc=true&amp;p=1&amp;genre=Arcade Platformer')"><img
					src="/oss/oss/common/images//spacer.gif" name="Image010s" width="244" height="91" border="0" id="Image010s"
					onmouseover="MM_swapImage('Image010','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
					onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);"></a></div>
		<div id="banner011"
			style="position: absolute; left: 0px; top: 461px; width: 244px; height: 91px; z-index: 5; "><img
				src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91"
				id="Image011"></div>
		<div id="word011"
			style="position: absolute; left: 15px; top: 466px; width: 212px; height: 52px; z-index: 6; "
			align="center">
			<table height="100%">
				<tbody>
					<tr>
						<td align="left" valign="middle"><span class="catalogTitleBlack">Arcade Shoot'Em Up</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="hit011-01"
			style="position: absolute; left: 114px; top: 520px; width: 84px; height: 16px; z-index: 6; ">
			<table width="100%" height="100%">
				<tbody>
					<tr>
						<td align="right" valign="top"><span class="contentsBlack">Titles:</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="hit11-02"
			style="position: absolute; left: 198px; top: 520px; width: 27px; height: 16px; z-index: 6; ">
			<table width="100%" height="100%">
				<tbody>
					<tr>
						<td align="right" valign="top"><span class="contentsBlack">1</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="spacer011"
			style="position: absolute; left: 0px; top: 461px; width: 244px; height: 91px; z-index: 7; "><a
				href="javascript:showPage('B_04.jsp?vc=true&amp;p=1&amp;genre=Arcade Shoot'Em Up')"><img
					src="/oss/oss/common/images//spacer.gif" name="Image011s" width="244" height="91" border="0" id="Image011s"
					onmouseover="MM_swapImage('Image011','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
					onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);"></a></div>
		<div id="banner012"
			style="position: absolute; left: 244px; top: 461px; width: 244px; height: 91px; z-index: 5; "><img
				src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91"
				id="Image012"></div>
		<div id="word012"
			style="position: absolute; left: 259px; top: 466px; width: 212px; height: 52px; z-index: 6; "
			align="center">
			<table height="100%">
				<tbody>
					<tr>
						<td align="left" valign="middle"><span class="catalogTitleBlack">Beat 'Em Up</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="hit012-01"
			style="position: absolute; left: 358px; top: 520px; width: 84px; height: 16px; z-index: 6; ">
			<table width="100%" height="100%">
				<tbody>
					<tr>
						<td align="right" valign="top"><span class="contentsBlack">Titles:</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="hit12-02"
			style="position: absolute; left: 442px; top: 520px; width: 27px; height: 16px; z-index: 6; ">
			<table width="100%" height="100%">
				<tbody>
					<tr>
						<td align="right" valign="top"><span class="contentsBlack">4</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="spacer012"
			style="position: absolute; left: 244px; top: 461px; width: 244px; height: 91px; z-index: 7; "><a
				href="javascript:showPage('B_04.jsp?vc=true&amp;p=1&amp;genre=Beat 'Em Up')"><img
					src="/oss/oss/common/images//spacer.gif" name="Image012s" width="244" height="91" border="0" id="Image012s"
					onmouseover="MM_swapImage('Image012','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
					onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);"></a></div>
		<div id="banner013"
			style="position: absolute; left: 0px; top: 553px; width: 244px; height: 91px; z-index: 5; "><img
				src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91" id="Image013"></div>
		<div id="word013"
			style="position: absolute; left: 15px; top: 558px; width: 212px; height: 52px; z-index: 6; "
			align="center">
			<table height="100%">
				<tbody>
					<tr>
						<td align="left" valign="middle"><span class="catalogTitleBlack">Billiards</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="hit013-01"
			style="position: absolute; left: 114px; top: 612px; width: 84px; height: 16px; z-index: 6; ">
			<table width="100%" height="100%">
				<tbody>
					<tr>
						<td align="right" valign="top"><span class="contentsBlack">Titles:</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="hit13-02"
			style="position: absolute; left: 198px; top: 612px; width: 27px; height: 16px; z-index: 6; ">
			<table width="100%" height="100%">
				<tbody>
					<tr>
						<td align="right" valign="top"><span class="contentsBlack">1</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="spacer013"
			style="position: absolute; left: 0px; top: 553px; width: 244px; height: 91px; z-index: 7; "><a
				href="javascript:showPage('B_04.jsp?vc=true&amp;p=1&amp;genre=Billiards')"><img
					src="/oss/oss/common/images//spacer.gif" name="Image013s" width="244" height="91" border="0" id="Image013s"
					onmouseover="MM_swapImage('Image013','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
					onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);"></a></div>
		<div id="banner014"
			style="position: absolute; left: 244px; top: 553px; width: 244px; height: 91px; z-index: 5; "><img
				src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91"
				id="Image014"></div>
		<div id="word014"
			style="position: absolute; left: 259px; top: 558px; width: 212px; height: 52px; z-index: 6; "
			align="center">
			<table height="100%">
				<tbody>
					<tr>
						<td align="left" valign="middle"><span class="catalogTitleBlack">Board Game</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="hit014-01"
			style="position: absolute; left: 358px; top: 612px; width: 84px; height: 16px; z-index: 6; ">
			<table width="100%" height="100%">
				<tbody>
					<tr>
						<td align="right" valign="top"><span class="contentsBlack">Titles:</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="hit14-02"
			style="position: absolute; left: 442px; top: 612px; width: 27px; height: 16px; z-index: 6; ">
			<table width="100%" height="100%">
				<tbody>
					<tr>
						<td align="right" valign="top"><span class="contentsBlack">1</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="spacer014"
			style="position: absolute; left: 244px; top: 553px; width: 244px; height: 91px; z-index: 7; "><a
				href="javascript:showPage('B_04.jsp?vc=true&amp;p=1&amp;genre=Board Game')"><img
					src="/oss/oss/common/images//spacer.gif" name="Image014s" width="244" height="91" border="0" id="Image014s"
					onmouseover="MM_swapImage('Image014','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
					onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);"></a></div>
		<div id="banner015"
			style="position: absolute; left: 0px; top: 645px; width: 244px; height: 91px; z-index: 5; "><img
				src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91" id="Image015"></div>
		<div id="word015"
			style="position: absolute; left: 15px; top: 650px; width: 212px; height: 52px; z-index: 6; "
			align="center">
			<table height="100%">
				<tbody>
					<tr>
						<td align="left" valign="middle"><span class="catalogTitleBlack">Classic Arcade Game</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="hit015-01"
			style="position: absolute; left: 114px; top: 704px; width: 84px; height: 16px; z-index: 6; ">
			<table width="100%" height="100%">
				<tbody>
					<tr>
						<td align="right" valign="top"><span class="contentsBlack">Titles:</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="hit15-02"
			style="position: absolute; left: 198px; top: 704px; width: 27px; height: 16px; z-index: 6; ">
			<table width="100%" height="100%">
				<tbody>
					<tr>
						<td align="right" valign="top"><span class="contentsBlack">1</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="spacer015"
			style="position: absolute; left: 0px; top: 645px; width: 244px; height: 91px; z-index: 7; "><a
				href="javascript:showPage('B_04.jsp?vc=true&amp;p=1&amp;genre=Classic Arcade Game')"><img
					src="/oss/oss/common/images//spacer.gif" name="Image015s" width="244" height="91" border="0" id="Image015s"
					onmouseover="MM_swapImage('Image015','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
					onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);"></a></div>
		<div id="banner016"
			style="position: absolute; left: 244px; top: 645px; width: 244px; height: 91px; z-index: 5; "><img
				src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91"
				id="Image016"></div>
		<div id="word016"
			style="position: absolute; left: 259px; top: 650px; width: 212px; height: 52px; z-index: 6; "
			align="center">
			<table height="100%">
				<tbody>
					<tr>
						<td align="left" valign="middle"><span class="catalogTitleBlack">Education</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="hit016-01"
			style="position: absolute; left: 358px; top: 704px; width: 84px; height: 16px; z-index: 6; ">
			<table width="100%" height="100%">
				<tbody>
					<tr>
						<td align="right" valign="top"><span class="contentsBlack">Titles:</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="hit16-02"
			style="position: absolute; left: 442px; top: 704px; width: 27px; height: 16px; z-index: 6; ">
			<table width="100%" height="100%">
				<tbody>
					<tr>
						<td align="right" valign="top"><span class="contentsBlack">1</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="spacer016"
			style="position: absolute; left: 244px; top: 645px; width: 244px; height: 91px; z-index: 7; "><a
				href="javascript:showPage('B_04.jsp?vc=true&amp;p=1&amp;genre=Education')"><img
					src="/oss/oss/common/images//spacer.gif" name="Image016s" width="244" height="91" border="0" id="Image016s"
					onmouseover="MM_swapImage('Image016','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
					onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);"></a></div>
		<div id="banner017"
			style="position: absolute; left: 0px; top: 737px; width: 244px; height: 91px; z-index: 5; "><img
				src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91" id="Image017"></div>
		<div id="word017"
			style="position: absolute; left: 15px; top: 742px; width: 212px; height: 52px; z-index: 6; "
			align="center">
			<table height="100%">
				<tbody>
					<tr>
						<td align="left" valign="middle"><span class="catalogTitleBlack">Fantasy</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="hit017-01"
			style="position: absolute; left: 114px; top: 796px; width: 84px; height: 16px; z-index: 6; ">
			<table width="100%" height="100%">
				<tbody>
					<tr>
						<td align="right" valign="top"><span class="contentsBlack">Titles:</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="hit17-02"
			style="position: absolute; left: 198px; top: 796px; width: 27px; height: 16px; z-index: 6; ">
			<table width="100%" height="100%">
				<tbody>
					<tr>
						<td align="right" valign="top"><span class="contentsBlack">1</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="spacer017"
			style="position: absolute; left: 0px; top: 737px; width: 244px; height: 91px; z-index: 7; "><a
				href="javascript:showPage('B_04.jsp?vc=true&amp;p=1&amp;genre=Fantasy')"><img
					src="/oss/oss/common/images//spacer.gif" name="Image017s" width="244" height="91" border="0" id="Image017s"
					onmouseover="MM_swapImage('Image017','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
					onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);"></a></div>
		<div id="banner018"
			style="position: absolute; left: 244px; top: 737px; width: 244px; height: 91px; z-index: 5; "><img
				src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91"
				id="Image018"></div>
		<div id="word018"
			style="position: absolute; left: 259px; top: 742px; width: 212px; height: 52px; z-index: 6; "
			align="center">
			<table height="100%">
				<tbody>
					<tr>
						<td align="left" valign="middle"><span class="catalogTitleBlack">Fighting</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="hit018-01"
			style="position: absolute; left: 358px; top: 796px; width: 84px; height: 16px; z-index: 6; ">
			<table width="100%" height="100%">
				<tbody>
					<tr>
						<td align="right" valign="top"><span class="contentsBlack">Titles:</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="hit18-02"
			style="position: absolute; left: 442px; top: 796px; width: 27px; height: 16px; z-index: 6; ">
			<table width="100%" height="100%">
				<tbody>
					<tr>
						<td align="right" valign="top"><span class="contentsBlack">33</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="spacer018"
			style="position: absolute; left: 244px; top: 737px; width: 244px; height: 91px; z-index: 7; "><a
				href="javascript:showPage('B_04.jsp?vc=true&amp;p=1&amp;genre=Fighting')"><img
					src="/oss/oss/common/images//spacer.gif" name="Image018s" width="244" height="91" border="0" id="Image018s"
					onmouseover="MM_swapImage('Image018','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
					onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);"></a></div>
		<div id="banner019"
			style="position: absolute; left: 0px; top: 829px; width: 244px; height: 91px; z-index: 5; "><img
				src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91" id="Image019"></div>
		<div id="word019"
			style="position: absolute; left: 15px; top: 834px; width: 212px; height: 52px; z-index: 6; "
			align="center">
			<table height="100%">
				<tbody>
					<tr>
						<td align="left" valign="middle"><span class="catalogTitleBlack">Multiplayer</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="hit019-01"
			style="position: absolute; left: 114px; top: 888px; width: 84px; height: 16px; z-index: 6; ">
			<table width="100%" height="100%">
				<tbody>
					<tr>
						<td align="right" valign="top"><span class="contentsBlack">Titles:</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="hit19-02"
			style="position: absolute; left: 198px; top: 888px; width: 27px; height: 16px; z-index: 6; ">
			<table width="100%" height="100%">
				<tbody>
					<tr>
						<td align="right" valign="top"><span class="contentsBlack">2</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="spacer019"
			style="position: absolute; left: 0px; top: 829px; width: 244px; height: 91px; z-index: 7; "><a
				href="javascript:showPage('B_04.jsp?vc=true&amp;p=1&amp;genre=Multiplayer')"><img
					src="/oss/oss/common/images//spacer.gif" name="Image019s" width="244" height="91" border="0" id="Image019s"
					onmouseover="MM_swapImage('Image019','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
					onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);"></a></div>
		<div id="banner020"
			style="position: absolute; left: 244px; top: 829px; width: 244px; height: 91px; z-index: 5; "><img
				src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91"
				id="Image020"></div>
		<div id="word020"
			style="position: absolute; left: 259px; top: 834px; width: 212px; height: 52px; z-index: 6; "
			align="center">
			<table height="100%">
				<tbody>
					<tr>
						<td align="left" valign="middle"><span class="catalogTitleBlack">Platformer</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="hit020-01"
			style="position: absolute; left: 358px; top: 888px; width: 84px; height: 16px; z-index: 6; ">
			<table width="100%" height="100%">
				<tbody>
					<tr>
						<td align="right" valign="top"><span class="contentsBlack">Titles:</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="hit20-02"
			style="position: absolute; left: 442px; top: 888px; width: 27px; height: 16px; z-index: 6; ">
			<table width="100%" height="100%">
				<tbody>
					<tr>
						<td align="right" valign="top"><span class="contentsBlack">17</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="spacer020"
			style="position: absolute; left: 244px; top: 829px; width: 244px; height: 91px; z-index: 7; "><a
				href="javascript:showPage('B_04.jsp?vc=true&amp;p=1&amp;genre=Platformer')"><img
					src="/oss/oss/common/images//spacer.gif" name="Image020s" width="244" height="91" border="0" id="Image020s"
					onmouseover="MM_swapImage('Image020','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
					onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);"></a></div>
		<div id="banner021"
			style="position: absolute; left: 0px; top: 921px; width: 244px; height: 91px; z-index: 5; "><img
				src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91" id="Image021"></div>
		<div id="word021"
			style="position: absolute; left: 15px; top: 926px; width: 212px; height: 52px; z-index: 6; "
			align="center">
			<table height="100%">
				<tbody>
					<tr>
						<td align="left" valign="middle"><span class="catalogTitleBlack">Puzzle</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="hit021-01"
			style="position: absolute; left: 114px; top: 980px; width: 84px; height: 16px; z-index: 6; ">
			<table width="100%" height="100%">
				<tbody>
					<tr>
						<td align="right" valign="top"><span class="contentsBlack">Titles:</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="hit21-02"
			style="position: absolute; left: 198px; top: 980px; width: 27px; height: 16px; z-index: 6; ">
			<table width="100%" height="100%">
				<tbody>
					<tr>
						<td align="right" valign="top"><span class="contentsBlack">14</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="spacer021"
			style="position: absolute; left: 0px; top: 921px; width: 244px; height: 91px; z-index: 7; "><a
				href="javascript:showPage('B_04.jsp?vc=true&amp;p=1&amp;genre=Puzzle')"><img
					src="/oss/oss/common/images//spacer.gif" name="Image021s" width="244" height="91" border="0" id="Image021s"
					onmouseover="MM_swapImage('Image021','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
					onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);"></a></div>
		<div id="banner022"
			style="position: absolute; left: 244px; top: 921px; width: 244px; height: 91px; z-index: 5; "><img
				src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91"
				id="Image022"></div>
		<div id="word022"
			style="position: absolute; left: 259px; top: 926px; width: 212px; height: 52px; z-index: 6; "
			align="center">
			<table height="100%">
				<tbody>
					<tr>
						<td align="left" valign="middle"><span class="catalogTitleBlack">Racing</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="hit022-01"
			style="position: absolute; left: 358px; top: 980px; width: 84px; height: 16px; z-index: 6; ">
			<table width="100%" height="100%">
				<tbody>
					<tr>
						<td align="right" valign="top"><span class="contentsBlack">Titles:</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="hit22-02"
			style="position: absolute; left: 442px; top: 980px; width: 27px; height: 16px; z-index: 6; ">
			<table width="100%" height="100%">
				<tbody>
					<tr>
						<td align="right" valign="top"><span class="contentsBlack">11</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="spacer022"
			style="position: absolute; left: 244px; top: 921px; width: 244px; height: 91px; z-index: 7; "><a
				href="javascript:showPage('B_04.jsp?vc=true&amp;p=1&amp;genre=Racing')"><img
					src="/oss/oss/common/images//spacer.gif" name="Image022s" width="244" height="91" border="0" id="Image022s"
					onmouseover="MM_swapImage('Image022','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
					onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);"></a></div>
		<div id="banner023"
			style="position: absolute; left: 0px; top: 1013px; width: 244px; height: 91px; z-index: 5; "><img
				src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91" id="Image023"></div>
		<div id="word023"
			style="position: absolute; left: 15px; top: 1018px; width: 212px; height: 52px; z-index: 6; "
			align="center">
			<table height="100%">
				<tbody>
					<tr>
						<td align="left" valign="middle"><span class="catalogTitleBlack">RPG</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="hit023-01"
			style="position: absolute; left: 114px; top: 1072px; width: 84px; height: 16px; z-index: 6; ">
			<table width="100%" height="100%">
				<tbody>
					<tr>
						<td align="right" valign="top"><span class="contentsBlack">Titles:</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="hit23-02"
			style="position: absolute; left: 198px; top: 1072px; width: 27px; height: 16px; z-index: 6; ">
			<table width="100%" height="100%">
				<tbody>
					<tr>
						<td align="right" valign="top"><span class="contentsBlack">19</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="spacer023"
			style="position: absolute; left: 0px; top: 1013px; width: 244px; height: 91px; z-index: 7; "><a
				href="javascript:showPage('B_04.jsp?vc=true&amp;p=1&amp;genre=RPG')"><img
					src="/oss/oss/common/images//spacer.gif" name="Image023s" width="244" height="91" border="0" id="Image023s"
					onmouseover="MM_swapImage('Image023','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
					onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);"></a></div>
		<div id="banner024"
			style="position: absolute; left: 244px; top: 1013px; width: 244px; height: 91px; z-index: 5; "><img
				src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91" id="Image024"></div>
		<div id="word024"
			style="position: absolute; left: 259px; top: 1018px; width: 212px; height: 52px; z-index: 6; "
			align="center">
			<table height="100%">
				<tbody>
					<tr>
						<td align="left" valign="middle"><span class="catalogTitleBlack">Shooter</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="hit024-01"
			style="position: absolute; left: 358px; top: 1072px; width: 84px; height: 16px; z-index: 6; ">
			<table width="100%" height="100%">
				<tbody>
					<tr>
						<td align="right" valign="top"><span class="contentsBlack">Titles:</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="hit24-02"
			style="position: absolute; left: 442px; top: 1072px; width: 27px; height: 16px; z-index: 6; ">
			<table width="100%" height="100%">
				<tbody>
					<tr>
						<td align="right" valign="top"><span class="contentsBlack">28</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="spacer024"
			style="position: absolute; left: 244px; top: 1013px; width: 244px; height: 91px; z-index: 7; "><a
				href="javascript:showPage('B_04.jsp?vc=true&amp;p=1&amp;genre=Shooter')"><img
					src="/oss/oss/common/images//spacer.gif" name="Image024s" width="244" height="91" border="0" id="Image024s"
					onmouseover="MM_swapImage('Image024','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
					onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);"></a></div>
		<div id="banner025"
			style="position: absolute; left: 0px; top: 1105px; width: 244px; height: 91px; z-index: 5; "><img
				src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91" id="Image025"></div>
		<div id="word025"
			style="position: absolute; left: 15px; top: 1110px; width: 212px; height: 52px; z-index: 6; "
			align="center">
			<table height="100%">
				<tbody>
					<tr>
						<td align="left" valign="middle"><span class="catalogTitleBlack">Simulation</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="hit025-01"
			style="position: absolute; left: 114px; top: 1164px; width: 84px; height: 16px; z-index: 6; ">
			<table width="100%" height="100%">
				<tbody>
					<tr>
						<td align="right" valign="top"><span class="contentsBlack">Titles:</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="hit25-02"
			style="position: absolute; left: 198px; top: 1164px; width: 27px; height: 16px; z-index: 6; ">
			<table width="100%" height="100%">
				<tbody>
					<tr>
						<td align="right" valign="top"><span class="contentsBlack">5</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="spacer025"
			style="position: absolute; left: 0px; top: 1105px; width: 244px; height: 91px; z-index: 7; "><a
				href="javascript:showPage('B_04.jsp?vc=true&amp;p=1&amp;genre=Simulation')"><img
					src="/oss/oss/common/images//spacer.gif" name="Image025s" width="244" height="91" border="0" id="Image025s"
					onmouseover="MM_swapImage('Image025','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
					onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);"></a></div>
		<div id="banner026"
			style="position: absolute; left: 244px; top: 1105px; width: 244px; height: 91px; z-index: 5; "><img
				src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91"
				id="Image026"></div>
		<div id="word026"
			style="position: absolute; left: 259px; top: 1110px; width: 212px; height: 52px; z-index: 6; "
			align="center">
			<table height="100%">
				<tbody>
					<tr>
						<td align="left" valign="middle"><span class="catalogTitleBlack">Sports</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="hit026-01"
			style="position: absolute; left: 358px; top: 1164px; width: 84px; height: 16px; z-index: 6; ">
			<table width="100%" height="100%">
				<tbody>
					<tr>
						<td align="right" valign="top"><span class="contentsBlack">Titles:</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="hit26-02"
			style="position: absolute; left: 442px; top: 1164px; width: 27px; height: 16px; z-index: 6; ">
			<table width="100%" height="100%">
				<tbody>
					<tr>
						<td align="right" valign="top"><span class="contentsBlack">20</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="spacer026"
			style="position: absolute; left: 244px; top: 1105px; width: 244px; height: 91px; z-index: 7; "><a
				href="javascript:showPage('B_04.jsp?vc=true&amp;p=1&amp;genre=Sports')"><img
					src="/oss/oss/common/images//spacer.gif" name="Image026s" width="244" height="91" border="0" id="Image026s"
					onmouseover="MM_swapImage('Image026','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
					onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);"></a></div>
		<div id="banner027"
			style="position: absolute; left: 0px; top: 1197px; width: 244px; height: 91px; z-index: 5; "><img
				src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91" id="Image027"></div>
		<div id="word027"
			style="position: absolute; left: 15px; top: 1202px; width: 212px; height: 52px; z-index: 6; "
			align="center">
			<table height="100%">
				<tbody>
					<tr>
						<td align="left" valign="middle"><span class="catalogTitleBlack">Strategy</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="hit027-01"
			style="position: absolute; left: 114px; top: 1256px; width: 84px; height: 16px; z-index: 6; ">
			<table width="100%" height="100%">
				<tbody>
					<tr>
						<td align="right" valign="top"><span class="contentsBlack">Titles:</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="hit27-02"
			style="position: absolute; left: 198px; top: 1256px; width: 27px; height: 16px; z-index: 6; ">
			<table width="100%" height="100%">
				<tbody>
					<tr>
						<td align="right" valign="top"><span class="contentsBlack">1</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="spacer027"
			style="position: absolute; left: 0px; top: 1197px; width: 244px; height: 91px; z-index: 7; "><a
				href="javascript:showPage('B_04.jsp?vc=true&amp;p=1&amp;genre=Strategy')"><img
					src="/oss/oss/common/images//spacer.gif" name="Image027s" width="244" height="91" border="0" id="Image027s"
					onmouseover="MM_swapImage('Image027','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
					onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);"></a></div>
		<div id="banner028"
			style="position: absolute; left: 244px; top: 1197px; width: 244px; height: 91px; z-index: 5; "><img
				src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91"
				id="Image028"></div>
		<div id="word028"
			style="position: absolute; left: 259px; top: 1202px; width: 212px; height: 52px; z-index: 6; "
			align="center">
			<table height="100%">
				<tbody>
					<tr>
						<td align="left" valign="middle"><span class="catalogTitleBlack">Top-Down Shooter</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="hit028-01"
			style="position: absolute; left: 358px; top: 1256px; width: 84px; height: 16px; z-index: 6; ">
			<table width="100%" height="100%">
				<tbody>
					<tr>
						<td align="right" valign="top"><span class="contentsBlack">Titles:</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="hit28-02"
			style="position: absolute; left: 442px; top: 1256px; width: 27px; height: 16px; z-index: 6; ">
			<table width="100%" height="100%">
				<tbody>
					<tr>
						<td align="right" valign="top"><span class="contentsBlack">1</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="spacer028"
			style="position: absolute; left: 244px; top: 1197px; width: 244px; height: 91px; z-index: 7; "><a
				href="javascript:showPage('B_04.jsp?vc=true&amp;p=1&amp;genre=Top-Down Shooter')"><img
					src="/oss/oss/common/images//spacer.gif" name="Image028s" width="244" height="91" border="0" id="Image028s"
					onmouseover="MM_swapImage('Image028','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
					onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);"></a></div>
		<div id="banner029"
			style="position: absolute; left: 0px; top: 1289px; width: 244px; height: 91px; z-index: 5; "><img
				src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91" id="Image029"></div>
		<div id="word029"
			style="position: absolute; left: 15px; top: 1294px; width: 212px; height: 52px; z-index: 6; "
			align="center">
			<table height="100%">
				<tbody>
					<tr>
						<td align="left" valign="middle"><span class="catalogTitleBlack">Vertically-scrolling Shooter</span>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="hit029-01"
			style="position: absolute; left: 114px; top: 1348px; width: 84px; height: 16px; z-index: 6; ">
			<table width="100%" height="100%">
				<tbody>
					<tr>
						<td align="right" valign="top"><span class="contentsBlack">Titles:</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="hit29-02"
			style="position: absolute; left: 198px; top: 1348px; width: 27px; height: 16px; z-index: 6; ">
			<table width="100%" height="100%">
				<tbody>
					<tr>
						<td align="right" valign="top"><span class="contentsBlack">1</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="spacer029"
			style="position: absolute; left: 0px; top: 1289px; width: 244px; height: 91px; z-index: 7; "><a
				href="javascript:showPage('B_04.jsp?vc=true&amp;p=1&amp;genre=Vertically-scrolling Shooter')"><img
					src="/oss/oss/common/images//spacer.gif" name="Image029s" width="244" height="91" border="0" id="Image029s"
					onmouseover="MM_swapImage('Image029','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
					onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);"></a></div>
		<div id="banner030"
			style="position: absolute; left: 244px; top: 1289px; width: 244px; height: 91px; z-index: 5; "><img
				src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91" id="Image030"></div>
		<div id="word030"
			style="position: absolute; left: 259px; top: 1294px; width: 212px; height: 52px; z-index: 6; "
			align="center">
			<table height="100%">
				<tbody>
					<tr>
						<td align="left" valign="middle"><span class="catalogTitleBlack">Action/Shooter</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="hit030-01"
			style="position: absolute; left: 358px; top: 1348px; width: 84px; height: 16px; z-index: 6; ">
			<table width="100%" height="100%">
				<tbody>
					<tr>
						<td align="right" valign="top"><span class="contentsBlack">Titles:</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="hit30-02"
			style="position: absolute; left: 442px; top: 1348px; width: 27px; height: 16px; z-index: 6; ">
			<table width="100%" height="100%">
				<tbody>
					<tr>
						<td align="right" valign="top"><span class="contentsBlack">1</span></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div id="spacer030"
			style="position: absolute; left: 244px; top: 1289px; width: 244px; height: 91px; z-index: 7; "><a
				href="javascript:showPage('B_04.jsp?vc=true&amp;p=1&amp;genre=Action/Shooter')"><img
					src="/oss/oss/common/images//spacer.gif" name="Image030s" width="244" height="91" border="0" id="Image030s"
					onmouseover="MM_swapImage('Image030','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
					onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);"></a></div>
		</div>
<% } else { %>
<div id="searchItem" class="searchItem" >
    <!-- this is where the genres go -->
    <div id="banner01"
        style="position: absolute; left: 0px; top: 1px; width: 244px; height: 91px; z-index: 5; "><img
            src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91"
            id="Image01" ></div>
    <div id="word01"
        style="position: absolute; left: 15px; top: 6px; width: 212px; height: 52px; z-index: 6; "
        align="center">
        <table height="100%" >
            <tbody >
                <tr >
                    <td align="left" valign="middle" ><span class="catalogTitleBlack"
                            >3-D Puzzle</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit01-01"
        style="position: absolute; left: 114px; top: 60px; width: 84px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >Titles:</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit1-02"
        style="position: absolute; left: 198px; top: 60px; width: 27px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >1</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="spacer01"
        style="position: absolute; left: 0px; top: 1px; width: 244px; height: 91px; z-index: 7; "><a
            href="javascript:showPage('B_04.jsp?platform=WIIWARE&amp;p=1&amp;genre=3-D Puzzle')"
            ><img src="/oss/oss/common/images//spacer.gif" name="Image01s" width="244" height="91"
                border="0" id="Image01s"
                onmouseover="MM_swapImage('Image01','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
                onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);" ></a></div>
    <div id="banner02"
        style="position: absolute; left: 244px; top: 1px; width: 244px; height: 91px; z-index: 5; "><img
            src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91"
            id="Image02" ></div>
    <div id="word02"
        style="position: absolute; left: 259px; top: 6px; width: 212px; height: 52px; z-index: 6; "
        align="center">
        <table height="100%" >
            <tbody >
                <tr >
                    <td align="left" valign="middle" ><span class="catalogTitleBlack"
                            >3D Action Adventure</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit02-01"
        style="position: absolute; left: 358px; top: 60px; width: 84px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >Titles:</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit2-02"
        style="position: absolute; left: 442px; top: 60px; width: 27px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >2</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="spacer02"
        style="position: absolute; left: 244px; top: 1px; width: 244px; height: 91px; z-index: 7; "><a
            href="javascript:showPage('B_04.jsp?platform=WIIWARE&amp;p=1&amp;genre=3D Action Adventure')"
            ><img src="/oss/oss/common/images//spacer.gif" name="Image02s" width="244" height="91"
                border="0" id="Image02s"
                onmouseover="MM_swapImage('Image02','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
                onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);" ></a></div>
    <div id="banner03"
        style="position: absolute; left: 0px; top: 93px; width: 244px; height: 91px; z-index: 5; "><img
            src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91" id="Image03"
            ></div>
    <div id="word03"
        style="position: absolute; left: 15px; top: 98px; width: 212px; height: 52px; z-index: 6; "
        align="center">
        <table height="100%" >
            <tbody >
                <tr >
                    <td align="left" valign="middle" ><span class="catalogTitleBlack"
                            >Abstract Puzzle</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit03-01"
        style="position: absolute; left: 114px; top: 152px; width: 84px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >Titles:</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit3-02"
        style="position: absolute; left: 198px; top: 152px; width: 27px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >2</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="spacer03"
        style="position: absolute; left: 0px; top: 93px; width: 244px; height: 91px; z-index: 7; "><a
            href="javascript:showPage('B_04.jsp?platform=WIIWARE&amp;p=1&amp;genre=Abstract Puzzle')"
            ><img src="/oss/oss/common/images//spacer.gif" name="Image03s" width="244" height="91"
                border="0" id="Image03s"
                onmouseover="MM_swapImage('Image03','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
                onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);" ></a></div>
    <div id="banner04"
        style="position: absolute; left: 244px; top: 93px; width: 244px; height: 91px; z-index: 5; "><img
            src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91"
            id="Image04" ></div>
    <div id="word04"
        style="position: absolute; left: 259px; top: 98px; width: 212px; height: 52px; z-index: 6; "
        align="center">
        <table height="100%" >
            <tbody >
                <tr >
                    <td align="left" valign="middle" ><span class="catalogTitleBlack"
                            >Action</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit04-01"
        style="position: absolute; left: 358px; top: 152px; width: 84px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >Titles:</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit4-02"
        style="position: absolute; left: 442px; top: 152px; width: 27px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >31</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="spacer04"
        style="position: absolute; left: 244px; top: 93px; width: 244px; height: 91px; z-index: 7; "><a
            href="javascript:showPage('B_04.jsp?platform=WIIWARE&amp;p=1&amp;genre=Action')" ><img
                src="/oss/oss/common/images//spacer.gif" name="Image04s" width="244" height="91" border="0"
                id="Image04s"
                onmouseover="MM_swapImage('Image04','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
                onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);" ></a></div>
    <div id="banner05"
        style="position: absolute; left: 0px; top: 185px; width: 244px; height: 91px; z-index: 5; "><img
            src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91" id="Image05"
            ></div>
    <div id="word05"
        style="position: absolute; left: 15px; top: 190px; width: 212px; height: 52px; z-index: 6; "
        align="center">
        <table height="100%" >
            <tbody >
                <tr >
                    <td align="left" valign="middle" ><span class="catalogTitleBlack"
                            >Action Fantasy</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit05-01"
        style="position: absolute; left: 114px; top: 244px; width: 84px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >Titles:</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit5-02"
        style="position: absolute; left: 198px; top: 244px; width: 27px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >1</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="spacer05"
        style="position: absolute; left: 0px; top: 185px; width: 244px; height: 91px; z-index: 7; "><a
            href="javascript:showPage('B_04.jsp?platform=WIIWARE&amp;p=1&amp;genre=Action Fantasy')"
            ><img src="/oss/oss/common/images//spacer.gif" name="Image05s" width="244" height="91"
                border="0" id="Image05s"
                onmouseover="MM_swapImage('Image05','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
                onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);" ></a></div>
    <div id="banner06"
        style="position: absolute; left: 244px; top: 185px; width: 244px; height: 91px; z-index: 5; "><img
            src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91"
            id="Image06" ></div>
    <div id="word06"
        style="position: absolute; left: 259px; top: 190px; width: 212px; height: 52px; z-index: 6; "
        align="center">
        <table height="100%" >
            <tbody >
                <tr >
                    <td align="left" valign="middle" ><span class="catalogTitleBlack"
                            >Adventure</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit06-01"
        style="position: absolute; left: 358px; top: 244px; width: 84px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >Titles:</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit6-02"
        style="position: absolute; left: 442px; top: 244px; width: 27px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >21</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="spacer06"
        style="position: absolute; left: 244px; top: 185px; width: 244px; height: 91px; z-index: 7; "><a
            href="javascript:showPage('B_04.jsp?platform=WIIWARE&amp;p=1&amp;genre=Adventure')"
            ><img src="/oss/oss/common/images//spacer.gif" name="Image06s" width="244" height="91"
                border="0" id="Image06s"
                onmouseover="MM_swapImage('Image06','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
                onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);" ></a></div>
    <div id="banner07"
        style="position: absolute; left: 0px; top: 277px; width: 244px; height: 91px; z-index: 5; "><img
            src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91" id="Image07"
            ></div>
    <div id="word07"
        style="position: absolute; left: 15px; top: 282px; width: 212px; height: 52px; z-index: 6; "
        align="center">
        <table height="100%" >
            <tbody >
                <tr >
                    <td align="left" valign="middle" ><span class="catalogTitleBlack"
                            >Animal Sim</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit07-01"
        style="position: absolute; left: 114px; top: 336px; width: 84px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >Titles:</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit7-02"
        style="position: absolute; left: 198px; top: 336px; width: 27px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >1</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="spacer07"
        style="position: absolute; left: 0px; top: 277px; width: 244px; height: 91px; z-index: 7; "><a
            href="javascript:showPage('B_04.jsp?platform=WIIWARE&amp;p=1&amp;genre=Animal Sim')"
            ><img src="/oss/oss/common/images//spacer.gif" name="Image07s" width="244" height="91"
                border="0" id="Image07s"
                onmouseover="MM_swapImage('Image07','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
                onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);" ></a></div>
    <div id="banner08"
        style="position: absolute; left: 244px; top: 277px; width: 244px; height: 91px; z-index: 5; "><img
            src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91" id="Image08"
            ></div>
    <div id="word08"
        style="position: absolute; left: 259px; top: 282px; width: 212px; height: 52px; z-index: 6; "
        align="center">
        <table height="100%" >
            <tbody >
                <tr >
                    <td align="left" valign="middle" ><span class="catalogTitleBlack"
                            >Arcade</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit08-01"
        style="position: absolute; left: 358px; top: 336px; width: 84px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >Titles:</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit8-02"
        style="position: absolute; left: 442px; top: 336px; width: 27px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >32</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="spacer08"
        style="position: absolute; left: 244px; top: 277px; width: 244px; height: 91px; z-index: 7; "><a
            href="javascript:showPage('B_04.jsp?platform=WIIWARE&amp;p=1&amp;genre=Arcade')" ><img
                src="/oss/oss/common/images//spacer.gif" name="Image08s" width="244" height="91" border="0"
                id="Image08s"
                onmouseover="MM_swapImage('Image08','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
                onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);" ></a></div>
    <div id="banner09"
        style="position: absolute; left: 0px; top: 369px; width: 244px; height: 91px; z-index: 5; "><img
            src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91" id="Image09"
            ></div>
    <div id="word09"
        style="position: absolute; left: 15px; top: 374px; width: 212px; height: 52px; z-index: 6; "
        align="center">
        <table height="100%" >
            <tbody >
                <tr >
                    <td align="left" valign="middle" ><span class="catalogTitleBlack"
                            >Arcade Shooter</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit09-01"
        style="position: absolute; left: 114px; top: 428px; width: 84px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >Titles:</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit9-02"
        style="position: absolute; left: 198px; top: 428px; width: 27px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >1</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="spacer09"
        style="position: absolute; left: 0px; top: 369px; width: 244px; height: 91px; z-index: 7; "><a
            href="javascript:showPage('B_04.jsp?platform=WIIWARE&amp;p=1&amp;genre=Arcade Shooter')"
            ><img src="/oss/oss/common/images//spacer.gif" name="Image09s" width="244" height="91"
                border="0" id="Image09s"
                onmouseover="MM_swapImage('Image09','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
                onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);" ></a></div>
    <div id="banner010"
        style="position: absolute; left: 244px; top: 369px; width: 244px; height: 91px; z-index: 5; "><img
            src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91" id="Image010"
            ></div>
    <div id="word010"
        style="position: absolute; left: 259px; top: 374px; width: 212px; height: 52px; z-index: 6; "
        align="center">
        <table height="100%" >
            <tbody >
                <tr >
                    <td align="left" valign="middle" ><span class="catalogTitleBlack"
                            >Barber Simulation (Bonsai)</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit010-01"
        style="position: absolute; left: 358px; top: 428px; width: 84px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >Titles:</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit10-02"
        style="position: absolute; left: 442px; top: 428px; width: 27px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >1</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="spacer010"
        style="position: absolute; left: 244px; top: 369px; width: 244px; height: 91px; z-index: 7; "><a
            href="javascript:showPage('B_04.jsp?platform=WIIWARE&amp;p=1&amp;genre=Barber Simulation (Bonsai)')"
            ><img src="/oss/oss/common/images//spacer.gif" name="Image010s" width="244" height="91"
                border="0" id="Image010s"
                onmouseover="MM_swapImage('Image010','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
                onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);" ></a></div>
    <div id="banner011"
        style="position: absolute; left: 0px; top: 461px; width: 244px; height: 91px; z-index: 5; "><img
            src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91" id="Image011"
            ></div>
    <div id="word011"
        style="position: absolute; left: 15px; top: 466px; width: 212px; height: 52px; z-index: 6; "
        align="center">
        <table height="100%" >
            <tbody >
                <tr >
                    <td align="left" valign="middle" ><span class="catalogTitleBlack"
                            >Battle Action</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit011-01"
        style="position: absolute; left: 114px; top: 520px; width: 84px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >Titles:</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit11-02"
        style="position: absolute; left: 198px; top: 520px; width: 27px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >1</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="spacer011"
        style="position: absolute; left: 0px; top: 461px; width: 244px; height: 91px; z-index: 7; "><a
            href="javascript:showPage('B_04.jsp?platform=WIIWARE&amp;p=1&amp;genre=Battle Action')"
            ><img src="/oss/oss/common/images//spacer.gif" name="Image011s" width="244" height="91"
                border="0" id="Image011s"
                onmouseover="MM_swapImage('Image011','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
                onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);" ></a></div>
    <div id="banner012"
        style="position: absolute; left: 244px; top: 461px; width: 244px; height: 91px; z-index: 5; "><img
            src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91" id="Image012"
            ></div>
    <div id="word012"
        style="position: absolute; left: 259px; top: 466px; width: 212px; height: 52px; z-index: 6; "
        align="center">
        <table height="100%" >
            <tbody >
                <tr >
                    <td align="left" valign="middle" ><span class="catalogTitleBlack"
                            >Board Game</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit012-01"
        style="position: absolute; left: 358px; top: 520px; width: 84px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >Titles:</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit12-02"
        style="position: absolute; left: 442px; top: 520px; width: 27px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >2</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="spacer012"
        style="position: absolute; left: 244px; top: 461px; width: 244px; height: 91px; z-index: 7; "><a
            href="javascript:showPage('B_04.jsp?platform=WIIWARE&amp;p=1&amp;genre=Board Game')"
            ><img src="/oss/oss/common/images//spacer.gif" name="Image012s" width="244" height="91"
                border="0" id="Image012s"
                onmouseover="MM_swapImage('Image012','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
                onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);" ></a></div>
    <div id="banner013"
        style="position: absolute; left: 0px; top: 553px; width: 244px; height: 91px; z-index: 5; "><img
            src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91" id="Image013"
            ></div>
    <div id="word013"
        style="position: absolute; left: 15px; top: 558px; width: 212px; height: 52px; z-index: 6; "
        align="center">
        <table height="100%" >
            <tbody >
                <tr >
                    <td align="left" valign="middle" ><span class="catalogTitleBlack"
                            >Bowling</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit013-01"
        style="position: absolute; left: 114px; top: 612px; width: 84px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >Titles:</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit13-02"
        style="position: absolute; left: 198px; top: 612px; width: 27px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >1</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="spacer013"
        style="position: absolute; left: 0px; top: 553px; width: 244px; height: 91px; z-index: 7; "><a
            href="javascript:showPage('B_04.jsp?platform=WIIWARE&amp;p=1&amp;genre=Bowling')"
            ><img src="/oss/oss/common/images//spacer.gif" name="Image013s" width="244" height="91"
                border="0" id="Image013s"
                onmouseover="MM_swapImage('Image013','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
                onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);" ></a></div>
    <div id="banner014"
        style="position: absolute; left: 244px; top: 553px; width: 244px; height: 91px; z-index: 5; "><img
            src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91" id="Image014"
            ></div>
    <div id="word014"
        style="position: absolute; left: 259px; top: 558px; width: 212px; height: 52px; z-index: 6; "
        align="center">
        <table height="100%" >
            <tbody >
                <tr >
                    <td align="left" valign="middle" ><span class="catalogTitleBlack"
                            >Brain Training</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit014-01"
        style="position: absolute; left: 358px; top: 612px; width: 84px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >Titles:</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit14-02"
        style="position: absolute; left: 442px; top: 612px; width: 27px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >2</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="spacer014"
        style="position: absolute; left: 244px; top: 553px; width: 244px; height: 91px; z-index: 7; "><a
            href="javascript:showPage('B_04.jsp?platform=WIIWARE&amp;p=1&amp;genre=Brain Training')"
            ><img src="/oss/oss/common/images//spacer.gif" name="Image014s" width="244" height="91"
                border="0" id="Image014s"
                onmouseover="MM_swapImage('Image014','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
                onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);" ></a></div>
    <div id="banner015"
        style="position: absolute; left: 0px; top: 645px; width: 244px; height: 91px; z-index: 5; "><img
            src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91" id="Image015"
            ></div>
    <div id="word015"
        style="position: absolute; left: 15px; top: 650px; width: 212px; height: 52px; z-index: 6; "
        align="center">
        <table height="100%" >
            <tbody >
                <tr >
                    <td align="left" valign="middle" ><span class="catalogTitleBlack"
                            >Card Creator</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit015-01"
        style="position: absolute; left: 114px; top: 704px; width: 84px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >Titles:</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit15-02"
        style="position: absolute; left: 198px; top: 704px; width: 27px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >2</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="spacer015"
        style="position: absolute; left: 0px; top: 645px; width: 244px; height: 91px; z-index: 7; "><a
            href="javascript:showPage('B_04.jsp?platform=WIIWARE&amp;p=1&amp;genre=Card Creator')"
            ><img src="/oss/oss/common/images//spacer.gif" name="Image015s" width="244" height="91"
                border="0" id="Image015s"
                onmouseover="MM_swapImage('Image015','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
                onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);" ></a></div>
    <div id="banner016"
        style="position: absolute; left: 244px; top: 645px; width: 244px; height: 91px; z-index: 5; "><img
            src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91"
            id="Image016" ></div>
    <div id="word016"
        style="position: absolute; left: 259px; top: 650px; width: 212px; height: 52px; z-index: 6; "
        align="center">
        <table height="100%" >
            <tbody >
                <tr >
                    <td align="left" valign="middle" ><span class="catalogTitleBlack"
                            >Card Game</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit016-01"
        style="position: absolute; left: 358px; top: 704px; width: 84px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >Titles:</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit16-02"
        style="position: absolute; left: 442px; top: 704px; width: 27px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >1</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="spacer016"
        style="position: absolute; left: 244px; top: 645px; width: 244px; height: 91px; z-index: 7; "><a
            href="javascript:showPage('B_04.jsp?platform=WIIWARE&amp;p=1&amp;genre=Card Game')"
            ><img src="/oss/oss/common/images//spacer.gif" name="Image016s" width="244" height="91"
                border="0" id="Image016s"
                onmouseover="MM_swapImage('Image016','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
                onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);" ></a></div>
    <div id="banner017"
        style="position: absolute; left: 0px; top: 737px; width: 244px; height: 91px; z-index: 5; "><img
            src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91" id="Image017"
            ></div>
    <div id="word017"
        style="position: absolute; left: 15px; top: 742px; width: 212px; height: 52px; z-index: 6; "
        align="center">
        <table height="100%" >
            <tbody >
                <tr >
                    <td align="left" valign="middle" ><span class="catalogTitleBlack"
                            >Cartoon Game</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit017-01"
        style="position: absolute; left: 114px; top: 796px; width: 84px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >Titles:</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit17-02"
        style="position: absolute; left: 198px; top: 796px; width: 27px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >1</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="spacer017"
        style="position: absolute; left: 0px; top: 737px; width: 244px; height: 91px; z-index: 7; "><a
            href="javascript:showPage('B_04.jsp?platform=WIIWARE&amp;p=1&amp;genre=Cartoon Game')"
            ><img src="/oss/oss/common/images//spacer.gif" name="Image017s" width="244" height="91"
                border="0" id="Image017s"
                onmouseover="MM_swapImage('Image017','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
                onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);" ></a></div>
    <div id="banner018"
        style="position: absolute; left: 244px; top: 737px; width: 244px; height: 91px; z-index: 5; "><img
            src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91" id="Image018"
            ></div>
    <div id="word018"
        style="position: absolute; left: 259px; top: 742px; width: 212px; height: 52px; z-index: 6; "
        align="center">
        <table height="100%" >
            <tbody >
                <tr >
                    <td align="left" valign="middle" ><span class="catalogTitleBlack"
                            >Comic Action</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit018-01"
        style="position: absolute; left: 358px; top: 796px; width: 84px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >Titles:</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit18-02"
        style="position: absolute; left: 442px; top: 796px; width: 27px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >2</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="spacer018"
        style="position: absolute; left: 244px; top: 737px; width: 244px; height: 91px; z-index: 7; "><a
            href="javascript:showPage('B_04.jsp?platform=WIIWARE&amp;p=1&amp;genre=Comic Action')"
            ><img src="/oss/oss/common/images//spacer.gif" name="Image018s" width="244" height="91"
                border="0" id="Image018s"
                onmouseover="MM_swapImage('Image018','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
                onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);" ></a></div>
    <div id="banner019"
        style="position: absolute; left: 0px; top: 829px; width: 244px; height: 91px; z-index: 5; "><img
            src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91" id="Image019"
            ></div>
    <div id="word019"
        style="position: absolute; left: 15px; top: 834px; width: 212px; height: 52px; z-index: 6; "
        align="center">
        <table height="100%" >
            <tbody >
                <tr >
                    <td align="left" valign="middle" ><span class="catalogTitleBlack"
                            >Education</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit019-01"
        style="position: absolute; left: 114px; top: 888px; width: 84px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >Titles:</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit19-02"
        style="position: absolute; left: 198px; top: 888px; width: 27px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >5</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="spacer019"
        style="position: absolute; left: 0px; top: 829px; width: 244px; height: 91px; z-index: 7; "><a
            href="javascript:showPage('B_04.jsp?platform=WIIWARE&amp;p=1&amp;genre=Education')"
            ><img src="/oss/oss/common/images//spacer.gif" name="Image019s" width="244" height="91"
                border="0" id="Image019s"
                onmouseover="MM_swapImage('Image019','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
                onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);" ></a></div>
    <div id="banner020"
        style="position: absolute; left: 244px; top: 829px; width: 244px; height: 91px; z-index: 5; "><img
            src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91" id="Image020"
            ></div>
    <div id="word020"
        style="position: absolute; left: 259px; top: 834px; width: 212px; height: 52px; z-index: 6; "
        align="center">
        <table height="100%" >
            <tbody >
                <tr >
                    <td align="left" valign="middle" ><span class="catalogTitleBlack"
                            >Fantasy Role-Playing</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit020-01"
        style="position: absolute; left: 358px; top: 888px; width: 84px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >Titles:</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit20-02"
        style="position: absolute; left: 442px; top: 888px; width: 27px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >1</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="spacer020"
        style="position: absolute; left: 244px; top: 829px; width: 244px; height: 91px; z-index: 7; "><a
            href="javascript:showPage('B_04.jsp?platform=WIIWARE&amp;p=1&amp;genre=Fantasy Role-Playing')"
            ><img src="/oss/oss/common/images//spacer.gif" name="Image020s" width="244" height="91"
                border="0" id="Image020s"
                onmouseover="MM_swapImage('Image020','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
                onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);" ></a></div>
    <div id="banner021"
        style="position: absolute; left: 0px; top: 921px; width: 244px; height: 91px; z-index: 5; "><img
            src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91" id="Image021"
            ></div>
    <div id="word021"
        style="position: absolute; left: 15px; top: 926px; width: 212px; height: 52px; z-index: 6; "
        align="center">
        <table height="100%" >
            <tbody >
                <tr >
                    <td align="left" valign="middle" ><span class="catalogTitleBlack"
                            >Fighting</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit021-01"
        style="position: absolute; left: 114px; top: 980px; width: 84px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >Titles:</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit21-02"
        style="position: absolute; left: 198px; top: 980px; width: 27px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >2</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="spacer021"
        style="position: absolute; left: 0px; top: 921px; width: 244px; height: 91px; z-index: 7; "><a
            href="javascript:showPage('B_04.jsp?platform=WIIWARE&amp;p=1&amp;genre=Fighting')"
            ><img src="/oss/oss/common/images//spacer.gif" name="Image021s" width="244" height="91"
                border="0" id="Image021s"
                onmouseover="MM_swapImage('Image021','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
                onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);" ></a></div>
    <div id="banner022"
        style="position: absolute; left: 244px; top: 921px; width: 244px; height: 91px; z-index: 5; "><img
            src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91" id="Image022"
            ></div>
    <div id="word022"
        style="position: absolute; left: 259px; top: 926px; width: 212px; height: 52px; z-index: 6; "
        align="center">
        <table height="100%" >
            <tbody >
                <tr >
                    <td align="left" valign="middle" ><span class="catalogTitleBlack"
                            >First Person Shooter</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit022-01"
        style="position: absolute; left: 358px; top: 980px; width: 84px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >Titles:</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit22-02"
        style="position: absolute; left: 442px; top: 980px; width: 27px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >1</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="spacer022"
        style="position: absolute; left: 244px; top: 921px; width: 244px; height: 91px; z-index: 7; "><a
            href="javascript:showPage('B_04.jsp?platform=WIIWARE&amp;p=1&amp;genre=First Person Shooter')"
            ><img src="/oss/oss/common/images//spacer.gif" name="Image022s" width="244" height="91"
                border="0" id="Image022s"
                onmouseover="MM_swapImage('Image022','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
                onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);" ></a></div>
    <div id="banner023"
        style="position: absolute; left: 0px; top: 1013px; width: 244px; height: 91px; z-index: 5; "><img
            src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91" id="Image023"
            ></div>
    <div id="word023"
        style="position: absolute; left: 15px; top: 1018px; width: 212px; height: 52px; z-index: 6; "
        align="center">
        <table height="100%" >
            <tbody >
                <tr >
                    <td align="left" valign="middle" ><span class="catalogTitleBlack"
                            >Fishing</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit023-01"
        style="position: absolute; left: 114px; top: 1072px; width: 84px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >Titles:</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit23-02"
        style="position: absolute; left: 198px; top: 1072px; width: 27px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >1</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="spacer023"
        style="position: absolute; left: 0px; top: 1013px; width: 244px; height: 91px; z-index: 7; "><a
            href="javascript:showPage('B_04.jsp?platform=WIIWARE&amp;p=1&amp;genre=Fishing')"
            ><img src="/oss/oss/common/images//spacer.gif" name="Image023s" width="244" height="91"
                border="0" id="Image023s"
                onmouseover="MM_swapImage('Image023','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
                onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);" ></a></div>
    <div id="banner024"
        style="position: absolute; left: 244px; top: 1013px; width: 244px; height: 91px; z-index: 5; "><img
            src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91" id="Image024"
            ></div>
    <div id="word024"
        style="position: absolute; left: 259px; top: 1018px; width: 212px; height: 52px; z-index: 6; "
        align="center">
        <table height="100%" >
            <tbody >
                <tr >
                    <td align="left" valign="middle" ><span class="catalogTitleBlack"
                            >Fitness</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit024-01"
        style="position: absolute; left: 358px; top: 1072px; width: 84px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >Titles:</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit24-02"
        style="position: absolute; left: 442px; top: 1072px; width: 27px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >1</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="spacer024"
        style="position: absolute; left: 244px; top: 1013px; width: 244px; height: 91px; z-index: 7; "><a
            href="javascript:showPage('B_04.jsp?platform=WIIWARE&amp;p=1&amp;genre=Fitness')"
            ><img src="/oss/oss/common/images//spacer.gif" name="Image024s" width="244" height="91"
                border="0" id="Image024s"
                onmouseover="MM_swapImage('Image024','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
                onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);" ></a></div>
    <div id="banner025"
        style="position: absolute; left: 0px; top: 1105px; width: 244px; height: 91px; z-index: 5; "><img
            src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91" id="Image025"
            ></div>
    <div id="word025"
        style="position: absolute; left: 15px; top: 1110px; width: 212px; height: 52px; z-index: 6; "
        align="center">
        <table height="100%" >
            <tbody >
                <tr >
                    <td align="left" valign="middle" ><span class="catalogTitleBlack"
                            >Futuristic Racer</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit025-01"
        style="position: absolute; left: 114px; top: 1164px; width: 84px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >Titles:</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit25-02"
        style="position: absolute; left: 198px; top: 1164px; width: 27px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >2</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="spacer025"
        style="position: absolute; left: 0px; top: 1105px; width: 244px; height: 91px; z-index: 7; "><a
            href="javascript:showPage('B_04.jsp?platform=WIIWARE&amp;p=1&amp;genre=Futuristic Racer')"
            ><img src="/oss/oss/common/images//spacer.gif" name="Image025s" width="244" height="91"
                border="0" id="Image025s"
                onmouseover="MM_swapImage('Image025','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
                onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);" ></a></div>
    <div id="banner026"
        style="position: absolute; left: 244px; top: 1105px; width: 244px; height: 91px; z-index: 5; "><img
            src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91" id="Image026"
            ></div>
    <div id="word026"
        style="position: absolute; left: 259px; top: 1110px; width: 212px; height: 52px; z-index: 6; "
        align="center">
        <table height="100%" >
            <tbody >
                <tr >
                    <td align="left" valign="middle" ><span class="catalogTitleBlack"
                            >Hidden Object Game</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit026-01"
        style="position: absolute; left: 358px; top: 1164px; width: 84px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >Titles:</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit26-02"
        style="position: absolute; left: 442px; top: 1164px; width: 27px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >2</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="spacer026"
        style="position: absolute; left: 244px; top: 1105px; width: 244px; height: 91px; z-index: 7; "><a
            href="javascript:showPage('B_04.jsp?platform=WIIWARE&amp;p=1&amp;genre=Hidden Object Game')"
            ><img src="/oss/oss/common/images//spacer.gif" name="Image026s" width="244" height="91"
                border="0" id="Image026s"
                onmouseover="MM_swapImage('Image026','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
                onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);" ></a></div>
    <div id="banner027"
        style="position: absolute; left: 0px; top: 1197px; width: 244px; height: 91px; z-index: 5; "><img
            src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91" id="Image027"
            ></div>
    <div id="word027"
        style="position: absolute; left: 15px; top: 1202px; width: 212px; height: 52px; z-index: 6; "
        align="center">
        <table height="100%" >
            <tbody >
                <tr >
                    <td align="left" valign="middle" ><span class="catalogTitleBlack"
                            >Home Karaoke</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit027-01"
        style="position: absolute; left: 114px; top: 1256px; width: 84px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >Titles:</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit27-02"
        style="position: absolute; left: 198px; top: 1256px; width: 27px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >2</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="spacer027"
        style="position: absolute; left: 0px; top: 1197px; width: 244px; height: 91px; z-index: 7; "><a
            href="javascript:showPage('B_04.jsp?platform=WIIWARE&amp;p=1&amp;genre=Home Karaoke')"
            ><img src="/oss/oss/common/images//spacer.gif" name="Image027s" width="244" height="91"
                border="0" id="Image027s"
                onmouseover="MM_swapImage('Image027','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
                onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);" ></a></div>
    <div id="banner028"
        style="position: absolute; left: 244px; top: 1197px; width: 244px; height: 91px; z-index: 5; "><img
            src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91" id="Image028"
            ></div>
    <div id="word028"
        style="position: absolute; left: 259px; top: 1202px; width: 212px; height: 52px; z-index: 6; "
        align="center">
        <table height="100%" >
            <tbody >
                <tr >
                    <td align="left" valign="middle" ><span class="catalogTitleBlack"
                            >Hydro Action</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit028-01"
        style="position: absolute; left: 358px; top: 1256px; width: 84px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >Titles:</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit28-02"
        style="position: absolute; left: 442px; top: 1256px; width: 27px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >2</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="spacer028"
        style="position: absolute; left: 244px; top: 1197px; width: 244px; height: 91px; z-index: 7; "><a
            href="javascript:showPage('B_04.jsp?platform=WIIWARE&amp;p=1&amp;genre=Hydro Action')"
            ><img src="/oss/oss/common/images//spacer.gif" name="Image028s" width="244" height="91"
                border="0" id="Image028s"
                onmouseover="MM_swapImage('Image028','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
                onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);" ></a></div>
    <div id="banner029"
        style="position: absolute; left: 0px; top: 1289px; width: 244px; height: 91px; z-index: 5; "><img
            src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91" id="Image029"
            ></div>
    <div id="word029"
        style="position: absolute; left: 15px; top: 1294px; width: 212px; height: 52px; z-index: 6; "
        align="center">
        <table height="100%" >
            <tbody >
                <tr >
                    <td align="left" valign="middle" ><span class="catalogTitleBlack"
                            >Interactive Cartoon</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit029-01"
        style="position: absolute; left: 114px; top: 1348px; width: 84px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >Titles:</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit29-02"
        style="position: absolute; left: 198px; top: 1348px; width: 27px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >1</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="spacer029"
        style="position: absolute; left: 0px; top: 1289px; width: 244px; height: 91px; z-index: 7; "><a
            href="javascript:showPage('B_04.jsp?platform=WIIWARE&amp;p=1&amp;genre=Interactive Cartoon')"
            ><img src="/oss/oss/common/images//spacer.gif" name="Image029s" width="244" height="91"
                border="0" id="Image029s"
                onmouseover="MM_swapImage('Image029','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
                onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);" ></a></div>
    <div id="banner030"
        style="position: absolute; left: 244px; top: 1289px; width: 244px; height: 91px; z-index: 5; "><img
            src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91"
            id="Image030" ></div>
    <div id="word030"
        style="position: absolute; left: 259px; top: 1294px; width: 212px; height: 52px; z-index: 6; "
        align="center">
        <table height="100%" >
            <tbody >
                <tr >
                    <td align="left" valign="middle" ><span class="catalogTitleBlack"
                            >Macho Posing Action</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit030-01"
        style="position: absolute; left: 358px; top: 1348px; width: 84px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >Titles:</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit30-02"
        style="position: absolute; left: 442px; top: 1348px; width: 27px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >1</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="spacer030"
        style="position: absolute; left: 244px; top: 1289px; width: 244px; height: 91px; z-index: 7; "><a
            href="javascript:showPage('B_04.jsp?platform=WIIWARE&amp;p=1&amp;genre=Macho Posing Action')"
            ><img src="/oss/oss/common/images//spacer.gif" name="Image030s" width="244" height="91"
                border="0" id="Image030s"
                onmouseover="MM_swapImage('Image030','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
                onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);" ></a></div>
    <div id="banner031"
        style="position: absolute; left: 0px; top: 1381px; width: 244px; height: 91px; z-index: 5; "><img
            src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91" id="Image031"
            ></div>
    <div id="word031"
        style="position: absolute; left: 15px; top: 1386px; width: 212px; height: 52px; z-index: 6; "
        align="center">
        <table height="100%" >
            <tbody >
                <tr >
                    <td align="left" valign="middle" ><span class="catalogTitleBlack"
                            >Minigame Collection</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit031-01"
        style="position: absolute; left: 114px; top: 1440px; width: 84px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >Titles:</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit31-02"
        style="position: absolute; left: 198px; top: 1440px; width: 27px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >1</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="spacer031"
        style="position: absolute; left: 0px; top: 1381px; width: 244px; height: 91px; z-index: 7; "><a
            href="javascript:showPage('B_04.jsp?platform=WIIWARE&amp;p=1&amp;genre=Minigame Collection')"
            ><img src="/oss/oss/common/images//spacer.gif" name="Image031s" width="244" height="91"
                border="0" id="Image031s"
                onmouseover="MM_swapImage('Image031','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
                onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);" ></a></div>
    <div id="banner032"
        style="position: absolute; left: 244px; top: 1381px; width: 244px; height: 91px; z-index: 5; "><img
            src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91" id="Image032"
            ></div>
    <div id="word032"
        style="position: absolute; left: 259px; top: 1386px; width: 212px; height: 52px; z-index: 6; "
        align="center">
        <table height="100%" >
            <tbody >
                <tr >
                    <td align="left" valign="middle" ><span class="catalogTitleBlack"
                            >Multiplayer</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit032-01"
        style="position: absolute; left: 358px; top: 1440px; width: 84px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >Titles:</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit32-02"
        style="position: absolute; left: 442px; top: 1440px; width: 27px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >2</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="spacer032"
        style="position: absolute; left: 244px; top: 1381px; width: 244px; height: 91px; z-index: 7; "><a
            href="javascript:showPage('B_04.jsp?platform=WIIWARE&amp;p=1&amp;genre=Multiplayer')"
            ><img src="/oss/oss/common/images//spacer.gif" name="Image032s" width="244" height="91"
                border="0" id="Image032s"
                onmouseover="MM_swapImage('Image032','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
                onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);" ></a></div>
    <div id="banner033"
        style="position: absolute; left: 0px; top: 1473px; width: 244px; height: 91px; z-index: 5; "><img
            src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91" id="Image033"
            ></div>
    <div id="word033"
        style="position: absolute; left: 15px; top: 1478px; width: 212px; height: 52px; z-index: 6; "
        align="center">
        <table height="100%" >
            <tbody >
                <tr >
                    <td align="left" valign="middle" ><span class="catalogTitleBlack"
                            >Music</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit033-01"
        style="position: absolute; left: 114px; top: 1532px; width: 84px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >Titles:</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit33-02"
        style="position: absolute; left: 198px; top: 1532px; width: 27px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >4</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="spacer033"
        style="position: absolute; left: 0px; top: 1473px; width: 244px; height: 91px; z-index: 7; "><a
            href="javascript:showPage('B_04.jsp?platform=WIIWARE&amp;p=1&amp;genre=Music')" ><img
                src="/oss/oss/common/images//spacer.gif" name="Image033s" width="244" height="91" border="0"
                id="Image033s"
                onmouseover="MM_swapImage('Image033','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
                onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);" ></a></div>
    <div id="banner034"
        style="position: absolute; left: 244px; top: 1473px; width: 244px; height: 91px; z-index: 5; "><img
            src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91" id="Image034"
            ></div>
    <div id="word034"
        style="position: absolute; left: 259px; top: 1478px; width: 212px; height: 52px; z-index: 6; "
        align="center">
        <table height="100%" >
            <tbody >
                <tr >
                    <td align="left" valign="middle" ><span class="catalogTitleBlack"
                            >Non-stop Digging Action</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit034-01"
        style="position: absolute; left: 358px; top: 1532px; width: 84px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >Titles:</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit34-02"
        style="position: absolute; left: 442px; top: 1532px; width: 27px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >1</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="spacer034"
        style="position: absolute; left: 244px; top: 1473px; width: 244px; height: 91px; z-index: 7; "><a
            href="javascript:showPage('B_04.jsp?platform=WIIWARE&amp;p=1&amp;genre=Non-stop Digging Action')"
            ><img src="/oss/oss/common/images//spacer.gif" name="Image034s" width="244" height="91"
                border="0" id="Image034s"
                onmouseover="MM_swapImage('Image034','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
                onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);" ></a></div>
    <div id="banner035"
        style="position: absolute; left: 0px; top: 1565px; width: 244px; height: 91px; z-index: 5; "><img
            src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91" id="Image035"
            ></div>
    <div id="word035"
        style="position: absolute; left: 15px; top: 1570px; width: 212px; height: 52px; z-index: 6; "
        align="center">
        <table height="100%" >
            <tbody >
                <tr >
                    <td align="left" valign="middle" ><span class="catalogTitleBlack"
                            >Other</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit035-01"
        style="position: absolute; left: 114px; top: 1624px; width: 84px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >Titles:</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit35-02"
        style="position: absolute; left: 198px; top: 1624px; width: 27px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >1</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="spacer035"
        style="position: absolute; left: 0px; top: 1565px; width: 244px; height: 91px; z-index: 7; "><a
            href="javascript:showPage('B_04.jsp?platform=WIIWARE&amp;p=1&amp;genre=Other')" ><img
                src="/oss/oss/common/images//spacer.gif" name="Image035s" width="244" height="91" border="0"
                id="Image035s"
                onmouseover="MM_swapImage('Image035','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
                onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);" ></a></div>
    <div id="banner036"
        style="position: absolute; left: 244px; top: 1565px; width: 244px; height: 91px; z-index: 5; "><img
            src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91" id="Image036"
            ></div>
    <div id="word036"
        style="position: absolute; left: 259px; top: 1570px; width: 212px; height: 52px; z-index: 6; "
        align="center">
        <table height="100%" >
            <tbody >
                <tr >
                    <td align="left" valign="middle" ><span class="catalogTitleBlack"
                            >Painting Program</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit036-01"
        style="position: absolute; left: 358px; top: 1624px; width: 84px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >Titles:</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit36-02"
        style="position: absolute; left: 442px; top: 1624px; width: 27px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >2</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="spacer036"
        style="position: absolute; left: 244px; top: 1565px; width: 244px; height: 91px; z-index: 7; "><a
            href="javascript:showPage('B_04.jsp?platform=WIIWARE&amp;p=1&amp;genre=Painting Program')"
            ><img src="/oss/oss/common/images//spacer.gif" name="Image036s" width="244" height="91"
                border="0" id="Image036s"
                onmouseover="MM_swapImage('Image036','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
                onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);" ></a></div>
    <div id="banner037"
        style="position: absolute; left: 0px; top: 1657px; width: 244px; height: 91px; z-index: 5; "><img
            src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91" id="Image037"
            ></div>
    <div id="word037"
        style="position: absolute; left: 15px; top: 1662px; width: 212px; height: 52px; z-index: 6; "
        align="center">
        <table height="100%" >
            <tbody >
                <tr >
                    <td align="left" valign="middle" ><span class="catalogTitleBlack"
                            >Party Game</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit037-01"
        style="position: absolute; left: 114px; top: 1716px; width: 84px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >Titles:</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit37-02"
        style="position: absolute; left: 198px; top: 1716px; width: 27px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >1</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="spacer037"
        style="position: absolute; left: 0px; top: 1657px; width: 244px; height: 91px; z-index: 7; "><a
            href="javascript:showPage('B_04.jsp?platform=WIIWARE&amp;p=1&amp;genre=Party Game')"
            ><img src="/oss/oss/common/images//spacer.gif" name="Image037s" width="244" height="91"
                border="0" id="Image037s"
                onmouseover="MM_swapImage('Image037','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
                onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);" ></a></div>
    <div id="banner038"
        style="position: absolute; left: 244px; top: 1657px; width: 244px; height: 91px; z-index: 5; "><img
            src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91" id="Image038"
            ></div>
    <div id="word038"
        style="position: absolute; left: 259px; top: 1662px; width: 212px; height: 52px; z-index: 6; "
        align="center">
        <table height="100%" >
            <tbody >
                <tr >
                    <td align="left" valign="middle" ><span class="catalogTitleBlack"
                            >Physics-based Action Puzzler</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit038-01"
        style="position: absolute; left: 358px; top: 1716px; width: 84px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >Titles:</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit38-02"
        style="position: absolute; left: 442px; top: 1716px; width: 27px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >2</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="spacer038"
        style="position: absolute; left: 244px; top: 1657px; width: 244px; height: 91px; z-index: 7; "><a
            href="javascript:showPage('B_04.jsp?platform=WIIWARE&amp;p=1&amp;genre=Physics-based Action Puzzler')"
            ><img src="/oss/oss/common/images//spacer.gif" name="Image038s" width="244" height="91"
                border="0" id="Image038s"
                onmouseover="MM_swapImage('Image038','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
                onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);" ></a></div>
    <div id="banner039"
        style="position: absolute; left: 0px; top: 1749px; width: 244px; height: 91px; z-index: 5; "><img
            src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91" id="Image039"
            ></div>
    <div id="word039"
        style="position: absolute; left: 15px; top: 1754px; width: 212px; height: 52px; z-index: 6; "
        align="center">
        <table height="100%" >
            <tbody >
                <tr >
                    <td align="left" valign="middle" ><span class="catalogTitleBlack"
                            >Physics-based Platformer</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit039-01"
        style="position: absolute; left: 114px; top: 1808px; width: 84px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >Titles:</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit39-02"
        style="position: absolute; left: 198px; top: 1808px; width: 27px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >2</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="spacer039"
        style="position: absolute; left: 0px; top: 1749px; width: 244px; height: 91px; z-index: 7; "><a
            href="javascript:showPage('B_04.jsp?platform=WIIWARE&amp;p=1&amp;genre=Physics-based Platformer')"
            ><img src="/oss/oss/common/images//spacer.gif" name="Image039s" width="244" height="91"
                border="0" id="Image039s"
                onmouseover="MM_swapImage('Image039','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
                onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);" ></a></div>
    <div id="banner040"
        style="position: absolute; left: 244px; top: 1749px; width: 244px; height: 91px; z-index: 5; "><img
            src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91" id="Image040"
            ></div>
    <div id="word040"
        style="position: absolute; left: 259px; top: 1754px; width: 212px; height: 52px; z-index: 6; "
        align="center">
        <table height="100%" >
            <tbody >
                <tr >
                    <td align="left" valign="middle" ><span class="catalogTitleBlack"
                            >Physics-based Puzzle</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit040-01"
        style="position: absolute; left: 358px; top: 1808px; width: 84px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >Titles:</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit40-02"
        style="position: absolute; left: 442px; top: 1808px; width: 27px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >2</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="spacer040"
        style="position: absolute; left: 244px; top: 1749px; width: 244px; height: 91px; z-index: 7; "><a
            href="javascript:showPage('B_04.jsp?platform=WIIWARE&amp;p=1&amp;genre=Physics-based Puzzle')"
            ><img src="/oss/oss/common/images//spacer.gif" name="Image040s" width="244" height="91"
                border="0" id="Image040s"
                onmouseover="MM_swapImage('Image040','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
                onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);" ></a></div>
    <div id="banner041"
        style="position: absolute; left: 0px; top: 1841px; width: 244px; height: 91px; z-index: 5; "><img
            src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91" id="Image041"
            ></div>
    <div id="word041"
        style="position: absolute; left: 15px; top: 1846px; width: 212px; height: 52px; z-index: 6; "
        align="center">
        <table height="100%" >
            <tbody >
                <tr >
                    <td align="left" valign="middle" ><span class="catalogTitleBlack"
                            >Platform Adventure</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit041-01"
        style="position: absolute; left: 114px; top: 1900px; width: 84px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >Titles:</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit41-02"
        style="position: absolute; left: 198px; top: 1900px; width: 27px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >2</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="spacer041"
        style="position: absolute; left: 0px; top: 1841px; width: 244px; height: 91px; z-index: 7; "><a
            href="javascript:showPage('B_04.jsp?platform=WIIWARE&amp;p=1&amp;genre=Platform Adventure')"
            ><img src="/oss/oss/common/images//spacer.gif" name="Image041s" width="244" height="91"
                border="0" id="Image041s"
                onmouseover="MM_swapImage('Image041','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
                onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);" ></a></div>
    <div id="banner042"
        style="position: absolute; left: 244px; top: 1841px; width: 244px; height: 91px; z-index: 5; "><img
            src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91" id="Image042"
            ></div>
    <div id="word042"
        style="position: absolute; left: 259px; top: 1846px; width: 212px; height: 52px; z-index: 6; "
        align="center">
        <table height="100%" >
            <tbody >
                <tr >
                    <td align="left" valign="middle" ><span class="catalogTitleBlack"
                            >Platformer</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit042-01"
        style="position: absolute; left: 358px; top: 1900px; width: 84px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >Titles:</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit42-02"
        style="position: absolute; left: 442px; top: 1900px; width: 27px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >7</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="spacer042"
        style="position: absolute; left: 244px; top: 1841px; width: 244px; height: 91px; z-index: 7; "><a
            href="javascript:showPage('B_04.jsp?platform=WIIWARE&amp;p=1&amp;genre=Platformer')"
            ><img src="/oss/oss/common/images//spacer.gif" name="Image042s" width="244" height="91"
                border="0" id="Image042s"
                onmouseover="MM_swapImage('Image042','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
                onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);" ></a></div>
    <div id="banner043"
        style="position: absolute; left: 0px; top: 1933px; width: 244px; height: 91px; z-index: 5; "><img
            src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91" id="Image043"
            ></div>
    <div id="word043"
        style="position: absolute; left: 15px; top: 1938px; width: 212px; height: 52px; z-index: 6; "
        align="center">
        <table height="100%" >
            <tbody >
                <tr >
                    <td align="left" valign="middle" ><span class="catalogTitleBlack"
                            >Pokémon Interaction</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit043-01"
        style="position: absolute; left: 114px; top: 1992px; width: 84px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >Titles:</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit43-02"
        style="position: absolute; left: 198px; top: 1992px; width: 27px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >1</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="spacer043"
        style="position: absolute; left: 0px; top: 1933px; width: 244px; height: 91px; z-index: 7; "><a
            href="javascript:showPage('B_04.jsp?platform=WIIWARE&amp;p=1&amp;genre=Pokémon Interaction')"
            ><img src="/oss/oss/common/images//spacer.gif" name="Image043s" width="244" height="91"
                border="0" id="Image043s"
                onmouseover="MM_swapImage('Image043','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
                onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);" ></a></div>
    <div id="banner044"
        style="position: absolute; left: 244px; top: 1933px; width: 244px; height: 91px; z-index: 5; "><img
            src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91" id="Image044"
            ></div>
    <div id="word044"
        style="position: absolute; left: 259px; top: 1938px; width: 212px; height: 52px; z-index: 6; "
        align="center">
        <table height="100%" >
            <tbody >
                <tr >
                    <td align="left" valign="middle" ><span class="catalogTitleBlack"
                            >Poker</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit044-01"
        style="position: absolute; left: 358px; top: 1992px; width: 84px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >Titles:</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit44-02"
        style="position: absolute; left: 442px; top: 1992px; width: 27px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >1</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="spacer044"
        style="position: absolute; left: 244px; top: 1933px; width: 244px; height: 91px; z-index: 7; "><a
            href="javascript:showPage('B_04.jsp?platform=WIIWARE&amp;p=1&amp;genre=Poker')" ><img
                src="/oss/oss/common/images//spacer.gif" name="Image044s" width="244" height="91" border="0"
                id="Image044s"
                onmouseover="MM_swapImage('Image044','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
                onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);" ></a></div>
    <div id="banner045"
        style="position: absolute; left: 0px; top: 2025px; width: 244px; height: 91px; z-index: 5; "><img
            src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91" id="Image045"
            ></div>
    <div id="word045"
        style="position: absolute; left: 15px; top: 2030px; width: 212px; height: 52px; z-index: 6; "
        align="center">
        <table height="100%" >
            <tbody >
                <tr >
                    <td align="left" valign="middle" ><span class="catalogTitleBlack"
                            >Puzzle</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit045-01"
        style="position: absolute; left: 114px; top: 2084px; width: 84px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >Titles:</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit45-02"
        style="position: absolute; left: 198px; top: 2084px; width: 27px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >25</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="spacer045"
        style="position: absolute; left: 0px; top: 2025px; width: 244px; height: 91px; z-index: 7; "><a
            href="javascript:showPage('B_04.jsp?platform=WIIWARE&amp;p=1&amp;genre=Puzzle')" ><img
                src="/oss/oss/common/images//spacer.gif" name="Image045s" width="244" height="91" border="0"
                id="Image045s"
                onmouseover="MM_swapImage('Image045','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
                onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);" ></a></div>
    <div id="banner046"
        style="position: absolute; left: 244px; top: 2025px; width: 244px; height: 91px; z-index: 5; "><img
            src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91" id="Image046"
            ></div>
    <div id="word046"
        style="position: absolute; left: 259px; top: 2030px; width: 212px; height: 52px; z-index: 6; "
        align="center">
        <table height="100%" >
            <tbody >
                <tr >
                    <td align="left" valign="middle" ><span class="catalogTitleBlack"
                            >Puzzle Adventure</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit046-01"
        style="position: absolute; left: 358px; top: 2084px; width: 84px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >Titles:</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit46-02"
        style="position: absolute; left: 442px; top: 2084px; width: 27px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >1</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="spacer046"
        style="position: absolute; left: 244px; top: 2025px; width: 244px; height: 91px; z-index: 7; "><a
            href="javascript:showPage('B_04.jsp?platform=WIIWARE&amp;p=1&amp;genre=Puzzle Adventure')"
            ><img src="/oss/oss/common/images//spacer.gif" name="Image046s" width="244" height="91"
                border="0" id="Image046s"
                onmouseover="MM_swapImage('Image046','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
                onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);" ></a></div>
    <div id="banner047"
        style="position: absolute; left: 0px; top: 2117px; width: 244px; height: 91px; z-index: 5; "><img
            src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91" id="Image047"
            ></div>
    <div id="word047"
        style="position: absolute; left: 15px; top: 2122px; width: 212px; height: 52px; z-index: 6; "
        align="center">
        <table height="100%" >
            <tbody >
                <tr >
                    <td align="left" valign="middle" ><span class="catalogTitleBlack"
                            >Rabbid Simulation</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit047-01"
        style="position: absolute; left: 114px; top: 2176px; width: 84px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >Titles:</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit47-02"
        style="position: absolute; left: 198px; top: 2176px; width: 27px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >1</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="spacer047"
        style="position: absolute; left: 0px; top: 2117px; width: 244px; height: 91px; z-index: 7; "><a
            href="javascript:showPage('B_04.jsp?platform=WIIWARE&amp;p=1&amp;genre=Rabbid Simulation')"
            ><img src="/oss/oss/common/images//spacer.gif" name="Image047s" width="244" height="91"
                border="0" id="Image047s"
                onmouseover="MM_swapImage('Image047','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
                onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);" ></a></div>
    <div id="banner048"
        style="position: absolute; left: 244px; top: 2117px; width: 244px; height: 91px; z-index: 5; "><img
            src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91"
            id="Image048" ></div>
    <div id="word048"
        style="position: absolute; left: 259px; top: 2122px; width: 212px; height: 52px; z-index: 6; "
        align="center">
        <table height="100%" >
            <tbody >
                <tr >
                    <td align="left" valign="middle" ><span class="catalogTitleBlack"
                            >Racing</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit048-01"
        style="position: absolute; left: 358px; top: 2176px; width: 84px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >Titles:</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit48-02"
        style="position: absolute; left: 442px; top: 2176px; width: 27px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >11</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="spacer048"
        style="position: absolute; left: 244px; top: 2117px; width: 244px; height: 91px; z-index: 7; "><a
            href="javascript:showPage('B_04.jsp?platform=WIIWARE&amp;p=1&amp;genre=Racing')" ><img
                src="/oss/oss/common/images//spacer.gif" name="Image048s" width="244" height="91" border="0"
                id="Image048s"
                onmouseover="MM_swapImage('Image048','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
                onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);" ></a></div>
    <div id="banner049"
        style="position: absolute; left: 0px; top: 2209px; width: 244px; height: 91px; z-index: 5; "><img
            src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91" id="Image049"
            ></div>
    <div id="word049"
        style="position: absolute; left: 15px; top: 2214px; width: 212px; height: 52px; z-index: 6; "
        align="center">
        <table height="100%" >
            <tbody >
                <tr >
                    <td align="left" valign="middle" ><span class="catalogTitleBlack"
                            >Relaxation</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit049-01"
        style="position: absolute; left: 114px; top: 2268px; width: 84px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >Titles:</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit49-02"
        style="position: absolute; left: 198px; top: 2268px; width: 27px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >2</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="spacer049"
        style="position: absolute; left: 0px; top: 2209px; width: 244px; height: 91px; z-index: 7; "><a
            href="javascript:showPage('B_04.jsp?platform=WIIWARE&amp;p=1&amp;genre=Relaxation')"
            ><img src="/oss/oss/common/images//spacer.gif" name="Image049s" width="244" height="91"
                border="0" id="Image049s"
                onmouseover="MM_swapImage('Image049','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
                onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);" ></a></div>
    <div id="banner050"
        style="position: absolute; left: 244px; top: 2209px; width: 244px; height: 91px; z-index: 5; "><img
            src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91" id="Image050"
            ></div>
    <div id="word050"
        style="position: absolute; left: 259px; top: 2214px; width: 212px; height: 52px; z-index: 6; "
        align="center">
        <table height="100%" >
            <tbody >
                <tr >
                    <td align="left" valign="middle" ><span class="catalogTitleBlack"
                            >Retro Arcade Adventure</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit050-01"
        style="position: absolute; left: 358px; top: 2268px; width: 84px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >Titles:</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit50-02"
        style="position: absolute; left: 442px; top: 2268px; width: 27px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >1</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="spacer050"
        style="position: absolute; left: 244px; top: 2209px; width: 244px; height: 91px; z-index: 7; "><a
            href="javascript:showPage('B_04.jsp?platform=WIIWARE&amp;p=1&amp;genre=Retro Arcade Adventure')"
            ><img src="/oss/oss/common/images//spacer.gif" name="Image050s" width="244" height="91"
                border="0" id="Image050s"
                onmouseover="MM_swapImage('Image050','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
                onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);" ></a></div>
    <div id="banner051"
        style="position: absolute; left: 0px; top: 2301px; width: 244px; height: 91px; z-index: 5; "><img
            src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91" id="Image051"
            ></div>
    <div id="word051"
        style="position: absolute; left: 15px; top: 2306px; width: 212px; height: 52px; z-index: 6; "
        align="center">
        <table height="100%" >
            <tbody >
                <tr >
                    <td align="left" valign="middle" ><span class="catalogTitleBlack"
                            >Shooter</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit051-01"
        style="position: absolute; left: 114px; top: 2360px; width: 84px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >Titles:</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit51-02"
        style="position: absolute; left: 198px; top: 2360px; width: 27px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >6</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="spacer051"
        style="position: absolute; left: 0px; top: 2301px; width: 244px; height: 91px; z-index: 7; "><a
            href="javascript:showPage('B_04.jsp?platform=WIIWARE&amp;p=1&amp;genre=Shooter')"
            ><img src="/oss/oss/common/images//spacer.gif" name="Image051s" width="244" height="91"
                border="0" id="Image051s"
                onmouseover="MM_swapImage('Image051','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
                onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);" ></a></div>
    <div id="banner052"
        style="position: absolute; left: 244px; top: 2301px; width: 244px; height: 91px; z-index: 5; "><img
            src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91" id="Image052"
            ></div>
    <div id="word052"
        style="position: absolute; left: 259px; top: 2306px; width: 212px; height: 52px; z-index: 6; "
        align="center">
        <table height="100%" >
            <tbody >
                <tr >
                    <td align="left" valign="middle" ><span class="catalogTitleBlack"
                            >Shooter / Simulation</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit052-01"
        style="position: absolute; left: 358px; top: 2360px; width: 84px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >Titles:</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit52-02"
        style="position: absolute; left: 442px; top: 2360px; width: 27px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >1</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="spacer052"
        style="position: absolute; left: 244px; top: 2301px; width: 244px; height: 91px; z-index: 7; "><a
            href="javascript:showPage('B_04.jsp?platform=WIIWARE&amp;p=1&amp;genre=Shooter / Simulation')"
            ><img src="/oss/oss/common/images//spacer.gif" name="Image052s" width="244" height="91"
                border="0" id="Image052s"
                onmouseover="MM_swapImage('Image052','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
                onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);" ></a></div>
    <div id="banner053"
        style="position: absolute; left: 0px; top: 2393px; width: 244px; height: 91px; z-index: 5; "><img
            src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91" id="Image053"
            ></div>
    <div id="word053"
        style="position: absolute; left: 15px; top: 2398px; width: 212px; height: 52px; z-index: 6; "
        align="center">
        <table height="100%" >
            <tbody >
                <tr >
                    <td align="left" valign="middle" ><span class="catalogTitleBlack"
                            >Simulation</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit053-01"
        style="position: absolute; left: 114px; top: 2452px; width: 84px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >Titles:</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit53-02"
        style="position: absolute; left: 198px; top: 2452px; width: 27px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >10</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="spacer053"
        style="position: absolute; left: 0px; top: 2393px; width: 244px; height: 91px; z-index: 7; "><a
            href="javascript:showPage('B_04.jsp?platform=WIIWARE&amp;p=1&amp;genre=Simulation')"
            ><img src="/oss/oss/common/images//spacer.gif" name="Image053s" width="244" height="91"
                border="0" id="Image053s"
                onmouseover="MM_swapImage('Image053','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
                onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);" ></a></div>
    <div id="banner054"
        style="position: absolute; left: 244px; top: 2393px; width: 244px; height: 91px; z-index: 5; "><img
            src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91" id="Image054"
            ></div>
    <div id="word054"
        style="position: absolute; left: 259px; top: 2398px; width: 212px; height: 52px; z-index: 6; "
        align="center">
        <table height="100%" >
            <tbody >
                <tr >
                    <td align="left" valign="middle" ><span class="catalogTitleBlack"
                            >Simulation / Strategy</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit054-01"
        style="position: absolute; left: 358px; top: 2452px; width: 84px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >Titles:</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit54-02"
        style="position: absolute; left: 442px; top: 2452px; width: 27px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >1</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="spacer054"
        style="position: absolute; left: 244px; top: 2393px; width: 244px; height: 91px; z-index: 7; "><a
            href="javascript:showPage('B_04.jsp?platform=WIIWARE&amp;p=1&amp;genre=Simulation / Strategy')"
            ><img src="/oss/oss/common/images//spacer.gif" name="Image054s" width="244" height="91"
                border="0" id="Image054s"
                onmouseover="MM_swapImage('Image054','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
                onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);" ></a></div>
    <div id="banner055"
        style="position: absolute; left: 0px; top: 2485px; width: 244px; height: 91px; z-index: 5; "><img
            src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91" id="Image055"
            ></div>
    <div id="word055"
        style="position: absolute; left: 15px; top: 2490px; width: 212px; height: 52px; z-index: 6; "
        align="center">
        <table height="100%" >
            <tbody >
                <tr >
                    <td align="left" valign="middle" ><span class="catalogTitleBlack"
                            >Sports</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit055-01"
        style="position: absolute; left: 114px; top: 2544px; width: 84px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >Titles:</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit55-02"
        style="position: absolute; left: 198px; top: 2544px; width: 27px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >8</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="spacer055"
        style="position: absolute; left: 0px; top: 2485px; width: 244px; height: 91px; z-index: 7; "><a
            href="javascript:showPage('B_04.jsp?platform=WIIWARE&amp;p=1&amp;genre=Sports')" ><img
                src="/oss/oss/common/images//spacer.gif" name="Image055s" width="244" height="91" border="0"
                id="Image055s"
                onmouseover="MM_swapImage('Image055','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
                onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);" ></a></div>
    <div id="banner056"
        style="position: absolute; left: 244px; top: 2485px; width: 244px; height: 91px; z-index: 5; "><img
            src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91"
            id="Image056" ></div>
    <div id="word056"
        style="position: absolute; left: 259px; top: 2490px; width: 212px; height: 52px; z-index: 6; "
        align="center">
        <table height="100%" >
            <tbody >
                <tr >
                    <td align="left" valign="middle" ><span class="catalogTitleBlack"
                            >Strategy</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit056-01"
        style="position: absolute; left: 358px; top: 2544px; width: 84px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >Titles:</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit56-02"
        style="position: absolute; left: 442px; top: 2544px; width: 27px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >2</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="spacer056"
        style="position: absolute; left: 244px; top: 2485px; width: 244px; height: 91px; z-index: 7; "><a
            href="javascript:showPage('B_04.jsp?platform=WIIWARE&amp;p=1&amp;genre=Strategy')"
            ><img src="/oss/oss/common/images//spacer.gif" name="Image056s" width="244" height="91"
                border="0" id="Image056s"
                onmouseover="MM_swapImage('Image056','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
                onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);" ></a></div>
    <div id="banner057"
        style="position: absolute; left: 0px; top: 2577px; width: 244px; height: 91px; z-index: 5; "><img
            src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91" id="Image057"
            ></div>
    <div id="word057"
        style="position: absolute; left: 15px; top: 2582px; width: 212px; height: 52px; z-index: 6; "
        align="center">
        <table height="100%" >
            <tbody >
                <tr >
                    <td align="left" valign="middle" ><span class="catalogTitleBlack"
                            >Trivia Quiz</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit057-01"
        style="position: absolute; left: 114px; top: 2636px; width: 84px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >Titles:</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit57-02"
        style="position: absolute; left: 198px; top: 2636px; width: 27px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >3</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="spacer057"
        style="position: absolute; left: 0px; top: 2577px; width: 244px; height: 91px; z-index: 7; "><a
            href="javascript:showPage('B_04.jsp?platform=WIIWARE&amp;p=1&amp;genre=Trivia Quiz')"
            ><img src="/oss/oss/common/images//spacer.gif" name="Image057s" width="244" height="91"
                border="0" id="Image057s"
                onmouseover="MM_swapImage('Image057','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
                onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);" ></a></div>
    <div id="banner058"
        style="position: absolute; left: 244px; top: 2577px; width: 244px; height: 91px; z-index: 5; "><img
            src="/oss/oss/common/images//banner/B_04_half_genre_a.png" width="244" height="91"
            id="Image058" ></div>
    <div id="word058"
        style="position: absolute; left: 259px; top: 2582px; width: 212px; height: 52px; z-index: 6; "
        align="center">
        <table height="100%" >
            <tbody >
                <tr >
                    <td align="left" valign="middle" ><span class="catalogTitleBlack"
                            >Comical Action Shooter</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit058-01"
        style="position: absolute; left: 358px; top: 2636px; width: 84px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >Titles:</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="hit58-02"
        style="position: absolute; left: 442px; top: 2636px; width: 27px; height: 16px; z-index: 6; ">
        <table width="100%" height="100%" >
            <tbody >
                <tr >
                    <td align="right" valign="top" ><span class="contentsBlack"
                            >1</span></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div id="spacer058"
        style="position: absolute; left: 244px; top: 2577px; width: 244px; height: 91px; z-index: 7; "><a
            href="javascript:showPage('B_04.jsp?platform=WIIWARE&amp;p=1&amp;genre=Comical Action Shooter')"
            ><img src="/oss/oss/common/images//spacer.gif" name="Image058s" width="244" height="91"
                border="0" id="Image058s"
                onmouseover="MM_swapImage('Image058','','/oss/oss/common/images//banner/B_04_half_genre_b.png',1);snd.playSE( cSE_Forcus );"
                onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);" ></a></div>
</div>
<% } %>


<img src="/oss/oss/common/images//spacer.gif" width="1" height="1" id="Image10" />
</body>
</html>
