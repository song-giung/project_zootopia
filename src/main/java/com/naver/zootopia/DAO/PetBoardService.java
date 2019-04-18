package com.naver.zootopia.DAO;

import java.util.List;
import java.util.Map;

import com.naver.zootopia.model.BoardBean;
import com.naver.zootopia.model.BoardReplyBean;
import com.naver.zootopia.model.ImageBean;
import com.naver.zootopia.model.ReportBean;

public interface PetBoardService {
	//게시글 쓰기
	public void board_pet_write(BoardBean boardbean) throws Exception;
	
	//답변글 쓰기
	public void replay_write(BoardReplyBean replybean) throws Exception;
	
	//게시글 목록 읽어오기
	public List<BoardBean> read_board_pet(Map<String,Object> map) throws Exception;
	//게시글 갯수 가져오기
	public int getBoardPetListCount(Map<String,Object> map) throws Exception;
	//게시글 내용 가져오기
	public BoardBean read_board_cont(int board_num) throws Exception;
	//게시글 내용보기에서 즐겨찾기 했는지 확인하기
	public int check_favorite(Map<String,Object> map) throws Exception;
	//게시글 좋아요 싫어요 확인하기
	public int check_like(Map<String,Object> map) throws Exception;
	//게시글 즐겨찾기 하기
	public void add_favorite(Map<String,Object> map)throws Exception;
	//게시글 즐겨찾기 해제하기
	public void remove_favorite(Map<String,Object> map)throws Exception;
	//게시글 좋아요 하기
	public void add_like(Map<String,Object> map)throws Exception;
	//게시글 좋아요 해제하기
	public void remove_like(Map<String,Object> map)throws Exception;
	//게시글에 좋아요가 몇개인지 확인하기
	public int how_many_like(int board_num)throws Exception;
	//내가 방금 쓴글번호 가져오기
	public int find_latest_board_num(String join_id)throws Exception;
	//게시글 삭제하기
	public void delete_board(int board_num)throws Exception; 
	//리플달기
	public void write_reply(BoardReplyBean boardreplyBean)throws Exception;
	
	//리플 가져오기
	public List<BoardReplyBean> read_reply(Map<String,Integer> map)throws Exception;
	//수정한 리플 1개 가져오기
	public BoardReplyBean read_reply_oneBean(int b_reply_num)throws Exception;
	//리플 총 개수 가져오기
	public int getBoardReplyListCount(int board_num)throws Exception;
	//원본글 삭제하면 댓글 삭제하기
	public void delete_reply(int board_num)throws Exception;
	//게시글 리플 수정하기
	public void modify_reply(BoardReplyBean boardreplyBean)throws Exception;
	
	//게시글 리플 삭제하기
	public void delete_reply_one(int b_reply_num)throws Exception;
	
	//이미지 파일 DB저장
	public void image_upload(ImageBean imageBean)throws Exception;
	//이미지 파일 가져오기
	public List<ImageBean> read_image(int board_num)throws Exception;
	//이미지 삭제하기
	public void delete_image(int board_num)throws Exception;
	
	//조회수 증가시키기
	public void update_readcount(int board_num)throws Exception;
	//수정페이지에서 이미지 개별 삭제하기
	public void delete_image_sep(int image_num)throws Exception;
	//게시판에 올려져 있는 이미지 총 갯수 가져오기
	public int get_imageListCount(int board_num)throws Exception;
	//게시글 수정시 이미지를 다 지웠으면 check_image를 변경해 주어야 한다.
	public void change_check_image(int board_num)throws Exception;
	//게시글 업데이트 
	public void update_board(BoardBean boardBean)throws Exception;
	
	//게시글 or 리플 신고했는지 여부 확인
	public int check_report(Map<String,Object> map)throws Exception;
	//게시글 or 리플 신고하기
	public void report(ReportBean reportBean)throws Exception;
	//해당 개시글  신고가 몇개 있는지 확인
	public int count_report_board(int board_num)throws Exception;
	//해당 리플 신고가 몇개 있는지 확인
	public int count_report_reply(int b_reply_num)throws Exception;
	//해당 게시글 임시 블락 처리
	public void temporary_block_board(int board_num)throws Exception;
	//해당 리플 임시 블락 처리
	public void temporary_block_reply(int b_reply_num)throws Exception;
	//즐겨찾기한 게시물 목록 가져오기
	public List<BoardBean> get_favorite_board(Map<String,Object> map)throws Exception;
	//즐겨찾기한 게시물 총 갯수 가져오기
	public int get_favorite_boardCount(Map<String,Object> map)throws Exception;
	//원본글 삭제시 즐겨찾기 삭제하기
	public void delete_fav(int board_num)throws Exception;
	//경고글 총 갯수 가져오기
	public int board_warn_listCount()throws Exception;
	//경고글 리스트 가져오기
	public List<BoardBean> get_Warn_Board(Map<String,Object> map)throws Exception;	
	//경고글 경고 몇번 받았는지 
	public int getBoardWarnCount(int board_num)throws Exception;
	//경고글 삭제하면 경고 테이블도 비워주기
	public void delete_report(int board_num)throws Exception;
	//게시글 삭제히 업 테이블도 삭제하기
	public void delete_up(int board_num)throws 	Exception;
	//신고게시글 경고 풀기
	public void change_board_state(int board_num)throws Exception;
	

}
