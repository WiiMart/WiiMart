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

	ccsUrl = 'http://ccs.cdn.thecheese.io/ccs/download';

	ucsUrl = 'https://ccs.thecheese.io/ccs/download';
	

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
	a[-(EC_ERROR_NET_NA)] = "Er kon geen verbinding worden gemaakt met het netwerk. Controleer de internet- en netwerkinstellingen.";
	a[-(EC_ERROR_ECARD)] = "Het Nintendo eShop Card-nummer klopt niet.<BR><BR>Probeer het nog eens.";
	a[-(EC_ERROR_REGISTER)] = "Het Wii-nummer dat je hebt ingevoerd, klopt niet.";
	a[-(EC_ERROR_ALREADY_OWN)] = "Er is een fout opgetreden die op dit moment niet verholpen kan worden. Probeer het later nog eens.<BR><BR>Neem contact op met de klantenservice als dit probleem zich blijft voordoen. Kijk op support.nintendo.com voor meer informatie.";
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
    		    msg = "Er kon geen verbinding worden gemaakt met het netwerk. Controleer de instellingen onder INTERNET in de systeeminstellingen van het Wii U-menu.";
    		} else if (nhttpStatus == 0) {
    		    msg = "Er kon geen verbinding worden gemaakt met het netwerk. Controleer de internet- en netwerkinstellingen.";
    		} else if (nhttpStatus != 0) {
    		    msg = "Er is een fout opgetreden die op dit moment niet verholpen kan worden. Probeer het later nog eens.<BR><BR>Neem contact op met de klantenservice als dit probleem zich blijft voordoen. Kijk op support.nintendo.com voor meer informatie.";
    		}
    	}
    }
        
    if (msg == null || msg == '') {
    	msg = "Er is een fout opgetreden die op dit moment niet verholpen kan worden. Probeer het later nog eens.<BR><BR>Neem contact op met de klantenservice als dit probleem zich blijft voordoen. Kijk op support.nintendo.com voor meer informatie.";
	}
	return msg;
}

