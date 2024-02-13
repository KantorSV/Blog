package com.blog;

import com.model.Article;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserArticleDao {
    public List<Article> findAllArticlesByUser(String user) {

        List<Article> list = new ArrayList<>();

        try (Connection connection = findDataSource().getConnection()){
            PreparedStatement ps = connection.prepareStatement("select * from article where author=(select id from " +
                    "users where login=?)");
            ps.setString(1, user);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Article article = new Article();
                article.setId(rs.getInt("id"));
                article.setTitle(rs.getString("title"));
                article.setDescription(rs.getString("description"));
                article.setContent(rs.getString("content"));
                article.setUser(user);

                list.add(article);
            }
            return list;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }



    }
    public Article findArticleById(int id) {
        try (Connection connection = findDataSource().getConnection()){
            PreparedStatement ps = connection.prepareStatement("SELECT article.*, users.login FROM article join " +
                    "users on article.author=users.id where article.id=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            Article article = new Article();
            while (rs.next()) {
                article.setId(id);
                article.setTitle(rs.getString("title"));
                article.setDescription(rs.getString("description"));
                article.setContent(rs.getString("content"));
                article.setUser(rs.getString("login"));
            }
            return article;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    private DataSource findDataSource() {
        try {
            InitialContext initialContext = new InitialContext();
            return (DataSource) initialContext.lookup("java:comp/env/blogDS");
        } catch (NamingException e) {
            throw new RuntimeException(e);
        }
    }
}
