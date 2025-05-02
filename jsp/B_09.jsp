

<a href="https://oss-auth.thecheese.io/oss/serv/debug.jsp">debug</a>






<script>
    console.log("")
</script>

<script>
	console.log('{"id":"","title1":"","title2":"","console":"","controllers":"","region":"","language":"","attributes":"","date":"","added":"","publisher":"","genre":"","points":"","players":"","rating":"","ratingdetails":"","thumbnail":"","size":"","titleVersion":-1,"page":-1}');
</script>

<script>
    console.log("")
</script>
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
<script type="text/JavaScript">
<!--

function getSCAUserStatus(){
  var isSilverSCA = "";
  var isGoldSCA = "";
  if(ecSupportsSession()){
    isSilverSCA = ec.getSessionValue("silverStatus");
            isGoldSCA = ec.getSessionValue("goldStatus");
  }
  if(isGoldSCA == "ACTIVATED"){
      return "SCAGOLD";
  }else if(isSilverSCA == "ACTIVATED"){
      return "SCASILVER";
  }else{
      return "";
  }
}
function getSCAUserDiscountType(){
  var status = getSCAUserStatus();
  if(status == "SCAGOLD") {
      return ec.getSessionValue("goldDiscountType");
  }else if(status == "SCASILVER"){
      return ec.getSessionValue("silverDiscountType");
  }else{
      return "";
  }
}

//-->
</script>
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
    
        if(ecSupportsSession()){
            if((ec.getSessionValue("icrStatus") == "ACTIVATED") &&
               ('' == '') &&
               ('WIIWARE' == "FC/NES") && 
               (parseInt('') == 500)){
                trace("ICR is expired");
                return true;
            }else{
                trace("ICR is not expired");
                return false;
            }
        }else{
            trace("not support ec session");
            return true;
        }
        
}
//-->
</script>

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
<title>Download Confirmation</title>
<style type="text/css">
  /* B_09:  Confirm Software Purchase */


#text01-01 {
	position:absolute;
	left:29px;
	top:28px;
	width:442px;
	height:28px;
	z-index:28;
}
#goodsconfirmation {
	position:absolute;
	left:36px;
	top:85px;
	width:537px;
	height:225px;
	z-index:30;
}
#text03-01 {
	position:absolute;
	left:40px;
	top:141px;
	width:293px;
	height:18px;
	z-index:58;
}
#text04-01 {
	position:absolute;
	left:40px;
	top:160px;
	width:293px;
	height:18px;
	z-index:55;
}
#text05-01 {
	position:absolute;
	left:40px;
	top:182px;
	width:293px;
	height:18px;
	z-index:51;
}
#text06-01 {
	position:absolute;
	left:40px;
	top:206px;
	width:293px;
	height:18px;
	z-index:45;
}
#text07-01 {
	position:absolute;
	left:40px;
	top:225px;
	width:293px;
	height:18px;
	z-index:42;
}
#text08-01 {
	position:absolute;
	left:40px;
	top:247px;
	width:293px;
	height:18px;
	z-index:39;
}
#pointcost01 {
	position:absolute;
	left:340px;
	top:141px;
	width:90px;
	height:18px;
	z-index:57;
}
#confirmation {
	position:absolute;
	left:36px;
	top:320px;
	width:538px;
	height:30px;
	z-index:60;
}
#pointword02 {
	position:absolute;
	left:340px;
	top:160px;
	width:90px;
	height:18px;
	z-index:54;
}
#pointword03 {
	position:absolute;
	left:340px;
	top:182px;
	width:90px;
	height:18px;
	z-index:50;
}
#blockcost01 {
	position:absolute;
	left:340px;
	top:206px;
	width:90px;
	height:18px;
	z-index:44;
}
#blockcost02 {
	position:absolute;
	left:340px;
	top:225px;
	width:90px;
	height:18px;
	z-index:41;
}
#blockcost03 {
	position:absolute;
	left:340px;
	top:247px;
	width:90px;
	height:18px;
	z-index:38;
}
#text02-01 {
	position:absolute;
	left:40px;
	top:270px;
	width:528px;
	height:20px;
	z-index:59;
}
#pointword01 {
	position:absolute;
	left:437px;
	top:141px;
	width:130px;
	height:18px;
	z-index:56;
}
#points02 {
	position:absolute;
	left:437px;
	top:160px;
	width:130px;
	height:18px;
	z-index:53;
}
#pointos03 {
	position:absolute;
	left:437px;
	top:182px;
	width:130px;
	height:18px;
	z-index:46;
}
#blockword01 {
	position:absolute;
	left:437px;
	top:206px;
	width:130px;
	height:18px;
	z-index:43;
}
#blockword02 {
	position:absolute;
	left:437px;
	top:225px;
	width:130px;
	height:18px;
	z-index:40;
}
#blockword03 {
	position:absolute;
	left:437px;
	top:247px;
	width:130px;
	height:18px;
	z-index:34;
}
#TitleName1stline {	position:absolute;
	left:64px;
	top:88px;
	width:480px;
	z-index:37;
}
#TitleName2stline {	position:absolute;
	left:64px;
	top:112px;
	width:480px;
	z-index:36;
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

