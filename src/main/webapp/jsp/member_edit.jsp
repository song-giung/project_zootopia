<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<style>
#upfile{display:none}
#close{dosplay:none}
label img{width:30px}
#close img {width:15px}
}
</style>
<script>

$(function(){
	$("#join_tel1").val('${join_tel1}'); 
	$("#join_phone1").val('${join_phone1}'); 
	$("#join_maildomain").val('${join_maildomain}'); 
	$("#join_tt4").css('display','none');
	$("#join_tt5").css('display','none');
	/* $("#join_tt2").css('display','none'); */
})


function fileshow(){
	   if($("#filevalue").text()==""){
	      $("#close").css("display","none");
	   }else{
	      $("#close").css("display","inline");
	   }
	}
	      
	$(function(){
	   fileshow();
	   $("#upfile").change(function(){
	      $("#filevalue").text('');
	      //$(this).val()=> c:\fakepath\image1.png
	      var inputfile=$(this).val().split('\\');//c:fakepath,image1.png
	      $('#filevalue').text(inputfile[inputfile.length-1]);
	      fileshow();
	   })
	   
	   $("#close").click(function(){
	      $("#filevalue").text('');
	      $(this).css("display",'none');
	   })
	})
	
	function id_check() {
		var id = $("#join_id").val();
		var check = /^[a-z1-9_]{4,12}$/;

		if (id == '') {
			alert("아이디를 입력하세요");
			$("#join_id").focus();
			$('#idcheck').text("");
		} else if (!check.test(id)) {
			alert('길이 1~12자/소문자/숫자/_만 허용');
			$("#join_id").focus();
			$('#join_id').val("");
			$('#idcheck').text("");
		} else {
			$.ajax({
				url : "./checkMemberId.nhn",
				type : "POST",
				data : {"id" : id},
				success : function(data) {
					if (data == 0) {
						$('#idcheck').text("가입 가능합니다.").css("color", "blue")
						checkconfirm = true;
						checkid = id
					} else {
						$("#idcheck").text("중복아이디 존재").css("color", "red")
					}
				}
			})
		}
	}

	function post_check() {
		window.open("zipcode_find.nhn", "우편번호검색", "width=410,height=200",
				"scrollbars=yes");
	}
	
	function pwd_change() {
		window.open("pwd_change.nhn", "비밀번호 변경", "width=500,height=200",
				"scrollbars=yes");
	}

	function post_search() {
		alert("우편번호 검색 버튼을 클릭하세요")
	}

	function domain_list() {
		/* 리스트에서 직접입력을 선택했을때 */
		if ($("#mail_list").val() == "0") // 직접입력
		{
			// @뒤에 도메인입력란을 공백처리
			$("#join_maildomain").val("");

			// @뒤의 도메인입력란을 쓰기가능
			$("#join_maildomain").attr("readOnly", false);

			// 도메인 입력란으로 입력대기상태
			$("#join_maildomain").focus();

		} else { // 리스트 목록을 선택했을때
			$("#join_maildomain").val($("#mail_list").val());
			$("#join_maildomain").attr("readOnly", true);
		}
	}

	function check_form() {

		if($.trim($("#join_zipcode_edit").val()) == "") {
			alert("우편번호를 입력하세요!");
			$("#join_zip").val("").focus();
			return false;

		}
		if($.trim($("#join_address1_edit").val()) == "") {
			alert("주소를 입력하세요!");
			$("#join_zip").val("").focus();
			return false;

		}
		if($.trim($("#join_address2_edit").val()) == "") {
			alert("나머지 주소를 입력하세요!");
			$("#join_zip").val("").focus();
			return false;

		}
		if($.trim($("#join_tel2_edit").val()) == "") {
			alert("전화번호 앞자리를 입력하세요!");
			$("#join_tel2").val("").focus();
			return false;

		}
		if($.trim($("#join_tel3_edit").val()) == "") {
			alert("전화번호 뒷자리를 입력하세요!");
			$("#join_tel2").val("").focus();
			return false;

		}
		if($.trim($("#join_mailid_edit").val()) == "") {
			alert("이메일을 입력하세요!");
			$("#join_mailid").val("").focus();
			return false;

		}
		if($.trim($("#join_maildomain_edit").val()) == "") {
			alert("도메인을 입력하세요!");
			$("#join_maildomain").val("").focus();
			return false;

		}
	}
	
 	function display1(box) {
 		$("#join_tt4").css('display','none');
		$("#join_tt5").css('display','none');
		
	}
	function display2(box) {
		
		$("#join_tt4").css('display','block');
		$("#join_tt5").css('display','none');
	}
	function display3(box) {
		
		$("#join_tt4").css('display','none');
		$("#join_tt5").css('display','block');
	}
	
	
