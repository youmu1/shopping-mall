package com.Util;

import com.sun.mail.util.MailSSLSocketFactory;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;
import java.util.Random;

public class VCEmail {
    static String username = "shenjiazhen.xyz@qq.com";
    static String password = "mjmduohlmxsihafj";
    static String host = "smtp.qq.com";
    static String protocal = "smtp";
    public static int sendEmail(String toEmai) {
        int i = (int) (new Random().nextDouble()*1000);
        String title = "一卖网";
        String text = "您的验证码为："+i;
        Properties properties  = new Properties();
        try {
            MailSSLSocketFactory mailSSLSocketFactory = new MailSSLSocketFactory();
            mailSSLSocketFactory.setTrustAllHosts(true);
            properties.put("mail.smtp.auth",true);
            properties.put("mail.smtp.ssl.enable",true);
//            properties.put("mail.smtp.socketFactory",true);
            properties.setProperty("mail.smtp.starttls.enable","true");
            properties.setProperty("mail.smtp.auth", "true");//开启认证
            properties.setProperty("mail.debug", "true");//启用调试
            properties.setProperty("mail.smtp.timeout", "1000");//设置链接超时
            properties.setProperty("mail.smtp.port", "587");//设置端口
            properties.setProperty("mail.smtp.socketFactory.port", "587");//设置ssl端口
            properties.setProperty("mail.smtp.socketFactory.fallback", "false");
            properties.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

            Session session = Session.getDefaultInstance(properties);
            MimeMessage mimeMessage = new MimeMessage(session);
            mimeMessage.setFrom(new InternetAddress(username));
            mimeMessage.setRecipients(Message.RecipientType.TO,toEmai);
            mimeMessage.setSubject(title);
            mimeMessage.setText(text,"utf-8");
            Transport transport = session.getTransport(protocal);
            transport.connect(host,username,password);


            transport.sendMessage(mimeMessage,mimeMessage.getAllRecipients());
            return  i;
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            return i;
        }
    }
    public static Boolean sendVerificationCode (String toEmai) {
        int i = (int) (new Random().nextDouble()*1000);
        String title = "一卖网客户下的订单";
        String text = "您的验证码为："+i;
        Properties properties  = new Properties();
        try {
            MailSSLSocketFactory mailSSLSocketFactory = new MailSSLSocketFactory();
            mailSSLSocketFactory.setTrustAllHosts(true);
            properties.put("mail.smtp.auth",true);
            properties.put("mail.smtp.ssl.enable",true);
            properties.put("mail.smtp.socketFactory",true);

            properties.setProperty("mail.smtp.auth", "true");//开启认证
            properties.setProperty("mail.debug", "true");//启用调试
            properties.setProperty("mail.smtp.timeout", "1000");//设置链接超时
            properties.setProperty("mail.smtp.port", "465");//设置端口
            properties.setProperty("mail.smtp.socketFactory.port", "465");//设置ssl端口
            properties.setProperty("mail.smtp.socketFactory.fallback", "false");
            properties.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

            Session session = Session.getDefaultInstance(properties);
            MimeMessage mimeMessage = new MimeMessage(session);
            mimeMessage.setFrom(new InternetAddress(username));
            mimeMessage.setRecipients(Message.RecipientType.TO,toEmai);
            mimeMessage.setSubject(title);
            mimeMessage.setText(text,"utf-8");
            Transport transport = session.getTransport(protocal);
            transport.connect(host,username,password);
            transport.sendMessage(mimeMessage,mimeMessage.getAllRecipients());
            return  true;
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            return false;
        }

    }

}
