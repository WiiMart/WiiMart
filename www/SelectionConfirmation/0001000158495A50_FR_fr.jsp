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
	a[-(EC_ERROR_NET_NA)] = "Une erreur est survenue lors de la connexion à Internet. Vérifiez vos paramètres Internet dans les paramètres Wii.";
	a[-(EC_ERROR_ECARD)] = "Le numéro d&rsquo;activation que vous avez entré est incorrect.<BR><BR>Veuillez recommencer.";
	a[-(EC_ERROR_REGISTER)] = "Ce code Wii est incorrect.";
	a[-(EC_ERROR_ALREADY_OWN)] = "Une erreur impossible à résoudre pour le moment est survenue. <BR><BR>Si la même erreur se reproduit, contactez le service consommateurs. Pour plus de détails, visitez le site support.nintendo.com.";
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
    		    msg = "Une erreur est survenue lors de la connexion à Internet. Vérifiez vos paramètres Internet dans les paramètres de la console Wii U.";
    		} else if (nhttpStatus == 0) {
    		    msg = "Une erreur est survenue lors de la connexion à Internet. Vérifiez vos paramètres Internet dans les paramètres Wii.";
    		} else if (nhttpStatus != 0) {
    		    msg = "Une erreur impossible à résoudre pour le moment est survenue. <BR><BR>Si la même erreur se reproduit, contactez le service consommateurs. Pour plus de détails, visitez le site support.nintendo.com.";
    		}
    	}
    }
        
    if (msg == null || msg == '') {
    	msg = "Une erreur impossible à résoudre pour le moment est survenue. <BR><BR>Si la même erreur se reproduit, contactez le service consommateurs. Pour plus de détails, visitez le site support.nintendo.com.";
	}
	return msg;
}

