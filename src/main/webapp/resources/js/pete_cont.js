//동물 마릿수 선택했을때, 동물추가가격 입력되고 총가격(몇박얼마+동물추가가격) 입력됨
$(document).ready(function(){
	$("#pete_kind_many").on("change", function(){
		var km = $("#pete_kind_many option:selected").val();
		$('#pete_kind_price').val(km*25000);
		var mm = $("#datemoney").val();
		var ss = $("#pete_kind_price").val();
		var hap = parseInt(mm) + parseInt(ss)
		$("#pete_price").val(hap)
	});	
});
jQuery.browser = {};
(function () {
    jQuery.browser.msie = false;
    jQuery.browser.version = 0;
    if (navigator.userAgent.match(/MSIE ([0-9]+)\./)) {
        jQuery.browser.msie = true;
        jQuery.browser.version = RegExp.$1;
    }
})();