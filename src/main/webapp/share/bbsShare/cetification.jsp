<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지역 인증</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
	<% session.setAttribute("member_id", "user01");%>
	 <!-- 테스트용 세션 지정 -->
	 
	<p style="margin-top: -5px">
		Chrome 브라우저는 https 환경에서만 geolocation을 지원합니다.<br>
		<b>구 단위가 일치하면 인증이 가능합니다.</b>
	</p>
	<div id="map" style="width: 100%; height: 500px;"></div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e387f72b408cbc94e6dc6900a187f5bc&libraries=services"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			level : 4
		// 지도의 확대 레벨 
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		var geocoder = new kakao.maps.services.Geocoder();

		map.setDraggable(false); //이동막기
		map.setZoomable(false); //줌막기

		// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
		if (navigator.geolocation) {

			// GeoLocation을 이용해서 접속 위치를 얻어옵니다
			navigator.geolocation.getCurrentPosition(function(position) {

				var lat = position.coords.latitude, // 위도
				lon = position.coords.longitude; // 경도

				var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
				message = '<div style="padding:5px;">현재 위치</div>'; // 인포윈도우에 표시될 내용입니다

				document.getElementById("geo_lat").innerHTML = lat;
				document.getElementById("geo_lon").innerHTML = lon;

				// 마커와 인포윈도우를 표시합니다
				displayMarker(locPosition, message);

			});

		} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

			var locPosition = new kakao.maps.LatLng(33.450701, 126.570667), message = 'geolocation 사용 불가'

			displayMarker(locPosition, message);
		}

		kakao.maps.event.addListener(map, 'idle', function() {
			searchAddrFromCoords(map.getCenter(), addressInfo);
		});

		// 지도에 마커와 인포윈도우를 표시하는 함수입니다
		function displayMarker(locPosition, message) {

			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
				map : map,
				position : locPosition
			});

			var iwContent = message, // 인포윈도우에 표시할 내용
			iwRemoveable = true;

			// 인포윈도우를 생성합니다
			var infowindow = new kakao.maps.InfoWindow({
				content : iwContent,
				removable : iwRemoveable
			});

			// 인포윈도우를 마커위에 표시합니다 
			infowindow.open(map, marker);

			// 지도 중심좌표를 접속위치로 변경합니다
			map.setCenter(locPosition);
		}

		function searchAddrFromCoords(coords, callback) {
			// 좌표로 행정동 주소 정보를 요청합니다
			geocoder.coord2RegionCode(coords.getLng(), coords.getLat(),
					callback);
		}

		function addressInfo(result, status) {
			if (status === kakao.maps.services.Status.OK) {
				var infoDiv = document.getElementById('now_address');

				for (var i = 0; i < result.length; i++) {
					// 행정동의 region_type 값은 'H' 이므로
					if (result[i].region_type === 'H') {
						infoDiv.innerHTML = result[i].address_name;
						break;
					}
				}

			}
		}
		
		$.ajax({
			async : true,
			type : 'POST',
			data : {"member_id":"<%=session.getAttribute("member_id")%>"}, //세션 id
			url : "getaddress",
			dataType : "text",
			success : function(adr) {
				document.getElementById("mem_address").innerHTML = adr;
			},
			error : function() {
				document.getElementById("mem_address").innerHTML = "데이터 베이스 접속 에러";
			}
		})
		

		function cert() {
			var x = document.getElementById("now_address").innerText; //접속지역 행정동명
			var x1 = x.split(' ');
			var x2 = x1[0] + " " + x1[1];
			var y = document.getElementById("mem_address").innerText; //등록지역 행정동명
			var y1 = y.split(' ');
			var y2 = y1[0] + " " + y1[1];

			
			if (x2 !== y2) {
				document.getElementById("result").innerText = "인증 불가"
			} else {

				$.ajax({
					async : true,
					type : 'POST',
					data : {"member_id":"<%=session.getAttribute("member_id")%>"}, //세션 id
					url : "certi",
					dataType : "text",
					success : function() {
						alert("지역 인증이 완료되었습니다.");
						location.href = "BbsShare.jsp";
					},
					error : function(jqXHR, textStatus, errorThrown) {
						alert("ERROR : " + textStatus + " : " + errorThrown);
					}
				})
			}

		}
	</script>
	접속자 인식 위치 :
	<span id="geo_lat"></span> ,
	<span id="geo_lon"></span> (
	<span id="now_address"></span>)
	<br> 접속자 등록 위치 :
	<span id="mem_address"></span>
	<br>
	<button onclick="cert()">지역 인증</button>
	<span id="result"></span>
</body>
</html>