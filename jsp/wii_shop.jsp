<!-- Notes: You have to click "Go To Shop" and enter
the REAL shop (this HTML file is for intercepting HTTP packets,
not for placing on your spoofed webserver). After you enter the shop, go to download
a free channel (like Everybody Votes) then try to GIFT it. That will
bring you back to an error page, insert this HTML in the intercepted HTTP packet and
the data below will be filled in correctly. Without "authenticating" into the WiiShop,
some of the below data will be missing. This HTML will have to be fixed to work on a spoofed server. -->

<html><head><title>Hax</title>
</head><body>
<br>
<p><b>Woot! Here Wii go again?</b>
<input type="button" value="Go to Shop!" onClick="javascript:showPage('index.jsp')">
<input type="button" value="Reload Page" onClick="window.location.reload()"></p>

<!-- The JS files below have to be local to your spoofed webserver (just wget them from N's servers) -->
<SCRIPT language="JavaScript" src="/oss/oss/common/js//ec.js"></SCRIPT>
<SCRIPT language="JavaScript" src='/oss/oss/common/js//error.js'></SCRIPT>

<SCRIPT language="JavaScript" src="/oss/oss/common/js//buttons.js"></SCRIPT>
<SCRIPT language="JavaScript" src="/oss/oss/common/js//images.js"></SCRIPT>

<SCRIPT language="JavaScript" src='/oss/oss/common/js//sound.js'></SCRIPT>
<SCRIPT language="JavaScript" src="/oss/oss/common/js//shop.js"></SCRIPT>
<SCRIPT language="JavaScript" src="/oss/oss/common/js//oss.js"></SCRIPT>
<p>
<script type="text/javascript">
var snd = new wiiSound();
var r = ec.getDeviceInfo ();
var shop = new wiiShop();

//var ec = new EcommerceInterface();

wiiStopWaiting();
shop.setWallpaper(3);
shop.endWaiting();
snd.playBGM()

document.write("<p><b>Hello Wii! Here's some info:<\/b>");
document.write('<br>');
document.write('Serial: ' + r.serial);
document.write('<br>');
document.write('DeviceID: ' + r.deviceId);
document.write('<br>');
document.write('AccountID: ' + r.accountId);
document.write('<br>');
//document.write('Country: ' + r.country);
//document.write('<br>');
document.write('WiFiMAC: ' + r.wirelessMACAddr);
document.write('<br>');
document.write('BTMAC: ' + r.bluetoothMACAddr);
document.write('<br>');
document.write('FreeChannelAppCount: ' + r.freeChannelAppCount);
document.write('<br>');

// Doesn't work anymore for some reason, used to work back in '06
//document.write('DeviceToken: ' + ec.deviceToken);
//document.write('<br>');

document.write('DeviceToken: ' + ec.getWeakToken());
document.write('<br>');

document.write('ChannelAppTitle: ' + r.titleId);
document.write('<br>');

//document.write('OwnedTitles: ' + ec.ownedTitles);
//document.write('<br>');

document.write('getBalance: ' + ec.getCachedBalance());
document.write('<br>');

// Happens after BUYING points:
//document.write('PurchasedPoints: ' + ec.purchasedPoints);
//document.write('<br>');
document.write('getTitleLicense (for Sonic, MAHE): ' + getTitleLicense('000100014D414845'));
document.write('<br>');

document.write('getTicketInfos: ' + ec.getTicketInfos('000100014D414845'));
document.write('<br>');

//document.write('getLaunchTicket (for Sonic, MAHE): ' + getLaunchTicket('000100014D414845'));
document.write('getOwnedTitleIds: ' + getOwnedTitleIds());
document.write('<br>');
document.write('getCurrentPage: ' + getCurrentPage());
document.write('<br>');
//document.write('getTitleInfo: ' + ec.getTitleInfo ('0001000148414A45'));
document.write('acctDeviceCode: ' + r.accountDeviceCode);
document.write('<br>');
document.write('extAccountId: ' + r.extAccountId);
document.write('<br>');
document.write('isNeedTicketSync: ' + r.isNeedTicketSync);
document.write('<br>');
document.write('lastTicketSyncTime: ' + r.lastTicketSyncTime);
document.write('<br>');
document.write('cfgVersion: ' + r.cfgVersion);

// ToDo: Below needs further research.

//document.write('launchTitle:' + ec.launchTitle('0001000148414A45'));
//launchTitle(0001000148414A45')
</script></p>

<HR size="1" noshade>
</body></html>