#coolingoff {
	position:absolute;
	left:34px;
	top:94px;
	width:542px;
	height:81px;
	z-index:28;
}</style>
<script language="JavaScript" src="/oss/oss/common/js//shopsd.js"></script>
<SCRIPT language="JavaScript" src="/oss/oss/common/js//title_manager.js"></SCRIPT>
<script type="text/javascript">
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

var titleId = '';
var titleSize = '';
var titleTmdSize = '-1';
var latestVersion = parseInt('-1');

var titlePoints = '';

var titleManager = new TitleManager(titleId, titleSize, titleTmdSize, latestVersion);
//titleManager.traceLog();

var titleSizeKB = titleManager.getTitleKBSize();
var titleSizeBlock = 0;
var sd = '';
var redownloadFlagExt;
var itemId;

function checkSD()
{
    if (sd == 'Y') {
        showSDSelection("true");
        onSDButtonPressed(titleId, itemId);
    }
}

function showSDSelection(checkSDFlag)
{
    document.getElementById("heading").innerHTML = 'Download Location';
    hideElement("confirmframe");
    hideElement("sdErrorDiv");
    hideElement("sdErrorNoSizeDiv");
    setUnderButton(false);
    setUnderButtonL(false);
    if (ecSupportsSession()) {
        var status = ec.getSessionValue("giftStatus");
        var useCampaignCode = ec.getSessionValue("useCampaignCode");

        if (status == "receiving") {
            setUnderButtonL(true, 'Later', "javascript:goGiftNext('0001000157414945')", "wiiCancelSound()");
        } else if (useCampaignCode == "true") {
            setUnderButtonL(true, 'Later', "javascript:showBack()", "wiiCancelSound()");
        } else {
            setUnderButtonL(true, 'Back', "javascript:showOldPage('B_05.jsp')", "wiiCancelSound()");
        }
    }
    setUnderButtonR(false);
    showElement("sdbuttons");
    wiiEnableHRP();

    if (checkSDFlag != "true") {
        checkSDIsInserted();
    }
}
var innerCheckSDIsInserted = makeCheckSDIsInserted();
function checkSDIsInserted(){
    if (document.getElementById("sdbuttons").style.display == 'none') {
        return;
    }
    innerCheckSDIsInserted();
    setTimeout('checkSDIsInserted()', ecProgressInterval);
}

