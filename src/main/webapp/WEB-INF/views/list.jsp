<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>여행지 목록</title>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

</head>
<body>
   <h3>여행지 목록</h3>
<ul id="voyageList">
  <c:forEach items="${list}" var="vo">
    <li>
      <button class="nameButton">${vo.name}</button>
    </li>
  </c:forEach>
</ul>
 <script>

 $(document).ready(function() {
   $('.nameButton').click(function() {
     var name = $(this).text();
     window.open("one?name=" + name, "_blank");
   });
 });
  </script>
    
</body>
</html>