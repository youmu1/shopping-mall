package com.servlet;

import com.pojo.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/loseLogin")
public class loseLogin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Cookie cookie = new Cookie("username",null);
        Cookie cookie2 = new Cookie("uid",null);
        HttpSession session = req.getSession();
        User user = new User();
        user.setId(-1);
        cookie.setMaxAge(0);
        cookie2.setMaxAge(0);
        resp.addCookie(cookie);
        resp.addCookie(cookie2);
        session.setAttribute("user",user);
        resp.sendRedirect("login.jsp");
    }

}
