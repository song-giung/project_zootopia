package com.naver.zootopia.DAO;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.zootopia.model.MemberBean;
import com.naver.zootopia.model.ZipcodeBean2;
@Service("memberdService")
public class MemberServiceImpl implements MemberService {


	@Autowired
	private MemberDAOImpl memDAO;
	
	@Override
	public int checkMemberId(String id) throws Exception {		
		return memDAO.checkMemberId(id);
	}

	@Override
	public List<ZipcodeBean2> findZipcode(String dong) throws Exception {
		
		return memDAO.findZipcode(dong);
	}

	@Override
	public MemberBean findpwd(Map<String,Object> pm) throws Exception {
		return memDAO.findpwd(pm);
	}

	@Override
	public void insertMember(MemberBean m) throws Exception {
		memDAO.insertMember(m);
	}

	@Override
	public MemberBean userCheck(String id) throws Exception {		
		return memDAO.userCheck(id);
	}


	@Override
	public void updateMember(MemberBean member) throws Exception {
		memDAO.updateMember(member);
	}

	@Override
	public void changepwd(MemberBean member) throws Exception {
		memDAO.changepwd(member);
	}

	@Override
	public String check_join_type(String id) throws Exception {
		// TODO Auto-generated method stub
		return memDAO.check_join_type(id);
	}
    
	
	
}
