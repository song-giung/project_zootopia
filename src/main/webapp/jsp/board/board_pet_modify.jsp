<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="./resources/js/jquery.form.js"></script>
<script src="./resources/js/jquery.MultiFile.js"></script>
<script>


	$(function(){
		$("#uploadfile").MultiFile({
			max:10,
			accept:'jpg|png|gif|jpeg',
			STRING:{
				duplicate:"중복된 선택된 파일이 있습니다.($file)",
				denied:"이미지 파일만 업로드 가능 합니다.",
				selected:"$file을 선택했습니다.",
				toomany:"이미지는 10개 까지 업로드 가능 합니다."
			}
		}) 
		
			$("select option").each(function(){
				if($(this).val()=='${boardBean.board_cate}'){
					$(this).attr('selected','selected');
				}
			})
		
	})

	function delete_image(image_num){
		console.log(image_num)
		if(confirm("삭제하시겠습니까?")){
			$("#image_"+image_num).empty();
			$.ajax({
				url:'./delete_image_sep.zoo',
				type:'post',
				data:{'image_num':image_num},
				success:function(){
					consloe.log("삭제 완료");
				}
			})
			return false;
		}
	}
</script>
<link rel="stylesheet" href="./resources/bootstrap/css/bootstrap.css">
</head>
<body>
	<jsp:include page="/jsp/header.jsp"/>
	<div id="board_pet_wrap">
		<form method="post" action="./board_pet_modify_ok.zoo" enctype="multipart/form-data">
			<table id="board_pet_write_table" class="table table-bordered table-hover">
				<tr>
					<th colspan="2">
						<c:choose>
							<c:when test="${type==1}">
							일상 게시판 수정하기
							</c:when>
							<c:when test="${type==2}">
							분양/짝 찾기 게시판  수정하기
							</c:when>
							<c:when test="${type==3}">
							분실/도움 게시판  수정하기
							</c:when>
							<c:when test="${type==4}">
							공유/후기 게시판  수정하기
							</c:when>
						</c:choose>
					</th>
				</tr>
				<tr>
					<td colspan="2">
					<select name="board_cate">
						<option value="">카테고리 선택</option>
						<option value="dog">강아지</option>
						<option value="cat">고양이</option>
						<option value="etc">etc</option>
					</select>
					</td>
				</tr>
				<tr>
					<td class="col-md-2">글쓴이 :</td>
					<td class="col-md-10">${sessionScope.id}</td>
				</tr>
				<tr>
					<td>제목</td>
					<td>
						<input type="text" name="board_subject" id="board_pet_subject" class="board_input_box form-control" value="${boardBean.board_subject }">
					</td>
				</tr>
				<tr>
					<td>내용</td>
					<td>
					<textarea style="resize:none;width:100%"  rows="10" name="board_content" id="board_pet_content" class="board_input_box">${boardBean.board_content }
					</textarea>
						
					</td>
				</tr>
				<tr>
					<td>파일 첨부</td>
					<td>
						<input type="file" id="uploadfile" name="uploadfile" class="with-preview">
						
						<span></span>
					</td>
				</tr>
				<tr>
					<td>기존 파일 목록 </td>
					<td>
					<c:forEach var="item" items="${imageBean}">
						<span id="image_${item.image_num}">
							<img src="./resources/image/icon/delete.png" onclick="delete_image(${item.image_num})" style="width:25px;height:auto">
								${item.board_original}<img src="./resources/upload${item.board_DBfile}" style="width:50px;height:auto">	
						</span><Br>					
					</c:forEach>
					</td>
				</tr>
			</table>
			<div id="board_pet_write" style="text-align:center">
				<input type="hidden" name="board_num" value='${board_num}'>
				<input type="hidden" name="page" value="${page}">
				<input type="hidden" name="type" value="${type }">
				<input type="submit" value="수정" class="input_button btn btn-info">
				<input type="reset" value="취소" class="input_button btn btn-info" 
						onclick="location.href='./board_pet_content.zoo?board_num=${board_num}&page=${page}&reply_page=1&type=${type }'">
			</div>
		</form>
	
	</div>
	<jsp:include page="/jsp/footer.jsp"/>
	<script src="./resources/bootstrap/js/bootstrap.js"></script>
</body>
</html>