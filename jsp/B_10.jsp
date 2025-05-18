<%@ page import = "java.io.*,java.util.*,java.util.Random,java.net.http.*,java.net.URI,java.net.http.HttpResponse.BodyHandlers,java.net.HttpURLConnection,java.net.URL,java.nio.charset.StandardCharsets,org.json.*" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<a href="https://oss-auth.blinklab.com/oss/serv/debug.jsp">debug</a>
<a href="javascript:location.reload()">reload</a>
<%
String titleId = request.getParameter("titleId") == null ? "" : request.getParameter("titleId");
String targetURL = "http://127.0.0.1:8082/getTitle?titleId=" + titleId;

StringBuilder res = new StringBuilder();

try {
    URL url = new URL(targetURL);
    HttpURLConnection connection = (HttpURLConnection) url.openConnection();
    connection.setRequestMethod("GET");

    int responseCode = connection.getResponseCode();
    BufferedReader reader;

    if (responseCode == HttpURLConnection.HTTP_OK) {
        reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
    } else {
        reader = new BufferedReader(new InputStreamReader(connection.getErrorStream()));
    }

    String line;
    while ((line = reader.readLine()) != null) {
        res.append(line);
    }
    reader.close();
} catch (Exception e) {
    //e.printStacktrace();
}

String games = res.toString();
//Tmd size stuff
String tmdUrl = "http://198.62.122.200/ccs/download/" + titleId + "/tmd";
StringBuilder tmdRes = new StringBuilder();
long tmdSize = 0;
try {
    URL url = new URL(tmdUrl);
    HttpURLConnection connection = (HttpURLConnection) url.openConnection();
    connection.setRequestMethod("GET");
    tmdSize = connection.getContentLengthLong();
    int responseCode = connection.getResponseCode();
    BufferedReader reader;

    if (responseCode == HttpURLConnection.HTTP_OK) {
        reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
    } else {
        reader = new BufferedReader(new InputStreamReader(connection.getErrorStream()));
    }

    String line;
    //String contentLength = connection.getHeaderField("Content-Length");
    //tmdSize = contentLength;
    while ((line = reader.readLine()) != null) {
        tmdRes.append(line);
    }
    reader.close();
} catch (Exception e) {
    //e.printStacktrace(out);
    res.append("Error: ").append(e.getMessage());
}
// Parse JSON response
JSONObject title = new JSONObject(games);
String id = title.getString("id");
String thumbnail = title.getString("thumbnail");
String title1 = title.getString("title1");
String title2 = title.getString("title2");
String platform = title.getString("console");
if (platform.equals("WII")) {
    platform = "Wii Channels";
} else if (platform.equals("WIIWARE")) {
    platform = "WiiWare";
};
String releaseDate = title.getString("date");
String genre = title.getString("genre");
String publisher = title.getString("publisher");
String points = title.getString("points");
String players = title.getString("players");
String ratingDetails = title.getString("ratingdetails");
String rating = title.getString("rating").toUpperCase();
String controllers = title.getString("controllers");
String size = title.getString("size");
String latestVersion = title.getString("titleVersion");
%>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<script type="text/JavaScript">


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


</script>

<script type="text/JavaScript">



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
               ('' == "FC/NES") && 
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

</script>


<script type="text/JavaScript">

var supportSCA = ("false" == "true");

function isScaGiftable(titleId) {
	if(!supportSCA) {
		return false;
	}
	if(titleId == null || titleId == "") {
		return false;
	}
	if(getSCAUserStatus() == "") {
		return false;
	}

	var scaGiftableTitlesString = ec.getSessionValue("scaGiftableList"); 
	trace("giftTitle " + titleId); 
	trace("scaGiftableList: " + scaGiftableTitlesString); 

	if(scaGiftableTitlesString == null) {
		return false;
	}
	
	var scaGiftableTitleArray = scaGiftableTitlesString.split(","); 
	var size = scaGiftableTitleArray.length; 
	for(i = 0; i < size; i++) { 
		if(scaGiftableTitleArray[i] == titleId) { 
			return true;
		} 
	} 

	return false;
}

function getScaDiscount() {
	if(!supportSCA) {
		return "0";
	}
	var discountList = new Array(); 
	discountList['SCA10']  = ec.getSessionValue("sca10DiscountAmount");
	discountList['SCA20']  = ec.getSessionValue("sca20DiscountAmount");
	discountList['SCA20B'] = ec.getSessionValue("sca20BDiscountAmount");

	var discount = discountList[getSCAUserDiscountType()]; 
	trace("SCA discount: " + discount); 
	if((typeof(discount) != 'undefined') && (discount != "") && (discount != null)) {
		return discount;
	} else {
		return "0";
	}
}

