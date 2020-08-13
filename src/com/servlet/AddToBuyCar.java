package com.servlet;

import com.Dao.IBuyCarDAO;
import com.mpl.BuyCarImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/addtobuycar")
public class AddToBuyCar extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uid = req.getParameter("uid");
        String pid = req.getParameter("pid");
        String number = req.getParameter("number");
        System.out.println(uid);
        System.out.println(pid);
        if (Integer.parseInt(uid) == -1) req.getRequestDispatcher("login.jsp").forward(req,resp);
        IBuyCarDAO iBuyCarDAO = new BuyCarImpl();
        try {
            if (number == null)iBuyCarDAO.howAdd(Integer.parseInt(uid),Integer.parseInt(pid),1);
            else iBuyCarDAO.howAdd(Integer.parseInt(uid),Integer.parseInt(pid),Integer.parseInt(number));
            resp.sendRedirect("CategoryList.jsp");
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uid = req.getParameter("uid");
        String pid = req.getParameter("pid");
        int number = Integer.parseInt(req.getParameter("number"));
        IBuyCarDAO iBuyCarDAO = new BuyCarImpl();
        try {
            iBuyCarDAO.howAdd(Integer.parseInt(uid),Integer.parseInt(pid),number);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
