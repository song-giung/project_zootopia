package com.naver.zootopia.DAO;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.zootopia.model.QnABean;
@Service
public class QnAServiceImpl implements QnAService{

	@Autowired
	private QnADAOImpl qnaDao;

	@Override
	public List<QnABean> getQlist() throws Exception {
		List<QnABean> Qlist = qnaDao.getQlist();
		return Qlist;
	}
	@Override
	public void AddQuestion(QnABean qab) throws Exception {
		qnaDao.AddQuestion(qab);
		
	}
	@Override
	public QnABean getLastQ(String id) throws Exception {
		QnABean qab = qnaDao.getLastQ(id);
		return qab;
	}
	@Override
	public List<QnABean> getAnswer(int q_no) throws Exception {
		List<QnABean> Alist = qnaDao.getAnswer(q_no);
		return Alist;
	}
	@Override
	public int getMaxnum(int q_no) throws Exception {
		int max = qnaDao.getMaxnum(q_no);
		return max;
	}
	@Override
	public void AddAnswer(QnABean qab) throws Exception {
		qnaDao.AddAnswer(qab);
		
	}
	@Override
	public QnABean getLastA(Map<String, Integer> m) throws Exception {
		QnABean qab = qnaDao.getLastA(m);
		return qab;
	}
	@Override
	public void deleteAnswer(Map<String, Integer> m) throws Exception {
		qnaDao.deleteAnswer(m);		
	}
	@Override
	public void deleteQuestion(int no) throws Exception {
		qnaDao.deleteQuestion(no);
	}

}
