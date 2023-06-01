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
	<button id="checksession">세션 확인 버튼</button>
	<button id="clearsession">세션 초기화 버튼</button>
</body>
</html>