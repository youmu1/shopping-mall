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
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/getproductlist")
public class GetProductList extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ArrayList<ProductImpl> arrayList;
        int index =Integer.parseInt(req.getParameter("index"));
//      resp.setCharacterEncoding("GBK");
        PrintWriter printWriter = resp.getWriter();
        HttpSession session = req.getSession();
        IProductDAO iProductDAO = new ProductImpl();
//        System.out.println(index);
        try {
            arrayList =(ArrayList<ProductImpl>) iProductDAO.getSomeProduct(index);
            double d = Math.ceil(1.0*iProductDAO.howManyPage()/20);
            int page = (int)d;
            String list = JSON.toJSONString(arrayList);
                        //            printWriter.write(list);
            session.setAttribute("page",String.valueOf(page));
            session.setAttribute("ProductList",arrayList);

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ArrayList<ProductImpl> arrayList;
        int index =Integer.parseInt(req.getParameter("index"));
//      resp.setCharacterEncoding("GBK");
        resp.setCharacterEncoding("UTF-8");
        PrintWriter printWriter = resp.getWriter();
        HttpSession session = req.getSession();
        IProductDAO iProductDAO = new ProductImpl();
        try {
            int page = (int) Math.ceil(iProductDAO.howManyPage()/20);
            session.setAttribute("page",page);
            arrayList =(ArrayList<ProductImpl>) iProductDAO.getSomeProduct(index);
            String list = JSON.toJSONString(arrayList);
            System.out.println(list);
            printWriter.write(list);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
