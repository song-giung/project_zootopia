<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	$(function() {
		$("#join_maildomain").val('${join_maildomain}');
		$("#join_year").val('${join_yaer}');
		$("#join_month").val('${join_month}');
		$("#join_day").val('${join_day}');

	})

	function fileshow() {
		if ($("#filevalue").text() == "") {
			$("#close").css("display", "none");
		} else {
			$("#close").css("display", "inline");
		}
	}

	$(function() {
		fileshow();
		$("#upfile").change(function() {
			$("#filevalue").text('');
			//$(this).val()=> c:\fakepath\image1.png
			var inputfile = $(this).val().split('\\');//c:fakepath,image1.png
			$('#filevalue').text(inputfile[inputfile.length - 1]);
			fileshow();
		})

		$("#close").click(function() {
			$("#filevalue").text('');
			$(this).css("display", 'none');
		})
	})

	function id_check() {
		var id = $("#join_id").val();
		var check = /^[a-z1-9_]{4,12}$/;
		console.log('id : '+id);
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
				data : {
					"id" : id
				},
				success : function(data) {
					
					if (data == 0) {
						$("#check_id_empty").empty().html("<div class='form-group-row'><h4 class='col-sm-12' id='idcheck'></h4></div>")
						$('#idcheck').text("사용 가능한 아이디입니다.").css("color",
								"black")
						checkconfirm = true;
						checkid = id
					} else {
						$("#check_id_empty").empty().html("<div class='form-group-row'><h4 class='col-sm-12' id='idcheck'></h4></div>")
						$("#idcheck").text("중복된 아이디가 존재합니다.").css("color",
								"red")
					}
				}
			})
		}
	}

	function post_check() {
		window.open("zipcode_find.nhn", "우편번호검색", "width=420,height=100",
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

	function check_join() {
		if ($.trim($("#join_id").val()) == "") {
			alert("회원 아이디를 입력하세요!");
			$("#join_id").val("").focus();
			return false;
		}

		/* 		if (checkconfirm == false || checkid != $("#join_id").val()) {
					alert("아이디 중복체크 하세요!");
					return false;
				} */

		if ($.trim($("#join_pwd1").val()) == "") {
			alert("비밀번호를 입력하세요!");
			$("#join_pwd1").val("").focus();
			return false;

		}
		if ($.trim($("#join_pwd2").val()) == "") {
			alert("비밀번호 확인란을 입력하세요!");
			$("#join_pwd2").val("").focus();
			return false;

		if($.trim($("#join_pwd1").val()) != $.trim($("#join_pwd2").val())) {
			alert("비밀번호가 일치하지 않습니다.");
			$("#join_pwd2").val("").focus();
		}
			
		}
		if ($.trim($("#join_name").val()) == "") {
			alert("회원 이름을 입력하세요!");
			$("#join_name").val("").focus();
			return false;

		}
		if ($.trim($("#join_zipcode").val()) == "") {
			alert("우편번호를 입력하세요!");
			$("#join_zipcode").val("").focus();
			return false;

		}
		if ($.trim($("#join_add1").val()) == "") {
			alert("주소를 입력하세요!");
			$("#join_zip").val("").focus();
			return false;

		}
		if ($.trim($("#join_add2").val()) == "") {
			alert("나머지 주소를 입력하세요!");
			$("#join_zip").val("").focus();
			return false;
		}

		if ($.trim($("#join_tel1").val()) == "") {
			alert("핸드폰번호 앞자리를 입력하세요!");
			$("#join_tel1").val("").focus();
			return false;

		}
		
		if ($.trim($("#join_tel2").val()) == "") {
			alert("핸드폰번호 가운데를 입력하세요!");
			$("#join_tel2").val("").focus();
			return false;

		}
		if ($.trim($("#join_tel3").val()) == "") {
			alert("핸드폰번호 뒷자리를 입력하세요!");
			$("#join_tel3").val("").focus();
			return false;

		}
		if ($.trim($("#join_mailid").val()) == "") {
			alert("이메일을 입력하세요!");
			$("#join_mailid").val("").focus();
			return false;

		}
		if ($.trim($("#join_maildomain").val()) == "") {
			alert("도메인을 입력하세요!");
			$("#join_maildomain").val("").focus();
			return false;

		}

		/* if ($.trim($("#join_yaer").val()) == "") {
			alert("년도를 선택해주세요!");
		}
		if ($.trim($("#join_month").val()) == "") {
			alert("월을 선택해주세요!");
		}
		if ($.trim($("#join_day").val()) == "") {
			alert("일을 선택해주세요!");
		}
 */
	}
	
 	function display1(box) {
		join_t4.style.display = 'none';
		join_t5.style.display = 'none';
	}
	function display2(box) {
		join_t4.style.display = '';
		join_t5.style.display = 'none';
	}
	function display3(box) {
		join_t4.style.display = 'none';
		join_t5.style.display = '';
	}
	
	$(document).ready(function() {
		join_t4.style.display = 'none';
		join_t5.style.display = 'none';
	}) 
	
</script>


<div class="modal fade in" id="modal_join" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	 <div class="modal-dialog modal-dialog-centered" role="document">
	 	<div class="modal-content">
			<div id="join_wrap">
		        <div class="modal-header">
       				 <h5 class="modal-title" id="exampleModalLongTitle">회원가입</h5>
       				 <button type="button" class="close" data-dismiss="modal" aria-label="Close">
         			 <span aria-hidden="true">&times;</span>
        			 </button>
     			</div>
     			
     			
      <div class="modal-body">
		<form name="f" method="post" id="join_form" action="member_join_ok.nhn" onsubmit="return check_join()" enctype="multipart/form-data">
			<div class="form-group-row">
					<h4 class="join_title col-sm-12">기본정보</h4>				
			</div>
			
				<div class="form-group-row">
					<label for ="join_id" class="col-sm-2 col-form-label">아이디</label>
					<div class="col-sm-7">
						<input name="join_id" id="join_id" class="form-control"> 								
					</div>				
				
					<div class="col-sm-3">
						<input type="button" value="아이디 중복체크" class="btn btn-info form-control" onclick="id_check()">	
					</div>
				</div>
				<div id="check_id_empty">
					
				</div>
				<div class="form-group-row">
					 <label for="join_pwd1" class="col-sm-2 col-form-label">비밀번호</label>
				 		 <div class="col-sm-10">
				  			<input type="password" name="join_password" id="join_pwd1" class="form-control">
						  </div>
				 </div>	
				 
				 <div class="form-group-row">
					<label for="join_password3"	class="col-sm-2 col-form-label">비밀번호 확인</label>
					  <div class="col-sm-10">				
				  		<input type="password" name="join_password2" id="join_pwd2" class="form-control">				
				 	 </div>
				</div> 
				
				
				<div class="form-group-row">
					<label for="join_name" class="col-sm-2 col-form-label">이름</label>
						<div class="col-sm-10">
							<input type="text" name="join_name" id="join_name" class="form-control">
						</div>											
				</div>

				 <div class="form-group-row">
					<label for="join_year" class="col-sm-3 col-form-label">생년원일</label>
					<div class="col-sm-2">
						<%@ include file="/jsp/include/year_list.jsp"%>
						<select name="join_year" id="join_year" class="form-control">
							<c:forEach var="y" items="${year}">
								<option value="${y}">${y}</option>
							</c:forEach>
							</select>
					</div>
					<label for="join_year" class="col-sm-1 col-form-label">년</label>				
					<div class="col-sm-2">
						<%@ include file="/jsp/include/month_list.jsp"%>
						<select name="join_month" id="join_month" class="form-control">
							<c:forEach var="m" items="${month}">
								<option value="${m}">${m}</option>
							</c:forEach>
						</select>
					</div>
					<label for="join_month" class="col-sm-1 col-form-label">월</label>					
					<div class="col-sm-2">
						 <%@ include file="/jsp/include/day_list.jsp"%>
						<select name="join_day" id="join_day" class="form-control">
							<c:forEach var="d" items="${day}">
								<option value="${d}">${d}</option>
							</c:forEach>
					</select>
					</div>		
					<label for="join_day" class="col-sm-1 col-form-label">일</label>
				</div>
				
				<div class="form-group-row">
					<label for="join_te1" class="col-sm-2 col-form-label">휴대폰번호</label>
					<div class="col-sm-2">
						<input name="join_tel1" id="join_tel1"maxlength="3" class="form-control">  
					</div>
					<label for="join_tel2" class="col-sm-1 col-form-label">-</label>
					<div class="col-sm-3">
						<input name="join_tel2" id="join_tel2"  maxlength="4"class="form-control">
					</div>
					<label for="join_tel3" class="col-sm-1 col-form-label">-</label>
					<div class="col-sm-3">
						<input name="join_tel3" id="join_tel3"  maxlength="4" class="form-control">
					</div>	
						
				</div>
				
				<div class="form-group-row">
					<label for="join_mailid" class="col-sm-2 col-form-label">전자우편</label>
					<div class="col-sm-3">
						<input name="join_mailid" id="join_mailid" class="form-control"> 
					</div>
					<label for="join_maildomain" class="col-sm-1 col-form-label">@</label>
					 <div class="col-sm-3">
						 <input name="join_maildomain" id="join_maildomain"  class="form-control" readonly> 
					 </div>
					 <div class="col-sm-3">
					 	<select name="mail_list" id="mail_list" onchange="domain_list()" class="form-control" >
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
				
				<div class="form-group-row">
					<label for="join_zipcode" class="col-sm-2 col-form-label">우편번호</label>
					<div class="col-sm-7">
						<input name="join_zipcode" id="join_zipcode" class="form-control" readonly onclick="post_search()"> 
					</div>
					<div class="col-sm-1">
					
					</div>
					<div class="col-sm-2">
						<input type="button" value="우편번호검색" class="form-control btn btn-info" onclick="post_check()">
					</div>									
				</div>
				<div class="form-group-row">
					<label for="join_add1" class="col-sm-2 col-form-label">주소</label>
					<div class="col-sm-4">
						<input name="join_address1" id="join_add1" class="form-control" readonly onclick="post_search()">
					</div>
					<label for="join_add2" class="col-sm-2 col-form-label">나머지 주소</label>
					<div class="col-sm-4">
						<input name="join_address2" id="join_add2" 	class="form-control">
					</div>
				</div>
				
		<div id="join_t2">
			
			<div class="form-group-row">
				<h4 class="join_title col-sm-12">반려동물 정보(선택사항)</h4>
			</div>	
					
				<div class="form-group-row">
				<label for="join_profile" class="col-sm-2 col-form-label">반려동물사진</label>
				<div class="col-sm-10">
					<input type="file" name="join_profile" class="form-control">
				</div>
					
				<label for="join_pet_name" class="col-sm-2 col-form-label">반려동물 이름</label>
				<div class="col-sm-10">
					<input name="join_pet_name" id="join_pet_name" size="16"class="form-control">
				</div>
				<label for="join_pet_type" class="col-sm-2 col-form-label">반려동물 종</label>	
				<div class="col-sm-10">
					<input name="join_pet_type" id="join_pet_type" size="16"class="form-control">
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
			
			<div id="join_t4" >
				<div class="from-group-row">
					<div class="col-sm-12">
							<h4>펫시터</h4>
					</div>								
				</div>
				<div class="from-group-row">
					<label for="sitter_license" class="col-sm-2 col-form-label">자격증</label>
					<div class="col-sm-10">
						<input name="sitter_license" id="sitter_license" size="20"class="input_box" class="form-control">
					</div>
				</div>
				
			</div>
			
			
			<div id="join_t5">
			<div class="form-group-row">
				<div class="col-sm-12">
					<h4>병원측</h4>
				</div>
			</div>
			<div class="form-group-row">
				<label for="hospital_name" class="col-sm-2 col-form-label">병원 이름</label>
				<div class="col-sm-10">
					<input name="hospital_name" id="hospital_name"  class="form-control">
				</div>				
			</div>	
			<div class="form-group-row">
				<label for="hospital_addr" class="col-sm-2 col-form-label">병원 주소</label>
				<div class="col-sm-10">
					<input name="hospital_addr" id="hospital_addr" class="form-control">
				</div>
			</div>		
			<div class="form-group-row">
				<label for="hospital_tel1" class="col-sm-2 col-form-label">병원연락처</label>
				<div class="col-sm-2">
						<input name="hospital_tel1" id="hospital_tel1" maxlength="3" class="form-control">	
				</div>
				<label for="hospital_tel2" class="col-sm-1 col-form-label">-</label>
				<div class="col-sm-3">
					<input name="hospital_tel2" id="hospital_tel2" maxlength="4"class="form-control">
				</div>
				<label for="hospital_tel3" class="col-sm-1 col-form-label">-</label>
				<div class="col-sm-3">
					<input name="hospital_tel3" id="hospital_tel3" maxlength="4" class="form-control">
				</div>
			</div>			
		</div> 			
	</form>			
			</div>
			
			<div class="modal-footer">	
				 <div id="join_menu">
				 <div class="form-group-row">
				 	<div class="col-sm-6">
				 		<input type="submit" value="가입하기" onclick="$('#join_form').submit()" class="form-control btn btn-info">
				 	</div>
				 	<div class="col-sm-6">				 	
				 			<input type="reset" value="취소" class="form-control btn btn-info" onclick="$('#modal_join').modal('toggle');"> 	 
					 </div>				 				
					</div> 
				</div>  
		    </div>
	</div>
 </div>
</div>
</div>
