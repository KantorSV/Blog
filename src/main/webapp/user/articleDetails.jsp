<%@ page import="com.blog.UserArticleDao" %>
<%@ page import="com.model.Article" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 13.02.2024
  Time: 17:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    UserArticleDao userArticleDao = new UserArticleDao();
    Article article = userArticleDao.findArticleById(id);
%>
<html>
<head>
    <title><%= article.getTitle() %></title>
</head>
<body>
<center>
    <h3>Id: <%= article.getId() %></h3> <br>
    <h3>Description: <%= article.getDescription()%></h3><br>
    <h3>Content: <%= article.getContent() %></h3><br>
    <h3>User: <%= article.getUser() %></h3>
</center>
</body>
</html>
