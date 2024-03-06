<%@ page import="com.blog.AllArticlesDao" %>
<%@ page import="com.model.Article" %><%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 04.03.2024
  Time: 18:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% int id = Integer.parseInt(request.getParameter("id"));
    AllArticlesDao allArticlesDao = new AllArticlesDao();
    Article article = allArticlesDao.finById(id);
%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="style/viewTitle.css">
</head>
<body style="background-color: #232E35">
<center>
    <table class="table_1">
        <thead>
        <tr>
            <td>
                <a href="index.jsp"><img onmouseover="src='imagesKantor/homeW.png'"
                                         onmouseout="src='imagesKantor/home.png'"
                                         src="imagesKantor/home.png" title="Home" width="150" height="150"/></a>
            </td>
            <% if (request.getRemoteUser() == null) { %>
            <td>
                <a href="signup.jsp"><img onmouseover="src='imagesKantor/newW.png'"
                                          onmouseout="src='imagesKantor/new.png'"
                                          src="imagesKantor/new.png" title="Create Account" width="150"
                                          height="150"/></a>
            </td>
            <td>
                <a href="user/user.jsp"><img onmouseover="src='imagesKantor/loginW.png'"
                                             onmouseout="src='imagesKantor/login.png'"
                                             src="imagesKantor/login.png" title="Log In" width="150" height="150"/></a>
            </td>
            <% } else { %>
            <td>
                <a href="user/createArticle.jsp"><img onmouseover="src='imagesKantor/newW.png'"
                                                      onmouseout="src='imagesKantor/new.png'"
                                                      src="imagesKantor/new.png" title="Log In" width="150"
                                                      height="150"/></a>
            </td>
            <td>
                <a href="logout-servlet"><img onmouseover="src='imagesKantor/logoutW.png'"
                                              onmouseout="src='imagesKantor/logout.png'"
                                              src="imagesKantor/logout.png" title="Log Out" idth="150"
                                              height="150"/></a>
            </td>
            <td>
                <a href="user/user.jsp"><img onmouseover="src='imagesKantor/userW.png'"
                                             onmouseout="src='imagesKantor/user.png'"
                                             src="imagesKantor/user.png" title="My Cabinet" width="150"
                                             height="150"/></a>
            </td>
            <% } %>

        </tr>
        </thead>
    </table>
</center>
<center>
    <table class="table_1">
        <tr class="tr">
            <th class="th"><h3>User</h3></th>
            <th class="th"><h3>Title</h3></th>
            <th class="th"><h3>Description</h3></th>
            <th class="th"><h3>Content</h3></th>
            <th class="th"><h3>View</h3></th>
            <th class="th"><h3>Likes</h3></th>
            <th class="th"><h3>Dislikes</h3></th>
        </tr>
        <tr class="tr">
            <td class="td"><%= article.getUser() %>
            </td>
            <td class="td"><%= article.getTitle()%>
            </td>
            <td class="td"><%= article.getDescription() %>
            </td>
            <td class="td"><%= article.getContent() %>
            </td>
            <td class="td"><%= article.getView() %>
            </td>
            <td class="td"><%= article.getLikes() %>
            </td>
            <td class="td"><%= article.getDislike() %>
            </td>
        </tr>
    </table>
</center>
</body>
</html>
