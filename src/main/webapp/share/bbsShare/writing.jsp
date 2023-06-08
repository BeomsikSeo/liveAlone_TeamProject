<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>상세 페이지</title>

    <!-- Favicon -->
    <link rel="icon" href="${pageContext.request.contextPath}/resources/template/img/core-img/favicon.ico">

    <!-- Stylesheet -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/template/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	window.onload = function() {
		var radios = document.querySelectorAll('input[name="bbsShareRequest"]');
		var span = document.getElementById('requestpoint');

		radios.forEach(function(radio) {
			radio.addEventListener('change', function() {
				if (this.value === '0') {
					span.textContent = "보상 ";
				} else if (this.value === '1') {
					span.textContent = "요구 ";
				}
			});
		});

		document.querySelector('form').addEventListener('submit', function(event) {
			  event.preventDefault(); // submit 이벤트의 기본 동작을 방지
				console.log("form start");
			  var form = this;

			  $.ajax({
			    url: "checkpoint",
			    type: 'POST',
			    data: {"nickname": "<%=session.getAttribute("nickname")%>"},
			    success: function(data) {
			      var point = parseInt(document.querySelector('input[name="bbsSharePoint"]').value);
			      if (data >= point || document.querySelector('input[name="bbsShareRequest"]:checked').value == 1) {
			        // AJAX를 사용하여 폼 데이터를 서버로 전송
			        $.ajax({
			          type : 'POST',
			          url : 'insert',
			          data : new FormData(form),
			          processData : false,
			          contentType : false
			        });

			        // 이전 페이지로 이동
			        history.back();
			      } else {
			        alert('포인트가 부족합니다. 보유포인트 : ' + data);
			      }
			    }
			  });
			});
		};
		
	</script>
	<style type="text/css">
	.tab { white-space: pre; }
	</style>
</head>
<body>
	<%@ include file="/resources/public/header.jsp"%>
	<!-- 헤더 파일 -->

	<!-- ##### Breadcumb Area Start ##### -->
	<section class="breadcumb-area bg-img bg-overlay"
		style="background-image: url(img/bg-img/breadcumb3.jpg);">
		<div class="bradcumbContent">
			<p></p>
			<h2>글쓰기 페이지</h2>
		</div>
	</section>
	<!-- ##### Breadcumb Area End ##### -->

	<!-- ##### Login Area Start ##### -->
	<section class="login-area section-padding-100">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-12 col-lg-8">
					<div class="login-content">
						<!-- Login Form -->
						<div class="login-form">
							<form action="writing" method="post" name="myForm">
								<div class="form-group">
									<label for="exampleInputEmail1">제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목<span class="tab">&#9;</span></label>
									<input type="text" name=bbsShareTitle size="60" maxlength="100" />
								</div>
								<div class="form-group">
									<label for="exampleInputEmail1">작&nbsp;&nbsp;&nbsp;&nbsp;성&nbsp;&nbsp;&nbsp;&nbsp;자<span class="tab">&#9;</span></label> <input
										type="text" name="bbsShareWriter" size="20" maxlength="30"
										value="<%=session.getAttribute("nickname")%>" readonly />
								</div>
								<div class="form-group">
									<label for="exampleInputEmail1">요청&nbsp;&nbsp;&nbsp;여부<span class="tab">&#9;</span></label> <input
										type="radio" name="bbsShareRequest" value="0"
										checked="checked" />요청<input type="radio"
										name="bbsShareRequest" value="1" />나눔
								</div>
								<div class="form-group">
									<label for="exampleInputEmail1"><span id="requestpoint">보상
									</span>포인트<span class="tab">&#9;</span></label> <input type="number" name="bbsSharePoint" size="5"
										maxlength="5" value="0" />
								</div>
								<div class="form-group">
									<label for="exampleInputEmail1">내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;용</label><br>
									<textarea rows="12" cols="80" name="bbsShareContent"></textarea>
								</div>

								<button type="submit" class="btn oneMusic-btn mt-30">글쓰기</button>

							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- ##### Login Area End ##### -->

















	<!-- ##### All Javascript Script ##### -->
    <!-- Popper js -->
    <script src="${pageContext.request.contextPath}/resources/template/js/bootstrap/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="${pageContext.request.contextPath}/resources/template/js/bootstrap/bootstrap.min.js"></script>
    <!-- All Plugins js -->
    <script src="${pageContext.request.contextPath}/resources/template/js/plugins/plugins.js"></script>
    <!-- Active js -->
    <script src="${pageContext.request.contextPath}/resources/template/js/active.js"></script>
    
	<%@ include file="/resources/public/footer.jsp" %>
</body>
</html>