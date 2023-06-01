<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../resources/js/jquery-3.6.4.js"></script>
<script type="text/javascript">
/* 	function allchatlist() {
		$.ajax({
			url : "allChatList", 
			success : function(x) {
				$('#result').append(x)
			},
			error : function(xhr, status, error) {
			}
		});
	} */
	
	$(function() {
		$('#b1').click(function() {
			$("#result").empty()
			$.ajax({
				url : "",
				data : {
					
				},
				success : function(x) {
				} // success
			}) // ajax
		}) // b1
		
		$('#b2').click(function() {
			$("#result").empty()
			$.ajax({
				url : "userChatList",
				data : {
					nowSession : "${member_id}"
				},
				success : function(x) {
					$('#result').append(x)
				} // success
			}) // ajax
		}) // b1
	})
</script>
</head>
<body>
	현재 세션 :
	<%=session.getAttribute("member_id")%>
	<hr color="red">
	<button id="b1">회원 정보</button>
	<button id="b2">지식인의 당근 채팅 목록</button>
	<button id="b3">게시글</button>
	<button id="b4">채팅 목록2</button>
	<hr color="red">
	<div id="result"></div>
</body>
</html>