function getScaPurchaseInfo(){
	if(!supportSCA) {
		return "";
	}

	var purchaseInfoList = new Array(); 
	purchaseInfoList['SCA10']  = ec.getSessionValue("sca10DiscountXml");
	purchaseInfoList['SCA20']  = ec.getSessionValue("sca20DiscountXml");
	purchaseInfoList['SCA20B'] = ec.getSessionValue("sca20BDiscountXml");
   
	var purchaseInfo = purchaseInfoList[getSCAUserDiscountType()]; 
	trace("SCA purchaseInfo: " + purchaseInfo);	
	if((typeof(purchaseInfo) != 'undefined') && (purchaseInfo != null)) {
		return purchaseInfo;
	} else {
		return "";
	}
}

function getScaGiftDiscount(titleId) {
	if(isScaGiftable(titleId)) {
        return getScaDiscount();
	 } else {
		return "0";
	}	
}

function getScaGiftPurchaseInfo(titleId) {
	if(isScaGiftable(titleId)) {
        return getScaPurchaseInfo();
	} else {
		return "";
	}
}

function removeScaGiftableTitle(titleId) {
	var scaGiftableTitlesString = ec.getSessionValue("scaGiftableList"); 
	trace("scaGiftableList(old): " + scaGiftableTitlesString); 
    if(scaGiftableTitlesString != null){
	    scaGiftableTitlesString = scaGiftableTitlesString.replace(titleId, "").replace(",,", ",");
    }
	trace("scaGiftableList(new): " + scaGiftableTitlesString); 
	ec.setSessionValue("scaGiftableList", scaGiftableTitlesString);
}

function getIcrDiscount() {
    if(getICRUserDiscountType() == "ICR1"){
        return ec.getSessionValue("icrDiscountAmount");
    }else{
        return "0";
    }
}

function getIcrPurchaseInfo() {
    if(getICRUserDiscountType() == "ICR1"){
        return ec.getSessionValue("icrDiscountXml");
    }else{
        return "";
    }
}

</script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
<link rel="shortcut icon" href="/oss/favicon.ico" /> 
<link href="/oss/oss/common/css/oss.css" rel="stylesheet" type="text/css" />
<link href="/oss/oss/common/css/error.css" rel="stylesheet" type="text/css" />
<script type="text/JavaScript">

	var ecCheck = false;
	var errorCheck = false;
	var buttonsCheck = false;
	var imagesCheck = false;
	var soundCheck = false;
	var shopCheck = false;
	var ossCheck = false;
    var myFunc = function(){};
</script>

<SCRIPT language="JavaScript" src="/oss/oss/common/js//ec.js"></SCRIPT>
<SCRIPT language="JavaScript" src='/oss/oss/common/js//error.js'></SCRIPT>
<SCRIPT language="JavaScript" src="/oss/oss/common/js//buttons.js"></SCRIPT>
<SCRIPT language="JavaScript" src="/oss/oss/common/js//images.js"></SCRIPT>
<SCRIPT language="JavaScript" src='/oss/oss/common/js//sound.js'></SCRIPT>
<SCRIPT language="JavaScript" src="/oss/oss/common/js//shop.js"></SCRIPT>
<SCRIPT language="JavaScript" src="/oss/oss/common/js//oss.js"></SCRIPT>
<script type="text/JavaScript">
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
	

	ecsUrl = 'https://oss-auth.blinklab.com/oss/ecs/services/ECommerceSOAP';

	iasUrl = 'https://oss-auth.blinklab.com/oss/ias/services/IdentityAuthenticationSOAP';

	ccsUrl = 'http://ccs.larsenv.com/ccs/download';

	ucsUrl = 'http://ccs.larsenv.com/ccs/download';
	

	ec.setWebSvcUrls(ecsUrl, iasUrl);
	ec.setContentUrls (ccsUrl, ucsUrl);
	
	

	imagesPath = "/oss/oss/common/images/";
	htmlPath = "/oss/oss/common/html";
	ossPath = "https://oss-auth.blinklab.com/oss/serv/";
	secureOssPath = "https://oss-auth.blinklab.com/oss/serv/";	

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





