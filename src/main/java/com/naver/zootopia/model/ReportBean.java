package com.naver.zootopia.model;

public class ReportBean {
	private int report_num; //신고글 pk
	private int report_board_ref; //게시글일 경우 게시글 pk참조
	private int report_reply_ref; //리플일 경우 리플 pk 참조
	private String report_type; //게시글 or 리플인지 여부
	private String report_reason; //신고 사유
	private String report_state; //임시블락or보관 여부(삭제처리 안함)
	private String join_id; //신고자 id
	private String report_date; //신고 일자
	public int getReport_num() {
		return report_num;
	}
	public void setReport_num(int report_num) {
		this.report_num = report_num;
	}
	public int getReport_board_ref() {
		return report_board_ref;
	}
	public void setReport_board_ref(int report_board_ref) {
		this.report_board_ref = report_board_ref;
	}
	public int getReport_reply_ref() {
		return report_reply_ref;
	}
	public void setReport_reply_ref(int report_reply_ref) {
		this.report_reply_ref = report_reply_ref;
	}
	public String getReport_type() {
		return report_type;
	}
	public void setReport_type(String report_type) {
		this.report_type = report_type;
	}
	public String getReport_reason() {
		return report_reason;
	}
	public void setReport_reason(String report_reason) {
		this.report_reason = report_reason;
	}
	public String getReport_state() {
		return report_state;
	}
	public void setReport_state(String report_state) {
		this.report_state = report_state;
	}
	public String getJoin_id() {
		return join_id;
	}
	public void setJoin_id(String join_id) {
		this.join_id = join_id;
	}
	public String getReport_date() {
		return report_date;
	}
	public void setReport_date(String report_date) {
		this.report_date = report_date;
	}
	
	
 
}
