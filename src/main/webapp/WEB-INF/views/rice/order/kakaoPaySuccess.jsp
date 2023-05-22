<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>티켓 구매당시의 가격 >> ${ticket.ticket_price }</p>
	<p>티켓 구매에 사용된 마일리지 >> ${ticket.ticket_usedMileage }</p>
</body>
</html>