<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<script src = "http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="./resources/bootstrap/css/bootstrap.css">
</head>
<style>

</style>
<body>
	<jsp:include page="/jsp/header.jsp"/>
	<div id="hospital_wrap" style="text-align:center">
		<h2 class="hospital_title">정말로 삭제하시겠습니까?</h2>
		<form method="post" action="hospital_del_ok.nhn" onsubmit="return del_check()">
			<input type="hidden" name="hospital_num" value="${hospital.hospital_board_num}">
			<input type="hidden" name="page" value="${page}">
			
			<div id="hospital_menu">
				<input type="submit" value="삭제" class="btn btn-info"> 
				<input type="reset" value="취소" class="btn btn-info" onclick="location='hospital_list.nhn?page=1'" />
			</div>
		</form>
	</div>
<jsp:include page="/jsp/footer.jsp"/>
<script src="./resources/bootstrap/js/bootstrap.min.js"></script>  	
</body>
</html>