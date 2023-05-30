<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.4.js"></script>
<script type="text/javascript">
	$(function(){
		location.href="../ticket/userTicketOne?ticket_ID="+${ticket.ticket_ID};
	}) 
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	페이지 로딩
</body>
</html>