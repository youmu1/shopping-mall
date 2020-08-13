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

@WebServlet("/setnewnumberforbuycar")
public class SetNewNumberForBuyCar extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int uid = Integer.parseInt(req.getParameter("uid"));
        int pid = Integer.parseInt(req.getParameter("pid"));
        int number = Integer.parseInt(req.getParameter("number"));
        IBuyCarDAO ib = new BuyCarImpl();
        try {
            ib.setNewNumber(uid,pid,number);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

    }
}
