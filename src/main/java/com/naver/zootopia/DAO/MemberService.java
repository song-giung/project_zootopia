package com.naver.zootopia.DAO;
import java.util.List;
import java.util.Map;

import com.naver.zootopia.model.MemberBean;
import com.naver.zootopia.model.ZipcodeBean2;
public interface MemberService {
	/*아이디 중복 체크 */
	public int checkMemberId(String id) throws Exception;

	/*우편 검색*/
	public List<ZipcodeBean2> findZipcode(String dong) throws Exception;
	
	/* 비번 검색 */
	public MemberBean findpwd(Map<String,Object> pm) throws Exception ;

	/*회원저장*/
	public void insertMember(MemberBean m) throws Exception;

	/*로그인 인증 체크 */
	public MemberBean userCheck(String id) throws Exception;

	 /*회원수정*/
	public void updateMember(MemberBean member) throws Exception;

	/* 비밀번호 변경 */
	public void changepwd(MemberBean member) throws Exception;
	
	/*회원 타입 확인*/
	public String check_join_type(String id)throws Exception;
}
