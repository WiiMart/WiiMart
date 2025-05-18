<%@ page import = "java.io.*,java.util.*" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<a href="https://oss-auth.blinklab.com/oss/serv/debug.jsp">debug</a>
<a href="https://oss-auth.blinklab.com/oss/serv/index.jsp">index</a>
<!DOCTYPE html>
<html>
    <head>


      <script src="/oss/oss/common/js/oss.js"></script>
        <script src="/oss/oss/common/js/shop.js"></script>
        <script src="/oss/oss/common/js/json2.js"></script>
    </head>
    <body onload="var x = new wiiShop();var unused = x.connecting">
        <script>
            function checkRegistration() {
                var ecsUrl = 'https://oss-auth.blinklab.com/oss/ecs/services/ECommerceSOAP';
                var iasUrl = 'https://oss-auth.blinklab.com/oss/ias/services/IdentityAuthenticationSOAP';
                var ccsUrl = 'http://oss-auth.blinklab.com/ccs/download';
                var ucsUrl = 'http://oss-auth.blinklab.com/ccs/download';
                ec.setWebSvcUrls(ecsUrl, iasUrl);
                ec.setContentUrls (ccsUrl, ucsUrl);
                var progress = ec.checkRegistration();
                opName = "Check Registration";
                opDesc = "Checking Registration";
                finishOp(opName, opDesc, progress, "onCheckRegistrationDone");
            }
            function onCheckRegistrationDone(progress) {
                showResult (progress, opName, opDesc);
                trace(JSON.stringify(progress));
            }
        </script>
        <button onclick="checkRegistration()">check registration</button>
    </body>
</html>
