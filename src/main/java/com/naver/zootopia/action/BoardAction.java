package com.naver.zootopia.action;

import java.io.File;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.naver.zootopia.DAO.PetBoardService;
import com.naver.zootopia.model.BoardBean;
import com.naver.zootopia.model.BoardReplyBean;
import com.naver.zootopia.model.ImageBean;
import com.naver.zootopia.model.ReportBean;

@Controller
public class BoardAction {

	@Autowired
	private PetBoardService service;
	
	private String saveFolder = "C:\\Program Files\\Apache Software Foundation\\Tomcat 8.5\\webapps\\zootopia\\resources\\upload";
	
	/*private String saveFolder ="D:\\workspace-sts\\final\\src\\main\\webapp\\resources\\upload";*/
	//단순 페이지 이동
	//메인 페이지 이동
	@RequestMapping(value="/zootopia")
	public String load_mainpage(
			HttpSession session) {
		//임시 아이디 session에 더해줌
		
		return "main";
	}
	//일상 게시판 글쓰기 뷰
	@RequestMapping(value="/board_pet_writeView.zoo",method=RequestMethod.POST)
	public ModelAndView write_board_pet(
			HttpSession session,
			@RequestParam(value="page",defaultValue="1") int page,
			@RequestParam(value="type")int type
			) {
		ModelAndView mv = new ModelAndView();
		
		String id = (String)session.getAttribute("id");
		mv.addObject("type",type);
		mv.addObject("join_id", id);
		mv.addObject("page",page);
		mv.setViewName("board/board_pet_write");
		return mv;
	}
	
