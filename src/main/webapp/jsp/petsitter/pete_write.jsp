<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="./resources/bootstrap/css/bootstrap.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="./resources/bootstrap/js/bootstrap.min.js"></script>
<script>
function check_only4(chk){
    var obj4 = document.getElementsByName("pete_family");
    for(var i=0; i<obj4.length; i++){
        if(obj4[i] != chk){
            obj4[i].checked = false;
        }
    }
}
//유효성 검사
function check() {
	var maxByte = 500; 
	
	var spaceCheck  = false;
	var animalCheck = false;
	var walkCheck = false;
	var familyCheck = false
	//비밀번호 유효성 검사
	 if($.trim($("#pete_pass").val())==""){
	    alert("비밀번호를 입력해 주세요"); 
	    $("#pete_pass").val("").focus();
	    	return false;
	 }
	//글제목 유효성 검사
	 if($.trim($("#pete_subject").val())==""){
	    alert("글제목를 입력해 주세요"); 
	    $("#pete_subject").val("").focus();
	    	return false;
	 }
	 
	//글내용 유효성 검사
	 if($.trim($("#pete_content").val())==""){
	    alert("글내용를 입력해 주세요"); 
	    $("#pete_content").val("").focus();
	    	return false;
	 }
	 
	 //집위치 유효성 검사
	 if($.trim($("#pete_location").val())==""){
	    alert("집위치를 입력해 주세요"); 
	    $("#pete_location").val("").focus();
	    	return false;
	 } 
	//돌봄공간
    for(var i=0;i<$('[name="pete_space"]').length;i++){
      if($('input:checkbox[name="pete_space"]').eq(i).is(":checked") == true) {
    	  spaceCheck = true;
        break;
          }
        }
        if(!spaceCheck){
          alert("돌봄공간을 선택해 주세요");
          return false;
        }
        
     //다른동물유무
       for(var i=0;i<$('[name="pete_animals_kind"]').length;i++){
         if($('input:checkbox[name="pete_animals_kind"]').eq(i).is(":checked") == true) {
       	  animalCheck = true;
           break;
             }
           }
           if(!animalCheck){
             alert("다른 동물이 있는지 선택해 주세요");
             return false;
           }
      //펫산책유무
        for(var i=0;i<$('[name="pete_walk"]').length;i++){
          if($('input:checkbox[name="pete_walk"]').eq(i).is(":checked") == true) {
        	  walkCheck = true;
            break;
              }
            }
            if(!walkCheck){
              alert("펫 산책이 필요한지 선택해 주세요");
              return false;
            }     
          
       //다른가족유무
         for(var i=0;i<$('[name="pete_family"]').length;i++){
           if($('input:checkbox[name="pete_family"]').eq(i).is(":checked") == true) {
         	  familyCheck = true;
             break;
               }
             }
             if(!familyCheck){
               alert("다른 가족이 있는지 선택해 주세요");
               return false;
             } 
             
         //파일 유효성 검사
       	 if($.trim($("#uploadfile").val())==""){
       	    alert("파일을 등록해 주세요"); 
       	    $("#uploadfile").val("").focus();
       	    	return false;
       	 }
       	 return true; 
}

</script>
<script src="./resources/js/pete_write.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script charset="UTF-8" type="text/javascript" src="http://t1.daumcdn.net/postcode/api/core/180619/1529384927473/180619.js"></script>
<style>
input[type=checkbox]{
	width: 5%;
    height: 2%;
    margin-top: 10px;
    }
    
.space,.pet,.family,.animals{
	width:16.666667%;
	margin-top:10px;
	display:inline-block;
	padding-left:15px;
}
#postcode2 {
    background-color: #26A69A;
    border-color: #26A69A;
    color: #fff;
}

