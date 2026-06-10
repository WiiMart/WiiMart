<?xml version="1.0" encoding="utf-8" standalone="no" ?>
<!DOCTYPE html PUBLIC "-//IETF//DTD HTML 2.0//EN">
<%@ page import = "java.io.*,java.util.*,java.net.http.*,java.net.URI,java.net.http.HttpResponse.BodyHandlers,java.net.HttpURLConnection,java.net.URL,java.nio.charset.StandardCharsets,org.json.*" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ page buffer="8192kb" autoFlush="true" %>
<%@ page isErrorPage="true" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
    <title>???500.title???</title>
</head>
<body>
    <h1>Uh oh!</h1>
    The server ran into an error and couldn't send a response for you.
    <br>
    There is nothing wrong on your end, so if you want to go back to the page you were at previously, click <a
        href='javascript:window.history.go(-1);'>here</a>.

    <h2>Debug Information:</h2>
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