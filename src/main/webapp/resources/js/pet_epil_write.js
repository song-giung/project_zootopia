function check_only(chk){
    var obj = document.getElementsByName("pet_feces");        
    for(var i=0; i<obj.length; i++){
        if(obj[i] != chk){
            obj[i].checked = false;
        }
    }
}
function check_only2(chk){
    var obj = document.getElementsByName("pet_vaccin");        
    for(var i=0; i<obj.length; i++){
        if(obj[i] != chk){
            obj[i].checked = false;
        }
    }
}
function check_only3(chk){
    var obj = document.getElementsByName("pet_friendly");        
    for(var i=0; i<obj.length; i++){
        if(obj[i] != chk){
            obj[i].checked = false;
        }
    }
}
function check_only4(chk){
    var obj = document.getElementsByName("pet_disease");        
    for(var i=0; i<obj.length; i++){
        if(obj[i] != chk){
            obj[i].checked = false;
        }
    }
}
function check_only5(chk){
    var obj = document.getElementsByName("pet_bark");        
    for(var i=0; i<obj.length; i++){
        if(obj[i] != chk){
            obj[i].checked = false;
        }
    }
}

//유효성검사
function check() {
	var fecesCheck = false;
	var vaccinCheck = false;
	var friendlyCheck = false;
	var diseaseCheck = false;
	var barkCheck = false;
	
	//펫정보 유효성 검사
	 if($.trim($("#pet_info").val())==""){
	    alert("펫정보를 입력해 주세요"); 
	    $("#pet_info").val("").focus();
	    	return false;
	 }
	
	//펫 대소변 유무
    for(var i=0;i<$('[name="pet_feces"]').length;i++){
      if($('input:checkbox[name="pet_feces"]').eq(i).is(":checked") == true) {
    	  fecesCheck = true;
        break;
          }
        }
        if(!fecesCheck){
          alert("펫이 대소변을 가리는지 선택해 주세요.");
          return false;
        } 
        
    //펫 예방접종 유무
    for(var i=0;i<$('[name="pet_vaccin"]').length;i++){
      if($('input:checkbox[name="pet_vaccin"]').eq(i).is(":checked") == true) {
    	  vaccinCheck = true;
        break;
          }
        }
        if(!vaccinCheck){
          alert("펫이 예방접종을 맞았는지 선택해 주세요.");
          return false;
        } 
  //펫 예방접종 유무
    for(var i=0;i<$('[name="pet_friendly"]').length;i++){
      if($('input:checkbox[name="pet_friendly"]').eq(i).is(":checked") == true) {
    	  friendlyCheck = true;
        break;
          }
        }
        if(!friendlyCheck){
          alert("펫이 친화적인지 선택해 주세요.");
          return false;
        } 
  //펫 질병 유무
    for(var i=0;i<$('[name="pet_disease"]').length;i++){
      if($('input:checkbox[name="pet_disease"]').eq(i).is(":checked") == true) {
    	  diseaseCheck = true;
        break;
          }
        }
        if(!diseaseCheck){
          alert("펫이 질병이 있는지 선택해 주세요.");
          return false;
        }     
        
    //펫 짖음 유무
    for(var i=0;i<$('[name="pet_bark"]').length;i++){
      if($('input:checkbox[name="pet_bark"]').eq(i).is(":checked") == true) {
    	  barkCheck = true;
        break;
          }
        }
        if(!barkCheck){
          alert("펫이 잘 짖는지 선택해 주세요.");
          return false;
        } 
    
}