#postcode2:hover {
	background-color: #5bc0de;
    border-color: #46b8da;
}
</style>
</head>
<jsp:include page="/jsp/header.jsp"/>
<div class="modal-body">
<form method="post" action="./pete_write_ok.nhn" enctype="multipart/form-data" onsubmit="return check()">
	<div class="form-group-row">
			<h4 class="join_title col-sm-12">펫시터 집에 맡기기</h4>				
	</div>
	
	<div class="form-group-row">
	<label for ="join_id" class="col-sm-2 col-form-label">아이디</label>
		<div class="col-sm-10">
			<input name="pete_id" id="pete_id" class="form-control" type="text" value="${sessionScope.id}"> 								
		</div>
	</div>
	
	<div class="form-group-row">
	<label for ="join_id" class="col-sm-2 col-form-label">비밀번호</label>
		<div class="col-sm-10">
			<input name="pete_pass" id="pete_pass" class="form-control" type="password"> 								
		</div>
	</div>
	
	<div class="form-group-row">
	<label for ="join_id" class="col-sm-2 col-form-label">제목</label>
		<div class="col-sm-10">
			<input name="pete_subject" id="pete_subject" class="form-control" name="pete_subject" type="text" value="">							
		</div>
	</div>
	
	<div class="form-group-row">
	<label for ="pete_content" class="col-sm-2 col-form-label">내용</label>
		<div class="col-sm-10">
			<textarea name="pete_content" id="pete_content" class="form-control" cols="67" rows="15"></textarea>							
		</div>
	</div>
	
	<div class="form-group-row">	
		<label for ="pete_time_in" class="col-sm-12 col-form-label">체크인, 체크아웃 가능 시간</label>
	</div>
	
	<div class="form-group-row">	
		<label for ="pete_time_in" class="col-sm-2 col-form-label">체크인</label>
		<div class="col-sm-5">
			<input type="time" name="pete_time_in" id="pete_time_in" class="form-control">
		</div>
		<div class="col-sm-5">
			 <input type="time" name="pete_time_in2" id="pete_time_in2" class="form-control"> 
		</div>
	</div>
	
	<div class="form-group-row">	
		<label for ="pete_time_in" class="col-sm-2 col-form-label">체크아웃</label>
		<div class="col-sm-5">
			 <input type="time" name="pete_time_out" id="pete_time_out" class="form-control"> 
		</div>
		<div class="col-sm-5">
			<input type="time" name="pete_time_out2" id="pete_time_out2" class="form-control">
		</div>
	</div>
		
	<div class="form-group-row">
	<label for="postcode" class="col-sm-2 col-form-label">집위치</label>
		<div class="col-sm-5">
			<input type="text" id="postcode" placeholder="우편번호" class="form-control">	
		</div>
		
		<div class="col-sm-5">
		<input type="button" onclick="execDaumPostcode()" id="postcode2" value="우편번호 찾기" class="form-control">					
		</div>
	</div>
	
	<div class="form-group-row">
	<label for="pete_location" class="col-sm-2 col-form-label"></label>
		<div class="col-sm-10">
		<input type="text" id="pete_location" name="pete_location" placeholder="주소" class="form-control">
		</div>
	</div>
	
	<div>
		<span class="space">돌봄공간</span>
			<input type="checkbox" id="pete_space" name="pete_space" value="pete_space1" onclick="check_only(this)" >주택 
			<input type="checkbox" name="pete_space" value="pete_space2" onclick="check_only(this)">아파트
	</div>
	
	<div>
		<span class="animals">다른 동물 유무</span>
			<input type="checkbox" id="pete_animals_kind" name="pete_animals_kind" value="pete_animals_kind1" onclick="check_only2(this)">있음 
			<input type="checkbox" name="pete_animals_kind" value="pete_animals_kind2" onclick="check_only2(this)">없음
	</div>
	
	<div>
		<span class="pet">펫 산책 유무</span>
			<input type="checkbox" id="pete_walk" name="pete_walk" value="pete_walk1" onclick="check_only3(this)">가능 
			<input type="checkbox" name="pete_walk" value="pete_walk2" onclick="check_only3(this)">불가능
	</div>
	
	
	<div>
		<span class="family">가족 동거 유무</span>
			<input type="checkbox" id="pete_family" name="pete_family" value="pete_family1" onclick="check_only4(this)">있음 
			<input type="checkbox" name="pete_family" value="pete_family2" onclick="check_only4(this)">없음
	</div>
	

	<div class="form-group-row">
		<label for="upfile" class="col-sm-2 col-form-label">집사진</label>
		<div class="col-sm-10">
			<img src="resources/image/file_open.png" alt="파일열기" width=25 height=25>
			<input type="file" id="uploadfile" name="uploadfile">
			<span id="filevalue"></span>&nbsp;<span id="close">
					<!-- 파일을 변경하면 type="file"에 값이 저장되지만 변경하지 않으면 값이 저장되지 않습니다. -->
					<input type="hidden" name="pete_house_original" value="">
					<img src="resources/image/cancel.png" width=25 height=25></span>	
		</div>		 
	</div>
		
	<div class="form-group-row">
			<div class="col-sm-6">			
			<input type="submit" value="글쓰기" id="pete_write" name="pete_write" class="form-control btn btn-info">		
			</div>
			<div class="col-sm-6"> 
			<input type="reset" value="취소" onclick="history.go(-1)" class="form-control btn btn-info">
		</div>
	</div>
			
</form>
</div>
<%-- <jsp:include page="/jsp/footer.jsp"/> --%>