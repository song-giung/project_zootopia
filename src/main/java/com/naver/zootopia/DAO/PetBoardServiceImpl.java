package com.naver.zootopia.DAO;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naver.zootopia.model.BoardBean;
import com.naver.zootopia.model.BoardReplyBean;
import com.naver.zootopia.model.ImageBean;
import com.naver.zootopia.model.ReportBean;

@Service
public class PetBoardServiceImpl implements PetBoardService{
	
	@Autowired
	private PetBoardDAOImpl boardDAO;
	
	//일상 게시판 글쓰기
	@Override
	public void board_pet_write(BoardBean boardBean) throws Exception {
		boardDAO.board_pet_write(boardBean);
		
	}
	
	
	@Override
	public void replay_write(BoardReplyBean replybean) throws Exception {
		// TODO Auto-generated method stub
		
	}
	
	//일상 게시판 목록 가져오기
	@Override
	public List<BoardBean> read_board_pet(Map<String,Object> map) throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.read_board_pet(map);
	}

	//일상 게시판 갯수
	@Override
	public int getBoardPetListCount(Map<String,Object> map) throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.getBoardPetListCount(map);
	}
	
	//개시글 내용 보기
	@Override
	public BoardBean read_board_cont(int board_num) throws Exception {
		
		return boardDAO.read_board_cont(board_num);
	}


	
	//즐겨찾기 했는지 체크하기
	@Override
	public int check_favorite(Map<String,Object> map) throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.check_favorite(map);
	}

	//좋아요 했는지 체크하기
	@Override
	public int check_like(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.check_like(map);
	}

	//내가 방금쓴 글 번호 가져오기 
	@Override
	public int find_latest_board_num(String join_id) throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.find_latest_board_num(join_id);
	}

	//게시글 삭제하기
	@Override
	public void delete_board(int board_num) throws Exception {
		boardDAO.delete_board(board_num);
		
	}

	
	//리플 달기
	@Override
	public void write_reply(BoardReplyBean boardreplyBean) throws Exception {
		// TODO Auto-generated method stub
		boardDAO.write_reply(boardreplyBean);
	}


	//리플 가져오기
	@Override
	public List<BoardReplyBean> read_reply(Map<String,Integer> map) throws Exception {
		// TODO Auto-generated method stub
							
		return boardDAO.read_reply(map);
	}

	//리플 총 개수 가져오기
	@Override
	public int getBoardReplyListCount(int board_num) throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.getBoardReplyListCount(board_num);
	}

	//원본글 삭제하면  - 댓글 삭제하기
	@Override
	public void delete_reply(int board_num) throws Exception {
		// TODO Auto-generated method stub
		boardDAO.delete_reply(board_num);
		
	}

	//리플 수정하기
	@Override
	public void modify_reply(BoardReplyBean boardreplyBean) throws Exception {
		// TODO Auto-generated method stub
		boardDAO.modify_reply(boardreplyBean);
	}

	//수정된 리플 1개만 가져오기
	@Override
	public BoardReplyBean read_reply_oneBean(int b_reply_num) throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.read_reply_oneBean(b_reply_num);
	}

	//게시글 리플 1개만 삭제하기
	@Override
	public void delete_reply_one(int b_reply_num) throws Exception {
		// TODO Auto-generated method stub
		boardDAO.delete_reply_one(b_reply_num);
	}

	//이미지 업로드하기
	@Override
	public void image_upload(ImageBean imageBean) throws Exception {
		// TODO Auto-generated method stub
		boardDAO.image_upload(imageBean);
	}

	//이미지 파일 가져오기
	@Override
	public List<ImageBean> read_image(int board_num) throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.read_image(board_num);
	}


	@Override
	public void delete_image(int board_num) throws Exception {
		// TODO Auto-generated method stub
		boardDAO.delete_image(board_num);
	}


	@Override
	public void update_readcount(int board_num) throws Exception {
		// TODO Auto-generated method stub
		boardDAO.update_readcount(board_num);
	}

	//수정 페이지에서 이미지 개별 삭제 
	@Override
	public void delete_image_sep(int image_num) throws Exception {
		// TODO Auto-generated method stub
		boardDAO.delete_image_sep(image_num);
	}

	//게시글에 있는 이미지 개수 가져오기
	@Override
	public int get_imageListCount(int board_num) throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.get_imageListCount(board_num);
	}

	//게시글 수정할때 이미지 전부 지웠으면 
	@Override
	public void change_check_image(int board_num) throws Exception {
		// TODO Auto-generated method stub
		boardDAO.change_check_image(board_num);
	}

	//게시글 업데이트 하기
	@Override
	public void update_board(BoardBean boardBean) throws Exception {
		// TODO Auto-generated method stub
		boardDAO.update_board(boardBean);
	}
	
	//즐겨찾기 추가하기
	@Override
	public void add_favorite(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		boardDAO.add_favorite(map);
	}

	//즐겨찾기 해제하기
	@Override
	public void remove_favorite(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		boardDAO.remove_favorite(map);
	}

	//좋아요 추가하기
	@Override
	public void add_like(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		boardDAO.add_like(map);
	}

	//좋아요 해제하기
	@Override
	public void remove_like(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		boardDAO.remove_like(map);
	}

	//게시글에 좋아요가 총 몇개인지 확인하기
	@Override
	public int how_many_like(int board_num) throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.how_many_like(board_num);
	}

	//게시글 리플 신고 했는지 여부 확인
	@Override
	public int check_report(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.check_report(map);
	}

	//게시글 or 리플 신고하기
	@Override
	public void report(ReportBean reportBean) throws Exception {
		// TODO Auto-generated method stub
		boardDAO.report(reportBean);
	}

	//해당 게시글 신고 갯수 확인
	@Override
	public int count_report_board(int board_num) throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.count_report_board(board_num);
	}

	//해당 리플 신고 갯수 확인
	@Override
	public int count_report_reply(int b_reply_num) throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.count_report_reply(b_reply_num);
	}

	//해당 게시글 임시 블락 처리
	@Override
	public void temporary_block_board(int board_num) throws Exception {
		// TODO Auto-generated method stub
		boardDAO.temporary_block_board(board_num);
	}

	//해당 리플 임시 블락 처리
	@Override
	public void temporary_block_reply(int b_reply_num) throws Exception {
		// TODO Auto-generated method stub
		boardDAO.temporary_block_reply(b_reply_num);
	}

	
	//즐겨찾기한 게시글 목록 가져오기
	@Override
	public List<BoardBean> get_favorite_board(Map<String,Object> map) throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.get_favorite_board(map);
	}

	//즐겨찾기한 게시글 총 갯수 가져오기
	@Override
	public int get_favorite_boardCount(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.get_favorite_boardCount(map);
	}

	//원본글 삭제시 즐겨찾기 삭제하기
	@Override
	public void delete_fav(int board_num) throws Exception {
		// TODO Auto-generated method stub
		boardDAO.delete_fav(board_num);
	}

	//경고글 총 개수 가져오기
	@Override
	public int board_warn_listCount() throws Exception {
		return boardDAO.board_warn_listCount();
	}

	//경고글 리스트 가져오기
	@Override
	public List<BoardBean> get_Warn_Board(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.get_Warn_Board(map);
	}

	//해당 글 경고 몇개나 받았는지 
	@Override
	public int getBoardWarnCount(int board_num) throws Exception {
		// TODO Auto-generated method stub
		return boardDAO.getBoardWarnCount(board_num);
	}


	@Override
	public void delete_report(int board_num) throws Exception {
		// TODO Auto-generated method stub
		boardDAO.delete_report(board_num);
	}

	//해당 글 삭제시 추천 도 삭제하기
	@Override
	public void delete_up(int board_num) throws Exception {
		// TODO Auto-generated method stub
		boardDAO.delete_up(board_num);
	}

	//신고글 경고 풀기
	@Override
	public void change_board_state(int board_num) throws Exception {
		// TODO Auto-generated method stub
		boardDAO.change_board_state(board_num);
	}

	
	
	
	

	
	
	
}
