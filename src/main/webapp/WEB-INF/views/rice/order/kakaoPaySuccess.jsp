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
	<%-- 
				주문 번호				식권 사용
				가게 이름				식권 리스트
				주문 내용
				주문 총 가격
				발행 날자				
				
				사용자 식권 리스트 페이지로 이동하는 버튼
				식권 상세 정보 및 사용 페이지로 이동하는 버튼
			--%>
	<div>
		<table>
			<tr>
				<td>${ticket.ticket_ID }</td>
				<td rowspan="3">
			</tr>
			<tr>
				<td>${store.store_name }</td>
			</tr>
			<tr>
				<td>
					<c:forEach items="${orderList}" var="order">
						${order.order_fName } ${order.order_fCount }개 <br>
					</c:forEach>	
				</td>
			</tr>
			<tr>
				<td>
					${ticket.ticket_price }
				</td>
				<td>
					<button>식권 리스트</button>
				</td>
			</tr>
			<tr>
				<td>
					${ticket.ticket_start }
				</td>
				<td>
					<button>식권 상세 정보</button>
				</td>
			</tr>
		</table>
	</div>
	<%-- 
	<p>티켓 구매당시의 가격 >> ${ticket.ticket_price }</p>
	<p>티켓 구매에 사용된 마일리지 >> ${ticket.ticket_usedMileage }</p> --%>
</body>
</html>