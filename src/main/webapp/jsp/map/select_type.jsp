<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>맵 서비스</title>

</head>
<body>
	<div id="map" style="height: 500px;"></div>
<script src="./resources/js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=14f3aad84361d8097cb7e7ab9a60ed52"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new daum.maps.LatLng(37.56793315127973, 126.98312303603477), // 지도의 중심좌표
			level : 5
		// 지도의 확대 레벨 
		};
		var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
		if (navigator.geolocation) {

			// GeoLocation을 이용해서 접속 위치를 얻어옵니다
			navigator.geolocation.getCurrentPosition(function(position) {

				var lat = position.coords.latitude + 0.00435, // 위도
				lon = position.coords.longitude - 0.0035; // 경도

				var locPosition = new daum.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
				message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다

				// 마커와 인포윈도우를 표시합니다
				displayMarker(locPosition, message);

			});

		} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

			var locPosition = new daum.maps.LatLng(37.56793315127973, 126.98312303603477), message = 'geolocation을 사용할수 없어요..'

			displayMarker(locPosition, message);
		}
		// 지도에 마커와 인포윈도우를 표시하는 함수입니다
		function displayMarker(locPosition, message) {
			// 마커를 생성합니다
			var marker = new daum.maps.Marker({
				map : map,
				position : locPosition
			});

/* 			var iwContent = message, // 인포윈도우에 표시할 내용
			iwRemoveable = true;
			// 인포윈도우를 생성합니다
			var infowindow = new daum.maps.InfoWindow({
				content : iwContent,
				removable : iwRemoveable
			});

			// 인포윈도우를 마커위에 표시합니다 
			infowindow.open(map, marker);
 */
			// 지도 중심좌표를 접속위치로 변경합니다
			map.setCenter(locPosition);
		}
		// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
		var mapTypeControl = new daum.maps.MapTypeControl();

		// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
		// daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
		map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);

		// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		var zoomControl = new daum.maps.ZoomControl();
		map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);

		//마커 이미지의 이미지 주소입니다
		var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

		// 마커 이미지의 이미지 크기 입니다
		var imageSize = new daum.maps.Size(24, 35);

		// 마커 이미지를 생성합니다    
		var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize);
		
		// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
		var positions = [ 
		<c:forEach var="mark" items="${markerlist}">
			{content : '${mark.mark_name}',
			number : '${mark.mark_no}',
			address : '${mark.mark_address}',
			latlng : new daum.maps.LatLng('${mark.mark_lat}','${mark.mark_lng}')},
		
		</c:forEach>
		 ];
		// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
		
		for (var i = 0; i < positions.length; i++) {
			// 마커를 생성합니다
			var marker = new daum.maps.Marker({
				map : map, // 마커를 표시할 지도
				position : positions[i].latlng, // 마커의 위치
				image : markerImage
			});

			var content = '<div class="placeinfo_wrap"><div class="placeinfo"> '
				+'	<a class="title" href="http://localhost:8088/zootopia/HomePage?mark_no=' 
				+ positions[i].number + '" title="' +positions[i].content + '">' // target="_blank" 새탭 열기
				+ positions[i].content + '</a>'
				+'	<span title="' + positions[i].address + '">' + positions[i].address + '</span>'
				+'	</div>'
				+ '<div class="after"></div></div>'
			// 마커에 표시할 인포윈도우를 생성합니다 
			var overlay = new daum.maps.CustomOverlay({
				content : content,
				clickable : true,
				map : map,
				position : marker.getPosition()
			});
			overlay.setMap(null);

			// 마커에 이벤트를 등록하는 함수 만들고 즉시 호출하여 클로저를 만듭니다
			// 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
			(function(marker, overlay) {
				daum.maps.event.addListener(marker, 'click', function() {
					overlay.setMap(map);
				});
				daum.maps.event.addListener(map, 'click', function (mouseEvent) {
					overlay.setMap(null);
				});
				daum.maps.event.addListener(map, 'idle', function() {
					overlay.setMap(null);
				});

			})(marker, overlay);
			// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
			function closeOverlay() {
				this.overlay.setMap(null);
			}
		}
	</script>
</body>
</html>