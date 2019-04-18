package com.naver.zootopia.model;


public class BoardReplyBean {
	private int b_reply_num; 
	private String join_id; 
	private int b_reply_ref; 
	private String b_reply_content;
	private String b_reply_date; 
	private int b_reply_state; //신고 리플 유무 1경고 0정상 
	public int getB_reply_num() {
		return b_reply_num;
	}
	public void setB_reply_num(int b_reply_num) {
		this.b_reply_num = b_reply_num;
	}
	public String getJoin_id() {
		return join_id;
	}
	public void setJoin_id(String join_id) {
		this.join_id = join_id;
	}
	public int getB_reply_ref() {
		return b_reply_ref;
	}
	public void setB_reply_ref(int b_reply_ref) {
		this.b_reply_ref = b_reply_ref;
	}
	public String getB_reply_content() {
		return b_reply_content;
	}
	public void setB_reply_content(String b_reply_content) {
		this.b_reply_content = b_reply_content;
	}
	public String getB_reply_date() {
		return b_reply_date;
	}
	public void setB_reply_date(String b_reply_date) {
		this.b_reply_date = b_reply_date.substring(0, 10);
	}
	public int getB_reply_state() {
		return b_reply_state;
	}
	public void setB_reply_state(int b_reply_state) {
		this.b_reply_state = b_reply_state;
	}
	
	
	
}
