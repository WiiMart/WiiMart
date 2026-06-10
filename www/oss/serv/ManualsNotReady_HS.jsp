<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<% String titleId = request.getParameter("titleId") == null ? "" : request.getParameter("titleId"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" href="/oss/oss/common/css/oss.css" />
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
                shop.setWallpaper(1);
                // if launched as a manual viewer, menubtn returns to game
                setUnderButton(true, "Back", "javascript:showPage('B_13.jsp?titleId=<%= titleId %>')", "snd.playSE(cSE_Cancel)");
            }
        </script>
    </head>

    <body onload="initPage()" style="overflow: hidden;">
        <div id="constElements">
            <div id="tophelpshadow"><img src="/oss/oss/common/images//banner/top_help_shadow01.gif" width="132"
                    height="75" /></div>
            <div id="help">
                <!--img src="/oss/oss/common/images//banner/help_a.gif" name="ManualImage" width="52" height="55"
                    border="0" id="ManualImageID" onmouseout="MM_swapImgRestore()"
                    onmouseover="MM_swapImage('ManualImage','','/oss/oss/common/images//banner/help_b.gif',1); wiiFocusSound();"
                    onclick="showHelp(); wiiSelectSound();" /-->
                <img src="/oss/oss/common/images//banner/help_gray.gif" width="52" height="55" border="0"
                    id="ManualGrayImageID" onclick="//snd.playSE(6)" />
                <img src="/oss/oss/common/images//spacer.gif" name="HelpSpacer" width="52" height="55" border="0"
                    id='HelpSpacer' style="position:absolute; top:0px; left:0px; display:none" />
            </div>

            <div id="top">
                <!--img src="/oss/oss/common/images//banner/top_a.gif" name="TopImage" width="52" height="55" border="0"
                    id="TopImageID" onmouseout="MM_swapImgRestore()"
                    onmouseover="MM_swapImage('TopImage','','/oss/oss/common/images//banner/top_b.gif',1); wiiFocusSound();"
                    onclick="showHome(); wiiCancelSound();" /-->
                <img src="/oss/oss/common/images//banner/top_gray.gif" width="52" height="55" border="0"
                    id="TopGrayImageID" onclick="//snd.playSE(6)" />
                <img src="/oss/oss/common/images//spacer.gif" name="MainSpacer" width="52" height="55" border="0"
                    id='MainSpacer' style="position:absolute; top:0px; left:0px; display:none" />
            </div>

            <div class="dot" id="line01">
                ･･･････････････････････････････････････････････････････････&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;･･
            </div>
            <div class="dot" id="line02">･･･････････････････････････････････････････････････････････････････････････
            </div>
            <div class="dot" id="upperLineLong" style="display:none">
                ･･･････････････････････････････････････････････････････････････････････････</div>
            <div id='balanceInfo'>
                <script
                    type="text/JavaScript">MM_preloadImages('/oss/oss/common/images//banner/Addpoints_everywhere.gif');</script>
                <img src="/oss/oss/common/images//spacer.gif" name="PointSpacer" width="130" height="55" border="0"
                    id='PointSpacer' style="position:absolute; top:376px; left:239px; z-index:20;" />
                <div id="Wiipoint">
                    <div align="center" class="buttonTextBlackM">Wii Points</div>
                </div>
                <div id="point" class="wiiPoint"><span id="currentBalance"><script>document.write(ec.getCachedBalance())</script></span></div>
            </div>
        </div>
        <!--<span style="position: absolute;bottom:0;left:10px">
            <script>document.write(shop.launchCode);</script>
        </span>-->
        <center>
            <h1>A note about manuals</h1>
            <p>Manuals are currently not implemented yet.</p>
            <p>Return to the previous page by pressing the button below.</p>
        </center>
        <div id="underButton" style="display:none">
            <div id="underbannershadow" class="buttonBannerShadow">
                <img src="/oss/oss/common/images//banner/under_banner_shadow.gif" width="211" height="75" />
            </div>
            <div id="underbanner" class="buttonBanner">
                <img src="/oss/oss/common/images//banner/under_banner_a.gif" width="187" height="55" id="underImg" />
            </div>
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