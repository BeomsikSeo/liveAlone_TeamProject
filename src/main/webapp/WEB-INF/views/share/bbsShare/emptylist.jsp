<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="text/javascript">
function imgError(image) {
	image.onerror = "";
	image.src = "../../resources/noimage.jpg";
	return true;
}

</script>
<style>
.flex-row {
	display: flex;
}

.right-align {
	margin-left: auto;
}

.breakword {
	word-wrap: break-word;
	line-height: 1.5;
	min-height: 3em;
	max-height: 3em;
	overflow: hidden; /* 내용이 넘치면 숨김 */
}

table {
	table-layout: fixed;
}

td {
	width: 300px;
	padding: 20px;
	vertical-align: top;
	border: 4px solid black;
	border-collapse: collapse;
}

td img {
	max-width: 100%;
	height: auto;
}
</style>
</head>
<body>


	<!-- 빈 페이지일 경우 경고 -->
	<c:if test="${not empty message}">
		<script>
			alert("${message}");
		</script>
	</c:if>

	<!-- 검색창 -->
	<form action="search" method="get" accept-charset="utf-8">
		<input type="text" name="keyword" placeholder="검색어를 입력하세요"> <input
			type="hidden" name="pageno" value="1"> <input type="submit"
			value="검색">
	</form>
	<br>

	해당 지역의 게시글이 없습니다.
</body>
</html>