</script>
<div class="modal fade" id="modal_edit" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	 <div class="modal-dialog modal-dialog-centered" role="document">
	 	<div class="modal-content">
	 	
	<div id="join_wrap">
			
				<div class="modal-header">
       				 <h5 class="modal-title" id="exampleModalLongTitle">정보수정</h5>
       				 <button type="button" class="close" data-dismiss="modal" aria-label="Close">
         			 <span aria-hidden="true">&times;</span>
        			 </button>
     			</div>
     			
		<div class="modal-body">
			<form name="f" method="post" action="member_edit_ok.nhn" id="edit_form" onsubmit="return check_form()" enctype="multipart/form-data">
				<div class="form-group-row">
					<h4 class="join_title col-sm-12">기본정보</h4>				
				</div>
				
				<div id="join_t">
					<div class="form-group-row">
						<label for ="join_id" class="col-sm-2 col-form-label" >아이디</label>
						<div class="col-sm-10">
							<input name="join_id" id="join_id_edit" class="form-control" readonly value="${m.join_id }"> 								
						</div>				
					</div>
					<div class="form-group-row">
						<label for="join_pwd1" class="col-sm-2 col-form-label">비밀번호</label>
				 		<div class="col-sm-10">
				  			<input type="button" name="join_password" id="join_pwd1_edit" class="form-control btn btn-info" onclick="pwd_change()" value="비밀번호 변경">
				  		 </div>					
					</div>
					<div class="form-group-row">
						<label for="join_name" class="col-sm-2 col-form-label">회원이름</label>
						<div class="col-sm-10">
				  			<input type="button" name="join_name" id="join_name_edit" class="form-control btn btn-info"  value="${m.join_name}" readonly>
				  		 </div>	
					</div>
					
				<div class="form-group-row">
					<label for="join_year" class="col-sm-3 col-form-label">생년원일</label>
					<div class="col-sm-2">
						<input name="join_year" id="join_year_edit" size="4" class="form-control" readOnly value="${join_year}">
					</div>
					<label for="join_year" class="col-sm-1 col-form-label">년</label>				
					<div class="col-sm-2">
						<input name="join_month" id="join_month_edit" size="2" class="form-control" readOnly value="${join_month}">
					</div>
					<label for="join_month" class="col-sm-1 col-form-label">월</label>					
					<div class="col-sm-2">
						<input name="join_day" id="join_day_edit" size="2" class="form-control" readOnly value="${join_day}">	
					</div>		
					<label for="join_day" class="col-sm-1 col-form-label">일</label>
				</div>
				<div class="form-group-row">
					<label for="join_zipcode" class="col-sm-2 col-form-label">우편번호</label>
					<div class="col-sm-7">
						<input name="join_zipcode" id="join_zipcode_edit" class="form-control" value="${m.join_zipcode}" readonly onclick="post_search()"> 
					</div>
					<div class="col-sm-1">
					
					</div>
					<div class="col-sm-2">
						<input type="button" value="주소 변경" class="form-control btn btn-info" onclick="post_check()">
					</div>									
				</div>
				<div class="form-group-row">
					<label for="join_add1" class="col-sm-2 col-form-label">주소</label>
					<div class="col-sm-4">
						<input name="join_address1" id="join_address1_edit" class="form-control" value="${m.join_address1 }" readonly onclick="post_search()">
					</div>
					<label for="join_add2" class="col-sm-2 col-form-label">나머지 주소</label>
					<div class="col-sm-4">
						<input name="join_address2" id="join_address2_edit" 	class="form-control" value="${m.join_address2 }">
					</div>
				</div>			
				<div class="form-group-row">
					<label for="join_te1" class="col-sm-2 col-form-label">휴대폰번호</label>
					<div class="col-sm-2">
						<input name="join_tel1" id="join_tel1_edit"maxlength="3" class="form-control" value="${join_tel1 }">  
					</div>
					<label for="join_tel2" class="col-sm-1 col-form-label">-</label>
					<div class="col-sm-3">
						<input name="join_tel2" id="join_tel2_edit"  maxlength="4"class="form-control" value="${join_tel2 }">
					</div>
					<label for="join_tel3" class="col-sm-1 col-form-label">-</label>
					<div class="col-sm-3">
						<input name="join_tel3" id="join_tel3_edit"  maxlength="4" class="form-control" value="${join_tel3}">
					</div>							
				</div>
			
				<div class="form-group-row">
					<label for="join_mailid" class="col-sm-2 col-form-label">전자우편</label>
					<div class="col-sm-3">
						<input name="join_mailid" id="join_mailid_edit" class="form-control" value="${join_mailid}"> 
					</div>
					<label for="join_maildomain" class="col-sm-1 col-form-label">@</label>
					 <div class="col-sm-3">
						 <input name="join_maildomain" id="join_maildomain_edit"  class="form-control" readonly value="${join_maildomain}"> 
					 </div>
					 <div class="col-sm-3">
					 	<select name="mail_list" id="mail_list_edit" onchange="domain_list()" class="form-control" >
							<option value="">이메일 선택</option>
							<option value="naver.com">naver.com</option>
							<option value="daum.net">daum.net</option>
							<option value="gmail.com">gmail.com</option>
							<option value="nate.com">nate.com</option>
							<option value="hotmail.com">hotmail.com</option>
							<option value="0">직접입력</option>
						</select>
					 </div>
				
						
				</div>
			
			</div>
			
			
			
						
			<div id="join_tt2">
				<div class="form-group-row">
					<h4 class="join_title col-sm-12">반려동물 정보(선택사항)</h4>
				</div>	
				<div class="form-group-row">
					<div class="form-group-row">
						<label for="join_profile" class="col-sm-2">반려동물사진</label>
					</div>
					
					<label for="upfile"><img class="col-sm-2" src="resources/image/file_open.png" alt="파일열기" style="width:25%"></label>
					
					<div class="col-sm-8">
						<input type="file" name="join_profile" class="form-control" id="upfile" value="${m.join_pet_original }">
						<span id="filevalue">${m.join_pet_original }</span>&nbsp;
						<span id="close"><img src="./resources/image/cancel.png"></span>
					</div>
	
				</div>	
			
				<br>
				<div class="form-group-row">
					<label for="join_pet_name" class="col-sm-2 col-form-label">반려동물 이름</label>
					<div class="col-sm-10">
						<input name="join_pet_name" id="join_pet_name" size="16"class="form-control"  value="${m.join_pet_name }">
					</div>
				</div>
				
				<div class="form-group-row">
					<label for="join_pet_type" class="col-sm-2 col-form-label">반려동물 종</label>	
					<div class="col-sm-10">
						<input name="join_pet_type" id="join_pet_type" size="16"class="form-control" value="${m.join_pet_type }">
					</div>	
				</div>						
			</div>
				
			
			<div id="join_t3">
				<div class="form-group-row">
					<label for="join_type" class="col-sm-3 col-form-label">가입 유형</label>
					<div class="col-sm-3">
						<input type="radio" class="radio_type" name="join_type" checked onclick="display1()" value="general">일반가입
					</div>
					<div class="col-sm-3">
						<input type="radio" class="radio_type" name="join_type"  onclick="display2()" value="sitter">펫시터
					</div>
					<div class="col-sm-3">
						<input type="radio" class="radio_type" name="join_type"  onclick="display3()" value="hospital">병원측
					</div>				
				</div>			
			</div>
			<div id="join_tt4" >
				<div class="from-group-row">
					<div class="col-sm-12">
							<h4>펫시터</h4>
					</div>								
				</div>
				<div class="from-group-row">
					<label for="sitter_license" class="col-sm-2 col-form-label">자격증</label>
					<div class="col-sm-10">
						<input name="sitter_license" id="sitter_license"  class="input_box form-control" value="${m.join_sitter_license }">
					</div>
				</div>
				
			</div>
			
			<div id="join_tt5">
			<div class="form-group-row">
				<div class="col-sm-12">
					<h4>병원측</h4>
				</div>
			</div>
			<div class="form-group-row">
				<label for="hospital_name" class="col-sm-2 col-form-label" >병원 이름</label>
				<div class="col-sm-10">
					<input name="hospital_name" id="hospital_name"  class="form-control" value="${m.join_hospital_name }">
				</div>				
			</div>	
			<div class="form-group-row">
				<label for="hospital_addr" class="col-sm-2 col-form-label">병원 주소</label>
				<div class="col-sm-10">
					<input name="hospital_addr" id="hospital_addr" class="form-control" value="${m.join_hospital_location }">
				</div>
			</div>		
			<div class="form-group-row">
				<label for="hospital_tel1" class="col-sm-2 col-form-label">병원연락처</label>
				<div class="col-sm-2">
						<input name="hospital_tel1" id="hospital_tel1" maxlength="3" class="form-control" value="${m.join_hospital_tel1 }">	
				</div>
				<label for="hospital_tel2" class="col-sm-1 col-form-label">-</label>
				<div class="col-sm-3">
					<input name="hospital_tel2" id="hospital_tel2" maxlength="4"class="form-control"  value="${m.join_hospital_tel2 }">
				</div>
				<label for="hospital_tel3" class="col-sm-1 col-form-label">-</label>
				<div class="col-sm-3">
					<input name="hospital_tel3" id="hospital_tel3" maxlength="4" class="form-control" value="${m.join_hospital_tel3 }">
				</div>
			</div>			
		</div> 			
			

				
			
			</form>
		</div>
		<div class="form-group-row">
			<div class="col-sm-12">&nbsp;</div>
		</div>
		<div class="modal-footer" style="border-top:none">
		 <div id="join_menu">
				 <div class="form-group-row">
				 	<div class="col-sm-6">
				 		<input type="submit" value="수정완료"  class="form-control btn btn-info" onclick="$('#edit_form').submit();alert('수정완료!')">
				 	</div>
				 	<div class="col-sm-6">				 	
				 			<input type="reset" value="취소" class="form-control btn btn-info" onclick="$('#modal_edit').modal('toggle');"> 	 
					 </div>				 				
					</div> 
				</div>  
		
		</div>
		
		
			
		
	
	</div>

</div>
</div>
</div>
