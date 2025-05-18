<%@ page import = "java.io.*,java.util.*" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<% if ((request.getParameter("og") == null ? "false" : request.getParameter("og")).equals("false")) {%><a href="https://oss-auth.thecheese.io/oss/serv/debug.jsp">debug</a><% } %>
<!--<a href="https://oss-auth.thecheese.io/oss/serv/debugMode.jsp">debug mode</a>
<a href="https://oss-auth.thecheese.io/oss/serv/W_01.jsp">Click here to skip checking account status</a>-->
<!-- Flush buffer before setting locale to ensure encoding is preserved -->
<!-- Main page -->
<html>
<head>
  <title>WiiMart</title>
  <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
  <style type="text/css">
    /* GENERAL */

/* Limit page to 640 by 480 (NTSC TV resolution) */
/* Note: PAL resolution is 640 by 528 */
body {
	/*width: 608px; height: 456px; */
	background-repeat: no-repeat;
	background-color: #FFFFFF; 
}

FORM { display: inline; } 

/* PROGRESS BAR */

a:link {
	text-decoration: none;
}
a:visited {
	text-decoration: none;
}
a:hover {
	text-decoration: none;
}
a:active {
	text-decoration: none;
}


.bold {
	font-weight: bold;
}
.titleBlackL {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 28px;
	color: #323232;
	font-weight: bold;
}
.titleBlackM {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 24px;
	color: #323232;
	font-weight: bold;
}
.titleBlackS {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 18px;
	color: #323232;
	font-weight: bold;
    line-height:22px;
}
.titleBlueL {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 28px;
	color: #34BEED;
	font-weight: bold;
}

.headerBlueL {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 20px;
	color: #34BEED;
	font-weight: bold;
}
.headerBlueM {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 16px;
	color: #34BEED;
	font-weight: bold;
}
.headerBlueM_01 {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 16px;
	color: #34BEED;
	font-weight: bold;
}
.headerBlueS {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 14px;
	color: #34BEED;
	font-weight: bold;
}
.headerWhiteM {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 16px;
	color: #FFFFFF;
	font-weight: bold;
}

.headerWhiteS {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 14px;
	color: #FFFFFF;
	font-weight: bold;
}

.buttonTextBlackM {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 18px;
	color: #323232;
	font-weight: normal;
}
.buttonTextBlackL {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 22px;
	color: #323232;
	font-weight: normal;
}
.buttonTextWhiteL {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 24px;
	color: #FFFFFF;
	font-weight: normal;
}
.buttonTextWhiteS {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 14px;
	color: #FFFFFF;
	font-weight: bold;
}
.buttonTextWhiteS_01 {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 14px;
	color: #FFFFFF;
	font-weight: bold;
}

.warningRed {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 22px;
	color: #FF0000;
	font-weight: normal;
	line-height:25px;
}
.contentsRedM {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 16px;
	color: #FF0000;
	font-weight: normal;
}

.contentsBlack {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 14px;
	color: #323232;
	font-weight: normal;
	line-height:16px;
}

.contentsBlackL {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 20px;
	color: #323232;
	font-weight: normal;
}
.contentsBlackM {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 18px;
	color: #323232;
	font-weight: normal;
}
.contentsBlackS {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 16px;
	color: #323232;
	font-weight: normal;
}
.contentsBlackS_01 {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 16px;
	color: #323232;
	font-weight: normal;
}

.contentsBlueM {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 18px;
	color: #34BEED;
	font-weight: normal;
}
.contentsBlueS {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 14px;
	color: #34BEED;
	font-weight: normal;
}
.contentsBlueS_01 {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 14px;
	color: #34BEED;
	font-weight: normal;
}

.contentsGray {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 16px;
	color: #8C8C8C;
	font-weight: normal;
}
.contentsGrayL {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 20px;
	color: #8C8C8C;
	font-weight: normal;
}
.contentsGrayM {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 18px;
	color: #8C8C8C;
	font-weight: normal;
}
.contentsGrayS {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 16px;
	color: #8C8C8C;
	font-weight: normal;
}
.contentsOrangeL {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 20px;
	color: #AA4941;
	font-weight: normal;
}
.contentsOrangeM {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 16px;
	color: #AA4941;
	font-weight: normal;
}
.contentsOrangeS {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 14px;
	color: #AA4941;
	font-weight: normal;
}


