
<%
String customHeader1 = "platform";
String customValue1 = request.getParameter("platform") == null ? "WII" : request.getParameter("platform");
String customHeader2 = "X-Custom-Header2";
String customValue2 = request.getParameter("p") == null ? "1" : request.getParameter("p");
String vcParam = request.getParameter("vc") != null ? "&vc=true" : "";
String targetURL = "http://oss-auth.blinklab.com/getTitles?p=" + customValue2 + vcParam;
StringBuilder res = new StringBuilder();

try {
    URL url = new URL(targetURL);
    HttpURLConnection connection = (HttpURLConnection) url.openConnection();
    connection.setRequestMethod("GET");

    // Set custom headers
    connection.setRequestProperty(customHeader1, customValue1);
    connection.setRequestProperty(customHeader2, customValue2);

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

String games = res.toString();
%>