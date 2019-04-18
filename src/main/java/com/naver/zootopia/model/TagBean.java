package com.naver.zootopia.model;

public class TagBean {
	private int tag_num; // �±� pk
	private String join_id ; //ȸ�� id ����
	private String tag_cont; //tag ����
	public int getTag_num() {
		return tag_num;
	}
	public void setTag_num(int tag_num) {
		this.tag_num = tag_num;
	}
	public String getJoin_id() {
		return join_id;
	}
	public void setJoin_id(String join_id) {
		this.join_id = join_id;
	}
	public String getTag_cont() {
		return tag_cont;
	}
	public void setTag_cont(String tag_cont) {
		this.tag_cont = tag_cont;
	}

	
	
}
