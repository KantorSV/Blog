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
        try (Connection connection = findDataSource().getConnection()) {
            PreparedStatement ps = connection.prepareStatement("select * from article join users on " +
                    "article.author=users.id order by modification_date desc");
            ResultSet set = ps.executeQuery();
            while (set.next()) {
                Article article = new Article();
                article.setUser(set.getString("login"));
                article.setTitle(set.getString("title"));
                article.setDescription(set.getString("description"));
                article.setContent(set.getString("content"));
                article.setView(set.getInt("view"));
                article.setLikes(set.getInt("likes"));
                article.setModificationDate(set.getDate("modification_date"));
                article.setId(set.getInt("id"));
                article.setDislike(set.getInt("dislikes"));
                list.add(article);
            }
            return list;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<Article> findLatestArticles(int pageNumber, int limit) {
        List<Article> list = new ArrayList<>();
        try (Connection connection = findDataSource().getConnection()) {
            PreparedStatement ps = connection.prepareStatement("select * from article join users on " +
                    "article.author=users.id order by modification_date desc limit ? offset ?");
            ps.setInt(1, limit);
            ps.setInt(2, limit * pageNumber);
            ResultSet set = ps.executeQuery();
            while (set.next()) {
                Article article = new Article();
                article.setUser(set.getString("login"));
                article.setTitle(set.getString("title"));
                article.setDescription(set.getString("description"));
                article.setContent(set.getString("content"));
                article.setView(set.getInt("view"));
                article.setLikes(set.getInt("likes"));
                article.setModificationDate(set.getDate("modification_date"));
                article.setId(set.getInt("id"));
                article.setDislike(set.getInt("dislikes"));
                list.add(article);
            }
            return list;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public int findAllArticlesCount () {
        try (Connection connection = findDataSource().getConnection()){
            PreparedStatement ps = connection.prepareStatement("SELECT count(*) FROM blog.article;");
            ResultSet resultSet = ps.executeQuery();
            resultSet.next();
            return resultSet.getInt(1);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<Article> findMostViewArticles() {
        List<Article> list = new ArrayList<>();
        try (Connection connection = findDataSource().getConnection()) {
            PreparedStatement ps = connection.prepareStatement("select * from article join users on article.author=users.id order by view desc");
            ResultSet set = ps.executeQuery();
            while (set.next()) {
                Article article = new Article();
                article.setUser(set.getString("login"));
                article.setTitle(set.getString("title"));
                article.setDescription(set.getString("description"));
                article.setContent(set.getString("content"));
                article.setView(set.getInt("view"));
                article.setLikes(set.getInt("likes"));
                article.setModificationDate(set.getDate("modification_date"));
                article.setId(set.getInt("id"));
                article.setDislike(set.getInt("dislikes"));
                list.add(article);
            }
            return list;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<Article> findMostLikesArticles() {
        List<Article> list = new ArrayList<>();
        try (Connection connection = findDataSource().getConnection()) {
            PreparedStatement ps = connection.prepareStatement("select * from article join users on article.author=users.id order by likes desc");
            ResultSet set = ps.executeQuery();
            while (set.next()) {
                Article article = new Article();
                article.setUser(set.getString("login"));
                article.setTitle(set.getString("title"));
                article.setDescription(set.getString("description"));
                article.setContent(set.getString("content"));
                article.setView(set.getInt("view"));
                article.setLikes(set.getInt("likes"));
                article.setModificationDate(set.getDate("modification_date"));
                article.setId(set.getInt("id"));
                article.setDislike(set.getInt("dislikes"));
                list.add(article);
            }
            return list;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<Article> findMostDislikesArticles() {
        List<Article> list = new ArrayList<>();
        try (Connection connection = findDataSource().getConnection()) {
            PreparedStatement ps = connection.prepareStatement("select * from article join users on article.author=users.id order by likes desc");
            ResultSet set = ps.executeQuery();
            while (set.next()) {
                Article article = new Article();
                article.setUser(set.getString("login"));
                article.setTitle(set.getString("title"));
                article.setDescription(set.getString("description"));
                article.setContent(set.getString("content"));
                article.setView(set.getInt("view"));
                article.setLikes(set.getInt("likes"));
                article.setModificationDate(set.getDate("modification_date"));
                article.setId(set.getInt("id"));
                article.setDislike(set.getInt("dislikes"));
                list.add(article);
            }
            return list;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public Article finById(int id) {
        try (Connection connection = findDataSource().getConnection()) {
            PreparedStatement ps = connection.prepareCall("select * from article join users on article.author=users.id where article.id =?");
            ps.setInt(1, id);
            ResultSet set = ps.executeQuery();
            Article article = null;
            while (set.next()) {
                article = new Article();
                article.setUser(set.getString("login"));
                article.setTitle(set.getString("title"));
                article.setDescription(set.getString("description"));
                article.setContent(set.getString("content"));
                article.setView(set.getInt("view"));
                article.setLikes(set.getInt("likes"));
                article.setModificationDate(set.getDate("modification_date"));
                article.setId(set.getInt("id"));
                article.setDislike(set.getInt("dislikes"));
            }
            return article;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void increaseViewForArticle(int id) {
        try (Connection connection = findDataSource().getConnection()) {
            PreparedStatement ps = connection.prepareCall("update article set view=view+1 where id=?");
            ps.setInt(1, id);
            ps.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void increaseLikesForArticle(int id, String login) {
        try (Connection connection = findDataSource().getConnection()) {
            PreparedStatement ps2 = connection.prepareStatement("select count(*) from user_article_like where user_id=(select id from users where login = ?) " +
                    "and article_id=?");
            ps2.setString(1, login);
            ps2.setInt(2, id);
            ResultSet res = ps2.executeQuery();
            res.next();
            int count = res.getInt(1);
            if (count == 0) {
                PreparedStatement ps = connection.prepareCall("update article set likes=likes+1 where id=?");
                ps.setInt(1, id);
                ps.execute();
                PreparedStatement ps1 = connection.prepareStatement("insert into user_article_like(user_id, article_id, type)" +
                        "values((select id from users where login = ?), ?, 'like')");
                ps1.setString(1, login);
                ps1.setInt(2, id);
                ps1.execute();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void increaseDislikesForArticle(int id, String login) {
        try (Connection connection = findDataSource().getConnection()) {
            PreparedStatement ps2 = connection.prepareStatement("select count(*) from user_article_like where user_id=(select id from users where login = ?) " +
                    "and article_id=?");
            ps2.setString(1, login);
            ps2.setInt(2, id);
            ResultSet res = ps2.executeQuery();
            res.next();
            int count = res.getInt(1);
            if (count == 0) {
                PreparedStatement ps = connection.prepareCall("update article set dislikes=dislikes+1 where id=?");
                ps.setInt(1, id);
                ps.execute();
                PreparedStatement ps1 = connection.prepareStatement("insert into user_article_like(user_id, article_id, type)" +
                        "values((select id from users where login = ?), ?, 'dislike')");
                ps1.setString(1, login);
                ps1.setInt(2, id);
                ps1.execute();
            }
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