function setErrorHtmlMsg(elem, errorCode, errorMsg)
{
    var html =
	 	'<span class="warningRed">'
		+ "Fout <span id='errorCode'></span></span>"
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
	a[617] = "Het Nintendo eShop Card-nummer klopt niet.<BR><BR>Probeer het nog eens.";
	a[618] = "Deze Nintendo eShop Card kan niet worden gebruikt in jouw regio.";
	a[621] = "Er is een fout opgetreden die op dit moment niet verholpen kan worden. Probeer het later nog eens.<BR><BR>Neem contact op met de klantenservice als dit probleem zich blijft voordoen. Kijk op support.nintendo.com voor meer informatie.";
	a[623]	= "Deze software heb je eerder gedownload. De testperiode is verstreken. Je kunt deze software niet nog eens downloaden.";
	a[642] = "Er is een fout opgetreden die op dit moment niet verholpen kan worden. Probeer het later nog eens.<BR><BR>Neem contact op met de klantenservice als dit probleem zich blijft voordoen. Kijk op support.nintendo.com voor meer informatie.";
	a[643] = "Er is een fout opgetreden die op dit moment niet verholpen kan worden. Probeer het later nog eens.<BR><BR>Neem contact op met de klantenservice als dit probleem zich blijft voordoen. Kijk op support.nintendo.com voor meer informatie.";
	a[644] = "Creditcards kunnen niet met dit systeem worden gebruikt.<BR><BR>Neem contact op met de klantenservice als dit probleem zich blijft voordoen. Kijk op support.nintendo.com voor meer informatie.";
	a[645] = "Er is een fout opgetreden die op dit moment niet verholpen kan worden. Probeer het later nog eens.<BR><BR>Neem contact op met de klantenservice als dit probleem zich blijft voordoen. Kijk op support.nintendo.com voor meer informatie.";
	
	// ECS Gift Errors
	a[646] = "Er is een fout opgetreden die op dit moment niet verholpen kan worden. Probeer het later nog eens.<BR><BR>Neem contact op met de klantenservice als dit probleem zich blijft voordoen. Kijk op support.nintendo.com voor meer informatie.";
	a[621] = "Er is een fout opgetreden die op dit moment niet verholpen kan worden. Probeer het later nog eens.<BR><BR>Neem contact op met de klantenservice als dit probleem zich blijft voordoen. Kijk op support.nintendo.com voor meer informatie.";
	a[626] = "Er is een fout opgetreden die op dit moment niet verholpen kan worden. Probeer het later nog eens.<BR><BR>Neem contact op met de klantenservice als dit probleem zich blijft voordoen. Kijk op support.nintendo.com voor meer informatie.";
	a[625] = "Er is een fout opgetreden die op dit moment niet verholpen kan worden. Probeer het later nog eens.<BR><BR>Neem contact op met de klantenservice als dit probleem zich blijft voordoen. Kijk op support.nintendo.com voor meer informatie.";
	
	// ETS Errors
	a[705] = "Er is een fout opgetreden die op dit moment niet verholpen kan worden. Probeer het later nog eens.<BR><BR>Neem contact op met de klantenservice als dit probleem zich blijft voordoen. Kijk op support.nintendo.com voor meer informatie.";
	a[706] = "Er is een fout opgetreden die op dit moment niet verholpen kan worden. Probeer het later nog eens.<BR><BR>Neem contact op met de klantenservice als dit probleem zich blijft voordoen. Kijk op support.nintendo.com voor meer informatie.";
	a[707] = "Er is een fout opgetreden die op dit moment niet verholpen kan worden. Probeer het later nog eens.<BR><BR>Neem contact op met de klantenservice als dit probleem zich blijft voordoen. Kijk op support.nintendo.com voor meer informatie.";
	
	// PAS Errors
	a[810]	= "Er is een fout opgetreden bij het verwerken van de Wii Points. Probeer het nog eens.<BR><BR>Neem contact op met de klantenservice als dit probleem zich blijft voordoen. Kijk op support.nintendo.com voor meer informatie.";
	a[811]	= "Het nummer dat je hebt ingevoerd, is niet langer geldig.";
	//a[812]	= "???OSS_ERROR_ECARD_NOT_USABLE???";
	//a[813]	= "???OSS_ERROR_ECARD_NOT_USABLE???";
	//a[814]	= "???OSS_ERROR_ECARD_NOT_USABLE???";
	a[815]	= "Deze Nintendo eShop Card is al gebruikt.";
	a[819]	= "Het Nintendo eShop Card-nummer klopt niet.<BR><BR>Probeer het nog eens.";
	
	a[826]	= "De server is bezet.<BR><BR>Probeer het later nog eens.";
	a[829]	= "De server is bezet.<BR><BR>Probeer het later nog eens.";
	a[830]	= "Het Nintendo eShop Card-nummer klopt niet.<BR><BR>Probeer het nog eens.";
	a[831] = "Deze Nintendo eShop Card kan niet worden gebruikt in jouw regio.";

	// IAS Errors 
	a[901]	= "Het Wii-nummer dat je hebt ingevoerd, klopt niet.";
	a[903]	= "Er is een fout opgetreden die op dit moment niet verholpen kan worden. Probeer het later nog eens.<BR><BR>Neem contact op met de klantenservice als dit probleem zich blijft voordoen. Kijk op support.nintendo.com voor meer informatie.";
	a[928] = "Er is een fout opgetreden die op dit moment niet verholpen kan worden. Probeer het later nog eens.<BR><BR>Neem contact op met de klantenservice als dit probleem zich blijft voordoen. Kijk op support.nintendo.com voor meer informatie.";
	a[958]	= "Er is een fout opgetreden die op dit moment niet verholpen kan worden. Probeer het later nog eens.<BR><BR>Neem contact op met de klantenservice als dit probleem zich blijft voordoen. Kijk op support.nintendo.com voor meer informatie.";
	a[942] = "Het is niet gelukt om het e-mailadres te bevestigen, vanwege een fout met de server.<BR><BR>Probeer het later nog eens.";
	a[943]	= "Het e-mailadres of wachtwoord klopt niet. Controleer de informatie en probeer het nog eens.<BR><BR>Ga naar www.club-nintendo.com als je je inschrijvingsgegevens bent vergeten.";

	a[941] = "Het e-mailadres of wachtwoord klopt niet. Controleer de informatie en probeer het nog eens.<BR><BR>Ga naar www.club-nintendo.com als je je inschrijvingsgegevens bent vergeten.";
	
	// More IAS Errors
	a[1401] = "Het e-mailadres of wachtwoord klopt niet. Controleer de informatie en probeer het nog eens.<BR><BR>Ga naar www.club-nintendo.com als je je inschrijvingsgegevens bent vergeten.";
	a[1402] = "Door de beperkingen op je Club Nintendo-lidmaatschap, kan het niet worden gekoppeld aan dit Wii-winkelaccount.";
        a[1403] = "Door de beperkingen op je Club Nintendo-lidmaatschap, kan het niet worden gekoppeld aan dit Wii-winkelaccount.";
	a[1499] = "Het is niet gelukt om de gebruikersnaam te bevestigen. De server is momenteel wegens onderhoud niet bereikbaar.<BR><BR>Probeer het later nog eens.";
	
	// OSS Errors
	a[1610]	= "Dit Wii Download Ticket is niet langer geldig.";
	a[1611]	= "De ingevoerde code van het Wii Download Ticket klopt niet.<BR><BR>Controleer de code en probeer het nog eens.";
	a[1612] = "De ingevoerde code van het Wii Download Ticket kan niet worden gebruikt in het land dat je hebt ingesteld in de Wii-instellingen.<BR><BR>Controleer de code en probeer het nog eens.";
	a[1613] = "Er is geen software gevonden voor het Wii Download Ticket dat je hebt ingevoerd. Controleer of je de juiste code hebt ingevoerd.<BR><BR>OPMERKING: als je ouderlijk toezicht hebt ingesteld, is het mogelijk dat je niet alle beschikbare software kunt zien in het Wii-winkelkanaal. Controleer je instellingen voor ouderlijk toezicht.";
	
	
	var msg = a[errCode];
	if(msg == null || msg == "") { // default errors
		if ((errCode >= 1400 && 
		     errCode <= 1499)) {
			msg = "Het is niet gelukt om het e-mailadres te bevestigen, vanwege een fout met de server.<BR><BR>Probeer het later nog eens.";
		}
	}
	return msg;
}

