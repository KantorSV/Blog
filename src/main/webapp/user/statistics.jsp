<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 02.04.2024
  Time: 20:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Statistics</title>
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
</center>
<br><br>
<center>
    <table class="table_1">
        <thead>
        <tr>
            <td>
                <img src="../statistics?chartType=bar"/></td>
            <td>
                <img src="../statistics?chartType=pie"/></td>
        </tr>
        </thead>
    </table>
</center>
</body>
</html>
