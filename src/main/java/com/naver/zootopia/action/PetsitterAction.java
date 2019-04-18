package com.naver.zootopia.action;

import java.io.File;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.naver.zootopia.DAO.PeteService;
import com.naver.zootopia.model.peteBean;
import com.naver.zootopia.model.peteEpil;
import com.naver.zootopia.model.peteReservation;
import com.naver.zootopia.model.petepilogue;

@Controller
public class PetsitterAction {

	@Autowired
	private PeteService psService;
	
	private String saveFolder = "D:\\workspace-sts\\final\\src\\main\\webapp\\resources\\upload";
		
	//펫시터 집에 맡기기 글 작성 폼
	@RequestMapping(value = "/pete_write.nhn")
	public String pete_write(
			HttpSession session
			) throws Exception {
		String id = (String) session.getAttribute("id");
		System.out.println("pete_id :" + id );
		session.setAttribute("pete_id", id);
		return "petsitter/pete_write";		
	}
	
	//펫시테 집에 맡기기 글 작성
	@RequestMapping(value = "/pete_write_ok.nhn", method= {RequestMethod.GET,RequestMethod.POST})
	public String bbs_write_ok(
			peteBean petebean,
			HttpServletResponse response,
			HttpServletRequest request
			) throws Exception {
		
		response.setContentType("text/html;charset=utf-8");
		/*request.setCharacterEncoding("utf-8");*/
		
		peteBean pt = new peteBean();
		
		MultipartFile uploadfile = petebean.getUploadfile();
		if(!uploadfile.isEmpty()) {
			//원래 파일명 구해오기
			String fileName = uploadfile.getOriginalFilename();
			
			//원래 파일명 저장
			pt.setPete_house_original(fileName);
			
			//생성할 폴더 이름 : 오늘 년+월+일
			Calendar c= Calendar.getInstance();
			int year = c.get(Calendar.YEAR); // 오늘 년도 구합니다.
			int month = c.get(Calendar.MONTH)+1; //월
			int date = c.get(Calendar.DATE); //일
			String homedir = saveFolder+"/"+year+"-"+month+"-"+date;
			
			//파일 객체 생성합니다.
			File path1 = new File(homedir);
			
			//폴더가 존재하는지 확인합니다.
			if(!(path1.exists())) {
				System.out.println("폴더 만들어요");
				path1.mkdir(); //새로운 폴더를 생성
				//mkdir : 만들고자 하는 디렉토리의 상위 디렉토리가 존재하지 않을 경우, 생성 불가
				//mkdirs: 만들고자 하는 디렉토리의 상위 디렉토리가 존재하지 않을 경우, 상위 디렉토리까지 생성
			}
			//난수를 구합니다.
			Random r = new Random();
			int random = r.nextInt(100000000);
			
			//확장자 구하기 시작
			int index = fileName.lastIndexOf(".");
			/*문자열에서 특정 문자열의 위치 값(index)를 반환한다.
			  indexOf가 처음 발견되는 문자열에 대한 index를 반환하는 반면,
			  lastIndexOf는 마지막으로 발견되는 문자열의 index을 반환합니다.
			  (파일명에 점에 여러개 있을 경우 맨 마지막에 발견되는 문자열의 위치를 리턴합니다.)*/
			System.out.println("index = " + index);
			String fileExtension = fileName.substring(index+1);
			System.out.println("fileExtension = " + fileExtension);
			//확장자 구하기 끝
			
			//새로운 파일명을 저장
			String refileName = "bbs"+year+month+date+random+"."+
					fileExtension;
			System.out.println("refileName = " + refileName);
			
			//오라클 디비에 저장될 레코드 값
			String fileDBName = "/" + year + "-" + month + "-" + date + "/" + refileName;
			System.out.println("fileDBName = " + fileDBName);
			
			//transferTo(File path) : 업로드한 파일을 매개변수의 경로에 저장합니다.
			uploadfile.transferTo(new File(saveFolder + fileDBName));
			//바뀐 파일명으로 저장
			pt.setPete_house_photo(fileDBName);		
			pt.setPete_house_original(fileName);
		}
		
		String space = request.getParameter("pete_space");			
		if(space.equals("pete_space1")) {
			space = "주택";
		} else if (space.equals("pete_space2")){
			space ="아파트";
		}
		String kind = request.getParameter("pete_animals_kind");			
		if(kind.equals("pete_animals_kind1")) {
			kind = "있음";
		} else if (kind.equals("pete_animals_kind2")){
			kind ="없음";
		}
		String walk = request.getParameter("pete_walk");			
		if(walk.equals("pete_walk1")) {
			walk = "가능";
		} else if (walk.equals("pete_walk2")){
			walk ="불가능";
		}
		String family = request.getParameter("pete_family");			
		if(family.equals("pete_family1")) {
			family = "있음";
		} else if (family.equals("pete_family2")){
			family ="없음";
		}
		
		String id = request.getParameter("pete_id");
		String subject = request.getParameter("pete_subject");
		String content = request.getParameter("pete_content");
		String location = request.getParameter("pete_location");
		String pass = request.getParameter("pete_pass");
		
		pt.setPete_board_num(petebean.getPete_board_num());
		pt.setPete_space(space);
		pt.setPete_animals_kind(kind);
		pt.setPete_walk(walk);
		pt.setPete_family(family);
		pt.setPete_id(id);
		pt.setPete_subject(subject);
		pt.setPete_content(content);
		pt.setUploadfile(petebean.getUploadfile());
		pt.setPete_location(location);
		pt.setPete_pass(pass);
		pt.setPete_time_in(petebean.getPete_time_in());
		pt.setPete_time_in2(petebean.getPete_time_in2());
		pt.setPete_time_out(petebean.getPete_time_out());
		pt.setPete_time_out2(petebean.getPete_time_out2());
		
		this.psService.insertPete(pt);//저장 메서드 호출
		
		return "redirect:pete_list.nhn";
	}	
	
