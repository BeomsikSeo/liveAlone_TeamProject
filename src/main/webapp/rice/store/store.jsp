<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>난 혼자 산다</h3>
<hr color="blue">
<form action="insert" method="get">
가게 이름 : <input name="store_name"> <br>
주소 : <input name="store_addr"> <br>
전화번호 : <input name="store_tel"> <br>
설명 : <input name="store_info"> <br>
1인좌석 수 : <input name="store_single"> <br>
가게 사진 : <input name="store_img"> <br>
영업일 : <input name="store_day"> <br>
영업시작 : <input name="store_open"> <br>
영업종료 : <input name="store_closed"> <br>
카테고리 : <input name="store_category"> <br>
<button type="submit">다음</button>
</form>
</body>
</html>