<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	tr, th {
		width : 250px;
		height : 50px;
		
		text-align : center;
		
		border-top: 1px gray thin;
	}
</style>
<table> <!-- id="ticketList-table" --> 
	<tr class="ticketList-table-row" >
		<th>번호</th>
		<th>식권 가게 이름</th>
		<th>발행 일자</th>
		<th>마감 일자</th>
		<th>사용 여부</th>
	</tr>
	<c:forEach var="ticket" items="${ticketList}" varStatus="status">
		<tr class="ticketList-ticket-row">
			<td>${ticket.ticket_no }</td>
			<td><a href="userTicketOne?ticket_ID=${ticket.ticket_ID }" style="text-decoration: underline;">${storeList[status.index].store_name }</a></td>
			<td>${ticket.ticket_start }</td>
			<td>${ticket.ticket_end }</td>
			<td><b>${ticket.ticket_use }</b></td>
		</tr>
	</c:forEach>
</table>