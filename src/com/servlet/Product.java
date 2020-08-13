package com.servlet;

import com.Dao.IProductDAO;
import com.mpl.ProductImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/product")
public class Product extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        com.pojo.Product product;
        if (req.getParameter("pid")==null)resp.sendRedirect("CategoryList.jsp");
        int pid = Integer.parseInt(req.getParameter("pid"));
        HttpSession session = req.getSession();
        IProductDAO iProductDAO = new ProductImpl();
        try {
            product = iProductDAO.getIdProduct(pid);
            if (product.getName() == null) {
                resp.sendRedirect("CategoryList.jsp");
                return;
            }
            session.setAttribute("pro",product);
            req.getRequestDispatcher("Product.jsp").forward(req,resp);

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        com.pojo.Product product;
        if (req.getParameter("pid")==null)resp.sendRedirect("CategoryList.jsp");
        int pid = Integer.parseInt(req.getParameter("pid"));
        HttpSession session = req.getSession();
        IProductDAO iProductDAO = new ProductImpl();
        try {
            product = iProductDAO.getIdProduct(pid);
            session.setAttribute("pro",product);
            resp.sendRedirect("Product.jsp");
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

    }
}
