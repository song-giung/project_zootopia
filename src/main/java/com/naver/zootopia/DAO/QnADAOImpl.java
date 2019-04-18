package com.naver.zootopia.DAO;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naver.zootopia.model.QnABean;

@Repository
public class QnADAOImpl {

	@Autowired
	public SqlSessionTemplate sqlSession;

	public List<QnABean> getQlist() throws Exception{
		List<QnABean> Qlist = sqlSession.selectList("QnA.getQlist");
		return Qlist;
	}

	public void AddQuestion(QnABean qab) throws Exception{
		sqlSession.insert("QnA.AddQuestion", qab);
		
	}

	public QnABean getLastQ(String id) throws Exception{
		QnABean qab = sqlSession.selectOne("QnA.getLastQ", id);
		return qab;
	}

	public List<QnABean> getAnswer(int q_no) throws Exception{
		List<QnABean> Alist = sqlSession.selectList("QnA.getAnswer", q_no);
		return Alist;
	}

	public int getMaxnum(int q_no) throws Exception{
		int max = sqlSession.selectOne("QnA.getMaxnum", q_no);
		return max;
	}

	public void AddAnswer(QnABean qab) throws Exception{
		sqlSession.insert("QnA.AddAnswer", qab);	
	}

	public QnABean getLastA(Map<String, Integer> m) {
		QnABean qab = sqlSession.selectOne("QnA.getLastA", m);
		return qab;
	}

	public void deleteAnswer(Map<String, Integer> m) {
		sqlSession.delete("deleteAnswer", m);
	}

	public void deleteQuestion(int no) {
		sqlSession.delete("deleteQuestion", no);
	}

}
