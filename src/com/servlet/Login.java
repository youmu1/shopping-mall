package com.servlet;

import com.Dao.IUserDAO;
import com.pojo.User;
import com.mpl.UserImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/login")
public class Login extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        User user = new User();
        HttpSession session = req.getSession();
        user.setUsername(username);
        user.setPassword(password);
        IUserDAO iUserDAO = new UserImpl();
        Cookie cookie1;
        Cookie cookie2;
        Cookie idcookie;
        try {
            user = iUserDAO.isMyUserq(user);
            if (user.getId()!=0) {
                cookie1= new Cookie("username",user.getUsername());
                idcookie = new Cookie("uid",String.valueOf(user.getId()));
                resp.addCookie(cookie1);
                resp.addCookie(idcookie);
                session.setAttribute("user",user);
                resp.sendRedirect("index.jsp");
            }else {
                req.getRequestDispatcher("login.jsp").forward(req,resp);
            }
        } catch (Exception throwables) {
            throwables.printStackTrace();
        }
    }
}
