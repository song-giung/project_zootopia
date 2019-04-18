package com.naver.zootopia.DAO;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naver.zootopia.model.BoardBean;
import com.naver.zootopia.model.BoardReplyBean;
import com.naver.zootopia.model.ImageBean;
import com.naver.zootopia.model.ReportBean;

@Repository
public class PetBoardDAOImpl {

	@Autowired
	private SqlSessionTemplate sqlSession;
	//일상 게시판 목록 보기
	public List<BoardBean> read_board_pet(Map<String,Object> map){
		return sqlSession.selectList("board.read_board_pet",map);
	}
	
	//일상 게시글 총 개수 가져오기
	public int getBoardPetListCount(Map<String,Object> map) {
		return sqlSession.selectOne("board.PettotalCount",map);
	}
	//일상 개시글 작성하기
	public void board_pet_write(BoardBean boardBean) {
		sqlSession.insert("board.board_pet_write",boardBean);
	}
	//게시글 내용 가져오기
	public BoardBean read_board_cont(int board_num) {
		return sqlSession.selectOne("board.read_board_cont",board_num);
	}
	
	//즐겨 찾기 했는지 확인하기
	public int check_favorite(Map<String,Object> map) {
		return sqlSession.selectOne("board.check_favorite",map);
	}
	
	//좋아요 했는지 확인하기
	public int check_like(Map<String,Object> map) {
		return sqlSession.selectOne("board.check_like",map);
	}
	
	//내가 방금 쓴글번호 가져오기
	
	public int find_latest_board_num(String join_id) {
		return sqlSession.selectOne("board.find_latest_board_num",join_id);
	}
	
	//게시글 삭제하기
	public void delete_board(int board_num) {
		sqlSession.delete("board.delete_board",board_num);
	}
	
	//리플 달기
	public void write_reply(BoardReplyBean boardreplyBean) {
		sqlSession.insert("board.write_reply",boardreplyBean);
	}
	//리플 읽어오기
	public List<BoardReplyBean> read_reply(Map<String,Integer> map) {
		return sqlSession.selectList("board.read_reply",map);
	}
	//리플 총 개수 가져오기
	public int getBoardReplyListCount(int board_num) {
		return sqlSession.selectOne("board.getBoardReplyListCount",board_num);
	}
	
	//원본글 삭제하면 댓글 삭제하기
	public void delete_reply(int board_num) {
		sqlSession.delete("board.delete_reply",board_num);
	}
	//리플 수정하기
	public void modify_reply(BoardReplyBean boardreplyBean) {
		sqlSession.update("board.modify_reply",boardreplyBean);
	}
	
	//수정한 리플 1개만 가져오기
	public BoardReplyBean read_reply_oneBean(int b_reply_num) {
		return sqlSession.selectOne("board.read_reply_oneBean",b_reply_num);
	}
	//리플 1개만 삭제하기
	public void delete_reply_one(int b_reply_num) {
		sqlSession.delete("board.delete_reply_one",b_reply_num);
	}
	//이미지 업로드 하기
	public void image_upload(ImageBean imageBean) {
		sqlSession.insert("board.image_upload",imageBean);
	}
	//이미지 파일 가져오기
	public List<ImageBean> read_image(int board_num) {
		return sqlSession.selectList("board.read_image",board_num);
	}
	
	//이미지 삭제하기
	public void delete_image(int board_num) {
		sqlSession.delete("board.delete_image",board_num);
	}
	
	//죄회수 증가시키기
	public void update_readcount(int board_num) {
		sqlSession.update("board.update_readcount",board_num);
	}
	
	//수정페이지에서 이미지 개별 삭제
	public void delete_image_sep(int image_num) {
		sqlSession.delete("board.delete_image_sep",image_num);
	}
	//게시글 한개에 있는 이미지 총 개수 가져오기
	public int get_imageListCount(int board_num) {
		return sqlSession.selectOne("board.get_imageListCount",board_num);
	}
	//게시글 수정시 이미지 전부 지웠으면 바꿔줘야 해
	public void change_check_image(int board_num) {
		sqlSession.update("board.change_check_image",board_num);
	}
	//게시글 업데이트
	public void update_board(BoardBean boardBean) {
		sqlSession.update("board.update_board",boardBean);
	}
	//즐겨찾기 추가하기
	public void add_favorite(Map<String,Object> map) {
		sqlSession.insert("board.add_favorite",map);
	}
	//즐겨찾기 해제하기
	public void remove_favorite(Map<String,Object> map) {
		sqlSession.delete("board.remove_favorite",map);
	}
	//좋아요 추가하기
	public void add_like(Map<String,Object> map) {
		sqlSession.insert("board.add_like",map);
	}
	
	//좋아요 해제하기
	public void remove_like(Map<String,Object> map) {
		sqlSession.delete("board.remove_like",map);
	}
	//게시글에 좋아요가 몇개인지 확인하기
	public int how_many_like(int board_num) {
		return sqlSession.selectOne("board.how_many_like",board_num);
	}
	
	//게시글 or 리플 신고 여부 확인
	public int check_report(Map<String,Object> map) {
		return sqlSession.selectOne("board.check_report",map);
	}
	
	//게시글 리플 신고하기
	public void report(ReportBean replyBean) {
		sqlSession.insert("board.report",replyBean);
	}
	//해당 개시글  신고가 몇개 있는지 확인
	public int count_report_board(int board_num) {
		return sqlSession.selectOne("board.count_report_board",board_num);
	}
	//해당 리플 신고가 몇개 있는지 확인
	public int count_report_reply(int b_reply_num) {
		return sqlSession.selectOne("board.count_report_reply",b_reply_num);
	}
	//해당 게시글 임시 블락 처리
	public void temporary_block_board(int board_num) {
		sqlSession.update("board.temporary_block_board",board_num);
	}
	//해당 리플 임시 블락 처리
	public void temporary_block_reply(int b_reply_num) {
		sqlSession.update("board.temporary_block_reply",b_reply_num);
	}
	
	//즐겨찾기한 게시글 목록 가져오기
	public List<BoardBean> get_favorite_board(Map<String,Object> map){
		return sqlSession.selectList("board.get_favorite_board",map);
	}
	//즐겨찾기한 게시글 총 개수 가져오기
	public int get_favorite_boardCount(Map<String,Object> map) {
		return sqlSession.selectOne("board.get_favorite_boardCount",map);
	}
	//원본글 삭제시 즐겨찾기 삭제하기
	public void delete_fav(int board_num) {
		sqlSession.delete("board.delete_fav",board_num);
	}
	//경고글 총 갯수 가졍괴
	public int board_warn_listCount() {
		return sqlSession.selectOne("board.board_warn_listCount");
	}
	//경고글 리스트 가져오기
	public List<BoardBean> get_Warn_Board(Map<String,Object> map){
		return sqlSession.selectList("board.get_Warn_Board",map);
	}
	//경고 몇번 받았는지
	public int getBoardWarnCount(int board_num) {
		return sqlSession.selectOne("board.getBoardWarnCount",board_num);
	}
	//게시글 지우면 해당 경고테이블도 비우기
	public void delete_report(int board_num) {
		sqlSession.delete("board.delete_report",board_num);
	}
	//게시글 지우면 추천도 삭제하기
	public void delete_up(int board_num) {
		sqlSession.delete("board.delete_up",board_num);
	}
	
	//신고풀기
	public void change_board_state(int board_num) {
		sqlSession.update("board.change_board_state",board_num);
	}
}
