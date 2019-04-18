<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>펫닥터 QnA</title>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
 	<link href="./resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
 	<script src="./resources/js/jquery-3.3.1.js"></script>

<style>
.showSubject {
	width: 100%;
	height: 60px;
	text-align: center;
	margin-top: 10px;
	background-color: #eee;
	color: #444;
	cursor: pointer;
	border: none;
	outline: none;
	font-size: 15px;
/* 	transition: 0.4s; */
	border-radius : 5px;
}
.active, .showSubject:hover{
	background-color: #ccc; 
}
 .showContent p, .ajaxShowAnswer p {
	margin:0px;
}

.showContent, .showAnswer{	
	padding: 0;
    display: none;
    overflow: hidden;
    width: 100%;
}
.showContent{
 	border-radius: 0px 0px 5px 5px;
	/*border-right: solid black 1px;
    border-bottom: solid black 1px;
    border-left: solid black 1px; */
    background-color: #eee;
    padding-left : 2%;
}
.showAnswer{
	border-radius : 5px;
}
.closeA{
	display : none;
	border-radius : 5px;
}
 .Aopen, .closeAA, .qDelete, .aDelete, summary{
	cursor: pointer;
}
.ajaxShowAnswer{
	margin-top : 5px;
	border: solid black 1px;
	border-radius : 5px;
	margin-left: 5%;
}
#QnABody{
	width:50%;
	margin:auto;
}
#QuestionForm{
	width: 100%
}
#Qtable, textarea, input[type=text], details table{
	width:100%
}

#AddQuestion{
	width : 100%;
	height : 118px;
	background : #26A69A;
	color : white;
	font-size : 1em;

}
.qDelete , .closeAA , .Aopen, .aDelete, .aID{
	float: left;
 	width : 10%;
 	text-align : center;
 }
 #categoryTD{
 	text-align : left;
 }
 #Qtable tr th{
 	text-align : center;
 }
 .Qid{
	width:100px;
}
.ajaxContent{
	padding-left : 2%;
}
.re{
	float:left;
	margin-left:3%
}
.aAdd{
	width:90%;
	height : 118px;
	background : #26A69A;
	color : white;
	font-size : 1em;
}

@media(max-width:412px){
	#QnABody { 
	 width: 100%; 
 	}
	.qDelete , .closeAA , .Aopen, .aDelete{
 	width : 30%;
	}
	 .aID{
 	padding-left : 10px;
 	width:20%
 	}
 	.re{	
	margin-left : 1px;
	}
}
	pre{
		background-color:#f9f5f500;
		border : none;
		font-size : 15px;
		font-weight: bold;
	}

</style>
</head>
<body>
<jsp:include page="../header.jsp"/>
<div id="QnABody">
<div id="QuestionForm">
<form id="QnAform">
	<table id="Qtable" border="1">
		<tr>
			<th>분류</th>
			<td id="categoryTD" colspan="2">
				<select id="category">
					<option value="외과">외과</option>
					<option value="내과">내과</option>
					<option value="피부과">피부과</option>
					<option value="안과">안과</option>
					<option value="치과">치과</option>
					<option value="행동">행동</option>
					<option value="영양">영양</option>
					<option value="기타" selected>기타</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>제목</th>
			<td colspan="2"><input type="text" id="q_subject" name="q_subject"></td>
		</tr>
		<tr>
			<th>질문 내용</th>
			<td><textarea name="q_content" id="q_content" rows="4" style="resize: none;"></textarea></td>
			<td><input type="button" class="btn btn-info" value="등록" id="AddQuestion"></td>
		</tr>
	</table>
</form>
</div>
<c:forEach var="q" items="${Qlist }">
<div class="QnA">
	<div class="showSubject" >
		<table class="Questioner">	
			<tr>
				<td class="Qid">${q.q_id }</td>
				<td class="Qsub" rowspan="2" >${q.q_subject }</td>
			</tr>
			<tr>
				<td class="Qcat">${q.q_category }</td>
			</tr>
		</table>
	</div>
	<div class="showContent">
		<div class="qContent">
			<div>${q.q_content }</div>
			<div>${q.q_date }</div>
			<c:if test="${sessionScope.join_type=='3' }">
			<div class="writeAnswer">
				<details>
					<summary>답변달기</summary>
					<form  class="AddAnswer">
						<table>
							<tr>
								<input type="hidden" name="q_no" value="${q.q_no}">
								<td><textarea class="aTextarea" name="a_content" rows="4" style="resize: none;"></textarea></td>
								<td><input type="button" class="btn btn-info aAdd" value="등록" ></td>
							</tr>
						</table>
					</form>
				</details>
			</div>
			</c:if>
			<c:if test="${sessionScope.id == q.q_id }">
			<div class="qDelete" name="${q.q_no}">삭제</div>
			</c:if>		
			<div class="closeA" ><div class="closeAA">답변닫기</div></div>
			<div class="aContent" name="${q.q_no }"><div class="Aopen">답변보기</div></div>			
		</div>
	</div>
	<div class="showAnswer" name="${q.q_no }">		
	</div>
</div>	
</c:forEach>
</div>

