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
<script type="text/javascript">
	
	$(function() {
		$('#b1').click(function() {
			$("#result").empty()
			$.ajax({
				url : "userInfo",
				success : function(x) {
					$('#result').append(x)
				}
			})
		})
		
		$('#b2').click(function() {
			$("#result").empty()
			$.ajax({
				url : "userChatList",
				data : {
					nowSession : "${member_id}"
				},
				success : function(x) {
					$('#result').append(x)
				} // success
			}) // ajax
		}) // b1
		
	})
</script>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/template/style.css">
</head>
<body>
	<%@ include file="/resources/public/header.jsp"%>
	<!-- 헤더 파일 -->

	<div class="breadcumb-area bg-img bg-overlay"
		style="background-image: url(${pageContext.request.contextPath}/resources/template/img/bg-img/breadcumb3.jpg);">
		<div class="bradcumbContent">
			<p>마이페이지</p>
			<h2>My Page</h2>
		</div>
	</div>

	<section class="elements-area mt-30 section-padding-100-0">
		<div class="container">
			<div class="row">

				<!-- ========== Buttons ========== -->
				<div class="col-12">
				
					<!-- Buttons -->
					<div class="oneMusic-buttons-area mb-70">
						<button id="b1" class="btn oneMusic-btn btn-2 m-2">회원 정보</button>
						<button id="b2" class="btn oneMusic-btn btn-2 m-2">지식인의 당근 채팅</button>
					</div>
				</div>
			</div>
		</div>

		<div class="col-12" id="result">
		
			<div class="elements-title mb-70" style="margin-left: 70px;">
				<h2><u>회원정보</u></h2>
			</div>
			
			<div class="oneMusic-cool-facts-area">
				<div class="row">

					<!-- Single Cool Facts -->
						<div class="single-cool-fact mb-100" style="margin-left: 100px;">
							<div class="scf-text">
								<h2>${bag.member_id}</h2>
								<p style="font-size: 20px;">아이디</p>
							</div>
						</div>

					<!-- Single Cool Facts -->
						<div class="single-cool-fact mb-100" style="margin-left: 100px;">
							<div class="scf-text">
								<h2>${bag.nickname}</h2>
								<p style="font-size: 20px;">닉네임</p>
							</div>
						</div>

					<!-- Single Cool Facts -->
						<div class="single-cool-fact mb-100" style="margin-left: 100px;">
							<div class="scf-text">
								<h2>
									<c:choose>
										<c:when test="${bag.certification eq 1}">
													O
												</c:when>
										<c:otherwise>
													X
												</c:otherwise>
									</c:choose>
								</h2>
								<p style="font-size: 20px;">지역인증</p>
							</div>
						</div>

					<!-- Single Cool Facts -->
						<div class="single-cool-fact mb-100" style="margin-left: 100px;">
							<div class="scf-text">
								<h2>
									<span class="counter">${bag.count}</span>
								</h2>
								<p style="font-size: 20px;">성사횟수</p>
							</div>
						</div>

					<!-- Single Cool Facts -->
						<div class="single-cool-fact mb-100" style="margin-left: 100px;">
							<div class="scf-text">
								<h2>
									<span class="counter">${bag.point}</span>
								</h2>
								<p style="font-size: 20px;">보유 포인트</p>
							</div>
						</div>

						<div class="single-cool-fact mb-100" style="margin-left: 100px;">
							<div class="scf-text">
								<h2>
									<span class="counter">${bag.mileage}</span>
								</h2>
								<p style="font-size: 20px;">보유 마일리지</p>
							</div>
						</div>
					
					<!-- Single Cool Facts -->
						<div class="single-cool-fact mb-100" style="margin-left: 100px;">
							<h2>${bag.address.replace('_', ' ')}</h2>
							<p style="font-size: 20px;">주소</p>
						</div>
				</div>
			</div>
		</div>
		
	</section>



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