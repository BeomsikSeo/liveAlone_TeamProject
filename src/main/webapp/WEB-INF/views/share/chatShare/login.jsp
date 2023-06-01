<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>로그인 성공</h3>
현재 세션 : <%= session.getAttribute("member_id")%>
<hr color="red">
<a href="../bbsShare/list?pageno=1"><button>버튼</button></a>
<form action="../bbsShare/list" method="get">
	<button type="submit">게시물 리스트</button>
</form>
<a href="../../mypage/mypage?login_id=<%= session.getAttribute("member_id")%>"><button>마이페이지</button></a>
</body>
</html>