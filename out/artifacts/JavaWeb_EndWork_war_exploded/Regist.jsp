<%--
  Created by IntelliJ IDEA.
  User: youmu
  Date: 2020/7/22
  Time: 19:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link type="text/css" rel="stylesheet" href="css/style.css" />
    <!--[if IE 6]>
    <script type="text/javascript" src="js/jquery-3.5.1.js"></script>
    <script src="js/iepng.js" type="text/javascript"></script>
    <script type="text/javascript">
        EvPNG.fix('div, ul, img, li, input, a');
    </script>
    <![endif]-->
    <script type="text/javascript" src="js/jquery-1.11.1.min_044d0927.js"></script>
    <script type="text/javascript" src="js/jquery.bxslider_e88acd1b.js"></script>

    <script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="js/menu.js"></script>

    <script type="text/javascript" src="js/select.js"></script>

    <script type="text/javascript" src="js/lrscroll.js"></script>

    <script type="text/javascript" src="js/iban.js"></script>
    <script type="text/javascript" src="js/fban.js"></script>
    <script type="text/javascript" src="js/f_ban.js"></script>
    <script type="text/javascript" src="js/mban.js"></script>
    <script type="text/javascript" src="js/bban.js"></script>
    <script type="text/javascript" src="js/hban.js"></script>
    <script type="text/javascript" src="js/tban.js"></script>

    <script type="text/javascript" src="js/lrscroll_1.js"></script>
<script>
    $(document).ready(function () {
        $("#username").blur(function () {
            var un = $("#username").val();
            if (un == null) {
                $("#sp").html("用户名不可用").css("color","red");
                return;
            }

            $.ajax({
                url: "isnewusername",
                type: "POST",
                data:"username=" + document.getElementById("username").value,
                success: function(data) {
                    if (data == "is") {
                        $("#sp").html("您的用户名是唯一的").css("color","green");
                    }
                    if (data == "no") {
                        $("#sp").html("这个用户名已经被别人用过了").css("color","red");
                    }
                }
            });
        });
        $("#password1").blur(function () {
            var password = document.getElementById("password").value;
            var password1 = document.getElementById("password1").value;
            if (password != password1){
                $("#pas").html("两次输入的的密码不一致").css("color","red");
            }else {
                $("#pas").html("");
            }
        });
    });
</script>
    <title>尤洪</title>
</head>
<body>
<!--Begin Header Begin-->
<div class="soubg">
    <div class="sou">
        <span class="fr">
        	<span class="fl">你好，请
                <%
                    Boolean i = false;
                    if (request.getCookies() != null) {
                        for (Cookie c:request.getCookies()) {
                            if ("username".equals(c.getName())) {
                                out.write(c.getValue()+"<a href =\"loseLogin\" >"+"    "+"退出登录</a>");
                                i = true;
                            }
                        }
                    }
                    if (!i){
                        out.write("请<a href=\"login.jsp\">登录</a>&nbsp; <a href=\"Regist.jsp\" style=\"color:#ff4e00;\">免费注册</a>");
                    }
                %>
            </span>
            <span class="fl">|&nbsp;关注我们：</span>
            <span class="s_sh"><a href="#" class="sh1">新浪</a><a href="#" class="sh2">微信</a></span>
            <span class="fr">|&nbsp;<a href="#">手机版&nbsp;<img src="./images/s_tel.png" align="absmiddle" /></a></span>
        </span>
    </div>
