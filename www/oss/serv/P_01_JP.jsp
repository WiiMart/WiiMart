<%@ page import = "java.io.*,java.util.*" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %><% if ((request.getParameter("og") == null ? "false" : request.getParameter("og")).equals("false")) {%><a href="https://oss-auth.a.taur.cloud/oss/serv/debug.jsp">debug </a><a href="javascript:initWiiUmessage()">test</a><% } %>
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
<title>Wiiショッピングチャンネル</title>
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
	

	ecsUrl = 'https://ecs.shop.wii.com/ecs/services/ECommerceSOAP';

	iasUrl = 'https://ias.shop.wii.com/ias/services/IdentityAuthenticationSOAP';

	ccsUrl = 'http://ccs.cdn.shop.wii.com/ccs/download';

	ucsUrl = 'https://ccs.shop.wii.com/ccs/download';
	

	ec.setWebSvcUrls(ecsUrl, iasUrl);
	ec.setContentUrls (ccsUrl, ucsUrl);
	
	

	imagesPath = "/oss/oss/common/images/";
	htmlPath = "/oss/oss/common/html";
	ossPath = "https://oss-auth.shop.wii.com/oss/serv/";
	secureOssPath = "https://oss-auth.shop.wii.com/oss/serv/";	

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
	a[-(EC_ERROR_NET_NA)] = "インターネットに接続する際にエラーが発生しました。インターネットの設定が正しく行われているか、Wii本体設定の「インターネット」をご確認ください。";
	a[-(EC_ERROR_ECARD)] = "入力されたニンテンドープリペイド番号は正しくありません。<BR><BR>もういちどご確認ください。";
	a[-(EC_ERROR_REGISTER)] = "このWii番号は、Wiiショッピングチャンネルに<BR>登録されていません。";
	a[-(EC_ERROR_ALREADY_OWN)] = "エラーが発生しました。<BR>しばらく待ってから、もういちどお試しください。<BR><BR>何度も同じエラーが表示される場合は<BR>任天堂テクニカルサポートセンターまでお問い合わせください。";
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
    		    msg = "インターネットに接続する際にエラーが発生しました。インターネットの設定が正しく行われているか、Wii本体設定の「インターネット」をご確認ください。";
    		} else if (nhttpStatus != 0) {
    		    msg = "エラーが発生しました。<BR>しばらく待ってから、もういちどお試しください。<BR><BR>何度も同じエラーが表示される場合は<BR>任天堂テクニカルサポートセンターまでお問い合わせください。";
    		}
    	}
    }
        
    if (msg == null || msg == '') {
    	msg = "エラーが発生しました。<BR>しばらく待ってから、もういちどお試しください。<BR><BR>何度も同じエラーが表示される場合は<BR>任天堂テクニカルサポートセンターまでお問い合わせください。";
	}
	return msg;
}

