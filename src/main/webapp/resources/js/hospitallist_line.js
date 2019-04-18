$(document).ready(function(){
	 
	
	$("#viewcount").change(function(){
			var scount = $("#viewcount").val();
			$.ajax({
	       type : "POST",
	       data : {"limit" : scount,},
	       url : "./hospital_list.nhn",
	       cache: false, 
	       headers : {"cache-control" : "no-cache", 
	                 "pragma" : "no-cache"},
	       success : function(data){
	    	   	$("body").html(data);
	       },
	       error : function(request, status , error){
	    	   	console.log("code : " + request.status+"\n"+
	    	   				"message : "+ request.responseText + "\n"+
	    	   				"error :  "+error)
	    	   	alert("data error");
	       }
	      })//ajax end
	     });//change end
	
})//ready end