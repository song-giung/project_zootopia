package com.naver.zootopia.action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.naver.zootopia.DAO.QnAService;
import com.naver.zootopia.model.QnABean;

@Controller
public class QnAAction {
	
	@Autowired
	private QnAService qna;

	//QnA 페이지로 이동하면서 QnA 리스트 뽑기
	@RequestMapping(value="/DoctorQnA")
	public ModelAndView doctorQnA() throws Exception{
		ModelAndView mv = new ModelAndView();
		List<QnABean> Qlist = new ArrayList<QnABean>();
		Qlist = qna.getQlist();
		mv.addObject("Qlist", Qlist);
		mv.setViewName("QnA/QnApage");
		return mv;
	}
	//QnA 리스트 질문 등록
	@RequestMapping(value="/AddQuestion")
	@ResponseBody
	public Object AddQuestion(
			QnABean qab,
			HttpServletRequest request
			) throws Exception{
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		qab.setQ_id(id);
		qna.AddQuestion(qab);
		QnABean getQAB = new QnABean();
		
		getQAB = qna.getLastQ(id);
		System.out.println(getQAB);
		return getQAB;
	}
	//QnA 답변 보기
	@RequestMapping(value="/showAnswer")
	@ResponseBody
	public List<QnABean> showAnswer(
			@RequestParam(value="q_no") int q_no
			) throws Exception{
		System.out.println("이상무");
		List<QnABean> Alist = new ArrayList<QnABean>();
		Alist  = qna.getAnswer(q_no);
		return Alist;
	}
	
	//QnA 리스트 질문 등록
	@RequestMapping(value="/AddAnswer")
	@ResponseBody
	public Object AddAnswer(
			QnABean qab,
			HttpServletRequest request,
			 HttpServletResponse response
			) throws Exception{
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		int q_no = qab.getQ_no();
		int max = qna.getMaxnum(q_no); //q_no 끝번호 출력
		System.out.println("마지막 번호는?" + max);
		qab.setA_id(id);
		qab.setA_no(max);
		
		qna.AddAnswer(qab);//글 등록
		System.out.println("답변 등록 완료");
		QnABean getQAB = new QnABean();
		Map<String, Integer> m = new HashMap<String, Integer>();
		m.put("q_no", q_no);
		m.put("a_no", max);
		
		getQAB = qna.getLastA(m);//마지막 답변글 뽑기
		System.out.println("뽑기 완료");
		return getQAB;
	}

	//QnA 답변 삭제
	@RequestMapping(value="/deleteAnswer")
	@ResponseBody
	public List<QnABean> deleteAnswer(
			@RequestParam(value="a_no") int a_no,
			@RequestParam(value="q_no") int q_no
			) throws Exception{
		Map<String, Integer> m = new HashMap<String, Integer>();
		m.put("a_no", a_no);			
		m.put("q_no", q_no);
		qna.deleteAnswer(m);
	
		List<QnABean> Alist = new ArrayList<QnABean>();
		Alist  = qna.getAnswer(q_no);
		return Alist;
	}
	
	//QnA 질문 삭제
	@RequestMapping(value="deleteQuestion")
	public void deleteMarker(
			@RequestParam(value="q_no")int no,
			HttpServletRequest request,
			HttpServletResponse response
			) throws Exception{
		Map<String, Integer> m = new HashMap<String, Integer>();			
		m.put("q_no", no);
		qna.deleteAnswer(m);
		qna.deleteQuestion(no);
		PrintWriter out = response.getWriter();
		response.setContentType("text/html;charset=UTF-8");     
        out.println("<script>");
        out.println("alert('질문 삭제가 완료되었습니다.');");
        out.println("location.href='./DoctorQnA'");
        out.println("</script>");		
	}
	
}
