<%@ page language="java" %>
<%
    String targetUrl = "http://oss-auth.blinklab.com/oss/ias/services/IdentityAuthenticationSOAP"; // Relative URL of the target JSP
    RequestDispatcher dispatcher = request.getRequestDispatcher(targetUrl);
    dispatcher.forward(request, response);
%>