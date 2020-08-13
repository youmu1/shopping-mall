<%@ page import="com.pojo.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.pojo.BuyCar" %>
<%@ page import="com.mpl.BuyCarImpl" %><%--
  Created by IntelliJ IDEA.
  User: youmu
  Date: 2020/8/3
  Time: 9:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link type="text/css" rel="stylesheet" href="css/style.css" />
    <!--[if IE 6]>
    <script src="js/iepng.js" type="text/javascript"></script>
    <script type="text/javascript">
        EvPNG.fix('div, ul, img, li, input, a');
    </script>
    <![endif]-->

    <script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="js/menu.js"></script>
    <script type="text/javascript" src="js/jquery-3.5.1.js"/>
    <script type="text/javascript" src="js/n_nav.js"></script>

    <script type="text/javascript" src="js/num.js">
        var jq = jQuery.noConflict();
    </script>

    <script type="text/javascript" src="js/shade.js"></script>

    <title>尤洪</title>
</head>
<body>
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

    ArrayList<BuyCar> buyCarArrayList;
    HttpSession session1 = request.getSession();
//    User user = (User) session1.getAttribute("user");
%>
<!--Begin Header Begin-->
<div id="userid" style="display: none"><%=uid%></div>
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
                    out.write("            <div class=\"un_login\">还未登录！<a href=\"index.jsp\" style=\"color:#ff4e00;\">马上登录</a> 查看购物车！</div>\n");
                }
            %>
            <ul id="carlist" class="cars">

            </ul>
            <!--End 购物车已登录 End-->

            <div class="price_sum" style="display: none">共计: <font color="#ff4e00">￥</font><span id="sum">0</span></div>
            <div class="price_a"  style="display: none"><a id="gotoB" href="#">去购物车结算</a></div>
        </div>

    </div>
</div>
<script type="text/javascript">
    var userID ;
    var sum = 0;
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
                    $("#sum").html(sum);
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





        $(".j_car").click(function () {
            var uida= $(this).parent().children(".uid").text();
            var pida= $(this).parent().children(".pid").text();
            $.ajax({
                url: "addtobuycar",
                data: {"uid":uida,"pid":pida},
                method: "get",
                success:function (listdata){

                }
            })
        })

        $(".pagegh").click(function () {
            $(this).siblings('a').removeClass('cur');
            $(this).addClass('cur');

            $("#ul li").remove();
            var a = $(this).html();
            var ul = $("#ul");
            $.ajax({
                url:"getproductlist",
                data:"index="+a,
                method:"post",
                success:function (data) {
                    var obj = JSON.parse(data);
                    for (var i = 0; obj.length > i; i++) {
                        ul.append("<li><div class='img'><a href='#'><img src='../images/"+obj[i].fileName+"' width='210' height='185' /></a></div><div class='price'><font>￥<span>"+obj[i].price+"</span></font> &nbsp; "+obj[i].stock+"R</div><div class='name'><a href='#'>"+obj[i].name+"</a></div><div class='carbg' ><a href='#' class='ss'>收藏</a> <a href='product' class='j_car' >加入购物车</a></div></li>");
                    }
                }
            })
        })
    })
</script>
<%--<td class="sa">--%>
<%--    <div class="uid"  style="display: none"><%=uid%></div>--%>
<%--    <div class="pid"  style="display: none"><%=i.getPid()%></div>--%>
<%--    <div class="price" style="display: none"><%=i.getPrice()%></div>--%>
<%--    <div class="c_s_img"><img src="./images/<%=i.getFilename()%>" width="73" height="73" /></div>--%>
<%--    <%=i.getName()%>--%>
<%--</td>--%>