function setErrorHtmlMsg(elem, errorCode, errorMsg)
{
    var html =
	 	'<span class="warningRed">'
		+ "エラーコード: <span id='errorCode'></span></span>"
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
	a[617] = "入力されたニンテンドープリペイド番号は正しくありません。<BR><BR>もういちどご確認ください。";
	a[618] = "このニンテンドープリペイド番号は、お客様がお住まいの地域ではご利用になれません。<BR><BR>念のため、ニンテンドープリペイド番号をもういちどご確認ください。";
	a[621] = "エラーが発生しました。<BR>しばらく待ってから、もういちどお試しください。<BR><BR>何度も同じエラーが表示される場合は<BR>任天堂テクニカルサポートセンターまでお問い合わせください。";
	a[623]	= "このソフトはすでにお試し済みです。再度お試しすることはできません。";
	a[642] = "エラーが発生しました。<BR>しばらく待ってから、もういちどお試しください。<BR><BR>何度も同じエラーが表示される場合は<BR>任天堂テクニカルサポートセンターまでお問い合わせください。";
	a[643] = "エラーが発生しました。<BR>しばらく待ってから、もういちどお試しください。<BR><BR>何度も同じエラーが表示される場合は<BR>任天堂テクニカルサポートセンターまでお問い合わせください。";
	a[644] = "この本体ではクレジットカードはご利用になれません。<BR><BR>詳細は、任天堂テクニカルサポートセンターまでお問い合わせください。";
	a[645] = "エラーが発生しました。<BR>しばらく待ってから、もういちどお試しください。<BR><BR>何度も同じエラーが表示される場合は<BR>任天堂テクニカルサポートセンターまでお問い合わせください。";
	
	// ECS Gift Errors
	a[646] = "エラーが発生しました。<BR>しばらく待ってから、もういちどお試しください。<BR><BR>何度も同じエラーが表示される場合は<BR>任天堂テクニカルサポートセンターまでお問い合わせください。";
	a[621] = "エラーが発生しました。<BR>しばらく待ってから、もういちどお試しください。<BR><BR>何度も同じエラーが表示される場合は<BR>任天堂テクニカルサポートセンターまでお問い合わせください。";
	a[626] = "エラーが発生しました。<BR>しばらく待ってから、もういちどお試しください。<BR><BR>何度も同じエラーが表示される場合は<BR>任天堂テクニカルサポートセンターまでお問い合わせください。";
	a[625] = "エラーが発生しました。<BR>しばらく待ってから、もういちどお試しください。<BR><BR>何度も同じエラーが表示される場合は<BR>任天堂テクニカルサポートセンターまでお問い合わせください。";
	
	// ETS Errors
	a[705] = "エラーが発生しました。<BR>しばらく待ってから、もういちどお試しください。<BR><BR>何度も同じエラーが表示される場合は<BR>任天堂テクニカルサポートセンターまでお問い合わせください。";
	a[706] = "エラーが発生しました。<BR>しばらく待ってから、もういちどお試しください。<BR><BR>何度も同じエラーが表示される場合は<BR>任天堂テクニカルサポートセンターまでお問い合わせください。";
	a[707] = "エラーが発生しました。<BR>しばらく待ってから、もういちどお試しください。<BR><BR>何度も同じエラーが表示される場合は<BR>任天堂テクニカルサポートセンターまでお問い合わせください。";
	
	// PAS Errors
	a[810]	= "ニンテンドーポイントの処理中にエラーが発生しました。もういちどお試しください。<BR><BR>何度も同じエラーが表示される場合は、任天堂テクニカルサポートセンターまでお問い合わせください。";
	a[811]	= "このニンテンドープリペイド番号は有効期限が切れています。";
	//a[812]	= "???OSS_ERROR_ECARD_NOT_USABLE???";
	//a[813]	= "???OSS_ERROR_ECARD_NOT_USABLE???";
	//a[814]	= "???OSS_ERROR_ECARD_NOT_USABLE???";
	a[815]	= "入力されたニンテンドープリペイド番号は、すでに登録済みです。";
	a[819]	= "入力されたニンテンドープリペイド番号は正しくありません。<BR><BR>もういちどご確認ください。";
	
	a[826]	= "ただいまサーバーが大変混み合っています。<BR><BR>しばらく待ってから、もういちどお試しください。";
	a[829]	= "ただいまサーバーが大変混み合っています。<BR><BR>しばらく待ってから、もういちどお試しください。";
	a[830]	= "入力されたニンテンドープリペイド番号は正しくありません。<BR><BR>もういちどご確認ください。";
	a[831] = "このニンテンドープリペイド番号は、お客様がお住まいの地域ではご利用になれません。<BR><BR>念のため、ニンテンドープリペイド番号をもういちどご確認ください。";

	// IAS Errors 
	a[901]	= "このWii番号は、Wiiショッピングチャンネルに<BR>登録されていません。";
	a[903]	= "エラーが発生しました。<BR>しばらく待ってから、もういちどお試しください。<BR><BR>何度も同じエラーが表示される場合は<BR>任天堂テクニカルサポートセンターまでお問い合わせください。";
	a[928] = "エラーが発生しました。<BR>しばらく待ってから、もういちどお試しください。<BR><BR>何度も同じエラーが表示される場合は<BR>任天堂テクニカルサポートセンターまでお問い合わせください。";
	a[958]	= "エラーが発生しました。<BR>しばらく待ってから、もういちどお試しください。<BR><BR>何度も同じエラーが表示される場合は<BR>任天堂テクニカルサポートセンターまでお問い合わせください。";
	a[942] = "システムの障害またはメンテナンスにより、現在会員IDの登録ができません。<BR><BR>しばらく待ってから、もういちどお試しください。";
	a[943]	= "会員IDまたはパスワードが正しく入力されていません。会員IDとパスワードを確認して、もういちどお試しください。<BR><BR>会員IDやパスワードをお忘れの場合は、クラブニンテンドーホームページ上の「お問い合わせ」のページから、電話もしくはオンライン問い合わせ窓口でお問い合わせください。";

	a[941] = "会員IDまたはパスワードが正しく入力されていません。会員IDとパスワードを確認して、もういちどお試しください。<BR><BR>会員IDやパスワードをお忘れの場合は、クラブニンテンドーホームページ上の「お問い合わせ」のページから、電話もしくはオンライン問い合わせ窓口でお問い合わせください。";
	
	// More IAS Errors
	a[1401] = "会員IDまたはパスワードが正しく入力されていません。会員IDとパスワードを確認して、もういちどお試しください。<BR><BR>会員IDやパスワードをお忘れの場合は、クラブニンテンドーホームページ上の「お問い合わせ」のページから、電話もしくはオンライン問い合わせ窓口でお問い合わせください。";
	a[1402] = "会員IDまたはパスワードが違います。会員IDとパスワードを確認して、もういちどお試しください。<BR><BR>会員IDやパスワードをお忘れの場合は、クラブニンテンドーホームページ上の「お問い合わせ」のページから、電話もしくはオンライン問い合わせ窓口でお問い合わせください。";
        a[1403] = "入力された会員IDは登録することができません。<BR><BR>詳細は、クラブニンテンドーホームページ上の「お問い合わせ」のページから、電話もしくはオンライン問い合わせ窓口でお問い合わせください。";
	a[1499] = "クラブニンテンドーシステムがメンテナンス中のため、現在会員IDの登録ができません。<BR><BR>メンテナンス終了まで、しばらくお待ちください。";
	
	// OSS Errors
	a[1610]	= "このソフト引換番号は有効期限が切れています。";
	a[1611]	= "入力されたソフト引換番号は正しくありません。<BR><BR>もういちどご確認ください。";
	a[1612] = "このソフト引換番号は、お客様がお住まいの地域ではご利用になれません。<BR><BR>念のため、ソフト引換番号をもういちどご確認ください。";
	a[1613] = "入力されたソフト引換番号に該当するソフトは、現在配信されておりません。";
	
	
	var msg = a[errCode];
	if(msg == null || msg == "") { // default errors
		if ((errCode >= 1400 && 
		     errCode <= 1499)) {
			msg = "システムの障害またはメンテナンスにより、現在会員IDの登録ができません。<BR><BR>しばらく待ってから、もういちどお試しください。";
		}
	}
	return msg;
}

