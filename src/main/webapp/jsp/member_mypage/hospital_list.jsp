<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>진료기록부</title>
<script src = "http://code.jquery.com/jquery-latest.js"></script>
<script src="resources/js/hospitallist_line.js"></script>
<link rel="stylesheet" href="./resources/bootstrap/css/bootstrap.css">
<script>
	$(function(){
		$("#viewcount").val('${limit}');
	})
</script>
<jsp:include page="/jsp/header.jsp"/>
<style>
th{
	text-align:center}
</style>
</head>
<body>
	<h2>진료기록부 게시판</h2>
<%-- 	<form>
		<input type="button" value="진료기록부" onclick="location='hospital_list.nhn?page=${page}'">
		<input type="button" value="회원정보수정" onclick="location='memeber_list.nhn?page=${page}'">

		<br>
		<hr>
		
	</form>  --%>
	
       	<script>
       		function find_check(){
       			if($.trim("#find_name").val()==""){
       				alert("검색어를 입력하세요!");
       				$("#find_name").val("").focus();
       				return false;
       			}
       		}
       	</script>
       	
       	<div style="padding-top: 10px;">
       	<form method="get" action="hospital_find_ok.nhn" onsubmit="return find_check()">
       		<table class="table table-hover table-bordered" >
       			<tr id="find">
       			<td style="text-align:center">
       				<select name="find_field" >
       					<option value="hospital_subject">제목</option>
       					<option value="hospital_sub_cont">제목+내용</option>
       					<option value="hospital_content">내용</option>
       				</select>
       			
       				<input name="find_name" id="find_name" size="18"
       					class="input_box">
       				<input type="submit"  class="btn btn-info" value="검색" class="input_button">
       			</td>
       			</tr>
       		</table>
       		</form>
<!--        			<select id="viewcount">
				  	<option value="5" selected>5줄 보기</option>
			  		<option value="10">10줄 보기</option>
				    <option value="20">20줄 보기</option>
	  		 	</select> -->
	  		 	
	  		 </div>
       
       		
    <!-- 게시판 리스트 -->
    <form>
    <table class="table table-hover table-bordered" style="text-align:center">
    <!-- 레코드가 있으면 -->
    <tr>
       <th colspan = "2">진료기록부 - list</th>
       <th colspan = "2">
          <font size = 2>글 개수 : ${listcount}</font>
       </th>
    </tr>
    <c:if test="${listcount != 0 }">
    
    <tr>
       <th width = "10%"><div>번호</div></th>
       <th width = "50%"><div>제목</div></th>
       <th width = "30%"><div>등록일</div></th>
       <th width = "20%"><div>펫 이름</div></th>
    </tr>
    
    <c:set var = "hospital_num" value = "${listcount-(page-1)*limit}"/>
    <c:forEach var = "p" items = "${hospitallist}">
    <tr>
       <td>
          <c:out value = "${hospital_num}"/><%--num 출력 --%>
          <c:set var = "hospital_num" value = "${hospital_num-1}"/><%-- num = num-1 --%>
       </td>
       <td>
          <div style="text-align:left">
                
             
             <!-- 제목 출력 부분 -->
             <a href = "hospital_cont.nhn?hospital_num=${p.hospital_board_num}&page=${page}&state=cont">
                      ${p.hospital_subject}
             </a>
          </div>
       </td>
       <td>
          <div>${p.hospital_board_date}</div>
       </td>
       <td>
          <div>${p.pet_name}</div>
       </td>
    </tr>
    </c:forEach>
    
    <tr style="text-align:center">
       <td colspan = 5>
       <a href = "./hospital_list.nhn?page=1">&lt;</a>
          <c:if test = "${page <= 1}">
             이전&nbsp;
          </c:if>
          <c:if test = "${page > 1}">
             <a href = "./hospital_list.nhn?page=${page-1}">이전</a>&nbsp;   
          </c:if>
          
          <c:forEach var = "a" begin = "${startpage}" end = "${endpage}">
             <c:if test = "${a == page}">
                ${a}
             </c:if>
             <c:if test = "${a != page}">
                <a href = "./hospital_list.nhn?page=${a}">${a}</a>
             </c:if>   
          </c:forEach>
          
          <c:if test = "${page >= maxpage}">
             &nbsp;다음
          </c:if>
          <c:if test = "${page < maxpage}">
             <a href = "./hospital_list.nhn?page=${page+1 }">&nbsp;다음</a>
          </c:if>
          <a href = "./hospital_list.nhn?page=${endpage}">&gt;</a>
         
       </td>
       <tr>     
         <td colspan="4"><input type="button" class="btn btn-default pull-right" value="글쓰기" onclick="location='hospital_write.nhn?page=${page}'"></td>        
    </tr>
    </c:if>
  		
  		
    
    <!-- 레코드가 없으면 -->
    <c:if test="${listcount == 0 }">
       <tr>
          <td colspan="4">정보게시판- 진료기록부</td>
          <td style = "text-align:right">
             <font size = 2>등록된 글이 없습니다.</font>
          </td>   
       </tr>
    </c:if>

    </table>
    </form>
<jsp:include page="/jsp/footer.jsp"/>    
<script src="./resources/bootstrap/js/bootstrap.min.js"></script>           
</body>
</html>