</script>
<title>Download Software</title>
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
/* B_11:  Receiving Error */
/* see B_10.css */
/* B_12: Receiving Successful */
/* see B_10.css */
</style>
<script language="JavaScript" src="/oss/oss/common/js/shopsd.js"></script>
<script language="javascript" src="/oss/oss/common/js/title_manager.js"></script>
</head>
<script language="javascript">
    trace("myMsg")

    trace("before all vars");
    var licenseType = '';
    var titleId = '<%= id %>'.replace('00010002', '00010001');
    var titleSize = '<%= size %>';
    var titlePoints = '<%= points %>';
    var titleTmdSize = '<%= tmdSize %>';
    
    var latestVersion = parseInt('<%= latestVersion %>');
    var redownloadFlag = 'Y';
    
    var titleManager = new TitleManager(titleId, titleSize, titleTmdSize, latestVersion);
    titleManager.traceLog();
    
    var titleIsGame = 'true';
    var sd = '<%= request.getParameter("SD") == null ? "" : request.getParameter("SD") %>';
    
    var titleSizeKB = titleManager.getTitleKBSize();
    trace("titleSizeKB:" + titleSizeKB)
    var expectedRemainingBalance;
    var expectedRemainingAvailSpace;
    
    function ecSupportsSetParameter()
    {
        return ("setParameter" in ec);
    }
    
    function launchTitle()
    {
        // Doesn't really launch title - just show health and warning page 
        if (titleIsGame == "true") {
            showPage('B_13.jsp?titleId=<%= id %>');
        } else {
            goGiftNext('');
        }
    }
    
    function clearSessionValue(){
       if(ecSupportsSession()){
           if((parseInt(getIcrDiscount()) < 0) && (redownloadFlag == 'N')){
               ec.setSessionValue("icrStatus", null);
           }
       }
    }
    
    function setMarioRep(){
        var scaGoldTitleStatus   = '' ; 
        var scaSilverTitleStatus = '' ;
        var icrTitleStatus = '';
        /*if(getICRUserStatus() == "ACTIVATED" && icrTitleStatus == "ICR"){
            wiiSetSCARank(0);
            return;
        }
        if(getSCAUserStatus() == "SCAGOLD" &&  scaGoldTitleStatus == "SCAGOLD"){
            wiiSetSCARank(2);
        }else if(getSCAUserStatus() == "SCASILVER" &&  scaSilverTitleStatus == "SCASILVER"){
            wiiSetSCARank(1);
        }else{
            wiiSetSCARank(0);
        }*/
	<%
	    Random rand = new Random();
	    int rank = rand.nextInt(4);
	%>
	wiiSetSCARank(parseInt('<%= rank %>'));
    }
    function purchaseTitle(titleId, itemId, price, limits)
    {
        var msg;
        var purchaseInfo = "";
        var discount = "0";
        if(parseInt(getIcrDiscount()) < 0){
            discount = getIcrDiscount();
            purchaseInfo = getIcrPurchaseInfo();
        }else{
            discount = getScaDiscount();
            purchaseInfo = getScaPurchaseInfo();
        }
        if (titleId == null) {
            setErr ( "ERROR: download:  No selected title");
        } else {
            trace("Item id is " + itemId);
            var downloadContent = true;
            var payment = new ECAccountPayment(); // buy with points
            var progress = ec.purchaseTitle (titleId, itemId, price, payment, limits, downloadContent,
                                            "",
                                            purchaseInfo,
                                            discount);
              opName  = "Purchase Title";
            opDesc  = "Purchasing Title  " + titleId;
            finishOp(opName, opDesc, progress, "onPurchaseDone");
        }
    }
    
    function onPurchaseDone (progress)
    {
        trace("onPurchaseDone\n");
        onDownloadDone(progress);
    }
    
    function onDownloadDone (progress)
    {
        if (ecSupportsSetParameter()) {
            ec.setParameter("SPACE_CHECK_POLICY", "SPACE_CHECK_USER_ONLY");
        }
        trace("onDownloadDone \n");
        showResult (progress, opName, opDesc);
        if (progress.status >= 0) {
            clearSessionValue();
            if (sd == 'Y') {
                if (!sdErrorCheck()) {
                    var setCancelReturn = setCancelJournal();
                    trace("### Yoshimi-san in onDownloadDone : setCancel = " + setCancelReturn + " : titleId = " + titleId + "\n");
                    if (setCancelReturn != 0) {
                        setSDErrorHtmlMsg(setCancelReturn);
                        return;
                    }
                    checkSDLibProgress("noneOp", "noneOp", "setSDErrorHtmlMsg");
                    return;
                }
                // if(snd != null) {
                //     snd.playSE( cSE_AddPoint );
                // }
                trace("### backupToSDCard start \n");
                backupToSDCard(titleId);
                checkSDLibProgress("checkSDCopyProgress", "doReportTMDDownload", "setSDErrorHtmlMsg");
                trace("### backupToSDCard end with reportTMDDownload, but this should not be displayed \n");
            } else {
                doReportTMDDownload();
            }
        } else {
            handleError(progress);
            var setCancelReturn = setCancelJournal();
            trace("### Yoshimi-san in showProgress : setCancel = " + setCancelReturn + " : titleId = " + titleId + "\n");
            if (setCancelReturn != 0) {
                setSDErrorHtmlMsg(setCancelReturn);
                return;
            }
            checkSDLibProgress("noneOp", "noneOp", "setSDErrorHtmlMsg");
        }
    
        trace("End onDownloadDone \n");
    }
    
    function doReportTMDDownload()
    {
        trace("doReportTMDDownload started")
        var titleInfo = ec.getTitleInfo(titleId);
        if ( gIsUpdate == false )
        {
            if (sd != 'Y') {
                trace("gIsUpdate=>false");
                incTitlesDownloaded(titleId);
            }
        }    
        var isTmdPresent = reportTMDDownload(titleId, redownloadFlag, titlePoints);
        trace("isTmdPresent: " + isTmdPresent);
        if (!isTmdPresent) {
            // the tmd is not present
            setUnderButton(true, shop.menuBtn, "javascript:showWiiMenu()", "wiiSelectSound();");
            document.getElementById("details").style.display='none';
            document.getElementById("text02-01").style.display='none';
            document.getElementById("TitleName").style.display='none';
    
            // Show error message and code
            var elem = document.getElementById("errorCodeText");
            setErrorHtmlMsg(elem, OSS_UNEXPECTED_ECLIB_ERROR, "An error has occurred that cannot be resolved at this time. Please try again later.<BR><BR>Visit support.nintendo.com for assistance if this continues.");
        }
    }
    
    var sdCopyTime = 0;
    var sdCopyMaxTime = 420000;  // msec.
    function checkSDCopyProgress(sdProgress)
    {
        sdCopyTime += ecProgressInterval;
        // document.getElementById("rcvHead").innerHTML='You are downloading' + ' ( ' + sdCopyTime + 'msec )';
        trace("### sdProgress in checkSDCopyProgress : " + sdProgress + " : " + sdCopyTime + " sec. \n");
    
        if (sdCopyMaxTime <= sdCopyTime) {
            // Timeout error
            // stopSDCopyProgress(-34);
            stopSDCopyProgress();
        }
    }
    
    function stopSDCopyProgress()
    {
        // Cancel backup and show error message and code : checkStopSDProgress
        if (!stopBackupToSDCard()) {
            setSDErrorHtmlMsg(-27);
            return;
        }
        checkStopSDProgress("noneOp", "setStopSDErrorHtmlMsg", "setSDErrorHtmlMsg");
    }
    
    function setStopSDErrorHtmlMsg() {
        setSDErrorHtmlMsg(-34);
    }
    
    function setSDErrorHtmlMsg(sdErrCode)
    {
        setConnectingToServer(false);
        if (sdErrCode == -13) {
            // NAND Corrupt error
            var nwc24 = new wiiNwc24 ;
            nwc24.dispError((sdError * -1) + 209630, 2);
        } else {
            // some SD error is returned 
            setUnderButton(true, "Try Again", "javascript:window.history.go(-1)", "wiiSelectSound();");
            document.getElementById("details").style.display='none';
            document.getElementById("text02-01").style.display='none';
            document.getElementById("TitleName").style.display='none';
    
            // Show SD error message and code
            var elem = document.getElementById("errorCodeText");
            setErrorHtmlMsg(elem, 209630 + (sdErrCode * -1), "An SD Card process failed. The SD Card may have been removed and reinserted.");
        }
        wiiEnableHRP();
    }
    
    function handleReportDownloadDone() {
        trace("handleReportDownloadDone \n");
        var currentBalance = getBalance();
        document.getElementById("rcvHead").innerHTML="You downloaded";
        document.getElementById("text03-01").style.display='';
        document.getElementById("text03-01").style.top='226px';
        document.getElementById("text03-01").innerHTML='<div align="center" class="titleBlueL">Download successful!</div>';
        document.getElementById("OKBtnWord").innerHTML="OK";
        document.getElementById("OKBtnAnchor").href='javascript:launchTitle()';
    
        // Show actual space and points remaining
        var r = ec.getDeviceInfo();
        if (sd == 'Y') {
            var sdErrorPreChk = checkValidSD(titleId, titleSizeKB)
            var sdFreeKBytes = getFreeKBytes();
            trace("checkValidSD:"+sdErrorPreChk);
            trace("sdFreeKBytes:"+sdFreeKBytes);
            if (sdFreeKBytes < 0 && sdErrorPreChk < 0 && sdErrorPreChk != -26) {
                var availSpace = "-";
            } else {
                var availSpace = Math.floor(sdFreeKBytes / 128);
            }
        } else {
            //titleManager.DeviceInfo();
            var availSpace = Math.floor(((r.totalBlocks - r.usedBlocks) * r.blockSize) / 1024 / 128);
            //var availSpace = titleManger.getAvailUserBlocks();
        }
        document.getElementById("pointCost").innerHTML = currentBalance;
        document.getElementById("blockCost").innerHTML = availSpace;
        setConnectingToServer(false);
        wiiDisableHRP();
        showProgress(false);
        trace("End handleReportDownloadDone \n");
    }
    
    function handleError(progress){
        var currentBalance = getBalance();
        trace("handleError \n");
        setConnectingToServer(false);
        document.getElementById("rcvHead").innerHTML="Transaction failure.";
        document.getElementById("details").style.display='none';
        var errMsg = getOssErrorMsg(progress);
        var errCode = getOssErrorCode(progress);
    
        document.getElementById("text03-01").style.display='';
        document.getElementById("text03-01").style.top='162px';
    
        if(errCode == 205540 && shop.isCompatibleMode){
            document.getElementById("text03-01").innerHTML=
              '<div align="center"><span class="contentsRedM">'+
              "Error Code: <span id='errorCode'></span><br>" +
              'This software is not available on the Wii U console.</span></div>';
            document.getElementById("OKBtnWord").innerHTML="Wii Menu";
            document.getElementById("OKBtnAnchor").href='javascript:showWiiMenu()';
            document.getElementById("text04-01").style.display='none';
            document.getElementById("text05-01").style.display='none';
    
        } else if(errCode == 204071 && shop.isCompatibleMode){
            document.getElementById("text03-01").innerHTML=
              '<div align="center"><span class="contentsRedM">'+
              "Error Code: <span id='errorCode'></span><br>" +
              'This software is not available on the Wii U console.</span></div>';
            document.getElementById("OKBtnWord").innerHTML="Wii Menu";
            document.getElementById("OKBtnAnchor").href='javascript:showWiiMenu()';
            document.getElementById("text04-01").style.display='none';
            document.getElementById("text05-01").style.display='none';
    
        } else {
            document.getElementById("text03-01").innerHTML=
              '<div align="center"><span class="contentsRedM">'+
              "Error Code: <span id='errorCode'></span><br>" +
              'Please wait a moment and try again.</span></div>';
            document.getElementById("OKBtnAnchor").href='javascript:shop.retry()';
            document.getElementById("OKBtnWord").innerHTML="Try Again";
        }
    
        document.getElementById("errorCode").innerHTML = errCode;
    
        trace("status: " + progress.status + ", phase: " + progress.phase);
    
        if(!shop.isCompatibleMode) {
            if ( errCode == OSS_ERROR_PROMO_OVER ) {
                document.getElementById("textIcrExpireInDL").style.display='';
            } else if (expectedRemainingBalance == currentBalance) {
                // Show message saying you can download again without using Wii Points
                document.getElementById("text05-01").style.display='';
            } else {
                // Show message saying your points will not be deducted
                document.getElementById("text04-01").style.display='';
            }
        }
        showProgress(false);
    }
    
    function showProgress(flag)
    {
        if (flag) {
            if (sd == 'Y') {
                document.getElementById("rcvHead").innerHTML='Now downloading to an SD Card. Do not remove the SD Card.';
            } else {
                document.getElementById("rcvHead").innerHTML='You are downloading';
            }
    
            document.getElementById("Progress").style.display='';
            document.getElementById("bannershadow").style.display='none';
            document.getElementById("spacerL").style.display='none';
            document.getElementById("bannerL").style.display='none';
            document.getElementById("wordL").style.display='none';	
            document.getElementById("details").style.display='';
    
            document.getElementById("text03-01").style.display='none';
            document.getElementById("text04-01").style.display='none';
            document.getElementById("text05-01").style.display='none';
        } else {
            document.getElementById("Progress").style.display='none';
            document.getElementById("bannershadow").style.display='';
            document.getElementById("spacerL").style.display='';
            document.getElementById("bannerL").style.display='';
            document.getElementById("wordL").style.display='';
        }
    }
    
    function downloadTitle(titleId){
        var msg;
        if (titleId == null) {
            setErr ( "ERROR: download:  No selected title");
        } else {
            var progress = ec.downloadTitle (titleId);
            opName = "Download";
            opDesc = "Downloading  "  + titleId;
            finishOp(opName, opDesc, progress, "onDownloadDone");
        }
    }
    
    function getTitleLimit(limitCode, limitValue){
        var titleLimit = new ECTitleLimit(limitCode, limitValue);
        return titleLimit;
    }
    
    function doPurchase()
    {
        
        purchaseTitle('<%= id %>'.replace('00010002', "00010001"), "0", new ECPrice('<%= points %>', "POINTS"), new ECTitleLimits());
        //downloadTitle(titleId.replace('00010002', "00010001"));
    }
    
    
    function checkBalance()
    {
        showProgress(true);
        setConnectingToServer(true);
        getPointsBalance("onGetPointsBalanceDone");
    }
    
    function onGetPointsBalanceDone(progress)
    {
        showResult (progress, opName, opDesc);
        if (progress.status >= 0) {
            syncTickets();
        } else {
            handleError(progress);
        }
    }
    
    function syncTickets ()
    {
        showProgress(true);
        setConnectingToServer(true);
        opName = "Sync Tickets";
        opDesc = "Synchronizing Tickets with server";
        var progress = ec.syncTickets("1");
        finishOp(opName, opDesc, progress, "onSyncTicketDone");
    }
    
    function onSyncTicketDone(progress)
    {
        showResult (progress, opName, opDesc);
        if (progress.status >= 0) {
            confirmPurchaseYes();
        } else {
            //do purchase even if there are ticket sync errors
            confirmPurchaseYes();
            //handleError(progress);
        }	
    }
    
    function confirmPurchaseYes()
    {    
        showProgress(true);
        
        wiiEnableHRP();
        trace("licenseType::" + licenseType);
        if (licenseType != 'PERMANENT') {
            // TESTING: Always purchase to allow purchasing of multiple etickets ...
            doPurchase();
        } else {
            var titleLicense = getTitleLicense(titleId); 
            trace("titleLicense: " + titleLicense);
            if (titleLicense == "Unlimited") {
                 // Already own this title - just redownload
                 downloadTitle(titleId);
            } else {
                // Don't own this title yet - do purchase
                doPurchase();
            }
        }	
    }
    
    function sdErrorCheck()
    {
        if (sd == 'Y') {
            var sdError = checkValidSD(titleId, titleSizeKB);
            var sdError2 = checkValidSD(titleId, titleSizeKB);
            if (sdError != sdError2) {
                sdError = checkValidSD(titleId, titleSizeKB);
            }
            if (sdError < 0) {
                setSDErrorHtmlMsg(sdError);
                return false;
            }
        }
        return true;
    }
    
    function showICRExpirePage(){
        document.getElementById("details").style.display='none';
        document.getElementById("text02-01").style.display='none';
        document.getElementById("TitleName").style.display='none';
        setUnderButton(true, "Try Again", "javascript:shop.retry();", "wiiSelectSound()");
        setUnderButtonL(false);
        setUnderButtonR(false);
        disableTopHelpElements();
        disableWiiPointButton();
        document.getElementById("icrExpirePage").style.display ='block';
    }
    function refreshBalance() {
        opName = "refreshing balance";
        opDesc = "refresh balance before/after purchase";
        var progress = ec.refreshCachedBalance();
        finishOp(opName, opDesc, progress, "refreshBalanceDone");
    }
    function refreshBalanceDone(progress) {
        showResult(progress, opName, opDesc);
        if (progress.status >= 0) {
            return;
        }
        return;
    }
    function initPage() {
        trace("initPage started");
        initPageCommon();
        MM_preloadImages('/oss/oss/common/images//banner/under_banner_b.gif');
    
        if(isICRExpired()){
            showICRExpirePage();
            return;
        }
    
        gIsUpdate = titleManager.isUpdate();
    
        if (ecSupportsSession()) {
            ec.setSessionValue("useCampaignCode", null);
            trace("clear useCampaignCode in B_10. ");
            ec.setSessionValue("gameCardNum", null);
            trace("clear gameCardNum in B_10. ");
        }
    
        if (sd == 'Y') {
            document.getElementById("labelPointBlock").innerHTML = 'Wii Points after Download:<BR>SD Card Blocks after Download:';
        }
    
        var reportDownloadDone = '<%= request.getParameter("reportDownloadDone") == null ? "" : "true" %>';
        trace("reportDownloadDone : " + reportDownloadDone);
        if (reportDownloadDone=="true") {
            refreshBalance();
            handleReportDownloadDone();
            return;
        }
    
        if (!sdErrorCheck()) {
            return;
        }
    
        // calculated expected remaining points and space
        var r = ec.getDeviceInfo();
        var t = ec.getTitleInfo (titleId);	
        var currentBalance = getBalance();
    
        if (sd == 'Y') {
                var spaceNeeded = titleManager.getSDBackupBlocks();
                var availSpace  = Math.floor(getFreeKBytes() / 128);
        } else {
                var spaceNeeded = titleManager.getNeededTitleBlocks(sd);
                var availSpace  = titleManager.getAvailUserBlocks();
        }
        if((parseInt(getIcrDiscount()) < 0 ) || ( parseInt(getScaDiscount()) < 0)){
           titlePoints = 0;
        }
        setMarioRep();
    
        expectedRemainingBalance = currentBalance - titlePoints;
        expectedRemainingAvailSpace = Math.max( availSpace - spaceNeeded, 0 );
    
        // Show expeccted remaining points and space
        document.getElementById("pointCost").innerHTML = expectedRemainingBalance;
        document.getElementById("blockCost").innerHTML = expectedRemainingAvailSpace;
    
        if (sd == 'Y') {
            if (ecSupportsSetParameter()) {
                ec.setParameter("SPACE_CHECK_POLICY", "SPACE_CHECK_ENTIRE_FS");
            }
            var isJournalReturn = isJournaling();
            trace("### Kuwajima-san : isJournal = " + isJournalReturn + " : titleId = " + titleId + "\n");
            // if (isJournalReturn == false) {
            //     setSDErrorHtmlMsg(-35);
            //     return;
            // }
            var setJournalReturn = setJournalFlag(titleId);
            trace("### Yoshimi-san : setJournal = " + setJournalReturn + " : titleId = " + titleId + "\n");
            if (setJournalReturn != 0) {
                setSDErrorHtmlMsg(setJournalReturn);
                return;
            }
            checkSDLibProgress("noneOp", "initPurchase", "setSDErrorHtmlMsg");
        } else {
            if (ecSupportsSetParameter()) {
                ec.setParameter("SPACE_CHECK_POLICY", "SPACE_CHECK_USER_ONLY");
            }
            initPurchase();
        }
    }

    function checkSDLibProgress(onProgress, onDoneOK, onDoneNG)
    {
        var checkSDLibValue = hasProgressFinished();
        if (checkSDLibValue >= 0 && !isConnectingToServer()) {
            wiiStopWaiting();
        }
        if (checkSDLibValue == 0) {
            eval(onDoneOK+"(checkSDLibValue)");
        } else if (checkSDLibValue < 0) {
            eval(onDoneNG+"(checkSDLibValue)");
        } else {
            eval(onProgress+"(checkSDLibValue)");
            setTimeout('checkSDLibProgress("'+onProgress+'","'+onDoneOK+'","'+onDoneNG+'")', ecProgressInterval);
        }
    }
    
    function checkStopSDProgress(onProgress, onDoneOK, onDoneNG)
    {
        var checkSDLibValue = hasProgressFinished();
        if (checkSDLibValue == -9) {
            eval(onDoneOK+"(checkSDLibValue)");
        } else if (checkSDLibValue > 0) {
            eval(onProgress+"(checkSDLibValue)");
            setTimeout('checkStopSDProgress("'+onProgress+'","'+onDoneOK+'","'+onDoneNG+'")', ecProgressInterval);
        } else {
            eval(onDoneNG+"(checkSDLibValue)");
        }
    }
    
    function initPurchase()
    {
        var r = ec.getDeviceInfo ();
        trace("isNeedTicketSync::"+r.isNeedTicketSync);
        checkBalance();
        /*if (typeof(r) == "object" && r.isNeedTicketSync) {
            // Update balance and sync etickets
            checkBalance();
        } else {
            confirmPurchaseYes();
        }*/
    }
    
    function noneOp(sdProgress)
    {
        trace("### noneOp : " + sdProgress + "\n");
    }
