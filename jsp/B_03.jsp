

<a href="https://oss-auth.thecheese.io/oss/serv/debug.jsp">debug</a>



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
<script type="text/javascript">
	var ecCheck = false;
	var errorCheck = false;
	var buttonsCheck = false;
	var imagesCheck = false;
	var soundCheck = false;
	var shopCheck = false;
	var ossCheck = false;
//-->
</script>

<script src="/oss/oss/common/js/ec.js"></script>
<script src='/oss/oss/common/js/error.js'></script>
<script src="/oss/oss/common/js/buttons.js"></script>
<script src="/oss/oss/common/js/images.js"></script>
<script src='/oss/oss/common/js/sound.js'></script>
<script src="/oss/oss/common/js/shop.js"></script>
<script src="/oss/oss/common/js/oss.js"></script>

<script type="text/javascript">
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

	ccsUrl = 'http://ccs.larsenv.xyz/ccs/download';

	ucsUrl = 'http://ccs.larsenv.xyz/ccs/download';
	

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
<title>Search by System</title>
<style type="text/css">
  /* B_03:  Select Platform (VC) */

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
<script>
function checkIfVC() {
  if (getParam("vc") == "true") {
    document.location.pathname = '/oss/serv/vc/B_03.jsp';
  };
}
function initPage()
{
  checkIfVC();
  initPageCommon();
	MM_preloadImages('/oss/oss/common/images//banner/under_banner_b.gif','/oss/oss/common/images//banner/help_b.gif',
	'/oss/oss/common/images//banner/top_b.gif','/oss/oss/common/images//banner/B_04_halfB_consolebannerE_b.png');
	setUnderButtonL(true, "Back", "javascript:showPage('B_23.jsp')", "snd.playSE(cSE_Cancel)");
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
  <div align="left"><span class="titleBlackL">Search by System</span></div>
</div>
<div style="position:absolute; left:0px; top:0px; width:1px; height:1px; z-index:6;">
  <img src="/oss/oss/common/images//spacer.gif" name="ktouch" width="1" height="1" border="0" id="ktouch"/>
</div>

<div id="searchItem" class="searchItem">

<div id="banner01" style="position:absolute; left:0px; top:1.0px; width:244px; height:91px; z-index:5;">
      <img src="/oss/oss/common/images//banner/B_04_halfB_consolebannerE_a.png" width="244" height="91" id="Image01" />
    </div>
    <div id="logo01" style="position:absolute; left:11px; top:9.0px; width:110px; height:52px; z-index:6;">
      <img src="/oss/oss/ext/attributes/images/platform/Plat_WII_E.gif" width="110" height="52" id="Logo01" />
    </div>
    <div id="word01" style="position:absolute; left:11px; top:62.0px; width:225px; height:20px; z-index:6; overflow: hidden;">
      <table width="100%" height="100%">
      <tr>
        <td align="left" valign="top">
          <span class="contentsBlack">Wii Channels</span>
        </td>
      </tr>
      </table>
    </div>
    <div id="hit01-01" style="position:absolute; left:122px; top:25.0px; width:76px; height:16px; z-index:6;">
      <table width="100%" height="100%">
      <tr>
        <td align="right" valign="top">
          <span class="contentsBlack">Titles:</span>
        </td>
      </tr>
      </table>
    </div>
    <div id="hit01-02" style="position:absolute; left:198px; top:25.0px; width:31px; height:16px; z-index:6;">
      <table width="100%" height="100%">
      <tr>
        <td align="right" valign="top">
          <span class="contentsBlack">7</span>
        </td>
      </tr>
      </table>
    </div>
    <div id="spacer01" style="position:absolute; left:0px; top:1.0px; width:244px; height:91px; z-index:7;">
      <a href="javascript:showPage('B_04.jsp?p=1&vc=true&platform=WII')">
        <img src="/oss/oss/common/images//spacer.gif" name="Image01s" width="244" height="91" border="0" id="Image01s" 
         onmouseover="MM_swapImage('Image01','','/oss/oss/common/images//banner/B_04_halfB_consolebannerE_b.png',1);snd.playSE( cSE_Forcus );" 
         onmouseout="MM_swapImgRestore()" 
         onclick="snd.playSE(cSE_Decide);" />
       </a>
     </div>
  <div id="banner02" style="position:absolute; left:244px; top:1.0px; width:244px; height:91px; z-index:5;">
      <img src="/oss/oss/common/images//banner/B_04_halfB_consolebannerE_a.png" width="244" height="91" id="Image02" />
    </div>
    <div id="logo02" style="position:absolute; left:255px; top:9.0px; width:110px; height:52px; z-index:6;">
      <img src="/oss/oss/ext/attributes/images/platform/Plat_FC_NES_E.gif" width="110" height="52" id="Logo02" />
    </div>
    <div id="word02" style="position:absolute; left:255px; top:62.0px; width:225px; height:20px; z-index:6; overflow: hidden;">
      <table width="100%" height="100%">
      <tr>
        <td align="left" valign="top">
          <span class="contentsBlack">NES</span>
        </td>
      </tr>
      </table>
    </div>
    <div id="hit02-01" style="position:absolute; left:366px; top:25.0px; width:76px; height:16px; z-index:6;">
      <table width="100%" height="100%">
      <tr>
        <td align="right" valign="top">
          <span class="contentsBlack">Titles:</span>
        </td>
      </tr>
      </table>
    </div>
    <div id="hit02-02" style="position:absolute; left:442px; top:25.0px; width:31px; height:16px; z-index:6;">
      <table width="100%" height="100%">
      <tr>
        <td align="right" valign="top">
          <span class="contentsBlack">92</span>
        </td>
      </tr>
      </table>
    </div>
    <div id="spacer02" style="position:absolute; left:244px; top:1.0px; width:244px; height:91px; z-index:7;">
      <a href="javascript:showPage('B_04.jsp?p=1&vc=true&platform=FC%2fNES')">
        <img src="/oss/oss/common/images//spacer.gif" name="Image02s" width="244" height="91" border="0" id="Image02s" 
         onmouseover="MM_swapImage('Image02','','/oss/oss/common/images//banner/B_04_halfB_consolebannerE_b.png',1);snd.playSE( cSE_Forcus );" 
         onmouseout="MM_swapImgRestore()" 
         onclick="snd.playSE(cSE_Decide);" />
       </a>
     </div>
  <div id="banner03" style="position:absolute; left:0px; top:93.0px; width:244px; height:91px; z-index:5;">
      <img src="/oss/oss/common/images//banner/B_04_halfB_consolebannerE_a.png" width="244" height="91" id="Image03" />
    </div>
    <div id="logo03" style="position:absolute; left:11px; top:101.0px; width:110px; height:52px; z-index:6;">
      <img src="/oss/oss/ext/attributes/images/platform/Plat_SFC_SNES_E.gif" width="110" height="52" id="Logo03" />
    </div>
    <div id="word03" style="position:absolute; left:11px; top:154.0px; width:225px; height:20px; z-index:6; overflow: hidden;">
      <table width="100%" height="100%">
      <tr>
        <td align="left" valign="top">
          <span class="contentsBlack">Super NES</span>
        </td>
      </tr>
      </table>
    </div>
    <div id="hit03-01" style="position:absolute; left:122px; top:117.0px; width:76px; height:16px; z-index:6;">
      <table width="100%" height="100%">
      <tr>
        <td align="right" valign="top">
          <span class="contentsBlack">Titles:</span>
        </td>
      </tr>
      </table>
    </div>
    <div id="hit03-02" style="position:absolute; left:198px; top:117.0px; width:31px; height:16px; z-index:6;">
      <table width="100%" height="100%">
      <tr>
        <td align="right" valign="top">
          <span class="contentsBlack">63</span>
        </td>
      </tr>
      </table>
    </div>
    <div id="spacer03" style="position:absolute; left:0px; top:93.0px; width:244px; height:91px; z-index:7;">
      <a href="javascript:showPage('B_04.jsp?p=1&vc=true&platform=SFC%2fSNES')">
        <img src="/oss/oss/common/images//spacer.gif" name="Image03s" width="244" height="91" border="0" id="Image03s" 
         onmouseover="MM_swapImage('Image03','','/oss/oss/common/images//banner/B_04_halfB_consolebannerE_b.png',1);snd.playSE( cSE_Forcus );" 
         onmouseout="MM_swapImgRestore()" 
         onclick="snd.playSE(cSE_Decide);" />
       </a>
     </div>
  <div id="banner04" style="position:absolute; left:244px; top:93.0px; width:244px; height:91px; z-index:5;">
      <img src="/oss/oss/common/images//banner/B_04_halfB_consolebannerE_a.png" width="244" height="91" id="Image04" />
    </div>
    <div id="logo04" style="position:absolute; left:255px; top:101.0px; width:110px; height:52px; z-index:6;">
      <img src="/oss/oss/ext/attributes/images/platform/Plat_N64_E.gif" width="110" height="52" id="Logo04" />
    </div>
    <div id="word04" style="position:absolute; left:255px; top:154.0px; width:225px; height:20px; z-index:6; overflow: hidden;">
      <table width="100%" height="100%">
      <tr>
        <td align="left" valign="top">
          <span class="contentsBlack">Nintendo 64</span>
        </td>
      </tr>
      </table>
    </div>
    <div id="hit04-01" style="position:absolute; left:366px; top:117.0px; width:76px; height:16px; z-index:6;">
      <table width="100%" height="100%">
      <tr>
        <td align="right" valign="top">
          <span class="contentsBlack">Titles:</span>
        </td>
      </tr>
      </table>
    </div>
    <div id="hit04-02" style="position:absolute; left:442px; top:117.0px; width:31px; height:16px; z-index:6;">
      <table width="100%" height="100%">
      <tr>
        <td align="right" valign="top">
          <span class="contentsBlack">21</span>
        </td>
      </tr>
      </table>
    </div>
    <div id="spacer04" style="position:absolute; left:244px; top:93.0px; width:244px; height:91px; z-index:7;">
      <a href="javascript:showPage('B_04.jsp?p=1&vc=true&platform=N64')">
        <img src="/oss/oss/common/images//spacer.gif" name="Image04s" width="244" height="91" border="0" id="Image04s" 
         onmouseover="MM_swapImage('Image04','','/oss/oss/common/images//banner/B_04_halfB_consolebannerE_b.png',1);snd.playSE( cSE_Forcus );" 
         onmouseout="MM_swapImgRestore()" 
         onclick="snd.playSE(cSE_Decide);" />
       </a>
     </div>
  <div id="banner05" style="position:absolute; left:0px; top:185.0px; width:244px; height:91px; z-index:5;">
      <img src="/oss/oss/common/images//banner/B_04_halfB_consolebannerE_a.png" width="244" height="91" id="Image05" />
    </div>
    <div id="logo05" style="position:absolute; left:11px; top:193.0px; width:110px; height:52px; z-index:6;">
      <img src="/oss/oss/ext/attributes/images/platform/Plat_PCE_TG16_E.gif" width="110" height="52" id="Logo05" />
    </div>
    <div id="word05" style="position:absolute; left:11px; top:246.0px; width:225px; height:20px; z-index:6; overflow: hidden;">
      <table width="100%" height="100%">
      <tr>
        <td align="left" valign="top">
          <span class="contentsBlack">TurboGrafx16</span>
        </td>
      </tr>
      </table>
    </div>
    <div id="hit05-01" style="position:absolute; left:122px; top:209.0px; width:76px; height:16px; z-index:6;">
      <table width="100%" height="100%">
      <tr>
        <td align="right" valign="top">
          <span class="contentsBlack">Titles:</span>
        </td>
      </tr>
      </table>
    </div>
    <div id="hit05-02" style="position:absolute; left:198px; top:209.0px; width:31px; height:16px; z-index:6;">
      <table width="100%" height="100%">
      <tr>
        <td align="right" valign="top">
          <span class="contentsBlack">58</span>
        </td>
      </tr>
      </table>
    </div>
    <div id="spacer05" style="position:absolute; left:0px; top:185.0px; width:244px; height:91px; z-index:7;">
      <a href="javascript:showPage('B_04.jsp?p=1&vc=true&platform=PCE%2fTG16')">
        <img src="/oss/oss/common/images//spacer.gif" name="Image05s" width="244" height="91" border="0" id="Image05s" 
         onmouseover="MM_swapImage('Image05','','/oss/oss/common/images//banner/B_04_halfB_consolebannerE_b.png',1);snd.playSE( cSE_Forcus );" 
         onmouseout="MM_swapImgRestore()" 
         onclick="snd.playSE(cSE_Decide);" />
       </a>
     </div>
  <div id="banner06" style="position:absolute; left:244px; top:185.0px; width:244px; height:91px; z-index:5;">
      <img src="/oss/oss/common/images//banner/B_04_halfB_consolebannerE_a.png" width="244" height="91" id="Image06" />
    </div>
    <div id="logo06" style="position:absolute; left:255px; top:193.0px; width:110px; height:52px; z-index:6;">
      <img src="/oss/oss/ext/attributes/images/platform/Plat_MD_GEN_E.gif" width="110" height="52" id="Logo06" />
    </div>
    <div id="word06" style="position:absolute; left:255px; top:246.0px; width:225px; height:20px; z-index:6; overflow: hidden;">
      <table width="100%" height="100%">
      <tr>
        <td align="left" valign="top">
          <span class="contentsBlack">Sega Genesis</span>
        </td>
      </tr>
      </table>
    </div>
    <div id="hit06-01" style="position:absolute; left:366px; top:209.0px; width:76px; height:16px; z-index:6;">
      <table width="100%" height="100%">
      <tr>
        <td align="right" valign="top">
          <span class="contentsBlack">Titles:</span>
        </td>
      </tr>
      </table>
    </div>
    <div id="hit06-02" style="position:absolute; left:442px; top:209.0px; width:31px; height:16px; z-index:6;">
      <table width="100%" height="100%">
      <tr>
        <td align="right" valign="top">
          <span class="contentsBlack">73</span>
        </td>
      </tr>
      </table>
    </div>
    <div id="spacer06" style="position:absolute; left:244px; top:185.0px; width:244px; height:91px; z-index:7;">
      <a href="javascript:showPage('B_04.jsp?p=1&vc=true&platform=MD%2fGEN')">
        <img src="/oss/oss/common/images//spacer.gif" name="Image06s" width="244" height="91" border="0" id="Image06s" 
         onmouseover="MM_swapImage('Image06','','/oss/oss/common/images//banner/B_04_halfB_consolebannerE_b.png',1);snd.playSE( cSE_Forcus );" 
         onmouseout="MM_swapImgRestore()" 
         onclick="snd.playSE(cSE_Decide);" />
       </a>
     </div>
  <div id="banner07" style="position:absolute; left:0px; top:277.0px; width:244px; height:91px; z-index:5;">
      <img src="/oss/oss/common/images//banner/B_04_halfB_consolebannerE_a.png" width="244" height="91" id="Image07" />
    </div>
    <div id="logo07" style="position:absolute; left:11px; top:285.0px; width:110px; height:52px; z-index:6;">
      <img src="/oss/oss/ext/attributes/images/platform/Plat_NEOGEO_E.gif" width="110" height="52" id="Logo07" />
    </div>
    <div id="word07" style="position:absolute; left:11px; top:338.0px; width:225px; height:20px; z-index:6; overflow: hidden;">
      <table width="100%" height="100%">
      <tr>
        <td align="left" valign="top">
          <span class="contentsBlack">NEOGEO</span>
        </td>
      </tr>
      </table>
    </div>
    <div id="hit07-01" style="position:absolute; left:122px; top:301.0px; width:76px; height:16px; z-index:6;">
      <table width="100%" height="100%">
      <tr>
        <td align="right" valign="top">
          <span class="contentsBlack">Titles:</span>
        </td>
      </tr>
      </table>
    </div>
    <div id="hit07-02" style="position:absolute; left:198px; top:301.0px; width:31px; height:16px; z-index:6;">
      <table width="100%" height="100%">
      <tr>
        <td align="right" valign="top">
          <span class="contentsBlack">54</span>
        </td>
      </tr>
      </table>
    </div>
    <div id="spacer07" style="position:absolute; left:0px; top:277.0px; width:244px; height:91px; z-index:7;">
      <a href="javascript:showPage('B_04.jsp?p=1&vc=true&platform=NEOGEO')">
        <img src="/oss/oss/common/images//spacer.gif" name="Image07s" width="244" height="91" border="0" id="Image07s" 
         onmouseover="MM_swapImage('Image07','','/oss/oss/common/images//banner/B_04_halfB_consolebannerE_b.png',1);snd.playSE( cSE_Forcus );" 
         onmouseout="MM_swapImgRestore()" 
         onclick="snd.playSE(cSE_Decide);" />
       </a>
     </div>
  <div id="banner08" style="position:absolute; left:244px; top:277.0px; width:244px; height:91px; z-index:5;">
      <img src="/oss/oss/common/images//banner/B_04_halfB_consolebannerE_a.png" width="244" height="91" id="Image08" />
    </div>
    <div id="logo08" style="position:absolute; left:255px; top:285.0px; width:110px; height:52px; z-index:6;">
      <img src="/oss/oss/ext/attributes/images/platform/Plat_MASTER_E.gif" width="110" height="52" id="Logo08" />
    </div>
    <div id="word08" style="position:absolute; left:255px; top:338.0px; width:225px; height:20px; z-index:6; overflow: hidden;">
      <table width="100%" height="100%">
      <tr>
        <td align="left" valign="top">
          <span class="contentsBlack">MASTER SYSTEM</span>
        </td>
      </tr>
      </table>
    </div>
    <div id="hit08-01" style="position:absolute; left:366px; top:301.0px; width:76px; height:16px; z-index:6;">
      <table width="100%" height="100%">
      <tr>
        <td align="right" valign="top">
          <span class="contentsBlack">Titles:</span>
        </td>
      </tr>
      </table>
    </div>
    <div id="hit08-02" style="position:absolute; left:442px; top:301.0px; width:31px; height:16px; z-index:6;">
      <table width="100%" height="100%">
      <tr>
        <td align="right" valign="top">
          <span class="contentsBlack">15</span>
        </td>
      </tr>
      </table>
    </div>
    <div id="spacer08" style="position:absolute; left:244px; top:277.0px; width:244px; height:91px; z-index:7;">
      <a href="javascript:showPage('B_04.jsp?p=1&vc=true&platform=MASTER')">
        <img src="/oss/oss/common/images//spacer.gif" name="Image08s" width="244" height="91" border="0" id="Image08s" 
         onmouseover="MM_swapImage('Image08','','/oss/oss/common/images//banner/B_04_halfB_consolebannerE_b.png',1);snd.playSE( cSE_Forcus );" 
         onmouseout="MM_swapImgRestore()" 
         onclick="snd.playSE(cSE_Decide);" />
       </a>
     </div>
  <div id="banner09" style="position:absolute; left:0px; top:369.0px; width:244px; height:91px; z-index:5;">
      <img src="/oss/oss/common/images//banner/B_04_halfB_consolebannerE_a.png" width="244" height="91" id="Image09" />
    </div>
    <div id="logo09" style="position:absolute; left:11px; top:377.0px; width:110px; height:52px; z-index:6;">
      <img src="/oss/oss/ext/attributes/images/platform/Plat_VCA_E.gif" width="110" height="52" id="Logo09" />
    </div>
    <div id="word09" style="position:absolute; left:11px; top:430.0px; width:225px; height:20px; z-index:6; overflow: hidden;">
      <table width="100%" height="100%">
      <tr>
        <td align="left" valign="top">
          <span class="contentsBlack">Virtual Console Arcade</span>
        </td>
      </tr>
      </table>
    </div>
    <div id="hit09-01" style="position:absolute; left:122px; top:393.0px; width:76px; height:16px; z-index:6;">
      <table width="100%" height="100%">
      <tr>
        <td align="right" valign="top">
          <span class="contentsBlack">Titles:</span>
        </td>
      </tr>
      </table>
    </div>
    <div id="hit09-02" style="position:absolute; left:198px; top:393.0px; width:31px; height:16px; z-index:6;">
      <table width="100%" height="100%">
      <tr>
        <td align="right" valign="top">
          <span class="contentsBlack">21</span>
        </td>
      </tr>
      </table>
    </div>
    <div id="spacer09" style="position:absolute; left:0px; top:369.0px; width:244px; height:91px; z-index:7;">
      <a href="javascript:showPage('B_04.jsp?p=1&vc=true&platform=VCA')">
        <img src="/oss/oss/common/images//spacer.gif" name="Image09s" width="244" height="91" border="0" id="Image09s" 
         onmouseover="MM_swapImage('Image09','','/oss/oss/common/images//banner/B_04_halfB_consolebannerE_b.png',1);snd.playSE( cSE_Forcus );" 
         onmouseout="MM_swapImgRestore()" 
         onclick="snd.playSE(cSE_Decide);" />
       </a>
     </div>
  <div id="banner010" style="position:absolute; left:244px; top:369.0px; width:244px; height:91px; z-index:5;">
      <img src="/oss/oss/common/images//banner/B_04_halfB_consolebannerE_a.png" width="244" height="91" id="Image010" />
    </div>
    <div id="logo010" style="position:absolute; left:255px; top:377.0px; width:110px; height:52px; z-index:6;">
      <img src="/oss/oss/ext/attributes/images/platform/Plat_WIIWARE_E.gif" width="110" height="52" id="Logo010" />
    </div>
    <div id="word010" style="position:absolute; left:255px; top:430.0px; width:225px; height:20px; z-index:6; overflow: hidden;">
      <table width="100%" height="100%">
      <tr>
        <td align="left" valign="top">
          <span class="contentsBlack">WiiWare</span>
        </td>
      </tr>
      </table>
    </div>
    <div id="hit010-01" style="position:absolute; left:366px; top:393.0px; width:76px; height:16px; z-index:6;">
      <table width="100%" height="100%">
      <tr>
        <td align="right" valign="top">
          <span class="contentsBlack">Titles:</span>
        </td>
      </tr>
      </table>
    </div>
    <div id="hit010-02" style="position:absolute; left:442px; top:393.0px; width:31px; height:16px; z-index:6;">
      <table width="100%" height="100%">
      <tr>
        <td align="right" valign="top">
          <span class="contentsBlack">364</span>
        </td>
      </tr>
      </table>
    </div>
    <div id="spacer010" style="position:absolute; left:244px; top:369.0px; width:244px; height:91px; z-index:7;">
      <a href="javascript:showPage('B_04.jsp?p=1&vc=true&platform=WIIWARE')">
        <img src="/oss/oss/common/images//spacer.gif" name="Image010s" width="244" height="91" border="0" id="Image010s" 
         onmouseover="MM_swapImage('Image010','','/oss/oss/common/images//banner/B_04_halfB_consolebannerE_b.png',1);snd.playSE( cSE_Forcus );" 
         onmouseout="MM_swapImgRestore()" 
         onclick="snd.playSE(cSE_Decide);" />
       </a>
     </div>
  </div>

<img src="/oss/oss/common/images//spacer.gif" width="1" height="1" id="Image10" />
</body>
</html>