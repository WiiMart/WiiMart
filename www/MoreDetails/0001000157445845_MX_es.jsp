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
<!-- Use bilingual icons if language is french or country is canada -->
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
	a[-(EC_ERROR_NET_NA)] = "Se ha producido un error en la conexión a internet. Comprueba tus ajustes de internet dentro de la configuración de Wii.<BR><BR>Para obtener más información, visita support.nintendo.com.";
	a[-(EC_ERROR_ECARD)] = "El número de activación que has introducido es incorrecto.<BR><BR>Para obtener más información, visita support.nintendo.com.";
	a[-(EC_ERROR_REGISTER)] = "La clave Wii que has introducido es incorrecta.<BR><BR>Para obtener ayuda, visita support.nintendo.com.";
	a[-(EC_ERROR_ALREADY_OWN)] = "Se ha producido un error. Vuelve a intentarlo más tarde.<BR><BR>Si el error persiste, visita support.nintendo.com para obtener más información.";
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
    		    msg = "Se ha producido un error en la conexión a internet.<BR><BR>Accede a la configuración de la consola desde el menú de Wii U y comprueba tus ajustes en la opción &quot;Internet&quot;.";
    		} else if (nhttpStatus == 0) {
    		    msg = "Se ha producido un error en la conexión a internet. Comprueba tus ajustes de internet dentro de la configuración de Wii.<BR><BR>Para obtener más información, visita support.nintendo.com.";
    		} else if (nhttpStatus != 0) {
    		    msg = "Se ha producido un error. Vuelve a intentarlo más tarde.<BR><BR>Si el error persiste, visita support.nintendo.com para obtener más información.";
    		}
    	}
    }
        
    if (msg == null || msg == '') {
    	msg = "Se ha producido un error. Vuelve a intentarlo más tarde.<BR><BR>Si el error persiste, visita support.nintendo.com para obtener más información.";
	}
	return msg;
}

