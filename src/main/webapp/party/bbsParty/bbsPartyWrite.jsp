<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- include libraries(jQuery, bootstrap) -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/lang/summernote-ko-KR.js"></script>	

<%
  // 오늘 날짜를 받아오는 부분
  java.util.Date currentDate = new java.util.Date();
  java.text.SimpleDateFormat minDate = new java.text.SimpleDateFormat("yyyy-MM-dd");
  String today = minDate.format(currentDate);
%>


</head>
<body>


	<h2 style="text-align: center;">동행 게시글 작성</h2>
	<br>
	<br>
	<br>

	<div style="width: 60%; margin: auto;">
		<form method="post" action="bbsPartyInsert">
			제목:<input type="text" name="partyBbs_title" style="width: 35%;"
				placeholder="제목" /> 
				
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			테마:<select name="partyBbs_theme">
   					<option value="여행">여행</option>
    				<option value="운동">운동</option>
    				<option value="밥">밥</option>
    				<option value="기타">기타</option>
    			</select><br>
 
			최대인원:<input type="number"
				name="partyBbs_partyMax" style="width: 20%;" min="2" max="10"
				placeholder="최대인원" />
			동행날짜:<input type="date" name="partyBbs_date" style="width: 20%;" min="<%= today %>"
				placeholder="동행날짜" /><br> 
			마감일자:<input type="date"
				name="partyBbs_period" style="width: 20%;" min="<%= today %>"
				placeholder="<%= today %>" />
			동행지역:<input type="text" name="partyBbs_location" style="width: 20%;"
				placeholder="동행지역" /><br>	
		
			<br>
			<textarea id="summernote" rows="5" name="partyBbs_content"
				style="width: 100%; height: 250px;"></textarea>
			<input id="subBtn" type="button" value="글 작성" style="float: right;"
				onclick="goWrite(this.form)" />
		</form>
	</div>


<!-- 썸머노트 content 부분 -->
	<script>
		$(document).ready(function() {
			$('#summernote').summernote({
				height : 300,
				width : 1000,
				minHeight : null,
				maxHeight : null,
				focus : true,
				lang : "ko-KR",
				callbacks : {
					onImageUpload : function(files) {
						for (var i = files.length - 1; i >= 0; i--) {
							sendFile(files[i], this);
						}
					}
				}

			});
		});

		function sendFile(file, editor) { 
			var data = new FormData();
			data.append("file", file);
			console.log(file);
			$.ajax({
				data : data,
				type : "POST",
				url : "SummerNoteImageFile",
				contentType : false,
				enctype : 'multipart/form-data',
				processData : false,
				success : function(data) {
					console.log(data);
					console.log(editor);
					console.log("여기까지");
					$(editor).summernote("insertImage", data.url);
				}
			});
		}
	</script>
	<script>
		function goWrite(frm) {
			var partyBbs_title = frm.partyBbs_title.value;
			var partyBbs_theme = frm.partyBbs_theme.value;
			var partyBbs_partyMax = frm.partyBbs_partyMax.value;
			var partyBbs_date = frm.partyBbs_date.value;
			var partyBbs_period = frm.partyBbs_period.value;
			var partyBbs_location = frm.partyBbs_location.value;
			var partyBbs_content = frm.partyBbs_content.value;

			if (partyBbs_title.trim() == '') {
				alert("제목을 입력해주세요");
				return false;
			}
			if (partyBbs_theme.trim() == '') {
				alert("테마를 입력해주세요");
				return false;
			}
			if (partyBbs_partyMax.trim() == '') {
				alert("최대인원을 입력해주세요");
				return false;
			}
			if (partyBbs_date.trim() == '') {
				alert("날짜를 입력해주세요");
				return false;
			}
			if (partyBbs_period.trim() == '') {
				alert("기한을 입력해주세요");
				return false;
			}
			if (partyBbs_location.trim() == '') {
				alert("지역을 입력해주세요");
				return false;
			}
			if (partyBbs_content.trim() == '') {
				alert("내용을 입력해주세요");
				return false;
			}
			frm.submit();
		}
	</script>


</body>

</html>


