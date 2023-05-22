<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
      $(document).ready(function() {
        var name; // 정보를 저장할 변수

        $('.randomNameButton').click(function() {
          name = $(this).text(); // 버튼에 표시된 이름 가져오기
          $.ajax({
            url: 'one',
            method: 'get',
            data: { name: name, 	
            },
            success: function(response) {
              // 서버로부터 받은 데이터를 처리하는 코드 작성
              // 예: 받은 데이터를 적절한 방식으로 표시
              console.log(response);
            },
            error: function(xhr, status, error) {
              console.log('Error:', error);
            }
          });
        });
      });
    </script>

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
    <button class="randomNameButton">${randomName}</button><br>
  </c:forEach>
</ul>


<script>
  $(document).ready(function() {
    $('.randomNameButton').click(function() {
      var name = $(this).text();
      window.open("one?name=" + name, "_blank");
    });
  });
</script>

    <hr color="red">
    <form action="one" method="get">
        name : <input name="name" value="최참판댁"><br>
        <button type="submit">정보 보기</button>
    </form>
<button id="button1">1번 버튼</button>
<button id="button2">2번 버튼</button>

<script>
  $(document).ready(function() {
    var name; // 정보를 저장할 변수

    $('#button1').click(function() {
      name = $('[name="name"]').val(); // 입력된 이름 가져오기
      $('#button2').text(name); // 2번 버튼에 이름 설정
    });
    $.ajax({
        url: 'up',
        method: 'POST',
        data: { name: name },
        success: function(response) {
          console.log('정보가 저장되었습니다.');
        },
        error: function(xhr, status, error) {
          console.log('Error:', error);
        }
      });

    $('#button2').click(function() {
      name = null; // 변수 초기화 (정보 삭제)
      $('#button2').text('2번 버튼'); // 2번 버튼의 텍스트 초기화
    });
  });
  $.ajax({
      url: 'del',
      method: 'POST',
      data: { name: name },
      success: function(response) {
        console.log('정보가 삭제되었습니다.');
      },
      error: function(xhr, status, error) {
        console.log('Error:', error);
      }
    });
</script>
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
      });
    });
  });
</script>

<div>
  <button class="roundButton">bucket1</button>
  <button class="roundButton">bucket2</button>
  <button class="roundButton">bucket3</button>
  <button class="roundButton">bucket4</button>
  <button class="roundButton">bucket5</button>
</div>


    <hr color="red">
</body>
</html>
