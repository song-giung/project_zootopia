<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>맵 서비스</title>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
 	<link href="./resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<script src="./resources/js/jquery-3.3.1.js"></script>
<style>
#map {
	float: left;
	margin : auto;
	width: 80%;
	left : 10%;
	/* top : 15%; */
	position:absolute;
}
.btn-group-vertical{
	
	float:left;
	width : 5%;
	margin:auto;
	left : 15%;
	/* top : 20%; */
	z-index :2;
	position:absolute;
}
.btn-group-vertical>input{margin-top: 20px;}

.placeinfo_wrap {position:absolute;bottom:28px;left:-150px;width:300px;}
.placeinfo {position:relative;width:100%;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;padding-bottom: 10px;background: #fff;}
.placeinfo:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
.placeinfo_wrap .after {content:'';position:relative;margin-left:-12px;left:50%;width:22px;height:12px;background:url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
.placeinfo a, .placeinfo a:hover, .placeinfo a:active{color:#fff;text-decoration: none;}
.placeinfo a, .placeinfo span {display: block;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
.placeinfo span {margin:5px 5px 0 5px;cursor: default;font-size:13px;}
.placeinfo .title {font-size:14px;border-radius: 6px 6px 0 0;margin: -1px -1px 0 -1px;padding:10px; color: #fff;background: #d95050;background: #d95050 url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
.placeinfo .tel {color:#0f7833;}
.placeinfo .jibun {color:#999;font-size:11px;margin-top:0;}

@media (max-width:412px){
	.btn-group-vertical{
		width : 10%;
	}
	.placeinfo_wrap {
		position:absolute;
		bottom:29px;
		left:-73px;
		width:150px;
	}
	.placeinfo .title{
		padding : 0px 10px 0px 10px;
	}
	.placeinfo{
		padding-bottom : 0px;
	}
	.placeinfo span{
		margin : 0px 5px 0px 5px ;
	}	
}
</style>
<script>
//맵 선택 타입에 따른 마커 표시 ajax
$(document).ready(function(){
	  $("#mapbtn input[type=button]").click(function(){
		   var type = $(this).attr('value');
		   console.log(type);
		   $.ajax({
		    type : "POST",
		    data : {"type" : type, "state":"ajax"},
		    url : "./mapService",
		    cache: false, 
		    headers : {"cache-control" : "no-cache", 
		    	       "pragma" : "no-cache"},
		    success : function(data){
		        $("#MapDiv").empty().prepend(data);
		    },
		    error : function(){
		     alert("에러");
		    }
		   })//ajax end
		  });//change end
	})//ready end
</script>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div>
		<form id=mapbtn >
		<div class="btn-group-vertical">
		<input type="button" name="mapbtn" class="btn btn-info" value="전체">
		<input type="button" name="mapbtn" class="btn btn-info" value="병원">
		<input type="button" name="mapbtn" class="btn btn-info" value="공원"> 
		<input type="button" name="mapbtn" class="btn btn-info" value="호텔"> 
		<input type="button" name="mapbtn" class="btn btn-info" value="카페">
		</div>
		</form>
	</div>

	<div id="MapDiv">
	<div id="map" style=" height: 500px;"></div>
	</div>
<jsp:include page="../footer.jsp"/>
<script src="./resources/bootstrap/js/bootstrap.min.js"></script>
</body>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=14f3aad84361d8097cb7e7ab9a60ed52"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new daum.maps.LatLng(37.56797370012783, 126.98315132496278), // 지도의 중심좌표
			level : 5
		// 지도의 확대 레벨 
		};
		var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
		if (navigator.geolocation) {

			// GeoLocation을 이용해서 접속 위치를 얻어옵니다
			navigator.geolocation.getCurrentPosition(function(position) {

				var lat = position.coords.latitude+ 0.00435, // 위도
				lon = position.coords.longitude- 0.0035; // 경도

				var locPosition = new daum.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
				message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다

				// 마커와 인포윈도우를 표시합니다
				displayMarker(locPosition, message);

			});

		} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

			var locPosition = new daum.maps.LatLng(37.56797370012783, 126.98315132496278), message = 'geolocation을 사용할수 없어요..'

			displayMarker(locPosition, message);
		}
		// 지도에 마커와 인포윈도우를 표시하는 함수입니다
		function displayMarker(locPosition, message) {
			// 마커를 생성합니다
			var marker = new daum.maps.Marker({
				map : map,
				position : locPosition
			});

			var iwContent = message, // 인포윈도우에 표시할 내용
			iwRemoveable = true;
			// 인포윈도우를 생성합니다
	/* 		var infowindow = new daum.maps.InfoWindow({
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
			{content :'${mark.mark_name}',
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
						+'	<a class="title" href="./HomePage?mark_no=' 
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
</html>