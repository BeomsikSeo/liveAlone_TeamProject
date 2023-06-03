<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>one</title>
<style>
.overlaybox {position:relative;width:300px;height:150px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/box_movie.png') no-repeat;padding:15px 10px;}
.overlaybox div, ul {overflow:hidden;margin:0;padding:0;}
.overlaybox li {list-style: none;}
.overlaybox .boxtitle {color:#fff;font-size:16px;font-weight:bold; right 120px center;margin-bottom:8px;}
.overlaybox .first {position:relative;width:247px;height:50px; no-repeat;margin-bottom:8px;}
.first .text {color:#fff;font-weight:bold;}
.first .voyagename {position:absolute;width:100%;bottom:0;background:rgba(0,0,0,0.4);padding:7px 15px;font-size:14px;}
.close {position: absolute;top: 25px;right: 10px;color: #fffff;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png')}
.close:hover {cursor: pointer;}
.overlaybox ul {width:247px;}
.overlaybox li {position:relative;margin-bottom:2px;background:#2b2d36;padding:5px 10px;color:#aaabaf;line-height: 1;}
.overlaybox li span {display:inline-block;}
.overlaybox li .number {font-size:16px;color:#fff;font-weight:bold;}
.overlaybox li .title {font-size:color:#fff;13px;}
.overlaybox li:hover {color:#fff;background:#d24545;}
.overlaybox li:hover .up {background-position:0 0px;}
.overlaybox li:hover .down {background-position:0 -20px;}  
</style>
</head>
<body>
여행지 정보
<hr color="red">
<img src="http://localhost:8888/liveAlone/resources/img/${vo.name}.jpg" alt="Image"><br>
${vo.name} <br>
여행지 주소: ${vo.voyageaddress} <br>
여행지 정보:${vo.info} <br>

<div id="map" style="width:500px;height:500px;"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5d2e73e18842cfaf919b661fddb673fc"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(${vo.longi},${vo.lat}), // 지도의 중심좌표
        level: 4 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
var marker = new kakao.maps.Marker({
    map: map, 
    position: new kakao.maps.LatLng(${vo.longi},${vo.lat})
});
// 커스텀 오버레이에 표시할 내용입니다     
// HTML 문자열 또는 Dom Element 입니다 
var content = '<div class="overlaybox">' +
    '    <div class="first">' +
    '        <div class="voyagename text">${vo.name}</div>' +
    '        <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
    '    </div>' +
    '    <ul>' +
    '        <li class="up">' +
    '            <span class="number">*</span>' +
    '            <span class="title">${vo.tag1}</span>' +
    '        </li>' +
    '        <li>' +
    '            <span class="number">*</span>' +
    '            <span class="title">${vo.tag2}</span>' +

    '        </li>' +
    '        <li>' +
    '            <span class="number">*</span>' +
    '            <span class="title">${vo.tag3}</span>' +

    '        </li>' +      
    '    </ul>' +
    '</div>';

// 커스텀 오버레이가 표시될 위치입니다 
var position = new kakao.maps.LatLng(${vo.longi},${vo.lat});  

// 커스텀 오버레이를 생성합니다
var customOverlay = new kakao.maps.CustomOverlay({
    position: position,
    content: content,
    xAnchor: 0.2,
    yAnchor: 0.2
});
kakao.maps.event.addListener(marker, 'click', function() {
	customOverlay.setMap(map);
});
function closeOverlay() {
	customOverlay.setMap(null);     
}
</script>
<a href=http://localhost:8888/liveAlone/voyageall>첫 페이지로 이동</a>
</body>
</html>