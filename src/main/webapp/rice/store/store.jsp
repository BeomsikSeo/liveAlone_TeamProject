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
<%@ include file="/resources/public/header.jsp" %>
	<div class="preloader d-flex align-items-center justify-content-center">
        <div class="lds-ellipsis">
            <div></div>
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>
    
<section class="breadcumb-area bg-img bg-overlay" style="background-image: url(${pageContext.request.contextPath}/resources/template/img/bg-img/breadcumb3.jpg);">
        <div class="bradcumbContent">
            <p>난 혼자 산다</p>
            <h2>가게 등록</h2>
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
<!-- <hr color="blue">
<form action="insert" method="get">
가게 이름 : <input name="store_name"> <br>
주소 : <input name="store_addr"> <br>
전화번호 : <input name="store_tel"> <br>
설명 : <input name="store_info"> <br>
1인좌석 수 : <input name="store_single"> <br>
가게 사진 : <input name="store_img"> <br>
영업일 : <input name="store_day"> <br>
영업시작 : <input name="store_open"> <br>
영업종료 : <input name="store_closed"> <br>
카테고리 : <input name="store_category"> <br>
<button type="submit">다음</button> -->

<section class="login-area section-padding-100">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12 col-lg-8">
                    <div class="login-content">
                        <h3>가게 정보 입력</h3>
                        <!-- Login Form -->
                        <div class="login-form">
                            <form action="insert" method="get">
								<div class="form-group">
									<label for="exampleInputEmail1">가게 이름</label>
									<input type="text" name="store_name" class="form-control" placeholder="가게이름 입력">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">주소</label>
									<input type="text" name="store_addr" class="form-control" placeholder="주소 입력">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">전화번호</label>
									<input type="text" name="store_tel"class="form-control" placeholder="전화번호 입력">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">설명</label>
									<input type="text" class="form-control"name="store_info" placeholder="가게 설명"><br>
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">1인좌석 수</label>
									<input type="text" class="form-control" name="store_single" placeholder="홀에 1인 좌석 개수 입력" ><br>
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">가게 사진</label>
									<input type="text" class="form-control" name="store_img" placeholder="가게 사진 첨부" ><br>
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">영업일</label>
									<input type="text" class="form-control" name="store_day" placeholder="영업일" ><br>
								</div>
									<div class="form-group">
									<label for="exampleInputPassword1">영업시작</label>
									<input type="text" class="form-control" name="store_open" placeholder="오픈시각 입력" ><br>
								</div>
									<div class="form-group">
									<label for="exampleInputPassword1">영업종료</label>
									<input type="text" class="form-control" name="store_closed" placeholder="종료시각 입력" ><br>
								</div>
									<div class="form-group">
									<label for="exampleInputPassword1">카테고리</label>
									<input type="text" class="form-control" name="store_category" placeholder="카테고리 입력" ><br>
								</div>
								<button type="submit" class="btn oneMusic-btn mt-30">다음</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

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