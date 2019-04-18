<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="resources/css/zipcode2.css">

<script src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="./resources/bootstrap/css/bootstrap.css">
<script>
	$(function() {
		$("#inputdong").focus();

		$('#post_list').change(function() {
			var zip = $("#post_list").val();
			var zip1 = zip.substring(0, 5);
			var address2 = zip.substring(5);

			$("#join_zipcode", opener.document).val(zip1);
			$("#join_add1", opener.document).val(address2);

			window.close();
		})
	})
</script>
<title>Insert title here</title>
</head>
<body>


	<div class="table-responsive">
		<form method="post" action="zipcode_find_ok.nhn" id="zipform">
		<table class="bg table-hover table-bordered">
		
	
			<tr>
				<td colspan=2 class="col-md-8">
					<strong><font color="green"> <span class="style1">
					[거주지의 대로명을 입력하고 '찾기' 버튼을 누르세요]</span></font></strong>
				</td>
			</tr>
			<tr>
				<td class="col-md-8"><input type="text" name="dong" id="inputdong">&nbsp;</td>			
			</tr>
			<tr>

			</tr>

			<!-- 동을 입력했다면 실행되는 JSTL if문 -->
			<c:if test="${!empty dong }">
				<!-- 검색결과 주소값이 있을 경우만 실행되는 JSTL if문 -->
				<c:if test="${!empty zipcodelist }">
					<tr>
						<td colspan=2 class="center30"><SELECT name="post_list"
							id="post_list">
								<option value="">--------주소를 선택하세요-----</option>

								<!-- items 속성에는 검색 결과의 주소값을 담고 있는 키값을 적습니다.
								addr2변수에는 주소값을 받아서 저장합니다.
							 -->
								<c:forEach var="address2" items="${zipcodelist }">

									<%-- addr2.zipcode에는 ZipcodeBean 클래스의 getZipcode()메서드에서 구해온 우편번호
									addr2.addr에는 ZipcodeBean 클래스의 getAddr()메서드를 가져와 시도 구군 도로를 합친
										변수 totaladdr에 저장합니다. 우편번호 시도 구군 도로가 저장됩낟.
										예)[06267] 서울특별시 강남구 강남대로 238~246
								 --%>
									<c:set var="totaladdr" value="${address2.zipcode }${address2.addr }" />

									<%-- 결과 받아온 대로 option을 만듭니다. --%>
									<option value="${totaladdr}">[${address2.zipcode }]&nbsp;${address2.addr}</option>
								</c:forEach>
						</SELECT></td>
					</tr>
				</c:if>

				<c:if test="${empty zipcodelist }">
					<tr>
						<td colspan=2 class="center30"><font color="#466d1b"><span
								class="style1">검색 결과가 없습니다.</span></font></td>
					</tr>
				</c:if>
			</c:if>

			<tr>
				<td class="bar" colspan="2" height="3"></td>
			</tr>
		
		</table>
	</form>
	</div>
	<script src="./resources/bootstrap/js/bootstrap.js"></script>
</body>
</html>