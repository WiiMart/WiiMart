<%@ page import = "java.io.*,java.util.*" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<a href="https://oss-auth.thecheese.io/oss/serv/debug.jsp">debug</a>
<%
	                Random rand = new Random();
	                int rank = rand.nextInt(4);
	            %>
<!DOCTYPE html>
<html>
    <head>
        <script src="/oss/oss/common/js/error.js"></script>
        <script src="/oss/oss/common/js/ec.js"></script>
        <script src="/oss/oss/common/js/sound.js"></script>
        <script src="/oss/oss/common/js/oss.js"></script>
        <script src="/oss/oss/common/js/shop.js"></script>
        <script src="/oss/oss/common/js/json2.js"></script>
        <script src="/oss/oss/common/js/keyboard.js"></script>
        <script>
            function initPage() {
                var shop = new wiiShop();
                var unused = shop.connecting;
                shop.endWaiting();
                var ecsUrl = 'https://oss-auth.thecheese.io/oss/ecs/services/ECommerceSOAP';
                var iasUrl = 'https://oss-auth.thecheese.io/oss/ias/services/IdentityAuthenticationSOAP';
                var ccsUrl = 'http://ccs.blinklab.com/ccs/download';
                var ucsUrl = 'http://ccs.blinklab.com/ccs/download';
                ec.setWebSvcUrls(ecsUrl, iasUrl);
                ec.setContentUrls(ccsUrl, ucsUrl);
                trace("initPage done")
            }
            function checkRegistration() {
                trace("checking registration")
                var progress = ec.checkRegistration();
                opName = "Check Registration";
                opDesc = "Checking Registration";
                finishOp(opName, opDesc, progress, "onOperationDone");
            }
            function checkDeviceStatus() {
                trace("checking device status")
                var progress = ec.checkDeviceStatus();
                opName = "Check device status";
                opDesc = "Checking device status";
                finishOp(opName, opDesc, progress, "onOperationDone");
            }
            function refreshCachedBalance() {
                trace("refreshing cached balance")
                var progress = ec.refreshCachedBalance();
                opName = "Refresh cached balance";
                opDesc = "Refreshing cached balance";
                finishOp(opName, opDesc, progress, "onOperationDone");
            }
            function downloadTitle() {
	            wiiSetSCARank(parseInt('<%= rank %>'));
                var titleId = document.getElementById('cardNumber').value;
                opName = "Download title";
                opDesc = "Downloading a title"
                if (titleId == "" || titleId.length < 16) {
                    onOperationDone({ status: -4004, errInfo: "Cannot download specified title!" });
                    return "Cannot download specified title!";
                }
                var progress = ec.downloadTitle(titleId);
                finishOp(opName, opDesc, progress, "onOperationDone");
            }
            function purchaseTitle() {
	            wiiSetSCARank(parseInt('<%= rank %>'));
                var titleId = document.getElementById('cardNumber').value;
                opName = "Purchase title";
                opDesc = "Purchasing a title"
                if (titleId == "" || titleId.length < 16) {
                    onOperationDone({ status: -4004, errInfo: "Cannot purchase specified title!" });
                    return "Cannot purchase specified title!";
                }
                var titleText;
                var xml = new XMLHttpRequest();
                xml.open("GET", "https://oss-auth.thecheese.io/oss/serv/getTitle.jsp?titleId=" + titleId);
                xml.send();
                xml.onreadystatechange = function(event) {
                    if (xml.status == 200) {
                        var title = JSON.parse(xml.responseText);
                        var points = title.points;
                        var progress = ec.purchaseTitle(titleId, "0", new ECPrice(points, "POINTS"), new ECAccountPayment(), new ECTitleLimits(), true);
                        opName = "Purchase Title";
                        opDesc = "Purchasing title";
                        finishOp(opName, opDesc, progress, "onOperationDone");
                    }
                }
            }
            function onOperationDone(progress) {
                showResult(progress, opName, opDesc);
                //Make duplicate progress object that can be stringified
                var prog = {
                    status: progress.status,
                    operation: progress.operation,
                    description: progress.description,
                    phase: progress.phase,
                    isCancelRequested: progress.isCancelRequested,
                    downloadedSize: progress.downloadedSize,
                    totalSize: progress.totalSize,
                    errCode: progress.errCode,
                    errInfo: progress.errInfo
                }
                //stringify said object
                var progString = JSON.stringify(prog);
                //Make indents and line breaks when necessary
                progString = progString.replace("{", "{<br>&nbsp;&nbsp;&nbsp;&nbsp;");
                progString = progString.replace(/,/g, ",<br>&nbsp;&nbsp;&nbsp;&nbsp;");
                progString = progString.replace("}", "<br>}");
                //Display progress object to user
                document.getElementById("progressDiv").innerHTML = "Operation finished! Got progress: " + progString;
            }
            function fieldBackColorFocus(field)
            {
		        field.style.backgroundColor='#E6E6E6';
            }

            function fieldBackColorRestore(field)
            {
            	field.style.backgroundColor='#FFFFFF';
            }
        </script>
    </head>
    <body onload="initPage();">
        <a href="javascript:window.location.reload();">reload</a>
        <h3>Operations:</h3>
        <button onclick="checkRegistration()">check registration</button>
        <br>
        <button onclick="checkDeviceStatus()">check device status</button>
        <br>
        <button onclick="refreshCachedBalance()">refresh cached balance</button>
        <br>
        <input type="text" class="inputTypeA inputStyle" style="background-color: #FFFFFF" id="cardNumber" maxLength="16" size="24"
	    	onmouseover="fieldBackColorFocus(this); if(snd) snd.playSE(cSE_Forcus);" onmouseout="fieldBackColorRestore(this);"
	    	onmousedown="if(kbd) kbd.call(0);" value="0001000148414445"/>
        <button onclick="downloadTitle()">Download title</button>
        <button onclick="purchaseTitle()">Purchase title</button>
        <br>
        <div id="progressDiv"></div>
    </body>
</html>
