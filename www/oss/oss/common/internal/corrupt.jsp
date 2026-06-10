<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>nand corrupt</title>
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
</head>

<body onload="shop.endWaiting();MM_preloadImages('../image/banner/under_banner_b.gif')">
<div id="title">
  <div align="left" class="titleBlue">
<script type="text/JavaScript">
<!--
var a = shop.connecting ; // タイムアウト回避
nwc24 = new wiiNwc24;
shop.disableHRP();// ホームボタン、リセット、電源OFF禁止
document.write( shop.title ) ;
//-->
</script>
</div>
</div>
<div class="dot" id="line02">･･･････････････････････････････････････････････････････････････････････････</div>
<div class="dot" id="line01">･･･････････････････････････････････････････････････････････････････････････</div>
<div class="warningRedS" id="error-text">
  <div align="left"><span class="textRed">
  <script type="text/JavaScript">
<!--
document.writeln( nwc24.errMsg ) ;
//-->
</script>
</span>
</div>
</div>
<div id="error-code">
<div align="left"><span class="warningRed">
<script type="text/JavaScript">
<!--
document.writeln( nwc24.errCodeWithLabel ) ;
//-->
</script>
</span></div>
</div>
</body>
</html>