.catalogTitleBlack {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 16px;
	color: #323232;
	font-weight: normal;
	line-height: 18px;
}

.catalogTitleBlack_01 {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 16px;
	color: #323232;
	font-weight: normal;
	line-height: 18px;
}
.catalogTitleBlack_02 {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 16px;
	color: #323232;
	font-weight: normal;
	line-height: 18px;
}
.catalogTitleBlack_03 {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 16px;
	color: #323232;
	font-weight: normal;
	line-height: 22px;
}
.catalogTitleBlack_04 {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 18px;
	color: #323232;
	font-weight: normal;
	line-height: 22px;
}

.catalogTitleBlackBold {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 16px;
	color: #323232;
	font-weight: bold;
}
.catalogTitleBlue {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 16px;
	color: #34BEED;
	font-weight: normal;
}
.catalogTitleBlueBold {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 16px;
	color: #34BEED;
	font-weight: bold;
}
.wiiPoint {
	/* style for current balance */
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 22px;
	color: #34BEED;
	font-weight: normal;
}

.fullScreenText {
    position:absolute;
    left:66px;
    top:85px;
    width:476px;
    height:202px;
}

#underButtonR {
	position:absolute;
	left:399px;
	top:378px;
	width:187px;
	height:55px;
}
#underButtonL {
	position:absolute;
	left:25px;
	top:378px;
	width:187px;
	height:55px;
}
#underButton {
	position:absolute;
	left:211px;
	top:294px;
	width:187px;
	height:55px;
}

.buttonBanner {
	position:absolute;
	left:0px;
	top:0px;
	width:100%;
	height:100%;
	z-index:22;
}
.buttonSpacer {
	position:absolute;
	left:0px;
	top:0px;
	width:100%;
	height:100%;
	z-index:25;
}
.buttonWord {
	position:absolute;
	left:0px;
	top:0px;
	width:100%;
	height:100%;
	line-height:19px;
	z-index:24;
}
.buttonBannerShadow {
	position:absolute;
	left:-12px;
	top:-9px;
	width:211px;
	height:75px;
	z-index:20;
}

.tcell {
    display:table-cell;
}

.h_inline_middle {
    text-align:center;
    width:auto;
    height:auto;
}

.h_block_middle {
    margin-left:auto;
    margin-right:auto;
    width:auto;
    height:auto;
}

.v_middle {
    vertical-align:middle;
    width:auto;
    height:auto;
}

.vh_inline_middle {
    text-align:center;
    vertical-align:middle;
    width:auto;
    height:auto;
}

.h_inline_left {
    text-align:left;
    width:auto;
    height:auto;
}

.v_middle_h_inline_left {
    text-align:left;
    vertical-align:middle;
    width:auto;
    height:auto;
}

#Wiipoint {
	/* location of "Wii Points" the word */
	text-align:center;
	position:absolute;
	left:241px;
	/* //top:396px; */
	top:401px;
	width:130px;
	height:20px;
	z-index:22;
}

#point {
	/* location of current balance */
	text-align:center;
	position:absolute;
	left:241px;
	top:378px;
	width:130px;
	height:22px;
	z-index:97;
}
.dot {
	font-family: "Wii NTLG PGothic JPN Regular";
	font-size: 16px;
	color: #8C8C8C;
}

#help {
	position:absolute;
	left:537px;
	top:23px;
	width:52px;
	height:55px;
	z-index:100;
}
#top {
	position:absolute;
	left:477px;
	top:23px;
	width:52px;
	height:55px;
	z-index:100;
}
#line01 {
	position:absolute;
	left:4px;
	top:59px;
	width:473px;
	height:10px;
	z-index:98;
}
#line02 {
	position:absolute;
	left:4px;
	top:363px;
	width:600px;
	height:10px;
	/* //z-index:21; */
	z-index:100;
}
#upperLineLong {
	position:absolute;
	left:4px;
	top:59px;
	width:600px;
	height:10px;
	/* //z-index:21; */
	z-index:100;
}
#tophelpshadow {
	position:absolute;
	left:467px;
	top:15px;
	width:132px;
	height:75px;
	z-index:24;
}

