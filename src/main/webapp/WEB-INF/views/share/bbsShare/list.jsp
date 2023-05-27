<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.flex-row {
	display: flex;
}

.right-align {
	margin-left: auto;
}

.breakword{
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
	width : 300px;
	height : 300px;
	padding: 10px;
	vertical-align: top;
}
</style>
</head>
<body>
	<table>
		<c:forEach items="${list}" var="vo" varStatus="status">
			<c:if test="${status.index % 3 == 0}">
				<tr>
			</c:if>
			<td onclick="location.href='one?bbsShareNo=${vo.bbsShareNo}'">
				<div class="flex-row">
					글번호 : ${vo.bbsShareNo}
					<c:if test="${vo.bbsShareRequest == false}">
						<span class="right-align">요청</span>
					</c:if>
					<c:if test="${vo.bbsShareRequest != false}">
						<span class="right-align">나눔</span>
					</c:if>
				</div>
				<div class="flex-row">
					제&nbsp; &nbsp;목 : ${vo.bbsShareTitle} <span class="right-align">작성일
						: ${fn:length(vo.bbsShareDate) > 10 ? fn:substring(vo.bbsShareDate, 0, 10) : vo.bbsShareDate}</span>
				</div>
				<div class="flex-row">
					작성자 : ${vo.bbsShareWriter}<br> <span class="right-align">
					카테고리 : ${vo.bbsShareCategory}</span><br>
				</div> 
				<br>
				<div class="breakword" style="max-width: 300px;">
				${fn:length(vo.bbsShareContent) > 68 ? fn:substring(vo.bbsShareContent, 0, 68) : vo.bbsShareContent}
				</div> 
				<br> ${vo.bbsShareView}<br> ${vo.bbsShareInterest}<br>
				<%-- ${vo.bbsShareSuccess}<br> 미완료된 게시글만 보여주기 --%>
				${vo.bbsShareImage}<br>
			</td>
			<c:if test="${status.index % 3 == 2 || status.last}">
				</tr>
			</c:if>
		</c:forEach>
	</table>

</body>
</html>