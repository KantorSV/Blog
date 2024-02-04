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

@WebServlet (name = "articleServlet", urlPatterns = "/article-servlet")
public class ArticleServlet extends HttpServlet {

    @Resource (name = "java:comp/env/blogDS")
    private DataSource dataSource;

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String title = req.getParameter("title");
        String description = req.getParameter("description");
        String content = req.getParameter("content");
        String login = req.getUserPrincipal().getName();

        createArticle(title,description,content,login);
        resp.sendRedirect("user/user.jsp");
    }

    private void createArticle(String title, String description, String content, String login) {
        try (Connection connection = dataSource.getConnection()){
            PreparedStatement ps = connection.prepareStatement("insert into article (title, description, content, author) " +
                    "values (?,?,?, (select id from users where login=?))");
            ps.setString(1, title);
            ps.setString(2, description);
            ps.setString(3, content);
            ps.setString(4, login);
            ps.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
