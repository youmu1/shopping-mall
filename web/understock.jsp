<%@ page import="com.pojo.Product" %><%--
  Created by IntelliJ IDEA.
  User: youmu
  Date: 2020/8/10
  Time: 14:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <%
        String username = null;

        int uid = -1;
        Boolean flag = false;
        Product p = new Product();
        HttpSession session1 = null;
        if (request.getCookies()!=null){
            for (Cookie cookie:request.getCookies()) {
                if (cookie.getName().equals("username")){
                    username = cookie.getValue();
                }
                if (cookie.getName().equals("uid")){
                    uid = Integer.parseInt(cookie.getValue());
                }
            }
        }
//        if (username == null)response.sendRedirect("index.jsp");
        session1 = request.getSession();
        if (session1.getAttribute("nonumberproduct") != null) {
            p = (Product) session1.getAttribute("nonumberproduct");
        }
    %>
<head>
    <title>库存不足</title>
</head>
<body>
<h2>商品"<%=p.getName()%>"的库存不足，您提交的订单无效，我们最多能卖给您<%=p.getStock()%>件这个商品，点击<a href="BuyCar.jsp">去购物车修改数量</a>。</h2>
</body>
</html>
