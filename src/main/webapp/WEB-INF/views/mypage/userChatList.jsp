<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="elements-title mb-70" style="margin-left: 70px;">
	<h2>
		<u>지식인의 당근 채팅 목록</u>
	</h2>
</div>

<section class="events-area section-padding-50">
	<div class="container">
		<div class="row">
			<c:forEach items="${list}" var="bag">
				<!-- Single Event Area -->
				<div class="col-12 col-md-6 col-lg-4">
					<div class="single-event-area mb-30">
						<div class="event-thumbnail">
							<img
								src="${pageContext.request.contextPath}/resources/img/bbs/${bag.bbsShareImage}">
						</div>
						<div class="event-text" id="click">
							<h4>${bag.bbsShareTitle}</h4>
							<br>

							<div class="event-meta-data">
								<a class="event-place">채팅 요청자 : ${bag.chatRequestor}</a> <a
									class="event-date">게시글 작성자 : ${bag.chatReceiver}</a>
							</div>
							<h4>${bag.sender}: ${bag.content}</h4>


							<form action="../share/chatShare/chatRoom" method="post">
								<input type="hidden" name="bbsNo" value="${bag.bbsNo}">
								<input type="hidden" name="chatRequestor"
									value="${bag.chatRequestor}">
								<c:if test="${bag.bbsShareSuccess eq false}">
									<button class="btn oneMusic-btn mt-30">거래중</button>
								</c:if>
								<c:if test="${bag.bbsShareSuccess eq true}">
									<button class="btn oneMusic-btn mt-30">거래완료</button>
								</c:if>
							</form>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</section>