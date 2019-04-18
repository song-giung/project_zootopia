package com.naver.zootopia.action;



import java.io.File;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.StringTokenizer;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.naver.zootopia.DAO.MemberService;
import com.naver.zootopia.model.MemberBean;
import com.naver.zootopia.model.ZipcodeBean;
import com.naver.zootopia.model.ZipcodeBean2;

@Controller
public class MemberAction {

	@Autowired
	private MemberService memberService;

	private String saveFolder = "D:\\workspace-sts\\final\\src\\main\\webapp\\resources\\upload";



	/* 로그인 폼 뷰 */
	@RequestMapping(value = "/member_login.nhn")
	@ResponseBody
	public ModelAndView member_login(ModelAndView mv, HttpServletRequest request, HttpServletResponse response,
			@CookieValue(value = "saveid", required = false) Cookie readCookie) throws Exception {
		if (readCookie != null) {
			mv.addObject("saveid", readCookie.getValue());
		}
		mv.setViewName("member_login");
		return mv;
	}

	/* 로그인 인증 */
	@RequestMapping(value = "/member_login_ok.nhn", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView member_login_ok(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// HttpSession 클래스는 세션 객체를 생성해서 로그인 인증 처리를 하기 위해서 입니다.
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter(); // 출력 스트림 객체 생성
		HttpSession session = request.getSession(); // 세션 객체 생성

		String id = request.getParameter("id").trim();
		String pwd = request.getParameter("pwd").trim();

		MemberBean m = this.memberService.userCheck(id);

		if (m == null) { // 등록 되지 않은 회원일때
			out.println("<script>");
			out.println("alert('등록된 아이디가 없습니다.')");
			out.println("history.back()");
			out.println("</script>");
		} else {
			if (m.getJoin_password().equals(pwd)) { // 비번이 같을 경우
				session.setAttribute("id", id);
				int check = 0 ;
				switch(m.getJoin_type()) {
					case "general": check = 1; break; //일반
					case "sitter" : check = 2; break; //펫시터
					case "hospital" : check = 3; break; //병원
				}
				
				
				session.setAttribute("join_type",check);//1번 일반 2번 펫시터 3번 병원
				
				
				String join_name = m.getJoin_name();
				session.setAttribute("join_name", join_name);

				Cookie savecookie = new Cookie("saveid", id);
				if (request.getParameter("saveid") != null) {
					savecookie.setMaxAge(60 * 60);
				} else {
					System.out.println("쿠키저장 : 0");
					savecookie.setMaxAge(0);
				}
				response.addCookie(savecookie);

				// jsp 폴더의 main.jsp로 이동
				ModelAndView mv = new ModelAndView("main");
				return mv;
			} else { // 비번이 다를경우
				out.println("<script>");
				out.println("alert('비번이 다릅니다..')");
				out.println("history.go(-1)");
				out.println("</script>");

			}
		}
		return null;

	}

	/* 회원가입 폼 보기 */
	@RequestMapping(value = "/member_join.nhn")
	public String member_join() throws Exception {
		return "member_join";
	}

	@RequestMapping(value = "/member_join_ok.nhn", method = RequestMethod.POST)
	public void member_join_ok(MemberBean member, HttpServletResponse response, HttpServletRequest request)
			throws Exception {

		// String join_type = request.getParameter("join_type");

		String join_birthday = member.getJoin_year() + "-" + member.getJoin_month() + "-" + member.getJoin_day();
		String join_tel = member.getJoin_tel1() + "-" + member.getJoin_tel2() + "-" + member.getJoin_tel3();
		String join_email = member.getJoin_mailid() + "@" + member.getJoin_maildomain(); // 메일 주소
		String join_type = member.getJoin_type();
		String join_pet_name = member.getJoin_pet_name();
		String join_pet_type = member.getJoin_pet_type();
		String join_sitter_license = member.getJoin_sitter_license();
		String join_hospital_location = member.getJoin_hospital_location();
		String join_hospital_name = member.getJoin_hospital_name();
		String join_hospital_tel = member.getJoin_hospital_tel1() + "-" + member.getJoin_hospital_tel2() + "-"
				+ member.getJoin_hospital_tel3();

		member.setJoin_tel(join_tel);
		member.setJoin_email(join_email);
		member.setJoin_birthday(join_birthday);
		member.setJoin_type(join_type);
		member.setJoin_pet_name(join_pet_name);
		member.setJoin_pet_type(join_pet_type);
		member.setJoin_sitter_license(join_sitter_license);
		member.setJoin_hospital_location(join_hospital_location);
		member.setJoin_hospital_name(join_hospital_name);
		member.setJoin_hospital_tel(join_hospital_tel);

		MultipartFile UpFile = member.getJoin_profile();

		if (!UpFile.isEmpty()) { // 첨부한 이전 파일이 있다면
			String fileName = UpFile.getOriginalFilename(); // 이진 파일명 저장

			member.setJoin_pet_original(fileName);
			System.out.println(member.getJoin_pet_picture());

			Calendar c = Calendar.getInstance(); // 추상클래스로서 년월일 시분초 반환
			int year = c.get(Calendar.YEAR); // 년도값
			int month = c.get(Calendar.MONTH) + 1; // 월 값 . +1일 한 이유는 1월이 0 이라서
			int date = c.get(Calendar.DATE);

			String homedir = saveFolder + "/" + year + "-" + month + "-" + date; // 새로운 폴더 저장
			File path1 = new File(homedir);
			if (!path1.exists()) { // 새로운 폴더가 존재 하지 않으면
				path1.mkdir();// 새로운 폴더를 생성
			}

			Random r = new Random();
			int random = r.nextInt(100000000);

			// 확장자 구하기 시작
			int index = fileName.lastIndexOf(".");
			// 문자열에서 특정 문자열의 위치 값(index)를 반환합니다.
			// indexOf가 처음 발견되는 문자열에 대한 index를 반환하는 반면,
			// lastIndexOf는 마지막으로 발견되는 문자열의 index를 반환합니다.
			// (파일명에 점이 여러개 있을 경우 맨 마지막에 발견디는 문자열의 위치를 리턴합니다.)
			System.out.println("index = " + index);

			String fileExtension = fileName.substring(index + 1);
			System.out.println("fileExtension = " + fileExtension);
			// 확장자 구하기 끝

			// 새로운 파일명을 저장
			String refileName = "member" + year + month + date + random + "." + fileExtension;
			System.out.println(refileName);

			// 오라클 디비에 저장될 값
			String fileDBName = "/" + year + "-" + month + "-" + date + "/" + refileName;
			System.out.println("fileDBName = " + fileDBName);

			// transferTo(File path) : 업로드한 파일을 매개변수의 경로에 저장합니다.
			UpFile.transferTo(new File(saveFolder + fileDBName));
			// 바뀐 파일명으로 저장
			member.setJoin_pet_picture(fileDBName);
		}
		memberService.insertMember(member);

		response.sendRedirect("zootopia");
	}

	/* 아이디 중복 체크 */
	@RequestMapping(value = "/checkMemberId.nhn")
	public void id_check(@RequestParam("id") String id, HttpServletResponse response) throws Exception {
		int result = memberService.checkMemberId(id);
		PrintWriter out = response.getWriter();

		out.println(result);
	}

	/* 우편검색 폼 */
	@RequestMapping(value = "/zipcode_find.nhn")
	public String zipcode_find() {
		return "zipcode_find";
	}

	/* 우편번호 DB로 부터 검색 */
	@RequestMapping(value = "/zipcode_find_ok.nhn", method = RequestMethod.POST)
	public ModelAndView zipcode_find_ok(@RequestParam String dong, HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		System.out.println(dong);

		List<ZipcodeBean2> zipcodeList = new ArrayList<ZipcodeBean2>();

		// 도을 기준으로 주소를 검색해서 컬렉션에 저장합니다.
		zipcodeList = this.memberService.findZipcode("%" + dong + "%");

		List<ZipcodeBean> zipcodeList2 = new ArrayList<ZipcodeBean>();

		for (int i = 0; i < zipcodeList.size(); i++) {
			ZipcodeBean2 zipcode_addr = zipcodeList.get(i);

			String zipcode = zipcode_addr.getZipcode(); // 우편번호 저장
			String sido = zipcode_addr.getSido(); // 서울시, 경기도 저장
			String gugun = zipcode_addr.getSigungu(); // 구, 군
			String doro = zipcode_addr.getDoro(); // 도로
			String addr = sido + " " + gugun + " " + doro + " "; // 서울시 강남구 강남 대로

			System.out.println(addr);
			ZipcodeBean zip = new ZipcodeBean();
			zip.setZipcode(zipcode);
			zip.setAddr(addr);

			System.out.println(zip.getAddr());
			// 컬렉션에 주소를 저장합니다.
			zipcodeList2.add(zip);

		}

		ModelAndView zipcodeM = new ModelAndView("zipcode_find");
		zipcodeM.addObject("zipcodelist", zipcodeList2);
		zipcodeM.addObject("dong", dong);

		return zipcodeM;

	}

	@RequestMapping(value = "/member_edit.nhn", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView member_edit(HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession();

		String id = (String) session.getAttribute("id");

		MemberBean m = this.memberService.userCheck(id);
		System.out.println("주소 1: " + m.getJoin_address1());
		String join_tel = m.getJoin_tel();
		// java.util 패키지의 StringTokenizer 클래스는 첫번째 전달인자를
		// 두번째 -를 기준으로 문자열을 파싱해 줍니다.
		// 집 전화번호 저장

		StringTokenizer st01 = new StringTokenizer(join_tel, "-");
		String join_tel1 = st01.nextToken(); // 첫번째 (앞자리)
		String join_tel2 = st01.nextToken(); // 두번째 (가운데 자리)
		String join_tel3 = st01.nextToken(); // 세번째 (뒷 자리)

		String join_email = m.getJoin_email();
		// java.util 패키지의 StringTokenizer 클래스는 첫번째 전달인자를
		// 두번째 @를 기준으로 문자열을 파싱해 줍니다.

		StringTokenizer st02 = new StringTokenizer(join_email, "@");
		String join_mailid = st02.nextToken();
		String join_maildomain = st02.nextToken();

		//String join_hospital_tel = m.getJoin_hospital_tel();
		//StringTokenizer st03 = new StringTokenizer(join_hospital_tel, "-");
		//String join_hospital_tel1 = st03.nextToken();
		//String join_hospital_tel2 = st03.nextToken();
		//String join_hospital_tel3 = st03.nextToken();

		String join_birthday = m.getJoin_birthday();
		StringTokenizer st04 = new StringTokenizer(join_birthday, "-");
		String join_year = st04.nextToken();
		String join_month = st04.nextToken();
		String join_day = st04.nextToken();

		ModelAndView mv = new ModelAndView("member_edit");
		mv.addObject("m", m);
		mv.addObject("join_tel1", join_tel1);
		mv.addObject("join_tel2", join_tel2);
		mv.addObject("join_tel3", join_tel3);

		mv.addObject("join_mailid", join_mailid);
		mv.addObject("join_maildomain", join_maildomain);

		//mv.addObject("join_hospital_tel1", join_hospital_tel1);
		//mv.addObject("join_hospital_tel2", join_hospital_tel2);
		//mv.addObject("join_hospital_tel3", join_hospital_tel3);

		mv.addObject("join_year", join_year);
		mv.addObject("join_month", join_month);
		mv.addObject("join_day", join_day);


		return mv;

	}

	@RequestMapping(value = "/member_edit_ok.nhn", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView member_edit_ok(ModelAndView mv, HttpServletRequest request, MemberBean member) throws Exception {
		HttpSession session = request.getSession();

		String id = (String) session.getAttribute("id");

		String join_tel = member.getJoin_tel1() + "-" + member.getJoin_tel2() + "-" + member.getJoin_tel3();

		// 메일아이디 : member.getJoin_mailid()
		// 메일도메인 : member. getJoin_maildomain()

		String join_email = member.getJoin_mailid() + "@" + member.getJoin_maildomain(); // 메일 주소
		member.setJoin_tel(join_tel);
		member.setJoin_email(join_email);

		MultipartFile UpFile = member.getJoin_profile();

		if (!UpFile.isEmpty()) { // 첨부한 이전 파일이 있다면
			File DelFile = new File(saveFolder + member.getJoin_pet_original());
			if (DelFile.exists()) {
				DelFile.delete();
			}

			String fileName = UpFile.getOriginalFilename(); // 이진 파일명 저장

			member.setJoin_pet_original(fileName);
			System.out.println(member.getJoin_pet_original());

			Calendar c = Calendar.getInstance(); // 추상클래스로서 년월일 시분초 반환
			int year = c.get(Calendar.YEAR); // 년도값
			int month = c.get(Calendar.MONTH) + 1; // 월 값 . +1일 한 이유는 1월이 0 이라서
			int date = c.get(Calendar.DATE);

			String homedir = saveFolder + "/" + year + "-" + month + "-" + date; // 새로운 폴더 저장
			File path1 = new File(homedir);
			if (!path1.exists()) { // 새로운 폴더가 존재 하지 않으면
				path1.mkdir();// 새로운 폴더를 생성
			}

			Random r = new Random();
			int random = r.nextInt(100000000);

			// 확장자 구하기 시작
			int index = fileName.lastIndexOf(".");
			// 문자열에서 특정 문자열의 위치 값(index)를 반환합니다.
			// indexOf가 처음 발견되는 문자열에 대한 index를 반환하는 반면,
			// lastIndexOf는 마지막으로 발견되는 문자열의 index를 반환합니다.
			// (파일명에 점이 여러개 있을 경우 맨 마지막에 발견디는 문자열의 위치를 리턴합니다.)
			System.out.println("index = " + index);

			String fileExtension = fileName.substring(index + 1);
			System.out.println("fileExtension = " + fileExtension);
			// 확장자 구하기 끝

			// 새로운 파일명을 저장
			String refileName = "member" + year + month + date + random + "." + fileExtension;
			System.out.println(refileName);

			// 오라클 디비에 저장될 값
			String fileDBName = "/" + year + "-" + month + "-" + date + "/" + refileName;
			System.out.println("fileDBName = " + fileDBName);

			// transferTo(File path) : 업로드한 파일을 매개변수의 경로에 저장합니다.
			UpFile.transferTo(new File(saveFolder + fileDBName));
			// 바뀐 파일명으로 저장
			member.setJoin_pet_picture(fileDBName);
		} else if (member.getJoin_pet_original() != null) { // 변경하지 않았지만 이전파일 그대로인 경우
			// 데이터베이스에 있는 내용 그대로 적용합니다.
			member.setJoin_pet_picture(member.getJoin_pet_picture());
		} else if (member.getJoin_pet_original() == null) { // 파일 제거 선택한 경우
			File DelFile = new File(saveFolder + member.getJoin_pet_picture());
			if (DelFile.exists()) { // 기존 파일이 존재하면
				DelFile.delete(); // 기존 이전파일 삭제
			}
		}
		memberService.updateMember(member);
		
		mv.setViewName("main");
		return mv;
	}

	/* 로그아웃 폼 */
	@RequestMapping(value = "/member_logout.nhn")
	public String member_logout(HttpSession session) {
		session.invalidate();
		
		return "main";
		// member 폴더의 member_logout.jsp 뷰 페이지 발생
	}
	/*
	 * servlet-context.xml에서 지정했기 때문에 아래의 문장을 생략 가능합니다. <view-controller
	 * path="/pwd_find.nhn" view-name="member/pwd_find"/>
	 */
	
	/* 비밀번호변경 폼 */
	@RequestMapping(value = "/pwd_change.nhn")
	public String pwd_change() {
		return "pwd_change";
	}
	
	@RequestMapping(value = "/pwd_change_ok.nhn", method=RequestMethod.POST)
	public void pwd_change_ok(MemberBean member, HttpServletRequest request) throws Exception {
		String join_id = member.getJoin_id();
		String join_password = request.getParameter("join_password");
		String join_password2 = request.getParameter("join_password2");
		System.out.println(join_id);
		System.out.println(join_password);
		System.out.println(join_password2);
		
		member.setJoin_id(join_id);
		member.setJoin_password(join_password);
		member.setJoin_password2(join_password2);
		


		memberService.changepwd(member);

	}
	

	/* 비번찾기 폼 */
	@RequestMapping(value = "/pwd_find.nhn")
	public String pwd_find() {
		return "pwd_find";
	}

	@RequestMapping(value = "/pwd_find_ok.nhn", method = RequestMethod.POST)
	public ModelAndView pwd_find_ok(HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		String id = request.getParameter("join_id").trim();
		String name = request.getParameter("join_name").trim();

		Map<String,Object> pm = new HashMap<String,Object>();
		pm.put("id", id);
		pm.put("name", name);

		MemberBean member = this.memberService.findpwd(pm);

		if (member == null) {
			out.println("<script>");
			out.println("alert('회원아이디와 이름이 맞지 않습니다!')");
			out.println("location.href='./zootopia'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('비밀번호는 "+member.getJoin_password()+" 입니다.')");
			out.println("location.href='./zootopia'");
			out.println("</script>");
		}
		return null;
	}
}
