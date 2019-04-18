//체크박스 옵션 1개만 선택되게 함
function check_only(chk){
    var obj = document.getElementsByName("pete_space");        
    for(var i=0; i<obj.length; i++){
        if(obj[i] != chk){
            obj[i].checked = false;
        }
    }
}
function check_only2(chk){
    var obj2 = document.getElementsByName("pete_animals_kind");
    for(var i=0; i<obj2.length; i++){
        if(obj2[i] != chk){
            obj2[i].checked = false;
        }
    }
}
function check_only3(chk){
    var obj3 = document.getElementsByName("pete_walk");
    for(var i=0; i<obj3.length; i++){
        if(obj3[i] != chk){
            obj3[i].checked = false;
        }
    }
}

//다음 api 이용, 도로명주소 뽑기
function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullAddr = ''; // 최종 주소 변수
            var extraAddr = ''; // 조합형 주소 변수

            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                fullAddr = data.roadAddress;

            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                fullAddr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
            if(data.userSelectedType === 'R'){
                //법정동명이 있을 경우 추가한다.
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                // 건물명이 있을 경우 추가한다.
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postcode').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('pete_location').value = fullAddr;
        }
    }).open();
}

//파일 이미지 넣기,삭제
function fileshow() {
	if($("#filevalue").text() == "") {
		$("#close").css('display','none');
	}else {
		$("#close").css('display','inline');
	}
}
$(document).ready(function(){
	fileshow();
	$("#upfile").change(function() {
		$("#filevalue").text('');
		//$(this).val() => C:\fakepath\image1.png
		var inputfile=$(this).val().split('\\'); // C:, fakerpath, image1.png
		$('#filevalue').text(inputfile[inputfile.length-1]);
		fileshow();
	});//change
	
	$("#close").click(function(){
		$('#filevalue').text('');
		$(this).css('display','none');
	});		
})
