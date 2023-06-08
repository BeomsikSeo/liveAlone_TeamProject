<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<!-- 헤더 파일 -->

	<div class="breadcumb-area bg-img bg-overlay"
		style="background-image: url(${pageContext.request.contextPath}/resources/template/img/bg-img/breadcumb3.jpg);">
		<div class="bradcumbContent">
			<p>게시글별 채팅목록</p>
			<h2>post chat list</h2>
		</div>
	</div>
	
<div class="mt-5">
	<section class="events-area section-padding-50">
		<div class="container">
			<div class="row">
				<c:forEach items="${list}" var="bag">
					<!-- Single Event Area -->
					<div class="col-12 col-md-6 col-lg-4">
						<div class="single-event-area mb-30">
							<div class="event-text" id="click">
	
								<div class="event-meta-data">
									<a class="event-place">채팅 요청자 : ${bag.chatRequestor}</a> <a
										class="event-date">게시글 작성자 : ${bag.chatReceiver}</a>
								</div>
								<h4>${bag.content}</h4>
	
	
								<form action="chatRoom" method="post">
									<input type="hidden" name="roomNo" value="${bag.roomNo}"> 
									<button class="btn oneMusic-btn mt-30">채팅</button>
								</form>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
</div>
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