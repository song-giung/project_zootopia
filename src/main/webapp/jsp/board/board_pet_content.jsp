<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>일상 게시판 내용 보기</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="./resources/bootstrap/css/bootstrap.css">

<script>

		$(function(){
			
	
	
			
			
			$("#like_num").text("[좋아요 ${like_num}개]");
			
			
			
			$(document).on('submit','#write_reply',function(){
				
				$.ajax({
					url:"./reply_delete_write.zoo",
					type:"post",
					data:$("#write_reply").serialize(),
					success:function(data){
						console.log("ajax성공")
						console.log(data);
						$('#board_pet_reply_table').empty().prepend(data)
					}
				})
				return false;
		
		})//리플달기 ajax 끝
		
		
		$(".favorite").click(function(){
				$.ajax({
					url:'./check_favorite_like.zoo',
					type:'post',
					data:{'favorite':$("#favorite").val(),
							'board_num':'${board_num}'},
					success:function(data){
						console.log(data)
						if(data==1){
							alert("즐겨찾기 추가 했습니다.");
							$(".favorite").attr("src","./resources/image/icon/star_on.png");
							$("#favorite").val("none");
							
						}else if(data==0){
							alert("즐겨 찾기 해제 했습니다.")
							$(".favorite").attr("src","./resources/image/icon/star_off.png");
							$("#favorite").val("favorite");
							
						}
					}
					
					
				})	
			
		})//ajax end
		
		$(".like").click(function(){
			$.ajax({
				url:'./check_favorite_like.zoo',
				type:'post',
				data:{'like':$("#like").val(),
						'board_num':'${board_num}'},
				success:function(data){
					console.log(data)
					if(data==1){
						alert("좋아요 했습니다.");
						$(".like").attr("src","./resources/image/icon/heart_on.png");
						$("#like").val("none");
						$("#like_num").text("[좋아요 ${like_num+1}개]");
					}else if(data==0){
						alert("좋아요 를 취소 했습니다.")
						$(".like").attr("src","./resources/image/icon/heart_off.png");
						$("#like").val("like");
						$("#like_num").text("[좋아요 ${like_num}개]");
					}
				}
				
				
			})	
		
	})//ajax end
		
			
		})
		
		
	//신고했는지 여부 확인
	function check_report(num,text){
			var report_type='';
			console.log(num);
			console.log(text)
			if(text=='board'){
				report_type="board"
			}else if(text=='reply'){
				report_type="reply"
			}
			console.log("report_type : "+report_type);
			console.log("num : "+num);
			$.ajax({
				url:'./check_report.zoo',
				type:'post',
				data:{'report_type':report_type,
					'num':num
					},
				success:function(data){
					console.log("ajax report_type : "+report_type);
					console.log("ajax num : "+num);
					console.log("신고여부 확인 성공~");
					if(data==1){
						console.log("이미 로그인한 ID가 신고한 상태");
						alert("이미 신고 하셨습니다.");
					}else{
						console.log("로그인한 ID로 신고하지 않았음");
						$("input[name='report_type']").val(report_type);
						$("input[name='num']").val(num);
						reportview();
					} 
				}
			})
		}

	//삭제 확인 후 삭제하기
	function check_delete(){
		var answer = confirm("정말 삭제하시 겠습니까?");
			if(answer){
				location.href="<c:url value='/board_delete.zoo?board_num=${boardBean.board_num}&page=${page}&type=${type}'/>";						
			}
	}
	
	//리플 수정하기
	function modify_reply(b_reply_num){
		$('#reply_area_'+b_reply_num).attr('readonly',false);
		$('#modify_reply_button_'+b_reply_num).hide(); 
		$('#delete_reply_button_'+b_reply_num).hide();
		$('#confirm_reply_button_'+b_reply_num).show();
	}
	//리플 수정한거 반영하기
	function confirm_reply(b_reply_num){
		$.ajax({
			url:"./reply_modify.zoo",
			type:'post',
			data:{"b_reply_content":$('#reply_area_'+b_reply_num).val(),
				"b_reply_num":b_reply_num},
			success:function(data){
				
				$('#ajax_reply_'+b_reply_num).empty().prepend(data);
			}
		})
	}
	
	//리플 삭제하기
	function delete_reply_button(b_reply_num){
		if(confirm("정말 삭제하시 겠습니까?")){
			$.ajax({
				url:"./reply_delete_write.zoo",
				type:'post',
				data:{"b_reply_num":b_reply_num,
					"board_num":'${board_num}',
					"reply_page":'${reply_page}',
					"ajax":"delete"},
				success:function(data){
					$('#board_pet_reply_table').empty().prepend(data)
				}
				
				}) 					
		}
	}
	//리플 페이징 ajax 처리

	function renew_list(reply_page){
		
		$.ajax({
			url:'./board_pet_content.zoo',
			type:'post',
			data:{'board_num':'${board_num}',
				'page':'${page}',
				'reply_page':reply_page,
				'ajax':'ajax',
				'type':'${type}'},
			success:function(data){
				$('#board_pet_reply_table').empty().prepend(data);
			}			
		})
		
	}
	
	function reportview(){
		$('#move_to_report_view').trigger('submit');
		
	}
