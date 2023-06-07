<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<!-- Favicon -->
<link rel="icon"
	href="../../resources/template/img/core-img/favicon.ico">
</head>
<body>
	<%@ include file="/resources/public/header.jsp"%>
	<section class="breadcumb-area bg-img bg-overlay"
		style="background-image: url(${pageContext.request.contextPath}/resources/template/img/bg-img/breadcumb3.jpg);">
		<div class="bradcumbContent">
			<p>난 혼자 산다</p>
			<h2>검색 페이지</h2>
		</div>
	</section>
	<form action="main.jsp">
		<button>메인으로</button>
	</form>
	<section class="events-area section-padding-100">
		<div class="container">
			<div class="row">
				<c:forEach items="${list}" var="vo">
					<div class="col-12 col-md-6 col-lg-4">
						<div class="single-event-area mb-30">
							<div class="event-thumbnail">
								<img src="../../resources/template/img/bg-img/e1.jpg" alt="x">
							</div>
							<div class="event-text">
								<h4>${vo.store_name}</h4>
								<div class="event-meta-data"></div>
								<a href="one?store_no=${vo.store_no}" class="btn see-more-btn">가게
									정보 보기</a>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
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