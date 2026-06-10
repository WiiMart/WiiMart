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
	a[-(EC_ERROR_NET_NA)] = "인터넷 접속 중 에러가 발생했습니다.<BR>인터넷 설정이 올바르게 되어 있는지 Wii 본체 설정의<BR>｢인터넷｣을 확인해 주십시오.";
	a[-(EC_ERROR_ECARD)] = "입력하신 닌텐도 포인트 번호가 올바르지 않습니다.<BR><BR>다시 한 번 확인해 주십시오.";
	a[-(EC_ERROR_REGISTER)] = "이 Wii 번호는 Wii 쇼핑 채널에 등록되어 있지 않습니다.";
	a[-(EC_ERROR_ALREADY_OWN)] = "에러가 발생했습니다. 잠시 후 다시 시도해 주십시오.<BR><BR>같은 에러가 반복해서 표시되는 경우에는<BR>한국닌텐도 고객지원센터로 문의해 주십시오.";
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
    		    msg = "インターネットに接続する際にエラーが発生しました。<BR>Wii Uメニューの本体設定で「インターネット」の<BR>設定内容をご確認ください。";
    		} else if (nhttpStatus == 0) {
    		    msg = "인터넷 접속 중 에러가 발생했습니다.<BR>인터넷 설정이 올바르게 되어 있는지 Wii 본체 설정의<BR>｢인터넷｣을 확인해 주십시오.";
    		} else if (nhttpStatus != 0) {
    		    msg = "에러가 발생했습니다. 잠시 후 다시 시도해 주십시오.<BR><BR>같은 에러가 반복해서 표시되는 경우에는<BR>한국닌텐도 고객지원센터로 문의해 주십시오.";
    		}
    	}
    }
        
    if (msg == null || msg == '') {
    	msg = "에러가 발생했습니다. 잠시 후 다시 시도해 주십시오.<BR><BR>같은 에러가 반복해서 표시되는 경우에는<BR>한국닌텐도 고객지원센터로 문의해 주십시오.";
	}
	return msg;
}

