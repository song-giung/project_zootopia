package com.naver.zootopia.DAO;

import java.util.List;
import java.util.Map;

import com.naver.zootopia.model.HospitalBean;

public interface HospitalService {
	
	//자료실 저장
	public void insertHospital(HospitalBean hospitalbean) throws Exception;

	/* 자료실 총 게시물 수*/
	public int getListCount() throws Exception;

	/* 자료실 목록과 페이징 */
	public List<HospitalBean> getHospitalList(Map m) throws Exception ;

	/*번호를 기준으로 자료실 내용 가져오기 */
	public HospitalBean getHospitalCont(int num) throws Exception;
	
	/*자료실 수정*/
	public void editHospital(HospitalBean hospitalbean) throws Exception;

	/*자료실 삭제*/
	public void deleteHospital(int hospital_num) throws Exception;

	/*검색 결과 게시물 수*/
	public int getListCount3(Map m) throws Exception;

	/*검색 결과 페이징 목록*/
	public List<HospitalBean> getHospitalList3(Map m) throws Exception ;

	


}
