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
            <button class="nameButton" data-name="${vo.name}">${vo.name}</button>
         </li>
      </c:forEach>
   </ul>

   <script>
      $(document).ready(function() {
         $('.nameButton').click(function() {
            var name = $(this).data('name');
            window.open("one?name=" + name, "_blank");
            $.ajax({
              url: 'insertselect',
              method: 'POST',
              data: {
                member_id: '<%= session.getAttribute("member_id") %>',
                select: name
              },
              success: function(response) {
                console.log('데이터가 추가되었습니다.');
                var targetButton = window.opener.$('.roundButton:empty').first();
                if (targetButton.length > 0) {
                  targetButton.text(name);
                }
              },
              error: function(xhr, status, error) {
                console.log('Error:', error);
              }
            });
         });
      });
   </script>
</body>
</html>