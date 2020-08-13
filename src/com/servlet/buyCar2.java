package com.servlet;

import com.Dao.IAddressDAO;
import com.Dao.IBuyCarDAO;
import com.pojo.Address;
import com.pojo.BuyCar;
import com.mpl.AddressImpl;
import com.mpl.BuyCarImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/buycar2")
public class buyCar2 extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getParameter("uid") == null)resp.sendRedirect("login.jsp");
        int uid = Integer.parseInt(req.getParameter("uid"));
        ArrayList<BuyCar> buyCarArrayList;
        ArrayList<Address> addressArrayList;
        HttpSession session = req.getSession();
        IBuyCarDAO ib = new BuyCarImpl();
        IAddressDAO ia = new AddressImpl();
        try {
            buyCarArrayList = (ArrayList<BuyCar>) ib.selectProduct(uid);
            addressArrayList = (ArrayList<Address>) ia.selAddress(uid);
            if (addressArrayList == null)resp.sendRedirect("address.jsp");
            if (buyCarArrayList.size() == 0)resp.sendRedirect("CategoryList.jsp");
            session.setAttribute("buycar",buyCarArrayList);
            session.setAttribute("addresslist",addressArrayList);
            resp.sendRedirect("BuyCar_Two.jsp");
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
