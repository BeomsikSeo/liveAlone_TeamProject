<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<script type="text/javascript" src="../../resources/js/jquery-3.6.4.js"></script>
<script type="text/javascript">
	$(function() {
		$('.pages').click(function() {
			$.ajax({
				url : "bbsPartyList", 
				data : {
					page : $(this).text()
				},
				success : function(result) { //결과가 담겨진 table부분코드
					$('#d1').html(result)
				},
				error : function() {
					alert('연결 실패.')
				}
			}) //ajax
		})
	})
</script>
<style>
td {
	background: white;
	height: 30px;
}
</style>
</head>
<body>
<h3>전체 bbs 글 count: ${count}</h3>
<hr color="red">
<div id="d1">
 <table>
   <tr>
      <td class="left">번호</td>
      <td class="left">제목</td>
      <td class="left">작성자</td>
   </tr>
   <c:forEach items="${list}" var="one">
   <tr>
      <td class="right">${one.partyBbs_num}</td> <!-- one.getId() -->
      <td class="right"><a href="bbsPartyOne?partyBbs_num=${one.partyBbs_num}">${one.partyBbs_title}</a></td>     
      <td class="right">${one.partyBbs_writer}</td>
   </tr>
   </c:forEach>
 </table>
</div>
   <br>
   <hr color="red">
   
   <div id = "d2">
   
		<%
			int pages = (int)request.getAttribute("pages");
			for(int p = 1; p <= pages; p++){
		%>
			<button style="background: lime; color: red; width: 50px;" class="pages"><%= p %></button>
		<%		
			}
		%><br><br>
		
	   <% if(session.getAttribute("member_id") != null){%>
	   <button type="button" style="float: right;" onclick="location.href='bbsPartyWrite.jsp'">게시물 작성</button>
<!-- 	   <a href="bbsPartyWrite.jsp">게시물 작성</a> -->
	   <%} %>   
   </div>
</body>
</html>