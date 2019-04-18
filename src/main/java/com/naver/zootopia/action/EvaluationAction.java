package com.naver.zootopia.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.naver.zootopia.DAO.EvaluationService;
import com.naver.zootopia.model.EvaluationBean;

@Controller
public class EvaluationAction {

	@Autowired
	private EvaluationService eval;

	// 장소 별점 등록
	@RequestMapping(value = "/starScore")
	@ResponseBody
	public Object starScore(
			EvaluationBean eb, 
			HttpServletResponse response, HttpServletRequest request
			)throws Exception {
		System.out.println("별점");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		eb.setId(id);
		eval.starScore(eb);
		EvaluationBean getEb = new EvaluationBean();
		getEb = eval.getLastComment(id);
		return getEb;
	}
	//별점 삭제
	@RequestMapping(value="/starDelete")
	@ResponseBody
	public List<EvaluationBean> starDelete(
			@RequestParam(value="evaluation_no")int no,
			@RequestParam(value="mark_no") int mark_no
			) throws Exception{
		List<EvaluationBean> list = new ArrayList<EvaluationBean>();
		eval.starDelete(no);		
		list = eval.getscoreComment(mark_no);
		return list;
	}
}
