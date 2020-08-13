<%@ page import="com.pojo.BuyCar" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.pojo.Address" %><%--
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
    <script type="text/javascript" src="js/jquery-3.5.1.js"></script>
    <script type="text/javascript" src="js/n_nav.js"></script>

    <script type="text/javascript" src="js/select.js"></script>

    <script type="text/javascript" src="js/num.js">
        var jq = jQuery.noConflict();
    </script>

    <script type="text/javascript" src="js/shade.js"></script>

    <title>尤洪</title>
</head>
<body>

<%
    ArrayList<BuyCar> buyCarArrayList;
    ArrayList<Address> addressArrayList;
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
    Address add = new Address();
    add.setId(21);
    HttpSession session1 = request.getSession();
    buyCarArrayList = (ArrayList<BuyCar>) session1.getAttribute("buycar");
    addressArrayList = (ArrayList<Address>) session1.getAttribute("addresslist");
    if (addressArrayList.size()>0)add = addressArrayList.get(0);
//    Address add  = addressArrayList.get(0);
//    User user = (User) session1.getAttribute("user");
%>



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
                    if(parseInt($("#sum").text()) != 0) {
                        $('.price_sum').attr({
                            "style" : ""
                        });
                        $('.price_a').attr({
                            "style" : ""
                        });
                        $('#gotoB').attr({
                            "href" : "BuyCar.jsp"
                        });
                    }else {
                        carlist.append("<li><img src=\"./images/1597128997822.gif\"></li>");
                    }
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
        <img src="./images/img2.jpg" />
    </div>

    <!--Begin 第二步：确认订单信息 Begin -->
    <div class="content mar_20">
        <div class="two_bg">
            <div class="two_t">
                <span class="fr"><a href="BuyCar.jsp">修改</a></span>商品列表
            </div>
            <table border="0" class="car_tab" style="width:1110px;" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="car_th" width="550">商品名称</td>
                    <td class="car_th" width="140">属性</td>
                    <td class="car_th" width="150">购买数量</td>
                    <td class="car_th" width="130">小计</td>

                </tr>
                <%
                    int sum = 0;
                for (BuyCar b:buyCarArrayList) {
                %>
                <tr>
                    <td>
                        <div class="c_s_img"><img src="./images/<%=b.getFilename()%>" width="73" height="73" /></div>
                        <%=b.getName()%>
                    </td>
                    <td align="center">颜色：灰色</td>
                    <td align="center"><%=b.getNumber()%></td>
                    <td align="center" style="color:#ff4e00;">￥<%=b.getPrice()*b.getNumber()%></td>
                </tr>
                <%
                        sum = sum+(b.getPrice()*b.getNumber());
                    }
                %>

                <tr>
                    <td colspan="5" align="right" style="font-family:'Microsoft YaHei';">
                        商品总价：￥<%=sum%>
                    </td>
                </tr>
            </table>
                <script type="text/javascript">
                    jq(function () {
                       jq("#change").click(function () {
                            jq(".input").removeAttr("disabled");
                            jq("#tijiao").removeAttr("style");
                           jq("#change").attr("style","display: none");
                       });

                       jq("#tijiao").click(function () {
                           var name = jq("#name").val();
                           var email = jq("#email").val();
                           var address = jq("#address").val();
                           var post = jq("#post").val();
                           var aid = jq("#aid").text();
                           var uid = jq("#uid").text();
                           var tel = jq("#tel").val();
                           var time = jq("#time").val();

                           jq(".input").attr("disabled","disabled");
                           jq("#tijiao").attr("style","display: none");
                           jq("#hello").attr("style","display: none");
                           jq("#change").removeAttr("style");
                           jq.ajax({
                               url:"changeAddress",
                               data:{"aid":aid,"uid":uid,"name":name,"email":email,"address":address,"post":post,"tel":tel,"time":time},
                               method:"get",
                               success:function (data) {
                                    var a = JSON.parse(data);
                                   jq("#three").attr('href','buycar3?uid=<%=uid%>&aid='+a.aid+'&whatpay='+index+'&whatsong='+index2);
                               }
                           })
                       });
                    })
                </script>
            <div class="two_t">
                <span class="fr"><a id="tijiao" style="display: none">提交修改</a><a id="change">修改</a></span>收货人信息
                <%
                if (add.getId() == 21) {
                    out.write("<span id='hello'>请输入您的收货地址</span>");
                }
                %>
            </div>
            <table border="0" class="peo_tab" style="width:1110px;" cellspacing="0" cellpadding="0">
                <tr>
                    <td style="display: none" id="aid"><%=add.getId()%></td>
                    <td style="display: none" id="uid"><%=uid%></td>
                    <td class="p_td" width="160">收货人姓名</td>
                    <td width="395"><input class="input" disabled="disabled" required pattern="^[\s\S]*.*[^\s][\s\S]*$" style="border:0;BACKGROUND-COLOR: transparent" id="name" value="<%=add.getName()%>"/></td>
                    <td class="p_td" width="160">电子邮件</td>
                    <td width="395"><input class="input" disabled="disabled" required pattern="^[\s\S]*.*[^\s][\s\S]*$" style="border:0;BACKGROUND-COLOR: transparent" id="email" value="<%=add.getEmail()%>"/></td>
                </tr>
                <tr>
                    <td class="p_td">详细地址</td>
                    <td><input class="input" disabled="disabled" style="border:0;BACKGROUND-COLOR: transparent" required pattern="^[\s\S]*.*[^\s][\s\S]*$" id="address" value="<%=add.getAddress()%>"/></td>
                    <td class="p_td">邮政编码</td>
                    <td><input class="input" disabled="disabled" style="border:0;BACKGROUND-COLOR: transparent"  id="post" value="<%=add.getPost()%>"/></td>
                </tr>
                <tr>
                    <td class="p_td">电话</td>
                    <td><input class="input" disabled="disabled" style="border:0;BACKGROUND-COLOR: transparent" required pattern="^[\s\S]*.*[^\s][\s\S]*$" id="phone" value="<%= add.getTel()%>"/></td>
                    <td class="p_td">手机</td>
                    <td><input class="input" disabled="disabled" style="border:0;BACKGROUND-COLOR: transparent" id="tel" value="<%= add.getTel()%>"/></td>
                </tr>
                <tr>
                    <td class="p_td">标志建筑</td>
                    <td></td>
                    <td class="p_td">最佳送货时间</td>
                    <td><input class="input" disabled="disabled" style="border:0;BACKGROUND-COLOR: transparent" id="time" value="<%=add.getTime()%>"/></td>
                </tr>
            </table>

            <div class="two_t">
                配送方式
            </div>
            <table border="0" class="car_tab" style="width:1110px;" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="car_th" width="80"></td>
                    <td class="car_th" width="200">名称</td>
                    <td class="car_th" width="370">订购描述</td>
                    <td class="car_th" width="150">费用</td>
                    <td class="car_th" width="135">免费额度</td>
                    <td class="car_th" width="175">保价费用</td>
                </tr>
                <tr>
                    <td align="center"><input type="radio" class="ws" name="ch" value="1" checked="checked" /></td>
                    <td align="center" style="font-size:14px;"><b>申通快递</b></td>
                    <td>江、浙、沪地区首重为15元/KG，其他地区18元/KG，续重均为5-6元/KG， 云南地区为8元</td>
                    <td align="center">￥15.00</td>
                    <td align="center">￥0.00</td>
                    <td align="center">不支持保价</td>
                </tr>
                <tr>
                    <td align="center"><input type="radio" class="ws" value="2" name="ch" /></td>
                    <td align="center" style="font-size:14px;"><b>城际快递</b></td>
                    <td>运费固定</td>
                    <td align="center">￥15.00</td>
                    <td align="center">￥0.00</td>
                    <td align="center">不支持保价</td>
                </tr>
                <tr>
                    <td align="center"><input type="radio" class="ws" value="3" name="ch" /></td>
                    <td align="center" style="font-size:14px;"><b>邮局平邮</b></td>
                    <td>运费固定</td>
                    <td align="center">￥15.00</td>
                    <td align="center">￥0.00</td>
                    <td align="center">不支持保价</td>
                </tr>
                <tr>
                    <td colspan="6">
                    </td>
                </tr>
            </table>

            <div class="two_t">
                支付方式
            </div>
            <ul class="pay" id="zhifu">
                <li class="checked">余额支付</li>
                <li>银行转账</li>
                <li>货到付款</li>
                <li>支付宝</li>
            </ul>

            <script type="text/javascript">
                var index = 1;//支付方式
                var index2 = 1;//配送方式
                jq(function () {
                    jq("#zhifu li").click(function () {
                        jq(this).siblings('li').removeClass('checked');
                        jq(this).addClass('checked');
                        index = jq("#zhifu li").index(this);
                        jq("#three").attr('href','buycar3?uid=<%=uid%>&aid=<%=add.getId()%>&whatpay='+index+'&whatsong='+index2);
                    });

                    jq(".ws").click(function () {
                            index2 = jq(this).val();
                            jq("#three").attr('href','buycar3?uid=<%=uid%>&aid=<%=add.getId()%>&whatpay='+index+'&whatsong='+index2);

                    });

                })


            </script>

            <table border="0" style="width:900px; margin-top:20px;" cellspacing="0" cellpadding="0">
                <tr height="70">
                    <td align="right">
                        <b style="font-size:14px;">应付款金额：<span style="font-size:22px; color:#ff4e00;">￥<%=sum+15%></span></b>
                    </td>
                </tr>
                <tr height="70">
                    <td align="right"><a id="three" href="buycar3?uid=<%=uid%>&aid=<%=add.getId()%>&whatpay=1&whatsong=1"><img src="./images/btn_sure.gif" /></a></td>
                </tr>
            </table>



        </div>
    </div>
    <!--End 第二步：确认订单信息 End-->


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