function showConfirmframe()
{
    wiiDisableHRP();
    document.getElementById("heading").innerHTML = 'Download Confirmation';
    hideElement("sdbuttons");
    showElement("confirmframe");
    setUnderButtonR(true);

    if (sd != 'Y') {
        if (ecSupportsSession()) {
            var status = ec.getSessionValue("giftStatus");
            var useCampaignCode = ec.getSessionValue("useCampaignCode");
            if (status == "receiving" || useCampaignCode == "true") {
                setUnderButtonL(true, 'Now', "javascript:showPage('B_10.jsp?SD=N&titleId=')", "wiiSelectSound()");
            } else {
                setUnderButtonL(true, 'Yes', "javascript:showPage('B_10.jsp?SD=N&titleId=')", "wiiSelectSound()");
            }
        } else {
            setUnderButtonL(true, 'Yes', "javascript:showPage('B_10.jsp?SD=N&titleId=')", "wiiSelectSound()");
        }
    } else {
        if (ecSupportsSession()) {
            var status = ec.getSessionValue("giftStatus");
            var useCampaignCode = ec.getSessionValue("useCampaignCode");
            if (status == "receiving" || useCampaignCode == "true") {
                setUnderButtonL(true, 'Now', "javascript:showPage('B_10.jsp?SD=Y&titleId=')", "wiiSelectSound()");
            } else {
                setUnderButtonL(true, 'Yes', "javascript:showPage('B_10.jsp?SD=Y&titleId=')", "wiiSelectSound()");
            }
        } else {
            setUnderButtonL(true, 'Yes', "javascript:showPage('B_10.jsp?SD=Y&titleId=')", "wiiSelectSound()");
        }
    }
}

function onNANDButtonPressed(titleId, itemId)
{
    sd = 'N';
    if (doChecking('N')) {
        showConfirmframe();
        showMsgWithSD(false);
        showRemainValue(sd);
    }
}

function onSDButtonPressed(titleId, itemId)
{
    titleSizeBlock = titleManager.getSDBackupBlocks();
    if(!sdDLErrorHandle(titleId, titleSizeKB,'')){
        return;
    }
    sd = 'Y';
    if (doChecking('Y')) {
        showConfirmframe();
        showMsgWithSD(true);
        showRemainValue(sd);
    }
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

    setUnderButtonL(true, "Back", "javascript:showSDSelection()", "wiiCancelSound()");
    setUnderButton(true, "Data Management", 'javascript:showDataMng("/startup?initpage=showTitle&titleId='+titleId+'")', "wiiSelectSound()");
}

var nonSDSupport = nonSDSupport();

function showMsgWithSD(flag)
{
   if (flag) {
       hideElement("MsgWithoutSD");
       showElement("MsgWithSD");
   } else {
       hideElement("MsgWithSD");
       showElement("MsgWithoutSD");
   }
}

