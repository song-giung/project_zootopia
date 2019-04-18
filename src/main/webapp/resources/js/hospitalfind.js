$(document).ready(function() {
		function find_check(){
   			if($.trim("#find_name").val()==""){
   				alert("검색어를 입력하세요!");
   				$("#find_name").val("").focus();
   				return false;
   			}
   		}
});
