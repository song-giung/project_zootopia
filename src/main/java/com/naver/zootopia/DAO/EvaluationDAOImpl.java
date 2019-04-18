package com.naver.zootopia.DAO;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naver.zootopia.model.EvaluationBean;

@Repository
public class EvaluationDAOImpl {
	
	@Autowired
	public SqlSessionTemplate sqlSession;
	
	public EvaluationBean evaluation() {
		
		return null;
	}

	public int starScore(EvaluationBean eb) throws Exception{
		int result = sqlSession.insert("Eval.starScore",eb);
		return result;
	}

	public List<EvaluationBean> getscoreComment(int mark_no) throws Exception{
		List<EvaluationBean> eb = sqlSession.selectList("Eval.getscoreComment", mark_no); 
		return eb;
	}

	public EvaluationBean getLastComment(String id) throws Exception{
		EvaluationBean getEb = sqlSession.selectOne("Eval.getLastComment", id);
		return getEb;
	}

	public double getAvgScore(int mark_no) throws Exception{
		double avg = sqlSession.selectOne("Eval.getAvgScore", mark_no);
		return avg;
	}

	public void starDelete(int no) throws Exception{
		sqlSession.delete("Eval.starDelete", no);
	}
}
