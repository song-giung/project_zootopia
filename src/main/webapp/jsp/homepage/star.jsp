<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>별점</title>
<style>
.star-input>.input, .star-input>.input>label:hover, .star-input>.input>input:focus+label,
	.star-input>.input>input:checked+label {
	display: inline-block;
	vertical-align: middle;
	background: url('./resources/image/5stars.png') no-repeat;
}

.star-input {
	display: inline-block;
	white-space: nowrap;
	width: 160px;
	height: 40px;
	padding: 11px 1px 1px 1px;
	line-height: 30px;
}

.star-input>.input {
	display: inline-block;
	width: 122px;
	background-size: 122px;
	height: 25px;
	white-space: nowrap;
	overflow: hidden;
	position: relative;
}

.star-input>.input>input {
	position: absolute;
	width: 1px;
	height: 1px;
	opacity: 0;
}

star-input>.input.focus {
	outline: 1px dotted #ddd;
}

.star-input>.input>label {
	margin : 0px;
	width: 12.2px;
	height: 25px;
	padding: 25px 0 0 0;
	overflow: hidden;
	float: left;
	cursor: pointer;
	position: absolute;
	top: 0;
	left: 0;
}

.star-input>.input>label:hover, .star-input>.input>input:focus+label,
	.star-input>.input>input:checked+label {
	background-size: 122px;
	background-position: 0 bottom;
}

.star-input>.input>label:hover ~label{
	background-image: none;
}

.star-input>.input>label[for="p1"] {
	width: 13px;
	z-index: 10;
}

.star-input>.input>label[for="p2"] {
	width: 24.4px;
	z-index: 9;
}

.star-input>.input>label[for="p3"] {
	width: 37px;
	z-index: 8;
}

.star-input>.input>label[for="p4"] {
	width: 48.8px;
	z-index: 7;
}

.star-input>.input>label[for="p5"] {
	width: 61px;
	z-index: 6;
}

.star-input>.input>label[for="p6"] {
	width: 73.2px;
	z-index: 5;
}

.star-input>.input>label[for="p7"] {
	width: 85px;
	z-index: 4;
}

.star-input>.input>label[for="p8"] {
	width: 97.6px;
	z-index: 3;
}

.star-input>.input>label[for="p9"] {
	width: 109.1px;
	z-index: 2;
}

.star-input>.input>label[for="p10"] {
	width: 122px;
	z-index: 1;
}

.star-input>output {
	display: inline-block;
	width: 30px;
	font-size: 18px;
	text-align: right;
	vertical-align: middle;
}
</style>
</head>
<body>

	<span class="star-input"> 
		<span class="input">
			<input type="radio" name="star-input" value="1" id="p1"> 
			<label for="p1">1</label> 
			
			<input type="radio" name="star-input" value="2" id="p2"> 
			<label for="p2">2</label> 
	
			<input type="radio" name="star-input" value="3" id="p3"> 
			<label for="p3">3</label>
			
			<input type="radio" name="star-input" value="4" id="p4"> 
			<label for="p4">4</label>
			 
			<input type="radio" name="star-input" value="5" id="p5"> 
			<label for="p5">5</label>
			
		    <input type="radio" name="star-input" value="6" id="p6"> 
			<label for="p6">6</label>
			
			<input type="radio" name="star-input" value="7" id="p7"> 
			<label for="p7">7</label>
			
			<input type="radio" name="star-input" value="8" id="p8"> 
			<label for="p8">8</label>
			
			<input type="radio" name="star-input" value="9" id="p9"> 
			<label for="p9">9</label>
			
			<input type="radio" name="star-input" value="10" id="p10"> 
			<label for="p10">10</label>
		</span>	 
		<output for="star-input"><b>0</b>점</output>
	</span>
	
	<script src="./resources/js/jquery-3.3.1.js"></script>
	<script>
	var starRating = function(){
		var $star = $(".star-input"),
		    $result = $star.find("output>b");
			
		  	$(document).on("focusin", ".star-input>.input", function(){
		   		 $(this).addClass("focus");
		 	}).on("focusout", ".star-input>.input", function(){
		    	var $this = $(this);
		    	setTimeout(function(){
		      		if($this.find(":focus").length === 0){
		       			$this.removeClass("focus");
		     	 	}
		   		}, 100);
		 	 }).on("change", ".star-input :radio", function(){
		    	$result.text($(this).next().text());
		  	}).on("mouseover", ".star-input label", function(){
		    	$result.text($(this).text());
		    }).on("mouseleave", ".star-input>.input", function(){
		    	var $checked = $star.find(":checked");
		    		if($checked.length === 0){
		     	 		$result.text("0");
		   		 	} else {
		     	 		$result.text($checked.next().text());
		     	 		$('#star_score').val($checked.next().text());
		    		}
		  	});
		};
		starRating();
	</script>
</body>
</html>