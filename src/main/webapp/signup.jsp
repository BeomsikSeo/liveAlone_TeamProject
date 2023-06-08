<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>회원가입</title>

    <!-- Favicon -->
    <link rel="icon" href="resources/template/img/core-img/favicon.ico">

    <!-- Stylesheet -->
    <link rel="stylesheet" href="resources/template/style.css">

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
window.onload = function(){
    document.getElementById("address_kakao").addEventListener("click", function(){ //주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("address_kakao").value = data.address; // 주소 넣기
                document.querySelector("input[name=address_detail]").focus(); //상세입력 포커싱
            }
        }).open();
    });
}

</script>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>

$(document).ready(function() {
	var idval = 0;
	var nickval = 0;
	
	$('input[name="member_id"]').on('change', function() {
	    idval = 0;
	});
	
	$('input[name="nickname"]').on('change', function() {
	    nickval = 0;
	});
	
	$('input[name="password"], input[name="password_check"]').on('keyup', function() {
	    var password = $('input[name="password"]').val();
	    var passwordCheck = $('input[name="password_check"]').val();
	    if (password === passwordCheck) {
	        $('#pwcheck').text('비밀번호가 같습니다');
	    } else {
	        $('#pwcheck').text('비밀번호가 다릅니다');
	    }
	});
	
	
    $('#checkid').on('click', function() {
    	var member_id = $('input[name="member_id"]').val();
    	if (member_id == "") {
			alert('아이디를 입력해주세요');
		}else{
			$.ajax({
	            url: "checkid",
	            type: 'POST',
	            data: {"member_id": member_id},
	            success: function(data) {
	            	if (data == 0) {
	                    alert('사용 가능한 아이디입니다.');
	                	idval = 1;
	            	    <%System.out.println("idval : 1");%>
		            } else {
	                    $('input[name="member_id"]').val('');
	                    alert('이미 존재하는 아이디입니다.');
		            }
	            }
	        });
		}
    });
    
    $('#checknick').on('click', function() {
    	var nickname = $('input[name="nickname"]').val();
    	if (nickname == "") {
			alert('별명을 입력해주세요');
		}else{
			$.ajax({
		        url: "checknick",
		        type: 'POST',
		        data: {"nickname": nickname},
		        success: function(data) {
		            if (data == 0) {
		                alert('사용 가능한 별명입니다.');
		                nickval = 1;
	            	    <%System.out.println("nickval : 1");%>
		            } else {
		                $('input[name="nickname"]').val('');
		                alert('이미 존재하는 별명입니다.');
		            }
		        }
		    });
		}
    });
   	
    $('form').on('submit', function(event) {
        event.preventDefault();
        var member_id = $('input[name="member_id"]').val();
        var password = $('input[name="password"]').val();
        var passwordCheck = $('input[name="password_check"]').val();
        var nickname = $('input[name="nickname"]').val();
        var addressA = $('input[name="address"]').val();
        var addressB = $('input[name="address_detail"]').val();
        var address = addressA.replace(/ /g, '_') + '_' + addressB.replace(/ /g, '_');
        
        if (password !== passwordCheck) {
			alert('비밀번호를 확인해주세요');
		}else if (member_id=="" || password=="" || passwordCheck=="" ||nickname==""||addressA==""){
			alert('필수항목을 채워주세요');
		}else if (idval == 0){
			alert('아이디 중복확인이 필요합니다');
		}else if (nickval == 0){
			alert('별명 중복확인이 필요합니다');
		}
		else{
			 $.ajax({
		            url: 'signup',
		            type: 'POST',
		            data: {"member_id": member_id,
		            	"password" : password,
		            	"nickname" : nickname,
		            	"address" : address
		            	},
		            success: function() {
		    			alert('회원가입이 완료되었습니다');
		            	location.href="mainPage.jsp";
		            },
		            error: function(xhr, status, error) {
		                alert('회원가입에 실패했습니다. 다시 시도해주세요.');
		            }
		        });
		}
    });
    
});


</script>
<style>
  #checkid, #checknick {
    border-color: lightgray;
    float: right;
  }
</style>
</head>
<body>

	<%@ include file="/resources/public/header.jsp" %> <!-- 헤더 파일 -->
	
	<div class="preloader d-flex align-items-center justify-content-center">
        <div class="lds-ellipsis">
            <div></div>
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>
	
	<!-- ##### Breadcumb Area Start ##### -->
    <section class="breadcumb-area bg-img bg-overlay" style="background-image: url(resources/template/img/bg-img/breadcumb3.jpg);">
        <div class="bradcumbContent">
            <p>Welcome Solo life</p>
            <h2>Sign up</h2>
        </div>
    </section>
    <!-- ##### Breadcumb Area End ##### -->

    <!-- ##### Login Area Start ##### -->
    <section class="login-area section-padding-100">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12 col-lg-8">
                    <div class="login-content">
                        <h3>Welcome</h3>
                        <!-- Login Form -->
                        <div class="login-form">
                            <form action="login" method="post">
								<div class="form-group">
									<label for="exampleInputEmail1">아이디</label>
									<input type="text" name="member_id" class="form-control" placeholder="아이디 입력" pattern="[a-zA-Z0-9!@#$%^&]*">
									<button type="button" id="checkid">중복확인</button>
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">비밀번호</label>
									<input type="password" id="password" class="form-control" name="password" placeholder="비밀번호 입력" pattern="[a-zA-Z0-9!@#$%^&]*">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">비밀번호 확인 </label>
									<input type="password" id="password_check" class="form-control" name="password_check" placeholder="비밀번호를 재입력">
									<span id="pwcheck"></span>&nbsp;<br><small>아이디,비밀번호로 알파벳 소문자,대문자,!@#$%^& 사용 가능</small><br>
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">별명</label>
									<input type="text" name="nickname"class="form-control" placeholder="별명을 입력하세요">
									<button type="button" id="checknick">중복확인</button><br>
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">주소</label>
									<input type="text" id="address_kakao" class="form-control"name="address" placeholder="클릭하여 주소입력" readonly><br>
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">상세주소</label>
									<input type="text" class="form-control" name="address_detail" placeholder="상세주소 입력" ><br>
								</div>
								
								상세주소를 제외한 정보는 모두 필수사항입니다.<br>
								<button type="submit" class="btn oneMusic-btn mt-30">회원가입</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ##### Login Area End ##### -->

	
	<!-- ##### All Javascript Script ##### -->
    <!-- jQuery-2.2.4 js -->
    <script src="resources/template/js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="resources/template/js/bootstrap/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="resources/template/js/bootstrap/bootstrap.min.js"></script>
    <!-- All Plugins js -->
    <script src="resources/template/js/plugins/plugins.js"></script>
    <!-- Active js -->
    <script src="resources/template/js/active.js"></script>
    
	<%@ include file="/resources/public/footer.jsp" %>
</body>
</html>