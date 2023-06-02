<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
게시물 상세 페이지 <br>
게시글번호 : ${bag.bbsShareNo} <br>
게시글 작성자 : ${bag.bbsShareWriter} <br>

<%-- <c:set var="writer" value="${bag.writer}"/> --%>
현재세션 : <c:out value="${id}"/> <br>
<%-- = 현재세션 : ${id} <br> --%>

<c:choose>
 <%-- = <c:when test = "${writer eq id}"> --%>
 <c:when test = "${bag.bbsShareWriter eq id}">
 	<form action="bbsChatList" method="get">
 		<!-- type은 디폴트가 submit( -> form제출) -->
 		<input type="hidden" name="bbsNo" value="${bag.bbsShareNo}">
		<button type="submit">채팅 목록</button>
	</form>
 </c:when>
 
  <c:otherwise>
  	<form action="chatRoom">
 		 <input type="hidden" name="bbsNo" value="${bag.bbsShareNo}"> 
 		 <input type="hidden" name="chatRequestor" value="${id}"> 
 		 <input type="hidden" name="chatReceiver" value="${bag.bbsShareWriter}"> 
 		 <button>채팅요청</button>
   </form>
   <!-- 밑에 저거 왜 안돼? -->
	<%-- <button onclick="location.href='${pageContext.request.contextPath}/chatRoom?bbsNo=${bag.no}?chatRequestor=${id}?chatReceiver=${bag.writer}'">채팅 요청</button> --%>
 </c:otherwise> 
</c:choose>
</body>
</html>