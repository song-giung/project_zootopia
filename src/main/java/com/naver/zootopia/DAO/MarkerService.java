package com.naver.zootopia.DAO;

import java.util.List;

import com.naver.zootopia.model.MarkerBean;

public interface MarkerService {

	List<MarkerBean> getList() throws Exception;

	List<MarkerBean> getselectList(int type) throws Exception;

	MarkerBean getInfo(int mark_no) throws Exception;

	int addmarker(MarkerBean mb) throws Exception;

	int getMaxnum() throws Exception;

	void editMarker(MarkerBean mb) throws Exception;

	void deleteMarker(int no)throws Exception;

	

}
