package com.servlet;

import com.Dao.IBuyCarDAO;
import com.pojo.BuyCar;
import com.alibaba.fastjson.JSON;
import com.mpl.BuyCarImpl;

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
import java.util.List;

@WebServlet("/getbuecarlist")
public class GetBuyCarList extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uid = req.getParameter("uid");
        if (Integer.parseInt(uid) == -1)resp.sendRedirect("login.jsp");
        ArrayList<BuyCar> arrayList;
        HttpSession session = req.getSession();
        resp.setCharacterEncoding("utf-8");
        IBuyCarDAO iBuyCarDAO = new BuyCarImpl();
        PrintWriter pw = resp.getWriter();
        try {
            arrayList = (ArrayList<BuyCar>) iBuyCarDAO.selectProduct(Integer.parseInt(uid));
            String str = JSON.toJSONString(arrayList);
            session.setAttribute("buycarlist",arrayList);
            pw.write(str);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String uid = req.getParameter("uid");
        List arrayList;
        HttpSession session = req.getSession();
        IBuyCarDAO iBuyCarDAO = new BuyCarImpl();
        try {
            arrayList = iBuyCarDAO.selectProduct(Integer.parseInt(uid));
            session.setAttribute("buycarlist",arrayList);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
