<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="sessiondelete">세션 초기화</a>
	<a href="member1">유저 : 가나다</a>
	<a href="member2">유저 : 나다라</a>
	<h3>검색</h3>
	<a href="list?pageno=1">게시물 리스트</a>
	<br>
	<hr>

	<form action="one" method="get">
		bbsShareNo : <input name="bbsShareNo" value="1"><br>
		<button type="submit">단일 검색</button>
	</form>
	<hr>

	<h3>게시물 작성</h3>
	<form action="insert" method="get">
		title : <input name="bbsShareTitle" value="title"><br>
		content : <input name="bbsShareContent" value="content"><br>
		category : <input name="bbsShareCategory" value="11010"><br>
		request : <input name="bbsShareRequest" value="0"><br>
		image : <input name="bbsShareImage" value="image01.jpg"><br>
		<button type="submit">insert</button>
	</form>
	<hr>

	<h3>게시물 수정</h3>
	<form action="update" method="get">
		title : <input name="bbsShareTitle" value="title"><br>
		content : <input name="bbsShareContent" value="content"><br>
		category : <input name="bbsShareCategory" value="11010"><br>
		image : <input name="bbsShareImage" value="image01.jpg"><br>
		<button type="submit">서버로 전송</button>
	</form>
	<hr>

	<h3>게시물 삭제</h3>
	<form action="delete" method="get">
		bbsShareNo : <input name="bbsShareNo"><br>
		<button type="submit">서버로 전송</button>
	</form>
	<hr>

</body>
</html>