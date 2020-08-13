package com.servlet;

import com.Dao.IAddressDAO;
import com.Dao.IBuyCarDAO;
import com.Dao.IOrderDAO;
import com.Dao.IProductDAO;
import com.pojo.*;
import com.mpl.AddressImpl;
import com.mpl.BuyCarImpl;
import com.mpl.OrderImpl;
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
import java.util.UUID;

@WebServlet("/buycar3")
public class BuyCar3 extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int uid = Integer.parseInt(req.getParameter("uid"));
        ArrayList <Address> addressArrayList;
        Address address;
        Order order =null;
        HttpSession session = req.getSession();
        Show3 show3 = new Show3();
        String ssid = UUID.randomUUID().toString();
        int sum = 0;
        ArrayList<BuyCar> buyCarsArrayList;
        String whatPay = req.getParameter("whatpay");
        String whatsong = req.getParameter("whatsong");
        IProductDAO ip = new ProductImpl();
        IBuyCarDAO ib = new BuyCarImpl();
        IAddressDAO ia = new AddressImpl();
        IOrderDAO io = new OrderImpl();
        try {
            buyCarsArrayList = (ArrayList<BuyCar>) ib.selectProduct(uid);
            addressArrayList = (ArrayList<Address>) ia.selAddress(uid);
            address = addressArrayList.get(0);
            if (address == null) {
                resp.sendRedirect("address.jsp");
            }
            if (buyCarsArrayList == null)resp.sendRedirect("CategoryList.jsp");
            for (BuyCar b:buyCarsArrayList) {
                if (ip.getProductNumber(b.getPid())-b.getNumber() < 0) {
                    session.setAttribute("nonumberproduct",ip.getIdProduct(b.getPid()));
                    req.getRequestDispatcher("understock.jsp").forward(req,resp);
                    return;
                } else {
                    ip.setProductNumber(b.getPid(),ip.getProductNumber(b.getPid())-b.getNumber());
                    if (ip.getProductNumber(b.getPid()) == 0)ip.deleteProduct(b.getPid());
                }
                order = new Order();
                order.setId(ssid);
                order.setUid(uid);
                order.setPid(b.getPid());
                order.setPname(b.getName());
                order.setPrice(b.getPrice());
                order.setNumber(b.getNumber());
                order.setUsername(address.getName());
                order.setTel(address.getTel());
                order.setEmail(address.getEmail());
                order.setAddress(address.getAddress());
                order.setPostal(address.getPost());
                order.setExpress(address.getExpress());
                io.addOrder(order);
                sum = sum + (b.getNumber()*b.getPrice())+15;
            }
            show3.setId(ssid);
            show3.setMoney(String.valueOf(sum));
            show3.setPeisong(whatsong);
            show3.setWhatpay(whatPay);
            ib.delAllProduct(uid);
            session.setAttribute("show",show3);
            resp.sendRedirect("BuyCar_Three.jsp");
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
