<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach items="${list}" var="vo">
<hr color="blue">
메뉴명 : ${vo.food_name} <br>
가격 : ${vo.food_price} <br>
메뉴설명 : ${vo.food_info} <br>
재료 : ${vo.food_ingre} <br>
사진 : ${vo.food_img} <br>
카테고리 : ${vo.food_category} <br>
</c:forEach>
</body>
</html>