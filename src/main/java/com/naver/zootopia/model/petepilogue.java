package com.naver.zootopia.model;

public class petepilogue {
	private String pet_id;
	private String pet_info;//펫정보
	private String pet_feces; //대소변 가리는 유무
	private String pet_vaccin; //예방접종 유무
	private String pet_friendly; //친화적 유무
	private String pet_disease; //펫 질병 유무
	private String pet_bark;
	public String getPet_id() {
		return pet_id;
	}
	public void setPet_id(String pet_id) {
		this.pet_id = pet_id;
	}
	public String getPet_info() {
		return pet_info;
	}
	public void setPet_info(String pet_info) {
		this.pet_info = pet_info;
	}
	public String getPet_feces() {
		return pet_feces;
	}
	public void setPet_feces(String pet_feces) {
		this.pet_feces = pet_feces;
	}
	public String getPet_vaccin() {
		return pet_vaccin;
	}
	public void setPet_vaccin(String pet_vaccin) {
		this.pet_vaccin = pet_vaccin;
	}
	public String getPet_friendly() {
		return pet_friendly;
	}
	public void setPet_friendly(String pet_friendly) {
		this.pet_friendly = pet_friendly;
	}
	public String getPet_disease() {
		return pet_disease;
	}
	public void setPet_disease(String pet_disease) {
		this.pet_disease = pet_disease;
	}
	public String getPet_bark() {
		return pet_bark;
	}
	public void setPet_bark(String pet_bark) {
		this.pet_bark = pet_bark;
	}
}
