<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
	<% int num = 0; %>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.4.js"></script>
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
				
				$("#check_Mileage").text("회원님이 보유하신 " + maxMileage + "마일리지 이상을 사용하실 수 없습니다.")
				
			} else if( userMileage < 0) {
				$("#userMileage").val(0)
				$("#payPrice").val(Number(totalPrice))
				
				$("#check_Mileage").text("음수 값은 불가능합니다")
			}
		})
		
		document.addEventListener('keydown', function(event) {
			  if (event.keyCode === 13) {
			    event.preventDefault();
			  };
			}, true);
	})
</script>


<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/template/style.css">
<style>
	table {
		border-spacing: 5px;
		
		border-collapse: separate;
	}
	td.header{
		width:50px;
	}
</style>

<title>Insert title here</title>
</head>
<body>
	 <%@ include file="/resources/public/header.jsp" %>
    
	<section class="breadcumb-area bg-img bg-overlay" style="background-image: url(${pageContext.request.contextPath}/resources/templa/img/bg-img/breadcumb3.jpg);">
        <div class="bradcumbContent">
            <p>최종 결제 정보</p>
            <h2>${store.store_name }</h2>
        </div>
    </section>
    
	<section class="login-area section-padding-100">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12 col-lg-8">
                 <form method="post" action="kakaoPay">
                    <div class="login-content">
                        <h3>가게정보</h3>
                        <div class="login-form">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">가게 이름</label>
                                    <input type="hidden" class="form-control" readonly="readonly" name="store_no" value="${store.store_no }">
                                    <input type="text" class="form-control" readonly="readonly" name="store_name" value="${store.store_name}">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">가게 위치</label>
                                    <input type="text" class="form-control" readonly="readonly" name="store_addr" value="${store.store_addr}">
                                </div>
                                <hr>
                        </div>
                        <h3>주문 정보</h3>
                        <div class="login-form">
                        	<table>
                        		<tr>
                        			<td></td>
                        			<td><label for="exampleInputEmail1"><b>상품 이름</b></label></td>
                        			<td><label for="exampleInputEmail1"><b>상품 가격 (원)</b></label></td>
                        			<td><label for="exampleInputEmail1"><b>주문 갯수</b></label></td>
                        		</tr>
                        		<c:forEach items="${orderList }" var="order">
									<tr>
										<td class="header"><h5><%= num+1 %></h5></td>
										<td><input type="text" class="form-control" name="list[<%= num %>].order_fName" value="${order.order_fName}" readonly="readonly"></td>
										<td><input type="text" class="form-control" name="list[<%= num %>].order_fPrice" value="${order.order_fPrice}" readonly="readonly"></td>
										<td><input type="text" class="form-control" name="list[<%= num %>].order_fCount" value="${order.order_fCount}" readonly="readonly"></td>
									</tr>
								<% num = num + 1; %>
								</c:forEach>
                        	</table>
                        	<hr>
                        </div>
                        <h3>마일리지 사용 여부</h3>
                        <div class="login-form">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">주문 총 금액</label>
                                    <input type="text" class="form-control" class="order-info" id="totalPrice" value="${totalPrice }" readonly="readonly">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">보유 마일리지</label>
                                    <input type="text" id="userMileage" class="form-control" name="ticket_usedMileage" value=0 min=0>
                                    <small id="check_Mileage" class="form-text text-muted">보유하고 계신 마일리지는 ${memberInfo.mileage} 입니다.</small>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">사용자 결제 금액</label>
                                    <input type="text" id="payPrice" class="form-control" name="ticket_price" value=${totalPrice } min=0>
                                </div>
                        </div>
                        <button type="submit" class="btn oneMusic-btn mt-30">카카오 페이 결제</button><br>
                        <a href="javascript:history.back();"><button type="button" class="btn oneMusic-btn mt-30">이전 페이지</button></a> 
                    </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
    
    <%@ include file="/resources/public/footer.jsp" %>
	<div>
    <!-- jQuery-2.2.4 js -->
    <script src="${pageContext.request.contextPath}/resources/template/js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="${pageContext.request.contextPath}/resources/template/js/bootstrap/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="${pageContext.request.contextPath}/resources/template/js/bootstrap/bootstrap.min.js"></script>
    <!-- All Plugins js -->
    <script src="${pageContext.request.contextPath}/resources/template/js/plugins/plugins.js"></script>
    <!-- Active js -->
    <script src="${pageContext.request.contextPath}/resources/template/js/active.js"></script>
	</div>

<%-- 결제 시  KakaoPay로 주문 내역, 티켓 정도에 사용되는 마일리지가 들어가게 됨 --%>
</body>
</html>