// NOA errors
function getNOAError(code)
{
	var a=new Array();
	
	a[NOA_ERROR_CountyRequired] 				= "(N/A)";
	a[NOA_ERROR_FoundOnBlacklist]				= "お客様のクレジットカードはご利用になれません。<BR><BR>詳細は、任天堂テクニカルサポートセンターまでお問い合わせください。";
	a[NOA_ERROR_BillingAddress]                             = "入力された住所が正しくありません。<BR><BR>入力内容を確認して、もういちどお試しください。";
	a[NOA_ERROR_InvalidCardType]                            = "カード番号が無効です。<BR><BR>入力内容を確認して、もういちどお試しください。";
	a[NOA_ERROR_InvalidVfyValue]                            = "クレジットカードの情報が正しく入力されていません。<BR><BR>入力内容を確認して、もういちどお試しください。";
	a[NOA_ERROR_InvalidCcNumberAndExpDate]                  = "クレジットカードの情報が正しく入力されていません。<BR><BR>入力内容を確認して、もういちどお試しください。";
	a[NOA_ERROR_InvalidCreditCardNumber]			= "カード番号が無効です。<BR><BR>入力内容を確認して、もういちどお試しください。";
	a[NOA_ERROR_InvalidExpDate]				= "クレジットカードの情報が正しく入力されていません。<BR><BR>入力内容を確認して、もういちどお試しください。";
	a[NOA_ERROR_InvalidPostalCode]                          = "郵便番号と、Wii本体の国設定が一致していません。<BR><BR>入力内容を確認して、もういちどお試しください。";
	a[NOA_ERROR_TechnicalDifficulties]			= "クレジットカード情報の確認ができませんでした。<BR><BR>しばらく待ってから、もういちどお試しください。";
	a[NOA_ERROR_TryAgainLater]				= "クレジットカード情報の確認ができませんでした。<BR><BR>しばらく待ってから、もういちどお試しください。";

	a[NOA_RESULT_ERROR_CreditCardDeclined]			= "お客様のクレジットカードはご利用になれません。<BR><BR>詳細は、クレジットカード会社にお問い合わせください。";
	a[NOA_RESULT_ERROR_CreditCardDeclined_Funds]		= "お客様のクレジットカードはご利用になれません。<BR><BR>詳細は、クレジットカード会社にお問い合わせください。";
	a[NOA_RESULT_ERROR_CreditCardDeclined_Inactive]		= "お客様のクレジットカードはご利用になれません。<BR><BR>詳細は、クレジットカード会社にお問い合わせください。";
	a[NOA_RESULT_ERROR_CreditCardDeclined_Exp]		= "クレジットカードの有効期限が正しくありません。";
	a[NOA_RESULT_ERROR_CreditCardDeclined_Code]		= "クレジットカードの情報が正しく入力されていません。<BR><BR>入力内容を確認して、もういちどお試しください。";
	a[NOA_RESULT_ERROR_CreditCardDeclined_CCNum]		= "カード番号が無効です。<BR><BR>入力内容を確認して、もういちどお試しください。";
	a[NOA_RESULT_ERROR_CreditCardDeclined_Limit]            = "お客様のクレジットカードはご利用になれません。<BR><BR>詳細は、クレジットカード会社にお問い合わせください。";
	a[NOA_RESULT_ERROR_CreditCardDeclined_Invalid]		= "クレジットカードの情報が正しく入力されていません。<BR><BR>入力内容を確認して、もういちどお試しください。";
	a[NOA_RESULT_ERROR_CreditCardDeclined_AVS]		= "入力された住所情報とカードの請求書情報が一致しません。<BR><BR>入力内容を確認して、もう一度お試しください。";

	a[NOA_ERROR_EmptyVfyValue]				= "3ケタのセキュリティコードを正しく入力してください。";

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
<style type="text/css">
  /* For P_01:  Add Wii Points page */
#P_01_text01-01 {
	/* pageHeading, formerly title */
	position:absolute;
	left:29px;
	top:28px;
	width:442px;
	height:28px;
	z-index:28;
}
#P_01_text02-01 {
	/* subTitle, aka heading */
	position:absolute;
	left:29px;
	top:77px;
	width:552px;
	height:80px;
	z-index:26;
}
#P_01_WiiU {
	/* subTitle, aka heading */
	position:absolute;
	left:29px;
	top:85px;
	width:552px;
	height:80px;
	z-index:26;
}
#link {
	position:absolute;
	left:210px;
	top:285px;
	z-index:31;
}
#banner {
	position:absolute;
	left:210px;
	top:285px;
	z-index:27;
}
#word {
	position:absolute;
	left:210px;
	top:285px;
	width:187;
	height:55;
	z-index:29;
}
#text03-01 {
	/* formerly main text */
	position:absolute;
	left:40px;
	top:108px;
	width:330px;
	height:90px;
	z-index:22;
}
#Question {
	position:absolute;
	left:392px;
	top:100px;
	z-index:27;
}
#card01 {
	/* prepaid card */
	position:absolute;
	left:76px;
	top:280px;
	width:187px;
	height:82px;
}
#card02 {
	/* credit card */
	position:absolute;
	left:347px;
	top:280px;
	width:187px;
	height:82px;
}
.cardspacer {
	position:absolute;
	width:100%;
	height:100%;
	z-index:25;
}
.cardbannershadow{
	position:absolute;
	left:-13px;
	top:-10px;
	width:213px;
	height:106px;
	z-index:20;
}
.cardbanner {
	position:absolute;
	width:100%;
	height:100%;
	z-index:21;
}
#text04-01 {
	/* prepaid card text */
	position:absolute;
	text-align:center;
	top:25%;
	width:100%;
	z-index:23;
}
#text05-01 {
	/* credit card text */
	position:absolute;
	text-align:center;
	top:25%;
	width:100%;
	z-index:23;
}

