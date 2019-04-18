<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>신고 하기</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="./resources/bootstrap/css/bootstrap.css">
 </head>
<body>
<jsp:include page="/jsp/header.jsp"/>
	<div class="row">
	<div class="col-sm-12 text-center">
	<form id="report_go" action="./report.zoo" method="post">
	<input type="hidden" name="report_type" value="${report_type}">
	<input type="hidden" name="num" value="${num}">
	<input type="hidden" name="board_num" value="${board_num}">
	<input type="hidden" name="page" value="${page }">
	<input type="hidden" name="type" value="${type}">
	<input id="report_reason" type="text" name="reason" class="form-control" >
	<input class="btn btn-info" id="report_btn" type="submit" value="신고하기" onclick="alert('신고가 완료되었습니다')">
	</form>
	</div>
	</div>
	<jsp:include page="/jsp/footer.jsp"/>
	<script src="./resources/bootstrap/js/bootstrap.js"></script>
</body>
</html>