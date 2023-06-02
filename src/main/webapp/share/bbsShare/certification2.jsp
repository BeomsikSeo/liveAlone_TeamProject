<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지역 인증</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	 var address = "<%=session.getAttribute("address")%>";
	 document.getElementById("mem_address").innerHTML = address.replace(/_/g, ' ');
 });
 </script>
</head>
<body>
</body>
</html>