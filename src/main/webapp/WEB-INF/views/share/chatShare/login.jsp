<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>로그인 성공</h3>
현재 세션 : <%= session.getAttribute("id")%>
<hr color="red">
<form action="list" method="get">
	<button type="submit">게시물 리스트</button>
</form>
</body>
</html>