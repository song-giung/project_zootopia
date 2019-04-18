package com.naver.zootopia.model;

import org.springframework.web.multipart.MultipartFile;

public class MemberBean {

	private int join_code;
	private String join_id;
	private String join_password;
	private String join_password2;
	private String join_name;
	private String join_birthday;
	private String join_year;
	private String join_month;
	private String join_day;
	
	
	private String join_tel;
	private String join_tel1;
	private String join_tel2;
	private String join_tel3;
	
	private String join_email;
	private String join_mailid;
	private String join_maildomain;
	
	private String join_zipcode;
	private String join_address1;
	private String join_address2;
	
	private String join_type;
	private MultipartFile join_profile;
	private String join_pet_picture;
	private String join_pet_original;
	private String join_pet_name;
	private String join_pet_type;
	
	private String join_sitter_license;
	
	private String join_hospital_location;
	private String join_hospital_name;
	private String join_hospital_tel;
	private String join_hospital_tel1;
	private String join_hospital_tel2;
	private String join_hospital_tel3;
	
	
	public int getJoin_code() {
		return join_code;
	}
	public void setJoin_code(int join_code) {
		this.join_code = join_code;
	}
	public String getJoin_id() {
		return join_id;
	}
	public void setJoin_id(String join_id) {
		this.join_id = join_id;
	}

	
	public String getJoin_password() {
		return join_password;
	}
	public void setJoin_password(String join_password) {
		this.join_password = join_password;
	}
	public String getJoin_password2() {
		return join_password2;
	}
	public void setJoin_password2(String join_password2) {
		this.join_password2 = join_password2;
	}
	public String getJoin_name() {
		return join_name;
	}
	public void setJoin_name(String join_name) {
		this.join_name = join_name;
	}
	public String getJoin_birthday() {
		return join_birthday;
	}
	public void setJoin_birthday(String join_birthday) {
		this.join_birthday = join_birthday;
	}
	public String getJoin_tel() {
		return join_tel;
	}
	public void setJoin_tel(String join_tel) {
		this.join_tel = join_tel;
	}
	public String getJoin_tel1() {
		return join_tel1;
	}
	public void setJoin_tel1(String join_tel1) {
		this.join_tel1 = join_tel1;
	}
	public String getJoin_tel2() {
		return join_tel2;
	}
	public void setJoin_tel2(String join_tel2) {
		this.join_tel2 = join_tel2;
	}
	public String getJoin_tel3() {
		return join_tel3;
	}
	public void setJoin_tel3(String join_tel3) {
		this.join_tel3 = join_tel3;
	}
	public String getJoin_email() {
		return join_email;
	}
	public void setJoin_email(String join_email) {
		this.join_email = join_email;
	}
	public String getJoin_mailid() {
		return join_mailid;
	}
	public void setJoin_mailid(String join_mailid) {
		this.join_mailid = join_mailid;
	}
	public String getJoin_maildomain() {
		return join_maildomain;
	}
	public void setJoin_maildomain(String join_maildomain) {
		this.join_maildomain = join_maildomain;
	}
	public String getJoin_zipcode() {
		return join_zipcode;
	}
	public void setJoin_zipcode(String join_zipcode) {
		this.join_zipcode = join_zipcode;
	}
	
	public String getJoin_address1() {
		return join_address1;
	}
	public void setJoin_address1(String join_address1) {
		this.join_address1 = join_address1;
	}
	public String getJoin_address2() {
		return join_address2;
	}
	public void setJoin_address2(String join_address2) {
		this.join_address2 = join_address2;
	}
	public String getJoin_type() {
		return join_type;
	}
	public void setJoin_type(String join_type) {
		this.join_type = join_type;
	}
	public String getJoin_pet_original() {
		return join_pet_original;
	}
	public void setJoin_pet_original(String join_pet_original) {
		this.join_pet_original = join_pet_original;
	}
	public String getJoin_pet_name() {
		return join_pet_name;
	}
	public void setJoin_pet_name(String join_pet_name) {
		this.join_pet_name = join_pet_name;
	}
	public String getJoin_pet_type() {
		return join_pet_type;
	}
	public void setJoin_pet_type(String join_pet_type) {
		this.join_pet_type = join_pet_type;
	}
	public String getJoin_sitter_license() {
		return join_sitter_license;
	}
	public void setJoin_sitter_license(String join_sitter_license) {
		this.join_sitter_license = join_sitter_license;
	}
	public String getJoin_hospital_location() {
		return join_hospital_location;
	}
	public void setJoin_hospital_location(String join_hospital_location) {
		this.join_hospital_location = join_hospital_location;
	}
	public String getJoin_hospital_name() {
		return join_hospital_name;
	}
	public void setJoin_hospital_name(String join_hospital_name) {
		this.join_hospital_name = join_hospital_name;
	}
	public String getJoin_hospital_tel() {
		return join_hospital_tel;
	}
	public void setJoin_hospital_tel(String join_hospital_tel) {
		this.join_hospital_tel = join_hospital_tel;
	}
	public MultipartFile getJoin_profile() {
		return join_profile;
	}
	public void setJoin_profile(MultipartFile join_profile) {
		this.join_profile = join_profile;
	}
	public String getJoin_pet_picture() {
		return join_pet_picture;
	}
	public void setJoin_pet_picture(String join_pet_picture) {
		this.join_pet_picture = join_pet_picture;
	}
	public String getJoin_year() {
		return join_year;
	}
	public void setJoin_year(String join_year) {
		this.join_year = join_year;
	}
	public String getJoin_month() {
		return join_month;
	}
	public void setJoin_month(String join_month) {
		this.join_month = join_month;
	}
	public String getJoin_day() {
		return join_day;
	}
	public void setJoin_day(String join_day) {
		this.join_day = join_day;
	}
	public String getJoin_hospital_tel1() {
		return join_hospital_tel1;
	}
	public void setJoin_hospital_tel1(String join_hospital_tel1) {
		this.join_hospital_tel1 = join_hospital_tel1;
	}
	public String getJoin_hospital_tel2() {
		return join_hospital_tel2;
	}
	public void setJoin_hospital_tel2(String join_hospital_tel2) {
		this.join_hospital_tel2 = join_hospital_tel2;
	}
	public String getJoin_hospital_tel3() {
		return join_hospital_tel3;
	}
	public void setJoin_hospital_tel3(String join_hospital_tel3) {
		this.join_hospital_tel3 = join_hospital_tel3;
	}
	
	

}
