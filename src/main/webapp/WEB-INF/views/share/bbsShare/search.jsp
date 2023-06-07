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
    <title>비인증검색</title>

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
	<%@ include file="/resources/public/header.jsp" %>
	<!-- 헤더 파일 -->

	<!-- ##### Breadcumb Area Start ##### -->
	<section class="breadcumb-area bg-img bg-overlay"
		style="background-image: url(img/bg-img/breadcumb3.jpg);">
		<div class="bradcumbContent">
			<p>미인증 사용자 페이지</p>
			<h2>검색</h2>
		</div>
	</section>
	<!-- ##### Breadcumb Area End ##### -->

	<!-- ##### Events Area Start ##### -->
	<section class="events-area section-padding-100">
		<div class="container">

			<div class="flex-row" style="width: 900px">
				<div>
					<!-- 검색창 -->
					<form action="search" method="get" accept-charset="utf-8">
						<input type="text" name="keyword" placeholder="검색어를 입력하세요"
							size="30"> <input type="hidden" name="pageno" value="1">
						<input type="submit" value="Search">
					</form>
					'<b><%=request.getParameter("keyword") %></b>'에 대한 검색 결과입니다
				</div>
				<div class="right-align">
					<%
						if (session.getAttribute("member_id") != null) {
					%>
					<a href="../../share/bbsShare/certification.jsp"><button class="right-align" style="border-color: gray;">지역인증</button></a><br>
					<%
						}
					%>
				</div>
				<br>
			</div>
			
			<br>
		<div style="margin: 0 auto;" class="maincontent">
			<c:if test="${not empty message}">
				<p>${message}</p>
				<br>
				<button onclick="history.back()">이전으로</button>
			</c:if>
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
							<span class="right-align"> 관심수 : ${vo.bbsShareInterest}</span><br>
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
		</div>

		<div class="row">
				<div class="col-12">
				<div class="load-more-btn text-center mt-70">
					<%
						pageContext.setAttribute("pageno", request.getParameter("pageno"));
					pageContext.setAttribute("keywords", request.getParameter("keyword"));
					%>
					<c:if test="${pageno > 1}">
						<a href="search?keyword=${keywords}&pageno=${pageno-1}"
							class="btn oneMusic-btn">이전</a>
					</c:if>
					<a href="search?keyword=${keywords}&pageno=${pageno+1}"
						class="btn oneMusic-btn">다음</a>
				</div>
			</div>
			</div>
		</div>
	</section>
	<!-- ##### Events Area End ##### -->
	
	<script type="text/javascript">
	if (${not empty message}) {
        var element = document.querySelector('.btn.oneMusic-btn');
        var element2 = document.querySelector('.maincontent');
        
        if (element) {
            element.style.display = 'none';
            element2.style.height = '700px';
        }
    }
	</script>
	



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

