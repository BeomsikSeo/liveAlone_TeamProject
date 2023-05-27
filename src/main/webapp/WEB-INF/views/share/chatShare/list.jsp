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
게시판 리스트!
현재 세션 : <%= session.getAttribute("id")%>
<c:forEach items="${list}" var="bag">
<hr color="red">
<!-- form으로 컨트롤러에 데이터 전송할때 파라미터를 input에 담는 것처럼 a태그로 컨트롤러에 데이터를 전송할 때,
	 ?뒤에 파라미터 정해서 전달! -->
<a href="one?no=${bag.no}">${bag.no} <br></a>
${bag.writer} <br>
</c:forEach>
</body>
</html>