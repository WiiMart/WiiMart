<%@ page import = "java.io.*,java.util.*" %>
<%@	page pageEncoding="utf-8" contentType="text/html; charset=UTF-8" %>
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<a href="https://oss-auth.blinklab.com/oss/serv/debug.jsp">debug</a>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script type="text/javascript">
    var shop = new wiiShop();
    var unused = shop.connecting;
	function getMethod() {
		return '<%= request.getMethod() %>';
	}
	function isConnectingPage() {
    	var isConnecting = '';
    	return (isConnecting == 'true');
	}
</script>
<link rel="stylesheet" href="/oss/oss/common/css/error.css" />
<link rel="stylesheet" href="/oss/oss/common/css/oss.css" />
<SCRIPT language="JavaScript" src="/oss/oss/common/js//ec.js"></SCRIPT>
<SCRIPT language="JavaScript" src='/oss/oss/common/js//error.js'></SCRIPT>
<SCRIPT language="JavaScript" src="/oss/oss/common/js//buttons.js"></SCRIPT>
<SCRIPT language="JavaScript" src="/oss/oss/common/js//images.js"></SCRIPT>
<SCRIPT language="JavaScript" src='/oss/oss/common/js//sound.js'></SCRIPT>
<SCRIPT language="JavaScript" src="/oss/oss/common/js//shop.js"></SCRIPT>
<SCRIPT language="JavaScript" src="/oss/oss/common/js//oss.js"></SCRIPT>
<style type="text/css">
.catalogFrame {
	position:absolute;
	border:solid 1px #35beed;
	left:41px;
	top:88px;
	width:530px;
	height:277px;
	z-index:44;
	overflow:auto;
}
#text01-01 {
	position:absolute;
	left:29px;
	top:28px;
	width:442px;
	height:28px;
	z-index:40;
}
#text02-01 {
	position:absolute;
	left:146px;
	top:5px;
	width:300px;
	height:80px;
	z-index:34;
}
#line03 {
	position:absolute;
	left:4px;
	top:217px;
	width:600px;
	height:10px;
	z-index:61;
	display:none;
}
#text04-01 {
	position:absolute;
	left:146px;
	top:5px;
	width:300px;
	height:80px;
	z-index:34;
}
#text05-01 {
	position:absolute;
	left:146px;
	top:5px;
	width:300px;
	height:80px;
	z-index:34;
}
#text06-01 {
	position:absolute;
	left:146px;
	top:5px;
	width:300px;
	height:80px;
	z-index:34;
}
#membership {
	position:absolute;
	left:0px;
	top:5px;
	width:477px;
	height:94px;
	z-index:33;
}
#loyaltySpacer {
	position:absolute;
	top:0px;
	left:0px;
	width:100%;
	height:100%;
	z-index:39;
}
#giftbox {
	position:absolute;
	left:0px;
	width:477px;
	height:94px;
	z-index:33;
}
#giftSpacer {
	position:absolute;
	left:0px;
	top:0px;
	width:100%;
	height:100%;
	z-index:39;
}
#gamecard {
	position:absolute;
	left:0px;
	width:477px;
	height:99px;
	z-index:33;
}
#gamecardSpacer {
	position:absolute;
	left:0px;
	top:0px;
	width:100%;
	height:100%;
	z-index:39;
}

#connect {
	position:absolute;
	left:0px;
	width:477px;
	height:99px;
	z-index:33;
}
#connectSpacer {
	position:absolute;
	left:0px;
	top:0px;
	width:100%;
	height:100%;
	z-index:39;
}

#access {
	position:absolute;
	left:0px;
	width:477px;
	height:99px;
	z-index:33;
}
#accessSpacer {
	position:absolute;
	left:0px;
	top:0px;
	width:100%;
	height:100%;
	z-index:39;
}

#record {
	position:absolute;
	left:0px;
	width:477px;
	height:94px;
	z-index:34;
}
#changeRegion {
	position:absolute;
	left:0px;
	width:477px;
	height:94px;
	z-index:34;
}
#regionSpacer {
	position:absolute;
	left:0px;
	top:0px;
	width:100%;
	height:100%;
	z-index:39;
}
#recordSpacer {
	position:absolute;
	left:0px;
	top:0px;
	width:100%;
	height:100%;
	z-index:39;
}
</style>
<script type="text/javascript">
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

