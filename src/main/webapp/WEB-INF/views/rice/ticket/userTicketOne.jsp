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
		
		if(  "미사용" != "${ticket.ticket_use}"){
			
			$("#use-ticket-button").remove();
			$("#refund-ticket-button").remove();
			$("#terms-list-1").remove();
		}
			
			
		$("#Ticket-List").click(function(){
			location.href="userTicket";
		})
		
		$("#Ticket-Use").click(function(){
			console.log("클릭")
			if (document.getElementById("terms-list-1").style.display==='none'){
				document.getElementById("terms-list-1").style.display = "block";
			} else {
				document.getElementById("terms-list-1").style.display = "none";
			}
		})
		
		$("#Ticket-Refund").click(function(){
			console.log("클릭")
			if (document.getElementById("terms-list-2").style.display==='none'){
				document.getElementById("terms-list-2").style.display = "block";
			} else {
				document.getElementById("terms-list-2").style.display = "none";
			}
		})
		
		$(".terms-checkBox-1").click(function(){
			console.log($('.terms-checkBox-1').filter(":checked").length)
			console.log($('.terms-checkBox-1').length)
			console.log($('.terms-checkBox-1').filter(":checked").length==$('.terms-checkBox-1').length)
			
			if ($('.terms-checkBox-1').filter(":checked").length == $('.terms-checkBox-1').length){
				$("#useTicket-final").attr("disabled", false);
			} else{
				$("#useTicket-final").attr("disabled", true);
			}
		})
		
		$(".terms-checkBox-2").click(function(){
			console.log($('.terms-checkBox-2').filter(":checked").length)
			console.log($('.terms-checkBox-2').length)
			console.log($('.terms-checkBox-2').filter(":checked").length==$('.terms-checkBox-2').length)
			
			if ($('.terms-checkBox-2').filter(":checked").length == $('.terms-checkBox-2').length){
				$("#useTicket-final-2").attr("disabled", false);
			} else{
				$("#useTicket-final-2").attr("disabled", true);
			}
		})
		
		$("#useTicket-final").click(function(){
			location.href="userTicketUpdate?ticket_ID=${ticket.ticket_ID}&update=1"
		})
		
		$("#useTicket-final-2").click(function(){
			$.ajax({
				url : "${pageContext.request.contextPath}/rice/order/kakaoPayRefund?ticket_ID=${ticket.ticket_ID}",
				type : "POST",
				success : function() {
					window.location.reload()
				} 
			})
		})
	})
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
					<td class = "ticket-info-title">식권 발행 시간</td>
					<td class = "ticket-info-content">${ticket.ticket_start }</td>
				</tr>
				<tr>
					<td class = "ticket-info-title">식권 마감 시간</td>
					<td class = "ticket-info-content">${ticket.ticket_end }</td>
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
			<div class="ticket-button" id="refund-ticket-button"><%-- <a href="${pageContext.request.contextPath}/index.jsp"> --%><button id="Ticket-Refund">식권 환불</button><!-- </a> --></div>
			<hr>
		</div>
			
		<div id="terms-list-1" style="display : none;">
			<div>
					<table>
						<tr>
							<td>1. 고객 실수로 인한 식권 사용한 취소는 불가능합니다.</td>
							<td><input type="checkbox" class="terms-checkBox-1" value="동의">확인</td>
						</tr>
						<tr>
							<td>2. 식권 사용에 사용된 마일리지 내역은 확인이 가능합니다.</td>
							<td><input type="checkbox" class="terms-checkBox-1" value="동의">확인</td>
						</tr>
						<tr>
							<td>3. 위의 약관에 대한 숙지를 모두 했습니다.</td>
							<td><input type="checkbox" class="terms-checkBox-1" value="동의">확인</td>
						</tr>
					</table>
			</div>
			<div>
					<button id="useTicket-final" disabled="disabled">사용하기</button>
			</div>
			<hr>
		</div>
		<div id="terms-list-2" style="display : none;">
			<div>
					<table>
						<tr>
							<td>1. 환불 시 티켓 환불시 고객님께서 사용하신 금액의 <b>90%</b> 만 환불됩니다.</td>
							<td><input type="checkbox" class="terms-checkBox-2" value="동의">확인</td>
						</tr>
						<tr>
							<td>2. 환불 시 티켓 환불시 고객님께서 사용하신 마일리지의 <b>90%</b> 회수됩니다.</td>
							<td><input type="checkbox" class="terms-checkBox-2" value="동의">확인</td>
						</tr>
						<tr>
							<td>3. 위의 약관에 대한 내용을 숙지를 모두 했습니다.</td>
							<td><input type="checkbox" class="terms-checkBox-2" value="동의">확인</td>
						</tr>
					</table>
			</div>
			<div>
					<button id="useTicket-final-2" disabled="disabled">환불하기</button>
			</div>
			<hr>
		</div>
	</div>
</body>
</html>