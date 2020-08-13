<%@ page import="com.pojo.Order" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: youmu
  Date: 2020/8/8
  Time: 10:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>我的订单</title>
</head>
<body>
<%
    Boolean isLogin = false;//表示是否登录
    HttpSession httpSession =request.getSession();
    String username = null;
    ArrayList<Order> arrayList = (ArrayList<Order>) httpSession.getAttribute("myorder");
    int uid = -1;
    Boolean flag = false;
    for (Cookie cookie:request.getCookies()) {
        if (cookie.getName().equals("username")){
            username = cookie.getValue();
        }
        if (cookie.getName().equals("uid")){
            uid = Integer.parseInt(cookie.getValue());
        }
    }
%>
<table border="1">
    <tr>
        <td>订单号</td>
        <td>商品名</td>
        <td>单价</td>
        <td>数量</td>
        <td>总价</td>
        <td>收货人姓名</td>
        <td>电话</td>
        <td>邮箱</td>
        <td>送货地址</td>
    </tr>
 <c:forEach  var="order" items="${myorder}" >
     <tr>
     <td>${order.id}</td>
     <td>${order.pname}</td>
     <td>${order.price}</td>
     <td>${order.number}</td>
     <td>${order.price * order.number}</td>
     <td>${order.username}</td>
     <td>${order.username}</td>
     <td>${order.email}</td>
     <td>${order.address}</td>
     </tr>
 </c:forEach>
</table>


</body>
</html>
