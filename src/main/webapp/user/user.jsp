<%@ page import="java.util.List" %>
<%@ page import="com.model.Article" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.blog.UserArticleDao" %><%--
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
    <link rel="stylesheet" href="../style/user.css">
</head>
<body style="background-color: #232E35;">
<center>
    <table class="table_1">
        <thead>
        <tr>
            <td>
                <a href="../index.jsp"><img onmouseover="src='../imagesKantor/homeW.png'"
                                            onmouseout="src='../imagesKantor/home.png'"
                                            src="../imagesKantor/home.png" title="Home" width="150" height="150"/></a>
            </td>
            <td>
                <a href="createArticle.jsp"><img onmouseover="src='../imagesKantor/newW.png'"
                                                 onmouseout="src='../imagesKantor/new.png'"
                                                 src="../imagesKantor/new.png" title="Create Account" width="150"
                                                 height="150"/></a>
            </td>
            <td>
                <a href="../logout-servlet"><img onmouseover="src='../imagesKantor/logoutW.png'"
                                                 onmouseout="src='../imagesKantor/logout.png'"
                                                 src="../imagesKantor/logout.png" title="Log Out" width="150"
                                                 height="150"/></a>
            </td>
            <td>
                <a href="user.jsp"><img onmouseover="src='../imagesKantor/userW.png'"
                                        onmouseout="src='../imagesKantor/user.png'"
                                        src="../imagesKantor/user.png" title="My Cabinet" width="150" height="150"/></a>
            </td>
        </tr>
        </thead>
    </table>
</center><br>
<center>
    <h1 style="color: #8daef6"><%=request.getUserPrincipal().getName()%></h1>
    <table class="table_1">
        <%
            UserArticleDao userArticleDao = new UserArticleDao();
            String user = request.getRemoteUser();
            List<Article> list = userArticleDao.findAllArticlesByUser(user);
            for (Article a : list) { %>
        <tr class="tr">
            <td class="td">
                <a href="articleDetails.jsp?id=<%= a.getId() %>"><h2><%= a.getTitle() %>
                </h2></a>
                <p><%= a.getDescription() %>
                </p>
            </td>
            <td class="td">
                <a href="updateArticle.jsp?id=<%= a.getId() %>">Update</a>
            </td>
            <td class="td">
                <a href="deleteArticle.jsp?id=<%=  a.getId() %>">Delete</a>
            </td>
            <td class="td">
                <a href="statistics.jsp?articleId=<%=  a.getId() %>">Statistic</a>
            </td>
        </tr>
        <% } %>

    </table>
</center>
</body>
</html>
