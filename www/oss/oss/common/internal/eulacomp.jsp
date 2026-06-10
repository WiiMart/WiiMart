<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>eula</title>
<style type="text/css">
<!--
#error-text {
	position:absolute;
	left:95px;
	top:101px;
	width:419px;
	height:176px;
	z-index:7;
}
#error-code {
	position:absolute;
	left:66px;
	top:113px;
	width:476px;
	height:18px;
	z-index:8;
}
-->
</style>
<link href="error.css" rel="stylesheet" type="text/css" />
<script type="text/JavaScript" src="sound.js"></script>
<script type="text/JavaScript" src="common.js"></script>
<script type="text/JavaScript" src="shop.js"></script>
<style type="text/css">
<!--
#showEulaViewerShadow {
  position:absolute;
	left:199px;
	top:287px;
	width:211px;
	height:75px;
	z-index:1;
}
#showEulaViewerBanner {
  position:absolute;
	left:211px;
	top:294px;
	width:187px;
	height:55px;
	z-index:2;
}
#showEulaViewerWord {
  position:absolute;
	left:214px;
	top:294px;
	width:180px;
	height:55px;
	z-index:3;
}
#showEulaViewerSpacer {
	position:absolute;
	left:211px;
	top:294px;
	width:187px;
	height:55px;
	z-index:4;
}

#wiimenushadow {
  position:absolute;
	left:13px;
	top:371px;
	width:211px;
	height:75px;
	z-index:1;
}
#wiimenubanner {
  position:absolute;
	left:25px;
	top:378px;
	width:187px;
	height:55px;
	z-index:2;
}
#wiimenuword {
  position:absolute;
	left:28px;
	top:394px;
	width:180px;
	height:22px;
	z-index:3;
}
#wiimenuspacer {
	position:absolute;
	left:25px;
	top:378px;
	width:187px;
	height:55px;
	z-index:4;
}
-->
</style>
</head>

<body onload="shop.endWaiting();MM_preloadImages('../image/banner/under_banner_b.gif')">
<div id="title">
  <div align="left" class="titleBlue">
<script type="text/JavaScript">
<!--
document.write( shop.title ) ;
//-->
</script>
</div>
</div>
<div class="dot" id="line02">･･･････････････････････････････････････････････････････････････････････････</div>
<div class="dot" id="line01">･･･････････････････････････････････････････････････････････････････････････</div>
<div class="buttonTextBlackM" id="error-text">
<script type="text/JavaScript">
<!--
document.writeln( shop.eulaMsg ) ;
//-->
</script>
</div>

<div id="showEulaViewerShadow"><img src="../image/banner/under_banner_shadow.gif" width="211" height="75" /></div>
<div id="showEulaViewerBanner"><img src="../image/banner/under_banner_a.gif" width="187" height="55" id="ImageToEula" /></div>
<div id="showEulaViewerWord" style="display: table;text-align:center;" class="h_block_middle">
<div style="display: table-cell; vertical-align: middle;" class="buttonTextBlackM">
<script type="text/JavaScript">
<!--
document.write( shop.manualChannelBtn ) ;
//-->
</script>
</div>
</div>
<div id="showEulaViewerSpacer">
<a href="javascript:void(0)">
<img src="../image/spacer.gif" width="187" height="55" border="0" onclick="snd.playSE( cSE_Decide );shop.jumpToManualChannel()" onmouseover="snd.playSE( cSE_Forcus );MM_swapImage('ImageToEula','','../image/banner/under_banner_b.gif',1)" onmouseout="MM_swapImgRestore()" />
</a>
</div>

<div id="wiimenushadow"><img src="../image/banner/under_banner_shadow.gif" width="211" height="75" /></div>
<div id="wiimenubanner"><img src="../image/banner/under_banner_a.gif" width="187" height="55" id="ImageToWiimenu" /></div>
<div id="wiimenuword">
<div align="center" class="buttonTextBlackM">
<script type="text/JavaScript">
<!--
document.write( shop.menuBtn ) ;
//-->
</script>
</div>
</div>
<div id="wiimenuspacer">
<a href="javascript:void(0)">
<img src="../image/spacer.gif" width="187" height="55" border="0" onclick="snd.playSE( cSE_Decide );shop.returnToMenu()" onmouseover="snd.playSE( cSE_Forcus );MM_swapImage('ImageToWiimenu','','../image/banner/under_banner_b.gif',1)" onmouseout="MM_swapImgRestore()" />
</a>
</div>
</body>
</html>
