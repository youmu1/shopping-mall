package com.filter;

import com.Dao.IUserDAO;
import com.pojo.User;
import com.mpl.UserImpl;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(urlPatterns = {"/BuyCar.jsp","/BuyCar_Two.jsp","/myorder.jsp"})
public class LoginFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        String uid = null;
        User user = new User();
        HttpSession session = request.getSession();
        IUserDAO iUserDAO = new UserImpl();
        for (Cookie cookie : request.getCookies()) {
            if (cookie.getName().equals("uid")){
                uid = cookie.getValue();
            }
        }

        if (uid == null) {
            response.sendRedirect("login.jsp");
            return;
        }else {
            filterChain.doFilter(request,response);
            return;
        }
    }
    @Override
    public void destroy() {

    }
}
