<%@ page import = "java.io.*,java.util.*,java.util.Random,java.net.http.*,java.net.URI,java.net.http.HttpResponse.BodyHandlers,java.net.HttpURLConnection,java.net.URL,java.nio.charset.StandardCharsets,org.json.*" %>
<%@ page pageEncoding="UTF-8" contentType="application/json; charset=UTF-8" %>
<%
String titleId = request.getParameter("titleId") == null ? "" : request.getParameter("titleId");
String targetURL = "http://127.0.0.1:8082/getTitle?titleId=" + titleId;
StringBuilder res = new StringBuilder();

try {
    URL url = new URL(targetURL);
    HttpURLConnection connection = (HttpURLConnection) url.openConnection();
    connection.setRequestMethod("GET");

    int responseCode = connection.getResponseCode();
    BufferedReader reader;

    if (responseCode == HttpURLConnection.HTTP_OK) {
        reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
    } else {
        reader = new BufferedReader(new InputStreamReader(connection.getErrorStream()));
    }

    String line;
    while ((line = reader.readLine()) != null) {
        res.append(line);
    }
    reader.close();
} catch (Exception e) {
    e.printStackTrace();
    res.append("Error: ").append(e.getMessage());
}

String game = res.toString();
%>
<%= game %>