</div>
<!--End Header End-->
<!--Begin Login Begin-->
<div class="log_bg">
    <div class="top">
        <div class="logo"><a href="index.jsp"><img src="./images/logo.png" /></a></div>
    </div>
    <div class="regist">
        <div class="log_img"><img src="./images/l_img.png" width="611" height="425" /></div>
        <div class="reg_c">
            <form action="register" method="post">
                <table border="0" style="width:420px; font-size:14px; margin-top:20px;" cellspacing="0" cellpadding="0">

                    <tr height="50" valign="top">
                        <td width="95">&nbsp;</td>
                        <td>
                            <span class="fl" style="font-size:24px;">注册</span>
                            <span class="fr">已有商城账号，<a href="login.jsp" style="color:#ff4e00;">我要登录</a></span>
                        </td>
                    </tr>

                    <tr height="50">
                        <td align="right"><font color="#ff4e00">*</font>&nbsp;用户名 &nbsp;</td>
                        <td><input type="text" name="username" placeholder="2-20位的数字字母组合" required pattern="^\w{2,20}$" id="username" value="" class="l_user" /></td>
                    </tr>
                    <tr>
                        <td><span id="sp"></span></td>
                    </tr>

                    <tr height="50">
                        <td align="right"><font color="#ff4e00">*</font>&nbsp;密码 &nbsp;</td>
                        <td><input type="password" id="password" placeholder="2-10位的数字字母组合" required pattern="^\w{2,10}$" name="password" value="" class="l_pwd" /></td>
                    </tr>

                    <tr height="50">
                        <td align="right"><font color="#ff4e00">*</font>&nbsp;确认密码 &nbsp;</td>
                        <td><input type="password" id="password1" placeholder="2-10位的数字字母组合" required pattern="^\w{2,10}$" name="password1" value="" class="l_pwd" /></td>
                    </tr>
                    <tr>
                        <td><span id="pas"></span></td>
                    </tr>
                    <tr height="50">
                        <td align="right"><font color="#ff4e00">*</font>&nbsp;邮箱 &nbsp;</td>
                        <td><input type="text" value="" name="email" required pattern="^[A-Za-z0-9\u4e00-\u9fa5]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$" id="email" class="l_email" /></td>
                    </tr>

                    <tr height="50">
                        <td align="right"><font color="#ff4e00">*</font>&nbsp;手机 &nbsp;</td>
                        <td><input type="text" name="phone" placeholder="仅支持国内工信部发放的手机号段" required pattern="^[1](([3][0-9])|([4][5-9])|([5][0-3,5-9])|([6][5,6])|([7][0-8])|([8][0-9])|([9][1,8,9]))[0-9]{8}$" value="" class="l_tel" /></td>
                    </tr>


<%--                    <tr height="50">--%>
<%--                        <td align="right">身份证 &nbsp;</td>--%>
<%--                        <td><input type="text" value="" required pattern="^[1-9]\d{5}(18|19|20|(3\d))\d{2}((0[1-9])|(1[0-2]))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$" name="idcard" class="l_mem" /></td>--%>
<%--                    </tr>--%>

<%--                    <tr height="50">--%>

<%--                        <td align="right"> <font color="#ff4e00">*</font>&nbsp;验证码 &nbsp;</td>--%>
<%--                        <td>--%>
<%--                            <input type="text" name="yzm" id="yzm_in" value="" class="l_ipt" />--%>
<%--                            <button onclick="getcode(this);"  id="getcode" >通过邮箱获取验证码</button>--%>
<%--                        </td>--%>
<%--                    </tr>--%>
                    <tr>
                        <td>&nbsp;</td>
                        <td style="font-size:12px; padding-top:20px;">
                	<span style="font-family:'宋体';" class="fl">
<%--                    	<label class="r_rad"><input type="checkbox" /></label><label class="r_txt">我已阅读并接受《用户协议》</label>--%>
                    </span>
                        </td>
                    </tr>
                    <tr height="60">
                        <td>&nbsp;</td>
                        <td><input type="submit" id="registernow" value="立即注册" class="log_btn" /></td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</div>
<!--End Login End-->
<!--Begin Footer Begin-->
<div class="btmbg">
    <div class="btm">
        备案/许可证编号：蜀ICP备12009302号-1-www.dingguagua.com   Copyright © 2015-2018 尤洪商城网 All Rights Reserved. 复制必究 , Technical Support: Dgg Group <br />
        <img src="./images/b_1.gif" width="98" height="33" /><img src="./images/b_2.gif" width="98" height="33" /><img src="./images/b_3.gif" width="98" height="33" /><img src="./images/b_4.gif" width="98" height="33" /><img src="./images/b_5.gif" width="98" height="33" /><img src="./images/b_6.gif" width="98" height="33" />
    </div>
</div>
<!--End Footer End -->

</body>


<!--[if IE 6]>
<script src="//letskillie6.googlecode.com/svn/trunk/2/zh_CN.js"></script>
<![endif]-->
</html>