<!--End Header End-->
<!--Begin Menu Begin-->
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
    <div class="content mar_20">
        <img src="./images/img1.jpg" />
    </div>

    <!--Begin 第一步：查看购物车 Begin -->
    <div class="content mar_20">
        <table border="0" id="tabl" class="car_tab" style="width:1200px; margin-bottom:50px;" cellspacing="0" cellpadding="0">
            <tr>
                <td class="car_th" width="490">商品名称</td>
                <td class="car_th" width="140">属性</td>
                <td class="car_th" width="150">购买数量</td>
                <td class="car_th" width="130">小计</td>
                <td class="car_th" width="140">返还积分</td>
                <td class="car_th" width="150">操作</td>
            </tr>
            <%
                int allsum = 0;
            if (username!=null) {
                buyCarArrayList =(ArrayList<BuyCar>) new BuyCarImpl().selectProduct(uid);

            for (BuyCar i:buyCarArrayList){
                allsum = allsum +(i.getPrice()*i.getNumber());
            %>

            <tr class="car_tr">
                <td class="sa">
                    <div class="uid"  style="display: none"><%=uid%></div>
                    <div class="pid"  style="display: none"><%=i.getPid()%></div>
                    <div class="price" style="display: none"><%=i.getPrice()%></div>
                    <div class="c_s_img"><img src="./images/<%=i.getFilename()%>" width="73" height="73" /></div>
                    <%=i.getName()%>
                </td>
                <td align="center">颜色：灰色</td>
                <td align="center">
                    <div class="c_num">
                        <input type="button" value="" onclick="" class="car_btn_1" />
                        <input type="text"   value="<%=i.getNumber()%>" name="" class="car_ipt number" />
                        <input type="button" value="" onclick="" class="car_btn_2" />
                    </div>
                </td>
                <td align="center" style="color:#ff4e00;" class="sum"><%=i.getNumber()*i.getPrice()%></td>
                <td align="center">26R</td>
                <td align="center"><a href="delbuycarpro?id=<%=i.getId()%>">删除</a>&nbsp; &nbsp;<a>加入收藏</a></td>
            </tr>
            <%
                    }
                }
            %>

            <tr height="70">
                <td colspan="6" style="font-family:'Microsoft YaHei'; border-bottom:0;">
                    <span class="fr">商品总价：<b style="font-size:22px; color:#ff4e00;" id="allsum"><%=allsum%></b></span>
                </td>
            </tr>

            <tr valign="top" height="150">
                <td colspan="6" id="goto" align="right">
                    <a href="CategoryList.jsp"><img src="images/buy1.gif" /></a>&nbsp; &nbsp; <a id="tobc2" href="buycar2?uid=<%=uid%>"><img src="images/buy2.gif" /></a>
                </td>
            </tr>
        </table>

    </div>
    <!--End 第一步：查看购物车 End-->
    <script type="text/javascript">
    $(function () {
        $("#tobc2").click(function () {
            var sum = $("#allsum").text();
            if (parseInt(sum) == 0) {
                alert("您的购物车还是空的，去买一些吧~");
                $("#tobc2").attr("href","CategoryList.jsp");
            }

        });
        $('.number').blur(function () {
            var regrx = /^(\+|-)?\d+$/;
            var uid = $(this).parent().parent().parent().find(".sa").find(".uid").text();
            var pid = $(this).parent().parent().parent().find(".sa").find(".pid").text();
            var price = $(this).parent().parent().parent().find(".sa").find(".price").text();
            var c = $(this).parent().find(".car_ipt").val();
            var data = $(this).val();
            if (!regrx.test(data) || data<1) {
                alert("你的输入不合法");
                if (data == 0)alert("如果您想删除请点右边的删除");
                $(this).val(1);
                window.location.reload();
                return;
            }else{
                $.ajax({
                    sync:false,
                    url:"setnewnumberforbuycar",
                    data:{"uid":uid,"pid":pid,"number":data},
                    method:"post",
                    success:function () {
                        $("#allsum").text(allsum());
                        $(this).parent().parent().parent().find(".sum").text(+price*c);
                        window.location.reload();
                    }
                });
            }
        });


        $(".car_btn_1").click(function () {
            var uid = $(this).parent().parent().parent().find(".sa").find(".uid").text();
            var pid = $(this).parent().parent().parent().find(".sa").find(".pid").text();
            var price = $(this).parent().parent().parent().find(".sa").find(".price").text();
            var c = $(this).parent().find(".car_ipt").val();
            if(c==1){
                c=1;
            }else{
                c=parseInt(c)-1;
                $(this).parent().find(".car_ipt").val(c);
                $.ajax({
                    sync:false,
                    url:"subbuycar",
                    data:{"uid":uid,"pid":pid},
                    method:"post",
                    success:function () {
                        window.location.reload();
                    }
                });
            }

            $("#allsum").text(allsum());
            $(this).parent().parent().parent().find(".sum").text(+price*c);
        });


        $(".car_btn_2").click(function () {
            var uid = $(this).parent().parent().parent().find(".sa").find(".uid").text();
            var pid = $(this).parent().parent().parent().find(".sa").find(".pid").text();
            var price = $(this).parent().parent().parent().find(".sa").find(".price").text();
            var c = $(this).parent().find(".car_ipt").val();
            c=parseInt(c)+1;

            $(this).parent().find(".car_ipt").val(c);
            $.ajax({
                sync: false,
                url:"addtobuycar",
                data:{"uid":uid,"pid":pid,"number":1},
                method:"post",
                success:function () {
                    window.location.reload();
                }
            });
            allsum();
            $(this).parent().parent().parent().find(".sum").text(+price*c);
        });
    })
        function allsum() {
        var uid = $("#userid").text();
            $.ajax({
                url:"getallmoney",
                data:{"uid":uid},
                method:"post",
                success:function (data) {
                    $("#allsum").html(data);
                }
            });
        }
    </script>

    <!--Begin 弹出层-删除商品 Begin-->
    <div id="fade" class="black_overlay"></div>
    <div id="MyDiv" class="white_content">
        <div class="white_d">
            <div class="notice_t">
                <span class="fr" style="margin-top:10px; cursor:pointer;" onclick="CloseDiv('MyDiv','fade')"><img src="./images/close.gif" /></span>
            </div>
            <div class="notice_c">

                <table border="0" align="center" style="font-size:16px;" cellspacing="0" cellpadding="0">
                    <tr valign="top">
                        <td>您确定要把该商品移除购物车吗？</td>
                    </tr>
                    <tr height="50" valign="bottom">
                        <td><a href="#" class="b_sure">确定</a><a href="#" class="b_buy">取消</a></td>
                    </tr>
                </table>

            </div>
        </div>
    </div>
    <!--End 弹出层-删除商品 End-->


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


<!--[if IE 6]>
<script src="//letskillie6.googlecode.com/svn/trunk/2/zh_CN.js"></script>
<![endif]-->
</html>

