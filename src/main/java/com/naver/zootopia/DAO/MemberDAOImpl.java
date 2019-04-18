package com.naver.zootopia.DAO;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naver.zootopia.model.MemberBean;
import com.naver.zootopia.model.ZipcodeBean2;

@Repository
public class MemberDAOImpl {
	@Autowired
	private SqlSessionTemplate sqlsession;
	
	public MemberBean userCheck(String id) {
		return sqlsession.selectOne("Final.select",id);
	}
	
	public int checkMemberId(String id) {
		return sqlsession.selectOne("Final.check_id",id);
	}
	
	/* 우편번호 */
	public List<ZipcodeBean2> findZipcode(String dong) throws Exception{  
		List<ZipcodeBean2> list = sqlsession.selectList("Final.zipcodelist", dong);
		return list;
	}
	
	/* 회원 저장 */
	public void insertMember(MemberBean m) throws Exception {
		sqlsession.insert("Final.join", m);
	}
	
	/* 정보 수정 */
	public void updateMember(MemberBean member) {
		sqlsession.update("Final.update",member);
		
	}
	
	public MemberBean findpwd(Map<String, Object> pm) throws Exception {
		return (MemberBean)sqlsession.selectOne("Final.pwd_find", pm);
	}
	
	public void changepwd(MemberBean member) throws Exception {
		sqlsession.update("Final.updatepwd", member);
	}
	
	public String check_join_type(String id) {
		return sqlsession.selectOne("Final.check_join_type",id);
	}
}
