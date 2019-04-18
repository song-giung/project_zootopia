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
<link rel="stylesheet" href="./resources/bootstrap/css/bootstrap.css">
</head>

<body>
<jsp:include page="/jsp/header.jsp"/>
<div id="hospital_wrap" style="width:600px;text-align:center">
<form method = "post" action = "hospital_edit_ok.nhn" enctype="multipart/form-data" onsubmit="return check()">
      <input type= "hidden" name = "hospital_board_num" value = "${hospital.hospital_board_num}"> <!-- name을 Bean 변수명과 일치시켜야 한다 -->
      <input type= "hidden" name = "page" value = "${page}">
      
	<table id="hospitalwrite_t" class="table table-hover table-bordered">
	<tr>
		<th>보호자 성명</th>
		<td><input name="master_name" id="master_name" size="14" class="input_box" value="${hospital.master_name}"></td>
	</tr>
	
	<tr>
		<th>보호자 전화번호</th>
		<td><input name="master_tel" id="master_tel" size="14" class="input_box" value="${hospital.master_tel}"></td>
	</tr>
	
	<tr>
		<th>펫 이름</th>
		<td><input name="pet_name" id="pet_name" size="14" class="input_box" value="${hospital.pet_name}"></td>
	</tr>
	
	<tr>
		<th>종 분류</th>
		<td><input name="pet_speices" id="pet_speices" size="14" class="input_box" value="${hospital.pet_speices}"></td>
	</tr>
	
	<tr>
		<th>병원 이름</th>
		<td><input name="hospital_name" id="hospital_name" size="18" class="input_box" value="${hospital.hospital_name}"></td>
	</tr>
	
	<tr>
		<th>병원 연락처</th>
		<td><input name="hospital_tel" id="hospital_tel" size="18" class="input_box" value="${hospital.hospital_tel}"></td>
	</tr>
	
	<tr>
		<th>병원 주소</th>
		<td><input name="hospital_address" id="hospital_address" size="20" class="input_box" value="${hospital.hospital_address}"></td>
	</tr>
	
		<tr>
		<th>제목</th>
		<td><input name="hospital_subject" id="hospital_subject" size="20" class="input_box" value="${hospital.hospital_subject}"></td>
	</tr>
	
	<tr>
		<th>진료 내역</th>
		<td><textarea>${hospital.hospital_content}</textarea></td>
	</tr>
	</table>
	<br><br>
	
 	<div id = "hospitalwrite_menu">
         <input type = "submit" value = "수정" class = "input_button btn btn-info">
         <input type = "reset" value = "취소" class = "input_button btn btn-info" onclick= "$('#hospital_subject').focus();">
         <input type = "button" value = "목록" class = "intput_button btn btn-info"
            onclick = "location='hospital_list.nhn?page=1'">         
      </div> 
      </form>  
	</div>
<jsp:include page="/jsp/footer.jsp"/>    
<script src="./resources/bootstrap/js/bootstrap.min.js"></script>  
</body>
</html>