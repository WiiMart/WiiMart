<%@ page import = "java.io.*,java.util.*,java.sql.*" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<% if (request.getParameter("Serial") == null) { %>
<script>
var ec = new ECommerceInterface();
var info = ec.getDeviceInfo();
var serial = info.serial;
top.location = "https://oss-auth.a.taur.cloud/oss/serv/debug.jsp?Serial=" + serial;
</script>
<% } %>
<% if (request.getParameter("Serial") != null && !request.getParameter("Serial").equals("") && request.getParameter("Serial").equals("PC156494873")) { %>
<script>
top.location = "https://oss-auth.a.taur.cloud/oss/serv/debug-pc.jsp?Serial=PC156494873"
</script>
<% } %>
<!DOCTYPE html>
<html>
    <head>
        <title>Debug</title>
        <style type="text/css">
            #consoleOutput {
                top: 130px;
                z-index: 1;
            }
        </style>
        <script type="text/javascript" src="/oss/oss/common/js/oss.js"></script>
        <script type="text/javascript" src="/oss/oss/common/js/keyboard.js"></script>
        <script type="text/javascript">
            function changePage(page) {
                var ec = new ECommerceInterface();
                var info = ec.getDeviceInfo();
                var nextPage; 
                if (info.registrationStatus == "") {
                    nextPage = "https://oss-auth.a.taur.cloud/oss/serv/CheckRegistered.jsp?Serial=" + info.serial + "&titleId=0001000248414241" +  + "&language=" + info.language + "&country=" + info.country + "&region=" + info.region;
                } else if (ec.getCachedBalance() == null || ec.getCachedBalance() == "null") { 
                    nextPage = "https://oss-auth.a.taur.cloud/oss/serv/CheckRegistered.jsp?Serial=" + info.serial + "&titleId=0001000248414241" +  + "&language=" + info.language + "&country=" + info.country + "&region=" + info.region;
                } else {
                    nextPage = "https://oss-auth.a.taur.cloud/oss/serv/" + page + "?language=" + info.language + "&country=" + info.country + "&region=" + info.region;
                }
                top.location = nextPage;
            }
        </script>
        <script type="text/javascript">
            var scroll_step = 30;
            function kdown() {

                var _code = event.keyCode;
                var _obj = document.getElementById('consoleOutput');
                if (_obj) {
                    switch (_code) {
                        case 175:    //up
                        case 38:
                            _obj.scrollTop -= scroll_step;
                            break;
                        case 176:    //down
                        case 40:
                            _obj.scrollTop += scroll_step;
                            break;
                        /* case 178:
                            document.getElementById('arrowLImg').click();
                            break;

                        case 177:
                            document.getElementById('arrowRImg').click();
                            break;
                    }*/
                    }
                }
            }
        </script>
    </head>    
    <body onload="var ec = new ECommerceInterface();document.getElementById('consoleOutput').value = ec.getLog();document.getElementById('myP').innerText = ec.getLog();var x=new wiiShop();var unused=x.connecting;x.setWallpaper(3);kdown();x.enableHRP();x.endWaiting();">
        <a href="javascript:changePage('W_03.jsp')">Return to Shop</a>
        <a href="javascript:showBack()">Previous page</a>
        <a href="javascript:window.location.reload()">Reload</a>
        <textarea id="consoleOutput" rows="16" style="width: 100%" readonly="readonly">EC Logging</textarea>
        <!--xml.setRequestHeader('Content-Type', 'text/html');-->
        <script>
            function fieldBackColorFocus(field)
            {
		        field.style.backgroundColor='#E6E6E6';
            }

            function fieldBackColorRestore(field)
            {
            	field.style.backgroundColor='#FFFFFF';
            }
            function sendLog() {
                var xml = new XMLHttpRequest();
                trace("code inputted: " + document.getElementById("cardNumber").value);
                xml.open('POST', 'https://oss-auth.a.taur.cloud/oss/ecs/log?code=' + document.getElementById("cardNumber").value);
                xml.setRequestHeader("Code", document.getElementById("cardNumber").value)
                xml.send(document.getElementById('myP').innerText);
                xml.onreadystatechange = function(event) {
                    if (xml.status == 200) {
                        document.getElementById("sendBtn").innerHTML = "Log sent!";
                        setTimeout(function() {
                            document.getElementById("sendBtn").innerHTML = "Send log to server for support (ONLY PRESS IF SUPPORT IS NEEDED)";
                        }, 1500);
                    } else {
                        document.getElementById("sendBtn").innerHTML = "Incorrect code!";
                        setTimeout(function() {
                            document.getElementById("sendBtn").innerHTML = "Send log to server for support (ONLY PRESS IF SUPPORT IS NEEDED)";
                        }, 1500);
                    }
                }
            }
        </script>
