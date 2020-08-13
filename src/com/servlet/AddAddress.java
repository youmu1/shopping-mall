package com.servlet;

import com.Dao.IAddressDAO;
import com.pojo.Address;
import com.alibaba.fastjson.JSON;
import com.mpl.AddressImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/addaddress")
public class AddAddress extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Address a = null;
        ArrayList<Address> addressArrayList;
        resp.setCharacterEncoding("utf-8");
        PrintWriter printWriter = resp.getWriter();
        int uid = Integer.parseInt(req.getParameter("uid"));
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String address1 = req.getParameter("address");
        int postal = Integer.parseInt(req.getParameter("postal"));
        String tel = req.getParameter("tel");
        String time = req.getParameter("time");
        Address address = new Address();
        address.setUid(uid);
        address.setName(name);
        address.setEmail(email);
        address.setAddress(address1);
        address.setPost(postal);
        address.setTel(tel);
        address.setTime(time);
        IAddressDAO ia = new AddressImpl();
        try {
            ia.addAddress(address);
            addressArrayList = (ArrayList<Address>) ia.selAddress(uid);
            a = addressArrayList.get(0);
            String str = JSON.toJSONString(a);
            printWriter.write(str);
//            resp.sendRedirect("buycar2");
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }


    }
}
