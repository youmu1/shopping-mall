<%--
  Created by IntelliJ IDEA.
  User: youmu
  Date: 2020/8/4
  Time: 15:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>录入商品</title>
</head>
<body>
<form method="post" enctype="multipart/form-data" action="setproduct">
商品名：<input type="text" name="name" value="香奈儿邂逅清新淡香水50ml" id="name"><br />
简介：<input type="text" name="description" value="进入香奈儿的世界，流行稍纵即逝，唯有风格永存" id="description"><br />
单价：<input type="text" name="price" value="198" id="price"><br />
库存：<input type="text" name="stock" value="10000" id="stock"><br />
<select name="cate1" id='province' style="background:#FFF; color:#000;width:150px">
    <option value="1" selected>美妆，个人护理，洗护</option>
</select>
<select id='city' name="cate2" style="background:#FFF; color:#000;width:150px">
    <option value="1" selected>美妆</option>
</select>

<select id='company' name="cate3" style="background:#FFF; color:#000;width:150px">
    <option value="1" selected>香水</option>
</select><br>
图片：<input type="file" name="img"><br />
    <input type="submit" value="提交"><br />
</form>
</body>
</html>