<!--        <button onclick="var x = new wiiShop();x.rebootSystem()/*sendLog();*/">DO NOT PUSH THIS BUTTON AT ALL COSTS!!!!!!!</button>-->
        Code:
        <input type="text" class="inputTypeA inputStyle" style="background-color: #FFFFFF" id="cardNumber" maxLength="5" size="24"
	        	onmouseover="fieldBackColorFocus(this); if(snd) snd.playSE(cSE_Forcus);" onmouseout="fieldBackColorRestore(this);"
	        	onmousedown="if(kbd) kbd.call(2);"/>
        <button id="sendBtn" onclick="sendLog();">Send log to server for support (ONLY PRESS IF SUPPORT IS NEEDED)</button>
        <% if (request.getParameter("Serial") != null && !request.getParameter("Serial").equals("") && request.getParameter("Serial").equals("LEF109253666")) { %>
            <a href="javascript:top.location='STAFF%20ONLY/localizations/LOC_W_03.jsp?lang=de&region=EUR'">German Translation</a>
        <% } %>
        <% if (request.getParameter("Serial") != null && !request.getParameter("Serial").equals("") && 
              (request.getParameter("Serial").equals("LU362861790") || // Thom
               request.getParameter("Serial").equals("LU596438324") || // Thom
               request.getParameter("Serial").equals("LU310714499") || // Ocarina
               request.getParameter("Serial").equals("OW400603375") || // Ocarina
               request.getParameter("Serial").equals("LU715326754") || // ThatOneYoshi
               request.getParameter("Serial").equals("LU121123756") || // YTS
               request.getParameter("Serial").equals("OEM110937425") || // idkwh
               request.getParameter("Serial").equals("LU570267988") || // Subnetic
               request.getParameter("Serial").equals("OW111040476") || // Gemdation
               request.getParameter("Serial").equals("LU403640919") || // RM05
               request.getParameter("Serial").equals("LEH286361710") || // idkwh
               request.getParameter("Serial").equals("OW707046349") || // Ocarina
               request.getParameter("Serial").equals("OW710243346") || // Thom
               request.getParameter("Serial").equals("LU202431985") || // Selim
               request.getParameter("Serial").equals("PC156494873") || // PC (Thom)
               request.getParameter("Serial").equals("LEF109253666") || // Cosmo
               request.getParameter("Serial").equals("LEH259733988"))) // Cosmo
               { %>
                <br>
                <a href="https://oss-auth.a.taur.cloud/oss/serv/STAFF%20ONLY/B_05.jsp?titleId=000100014E414C45&language=en&country=US&region=USA">WIP Gifting B_05</a>
                <a href="https://oss-auth.a.taur.cloud/oss/serv/STAFF%20ONLY/B_05.jsp?titleId=000100014E414C45&from=Nintendo">WIP Receive Gift B_05</a>
                <a href="sandbox/idkwhereisthisname.jsp">dl task stuff</a>
                <a href="/oss/serv/sandbox/localization.jsp">Localizations</a>
                <a href="/oss/serv/S_lang.jsp?og=false">Language Select</a>
                <a href="javascript:showPage('STAFF%20ONLY/W_03.jsp')">WIP Gifting W_03</a>
                <a href="https://oss-auth.a.taur.cloud/oss/serv/W_03.jsp">Development server</a>
                <a href="/h">Extra debug stuff...</a>
                <br>
         <% if (request.getParameter("Serial").equals("LU310714499") || request.getParameter("Serial").equals("OW400603375") || request.getParameter("Serial").equals("OW707046349")) { %>
                <a href="javascript:top.location='https://oss-auth.a.taur.cloud/oss/serv/sandbox/ocarina.jsp'"><button>Go to Ocarina sandbox</button></a>
         <% } else if (request.getParameter("Serial").equals("LU715326754")) { %>
                <a href="javascript:top.location='https://oss-auth.a.taur.cloud/oss/serv/sandbox/ThatOneYoshi.jsp'"><button>Go to ThatOneYoshi sandbox</button></a>
         <% } else if (request.getParameter("Serial").equals("LU121123756")) { %>
                <a href="javascript:top.location='https://oss-auth.a.taur.cloud/oss/serv/sandbox/YourTooSlow.jsp'"><button>Go to YTS sandbox</button></a>
         <% } else if (request.getParameter("Serial").equals("OEM110937425") || request.getParameter("Serial").equals("LEH286361710")) { %>
                <a href="javascript:top.location='https://oss-auth.a.taur.cloud/oss/serv/sandbox/idkwhereisthisname.jsp'"><button>Go to idkwh sandbox</button></a>
         <% } else if (request.getParameter("Serial").equals("LU570267988")) { %>
                <a href="javascript:top.location='https://oss-auth.a.taur.cloud/oss/serv/sandbox/subnetic.jsp'"><button>Go to Subnetic sandbox</button></a>
         <% } else if (request.getParameter("Serial").equals("OW111040476")) { %>
                <a href="javascript:top.location='https://oss-auth.a.taur.cloud/oss/serv/sandbox/Gemdation.jsp'"><button>Go to Gemdation sandbox</button></a>
         <% } else if (request.getParameter("Serial").equals("LU403640919")) { %>
                <a href="javascript:top.location='https://oss-auth.a.taur.cloud/oss/serv/sandbox/rm05.jsp'"><button>Go to RM05 sandbox</button></a>
         <% } else if (request.getParameter("Serial").equals("LU362861790") || request.getParameter("Serial").equals("LU596438324") || request.getParameter("Serial").equals("OW710243346") || request.getParameter("Serial").equals("PC156494873")) { %>
                <a href="javascript:top.location='https://oss-auth.a.taur.cloud/oss/serv/sandbox/thom5582.jsp'"><button>Go to Thom sandbox</button></a>
         <% } else if (request.getParameter("Serial").equals("LU202431985")) { %>
                <a href="javascript:top.location='https://oss-auth.a.taur.cloud/oss/serv/sandbox/selimgozel1.jsp'"><button>Go to Selim sandbox</button></a>
         <% } else if (request.getParameter("Serial").equals("LEH259733988")) { %>
                <a href="javascript:top.location='https://oss-auth.a.taur.cloud/oss/serv/sandbox/cosmobona56.jsp'"><button>Go to cosmobona56 sandbox</button></a>
         <% } else { %>
                <input type="button" disabled="disabled" onclick="snd.playSE(6)" value="No sandbox :(" />
        <% } %>
        <% } %>
	<p id="myP" style="display: none;"></p>
    </body>
</html>
