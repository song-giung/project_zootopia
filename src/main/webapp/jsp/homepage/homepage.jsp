<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
	pageContext.setAttribute("br","<br/>");
	pageContext.setAttribute("cn"," \n");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script src="./resources/js/jquery-3.3.1.js"></script>
<title>홈페이지</title>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
 	<link href="./resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<style>
	.getScore{
		width:122px;
		height:25px;
	}
	#pageBody{
		width : 50%;
		margin : auto;
	}
	table{
		width:100%;
	}
	.starDelete, input[type=button], input[type=submit]{
		float : right;
	}
	th {
		text-align : center;
	}
	.starDiv{
		float : left;
		padding-top : 1em;
	}

	.starDateDiv{
		width : 100%;
		clear : both;		
	}
	.starCommentDiv{
		width : 75%;
		text-align : left;
		padding-left : 1em;
		float : left;
	}
	.underbar{
		border-bottom : 0.5px dotted grey;
	}
	
	.starID{
		font-size:30px
	}
	#starScoreDiv{
		width:25%;
		float : left;
		height : 62px;
	}
	#starCommentDiv{
		float:left;
		width:65%;
	}
	#starInsertDiv{
		float : left;
		width: 10%;
	}
	#starComment{
		clear : both;
	}
	#addscore{
		width: 100%;
		height : 62px;
	}
	.starDelete, #edit, #delete, #addscore{
		transition-duration: 0.4s;
		text-decoration: none;
		border-radius : 3px;
		background-color : #26A69A;
		border: 2px solid #26A69A;
		color : white;
	}	
	#delete{
		margin-right : 10px;
	}
	@media(max-width:412px){
		.getScore{
			width:61px;
			height:12.5px;
		}
		#pageBody{
			width:100%;
		}
		.starID{
			font-size:15px;
		}
		.starCommentDiv{
			width:100%;
		}
		#starScoreDiv, #starCommentDiv, #starInsertDiv{
			clear:both;
		}
		#starCommentDiv{
			width:100%;
			heigth : 100px;
		}
		#starInsertDiv, #addscore{
			width : 100%;
			height :  35px;
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

	<jsp:include page="../header.jsp" />
	<input type="hidden" name="mark_type" value="${marker.mark_type }">
	<input type="hidden" name="mark_name" value="${marker.mark_name }">