#creditCardPic {
	position:absolute;
	left:378px;
	top:204px;
	width:176px;
	height:58px;
	z-index:78;
}
#pointCardPic {
	position:absolute;
	left:378px;
	top:105px;
	width:171px;
	height:90px;
	z-index:79;
}

#P_01_credit {
	position:absolute;
	left:73px;
	top:259px;
	width:230px;
	height:106px;
	z-index:2;
}

#regButton{
	position:absolute;
	left:73px;
	top:152px;
	width:462px;
	height:106px;
        overflow:hidden;

        line-height:18px;
}

.regButton_nonfocus{
	position:absolute;
        top:0px;
	clip:rect(0px 462px 106px 0px);
}

.regButton_focus{
	position:absolute;
        top:-106px;
        clip:rect(106px 462px 212px 0px);
}

#ccButton{
	position:absolute;
	left:73px;
	top:259px;
	width:230px;
	height:106px;
        overflow:hidden;

        line-height:18px;
}

#mcButton{
	position:absolute;
	left:305px;
	top:259px;
	width:230px;
	height:106px;
        overflow:hidden;

        line-height:18px;
}

.cc_mcButton_nonfocus{
	position:absolute;
        left:0px;
        top:-212px;
	clip:rect(212px 230px 318px 0px);
    	z-index:1;
}