function setErrorHtmlMsg(elem, errorCode, errorMsg)
{
    var html =
	 	'<span class="warningRed">'
		+ "에러 코드: <span id='errorCode'></span></span>"
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
	a[617] = "입력하신 닌텐도 포인트 번호가 올바르지 않습니다.<BR><BR>다시 한 번 확인해 주십시오.";
	a[618] = "이 닌텐도 포인트 번호는 고객님이 거주 중인 지역에서는<BR>사용하실 수 없습니다.<BR><BR>가지고 계신 닌텐도 포인트 번호를 올바르게 입력했는지<BR>다시 한 번 확인해 주십시오.";
	a[621] = "에러가 발생했습니다. 잠시 후 다시 시도해 주십시오.<BR><BR>같은 에러가 반복해서 표시되는 경우에는<BR>한국닌텐도 고객지원센터로 문의해 주십시오.";
	a[623]	= "본 소프트웨어의 체험판은 이미 이용하셨습니다. 　<BR>더 이상 체험판을 이용하실 수 없습니다.";
	a[642] = "에러가 발생했습니다. 잠시 후 다시 시도해 주십시오.<BR><BR>같은 에러가 반복해서 표시되는 경우에는<BR>한국닌텐도 고객지원센터로 문의해 주십시오.";
	a[643] = "에러가 발생했습니다. 잠시 후 다시 시도해 주십시오.<BR><BR>같은 에러가 반복해서 표시되는 경우에는<BR>한국닌텐도 고객지원센터로 문의해 주십시오.";
	a[644] = "고객님의 신용카드는 사용하실 수 없습니다.<BR><BR>자세한 내용은 Wii 고객지원센터에 문의해 주십시오.";
	a[645] = "에러가 발생했습니다. 잠시 후 다시 시도해 주십시오.<BR><BR>같은 에러가 반복해서 표시되는 경우에는<BR>한국닌텐도 고객지원센터로 문의해 주십시오.";
	
	// ECS Gift Errors
	a[646] = "에러가 발생했습니다. 잠시 후 다시 시도해 주십시오.<BR><BR>같은 에러가 반복해서 표시되는 경우에는<BR>한국닌텐도 고객지원센터로 문의해 주십시오.";
	a[621] = "에러가 발생했습니다. 잠시 후 다시 시도해 주십시오.<BR><BR>같은 에러가 반복해서 표시되는 경우에는<BR>한국닌텐도 고객지원센터로 문의해 주십시오.";
	a[626] = "에러가 발생했습니다. 잠시 후 다시 시도해 주십시오.<BR><BR>같은 에러가 반복해서 표시되는 경우에는<BR>한국닌텐도 고객지원센터로 문의해 주십시오.";
	a[625] = "에러가 발생했습니다. 잠시 후 다시 시도해 주십시오.<BR><BR>같은 에러가 반복해서 표시되는 경우에는<BR>한국닌텐도 고객지원센터로 문의해 주십시오.";
	
	// ETS Errors
	a[705] = "에러가 발생했습니다. 잠시 후 다시 시도해 주십시오.<BR><BR>같은 에러가 반복해서 표시되는 경우에는<BR>한국닌텐도 고객지원센터로 문의해 주십시오.";
	a[706] = "에러가 발생했습니다. 잠시 후 다시 시도해 주십시오.<BR><BR>같은 에러가 반복해서 표시되는 경우에는<BR>한국닌텐도 고객지원센터로 문의해 주십시오.";
	a[707] = "에러가 발생했습니다. 잠시 후 다시 시도해 주십시오.<BR><BR>같은 에러가 반복해서 표시되는 경우에는<BR>한국닌텐도 고객지원센터로 문의해 주십시오.";
	
	// PAS Errors
	a[810]	= "Wii 포인트가 부족합니다.<BR><BR>같은 에러가 반복해서 표시되는 경우에는 한국닌텐도 고객지원센터로 문의해 주십시오.";
	a[811]	= "이 닌텐도 포인트 번호는 유효기간이 지났습니다.";
	//a[812]	= "???OSS_ERROR_ECARD_NOT_USABLE???";
	//a[813]	= "???OSS_ERROR_ECARD_NOT_USABLE???";
	//a[814]	= "???OSS_ERROR_ECARD_NOT_USABLE???";
	a[815]	= "입력하신 닌텐도 포인트 번호는 이미 등록된 번호입니다.";
	a[819]	= "입력하신 닌텐도 포인트 번호가 올바르지 않습니다.<BR><BR>다시 한 번 확인해 주십시오.";
	
	a[826]	= "현재 사용자가 많아 서버 접속에 어려움이 있습니다.<BR><BR>잠시 후 다시 시도해 주십시오.";
	a[829]	= "현재 사용자가 많아 서버 접속에 어려움이 있습니다.<BR><BR>잠시 후 다시 시도해 주십시오.";
	a[830]	= "입력하신 닌텐도 포인트 번호가 올바르지 않습니다.<BR><BR>다시 한 번 확인해 주십시오.";
	a[831] = "이 닌텐도 포인트 번호는 고객님이 거주 중인 지역에서는<BR>사용하실 수 없습니다.<BR><BR>가지고 계신 닌텐도 포인트 번호를 올바르게 입력했는지<BR>다시 한 번 확인해 주십시오.";

	// IAS Errors 
	a[901]	= "이 Wii 번호는 Wii 쇼핑 채널에 등록되어 있지 않습니다.";
	a[903]	= "에러가 발생했습니다. 잠시 후 다시 시도해 주십시오.<BR><BR>같은 에러가 반복해서 표시되는 경우에는<BR>한국닌텐도 고객지원센터로 문의해 주십시오.";
	a[928] = "에러가 발생했습니다. 잠시 후 다시 시도해 주십시오.<BR><BR>같은 에러가 반복해서 표시되는 경우에는<BR>한국닌텐도 고객지원센터로 문의해 주십시오.";
	a[958]	= "에러가 발생했습니다. 잠시 후 다시 시도해 주십시오.<BR><BR>같은 에러가 반복해서 표시되는 경우에는<BR>한국닌텐도 고객지원센터로 문의해 주십시오.";
	a[942] = "(N/A)";
	a[943]	= "회원 ID 또는 패스워드가 올바르게 입력되지 않았습니다. 회원 ID와 패스워드를 확인 후 다시 시도해 주십시오.<BR><BR>회원 ID나 패스워드를 잊어버린 경우에는 클럽 닌텐도 홈페이지의 「상담 및 문의」 페이지에서 전화 또는 온라인 상담 창구를 통해 문의해 주십시오.";

	a[941] = "회원 ID 또는 패스워드가 올바르게 입력되지 않았습니다. 회원 ID와 패스워드를 확인 후 다시 시도해 주십시오.<BR><BR>회원 ID나 패스워드를 잊어버린 경우에는 클럽 닌텐도 홈페이지의 「상담 및 문의」 페이지에서 전화 또는 온라인 상담 창구를 통해 문의해 주십시오.";
	
	// More IAS Errors
	a[1401] = "회원 ID 또는 패스워드가 올바르게 입력되지 않았습니다. 회원 ID와 패스워드를 확인 후 다시 시도해 주십시오.<BR><BR>회원 ID나 패스워드를 잊어버린 경우에는 클럽 닌텐도 홈페이지의 「상담 및 문의」 페이지에서 전화 또는 온라인 상담 창구를 통해 문의해 주십시오.";
	a[1402] = "회원 ID 또는 패스워드에 오류가 있습니다. 회원 ID와 패스워드를 확인 후 다시 시도해 주십시오.<BR><BR>회원 ID나 패스워드를 잊어버린 경우에는 클럽 닌텐도 홈페이지의 「상담 및 문의」 페이지에서 전화 또는 온라인 상담 창구를 통해 문의해 주십시오.";
        a[1403] = "(N/A)";
	a[1499] = "클럽 닌텐도의 시스템을 점검중이므로, 지금은 회원 ID의 등록을 할 수 없습니다.<BR><BR>점검을 마칠 때까지 잠시 시다려 주십시오.";
	
	// OSS Errors
	a[1610]	= "이 소프트웨어 교환 번호는 유효기간이 지났습니다.";
	a[1611]	= "입력하신 소프트웨어 교환 번호가 올바르지 않습니다.<BR><BR>다시 한 번 확인해 주십시오.";
	a[1612] = "이 소프트웨어 교환 번호는 고객님이 거주 중인 지역에서는<BR>사용하실 수 없습니다.<BR><BR>가지고 계신 소프트웨어 교환 번호를 올바르게 입력했는지<BR>다시 한 번 확인해 주십시오.";
	a[1613] = "입력하신 소프트웨어 교환 번호에 해당하는 소프트웨어는 현재 서비스되고 있지 않습니다.";
	
	
	var msg = a[errCode];
	if(msg == null || msg == "") { // default errors
		if ((errCode >= 1400 && 
		     errCode <= 1499)) {
			msg = "(N/A)";
		}
	}
	return msg;
}

