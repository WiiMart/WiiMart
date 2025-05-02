<%@ page language="java" %>
<%
    String targetUrl = "http://oss-auth.thecheese.io/oss/ias/services/IdentityAuthenticationSOAP"; // Relative URL of the target JSP
    RequestDispatcher dispatcher = request.getRequestDispatcher(targetUrl);
    dispatcher.forward(request, response);
%>