<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="./resources/bootstrap/css/bootstrap.css">
<script>

	function check() {	
		if ($.trim($("#join_password").val()) == "") {
			alert("비밀번호를 입력하세요!");
			$("#join_password").val("").focus();
			return false;

		}
		if ($.trim($("#join_password2").val()) == "") {
			alert("비밀번호 확인란을 입력하세요!");
			$("#join_password2").val("").focus();
			return false;
		}

		if($.trim($("#join_password").val()) != $.trim($("#join_password2").val())) {
			alert("비밀번호가 일치하지 않습니다.");
			$("#join_password2").val("").focus();
			return false;
		}
	}
	
	$(function() {
		$('#btn_change').click(function() {
			alert('변경이 완료되었습니다!');
			window.close();
		})
		
		 $("#join_id").val(opener.$("#join_id").val()); 
	})
	
</script>
<title>Insert title here</title>
</head>
<style>
.change_pwd_table{
	margin:0 auto;
	}
	.btn-info{
	background-color:#26A69A;
	border-color:#26A69A;
	}
	.btn{
	padding:6px
	}
	
</style>
<body>
<div class="change_pwd_table">
	<form method="post" action="pwd_change_ok.nhn" id="pwdchangeform" onsubmit="return check()">
		<table class="table table-border table-hovered">
			<tr>
				<td>
					<input type="hidden" id="join_id" name="join_id" size="14">
				</td>
			</tr>
			<tr>
				<th>변경할 비밀번호</th>
				<td><input type="password" name="join_password"
					id="join_password" size="14" class="input_box">
			</tr>

			<tr>
				<th>비밀번호 확인</th>
				<td><input type="password" name="join_password2"
					id="join_password2" size="14" class="input_box">
			</tr>

		</table>

		<div id="join_menu">
		
			<p style="text-align:center"><input type="submit" value="변경하기" class="input_button btn btn-info" name="btn_change" id="btn_change"> 
				<input type="button" value="취소" class="input_button btn btn-info" onclick="self.close()">
			</p>
		</div>
	</form>
	</div>
	
<script src="./resources/bootstrap/js/bootstrap.min.js"></script>  	
</body>
</html>