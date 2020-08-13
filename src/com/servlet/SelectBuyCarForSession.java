package com.servlet;

import com.Dao.IBuyCarDAO;
import com.pojo.BuyCar;
import com.alibaba.fastjson.JSON;
import com.mpl.BuyCarImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

public class SelectBuyCarForSession extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int uid = Integer.parseInt(req.getParameter("uid"));
        int pid = Integer.parseInt(req.getParameter("pid"));
        if (uid == -1)resp.sendRedirect("login.jsp");
        int number = Integer.parseInt(req.getParameter("number"));
        resp.setCharacterEncoding("utf-8");
        PrintWriter pw = resp.getWriter();
        HttpSession session = req.getSession();
        ArrayList<BuyCar> buyCarArrayList = null;
        ArrayList<BuyCar> buyCarArrayList2 = new ArrayList<>();
        IBuyCarDAO iBuyCarDAO = new BuyCarImpl();
        synchronized (this) {
            try {
                if (session.getAttribute("buycarlist") == null) {
                    buyCarArrayList = (ArrayList<BuyCar>) iBuyCarDAO.selectProduct(uid);
                } else {
                    buyCarArrayList = (ArrayList<BuyCar>) session.getAttribute("buycarlist");
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (buyCarArrayList != null) {
                    session.setAttribute("buycarlist", buyCarArrayList);
                    String str = JSON.toJSONString(buyCarArrayList);
                    pw.write(str);
                }
            }
        }
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }
}
