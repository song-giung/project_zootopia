<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="./resources/css/mainpage.css" type="text/css">
<script src = "http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="./resources/bootstrap/css/bootstrap.css">

<title>Main Page</title>
</head>
<body>
<jsp:include page="/jsp/header.jsp"/>
<div id="hospital_wrap" style="width:600px">
	<table id="hospitalwrite" border="1" class="table table-hover table-bordered">
	<tr>
		<th>보호자 성명</th>
		<td>${hospital.master_name}</td>
	</tr>
	
	<tr>
		<th>보호자 전화번호</th>
		<td>${hospital.master_tel}</td>
	</tr>
	
	<tr>
		<th>펫 이름</th>
		<td>${hospital.pet_name}</td>
	</tr>
	
	<tr>
		<th>종 분류</th>
		<td>${hospital.pet_speices}</td>
	</tr>
	
	<tr>
		<th>병원 이름</th>
		<td>${hospital.hospital_name}</td>
	</tr>
	
	<tr>
		<th>병원 연락처</th>
		<td>${hospital.hospital_tel}</td>
	</tr>
	
	<tr>
		<th>병원 주소</th>
		<td>${hospital.hospital_address}</td>
	</tr>
	
		<tr>
		<th>제목</th>
		<td>${hospital.hospital_subject}</td>
	</tr>
	
	<tr>
		<th>진료 내역</th>
		<td>${hospital.hospital_content}</td>
	</tr>
	</table>
	<br><br>
<div id="hospitalcont_menu" style="margin-left:200px">
		<input type="button" value="수정" class="btn btn-info"
		onclick="location='hospital_cont.nhn?hospital_num=${hospital.hospital_board_num}&page=${page}&state=edit'">
		
		<input type="button" value="삭제" class="btn btn-info"
		onclick="location='hospital_cont.nhn?hospital_num=${hospital.hospital_board_num}&page=${page}&state=del'">
		
		<input type="button" value="목록" class="btn btn-info"
		onclick="location='hospital_list.nhn?page=${page}'">
	</div>
	</div>
	<jsp:include page="/jsp/footer.jsp"/>
	<script src="./resources/bootstrap/js/bootstrap.js"></script>
</body>
</html>