/* 
	$.ajax({
		url:'./report_view.zoo',
		type:'post',
		data:{"report_type":report_type,
				"num":num,
				"board_num":'${boardBean.board_num}',
				"page":'${page}',
				"type":"${type}"},
		success:function(data){
			console.log(data)
		}
	})						
	 */
	
</script>
<style>
.carousel-inner > .item > img {
    margin: 0 auto;
    max-width:100%
}

/* 	.item{	width:500px} */
</style>
</head>
<body>
<form method="post" action="./report_view.zoo" id="move_to_report_view">
	<input type="hidden" class="num" name="num">
	<input type="hidden" name="board_num" value="${boardBean.board_num}">
	<input type="hidden" name="page" value="${page }">
	<input type="hidden" name="type" value="${type}">
	<input type="hidden" name="report_type">
	<input type="hidden" name="num">
	
</form>
<jsp:include page="/jsp/header.jsp"/>
	<div class="board_pet_cont_wrap table-responsive">
		<table id="board_pet_cont_table" class="table table-bordered">
			<tr>
				<td class="col-md-1">글쓴이</td>
				<td class="col-md-11">${boardBean.join_id}</td>
			</tr>
			<tr>
				<td>제목</td>
				<td>${boardBean.board_subject}</td>
			</tr>
			<tr>
				<td colspan="2">내용</td>
			</tr>
			<tr>
				<td colspan="2">
				<c:if test="${!empty imageBean}">															
					<!-- 이미지 들어가는 부분 start-->
						<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
						 
						  <ol class="carousel-indicators">
						  	<c:forEach var="pic" items="${imageBean}" varStatus="a">		
						  	<c:choose>
						  		<c:when test="${a.index==0 }">
						  			<li data-target="#carouselExampleIndicators" data-slide-to="${a.index }" class="active"></li>	
						  		</c:when>
						  		<c:otherwise>
						  			<li data-target="#carouselExampleIndicators" data-slide-to="${a.index }"></li>	
						  		</c:otherwise>					  		
						  	</c:choose>						  								  							    	
							</c:forEach>
						  </ol> 
						 
						  <div class="carousel-inner">
						  <c:forEach var="pic" items="${imageBean}" varStatus="a">	
						  
						  <c:choose>
						  	<c:when test="${a.index==0 }">
						  		<div class="item active">
						   	 	  <img class="d-block w-100" src="./resources/upload${pic.board_DBfile}">
								 </div>		
						  	</c:when>
						  	<c:otherwise>
						  		<div class="item">
						     		 <img class="d-block w-100" src="./resources/upload${pic.board_DBfile}">
						   		 </div>		
						  	</c:otherwise>
						  </c:choose>		
  
						</c:forEach>
						  </div>
						  
					   	 <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
						    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
						    <span class="sr-only">Previous</span>
						  </a>
						  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
						    <span class="carousel-control-next-icon" aria-hidden="true"></span>
						    <span class="sr-only">Next</span>
						  </a>
						</div>	
						<!-- 이미지 들어가는 부분  end-->												
				</c:if>
				
						<br><br><br>
					<pre>${boardBean.board_content}</pre>
					
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div>
					
					<c:if test="${!empty sessionScope.id}">
						<c:if test="${favorite=='favorite'}">
							<img class="favorite" src="./resources/image/icon/star_on.png" style="width:30px;height:auto;">
							<input type="hidden" id="favorite" value="none">
						</c:if>
						<c:if test="${favorite=='none'}">
							<img class="favorite" src="./resources/image/icon/star_off.png" style="width:30px;height:auto;">
							<input type="hidden" id="favorite" value="favorite">
						</c:if>
						<c:if test="${like=='like'}">
							<img class="like"  src="./resources/image/icon/heart_on.png" style="width:30px;height:auto;">
							<input type="hidden" id="like" value="none">
							<span id="like_num"></span>
						</c:if>
						<c:if test="${like=='none'}">
							<img class="like"  src="./resources/image/icon/heart_off.png" style="width:30px;height:auto;">
							<input type="hidden" id="like" value="like">
							<span id="like_num"></span>
						</c:if>
						
						<img id="board_${boardBean.board_num}" onclick="check_report(${boardBean.board_num},'board')" src="./resources/image/icon/siren_on.png" style="width:30px;height:auto">
						
					</c:if>
						
						
						
							
						
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div class="row">
						
						<c:if test="${boardBean.join_id==sessionScope.id||sessionScope.id=='admin'}">
							<div class="col">
							<form method="post" action="./modify_board_view" id="board_modify_action">
								<input type="hidden" name="board_num" value="${boardBean.board_num}">
								<input type="hidden" name="page" value="${page}">
								<input type="hidden" name="type" value="${type}">
								
							</form>
							
						
							<input type="button" value='수정하기' onclick="$('#board_modify_action').submit()"class="btn btn-info"> 
							<input type="button" onclick="check_delete()" value="삭제하기" class="btn btn-info">							
							
							
							</div>	
																								
						</c:if>
						
						<div class="col">
						작성일 : ${boardBean.board_date}
						 
						</div>			
					</div>
						
						
				<%-- 	<c:if test="${!empty boardBean.board_modify_date }">
					수정일 : ${boardBean.board_modify_date}
					</c:if>					 --%>
				
				</td>
			</tr>
	
			
			</table>
			
			<table id="board_pet_reply_table" class="table table-bordered" style="width:100%">
			
			<tr>
					<td colspan="2">
						<h4>댓글 보기</h4>
					</td>
			</tr>	
			<c:if test="${!empty sessionScope.id}">
				<tr>
					<td colspan="2">					
						<form id="write_reply" method="post">
							<input type="hidden" name="board_num" value='${board_num}'>
							<input type="hidden" name="page" value="${page}">
							<input type="hidden" name="reply_page" value="${reply_page}">
							<input type="hidden" name="ajax" value="write">
							
							<div class="form-group-row">
								<label for="write_reply_content" class="col-sm-2 col-form-label">댓글달기</label>
								
								<div class="col-sm-8">
									<input type="text" name="b_reply_content" id="write_reply_content" class="form-control">		
								</div>
								<div class="col-sm-2">
									<input type="submit" value="작성" class="btn btn-info" style="margin-top:10px;width:100px;">
								</div>
								
							</div>
						</form>
					</td>				
				</tr>
			</c:if>
			
			<c:if test='${!empty boardreplyBean}'>
				<c:forEach var="list" items="${boardreplyBean}">				
					<tr>			
						<td colspan="2">
						<div id="ajax_reply_${list.b_reply_num}">
							<div class="row">
								<div class="col-sm-1" style="margin-top:10px">
								${list.join_id}:
								</div>
						
							<c:if test="${list.b_reply_state!=1}">
							
									<div class="col-sm-9">										
										<textarea  style="resize:none;" rows="3" name="b_reply_content" readonly id="reply_area_${list.b_reply_num }" class="form-control">${list.b_reply_content}</textarea>
																				
									</div>
												
							</c:if>
								<div class="col-sm-2" style="margin-top:10px">
										${list.b_reply_date} 
										
									</div>				
							
							
							
							
							<c:if test="${list.b_reply_state==1}">
								관리자에 의해 블락 처리된 리플 입니다.
							</c:if> 
							
							<div>
							<c:if test="${!empty sessionScope.id}">
								<img id="reply_${list.b_reply_num}" onclick="check_report('${list.b_reply_num}','reply')" src="./resources/image/icon/siren_on.png" style="width:20px;height:auto;">
							</c:if>
							<c:if test="${sessionScope.id==list.join_id&&list.b_reply_state!=1||sessionScope.id=='admin'}" >													
										
									<img src="./resources/image/icon/modify.png" onclick="modify_reply('${list.b_reply_num}')" id="modify_reply_button_${list.b_reply_num}" style="width:25px;height:auto">
									<%-- <input type="button" id="modify_reply_button_${list.b_reply_num}" onclick="modify_reply('${list.b_reply_num}')" value="수정하기" class="btn btn-info form-control"> --%>
								
								
									<img src="./resources/image/icon/confirm.png" onclick="confirm_reply('${list.b_reply_num}')" id="confirm_reply_button_${list.b_reply_num}" style="width:25px;height:auto;display:none">
									<%-- <input type="button" id="confirm_reply_button_${list.b_reply_num}" onclick="confirm_reply('${list.b_reply_num}')" value="확인" style='display:none' class="btn btn-info form-control"> --%>
								
								
									<img src="./resources/image/icon/delete.png" onclick="delete_reply_button('${list.b_reply_num}')" id="delete_reply_button_${list.b_reply_num }" style="width:25px;height:auto">
									<%-- <input type="button" id="delete_reply_button_${list.b_reply_num }" onclick="delete_reply_button('${list.b_reply_num}')" value="삭제" class="btn btn-info form-control"> --%>																
							</c:if>
							</div>
							</div>
						</div>	
						</td>					
					</tr>							
				</c:forEach>
				
				
				<tr>
					<td colspan="2">
						<c:if test="${reply_page<=1}">
						이전
						</c:if>
						<c:if test="${reply_page>1}">
							<a href="#" onclick="renew_list(${reply_page-1});return false">
							이전
							</a>
						</c:if>
						<c:forEach var="num" begin="${reply_startpage}" end="${reply_endpage}">
							<c:if test="${num==reply_page}">
								${num}
							</c:if>
							<c:if test="${num!=reply_page}">
								<a href="#" onclick="renew_list(${num});return false">${num}</a>
							</c:if>
						</c:forEach>
						<c:if test="${reply_page>=reply_maxpage}">
							다음
						</c:if>
						<c:if test="${reply_page<reply_maxpage}">
							<a href="#" onclick="renew_list(${reply_page+1});return false">다음</a>
						</c:if>
					</td>
				</tr>
			</c:if>
		</table>
		
		<c:choose>
			<c:when test="${manage=='manage' }">
				<form action="./admin_board.zoo" method="post" style="text-align:center">
					<input type="hidden" name="page" value="${page}"> <input
						type="submit" value="목록으로" class="btn btn-info">
				</form>
			</c:when>
			<c:when test="${empty fav}">
				<form action="./board_pet.zoo" method="post" style="text-align:center">
					<input type="hidden" name="page" value="${page}"> <input
						type="hidden" name="type" value="${type}"> <input
						type="hidden" name="cate" value="${cate}"> <input
						type="hidden" name="search_field" value="${search_field}">
					<input type="hidden" name="search_name" value="${search_name }">
					<input type="hidden" name="doNotAjax" value="doNotAjax"> <input
						type="submit" value="목록으로" class="btn btn-info">
				</form>
			</c:when>
			<c:when test="${!empty fav}">
				<form action="./my_board.zoo" method="post" style="text-align:center">
					<input type="hidden" name="fav_page" value="${page}"> <input
						type="hidden" name="fav_type" value="${type}"> <input
						type="hidden" name="fav_cate" value="${cate }"> <input
						type="hidden" name="fav_search_field" value="${search_field}">
					<input type="hidden" name="fav_search_name" value="${search_name}">
					<input type="hidden" name="doNotAjax" value="doNotAjax"> <input
						type="submit" value="목록으로" class="btn btn-info">
				</form>
			</c:when>
		</c:choose>		
		

	


		
	</div>
	
<jsp:include page="/jsp/footer.jsp"/>
<script src="./resources/bootstrap/js/bootstrap.js"></script>
</body>
</html>