package com.blog;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet (name = "dislikeServlet", urlPatterns = "/user/dislike-servlet")
public class DislikeServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));
        String user = req.getRemoteUser();
        AllArticlesDao allArticlesDao = new AllArticlesDao();
        allArticlesDao.increaseDislikesForArticle(id, user);

        resp.sendRedirect("../viewTitle.jsp?increaseView=false&id=" + id);
    }
}
