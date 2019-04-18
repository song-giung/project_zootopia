package com.naver.zootopia.DAO;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.zootopia.model.MarkerBean;

@Service
public class MarkerServiceImpl implements MarkerService{
	
	@Autowired
	private MarkerDAOImpl markerDao;

	@Override
	public List<MarkerBean> getList() throws Exception{
		List<MarkerBean> markerlist = markerDao.getlist();
		return markerlist;
	}

	@Override
	public List<MarkerBean> getselectList(int type) throws Exception {
		List<MarkerBean> markerlist = markerDao.getselectlist(type);
		return markerlist;
	}

	@Override
	public MarkerBean getInfo(int mark_no) throws Exception{
		MarkerBean mb = markerDao.getInfo(mark_no);
		return mb;
	}

	@Override
	public int addmarker(MarkerBean mb) throws Exception {
		int result = markerDao.addmarker(mb);
		return result;
	}

	@Override
	public int getMaxnum() throws Exception {
		int max = markerDao.getMaxnum();
		return max;
	}

	@Override
	public void editMarker(MarkerBean mb) throws Exception {
		markerDao.editMarker(mb);
	}

	@Override
	public void deleteMarker(int no) throws Exception {
		markerDao.deleteMarker(no);
	}

}