function initPage()
{
    initPageCommon();

    //document.getElementById("catalogWiiU").style.display='none';
    MM_preloadImages('/oss/oss/common/images//banner/under_banner_b.gif',
            '/oss/oss/common/images//banner/help_b.gif',
            '/oss/oss/common/images//banner/icr_b_E.gif',
            '/oss/oss/common/images//banner/top_b.gif',
            '/oss/oss/common/images//banner/record_b.gif',
            '/oss/oss/common/images//banner/gift_b.gif',
            '/oss/oss/common/images//banner/clabnintendo_b.gif',
            '/oss/oss/common/images//banner/accessible_b.gif',
            '/oss/oss/common/images//banner/gamecard_b.gif',
            '/oss/oss/common/images//banner/connect_b.gif',
            '/oss/oss/common/images//banner/mynintendo_b.gif',
            '/oss/oss/common/images//banner/mynintendoEU_b.gif');

    var settingList = createElementList();
    settingList.insertElement("icr");
    settingList.insertElement("connect");
    settingList.insertElement("gamecard");
    settingList.insertElement("membership");
    settingList.insertElement("giftbox");
    settingList.insertElement("access");
    settingList.insertElement("record");
    settingList.showElements();
  setUnderButtonL(true, "Back", "javascript:showHome()",  "if(snd) snd.playSE(cSE_Cancel)");
}
</script>
<script type="text/javascript">
	function PreloadImgs() {
		MM_preloadImages('/oss/oss/common/images//banner/under_banner_b.gif',
		'/oss/oss/common/images//banner/help_b.gif',
		'/oss/oss/common/images//banner/icr_b_E.gif',
		'/oss/oss/common/images//banner/top_b.gif',
		'/oss/oss/common/images//banner/record_b.gif',
		'/oss/oss/common/images//banner/gift_b.gif',
		'/oss/oss/common/images//banner/clabnintendo_b.gif',
		'/oss/oss/common/images//banner/accessible_b.gif',
		'/oss/oss/common/images//banner/gamecard_b.gif',
		'/oss/oss/common/images//banner/connect_b.gif',
		'/oss/oss/common/images//banner/mynintendo_b.gif',
		'/oss/oss/common/images//banner/mynintendoEU_b.gif',
		'/oss/oss/common/images//banner/accessible_b.gif');
	}	
