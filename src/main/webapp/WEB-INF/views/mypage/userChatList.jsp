<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table>
	<tr>
		<td class="top">글번호</td>
		<td class="top">제목</td>
		<td class="top">채팅요청자</td>
		<td class="top">게시글작성자</td>
	</tr>

	<c:forEach items="${list}" var="bag">
		<tr>
			<td class="down">${bag.bbsNo}</td>
			<td class="down">${bag.bbsShareTitle}</td>
			<td class="down">${bag.chatRequestor}</td>
			<td class="down">${bag.chatReceiver}</td>
			<td class="down">
				<form action="../share/chatShare/chatRoom">
					<input type="hidden" name="bbsNo" value="${bag.bbsNo}">
					<input type="hidden" name="chatRequestor" value="${bag.chatRequestor}">
					<button>입장</button>
				</form>
			</td>
		</tr>
	</c:forEach>
</table>