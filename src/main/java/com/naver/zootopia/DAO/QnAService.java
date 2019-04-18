package com.naver.zootopia.DAO;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.naver.zootopia.model.QnABean;

public interface QnAService {

	List<QnABean> getQlist() throws Exception;

	void AddQuestion(QnABean qab)throws Exception;

	QnABean getLastQ(String id) throws Exception;

	List<QnABean> getAnswer(int q_no) throws Exception;

	int getMaxnum(int q_no) throws Exception;

	void AddAnswer(QnABean qab) throws Exception;

	QnABean getLastA(Map<String, Integer> m) throws Exception;

	void deleteAnswer(Map<String, Integer> m) throws Exception;

	void deleteQuestion(int no) throws Exception;

}
