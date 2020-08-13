<%@ page import="com.pojo.Product" %>
<%@ page import="com.pojo.User" %>

<%--
  Created by IntelliJ IDEA.
  User: youmu
  Date: 2020/8/3
  Time: 9:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <%
        String username = null;
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
        HttpSession session1 = request.getSession();
        Product product = new Product();
        if (session1.getAttribute("pro")!=null) {
            product=(Product) session1.getAttribute("pro");
        }
    %>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link type="text/css" rel="stylesheet" href="css/style.css" />
    <script type="text/javascript" src="js/jquery-3.5.1.js"></script>
    <!--[if IE 6]>
    <script src="js/iepng.js" type="text/javascript"></script>
    <script type="text/javascript">
        EvPNG.fix('div, ul, img, li, input, a');
    </script>
    <![endif]-->

    <script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="js/menu.js"></script>
    <script type="text/javascript" src="js/lrscroll_1.js"></script>


    <script type="text/javascript" src="js/n_nav.js"></script>

    <link rel="stylesheet" type="text/css" href="css/ShopShow.css" />
    <link rel="stylesheet" type="text/css" href="css/MagicZoom.css" />
    <script type="text/javascript" src="js/MagicZoom.js"></script>

    <script type="text/javascript" src="js/num.js">
        var jq = jQuery.noConflict();
    </script>

    <script type="text/javascript" src="js/p_tab.js"></script>

    <script type="text/javascript" src="js/shade.js"></script>

    <title>尤洪</title>
</head>
<body>
<!--Begin Header Begin-->
<div class="soubg">
    <div class="sou">
        <!--Begin 所在收货地区 Begin-->
        <span class="s_city_b">
        	<span class="fl">送货至：</span>
            <span class="s_city">
            	<span>四川</span>
                <div class="s_city_bg">
                	<div class="s_city_t"></div>
                    <div class="s_city_c">
                    	<h2>请选择所在的收货地区</h2>
                        <table border="0" class="c_tab" style="width:235px; margin-top:10px;" cellspacing="0" cellpadding="0">
                          <tr>
                            <th>A</th>
                            <td class="c_h"><span>安徽</span><span>澳门</span></td>
                          </tr>
                          <tr>
                            <th>B</th>
                            <td class="c_h"><span>北京</span></td>
                          </tr>
                          <tr>
                            <th>C</th>
                            <td class="c_h"><span>重庆</span></td>
                          </tr>
                          <tr>
                            <th>F</th>
                            <td class="c_h"><span>福建</span></td>
                          </tr>
                          <tr>
                            <th>G</th>
                            <td class="c_h"><span>广东</span><span>广西</span><span>贵州</span><span>甘肃</span></td>
                          </tr>
                          <tr>
                            <th>H</th>
                            <td class="c_h"><span>河北</span><span>河南</span><span>黑龙江</span><span>海南</span><span>湖北</span><span>湖南</span></td>
                          </tr>
                          <tr>
                            <th>J</th>
                            <td class="c_h"><span>江苏</span><span>吉林</span><span>江西</span></td>
                          </tr>
                          <tr>
                            <th>L</th>
                            <td class="c_h"><span>辽宁</span></td>
                          </tr>
                          <tr>
                            <th>N</th>
                            <td class="c_h"><span>内蒙古</span><span>宁夏</span></td>
                          </tr>
                          <tr>
                            <th>Q</th>
                            <td class="c_h"><span>青海</span></td>
                          </tr>
                          <tr>
                            <th>S</th>
                            <td class="c_h"><span>上海</span><span>山东</span><span>山西</span><span class="c_check">四川</span><span>陕西</span></td>
                          </tr>
                          <tr>
                            <th>T</th>
                            <td class="c_h"><span>台湾</span><span>天津</span></td>
                          </tr>
                          <tr>
                            <th>X</th>
                            <td class="c_h"><span>西藏</span><span>香港</span><span>新疆</span></td>
                          </tr>
                          <tr>
                            <th>Y</th>
                            <td class="c_h"><span>云南</span></td>
                          </tr>
                          <tr>
                            <th>Z</th>
                            <td class="c_h"><span>浙江</span></td>
                          </tr>
                        </table>
                    </div>
                </div>
            </span>
        </span>
        <!--End 所在收货地区 End-->
        <span class="fr">
        	<span class="fl">
              你好，
                <%

                    if ( username!=null) {
                        out.write(username+"<a href =\"loseLogin\" >"+"    "+"退出登录</a>");
                    }
                    else {
                        out.write("请<a href=\"login.jsp\">登录</a>&nbsp; <a href=\"Regist.jsp\" style=\"color:#ff4e00;\">免费注册</a>");
                    }
                %>&nbsp;|&nbsp;<a href="selectmyorder">我的订单</a>&nbsp;|
            </span>
        	<span class="ss">
            	<div class="ss_list">
                	<a href="#">收藏夹</a>
                    <div class="ss_list_bg">
                    	<div class="s_city_t"></div>
                        <div class="ss_list_c">
                        	<ul>
                            	<li><a href="#">我的收藏夹</a></li>
                                <li><a href="#">我的收藏夹</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="ss_list">
                	<a href="#">客户服务</a>
                    <div class="ss_list_bg">
                    	<div class="s_city_t"></div>
                        <div class="ss_list_c">
                        	<ul>
                            	<li><a href="#">客户服务</a></li>
                                <li><a href="#">客户服务</a></li>
                                <li><a href="#">客户服务</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="ss_list">
                	<a href="#">网站导航</a>
                    <div class="ss_list_bg">
                    	<div class="s_city_t"></div>
                        <div class="ss_list_c">
                        	<ul>
                            	<li><a href="#">网站导航</a></li>
                                <li><a href="#">网站导航</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </span>
            <span class="fl">|&nbsp;关注我们：</span>
            <span class="s_sh"><a href="#" class="sh1">新浪</a><a href="#" class="sh2">微信</a></span>
            <span class="fr">|&nbsp;<a href="#">手机版&nbsp;<img src="./images/s_tel.png" align="absmiddle" /></a></span>
        </span>
    </div>
