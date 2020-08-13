<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link type="text/css" rel="stylesheet" href="css/style.css" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">

	form{
		margin-top: 200px;
	}

	input {
	width: 400px;
	height: 30px;
}
#ip{
	margin-left: 500px;
	margin-top: 20px;
}
</style>

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

%>
	<form action="addaddress" method="post">
		<table border="0" class="peo_tab" style="width: 1110px;" cellspacing="0" cellpadding="0">
			<tr>
				<td style="display: none"><input type="text" name="uid"><%=uid%></td>
				<td class="p_td" width="160">用户名称</td>
				<td width="395"><input type="text" name="name" value="" readonly="readonly"/></td>
				<td class="p_td" width="160">电子邮件</td>
				<td width="395"><input type="text" value="" name="email" readonly="readonly"></td>
			</tr>
			<tr>
				<td class="p_td">详细地址</td>
				<td><input type="text" value="" name="address"></td>
				<td class="p_td">邮政编码</td>
				<td><input type="text" value="200002" name="postal"></td>
			</tr>
			<tr>
				<td class="p_td">电话</td>
				<td><input type="text" value="" name="tel" readonly="readonly"></td>
				<td class="p_td">送货时间</td>
				<td><input type="text" value="" name="time" readonly="readonly"></td>
			</tr>
		</table>
		<input type="submit" value="提交" id="ip">
	</form>
</body>
</html>