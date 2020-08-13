package com.servlet;

import com.Dao.INewDAO;
import com.alibaba.fastjson.JSON;
import com.mpl.NewsImpl;
import org.junit.Test;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/getnews")
public class GetNews extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        INewDAO iNewDAO = new NewsImpl();
        HttpSession session = req.getSession();
        PrintWriter pw = resp.getWriter();
        try {
            List list = iNewDAO.getNews();
            session.setAttribute("news",list);
                String str = JSON.toJSONString(list);
//                pw.write(str);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
