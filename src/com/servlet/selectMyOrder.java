package com.servlet;

import com.Dao.IOrderDAO;
import com.pojo.Order;
import com.mpl.OrderImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/selectmyorder")
public class selectMyOrder extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uid = null;
        ArrayList<Order> orderArrayList;
        IOrderDAO io = new OrderImpl();
        HttpSession session = req.getSession();
        for (Cookie cookie : req.getCookies()) {
            if (cookie.getName().equals("uid")){
                uid = cookie.getValue();
            }
        }
        if (uid != null) {
            try {
                orderArrayList = (ArrayList<Order>) io.selectMyOrderList(uid);
                session.setAttribute("myorder",orderArrayList);
                req.getRequestDispatcher("myorder.jsp").forward(req,resp);
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
        }else {
            resp.sendRedirect("login.jsp");
        }


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
