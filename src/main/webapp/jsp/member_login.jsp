<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script>
 function check_login(){
		
	 if($.trim($("#id").val())==""){
		 alert("로그인 아이디를 입력하세요!");
		 $("#id").val("").focus();
		 return false; 
	 }
		
	 if($.trim($("#pwd").val())==""){
		 alert("비밀번호를 입력하세요!");
		 $("#pwd").val("").focus();
		 return false;
	 }
 }
 

</script>


<div class="modal fade" id="modal_login" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	 <div class="modal-dialog modal-dialog-centered" role="document">
	 <div class="modal-content">
	 <div id="login_wrap">
        <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">로그인</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
  <form method="post" action="member_login_ok.nhn" id="login_form" onsubmit="return check_login()">
 	<div class="form-group-row">
 		<label for="id" class="col-sm-5 col-form-label">아이디</label>
 		<div class="col-sm-7">
 			<input name="id" id="id"  class="input_box form-control"
			     <c:if test="${!empty saveid }">
			     	value="${saveid }"
			     </c:if>
			     >
 		</div>
 	</div>
    <div class="form-group-row">
 		<label for="pwd" class="col-sm-5 col-form-label">비밀번호</label>
 		<div class="col-sm-7">
 			<input type="password" name="pwd" id="pwd"  class="input_box form-control">
 		</div>
 	</div>
      <div style="text-align:center">
 		<label for="id">아이디 기억</label>
 		
 			<input type="checkbox" name="saveid" id="saveid" 
			    <c:if test="${!empty saveid }">
			    	checked
			    </c:if>
		    	>
 		
 	</div>

     
 
   
   </form>
   </div>
   
    <div class="modal-footer">
    <div id="login_menu">
      <input type="submit" value="로그인" class="btn btn-info" onclick="$('#login_form').submit()">
      <input type="reset"  value="취소"  class="btn btn-info"  onclick="$('#modal_login').modal('toggle');" >
      <input type="button" value="회원가입" class="btn btn-info" data-toggle="modal" data-target="#modal_join">
      <input type="button" value="비번찾기" class="btn btn-info"  data-toggle="modal" data-target="#modal_find_pwd" >
    </div>
  
  </div>
 </div>
 </div>
 </div>
 </div>