// NOA errors
function getNOAError(code)
{
	var a=new Array();
	
	a[NOA_ERROR_CountyRequired] 				= "(N/A)";
	a[NOA_ERROR_FoundOnBlacklist]				= "De creditcard kan niet worden gebruikt.<BR><BR>Neem contact op met de klantenservice als dit probleem zich blijft voordoen. Kijk op support.nintendo.com voor meer informatie.";
	a[NOA_ERROR_BillingAddress]                             = "Het adres dat je hebt ingevoerd klopt niet.<BR><BR>Controleer de informatie en probeer het nog eens.";
	a[NOA_ERROR_InvalidCardType]                            = "Het creditcardnummer is ongeldig.<BR><BR>Controleer de informatie en probeer het nog eens.";
	a[NOA_ERROR_InvalidVfyValue]                            = "De creditcardinformatie die je hebt ingevoerd klopt niet.<BR><BR>Controleer de informatie en probeer het nog eens.";
	a[NOA_ERROR_InvalidCcNumberAndExpDate]                  = "De creditcardinformatie die je hebt ingevoerd klopt niet.<BR><BR>Controleer de informatie en probeer het nog eens.";
	a[NOA_ERROR_InvalidCreditCardNumber]			= "Het creditcardnummer is ongeldig.<BR><BR>Controleer de informatie en probeer het nog eens.";
	a[NOA_ERROR_InvalidExpDate]				= "De creditcardinformatie die je hebt ingevoerd klopt niet.<BR><BR>Controleer de informatie en probeer het nog eens.";
	a[NOA_ERROR_InvalidPostalCode]                          = "De postcode klopt niet met de landinstelling in de Wii-instellingen.<BR><BR>Controleer de informatie en probeer het nog eens.";
	a[NOA_ERROR_TechnicalDifficulties]			= "Het is niet gelukt om de creditcardinformatie te verifiëren.<BR><BR>Probeer het later nog eens.";
	a[NOA_ERROR_TryAgainLater]				= "Het is niet gelukt om de creditcardinformatie te verifiëren.<BR><BR>Probeer het later nog eens.";

	a[NOA_RESULT_ERROR_CreditCardDeclined]			= "De creditcard kan niet worden gebruikt.<BR><BR>Neem contact op met het creditcardbedrijf voor meer informatie.";
	a[NOA_RESULT_ERROR_CreditCardDeclined_Funds]		= "De creditcard kan niet worden gebruikt.<BR><BR>Neem contact op met het creditcardbedrijf voor meer informatie.";
	a[NOA_RESULT_ERROR_CreditCardDeclined_Inactive]		= "De creditcard kan niet worden gebruikt.<BR><BR>Neem contact op met het creditcardbedrijf voor meer informatie.";
	a[NOA_RESULT_ERROR_CreditCardDeclined_Exp]		= "De vervaldatum van de creditcard is verstreken.";
	a[NOA_RESULT_ERROR_CreditCardDeclined_Code]		= "De creditcardinformatie die je hebt ingevoerd klopt niet.<BR><BR>Controleer de informatie en probeer het nog eens.";
	a[NOA_RESULT_ERROR_CreditCardDeclined_CCNum]		= "Het creditcardnummer is ongeldig.<BR><BR>Controleer de informatie en probeer het nog eens.";
	a[NOA_RESULT_ERROR_CreditCardDeclined_Limit]            = "De creditcard kan niet worden gebruikt.<BR><BR>Neem contact op met het creditcardbedrijf voor meer informatie.";
	a[NOA_RESULT_ERROR_CreditCardDeclined_Invalid]		= "De creditcardinformatie die je hebt ingevoerd klopt niet.<BR><BR>Controleer de informatie en probeer het nog eens.";
	a[NOA_RESULT_ERROR_CreditCardDeclined_AVS]		= "(N/A)";

	a[NOA_ERROR_EmptyVfyValue]				= "Voer de driecijferige veiligheidscode in.";

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
<title>Meer informatie</title>
<style type="text/css">
/* B_06:  Software Commentary/Details */


#text01-01 {
	position:absolute;
	left:29px;
	top:28px;
	width:442px;
	height:28px;
	z-index:38;
}
#goodsdetails {
	position:absolute;
	left:36px;
	top:73px;
	width:540px;
	height:293px;
	z-index:10;
}
#TitleName1stline {
	position:absolute;
	left:37px;
	top:96px;
	width:540px;
	z-index:43;
}
#goodsfree {
	position:absolute;
	left:38px;
	top:150px;
	width:538px;
	height:215px;
	z-index:31;
	overflow:auto;
}
#TitleName2stline {
	position:absolute;
	left:37px;
	top:122px;
	width:540px;
	z-index:41;
}
#Platform {
	position:absolute;
	left:39px;
	top:75px;
	width:218px;
	height:13px;
	z-index:63;
}
#text {
	position:absolute;
	left:192px;
	top:0px;
	width:280px;
	height:120px;
	z-index:2;
}
#image02 {
	position:absolute;
	left:12px;
	top:4px;
	width:160px;
	height:120px;
	z-index:2	
}
#image01 {
	position:absolute;
	left:12px;
	top:140px;
	width:160px;
	height:120px;
	z-index:2
}</style>
<script type="text/JavaScript">
<!--
function initPage()
{
	initPageCommon();
	MM_preloadImages('/oss/oss/common/images//banner/under_banner_b.gif','/oss/oss/common/images//banner/help_b.gif','/oss/oss/common/images//banner/top_b.gif');
	setUnderButtonL(true, "Terug", "javascript:showBack()", "snd.playSE(cSE_Cancel)");
	

	if (ecSupportsSession()) {
		var lastPageB06 = ec.getSessionValue("history.B_06.-1");
		if (lastPageB06.indexOf("history.B_31") == 0) {
			disableWiiPointButton();
		}
	}
}
var scroll_step = 30;
function kdown(id)
{
    var _code = event.keyCode;
	var _obj = document.getElementById(id);
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

<body onkeypress="kdown('goodsfree');" onload="initPage(); goodsfree.focus()">
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


<div style="position:absolute; left:0px; top:0px; width:1px; height:1px; z-index:6;">
  <img src="/oss/oss/common/images//spacer.gif" name="ktouch" width="1" height="1" border="0" id="ktouch"/>
</div>

<div id="goodsfree">
  <div id="text" class="buttonTextBlackM">Dribbel door het oorspronkelijke voetbalspel voor de NES. In Soccer speel je in een internationale competitie tegen een aantal van de beste teams ter wereld. Iedereen kan in dit spel genieten van een snel potje voetbal, dankzij de slimme besturing en het snelle schotsysteem wanneer je het doel van de tegenstander nadert. Dit in tegenstelling tot hedendaagse voetbalspellen, die zijn voorzien van de meest complexe besturingscommando's. De show aan het eind van de eerste helft was ongelofelijk populair onder NES-spelers, en we hopen dat de spelers van vandaag er nog net zo van kunnen genieten.<br><br>Het spel is voorzien van Engelse schermteksten.</div>
  <div id="image02">
    <img src="/oss/ccs/0001000146414950/FFFD0002" width="160" height="120" alt="Screen Shot 2"/>
    </div>
  <div id="image01">
    <img src="/oss/ccs/0001000146414950/FFFD0003" width="160" height="120" alt="Screen Shot 3"/>
    </div>  
</div>
<div id="text01-01">
  <div align="left" class="titleBlackL">Meer informatie</div>
</div>
<div id="goodsdetails"><img src="/oss/oss/common/images//banner/goods_details.gif" width="540" height="293" /></div>
<div style="overflow:hidden" nowrap id="TitleName1stline">
  <div align="center" class="headerBlueL"><span class="contentsBlueM">Soccer</span></div>
</div>
<div class="contentsBlueM" id="Platform">
  <div align="left" class="headerWhiteS">NES</div>
</div>
</body>
</html>
