package com.naver.zootopia.model;

public class EvaluationBean {
	private int		evaluation_no;
	private String	id;
	private int		star_score;
	private int		mark_no;
	private	int		mark_type;
	private String	mark_name;
	private String	place_comment;
	private int		a_no;
	private String	evaluation_date;
	
	public int getEvaluation_no() {
		return evaluation_no;
	}
	public void setEvaluation_no(int evaluation_no) {
		this.evaluation_no = evaluation_no;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getStar_score() {
		return star_score;
	}
	public void setStar_score(int star_score) {
		this.star_score = star_score;
	}
	public int getMark_no() {
		return mark_no;
	}
	public void setMark_no(int mark_no) {
		this.mark_no = mark_no;
	}
	public int getMark_type() {
		return mark_type;
	}
	public void setMark_type(int mark_type) {
		this.mark_type = mark_type;
	}
	public String getMark_name() {
		return mark_name;
	}
	public void setMark_name(String mark_name) {
		this.mark_name = mark_name;
	}
	public String getPlace_comment() {
		return place_comment;
	}
	public void setPlace_comment(String place_comment) {
		this.place_comment = place_comment;
	}
	public int getA_no() {
		return a_no;
	}
	public void setA_no(int a_no) {
		this.a_no = a_no;
	}
	public String getEvaluation_date() {
		return evaluation_date;
	}
	public void setEvaluation_date(String evaluation_date) {
		this.evaluation_date = evaluation_date;
	}


}