.inputStyle {
	border-top-width: 2px;
	border-right-width: 2px;
	border-bottom-width: 2px;
	border-left-width: 2px;
	border-top-style: solid;
	border-right-style: solid;
	border-bottom-style: solid;
	border-left-style: solid;
	border-top-color: #CCCCCC;
	border-right-color: #CCCCCC;
	border-bottom-color: #EAEAEA;
	border-left-color: #CCCCCC;	
}

.spacecover {
    left:0px;
    top:0px;
    width:100%;
    height:100%;
}

div.page_area {
	position: absolute;
	left: 0px;
	top: 0px;
	width: 608px;
        height: 363px;
}

div.page_title_area {
	position: relative;
	left: 29px;
	top: 28px;
	width: 442px;
	height: 28px;
	text-align: left;
}

div.page_content_area {
	position: relative;
	top: 75px;
	left: 20px;
	text-align: center;
	width: 548px;
}

.bg_connect {
	background-image: url(../images/back/bg_connect.gif);
	background-repeat: no-repeat;
}

.bg_sca {
	background-image: url(../images/back/bg_sca.gif);
	background-repeat: no-repeat;
}

span.font14px{ font-size: 14px; }
span.font16px{ font-size: 16px; }
span.font18px{ font-size: 18px; }
span.font20px{ font-size: 20px; }
span.font22px{ font-size: 22px; }
span.font24px{ font-size: 24px; }


/* F_01:  Connecting to Server */
/* NOTE:  used by index.jsp, Register.jsp, CheckRegistered.jsp, and CheckBalance.jsp */


#text01-01 {
	position:absolute;
	left:29px;
	top:28px;
	width:546px;
	height:28px;
	z-index:27;
}
#text02-01 {
	position:absolute;
	left:25px;
	top:100px;
	width:560px;
	height:180px;
	z-index:31;
}</style>
  <link rel="shortcut icon" href="/oss/favicon.ico" /> 
  <script src="/oss/oss/common/js/json2.js"></script>
<script src="/oss/oss/common/js/shop.js"></script>
<script src="/oss/oss/common/js/keyboard.js"></script> 
<script src="/oss/oss/common/js/oss.js"></script> 
<script src="/oss/oss/common/js/ec.js"></script>
<script src="/oss/oss/common/js/error.js"></script> 
<script src="/oss/oss/common/js/buttons.js"></script>
<script src="/oss/oss/common/js/sound.js"></script>
<script src="/oss/oss/common/js/images.js"></script>
<script>
function onIsRegisteredDone(progress) {
  showResult(progress, opName, opDesc);
  var info = ec.getDeviceInfo();
  trace(info.registrationStatus + " is the registration status");
  if (info.registrationStatus == "R") {
    //top.location = "https://oss-auth.thecheese.io/oss/serv/CheckRegistered.jsp";
    //showCheckRegistered(true);
  } else {
    return;
  }
}
function isRegistered() {
  var ecsUrl = 'https://oss-auth.thecheese.io/oss/ecs/services/ECommerceSOAP';
  var iasUrl = 'https://oss-auth.thecheese.io/oss/ias/services/IdentityAuthenticationSOAP';
  var ccsUrl = 'http://oss-auth.thecheese.io/ccs/download';
  var ucsUrl = 'https://ccs.blinklab.com/ccs/download';
  ec.setWebSvcUrls(ecsUrl, iasUrl);
  ec.setContentUrls (ccsUrl, ucsUrl);
  opName = "checking registration status";
  opDesc = "checking registration status";
  var progress = ec.checkRegistration();
  finishOp(opName, opDesc, progress, "onIsRegisteredDone");
}

</script>
</head>

