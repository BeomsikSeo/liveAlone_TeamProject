<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% session.setAttribute("memberID", "userA"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="resources/js/jquery-3.6.4.js"></script>
<script type="text/javascript">
</script>
</head>
<body>
	<h3>Index Page</h3>
	<a href="rice/ticket/userTicket">사용자 티켓 확인 페이지</a>
	<hr>
	<a href="rice/order/menuOrder?storeNo=1">맘스날드 주문</a> <br>
	<a href="rice/order/menuOrder?storeNo=2">LFC 주문</a> <br>
	
</body>
</html>