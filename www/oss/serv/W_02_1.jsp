<%@ page import = "java.io.*,java.util.*" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
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
	

	ecsUrl = 'https://ecs.a.taur.cloud/ecs/services/ECommerceSOAP';

	iasUrl = 'https://ias.a.taur.cloud/ias/services/IdentityAuthenticationSOAP';

	ccsUrl = 'https://ccs.blinklab.com/ccs/download';

	ucsUrl = 'https://ccs.blinklab.com/ccs/download';
	

	ec.setWebSvcUrls(ecsUrl, iasUrl);
	ec.setContentUrls (ccsUrl, ucsUrl);
	
	

	imagesPath = "/oss/oss/common/images/";
	htmlPath = "/oss/oss/common/html";
	ossPath = "https://oss-auth.a.taur.cloud/oss/serv/";
	secureOssPath = "https://oss-auth.a.taur.cloud/oss/serv/";	

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
<title>Important Info:</title>
<style type="text/css">
  /* W_02_1:  Welcome - Important Info */
.textImportantInfo {
	font-family: "Wii NTLG PGothic";
	font-size: 16px;
	color: #323232;
	font-weight: normal;
	line-height: 22px;
}

#text {
	position:absolute;
	left:10px;
	right:10px;
	z-index:1;
}

</style>
<script type="text/JavaScript">
<!--
function initPage()
{
	initPageCommon();
}
//-->
</script>
</head>
<%
String region = request.getParameter("region") == null ? "USA" : request.getParameter("region");
String code = "45";
if (region.equals("USA")) {
	code = "45";
} else if (region.equals("EUR")) {
	code = "50";
} else if (region.equals("JPN")) {
	code = "4A";
} else if (region.equals("KOR")) {
	code = "4B";
} else {
	code = "45";
}
%>
<body onload="initPage();var shop = new wiiShop();var unused = shop.connecting;">

<% if (request.getParameter("p").equals("1")) { %>
	<div id="text" style="overflow:hidden" class="textImportantInfo" >
		<script>
				if (ec.getSessionValue("currTitle") == "Wii Shop Channel") {
							document.write("Welcome to the Wii Shop Channel! If you encounter any errors, ");
									} else {
												document.write("Welcome to WiiMart! If you encounter any errors, ");
														}
															</script>
																<br>
																	be sure to report them in the discord.
																	<% }
								
%>
<body onload="initPage();var shop = new wiiShop();var unused = shop.connecting;">

