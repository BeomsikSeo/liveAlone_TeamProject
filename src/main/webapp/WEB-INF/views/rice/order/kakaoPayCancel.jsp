<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.4.js"></script>
<script type="text/javascript">
	$(function(){
		<%--	계속해서 결제가 되는 것을 막기위 바로 redirect로 다른 페이지로 넘깁니다.	--%>
		location.href="/liveAlone/index.jsp"
	})
</script>
<title>Insert title here</title>
</head>
<body>
	결제 취소
</body>
</html>