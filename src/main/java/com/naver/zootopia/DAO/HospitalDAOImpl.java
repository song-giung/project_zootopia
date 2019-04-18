package com.naver.zootopia.DAO;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naver.zootopia.model.HospitalBean;

@Repository("hospitalDAO")
public class HospitalDAOImpl {
	
	@Autowired	
	private SqlSessionTemplate sqlSession;

	//게시판 저장
	public void insertHospital(HospitalBean hospitalbean)throws Exception {
		// TODO Auto-generated method stub
		sqlSession.insert("hospital_insert",hospitalbean);
	}

	//게시판 총 게시물 수
	public int getListCount() throws Exception{
		// TODO Auto-generated method stub
		int count = ((Integer)sqlSession.selectOne("hospital_count")).intValue();
		return count;
	}

	//게시판 목록과 페이징
	public List<HospitalBean> getHospitalList(Map m) throws Exception {
		// TODO Auto-generated method stub
		List<HospitalBean> list = sqlSession.selectList("hospital_list",m);
		return list;
	}

	//번호를 기준으로 게시판 내용 가져오기
	public HospitalBean getHospitalCont(int num) throws Exception{
		// TODO Auto-generated method stub
		HospitalBean bean = sqlSession.selectOne("hospital_cont",num);
		return bean;
	}

	//게시판 수정
	public void editHospital(HospitalBean hospitalbean) throws Exception{
		// TODO Auto-generated method stub
		sqlSession.update("hospital_edit",hospitalbean);
	}

	//게시판 삭제
	public void deleteHospital(int hospital_num){
		// TODO Auto-generated method stub
		sqlSession.delete("hospital_delete",hospital_num);
	}

	//검색 결과 게시물 수
	public int getListCount3(Map m) {
		// TODO Auto-generated method stub
		int count = 0;
		count = ((Integer)sqlSession.selectOne("hospital_cnt",m)).intValue();
		return count;
	}

	//검색 결과 페이징 목록
	public List<HospitalBean> getHospitalList3(Map m) {
		// TODO Auto-generated method stub
		List<HospitalBean> list = sqlSession.selectList("hospital_find",m);
		return list;
	}

}
