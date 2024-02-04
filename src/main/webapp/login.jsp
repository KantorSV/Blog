<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 03.02.2024
  Time: 19:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
</head>
<body>
<form method="post" action="j_security_check">
    <p>Login:<br>
        <input type="text" name="j_username">
    </p>
    <p>Password:<br>
        <input type="password" name="j_password">
    </p>
    <input type="submit"/>
</form>
</body>
</html>
