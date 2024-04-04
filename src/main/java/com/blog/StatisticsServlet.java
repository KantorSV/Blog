package com.blog;

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

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String chartType = req.getParameter("chartType");
        JFreeChart chart = null;
        if ("pie".equalsIgnoreCase(chartType)) {
            chart = createPie();
        }else {
            chart = createBar();
        }

        resp.setContentType("image/png");
        ChartUtils.writeChartAsPNG(resp.getOutputStream(), chart, 500, 500, true, 3);

    }
    private JFreeChart createPie () {
        DefaultPieDataset data = new DefaultPieDataset<>();
        data.setValue("Kantor", 74);
        data.setValue("Des", 100);
        data.setValue("Ukraine", 108);
        data.setValue("Kantor", 365);

        return ChartFactory.createPieChart("Statistics", data);
    }
    private JFreeChart createBar () {
        DefaultCategoryDataset data = new DefaultCategoryDataset();
        data.addValue(25, "Kantor", "count pull-up");
        data.addValue(26, "Des", "count pull-up");
        data.addValue(7, "John", "count pull-up");

        return ChartFactory.createBarChart("Bar Chart", "x", "y", data);
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