function setErrorHtmlMsg(elem, errorCode, errorMsg)
{
    var html =
	 	'<span class="warningRed">'
		+ "Error: <span id='errorCode'></span></span>"
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
	a[617] = "El número de activación que has introducido es incorrecto.<BR><BR>Para obtener más información, visita support.nintendo.com.";
	a[618] = "No se puede usar esta Wii Points Card en tu país.<BR><BR>Para obtener más información, visita support.nintendo.com.";
	a[621] = "Se ha producido un error. Vuelve a intentarlo más tarde.<BR><BR>Si el error persiste, visita support.nintendo.com para obtener más información.";
	a[623]	= "Ya has descargado este título y ha concluido el periodo de prueba. No puedes volver a descargarlo.<BR><BR>Para obtener más información, visita support.nintendo.com.";
	a[642] = "Se ha producido un error. Vuelve a intentarlo más tarde.<BR><BR>Si el error persiste, visita support.nintendo.com para obtener más información.";
	a[643] = "Se ha producido un error. Vuelve a intentarlo más tarde.<BR><BR>Si el error persiste, visita support.nintendo.com para obtener más información.";
	a[644] = "No se pueden usar tarjetas de crédito con esta consola.<BR><BR>Visita support.nintendo.com para obtener ayuda.";
	a[645] = "Se ha producido un error. Vuelve a intentarlo más tarde.<BR><BR>Si el error persiste, visita support.nintendo.com para obtener más información.";
	
	// ECS Gift Errors
	a[646] = "Ocurrió un error. Por favor, inténtalo más tarde.<BR><BR>Visita support.nintendo.com para obtener ayuda si el problema continúa.";
	a[621] = "Se ha producido un error. Vuelve a intentarlo más tarde.<BR><BR>Si el error persiste, visita support.nintendo.com para obtener más información.";
	a[626] = "Se ha producido un error. Vuelve a intentarlo más tarde.<BR><BR>Si el error persiste, visita support.nintendo.com para obtener más información.";
	a[625] = "Ha ocurrido un error que no se puede resolver en este momento. Vuelve a intentarlo más tarde.<BR><BR>Si el error persiste, visita support.nintendo.com.";
	
	// ETS Errors
	a[705] = "Se ha producido un error. Vuelve a intentarlo más tarde.<BR><BR>Si el error persiste, visita support.nintendo.com para obtener más información.";
	a[706] = "Se ha producido un error. Vuelve a intentarlo más tarde.<BR><BR>Si el error persiste, visita support.nintendo.com para obtener más información.";
	a[707] = "Se ha producido un error. Vuelve a intentarlo más tarde.<BR><BR>Si el error persiste, visita support.nintendo.com para obtener más información.";
	
	// PAS Errors
	a[810]	= "Ha ocurrido un error al canjear tu vale de descarga Wii.<BR><BR>Visita support.nintendo.com para obtener más información.";
	a[811]	= "Esta Wii Points Card ya no es válida.";
	//a[812]	= "???OSS_ERROR_ECARD_NOT_USABLE???";
	//a[813]	= "???OSS_ERROR_ECARD_NOT_USABLE???";
	//a[814]	= "???OSS_ERROR_ECARD_NOT_USABLE???";
	a[815]	= "Esta Wii Points Card ya ha sido utilizada.<BR><BR>Para obtener más información, visita support.nintendo.com.";
	a[819]	= "El número de activación que has introducido es incorrecto.<BR><BR>Para obtener más información, visita support.nintendo.com.";
	
	a[826]	= "Error de sobrecarga del servidor.<BR><BR>Vuelve a intentarlo más tarde.";
	a[829]	= "Error de sobrecarga del servidor.<BR><BR>Vuelve a intentarlo más tarde.";
	a[830]	= "El número de activación que has introducido es incorrecto.<BR><BR>Para obtener más información, visita support.nintendo.com.";
	a[831] = "No se puede usar esta Wii Points Card en tu país.<BR><BR>Para obtener más información, visita support.nintendo.com.";

	// IAS Errors 
	a[901]	= "La clave Wii que has introducido es incorrecta.<BR><BR>Para obtener ayuda, visita support.nintendo.com.";
	a[903]	= "Se ha producido un error. Vuelve a intentarlo más tarde.<BR><BR>Si el error persiste, visita support.nintendo.com para obtener más información.";
	a[928] = "Se ha producido un error. Vuelve a intentarlo más tarde.<BR><BR>Si el error persiste, visita support.nintendo.com para obtener más información.";
	a[958]	= "Ha ocurrido un error que no se puede resolver en este momento. Vuelve a intentarlo más tarde.<BR><BR>Si el error persiste, visita support.nintendo.com.";
	a[942] = "No se ha podido confirmar este nombre de usuario en este momento debido a un error del servidor. Vuelve a intentarlo más tarde. <BR><BR>Si el error persiste, visita support.nintendo.com para obtener más información.";
	a[943]	= "Se ha producido un error al vincular el nombre de usuario. Comprueba el nombre y la contraseña, y vuelve a intentarlo. <BR><BR>Si has olvidado tu nombre de usuario o tu contraseña, visita club.nintendo.com.";

	a[941] = "Se ha producido un error al vincular el nombre de usuario. Comprueba el nombre y la contraseña, y vuelve a intentarlo. <BR><BR>Si has olvidado tu nombre de usuario o tu contraseña, visita club.nintendo.com.";
	
	// More IAS Errors
	a[1401] = "Se ha producido un error al vincular el nombre de usuario. Comprueba el nombre y la contraseña, y vuelve a intentarlo. <BR><BR>Si has olvidado tu nombre de usuario o tu contraseña, visita club.nintendo.com.";
	a[1402] = "Debido a las restricciones que se aplican a tu cuenta de Club Nintendo, no puedes vincularla a esta cuenta del Canal Tienda Wii.<BR><BR>Para obtener más información, visita support.nintendo.com.";
        a[1403] = "Debido a las restricciones que se aplican a tu cuenta de Club Nintendo, no puedes vincularla a esta cuenta del Canal Tienda Wii.<BR><BR>Para obtener más información, visita support.nintendo.com.";
	a[1499] = "No se ha podido confirmar este nombre de usuario. Se están realizando operaciones de mantenimiento en el servidor.<BR><BR>Sentimos las molestias ocasionadas. Vuelve a intentarlo más tarde. ";
	
	// OSS Errors
	a[1610]	= "El vale de descarga Wii que has introducido ha expirado.";
	a[1611]	= "El código del vale de descarga Wii que has introducido no es correcto.<BR><BR>Visita support.nintendo.com para obtener más información.";
	a[1612] = "Este vale de descarga Wii no se puede utilizar en tu país.<BR><BR>Visita support.nintendo.com para obtener más información.";
	a[1613] = "En este momento no hay ningún título disponible para el código del  vale de descarga Wii que has introducido. Asegúrate de haber introducido el código correcto. <BR><BR>Nota: revisa la configuración del control parental, ya que podría estar bloqueando algunos títulos disponibles en el Canal Tienda Wii.<BR>";
	
	
	var msg = a[errCode];
	if(msg == null || msg == "") { // default errors
		if ((errCode >= 1400 && 
		     errCode <= 1499)) {
			msg = "No se ha podido confirmar este nombre de usuario en este momento debido a un error del servidor. Vuelve a intentarlo más tarde. <BR><BR>Si el error persiste, visita support.nintendo.com para obtener más información.";
		}
	}
	return msg;
}

