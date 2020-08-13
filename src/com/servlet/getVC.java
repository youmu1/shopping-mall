package com.servlet;

import com.Dao.IUserDAO;
import com.pojo.Vc;
import com.Util.VCEmail;
import com.alibaba.fastjson.JSON;
import com.mpl.UserImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet("/getvc")
public class getVC extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String email = req.getParameter("email");
        IUserDAO iu = new UserImpl();
        PrintWriter pw = resp.getWriter();
        Vc v = new Vc();
        try {
            if (iu.selectUsernameReturnEmail(username).equals(email)) {
                //发送验证码给Email，返回验证码的值
                int vc = VCEmail.sendEmail(email);
                v.setCode(200);
                v.setVC(vc);
                String ret = JSON.toJSONString(v);
                pw.write(ret);
            }else {
                v.setCode(100);
                v.setVC(0);
                String ret = JSON.toJSONString(v);
                pw.write(ret);
            }
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
