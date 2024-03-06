package com.blog;

import com.model.Article;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
@WebServlet (name = "UpdateArticleServlet", urlPatterns = "/user/update")
public class UpdateArticleServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));
        String title = req.getParameter("title");
        String description = req.getParameter("description");
        String content = req.getParameter("content");

        Article article = new Article();
        article.setId(id);
        article.setContent(content);
        article.setDescription(description);
        article.setTitle(title);

        UserArticleDao userArticleDao = new UserArticleDao();
        userArticleDao.updateArticleById(article);

        resp.sendRedirect("user.jsp");
    }
}
