<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 03.02.2024
  Time: 20:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Sign Up</title>
</head>
<body>
<center>
    <table>
        <thead>
        <tr>
            <td>
                <a href="index.jsp"><img src="images/logo.png"/></a>
            </td>
            <td>
                <a href="signup.jsp"><img onmouseover="src='images/but_new_in.png'"
                                          onmouseout="src='images/but_new.png'" src="images/but_new.png"></a>
            </td>
            <td>
                <a href="user/user.jsp"><img onmouseover="src='images/but_login_in.png'"
                                             onmouseout="src='images/but_login.png'" src="images/but_login.png"></a>
            </td>
        </tr>
        </thead>
    </table>
</center>
<center>
    <h1>Create New Account</h1>
    <form method="post" action="signup">
        <p>Login:<br>
            <input type="text" name="login">
        </p>
        <p>Password:<br>
            <input type="password" name="password">
        </p>
        <input type="submit"/><br><br>

    </form>
</center>
</body>
</html>
