<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.4.js"></script>
<script type="text/javascript">
	$(function(){
		var refer = document.referrer;
		refer = refer.split("?")
		
		console.log(refer[0])
		console.log(refer[0] == "http://localhost:8888/liveAlone/rice/order/kakaoPaySuccess")
		if(refer[0]== "http://localhost:8888/liveAlone/rice/order/kakaoPaySuccess" ) {
			$("#resultText").empty()
			$("#resultText").text("결제가 완료되었습니다")
		}
		
		if(  "미사용" != "${ticket.ticket_use}"){
			
			$("#use-ticket-button").remove();
			$("#terms-list").remove();
			$("#cancel-tickekt-button").remove();
		}
			
			
		$("#Ticket-List").click(function(){
			location.href="userTicket";
		})
		
		$("#Ticket-Use").click(function(){
			console.log("클릭")
			if (document.getElementById("terms-list").style.display==='none'){
				document.getElementById("terms-list").style.display = "block";
			} else {
				document.getElementById("terms-list").style.display = "none";
			}
		})
		
		$(".terms-checkBox").click(function(){
			console.log($('.terms-checkBox').filter(":checked").length)
			console.log($('.terms-checkBox').length)
			console.log($('.terms-checkBox').filter(":checked").length==$('.terms-checkBox').length)
			
			if ($('.terms-checkBox').filter(":checked").length == $('.terms-checkBox').length){
				$("#useTicket-final").attr("disabled", false);
			} else{
				$("#useTicket-final").attr("disabled", true);
			}
		})
		
		$("#useTicket-final").click(function(){
			location.href="userTicketUpdate?ticket_ID=${ticket.ticket_ID}&update=1"
		})
	})
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 식권 번호 --%>
	<%-- 가게 이름 --%>	
	<%-- 가게 위치 --%>	
	<%-- 주문 목록--%>	
	<%-- 총 가격--%>	
	<%-- 사용 마일리지--%>	
	<%-- --%>	
	<div>
		<div>
			<h3>식권 확인</h3>
			<span id="resultText"></span>
		</div>
		<hr>
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
					<td class = "ticket-info-title">식권 사용</td>
					<td class = "ticket-info-content" style="color : blue;">${ticket.ticket_use }</td>
				</tr>
				<tr>
			</table>
			<hr>
		</div>	
		<div>
			<div class="ticket-button" id="to-ticketList-button"><button id="Ticket-List">내 티켓 리스트로</button></div>
			<div class="ticket-button" id="use-ticket-button"><button id="Ticket-Use">식권 사용</button></div>
			<div class="ticket-button" id="cancel-tickekt-button"><button id="Ticket-Refund">식권 환불</button></div>
			<hr>
		</div>
			
		<div id="terms-list" style="display : none;">
			<div>
				<ol>
						<li>사용 약관에 동의 하시겠습니까?<input type="checkbox" class="terms-checkBox" value="동의"></li>
						<li>사용 약관에 동의 하시겠습니까?<input type="checkbox" class="terms-checkBox" value="동의"></li>
						<li>사용 약관에 동의 하시겠습니까?<input type="checkbox" class="terms-checkBox" value="동의"></li>
					</ol>
			</div>
			<div>
					<button id="useTicket-final" disabled="disabled">사용하기</button>
			</div>
			<hr>
		</div>
	</div>
</body>
</html>