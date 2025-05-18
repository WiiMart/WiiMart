<%@ page import = "java.io.*,java.util.*,java.sql.*" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<% if (request.getParameter("Serial") == null) { %>
<script>
var ec = new ECommerceInterface();
var info = ec.getDeviceInfo();
var serial = info.serial;
top.location = "https://oss-auth.thecheese.io/oss/serv/debug.jsp?Serial=" + serial;
</script>
<% } %>
<!DOCTYPE html>
<html>
    <head>
        <title>Debug</title>
        <style>
            #consoleOutput {
                top: 130px;
                z-index: 1;
            }
        </style>
        <script src="/oss/oss/common/js/keyboard.js"></script>
        <script>
            function changePage(page) {
                var ec = new ECommerceInterface();
                var info = ec.getDeviceInfo();
                var nextPage = "https://oss-auth.thecheese.io/oss/serv/" + page + "?language=" + info.language + "&country=" + info.country + "&region=" + info.region;
                top.location = nextPage;
            }
        </script>
    </head>    
    <body onload="var ec = new ECommerceInterface();document.getElementById('consoleOutput').value = ec.getLog();document.getElementById('myP').innerText = ec.getLog();var x=new wiiShop();var unused=x.connecting;">
        <a href="javascript:changePage('W_03.jsp')">Return to Shop</a>
        <a href="javascript:window.location.reload()">Reload</a>
        <textarea id="consoleOutput" rows="16" style="width: 100%" readonly>EC Logging</textarea>
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
                xml.open('POST', 'https://oss-auth.thecheese.io/oss/ecs/log?code=' + document.getElementById("cardNumber").value);
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
        <% if (request.getParameter("Serial") != null && !request.getParameter("Serial").equals("") && 
              (request.getParameter("Serial").equals("LU362861790") || 
               request.getParameter("Serial").equals("LU596438324") || 
               request.getParameter("Serial").equals("LU310714499") || 
               request.getParameter("Serial").equals("OW400603375") ||
               request.getParameter("Serial").equals("LU715326754") ||
               request.getParameter("Serial").equals("LU121123756") ||
               request.getParameter("Serial").equals("OEM110937425") ||
               request.getParameter("Serial").equals("LU570267988") ||
               request.getParameter("Serial").equals("OW111040476") ||
               request.getParameter("Serial").equals("LU403640919") ||
               request.getParameter("Serial").equals("LEH286361710"))) { 
                //Individual serial checks
            if (request.getParameter("Serial").equals("LU310714499") || request.getParameter("Serial").equals("OW400603375")) { %>
                <a href="javascript:top.location='https://oss-auth.thecheese.io/oss/serv/sandbox/ocarina.jsp'"><button>Go to ocarina sandbox</button></a>
         <% } else if (request.getParameter("Serial").equals("LU715326754")) { %>
                <a href="javascript:top.location='https://oss-auth.thecheese.io/oss/serv/sandbox/ThatOneYoshi.jsp'"><button>Go to thatoneyoshi sandbox</button></a>
         <% } else if (request.getParameter("Serial").equals("LU121123756")) { %>
                <a href="javascript:top.location='https://oss-auth.thecheese.io/oss/serv/sandbox/YourTooSlow.jsp'"><button>Go to yts sandbox</button></a>
         <% } else if (request.getParameter("Serial").equals("OEM110937425") || request.getParameter("Serial").equals("LEH286361710")) { %>
                <a href="javascript:top.location='https://oss-auth.thecheese.io/oss/serv/sandbox/idkwhereisthisname.jsp'"><button>Go to idkwh sandbox</button></a>
         <% } else if (request.getParameter("Serial").equals("LU570267988")) { %>
                <a href="javascript:top.location='https://oss-auth.thecheese.io/oss/serv/sandbox/subnetic.jsp'"><button>Go to subnetic sandbox</button></a>
         <% } else if (request.getParameter("Serial").equals("OW111040476")) { %>
                <a href="javascript:top.location='https://oss-auth.thecheese.io/oss/serv/sandbox/Gemdation.jsp'"><button>Go to gemdation sandbox</button></a>
         <% } else if (request.getParameter("Serial").equals("LU403640919")) { %>
                <a href="javascript:top.location='https://oss-auth.thecheese.io/oss/serv/sandbox/rm05.jsp'"><button>Go to RM05 sandbox</button></a>
         <% } else if (request.getParameter("Serial").equals("LU362861790") || request.getParameter("Serial").equals("LU596438324")) { %>
                <a href="javascript:top.location='https://oss-auth.thecheese.io/oss/serv/sandbox/thom5582.jsp'"><button>Go to thom sandbox</button></a>
         <% } else if (request.getParameter("Serial").equals("LU202431985")) { %>
                <a href="javascript:top.location='https://oss-auth.thecheese.io/oss/serv/sandbox/selimgozel1.jsp'"><button>Go to selim sandbox</button></a>
         <% } else if (request.getParameter("Serial").equals("FJH106654329")) { %>
                <a href="javascript:top.location='https://oss-auth.thecheese.io/oss/serv/sandbox/max.jsp'"><button>Go to max sandbox</button></a>
         <% } %>
        <% } %>
	<p id="myP" style="display: none;"></p>
    </body>
</html>
