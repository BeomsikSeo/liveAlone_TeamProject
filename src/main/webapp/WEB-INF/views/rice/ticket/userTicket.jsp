<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.4.js"></script>
<script type="text/javascript">
	$(function(){
		/* $.ajax({
		url : 	,		
		data :  ,
		}) */
	})
</script>
<script type="text/javascript">
$(function(){
	$(".page-button").click(function(){
		let type = $(this).val()	/*	버튼의 값 (오른쪽인가? 왼쪽인가?)	*/
		let num = Number($(this).siblings('#page-button-num-1').val());
		
		if(type == "right") {
			let changeNum = Number(num)+1
			
			alert(changeNum)
			/* $("#page-button-num-1").val(resultNum); */
		} else if(type=="right" && num != 1) {
			
		}
		
		})
	})
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="ticket-info">
		<div class="ticket-info-one">
			<h3></h3>
		</div>
		<div class="ticket-info-one" id="userTicketList">
		
		</div>
		<div class="ticket-info-one">
			<div class="ticket-page-buttons">
				<button class="page-button" value="left">◀</button>
				<% for(int i=1; i <= 5; i++) { %>
				<button class="page-button-num" id="page-button-num-<%= i %>" value='<%= i %>'><%= i %></button>
				<% } %>
				<button class="page-button" value="right">▶</button>
			</div>
		</div>
	</div>
</body>
</html>