</script>

<body onload="var x = new wiiShop();var u=x.connecting;trace('shop loaded and not going to timeout');try {initPage();} catch (err) {trace('ERROR' + err.message)}">
<SCRIPT language="JavaScript">MM_preloadImages('/oss/oss/common/images//banner/under_banner_b.gif');</script>
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
  <div align="left" class="titleBlackL">Download Software</div>
</div>
<div id="text02-01">
  <div align="center"><span id="rcvHead" class="buttonTextBlackM">You are downloading</span></div>
</div>
<div id="TitleName">
<div id="TitleName1stline" nowrap style="position:absolute; left:64px; top:110px; width:480px; overflow:hidden; z-index:34">
  <div align="center" class="contentsBlueM"><%= title1 %></div>
</div>
<% if (!title2.equals("")) { %>
    <div style="overflow:hidden" nowrap="" id="TitleName2stline">
        <div align="center"><span class="contentsBlueM"><%= title2 %></span></div>
      </div>
<% } %>
</div>
<div id="details">
  <div id="free03">
    <div align="right" class="buttonTextBlackM" id="labelPointBlock">Wii Points after Download:<BR>Blocks after Download:</div>
  </div>
  <div id="pointcost01">
    <div id="pointCost" align="right" class="buttonTextBlackM"></div>
  </div>

  <div id="blockcost03">
        <div id="blockCost" align="right" class="buttonTextBlackM"></div>
      </div>
    <div id="pointword01">
    <div align="center" >
      <div align="left" class="buttonTextBlackM">Wii Points<BR>Blocks</div>
    </div>
  </div>