</div>
<div class="top">
    <div class="logo"><a href="index.jsp"><img src="./images/logo.png" /></a></div>
    <div class="search">
        <form method="post" action="selProduct">
            <input type="text" value="" name="pname" class="s_ipt" />
            <input type="submit" value="搜索"  class="s_btn" />
        </form>
        <span class="fl"><a href="#">咖啡</a><a href="#">iphone 6S</a><a href="#">新鲜美食</a><a href="#">蛋糕</a><a href="#">日用品</a><a href="#">连衣裙</a></span>
    </div>



    <div class="i_car">
        <div class="car_t">购物车</div>
        <div class="car_bg">

            <%
                if (username==null) {
                    out.write("            <div class=\"un_login\">还未登录！<a href=\"login.jsp\" style=\"color:#ff4e00;\">马上登录</a> 查看购物车！</div>\n");
                }
            %>
            <ul id="carlist" class="cars">

            </ul>
            <div class="price_sum" style="display: none">共计: <font color="#ff4e00">￥</font><span class="sum">0</span></div>
            <div class="price_a"  style="display: none"><a id="gotoB" href="#">去购物车结算</a></div>
            <!--End 购物车已登录 End-->
        </div>
    </div>

</div>
<div style="display: none" id="userid" class="userid"><%=uid%></div>
<script>
    $(function () {
        $(".i_car").click(function () {
            sum = 0;
            var carlist = $("#carlist");
            $("#carlist li").remove();
            $.ajax({
                url: "getbuecarlist",
                data: "uid="+$("#userid").text(),
                method: "get",
                success:function (listdata) {
                    var obj = JSON.parse(listdata);
                    for(var i = 0;obj.length>i;i++) {
                        carlist.append("<li><div class=\"img\"><a href=\"#\"><img src=\"./images/"+obj[i].filename+"\"width=\"58\" height=\"58\" /></a></div><div class=\"name\"><a href=\"#\">"+obj[i].name+"</a></div><div class=\"price\"><font color=\"#ff4e00\">￥"+obj[i].price+"</font> X"+obj[i].number+"</div></li>");
                        sum =sum +(obj[i].number*obj[i].price);
                    }
                    $(".sum").html(sum);
                    // if(parseInt($("#sum").text()) != 0) {
                        $('.price_sum').attr({
                            "style" : ""
                        });
                        $('.price_a').attr({
                            "style" : ""
                        });
                        $('#gotoB').attr({
                            "href" : "BuyCar.jsp"
                        });
                    // }else {
                    //     carlist.append("<li><img src=\"./images/1597128997822.gif\"></li>");
                    // }
                }
            })
        })
    })
</script>



