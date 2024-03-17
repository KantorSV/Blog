<%@ page import="com.blog.AllArticlesDao" %>
<%@ page import="java.util.List" %>
<%@ page import="com.model.Article" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Blog</title>
    <link rel="stylesheet" href="style/index.css">
</head>
<body style="background-color: #232E35;">
<% AllArticlesDao allArticlesDao = new AllArticlesDao();

    List<Article> latestArticle = allArticlesDao.findLatestArticles();
%>
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
                                              src="imagesKantor/logout.png" title="Log Out" width="150"
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
    </table><br><br><br>
</center>
<center>
    <table class="table_2">
        <tr class="tr">
            <th class="th"><h3>User</h3></th>
            <th class="th"><h3>Title</h3></th>
            <th class="th"><h3>Description</h3></th>
            <th class="th"><h3>View</h3></th>
            <th class="th"><h3>Likes</h3></th>
            <th class="th"><h3>Dislikes</h3></th>
        </tr>
        <% for (int i = 0; i < latestArticle.size(); i++) {%>
        <tr>
            <td class="td">
                <%= latestArticle.get(i).getUser() %>
            </td>
            <td class="td">
                <a href="viewTitle.jsp?id=<%= latestArticle.get(i).getId() %>"><%= latestArticle.get(i).getTitle() %>
                </a>
            </td>
            <td class="td">
                <%= latestArticle.get(i).getDescription()%>
            </td>
            <td class="td">
                <%= latestArticle.get(i).getView() %>
            </td>
            <td class="td">
                <%= latestArticle.get(i).getLikes() %>
            </td>
            <td class="td">
                <%= latestArticle.get(i).getDislike() %>
            </td>
        </tr>
        <% } %>
    </table>
</center>
</body>
</html>