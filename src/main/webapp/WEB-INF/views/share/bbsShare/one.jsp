<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function imgError(image) {
		image.onerror = "";
		image.src = "../../resources/noimage.jpg";
		return true;
	}
	HttpSession session = request.getSession();
	
	
	session.setAttribute("viewcheck", 1);
	session.setAttribute("viewcheck_time", System.currentTimeMillis());

	// 매 요청마다 세션의 유효 시간을 확인
	long currentTime = System.currentTimeMillis();
	long sessionTime = (long) session.getAttribute("viewcheck_time");
	if (currentTime - sessionTime > 5*60*1000) {
	    session.removeAttribute("viewcheck");
	}
</script>
<style type="text/css">
img {
	width: 500px;
	height: auto;
}

div {
	width: 500px;
}

.q2 {
	display: flex;
}

.right-align {
	margin-left: auto;
}
</style>
</head>
<body>
<% session.setAttribute("viewcheck", "1");%>
	<a href="list"><button>목록으로</button></a>
	<br>
	<br>
	<div class="q1">
		<div class="q2">
			글번호 : ${bag.bbsShareNo}
			<c:if test="${bag.bbsShareRequest == false}">
				<span class="right-align"><b>요청</b></span>
			</c:if>
			<c:if test="${bag.bbsShareRequest != false}">
				<span class="right-align"><b>나눔</b></span>
			</c:if>
		</div>
		
		<h2>${bag.bbsShareTitle}</h2>
		
		<div class="q2">
			작성자 : ${bag.bbsShareWriter}
			<span class="right-align">작성일 : ${bag.bbsShareDate}</span>
		</div>
		<br> category : ${bag.bbsShareCategory} <br>
		view : ${bag.bbsShareView} <br> interest :
		${bag.bbsShareInterest} <br> <br> content :
		${bag.bbsShareContent} <br> success : ${bag.bbsShareSuccess}
		<c:if test="${sessionScope.member_id == bag.bbsShareWriter}">
			<form action="success" method="get">
				<input type="hidden" name="bbsShareNo" value="${bag.bbsShareNo}">
				<button type="submit">완료처리</button>
			</form>
		</c:if>
		<br>
		<br>
		<img src="share/bbsShare/img/${bag.bbsShareImage}" onerror="imgError(this)">
	</div>
</body>
</html>