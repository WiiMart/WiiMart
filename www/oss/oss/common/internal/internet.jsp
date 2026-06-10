<%@ page import = "java.io.*,java.util.*" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>ncd error</title>
<style type="text/css">
<!--
#error-text {
	position:absolute;
	left:66px;
	top:111px;
	width:476px;
	height:176px;
	z-index:7;
}
#error-code {
	position:absolute;
	left:66px;
	top:80px;
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
#wiimenushadow {position:absolute;
	left:199px;
	top:287px;
	width:211px;
	height:75px;
	z-index:1;
}
#wiimenurbanner {position:absolute;
	left:211px;
	top:294px;
	width:187px;
	height:55px;
	z-index:2;
}
#wiimenuword {position:absolute;
	left:214px;
	top:308px;
	width:180px;
	height:22px;
	z-index:3;
}
#wiimenuspacer {	position:absolute;
	left:211px;
	top:294px;
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
var a = shop.connecting ; // タイムアウト回避
document.write( shop.title ) ;
//-->
</script>
</div>
</div>
<div class="dot" id="line02">･･･････････････････････････････････････････････････････････････････････････</div>
<div class="dot" id="line01">･･･････････････････････････････････････････････････････････････････････････</div>
<div id="wiimenushadow"><img src="../image/banner/under_banner_shadow.gif" width="211" height="75" /></div>
<div id="wiimenurbanner"><img src="../image/banner/under_banner_a.gif" width="187" height="55" id="Image7" /></div>
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
<img
	src="../image/spacer.gif"
	width="187"
	height="55"
	border="0"
	onclick="snd.playSE( cSE_Decide );shop.returnToMenu()"
	onmouseover="snd.playSE( cSE_Forcus );MM_swapImage('Image7','','../image/banner/under_banner_b.gif',1)"
	onmouseout="MM_swapImgRestore()" />
</a>
</div>
<div id="error-code">
<div align="left"><span class="warningRed">
<script type="text/javascript">
<!--
document.writeln( shop.errCode ) ;
//-->
</script>
</span></div>
</div>
<div class="warningRedS" id="error-text">
<div align="left" class="textRed">
<script type="text/javascript">
<!--
document.write( shop.errMsg ) ;
//-->
</script>
</div>
</div>
</body>

</html>
