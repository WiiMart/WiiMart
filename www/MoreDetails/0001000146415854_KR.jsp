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
	

	ecsUrl = 'https://ecs.a.taur.cloud/ecs/services/ECommerceSOAP';

	iasUrl = 'https://ias.a.taur.cloud/ias/services/IdentityAuthenticationSOAP';

	ccsUrl = 'http://ccs.cdn.a.taur.cloud/ccs/download';

	ucsUrl = 'https://ccs.a.taur.cloud/ccs/download';
	

	ec.setWebSvcUrls(ecsUrl, iasUrl);
	ec.setContentUrls (ccsUrl, ucsUrl);
	
	

	imagesPath = "/oss/oss/common/images/";
	htmlPath = "/oss/oss/common/html";
	ossPath = "https://oss-auth.a.taur.cloud/oss/serv/";
	secureOssPath = "https://oss-auth.a.taur.cloud/oss/serv/";	

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
<title>소프트웨어 설명</title>
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
	setUnderButtonL(true, "뒤로", "javascript:showBack()", "snd.playSE(cSE_Cancel)");
	

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


<div style="position:absolute; left:0px; top:0px; width:1px; height:1px; z-index:6;">
  <img src="/oss/oss/common/images//spacer.gif" name="ktouch" width="1" height="1" border="0" id="ktouch"/>
</div>

<div id="goodsfree">
  <div id="text" class="buttonTextBlackM">1980년에 아케이드 게임으로 등장한 <팩맨>은 스테이지 클리어형의 액션 게임입니다. 고스트를 피해 도망다니며 미로에 놓인 쿠키를 하나도 남김 없이 다 먹어 치우면 스테이지 클리어입니다. 쿠키를 닥치는 대로 먹어 버리는 귀여운 모습과 파워 쿠키로 공수가 뒤바뀌는 통쾌함으로 많은 팬들을 매료시켰으며 일본뿐만 아니라 해외에서도 공전의 대 히트를 기록한 바 있습니다. 첫 등장 이후에도 여러가지 시리즈작이 나왔으며 지금도 여전히 건재한 인기를 자랑하는 유서 깊은 명작 게임입니다.</div>
  <div id="image02">
    <img src="/oss/ccs/0001000146415854/FFFD0002" width="160" height="120" alt="Screen Shot 2"/>
    </div>
  <div id="image01">
    <img src="/oss/ccs/0001000146415854/FFFD0003" width="160" height="120" alt="Screen Shot 3"/>
    </div>  
</div>
<div id="text01-01">
  <div align="left" class="titleBlackL">소프트웨어 설명</div>
</div>
<div id="goodsdetails"><img src="/oss/oss/common/images//banner/goods_details.gif" width="540" height="293" /></div>
<div style="overflow:hidden" nowrap id="TitleName1stline">
  <div align="center" class="headerBlueL"><span class="contentsBlueM">팩맨<sup>&reg;</sup></span></div>
</div>
<div style="overflow:hidden" nowrap id="TitleName2stline">
    <div align="center"><span class="contentsBlueM">(미국판)</span></div>
  </div>
<div class="contentsBlueM" id="Platform">
  <div align="left" class="headerWhiteS">패밀리컴퓨터</div>
</div>
</body>
</html>
