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

<section class="breadcumb-area bg-img bg-overlay" style="background-image: url(${pageContext.request.contextPath}/resources/template/img/bg-img/breadcumb3.jpg);">
        <div class="bradcumbContent">
            <p>난 혼자 산다</p>
            <h2>메뉴 등록</h2>
        </div>
    </section>
<!-- 가게 등록 페이지에서 다음을 누르면 일단 store db에 저장하고 띄워줌 -->
<%-- 가게 등록 정보 <br>
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
카테고리 : ${vo.store_category} <br>  --%>
<form action="main.jsp"><button>메인</button></form>
<!-- <hr color="green"> -->


<!-- 메뉴 하나씩 등록 -->
<!-- 메뉴 정보 입력 <br>
메뉴명 : <input id="food_name"> <br>
가격 : <input id="food_price"> <br>
메뉴 설명 : <input id="food_info"> <br>
재료 : <input id="food_ingre"> <br>
사진 : <input id="food_img"> <br>
카테고리 : <input id="food_category"> <br> -->
<!-- <button id="b1">등록</button> -->
<!-- <div id="result2"></div> -->

<div class="blog-area section-padding-100">
		<div class="container">
			<div class="row">
				<div class="col-12 col-lg-9">

					<!-- Single Post Start -->
					<div class="single-blog-post mb-100 wow fadeInUp"
						data-wow-delay="100ms">
					<%-- 	<!-- Post Thumb -->
						<div class="blog-post-thumb mt-30">
							<a href="#"><img src="${pageContext.request.contextPath}/resources/template/img/bg-img/blog1.jpg" alt=""></a>
							<!-- Post Date -->
							<div class="post-date">
								<span>${vo.store_no}</span> <span>가게번호</span>
							</div>
						</div> --%>

						<!-- Blog Content -->
						<div class="blog-content">
							<!-- Post Title -->
							<a href="#" class="post-title">가게 등록 정보</a>
							<!-- Post Meta -->
							<div class="post-meta d-flex mb-30">
								<p class="post-author">
									가게번호 : ${vo.store_no}
								</p>
								<p class="post-author">
									가게명 : ${vo.store_name}
								</p>
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
							<p><h3>메뉴정보</h3><br><div id="result2"></div></p>
							<div class="login-content">
                        <h3>메뉴 정보 입력</h3>
                        <!-- Login Form -->
                        <div class="login-form">
								<div class="form-group">
									<label for="exampleInputEmail1">메뉴 이름</label>
									<input type="text" id="food_name" class="form-control" placeholder="메뉴이름 입력">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">가격</label>
									<input type="text" id="food_price" class="form-control" placeholder="가격 입력">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">메뉴 설명</label>
									<input type="text" id="food_info"class="form-control" placeholder="메뉴 설명">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">재료</label>
									<input type="text" class="form-control" id="food_ingre" placeholder="재료"><br>
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">사진</label>
									<input type="text" class="form-control" id="food_img" placeholder="사진" ><br>
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">카테고리</label>
									<input type="text" class="form-control" id="food_category" placeholder="메뉴 카테고리" ><br>
								<button type="submit" id="b1" class="btn oneMusic-btn mt-30">등록</button>
                        </div>
                    </div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
<!-- 	<section class="login-area section-padding-100">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12 col-lg-8">
                    <div class="login-content">
                        <h3>메뉴 정보 입력</h3>
                        Login Form
                        <div class="login-form">
								<div class="form-group">
									<label for="exampleInputEmail1">메뉴 이름</label>
									<input type="text" name="food_name" class="form-control" placeholder="가게이름 입력">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">가격</label>
									<input type="text" name="food_price" class="form-control" placeholder="주소 입력">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">메뉴 설명</label>
									<input type="text" name="food_info"class="form-control" placeholder="전화번호 입력">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">재료</label>
									<input type="text" class="form-control"name="food_ingre" placeholder="가게 설명"><br>
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">사진</label>
									<input type="text" class="form-control" name="food_img" placeholder="홀에 1인 좌석 개수 입력" ><br>
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">카테고리</label>
									<input type="text" class="form-control" name="food_category" placeholder="가게 사진 첨부" ><br>
								<button type="submit" id="b1" class="btn oneMusic-btn mt-30">등록</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section> -->
    
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