<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<body>
<jsp:include page="/jsp/header.jsp"/>
	<form action="./pete_del_ok.nhn" method="post">
	<input type="hidden" name="pete_board_num" value="${petebean.pete_board_num }">
	<input type="hidden" name="page" value="${page }">
	
	<h2>비밀번호 확인</h2><input type="password" name="pete_pass" id="pete_pass" size="15">
		<input type="submit" value="삭제">
		<input type="reset" value="취소" onclick="javascript:history.go(-1)">
	</form>
</body>
<jsp:include page="/jsp/footer.jsp"/>