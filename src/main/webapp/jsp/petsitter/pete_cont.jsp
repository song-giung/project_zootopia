<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="./resources/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="resources/css/pete_cont.css" rel="stylesheet">

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="./resources/js/pete_cont.js"></script>
<script src="./resources/bootstrap/js/bootstrap.min.js"></script>

<!-- jQuery UI CSS파일  -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<!--  jQuery UI 라이브러리 js파일 -->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

<script>
function delete2() {
		if(confirm("삭제하시겠습니까?")) {
			$(this).parent().click();
        } else {
            return false;
        }		
			var pete_pass = prompt("비밀번호를 입력하세요.","");
			var num = ${petebean.pete_board_num };
			var page = ${page};
			$.ajax({
				type:"POST",
				data:{"pete_board_num":num, "page":page, "pete_pass": pete_pass},
				url:"./pete_del_ok.nhn",
				success:function(result) {
					 if(result == 1){
						alert('비밀번호가 틀렸습니다.');
					}else{
						alert('삭제되었습니다.');
						location.href='./pete_list.nhn?page='+page;
					} 
				},
				error:function(request, status, error){
					 alert("code : " + request.status + "\n" +
							 	"message : " + request.responseText + "\n" +
							 	"error : " + error)
					alert(request.responseText);
		             alert("에러");				
				}
			})
	}


$(document).ready(function(){
	var list = new Array();
	<c:forEach var="pp" items="${peReser }">
	//시작날짜
	var startday = '${pp.pete_date}'
	console.log(startday)
	//끝나는날짜
	var endday = '${pp.pete_date2}'	
		//예약 시작일을 "-"로 분리합니다.
		var arr1 = startday.split("-");
		//Date형으로 생성합니다.
		var startdate=new Date(arr1[0], arr1[1], arr1[2]);
		
		arr1 = endday.split("-");
		//Date형으로 생성합니다.
		var enddate=new Date(arr1[0], arr1[1], arr1[2]);

	   //숙박일
		var bak=(enddate-startdate)/(24*60*60*1000);  
		
	   //배열에 추가합니다.
		list.push(startday);
	   
	   //시작일 부터 차례대로 숙박일 만큼 배열에 추가합니다.
		for(var i=1;i<bak;i++){		
			adddate = new Date(startdate.setDate(startdate.getDate()+1));	
			dd=adddate.getDate();
			mm=adddate.getMonth();
			if(dd < 10){
				dd = '0'+dd
			}

			if(mm < 10){
				mm = '0'+mm
			}
			//날짜를 yyyy-MM-dd 형식으로 만듭니다.
			adddate = adddate.getFullYear() + "-" + mm + "-" + dd
			//배열에 추가합니다.
			list.push(adddate)
		}			
	</c:forEach>
	console.log(list)
	
	function available(date) {
		
		var thismonth = date.getMonth()+1;
		var thisday = date.getDate();
		if(thismonth<10){
			thismonth = "0"+thismonth;
		}
		if(thisday<10){
			thisday = "0"+thisday;
		}
	    ymd = date.getFullYear() + "-" + thismonth + "-" + thisday;
	     if ($.inArray(ymd, list) >= 0) {
	        return [true, "Highlighted", list];
	    } else {
	        return [true, "Highlight",''];
	    }
	}
	
	$("#datepicker").datepicker({
		 dateFormat: 'yy-mm-dd',
		    prevText: '이전 달',
		    nextText: '다음 달',
		    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		    dayNamesMin: ['일','월','화','수','목','금','토'],
		    showMonthAfterYear: true,
		    changeMonth: true,
		    changeYear: true,
		    yearSuffix: '년',
		    maxDate: '+2m',   // 오늘부터 2개월 까지만
		    minDate: '0d',     // 이전날짜 선택 불가능  
		    beforeShowDay: available,
		onSelect: function(selected) {
			$("#datepicker2").datepicker("option","minDate", selected)
			var dp = $('#datepicker').val();
			$('#datepicker11').val(dp);
	}
});
	var list2 = new Array();
	<c:forEach var="pp" items="${peReser }">
	//시작날짜
	var startday = '${pp.pete_date}'
	console.log(startday)
	//끝나는날짜
	var endday = '${pp.pete_date2}'	
		//예약 시작일을 "-"로 분리합니다.
		var arr1 = startday.split("-");
		//Date형으로 생성합니다.
		var startdate=new Date(arr1[0], arr1[1], arr1[2]);
		
		arr1 = endday.split("-");
		//Date형으로 생성합니다.
		var enddate=new Date(arr1[0], arr1[1], arr1[2]);

	   //숙박일
		var bak=(enddate-startdate)/(24*60*60*1000);  
		
	   //배열에 추가합니다.
		list2.push(startday);
	   
	   //시작일 부터 차례대로 숙박일 만큼 배열에 추가합니다.
		for(var i=1;i<bak;i++){		
			adddate = new Date(startdate.setDate(startdate.getDate()+1));	
			dd=adddate.getDate();
			mm=adddate.getMonth();
			if(dd < 10){
				dd = '0'+dd
			}
			if(mm < 10){
				mm = '0'+mm
			}
			//날짜를 yyyy-MM-dd 형식으로 만듭니다.
			adddate = adddate.getFullYear() + "-" + mm + "-" + dd
			//배열에 추가합니다.
			list2.push(adddate)
		}			
	</c:forEach>
	console.log(list2)
	
	function available2(date) {
		
		var thismonth = date.getMonth()+1;
		var thisday = date.getDate();
		if(thismonth<10){
			thismonth = "0"+thismonth;
		}
		if(thisday<10){
			thisday = "0"+thisday;
		}
	    ymd = date.getFullYear() + "-" + thismonth + "-" + thisday;
	     if ($.inArray(ymd, list2) >= 0) {
	        return [true, "Highlighted", list2];
	    } else {
	        return [true, "Highlight",''];
	    }
	}
	 $("#datepicker2").datepicker({		
		 dateFormat: 'yy-mm-dd',
		    prevText: '이전 달',
		    nextText: '다음 달',
		    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		    dayNamesMin: ['일','월','화','수','목','금','토'],
		    showMonthAfterYear: true,
		    changeMonth: true,
		    changeYear: true,
		    yearSuffix: '년',
		    maxDate: '+2m',   // 오늘부터 2개월 까지만
		    minDate: '0d',     // 이전날짜 선택 불가능  
		    beforeShowDay: available2,
		onSelect: function(selected) {
			$("#datepicker").datepicker("option","maxDate", selected)
			var dp2 = $('#datepicker2').val();
			$('#datepicker22').val(dp2);
			
			//첫번째 데이트피커가 비어있지 않을때 
			if ($('#datepicker11').val() != ''){
				var date = $("#datepicker").datepicker('getDate');
			    var date2 = $("#datepicker2").datepicker('getDate');
			    var days = (date2 - date) / (24*60*60*1000)
			    $('#datecal').val(days);
			    
				var cal = $("#datecal").val();
				var zz = cal * 30000;
				$('#datemoney').val(zz);
			}
		}
	});
});