<div id = "pageBody">	
	<div>${marker.mark_name} 
		<form action="./markerEdit">
			<input type="hidden" name="mark_no" value="${marker.mark_no }">
			<c:if test="${sessionScope.id == 'admin' }">
			<input type="submit" id="edit" value="수정">
			<input type="button" id="delete" value="삭제">
			</c:if>
		</form>
	</div>
	<div>평점 : 

	<c:choose>
		<c:when test="${avg>=0 && avg <1 }">
			<input class="getScore" type="image" src="./resources/image/0score.png">
		</c:when>
		<c:when test="${avg>=1 && avg <2 }">
			<input class="getScore" type="image" src="./resources/image/1score.png">
		</c:when>
		<c:when test="${avg>=2 && avg <3 }">
			<input class="getScore" type="image" src="./resources/image/2score.png">
		</c:when>
		<c:when test="${avg>=3 && avg <4 }">
			<input class="getScore" type="image" src="./resources/image/3score.png">
		</c:when>
		<c:when test="${avg>=4 && avg <5 }">
			<input class="getScore" type="image" src="./resources/image/4score.png">
		</c:when>
		<c:when test="${avg>=5 && avg <6 }">
			<input class="getScore" type="image" src="./resources/image/5score.png">
		</c:when>
		<c:when test="${avg>=6 && avg <7 }">
			<input class="getScore" type="image" src="./resources/image/6score.png">
		</c:when>
		<c:when test="${avg>=7 && avg <8 }">
			<input class="getScore" type="image" src="./resources/image/7score.png">
		</c:when>
		<c:when test="${avg>=8 && avg <9 }">
			<input class="getScore" type="image" src="./resources/image/8score.png">
		</c:when>
		<c:when test="${avg>=9 && avg <10 }">
			<input class="getScore" type="image" src="./resources/image/9score.png">
		</c:when>
		<c:when test="${avg == 10}">
			<input class="getScore" type="image" src="./resources/image/10score.png">
		</c:when>
	</c:choose>
	 ${avg }점</div>

	<div>${marker.mark_address }</div>
	<div><pre>${marker.mark_comment }</pre></div>
	<form id="yellowstars" class="form-group">
		<div>
			<div id="starScoreDiv"><jsp:include page="./star.jsp" />
				<input type="hidden" id="star_score" name="star_score"></div>
			<div id="starCommentDiv"><textarea id="place_comment" name="place_comment" rows="2" style="resize: none; width:100%;"></textarea></div>
			<div id="starInsertDiv"><input type="button" value="등록" id="addscore"></div>		
		</div>
	</form>
	<form>
		<div id="starComment">
				<c:if test="${eval != null}">
					<c:forEach var="e" items="${eval }">
						<div class="underbar">
							<div class="starDiv">
							<c:choose>
								<c:when test="${e.star_score ==1}">
									<input class="getScore" type="image" src="./resources/image/1score.png">
								</c:when>
								<c:when test="${e.star_score == 2}">
									<input class="getScore" type="image" src="./resources/image/2score.png">
								</c:when>
								<c:when test="${e.star_score == 3}">
									<input class="getScore" type="image" src="./resources/image/3score.png">
								</c:when>
								<c:when test="${e.star_score == 4}">
									<input class="getScore" type="image" src="./resources/image/4score.png">
								</c:when>
								<c:when test="${e.star_score == 5}">
									<input class="getScore" type="image" src="./resources/image/5score.png">
								</c:when>
								<c:when test="${e.star_score == 6}">
									<input class="getScore" type="image" src="./resources/image/6score.png">
								</c:when>
								<c:when test="${e.star_score == 7}">
									<input class="getScore" type="image" src="./resources/image/7score.png">
								</c:when>
								<c:when test="${e.star_score == 8}">
									<input class="getScore" type="image" src="./resources/image/8score.png">
								</c:when>
								<c:when test="${e.star_score == 9}">
									<input class="getScore" type="image" src="./resources/image/9score.png">
								</c:when>
								<c:when test="${e.star_score == 10}">
									<input class="getScore" type="image" src="./resources/image/10score.png">
								</c:when>
															
							</c:choose>
							<span class='starID'>${e.star_score }</span></div>
							
							<div class="starCommentDiv"><pre>${e.place_comment }</pre></div>
							<div class="starDateDiv">${e.evaluation_date } <span>${e.id }</span>
							<c:if test="${sessionScope.id == e.id }">
								<Button class="starDelete" value="${e.evaluation_no }">삭제</Button>
							</c:if>
							</div>
						</div>
					</c:forEach>
				</c:if>				
		</div>
	</form>
