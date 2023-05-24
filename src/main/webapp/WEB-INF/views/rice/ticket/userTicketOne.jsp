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
	<div>
		<h3>식권 확인</h3>
	</div>
	<div>
		<table>
			<tr>
				<td class = "ticket-info-title">식권 번호</td>
				<td class = "ticket-info-content">${ticket.ticket_ID }</td>
			</tr>
			<tr>
				<td class = "ticket-info-title">식권 사용 가게 이름</td>
				<td class = "ticket-info-content">${store.store_name}</td>
			</tr>
			<tr>
				<td class = "ticket-info-title">식권 사용 가게 위치</td>
				<td class = "ticket-info-content">${store.store_addr } </td>
			</tr>
			<tr>
				<td class = "ticket-info-title">식권 주문 내역</td>
				<td class = "ticket-info-content"><c:forEach items="${orderList }" var="order"><p>${order.order_fName } (${order.order_fCount}개)</p></c:forEach></td>
			</tr>
			<tr>
				<td class = "ticket-info-title">식권 결제 금액</td>
				<td class = "ticket-info-content">${ticket.ticket_price }원</td>
			</tr>
			<tr>
				<td class = "ticket-info-title">식권 사용 마일리지</td>
				<td class = "ticket-info-content">${ticket.ticket_usedMileage } 마일리지</td>
			</tr>
			<tr>
				<td class = "ticket-info-title">식권 사용 여부</td>
				<td class = "ticket-info-content">${ticket.ticket_use }</td>
			</tr>
			<tr>
				<td><button>사용하기</button></td>
			</tr>
			<tr>
				<td><button>내 티켓 리스트로</button></td>
			</tr>
		</table>			
		<%-- 식권 번호 --%>
		<%-- 가게 이름 --%>	
		<%-- 가게 위치 --%>	
		<%-- 주문 목록--%>	
		<%-- 총 가격--%>	
		<%-- 사용 마일리지--%>	
		<%-- --%>	
	
	</div>
</body>
</html>