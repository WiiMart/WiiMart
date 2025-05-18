<%@ page language="java" %>
<%
    String targetUrl = "http://oss-auth.thecheese.io/oss/ecs/services/ECommerceSOAP"; // Relative URL of the target JSP
    RequestDispatcher dispatcher = request.getRequestDispatcher(targetUrl);
    dispatcher.forward(request, response);
%>