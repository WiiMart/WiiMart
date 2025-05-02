

<a href="https://oss-auth.thecheese.io/oss/serv/debug.jsp">debug</a>
<a href="https://oss-auth.thecheese.io/oss/serv/index.jsp">index</a>
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
                var ecsUrl = 'https://oss-auth.thecheese.io/oss/ecs/services/ECommerceSOAP';
                var iasUrl = 'https://oss-auth.thecheese.io/oss/ias/services/IdentityAuthenticationSOAP';
                var ccsUrl = 'http://oss-auth.thecheese.io/ccs/download';
                var ucsUrl = 'http://ccs.thecheese.io/ccs/download';
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
