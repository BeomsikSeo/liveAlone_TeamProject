<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.6.4.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/template/style.css">
</head>
<body>
	<%@ include file="/resources/public/header.jsp"%>
	<h3>난 혼자 산다 _ 혼밥 메인</h3>
	<hr color="blue">
	<form action="../../mainPage.jsp">
		<button>메인</button>
	</form>
	<form action="listStore">
		<button>검색 페이지</button>
	</form>
	<form action="store.jsp">
		<button>가게/메뉴 등록</button>
	</form>
	<%@ include file="/resources/public/footer.jsp"%>
	<div>
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
	</div>
</body>
</html>