	//집에 맡기기 리스트
	@RequestMapping(value="/pete_list.nhn", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView pete_list(
			HttpServletRequest request
			)throws Exception {
		int page = 1;
		int limit = 5; //목록보기 초기값
		
		HttpSession session = request.getSession();
		
		String id = (String) session.getAttribute("id");
		System.out.println("pete_id :" + id );
		session.setAttribute("pete_id", id);
		
		
		if(request.getParameter("page") != null ) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		/*자료실 내용 보기 후 목록을 선택했을때 limit값을 유지합니다.
		 * 아래 부분을 주석을 달 경우 limit =3으로 설정됩니다.
		 * 이전에 설정된 limit가 있는지 체크
		 * 서버에 limit값을 넣어준다*/
		//limit값은 ajax에서 가져온다
		if(session.getAttribute("limit") != null) {
				limit=(Integer)session.getAttribute("limit");
		}
		
		//변경된 limit가 있는지 체크
		if(request.getParameter("limit") != null) {
			limit=Integer.parseInt(request.getParameter("limit"));
			session.setAttribute("limit", limit);
		}
		System.out.println("limit :" + limit);
		System.out.println("page :" + page);
		
		int listcount = psService.getListCount();//총 리스트수를 받아옴
		
		//총 페이지 수 
		int maxpage = (listcount+limit-1)/limit;
		
		//현재 페이지에 보여줄 시작 페이지 수(1,11,21,등...)
		int startpage = ((page-1) / 10 ) * 10+1;
		
		//현재 페이지에 보여줄 마지막 페이지 수(10,20,30,등...)
		int endpage = startpage + 10 -1;
		
		if(endpage > maxpage) endpage = maxpage;
		
		if(endpage < page) page = endpage;
		
		Map m =new HashMap();
		m.put("limit", limit);
		m.put("page", page);
		List<peteBean> petelist = psService.getPeteList(m);
		
		//같은 페이지에 뽑은 list에서 id값을 가져옴.
		//가져온 id를  이용해 다른 테이블의 평점을 가져와 평균점수, 갯수로 만들어 jsp로 보냄
		List<Map<String, Integer>> starList = new ArrayList<Map<String, Integer>>();
		
		for (peteBean pete : petelist) {
			List<Integer> epilList = psService.selectListEpil(pete.getPete_id());
			Map<String, Integer> epilMap = new HashMap<String, Integer>();
			
			int sum = 0;
			int avg = 0;
			int cnt = epilList.size();
			if (cnt == 0 ) {
				epilMap.put("avg", 0);
				epilMap.put("cnt", 0);
			} else {
				System.out.println("1");
				for (Integer star : epilList) { System.out.println("2");
					sum += star;
				}
				avg = sum / cnt;
				epilMap.put("avg", avg);
				epilMap.put("cnt", cnt);
			}
			starList.add(epilMap);
		}
		ModelAndView view = new ModelAndView("petsitter/pete_list"); 
		
		view.addObject("page", page);//현재 페이지 수
		view.addObject("maxpage", maxpage);//최대 페이지 수
		view.addObject("startpage", startpage);
		view.addObject("endpage", endpage);
		view.addObject("listcount", listcount);
		view.addObject("petelist", petelist);
		view.addObject("starList", starList);
		
		return view;		
	}
	
	//자료실 검색 목록
	@RequestMapping(value="/pete_find_ok.nhn", method=RequestMethod.GET)
	public ModelAndView pete_find_ok (
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(value="page", defaultValue="1") int page,
			@RequestParam("find_name") String find_name,
			@RequestParam("find_field") String find_field) throws Exception {
		System.out.println("find_name : " + find_name);
		System.out.println("find_field : " + find_field);
		int limit = 5;
		
		Map m = new HashMap();
		m.put("page", page);
		m.put("limit", limit);
		m.put("find_field", find_field);
		m.put("find_name", "%"+find_name+"%");
		int listcount = this.psService.getListCount2(m);
		
		//총 페이지 수
		int maxpage = (listcount+limit-1)/limit;
		
		//현재 페이지에 보여줄 시작 페이지 수(1,11,21,등...)
		int startpage = ((page-1) / 10 ) * 10+1;
		
		//현재 페이지에 보여줄 마지막 페이지 수(10,20,30,등...)
		int endpage = startpage + 10 -1;
		
		if(endpage > maxpage) endpage = maxpage;
		
		if(endpage < page) page = endpage;
		
		System.out.println(find_name);
		List<peteBean> petelist = psService.getPeteList2(m);
		
		//같은 페이지에 뽑은 list에서 id값을 가져옴.
		//가져온 id를  이용해 다른 테이블의 평점을 가져와 평균점수, 갯수로 만들어 jsp로 보냄
		List<Map<String, Integer>> starList = new ArrayList<Map<String, Integer>>();
		
		for (peteBean pete : petelist) {
			List<Integer> epilList = psService.selectListEpil(pete.getPete_id());
			Map<String, Integer> epilMap = new HashMap<String, Integer>();
			
			int sum = 0;
			int avg = 0;
			int cnt = epilList.size();
			if (cnt == 0 ) {
				epilMap.put("avg", 0);
				epilMap.put("cnt", 0);
			} else {
				
				for (Integer star : epilList) {
					sum += star;
				}
				avg = sum / cnt;
				epilMap.put("avg", avg);
				epilMap.put("cnt", cnt);
			}
			starList.add(epilMap);
		}
		
		ModelAndView view = new ModelAndView("petsitter/pete_find");
		view.addObject("find_name", find_name); //jsp문에 text창
		view.addObject("find_field", find_field);//jsp문에 select
		view.addObject("page", page);//현재 페이지 수
		view.addObject("maxpage", maxpage);//최대 페이지 수
		view.addObject("startpage", startpage);
		view.addObject("endpage", endpage);
		view.addObject("listcount", listcount);
		view.addObject("petelist", petelist);
		view.addObject("starList", starList);
		
		return view;
	}
	
	//디테일, 수정, 삭제
	@RequestMapping(value="/pete_cont.nhn")
	public ModelAndView pete_cont(
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam("pete_board_num") int num,
			@RequestParam(value="page", defaultValue="1") int page,
			@RequestParam("state") String state,
			HttpSession session
			) throws Exception {
		//번호를 기준으로 DB 내용을 가져옴
		peteBean pete = this.psService.getPeteCont(num);
		
		String pete_id = pete.getPete_id();
		
		System.out.println("pete_id : " + pete_id);
		
		ModelAndView view = new ModelAndView();
		
		if(state.equals("cont" )) {//내용보기 일때
			view.setViewName("petsitter/pete_cont");
			//글 내용중 엔터키 친부분을 다음줄로 개행처리
			String pete_cont = pete.getPete_content().replace("\n", "<br/>");
			view.addObject("pete_cont", pete_cont);
		} else if (state.equals("edit")) {//수정폼
			view.setViewName("petsitter/pete_edit");
		} else if (state.equals("del")) {//삭제폼
			view.setViewName("petsitter/pete_del");
		}
		
		//펫시터 예약 뽑기
		List<peteReservation> peReser = psService.peteReserList2(pete_id);
		view.addObject("peReser", peReser);
		
		view.addObject("petebean", pete);
		view.addObject("page", page);
		
		String id = (String) session.getAttribute("id");
		System.out.println("id :" + id );
		session.setAttribute("id", id);
		
		
		return view;
	}
	
	//예약 중복 ID 체크
	@RequestMapping(value="/checkReser.nhn")
	public void id_check(
			@RequestParam("id") String id,
			HttpServletResponse response
			) throws Exception {
		int result = psService.checkReserId(id);
		PrintWriter out = response.getWriter();
		
		out.println(result);
	}
	
	//글수정
	@RequestMapping(value="/pete_edit_ok.nhn", method=RequestMethod.POST)
	public String pete_edit_ok (
			@RequestParam("page") int page,
			peteBean p,
			HttpServletResponse response,
			HttpServletRequest request
			) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		int pete_num = p.getPete_board_num();
		peteBean petebean = new peteBean();
		peteBean pete = this.psService.getPeteCont(pete_num);
		if(!pete.getPete_pass().equals(p.getPete_pass())) {
			out.println("<script>alert('비밀번호가 틀렸습니다.'); history.go(-1);</script>");
		} else {//비번이 같다면
			MultipartFile uploadfile = p.getUploadfile();
			
			if(!uploadfile.isEmpty()) {
				File DelFile = new File(saveFolder + pete.getPete_house_photo());
					if(DelFile.exists()) {
						DelFile.delete(); //기존 이진파일 삭제
					}
				//원래 파일명 구해오기
				String fileName = uploadfile.getOriginalFilename();
				//원래 파일명 저장
				petebean.setPete_house_original(fileName);
				//생성할 폴더 이름 : 오늘 년 + 월 + 일
				Calendar c= Calendar.getInstance();
				int year = c.get(Calendar.YEAR); // 오늘 년도 구합니다.
				int month = c.get(Calendar.MONTH)+1; //월
				int date = c.get(Calendar.DATE); //일
				String homedir = saveFolder+"/"+year+"-"+month+"-"+date;
				
				//파일 객체 생성합니다.
				File path1 = new File(homedir);
				
				//폴더가 존재하는지 확인합니다.
				if(!(path1.exists())) {
					System.out.println("폴더 만들어요");
					path1.mkdir(); //새로운 폴더를 생성
					//mkdir : 만들고자 하는 디렉토리의 상위 디렉토리가 존재하지 않을 경우, 생성 불가
					//mkdirs: 만들고자 하는 디렉토리의 상위 디렉토리가 존재하지 않을 경우, 상위 디렉토리까지 생성
				}
				//난수를 구합니다
				Random r = new Random();
				int random = r.nextInt(100000000);
				
				//확장자 구하기 시작
				int index = fileName.lastIndexOf(".");
				/*문자열에서 특정 문자열의 위치 값(index)를 반환한다.
				 * indexOf가 처음 발견되는 문자열에 대한 index를 반환하는 반면,
				 * lastIndexOf는 마지막으로 발견되는 문자열의 index을 반환합니다.
				 * (파일명에 점에 여러개 있을 경우 맨 마지막에 발견되는 문자열의 위치를 리턴합니다.)*/
				System.out.println("index = " + index);
				String fileExtension = fileName.substring(index+1);
				System.out.println("fileExtension = " + fileExtension);
				//확장자 구하기 끝
				
				//새로운 파일명을 저장
				String refileName = "bbs"+year+month+date+random+"."+
						fileExtension;
				System.out.println("refileName = " + refileName);
				
				//오라클 디비에 저장될 레코드 값
				String fileDBName = "/" + year + "-" + month + "-" + date + "/" + refileName;
				System.out.println("fileDBName = " + fileDBName);
				
				//transferTo(File path) : 업로드한 파일을 매개변수의 경로에 저장합니다.
				uploadfile.transferTo(new File(saveFolder + fileDBName));
				//바뀐 파일명으로 저장
				petebean.setPete_house_photo(fileDBName);
				petebean.setPete_house_original(fileName);
			}
			
			String id = request.getParameter("pete_id");
			String subject = request.getParameter("pete_subject");
			String content = request.getParameter("pete_content");
			String location = request.getParameter("pete_location");
			String pass = request.getParameter("pete_pass");
			
			String space = request.getParameter("pete_space");			
			if(space.equals("pete_space1")) {
				space = "주택";
			} else if (space.equals("pete_space2")){
				space ="아파트";
			}
			String kind = request.getParameter("pete_animals_kind");			
			if(kind.equals("pete_animals_kind1")) {
				kind = "있음";
			} else if (kind.equals("pete_animals_kind2")){
				kind ="없음";
			}
			String walk = request.getParameter("pete_walk");			
			if(walk.equals("pete_walk1")) {
				walk = "가능";
			} else if (walk.equals("pete_walk2")){
				walk ="불가능";
			}
			String family = request.getParameter("pete_family");			
			if(family.equals("pete_family1")) {
				family = "있음";
			} else if (family.equals("pete_family2")){
				family ="없음";
			}
			
			petebean.setPete_board_num(p.getPete_board_num());
			petebean.setPete_space(space);
			petebean.setPete_animals_kind(kind);
			petebean.setPete_walk(walk);
			petebean.setPete_family(family);
			petebean.setPete_id(id);
			petebean.setPete_subject(subject);
			petebean.setPete_content(content);
			petebean.setUploadfile(p.getUploadfile());
			petebean.setPete_location(location);
			petebean.setPete_pass(pass);
			petebean.setPete_time_in(p.getPete_time_in());
			petebean.setPete_time_out(p.getPete_time_out());
			petebean.setPete_time_out2(p.getPete_time_out2());
			petebean.setPete_time_in2(p.getPete_time_in2());
			
			this.psService.editPete(petebean);//저장 메서드 호출
			
			//get방식으로 3개의 파라미터 값이 넘어감
			response.sendRedirect(
					"pete_cont.nhn?pete_board_num="+pete_num+"&page"+page+"&state=cont");
		}
		return null;
	}
	//글삭제
	@RequestMapping(value="/pete_del_ok.nhn", method= {RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public String pete_del_ok(
			@RequestParam("pete_board_num") int pete_board_num,
			@RequestParam("page") String page,
			@RequestParam("pete_pass") String pete_pass,
			HttpServletRequest request,
			HttpServletResponse response
			) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		
		String state="";
		peteBean pete = this.psService.getPeteCont(pete_board_num);
		//기본 파일명 가져옴
		String fname = pete.getPete_house_photo();
		System.out.println("pete_pass" + pete_pass);
		/*String pete_pass = request.getParameter("pete_pass").trim();*/
		System.out.println("zzzzzz : " + pete.getPete_pass());
		//PrintWriter out = response.getWriter();
		if(!pete.getPete_pass().equals(pete_pass)) {
			state="1";
			//out.print(state);
			return state;
		} else {
			if(fname != null) { //기존 이진 파일이 존재하면
				File file = new File(saveFolder + fname);
				file.delete(); //서버 폴더로부터 기존 이진파일 삭제
			}
			this.psService.deletePete(pete_board_num);
			state="2";
			//out.print(state);
			return state;
		}
	}
	
	//집에맡기기 예약하기
	@RequestMapping(value="/pete_reser_ok.nhn", method=RequestMethod.POST)
	public ModelAndView pete_reser_ok(
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam("pete_board_num") int pete_board_num,
			@RequestParam("pete_id") String pete_id,
			peteReservation pr ) throws Exception {
		String join_id = pr.getJoin_id();
		response.setContentType("text/html;charset=utf-8");
		pr.setPete_board_num(pete_board_num);
		pr.setPete_id(pete_id);
		//예약 인설트
		this.psService.peteReservation(pr);
		//예약 셀렉트
		List<peteReservation> peReser = psService.peteReserList(join_id);
		ModelAndView mv = new ModelAndView("petsitter/pete_reser");
		mv.addObject("peReser", peReser);
		mv.addObject("pete_board_num", pete_board_num);
		mv.addObject("pete_id", pete_id);
		return mv;
	}
	
	//펫 정보 리스트
	@RequestMapping(value="/pet_epil.nhn", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView pet_epil(
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam("pete_id") String pete_id,
			HttpSession session
			) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		List<petepilogue> petepil = psService.petepilList(pete_id);
		ModelAndView mv = new ModelAndView("petsitter/pet_epil");
		mv.addObject("petepil", petepil);
		mv.addObject("pete_id", pete_id);
		String id = (String) session.getAttribute("id");
		System.out.println("id :" + id);
		session.setAttribute("id", id);
		return mv;
	}
	
	//펫정보저장 페이지로
	@RequestMapping(value="/pet_epil_write.nhn", method= {RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public ModelAndView pet_epil_write(
			@RequestParam("pete_id") String pete_id,
			HttpSession session
			
			) throws Exception {
		ModelAndView mv = new ModelAndView("petsitter/pet_epil_write");
		String id = (String) session.getAttribute("id");
		System.out.println("id :" + id);
		session.setAttribute("id", id);
		mv.addObject("pet_id", pete_id);
		
		return mv;
	}
	
	//펫정보저장
	@RequestMapping(value="/pet_epil_write_ok.nhn", method= {RequestMethod.POST, RequestMethod.GET})
	public String pet_epil_write_ok(
			petepilogue pe,
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam("pet_id") String pet_id
			) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		this.psService.insertPetepil(pe);
		
		return "redirect:pet_epil.nhn?pete_id="+pet_id;
	}
	
	//펫시터 페이지
	@RequestMapping(value="/pete_sitter.nhn", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView pete_sitter (
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam("pete_id") String pete_id,
			@RequestParam("pete_location") String pete_location,
			@RequestParam("pete_subject") String pete_subject
			) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		ModelAndView mv = new ModelAndView("petsitter/pete_sitter");
		
		mv.addObject("pete_id",pete_id);
		mv.addObject("pete_location",pete_location);
		mv.addObject("pete_subject",pete_subject);
		
		//예약하기 목록값(달력때문에 뽑음)
		/*peteReservation date = psService.peteReserDate(pete_id);*/
		/*String cal1 = date.getPete_date(); 
		String cal2 = date.getPete_date2();*/
		//펫시터 예약 뽑기
		List<peteReservation> peReser = psService.peteReserList2(pete_id);
		List<peteEpil> peteepil = psService.selectPeteEpil(pete_id);
		
		int size = peteepil.size();
		int sum = 0;
		for (peteEpil pete : peteepil) {
			sum += Integer.parseInt(pete.getPete_epil_star());
			System.out.println("ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ" + pete.getPete_epil_star());
		}
		try {
		sum = sum/size;
		} catch (ArithmeticException e) {
			System.out.println("피제수 0 " + e);
		}
		mv.addObject("peteepil", peteepil);
		mv.addObject("sum", sum);
		mv.addObject("size", size);
		mv.addObject("peReser", peReser);
		/*mv.addObject("cal1", cal1);
		mv.addObject("cal2", cal2);		*/
		return mv;
	}
	//펫시터 후기작성 페이지
	@RequestMapping(value="/pete_epil.nhn", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView pete_epil (
			HttpServletResponse response,
			HttpServletRequest request,
			@RequestParam("pete_id") String pete_id,
			@RequestParam("pete_location") String pete_location,
			@RequestParam("pete_subject") String pete_subject
			) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		ModelAndView mv = new ModelAndView("petsitter/pete_epil");
		
		mv.addObject("pete_id",pete_id);
		mv.addObject("pete_location",pete_location);
		mv.addObject("pete_subject",pete_subject);
		
		return mv;
	}
	
	//펫시터 후기작성 완료
	@RequestMapping(value="pete_epil_ok.nhn", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView pete_epil_ok(
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam("pete_id") String pete_id,
			@RequestParam("pete_location") String pete_location,
			@RequestParam("pete_subject") String pete_subject,
			peteEpil peteepil
			) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		String pete_epil_subject= peteepil.getPete_epil_subject();
		String pete_epil_star = peteepil.getPete_epil_star();
		String pete_epil_id = peteepil.getPete_epil_id();
		System.out.println("pete_id : " + pete_id);
		this.psService.insertPeteEpil(peteepil);
		
		/*peteBean pb = new peteBean(); 
		this.psService.pbSelect(pb);*/
		
		ModelAndView mv = new ModelAndView("redirect:pete_sitter.nhn");
		
		mv.addObject("pete_id",pete_id);
		mv.addObject("pete_location",pete_location);
		mv.addObject("pete_subject",pete_subject);
		mv.addObject("pete_epil_star", pete_epil_star);
		mv.addObject("pete_epil_subject", pete_epil_subject);
		
		return mv;
	}	
}