<script type="text/javascript">
function addParam(url, param, value)
{
    var setParamStr = param + "=" + encodeURIComponent(value);
    if (url.indexOf("?" + param + "=") >= 0 || 
        url.indexOf("&" + param + "=") >= 0) {
        // param already in url
    } else {
        var paramStart = url.indexOf("?");
        if (paramStart >= 0) {
            url = url.substr(0, paramStart+1) + setParamStr + "&" + url.substr(paramStart+1);
        } else {
            url = url + "?" + setParamStr;
        }
    }
    return url;
}



function showCheckRegistered()
{
    var shop = new wiiShop();
    // Redirects to CheckRegistered.jsp with important device info	
    var ec = new ECommerceInterface ();
	var url = "https://oss-auth.thecheese.io/oss/serv/CheckRegistered.jsp";
    var r = ec.getDeviceInfo();
    var shopAppTitleId = r.titleId;
    if (shopAppTitleId != null) {
        var t = ec.getTitleInfo(shopAppTitleId);         
        url = addParam(url, "titleId", shopAppTitleId);
        if (typeof(t) == "object" && t.isTmdPresent && t.version != null) {        
           url = addParam(url, "titleVersion", t.version);
        }
    }
    if (r.country != null) {
        url = addParam(url, "country", r.country);
    }
    if (r.region != null) {
        url = addParam(url, "region", r.region);
    }
    if (r.userAge != null && r.isParentalControlEnabled) {
        url = addParam(url, "age", r.userAge);
    }

    if (r.language != null) {
        url = addParam(url, "language", r.language);
    }
    if (r.serial != null) {
        url = addParam(url, "Serial", r.serial);
    }
    if (ec && "setSessionValue" in ec) {   


        ec.setSessionValue("state", 'init');
        
        ec.setSessionValue("firstTitleDetailDisplay",'true');
    }

    top.location=url;
}
/*function onIsRegisteredDone(progress) {
  showResult(progress, opName, opDesc);
  var info = ec.getDeviceInfo();
  trace(info.registrationStatus + " is the registration status");
  if (info.registrationStatus == "R") {
    top.location = "https://oss-auth.thecheese.io/oss/serv/CheckRegistered.jsp";
    //showCheckRegistered(true);
  } else {
    return;
  }
}
function isRegistered() {
  var ecsUrl = 'https://oss-auth.thecheese.io/oss/ecs/services/ECommerceSOAP';
  var iasUrl = 'https://oss-auth.thecheese.io/oss/ias/services/IdentityAuthenticationSOAP';
  var ccsUrl = 'http://oss-auth.thecheese.io/ccs/download';
  var ucsUrl = 'https://ccs.blinklab.com/ccs/download';
  ec.setWebSvcUrls(ecsUrl, iasUrl);
  ec.setContentUrls (ccsUrl, ucsUrl);
  opName = "checking registration status";
  opDesc = "checking registration status";
  var progress = ec.checkRegistration();
  finishOp(opName, opDesc, progress, "onIsRegisteredDone");
}
isRegistered();*/
function initPage()
{
	var x = new wiiShop();
	var u = x.connecting;
	//Stop the blue spinner if it is visible
	x.endWaiting();
	//Enable home, reset, and power buttons
	x.enableHRP();
    MM_preloadImages('/oss/oss/common/images//banner/under_banner_b.gif');
	setUnderButton(true, "Go to the shop", "javascript:showCheckRegistered(true)", "snd.playSE(cSE_Decide)");
}
//-->
</script>

<body onload="showCheckRegistered(true)">

<div class="dot" id="line01">･･･････････････････････････････････････････････････････････････････････････</div>
<div class="dot" id="line02">･･･････････････････････････････････････････････････････････････････････････</div>
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
<div class="titleBlueL" id="text01-01">
  <span id="wiiTitle">WiiMart</span>
</div>

<div class="titleBlueL" id="text01-01">
	WiiMart</div>
	<div class="titleBlueL" id="text01-01">WiiMart</div>
	<div class="catalogTitleBlack_01" id="text02-01">Welcome to WiiMart!<BR><BR>In this revival, you&rsquo;ll find a variety of classic games for Virtual Console as well as new software created exclusively for the Wii console. You can redeem Wii Points to download these software titles, or in some cases, you can obtain them for free.<BR><BR>Happy shopping!</div>
</body>
</html>
