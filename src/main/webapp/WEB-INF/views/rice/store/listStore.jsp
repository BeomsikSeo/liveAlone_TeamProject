<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>난 혼자 산다 _ 검색 페이지</h3>
<form action="main.jsp"><button>메인으로</button></form>
<hr color="blue">
<c:forEach items="${list}" var="vo">
<hr color="blue">
가게번호 : ${vo.store_no} <br>
가게명 : <a href = "one?store_no=${vo.store_no}">${vo.store_name}</a> <br>
주소 : ${vo.store_addr} <br>
전화번호 : ${vo.store_tel} <br>
가게설명 : ${vo.store_info} <br>
1인좌석 수 : ${vo.store_single} <br>
사진 : ${vo.store_img} <br> 
영업일 : ${vo.store_day} <br> 
오픈시간 : ${vo.store_open} <br> 
종료시간 : ${vo.store_closed} <br> 
카테고리 : ${vo.store_category} <br> 
</c:forEach>
</body>
</html>