<%--
  Created by IntelliJ IDEA.
  User: zenry
  Date: 09/01/2025
  Time: 9:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Test Mess</title>
</head>
<body>
<%
  String mess = (String) request.getAttribute("mess");
%>
<p style="display: <%= (mess != null && !mess.trim().isEmpty()) ? "block" : "none" %>;">
  <%= (mess != null) ? mess : "" %>
</p>
</body>
</html>

