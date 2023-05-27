<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
	<%
		session.setAttribute("member_id", "가나다");
	%>
	<!-- 테스트용 세션 지정 -->
	<table>
		<c:forEach items="${list}" var="vo" varStatus="status">
			<c:if test="${status.index % 3 == 0}">
				<tr>
			</c:if>
			<td onclick="location.href='one?bbsShareNo=${vo.bbsShareNo}'">
				<div class="flex-row">
					글번호 : ${vo.bbsShareNo}
					<c:if test="${vo.bbsShareRequest == false}">
						<span class="right-align"><b>요청</b></span>
					</c:if>
					<c:if test="${vo.bbsShareRequest != false}">
						<span class="right-align"><b>나눔</b></span>
					</c:if>
				</div>
				<h3>${fn:length(vo.bbsShareTitle) > 10 ? fn:substring(vo.bbsShareTitle, 0, 10).concat('...') : vo.bbsShareTitle}</h3>
				<div class="flex-row">
					작성자 : ${vo.bbsShareWriter} <span class="right-align">작성일 :

						${fn:length(vo.bbsShareDate) > 10 ? fn:substring(vo.bbsShareDate, 0, 10) : vo.bbsShareDate}</span>
				</div>
				<div class="flex-row">
					<br> <span class="right-align"> 조회수 :
						${vo.bbsShareView}</span><br>
				</div>
				<div class="flex-row">
					카테고리 : ${vo.bbsShareCategory} <span class="right-align"> 관심수
						: ${vo.bbsShareInterest}</span><br>
				</div> <br> <br>
				<div class="breakword" style="max-width: 300px;">
					${fn:length(vo.bbsShareContent) > 100 ? fn:substring(vo.bbsShareContent, 0, 100) : vo.bbsShareContent}
				</div> <br> <br> <img
				src="share/bbsShare/img/${vo.bbsShareImage}"
				onerror="imgError(this)">
			</td>
			<c:if test="${status.index % 3 == 2 || status.last}">
				</tr>
			</c:if>
		</c:forEach>
	</table>
	
	
	<%
	String pagenoStr = request.getParameter("pageno");
    int pageno = 1;
    if (pagenoStr != null) {
        pageno = Integer.parseInt(pagenoStr);
    }
    pageContext.setAttribute("pageno", pageno);
%>
<c:if test="${pageno > 1}">
    <a href="list?pageno=${pageno-1}">이전</a>
</c:if>
<a href="list?pageno=${pageno+1}">다음</a>
</body>
</html>