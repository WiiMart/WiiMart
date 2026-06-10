<?xml version="1.0" encoding="utf-8" standalone="no" ?>
<!DOCTYPE html PUBLIC "-//IETF//DTD HTML 2.0//EN">
<%@ page import = "java.io.*,java.util.*" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>???404.title???</title>
</head>
<body>
<% if ((request.getParameter("og") == null ? "false" : request.getParameter("og")).equals("false")) {%><a href="https://oss-auth.a.taur.cloud/oss/serv/debug.jsp">debug</a><% } %>
<h1>Whoops! That page was not found!</h1>
<br>
<p>To go back to the page you were at, click <a href="javascript:window.history.go(-1);">here</a>
    <br>
    or, you can go back to the first page of the shop, by clicking <a href="/oss/serv/W_01.jsp">here</a>.
</p>
</body>
</html>