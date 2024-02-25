<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 25.02.2024
  Time: 18:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Article</title>
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
    <form method="post" action="../article-servlet">
        <p>Title:<br>
            <input type="text" name="title"/><br><br>
        </p><p>Description:<br>
        <input type="text" name="description"/><br><br>
    </p><p>Content:<br>
        <textarea  name="content">
    </textarea></p><br><br>
        <input type="submit"/>
    </form>
</center>
</body>
</html>
