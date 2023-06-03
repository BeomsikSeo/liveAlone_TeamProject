<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

    
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/template/style.css">
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
  <style>
  .randomNameContainer {
    display: inline-block;
    margin-right: 10px; /* 요소 사이 간격을 조정할 수 있습니다 */
    vertical-align: middle; /* 요소를 수직 정렬합니다 */
  }
</style>


  
</head>
<body>
	<%@ include file="/resources/public/header.jsp" %>
	<%-- 해당 주제 페이지에 맞는 이미지와 페이지 설명이 들어가는 부분 --%>
	<section class="breadcumb-area bg-img bg-overlay" style="background-image: url(${pageContext.request.contextPath}/resources/template/img/bg-img/breadcumb3.jpg); --%>">
        <div class="bradcumbContent">
            <p>설명 부분</p>
            <h2>타이틀 부분</h2>
        </div>
	</section>
	<section>
    <h3>모든 여행지입니다.</h3>
    <a href="list" target='_blank'>모든 여행지 보기</a>
    
    
    <h1>여행지 추천</h1>


<ul id="randomNamesList">
  <c:forEach items="${randomNames}" var="randomName">
    <div class="randomNameContainer">
      <img src="http://localhost:8888/liveAlone/resources/img/${randomName}.jpg" alt="Image">
      <br>
      <button class="randomNameButton" onclick="insertSelect('${sessionScope.member_id}', '${randomName}')">${randomName}</button>
    </div>
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

      function insertSelect(member_id, name) {
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

<script>
  $(document).ready(function() {
    $('.randomNameButton').click(function() {
      var name = $(this).text();
     
      window.open("one?name=" + name, "_blank");
    });
    
  });
</script>





    <hr color="red">
<hr color="red">
<form id="infoForm" action="one" method="get">
    추가할 여행지: <input id="nameInput" name="name" value=""><br>
    <button type="submit">정보 보기</button>
    <button type="button" onclick="insertSelect('<%= session.getAttribute("member_id") %>', $('#nameInput').val())">추가하기</button>
</form>
    

<div>
출발지 입력하기<br>
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
 <c:forEach items="${roundButtons}" var="roundButton">
  ${roundButton}
</c:forEach>

<script>
  $(document).ready(function() {
    $('.roundButton').click(function() {
      var name = $(this).text(); // 클릭한 roundButton의 텍스트 가져오기
      var member_id = '<%= session.getAttribute("member_id") %>'; // 회원 ID 가져오기
		console.log(name)
      $.ajax({
        url: 'deleteselect',
        method: 'POST',
        data: {
          member_id: member_id,
          selection: name
        },
        success: function(response) {
          console.log('데이터가 삭제되었습니다.');
         
        },
        error: function(xhr, status, error) {
          console.log('Error:', error);
        }
      });
    });
  });
</script>
<script>
  $(document).ready(function() {
    $('.roundButton').click(function() {
      $(this).text(''); // 클릭한 roundButton의 텍스트를 공백으로 변경
    });
  });
  
</script>
</section>
<%@ include file="/resources/public/footer.jsp" %>
	<div>
	    <!-- jQuery-2.2.4 js -->
	    <script src="${pageContext.request.contextPath}/resources/template/js/jquery/jquery-2.2.4.min.js"></script>
	    <!-- Popper js -->
	    <script src="${pageContext.request.contextPath}/resources/template/js/bootstrap/popper.min.js"></script>
	    <!-- Bootstrap js -->
	    <script src="${pageContext.request.contextPath}/resources/template/js/bootstrap/bootstrap.min.js"></script>
	    <!-- All Plugins js -->
	    <script src="${pageContext.request.contextPath}/resources/template/js/plugins/plugins.js"></script>
	    <!-- Active js -->
	    <script src="${pageContext.request.contextPath}/resources/template/js/active.js"></script>
	</div>
</body>
</html>
