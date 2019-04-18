<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>즐겨찾기 게시판 보기</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
 $(function(){	 

	 if("${fav_cate}"!="none")
		 $("#fav_choice_cate").val("${fav_cate}");
	 
	 if("${fav_type}"!=0)
		 $("#fav_choice_type").val("${fav_type}");
	 
	 $("#fav_choice_cate").change(function(){
		 if($(this).val()!=""){
			 if($("#fav_choice_cate").val()=="total" && $("#fav_type").val()==0){		
					$("#fav_search_name").val("")
				}
			 sort_by_cate($(this).val());	
			 
		 }
		 })
		 
		$("#fav_choice_type").change(function(){
		 if($(this).val()!=""){
			 if($("#fav_choice_cate").val()=="total" && $("#fav_type").val()==0){		
					$("#search_name").val("")
				}
			 sort_by_type($(this).val());			
		 }
		 })	 
	
		 
		 
 	$(document).on('submit',"#fav_search",function(){
 		console.log($("#fav_choice_cate").val());
 		console.log($("#fav_choice_type").val());
		$.ajax({
			url:'./my_board.zoo',
			type:'post',
			data:$("#fav_search").serialize()+"&fav_cate="+$("#fav_choice_cate").val()+"&fav_type="+$("#fav_choice_type").val()+"&fav_ajax=search",								
			success:function(data){
				$(".board_pet").empty().prepend(data);
			}
		})
		
		return false;
	}) 
	
})

function sort_by_type(type){
	 if(type==0&&$("#fav_choice_cate").val()=='total'){
		 $("#search_name").val("")
	 }
		$.ajax({
			url:'./my_board.zoo',
			type:'post',
			data:{'fav_ajax':'sort_by_type',
					'fav_type':type,
					'fav_cate':$("#fav_choice_cate").val(),
					'fav_search_field':$("#fav_search_field").val(),
					'fav_search_name':$("#fav_search_name").val()
					},
			
			success:function(data,textStatus,xhr){
		
				$(".board_pet").empty().prepend(data);
				$("#fav_choice_type").val(type)
			}
		})
 }

function sort_by_cate(cate){
	 if(cate=='total'&&$("#fav_choice_type").val()==0){
		 $("#search_name").val("")
	 }
		$.ajax({
			url:'./my_board.zoo',
			type:'post',
			data:{'fav_ajax':'sort_by_cate',
					'fav_type':$("#fav_choice_type").val(),
					'fav_cate':cate,
					'fav_search_field':$("#fav_search_field").val(),
					'fav_search_name':$("#fav_search_name").val()
					},
			
			success:function(data,textStatus,xhr){
				
				$(".board_pet").empty().prepend(data);
				$("#fav_choice_cate").val(cate)
			}
		})
	}
 
	function ajax_paging(page,type,cate){		
		$.ajax({
			url:'./my_board.zoo',
			type:'post',
			data:{"fav_ajax":"paging",
				"fav_page":page,
					"fav_type":type,
					"fav_cate":cate,
					"fav_search_field":$("#fav_search_field").val(),
					"fav_search_name":$("#fav_search_name").val()},
			success:function(data){			
				$(".board_pet").empty().prepend(data);
			}
		})
		
		
	}
	
 function total(){
		
		$("#fav_search_field").val("board_subject");
		$("#fav_search_name").val("");
		$("#fav_choice_cate").val("total");
		$("#fav_choice_type").val(0);
	sort_by_cate("total");
	sort_by_type(0);
		
 }
	
		
		

</script>
<link rel="stylesheet" href="./resources/bootstrap/css/bootstrap.css">
</head>
<body>
<jsp:include page="/jsp/header.jsp"/>

