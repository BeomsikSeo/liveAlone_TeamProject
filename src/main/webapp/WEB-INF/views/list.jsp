<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>여행지 목록</title>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <style>
  .NameContainer {
    display: inline-block;
    margin-right: 10px; /* 요소 사이 간격을 조정할 수 있습니다 */
    vertical-align: middle; /* 요소를 수직 정렬합니다 */
  }
</style>
</head>
<body>
   <h3>여행지 목록</h3>
   <ul id="voyageList">
      <c:forEach items="${list}" var="vo">
         <li>
          <div class="NameContainer">
      <img src="http://localhost:8888/liveAlone/resources/img/${vo.name}.jpg" alt="Image">
      </div>
      <br>
            <button class="nameButton" data-name="${vo.name}">${vo.name}</button>
         </li>
      </c:forEach>
   </ul>
   <script>
     $(document).ready(function() {
         $('.nameButton').click(function() {
            var name = $(this).text();
            insertSelect(name);
            window.open("one?name=" + name, "_blank");
         });
      });
      
     function insertSelect(name) {
    	  $.ajax({
    	    url: 'insertselect',
    	    method: 'POST',
    	    data: {
    	      member_id: '<%= session.getAttribute("member_id") %>',
    	      selection: name
    	    },
    	    success: function(response) {
    	      console.log('데이터가 추가되었습니다.');
    	     
    	    },
    	    error: function(xhr, status, error) {
    	      console.log('Error:', error);
    	    }
    	  });
    	}
   </script>
</body>
</html>
