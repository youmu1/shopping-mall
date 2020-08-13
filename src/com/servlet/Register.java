package com.servlet;

import com.Dao.IUserDAO;
import com.pojo.User;
import com.mpl.UserImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/register")
public class Register extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        IUserDAO iUserDAO = new UserImpl();
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String password1 = req.getParameter("password1");
        if (!password.equals(password1)) {
            resp.sendRedirect("Regist.jsp");
            return;
        }
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
//        String idcard = req.getParameter("idcard");
        int sex = 1;
        User user = new User(0,username,password,sex,"",email,phone,0);
        try {
        if (!iUserDAO.isNewName(username)) {
            resp.sendRedirect("Regist.jsp");
            return;
        }
            iUserDAO.setUser(user);
            resp.sendRedirect("login.jsp");
        } catch (Exception throwables) {
            throwables.printStackTrace();
        }
    }
}
