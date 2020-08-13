package com.servlet;

import com.Dao.IBuyCarDAO;
import com.pojo.BuyCar;
import com.mpl.BuyCarImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/getallmoney")
public class GetMoney extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int sum = 0;
        String uid = req.getParameter("uid");
        ArrayList<BuyCar> arrayList;
        resp.setHeader("Content-Type", "text/html;charset=UTF-8");
        resp.setContentType("text/html;charset=UTF-8");
        IBuyCarDAO iBuyCarDAO = new BuyCarImpl();
        PrintWriter pw = resp.getWriter();
        try {
            arrayList = (ArrayList<BuyCar>) iBuyCarDAO.selectProduct(Integer.parseInt(uid));
            for (BuyCar buyCar:arrayList) {
                sum = sum + (buyCar.getNumber()*buyCar.getPrice());
            }
                pw.write(String.valueOf(sum));
            System.out.println(sum);
            sum = 0;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

    }
}
