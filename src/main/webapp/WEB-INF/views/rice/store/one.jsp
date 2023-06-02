<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../../resources/js/jquery-3.6.4.js"></script>
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
<h3>난 혼자 산다 _ 가게정보</h3>
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
</body>
</html>