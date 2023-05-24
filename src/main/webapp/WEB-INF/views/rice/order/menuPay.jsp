<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
	<% int num = 0; %>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="../../resources/js/jquery-3.6.4.js"></script>
<script type="text/javascript">
	$(function(){
			<%--
				사용자가 메뉴를 결정하면
				해당 메뉴의 총 가격을 결재 가격의 기본값으로 설정합니다.
			 --%>
			let totalPrice = Number($("#totalPrice").val());
			$("#payPrice").val(totalPrice)
		
			<%--
			
				사용자가 보유한 마일리지를 얼마나 사용할 것인지 입력 값을 적은것에 따라
			즉각적으로 값이 바뀌게 됩니다.
			
			--%>
		$("#userMileage").keyup(function(){
			let totalPrice = $("#totalPrice").val()
			let userMileage = $("#userMileage").val()
						
			totalPrice = Number(totalPrice)
			userMileage = Number(userMileage)
			
			console.log(totalPrice - userMileage)
			
			let payPrice = totalPrice - userMileage
			
			$("#payPrice").val(payPrice)
			
		})
		
		
		$("#userMileage").blur(function(){
			let userMileage = Number($("#userMileage").val())
			let maxMileage = ${memberInfo.mileage}
			
			if(maxMileage < userMileage){
				$("#userMileage").val(maxMileage)
				$("#payPrice").val(Number(totalPrice-maxMileage))
				
				$("#check_Mileage").text("회원님이 보유하신 " + maxMileage + "마일리지 이상 사용하실수 없습니다.")
				
			} else if( userMileage < 0) {
				$("#userMileage").val(0)
				$("#payPrice").val(Number(totalPrice))
				
				$("#check_Mileage").text("음수 값은 불가능합니다")
			}
		})
	})
</script>
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="kakaoPay">
	<div class="pay-info">
		<div class="pay-info-one">
			<table class="info-table">
				<tr>
					<td><input type="hidden" readonly="readonly" name="store_no" value="${store.store_no }"></td>
				</tr>
				<tr>
					<%-- 가게 이름 --%>
					<td> 가게 이름 </td>
					<td><input type="text" readonly="readonly" name="store_name" value="${store.store_name}"></td>
				</tr>
				<tr>
					<%-- 가게 정보 --%>
					<td> 가게 위치 </td>
					<td><input type="text" readonly="readonly" name="store_addr" value="${store.store_addr}"></td>
				</tr>
			</table>
		</div>
		<div class="pay-info-one">
			<table class="info-table">
				<tr>
					<td class="order-info">상품 명</td>
					<td class="order-info">상품 가격(개별)</td>
					<td class="order-info">상품 개수</td>
				</tr>
				<c:forEach items="${orderList }" var="order">
					<tr>
						<td><input type="text" class="order-info" name="list[<%= num %>].order_fName" value="${order.order_fName}" readonly="readonly"></td>
						<td><input type="text" class="order-info" name="list[<%= num %>].order_fPrice" value="${order.order_fPrice}" readonly="readonly"></td>
						<td><input type="text" class="order-info" name="list[<%= num %>].order_fCount" value="${order.order_fCount}" readonly="readonly"></td>
					</tr>
				<% num = num + 1; %>
				</c:forEach>
			</table>
		</div>
		<div class="pay-info-one">
			<table class="info-table">
				<tr>
					<td>주문 총 금액</td>
					<td colspan="2"><input type="text" class="order-info" id="totalPrice" value="${totalPrice }" readonly="readonly" ></td>
				</tr>
				<tr>
					<td rowspan="2">사용자 사용 마일리지</td>
					<td colspan="2"><input type="number" class="order-info" id="userMileage" name="ticket_usedMileage" value=0 min=0>
				</tr>
				<tr>
					<td colspan="2"><span id="check_Mileage">보유하고 계신 마일리지는 ${memberInfo.mileage} 입니다.</span></td>
				</tr>
				<tr>
					<td>사용자 결제 금액</td>
					<td colspan="2"><input type="text" class="order-info" id="payPrice" name="ticket_price" readonly="readonly"></td>
				</tr>
			</table>
		</div>
			<div>
			<button type="submit">
				KakaoPay결제
			</button>
			</div>
		</div>
	</form>


<%-- 결제 시  KakaoPay로 주문 내역, 티켓 정도에 사용되는 마일리지가 들어가게 됨 --%>
</body>
</html>
