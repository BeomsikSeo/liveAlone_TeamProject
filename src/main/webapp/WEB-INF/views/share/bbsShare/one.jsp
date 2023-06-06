<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
     
</script>
<style type="text/css">
img {
	width: 500px;
	height: auto;
}

div {
	width: 500px;
}

.q2 {
	display: flex;
}

.right-align {
	margin-left: auto;
}
</style>
</head>
<body><%-- 
	<%
		String pageno = (String) session.getAttribute("pageno"); //거쳐온 페이지 번호
	if (pageno == null) { //바로 온경우 pageno 1로 설정
		pageno = "1";
		session.setAttribute("pageno", pageno);
	}
	%> --%>
	<button onclick="history.back()">뒤로가기</button>
	<br>
	<br>
	<div class="q1">
		<div class="q2">
			글번호 : ${bag.bbsShareNo}
			<c:if test="${bag.bbsShareRequest == false}">
				<span class="right-align"><b>요청</b></span>
			</c:if>
			<c:if test="${bag.bbsShareRequest != false}">
				<span class="right-align"><b>나눔</b></span>
			</c:if>
		</div>
		<div class="q2" style="padding-top: 10px; padding-bottom: 10px">
			<span style="font-weight: bold; font-size: 24px;">${bag.bbsShareTitle}</span>
			<c:choose>
				<c:when test="${bag.bbsShareSuccess}">
					<span class="right-align">완료</span>
					<!-- 완료가 true일경우 출력 -->
				</c:when>
			</c:choose>

		</div>
		<div class="q2">
			작성자 : ${bag.bbsShareWriter} <span class="right-align">작성일 :
				${bag.bbsShareDate}</span>
		</div>
		<br> 포인트 : ${bag.bbsSharePoint} <br> view :
		${bag.bbsShareView} <br> interest : ${bag.bbsShareInterest}
		<button id="interest-button" style="display: none;"></button>
		<%-- <c:if test="${sessionScope.member_id == bag.bbsShareWriter}">
			<form action="success" method="get">
				<input type="hidden" name="bbsShareNo" value="${bag.bbsShareNo}">
				<button type="submit">채팅신청</button>
			</form>
		</c:if> --%>




		<c:choose>
			<%-- = <c:when test = "${writer eq id}"> --%>
			<c:when test="${bag.bbsShareWriter eq member_id}">
				<form action="../chatShare/bbsChatList" method="get">
					<!-- type은 디폴트가 submit( -> form제출) -->
					<input type="hidden" name="bbsNo" value="${bag.bbsShareNo}">
					<button id ="chatlistbutton" type="submit">채팅 목록</button>
				</form>
			</c:when>

			<c:otherwise>
				<form action="../chatShare/chatRoom">
					<input type="hidden" name="bbsNo" value="${bag.bbsShareNo}">
					<input type="hidden" name="chatRequestor" value="${member_id}">
					<input type="hidden" name="chatReceiver"
						value="${bag.bbsShareWriter}">
					<button id ="chatbutton" style="display: none;">채팅 요청</button>
				</form>
				<!-- 밑에 저거 왜 안돼? -->
				<%-- <button onclick="location.href='${pageContext.request.contextPath}/chatRoom?bbsNo=${bag.no}?chatRequestor=${id}?chatReceiver=${bag.writer}'">채팅 요청</button> --%>
			</c:otherwise>
		</c:choose>




		<br> <br> content : ${bag.bbsShareContent} <br>
		<%-- <c:if test="${sessionScope.member_id == bag.bbsShareWriter}">
			<form action="success" method="get">
				<input type="hidden" name="bbsShareNo" value="${bag.bbsShareNo}">
				<button type="submit">완료처리</button>
			</form>
		</c:if> --%>
		<br> <br> <img src="../../resources/noimage.jpg"<%-- "share/bbsShare/img/${bag.bbsShareImage}" onerror="imgError(this)" --%>>
	</div>

</body>
</html>