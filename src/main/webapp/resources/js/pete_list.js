//검색 기능
	function find_check() {
		if($.trim($("#find_name2").val())=="") {
			alert("검색어를 입력하세요!");
			$("#find_name2").val("").focus();
			return false;
		}			
	}	