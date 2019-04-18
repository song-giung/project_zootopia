<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
$(function(){

	
	
	 $("#login_user_id").click(function(){
		
			$.ajax({
				url:'./member_edit.nhn',
				success:function(data){					
					$("#modal_edit_empty").empty().append(data);
				}
			})
			$("#join_tel1").val('${join_tel1}'); 
			$("#join_phone1").val('${join_phone1}'); 
			$("#join_maildomain").val('${join_maildomain}'); 
			join_t4.style.display = 'none';
			join_t5.style.display = 'none';
		
	}) 
	
	
	
 		$.ajax({
			url:"./member_login.nhn",
			success:function(data){
				
				
				$("#modal_login_empty").append(data);
			}
		})
		
 	$.ajax({
			url:"./member_join.nhn",
			success:function(data){
			
				$("#modal_join_empty").append(data);
			}
		})   
		
		 
		
		
	})
	
function check_pwd() {
		
		if($.trim($("#find_id").val())=="") {
			alert("아이디를 입력하세요!");
			$("#id").val("").focus();
			return false;
		}
		if($.trim($("#find_name").val())=="") {
			alert("회원이름을 입력하세요!");
			$("#name").val("").focus();
			return false;
		}
	}
</script>


<style>
pre{text-align:left}
@font-face{font-family:"dohyeon"; src:url('./resources/css/fonts/BMDOHYEON_ttf.ttf')}
@font-face{font-family:"nanumB"; src:url('./resources/css/fonts/NANUMSQUAREROUNDB.TTF')}
@font-face{font-family:"nanumEB"; src:url('./resources/css/fonts/NANUMSQUAREROUNDEB.TTF')}
@font-face{font-family:"nanumR"; src:url('./resources/css/fonts/NANUMSQUAREROUNDR.TTF')} 
@font-face{font-family:"nanumL"; src:url('./resources/css/fonts/NANUMSQUAREROUNDL.TTF')} 

body{width:80%;
	margin:0 auto;
	font-family: nanumEB;
	line-height:200%;
		 
	}
.jumbotron{
		background:url('./resources/image/main_image3.jpg') no-repeat center bottom;
		background-size:cover;		
		padding-top:12em;
		padding-bottom:12em;
		min-height:500px;
		font-family:dohyeon;
	}
	
 	#modal_login .modal-dialog,#modal_find_pwd .modal-dialog{
 		  /* height: 80%;  */
 		 padding-top:10%;
 		 
	}

	#modal_login .modal-title,#modal_join .modal-title,#modal_find_pwd .modal-title,#modal_edit .modal-title{
	color:#26A69A;
	font-size:1.5em;
	font-family:dohyeon;
	text-align:center;
	}
	
	
		
	#modal_login .modal-content,#modal_find_pwd .modal-content {
 		 height: 100%;
  		 overflow:visible;
  		 width: 300px;
   		 margin: 0 auto;
  		 		 
	}
	
	#modal_join .modal-content,#modal_edit .modal-content{

 		 height: 100%;
  		 overflow:visible;
  		 width: 800px;
   		 margin: 0 auto;
   		 margin-left:-100px;
   	  		 		 
	}

	#modal_login .modal-body,#modal_join .modal-body,#modal_find_pwd .modal-body,#modal_edit .modal-bdy {
		 height: 80%;
 		 overflow: auto;
	} 
	
	
		
	#modal_login .modal-footer,#modal_join .modal-footer,#modal_find_pwd .modal-footer,#modal_edit .modal-footer{
		text-align:center;
	}
	

	
	
	
	.btn-info{
	background-color:#26A69A;
	border-color:#26A69A;
	}
	
	.btn{
	padding:6px
	}
	

	
	
	@media(max-width:800px){	

			body{width:95%}
	
	
		#modal_join .modal-content ,#modal_edit .modal-content{

 		 height: 100%;
  		 overflow:visible;
  		 width: 300px;
   		 margin: 0 auto;
		}	

	nav a,h4{
	 	font-size:1em;
	}
	
	h3{
		font-size:1.5em;
	}
	
	.footer{
		display:none;
	}
	
	.table-responsive,.btn-info{
	font-size:0.8em;
	}
	
	
	.mobile{display:none !important
	}
	

	}/* <!--media end --> */
	
	.form-control,label,input[type="radio"]{
		margin-top:10px
	}
	 

.navbar-default{
	background-color:white;
	border-left:0;
	border-right:0;

	}
.navbar-default .navbar-brand{
	color:#26A69A;
	font-size:2em;
	font-weight:bold;
	font-family:dohyeon;
	
}

.navbar-default .navbar-brand:hover{
	color:#26A69A;
}
.navbar-default .navbar-collapse{
	padding-right: 100px;
}
.navbar-default .navbar-nav > li > a{
	font-size:1.3em;
}

.dropdown-menu > li > a {
	font-size:1em;
	}

 /*     .dropdown:hover .dropdown-menu{
        display : block;
    }   
    */



thead>tr>th,tfoot,td{
	text-align:center;
	}
	
thead>tr:nth-child(1)>th{
	/* font-size:2em; */
}

#hospital_wrap{
	margin:0 auto;
}
.table-responsive{
	overflow-x: hidden;
}
	
</style>


