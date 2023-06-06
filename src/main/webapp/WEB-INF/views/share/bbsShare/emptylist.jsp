<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>빈 리스트</title>

    <!-- Favicon -->
    <link rel="icon" href="${pageContext.request.contextPath}/resources/template/img/core-img/favicon.ico">

    <!-- Stylesheet -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/template/style.css">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="text/javascript">
function imgError(image) {
	image.onerror = "";
	image.src = "../../resources/noimage.jpg";
	return true;
}

</script>
<style>
.container form {
    margin: 0 auto;
	justify-content: center;
  }

.flex-row {
	display: flex;
    margin: 0 auto;
	justify-content: center;
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

.container table {
    margin: 0 auto;
  }

.title{
    text-align: left;
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
	<%@ include file="/resources/public/header.jsp" %> <!-- 헤더 파일 -->

	<!-- ##### Breadcumb Area Start ##### -->
	<section class="breadcumb-area bg-img bg-overlay"
		style="background-image: url(img/bg-img/breadcumb3.jpg);">
		<div class="bradcumbContent">
			<p>인증된 사용자 페이지</p>
			<h2>리스트</h2>
		</div>
	</section>
	<!-- ##### Breadcumb Area End ##### -->


	<!-- 빈 페이지일 경우 경고 -->
	<c:if test="${not empty message}">
		<script>
			alert("${message}");
		</script>
	</c:if>

	<%
		String pagenoStr = request.getParameter("pageno");
	int pageno = 1;
	if (pagenoStr != null) {
		pageno = Integer.parseInt(pagenoStr);
		if (pageno < 1) {
			pageno = 1;
		}
	}
	pageContext.setAttribute("pageno", pageno);
	%>
	<br>
	
	
	<!-- ##### Events Area Start ##### -->
	<section class="events-area section-padding-100">
		<div class="container">

			<div class="flex-row" style="width: 900px">
				<div>
					<!-- 검색창 -->
					<form action="searchcerti" method="get" accept-charset="utf-8">
						<input type="text" name="keyword" placeholder="검색어를 입력하세요"
							size="30"> <input type="hidden" name="pageno" value="1">
						<input type="submit" value="Search">
					</form>
				</div>
				<div class="right-align">
					<%
						if (session.getAttribute("member_id") != null) {
					%>
					<a href="../../share/bbsShare/writing.jsp"><button class="right-align" style="border-color: gray;">글쓰기</button></a>&nbsp;&nbsp;
					<a href="../../share/bbsShare/certification.jsp"><button class="right-align" style="border-color: gray;">지역인증</button></a><br>
					<%
						}
					%>
				</div>
				<br>
			</div>
			
			<br>
			<div style="margin: 0 auto; height: 700px">
				<br> 해당 지역의 게시글이 없습니다.
			</div>

			
		</div>
	</section>
	<!-- ##### Events Area End ##### -->
	
	
	
	
	
	<!-- ##### All Javascript Script ##### -->
    <!-- Popper js -->
    <script src="${pageContext.request.contextPath}/resources/template/js/bootstrap/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="${pageContext.request.contextPath}/resources/template/js/bootstrap/bootstrap.min.js"></script>
    <!-- All Plugins js -->
    <script src="${pageContext.request.contextPath}/resources/template/js/plugins/plugins.js"></script>
    <!-- Active js -->
    <script src="${pageContext.request.contextPath}/resources/template/js/active.js"></script>
    
	<%@ include file="/resources/public/footer.jsp" %>
</body>
</html>
