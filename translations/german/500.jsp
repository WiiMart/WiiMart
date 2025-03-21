<%@ page import = "java.io.*,java.util.*,java.net.http.*,java.net.URI,java.net.http.HttpResponse.BodyHandlers,java.net.HttpURLConnection,java.net.URL,java.nio.charset.StandardCharsets,org.json.*" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ page buffer="8192kb" autoFlush="true" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Server Fehler</title>
</head>
<body>
    <h1>Uh oh!</h1>
    Der Server ist auf einen Fehler gestoßen und konnte keine Antwort senden.
    <br>
    Es gibt nichts falsches bei Ihnen, also wenn sie auf die vorherige Seite möchten, klicken sie <a
        href='javascript:window.history.go(-1);'>hier</a>.

    <h2>Debug Infos:</h2>
    <%
        // Retrieve the exception object
        Throwable throwable = (Throwable) request.getAttribute("javax.servlet.error.exception");
        if (throwable != null) {
    %>
        <p>
            <strong>Exception Message:</strong> 
            <%= throwable.getMessage() %>
        </p>
        <pre>
            <strong>Stack Trace:</strong>
            <%= org.apache.commons.lang3.exception.ExceptionUtils.getStackTrace(throwable) %>
        </pre>
    <%
        } else {
    %>
            <p>No exception details are available.</p>
    <%
        }
    %>
</body>
</html>