	//일상게시판 뷰
	@RequestMapping(value="/board_pet.zoo",method= {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ModelAndView load_board_pet(
			@RequestParam(value="page",defaultValue="1") int page,
			@RequestParam(value="type")int type,
			@RequestParam(value="cate",defaultValue="none")String cate,
			@RequestParam(value="ajax",defaultValue="none")String ajax,
			@RequestParam(value="search_field",defaultValue="none")String search_field,
			@RequestParam(value="search_name",defaultValue="none")String search_name,
			@RequestParam(value="doNotAjax",defaultValue="none")String doNotAjax,
			HttpServletRequest request,
			HttpSession session) throws Exception {
		System.out.println("일상 게시판 진입");
		System.out.println("page : "+page);
		System.out.println("type(게시판 종류) : "+type);
		System.out.println("cate(카테고리/dog/cat/etc) : "+cate);
		System.out.println("ajax 실행 여부 : "+ajax);
		System.out.println("search_field(검색 분류) : "+search_field);
		System.out.println("search_name(검색 내용) : "+search_name);
		System.out.println("-----------------------------------");
		
		
		ModelAndView mv = new ModelAndView();
		int limit = 10; 
		
		if(session.getAttribute("limit")!=null)
			limit = Integer.parseInt(session.getAttribute("limit").toString());
		if(request.getParameter("limit")!=null) {
			limit = Integer.parseInt(request.getParameter("limit"));
			session.setAttribute("limit", limit);
		}
		
		
		Map<String,Object> map2 = new HashMap<String,Object>();
		map2.put("cate", cate);
		map2.put("search_field", search_field);
		map2.put("search_name", "%"+search_name+"%");
		map2.put("type", type);
		int listcount = service.getBoardPetListCount(map2);
		
		int maxpage=(listcount+limit-1)/limit;
		int startpage=((page-1)/5)*5+1;
		int endpage=startpage+5-1;
		if(endpage>maxpage)
			endpage=maxpage;
		if(page>endpage)
			page=endpage;
			
			System.out.println("-----------------");
				System.out.println("listcount : "+listcount);
				System.out.println("maxpage : "+maxpage);
				System.out.println("startpage : "+startpage);
				System.out.println("endpage : "+endpage);
				System.out.println("page : "+page);
				System.out.println("limit : "+limit);
			System.out.println("-----------------");
			
		
			
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("page", page);
		map.put("limit", limit);
		map.put("board_type", type);//어느 게시판인지 선택
		map.put("cate", cate);
		map.put("search_field", search_field);
		map.put("search_name", "%"+search_name+"%");
		List<BoardBean> board_pet_list = new ArrayList<BoardBean>();				
		board_pet_list = service.read_board_pet(map);

		
		
		//해당 게시글에 리플이 몇개 달렸는지 확인하자
		Map<Integer,Integer> reply_count = new HashMap<Integer,Integer>();
		for(int i=0;i<board_pet_list.size();i++) {
			int board_num = board_pet_list.get(i).getBoard_num();
			reply_count.put(board_num, service.getBoardReplyListCount(board_num));
			
		}
		
		
		
		
		mv.addObject("reply_count",reply_count);
		mv.addObject("type",type);
		mv.addObject("page",page);
		mv.addObject("maxpage",maxpage);
		mv.addObject("startpage",startpage);
		mv.addObject("endpage",endpage);
		mv.addObject("board_pet_list", board_pet_list);
		mv.addObject("listcount",listcount);
		mv.addObject("limit",limit);
		mv.addObject("cate",cate);
		mv.addObject("search_field",search_field);
		mv.addObject("search_name",search_name);
		//카테고리 선택하거나 페이징 할시 ajax 사용할 페이지로 이동
		if(doNotAjax.equals("doNotAjax")) {
			System.out.println("no-ajax_boar_pet");
			mv.setViewName("board/board_pet");
		}else if(!cate.equals("none")||ajax.equals("paging")||ajax.equals("search")&&!doNotAjax.equals("doNotAjax")) {
			System.out.println("board_pet ajax");
			mv.setViewName("board/ajax_board_pet");
		}
		return mv;
				
	}
	
	//일상 게시판 수정하기 뷰
	@RequestMapping(value="modify_board_view")
	public ModelAndView modify_board_view(
			@RequestParam(value="board_num")int board_num,
			@RequestParam(value="page",defaultValue="1")int page,
			@RequestParam(value="type")int type
			) throws Exception {
		ModelAndView mv = new ModelAndView();
		BoardBean boardBean = service.read_board_cont(board_num);
		List<ImageBean> imageBean = service.read_image(board_num);
		mv.addObject("boardBean",boardBean);
		mv.addObject("board_num",board_num);
		mv.addObject("page",page);
		mv.addObject("imageBean",imageBean);
		mv.addObject("type",type);
		mv.setViewName("board/board_pet_modify");
		
		return mv;
	}
	//일상 게시글 수정하기
	@RequestMapping(value="/board_pet_modify_ok.zoo")
	public ModelAndView board_pet_modify(
			BoardBean boardBean,
			@RequestParam(value="page")int page,
			@RequestParam(value="type")int type,
			HttpSession session) throws Exception {
		
		System.out.println("board_cate : "+boardBean.getBoard_cate());
		int board_num = boardBean.getBoard_num();
		//이미지를 전부 삭제 했으면 check_image 0 으로 바꿔주어야 한다.
		if(service.get_imageListCount(board_num)==0)
			service.change_check_image(board_num);
			
	List<MultipartFile> uploadfile = boardBean.getUploadfile();
		
		ImageBean imageBean = new ImageBean();
		
		
		String id = (String)session.getAttribute("id");
		boardBean.setJoin_id(id);
		if(!uploadfile.get(0).isEmpty()){
			boardBean.setCheck_image(1);
		}else{
			boardBean.setCheck_image(0);
		}
		service.update_board(boardBean);
		
		System.out.println("uploadfile.size() : "+uploadfile.size());
		
		
		if(!uploadfile.get(0).isEmpty()) {
			for(MultipartFile files:uploadfile) {
				System.out.println("파일 이름 :"+files);
				String fileName = files.getOriginalFilename();
				
				imageBean.setBoard_num(boardBean.getBoard_num());
				imageBean.setJoin_id(id);
				imageBean.setBoard_original(fileName);
				
				Calendar c = Calendar.getInstance();
				int year = c.get(Calendar.YEAR);
				int month = c.get(Calendar.MONTH)+1;
				int date = c.get(Calendar.DATE);
				String homedir = saveFolder+"/"+year+"-"+month+"-"+date;
				
				File path = new File(homedir);
				if(!path.exists()) {
					path.mkdir();
				}
				
				Random r = new Random();
				int random = r.nextInt(1000000);
				
				int index = fileName.lastIndexOf(".");
				
				String fileExtension=fileName.substring(index+1);
				
				String refileName="board_pet"+year+month+date+random+"."+fileExtension;
				
				String fileDBName = "/"+year+"-"+month+"-"+date+"/"+refileName;
				
				files.transferTo(new File(saveFolder+fileDBName));
				System.out.println("시작");
				imageBean.setBoard_DBfile(fileDBName);
				System.out.println("끝");
				service.image_upload(imageBean);
			}
		
		
		
		}
		
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("board_num",board_num);
		mv.addObject("page",page);
		mv.addObject("type",type);
		mv.setViewName("redirect:board_pet_content.zoo");
		return mv;
	}
	
	//일상게시판 글쓰기
	@RequestMapping(value="/board_pet_write_ok.zoo",method=RequestMethod.POST)
	public ModelAndView write_board_pet_ok(
			BoardBean boardBean,
			HttpSession session,
			@RequestParam(value="page",defaultValue="1")int page
			) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		List<MultipartFile> uploadfile = boardBean.getUploadfile();
		
		ImageBean imageBean = new ImageBean();
		
		
		String id = (String)session.getAttribute("id");
		boardBean.setJoin_id(id);
		if(!uploadfile.get(0).isEmpty()){
			boardBean.setCheck_image(1);
		}else{
			boardBean.setCheck_image(0);
		}
		service.board_pet_write(boardBean);
		
		System.out.println("uploadfile.size() : "+uploadfile.size());
		
		
		if(!uploadfile.get(0).isEmpty()) {
			for(MultipartFile files:uploadfile) {
				System.out.println("파일 이름 :"+files);
				String fileName = files.getOriginalFilename();
				
				imageBean.setBoard_num(boardBean.getBoard_num());
				imageBean.setJoin_id(id);
				imageBean.setBoard_original(fileName);
				
				Calendar c = Calendar.getInstance();
				int year = c.get(Calendar.YEAR);
				int month = c.get(Calendar.MONTH)+1;
				int date = c.get(Calendar.DATE);
				String homedir = saveFolder+"/"+year+"-"+month+"-"+date;
				
				File path = new File(homedir);
				if(!path.exists()) {
					path.mkdir();
				}
				
				Random r = new Random();
				int random = r.nextInt(1000000);
				
				int index = fileName.lastIndexOf(".");
				
				String fileExtension=fileName.substring(index+1);
				
				String refileName="board_pet"+year+month+date+random+"."+fileExtension;
				
				String fileDBName = "/"+year+"-"+month+"-"+date+"/"+refileName;
				
				files.transferTo(new File(saveFolder+fileDBName));
				System.out.println("시작");
				imageBean.setBoard_DBfile(fileDBName);
				System.out.println("끝");
				service.image_upload(imageBean);
			}
			
		}
		
		
		//*내가 쓴글의 board_num을 가져오기*//
		int board_num = service.find_latest_board_num(id);
		mv.addObject("board_num",board_num);
		mv.addObject("page",page);
		mv.addObject("type",boardBean.getBoard_type());
		mv.setViewName("redirect:board_pet_content.zoo");
		return mv;
	}
	//일상 게시글 상세 보기
	@RequestMapping(value="/board_pet_content.zoo")
	public ModelAndView load_board_pet_content(
			@RequestParam(value="board_num")int board_num,
			@RequestParam(value="page")int page,
			@RequestParam(value="reply_page",defaultValue="1")int reply_page,
			@RequestParam(value="ajax",defaultValue="none")String ajax,
			@RequestParam(value="type",defaultValue="0") int type,
			@RequestParam(value="cate",defaultValue="none")String cate,
			@RequestParam(value="fav",defaultValue="none")String fav,
			@RequestParam(value="search_field",defaultValue="none")String search_field,
			@RequestParam(value="search_name",defaultValue="none")String search_name,
			@RequestParam(value="manage",defaultValue="none")String manage,
			HttpSession session) throws Exception {
		System.out.println("-----------게시글 상세보기------------");
		System.out.println("board_num : " + board_num);
		System.out.println("page : "+page);
		System.out.println("reply_page : "+reply_page);
		System.out.println("ajax : "+ajax);
		System.out.println("type : "+type);
		System.out.println("cate :" +cate);
		System.out.println("fav : "+fav);
		System.out.println("search_field : "+search_field);
		System.out.println("search_name : "+search_name);
		System.out.println("----------------------------------");
		BoardBean boardBean = service.read_board_cont(board_num);
		ModelAndView mv = new ModelAndView();
		//조회수 증가 시키기
		service.update_readcount(board_num);
		
		/*이미지 파일  존재하면 가져오기*/
		List<ImageBean> imageBean=service.read_image(board_num);
		if(imageBean.size()>0) {
			System.out.println("이미지 파일 존재");
			mv.addObject("imageBean",imageBean);
		}
		/*즐겨 찾기 및 좋아요 여부 확인하기 */
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("join_id", session.getAttribute("id"));
		map.put("board_num",board_num);
		
		int check_like = service.check_like(map);
		int check_favorite = service.check_favorite(map);
		System.out.println(check_like);
		if(check_like==1)
			mv.addObject("like","like");
		if(check_like==0)
			mv.addObject("like","none");
		
		if(check_favorite==1)
			mv.addObject("favorite","favorite");
		if(check_favorite==0)
			mv.addObject("favorite","none");
		/*해당 게시글 좋아요가 총 몇개인지 확인*/
		int like_num = service.how_many_like(board_num);
		
		
		
		/*댓글도 보여줘야 한다.*/
		Map<String,Integer> read_reply_map = new HashMap<String,Integer>();
			read_reply_map.put("b_reply_ref", board_num);
			read_reply_map.put("reply_page", reply_page);
		List<BoardReplyBean> boardreplyBean = service.read_reply(read_reply_map);
		
		int reply_listcount = service.getBoardReplyListCount(board_num);
		int reply_maxpage=(reply_listcount+10-1)/10;
		int reply_startpage=((reply_page-1)/5)*5+1;
		int reply_endpage=reply_startpage+5-1;
		System.out.println("reply_listcount = "+reply_listcount);
		System.out.println("check 1 : reply_page = "+reply_page);
		System.out.println("reply_maxpage = "+reply_maxpage);
		System.out.println("reply_startpage = "+reply_startpage);
		System.out.println("reply_endpage = "+reply_endpage);
		
		if(reply_endpage>reply_maxpage&&reply_listcount!=0) 
			reply_endpage=reply_maxpage;
			
		if(reply_page>reply_endpage)
			reply_page=reply_endpage;
		
		System.out.println("check 2 : reply_page = "+reply_page);
		
		mv.addObject("boardreplyBean",boardreplyBean);
		mv.addObject("page",page);
		mv.addObject("reply_listcount",reply_listcount);
		mv.addObject("reply_maxpage",reply_maxpage);
		mv.addObject("reply_startpage",reply_startpage);
		mv.addObject("reply_endpage",reply_endpage);
		mv.addObject("reply_page",reply_page);
		System.out.println("reply_page : "+reply_page);
		mv.addObject("board_num",board_num);
		mv.addObject("boardBean",boardBean);
		mv.addObject("type",type);
		mv.addObject("like_num",like_num);
		mv.addObject("cate",cate);
		mv.addObject("search_field",search_field);
		mv.addObject("search_name",search_name);
		mv.addObject("manage",manage);
		if(fav.equals("fav"))
			mv.addObject("fav",fav);
		if(ajax.equals("ajax")) {
			mv.setViewName("board/ajax_reply_list");
		}else {
			mv.setViewName("board/board_pet_content");
		}
		return mv;
	}
	//일상 게시글 검색하기
	@RequestMapping(value="/board_pet_search.zoo")
	public String find_board_pet() {
		return "";
	}

	//게시글 삭제하기
	@RequestMapping(value="/board_delete.zoo")
	public String board_delete(
			@RequestParam(value="board_num")int board_num,
			@RequestParam(value="page")int page,
			@RequestParam(value="type",defaultValue="1")int type,
			@RequestParam(value="manage",defaultValue="none")String manage) throws Exception {
		
		//저장된 이미지 파일 삭제 하기
		List<ImageBean> imageBean = service.read_image(board_num);
		for(int i=0;i<imageBean.size();i++) {
			ImageBean bean = imageBean.get(i);
			File file = new File(saveFolder+bean.getBoard_DBfile());	
			System.out.println(saveFolder+bean.getBoard_DBfile());
			file.delete();		
		}
		service.delete_reply(board_num);//fk로 참조하고 있기 때문에 리플 삭제 후
		service.delete_image(board_num);//이미지 삭제
		service.delete_fav(board_num);
		service.delete_up(board_num);//업 게시판 삭제
		service.delete_board(board_num);//원본 글 삭제
		
		if(manage.equals("manage")) {
			service.delete_report(board_num);//개시글 삭제하면 경고도 삭제하기
			return "redirect:/admin_board.zoo?page="+page;
		}
		return "redirect:/board_pet.zoo?page="+page+"&type="+type;
	}
	
	//게시글 답글 수정하기
	@RequestMapping(value="reply_modify.zoo",method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView modify_board_reply(
			BoardReplyBean boardreplyBean) throws Exception {
		service.modify_reply(boardreplyBean);
		BoardReplyBean new_boardreplyBean = service.read_reply_oneBean(boardreplyBean.getB_reply_num());
		System.out.println(new_boardreplyBean.getB_reply_content());
		ModelAndView mv = new ModelAndView();
		mv.addObject("list",new_boardreplyBean);
		mv.setViewName("board/ajax_reply_modify");
		return mv;
	}
	
	//게시글 답글 작성 / 삭제하기
	@RequestMapping(value="reply_delete_write.zoo",method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView delete_board_reply(
			@RequestParam(value="b_reply_content",defaultValue="n")String b_reply_content,
			@RequestParam(value="ajax")String ajax,
			@RequestParam(value="b_reply_num",defaultValue="1")int b_reply_num,
			@RequestParam(value="reply_page",defaultValue="1")int reply_page,
			@RequestParam(value="board_num")int board_num,
			HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		if(ajax.equals("delete")) {
			service.delete_reply_one(b_reply_num);
			System.out.println("삭제");
		}else if(ajax.equals("write")) {
			System.out.println("등록");
			BoardReplyBean boardreplyBean = new BoardReplyBean();
			String id =(String)session.getAttribute("id");
			boardreplyBean.setJoin_id(id);
			boardreplyBean.setB_reply_ref(board_num);
			boardreplyBean.setB_reply_content(b_reply_content);
			service.write_reply(boardreplyBean);	
			System.out.println("등록2");
		}
		

		
		/*댓글도 보여줘야 한다.*/
		Map<String,Integer> read_reply_map = new HashMap<String,Integer>();
		read_reply_map.put("b_reply_ref", board_num);
		read_reply_map.put("reply_page", reply_page);
		List<BoardReplyBean> boardreplyBean = service.read_reply(read_reply_map);
		
		int reply_listcount = service.getBoardReplyListCount(board_num);
		int reply_maxpage=(reply_listcount+10-1)/10;
		int reply_startpage=((reply_page-1)/5)*5+1;
		int reply_endpage=reply_startpage+5-1;

		if(reply_endpage>reply_maxpage)
			reply_endpage=reply_maxpage;
		if(reply_page>reply_endpage)
			reply_page=reply_endpage;

		mv.addObject("boardreplyBean",boardreplyBean);	
		mv.addObject("reply_listcount",reply_listcount);
		mv.addObject("reply_maxpage",reply_maxpage);
		mv.addObject("reply_startpage",reply_startpage);
		mv.addObject("reply_endpage",reply_endpage);
		mv.addObject("reply_page",reply_page);	
		mv.addObject("board_num",board_num);
			
		mv.setViewName("board/ajax_reply_delete_write");
		return mv;	
	}

	//게시글 수정 페이지이에서 이미지 개별 삭제하기
	@RequestMapping(value="delete_image_sep.zoo",method=RequestMethod.POST)
	public void modifyPage_deleteImage(
			@RequestParam(value="image_num")int image_num) throws Exception {
	
		service.delete_image_sep(image_num);

	}
	//즐겨찾기 및 좋아요 기능
	@RequestMapping(value="check_favorite_like.zoo")
	@ResponseBody
	public int check_favorite_like(
			@RequestParam(value="favorite",defaultValue="DoNotRun")String favorite,
			@RequestParam(value="like",defaultValue="DoNotRun")String like,
			@RequestParam(value="board_num")int board_num,
			HttpSession session) throws Exception {
		
	
		String join_id = (String)session.getAttribute("id");
		Map<String,Object> map = new HashMap<String,Object>();	
		map.put("board_num", board_num);
		map.put("join_id", join_id);
		
		
		System.out.println("---------------");
		System.out.println("favorite : "+favorite);
		System.out.println("like : "+like);
		int result = 0;
		//즐겨찾기 추가
		if(!favorite.equals("DoNotRun")) {
			switch(favorite) {
			case "favorite" :
				System.out.println("즐겨찾기 추가");
				service.add_favorite(map);
				System.out.println("즐겨찾기 저장 여부 확인 run");
				result = service.check_favorite(map);
				break;
				
			case "none" :
				System.out.println("즐겨찾기 해제");
				service.remove_favorite(map);
				System.out.println("즐겨찾기 저장 여부 확인 run");
				result = service.check_favorite(map);
				break;
				
			
		}
			
		}
	
		
		if(!like.equals("DoNotRun")) {
			switch(like) {
			case "like" :
				System.out.println("좋아요 추가");
				service.add_like(map);
				System.out.println("좋아요 저장 여부 확인 run");
				result = service.check_like(map);
				break;
				
			case "none" :
				System.out.println("좋아요 해제");
				service.remove_like(map);
				System.out.println("좋아요 저장 여부 확인 run");
				result = service.check_like(map);
				break;
			
		}
		
			
		}
		
		System.out.println("return int result : "+result);
		return result;
		
		
	}
	
	//신고 했는지 여부 확인하기
	@RequestMapping(value="check_report.zoo")
	@ResponseBody
	public int check_report(
			@RequestParam(value="report_type")String report_type,
			@RequestParam(value="num")int num,
			HttpSession session) throws Exception {
		

		String join_id = (String)session.getAttribute("id");
		int result=0;
		Map<String,Object> map = new HashMap<String,Object>();
		if(report_type.equals("board")) {
			map.put("report_type", "board");
			map.put("report_board_ref", num);
			map.put("join_id", join_id);
			result = service.check_report(map);
		}else if(report_type.equals("reply")) {
			map.put("report_type", "reply");
			map.put("report_reply_ref", num);
			map.put("join_id", join_id);
			result = service.check_report(map);
		}
		
		System.out.println("----------신고 여부 확인 하기--------------");
		System.out.println("report_type : "+report_type );
		System.out.println("num : "+num);
		System.out.println("result : "+result);
		System.out.println("------------------------------------");
		return result;
	}
	//신고버튼 - >신고하기 view 이동
	@RequestMapping(value="report_view.zoo",method=RequestMethod.POST)
	public ModelAndView report_view(
			@RequestParam(value="report_type")String report_type,
			@RequestParam(value="num")int num,
			@RequestParam(value="board_num")int board_num,
			@RequestParam(value="page")int page,
			@RequestParam(value="type")int type) {
		ModelAndView mv = new ModelAndView();
		System.out.println("신고하기 view 이동");
		System.out.println("report_Type : "+report_type);
		System.out.println("report_type : "+report_type);
		System.out.println("num : "+num);

		mv.addObject("report_type",report_type);
		mv.addObject("num",num);
		mv.addObject("board_num",board_num);
		mv.addObject("page",page);
		mv.addObject("type",type);
		mv.setViewName("board/report_page");
		return mv;
	}
	
	//신고 하기
	@RequestMapping(value="report.zoo",method= {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public ModelAndView report(
			@RequestParam(value="type")int type,
			@RequestParam(value="page",defaultValue="1")int page,
			@RequestParam(value="report_type")String report_type,
			@RequestParam(value="board_num",defaultValue="0")int board_num,
			@RequestParam(value="num",defaultValue="0")int num,
			@RequestParam(value="reason")String reason,
			HttpSession session) throws Exception{
		String join_id = (String)session.getAttribute("id");
		ReportBean reportBean = new ReportBean();
		reportBean.setJoin_id(join_id);
		reportBean.setReport_reason(reason);
		reportBean.setReport_state("temporary");
		
		
		//처음 신고하면 무조건 임시보관 처리 후에 -> 블락 or 삭제 처리 
		if(report_type.equals("board")) {
			reportBean.setReport_board_ref(num);
			reportBean.setReport_reply_ref(0);
			reportBean.setReport_type("board");			
			service.report(reportBean);
			
			//신고글 갯수 확인하여 10개 이상이면 신고글로 분류하기
			if(service.count_report_board(num)>=10) {
				System.out.println(num+"번 게시글 임시블락 처리");
				service.temporary_block_board(num);
			}
		}else if(report_type.equals("reply")) {
			reportBean.setReport_board_ref(0);
			reportBean.setReport_reply_ref(num);
			reportBean.setReport_type("reply");
			service.report(reportBean);
			//신고글 갯수 확인하여 10개 이상이면 신고리플로 분류하기
			if(service.count_report_reply(num)>=10) {
				System.out.println(num+"번 리플 임시블락 처리");
				service.temporary_block_reply(num);
			}
		}
		System.out.println("---------신고하기-----------");
		System.out.println("report_type : "+report_type);
		System.out.println("board_num : " + board_num);
		System.out.println("num : " + num);
		System.out.println("reason : "+reason);
		System.out.println("--------------------------");
		
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("board_num",board_num);
		mv.addObject("page",page);
		mv.addObject("type",type);
		mv.setViewName("redirect:/board_pet_content.zoo");
		return mv;
	}
	
	//즐겨 찾기 한 게시글 들 가져오기
	@RequestMapping(value="my_board.zoo",method= {RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public ModelAndView board_myPage(
			@RequestParam(value="fav_page",defaultValue="1")int fav_page,		
			@RequestParam(value="fav_type", defaultValue="0")int fav_type,			
			@RequestParam(value="fav_cate",defaultValue="none")String fav_cate,			
			@RequestParam(value="fav_ajax", defaultValue="none")String fav_ajax,			
			@RequestParam(value="fav_search_field", defaultValue="none")String fav_search_field,			
			@RequestParam(value="fav_search_name", defaultValue="none")String fav_search_name,
			HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		String join_id =(String)session.getAttribute("id");
		//page, type, cate,search_field,search_name,ajax
			
		System.out.println("-----------------------------------");
		System.out.println("마이 게시판 모아보기 진입(즐겨찾기)");
		System.out.println("fav_page : "+fav_page);
		System.out.println("fav_type(게시판 종류) : "+fav_type);
		System.out.println("fav_cate(카테고리/dog/cat/etc) : "+fav_cate);
		System.out.println("fav_ajax 실행 여부 : "+fav_ajax);
		System.out.println("fav_search_field(검색 분류) : "+fav_search_field);
		System.out.println("fav_search_name(검색 내용) : "+fav_search_name);
		System.out.println("-----------------------------------");
		int limit = 10; //한페이지 에서 보여줄 개시글 갯수  즐겨찾기와 좋아요한 게시물 둘다 10개로 고정
		
		//즐겨찾기 start
		//리스트로 즐겨찾기한 게시글 번호 가져오기
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("fav_page", fav_page);
		map.put("fav_limit", limit);
		map.put("fav_type", fav_type);
		map.put("fav_cate", fav_cate);
		map.put("fav_search_field", fav_search_field);
		map.put("fav_search_name", "%"+fav_search_name+"%");
		map.put("join_id", join_id);
		map.put("page", fav_page);
		map.put("limit",limit);
		System.out.println("목록 가져오기 시작");
		List<BoardBean> fav_boardBean = service.get_favorite_board(map); //즐겨찾기한 게시글 목록
		System.out.println("목록 가져오기 종료\n 총 개수 가져오기 시작");
		
		int fav_boardBean_count = service.get_favorite_boardCount(map); //즐겨찾기한 게시글 총 개수
		System.out.println("총 개수 가져오기 완료");
		//해당 게시글에 리플이 몇개 달렸는지 확인하자
		Map<Integer,Integer> reply_count = new HashMap<Integer,Integer>();
		for(int i=0;i<fav_boardBean.size();i++) {
			int board_num = fav_boardBean.get(i).getBoard_num();
			reply_count.put(board_num, service.getBoardReplyListCount(board_num));
			
		}
		//즐겨찾기 작업 end
		
		int maxpage=(fav_boardBean_count+limit-1)/limit;
		int startpage=((fav_page-1)/5)*5+1;
		int endpage=startpage+5-1;
		if(endpage>maxpage)
			endpage = maxpage;
		if(fav_page>endpage)
			fav_page=endpage;
		
		mv.addObject("fav_page",fav_page);
		mv.addObject("maxpage",maxpage);
		mv.addObject("startpage",startpage);
		mv.addObject("endpage",endpage);
		mv.addObject("fav_listcount",fav_boardBean_count);
		mv.addObject("fav_page",fav_page);
		mv.addObject("fav_limit",limit);
		mv.addObject("fav_type",fav_type);
		mv.addObject("fav_cate",fav_cate);
		mv.addObject("fav_search_field",fav_search_field);
		mv.addObject("fav_search_name",fav_search_name);
		mv.addObject("join_id",join_id);
		mv.addObject("fav_list",fav_boardBean);
		mv.addObject("fav_reply_count",reply_count);
		
		
		if(!fav_ajax.equals("none")) {
			mv.setViewName("board/ajax_board_mypage");		
		}else {
			mv.setViewName("board/board_mypage");
		}
		return mv;
	}

	//관리자로 접속시(ID=ADMIN) 경고처리된 게시글 보기
	@RequestMapping(value="admin_board.zoo")
	public ModelAndView admin_manage_board(
			@RequestParam(value="page",defaultValue="1")int page) throws Exception {
		ModelAndView mv = new ModelAndView();
		System.out.println("관리자 게시판 관리페이지 접속");
		int limit = 10;
		//경고 글 총 리스트 가져오기
		//1페이지당 보여줄 글 수 10개
		int listCount=service.board_warn_listCount();
		System.out.println("총 경고글 수 : "+service.board_warn_listCount());
		Map<String,Object> map= new HashMap<String,Object>();
		map.put("limit", limit);
		map.put("page", page);
		List<BoardBean> list = new ArrayList<BoardBean>();
		list = service.get_Warn_Board(map);
		int maxpage=(listCount+limit-1)/limit;
		int startpage=((page-1)/5)*5+1;
		int endpage=startpage+5-1;
		if(endpage>maxpage)
			endpage=maxpage;
		if(page>endpage)
			page=endpage;
			
		//해당 게시글에 신고가 몇개인지 확인하자
		Map<Integer,Integer> warn_count = new HashMap<Integer,Integer>();
		for(int i=0;i<list.size();i++) {
			int board_num = list.get(i).getBoard_num();
			warn_count.put(board_num, service.getBoardWarnCount(board_num));
			System.out.println("board_num : "+board_num);
			System.out.println("경고 수 : "+service.getBoardWarnCount(board_num));
			
		}
		
		Set<Integer> set=warn_count.keySet();
		for(int a : set)
			System.out.println(warn_count.get(a));
		
		
		mv.addObject("warn_count",warn_count);
		mv.addObject("maxpage",maxpage);
		mv.addObject("startpage",startpage);
		mv.addObject("endpage",endpage);
		mv.addObject("listcount",listCount);
		mv.addObject("page",page);
		mv.addObject("managelist",list);
		mv.setViewName("board/board_manage");
		return mv;
	}

	//경고 풀어주기
	@RequestMapping(value="report_rollback.zoo")
	public ModelAndView report_manage(
			@RequestParam(value="board_num")int board_num) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		//게시물 경고 풀기 1 -> 0으로 바꾸고
		//리포트 비워주고 
	
		service.delete_report(board_num);
		service.change_board_state(board_num);
		
		
		mv.setViewName("board/board_manage");
		
		
		
		
		
		return mv;
	} 
}
