<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>MVC 게시판</title>

<link rel="stylesheet" href="./resources/bootstrap/css/bootstrap.css">
<script src = "http://code.jquery.com/jquery-latest.js"></script>
<script src="resources/js/hospitallist_line.js"></script>

<jsp:include page="/jsp/header.jsp"/>
<style>
th{
	text-align:center}
</style>
<script>
	$(function(){
		$("#viewcount").val('${limit}');
	})
</script>
</head>
<body>
       	<script>
       		function find_check(){
       			if($.trim("#find_name").val()==""){
       				alert("검색어를 입력하세요!");
       				$("#find_name").val("").focus();
       				return false;
       			}
       		}
       	</script>

      <!-- 검색부분 -->
       <div id="hospitalfind" style="padding-top: 10px;">

       	<form method="get" action="hospital_find_ok.nhn" onsubmit="return find_check()">
       		<table class="table table-hover table-bordered">
       			<tr id="find">
       			<td style="text-align:center">
       				<select name="find_field">
       					<option value="hospital_subject">제목</option>
       					<option value="hospital_sub_cont">제목+내용</option>
       					<option value="hospital_cont">내용</option>
       				</select>
       		
       			
       				<input name="find_name" id="find_name" size="18"
       					class="input_box">
       				<input type="submit" class="btn btn-info" value="검색" class="input_button">
       			</td>
       			</tr>
       		</table>
       		</form>
       		</div>

	<form>
    <!-- 게시판 리스트 -->
    <table class="table table-hover table-bordered" style="text-align:center">
    <!-- 레코드가 있으면 -->
    <tr>
       <th colspan = "2">진료기록부-진료기록부 검색결과</th>
       <th colspan = "2">
          <font size = 2>글 개수 : ${listcount}</font>
       </th>
    </tr>
        <c:if test="${listcount != 0 }">
    
    <tr>
       <th width = "10%"><div>번호</div></th>
       <th width = "50%"><div>제목</div></th>
       <th width = "30%"><div>등록일</div></th>
       <th width = "10%"><div>펫이름</div></th>
    </tr>
    
    <c:set var = "hospital_num" value = "${listcount-(page-1)*10}"/>
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
          <c:if test = "${page <= 1}">
             이전&nbsp;
          </c:if>
          <c:if test = "${page > 1}">
             <a href = "hospital_find_ok.nhn?page=${page-1}&find_name=${find_name}&find_field=${find_field}">이전</a>&nbsp;   
          </c:if>
          
          <c:forEach var = "a" begin = "${startpage}" end = "${endpage}">
             <c:if test = "${a == page}">
                ${a}
             </c:if>
             <c:if test = "${a != page}">
                <a href = "hospital_find_ok.nhn?page=${a}&find_name=${find_name}&find_field=${find_field}">${a}</a>
             </c:if>   
          </c:forEach>
          
          <c:if test = "${page >= maxpage}">
             &nbsp;다음
          </c:if>
          <c:if test = "${page < maxpage}">
             <a href = "./hospital_list.nhn?page=${page+1 }">&nbsp;다음</a>
          </c:if>
       </td> 
         <td colspan="4"><input type="button" class="btn btn-default pull-right" value="글쓰기" onclick="location='hospital_write.nhn?page=${page}'"></td>                         
    </tr>
    </c:if>
    
    <!-- 레코드가 없으면 -->
    <c:if test="${listcount == 0 }">
       <tr>
          <td colspan="4">정보게시판-정책검색결과</td>
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