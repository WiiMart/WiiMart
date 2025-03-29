<%@ page import = "java.io.*,java.util.*,java.net.http.*,java.net.URI,java.net.http.HttpResponse.BodyHandlers,java.net.HttpURLConnection,java.net.URL,java.nio.charset.StandardCharsets,org.json.*" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<a href="https://oss-auth.blinklab.com/oss/serv/debug.jsp">debug</a>
<button onclick="window.location.reload()">reload</button>
<%@ page buffer="8192kb" autoFlush="true" %>
<%
String titleId = request.getParameter("titleId") == null ? "" : request.getParameter("titleId");
String targetURL = "http://127.0.0.1:8082/getTitle?titleId=" + titleId;
%>
<script>
    console.log("<%= titleId %>")
</script>
<%
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
    e.printStackTrace();
    res.append("Error: ").append(e.getMessage());
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
%>
<script>
	console.log('<%= games %>');
</script>
<%
// Parse JSON response
JSONObject title = new JSONObject(games);
String id = title.getString("id").replace("00010002", "00010001");
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
<script>
    console.log("<%= id %>")
</script>



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
               ('N64' == "FC/NES") && 
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


<script type="text/JavaScript">
<!--

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
	for(i=0; i<size; i++) { 
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
//-->
</script>

<html style="overflow:hidden">
<head>
  <script>
    // prevent 209601 (idle on a page, times the user out)
    var wiishop = new wiiShop();
    const unused = wiishop.connecting;
  </script>


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



//-->

</script>
<title>Details</title>
  <link href="/oss/oss/common/css/B_05.css" rel="stylesheet" type="text/css" />

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

var titleId = '<%= titleId %>';
var titleSize = '<%= size %>';
var titleTmdSize = '<%= tmdSize %>';
var latestVersion = parseInt('<%= latestVersion %>');

var titlePoints = '<%= points %>';
var trialPoints = '';

if(titlePoints != "") {
	titlePoints = parseInt(titlePoints);
}
var	giftTitlePoints = titlePoints;

var titleManager = new TitleManager(titleId, titleSize, titleTmdSize, latestVersion);
titleManager.traceLog();
var titleSizeKB = titleManager.getTitleKBSize();
var titleSizeBlock = 0;
var redownloadFlagExt;



var nonSDSupport = nonSDSupport();

function showSDSelection()
{
    document.getElementById("heading").innerHTML = 'Download Location';
    hideElement("details");
    hideElement("sdErrorDiv");
    hideElement("sdErrorNoSizeDiv");
    setUnderButton(false);
    showBuyButtons(false);
    setUnderButtonR(false);
    setUnderButtonL(true, "Back", "javascript:showDetails()", "wiiCancelSound()");
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

function showDetails()
{
    document.getElementById("heading").innerHTML = 'Details';
    hideElement("sdbuttons");
    showElement("details");
    setUnderButtonR(true);
    setUnderButtonL(true, "Back", "javascript:showBack()", "wiiCancelSound()");
    if(getURLParam("icr") == "true"){//IF come from B_04ICRPAGE
        showElement("buyButton");
    }else{
        showBuyButtons(true);
    }
}

function onNANDButtonPressed(titleId, itemId)
{
    onBuyButtonPressed(titleId, itemId, 'N');
}

function onSDButtonPressed(titleId, itemId)
{
    titleSizeBlock = titleManager.getSDBackupBlocks();
    if(!sdDLErrorHandle(titleId, titleSizeKB,'')){
        return;
    }
    onBuyButtonPressed(titleId, itemId, 'Y');
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
    // set the real blocks size which is short blocks for error message
    sdErrorMessage[24] = 'There is not enough available space on the SD Card to download this software. Either create '+titleSizeBlock+' block(s) of free space in the Wii console&rsquo;s Data Management<BR>screen, or insert a different SD Card with '+titleSizeBlock+' block(s) of free space.';
    sdErrorMessage[36] = 'There is not enough available space in Wii system memory.<BR>Create '+titleSizeBlock+' block(s) of free space either by moving data to an SD Card or deleting data in the Wii console&rsquo;s Data Management screen.';
    hideElement("sdbuttons");
    showElement("sdErrorNoSizeDiv");
    document.getElementById("sdErrorNoSizeDivMsg").innerHTML = sdErrorMessage[(sdError * -1) - 1];

    if (!nonSDSupport) {
        setUnderButtonL(true, "Back", "javascript:showSDSelection()", "wiiCancelSound()");
        setUnderButton(true, "Data Management", 'javascript:showDataMng("/startup?initpage=showTitle&titleId='+titleId+'")', "wiiSelectSound()");
    } else {
        setUnderButtonL(true, "Back", "javascript:showSDSelection(); showDetails()", "wiiCancelSound()");
        setUnderButton(true, shop.menuBtn, "javascript:showWiiMenu()", "wiiSelectSound()");
    }
}

function getCautionUrl()
{
    var hasCaution1 = 'false';
    var hasCaution2 = 'false';
    var hasCaution3 = 'false';

	var caution1Url = 'B_08.jsp';
	var caution2Url = 'B_28.jsp';
	var caution3Url = 'B_29.jsp';

	if (hasCaution1 == "true") {
		return caution1Url;
	} else if (hasCaution2 == "true") {
		return caution2Url;
	} else if (hasCaution3 == "true") {
		return caution3Url;
	} else {
		return "";
	}
}

var passChecking = false;
var passCheckingBalance = false;
function onBuyButtonPressed(titleId, itemId, sd)
{
    if (sd == null) {
        if (!passCheckingBalance) { // if pass checking in onGiftButtonPressed, no check anymore
            doCheckingBalance(false);
            if (!passCheckingBalance)
                return;
        }

        if (nonSDSupport) {
            showSDSelection();
            onNANDButtonPressed(titleId, itemId);
            return;
        } else {
            showSDSelection();
            return;
        }
    }

    if (!passChecking) { // if pass checking in onGiftButtonPressed, no check anymore
    	doChecking(sd);
    	if (!passChecking)
	    	return;
    }

    var parentalControl = '';
	var downloadTitleUrl = 'B_09.jsp';
	var nextUrl = getCautionUrl();
	if(nextUrl == "") {
		nextUrl = downloadTitleUrl;
	}
	nextUrl = addParam(nextUrl, 'titleId', titleId);
	nextUrl = addParam(nextUrl, 'SD', sd);

	if (itemId == null) {
	    // Always skip parental control for re-download
	    // No need to append item id to url
	} else {
		// Buy item - set itemId
  	    nextUrl = addParam(nextUrl, 'itemId', itemId);
  	    // Show Parental Control if needed
	    if (parentalControl || (isParentalControlPointsOn() && titlePoints > 0)) {
	    	nextUrl = addParam('L_04.jsp', 'next', nextUrl);
	    }
	}
	showPage(nextUrl);
}

function onGiftButtonPressed(titleId, itemId)
{
	doCheckingBalance(true);
	if (!passCheckingBalance)
		return;
	var titleCaution = 'true';
    var passParentalControl = '';
	if (ecSupportsSession()) {
		ec.setSessionValue("giftStatus", "sending");
	}

	var nextUrl = getCautionUrl();
	if(nextUrl == "") {
		nextUrl = "B_18.jsp";
	}
	nextUrl = addParam(nextUrl, 'titleId', titleId);
	nextUrl = addParam(nextUrl, 'itemId', itemId);

	// Show Parental Control if needed
	var parentalControl = '';
	if (parentalControl || (isParentalControlPointsOn() && giftTitlePoints > 0) ) {
		nextUrl = addParam('L_04.jsp', 'next', nextUrl);
	}

	showPage(nextUrl);
}

function showBuyButtons(flag)
{
  var shop = new wiiShop;
  trace("compatiblemode: " + shop.isCompatibleMode);
  trace("flag: " + flag);
  if(shop.isCompatibleMode && flag){
       showElement("buyButton");
       showElement("giftButton")
    }
   else if (flag) {
       showElement("buyButton");
       showElement("giftButton");
   } else {
       hideElement("buyButton");
       hideElement("giftButton");
   }
}

function doChecking(sd) {
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
	var inodesNeeded = '25';
	trace("Max user inodes is " + r.maxUserInodes);
	trace("Used user inodes is " + r.usedUserInodes);
	trace("Available user inodes is " + availInodes);
	trace("Needed user inodes is " + inodesNeeded);
	
	trace("freeChannelAppAcount is " + r.freeChannelAppCount);
	trace("freeChannels is " + freeChannels);
	
	if ( freeChannels <= 0  &&  sd != 'Y'  &&  !(titleManager.getIsOnDevice() && titleManager.isUpdate())  ) {
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
		passChecking = false;
	} else {
		passChecking = true;
	}
}

function doCheckingBalance(giftCheckingFlag) {
	trace("do checking: giftCheckingFlag = "+giftCheckingFlag);

	var requiredPoints;
	if(giftCheckingFlag) {
		requiredPoints = giftTitlePoints;
	} else {
		requiredPoints = titlePoints;
	}
	
	var currentBalance = getBalance();

	// Display warning messages if title is not already downloaded and on card
	var warningDisplayed = true;
	
	var remainingBalance = currentBalance - requiredPoints;

	if (requiredPoints > 0 && remainingBalance < 0) {
		// Not enough points
		if (giftCheckingFlag)
			document.getElementById("giftPointError").style.display = '';
		else
			document.getElementById("pointError").style.display = 'block';
	} else {
		warningDisplayed = false;
	}
	
	if (warningDisplayed) {
		// Warning is displayed, don't display big buy button
		showBuyButtons(false);
		passCheckingBalance = false;
	} else {
		passCheckingBalance = true;
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

    if(titleLicense == "Unlimited"){
       if(isUpdate){
           retValue = "UPDATE"; 
       }else if(isOnDevice){
           retValue = "NULL";
       }else{
           retValue = "RE"
       }
    } else if(itemPrice == '') {
        retValue = "NULL";
    } else {
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

function statusOfGift(){
    var titleId = '000100014E414345';
    var giftable = 'true';
    var itemPrice = '';

    var retVal;
    
    if(itemPrice === ''){
        retVal = "NULL";
        return retVal;
    }
    trace("retVal in statusOfGift 1:::" + retVal);

    if (giftable != 'true'){
        retVal = "NULL";
    }else if(isScaGiftable(titleId)){
        retVal = "SCA";
    }else{
        retVal = "PRICE";
    }
    trace("retVal in statusOfGift 2:::" + retVal);
    return retVal;
}

function showICRWarningPage(){
    hideElement("purchasePage");
    setUnderButtonR(true, "OK", "javascript:showPurchasePage();", "wiiSelectSound()");
    document.getElementById("icrWarningPage").style.display ='block';
}

function showICRExpirePage(){
    hideElement("purchasePage");
	setUnderButton(true, "Try Again", "javascript:shop.retry();", "wiiSelectSound()");
    setUnderButtonL(false);
    setUnderButtonR(false);
    disableTopHelpElements();
    disableWiiPointButton();
    document.getElementById("icrExpirePage").style.display ='block';
}


function showPurchasePage(){
    hideElement("icrWarningPage");
    onBuyButtonPressed('000100014E414345', '');
    showElement("purchasePage");
}


function initPurchaseButtonArea() {
	function setFree(caption) {
		titlePoints = "<%= points %>";
		document.getElementById("text03-01").innerHTML = caption;
    trace("setting caption to: " + caption)
		//document.getElementById("price").innerHTML = '<%= points %> Wii Points';
	}


    if(isICRExpired()){
        showICRExpirePage();
		
		return;
    }

    
    var titleLicense = getTitleLicense(titleId);
    trace("trialPoints:::"+trialPoints);
    if(titleLicense != "Unlimited" && titlePoints === '' && trialPoints === ''){
        hideElement("buyButton");
        document.getElementById("notAvailableMsg").style.display = '';

		return;
    }



    var purchaseButton = statusOfPurchase();
    var giftButton = statusOfGift();
    trace("purchaseButton:::"+purchaseButton);
    
    trace("giftButton:::"+giftButton);
    
    if (purchaseButton == "NULL"){
        titlePoints = 0;
        hideElement("buyButton");
    }else{
        showElement("buyButton");
        if (purchaseButton == "UPDATE"){
			setFree('Update');
        }else if(purchaseButton == "RE"){
			setFree('Download');
        }else if(purchaseButton == "ICR"){
			setFree('One Free Title');
            document.getElementById("BuyAnchor").href ='javascript:showICRWarningPage()';
        }else if(purchaseButton == "SCAGOLD"){
			setFree('Connection Ambassador');
        }else if(purchaseButton == "SCASILVER"){
			setFree('Connection Ambassador');
        }else if(purchaseButton == "FREE"){
			setFree('Free');
        }else{//PRICE
            trace("Price!!!");
            document.getElementById("text03-01").innerHTML = 'Download';
        }
    }

    
    if(purchaseButton == "UPDATE" || purchaseButton == "RE"){
       document.getElementById("BuyAnchor").href = 'javascript:onBuyButtonPressed("<%= titleId %>")';
       document.getElementById("NANDAnchor").href = 'javascript:onNANDButtonPressed("<%= titleId %>")';
       document.getElementById("SDAnchor").href = 'javascript:onSDButtonPressed("<%= titleId %>")';
    }

    var shop = new wiiShop;
  if(shop.isCompatibleMode){
    giftButton = "NULL"
    }

    
    if(giftButton == "NULL"){
    }else if(giftButton == "SCA"){
		giftTitlePoints = "<%= points %>";
        showElement("giftButton");
        document.getElementById("giftButtonText").innerHTML = 'SCA Free Gift'
        document.getElementById("giftPrice").innerHTML = '<%= points %> Wii Points';
    }else{//PRICE
        showElement("giftButton");
        document.getElementById("giftButtonText").innerHTML = 'Gift'
    }
    
    
    if(getURLParam("icr") == "true"){//IF come from B_04ICRPAGE
        document.getElementById("BuyAnchor").href = "javascript:onBuyButtonPressed('000100014E414345', '')";
        //document.getElementById("buyButton").style.left = '189px';
    }
    
    //if(purchaseButton != "NULL" && giftButton != "NULL"){
    //    document.getElementById("buyButton").style.left = '67px';
    if(purchaseButton != "NULL" && giftButton == "NULL"){
        //document.getElementById("buyButton").style.left = '189px';
    }else if(purchaseButton == "NULL" && giftButton != "NULL"){
        document.getElementById("giftButton").style.left = '189px';
    }else if(purchaseButton == "NULL" && giftButton == "NULL"){
        document.getElementById("downloadedMsg").style.display = '';
    }

}


function initPage()
{
    initPageCommon();
    MM_preloadImages('/oss/oss/common/images//banner/under_banner_b.gif',
            '/oss/oss/common/images//banner/help_b.gif',
            '/oss/oss/common/images//banner/top_b.gif',
            '/oss/oss/common/images//banner/buy_b.gif',
            '/oss/oss/common/images//banner/controller_msg2_E_en.gif',
            '/oss/oss/common/images//banner/B01_halfbanner_a.png',
            '/oss/oss/common/images//banner/B01_halfbanner_b.png',
            '/oss/oss/common/images//banner/sdToSD_a.png',
            '/oss/oss/common/images//banner/sdToSD_b.png',
            '/oss/oss/common/images//banner/sdToNAND_a.png',
            '/oss/oss/common/images//banner/sdToNAND_b.png',
            '/oss/oss/common/images//banner/point_gray.png',
            '/oss/oss/common/images//banner/AgeRating_a.gif',
            '/oss/oss/common/images//banner/AgeRating_b.gif',
            '/oss/oss/common/images//banner/AgeRating_USK_a.gif',
            '/oss/oss/common/images//banner/AgeRating_USK_b.gif');
    

    if (snd && "playBGM" in snd) {
        snd.playBGM();
    }

    setUnderButtonL(true, "Back", "javascript:showBack()", "wiiCancelSound()");

    if (titleId == '') {
        hideElement("details");
        showBuyButtons(false);
        showElement("noTitleMsg");
        return;
    }


    if ('The Legend of Zelda:'.indexOf('[UNDELIVERABLE]', 0) != -1) {
        hideElement("details");
        showBuyButtons(false);
        showElement("undeliverableMsg");
        return;
    }


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

    // Debug mode (please comment out this block when using for release)
    // showElement("SD_Error_Debug");

    


var silverPromoType = '';
var silverStatus = '';
var silverDiscountType = '';
var silverMemberId = '';
var silverEligibleTime = '';
var silverActivatedTime = '';
var goldPromoType = '';
var goldStatus = '';
var goldDiscountType = '';
var goldMemberId = '';
var formattedGoldMemberId = '';
var goldEligibleTime = '';
var goldActivatedTime = '';
var SCAGiftableTitlesString = '';


var icrStatus = '';
var icrDiscountType = '';


var sca10DiscountAmount = '';
var sca10FinalPrice = '';
var sca10Currency = '';
var sca10DiscountXml = ''
var sca10PromoType = '';
var sca10DiscountType = '';
var sca10ExactDiscount = '';

var sca20DiscountAmount = '';
var sca20FinalPrice = '';
var sca20Currency = '';
var sca20DiscountXml = ''
var sca20PromoType = '';
var sca20DiscountType = '';
var sca20ExactDiscount = '';

var sca20BDiscountAmount = '';
var sca20BFinalPrice = '';
var sca20BCurrency = '';
var sca20BDiscountXml = ''
var sca20BPromoType = '';
var sca20BDiscountType = '';
var sca20BExactDiscount = '';



var icrDiscountAmount = '';
var icrFinalPrice = '';
var icrCurrency = '';
var icrDiscountXml = '';
var icrPromoType = '';
var icrDiscountType = '';
var icrExactDiscount = '';

    icrDiscountAmount = '';
    icrFinalPrice = '';
    icrCurrency = '';
    icrDiscountXml = '';
    icrPromoType = '';
    icrDiscountType = '';
    icrExactDiscount = '';
    
    trace("icrDiscountAmount: " + icrDiscountAmount);
    trace("icrFinalPrice: " + icrFinalPrice);
    trace("icrCurrency: " + icrCurrency);
    trace("icriscountXml: " + icrDiscountXml);
    trace("icrPromoType: " + icrPromoType);
    trace("icrDiscountType: " + icrDiscountType);
    trace("icrExactDiscount: " + icrExactDiscount);

    if(ecSupportsSession()){
        ec.setSessionValue("icrDiscountXml",""+icrDiscountXml);
        ec.setSessionValue("icrDiscountAmount",""+icrDiscountAmount); 
    }

    var isFreeIntroEnabled = 'false';


    var wifiIndicator = parseInt('0');
    trace("WiFi indicator: "+wifiIndicator);

	initPurchaseButtonArea();


    if (ecSupportsSession()) {
        ec.setSessionValue("giftStatus", null);
    }

}
//-->
</script>
</head>

<body onload="initPage();">

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
  
<div align="left" class="warningRed" id="errorCodeText" style="display:none">
    Error Code: <span id="errorCodePlaceholder"></span></div>

<div align="left" class="contentsRedM" id="errorText" style="display:none">
     <span id="errorTextPlaceholder"></span>
</div></div>

<div id="text01-01">
  <div align="left" class="titleBlackL"><span id="heading">Details</span></div>
</div>
<div id="warningMsgs">
  <div id="pointError" style="display:none">
    <div id="shortagepoint" align="center" class="catalogTitleBlackBold">
    <table height="100%">
    <tr>
      <td align="left" valign="middle">
        This software requires <%= points %> Wii Points to download.<BR>You do not have enough Wii Points.</td>
    </tr>
    </table>
    </div>
  </div>
  <div id="giftPointError" style="display:none">
    <div id="shortagepoint" align="center" class="catalogTitleBlackBold">
      <table height="100%">
      <tr>
        <td align="left" valign="middle">
          You do not have enough Wii Points to give this software as a gift.</td>
      </tr>
      </table>
    </div>
  </div>
</div>
<div id="icrWarningPage">
  <div id="text02-01">
      <div align="center" class="contentsBlackM">
          <table height="100%">
              <tr>
                  <td align="left" valign="middle">
                      To customers who downloaded the Internet Channel<BR>for 500 Wii Points:<BR><BR>In accordance with the Internet Channel<BR>becoming free of charge, you can now download one<BR>NES title (worth 500 Wii Points) free of charge.</td>
              </tr>
          </table>
      </div>
  </div>
  
  <div id="text02-02">
      <div align="center" class="contentsBlackM">
          <table height="100%">
              <tr>
                  <td align="left" valign="middle">
                      Please note that this offer will expire<BR>on December 31st, 2009.</td>
              </tr>
          </table>
      </div>
  </div>
  
  
  <div id="icrBackground">
      <img src="/oss/oss/common/images//banner/S_30_back.png" border="0" />
  </div>
</div>
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
<div id="purchasePage">

<div id="details">
  <div id="Photo">
    <img src="/oss/ccs/<%= titleId %>/<%= thumbnail %>" width="160" height="120" />
    </div>
  <div style="overflow: hidden;" class="catalogTitleBlack_01" id="DisplayCategory" align="left">
    <%= genre %></div>
  <div class="contentsBlackS" id="date">
    <div align="left" class="catalogTitleBlack_01">Released <%= releaseDate %></div>
  </div>
  <div class="catalogTitleBlack_01" id="Publisher">
    <div align="left"><%= publisher %></div>
  </div>
  <div id="Players">
    <div align="left" class="catalogTitleBlack_01"><%= players %></div>
  </div>
  <div style="overflow:hidden" nowrap class="contentsBlue" id="TitleName1">
    <div align="center" class="headerBlueM"><%= title1 %></div>
  </div>
  <div style="overflow:hidden" nowrap class="contentsBlue" id="TitleName2">
      <div align="center" class="headerBlueM"><%= title2 %></div>
    </div>
  <div id="Platform">
    <div align="left" class="headerWhiteS"><%= platform %></div>
  </div>
  <div id="controller">
    <img src="/oss/oss/common/images//banner/controller_msg1_E_en.gif" width="77" height="65" id="Image3control" />
  </div>
  <div id="controllerLink">
      <a id="ControlAnchor" href="javascript:onControlButtonPressed('<%= titleId %>')">
      <img src="/oss/oss/common/images//spacer.gif" width="77" height="65" border="0" id="Image2control" 
       onmouseover="MM_swapImage('Image3control','','/oss/oss/common/images//banner/controller_msg2_E_en.gif',1);wiiFocusSound();" 
       onmouseout="MM_swapImgRestore()" onclick="wiiSelectSound();"/>
      </a>
    </div>
  <div id="Rating">
  <!-- content descriptors uses text for ESRB and OFLC, images for PEGI and CERO -->
    <div id="ESRB_Rating">
        <%
            if (!rating.equals("")) { %>
                <img src="/oss/oss/common/images//Pic_Rating/ESRB//ESRB_<%= rating %>.gif" 
                alt="ESRBE" width="46" height="69" />
           <% } %>
          </div>
          <div class="style8" id="Descriptors"><%= ratingDetails %></div>
          </div>
  <img src="/oss/oss/common/images//banner/Details.gif" width="537" height="217" />
  </div>
<!-- ordinary pricing -->
<div id="buyButton">
    <div id="buybanner" style="z-index:32;"><img src="/oss/oss/common/images//banner/buy_a.gif" width="241" height="76" id="Image3" /></div>
    <div id="text03-01" class="buttonTextWhiteL buttonText">
      Download</div>
    <div id="price" class="buttonTextWhiteL buttonText">
        <%= points %> Wii Points</div>
    <div id="buyspacer">
      <a id="BuyAnchor" href="javascript:onBuyButtonPressed('<%= titleId %>', '')">
        <img src="/oss/oss/common/images//spacer.gif" width="241" height="76" border="0" id="Image2" 
         onmouseover="MM_swapImage('Image3','','/oss/oss/common/images//banner/buy_b.gif',1);wiiFocusSound();" 
         onmouseout="MM_swapImgRestore()" 
         onclick="wiiSelectSound();"/>
      </a>
    </div>
    <div id="buyshadow">
      <img src="/oss/oss/common/images//banner/banner03_shadow.gif" width="274" height="90" />
    </div>
  </div>
  <div id="giftButton" style="position:absolute; left:321px; top:293px; width:241px; height:76px;">
    <div id="giftBanner" style="position:absolute; left:0px; top:0px; width:241px; height:76px; z-index:32; ">
      <img src="/oss/oss/common/images//banner/buy_a.gif" width="241" height="76" id="giftImage3"></div>
    <div id="giftButtonText" class="buttonTextWhiteL buttonText">Gift</div>
    <div id="giftPrice" class="buttonTextWhiteL buttonText">
      <%= points %> Wii Points</div>
    <div id="giftSpacer" style="position:absolute; left:0px; top:0px; width:100%; height:100%; z-index:35; ">
      <a id="giftAnchor" href="javascript:onGiftButtonPressed('<%= id %>', '')">
        <img src="/oss/oss/common/images//spacer.gif" width="241" height="76" border="0" id="giftImage2" onmouseover="MM_swapImage('giftImage3','','/oss/oss/common/images//banner/buy_b.gif',1);wiiFocusSound();" i="" onmouseout="MM_swapImgRestore()" onclick="wiiSelectSound();">
      </a>
    </div>
    <div id="giftShadow" style="position:absolute; left:-17px; top:-7px; width:274px; height:90px; z-index:1; ">
      <img src="/oss/oss/common/images//banner/banner03_shadow.gif" width="274" height="90">
    </div>
  </div>
  <!-- ordinary pricing end -->
</div>

<div id="downloadedMsg" style="display:none">
  <div id="buybanner2"><img src="/oss/oss/common/images//banner/buy_c.gif" width="290" height="42" id="Image4" /></div>
  <div id="text03-02">
    <div align="center" class="buttonTextBlackM">Downloaded</div>
  </div>
</div>

<div id="notAvailableMsg" style="position:absolute; left:36px; top:230px; width:540px; height:200px; z-index:37; display:none">
  <div align="center">
    <div align="center" class="contentsBlackM">
      <table height="100%">
      <tr>
        <td align="left" valign="middle">
        This software is currently unavailable.</td>
      </tr>
      </table>
    </div>
  </div>
</div>

<div id="noTitleMsg" style="position:absolute; left:36px; top:88px; width:540px; height:277px; z-index:37; display:none">
  <div align="center">
    <div align="center" class="contentsBlackM">
    <table height="100%">
    <tr>
      <td align="left" valign="middle">
        The software you have selected cannot be purchased or redownloaded at this time. Due to certain circumstances, this software is no longer available.</td>
    </tr>
    </table>
    </div>
  </div>
</div>

<div id="undeliverableMsg" style="position:absolute; left:36px; top:88px; width:540px; height:277px; z-index:37; display:none">
  <div align="center">
    <div align="center" class="contentsBlackM">
     <table height="100%">
     <tr>
       <td align="left" valign="middle">The Virtual Console version of this game does not support the Rumble Pak Feature that was available in the original N64 title.</td>
     </tr>
     </table>
    </div>
  </div>
</div>



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
      <a id="NANDAnchor" href="javascript:onNANDButtonPressed('<%= titleId %>', '', redownloadFlagExt)">
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
      <a id="SDAnchor" href="javascript:onSDButtonPressed('000100014E414345', '', redownloadFlagExt)">
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
