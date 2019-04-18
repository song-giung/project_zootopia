package com.naver.zootopia.action;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.naver.zootopia.DAO.EvaluationService;
import com.naver.zootopia.DAO.MarkerService;
import com.naver.zootopia.model.EvaluationBean;
import com.naver.zootopia.model.MarkerBean;

@Controller
public class MarkerAction {
	
	@Autowired
	private MarkerService marker;
	
	@Autowired
	private EvaluationService eval;


	//지도 보기
	@RequestMapping(value="/mapService")
	public ModelAndView marker_list(
		HttpServletRequest request,
		@RequestParam (value="type", defaultValue = "전체") String value
			) throws Exception{
		System.out.println(value);
		List<MarkerBean> markerlist = new ArrayList<MarkerBean>();
		ModelAndView mv = new ModelAndView("map/mapService");
		int num=0;
		if(value.equals("병원")) {
			num = 1;
		}else if(value.equals("공원")) {
			num = 2;
		}else if(value.equals("호텔")) {
			num = 3;
		}else if(value.equals("카페")) {
			num = 4;
		}else if(value.equals("전체")) {
			num= 0;
		}
		if(num !=0) {
			markerlist = marker.getselectList(num);
		}else if (num == 0) {
			markerlist = marker.getList();	
		}
		
		
		if(request.getParameter("state") != null) {
			mv.setViewName("map/select_type");
		}else {
			mv.setViewName("map/mapService");
			
		}
		mv.addObject("markerlist", markerlist);
		return mv;
	}
	
	//마커 클릭 해당 페이지로 이동
	@RequestMapping(value="/HomePage")
	public ModelAndView homepage(
			@RequestParam(value="mark_no")int mark_no
			)throws Exception{
		System.out.println("여기지요");
	MarkerBean mb = new MarkerBean();
	List<EvaluationBean> eb = new ArrayList<EvaluationBean>();
	mb = marker.getInfo(mark_no);
	eb = eval.getscoreComment(mark_no);
	double avg = eval.getAvgScore(mark_no);
	System.out.println("평균 점수:" + avg);
	ModelAndView mv = new ModelAndView("homepage/homepage");
	
	mv.addObject("avg", avg);
	mv.addObject("marker", mb);
	mv.addObject("eval", eb);
	
		return mv;
	}
	
	//마커 입력 페이지
	@RequestMapping(value="/markerAdd")
	public String markerAdd() {
		System.out.println("main");
		return "map/markerAdd";
	}

	//마커 입력
	@RequestMapping(value="/markerAddAction")
	public void markerAddAction(
			MarkerBean mb,
			HttpServletResponse response
			)throws Exception{
		
		int max = marker.getMaxnum();
		System.out.println(max);
		mb.setMark_no(max);
		int result = marker.addmarker(mb);
		System.out.println("마커 추가 성공");
		
		PrintWriter out = response.getWriter();
        response.setContentType("text/html;charset=UTF-8");
        if(result == 1) {
        	out.println("<script>");
        	out.println("alert('마커 추가가 완료되었습니다.');");
        	out.println("location.href='./markerAdd';");
        	out.println("</script>");
        }else {
        	out.println("<script>");
        	out.println("alert('마커 추가 실패하였습니다.');");
        	out.println("history.back();");
        	out.println("</script>");
        }
		
	}
	//마커 수정 페이지로 이동
	@RequestMapping(value="/markerEdit")
	public ModelAndView markerEdit(
			@RequestParam(value="mark_no") int no
			) throws Exception{
		MarkerBean mb = marker.getInfo(no);
		ModelAndView mv = new ModelAndView("map/markerEdit");
		
		mv.addObject("markInfo", mb);
		
		return mv;
	}
	
	//마커 수정 입력
	@RequestMapping(value="markerEditAction")
	public void editAction(
			MarkerBean mb,
			HttpServletRequest request,
			HttpServletResponse response
			) throws Exception{
		System.out.println("여기는 왔다");
		marker.editMarker(mb);
		PrintWriter out = response.getWriter();
		response.setContentType("text/html;charset=UTF-8");     
        out.println("<script>");
        out.println("alert('마커 수정이 완료되었습니다.');");
        out.println("location.href='./HomePage?mark_no="+mb.getMark_no() + "';");
        out.println("</script>");
	}

	//마커 삭제
	@RequestMapping(value="deleteMarker")
	public void deleteMarker(
			@RequestParam(value="mark_no")int no,
			HttpServletRequest request,
			HttpServletResponse response
			) throws Exception{
		marker.deleteMarker(no);
		PrintWriter out = response.getWriter();
		response.setContentType("text/html;charset=UTF-8");     
        out.println("<script>");
        out.println("alert('마커 삭제가 완료되었습니다.');");
        out.println("location.href='./mapService'");
        out.println("</script>");
		
	}

}
