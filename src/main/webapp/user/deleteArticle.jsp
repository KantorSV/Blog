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
    <link rel="stylesheet" href="../style/deleteArticle.css">
</head>
<body style="background-color: #232E35">
<center>
    <table class="table">
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
                <a href="../logout-servlet"><img onmouseover="src='../imagesKantor/logoutW.png'"
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
    <h1 style="color: #8daef6">Please Confirm Delete of this Article</h1>

    <div class="form-box">


        <form method="post" action="deleteArticleServlet">
            <h3>Id:  <%= article.getId() %>
            </h3> <br>
            <h3>User:  <%= article.getUser()%>
            </h3><br>
            <h3>Title:  <%= article.getTitle() %>
            </h3><br>
            <h3>Description:  <%= article.getDescription() %>
            </h3>
            <input type="hidden" name="id" value="<%= article.getId() %>"/>
            <button id="button" type="submit">Delete</button>
        </form>
    </div>
</center>
</body>
</html>
