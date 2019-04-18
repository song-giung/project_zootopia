<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


	
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
						<td colspan="7">
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