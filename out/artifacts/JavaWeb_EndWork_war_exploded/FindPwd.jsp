<%--
  Created by IntelliJ IDEA.
  User: youmu
  Date: 2020/8/8
  Time: 9:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>找回密码</title>
    <script type="text/javascript" src="js/jquery-3.5.1.js"></script>
</head>
<script>
    $(function () {
        var obj;
        $("#but").click(function () {
            $("#but").attr(disabled="disabled");
            $("#email").attr(disabled="disabled");
            $("#username").attr(disabled="disabled");
            var username = $("#username").val();
            var email = $("#email").val();
            if (username == null || email == null) {
                alert("请输入用户名与邮箱地址");
                return;
            }
            $.ajax({
                url:"getvc",
                data:{"username":username,"email":email},
                method:"GET",
                success:function (data) {
                    obj = JSON.parse(data);
                    if (obj.code == 100) {
                        alert("用户名或邮箱地址有误");
                    }else {
                    $("#but").val("验证码已经发送到您的邮箱");
                    $("#yzm").removeAttr("disabled");
                    }
                }
            });
        });
        $("#yzm").blur(function () {
            var code1 = $("#yzm").val();
            if (code1 == obj.VC) {
                $("#but").val("验证码正确");
                $(".nul").removeAttr("disabled");
                $(".nul").removeAttr("style");
            }
        });


    })
</script>
<body>
<form method="post" action="setnewpassword">
    用户名：<input name="username" id="username" type="text"/><br>
    邮箱地址：<input name="email" id="email" type="text"/><br>
    <input disabled="disabled" id="yzm" name="验证码"/><button id="but">获取验证码</button><br>
    <input id="pwd"  class="nul" name="pwd" style="display: none" type="password" value="新密码："><br>
    <input id="pwda" class="nul" value="重复新密码：" name="pwdagain" style="display: none" type="password"><br>
    <input type="submit" value="提交" class="nul" disabled="disabled"><br>
</form>



</body>
</html>
