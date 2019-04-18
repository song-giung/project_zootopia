package com.naver.zootopia.DAO;

import java.util.List;

import com.naver.zootopia.model.EvaluationBean;

public interface EvaluationService {

	EvaluationBean evaluation();

	int starScore(EvaluationBean eb) throws Exception;

	List<EvaluationBean> getscoreComment(int mark_no) throws Exception;

	EvaluationBean getLastComment(String id) throws Exception;

	double getAvgScore(int mark_no) throws Exception;

	void starDelete(int no) throws Exception;

}
