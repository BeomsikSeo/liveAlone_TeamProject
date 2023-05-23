<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- JavaScript 부분입니다. --%>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.4.js"></script>
<script type="text/javascript">
	$(function() {
	<%--
		count_button 클래스에 있는 버튼을 누르면
		count_button 형제 요소인  menu_count 요소를 증가/감소 합니다.
	--%>
	$('.count_button').click(function() {
			let num = $(this).val()

			let count = $(this).siblings('.menu-counter').val()
			count = Number(count)

			// 더하기 이면 해당 
			if (num == 'plus') {
				count += 1;
			} else if (num == 'minus' && count > 0) {
				count -= 1;
			}

			$(this).siblings('.menu-counter').val(count);
		})
	})
</script>

<%-- CSS 부분입니다. --%>
<style type="text/css">

/*	전체 	*/
.order-menu {
	display : inline-block;
	
	width : 90vw;
	
	background-color: red;
	
}

.order-menu-info {
	display : block;
	
	width : 90%;
	
	background-color : yellow;
	
	padding : 15px;
	margin : 15px;
}

.menu {
	display: inline-block;
	height : 300px;
	width : 20%;
	
	border : 1px solid black;
	margin: 5px; 
	
	background-color : lime;
	
	text-align : center;
}



</style>
<title>Insert title here</title>
</head>
<body>
	<div class = "order-menu" >
		<form action="menuPay" method="post">
			<div class = "order-menu-info" id="store-info">
				<%-- 가게 정보를 표시하는 곳 입니다. --%>
				<input type="text" name="store_name" value="${store.store_name }" style="font-size: large;">
				<input type="hidden" name="store_no" value="${store.store_no }">
			</div>
			<hr>
			
			<div class ="order-menu-info" id="menu-list">
				<%-- 음식 메뉴 정보들을 정렬해 놓은 곳 입니다. --%>
				<% int num = 0; %>
				<c:forEach items="${list }" var="menu">
					
					<div class="menu" id="menu_<%= num %>">
					
						<%-- 메뉴 하나의 정보 --%>
						<div class="menu-info">
							<input class = "menu-info-detail" name="list[<%= num %>].order_fName" readonly="readonly" value='${menu.food_name}'>
							<input class = "menu-info-detail" name="list[<%= num %>].order_fPrice" readonly="readonly" value='${menu.food_price}'>
							<input class = "menu-info-detail" readonly="readonly" value="${menu.food_info}">
						</div>
						
						<%-- 메뉴 수량  --%>
						<div class="menu-count">
							<button class="count_button" value="minus" type="button">-1</button>
							<input type="text" value='0' readonly="readonly" class="menu-counter" name="list[<%=num%>].order_fCount">
							<button class="count_button" value="plus" type="button">+1</button>
						</div>
						
					</div>
					<% num = num + 1; %>
				</c:forEach>
			</div>
			<hr>
			
			<%-- 결제 조건이 맞는지를 표시해주는 페이지 입니다. --%>
			<div class ="order-menu-info" id="check-info">
				<button type="submit">주문하기</button>
			</div>
		</form>
	</div>
</body>
</html>