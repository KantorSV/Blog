<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Blog</title>
</head>
<body>
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
                                             onmouseout="src='images/but_new.png'" src="images/but_new.png"></a>
        </td>
        <td>
            <a href="logout-servlet"><img onmouseover="src='images/but_logout_in.png'"
                                         onmouseout="src='images/but_logout.png'" src="images/but_logout.png"></a>
        </td>
        <td>
            <a href="user/user.jsp"><img  src="images/user.png" width="150" height="150"></a>
        </td>
        <% } %>

    </tr>
    </thead>
</table>
</center>
</body>
</html>