<nav class="navbar navbar-default ">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#" onclick="location.href='/zootopia'">My Pet Diary</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">펫시팅 <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="./pete_list.nhn">펫시팅 맡기기</a></li>
          </ul>
        </li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">맵서비스 <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="./mapService" >맵서비스</a></li>
            <c:if test="${sessionScope.id=='admin'}">
              <li role="separator" class="divider"></li>
            <li><a href="./markerAdd">마커등록</a></li>
            </c:if>
          </ul>
        </li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">게시판 <span class="caret"></span></a>
          <ul class="dropdown-menu">
         	 <li><a href="./board_pet.zoo?type=1">일상게시판</a></li>
         	 <li role="separator" class="divider"></li>
			<li><a href="./board_pet.zoo?type=2">분양/짝 찾기 게시판</a></li>
			<li role="separator" class="divider"></li>
			<li><a href="./board_pet.zoo?type=3">분실/도움 게시판</a></li>
			<li role="separator" class="divider"></li>
			<li><a href="./board_pet.zoo?type=4">공유/후기 게시판</a></li>
          </ul>
        </li>
          <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">DoctorQnA <span class="caret"></span></a>
          <ul class="dropdown-menu">
         	 <li><a href="./DoctorQnA">Doctor QnA</a></li>
          </ul>
        </li>
        
        
      </ul>
      
      <ul class="nav navbar-nav navbar-right">
      	<c:if test="${empty sessionScope.id}">
      		<li><a data-toggle="modal" id="modal_login_href" data-target="#modal_login" href="#" onclick="return false;">로그인</a></li>
         	<li><a data-toggle="modal" id="modal_join_href" data-target="#modal_join" href="#" onclick="return false;">회원가입</a></li>
      	</c:if>
      	<c:choose>	
      		<c:when test="${sessionScope.id=='admin'}">
						<li><a href="./member_logout.nhn">로그아웃</a></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false" id="login_user_id">${sessionScope.id}<span
								class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a data-toggle="modal" id="modal_edit_href"
									data-target="#modal_edit" href="#" onclick="return false;">정보
										수정하기</a></li>
								<li role="separator" class="divider"></li>
								<li><a href="./my_board.zoo">마이게시판</a></li>
								<li role="separator" class="divider"></li>
								<li><a href="./hospital_list.nhn">진료기록부</a></li>
								<li role="separator" class="divider"></li>
								<li role="separator" class="divider"></li>
								<li><a href="#">회원관리</a></li>
								<li role="separator" class="divider"></li>
								<li><a href="./admin_board.zoo">게시판관리</a></li>
							</ul></li>
					</c:when>
      		<c:when test="${!empty sessionScope.id}">
						<li><a href="./member_logout.nhn">로그아웃</a></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-haspopup="true"
							aria-expanded="false" id="login_user_id">${sessionScope.id}<span
								class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a data-toggle="modal" id="modal_edit_href"
									data-target="#modal_edit" href="#" onclick="return false;">정보
										수정하기</a></li>
								<li role="separator" class="divider"></li>
								<li><a href="./my_board.zoo">마이게시판</a></li>
								<li role="separator" class="divider"></li>
								<li><a href="./hospital_list.nhn">진료기록부</a></li> 
							</ul></li>
					</c:when>
      		
      	</c:choose>
     </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

<div id="modal_login_empty"></div>

<div id="modal_join_empty"></div>

<div class="modal fade" id="modal_find_pwd" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	 <div class="modal-dialog modal-dialog-centered" role="document">
	 <div class="modal-content">
	 <div id="login_wrap">
	
	
	<div id="pwd_wrap">
	
	
	<c:if test="${empty pwdok }">
	
	 <div class="modal-header">
		 <h5 class="modal-title" id="exampleModalLongTitle">비번 찾기</h5>	 
	     <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
         </button>
	 </div>
	 <div class="modal-body">
	 	 <form method="post" action="pwd_find_ok.nhn" id="find_pwd" onsubmit="return check_pwd()">
			  <table id="pwd_t">
	  			<tr>
	  				<th>아이디</th>
	  				<td><input name="join_id" id="find_id" size="14" class="input_box"/></td>
	  			</tr>	  	
			  	<tr>
	  				<th>회원이름</th>
	  				<td><input name="join_name" id="find_name" size="14" class="input_box"/> </td>
	  			</tr>
			</table>
		</form>	 	
	 </div>
	 <div class="modal-footer">
	 	<div id="pwd_menu">
			<input type="button" value="찾기" class="btn btn-info" onclick="$('#find_pwd').submit()">
			<input type="button" value="취소" class="btn btn-info" onclick="$('#modal_find_pwd').modal('toggle');">
		</div>			
	 </div>	
	</c:if>
	
	<c:if test="${!empty pwdok }">
		 <div class="modal-header">
			 <h5 class="modal-title" id="exampleModalLongTitle">비번찾기 결과</h5>	 
	     		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
         	 <span aria-hidden="true">&times;</span>
        	 </button>
		 </div>
		<div class="modal-body">
			<table id="pwd_t2">
			<tr>
				<th>검색한 비번 : </th>
				<td>${pwdok }</td>
			</tr>
			</table>
		</div>
		<div class="modal-footer">
			<div id="pwd_close2">
				<input type="button" value="닫기" class="btn btn-info" onclick="$('#modal_find_pwd').modal('toggle');">
			</div>
		</div>
		
		
		
		
	</c:if>
	
	</div>
	</div>
	</div>
</div>
</div>
	
<div id="modal_edit_empty"></div>	





