<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>일상 게시판</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="./resources/bootstrap/css/bootstrap.css">
<script>
 $(function(){
	if('${cate}'!='none')
	 	$("#choice_cate").val('${cate}'); 

	 
	 $("#choice_cate").change(function(){
		 if($(this).val()!=""){
			 if($("#choice_cate").val()=="total"){		
					$("#search_name").val("")
					$(".search_name").val("")
				}
			 sort_by_cate($(this).val());
			
		 }
		 })
	
		 
		 
 	$(document).on('submit',"#search",function(){
		$.ajax({
			url:'./board_pet.zoo',
			type:'get',
			data:$("#search").serialize()+"&cate="+$("#cate").val()+"&type"+$("#type")+"&ajax=search",								
			success:function(data){
				$(".board_pet").empty().prepend(data);
			}
		})
		
		return false;
	}) 
	
})
function sort_by_cate(cate){
	 if(cate=='total'){
		 $("#search_name").val("")
	 }
		$.ajax({
			url:'./board_pet.zoo',
			type:'post',
			data:{'ajax':'sort_by_cate',
					'type':'${type}',
					'cate':cate,
					'search_field':$("#search_field").val(),
					'search_name':$("#search_name").val()
					},
			
			success:function(data,textStatus,xhr){
				console.log(xhr.status);
				console.log(data);
				$(".board_pet").empty().prepend(data);
				$("#choice_cate").val(cate)
			}
		})
	}
 
	function ajax_paging(page,type){		
		$.ajax({
			url:'./board_pet.zoo',
			type:'post',
			data:{"ajax":"paging",
				"page":page,
					"type":type,
					"cate":$("#cate").val(),
					"search_field":$("#search_field").val(),
					"search_name":$("#search_name").val()},
			success:function(data){			
				$(".board_pet").empty().prepend(data);
			}
		})
		
		
	}
	
	
</script>
</head>
<body>
<jsp:include page="/jsp/header.jsp"/>

		<select name="choice_cate" id="choice_cate" class="custom-select">
			<option value="" selected>분류</option>
			<option value="total">전체보기</option>
			<option value="dog">반려견</option>
			<option value="cat">반려묘</option>
			<option value="etc">기타</option>
		</select>
	<input type="hidden" id="cate" value="${cate}">		
	<div class="board_pet table-responsive">

		<table class="table table-hover table-bordered">
			<thead>
				<tr>
					<th colspan="6">
						<c:choose>
							<c:when test="${type==1}">
							일상 게시판
							</c:when>
							<c:when test="${type==2}">
							분양/짝 찾기 게시판
							</c:when>
							<c:when test="${type==3}">
							분실/도움 게시판
							</c:when>
							<c:when test="${type==4}">
							공유/후기 게시판
							</c:when>
						</c:choose>
					</th>
				</tr>
				<tr>
					<th class="col-md-1 mobile">번호</th>
					<th class="col-md-1 mobile">분류</th>
					<th class="col-md-5">제목</th>
					<th class="col-md-2">글쓴이</th>
					<th class="col-md-2 mobile">날짜</th>
					<th class="col-md-1 mobile">조회수</th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<td colspan="6">
						<c:if test="${page<=1}">
						이전
						</c:if>
						<c:if test="${page>1}">
							<a href="#" onclick="ajax_paging('${page-1}','${type}');return false;">
							이전
							</a>
						</c:if>
						<c:forEach var="num" begin="${startpage}" end="${endpage}">
							<c:if test="${num==page}">
								${num}
							</c:if>
							<c:if test="${num!=page}">
								<a href="#" onclick="ajax_paging('${num}','${type}');return false;">${num}</a>
							</c:if>
						</c:forEach>
						<c:if test="${page>=maxpage}">
							다음
						</c:if>
						<c:if test="${page<maxpage}">
							<a href="#" onclick="ajax_paging('${page+1}','${type}');return false;">다음</a>
						</c:if>
					</td>
				</tr>
			</tfoot>
			<tbody>
				<c:set var="num" value="${listcount-(page-1)*limit}"/>
				<c:forEach var="list" items="${board_pet_list}">
					<tr>
						<td class="mobile">
							<c:out value="${num}"/>
							<c:set var="num" value="${num-1}"/>
						</td>
						<td onclick="sort_by_cate('${list.board_cate}')" class="mobile">
							<c:choose>
								<c:when test="${list.board_cate=='dog'}">
									dog
								</c:when>
								<c:when test="${list.board_cate=='cat'}">
									cat
								</c:when>
								<c:when test="${list.board_cate=='etc'}">
									etc
								</c:when>
							</c:choose>
						</td>
						<td>
							<c:if test="${list.board_state!=1}">
							
							<form action="./board_pet_content.zoo" method="post" id="content_${list.board_num}">
								<input type="hidden" name="board_num" value="${list.board_num}">
								<input type="hidden" name="page" value="${page }">
								<input type="hidden" name="type" value="${type}">
								<input type="hidden" name="cate" value="${cate}">
								<input type="hidden" name="search_field" value="${search_field}">
								<input type="hidden" name="search_name" value="${search_name}">
							</form>
								<a href="#" onclick="$('#content_${list.board_num}').submit()">
									${list.board_subject} 
								</a>
									<c:if test="${reply_count[list.board_num]!=0}">
										[<c:out value="${reply_count[list.board_num]}"/>]
									</c:if>
									
								<c:if test="${list.check_image==1}">
									<img src="./resources/image/icon/camera.png" style="width:15px;height:auto">
								</c:if> 
							</c:if>
							<c:if test="${list.board_state==1}">
								<span>관리자에 의해 블락 처리된 게시물 입니다.</span>
							</c:if>
						</td>
						<td >${list.join_id}</td>
						<td class="mobile">${list.board_date}</td>
						<td class="mobile">${list.board_readcount}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>	
		<!-- 검색어 입력 부분 -->
		<div class="board_pet_search">
			<div style="text-align:center">			
					<form method="post" id="search" style="display:inline-block">																					
						<select name="search_field" id="search_field">
							<option value="board_subject" selected>제목</option>
							<option value="board_content">내용</option>
							<option value="join_id">글쓴이</option>					
						</select>			
							<input type="hidden" name="type" value="${type}">
							<input type="text" name="search_name" id="search_name" class="search_name">							
							<input type="button" value="검색" class="btn btn-info" onclick="$('#search').submit()">																																																						
					</form>
						
					<c:if test='${!empty sessionScope.id}'>
					<form action="./board_pet_writeView.zoo" method="post"  style="display:inline-block">				
						<input type="hidden" name="page" value="${page}">
						<input type="hidden" name="type" value="${type }">					
						<input type="submit" value="글쓰기" class="btn btn-info">									
					</form>
					</c:if>
				
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