<!--End Header End-->
<!--Begin Menu Begin-->
<div id="gwc"></div>
<div class="menu_bg">
    <div class="menu">
        <!--Begin 商品分类详情 Begin-->
        <div class="nav">
            <div class="nav_t">全部商品分类</div>
            <div class="leftNav none">
                <ul>
                    <li>
                        <div class="fj">
                            <span class="n_img"><span></span><img src="./images/nav1.png" /></span>
                            <span class="fl">进口食品、生鲜</span>
                        </div>
                        <div class="zj">
                            <div class="zj_l">
                                <div class="zj_l_c">
                                    <h2>零食 / 糖果 / 巧克力</h2>
                                    <a href="#">坚果</a>|<a href="#">蜜饯</a>|<a href="#">红枣</a>|<a href="#">牛肉干</a>|<a href="#">巧克力</a>|
                                    <a href="#">口香糖</a>|<a href="#">海苔</a>|<a href="#">鱼干</a>|<a href="#">蜜饯</a>|<a href="#">红枣</a>|
                                    <a href="#">蜜饯</a>|<a href="#">红枣</a>|<a href="#">牛肉干</a>|<a href="#">蜜饯</a>|
                                </div>
                                <div class="zj_l_c">
                                    <h2>零食 / 糖果 / 巧克力</h2>
                                    <a href="#">坚果</a>|<a href="#">蜜饯</a>|<a href="#">红枣</a>|<a href="#">牛肉干</a>|<a href="#">巧克力</a>|
                                    <a href="#">口香糖</a>|<a href="#">海苔</a>|<a href="#">鱼干</a>|<a href="#">蜜饯</a>|<a href="#">红枣</a>|
                                    <a href="#">蜜饯</a>|<a href="#">红枣</a>|<a href="#">牛肉干</a>|<a href="#">蜜饯</a>|
                                </div>
                                <div class="zj_l_c">
                                    <h2>零食 / 糖果 / 巧克力</h2>
                                    <a href="#">坚果</a>|<a href="#">蜜饯</a>|<a href="#">红枣</a>|<a href="#">牛肉干</a>|<a href="#">巧克力</a>|
                                    <a href="#">口香糖</a>|<a href="#">海苔</a>|<a href="#">鱼干</a>|<a href="#">蜜饯</a>|<a href="#">红枣</a>|
                                    <a href="#">蜜饯</a>|<a href="#">红枣</a>|<a href="#">牛肉干</a>|<a href="#">蜜饯</a>|
                                </div>
                                <div class="zj_l_c">
                                    <h2>零食 / 糖果 / 巧克力</h2>
                                    <a href="#">坚果</a>|<a href="#">蜜饯</a>|<a href="#">红枣</a>|<a href="#">牛肉干</a>|<a href="#">巧克力</a>|
                                    <a href="#">口香糖</a>|<a href="#">海苔</a>|<a href="#">鱼干</a>|<a href="#">蜜饯</a>|<a href="#">红枣</a>|
                                    <a href="#">蜜饯</a>|<a href="#">红枣</a>|<a href="#">牛肉干</a>|<a href="#">蜜饯</a>|
                                </div>
                                <div class="zj_l_c">
                                    <h2>零食 / 糖果 / 巧克力</h2>
                                    <a href="#">坚果</a>|<a href="#">蜜饯</a>|<a href="#">红枣</a>|<a href="#">牛肉干</a>|<a href="#">巧克力</a>|
                                    <a href="#">口香糖</a>|<a href="#">海苔</a>|<a href="#">鱼干</a>|<a href="#">蜜饯</a>|<a href="#">红枣</a>|
                                    <a href="#">蜜饯</a>|<a href="#">红枣</a>|<a href="#">牛肉干</a>|<a href="#">蜜饯</a>|
                                </div>
                                <div class="zj_l_c">
                                    <h2>零食 / 糖果 / 巧克力</h2>
                                    <a href="#">坚果</a>|<a href="#">蜜饯</a>|<a href="#">红枣</a>|<a href="#">牛肉干</a>|<a href="#">巧克力</a>|
                                    <a href="#">口香糖</a>|<a href="#">海苔</a>|<a href="#">鱼干</a>|<a href="#">蜜饯</a>|<a href="#">红枣</a>|
                                    <a href="#">蜜饯</a>|<a href="#">红枣</a>|<a href="#">牛肉干</a>|<a href="#">蜜饯</a>|
                                </div>
                            </div>
                            <div class="zj_r">
                                <a href="#"><img src="./images/n_img1.jpg" width="236" height="200" /></a>
                                <a href="#"><img src="./images/n_img2.jpg" width="236" height="200" /></a>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="fj">
                            <span class="n_img"><span></span><img src="./images/nav2.png" /></span>
                            <span class="fl">食品、饮料、酒</span>
                        </div>
                        <div class="zj" style="top:-40px;">
                            <div class="zj_l">
                                <div class="zj_l_c">
                                    <h2>零食 / 糖果 / 巧克力2</h2>
                                    <a href="#">坚果</a>|<a href="#">蜜饯</a>|<a href="#">红枣</a>|<a href="#">牛肉干</a>|<a href="#">巧克力</a>|
                                    <a href="#">口香糖</a>|<a href="#">海苔</a>|<a href="#">鱼干</a>|<a href="#">蜜饯</a>|<a href="#">红枣</a>|
                                    <a href="#">蜜饯</a>|<a href="#">红枣</a>|<a href="#">牛肉干</a>|<a href="#">蜜饯</a>|
                                </div>
                                <div class="zj_l_c">
                                    <h2>零食 / 糖果 / 巧克力</h2>
                                    <a href="#">坚果</a>|<a href="#">蜜饯</a>|<a href="#">红枣</a>|<a href="#">牛肉干</a>|<a href="#">巧克力</a>|
                                    <a href="#">口香糖</a>|<a href="#">海苔</a>|<a href="#">鱼干</a>|<a href="#">蜜饯</a>|<a href="#">红枣</a>|
                                    <a href="#">蜜饯</a>|<a href="#">红枣</a>|<a href="#">牛肉干</a>|<a href="#">蜜饯</a>|
                                </div>
                            </div>
                            <div class="zj_r">
                                <a href="#"><img src="./images/n_img1.jpg" width="236" height="200" /></a>
                                <a href="#"><img src="./images/n_img2.jpg" width="236" height="200" /></a>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="fj">
                            <span class="n_img"><span></span><img src="./images/nav3.png" /></span>
                            <span class="fl">母婴、玩具、童装</span>
                        </div>
                        <div class="zj" style="top:-80px;">
                            <div class="zj_l">
                                <div class="zj_l_c">
                                    <h2>零食 / 糖果 / 巧克力3</h2>
                                    <a href="#">坚果</a>|<a href="#">蜜饯</a>|<a href="#">红枣</a>|<a href="#">牛肉干</a>|<a href="#">巧克力</a>|
                                    <a href="#">口香糖</a>|<a href="#">海苔</a>|<a href="#">鱼干</a>|<a href="#">蜜饯</a>|<a href="#">红枣</a>|
                                    <a href="#">蜜饯</a>|<a href="#">红枣</a>|<a href="#">牛肉干</a>|<a href="#">蜜饯</a>|
                                </div>
                            </div>
                            <div class="zj_r">
                                <a href="#"><img src="./images/n_img1.jpg" width="236" height="200" /></a>
                                <a href="#"><img src="./images/n_img2.jpg" width="236" height="200" /></a>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="fj">
                            <span class="n_img"><span></span><img src="./images/nav4.png" /></span>
                            <span class="fl">家居、家庭清洁、纸品</span>
                        </div>
                        <div class="zj" style="top:-120px;">
                            <div class="zj_l">
                                <div class="zj_l_c">
                                    <h2>零食 / 糖果 / 巧克力4</h2>
                                    <a href="#">坚果</a>|<a href="#">蜜饯</a>|<a href="#">红枣</a>|<a href="#">牛肉干</a>|<a href="#">巧克力</a>|
                                    <a href="#">口香糖</a>|<a href="#">海苔</a>|<a href="#">鱼干</a>|<a href="#">蜜饯</a>|<a href="#">红枣</a>|
                                    <a href="#">蜜饯</a>|<a href="#">红枣</a>|<a href="#">牛肉干</a>|<a href="#">蜜饯</a>|
                                </div>
                            </div>
                            <div class="zj_r">
                                <a href="#"><img src="./images/n_img1.jpg" width="236" height="200" /></a>
                                <a href="#"><img src="./images/n_img2.jpg" width="236" height="200" /></a>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="fj">
                            <span class="n_img"><span></span><img src="./images/nav5.png" /></span>
                            <span class="fl">美妆、个人护理、洗护</span>
                        </div>
                        <div class="zj" style="top:-160px;">
                            <div class="zj_l">
                                <div class="zj_l_c">
                                    <h2>零食 / 糖果 / 巧克力5</h2>
                                    <a href="#">坚果</a>|<a href="#">蜜饯</a>|<a href="#">红枣</a>|<a href="#">牛肉干</a>|<a href="#">巧克力</a>|
                                    <a href="#">口香糖</a>|<a href="#">海苔</a>|<a href="#">鱼干</a>|<a href="#">蜜饯</a>|<a href="#">红枣</a>|
                                    <a href="#">蜜饯</a>|<a href="#">红枣</a>|<a href="#">牛肉干</a>|<a href="#">蜜饯</a>|
                                </div>
                            </div>
                            <div class="zj_r">
                                <a href="#"><img src="./images/n_img1.jpg" width="236" height="200" /></a>
                                <a href="#"><img src="./images/n_img2.jpg" width="236" height="200" /></a>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="fj">
                            <span class="n_img"><span></span><img src="./images/nav6.png" /></span>
                            <span class="fl">女装、内衣、中老年</span>
                        </div>
                        <div class="zj" style="top:-200px;">
                            <div class="zj_l">
                                <div class="zj_l_c">
                                    <h2>零食 / 糖果 / 巧克力6</h2>
                                    <a href="#">坚果</a>|<a href="#">蜜饯</a>|<a href="#">红枣</a>|<a href="#">牛肉干</a>|<a href="#">巧克力</a>|
                                    <a href="#">口香糖</a>|<a href="#">海苔</a>|<a href="#">鱼干</a>|<a href="#">蜜饯</a>|<a href="#">红枣</a>|
                                    <a href="#">蜜饯</a>|<a href="#">红枣</a>|<a href="#">牛肉干</a>|<a href="#">蜜饯</a>|
                                </div>
                            </div>
                            <div class="zj_r">
                                <a href="#"><img src="./images/n_img1.jpg" width="236" height="200" /></a>
                                <a href="#"><img src="./images/n_img2.jpg" width="236" height="200" /></a>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="fj">
                            <span class="n_img"><span></span><img src="./images/nav7.png" /></span>
                            <span class="fl">鞋靴、箱包、腕表配饰</span>
                        </div>
                        <div class="zj" style="top:-240px;">
                            <div class="zj_l">
                                <div class="zj_l_c">
                                    <h2>零食 / 糖果 / 巧克力7</h2>
                                    <a href="#">坚果</a>|<a href="#">蜜饯</a>|<a href="#">红枣</a>|<a href="#">牛肉干</a>|<a href="#">巧克力</a>|
                                    <a href="#">口香糖</a>|<a href="#">海苔</a>|<a href="#">鱼干</a>|<a href="#">蜜饯</a>|<a href="#">红枣</a>|
                                    <a href="#">蜜饯</a>|<a href="#">红枣</a>|<a href="#">牛肉干</a>|<a href="#">蜜饯</a>|
                                </div>
                            </div>
                            <div class="zj_r">
                                <a href="#"><img src="./images/n_img1.jpg" width="236" height="200" /></a>
                                <a href="#"><img src="./images/n_img2.jpg" width="236" height="200" /></a>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="fj">
                            <span class="n_img"><span></span><img src="./images/nav8.png" /></span>
                            <span class="fl">男装、运动</span>
                        </div>
                        <div class="zj" style="top:-280px;">
                            <div class="zj_l">
                                <div class="zj_l_c">
                                    <h2>零食 / 糖果 / 巧克力8</h2>
                                    <a href="#">坚果</a>|<a href="#">蜜饯</a>|<a href="#">红枣</a>|<a href="#">牛肉干</a>|<a href="#">巧克力</a>|
                                    <a href="#">口香糖</a>|<a href="#">海苔</a>|<a href="#">鱼干</a>|<a href="#">蜜饯</a>|<a href="#">红枣</a>|
                                    <a href="#">蜜饯</a>|<a href="#">红枣</a>|<a href="#">牛肉干</a>|<a href="#">蜜饯</a>|
                                </div>
                            </div>
                            <div class="zj_r">
                                <a href="#"><img src="./images/n_img1.jpg" width="236" height="200" /></a>
                                <a href="#"><img src="./images/n_img2.jpg" width="236" height="200" /></a>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="fj">
                            <span class="n_img"><span></span><img src="./images/nav9.png" /></span>
                            <span class="fl">手机、小家电、电脑</span>
                        </div>
                        <div class="zj" style="top:-320px;">
                            <div class="zj_l">
                                <div class="zj_l_c">
                                    <h2>零食 / 糖果 / 巧克力9</h2>
                                    <a href="#">坚果</a>|<a href="#">蜜饯</a>|<a href="#">红枣</a>|<a href="#">牛肉干</a>|<a href="#">巧克力</a>|
                                    <a href="#">口香糖</a>|<a href="#">海苔</a>|<a href="#">鱼干</a>|<a href="#">蜜饯</a>|<a href="#">红枣</a>|
                                    <a href="#">蜜饯</a>|<a href="#">红枣</a>|<a href="#">牛肉干</a>|<a href="#">蜜饯</a>|
                                </div>
                            </div>
                            <div class="zj_r">
                                <a href="#"><img src="./images/n_img1.jpg" width="236" height="200" /></a>
                                <a href="#"><img src="./images/n_img2.jpg" width="236" height="200" /></a>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="fj">
                            <span class="n_img"><span></span><img src="./images/nav10.png" /></span>
                            <span class="fl">礼品、充值</span>
                        </div>
                        <div class="zj" style="top:-360px;">
                            <div class="zj_l">
                                <div class="zj_l_c">
                                    <h2>零食 / 糖果 / 巧克力10</h2>
                                    <a href="#">坚果</a>|<a href="#">蜜饯</a>|<a href="#">红枣</a>|<a href="#">牛肉干</a>|<a href="#">巧克力</a>|
                                    <a href="#">口香糖</a>|<a href="#">海苔</a>|<a href="#">鱼干</a>|<a href="#">蜜饯</a>|<a href="#">红枣</a>|
                                    <a href="#">蜜饯</a>|<a href="#">红枣</a>|<a href="#">牛肉干</a>|<a href="#">蜜饯</a>|
                                </div>
                            </div>
                            <div class="zj_r">
                                <a href="#"><img src="./images/n_img1.jpg" width="236" height="200" /></a>
                                <a href="#"><img src="./images/n_img2.jpg" width="236" height="200" /></a>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <!--End 商品分类详情 End-->
        <ul class="menu_r">
            <li><a href="index.jsp">首页</a></li>
            <li><a href="Food.html">美食</a></li>
            <li><a href="Fresh.html">生鲜</a></li>
            <li><a href="HomeDecoration.html">家居</a></li>
            <li><a href="SuitDress.html">女装</a></li>
            <li><a href="CategoryList.jsp">美妆</a></li>
            <li><a href="Digital.html">数码</a></li>
            <li><a href="GroupBuying.html">团购</a></li>
        </ul>
        <div class="m_ad">中秋送好礼！</div>
    </div>
