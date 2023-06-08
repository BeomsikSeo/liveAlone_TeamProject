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
	href="${pageContext.request.contextPath}/resources/img/core-img/favicon.ico">
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
	<%@ include file="/resources/public/header.jsp"%>
	<section class="breadcumb-area bg-img bg-overlay"
		style="background-image: url(${pageContext.request.contextPath}/resources/template/img/bg-img/breadcumb3.jpg);">
		<div class="bradcumbContent">
			<p>난 혼자 산다</p>
			<h2>가게 정보</h2>
		</div>
	</section>
		<section class="elements-area mt-30 section-padding-100-0">
		<div class="container">
			<div class="row">

				<!-- ========== Buttons ========== -->
				<div class="col-12">
					<!-- Buttons -->
					<div class="oneMusic-buttons-area mb-100">
						<a href="../../mainPage.jsp" class="btn oneMusic-btn m-2">메인<i	class="fa fa-angle-double-right"></i></a>
						<a href="listStore"	class="btn oneMusic-btn btn-2 m-2">검색 페이지<i class="fa fa-angle-double-right"></i></a>
						<a href="store.jsp"	class="btn oneMusic-btn btn-2 m-2">가게/메뉴 등록<i class="fa fa-angle-double-right"></i></a>
					</div>
				</div>
			</div>
		</div>
	</section>
<!-- 	<form action="main.jsp">
		<button>메인으로</button>
	</form> -->
<%-- 	<hr color="blue">
	<h3>가게정보</h3>
	가게번호 : ${vo.store_no}
	<br> 가게명 : ${vo.store_name}
	<br> 주소 : ${vo.store_addr}
	<br> 전화번호 : ${vo.store_tel}
	<br> 가게설명 : ${vo.store_info}
	<br> 1인좌석 수 : ${vo.store_single}
	<br> 사진 : ${vo.store_img}
	<br> 영업일 : ${vo.store_day}
	<br> 오픈시간 : ${vo.store_open}
	<br> 종료시간 : ${vo.store_closed}
	<br> 카테고리 : ${vo.store_category}
	<br> --%>
	
	<!-- <div id="result"></div> -->
	<div class="blog-area section-padding-100">
		<div class="container">
			<div class="row">
				<div class="col-12 col-lg-9">

					<!-- Single Post Start -->
					<div class="single-blog-post mb-100 wow fadeInUp"
						data-wow-delay="100ms">
						<!-- Post Thumb -->
						<div class="blog-post-thumb mt-30">
							<a href="#"><img src="${pageContext.request.contextPath}/resources/template/img/bg-img/${vo.store_name}.jpg" alt=""></a>
							<!-- Post Date -->
							<div class="post-date">
								<span>${vo.store_no}</span> <span>가게번호</span>
							</div>
						</div>

						<!-- Blog Content -->
						<div class="blog-content">
							<!-- Post Title -->
							<a href="#" class="post-title">${vo.store_name}</a>
							<!-- Post Meta -->
							<div class="post-meta d-flex mb-30">
								<p class="post-author">
									주소 : ${vo.store_addr}
								</p>
								<p class="tags">
									전화번호 : ${vo.store_tel}
								</p>
								<p class="tags">
									가게설명 : ${vo.store_info}
								</p>
								<p class="tags">
									1인좌석 수 : ${vo.store_single}
								</p>
								<p class="tags">
									영업일 : ${vo.store_day}
								</p>
								<p class="tags">
									오픈시간 : ${vo.store_open}
								</p>
								<p class="tags">
									종료시간 : ${vo.store_closed}
								</p>
								<p class="tags">
									카테고리 : ${vo.store_category}
								</p>
							</div>
							<!-- Post Excerpt -->
							<p><h3>메뉴정보</h3><br><div id="result"></div></p>
							<div class="login-form">
                            <form action="${pageContext.request.contextPath}/rice/order/menuOrder">
                            	<input type="hidden" name="store_no" value="${vo.store_no }">
								<button type="submit" class="btn oneMusic-btn mt-30">티켓주문</button>
                            </form>
                        </div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
<%-- 	<section class="login-area section-padding-100">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12 col-lg-8">
                    <div class="login-content">
                        <div class="login-form">
                            <form action="${pageContext.request.contextPath}/rice/order/menuOrder">
                            	<input type="hidden" name="store_no" value="${vo.store_no }">
								<button type="submit" class="btn oneMusic-btn mt-30">티켓주문</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section> --%>
	<form action="update.Store">
		<button>수정</button>
	</form>
	<form action="delete.Store">
		<button>삭제</button>
	</form>
<%-- 	<form action="${pageContext.request.contextPath}/rice/order/menuOrder">
		<input type="hidden" name="store_no" value="${vo.store_no }">
		<button type="submit">티켓 주문</button>
	</form> --%>
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