<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="./resources/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="./resources/css/pete_list.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="./resources/js/pete_list.js"></script>
<script src="./resources/bootstrap/js/bootstrap.min.js"></script>
<body>
<jsp:include page="/jsp/header.jsp"/>
<div class="table-responsive">
	<div class="head_title">
		펫시터 집에 맡기기 글 목록
	</div>
	
	<div class="head_title2">
		"${listcount }"개의 글이 존재합니다!
	</div>
	
	<c:if test="${listcount > 0 }">	
	<table class="table table-hover">
	<c:set var="num" value="${listcount-(page-1)*limit }"/>
	<c:forEach var="p" items="${petelist }" varStatus="i">
		<tr>
			<td rowspan="5" style="width:500px;">
			<div class="thumbnail">		
			<a href="./pete_cont.nhn?pete_board_num=${p.pete_board_num}&page=${page}&state=cont" class="pete_subject">
				<img src="./resources/upload${p.pete_house_photo }" class="img-fluid">
			</a>
			</div>
			</td>
		</tr>
		
		<tr>
			<td colspan="2">
			[${p.pete_location }]
				<a href="./pete_cont.nhn?pete_board_num=${p.pete_board_num}&page=${page}&state=cont" class="pete_subject">
					${p.pete_subject}
				</a>
			</td>
		</tr>
		
		<tr>
			<td colspan="2">
			<a href="./pete_sitter.nhn?pete_id=${p.pete_id}
				&pete_location=${p.pete_location}&pete_subject=${p.pete_subject }		
				" class="list_subject">
			<img src="./resources/image/user.png">
			${p.pete_id }</a>
			</td>
		</tr>
		
		<tr>
			<td>
			<div class="score">
				<div class="score-total text-center bronze">
			평균							
			<div>${starList[i.index].avg}</div>
				</div>
			</div>
		</td>
		
			<td  style="text-align:right;padding-top: 50px;">
				<span >1박 / 30,000원</span>
			</td>		
		</tr>
		
		<%-- <c:forEach items="peteepil" var="pe"> --%>
		<tr>
			<td style="text-align: center;font-size: 1.5em;">
					펫시터 평점
			</td>
			<td style="text-align:right;padding-top: 30px;">
				<span>고객 후기${starList[i.index].cnt}개</span>
			</td>
		</tr>		
		<%-- </c:forEach> --%>
	</c:forEach>	
	
	<!-- 페이지 갯수 -->
	<tr class="">
		<td colspan="5" style="text-align:center; font-size:18px">
			<c:if test="${page <= 1 }">
				이전&nbsp;
			</c:if>
			<c:if test="${page > 1 }">
				<a href="./pete_list.nhn?page=${page-1 }">이전</a>&nbsp;
			</c:if>
				
			<c:forEach var="a" begin="${startpage }" end="${endpage }">
				<c:if test="${a == page }">
					${a }
				</c:if>
				<c:if test="${a != page }">
					<a href="./pete_list.nhn?page=${a }">${a}</a>
				</c:if>
			</c:forEach>
				
			<c:if test="${page >= maxpage }">
			&nbsp;다음
			</c:if>
			
			<c:if test="${page < maxpage }">
				<a href="./pete_list.nhn?page=${page+1 }">&nbsp;다음</a>
			</c:if>
	</tr>
	
	<tr>
		<td style="text-align:right" colspan="5">	
			<input type="button" value="글쓰기" onclick="location.href='pete_write.nhn'" class="btn btn-default">
		</td>
	</tr>	
	</table>	
	</c:if>
	
	<table class="table table-hover">
	<!-- 레코드가 없으면. -->
	<c:if test="${listcount == 0 }">
		<tr>
			<td style="text-align: right">
				<font size=2>등록된 글이 없습니다.</font>
				<c:if test="${join_type=='2'}">
					<input type="button" value="글쓰기" onclick="location.href='pete_write.nhn'" class="write_btn">
			</c:if>				
			</td>
		</tr>		
	</c:if>
	</table>
	
	<!-- 검색 부분 -->
	<div class="petefind">	
	<form method="get" action="pete_find_ok.nhn"
			onsubmit="return find_check()">
	<div>
				<select name="find_field" class="find_field">
					<option value="location_search">지역검색</option>
					<option value="id_search">ID검색</option>
					<option value="content_search">내용검색</option>
				</select>				
				<input type="text" name="find_name" id="find_name2" placeholder="내용을 입력해주세요.">	
				<input type="submit" value="검색" class="btn btn-default">
	</div>
	</form>
	</div>
	</div>
</body>

<jsp:include page="/jsp/footer.jsp"/>