<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

    

     <style>
    .roundButton {
      display: inline-block;
      width: 150px;
      height: 150px;
      border-radius: 50%;
      background-color: #2ecc71;
      color: #fff;
      font-size: 18px;
      text-align: center;
      line-height: 150px;
      margin: 10px;
      cursor: pointer;
    }
  </style>
</head>
<body>
    <h3>모든 여행지입니다.</h3>
    <a href="list" target='_blank'>모든 여행지 보기</a>
    
    
    <h1>Random Names</h1>
<ul id="randomNamesList">
  <c:forEach items="${randomNames}" var="randomName">
    <button class="randomNameButton" onclick="insertSelect('${sessionScope.member_id}', '${randomName}')">${randomName}</button><br>
  </c:forEach>
</ul>
<script>
      $(document).ready(function() {
        var name;

        $('.randomNameButton').click(function() {
          name = $(this).text();
          $.ajax({
            url: 'one',
            method: 'get',
            data: { name: name },
            success: function(response) {
              console.log(response);
            },
            error: function(xhr, status, error) {
              console.log('Error:', error);
            }
          });
        });
      });

      function insertSelect(memberId, name) {
        $.ajax({
          url: 'insertselect',
          method: 'POST',
          data: {
            member_id: memberId,
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
      }
    </script>

<script>
  $(document).ready(function() {
    $('.randomNameButton').click(function() {
      var name = $(this).text();
      var targetBucket = $('.roundButton:empty').first(); // 비어있는 첫 번째 roundButton 찾기

	    if (targetBucket.length > 0) {
	      targetBucket.text(name); // roundButton의 텍스트 변경
	    }
      window.open("one?name=" + name, "_blank");
    });
    
  });
</script>




    <hr color="red">
    <form action="one" method="get">
        name : <input name="name" value="최참판댁"><br>
        <button type="submit">정보 보기</button>
    </form>

<div>
  위도: <input id="latInput" type="text" name="lat">
  경도: <input id="longiInput" type="text" name="longi">
  <button id="saveButton">입력</button>
</div>

<script>
$(document).ready(function() {
	  var member_id = '<%= session.getAttribute("member_id") %>';
    $('#saveButton').click(function() {
      var lat = $('#latInput').val(); // 입력한 위도 가져오기
      var longi = $('#longiInput').val(); // 입력한 경도 가져오기

      $.ajax({
        url: 'updatebasket',
        method: 'POST',
        data: {
          member_id: member_id,
          lat: lat,
          longi: longi
        },
        success: function(response) {
          $('#latInput').val(''); // 입력 필드 초기화
          $('#longiInput').val(''); // 입력 필드 초기화
          alert('입력이 완료되었습니다.');
        },
        error: function(xhr, status, error) {
          console.log('Error:', error);
        }
      })
    });
});


 
</script>

<div>
  <button class="roundButton"></button>
  <button class="roundButton"></button>
  <button class="roundButton"></button>
  <button class="roundButton"></button>
  <button class="roundButton"></button>
</div>
<script>
  $(document).ready(function() {
    $('.roundButton').click(function() {
      $(this).text(''); // 클릭한 roundButton의 텍스트를 공백으로 변경
    });
  });
</script>
<script>
  $(document).ready(function() {
    $('.roundButton').click(function() {
      var button = $(this);
      var name = button.text();

      // AJAX를 통해 deleteSelect 요청 보내기
      $.ajax({
        url: 'deleteSelect',
        method: 'POST',
        data: {
          member_id: '<%= session.getAttribute("member_id") %>',
          select: name
        },
        success: function(response) {
          console.log('데이터가 삭제되었습니다.');
          button.text(''); // 버튼의 텍스트를 공백으로 변경
        },
        error: function(xhr, status, error) {
          console.log('Error:', error);
        }
      });
    });
  });
</script>

    <hr color="red">
</body>
</html>