.cc_mcButton_focus{
	position:absolute;
        left:-232px;
        top:-212px;
        clip:rect(212px 462px 318px 232px);
    	z-index:1;
}

</style>
<script type="text/javascript">
<!--

var cardPicCodes = new Array(new Array('JPN', "JP.gif"),
                 new Array('USA', "US.gif"),
                 new Array('EUR', "EU.gif"),
                 new Array('AUS', "AU.gif"));
var cardPicDefault = "pointcard_pic_US.gif";

function P_01_getRegionPic() 
{
    var imageName="pointcard_pic_";
    var found=false;


    var code = 'JPN';
    for (i=0; i < cardPicCodes.length; i ++) {
        if(code == cardPicCodes[i][0]) {
            imageName+=cardPicCodes[i][1];
            found = true;
            break;
        }
    }

    if(!found)
        imageName = cardPicDefault;

    return imageName;   
}

function P_01_setPointImage() {
    var imageName;
    var cardImg;

    imageName=P_01_getRegionPic();
    cardImg = document.getElementById('pointCardPic');
    if(cardImg && imageName != '') {
        cardImg.src='/oss/oss/common/images//banner/' + imageName;
    }
}

function gotoPurchase()
{
    if(snd) snd.playSE(cSE_Decide);
    showPage('P_06.jsp');
}

function gotoPrepaid()
{
    if(snd) snd.playSE(cSE_Decide);
    showPage('P_02.jsp');
}

function gotoWiipoint()
{
    if(snd) snd.playSE(cSE_Decide);
    showPage('P_17.jsp');
}

function initWiiUmessage()
{
  document.getElementById("wiiu").style.display='';
  document.getElementById("wii").style.display='none';
}

function exitWiiUmessage()
{
  document.getElementById("wiiu").style.display='none';
  document.getElementById("wii").style.display='';
}

function initPage()
{
    initPageCommon();
    var maxBalance = 10000;

    maxBalance = 20000;

    if(document.getElementById("maxBalance"))
        document.getElementById("maxBalance").innerHTML = maxBalance;
    disableWiiPointButton();
    MM_preloadImages('/oss/oss/common/images//banner/under_banner_b.gif',
            '/oss/oss/common/images//banner/help_b.gif',
            '/oss/oss/common/images//banner/top_b.gif',

            '/oss/oss/common/images//banner/P_01_credit.png',
            '/oss/oss/common/images//banner/P_01_button.png');

    setUnderButtonL(true, "もどる", "javascript:showHome()", "snd.playSE(cSE_Cancel)");

	if (snd && "playBGM" in snd) {
		snd.playBGM();
	}

    P_01_setPointImage();

    document.body.style.overflow="hidden";
}

-->
</script>
</head>

<body onload="initPage()">
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
      <div align="center" class="buttonTextBlackM">Wiiポイント</div>
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


<div id="P_01_text01-01" class="titleBlackL" >Wiiポイントの追加</div>

