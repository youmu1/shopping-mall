package com.listener;

import com.Dao.IBuyCarDAO;
import com.pojo.BuyCar;
import com.mpl.BuyCarImpl;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import java.util.ArrayList;

@WebListener
public class BuyCarSessionListener implements HttpSessionListener{
    @Override
    public void sessionCreated(HttpSessionEvent httpSessionEvent) {
    }
    @Override
    public void sessionDestroyed(HttpSessionEvent httpSessionEvent) {
        IBuyCarDAO ib = new BuyCarImpl();
        HttpSession session = httpSessionEvent.getSession();
        ArrayList<BuyCar> buyCarArrayList;
        if (session.getAttribute("buycarlist")!=null) {
            buyCarArrayList = (ArrayList<BuyCar>) session.getAttribute("buycarlist");
            ib.allAdd(buyCarArrayList);
        }
    }
}
