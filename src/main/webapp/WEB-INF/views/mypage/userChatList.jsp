<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table>
	<tr>
		<td class="top">글번호</td>
		<td class="top">게시글이미지</td>
		<td class="top">글번호</td>
		<td class="top">제목</td>
		<td class="top">채팅요청자</td>
		<td class="top">게시글작성자</td>
		<td class="top">마지막메세지</td>
	</tr>

	<c:forEach items="${list}" var="bag">
		<tr>
			<td class="down">${bag.bbsNo}</td>
			<td class="down">${bag.bbsShareImage}</td>
			<td class="down">${bag.bbsShareTitle}</td>
			<td class="down">${bag.chatRequestor}</td>
			<td class="down">${bag.chatReceiver}</td>
			<td class="down">${bag.chatReceiver}</td>
			<td class="down">${bag.content}</td>
			<td class="down">
				<form action="../share/chatShare/chatRoom" method="post">
					<input type="hidden" name="bbsNo" value="${bag.bbsNo}">
					<input type="hidden" name="chatRequestor" value="${bag.chatRequestor}">
					<button>입장</button>
				</form>
			</td>
			<c:if test="${bag.bbsShareSuccess eq false}">
				<td class="down">거래중</td>
			</c:if>
			<c:if test="${bag.bbsShareSuccess eq true}">
				<td class="down">거래완료</td>
			</c:if>
		</tr>
	</c:forEach>
</table>