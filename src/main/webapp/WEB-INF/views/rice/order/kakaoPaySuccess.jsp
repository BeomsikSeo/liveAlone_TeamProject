<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.4.js"></script>
<script type="text/javascript">
	<%-- $(function(){
			계속해서 결제가 되는 것을 막기위 바로 redirect로 다른 페이지로 넘깁니다.	
		location.href="../ticket/userTicketOne?ticket_ID="+${ticket.ticket_ID};
	}) --%>
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	결제 성공<br>
	<hr>
	
	<h2>[[${info}]]</h2>
</body>
</html>