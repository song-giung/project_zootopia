$(document).ready(function(){
	$("#addMarker").submit(function(){
		if($.trim($("#Name").val()) == ""){
			alert("장소명을 입력하세요");
			$("#placeName").focus();
			return false;
		}
		if($(":radio[name='mark_type']:checked").length==0){
			alert("장소구분을 선택해주세요");
			return false;
		}
		if($.trim($("#sample5_address").val()) == ""){
			alert("주소를 입력하세요");
			$("#placeAddress").focus();
			return false;
		}
		if($.trim($("#Tel").val()) == ""){
			alert("전화번호을 입력하세요");
			$("#placeTel").focus();
			return false;
		}
		if($.trim($("#Comment").val()) == ""){
			alert("장소 설명을 입력하세요");
			$("#placeComment").focus();
			return false;
		}
	})
	$("#editMarker").submit(function(){
		if($.trim($("#Name").val()) == ""){
			alert("장소명을 입력하세요");
			$("#placeName").focus();
			return false;
		}
		if($(":radio[name='mark_type']:checked").length==0){
			alert("장소구분을 선택해주세요");
			return false;
		}
		if($.trim($("#sample5_address").val()) == ""){
			alert("주소를 입력하세요");
			$("#placeAddress").focus();
			return false;
		}
		if($.trim($("#Tel").val()) == ""){
			alert("전화번호을 입력하세요");
			$("#placeTel").focus();
			return false;
		}
		if($.trim($("#Comment").val()) == ""){
			alert("장소 설명을 입력하세요");
			$("#placeComment").focus();
			return false;
		}
	})
});