package com.filter;

import com.pojo.Address;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

@WebFilter(urlPatterns = "")
public class BuyTwoFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        ArrayList<Address> arrayList = (ArrayList<Address>) request.getSession().getAttribute("addresslist");
        if (arrayList.size()>0){
            filterChain.doFilter(servletRequest,servletResponse);
            return;
        }else {

        }
    }

    @Override
    public void destroy() {

    }
}