// NOA errors
function getNOAError(code)
{
	var a=new Array();
	
	a[NOA_ERROR_CountyRequired] 				= "Indica el nombre de tu condado.";
	a[NOA_ERROR_FoundOnBlacklist]				= "No se han podido procesar los datos.<BR><BR>Para obtener más información, visita support.nintendo.com.";
	a[NOA_ERROR_BillingAddress]                             = "La dirección de facturación que has introducido para tu tarjeta de crédito es incorrecta.<BR><BR>Comprueba la información y vuelve a intentarlo.";
	a[NOA_ERROR_InvalidCardType]                            = "El número de la tarjeta de crédito no es válido.<BR><BR>Comprueba la información y vuelve a intentarlo.";
	a[NOA_ERROR_InvalidVfyValue]                            = "Los datos de la tarjeta de crédito que has introducido son incorrectos.<BR><BR>Comprueba la información y vuelve a intentarlo.";
	a[NOA_ERROR_InvalidCcNumberAndExpDate]                  = "Los datos de la tarjeta de crédito que has introducido son incorrectos.<BR><BR>Comprueba la información y vuelve a intentarlo.";
	a[NOA_ERROR_InvalidCreditCardNumber]			= "El número de la tarjeta de crédito no es válido.<BR><BR>Comprueba la información y vuelve a intentarlo.";
	a[NOA_ERROR_InvalidExpDate]				= "Los datos de la tarjeta de crédito que has introducido son incorrectos.<BR><BR>Comprueba la información y vuelve a intentarlo.";
	a[NOA_ERROR_InvalidPostalCode]                          = "El código postal no coincide con el país seleccionado en la configuración de Wii.<BR><BR>Comprueba la información y vuelve a intentarlo.";
	a[NOA_ERROR_TechnicalDifficulties]			= "En este momento no se pueden confirmar los datos de esta tarjeta. Inténtalo más tarde.<BR><BR>Para obtener más información, visita support.nintendo.com.";
	a[NOA_ERROR_TryAgainLater]				= "En este momento no se pueden confirmar los datos de esta tarjeta. Inténtalo más tarde.<BR><BR>Para obtener más información, visita support.nintendo.com.";

	a[NOA_RESULT_ERROR_CreditCardDeclined]			= "No se puede utilizar esta tarjeta de crédito.<BR><BR>Ponte en contacto con la entidad emisora de la tarjeta para obtener más información.";
	a[NOA_RESULT_ERROR_CreditCardDeclined_Funds]		= "No se puede utilizar esta tarjeta de crédito.<BR><BR>Ponte en contacto con la entidad emisora de la tarjeta para obtener más información.";
	a[NOA_RESULT_ERROR_CreditCardDeclined_Inactive]		= "No se puede utilizar esta tarjeta de crédito.<BR><BR>Ponte en contacto con la entidad emisora de la tarjeta para obtener más información.";
	a[NOA_RESULT_ERROR_CreditCardDeclined_Exp]		= "La fecha de la tarjeta de crédito no es correcta.";
	a[NOA_RESULT_ERROR_CreditCardDeclined_Code]		= "Los datos de la tarjeta de crédito que has introducido son incorrectos.<BR><BR>Comprueba la información y vuelve a intentarlo.";
	a[NOA_RESULT_ERROR_CreditCardDeclined_CCNum]		= "El número de la tarjeta de crédito no es válido.<BR><BR>Comprueba la información y vuelve a intentarlo.";
	a[NOA_RESULT_ERROR_CreditCardDeclined_Limit]            = "No se puede utilizar esta tarjeta de crédito.<BR><BR>Ponte en contacto con la entidad emisora de la tarjeta para obtener más información.";
	a[NOA_RESULT_ERROR_CreditCardDeclined_Invalid]		= "Los datos de la tarjeta de crédito que has introducido son incorrectos.<BR><BR>Comprueba la información y vuelve a intentarlo.";
	a[NOA_RESULT_ERROR_CreditCardDeclined_AVS]		= "El código postal no es válido. Comprueba los datos y vuelve a intentarlo. ";

	a[NOA_ERROR_EmptyVfyValue]				= "Introduce las 3 cifras del código de seguridad de tu tarjeta.";

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
<title>Más detalles</title>
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
	setUnderButtonL(true, "Atrás", "javascript:showBack()", "snd.playSE(cSE_Cancel)");
	
	        setUnderButtonR(true, "Manual electrónico", "javascript:showManual('0001000157445845')", "wiiSelectSound()");
	

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
  <div id="text" class="buttonTextBlackM">Diatomic es un trepidante juego de acción retro ambientado en distintas placas de Petri. El aséptico entorno de tus placas de Petri va a sufrir la invasión de 9 criaturas diatómicas distintas con la intención de destruirte. Armado con tu escudo, tu cola, tus reflejos y tu capacidad estratégica, deberás plantarles cara y sobreponerte a la abrumadora situación. ¡Intenta sobrevivir a lo largo de 65 frenéticas fases repartidas en 5 capítulos! En la lista de récords podrás consultar qué clase de jugador eres. Es más difícil jugar a la defensiva y conseguir un récord de este modo que obtener un récord ofensivo.</div>
  <div id="image02">
    <img src="/oss/ccs/0001000157445845/FFFD0002" width="160" height="120" alt="Screen Shot 2"/>
    </div>
  <div id="image01">
    <img src="/oss/ccs/0001000157445845/FFFD0003" width="160" height="120" alt="Screen Shot 3"/>
    </div>  
</div>
<div id="text01-01">
  <div align="left" class="titleBlackL">Más detalles</div>
</div>
<div id="goodsdetails"><img src="/oss/oss/common/images//banner/goods_details.gif" width="540" height="293" /></div>
<div style="overflow:hidden" nowrap id="TitleName1stline">
  <div align="center" class="headerBlueL"><span class="contentsBlueM">Diatomic</span></div>
</div>
<div class="contentsBlueM" id="Platform">
  <div align="left" class="headerWhiteS">WiiWare</div>
</div>
</body>
</html>