function setErrorHtmlMsg(elem, errorCode, errorMsg)
{
    var html =
	 	'<span class="warningRed">'
		+ "Code d&rsquo;erreur: <span id='errorCode'></span></span>"
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
	a[617] = "Le numéro d&rsquo;activation que vous avez entré est incorrect.<BR><BR>Veuillez recommencer.";
	a[618] = "Cette Nintendo eShop Card ne peut pas être utilisée dans votre région.";
	a[621] = "Une erreur impossible à résoudre pour le moment est survenue. <BR><BR>Si la même erreur se reproduit, contactez le service consommateurs. Pour plus de détails, visitez le site support.nintendo.com.";
	a[623]	= "Vous avez déjà téléchargé ce titre, et la période d&rsquo;essai est terminée. Vous ne pouvez pas le télécharger à nouveau.";
	a[642] = "Une erreur impossible à résoudre pour le moment est survenue. <BR><BR>Si la même erreur se reproduit, contactez le service consommateurs. Pour plus de détails, visitez le site support.nintendo.com.";
	a[643] = "Une erreur impossible à résoudre pour le moment est survenue. <BR><BR>Si la même erreur se reproduit, contactez le service consommateurs. Pour plus de détails, visitez le site support.nintendo.com.";
	a[644] = "Vous ne pouvez pas utiliser de carte bancaire<BR>avec cette console.<BR><BR>Contactez le service consommateurs. Pour plus de détails, visitez le site support.nintendo.com.";
	a[645] = "Une erreur impossible à résoudre pour le moment est survenue. <BR><BR>Si la même erreur se reproduit, contactez le service consommateurs. Pour plus de détails, visitez le site support.nintendo.com.";
	
	// ECS Gift Errors
	a[646] = "Une erreur impossible à résoudre pour le moment est survenue.<BR><BR><BR>Si la même erreur se reproduit ultérieurement, contactez le service consommateurs. Pour plus de détails, visitez le site support.nintendo.com.";
	a[621] = "Une erreur impossible à résoudre pour le moment est survenue. <BR><BR>Si la même erreur se reproduit, contactez le service consommateurs. Pour plus de détails, visitez le site support.nintendo.com.";
	a[626] = "Une erreur impossible à résoudre pour le moment est survenue. <BR><BR>Si la même erreur se reproduit, contactez le service consommateurs. Pour plus de détails, visitez le site support.nintendo.com.";
	a[625] = "Une erreur impossible à résoudre pour le moment est survenue. <BR><BR>Si la même erreur se reproduit, contactez le service consommateurs. Pour plus de détails, visitez le site support.nintendo.com.";
	
	// ETS Errors
	a[705] = "Une erreur impossible à résoudre pour le moment est survenue. <BR><BR>Si la même erreur se reproduit, contactez le service consommateurs. Pour plus de détails, visitez le site support.nintendo.com.";
	a[706] = "Une erreur impossible à résoudre pour le moment est survenue. <BR><BR>Si la même erreur se reproduit, contactez le service consommateurs. Pour plus de détails, visitez le site support.nintendo.com.";
	a[707] = "Une erreur impossible à résoudre pour le moment est survenue. <BR><BR>Si la même erreur se reproduit, contactez le service consommateurs. Pour plus de détails, visitez le site support.nintendo.com.";
	
	// PAS Errors
	a[810]	= "Une erreur est survenue lors du traitement des Wii Points. Réessayez ultérieurement.<BR><BR>Si la même erreur se reproduit, contactez le service consommateurs. Pour plus de détails, visitez le site support.nintendo.com.";
	a[811]	= "Le numéro d&rsquo;activation que vous avez entré n&rsquo;est plus valide.";
	//a[812]	= "???OSS_ERROR_ECARD_NOT_USABLE???";
	//a[813]	= "???OSS_ERROR_ECARD_NOT_USABLE???";
	//a[814]	= "???OSS_ERROR_ECARD_NOT_USABLE???";
	a[815]	= "Cette Nintendo eShop Card a déjà été enregistrée.";
	a[819]	= "Le numéro d&rsquo;activation que vous avez entré est incorrect.<BR><BR>Veuillez recommencer.";
	
	a[826]	= "Le serveur est surchargé.<BR><BR>Réessayez ultérieurement.";
	a[829]	= "Le serveur est surchargé.<BR><BR>Réessayez ultérieurement.";
	a[830]	= "Le numéro d&rsquo;activation que vous avez entré est incorrect.<BR><BR>Veuillez recommencer.";
	a[831] = "Cette Nintendo eShop Card ne peut pas être utilisée dans votre région.";

	// IAS Errors 
	a[901]	= "Ce code Wii est incorrect.";
	a[903]	= "Une erreur impossible à résoudre pour le moment est survenue. <BR><BR>Si la même erreur se reproduit, contactez le service consommateurs. Pour plus de détails, visitez le site support.nintendo.com.";
	a[928] = "Une erreur impossible à résoudre pour le moment est survenue. <BR><BR>Si la même erreur se reproduit, contactez le service consommateurs. Pour plus de détails, visitez le site support.nintendo.com.";
	a[958]	= "Une erreur impossible à résoudre pour le moment est survenue. <BR><BR>Si la même erreur se reproduit, contactez le service consommateurs. Pour plus de détails, visitez le site support.nintendo.com.";
	a[942] = "Impossible de confirmer cette adresse e-mail pour le moment à cause d&rsquo;une erreur sur le serveur.<BR><BR>Veuillez réessayer ultérieurement.";
	a[943]	= "L&rsquo;adresse e-mail ou le mot de passe est incorrect. Vérifiez ces informations et réessayez.<BR><BR>Si vous avez oublié votre adresse e-mail ou votre mot de passe, visitez le site:<BR>www.club-nintendo.com";

	a[941] = "L&rsquo;adresse e-mail ou le mot de passe est incorrect. Vérifiez ces informations et réessayez.<BR><BR>Si vous avez oublié votre adresse e-mail ou votre mot de passe, visitez le site:<BR>www.club-nintendo.com";
	
	// More IAS Errors
	a[1401] = "L&rsquo;adresse e-mail ou le mot de passe est incorrect. Vérifiez ces informations et réessayez.<BR><BR>Si vous avez oublié votre adresse e-mail ou votre mot de passe, visitez le site:<BR>www.club-nintendo.com";
	a[1402] = "Les limitations de votre compte Club Nintendo ne permettent pas de le relier à votre compte de la chaîne boutique Wii.";
        a[1403] = "Les limitations de votre compte Club Nintendo ne permettent pas de le relier à votre compte de la chaîne boutique Wii.";
	a[1499] = "Impossible de confirmer cette adresse e-mail pour le moment car une opération de maintenance est en cours sur le serveur.<BR><BR>Veuillez nous excuser de la gêne occasionnée et réessayer ultérieurement.";
	
	// OSS Errors
	a[1610]	= "Ce Wii Download Ticket n&rsquo;est plus valide.";
	a[1611]	= "Le code du Wii Download Ticket que vous avez entré est incorrect.<BR><BR>Veuillez vérifier le code et réessayer.";
	a[1612] = "Ce Wii Download Ticket ne peut pas être utilisé dans votre région.<BR><BR>Veuillez vérifier le code et réessayer.";
	a[1613] = "Aucun titre ne correspond actuellement au code du Wii Download Ticket que vous avez entré. Veuillez vérifier le code et réessayer.<BR><BR>Note: ce résultat est peut-être dû aux paramètres du contrôle parental. Veuillez vérifier les paramètres du contrôle parental.";
	
	
	var msg = a[errCode];
	if(msg == null || msg == "") { // default errors
		if ((errCode >= 1400 && 
		     errCode <= 1499)) {
			msg = "Impossible de confirmer cette adresse e-mail pour le moment à cause d&rsquo;une erreur sur le serveur.<BR><BR>Veuillez réessayer ultérieurement.";
		}
	}
	return msg;
}