</div>
<!--End Menu End-->
<div class="i_bg">
    <div class="postion">
        <span class="fl">全部 > 美妆个护 > 香水 > 迪奥 > 迪奥真我香水</span>
    </div>
    <div class="content">

        <div id="tsShopContainer">
            <div id="tsImgS"><a href="./images/<%=product.getFileName()%>" title="./images" class="MagicZoom" id="MagicZoom"><img src="./images/<%=product.getFileName()%>" width="390" height="390" /></a></div>
            <div id="tsPicContainer">
                <div id="tsImgSArrL" onclick="tsScrollArrLeft()"></div>
                <div id="tsImgSCon">
                    <ul>
                        <li onclick="showPic(0)" rel="MagicZoom" class="tsSelectImg"><img src="./images/<%=product.getFileName()%>" tsImgS="./images/ps1.jpg" width="79" height="79" /></li>
                        <li onclick="showPic(1)" rel="MagicZoom"><img src="./images/ps2.jpg" tsImgS="./images/<%=product.getFileName()%>" width="79" height="79" /></li>
                        <li onclick="showPic(2)" rel="MagicZoom"><img src="./images/ps3.jpg" tsImgS="./images/<%=product.getFileName()%>" width="79" height="79" /></li>
                        <li onclick="showPic(3)" rel="MagicZoom"><img src="./images/ps4.jpg" tsImgS="./images/<%=product.getFileName()%>" width="79" height="79" /></li>
                        <li onclick="showPic(4)" rel="MagicZoom"><img src="./images/ps1.jpg" tsImgS="./images/<%=product.getFileName()%>" width="79" height="79" /></li>
                        <li onclick="showPic(5)" rel="MagicZoom"><img src="./images/ps2.jpg" tsImgS="./images/<%=product.getFileName()%>" width="79" height="79" /></li>
                        <li onclick="showPic(6)" rel="MagicZoom"><img src="./images/ps3.jpg" tsImgS="./images/<%=product.getFileName()%>" width="79" height="79" /></li>
                        <li onclick="showPic(7)" rel="MagicZoom"><img src="./images/ps4.jpg" tsImgS="./images/<%=product.getFileName()%>" width="79" height="79" /></li>
                    </ul>
                </div>
                <div id="tsImgSArrR" onclick="tsScrollArrRight()"></div>
            </div>
            <img class="MagicZoomLoading" width="16" height="16" src="./images/loading.gif" alt="Loading..." />
        </div>

        <div class="pro_des">
            <div class="des_name">
                <p><%=product.getName()%></p>
                <%=product.getDescription()%>
            </div>
            <div class="des_price">
                价格：￥<b id="price"><%=product.getPrice()%></b><br />
                库存：<span id="stock" class="stock"><%=product.getStock()%></span>
            </div>

            <div class="des_choice">
                <span class="fl">型号选择：</span>
                <ul>
                    <li class="checked">50ml<div class="ch_img"></div></li>
                </ul>
            </div>

            <div class="des_choice">
                <span class="fl">颜色选择：</span>
                <ul>
                    <li class="checked">灰色<div class="ch_img"></div></li>
                </ul>
            </div>
            <div class="des_share">
                <div class="d_sh">
                    分享
                    <div class="d_sh_bg">
                        <a href="#"><img src="./images/<%=product.getFileName()%>" /></a>
                        <a href="#"><img src="./images/<%=product.getFileName()%>" /></a>
                        <a href="#"><img src="./images/<%=product.getFileName()%>" /></a>
                        <a href="#"><img src="./images/<%=product.getFileName()%>" /></a>
                        <a href="#"><img src="./images/<%=product.getFileName()%>" /></a>
                    </div>
                </div>
                <div class="d_care"><a onclick="ShowDiv('MyDiv','fade')">关注商品</a></div>
            </div>
            <div class="des_join">
                <div class="j_nums">
                    <input type="text"  value="1" id="number" class="n_ipt" />
                    <input type="button" value=""  class="n_btn_1" />
                    <input type="button" value=""  class="n_btn_2" />
                </div>
                <span class="fl"><a id="addr" ><img src="./images/j_car.png" /></a></span>
            </div>
        </div>
        <div style="display: none" id="uid"><%=uid%></div>
        <div style="display: none" id="pid"><%=product.getId()%></div>
        <script type="text/javascript">
            $('.n_btn_1').click(function () {
                var max = $('#stock').text();
                var c = $('#number').val();
                var price = $('#price').text();
                c=parseInt(c)+1;
                if (c>parseInt(max)) {
                    alert("数量超过库存限制");
                    $('#number').val(parseInt(max));
                    return;
                }
                $('#number').val(c);
                $('#sum').val(price*c);
            });

            $('.n_btn_2').click(function () {
                var c = $('#number').val();
                var price = $('#price').text();
                if(c<=1){
                    c=1;
                }else{
                    c=parseInt(c)-1;
                    $('#number').val(c);
                    $('#sum').val(price*c);
                }
            })



            $('#number').blur(function () {
                var zz = /^(\+|-)?\d+$/;
                var uid = $("#uid").text();
                var pid = $("#pid").text();
                var number = $("#number").val();
                var data = $('#number').val();
                var max = parseInt($("#stock").text());
                if ((!zz.test(data) || data<1)) {
                    alert("输入不合法");
                    $('#number').val(1);
                    return;
                }
                if(parseInt(data) > max) {
                    $('#number').val(max);
                    return;
                }
            });
            $(function () {
                var add = 0;
                $("#addr").click(function () {
                    var uid = $("#uid").text();
                    var pid = $("#pid").text();
                    var stock = $("#stock").text();
                    var number = $("#number").val();
                    if (uid == null)return;
                    if (uid == -1) {
                        alert("请先登录");
                        return;
                    }
                    if (parseInt(stock) < parseInt(number)+add) {
                        alert("购物车中该商品数量超过了库存限制");
                        return;
                    }else {
                        add = add+parseInt(number);
                    }
                    $.ajax({
                        sync:false,
                        url:"addtobuycar",
                        data:{"uid":uid,"pid":pid,"number":number},
                        success:function () {
                            $.ajax({
                                sync: false,
                                url: "getallmoney",
                                data: "uid="+$("#userid").text(),
                                method: "post",
                                success:function (listdata) {
                                    $("#sum").html(listdata);
                                    ShowDiv_1('MyDiv1','fade1');
                                }
                            });
                        }
                    });

                });
            })
        </script>
        <div class="s_brand">
            <div class="s_brand_img"><img src="./images/sbrand.jpg" width="188" height="132" /></div>
            <div class="s_brand_c"><a href="#">进入品牌专区</a></div>
        </div>


    </div>
    <div class="content mar_20">
        <div class="l_history">
            <div class="fav_t">用户还喜欢</div>
            <ul>
                <li>
                    <div class="img"><a href="#"><img src="./images/his_1.jpg" width="185" height="162" /></a></div>
                    <div class="name"><a href="#">Dior/迪奥香水2件套装</a></div>
                    <div class="price">
                        <font>￥<span>368.00</span></font> &nbsp; 18R
                    </div>
                </li>
                <li>
                    <div class="img"><a href="#"><img src="./images/his_2.jpg" width="185" height="162" /></a></div>
                    <div class="name"><a href="#">Dior/迪奥香水2件套装</a></div>
                    <div class="price">
                        <font>￥<span>768.00</span></font> &nbsp; 18R
                    </div>
                </li>
                <li>
                    <div class="img"><a href="#"><img src="./images/his_3.jpg" width="185" height="162" /></a></div>
                    <div class="name"><a href="#">Dior/迪奥香水2件套装</a></div>
                    <div class="price">
                        <font>￥<span>680.00</span></font> &nbsp; 18R
                    </div>
                </li>
                <li>
                    <div class="img"><a href="#"><img src="./images/his_4.jpg" width="185" height="162" /></a></div>
                    <div class="name"><a href="#">Dior/迪奥香水2件套装</a></div>
                    <div class="price">
                        <font>￥<span>368.00</span></font> &nbsp; 18R
                    </div>
                </li>
                <li>
                    <div class="img"><a href="#"><img src="./images/his_5.jpg" width="185" height="162" /></a></div>
                    <div class="name"><a href="#">Dior/迪奥香水2件套装</a></div>
                    <div class="price">
                        <font>￥<span>368.00</span></font> &nbsp; 18R
                    </div>
                </li>
            </ul>
        </div>
        <div class="l_list">
            <div class="des_border">
                <div class="des_tit">
                    <ul>
                        <li class="current">推荐搭配</li>
                    </ul>
                </div>
                <div class="team_list">
                    <div class="img"><a href="#"><img src="./images/mat_1.jpg" width="160" height="140" /></a></div>
                    <div class="name"><a href="#">倩碧补水组合套装8折促销</a></div>
                    <div class="price">
                        <div class="checkbox"><input type="checkbox" name="zuhe" checked="checked" /></div>
                        <font>￥<span>768.00</span></font> &nbsp; 18R
                    </div>
                </div>
                <div class="team_icon"><img src="./images/jia_b.gif" /></div>
                <div class="team_list">
                    <div class="img"><a href="#"><img src="./images/mat_2.jpg" width="160" height="140" /></a></div>
                    <div class="name"><a href="#">香奈儿邂逅清新淡香水50ml</a></div>
                    <div class="price">
                        <div class="checkbox"><input type="checkbox" name="zuhe" /></div>
                        <font>￥<span>749.00</span></font> &nbsp; 18R
                    </div>
                </div>
                <div class="team_icon"><img src="./images/jia_b.gif" /></div>
                <div class="team_list">
                    <div class="img"><a href="#"><img src="./images/mat_3.jpg" width="160" height="140" /></a></div>
                    <div class="name"><a href="#">香奈儿邂逅清新淡香水50ml</a></div>
                    <div class="price">
                        <div class="checkbox"><input type="checkbox" name="zuhe" checked="checked" /></div>
                        <font>￥<span>749.00</span></font> &nbsp; 18R
                    </div>
                </div>
                <div class="team_icon"><img src="./images/equl.gif" /></div>
                <div class="team_sum">
                    套餐价：￥<span>1517</span><br />
                    <input type="text" value="1" class="sum_ipt" /><br />
                    <a href="#"><img src="./images/z_buy.gif" /></a>
                </div>

            </div>
            <div class="des_border">
                <div class="des_tit">
                    <ul>
                        <li class="current"><a href="#p_attribute">商品属性</a></li>
                        <li><a href="#p_details">商品详情</a></li>
                        <li><a href="#p_comment">商品评论</a></li>
                    </ul>
                </div>
                <div class="des_con" id="p_attribute">

                    <table border="0" align="center" style="width:100%; font-family:'宋体'; margin:10px auto;" cellspacing="0" cellpadding="0">
                        <tr>
                            <td>商品名称：迪奥香水</td>
                            <td>商品编号：1546211</td>
                            <td>品牌： 迪奥（Dior）</td>
                            <td>上架时间：2015-09-06 09:19:09 </td>
                        </tr>
                        <tr>
                            <td>商品毛重：160.00g</td>
                            <td>商品产地：法国</td>
                            <td>香调：果香调香型：淡香水/香露EDT</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>容量：1ml-15ml </td>
                            <td>类型：女士香水，Q版香水，组合套装</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>


                </div>
            </div>

            <div class="des_border" id="p_details">
                <div class="des_t">商品详情</div>
                <div class="des_con">
                    <table border="0" align="center" style="width:745px; font-size:14px; font-family:'宋体';" cellspacing="0" cellpadding="0">
                        <tr>
                            <td width="265"><img src="./images/de1.jpg" width="206" height="412" /></td>
                            <td>
                                <b>迪奥真我香水(Q版)</b><br />
                                【商品规格】：5ml<br />
                                【商品质地】：液体<br />
                                【商品日期】：与专柜同步更新<br />
                                【商品产地】：法国<br />
                                【商品包装】：无外盒 无塑封<br />
                                【商品香调】：花束花香调<br />
                                【适用人群】：适合女性（都市白领，性感，有女人味的成熟女性）<br />
                            </td>
                        </tr>
                    </table>

                    <p align="center">
                        <img src="./images/de2.jpg" width="746" height="425" /><br /><br />
                        <img src="./images/de3.jpg" width="750" height="417" /><br /><br />
                        <img src="./images/de4.jpg" width="750" height="409" /><br /><br />
                        <img src="./images/de5.jpg" width="750" height="409" />
                    </p>

                </div>
            </div>

            <div class="des_border" id="p_comment">
                <div class="des_t">商品评论</div>

                <table border="0" class="jud_tab" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="175" class="jud_per">
                            <p>80.0%</p>好评度
                        </td>
                        <td width="300">
                            <table border="0" style="width:100%;" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td width="90">好评<font color="#999999">（80%）</font></td>
                                    <td><img src="./images/pl.gif" align="absmiddle" /></td>
                                </tr>
                                <tr>
                                    <td>中评<font color="#999999">（20%）</font></td>
                                    <td><img src="./images/pl.gif" align="absmiddle" /></td>
                                </tr>
                                <tr>
                                    <td>差评<font color="#999999">（0%）</font></td>
                                    <td><img src="./images/pl.gif" align="absmiddle" /></td>
                                </tr>
                            </table>
                        </td>
                        <td width="185" class="jud_bg">
                            购买过雅诗兰黛第六代特润精华露50ml的顾客，在收到商品才可以对该商品发表评论
                        </td>
                        <td class="jud_bg">您可对已购买商品进行评价<br /><a href="#"><img src="./images/btn_jud.gif" /></a></td>
                    </tr>
                </table>



                <table border="0" class="jud_list" style="width:100%; margin-top:30px;" cellspacing="0" cellpadding="0">
                    <tr valign="top">
                        <td width="160"><img src="./images/peo1.jpg" width="20" height="20" align="absmiddle" />&nbsp;向死而生</td>
                        <td width="180">
                            颜色分类：<font color="#999999">粉色</font> <br />
                            型号：<font color="#999999">50ml</font>
                        </td>
                        <td>
                            产品很好，香味很喜欢，必须给赞。 <br />
                            <font color="#999999">2015-09-24</font>
                        </td>
                    </tr>
                    <tr valign="top">
                        <td width="160"><img src="./images/peo2.jpg" width="20" height="20" align="absmiddle" />&nbsp;就是这么想的</td>
                        <td width="180">
                            颜色分类：<font color="#999999">粉色</font> <br />
                            型号：<font color="#999999">50ml</font>
                        </td>
                        <td>
                            送朋友，她很喜欢，大爱。 <br />
                            <font color="#999999">2015-09-24</font>
                        </td>
                    </tr>
                    <tr valign="top">
                        <td width="160"><img src="./images/peo3.jpg" width="20" height="20" align="absmiddle" />&nbsp;墨镜墨镜</td>
                        <td width="180">
                            颜色分类：<font color="#999999">粉色</font> <br />
                            型号：<font color="#999999">50ml</font>
                        </td>
                        <td>
                            大家都说不错<br />
                            <font color="#999999">2015-09-24</font>
                        </td>
                    </tr>
                    <tr valign="top">
                        <td width="160"><img src="./images/peo4.jpg" width="20" height="20" align="absmiddle" />&nbsp;那*****洋 <br /><font color="#999999">（匿名用户）</font></td>
                        <td width="180">
                            颜色分类：<font color="#999999">粉色</font> <br />
                            型号：<font color="#999999">50ml</font>
                        </td>
                        <td>
                            下次还会来买，推荐。<br />
                            <font color="#999999">2015-09-24</font>
                        </td>
                    </tr>
                </table>



                <div class="pages">
                    <a href="#" class="p_pre">上一页</a><a href="#" class="cur">1</a><a href="#">2</a><a href="#">3</a>...<a href="#">20</a><a href="#" class="p_pre">下一页</a>
                </div>

            </div>


        </div>
    </div>


    <!--Begin 弹出层-收藏成功 Begin-->
    <div id="fade" class="black_overlay"></div>
    <div id="MyDiv" class="white_content">
        <div class="white_d">
            <div class="notice_t">
                <span class="fr" style="margin-top:10px; cursor:pointer;" onclick="CloseDiv('MyDiv','fade')"><img src="./images/close.gif" /></span>
            </div>
            <div class="notice_c">

                <table border="0" align="center" style="" cellspacing="0" cellpadding="0">
                    <tr valign="top">
                        <td width="40"><img src="./images/suc.png" /></td>
                        <td>
                            <span style="color:#3e3e3e; font-size:18px; font-weight:bold;">您已成功收藏该商品</span><br />
                            <a href="#">查看我的关注 >></a>
                        </td>
                    </tr>
                    <tr height="50" valign="bottom">
                        <td>&nbsp;</td>
                        <td><a href="#" class="b_sure">确定</a></td>
                    </tr>
                </table>

            </div>
        </div>
    </div>
    <!--End 弹出层-收藏成功 End-->


    <!--Begin 弹出层-加入购物车 Begin-->
    <div id="fade1" class="black_overlay"></div>
    <div id="MyDiv1" class="white_content">
        <div class="white_d">
            <div class="notice_t">
                <span class="fr" style="margin-top:10px; cursor:pointer;" onclick="CloseDiv_1('MyDiv1','fade1')"><img src="images/close.gif" /></span>
            </div>
            <div class="notice_c">

                <table border="0" align="center" cellspacing="0" cellpadding="0">
                    <tr valign="top">
                        <td width="40"><img src="images/suc.png" /></td>
                        <td>
                            <span style="color:#3e3e3e; font-size:18px; font-weight:bold;">宝贝已成功添加到购物车</span><br />
                            购物车 合计：<span id="sum">0</span>
                        </td>
                    </tr>
                    <tr height="50" valign="bottom">
                        <td>&nbsp;</td>
                        <td><a href="BuyCar.jsp" class="b_sure">去购物车结算</a><a href="CategoryList.jsp" class="b_buy">继续购物</a></td>
                    </tr>
                </table>

            </div>
        </div>
    </div>
    <!--End 弹出层-加入购物车 End-->



    <!--Begin Footer Begin -->
    <div class="b_btm_bg bg_color">
        <div class="b_btm">
            <table border="0" style="width:210px; height:62px; float:left; margin-left:75px; margin-top:30px;" cellspacing="0" cellpadding="0">
                <tr>
                    <td width="72"><img src="./images/b1.png" width="62" height="62" /></td>
                    <td><h2>正品保障</h2>正品行货  放心购买</td>
                </tr>
            </table>
            <table border="0" style="width:210px; height:62px; float:left; margin-left:75px; margin-top:30px;" cellspacing="0" cellpadding="0">
                <tr>
                    <td width="72"><img src="./images/b2.png" width="62" height="62" /></td>
                    <td><h2>满38包邮</h2>满38包邮 免运费</td>
                </tr>
            </table>
            <table border="0" style="width:210px; height:62px; float:left; margin-left:75px; margin-top:30px;" cellspacing="0" cellpadding="0">
                <tr>
                    <td width="72"><img src="./images/b3.png" width="62" height="62" /></td>
                    <td><h2>天天低价</h2>天天低价 畅选无忧</td>
                </tr>
            </table>
            <table border="0" style="width:210px; height:62px; float:left; margin-left:75px; margin-top:30px;" cellspacing="0" cellpadding="0">
                <tr>
                    <td width="72"><img src="./images/b4.png" width="62" height="62" /></td>
                    <td><h2>准时送达</h2>收货时间由你做主</td>
                </tr>
            </table>
        </div>
    </div>
    <div class="b_nav">
        <dl>
            <dt><a href="#">新手上路</a></dt>
            <dd><a href="#">售后流程</a></dd>
            <dd><a href="#">购物流程</a></dd>
            <dd><a href="#">订购方式</a></dd>
            <dd><a href="#">隐私声明</a></dd>
            <dd><a href="#">推荐分享说明</a></dd>
        </dl>
        <dl>
            <dt><a href="#">配送与支付</a></dt>
            <dd><a href="#">货到付款区域</a></dd>
            <dd><a href="#">配送支付查询</a></dd>
            <dd><a href="#">支付方式说明</a></dd>
        </dl>
        <dl>
            <dt><a href="#">会员中心</a></dt>
            <dd><a href="#">资金管理</a></dd>
            <dd><a href="#">我的收藏</a></dd>
            <dd><a href="#">我的订单</a></dd>
        </dl>
        <dl>
            <dt><a href="#">服务保证</a></dt>
            <dd><a href="#">退换货原则</a></dd>
            <dd><a href="#">售后服务保证</a></dd>
            <dd><a href="#">产品质量保证</a></dd>
        </dl>
        <dl>
            <dt><a href="#">联系我们</a></dt>
            <dd><a href="#">网站故障报告</a></dd>
            <dd><a href="#">购物咨询</a></dd>
            <dd><a href="#">投诉与建议</a></dd>
        </dl>
        <div class="b_tel_bg">
            <a href="#" class="b_sh1">新浪微博</a>
            <a href="#" class="b_sh2">腾讯微博</a>
            <p>
                服务热线：<br />
                <span>400-123-4567</span>
            </p>
        </div>
        <div class="b_er">
            <div class="b_er_c"><img src="./images/er.gif" width="118" height="118" /></div>
            <img src="./images/ss.png" />
        </div>
    </div>
    <div class="btmbg">
        <div class="btm">
            备案/许可证编号：蜀ICP备12009302号-1-www.dingguagua.com   Copyright © 2015-2018 尤洪商城网 All Rights Reserved. 复制必究 , Technical Support: Dgg Group <br />
            <img src="./images/b_1.gif" width="98" height="33" /><img src="./images/b_2.gif" width="98" height="33" /><img src="./images/b_3.gif" width="98" height="33" /><img src="./images/b_4.gif" width="98" height="33" /><img src="./images/b_5.gif" width="98" height="33" /><img src="./images/b_6.gif" width="98" height="33" />
        </div>
    </div>
    <!--End Footer End -->
</div>

</body>

<script src="js/ShopShow.js"></script>

<!--[if IE 6]>
<script src="//letskillie6.googlecode.com/svn/trunk/2/zh_CN.js"></script>
<![endif]-->
</html>