</script>
<script type="text/javascript">window.onload = PreloadImgs();</script>
<script type="text/javascript">
	var scroll_step = 30;
	function kdown() {
    	var _code = event.keyCode;
    	var _obj = document.getElementById('catalogFrame');
    	switch(_code) {
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
</script>
<title>WiiMart</title>
</head>
<body onload="initPage();" style="overflow:hidden" onkeypress="kdown();">
<div class="dot" id="line01">･･･････････････････････････････････････････････････････････&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;･･</div>
<div class="dot" id="line02">･･･････････････････････････････････････････････････････････････････････････</div>
<div id="constElements">
    <div id="tophelpshadow"><img src="/oss/oss/common/images//banner/top_help_shadow01.gif" width="132" height="75" /></div>
    <div id="help">
      <img src="/oss/oss/common/images//banner/help_a.gif" name="ManualImage" width="52" height="55" border="0"
        id="ManualImageID" onmouseout="MM_swapImgRestore()"
        onmouseover="MM_swapImage('ManualImage','','/oss/oss/common/images//banner/help_b.gif');snd.playSE(cSE_Forcus);"
        onclick="snd.playSE(cSE_Decide);showHelp();" />
      <img src="/oss/oss/common/images//banner/help_gray.gif" width="52" height="55" border="0"
        id="ManualGrayImageID" style="display:none" />
      <img src="/oss/oss/common/images//spacer.gif" name="HelpSpacer" width="52" height="55" border="0"
        id='HelpSpacer' style="position:absolute; top:0px; left:0px; display:none" />
    </div>
  </div>

  <div id="top">
    <img src="/oss/oss/common/images//banner/top_a.gif" name="TopImage" width="52" height="55" border="0"
      id="TopImageID" onmouseout="MM_swapImgRestore()"
      onmouseover="MM_swapImage('TopImage','','/oss/oss/common/images//banner/top_b.gif');snd.playSE(cSE_Forcus);"
      onclick="showHome();snd.playSE(cSE_Cancel)" />
    <img src="/oss/oss/common/images//banner/top_gray.gif" width="52" height="55" border="0" id="TopGrayImageID"
      style="display:none" />
    <img src="/oss/oss/common/images//spacer.gif" name="MainSpacer" width="52" height="55" border="0" id='MainSpacer'
      style="position:absolute; top:0px; left:0px; display:none" />
  </div>
  <div class="titleBlackL" id="text01-01">Settings and Features</div>
<div id="catalogFrame" class="catalogFrame">


<!-- Delete Usage Record -->
<div id="record" style="top: 583px">
  <img src="/oss/oss/common/images//banner/record_a.gif" name="Image10" border="0" id="Image10">
  <img id="recordSpacer" onmouseout="MM_swapImgRestore()" src="/oss/oss/common/images//spacer.gif" onmouseover="MM_swapImage('Image10','','/oss/oss/common/images//banner/record_b.gif',1);snd.playSE( cSE_Forcus );" onclick="showPage('S_09.jsp');snd.playSE( cSE_Decide );">
  <div id="usageRecordTxt">
  <div class="headerBlueM" id="text04-01"><table height="100%"><tbody><tr><td align="left" valign="middle" style="color: #35beed; font-weight: bold;">Remove WiiMart Account</td></tr></tbody></table></div>
  </div>
</div>

<!-- Change region -->
<div id="changeRegion" style="top: 677px">
	<img src="/oss/oss/common/images//banner/record_a.gif" name="Image15" border="0" id="Image15">
	<img id="regionSpacer" onmouseout="MM_swapImgRestore()" src="/oss/oss/common/images//spacer.gif" onmouseover="MM_swapImage('Image15','','/oss/oss/common/images//banner/record_b.gif',1);snd.playSE( cSE_Forcus );" onclick="showPage('S_region.jsp');snd.playSE( cSE_Decide );">
	<div id="usageRecordTxt">
	<div class="headerBlueM" id="text04-01"><table height="100%"><tbody><tr><td align="left" valign="middle" style="color: #35beed; font-weight: bold;">Change Region</td></tr></tbody></table></div>
	</div>
  </div>

<!-- Link Club Nintendo -->
<div id="membership" style="top: 489px;">
	<img src="/oss/oss/common/images//banner/mynintendo_a.gif" border="0" id="img">
	<img id="loyaltySpacer" src="/oss/oss/common/images//spacer.gif" width="100%" height="100%" onmouseover="MM_swapImage('img', '', '/oss/oss/common/images//banner/mynintendo_b.gif',1);snd.playSE(cSE_Forcus)" onmouseout="MM_swapImgRestore()" onclick="showPage('S_02.jsp');snd.playSE(cSE_Decide);">
	<div id="cnTxt">
		<div class="headerBlueM" id="text04-01"><table height="100%"><tbody><tr><td align="left" valign="middle" style="color: #35beed; font-weight: bold;">Link Club Nintendo Account</td></tr></tbody></table></div>
	</div>
</div>

<!-- Set Gift -->
<div id="giftbox" style="top: 10px;">
  <img src="/oss/oss/common/images//banner/gift_a.gif" name="Image11" border="0" id="Image11">
  <img id="giftSpacer" onmouseout="MM_swapImgRestore()" src="/oss/oss/common/images//spacer.gif" onmouseover="MM_swapImage('Image11','','/oss/oss/common/images//banner/gift_b.gif',1); if(snd) snd.playSE( cSE_Forcus );" onclick="showPage('S_12.jsp');if(snd) snd.playSE( cSE_Decide );">
  <div id="giftSettingsTxt">
  <div class="headerBlueM" id="text05-01"><table height="100%"><tbody><tr><td align="left" valign="middle" style="color: #35beed; font-weight: bold;">Gift Settings</td></tr></tbody></table></div>
  </div>
</div>


<!-- Show Gamecard input screen -->
<div id="gamecard" style="top: 105px;">
  <img src="/oss/oss/common/images//banner/gamecard_a.gif" name="Image13" border="0" id="Image13">
  <img id="gamecardSpacer" onmouseout="MM_swapImgRestore()" src="/oss/oss/common/images//spacer.gif" onmouseover="MM_swapImage('Image13','','/oss/oss/common/images//banner/gamecard_b.gif',1); if(snd) snd.playSE( cSE_Forcus );" onclick="showGamecardScreen();if(snd) snd.playSE( cSE_Decide );">
  <div id="gamecardTitleTxt">
  <div class="headerBlueM" id="text04-01"><table height="100%"><tbody><tr><td align="left" valign="middle" style="color: #35beed; font-weight: bold;">Wii Download Ticket</td></tr></tbody></table></div>
  </div>
</div>


<!-- Show Connection ambassador register screen -->
<div id="connect" style="top:201px;">
  <img src="/oss/oss/common/images//banner/connect_a.gif" name="Image14" border="0" id="Image14">
  <img id="connectSpacer" onmouseout="MM_swapImgRestore()" src="/oss/oss/common/images//spacer.gif" onmouseover="MM_swapImage('Image14','','/oss/oss/common/images//banner/connect_b.gif',1); if(snd) snd.playSE( cSE_Forcus );" onclick="showPage('S_16.jsp');snd.playSE(cSE_Decide);">
  <div id="connectTitleTxt">
  <div class="headerBlueM" id="text04-01"><table height="100%"><tbody><tr><td align="left" valign="middle" style="color: #35beed; font-weight: bold;">Connection Ambassador</td></tr></tbody></table></div>
  </div>
</div>


<!-- Show Accessible Titles -->
<div id="access" style="top:300px;">
  <img src="/oss/oss/common/images//banner/accessible_a.gif" name="Image12" border="0" id="Image12">
  <img id="accessSpacer" onmouseout="MM_swapImgRestore()" src="/oss/oss/common/images//spacer.gif" onmouseover="MM_swapImage('Image12','','/oss/oss/common/images/banner/accessible_b.gif',1);snd.playSE( cSE_Forcus );" onclick="showPage('B_04.jsp');snd.playSE(cSE_Decide)">
  <div id="accessibleTitleTxt">
  <div class="headerBlueM" id="text04-01"><table height="100%"><tbody><tr><td align="left" valign="middle" style="color: #35beed; font-weight: bold;">Limited-edition titles</td></tr></tbody></table></div>
  </div>
</div>

<!-- Begin ICR Demo -->
<style type="text/css">
#icr {
	position:absolute;
	left:0px;
	width:477px;
	height:99px;
	z-index:33;
}
#icrSpacer {
	position:absolute;
	left:0px;
	top:0px;
	width:100%;
	height:100%;
	z-index:39;
}
/** {
  font-family: 'Wii NTLG PGothic Regular';
}*/
</style>
<div id="icr" style="top:395px;">
  <img src="/oss/oss/common/images//banner/icr_a_P.gif" name="Image20" border="0" id="Image20">
  <img id="icrSpacer" onmouseout="MM_swapImgRestore()" src="/oss/oss/common/images//spacer.gif" onmouseover="MM_swapImage('Image20','','/oss/oss/common/images//banner/icr_b_E.gif',1); if(snd) snd.playSE( cSE_Forcus );" onclick="showPage('S_30.jsp');snd.playSE( cSE_Decide );">
  <div id="icrTitleTxt">
  <div class="headerBlueM" id="text04-01"><table height="100%"><tbody><tr><td align="left" valign="middle" style="color: #35beed; font-weight: bold;">One Free Title</td></tr></tbody></table></div>
  </div>