<% if (request.getParameter("p").equals("1")) { %>
	<div id="text" style="overflow:hidden" class="textImportantInfo" >
	<script>
		if (ec.getSessionValue("currTitle") == "Wii Shop Channel") {
			document.write("Welcome to the Wii Shop Channel! If you encounter any errors, ");
		} else {
			document.write("Welcome to WiiMart! If you encounter any errors, ");
		}
	</script>
	<br>
	be sure to report them in the discord server in #support.
	<br><br>
	Happy shopping!
	
	- Ocarina
	</div>
<% } else if (request.getParameter("p").equals("2")) { %>
	<div id="text" style="overflow:hidden" class="textImportantInfo" ></div>
	Wii Channels are now downloadable! 
	<br>
	Get them by clicking "Start Shopping" and then "Wii Channels"!
</div>
<% } else if (request.getParameter("p").equals("3")) { %>
<div id="free">
  <div id="text" style="position:absolute; left:10px; right:10px; z-index:1; ; height: 240px; max-height:240px;" class="textImportantInfo">
<h2 id="__hello-again-wiimart-customers-__"><strong>Hello again, WiiMart Customers!</strong></h2>
<p>It&#39;s WiiMart Wednesday!</p>
<h1 id="__nintendo-64__"><strong>Nintendo 64</strong></h1>
<p>★ <strong><em>ClayFighter 63⅓</em></strong></p>
<p><small>Published by <strong><em>Subnetic, dustinbriggs1991</em></strong></small></p>
<h1 id="__super-nes-super-famicom__"><strong>Super NES / Super Famicom</strong></h1>
<p>★ <strong><em>Top Gear</em></strong></p>
<p>★ <strong><em>Top Gear 2</em></strong></p>
<p><small>Published by <strong><em>ThatOneYoshi</em></strong></small></p>
<p>☆ <strong><em>Claymates</em></strong></p>
<p><small>Published by <strong><em>Subnetic</em></strong></small></p>
<h1 id="__nes-famicom__"><strong>NES / Famicom</strong></h1>
<p>★ <strong><em>Moon Crystal</em></strong></p>
<p><small>Published by <strong><em>Elenawards / Baby Gaga</em></strong></small></p>
<h1 id="__sega-genesis-mega-drive__"><strong>SEGA Genesis / Mega Drive</strong></h1>
<p><strong>•</strong> <strong><em>SEGA Master System Brawl</em></strong></p>
<p><strong>•</strong> <strong><em>LEGO BATMAN</em></strong></p>
<p><small>Published by <strong><em>A For Animation</em></strong></small></p>
<p>★ <strong><em>Cyborg Justice</em></strong></p>
<p><small>Published by <strong><em>Subnetic</em></strong></small></p>
<p>★ <strong><em>TMNT: The Hyperstone Heist</em></strong></p>
<p><small>Published by <strong><em>dustinbriggs1991</em></strong></small></p>
<h1 id="__pc-engine-turbografx-16__"><strong>PC Engine / TurboGrafx-16</strong></h1>
<p>★ <strong><em>Jackie Chan&#39;s Action Kung Fu</em></strong></p>
<p><small>Published by <strong><em>Subnetic</em></strong></small></p>
<p><strong>All titles supporting US, EU, and JP regions</strong>
<strong>Titles marked with a &#39;★&#39; indicate an official or licensed title</strong></p>
<p>Special thanks for these contributions go out to:</p>
<p>A For Animation
<br>
Elenawards / Baby Gaga
<br>
dustinbriggs1991
<br>
<br>
Happy shopping!</p>

  </div>
</div>
<% } else if (request.getParameter("p").equals("5")) { %>
	<div id="free">
		<div id="text" style="position:absolute; left:10px; right:10px; z-index:1; height: 240px; max-height:240px;" class="textImportantInfo">
		<h1>New <script>if (ec.getSessionValue("currTitle")=="Wii Shop Channel") {document.write(shop.title)} else {document.write("WiiMart")};</script><br><br>Features!</h1>
			Some people have been complaining about how the "debug" in the top left ruins the experience of a true Wii Shop Channel revival,
			so a new feature in WiiMart is OG Mode! It will remove all debug text from the shop so it looks like the Wii Shop Channel back then!
			<hr style="margin-bottom:8px;">
			<p style="font-weight:bold;">To access this new feature, just select "Back" and then "Start Shopping." Go into settings and go to the very bottom to enable it!</p>
		</div>
	</div>
<% } else if (request.getParameter("p").equals("6")) { %>
<div id="free">
    <div id="text" style="position:absolute; left:10px; right:10px; z-index:1;  height: 240px; max-height:240px;" class="textImportantInfo">
After months of anticipation, the first Flash titles in the WiiWare™ <br>
family of games are available from the Wii™ Shop Channel! <br>
Nintendo's latest revolution in the video game world lets <br>
developers of any size bring their innovative ideas and <br>
engaging game play to eager consumer looking for <br>
something new.
<br><br>

Easy to access and simple to use, WiiWare games will be available to download from the Wii Shop Channel at a cost starting at 500 Wii Points. <br> To date, a vast array of exciting and creative new projects are already in the pipeline, ensuring fresh concepts and content will frequently become available for all to enjoy. <br>  Players themselves will also become central to the creative process as their download choices and genre selection will become instrumental in helping developers determine future projects.


<hr style="margin-bottom:8px;">
<p style="font-weight:bold;">To find these newest Flash WiiWare™ additions, just select "Back" and <br> then "Start Shopping." They can all be found in the WiiWare section.</p>

</div>
  </div>
<% } else if (request.getParameter("p").equals("12")) { %>
	<div id="free">
	<div id="text" style="position: absolute; left: 10px; z-index: 1; height:240px; max-height: 240px;" class="textImportantInfo">
		Dynamic Banners are now available!<br/>To get started, leave your console in standby mode for 6 hours.<br/><br/>NOTE: vWii (Wii U)/Dolphin users must idle in the Wii Menu or any other app to get the banner.<br/><BR/>NOTE: Dynamic banners are not available on the old banner version of WiiMart.
	</div>
	</div>
<% } else { %>
	<div id="text" style="overflow:hidden" class="textImportantInfo">
	Welcome to the WiiMart! If you encounter any errors, 
	<br>
	be sure to report them in the discord server in #support.
	<br><br>
	Happy shopping!
	
	- Ocarina
	</div>
<% } %>
</body>
</html>
