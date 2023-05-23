<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table>
	<tr class="ticketList-table-row">
		<th>번호</th>
		<th>식권 가게 이름</th>
		<th>발행 일자</th>
		<th>마감 일자</th>
		<th>사용 여부</th>
		<th>사용하기</th>
	</tr>
	<c:forEach items="${ticketList}" var="ticket">
		<tr class="ticket-row">
			<td>${ticket.ticket_no }</td>
			<td>${ticket.ticket_storeID }</td>
			<td>${ticket.ticket_start }</td>
			<td>${ticket.ticket_end }</td>
			<td>${ticket.ticket_use }</td>
			<td><a href="userTicketOne?ticket_ID=${ticket.ticket_ID }"><button>사용</button></a></td>
		</tr>
	</c:forEach>
</table>