<%@ page import = "java.io.*,java.util.*" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<% if ((request.getParameter("og") == null ? "false" : request.getParameter("og")).equals("false")) {%><a href="https://oss-auth.thecheese.io/oss/serv/debug.jsp">debug</a><% } %>
<h1>Whoops! That page was not found!</h1>
<br>
<p>To go back to the page you were at, click <a href="javascript:window.history.go(-1);">here</a>
    <br>
    or, you can go back to the first page of the shop, by clicking <a href="/oss/serv/W_01.jsp">here</a>.
</p>