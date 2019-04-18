<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="./resources/js/pet_epil_write.js"></script>
<form action="./pet_epil_write_ok.nhn" method="POST" onsubmit="return check()">
<div class="table-responsive">
<table border=1>
	<tr>
		<td>아이디 : 
			<input type="text" name="pet_id" id="pet_id" value="${pet_id }" readonly>
		</td>
	</tr>
	
	<tr>
		<td>반려동물(이름, 나이, 무게 등등) : 
			<input type="text" name="pet_info" id="pet_info" >
		</td>
	</tr>
	
	<tr>
		<td>대소변은 잘 가리는 편입니까? : 
			<input type="checkbox" name="pet_feces" value="YES" onclick="check_only(this)">YES 
			<input type="checkbox" name="pet_feces" value="NO" onclick="check_only(this)">NO
		</td>
	</tr>
	
	<tr>
		<td>예방접종을 하였습니까? : 
			<input type="checkbox" name="pet_vaccin" value="YES" onclick="check_only3(this)">YES 
			<input type="checkbox" name="pet_vaccin" value="NO" onclick="check_only3(this)">NO
		</td>
	</tr>
	
	<tr>
		<td>다른 개와 친화적 입니까? : 
			<input type="checkbox" name="pet_friendly" value="YES" onclick="check_only3(this)">YES 
			<input type="checkbox" name="pet_friendly" value="NO" onclick="check_only3(this)">NO
		</td>
	</tr>
	
	<tr>
		<td>앓고 있는 질병이나 이전에 다쳤던 적이 있습니까? : 
			<input type="checkbox" name="pet_disease" value="YES" onclick="check_only4(this)">YES 
			<input type="checkbox" name="pet_disease" value="NO" onclick="check_only4(this)">NO
		</td>
	</tr>

	<tr>
		<td>잘 짖습니까? : 
			<input type="checkbox" name="pet_bark" value="YES" onclick="check_only5(this)">YES 
			<input type="checkbox" name="pet_bark" value="NO" onclick="check_only5(this)">NO
		</td>
	</tr>
	
	<tr>
		<td>
			<input type="submit" value="작성">
			<input type="button" value="취소" onclick="history.go(-1)">
		</td>
	</tr>
</table>
</div>
</form>

<jsp:include page="/jsp/footer.jsp"/>