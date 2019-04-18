<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="./resources/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="resources/css/pete_sitter.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="./resources/bootstrap/js/bootstrap.min.js"></script>
<script>
//펫 후기 작성 ajax
$(function() {
	$(document).on('click','#petepilw',function(){
		var pete_id = '${pete_id}';
		$.ajax({
			type:"POST",
			data : {"pete_id":pete_id,"ajax":"ajax"},
			url : "./pet_epil_write.nhn",
			success : function(data) {
				$('.pet_write').empty().html(data);
			},
			error:function() {
				alert('에러');
			}		
		})
	})
})
	
	

</script>
<style>
.pet_write{margin-bottom:15%}
</style>
<jsp:include page="/jsp/header.jsp"/>
<div class="pet_write">
<h2>키우는 동물 목록</h2>
<ul class="list-group">
<c:forEach var="p" items="${petepil }">

<c:if test="${!empty p.pet_id}">
<li class="list-group-item active">
	펫정보 : ${p.pet_info }
</li>
<li class="list-group-item">
	대소변은 잘 가리는 편입니까? : ${p.pet_feces }
</li>
<li class="list-group-item">
	예방접종을 하였습니까? : ${p.pet_vaccin }
</li>
<li class="list-group-item">
	다른 개와 친화적 입니까? : ${p.pet_friendly}
</li>
<li class="list-group-item">
	앓고 있는 질병이나 이전에 다쳤던 적이 있습니까? : ${p.pet_disease }
</li>
<li class="list-group-item">
	잘 짖습니까? : ${p.pet_bark }
</li>

</c:if>
</c:forEach>

<c:set var="id" value="${pete_id }"/>
<c:set var="pid" value="${sessionScope.id}"/>
<c:if test="${id eq pid}">
<tr>
	<td>
	<a href="#" id="petepilw" class="btn btn-default btn-lg btn-block"  onclick="return false;">글쓰기</a>
	<input type="button" value="뒤로가기" onclick="history.go(-1)" class="btn btn-default btn-lg btn-block">
	</td>
</tr>
</c:if>

<c:if test="${id ne pid}">
	<td>
		<input type="button" value="뒤로가기" onclick="history.go(-1)" class="btn btn-default btn-lg btn-block">
	</td>
</c:if>
</ul>

</div>
<jsp:include page="/jsp/footer.jsp"/>