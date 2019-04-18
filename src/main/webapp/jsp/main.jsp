<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="./resources/bootstrap/css/bootstrap.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<title>Main Page</title>


</head>
<body>
	<jsp:include page="/jsp/header.jsp"/>

<div class="jumbotron jumbotron-fluid">
  <div class="container" style="color:white">
    <h2 class="main_phrase">Be Your Friend</h2> 
  
   <!--  <p><a class="btn btn-primary btn-lg" href="#" role="button">Learn more</a></p> -->
    
  </div>
</div>
<hr>
<div class="row">
  <div class="col-sm-6 col-md-4">
    <div class="thumbnail">
      <img src="./resources/image/Pet-Sitter.jpg" alt="..." style="width:330px;height:220px">
      <div class="caption">
        <h3>안전하게 맡기세요.</h3>
        <p>반려동물과 함께 할수 없을때에도 걱정하지 마세요.</p>
        <p><a href="./pete_list.nhn" class="btn btn-info" role="button">펫시터 보러가기</a></p>
      </div>
    </div>
  </div>
  <div class="col-sm-6 col-md-4">
    <div class="thumbnail">
      <img src="./resources/image/map_main.png" alt="..."  style="width:330px;height:220px">
      <div class="caption">
        <h3>위치기반 서비스 제공.</h3>
        <p>우리 주변 반려동물을 위한 시설을 확인해보세요.</p>
        <p><a href="./mapService" class="btn btn-info" role="button">맵서비스 보러가기</a></p>
      </div>
    </div>
  </div>
  <div class="col-sm-6 col-md-4">
    <div class="thumbnail">
      <img src="./resources/image/The-Pet-Doctor.jpg" alt="..."  style="width:330px;height:220px">
      <div class="caption">
        <h3>전문 수의사와 함께합니다.</h3>
        <p>궁금했던 반려동물의 행동장애,질병들에 대해서 알아보세요.</p>
        <p><a href="./DoctorQnA" class="btn btn-info" role="button">DocQnA 보러가기</a> </p>
      </div>
    </div>
  </div>
</div>

<jsp:include page="/jsp/footer.jsp"/>

<script src="./resources/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>