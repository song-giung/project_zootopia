package com.naver.zootopia.DAO;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naver.zootopia.model.MarkerBean;

@Repository
public class MarkerDAOImpl {
	
	@Autowired
	public SqlSessionTemplate sqlSession;

	public List<MarkerBean> getlist() throws Exception{
		List<MarkerBean> markerlist = sqlSession.selectList("Marker.getlist");
		return markerlist;
	}

	public List<MarkerBean> getselectlist(int type) throws Exception{
		List<MarkerBean> markerlist = sqlSession.selectList("Marker.getselectlist", type); 
		return markerlist;
	}

	public MarkerBean getInfo(int mark_no) throws Exception{
		MarkerBean mb = sqlSession.selectOne("Marker.getInfo", mark_no);
		return mb;
	}

	public int addmarker(MarkerBean mb) throws Exception{
		return sqlSession.insert("Marker.addMarker", mb);
		 
		
	}

	public int getMaxnum() throws Exception{
		int max = sqlSession.selectOne("Marker.getMaxnum");
		return max;
	}

	public void editMarker(MarkerBean mb) throws Exception{
		sqlSession.update("Marker.editMarker", mb);
	}

	public void deleteMarker(int no) {
		sqlSession.delete("Eval.deleteEval", no);
		sqlSession.delete("Marker.deleteMarker", no);
	}

}
