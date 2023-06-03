<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up Page</title>

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
	    <%System.out.println("idval : 0");%>
	});
	
	$('input[name="nickname"]').on('change', function() {
	    nickval = 0;
	    <%System.out.println("nickval : 0");%>
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
</head>
<body>
<form action="signup" method="get">
<pre>
아이디	&nbsp;: <input type="text" name="member_id" placeholder="아이디 입력" pattern="[a-zA-Z0-9!@#$%^&]*"> <button type="button" id="checkid">중복확인</button><br> 
비밀번호 : <input type="password" id="password" name="password" placeholder="비밀번호 입력" pattern="[a-zA-Z0-9!@#$%^&]*"><br>
비밀번호 확인: <input type="password" id="password_check" name="password_check" placeholder="비밀번호를 재입력"> <span id="pwcheck"></span><br>
아이디,비밀번호로 알파벳 소문자,대문자,!@#$%^& 사용 가능<br>
별명	&nbsp;: <input type="text" name="nickname" placeholder="별명을 입력하세요"> <button type="button" id="checknick">중복확인</button><br>
주소	&nbsp;: <input type="text" id="address_kakao" name="address" placeholder="클릭하여 주소입력" readonly><br>
상세주소&nbsp;: <input type="text" name="address_detail" placeholder="상세주소 입력" ><br>
</pre>
		
		상세주소를 제외한 정보는 모두 필수사항입니다.<br>
		
		<input type="submit" value="회원가입">
	</form>
</body>
</html>