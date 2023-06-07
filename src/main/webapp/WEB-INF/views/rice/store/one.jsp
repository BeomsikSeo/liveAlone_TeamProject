<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.4.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/template/style.css">
<script type="text/javascript">
	$(function() { // body 읽어오기
		
		$.ajax({
			url: "listFood",
			data: {store_no: ${vo.store_no}},
			success: function(x) {
				$('#result').append(x)
			} // success
		}) // ajax
			
	}) // $
</script>
</head>
<body>
<%@ include file="/resources/public/header.jsp" %>
<section class="breadcumb-area bg-img bg-overlay" style="background-image: url(${pageContext.request.contextPath}/resources/template/img/bg-img/breadcumb3.jpg);">
        <div class="bradcumbContent">
            <p>난 혼자 산다</p>
            <h2>가게 정보</h2>
        </div>
    </section>
<form action="main.jsp"><button>메인으로</button></form>
<hr color="blue">
<h3>가게정보</h3>
가게번호 : ${vo.store_no} <br>
가게명 : ${vo.store_name}<br>
주소 : ${vo.store_addr} <br>
전화번호 : ${vo.store_tel} <br>
가게설명 : ${vo.store_info} <br>
1인좌석 수 : ${vo.store_single} <br>
사진 : ${vo.store_img} <br>
영업일 : ${vo.store_day} <br>
오픈시간 : ${vo.store_open} <br>
종료시간 : ${vo.store_closed} <br>
카테고리 : ${vo.store_category} <br>
<h3>메뉴정보</h3>
<div id="result"></div>
<hr color="blue">
<form action="update.Store">
<button>수정</button>
</form>
<form action="delete.Store">
<button>삭제</button>
</form>
<form action="${pageContext.request.contextPath}/rice/order/menuOrder">
	<input type="hidden" name="store_no" value="${vo.store_no }">
	<button type="submit">티켓 주문</button>	
</form>
<%@ include file="/resources/public/footer.jsp"%>
<!-- jQuery-2.2.4 js -->
	<script
		src="${pageContext.request.contextPath}/resources/template/js/jquery/jquery-2.2.4.min.js"></script>
	<!-- Popper js -->
	<script
		src="${pageContext.request.contextPath}/resources/template/js/bootstrap/popper.min.js"></script>
	<!-- Bootstrap js -->
	<script
		src="${pageContext.request.contextPath}/resources/template/js/bootstrap/bootstrap.min.js"></script>
	<!-- All Plugins js -->
	<script
		src="${pageContext.request.contextPath}/resources/template/js/plugins/plugins.js"></script>
	<!-- Active js -->
	<script
		src="${pageContext.request.contextPath}/resources/template/js/active.js"></script>
</body>
</html>