// NOA errors
function getNOAError(code)
{
	var a=new Array();
	
	a[NOA_ERROR_CountyRequired] 				= "(N/A)";
	a[NOA_ERROR_FoundOnBlacklist]				= "Cette carte bancaire ne peut pas être utilisée.<BR><BR>Veuillez contacter le service consommateurs. Pour plus de détails, visitez le site support.nintendo.com.";
	a[NOA_ERROR_BillingAddress]                             = "L&rsquo;adresse que vous avez entrée est incorrecte.<BR><BR>Vérifiez les informations que vous avez entrées et réessayez.";
	a[NOA_ERROR_InvalidCardType]                            = "Ce numéro de carte n&rsquo;est pas valide.<BR><BR>Vérifiez les informations que vous avez entrées et réessayez.";
	a[NOA_ERROR_InvalidVfyValue]                            = "Les informations relatives à votre carte bancaire sont incorrectes.<BR><BR>Vérifiez les informations que vous avez entrées et réessayez.";
	a[NOA_ERROR_InvalidCcNumberAndExpDate]                  = "Les informations relatives à votre carte bancaire sont incorrectes.<BR><BR>Vérifiez les informations que vous avez entrées et réessayez.";
	a[NOA_ERROR_InvalidCreditCardNumber]			= "Ce numéro de carte n&rsquo;est pas valide.<BR><BR>Vérifiez les informations que vous avez entrées et réessayez.";
	a[NOA_ERROR_InvalidExpDate]				= "Les informations relatives à votre carte bancaire sont incorrectes.<BR><BR>Vérifiez les informations que vous avez entrées et réessayez.";
	a[NOA_ERROR_InvalidPostalCode]                          = "Ce code postal ne correspond pas au pays enregistré dans les paramètres de la console.<BR><BR>Vérifiez les informations que vous avez entrées et réessayez.";
	a[NOA_ERROR_TechnicalDifficulties]			= "Les informations relatives à votre carte bancaire n&rsquo;ont pas pu être vérifiées.<BR><BR>Veuillez réessayer ultérieurement.";
	a[NOA_ERROR_TryAgainLater]				= "Les informations relatives à votre carte bancaire n&rsquo;ont pas pu être vérifiées.<BR><BR>Veuillez réessayer ultérieurement.";

	a[NOA_RESULT_ERROR_CreditCardDeclined]			= "Cette carte ne peut pas être utilisée.<BR><BR>Contactez l&rsquo;organisme qui l&rsquo;a délivrée pour plus d&rsquo;informations.";
	a[NOA_RESULT_ERROR_CreditCardDeclined_Funds]		= "Cette carte ne peut pas être utilisée.<BR><BR>Contactez l&rsquo;organisme qui l&rsquo;a délivrée pour plus d&rsquo;informations.";
	a[NOA_RESULT_ERROR_CreditCardDeclined_Inactive]		= "Cette carte ne peut pas être utilisée.<BR><BR>Contactez l&rsquo;organisme qui l&rsquo;a délivrée pour plus d&rsquo;informations.";
	a[NOA_RESULT_ERROR_CreditCardDeclined_Exp]		= "La date d&rsquo;expiration de cette carte est incorrecte.";
	a[NOA_RESULT_ERROR_CreditCardDeclined_Code]		= "Les informations relatives à votre carte bancaire sont incorrectes.<BR><BR>Vérifiez les informations que vous avez entrées et réessayez.";
	a[NOA_RESULT_ERROR_CreditCardDeclined_CCNum]		= "Ce numéro de carte n&rsquo;est pas valide.<BR><BR>Vérifiez les informations que vous avez entrées et réessayez.";
	a[NOA_RESULT_ERROR_CreditCardDeclined_Limit]            = "Cette carte ne peut pas être utilisée.<BR><BR>Contactez l&rsquo;organisme qui l&rsquo;a délivrée pour plus d&rsquo;informations.";
	a[NOA_RESULT_ERROR_CreditCardDeclined_Invalid]		= "Les informations relatives à votre carte bancaire sont incorrectes.<BR><BR>Vérifiez les informations que vous avez entrées et réessayez.";
	a[NOA_RESULT_ERROR_CreditCardDeclined_AVS]		= "(N/A)";

	a[NOA_ERROR_EmptyVfyValue]				= "Veuillez entrer les 3 chiffres de votre code de sécurité.";

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
<title>Confirmation du logiciel</title>
<style type="text/css">
  /* B_08:  Caution Items */


#text01-01 {
	position:absolute;
	left:29px;
	top:28px;
	width:442px;
	height:28px;
	z-index:32;
}
#text02-01 {
	position:absolute;
	left:64px;
	top:142px;
	width:480px;
	height:18px;
	z-index:37
}
#text03-01 {
	position:absolute;
	left:64px;
	top:216px;
	width:480px;
	height:60px;
	z-index:38;
	line-height:20px;
}
#text04-01 {
	position:absolute;
	left:64px;
	top:300px;
	width:480px;
	height:60px;
	z-index:38;
	line-height:20px;
}
#text04-02 {
	position:absolute;
	left:64px;
	top:216px;
	width:480px;
	height:144px;
	z-index:38;
	line-height:20px;
}
#cautionArea {
	position:absolute;
	left:64px;
	top:137px;
	width:490px;
	height:227px;
	z-index:38;
	line-height:20px;
	overflow:auto;
}
#frame {
	position:absolute;
	left:34px;
	top:84px;
	width:540px;
	height:275px;
	z-index:27;
}
#GC {
	position:absolute;
	left:343px;
	top:160px;
	width:60px;
	height:60px;
	z-index:36;
}
#controller {
	position:absolute;
	left:64px;
	top:164px;
	width:480px;
	height:51px;
	z-index:35;
}

