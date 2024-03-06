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
    <link rel="stylesheet" href="../style/createArticle.css">
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
                                        src="../imagesKantor/user.png" title="My Cabinet" width="150"
                                        height="150"/></a>
            </td>
        </tr>
        </thead>
    </table>
</center>
<center>
    <div class="form-box">
        <form method="post" action="../article-servlet">
            <p>
            <h3 style="color: #8daef6">Title:</h3>
            <input type="text" name="title"/><br>
            </p>
            <p>
            <h3 style="color: #8daef6">Description:</h3>
            <input type="text" name="description"/>
            </p>
            <p>
            <h3 style="color: #8daef6">Content:</h3>
            <textarea name="content">
    </textarea></p>
            <button id="button" type="submit">OK</button>
        </form>
    </div>
</center>
</body>
</html>
