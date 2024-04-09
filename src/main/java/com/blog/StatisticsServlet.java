package com.blog;

import com.model.Article;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtils;
import org.jfree.chart.JFreeChart;
import org.jfree.data.category.CategoryDataset;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.data.general.DefaultPieDataset;
import org.jfree.data.xy.DefaultXYDataset;
import org.jfree.data.xy.XYDataset;

import java.io.IOException;
import java.io.OutputStream;

@WebServlet (name = "statisticsServlet", urlPatterns = "/statistics")
public class StatisticsServlet extends HttpServlet {
     private UserArticleDao userArticleDao = new UserArticleDao();

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int articleId = Integer.parseInt(req.getParameter("articleId"));
        Article article = userArticleDao.findArticleById(articleId);

        String chartType = req.getParameter("chartType");
        JFreeChart chart = null;
        if ("pie".equalsIgnoreCase(chartType)) {
            chart = createPie(article);
        }else {
            chart = createBar(article);
        }

        resp.setContentType("image/png");
        ChartUtils.writeChartAsPNG(resp.getOutputStream(), chart, 500, 500, true, 3);
    }
    private JFreeChart createPie (Article article) {
        DefaultPieDataset data = new DefaultPieDataset<>();

        data.setValue("View", article.getView());
        data.setValue("Likes", article.getLikes());
        data.setValue("Dislikes", article.getDislike());

        return ChartFactory.createPieChart("Statistics Pie", data);
    }
    private JFreeChart createBar (Article article) {
        DefaultCategoryDataset data = new DefaultCategoryDataset();

        data.addValue(article.getView(), "View", "");
        data.addValue(article.getLikes(), "Likes", "");
        data.addValue(article.getDislike(), "Dislikes", "");

        return ChartFactory.createBarChart("Statistics Bar", "", "", data);
    }
    private JFreeChart createLine() {
        DefaultXYDataset data = new DefaultXYDataset();

        double[][] kantorData = {{10,1},{20,2}};
        double[][] desData = {{15,4},{17,6}};
        double[][] johnData = {{7,8},{9,2}};

        data.addSeries("Kantor", kantorData);
        data.addSeries("Des", desData);
        data.addSeries("John", johnData);

        return ChartFactory.createXYLineChart("Line Chart", "x", "y", data);
    }
}
