package com.naver.zootopia.model;

public class UpBean {
	private int up_num; //���ٿ� pk
	private String join_id; //ȸ�� id ����
	private int board_num; // �Խ��� pk ����
	private int up;//���ƿ� 1 �Ⱦ��0
	public int getUp_num() {
		return up_num;
	}
	public void setUp_num(int up_num) {
		this.up_num = up_num;
	}
	public String getJoin_id() {
		return join_id;
	}
	public void setJoin_id(String join_id) {
		this.join_id = join_id;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public int getUp() {
		return up;
	}
	public void setUp(int up) {
		this.up = up;
	}
	
	
}
