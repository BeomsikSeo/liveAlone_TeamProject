<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>로그인 화면입니다. </h3>
<hr color="red">
<form action="login" method="get">
	id : <input name="login_id"><br>
	<button type="submit">로그인</button>
</form>
<%
	if(session.getAttribute("member_id") == "null"){
%>
로그인실패! 다시 로그인해주세요
<%}%>

</body>
</html>