#TitleName1stline {
	position:absolute;
	left:64px;
	top:87px;
	width:480px;
	overflow:hidden;
	z-index:34
}

#TitleName2stline {
	position:absolute;
	left:64px;
	top:110px;
	width:480px;
	z-index:33;
}
body {
	background-repeat: no-repeat;
}
</style>
<script type="text/JavaScript">
<!--
function initPage()
{
	initPageCommon();
	MM_preloadImages('/oss/oss/common/images//banner/card02_b.gif','/oss/oss/common/images//banner/under_banner_b.gif');
    if(shop.isCompatibleMode){
        if (document.getElementById('GcCtrl')){
            document.getElementById('GcCtrl').style.display = 'none';
        }
    }

	if (ecSupportsSession()) {
		var showCtrlPage = ec.getSessionValue("showCtrlPage");
		ec.setSessionValue("showCtrlPage", null);
		var giftStatus = ec.getSessionValue("giftStatus");
		trace("giftStatus: " + giftStatus);
		var transId = ec.getSessionValue("transId");
		trace("transId: " + transId);
		var useCampaignCode = ec.getSessionValue("useCampaignCode");
		trace("useCampaignCode: " + useCampaignCode);
		/* var redownloadFlag = ec.getSessionValue("redownloadFlag");
		trace("redownloadFlag: "+redownloadFlag); */
		var hasCautionItem2 = 'false';
		var hasCautionItem3 = 'false';
		var wifiIndicator = parseInt('0');
		trace("WiFi indicator: "+wifiIndicator);
		var platform = 'WIIWARE';
		trace("platform: "+platform);
		var genreWifiPay = "";
		
		if (giftStatus == "sending") {
			setUnderButtonL(true, "Retour", "javascript:showOldPage('B_05.jsp')", "snd.playSE(cSE_Cancel)");
			if (showCtrlPage != "true") {
				if (hasCautionItem2 == "true" || ((genreWifiPay == "true") && (wifiIndicator == WIFI_PARTIALLY_CHARGED || wifiIndicator == WIFI_ALL_CHARGED || wifiIndicator == WIFI_FREE_INPUT))) {
					setUnderButtonR(true, "OK", "javascript:showPage('B_28.jsp?titleId=0001000158495A50&itemId=&SD=')", "snd.playSE(cSE_Decide)");
				} else if (hasCautionItem3 == "true") {
					setUnderButtonR(true, "OK", "javascript:showPage('B_09.jsp?titleId=0001000158495A50&itemId=&SD=')", "snd.playSE(cSE_Decide)");
				} else {
					setUnderButtonR(true, "OK", "javascript:showPage('B_18.jsp?titleId=0001000158495A50&itemId=&SD=')", "snd.playSE(cSE_Decide)");
				}
			}
		} else if (giftStatus == "receiving") {
			// setUnderButtonL(true, "Retour", "javascript:showGiftTrans("+transId+")", "snd.playSE(cSE_Cancel)");
			if (showCtrlPage == "true") {
                disableWiiPointButton();
				setUnderButtonL(true, "Retour", "javascript:showBack()", "snd.playSE(cSE_Cancel)");
			} else {
				if (hasCautionItem2 == "true" || ((genreWifiPay == "true") && (wifiIndicator == WIFI_PARTIALLY_CHARGED || wifiIndicator == WIFI_ALL_CHARGED || wifiIndicator == WIFI_FREE_INPUT))) {
					setUnderButtonR(true, "OK", "javascript:showPage('B_28.jsp?titleId=0001000158495A50&itemId=&SD=')", "snd.playSE(cSE_Decide)");
				} else if (hasCautionItem3 == "true") {
					setUnderButtonR(true, "OK", "javascript:showPage('B_09.jsp?titleId=0001000158495A50&itemId=&SD=')", "snd.playSE(cSE_Decide)");
				} else {
					setUnderButtonR(true, "OK", "javascript:showPage('B_09.jsp?titleId=0001000158495A50&SD=')", "snd.playSE(cSE_Decide)");
				}
			}
			document.getElementById("constElements").style.display='none';
			document.getElementById("giftline").style.display='';
			document.getElementById("giftcurrentBalance").innerHTML = getBalance();
		/* } else if (redownloadFlag == "true") {
			setUnderButtonL(true, "Retour", "javascript:showGiftTrans("+transId+")", "snd.playSE(cSE_Cancel)");
			setUnderButtonR(true, "OK", "javascript:showPage('B_09.jsp?titleId=0001000158495A50&SD=')", "snd.playSE(cSE_Decide)");
		*/
		} else {
			var lastPageB08 = ec.getSessionValue("history.B_08.-1");
			if (lastPageB08.indexOf("history.B_31") == 0) {
				disableWiiPointButton();
			}
			if (useCampaignCode != "true") {
				setUnderButtonL(true, "Retour", "javascript:showBack()", "snd.playSE(cSE_Cancel)"); 
			}
			if (showCtrlPage != "true") {
				if (hasCautionItem2 == "true" || ((genreWifiPay == "true") && (wifiIndicator == WIFI_PARTIALLY_CHARGED || wifiIndicator == WIFI_ALL_CHARGED || wifiIndicator == WIFI_FREE_INPUT))) {
					setUnderButtonR(true, "OK", "javascript:showPage('B_28.jsp?titleId=0001000158495A50&itemId=&SD=')", "snd.playSE(cSE_Decide)");
				} else if (hasCautionItem3 == "true") {
					setUnderButtonR(true, "OK", "javascript:showPage('B_09.jsp?titleId=0001000158495A50&itemId=&SD=')", "snd.playSE(cSE_Decide)");
				} else {
					setUnderButtonR(true, "OK", "javascript:showPage('B_09.jsp?titleId=0001000158495A50&SD=')", "snd.playSE(cSE_Decide)");
				}
			}
		}

		if (showCtrlPage == "true") {
            disableWiiPointButton();
			document.getElementById("ManualImageID").onclick = 'ec.setSessionValue("showCtrlPage", "true"); showHelp(); wiiSelectSound();';
			document.getElementById("B08headingMessage").innerHTML = "Manettes compatibles";
		} else {
			document.getElementById("B08headingMessage").innerHTML = "Confirmation du logiciel";
		}
    }
}
//-->
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


