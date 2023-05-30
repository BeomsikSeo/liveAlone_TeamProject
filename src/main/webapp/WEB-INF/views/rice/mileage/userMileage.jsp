<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.4.js"></script>
<script type="text/javascript">
$(function(){
	$.ajax({
		url : "userMileageAjax",
		data : {
			pageNum : 1
		},
		success : function(data){
			$("#user-mileageList").append(data);
		}, error : function(){
			alert("실패")
		}
	})
	
	$(".page-button-num").click(function(){
			let num = $(this).val();
			console.log(num)
			
			$.ajax({
				url : "userMileageAjax",
				data : {
					pageNum : num
				},
				success : function(data){
					let rowCount = $(data).find(".mileageList-table-row").length;
					console.log(rowCount)
					
					if(rowCount != 0){
						$("#user-mileageList").empty();
						$("#user-mileageList").append(data);
					}
					
				}, error : function(){
					console.log("Error");
				} // error 
			}) // Ajax 
		}) // 페이지 버튼
		
	$(".page-button").click(function(){
		let type = $(this).val()	/*	버튼의 값 (오른쪽인가? 왼쪽인가?)	*/
		let num = Number($(this).siblings('#page-button-num-1').val());
		
		let count = 0;
		
			if(type == "right" && num != 96) {
				for(let i = 1; i<=5; i++) {
					count = Number($("#page-button-num-"+i).val())+5
					
					$(("#page-button-num-"+i)).val(count);
					$(("#page-button-num-"+i)).html(count);
					
				}
			} else if(type=="left" && num != 1) {
				for(let i = 1; i<=5; i++) {
					count = Number($("#page-button-num-"+i).val())-5
				
					$(("#page-button-num-"+i)).val(count);
					$(("#page-button-num-"+i)).html(count);
				}
			}
		})
	})
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="header">
		<a href="${pageContext.request.contextPath}/index.jsp">Index Page</a>
	</div>
	<hr>
	<div class="mileage-info">
		<div class="mileage-info-one">
			<h3>마일리지 사용 내역 <span>(현재 ${member.mileage }마일리지를 보유하고 있으십니다. )</span></h3>
		</div>
		<div class="mileage-info-one" id="user-mileageList">
		</div>
		<div class="mileage-info-one">
			<div class="mileage-page-buttons">
				<button class="mileage-button" value="left">◀</button>
				<% for(int i=1; i <= 5; i++) { %>
				<button class="page-button-num" id="page-button-num-<%= i %>" value='<%= i %>'><%= i %></button>
				<% } %>
				<button class="mileage-button" value="right">▶</button>
			</div>
		</div>
	</div>
</body>
</html>