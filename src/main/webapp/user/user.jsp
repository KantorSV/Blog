<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 03.02.2024
  Time: 19:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User</title>
</head>
<body>
<h2>Hello</h2>
<%=request.getUserPrincipal().getName()%><br><br>
<a href="../logout-servlet">LogOut</a><br><br>
<form method="post" action="../article-servlet">
    <p>Title:<br>
    <input type="text" name="title"/><br><br>
    </p><p>Description:<br>
    <input type="text" name="description"/><br><br>
    </p><p>Content:<br>
    <textarea  name="content">
    </textarea></p><br><br>
    <input type="submit"/>
</form>
</body>
</html>