//예약하기 유효성검사
function check2() {
	
	//중복 아이디 유효성 검사
	var id = $("#join_id_cont").val();
	if($.trim($('#join_id_cont').val()) == "") {
		alert("로그인후 예약 가능합니다.");
		return false;
	}
	
	console.log('id : ' + id );
	$.ajax({
		type:"POST",
		data:{"id" : id},
		url:"./checkReser.nhn",
		success:function(data) {
			 if(data == 0){
			}else{
				alert('이미 예약된 아이디 입니다.');
				history.back();
				return false;
			} 
		},
		error:function(request, status, error){
			 alert("code : " + request.status + "\n" +
					 	"message : " + request.responseText + "\n" +
					 	"error : " + error)
			alert(request.responseText);
             alert("에러");				
		}
	})
	
	//시작날짜
	if($.trim($('#datepicker11').val())==""){
	    alert("시작날짜를 입력해 주세요"); 
	    $("#datepicker11").val("").focus();
	    	return false;
	 }
	//종료날짜
	if($.trim($('#datepicker22').val())==""){
	    alert("종료날짜를 입력해 주세요");
	    $("#datepicker22").val("").focus();
	    	return false;
	 }
	
	//동물종류
	if($.trim($('#pete_kind').val())==""){
	    alert("동물종류를 입력해 주세요");
	    $("#pete_kind").val("").focus();
	    	return false;
	 }
	
	//동물 마릿수 유효성 검사
	if($("#pete_kind_many").val()=='') {
		alert('동물 마릿수를 선택해 주세요');
		return false;
	} else {
		return true;
	}
	
}

</script>

<style>
.ui-datepicker-week-end{
}
</style>
<jsp:include page="/jsp/header.jsp"/>
<div class="row">

<div class="col-xs-6 col-md-4">
	<ul>
		<li>
			<img src="./resources/upload${petebean.pete_house_photo }" width="100%" height="42%">
		</li>
	</ul>	
	
	<ul>
	<li>
		<div>
		
		<a href="./pete_sitter.nhn?pete_id=${petebean.pete_id}
		&pete_location=${petebean.pete_location}&pete_subject=${petebean.pete_subject }		
		"><img src="./resources/image/user2.png" class="user">
		${petebean.pete_id } </a>
		| ${petebean.pete_location }
		
		</div>
	</li>
	</ul>
	<hr style="border:solid 1.5px #d6d5d5">
	<dl class="dl-horizontal">
		<dt>돌봄 공간</dt>
		<dd>${petebean.pete_space }</dd>
		<dt>다른 동물 유무</dt>
		<dd>${petebean.pete_animals_kind }</dd>
		
		<dt>펫 산책 유무</dt>
		<dd>${petebean.pete_walk }</dd>
		<dt>가족 동거 유무</dt>
		<dd>${petebean.pete_family }</dd>
	<dt><a href="./pet_epil.nhn?pete_id=${petebean.pete_id }"
		style="font-size:1.5em">
		키우는 동물 보기
		</a></dt>
	</dl>