<div id="giftline" style="display: none;">
  <div class="dot" id="line02">･･･････････････････････････････････････････････････････････････････････････</div>
  <div class="dot" id="line01">･･･････････････････････････････････････････････････････････････････････････</div>
  <div id="Wiipoint">
    <div align="center" class="buttonTextBlackM">Wii Points</div>
  </div>
  <div id="point">
    <div align="center" class="wiiPoint"><span id="giftcurrentBalance"></span></div>
  </div>
</div>
<div id="text01-01">
  <div align="left" class="titleBlackL"><span id="B08headingMessage"></span></div>
</div>
<div id="frame">
  <div align="center" ><img src="/oss/oss/common/images//banner/Purchasing_frame01.gif" width="500" height="280" /> </div>
</div>
<div id="TitleName1stline" nowrap>
  <div align="center" class="contentsBlueM">3D Pixel Racing</div>
</div>
<div style="overflow:hidden" nowrap id="TitleName2stline">
    <div align="center"><span class="contentsBlueM">Demo</span></div>
  </div>
<div id="text02-01" >
  <div align="center" >
    <div align="center" class="contentsBlueS_01">Veuillez lire les points suivants avant de télécharger ce titre:</div>
  </div>
</div>

<div id="controller" align="center">
  <img src="/oss/oss/common/images//banner/B_08_RvlCtrl.gif" width="68" height="51" />
    </div>

<div id="text03-01">
    <div align="center" >
      <div align="left" class="contentsBlackS">Ce logiciel est destiné à être utilisé avec la télécommande Wii.</div>
    </div>
  </div>
  <div id="text04-01">
    <div align="center" >
      <div align="left" class="contentsBlackS"></div>
    </div>
  </div>
</body>
</html>
