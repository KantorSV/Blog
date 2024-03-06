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
    <link rel="stylesheet" href="../style/articleDetails.css">
</head>
<body style="background-color: #232E35">
<center>
    <table class="table_1">
        <thead>
        <tr>
            <td>
                <a href="../index.jsp"><img onmouseover="src='../imagesKantor/homeW.png'"
                                         onmouseout="src='../imagesKantor/home.png'"
                                         src="../imagesKantor/home.png" title="Home" width="150" height="150"/></a>
            </td>
            <% if (request.getRemoteUser() == null) { %>
            <td>
                <a href="../signup.jsp"><img onmouseover="src='../imagesKantor/newW.png'"
                                          onmouseout="src='../imagesKantor/new.png'"
                                          src="../imagesKantor/new.png" title="Create Account" width="150"
                                          height="150"/></a>
            </td>
            <td>
                <a href="user.jsp"><img onmouseover="src='../imagesKantor/loginW.png'"
                                             onmouseout="src='../imagesKantor/login.png'"
                                             src="../imagesKantor/login.png" title="Log In" width="150" height="150"/></a>
            </td>
            <% } else { %>
            <td>
                <a href="createArticle.jsp"><img onmouseover="src='../imagesKantor/newW.png'"
                                                      onmouseout="src='../imagesKantor/new.png'"
                                                      src="../imagesKantor/new.png" title="Log In" width="150"
                                                      height="150"/></a>
            </td>
            <td>
                <a href="logout-servlet"><img onmouseover="src='../imagesKantor/logoutW.png'"
                                              onmouseout="src='../imagesKantor/logout.png'"
                                              src="../imagesKantor/logout.png" title="Log Out" idth="150"
                                              height="150"/></a>
            </td>
            <td>
                <a href="user.jsp"><img onmouseover="src='../imagesKantor/userW.png'"
                                             onmouseout="src='../imagesKantor/user.png'"
                                             src="../imagesKantor/user.png" title="My Cabinet" width="150"
                                             height="150"/></a>
            </td>
            <% } %>

        </tr>
        </thead>
    </table>
</center>
<center>
    <br><br>
    <h3>Id: <%= article.getId() %></h3> <br>
    <h3>Description: <%= article.getDescription()%></h3><br>
    <h3>Content: <%= article.getContent() %></h3><br>
    <h3>User: <%= article.getUser() %></h3>
</center>
</body>
</html>
