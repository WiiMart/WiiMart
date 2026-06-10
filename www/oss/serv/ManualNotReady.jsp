<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="/oss/oss/common/css/oss.css"/>
    <script type="text/javascript" src="/oss/oss/common/js/sound.js"></script>
    <script src="/oss/oss/common/js/oss.js"></script>
    <script src="/oss/oss/common/js/shop.js"></script>
    <script src="/oss/oss/common/js/buttons.js"></script>
    <script src="/oss/oss/common/js/ec.js"></script>
    <script src="/oss/oss/common/js/images.js"></script>
    <script type="text/javascript">
        var shop = new wiiShop();
        const l = shop.connecting;

        function initPage() {
            var ecsUrl = "https://ecs.a.taur.cloud/ecs/services/ECommerceSOAP";
            var iasUrl = "https://ias.a.taur.cloud/ias/services/IdentityAuthenticationSOAP";

            var ccsUrl = "https://ccs.blinklab.com/ccs/download";
            var ucsUrl = "https://ccs.blinklab.com/ccs/download";

            var ec = new ECommerceInterface();
            ec.setWebSvcUrls(ecsUrl, iasUrl);
            ec.setContentUrls(ccsUrl, ucsUrl);
            
            MM_preloadImages("/oss/oss/common/images/banner/under_banner_b.gif");

            if (snd && "playBGM" in snd) {
                snd.playBGM();
            }

            //shop.setWallpaper(cWP_VLine);
            shop.endWaiting();
            shop.enableHRP();
            // if launched as a manual viewer, menubtn returns to game
            setUnderButton(true, "Return to Game", "javascript:shop.returnToMenu()", "snd.playSE(cSE_Decide)");
        }
    </script>
</head>
<body onload="initPage()" style="overflow: hidden;">
    <div class="dot" id="line02">･･･････････････････････････････････････････････････････････････････････････</div>
    <div class="dot" id="line01">･･･････････････････････････････････････････････････････････････････････････</div>
    <span style="position: absolute;bottom:0;left:10px"><script>document.write(shop.launchCode);</script></span>
    <center>
        <h1>A note about manuals...</h1>
        <p>Manuals are currently not implemented yet.</p>
        <p>In the meantime, you can stay here to enjoy the Wii Shop music.</p>
        <p>When you want to return to the game you were playing, simply press the button below.</p>
    </center>
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
</body>
</html>