<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="./resources/css/mainpage.css" type="text/css">
<title>Main Page</title>
<script src = "http://code.jquery.com/jquery-latest.js"></script>
<script src="resources/js/hospitalwrite.js"></script>
<link rel="stylesheet" href="./resources/bootstrap/css/bootstrap.css">
</head>
<body>
<jsp:include page="/jsp/header.jsp"/>
<div id="hospital_wrap">
	<h3>진료기록부 작성하기</h3>
	<form action="hospital_write_ok.nhn" method="post" onsubmit="return check()" enctype="multipart/form-data">
	<table border="1" class="table">
	<tr>
		<th>보호자 성명</th>
		<td><input name="master_name" id="master_name" class="input_box"/></td>
	</tr>
	
	<tr>
		<th>보호자 전화번호</th>
		<td><input name="master_tel" id="master_tel" class="input_box"/></td>
	</tr>
	
	<tr>
		<th>펫 이름</th>
		<td><input name="pet_name" id="pet_name" class="input_box"/></td>
	</tr>
	
	<tr>
		<th>종 분류</th>
		<td><input name="pet_speices" id="pet_speices" class="input_box" /></td>
	</tr>
	
	<tr>
		<th>병원 이름</th>
		<td><input name="hospital_name" id="hospital_name1"  class="input_box"/></td>
	</tr>
	
	<tr>
		<th>병원 연락처</th>
		<td><input name="hospital_tel" id="hospital_tel" class="input_box"/></td>
	</tr>
	
	<tr>
		<th>병원 주소</th>
		<td><input name="hospital_address" id="hospital_address" size="40" class="input_box"/></td>
	</tr>
	
	<tr>
		<th>제목</th>
		<td><input name="hospital_subject" id="hospital_subject"  class="input_box"/></td>
	</tr>
	
	<tr>
		<th>진료 내역</th>
		<td><textarea name="hospital_content" id="hospital_content" cols="20" rows="10"></textarea></td>
	</tr>
	</table>
	<div id="hospital_menu" style="text-align:center">
		<input type="submit" value="등록" class="btn btn-info">
		<input type="reset" value="취소" class="btn btn-info"
		onclick="$('hospital_subject').focus();">
		<input type="button" value="목록" class="btn btn-info"
		onclick="location='hospital_list.nhn?page=1'">
	</div>
	</form>
	</div>
	<jsp:include page="/jsp/footer.jsp"/>
	<script src="./resources/bootstrap/js/bootstrap.js"></script>
</body>
</html>