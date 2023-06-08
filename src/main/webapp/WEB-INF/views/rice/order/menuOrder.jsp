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
		// 주문 수량 input의 갯수
		const collection = document.getElementsByClassName("menu-counter");	
		
		
	<%--
		count-button 클래스에 있는 버튼을 누르면
		count-button 형제 요소인  menu_count 요소를 증가/감소 합니다.
	--%>
	$('.count-button').click(function() {
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
		
		$('#submit-button').click(function(){
			let count = 0;
			for(let i=0; i<collection.length; i++){
				count = count + collection[i].value;
			}
			
			if(count == 0){
				$("#error-message").text("주문하시는 메뉴의 수량은 1개 이상이어야 합니다.")
				event.preventDefault();
			}
		})
		
	$
	})
</script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/template/style.css">
<%-- CSS 부분입니다. --%>
<style type="text/css">
	
	button.count-button {
		border-radius : 5px;
	
		height : 30px;
		width : 40px;
		
	}
	
	input.menu-counter{
	
		font-weight : 750;
		height : 30px;
		width : 80px;
	}

	p#error-message {
		text-align :center;
		
		font-weight: bold;
	}
</style>
<title>${store.store_name } 주문 >> 난 혼자 산다</title>
</head>
<body>
    <%@ include file="/resources/public/header.jsp" %>
	
	<section class="breadcumb-area bg-img bg-overlay" style="background-image: url(../../resources/img/rice/ticket/food-Ticket-unsplash.jpg);">
        <div class="bradcumbContent">
            <p>메뉴 주문</p>
            <h2>${store.store_name }</h2>
        </div>
    </section>
    
	<section class="events-area section-padding-100">
	<form action="menuPay" method="post">
        <div class="container">
        	<input type="hidden" name="store_name" value="${store.store_name }">
       		<input type="hidden" name="store_no" value="${store.store_no }">
            <div class="row">
				<% int num = 0; %>
				<c:forEach items="${list }" var="menu">
	                <!-- Single Event Area -->
	                <div class="col-12 col-md-6 col-lg-4">
	                    <div class="single-event-area mb-30">
	                        <div class="event-thumbnail">
	                          <img alt="error" src="${pageContext.request.contextPath}/resources/img/rice/ticket/food-Ticket-defaultFoodImage.png">
							 </div>
	                        <div class="event-text">
	                            <h4>${menu.food_name}</h4>
	                            <input type="hidden" name="list[<%= num %>].order_fName" value='${menu.food_name}'>
	                            <div class="event-meta-data">
	                                <a href="#" class="event-place">${menu.food_info}</a>
	                                <a href="#" class="event-date">${menu.food_price}원</a>
									<input type="hidden" name="list[<%= num %>].order_fPrice" value='${menu.food_price}'>
	                            </div>
	                            
	                            <div class="menu-count">
									<button class="count-button" value="minus" type="button">-1</button>
									<input type="text" value='0' readonly="readonly" class="menu-counter" name="list[<%=num%>].order_fCount" style="text-align : center;">
									<button class="count-button" value="plus" type="button">+1</button>
								</div>
	                        </div>
	                    </div>
	                </div>
	           		<% num = num + 1; %>
				</c:forEach>
	        </div>
	        <div class="row">
	                <div class="col-12">
	                	<div >
	                		
	                	</div>
	                    <div class="load-more-btn text-center mt-70">
	                    	<p id="error-message" style="color: red"></p>
	                        <button type="submit" class="btn oneMusic-btn" id="submit-button">결제하기<i class="fa fa-angle-double-right"></i></button><br>
	                        <a href="javascript:history.back();"><button type="button" class="btn oneMusic-btn mt-30">이전 페이지</button></a> 
	                    </div>
	                </div>
	       </div>
        </div>
    </form>
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
</body>
</html>