<hr>
		<input type="button" value="전체 보기" onclick="total()">
		<select name="fav_choice_type" id="fav_choice_type">
			<option value="">분류</option>
			<option value="0">전체보기</option>
			<option value="1">일상게시판</option>
			<option value="2">분양/짝게시판</option>
			<option value="3">분실/도움</option>
			<option value="4">공유/후기</option>
		</select>
		
		<select name="fav_choice_cate" id="fav_choice_cate">
			<option value="">분류</option>
			<option value="total">전체보기</option>
			<option value="dog">반려견</option>
			<option value="cat">반려묘</option>
			<option value="etc">기타</option>
		</select>
		<input type="hidden" id="cate" value="${fav_cate}">		
		<input type="hidden" id="type" value="${fav_type}">		
		<div class="board_pet table-responsive">
		
			<table class="table table-hover table-bordered">
				<thead>
					<tr>
						<th colspan="7">
							즐겨찾기 게시판
						</th>
					</tr>
					<tr>
						<th class="col-md-1 mobile">번호</th>
						<th class="col-md-1 mobile">게시판</th>
						<th class="col-md-1 mobile">분류</th>
						<th class="col-md-4">제목</th>
						<th class="col-md-2">글쓴이</th>
						<th class="col-md-2 mobile">날짜</th>
						<th class="col-md-1 mobile">조회수</th>
					</tr>
				</thead>
				<tfoot>
					<tr>
						<td colspan="7" >
							<c:if test="${fav_page<=1}">
								이전
							</c:if>
							<c:if test="${fav_page>1}">
								<a href="#" onclick="ajax_paging('${num-1}','${fav_type}','${fav_cate}');return false;">
									이전
								</a>
							</c:if>
							<c:forEach var="num" begin="${startpage}" end="${endpage}">
								<c:if test="${num==fav_page}">
									${num}
								</c:if>
								<c:if test="${num!=fav_page}">
									<a href="#" onclick="ajax_paging('${num}','${fav_type}','${fav_cate}');return false;">
										${num}
									</a>
								</c:if>
							</c:forEach>
							
							
							<c:if test="${fav_page>=maxpage}">
								다음
							</c:if>
							<c:if test="${fav_page<maxpage}">
								<a href="#" onclick="ajax_paging('${num+1}','${fav_type}','${fav_cate}')">
									다음
								</a>
							</c:if>
						</td>
					</tr>
				</tfoot>
				<tbody>
					<c:set var="num" value="${fav_listcount-(fav_page-1)*fav_limit}"/>
					<c:forEach var="list" items="${fav_list}">
					 <tr>
					 	<td class="mobile">
					 		<c:out value="${num}"/>
					 		<c:set var="num" value="${num-1}"/>
					 	</td>
					 	<td onclick="sort_by_type('${list.board_type}')" class="mobile">
					 		<c:if test="${list.board_type==1}">
					 			[일상]
					 		</c:if>
					 		<c:if test="${list.board_type==2}">
					 			[분양/짝]
					 		</c:if>
					 		<c:if test="${list.board_type==3}">
					 			[분실/도움]
					 		</c:if>
					 		<c:if test="${list.board_type==4}">
					 			[공유/후기]
					 		</c:if>
					 	</td>
					 	<td onclick="sort_by_cate('${list.board_cate}')" class="mobile">
					 		<c:choose>
					 			<c:when test="${list.board_cate=='dog'}">
					 				dog
					 			</c:when>
					 			<c:when test="${list.board_cate=='cat' }">
					 				cat
					 			</c:when>
					 			<c:when test="${list.board_cate=='etc'}">
					 				etc
					 			</c:when>
					 		</c:choose>
					 	</td>
					 	<td>
					 		<c:if test="${list.board_state!=1}">
					 			<form method="post" action="./board_pet_content.zoo" id="fav_${list.board_num}">
					 				<input type="hidden" name="page" value="${fav_page }">
					 				<input type="hidden" name="board_num" value="${list.board_num}">
					 				<input type="hidden"  name="type" value="${fav_type}">
					 				<input type="hidden"  name="cate" value="${fav_cate}">
					 				<input type="hidden" name="fav" value="fav"> 
					 				<input type="hidden" name="search_field" value="${fav_search_field}">
					 				<input type="hidden" name="search_name" value="${fav_search_name}">
					 			</form>
					 		
					 			<a href="#" onclick="$('#fav_${list.board_num}').submit()">
					 				${list.board_subject }
					 			</a>
					 				<c:if test="${fav_reply_count[list.board_num]!=0}">
					 					[${fav_reply_count[list.board_num]}]
					 				</c:if>
					 				<c:if test="${list.check_image==1}">
					 					<img src="./resources/image/icon/camera.png" style="width:15px">
					 				</c:if>
					 		</c:if>
					 		<c:if test="${list.board_state==1}">
					 			<span>관리자에 의해 블락 처리된 게시물 입니다.</span>
					 		</c:if>
					 	</td>
					 	<td>${list.join_id}</td>
						<td class="mobile">${list.board_date}</td>
						<td class="mobile">${list.board_readcount}</td>
					 </tr>
					</c:forEach>
				</tbody>		
			</table>
		</div>
		<!-- 검색어 입력 부분 -->
		<div class="fav_board_pet_search">
			<div class="row">
				<div class="col-sm-12 text-center">
					<form method="post" id="fav_search">
						<select id="fav_search_field" name="fav_search_field">
							<option value="board_subject">제목</option>
							<option value="board_content">내용</option>
							<option value="join_id">글쓴이</option>
							<option value="tag">태그</option>
						</select>		
						<input type="text" name="fav_search_name" id="fav_search_name" class="search_name">
						<input type="submit" value="검색" class="btn btn-info">
					</form>
				</div>

			</div>

				<!-- <select name="choice" id="choice">
					<option value="10" selected> 목록보기 </option>
					<option value="3">3줄보기</option>
					<option value="5">5줄보기</option>
					<option value="7">7줄보기</option>
					<option value="10">10줄보기</option>					
				</select> -->
		</div>
		<jsp:include page="/jsp/footer.jsp"/>
<script src="./resources/bootstrap/js/bootstrap.js"></script>
</body>
</html>