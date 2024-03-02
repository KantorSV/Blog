<%@ page import="com.blog.AllArticlesDao" %>
<%@ page import="java.util.List" %>
<%@ page import="com.model.Article" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Blog</title>
</head>
<body>
<% AllArticlesDao allArticlesDao = new AllArticlesDao();
    List<Article> latestArticle = allArticlesDao.findLatestArticles();
    List<Article> mostView = allArticlesDao.findMostViewArticles();
    List<Article> mostLikes = allArticlesDao.findMostLikesArticles();
%>
<center>
    <table>
        <thead>
        <tr>
            <td>
                <a href="index.jsp"><img src="images/logo.png"/></a>
            </td>
            <% if (request.getRemoteUser() == null) { %>
            <td>
                <a href="signup.jsp"><img onmouseover="src='images/but_new_in.png'"
                                          onmouseout="src='images/but_new.png'" src="images/but_new.png"></a>
            </td>
            <td>
                <a href="user/user.jsp"><img onmouseover="src='images/but_login_in.png'"
                                             onmouseout="src='images/but_login.png'" src="images/but_login.png"></a>
            </td>
            <% } else { %>
            <td>
                <a href="user/createArticle.jsp"><img onmouseover="src='images/but_new_in.png'"
                                                      onmouseout="src='images/but_new.png'"
                                                      src="images/but_new.png"></a>
            </td>
            <td>
                <a href="logout-servlet"><img onmouseover="src='images/but_logout_in.png'"
                                              onmouseout="src='images/but_logout.png'" src="images/but_logout.png"></a>
            </td>
            <td>
                <a href="user/user.jsp"><img src="images/user.png" width="150" height="150"></a>
            </td>
            <% } %>

        </tr>
        </thead>
    </table>
</center>
<center>
    <table border="1">
        <% for (int i = 0; i < latestArticle.size(); i++ ) {%>
        <tr>
            <td>
                <h1><%= latestArticle.get(i).getTitle() %>
                </h1><br>
                <h3><%= latestArticle.get(i).getDescription()%>
                </h3><br>
            </td>
            <td>
                <h1><%= mostView.get(i).getTitle() %>
                    </h1><br>
                        <h3><%= mostView.get(i).getDescription()%></h3><br>
            </td>
            <td>
                <h1><%= mostLikes.get(i).getTitle() %>
                    </h1><br>
                        <h3><%= mostLikes.get(i).getDescription()%></h3><br>
            </td>
        </tr><% } %>
    </table>
</center>
</body>
</html>