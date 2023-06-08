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
    <title>상세 페이지</title>

    <!-- Favicon -->
    <link rel="icon" href="${pageContext.request.contextPath}/resources/template/img/core-img/favicon.ico">

    <!-- Stylesheet -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/template/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

	var bbsShareNo = "<%= request.getParameter("bbsShareNo") %>";
	var member_id = "<%= session.getAttribute("member_id") %>";
    var certification = "<%= session.getAttribute("certification") %>";
	var viewcheck = "<%=session.getAttribute("viewBbsShareNo" + request.getParameter("bbsShareNo"))%>";
	
    function viewplus() {
        $.ajax({
			async : true,
			type : 'POST',
            data : {"bbsShareNo":bbsShareNo},
			url : 'view',
			dataType : "text",
			success : function() {
			}
		});
	}
    
    function interestplus() {
        $.ajax({
			async : true,
			type : 'POST',
            data : {"bbsShareNo":bbsShareNo},
			url : 'interestplus',
			dataType : "text",
			success : function() {
				location.reload();
			}
		});
	}
    
    function interestminus() {
        $.ajax({
			async : true,
			type : 'POST',
            data : {"bbsShareNo":bbsShareNo},
			url : 'interestminus',
			dataType : "text",
			success : function() {
				location.reload();
			}
		});
	}
     
   
    	
    	$(document).ready(function() {
    		
    		if (certification == "1"){
				document.getElementById("interest-button").style.display = "block";
				
				if (document.getElementById("chatbutton") && ${bag.bbsShareSuccess}==0) {
				    document.getElementById("chatbutton").style.display = "block";
				}
				if (document.getElementById("chatlistbutton")) {
					document.getElementById("chatlistbutton").style.display = "block";
				}
				
				

				
				 $.ajax({
				    	async : true,
				    	type : 'POST',
				    	data: {"bbsShareNo": bbsShareNo},
				    	url : 'checkinterest',
				    	dataType : "text",
				    	success : function(response) {				    		
				    		
				    		if (response == "1") {
				    	        document.getElementById("interest-button").textContent = "관심 해제";
				    		    document.getElementById("interest-button").onclick = function() {
				    		        interestminus();
				    		    }
				    		} else {
				    	        document.getElementById("interest-button").textContent = "관심 등록";
				    		    document.getElementById("interest-button").onclick = function() {
				    		        interestplus();
				    		    }
				    		}
				    	}
				        
				    	});
				
				
    		}
    		
    		if (viewcheck !== "1") {
    		<%System.out.println("viewcheck : " + session.getAttribute("viewBbsShareNo" + request.getParameter("bbsShareNo")));%>
    		<%session.setAttribute("viewBbsShareNo" + request.getParameter("bbsShareNo"), "1");%>
    		viewplus();
    		}

    		});
    	
    	window.addEventListener('load', function() {
    	    document.querySelector('.btn.oneMusic-btn').addEventListener('click', function(event) {
    	        event.preventDefault();
    	        history.back();
    	    });
    	});
</script>
<style type="text/css">
.container form {
    margin: 0 auto;
	justify-content: center;
  }

.flex-row {
	display: flex;
    margin: 0 auto;
	justify-content: center;
	font-size:15px;
}

.flex-row-left {
	display: flex;
	font-size:20px;
    margin: 0 auto;
}

.left_align{
	margin-right: auto;
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
.productimg {
    max-width: 400px;
    height: auto;
}

</style>
</head>
<body>
	<%@ include file="/resources/public/header.jsp"%>
	<!-- 헤더 파일 -->

	<!-- ##### Breadcumb Area Start ##### -->
	<section class="breadcumb-area bg-img bg-overlay"
		style="background-image: url(img/bg-img/breadcumb3.jpg);">
		<div class="bradcumbContent">
			<p></p>
			<h2>상세 페이지</h2>
		</div>
	</section>
	<!-- ##### Breadcumb Area End ##### -->

	<!-- ##### Events Area Start ##### -->
	<section class="events-area section-padding-100">
	<div class="container" style="width: 700px">
		<div  class="flex-row">
			<span class="left_align">글번호 : ${bag.bbsShareNo}</span>
			<c:if test="${bag.bbsShareRequest == false}">
				<span class="right-align" style="font-size:30px;"><b>요청</b></span>
			</c:if>
			<c:if test="${bag.bbsShareRequest != false}">
				<span class="right-align" style="font-size:30px;"><b>나눔</b></span>
			</c:if>
		</div>
		<div class="flex-row" style="padding-top: 10px; padding-bottom: 10px">
			<span class="left_align" style="font-weight: bold; font-size:40px;">${bag.bbsShareTitle}</span>
			<c:choose>
				<c:when test="${bag.bbsShareSuccess}">
					<span class="right-align" style="font-size:30px;">완료</span>
					<!-- 완료가 true일경우 출력 -->
				</c:when>
			</c:choose>

		</div>
		<div class="flex-row" >
			작성자 : ${bag.bbsShareWriter} <span class="right-align">작성일 :
				${bag.bbsShareDate}</span>
		</div>
		<div  class="flex-row-left" style="font-size:15px;">
		<br>
		포인트 : ${bag.bbsSharePoint} <br>
		조회수 : ${bag.bbsShareView} <br>
		관심수 : ${bag.bbsShareInterest}<br>
		</div>
		<div>
		<button id="interest-button" style="display: none;"></button>
		
		<c:choose>
			<%-- = <c:when test = "${writer eq id}"> --%>
			<c:when test="${bag.bbsShareWriter eq member_id}">
				<form action="../chatShare/bbsChatList" method="post">
					<!-- type은 디폴트가 submit( -> form제출) -->
					<input type="hidden" name="bbsNo" value="${bag.bbsShareNo}">
					<button id ="chatlistbutton" type="submit">채팅 목록</button>
				</form>
			</c:when>

			<c:otherwise>
				<form action="../chatShare/chatRoom" method="post">
					<input type="hidden" name="bbsNo" value="${bag.bbsShareNo}">
					<input type="hidden" name="chatRequestor" value="${member_id}">
					<input type="hidden" name="chatReceiver"
						value="${bag.bbsShareWriter}">
					<button id ="chatbutton" style="display: none;">채팅 요청</button>
				</form>
			</c:otherwise>
		</c:choose>
		
		</div>
		


		<br> <br>

			<div class="flex-row-left">
				<span class="left-align"> ${bag.bbsShareContent} </span>
			</div>

			<br>
		
		<br> <br> 
		
		<div class="flex-row"><img src="../../resources/noimage.jpg" class="productimg"></div>
	</div>
		<div class="flex-row">
			<div class="row">
				<div class="col-12">
					<div class="load-more-btn text-center mt-70">
						<a href="#" class="btn oneMusic-btn">이전 페이지로</a>
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