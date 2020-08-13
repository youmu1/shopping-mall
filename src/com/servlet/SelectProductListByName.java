package com.servlet;

import com.Dao.IProductDAO;
import com.alibaba.fastjson.JSON;
import com.mpl.ProductImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/selProduct")
public class SelectProductListByName extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        String name = req.getParameter("pname");
        System.out.println(name);
        ArrayList<Product> productArrayList ;

        HttpSession session = req.getSession();
        if (name == null)resp.sendRedirect("CategoryList.jsp");
        IProductDAO ip = new ProductImpl();
        try {
            productArrayList = (ArrayList<Product>) ip.selectByName(name);
            String str = JSON.toJSONString(productArrayList);
            System.out.println(str);
            session.setAttribute("namelist",productArrayList);
            req.getRequestDispatcher("CategoryList2.jsp").forward(req,resp);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
