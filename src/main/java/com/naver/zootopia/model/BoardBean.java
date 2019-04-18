package com.naver.zootopia.model;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class BoardBean {
	private int board_num; 
	private String join_id; 
	private String board_subject;
	private String board_content; 
	private List<MultipartFile> uploadfile;
	private int check_image; 
	private int board_readcount;
	private String board_date;
	private String board_modify_date;
	private int board_type;
	private int board_state;//1임시 블락 -> -1보관 or 0 정상
	private String board_cate; 
	/*check_image
	 * 1=이미지 있음
	 * 0=이미지 없음
	 * 
	 * */
	
	/*type
	 * 1=일상
	 * 2=분양,짝
	 * 3=분실,도움
	 * 4=후기
	 * */
	/*board_cate
	 * dog
	 * cat
	 * etc
	 * 
	 * */
	
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getJoin_id() {
		return join_id;
	}
	public void setJoin_id(String join_id) {
		this.join_id = join_id;
	}
	public String getBoard_subject() {
		return board_subject;
	}
	public void setBoard_subject(String board_subject) {
		this.board_subject = board_subject;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public List<MultipartFile> getUploadfile() {
		return uploadfile;
	}
	public void setUploadfile(List<MultipartFile> uploadfile) {
		this.uploadfile = uploadfile;
	}
	public int getCheck_image() {
		return check_image;
	}
	public void setCheck_image(int check_image) {
		this.check_image = check_image;
	}
	public int getBoard_readcount() {
		return board_readcount;
	}
	public void setBoard_readcount(int board_readcount) {
		this.board_readcount = board_readcount;
	}
	public String getBoard_date() {
		return board_date;
	}
	public void setBoard_date(String board_date) {
		this.board_date = board_date.substring(0, 10);
	}
	public String getBoard_modify_date() {
		return board_modify_date;
	}
	public void setBoard_modify_date(String board_modify_date) {
		this.board_modify_date = board_modify_date;
	}
	public int getBoard_type() {
		return board_type;
	}
	public void setBoard_type(int board_type) {
		this.board_type = board_type;
	}
	public int getBoard_state() {
		return board_state;
	}
	public void setBoard_state(int board_state) {
		this.board_state = board_state;
	}
	public String getBoard_cate() {
		return board_cate;
	}
	public void setBoard_cate(String board_cate) {
		this.board_cate = board_cate;
	}
	


}
