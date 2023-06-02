<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% session.setAttribute("memberID", "userA"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.4.js"></script>
<script type="text/javascript">
</script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/template/style.css">
</head>
<body>
	<h3>Index Page</h3>
	<span>사용자 ID : <%= session.getAttribute("memberID") %></span> <br>
	<span><a href="rice/ticket/userTicket">My 티켓</a></span><br>
	<span><a href="rice/mileage/userMileage">My 마일리지</a></span>
	<hr>
	
	<a href="rice/order/menuOrder?storeNo=1">1. 맘스날드 주문</a> <br>
	<a href="rice/order/menuOrder?storeNo=2">2. LFC 주문</a> <br>
	<hr>
	
</body>
</html>