</div>	

<form action="./pete_reser_ok.nhn" method="POST" onsubmit="return check2()">
<input type="hidden" value="${petebean.pete_board_num }" name="pete_board_num">
<input type="hidden" value="${petebean.pete_id}" name="pete_id">
<div class="col-xs-12 col-sm-6 col-md-8 reser">
		<ul class="login">
			<li>
				로그인 한 아이디 : <input type="text" name="join_id" id="join_id_cont" value="${sessionScope.id}" style="border:none" readonly> 
			</li>	
		</ul>
		<ul>
			<li>
			<div>
			시작 :
			<input type="text" id="datepicker11" name="pete_date" style="border:none; width:17%" readonly placeholder="0000-00-00">
			<input type="image" id="datepicker"
						src=./resources/image/calendar.png
						width=30px height=30px onclick="return false;">
						&nbsp;>&nbsp;
				종료 :
				<input type="text" id="datepicker22" name="pete_date2" style="border:none; width:17%" readonly placeholder="0000-00-00">
				<input type="image" id="datepicker2"
						src=./resources/image/calendar.png
						width=30px height=30px onclick="return false;">
				<div class="calendar-legend text-center">
					<span class="circle unavailables"></span>예약불가&nbsp;
					<span class="circle availables"></span>예약가능&nbsp;
					<span class="circle stay"></span>1박 예약
				</div>
						
				</div>
			</li>
		</ul>
		
		<ul>
			<li>
				1박 30,000원&nbsp;/&nbsp;반려견 추가 당 25,000원
			</li>	
		</ul>
		<ul>
			<li>
				<input type="text" id="datecal" style="border:none; width:5%;" readonly>박 : 
				<input type="text" id="datemoney" style="border:none; width:13%" readonly>원
			</li>	
		</ul>
		<ul>
			<li>
				동물종류 : <input type="text" value="" name="pete_kind" id="pete_kind" placeholder="ex)강아지,고양이,…">
			</li>	
		</ul>
		
		<ul>
			<li>
				동물마릿수 : <select name="pete_kind_many" id="pete_kind_many">
				    <option value="">동물마릿수</option>
				    <option value="1">1마리</option>
				    <option value="2">2마리</option>
				    <option value="3">3마리</option>
				    <option value="4">4마리</option>
				    <option value="5">5마리</option>
				</select>
			</li>
		</ul>
		
		<ul>
			<li>
				동물 추가 가격 : <input type="text" name="pete_kind_price" id="pete_kind_price" style="border:none; width:13%" readonly>원
			</li>
		</ul>
		
		<ul>
			<li>
				총 가격 : <input type="text" name="pete_price" id="pete_price" style="border:none; width:13%" readonly>원
			</li>
		</ul>
		
		<ul>
			<li>
				<input type="submit" value="예약하기" class="btn btn-default btn-lg btn-block">	
				<!-- <input type="button" value="뒤로가기" onclick="history.go(-1)"> -->			 
			</li>	
		</ul>
</div>
</form>

</div>

<div class="row">
	<div class="col-xs-6 col-sm-4">
	<ul>
		<li>제목 : ${petebean.pete_subject }</li>
	</ul> 
	
	<ul>
		<li>내용 : ${petebean.pete_content }</li>
	</ul>
	<hr style="border:solid 1.5px #d6d5d5">
	<ul>
		<li class="center">
		<div id="ajaxDel" class="ajaxDel">
			<a href="./pete_cont.nhn?pete_board_num=${petebean.pete_board_num }&page=${page}&state=edit&pete_id=${petebean.pete_id}" class="btn btn-default">수정</a>&nbsp;&nbsp;
			
			<a id="peteDel" href="#" onclick="return delete2();" class="btn btn-default">삭제</a>&nbsp;&nbsp;
			<a href="./pete_list.nhn?page=${page }" class="btn btn-default">목록</a>&nbsp;&nbsp;
		</div>
		</li>
	</ul> 
	
	</div>
	
	<div class="col-xs-12 col-sm-6 col-md-8 checkTime">
	<div>
		<img src="./resources/image/watch.png" align="left">
		<p>체크인, 체크아웃 시간<br>
		<img src="./resources/image/check.png">&nbsp;체크인 : ${petebean.pete_time_in } ~ ${petebean.pete_time_in2 } <br>
		<img src="./resources/image/check.png">&nbsp;체크아웃 : ${petebean.pete_time_out } ~ ${petebean.pete_time_out2 }
		</p>		
	</div>
	</div>

	</div>
	
<jsp:include page="/jsp/footer.jsp"/>