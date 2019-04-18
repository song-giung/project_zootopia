package com.naver.zootopia.DAO;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.zootopia.model.EvaluationBean;

@Service
public class EvaluationServiceImpl implements EvaluationService{
	
	@Autowired
	private EvaluationDAOImpl evalDao;
	
	@Override
	public EvaluationBean evaluation() {
		EvaluationBean eb = evalDao.evaluation();
		return null;
	}

	@Override
	public int starScore(EvaluationBean eb) throws Exception{
		int result = evalDao.starScore(eb);
		return result;
	}

	@Override
	public List<EvaluationBean> getscoreComment(int mark_no) throws Exception {
		List<EvaluationBean> eb = evalDao.getscoreComment(mark_no);
		return eb;
	}

	@Override
	public EvaluationBean getLastComment(String id) throws Exception {
		EvaluationBean getEb = evalDao.getLastComment(id);
		return getEb;
	}

	@Override
	public double getAvgScore(int mark_no) throws Exception {
		double avg = evalDao.getAvgScore(mark_no);
		System.out.println("Dao : " +avg);
		return avg;
	}

	@Override
	public void starDelete(int no) throws Exception {
		evalDao.starDelete(no);
	}

}
