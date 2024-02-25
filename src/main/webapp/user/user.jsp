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
<h2>Hello</h2>
<%=request.getUserPrincipal().getName()%><br><br>
<center>
    <table>
    <%
        UserArticleDao userArticleDao = new UserArticleDao();
        String user = request.getRemoteUser();
        List<Article> list = userArticleDao.findAllArticlesByUser(user);
        for (Article a: list) { %>
            <tr>
                <td>
                    <a href="articleDetails.jsp?id=<%= a.getId() %>"> <h1><%= a.getTitle() %></h1></a>
                    <p><%= a.getDescription() %></p>
                </td>
                <td>
                    <a href="updateArticle.jsp?id=<%= a.getId() %>">Update</a>
                </td>
                <td>
                    <a href="deleteArticle.jsp?id=<%=  a.getId() %>">Delete</a>
                </td>
            </tr>
        <% } %>

</table>
</center>
</body>
</html>