function doChecking(sd)
{
	trace("do checking: SD = "+sd);
	var r = ec.getDeviceInfo();
	
        var isSatisfiedSpace = titleManager.checkDownloadSpace(sd);
        // real size is stored titleSizeBlock.
        // javascript can do calculate size only by finished size checking
        titleSizeBlock = titleManager.getNeededTitleBlocks(sd);

	// Display warning messages if title is not already downloaded and on card
	var warningDisplayed = true;
	
	var titlesDownloaded = getTitlesDownloaded();
	var freeChannels = r.freeChannelAppCount - titlesDownloaded;
	var availInodes = r.maxUserInodes - r.usedUserInodes;

	// Get number of user inodes needed
	var inodesNeeded = '12';
	trace("Max user inodes is " + r.maxUserInodes);
	trace("Used user inodes is " + r.usedUserInodes);
	trace("Available user inodes is " + availInodes);
	trace("Needed user inodes is " + inodesNeeded);
	
	trace("freeChannelAppAcount is " + r.freeChannelAppCount);
	trace("freeChannels is " + freeChannels);
	
	if (freeChannels <= 0 && sd != 'Y') {
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
	
	if (warningDisplayed) {
		return false;
	} else {
		return true;
	}
}

function showRemainValue(sd)
{
	// show space are re-input
        
        trace("sdMode : " + sd );

    if (sd == 'Y') {
        var spaceNeeded = titleManager.getSDBackupBlocks();
        var availSpace  = Math.floor(getFreeKBytes() / 128);
        if (availSpace < 0) {
            hideElement("confirmframe");
            getSDError(-36);
            return;
        }
    } else {
        var spaceNeeded = titleManager.getNeededTitleBlocks(sd);
        var availSpace  = titleManager.getAvailUserBlocks();
    }
        
        trace("spaceNeeded : " + spaceNeeded);
        trace("availSpace  : " + availSpace);

	var remainingAvailSpace = Math.max( availSpace - spaceNeeded, 0 );
        trace("remainingAvailSpace  : " + remainingAvailSpace);

	document.getElementById("blockcost01").innerHTML = 
		'<div align="right" class="catalogTitleBlack_01">' + availSpace + '</div>';
	document.getElementById("blockcost02").innerHTML = 
		'<div align="right" class="contentsRedM">' + spaceNeeded + '</div>';

	document.getElementById("blockcost03").innerHTML = 
		'<div align="right" class="catalogTitleBlack_01">' + remainingAvailSpace + '</div>';

	if (sd == 'Y') {
		document.getElementById("BuyMsg").innerHTML = 
			'Downloading this software requires '+titlePoints+' Wii Points and uses '+spaceNeeded+' blocks on an SD Card.';
	} else {
		document.getElementById("BuyMsg").innerHTML = 
			'Downloading this software requires '+titlePoints+' Wii Points and uses '+spaceNeeded+' blocks in the Wii system memory.';
	}

}

function statusOfPurchase(){
    var titleLicense = getTitleLicense(titleId);
    var isOnDevice = titleManager.getIsOnDevice();


    var isUpdate = titleManager.isUpdate();
    var itemPrice = '';
    var giftable = 'true';
    
    var scaGoldTitleStatus   = '' ; 
    var scaSilverTitleStatus = '' ;
    var icrTitleStatus = '';


    var userSCAStatus = getSCAUserStatus();
    var userICRStatus = getICRUserStatus();

    var retValue;
    trace("userSCAStatus:::"+userSCAStatus); 
    trace("userICRStatus:::"+userICRStatus);
    trace("scaGoldTitleStatus:::"+scaGoldTitleStatus);
    trace("scaSilverTitleStatus:::"+scaSilverTitleStatus);
    trace("icrTitleStatus:::"+icrTitleStatus);

    if(itemPrice == ''){
        retValue = "NULL";
        return retValue;
    }
    
    if(titleLicense == "Unlimited"){
       if(isUpdate){
           retValue = "UPDATE"; 
       }else if(isOnDevice){
           retValue = "NULL";
       }else{
           retValue = "RE"
       }
    }else{
       if(getICRUserStatus() == "ACTIVATED" && icrTitleStatus == "ICR"){
           retValue = "ICR";
       }else if(getSCAUserStatus() == "SCAGOLD" &&  scaGoldTitleStatus == "SCAGOLD"){
           retValue = "SCAGOLD";
       }else if(getSCAUserStatus() == "SCASILVER" &&  scaSilverTitleStatus == "SCASILVER"){
           retValue = "SCASILVER";
       }else if(itemPrice == '0'){
           retValue = "FREE";
       }else if(itemPrice != '0'){
           retValue = "PRICE";
       }else{
           //should not reach
           retValue = "ERROR";
       }
    }
    return retValue;
}

function initPage()
{
	initPageCommon();
    MM_preloadImages('/oss/oss/common/images//banner/under_banner_b.gif',
            '/oss/oss/common/images//banner/help_b.gif',
            '/oss/oss/common/images//banner/top_b.gif');
	if (ecSupportsSession()) {
		var status = ec.getSessionValue("giftStatus");
		// trace("giftStatus: "+status);
		
		var useCampaignCode = ec.getSessionValue("useCampaignCode");
		trace("useCampaignCode: " + useCampaignCode);
	
		if (status == "receiving") {
			setUnderButtonL(true, 'Now', "javascript:showPage('B_10.jsp?SD=N&titleId=')", "wiiSelectSound()");
			setUnderButtonR(true, 'Later', "javascript:goGiftNext('0001000157414945')", "wiiCancelSound()");
			document.getElementById("confirmationMsg").innerHTML = 'Download this software to Wii system memory now?';
			document.getElementById("confirmationMsgWithSD").innerHTML = 'Download this software to an SD<BR>Card now?';
			document.getElementById("constElements").style.display='none';
			document.getElementById("giftline").style.display='';
			document.getElementById("giftcurrentBalance").innerHTML = getBalance();
		} else if (useCampaignCode == "true") {
			setUnderButtonL(true, 'Now', "javascript:showPage('B_10.jsp?SD=N&titleId=')", "wiiSelectSound()");
			setUnderButtonR(true, 'Later', "javascript:showBack()", "wiiCancelSound()");
			document.getElementById("confirmationMsg").innerHTML = 'Download this software to Wii<BR>system memory now?';
			document.getElementById("confirmationMsgWithSD").innerHTML = 'Download this software to an SD<BR>Card now?';
			disableWiiPointButton();
		} else {
			setUnderButtonL(true, 'Yes', "javascript:showPage('B_10.jsp?SD=N&titleId=')", "wiiSelectSound()");
			setUnderButtonR(true, 'No', "javascript:showOldPage('B_05.jsp')", "wiiCancelSound()");
			document.getElementById("confirmationMsg").innerHTML = 'Download this software to Wii<BR>system memory now?';
			document.getElementById("confirmationMsgWithSD").innerHTML = 'Download this software to an SD<BR>Card now?';
		}
		// ec.setSessionValue("useCampaignCode", null);
		// trace("clear useCampaignCode in B_09. ");
	} else {
		setUnderButtonL(true, 'Yes', "javascript:showPage('B_10.jsp?SD=N&titleId=')", "wiiSelectSound()");
		setUnderButtonR(true, 'No', "javascript:showOldPage('B_05.jsp')", "wiiCancelSound()");
	}

    


    // show points and space
	//var r = ec.getDeviceInfo();
	//var t = ec.getTitleInfo (titleId);
	//var latestVersion = parseInt('1');
	//var spaceNeeded = Math.ceil(getFsSizeNeeded(t, titleSize, latestVersion)/1024/128);
	//var availSpace = Math.floor(((r.totalBlocks - r.usedBlocks) * r.blockSize) / 1024 / 128);

	var currentBalance = getBalance();
        
        var spaceNeeded = titleManager.getNeededTitleBlocks('N');
        var availSpace = titleManager.getAvailUserBlocks();

	var remainingBalance = currentBalance - titlePoints;
	var remainingAvailSpace = Math.max( availSpace - spaceNeeded, 0 );
	document.getElementById("pointcost01").innerHTML = 
		'<div align="right" class="catalogTitleBlack_01">' + currentBalance + '</div>';
	document.getElementById("pointword02").innerHTML = 
		'<div align="right" class="contentsRedM">' + titlePoints + '</div>';
	document.getElementById("pointword03").innerHTML =
		'<div align="right" class="catalogTitleBlack_01">' + remainingBalance + '</div>';
	document.getElementById("blockcost01").innerHTML = 
		'<div align="right" class="catalogTitleBlack_01">' + availSpace + '</div>';
	document.getElementById("blockcost02").innerHTML = 
		'<div align="right" class="contentsRedM">' + spaceNeeded + '</div>';
	document.getElementById("blockcost03").innerHTML = 
		'<div align="right" class="catalogTitleBlack_01">' + remainingAvailSpace + '</div>';
	document.getElementById("BuyMsg").innerHTML = 
		'Downloading this software requires '+titlePoints+' Wii Points and uses '+spaceNeeded+' blocks in the Wii system memory.';

    // check SD mode and SD available
    checkSD();
}
//-->
</script>
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

<div id="text01-01">
  <div align="left" class="titleBlackL"><span id="heading">Download Confirmation</span></div>
</div>


<div id="confirmframe">

<div id="goodsconfirmation"><img src="/oss/oss/common/images//banner/goods_confirmation.gif" width="537" height="225" /></div>
<div id="text03-01">
  <div align="center" class="catalogTitleBlack_01">
    <div align="right">Current Wii Points:</div>
  </div>
</div>
<div id="text04-01">
  <div align="center" class="contentsRedM">
    <div align="right">Wii Points to Download:</div>
  </div>
</div>


<div id="MsgWithoutSD">
<div id="text06-01">
  <div align="center" class="catalogTitleBlack_01">
    <div align="right">Open Blocks:</div>
  </div>
</div>
<div id="text07-01">
  <div align="center" class="contentsRedM">
    <div align="right">
    	Blocks to Download:</div>
  </div>
</div>
<div id="text08-01">
  <div align="center" class="catalogTitleBlack_01">
    <div align="right">
    	Blocks after Download:</div>
  </div>
</div>
<div id="confirmation">
  <div align="center" ><span class="headerBlueL" id="confirmationMsg"></span></div>
</div>
</div>

<div id="MsgWithSD" style="display: none;">
<div id="text06-01">
  <div align="center" class="catalogTitleBlack_01">
    <div align="right">SD Card Open Blocks:</div>
  </div>
</div>
<div id="text07-01">
  <div align="center" class="contentsRedM">
    <div align="right">
    	SD Card Blocks to Download:</div>
  </div>
</div>
<div id="text08-01">
  <div align="center" class="catalogTitleBlack_01">
    <div align="right">
    	SD Card Blocks after Download:</div>
  </div>
</div>
<div id="confirmation">
  <div align="center" ><span class="headerBlueL" id="confirmationMsgWithSD"></span></div>
</div>
</div>


<div id="text05-01">
  <div align="center" class="catalogTitleBlack_01">
    <div align="right">Wii Points after Download:</div>
  </div>
</div>
<div id="pointcost01">
  <div align="right" class="catalogTitleBlack_01"></div>
</div>
<div id="pointword02">
  <div align="right" class="contentsRedM"><script>document.append(Number(ec.getCachedBalance()) + Number(""))</script></div>
</div>
<div id="pointword03">
  <div align="right" class="catalogTitleBlack_01"></div>
</div>
<div id="blockcost02">
  <div align="right" class="contentsRedM"></div>
</div>
<div id="blockcost01">
  <div align="right" class="catalogTitleBlack_01"></div>
</div>
<div id="blockcost03">
  <div align="right" class="catalogTitleBlack_01"></div>
</div>
<div id="pointword01">
  <div align="center">
    <div align="center" class="catalogTitleBlack_01">Wii Points</div>
  </div>
</div>
<div id="points02">
  <div align="center">
    <div align="center" class="contentsRedM">Wii Points</div>
  </div>
</div>
<div id="pointos03">
  <div align="center">
    <div align="center" class="catalogTitleBlack_01">Wii Points</div>
  </div>
</div>
<div id="blockword01">
  <div align="center" class="catalogTitleBlack_01">Blocks</div>
</div>
<div id="blockword02">
  <div align="center" class="contentsRedM">Blocks</div>
</div>
<div id="blockword03">
  <div align="center" class="catalogTitleBlack_01">Blocks</div>
</div>
<div id="text02-01">
  <div align="center">
    <div id="BuyMsg" align="left" class="buttonTextWhiteS_01">
      Downloading this software requires 0 Wii Points and uses 303.375 blocks in the Wii system memory.</div>
  </div>
</div>
<div style="overflow:hidden" nowrap id="TitleName1stline">
  <div align="center" class="contentsBlueM"></div>
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
      <a id="NANDAnchor" href="javascript:onNANDButtonPressed('0001000157414945', '', redownloadFlagExt)">
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
      <a id="SDAnchor" href="javascript:onSDButtonPressed('0001000157414945', '', redownloadFlagExt)">
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
</body>
</html>
