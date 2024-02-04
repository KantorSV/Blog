package com.blog;

import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet (name = "signUp", urlPatterns = "/signup")
public class SignUp extends HttpServlet {
    @Resource (name = "java:comp/env/blogDS")
    private DataSource dataSource;

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String login = req.getParameter("login");
        String password = req.getParameter("password");
        String role = "user";
        createUser(login,password,role);
        resp.sendRedirect("user/user.jsp");
    }

    private void createUser(String login, String password, String role) {
        try (Connection connection = dataSource.getConnection()){
            PreparedStatement ps = connection.prepareStatement("insert into users (login, password, role) values(?,?,?)");
            ps.setString(1, login);
            ps.setString(2, password);
            ps.setString(3, role);
            ps.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

}
