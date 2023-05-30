<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.4.js"></script>
<script type="text/javascript">
	$(function(){
		
		$(".redirectPage").click(function(){
			let pageName = $(this).val()
			console.log(pageName)
		})
	})
</script>
<style>

</style>
<title>Insert title here</title>
</head>
<body>
	결제를 취소하셨습니다
	${store.store_no }
	<button class="redirectPage" value= "${store.store_no }">이전 가게 메뉴로 돌아가기</button>
	<button class="redirectPage" value="index">가게 페이지로 돌아가기</button>
	
</body>
</html>