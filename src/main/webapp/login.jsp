<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="login" method="post">
		<pre>
아이디	&nbsp;: <input type="text" name="member_id" placeholder="아이디 입력"
				pattern="[a-zA-Z0-9!@#$%^&]*"><br> 
비밀번호 : <input type="password" id="password" name="password"
				placeholder="비밀번호 입력" pattern="[a-zA-Z0-9!@#$%^&]*"><br>
<input type="submit" value="로그인">
</pre>
	</form>
	<span id="check"></span>
	<a href="signup.jsp"><button>회원가입</button></a>
	<a href="share/bbsShare/certification.jsp"><button>인증페이지</button></a>
	<a href="share/bbsShare/list?pageno=1"><button>리스트</button></a>
</body>
</html>