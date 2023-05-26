<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.6.4.js"></script>
<script type="text/javascript">
	$(function(){
		
		$("#count-list").change(function(){
			if(this.value != '0'){
				// 비활성화
				let count = this.value
				
				$('#count-list').attr("disabled", true);
				
				$.ajax({
					url : "foodWorldCupList",
					data : {
						count : count
					}, success :  function(data) {
						
					}
				})
			}
		})
	})
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header></header>
	<main>
		<div id="main-contents">
			<div class="contents" id="worldCup-title"></div>
			<hr>
			<div class="contents" id="worldCup-select">
				<select id="count-list" name="count-list" required="required">
					<option value="0" selected="selected"></option>
					<option value="8">8강</option>
					<option value="16">16강</option>
					<option value="32">32강</option>
				</select>
			</div>
		</div>
	</main>
	<footer></footer>
</body>
</html>