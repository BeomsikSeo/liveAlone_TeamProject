<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="col-12" id="result">

	<div class="elements-title mb-70" style="margin-left: 70px;">
		<h2>
			<u>회원정보</u>
		</h2>
	</div>

	<div class="oneMusic-cool-facts-area">
		<div class="row">

			<!-- Single Cool Facts -->
			<div class="single-cool-fact mb-100" style="margin-left: 100px;">
				<div class="scf-text">
					<h2>${bag.member_id}</h2>
					<p style="font-size: 20px;">아이디</p>
				</div>
			</div>

			<!-- Single Cool Facts -->
			<div class="single-cool-fact mb-100" style="margin-left: 100px;">
				<div class="scf-text">
					<h2>${bag.nickname}</h2>
					<p style="font-size: 20px;">닉네임</p>
				</div>
			</div>

			<!-- Single Cool Facts -->
			<div class="single-cool-fact mb-100" style="margin-left: 100px;">
				<div class="scf-text">
					<h2>
						<c:choose>
							<c:when test="${bag.certification eq 1}">
													O
												</c:when>
							<c:otherwise>
													X
												</c:otherwise>
						</c:choose>
					</h2>
					<p style="font-size: 20px;">지역인증</p>
				</div>
			</div>

			<!-- Single Cool Facts -->
			<div class="single-cool-fact mb-100" style="margin-left: 100px;">
				<div class="scf-text">
					<h2>
						<span class="counter">${bag.count}</span>
					</h2>
					<p style="font-size: 20px;">성사횟수</p>
				</div>
			</div>

			<!-- Single Cool Facts -->
			<div class="single-cool-fact mb-100" style="margin-left: 100px;">
				<div class="scf-text">
					<h2>
						<span class="counter">${bag.point}</span>
					</h2>
					<p style="font-size: 20px;">보유 포인트</p>
				</div>
			</div>

			<div class="single-cool-fact mb-100" style="margin-left: 100px;">
				<div class="scf-text">
					<h2>
						<span class="counter">${bag.mileage}</span>
					</h2>
					<p style="font-size: 20px;">보유 마일리지</p>
				</div>
			</div>

			<!-- Single Cool Facts -->
			<div class="single-cool-fact mb-100" style="margin-left: 100px;">
				<h2>${bag.address.replace('_', ' ')}</h2>
				<p style="font-size: 20px;">주소</p>
			</div>
		</div>
	</div>
</div>