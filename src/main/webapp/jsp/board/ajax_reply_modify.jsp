<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

								<div class="row">
								<div class="col-sm-1" style="margin-top:10px">
								${list.join_id}:
								</div>
						
							<c:if test="${list.b_reply_state!=1}">
							
									<div class="col-sm-9">										
										<textarea  style="resize:none;" rows="3" name="b_reply_content" readonly id="reply_area_${list.b_reply_num }" class="form-control">${list.b_reply_content}</textarea>
																				
									</div>
												
							</c:if>
								<div class="col-sm-2" style="margin-top:10px">
										${list.b_reply_date} 
										
									</div>				
							
							
							
							
							<c:if test="${list.b_reply_state==1}">
								관리자에 의해 블락 처리된 리플 입니다.
							</c:if> 
							
							
							<div>
							<c:if test="${!empty sessionScope.id}">
								<img id="reply_${list.b_reply_num}" onclick="check_report('${list.b_reply_num}','reply')" src="./resources/image/icon/siren_on.png" style="width:20px;height:auto;">
							</c:if>
							<c:if test="${sessionScope.id==list.join_id&&list.b_reply_state!=1||sessionScope.id=='admin'}" >													
										
									<img src="./resources/image/icon/modify.png" onclick="modify_reply('${list.b_reply_num}')" id="modify_reply_button_${list.b_reply_num}" style="width:25px;height:auto">
									<%-- <input type="button" id="modify_reply_button_${list.b_reply_num}" onclick="modify_reply('${list.b_reply_num}')" value="수정하기" class="btn btn-info form-control"> --%>
								
								
									<img src="./resources/image/icon/confirm.png" onclick="confirm_reply('${list.b_reply_num}')" id="confirm_reply_button_${list.b_reply_num}" style="width:25px;height:auto;display:none">
									<%-- <input type="button" id="confirm_reply_button_${list.b_reply_num}" onclick="confirm_reply('${list.b_reply_num}')" value="확인" style='display:none' class="btn btn-info form-control"> --%>
								
								
									<img src="./resources/image/icon/delete.png" onclick="delete_reply_button('${list.b_reply_num}')" id="delete_reply_button_${list.b_reply_num }" style="width:25px;height:auto">
									<%-- <input type="button" id="delete_reply_button_${list.b_reply_num }" onclick="delete_reply_button('${list.b_reply_num}')" value="삭제" class="btn btn-info form-control"> --%>																
							</c:if>
							</div>
							</div>