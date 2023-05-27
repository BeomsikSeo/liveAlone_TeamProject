<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	session.setAttribute("member_id", "qwert123");   /*임시적인 유저 아이디*/
%>


    <a href="bbsPartyAll?page=1">게시물 목록</a>
	<hr color="red">
	
	<% if(session.getAttribute("member_id") != null){%>
   	<a href="bbsPartyWrite.jsp">게시물 작성</a><br><br>
   	<%} %>
   	
</body>
</html>