</div>
	<script>
		//평점 및 댓글 등록 ajax
		$("#addscore").click(function(){
			<%
			if(session.getAttribute("id") == null){%>
				alert("로그인 후 이용해 주세요");
				return false;
				<%}%>
			if($.trim($("#star_score").val()) == ""){
				alert("평점을 입력하세요");
				return false;
			}
			if($.trim($("#place_comment").val()) == ""){
				alert("평가 내용을 입력하세요");
				return false;
			}
			var no = document.getElementsByName("mark_no")[0].value;
			console.log(no);
			var type = document.getElementsByName("mark_type")[0].value;
			console.log(type);
			var name = document.getElementsByName("mark_name")[0].value;
			console.log(name);
			var score = document.getElementsByName("star_score")[0].value;
			console.log(score);
			var comment = document.getElementsByName("place_comment")[0].value;
			console.log(comment);
			var img = '';
			$.ajax({
			    type : "POST",
				data : {
					"mark_no" : no,
					"mark_type" : type,
					"mark_name" : name,
					"star_score" : score,
					"place_comment" : comment
				},
				url : "./starScore",
				cache : false,
				headers : {
					"cache-control" : "no-cache",
					"pragma" : "no-cache"
				},
				success : function(data) {
					$("textarea").val('');
					if($(data).attr('star_score') == 1){
						img = "<input class='getScore' type='image' src='./resources/image/1score.png'>"
					}else if($(data).attr('star_score')==2){
						img = "<input class='getScore' type='image' src='./resources/image/2score.png'>"
					}else if($(data).attr('star_score')==3){
						img = "<input class='getScore' type='image' src='./resources/image/3score.png'>"
					}else if($(data).attr('star_score')==4){
						img = "<input class='getScore' type='image' src='./resources/image/4score.png'>"
					}else if($(data).attr('star_score')==5){
						img = "<input class='getScore' type='image' src='./resources/image/5score.png'>"
					}else if($(data).attr('star_score')==6){
						img = "<input class='getScore' type='image' src='./resources/image/6score.png'>"
					}else if($(data).attr('star_score')==7){
						img = "<input class='getScore' type='image' src='./resources/image/7score.png'>"
					}else if($(data).attr('star_score')==8){
						img = "<input class='getScore' type='image' src='./resources/image/8score.png'>"
					}else if($(data).attr('star_score')==9){
						img = "<input class='getScore' type='image' src='./resources/image/9score.png'>"
					}else if($(data).attr('star_score')==10){
						img = "<input class='getScore' type='image' src='./resources/image/10score.png'>"
					} 
					var output ='';
					output +="<div class='underbar'>";
					output += "<div class='starDiv'>"+ img + "<span class='starID'>" + $(data).attr('star_score') + "</span></div>";					
					output += "<div class='starCommentDiv'><pre>"+$(data).attr('place_comment') + "</pre></div>";
					output += "<div class='starDateDiv'>"+$(data).attr('evaluation_date');
					output += " <span>"+$(data).attr('id')+"</span>";
					output += " <Button class='starDelete' value='" +$(data).attr('evaluation_no') + "'>삭제</Button></div></div>";
					$("#starComment").prepend(output);
				 console.log(output);
				},
				error : function(request, status, error) {
					alert("에러");
					console.log("code : " + request.status + "\n"
							+ "message : " + request.responseText + "\n"
							+ "error : " + error)
				}
			})//ajax end		
		})//click end;
		//마커 페이지 삭제
		$("#delete").click(function(event){
			var no = document.getElementsByName("mark_no")[0].value;
			event.preventDefault();
			var con = confirm("삭제하시겠습니까?");
			if(con==true){
				var nodata = "mark_no=" + no;	
				location.href='deleteMarker?'+ nodata;
			}			
		})//click end
		
		//별점 삭제
		$("#starComment").on('click','.starDelete',function(e){
			e.preventDefault();
			var mark_no = document.getElementsByName("mark_no")[0].value;
			var no = "evaluation_no=" + $(this).val() + "&mark_no=" + mark_no;		
			var con = confirm("삭제하시겠습니까?");
			var output='';
			var img='';
			if(con==true){
				$.getJSON('./starDelete', no, function(data){
					$("#starComment").empty();
					$(data).each(function(index){
						
						if(this.star_score == 1){
							img = "<input class='getScore' type='image' src='./resources/image/1score.png'>"
						}else if(this.star_score==2){
							img = "<input class='getScore' type='image' src='./resources/image/2score.png'>"
						}else if(this.star_score==3){
							img = "<input class='getScore' type='image' src='./resources/image/3score.png'>"
						}else if(this.star_score==4){
							img = "<input class='getScore' type='image' src='./resources/image/4score.png'>"
						}else if(this.star_score==5){
							img = "<input class='getScore' type='image' src='./resources/image/5score.png'>"
						}else if(this.star_score==6){
							img = "<input class='getScore' type='image' src='./resources/image/6score.png'>"
						}else if(this.star_score==7){
							img = "<input class='getScore' type='image' src='./resources/image/7score.png'>"
						}else if(this.star_score==8){
							img = "<input class='getScore' type='image' src='./resources/image/8score.png'>"
						}else if(this.star_score==9){
							img = "<input class='getScore' type='image' src='./resources/image/9score.png'>"
						}else if(this.star_score==10){
							img = "<input class='getScore' type='image' src='./resources/image/10score.png'>"
						}
						output += "<div class='underbar'>";
						output += "<div class='starDiv'>"+ img + "<span class='starID'>" + this.star_score + "</span></div>";					
						output += "<div class='starCommentDiv'><pre>"+ this.place_comment + "</pre></div>";
						output += "<div class='starDateDiv'>"+this.evaluation_date;
						output += " <span>"+this.id+"</span>";
						output += " <Button class='starDelete' value='" + this.evaluation_no+ "'>삭제</Button></div></div>";						
					})//functoin end
					$("#starComment").prepend(output);
				})//JSON end
			}//if end			
		})//click end
	</script>
<jsp:include page="../footer.jsp"/>
<script src="./resources/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>