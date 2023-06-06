
<%@page import="com.multi.liveAlone.party.voyage.VoyageVO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/template/style.css">
<style>
.roundButton {
	display: inline-block;
	width: 150px;
	height: 150px;
	border-radius: 50%;
	background-color:1px solid lightgray;
	color: #fffff;
	font-size: 18px;
	text-align: center;
	line-height: 150px;
	margin: 10px;
	cursor: pointer;
}
</style>
<style>
#map {
	position: absolute;
	bottom: -320px;
	right: 310px;
	margin: 20px;
}
</style>
<style>
  .randomNameButton {
    border: 1px solid lightgray;
    background-color: 1px solid lightgray;
    padding: 5px 10px;
    border-radius: 4px;
  }
</style>



</head>
<body>
	<%@ include file="/resources/public/header.jsp"%>
	<%-- 해당 주제 페이지에 맞는 이미지와 페이지 설명이 들어가는 부분 --%>
	<section class="breadcumb-area bg-img bg-overlay"
		style="background-image: url(${pageContext.request.contextPath}/resources/template/img/bg-img/breadcumb3.jpg); --%>">
		<div class="bradcumbContent">
			<p></p>
			<h2>여행지</h2>
		</div>
	</section>
	<section>

		<div>
			<div style="display: inline-block;">
				<h1>
					<br>여행지 추천
				</h1>
			</div>
			<div style="display: inline-block;">
				<a href="list"
					onclick="event.preventDefault(); window.location.href = 'list';"
					style="color: gray;">모든 여행지 보기>></a>
			</div>
		</div>
		<div class="row oneMusic-albums">
			<c:forEach items="${randomNames}" var="randomName">

				<!-- Single Album -->
				<div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item ">
					<div class="single-album">
						<img
							src="http://localhost:8888/liveAlone/resources/voyageimg/${randomName}.jpg"
							alt="Image">
						<div class="album-info">
							<button class="randomNameButton"
								onclick="insertSelect('${sessionScope.member_id}', '${randomName}')">${randomName}</button>

						</div>
					</div>
				</div>
			</c:forEach>
		</div>

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
            member_id: '<%=session.getAttribute("member_id")%>',
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
    $('.randomNameButton').click(function(event) {
      event.preventDefault(); // 기본 동작 중지

      var name = $(this).text();
      window.location.href = "one?name=" + name;
    });
  });
</script>


		<div
			class="col-12 col-lg-6 d-flex justify-content-center align-items-center">
			<div class="newsletter-area mb-50">
				<div class="section-heading text-left mb-50">
					<h2>여행지 검색</h2>
				</div>
				<div class="infoform">
					<form action="one">
						<div class="d-flex justify-content-center">
							<input type="text" name="name" id="nameInput" method="get"
								style="height: 50px; width: 300px;">
							<button type="submit" class="btn oneMusic-btn ml-3">
								정보보기 <i class="fa fa-angle-double-right"></i>
							</button>
							<button type="button"
								onclick="insertSelect('<%=session.getAttribute("member_id")%>', $('#nameInput').val())"
								class="btn oneMusic-btn ml-3">
								추가하기 <i class="fa fa-angle-double-right"></i>
							</button>
						</div>
					</form>
				</div>
			</div>
		</div>

		<c:forEach items="${roundButtons}" var="roundButton">
  ${roundButton}
</c:forEach>

		<script>
  $(document).ready(function() {
    $('.roundButton').click(function() {
      var name = $(this).text(); // 클릭한 roundButton의 텍스트 가져오기
      var member_id = '<%=session.getAttribute("member_id")%>'; // 회원 ID 가져오기
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
		<div id="map" style="width: 600px; height: 500px;"></div>
		<button id="setBoundsButton" onclick="setBounds()">한눈에 보기</button>

		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5d2e73e18842cfaf919b661fddb673fc"></script>
		<script>
var member_id = '<%=session.getAttribute("member_id")%>'; 
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
 
// 버튼을 클릭하면 아래 배열의 좌표들이 모두 보이게 지도 범위를 재설정합니다 
var points = [
	<%List<VoyageVO> coordinates = (List<VoyageVO>) request.getAttribute("coordinates");%>
    <%if (coordinates != null) {%>
    <%for (int i = 0; i < coordinates.size(); i++) {%>
        <%VoyageVO coordinate = coordinates.get(i);%>
        new kakao.maps.LatLng(<%=coordinate.getLongi()%>, <%=coordinate.getLat()%>)<%=(i < coordinates.size() - 1) ? "," : ""%>
    <%}%>
<%}%>
];

// 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
var bounds = new kakao.maps.LatLngBounds();    

var i, marker;
for (i = 0; i < points.length; i++) {
    // 배열의 좌표들이 잘 보이게 마커를 지도에 추가합니다
    marker =     new kakao.maps.Marker({ position : points[i] });
    marker.setMap(map);
    
    // LatLngBounds 객체에 좌표를 추가합니다
    bounds.extend(points[i]);
}

function setBounds() {
	
    // LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
    // 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
    map.setBounds(bounds);
}
</script>



	</section>
	<%@ include file="/resources/public/footer.jsp"%>
	<div>
		<!-- jQuery-2.2.4 js -->
		<script
			src="${pageContext.request.contextPath}/resources/template/js/jquery/jquery-2.2.4.min.js"></script>
		<!-- Popper js -->
		<script
			src="${pageContext.request.contextPath}/resources/template/js/bootstrap/popper.min.js"></script>
		<!-- Bootstrap js -->
		<script
			src="${pageContext.request.contextPath}/resources/template/js/bootstrap/bootstrap.min.js"></script>
		<!-- All Plugins js -->
		<script
			src="${pageContext.request.contextPath}/resources/template/js/plugins/plugins.js"></script>
		<!-- Active js -->
		<script
			src="${pageContext.request.contextPath}/resources/template/js/active.js"></script>
	</div>
</body>
</html>
