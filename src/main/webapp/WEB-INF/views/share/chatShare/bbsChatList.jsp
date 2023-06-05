<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
채팅리스트<br>
<c:forEach items="${list}" var="list">
<hr color="red">
<!-- form으로 컨트롤러에 데이터 전송할때 파라미터를 input에 담는 것처럼 a태그로 컨트롤러에 데이터를 전송할 때,
	 ?뒤에 파라미터 정해서 전달! -->
${list.chatRequestor} <br>
<form action="chatRoom" method="post">
	<input type="hidden" name="roomNo" value="${list.roomNo}"> 
	<button>채팅</button>
</form>
</c:forEach>
</body>
</html>