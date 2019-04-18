package com.naver.zootopia.model;

import org.springframework.web.multipart.MultipartFile;

public class petcBean {
	private String petc_id; //아이디
	private int petc_board_num; //글번호
	private String petc_subject; //제목
	private String petc_content; //내용
	private String petc_space; //돌봄공간
	private String petc_houst_photo; //집사진
	private String petc_location; //집위치
	private String petc_walk; //펫산책 유무
	private String petc_family; //가족 동거 유무
	private String petc_animals_kind; //동물종류
	private String petc_animals_many; //동물마릿수
	private String petc_time_in; //체크인시간
	private String petc_time_out; //체크아웃시간
	private String petc_date; //원하는 날짜
	private int petc_price; //원하는 가격
	private String petc_original; //집사진 오리지널
	private MultipartFile uploadfile;
	public String getPetc_id() {
		return petc_id;
	}
	public void setPetc_id(String petc_id) {
		this.petc_id = petc_id;
	}
	public int getPetc_board_num() {
		return petc_board_num;
	}
	public void setPetc_board_num(int petc_board_num) {
		this.petc_board_num = petc_board_num;
	}
	public String getPetc_subject() {
		return petc_subject;
	}
	public void setPetc_subject(String petc_subject) {
		this.petc_subject = petc_subject;
	}
	public String getPetc_content() {
		return petc_content;
	}
	public void setPetc_content(String petc_content) {
		this.petc_content = petc_content;
	}
	public String getPetc_space() {
		return petc_space;
	}
	public void setPetc_space(String petc_space) {
		this.petc_space = petc_space;
	}
	public String getPetc_houst_photo() {
		return petc_houst_photo;
	}
	public void setPetc_houst_photo(String petc_houst_photo) {
		this.petc_houst_photo = petc_houst_photo;
	}
	public String getPetc_location() {
		return petc_location;
	}
	public void setPetc_location(String petc_location) {
		this.petc_location = petc_location;
	}
	public String getPetc_walk() {
		return petc_walk;
	}
	public void setPetc_walk(String petc_walk) {
		this.petc_walk = petc_walk;
	}
	public String getPetc_family() {
		return petc_family;
	}
	public void setPetc_family(String petc_family) {
		this.petc_family = petc_family;
	}
	public String getPetc_animals_kind() {
		return petc_animals_kind;
	}
	public void setPetc_animals_kind(String petc_animals_kind) {
		this.petc_animals_kind = petc_animals_kind;
	}
	public String getPetc_animals_many() {
		return petc_animals_many;
	}
	public void setPetc_animals_many(String petc_animals_many) {
		this.petc_animals_many = petc_animals_many;
	}
	public String getPetc_time_in() {
		return petc_time_in;
	}
	public void setPetc_time_in(String petc_time_in) {
		this.petc_time_in = petc_time_in;
	}
	public String getPetc_time_out() {
		return petc_time_out;
	}
	public void setPetc_time_out(String petc_time_out) {
		this.petc_time_out = petc_time_out;
	}
	public String getPetc_date() {
		return petc_date;
	}
	public void setPetc_date(String petc_date) {
		this.petc_date = petc_date;
	}
	public int getPetc_price() {
		return petc_price;
	}
	public void setPetc_price(int petc_price) {
		this.petc_price = petc_price;
	}
	public String getPetc_original() {
		return petc_original;
	}
	public void setPetc_original(String petc_original) {
		this.petc_original = petc_original;
	}
	public MultipartFile getUploadfile() {
		return uploadfile;
	}
	public void setUploadfile(MultipartFile uploadfile) {
		this.uploadfile = uploadfile;
	}
	
}