</div>
<!-- End ICR Demo -->

</div>
<div id='balanceInfo'
        onmouseover="snd.playSE(cSE_Forcus);MM_swapImage('PointSpacer','/oss/oss/common/images//banner/Addpoints_everywhere.gif')"
        onmousedown="snd.playSE(cSE_Decide);" onmouseout="MM_swapImgRestore()" onclick="snd.playSE(cSE_Decide);">
        <script type="text/JavaScript">MM_preloadImages('/oss/oss/common/images//banner/Addpoints_everywhere.gif');</script>
        <img src="/oss/oss/common/images/spacer.gif" onmouseover="snd.playSE(cSE_Forcus)" onclick="snd.playSE(cSE_Decide);"
            name="PointSpacer" width="130" height="55" border="0" id='PointSpacer'
            style="position:absolute; top:376px; left:239px; z-index:20;" />
        <div id="Wiipoint">
            <div align="center" class="buttonTextBlackM">Wii Points</div>
        </div>
        <div id="point" class="wiiPoint">
            <span id="currentBalance"></span>
        </div>
    </div>
<div id="underButtonL">
    <div id="underbannershadowL" class="buttonBannerShadow">
   	  <img src="/oss/oss/common/images//banner/under_banner_shadow.gif" width="211" height="75" />
   	</div>
    <div id="underbannerL" class="buttonBanner">
    	<img src="/oss/oss/common/images//banner/under_banner_a.gif" width="187" height="55" id="underImgL" />
    </div>
    <div id="underspacerL" class="buttonSpacer">
	  <a href="javascript:showHome()" id="underlinkL">
    	<img id="underimageL" src="/oss/oss/common/images//spacer.gif" width="187" height="55" border="0"  
    	onmouseover="MM_swapImage('underImgL','','/oss/oss/common/images//banner/under_banner_b.gif',1); snd.playSE( cSE_Forcus );" 
    	onmouseout="MM_swapImgRestore()"
	onclick="snd.playSE(cSE_Cancel)"/>
      </a>	
    </div>
    <div id="underwordL" align="center" class="buttonTextBlackM buttonWord"><table width="100%" height="100%"><tr><td align="center" valign="middle">Back</tr></td></table></div>
</div>
</body>
</html>
