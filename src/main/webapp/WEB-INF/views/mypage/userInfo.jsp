<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
		아이디 : ${bag.member_id} <button>비밀번호 변경</button> <br>
		주소 : ${bag.address} <br>
		닉네임 : ${bag.nickname} <br>
		인증여부 : 
		<c:choose>
			<c:when test="${bag.certification eq 1}">
				인증완료
			</c:when>
			<c:otherwise>
				인증미완료
			</c:otherwise>
		</c:choose>
		<br>
		성사횟수 : ${bag.count} <br>
		보유 포인트 : ${bag.point} <br>
		보유 마일리지 : ${bag.mileage} <br>
		<button>변경</button>