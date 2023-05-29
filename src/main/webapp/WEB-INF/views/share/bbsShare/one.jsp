<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
   /*  function imgError(image) {
        image.onerror = "";
        image.src = "/resources/noimage.jpg";
        return true;
    }
     */
    function viewplus() {
        $.ajax({
            url: '/share/bbsShare/view',
            data : {"bbsShareNo":"<%=request.getParameter("bbsShareNo")%>"},
			type : 'GET',
			success : function(data) {
				// Handle the response data here
			}
		});
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
	<%
		session.setAttribute("viewcheck", "1");
	String pageno = (String) session.getAttribute("pageno");
	if (pageno == null) {
		pageno = "1";
		session.setAttribute("pageno", pageno);
	}
	%>
	<a href="list?pageno=<%=pageno%>"><button>목록으로</button></a>
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
		<div class="q2" style="padding-top: 10px; padding-bottom: 10px">
			<span style="font-weight: bold; font-size: 24px;">${bag.bbsShareTitle}</span>
			<c:choose>
				<c:when test="${bag.bbsShareSuccess}">
					<span class="right-align">완료</span>
					<!-- 완료가 true일경우 출력 -->
				</c:when>
			</c:choose>

		</div>
		<div class="q2">
			작성자 : ${bag.bbsShareWriter} <span class="right-align">작성일 :
				${bag.bbsShareDate}</span>
		</div>
		<br> category : ${bag.bbsShareCategory} <br> view :
		${bag.bbsShareView} <br> interest : ${bag.bbsShareInterest} <br>
		<br> content : ${bag.bbsShareContent} <br>
		<c:if test="${sessionScope.member_id == bag.bbsShareWriter}">
			<form action="success" method="get">
				<input type="hidden" name="bbsShareNo" value="${bag.bbsShareNo}">
				<button type="submit">완료처리</button>
			</form>
		</c:if>
		<br> <br> <img src="../../resources/noimage.jpg" <%-- "share/bbsShare/img/${bag.bbsShareImage}" --%> onerror="imgError(this)">
	</div>
</body>
</html>