<script>
	//질문등록하고 가져오기
	$('#AddQuestion').click(function(){
		<%
		if(session.getAttribute("id") == null){%>
			alert("로그인 후 이용해 주세요");
			return false;
		<%}%>
		var subject = document.getElementsByName('q_subject')[0].value;
		var category = $('#category').val();
		var content = document.getElementsByName('q_content')[0].value;
		if($.trim($("#q_subject").val())==""){			
			alert("질문 제목을 입력하세요");
			$("#q_subject").focus();
			return false;
		}
		if($.trim($("#q_content").val())==""){
			alert("질문 내용을 입력하세요");
			$("#q_content").focus();			
			return false;
		}

		$.ajax({
			type : "POST",
			data : {
				"q_subject" : subject,
				"q_content" : content,
				"q_category" : category
			},
			url : "./AddQuestion",
			cache : false,
			headers : {
				"cache-control" : "no-cache",
				"pragma" : "no-cache"
			},
			success : function(data){
				alert("질문이 등록되었습니다.");
				location.reload();
			},
			error : function(request, status, error) {
			alert("에러");
			console.log("code : " + request.status
						+ "\n" + "message : "
						+ request.responseText + "\n"
						+ "error : " + error)
			}
		});//ajax end
	});//click end

	//답변보기 ajax
	$('.Aopen').click(function(e) {
		e.preventDefault();
		var divA = $(this).parent();
		var q_no = "q_no=" + divA.attr("name");		
		divA.css('display','none');
		divA.parent().parent().parent().children('.showAnswer').empty();
		var output = '';
		console.log(q_no);
		$.getJSON('./showAnswer', q_no, function(data) {
			$(data).each(function(index) {
				output += '<span class="re">▶</span><div class="ajaxShowAnswer">';
				output += '<div class="ajaxContent"><pre>' + this.a_content + '</pre></div>';
				output += '<div class="Answer">';
				output += '<div class="aID">' + this.a_id + '</div>';
				if(this.a_id == "${sessionScope.id}"){
				output += '<div class="aDelete" name="' +this.a_no + '">삭제</div>';
				}
				output += '<div>' + this.a_date + '</div>';
				output += '</div></div>';
			})//function end
			divA.parent().parent().parent().children('.showAnswer').append(output);
			divA.parent().children('.closeA').css('display','block');
		});//JSON end
	});
	//답변닫기
	$('.closeA').click(function(e){
		e.preventDefault();
		$(this).css('display','none');
		$(this).parent().parent().parent().children('.showAnswer').empty();
		$(this).parent().children('.aContent').css('display','block');
	})
	//답변 등록 ajax
	$('.aAdd').click(function() {
		var button = $(this).parent().parent().children().children(".aTextarea");
		if(button.val()==""){
			alert("답변 내용을 입력하세요");
			$(".aTextarea").focus();			
			return false;
		}
		/* 		if($.trim($(".aTextarea").val())==""){
			alert("답변 내용을 입력하세요");
			$(".aTextarea").focus();			
			return false;
		} */
		var Adata = $(this).parent().parent().parent().parent().parent().serialize();
		var output = '';
		var divA = $(this).parent().parent().parent().parent().parent();
		$.getJSON('./AddAnswer', Adata, function(data) {
			$(data).each(function(index) {
				output += '<span class="re">▶</span><div class="ajaxShowAnswer">';
				output += '<div class="ajaxContent"><pre>' + this.a_content + '</pre></div>';
				output += '<div class="Answer">';
				output += '<div class="aID">' + this.a_id + '</div><div class="aDelete" name="' +this.a_no + '">삭제</div>';
				output += '<div>' + this.a_date + '</div>';
				output += '</div></div>';
			})//function end
			$(".aTextarea").val("");
			divA.parent().parent().parent().parent().parent().children('.showAnswer').append(output);
		})//JSON end
	});//click end
	
	//답변 삭제
	$('.showAnswer').on('click','.aDelete',function(e){
		var a_no = $(this).attr('name');
		var q_no = $(this).parent().parent().parent().attr('name');
		var nodata = "a_no=" + a_no + "&q_no=" + q_no;
		var divA = $(this).parent().parent().parent();
		var output = '';
		var con = confirm("삭제하시겠습니까?");
		if(con==true){
		$(this).parent().parent().parent().empty();
		$.getJSON('./deleteAnswer', nodata, function(data) {
			$(data).each(function(index) {
				output += '<span class="re">▶</span><div class="ajaxShowAnswer">';
				output += '<div class="ajaxContent"><pre>' + this.a_content + '</pre></div>';
				output += '<div class="Answer">';
				output += '<div class="aID">' + this.a_id + '</div><div class="aDelete" name="' +this.a_no + '">삭제</div>';
				output += '<div>' + this.a_date + '</div>';
				output += '</div></div>';
			})//function end
			divA.append(output);
			divA.parent().children('.closeA').css('display','block');
		});//JSON end
		}//if end
	})
	
	//질문 삭제
	$('.qDelete').click(function(){
		var q_no = $(this).attr('name');
		var con = confirm("삭제하시겠습니까?");
		if(con==true){
			var nodata = "q_no=" + q_no;	
			location.href='deleteQuestion?'+ nodata;
		}	
	})
	
	
	//아코디언 
	var acc = document.getElementsByClassName("showSubject");
	var i;
	for(i=0; i<acc.length; i++){
		acc[i].addEventListener("click",function(){
			this.classList.toggle("active");
			var showContent = this.nextElementSibling;
			var showAnswer = showContent.nextElementSibling;
			if(showContent.style.display ==="block"){
				showContent.style.display = "none";
				showAnswer.style.display ="none";
				this.style.borderRadius = "5px";
				this.style.border = "none"
			}else{
				showContent.style.display = "block";
				showAnswer.style.display ="block";
				this.style.borderRadius = "5px 5px 0px 0px ";
			}
		});
	}
	
</script>
<jsp:include page="../footer.jsp"/>
<script src="./resources/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>