// NOA errors
function getNOAError(code)
{
	var a=new Array();
	
	a[NOA_ERROR_CountyRequired] 				= "(N/A)";
	a[NOA_ERROR_FoundOnBlacklist]				= "고객님의 신용카드는 사용하실 수 없습니다.<BR><BR>자세한 내용은 Wii 고객지원센터에 문의해 주십시오.";
	a[NOA_ERROR_BillingAddress]                             = "入力された住所が正しくありません。<BR><BR>入力内容を確認して、もういちどお試しください。";
	a[NOA_ERROR_InvalidCardType]                            = "카드 번호가 무효합니다.<BR><BR>입력 내용을 확인 후 다시 시도해 주십시오.";
	a[NOA_ERROR_InvalidVfyValue]                            = "신용카드의 정보가 올바르게 입력되지 않았습니다.<BR><BR>입력 내용을 확인 후 다시 시도해 주십시오.";
	a[NOA_ERROR_InvalidCcNumberAndExpDate]                  = "신용카드의 정보가 올바르게 입력되지 않았습니다.<BR><BR>입력 내용을 확인 후 다시 시도해 주십시오.";
	a[NOA_ERROR_InvalidCreditCardNumber]			= "카드 번호가 무효합니다.<BR><BR>입력 내용을 확인 후 다시 시도해 주십시오.";
	a[NOA_ERROR_InvalidExpDate]				= "신용카드의 정보가 올바르게 입력되지 않았습니다.<BR><BR>입력 내용을 확인 후 다시 시도해 주십시오.";
	a[NOA_ERROR_InvalidPostalCode]                          = "郵便番号と、Wii本体の国設定が一致していません。<BR><BR>入力内容を確認して、もういちどお試しください。";
	a[NOA_ERROR_TechnicalDifficulties]			= "신용카드의 정보를 확인하지 못했습니다.<BR><BR>잠시 후 다시 시도해 주십시오.";
	a[NOA_ERROR_TryAgainLater]				= "신용카드의 정보를 확인하지 못했습니다.<BR><BR>잠시 후 다시 시도해 주십시오.";

	a[NOA_RESULT_ERROR_CreditCardDeclined]			= "고객님의 신용카드는 사용하실 수 없습니다.<BR><BR>자세한 내용은 신용카드 회사에 문의해 주십시오.";
	a[NOA_RESULT_ERROR_CreditCardDeclined_Funds]		= "고객님의 신용카드는 사용하실 수 없습니다.<BR><BR>자세한 내용은 신용카드 회사에 문의해 주십시오.";
	a[NOA_RESULT_ERROR_CreditCardDeclined_Inactive]		= "고객님의 신용카드는 사용하실 수 없습니다.<BR><BR>자세한 내용은 신용카드 회사에 문의해 주십시오.";
	a[NOA_RESULT_ERROR_CreditCardDeclined_Exp]		= "신용카드의 유효기간이 올바르지 않습니다.";
	a[NOA_RESULT_ERROR_CreditCardDeclined_Code]		= "신용카드의 정보가 올바르게 입력되지 않았습니다.<BR><BR>입력 내용을 확인 후 다시 시도해 주십시오.";
	a[NOA_RESULT_ERROR_CreditCardDeclined_CCNum]		= "카드 번호가 무효합니다.<BR><BR>입력 내용을 확인 후 다시 시도해 주십시오.";
	a[NOA_RESULT_ERROR_CreditCardDeclined_Limit]            = "고객님의 신용카드는 사용하실 수 없습니다.<BR><BR>자세한 내용은 신용카드 회사에 문의해 주십시오.";
	a[NOA_RESULT_ERROR_CreditCardDeclined_Invalid]		= "신용카드의 정보가 올바르게 입력되지 않았습니다.<BR><BR>입력 내용을 확인 후 다시 시도해 주십시오.";
	a[NOA_RESULT_ERROR_CreditCardDeclined_AVS]		= "(N/A)";

	a[NOA_ERROR_EmptyVfyValue]				= "3자리의 보안 번호를 올바르게 입력해 주십시오.";

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
<title>소프트웨어 확인</title>
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
		var platform = 'SFC/SNES';
		trace("platform: "+platform);
		var genreWifiPay = "";
		
		if (giftStatus == "sending") {
			setUnderButtonL(true, "뒤로", "javascript:showOldPage('B_05.jsp')", "snd.playSE(cSE_Cancel)");
			if (showCtrlPage != "true") {
				if (hasCautionItem2 == "true" || ((genreWifiPay == "true") && (wifiIndicator == WIFI_PARTIALLY_CHARGED || wifiIndicator == WIFI_ALL_CHARGED || wifiIndicator == WIFI_FREE_INPUT))) {
					setUnderButtonR(true, "OK", "javascript:showPage('B_28.jsp?titleId=000100014A425754&itemId=&SD=')", "snd.playSE(cSE_Decide)");
				} else if (hasCautionItem3 == "true") {
					setUnderButtonR(true, "OK", "javascript:showPage('B_09.jsp?titleId=000100014A425754&itemId=&SD=')", "snd.playSE(cSE_Decide)");
				} else {
					setUnderButtonR(true, "OK", "javascript:showPage('B_18.jsp?titleId=000100014A425754&itemId=&SD=')", "snd.playSE(cSE_Decide)");
				}
			}
		} else if (giftStatus == "receiving") {
			// setUnderButtonL(true, "뒤로", "javascript:showGiftTrans("+transId+")", "snd.playSE(cSE_Cancel)");
			if (showCtrlPage == "true") {
                disableWiiPointButton();
				setUnderButtonL(true, "뒤로", "javascript:showBack()", "snd.playSE(cSE_Cancel)");
			} else {
				if (hasCautionItem2 == "true" || ((genreWifiPay == "true") && (wifiIndicator == WIFI_PARTIALLY_CHARGED || wifiIndicator == WIFI_ALL_CHARGED || wifiIndicator == WIFI_FREE_INPUT))) {
					setUnderButtonR(true, "OK", "javascript:showPage('B_28.jsp?titleId=000100014A425754&itemId=&SD=')", "snd.playSE(cSE_Decide)");
				} else if (hasCautionItem3 == "true") {
					setUnderButtonR(true, "OK", "javascript:showPage('B_09.jsp?titleId=000100014A425754&itemId=&SD=')", "snd.playSE(cSE_Decide)");
				} else {
					setUnderButtonR(true, "OK", "javascript:showPage('B_09.jsp?titleId=000100014A425754&SD=')", "snd.playSE(cSE_Decide)");
				}
			}
			document.getElementById("constElements").style.display='none';
			document.getElementById("giftline").style.display='';
			document.getElementById("giftcurrentBalance").innerHTML = getBalance();
		/* } else if (redownloadFlag == "true") {
			setUnderButtonL(true, "뒤로", "javascript:showGiftTrans("+transId+")", "snd.playSE(cSE_Cancel)");
			setUnderButtonR(true, "OK", "javascript:showPage('B_09.jsp?titleId=000100014A425754&SD=')", "snd.playSE(cSE_Decide)");
		*/
		} else {
			var lastPageB08 = ec.getSessionValue("history.B_08.-1");
			if (lastPageB08.indexOf("history.B_31") == 0) {
				disableWiiPointButton();
			}
			if (useCampaignCode != "true") {
				setUnderButtonL(true, "뒤로", "javascript:showBack()", "snd.playSE(cSE_Cancel)"); 
			}
			if (showCtrlPage != "true") {
				if (hasCautionItem2 == "true" || ((genreWifiPay == "true") && (wifiIndicator == WIFI_PARTIALLY_CHARGED || wifiIndicator == WIFI_ALL_CHARGED || wifiIndicator == WIFI_FREE_INPUT))) {
					setUnderButtonR(true, "OK", "javascript:showPage('B_28.jsp?titleId=000100014A425754&itemId=&SD=')", "snd.playSE(cSE_Decide)");
				} else if (hasCautionItem3 == "true") {
					setUnderButtonR(true, "OK", "javascript:showPage('B_09.jsp?titleId=000100014A425754&itemId=&SD=')", "snd.playSE(cSE_Decide)");
				} else {
					setUnderButtonR(true, "OK", "javascript:showPage('B_09.jsp?titleId=000100014A425754&SD=')", "snd.playSE(cSE_Decide)");
				}
			}
		}

		if (showCtrlPage == "true") {
            disableWiiPointButton();
			document.getElementById("ManualImageID").onclick = 'ec.setSessionValue("showCtrlPage", "true"); showHelp(); wiiSelectSound();';
			document.getElementById("B08headingMessage").innerHTML = "컨트롤러 확인";
		} else {
			document.getElementById("B08headingMessage").innerHTML = "소프트웨어 확인";
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
  
  <div class="dot" id="line01">･･･････････････････････････････････････････････････････････････････&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;･･</div>
  <div class="dot" id="line02">･･････････････････････････････････････････････････････････････････････････････････････</div>
  <div class="dot" id="upperLineLong" style="display:none">･･････････････････････････････････････････････････････････････････････････････････････</div>
  
  <div id='balanceInfo'>
    <script type="text/JavaScript">MM_preloadImages('/oss/oss/common/images//banner/Addpoints_everywhere.gif');</script>
    <img src="/oss/oss/common/images//spacer.gif" name="PointSpacer" width="130" height="55" border="0"
     id='PointSpacer' style="position:absolute; top:376px; left:239px; z-index:20;"/>
    <div id="Wiipoint">
      <div align="center" class="buttonTextBlackM">Wii 포인트</div>
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
  <div class="dot" id="line02">･･････････････････････････････････････････････････････････････････････････････････････</div>
  <div class="dot" id="line01">･･････････････････････････････････････････････････････････････････････････････････････</div>
  <div id="Wiipoint">
    <div align="center" class="buttonTextBlackM">Wii 포인트</div>
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
  <div align="center" class="contentsBlueM">중장기병 발켄</div>
</div>
<div style="overflow:hidden" nowrap id="TitleName2stline">
    <div align="center"><span class="contentsBlueM">(미국판)</span></div>
  </div>
<div id="text02-01" >
  <div align="center" >
    <div align="center" class="contentsBlueS_01">본 소프트웨어를 다운로드하기 전에 다음 사항을 확인해 주십시오.</div>
  </div>
</div>

<div id="controller" align="center">
  <img src="/oss/oss/common/images//banner/B_08_ClassicCtrl.gif" width="68" height="51" />
    <div id="GcCtrl"  style="display: inline-block; _display: inline;"><img src="/oss/oss/common/images//banner/B_08_GcCtrl.gif" width="68" height="51" /></div>
    </div>

<div id="text03-01">
    <div align="center" >
      <div align="left" class="contentsBlackS">클래식 컨트롤러(별매)로 플레이할 것을 권장합니다.<BR>게임큐브 컨트롤러도 사용 가능하나 일부 조작이 어려울 수<BR>있습니다. Wii 리모컨만으로는 플레이할 수 없습니다. </div>
    </div>
  </div>
  <div id="text04-01">
    <div align="center" >
      <div align="left" class="contentsBlackS"></div>
    </div>
  </div>
</body>
</html>