<div id="wiiu" style="display:none">
<span id="P_01_WiiU">Wiiポイントを追加しますか？</span>

      <div id="link" style="display:''">
      <a id="OKBtnAnchor" href="javascript:exitWiiUmessage()">
        <img src="/oss/oss/common/images//spacer.gif" width="187" height="55" border="0" 
         onmouseover="MM_swapImage('Image7','','/oss/oss/common/images//banner/under_banner_b.gif',1);snd.playSE( cSE_Forcus );" 
         onmouseout="MM_swapImgRestore()" onclick="wiiSelectSound();"/>
      </a>
      </div>
      <div id="banner" style="display:''"><img src="/oss/oss/common/images//banner/under_banner_a.gif" width="187" height="55" id="Image7" /></div>
      <div id="word" style="display:''">
	<div align="center" ><span id="OKBtnWord" class="buttonTextBlackM">OK</span></div>
      </div>
</div> <!-- //redeeming -->

</div>


<div id="wii" style="display:''">


<div id="P_01_text02-01">
  <div align="left" class="headerBlueM">ソフトを購入するには、Wiiポイントが必要です。<BR>Wiiポイントに関する注意事項については、右上の　　ボタンを選び、<BR>説明書内の『資金決済法に基づく表示』をご確認ください。</div>
</div>

<div id="Question">
    <img src="/oss/oss/common/images//banner/question_icon.png" />
</div>
<div id="P_01_credit">
    <img src="/oss/oss/common/images//banner/P_01_credit.png" />
</div>
<div id="regButton">
  <div id="regBanner" class="regButton_nonfocus" >
    <img src="/oss/oss/common/images//banner/P_01_button.png" />
  </div>
  <div align="center" style="position:relative;"><table height="100%"><tr><td align="left" valign="middle">購入済みのニンテンドープリペイド番号を<BR>使用してWiiポイントを登録</td></tr></table></div>
  <div id="regSpacer" style="position:absolute;top:12px;left:4px;">
    <a id="regAnchor" href="javascript:gotoPrepaid()">
      <img src="/oss/oss/common/images//spacer.gif" width="452" height="103" border="0" onmouseover="document.getElementById('regBanner').className='regButton_focus';wiiFocusSound();" onmouseout="document.getElementById('regBanner').className='regButton_nonfocus';" onclick="wiiSelectSound();"/></a>
  </div>
</div>

<div id="ccButton">
  <div id="ccBanner" class="cc_mcButton_nonfocus" >
    <img src="/oss/oss/common/images//banner/P_01_button.png" />
  </div>
  <div align="center" style="z-index:3;position:relative;margin:41px 0 0 0;"><table height="65px"><tr><td align="left" valign="middle">クレジットカードで<BR>Wiiポイントを購入</td></tr></table></div>
  <div id="ccSpacer" style="z-index:4;position:absolute;top:12px;left:4px;">
    <a id="ccAnchor" href="javascript:gotoPurchase()">
      <img src="/oss/oss/common/images//spacer.gif" width="220" height="106" border="0" onmouseover="document.getElementById('ccBanner').className='cc_mcButton_focus';wiiFocusSound();" onmouseout="document.getElementById('ccBanner').className='cc_mcButton_nonfocus';" onclick="wiiSelectSound();"/></a>
  </div>
</div>

<div id="mcButton">
  <div id="mcBanner" class="cc_mcButton_nonfocus" >
    <img src="/oss/oss/common/images//banner/P_01_button.png" />
  </div>
  <div align="center" style="z-index:3;position:relative;"><table height="100%"><tr><td align="left" valign="middle">ニンテンドープリペイド番号<BR>を購入するには？</td></tr></table></div>
  <div id="mcSpacer" style="z-index:4;position:absolute;top:12px;left:4px;">
    <a id="mcAnchor" href="javascript:gotoWiipoint()">
      <img src="/oss/oss/common/images//spacer.gif" width="220" height="106" border="0" onmouseover="document.getElementById('mcBanner').className='cc_mcButton_focus';wiiFocusSound();" onmouseout="document.getElementById('mcBanner').className='cc_mcButton_nonfocus';" onclick="wiiSelectSound();"/></a>
  </div>
</div>
</div>

</body>

</html>