</div>

<div id="text03-01">
</div>

<div class="dot" id="line02">･･･････････････････････････････････････････････････････････････････････････</div>
<div class="dot" id="line01">･･･････････････････････････････････････････････････････････････････････････</div>
  
<div id="Wiipoint">
  <div align="center" class="buttonTextBlackM">Wii Points</div>
</div>
<div id="point">
  <div align="center" class="wiiPoint"><span id="currentBalance"></span></div>
</div>

<div id="bannershadow" style="display:none"><img src="/oss/oss/common/images//banner/under_banner_shadow.gif" width="211" height="75" /></div>
<div id="spacerL" style="display:none">
  <a id="OKBtnAnchor" href="javascript:launchTitle()"><img src="/oss/oss/common/images//spacer.gif" width="187" height="55" border="0" onmouseover="MM_swapImage('Image7','','/oss/oss/common/images//banner/under_banner_b.gif',1);snd.playSE( cSE_Forcus );" onmouseout="MM_swapImgRestore()" onclick="wiiSelectSound();"/></a>
</div>
<div id="bannerL" style="display:none"><img src="/oss/oss/common/images//banner/under_banner_a.gif" width="187" height="55" id="Image7" /></div>
<div id="wordL" style="display:none">
  <div align="center" ><span id="OKBtnWord" class="buttonTextBlackM">OK</span></div>
</div>

<div id="text04-01" class="contentsBlueS_01" style="display:none">
  <div align="center" >Please note that Wii Points will not be deducted from your account until the transaction is successful. <BR>Visit support.nintendo.com for assistance.</div>
</div>
<div id="text05-01" class="contentsBlueS_01" style="display:none">
  <div align="center" >You can download this software again without using any Wii Points.</div>
</div>
<div id="textIcrExpireInDL" style="display:none">
  <div align="center">This offer has expired.<BR>You may no longer download a title for free.</div>
</div>
<div align="left" id="errorCodeText"></div>
<div id="progressBar">
<div id="Progress">
	<div id="dynDiv1" class="contentsBlackS"></div>
    <div id="dynDiv2" class="contentsBlackS"></div>
    <div id="errDiv" class="contentsBlackS"></div>
</div></div>

<div id="icrExpirePage" style="display:none">
  <div id="textIcrExpire">
      <div align="center" class="contentsBlackM">
          <table height="100%">
              <tr>
                  <td align="left" valign="middle">
                      This offer has expired.<BR>You may no longer download a title for free.</td>
              </tr>
          </table>
      </div>
  </div>
</div>

</body>
</html>

