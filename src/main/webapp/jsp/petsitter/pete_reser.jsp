<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="./resources/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="resources/css/pete_cont.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
<script src="./resources/bootstrap/js/bootstrap.min.js"></script>
<script>
	function check() {
		alert('예약이 완료 됐습니다!');
		return true;		
	}	
</script>
<style>
.btn-default {
	width:14.8em;
}
</style>
<jsp:include page="/jsp/header.jsp"/>
<div class="check_reser" style="margin:0 auto">

<form action="./pete_list.nhn" style="text-align:center">
<h2>예약확인</h2>
<table class="table table-bordered table-hover">
	<c:forEach var="p" items="${peReser }">
	<tr>
		<td>
		글 번호 : ${pete_board_num }
		</td>
	</tr>
	
	<tr>
		<td>
		글 쓴이 : ${pete_id }
		</td>
	</tr>
	
	<tr>
		<td>
		예약 아이디 : ${p.join_id }
		</td>
	</tr>
	
	<tr>
		<td>
		펫 종류 : ${p.pete_kind }
		</td>
	</tr>
	
	<tr>
		<td>
		마릿수 : ${p.pete_kind_many }
		</td>
	</tr>
	
	<tr>
		<td>
		예약 시작 날짜 : ${p.pete_date }
		</td>
	</tr>
	
	<tr>
		<td>
		예약 종료 날짜 : ${p.pete_date2 }
		</td>
	</tr>
		
	<tr>
		<td>
		가격 : ${p.pete_price }원
		</td>
	</tr>
	</c:forEach>
</table>
<input type="submit" value="예약확인" class="btn btn-default">
</form>
</div>
<jsp:include page="/jsp/footer.jsp"/>