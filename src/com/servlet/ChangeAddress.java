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

@WebServlet("/changeAddress")
public class ChangeAddress extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Address address1 = new Address();
        IAddressDAO ia = new AddressImpl();
        ArrayList<Address> addressArrayList;
        PrintWriter pw = resp.getWriter();
        int aid = Integer.parseInt(req.getParameter("aid"));
        int uid = Integer.parseInt(req.getParameter("uid"));
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String address = req.getParameter("address");
        int post = Integer.parseInt(req.getParameter("post"));
        String tel = req.getParameter("tel");
        String time = req.getParameter("time");
        address1.setId(aid);
        address1.setUid(uid);
        address1.setTime(time);
        address1.setPost(post);
        address1.setAddress(address);
        address1.setName(name);
        address1.setEmail(email);
        address1.setTel(tel);
        address1.setExpress("yunda");
        try {
            ia.updateAddress(address1);
            addressArrayList = (ArrayList<Address>) ia.selAddress(uid);
            address1 = addressArrayList.get(0);
            String str = JSON.toJSONString(address1);
            pw.write(str);
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
