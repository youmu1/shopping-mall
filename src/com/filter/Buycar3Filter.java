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

@WebFilter(urlPatterns = "")
public class Buycar3Filter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        String uri = request.getRequestURI();
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
            request.getRequestDispatcher("login.jsp").forward(request,response);
            return;
        }
        else if (uri.equals("/buycar3")){
            filterChain.doFilter(request,response);
            return;
        }
        else {
            request.getRequestDispatcher("login.jsp").forward(request,response);
        }
    }


    @Override
    public void destroy() {

    }
}
