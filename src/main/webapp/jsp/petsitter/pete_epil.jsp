<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="./resources/bootstrap/css/bootstrap.css" rel="stylesheet"> -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<!-- <script src="./resources/bootstrap/js/bootstrap.min.js"></script> -->
<script>
$(function() {
	$('.starRev span').click(function(){
		  $(this).parent().children('span').removeClass('on');
		  $(this).addClass('on').prevAll('span').addClass('on');
		  
	var star = $('.starR.on').length;
	var starhap = parseInt(star)*20
	$('#pete_epil_star').val(starhap)
	return false;
	});
})
function check() {
	if($.trim($("#pete_epil_subject").val())==""){
		alert('제목을 입력해 주세요');
		$("#pete_epil_subject").val("").focus();
		return false;
	}
	
	if($.trim($("#pete_epil_content").val())==""){
		alert('내용을 입력해 주세요');
		$("#pete_epil_content").val("").focus();
		return false;
	}
}

</script>
<style>
.starR{
  background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
  background-size: auto 100%;
  width: 30px;
  height: 30px;
  display: inline-block;
  text-indent: -9999px;
  cursor: pointer;
}
.starR.on{background-position:0 0;} 
.epil_write {
	text-align:center;
}
</style>

<%-- <jsp:include page="/jsp/header.jsp"/> --%>
<h2>펫시터 평가 페이지</h2>
<form action="./pete_epil_ok.nhn" method=POST onsubmit="return check()">
<input type="hidden" value="${pete_id }" name="pete_id">
<input type="hidden" value="${pete_location }" name="pete_location">
<input type="hidden" value="${pete_subject }" name="pete_subject">
<table class="table table-bordered table-hover">
<tr>
	<td>회원 아이디 : <input type="text" name="pete_epil_id" id="pete_epil_id"
	 value="${pete_id}" readonly></td>
</tr>
<tr>
	<td>후기 작성자 : <input type="text" name="join_epil_id" id="join_epil_id"value="${sessionScope.id}" ></td>
</tr>
<tr>
	<td>제목 : <input type="text" name="pete_epil_subject" id="pete_epil_subject" ></td>
</tr>
<tr>
	<td>내용  : <input type="text" name="pete_epil_content" id="pete_epil_content" ></td>
</tr>
<tr>
	<td>별점넣기 : <br>
<div class="starRev">
  <span class="starR on">별1</span>
  <span class="starR">별2</span>
  <span class="starR">별3</span>
  <span class="starR">별4</span>
  <span class="starR">별5</span>
<input type="hidden" name="pete_epil_star" id="pete_epil_star">
</div>

	</td>
</tr>
<tr>
</table>
<div class="epil_write">
<input type="submit" value="후기남기기" class="btn btn-info">
<input type="button" value="취소" onclick="history.go(-1)" class="btn btn-info">
</div>
</form>
<%-- <jsp:include page="/jsp/footer.jsp"/> --%>