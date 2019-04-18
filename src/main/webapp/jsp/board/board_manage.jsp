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
 function check_confirm(){
	 if(confirm("경고 푸시겠습니까?")){
		 return true;
	 }else{
		 return false;
	 }	 	 
 }
 
 function check_delete(){
	 if(confirm("삭제하시겠습니까?")){
		 return true;
	 }else{
		 return false;
	 }	 	
 }
</script>
</head>
<body>
<jsp:include page="/jsp/header.jsp"/>
	
	<div class="board_pet table-responsive">
		<input type="hidden" id="cate" value="${cate}">
		<table class="table table-hover table-bordered">
			<thead>
			<tr>
					<th colspan="7">
						게시판 관리 페이지
					</th>
				</tr>
				<tr>
					<th class="col-md-1 mobile">번호</th>
					<th class="col-md-1 mobile">분류</th>
					<th class="col-md-5">제목</th>
					<th class="col-md-1">글쓴이</th>
					<th class="col-md-2 mobile">날짜</th>
					<th class="col-md-1 mobile">조회수</th>
					<th class="col-md-1 mobile">처리</th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<td colspan="7">
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
				<c:forEach var="list" items="${managelist}">
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
							
							
							<form action="./board_pet_content.zoo" method="post" id="content_${list.board_num}">
								<input type="hidden" name="board_num" value="${list.board_num}">
								<input type="hidden" name="page" value="${page }">
								<input type="hidden" name="manage" value="manage">
							</form>
								<a href="#" onclick="$('#content_${list.board_num}').submit()">
									${list.board_subject} 
								</a>
									<c:if test="${reply_count[list.board_num]!=0}">
										[신고 개수 : <c:out value="${warn_count[list.board_num]}"/>]
									</c:if>
									
								<c:if test="${list.check_image==1}">
									<img src="./resources/image/icon/camera.png" style="width:15px;height:auto">
								</c:if> 
						
						
						</td>
						<td>${list.join_id}</td>
						<td class="mobile">${list.board_date}</td>
						<td class="mobile">${list.board_readcount}</td>
						<td>
						<form action="./board_delete.zoo" method="post">
							<input type="hidden" name="board_num" value="${list.board_num}">
							<input type="hidden" name="page" value="${page}">
							<input type="hidden" name="manage" value="manage">
							<input type="submit" class="btn btn-info" value="삭제하기" onclick="check_delete()">
						</form>
						
						<form action="./report_rollback.zoo" method="post">
							<input type="hidden" name="board_num" value="${list.board_num}">
							<input type="submit" class="btn btn-info" value="경고풀기" onclick="check_confirm()">	
						</form>
						
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>	
	
			<jsp:include page="/jsp/footer.jsp"/>
	<script src="./resources/bootstrap/js/bootstrap.js"></script>
</body>
</html>