$(document).ready(function() {
	$('form').submit(function(event) {
		if ($.trim($('#master_name').val()) == "") {
			alert('보호자 이름을 입력하세요.');
			$('#master_name').focus();
			event.preventDefault();
		}

		if ($.trim($('#master_tel').val().length) < 3) {
			alert("보호자 연락처를 입력하세요.")
			$('#master_tel').focus().val("");
			event.preventDefault();
		}

		if ($.trim($('#pet_name').val()) == "") {
			alert('펫 이름을 입력하세요.');
			$('#pet_name').focus();
			event.preventDefault();
		}

		if ($.trim($('#pet_speices').val()) == "") {
			alert('펫 종을 입력하세요.');
			$('#pet_species').focus();
			event.preventDefault();
		}

		if ($.trim($('#hospital_tel').val()) == "") {
			alert('병원 연락처를 입력하세요.');
			$('#hospital_tel').focus();
			event.preventDefault();
		}

		if ($.trim($('#hospital_address').val()) == "") {
			alert('병원 주소를 입력하세요.');
			$('#hospital_address').focus();
			event.preventDefault();
		}

		if ($.trim($('#hospital_subject').val()) == "") {
			alert('제목을 입력하세요.');
			$('#hospital_subject').focus();
			event.preventDefault();
		}

		if ($.trim($('#hospital_content').val()) == "") {
			alert('내용을 입력하세요.');
			$('#hospital_content').focus();
			event.preventDefault();
		}

	})

});
