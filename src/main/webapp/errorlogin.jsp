<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 03.02.2024
  Time: 19:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Error Login</title>
    <link rel="stylesheet" href="../style/login.css">
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
                <a href="../signup.jsp"><img onmouseover="src='../imagesKantor/newW.png'"
                                             onmouseout="src='../imagesKantor/new.png'"
                                             src="../imagesKantor/new.png" title="Create Account" width="150"
                                             height="150"/></a>
            </td>
            <td>
                <a href="user/user.jsp"><img onmouseover="src='../imagesKantor/loginW.png'"
                                             onmouseout="src='../imagesKantor/login.png'"
                                             src="../imagesKantor/login.png" title="Log In" width="150"
                                             height="150"/></a>
            </td>
        </tr>
        </thead>
    </table>
</center>
<center>
    <div class="h3"><h3 style="color: #8daef6;">Please Provide Correct Password or Login</h3></div>
    <div class="form-box">
        <form method="post" action="j_security_check">
            <p>
            <h3 style="color: #8daef6">Login:</h3>
            <input style="background-color: #ffffff" type="text" name="j_username"/>
            </p>
            <p>
            <h3 style="color: #8daef6">Password:</h3>
            <input style="background-color:#ffffff" type="password" name="j_password"/>
            </p>
            <br>
            <button id="button" type="submit">OK</button>
        </form>
    </div>
</center>
</body>
</html>
