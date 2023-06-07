<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Insert title here</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.4.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/template/style.css">
	<link rel="icon"
	href="../../resources/template/img/core-img/favicon.ico">
<script type="text/javascript">
	$(function() { // body 읽어오기
		
		$('#b1').click(function() {
			$.ajax({
					url: "insertFood",
					data: {
						food_name: $('#food_name').val(),
						food_price: $('#food_price').val(),
						food_info: $('#food_info').val(),
						food_ingre: $('#food_ingre').val(),
						food_img: $('#food_img').val(),
						food_category: $('#food_category').val(),
						store_no: ${no}
					},
					success: function(x) {
						$('#result2').append("<hr color=red>" + x + "<br>" + "<hr color=red>")
				} // success
			}) // ajax
		}) // b1
			
	}) // $
</script>
</head>
<body>
<%@ include file="/resources/public/header.jsp"%>
	<div class="preloader d-flex align-items-center justify-content-center">
        <div class="lds-ellipsis">
            <div></div>
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>
<section class="breadcumb-area bg-img bg-overlay" style="background-image: url(${pageContext.request.contextPath}/resources/template/img/bg-img/breadcumb3.jpg);">
        <div class="bradcumbContent">
            <p>난 혼자 산다</p>
            <h2>메뉴 등록</h2>
        </div>
    </section>
<!-- 가게 등록 페이지에서 다음을 누르면 일단 store db에 저장하고 띄워줌 -->
가게 등록 정보 <br>
가게번호 : ${vo.store_no} <br>
가게명 : ${vo.store_name} <br>
주소 : ${vo.store_addr} <br>
전화번호 : ${vo.store_tel} <br>
가게설명 : ${vo.store_info} <br>
1인좌석 수 : ${vo.store_single} <br>
사진 : ${vo.store_img} <br> 
영업일 : ${vo.store_day} <br> 
오픈시간 : ${vo.store_open} <br> 
종료시간 : ${vo.store_closed} <br> 
카테고리 : ${vo.store_category} <br> 
<form action="main.jsp"><button>메인</button></form>
<hr color="green">
<!-- 메뉴 하나씩 등록 -->
메뉴 정보 입력 <br>
메뉴명 : <input id="food_name"> <br>
가격 : <input id="food_price"> <br>
메뉴 설명 : <input id="food_info"> <br>
재료 : <input id="food_ingre"> <br>
사진 : <input id="food_img"> <br>
카테고리 : <input id="food_category"> <br>
<button id="b1">등록</button>
<div id="result2"></div>
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