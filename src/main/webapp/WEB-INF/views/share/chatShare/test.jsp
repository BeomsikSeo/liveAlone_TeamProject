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
<%= session.getAttribute("id")%>
<hr color="red">
<form action="login" method="get">
	id : <input name="id" value="apple1"><br>
	<button type="submit">서버로 전송</button>
</form>
</body>
</html>