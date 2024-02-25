<%@ page import="com.blog.UserArticleDao" %>
<%@ page import="com.model.Article" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 25.02.2024
  Time: 19:32
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
    <title>Delete</title>
</head>
<body>
<center>
    <table>
        <thead>
        <tr>
            <td>
                <a href="../index.jsp"><img src="../images/logo.png"/></a>
            </td>
            <td>
                <a href="createArticle.jsp"><img onmouseover="src='../images/but_new_in.png'"
                                                 onmouseout="src='../images/but_new.png'" src="../images/but_new.png"></a>
            </td>
            <td>
                <a href="../logout-servlet"><img onmouseover="src='../images/but_logout_in.png'"
                                                 onmouseout="src='../images/but_logout.png'" src="../images/but_logout.png"></a>
            </td>
            <td>
                <a href="user.jsp"><img  src="../images/user.png" width="150" height="150"></a>
            </td>
        </tr>
        </thead>
    </table>
</center>
<center>
    <h1>Please Confirm Delete of this Article</h1>

    <form method="post" action="deleteArticleServlet">
        <input type="hidden" name="id" value="<%= article.getId() %>"/>
        <input type="submit"/>
    </form>

    <h3>Id: <%= article.getId() %></h3> <br>
    <h3>Description: <%= article.getDescription()%></h3><br>
    <h3>Content: <%= article.getContent() %></h3><br>
    <h3>User: <%= article.getUser() %></h3>
</center>
</body>
</html>
