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

public class AllArticlesDao {
    public List<Article> findLatestArticles() {
        List<Article> list = new ArrayList<>();
        try (Connection connection = findDataSource().getConnection()){
            PreparedStatement ps = connection.prepareStatement("select * from article join users on article.author=users.id order by modification_date desc;");
            ResultSet set =  ps.executeQuery();
            while (set.next()) {
                Article article = new Article();
                article.setUser(set.getString("login"));
                article.setTitle(set.getString("title"));
                article.setDescription(set.getString("description"));
                article.setContent(set.getString("content"));
                article.setView(set.getInt("view"));
                article.setLikes(set.getInt("likes"));
                article.setModificationDate(set.getDate("modification_date"));
                list.add(article);
            }
            return list;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<Article> findMostViewArticles() {
        List<Article> list = new ArrayList<>();
        try (Connection connection = findDataSource().getConnection()){
            PreparedStatement ps = connection.prepareStatement("select * from article join users on article.author=users.id order by view desc;");
            ResultSet set =  ps.executeQuery();
            while (set.next()) {
                Article article = new Article();
                article.setUser(set.getString("login"));
                article.setTitle(set.getString("title"));
                article.setDescription(set.getString("description"));
                article.setContent(set.getString("content"));
                article.setView(set.getInt("view"));
                article.setLikes(set.getInt("likes"));
                article.setModificationDate(set.getDate("modification_date"));
                list.add(article);
            }
            return list;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<Article> findMostLikesArticles() {
        List<Article> list = new ArrayList<>();
        try (Connection connection = findDataSource().getConnection()){
            PreparedStatement ps = connection.prepareStatement("select * from article join users on article.author=users.id order by likes desc;");
            ResultSet set =  ps.executeQuery();
            while (set.next()) {
                Article article = new Article();
                article.setUser(set.getString("login"));
                article.setTitle(set.getString("title"));
                article.setDescription(set.getString("description"));
                article.setContent(set.getString("content"));
                article.setView(set.getInt("view"));
                article.setLikes(set.getInt("likes"));
                article.setModificationDate(set.getDate("modification_date"));
                list.add(article);
            }
            return list;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    private DataSource findDataSource () {
        try {
            InitialContext initialContext= new InitialContext();
            return (DataSource) initialContext.lookup("java:comp/env/blogDS");
        } catch (NamingException e) {
            throw new RuntimeException(e);
        }
    }

}
