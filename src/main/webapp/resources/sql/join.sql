create table join_member(
	join_code number unique not null,          /* 회원 코드 */
	join_id varchar2(20) primary key not null, /* 회원 아이디 */
	join_password varchar2(20) not null,       /* 회원  비밀번호 */
	join_password2 varchar2(20) not null,      /* 비밀번호 확인 */
	join_name varchar2(50) not null,           /* 회원 이름  */
	join_birthday varchar2(20) not null,       /* 생년월일 */
	join_tel varchar2(15) not null,       /* 회원 연락처  */
	join_email varchar2(100) not null,         /* 회원 이메일 */
	join_zipcode varchar2(5) not null,         /* 우편번호 */
	join_address1 varchar2(200) not null,      /* 회원 주소 */ 
	join_address2 varchar2(200) not null,      /* 나머지 주소 */
	join_type varchar2(20) not null,           /* 가입 희망 유형 */
	join_pet_picture varchar2(200),            /* 반려동물 사진 */
	join_pet_original varchar2(200),
	join_pet_name varchar2(50),                /* 반려동물 이름 */
	join_pet_type varchar2(50),             /* 반려동물 종 */ 
	join_sitter_license varchar2(100),         /* 펫시터 자격증 */
	join_hospital_location varchar2(200),      /* 병원 위치 */
	join_hospital_name varchar2(30),           /* 병원 이름 */
	join_hospital_tel varchar2(15)             /* 병원 연락처 */
	
)

create sequence joincode_seq 
increment by 1 start with 1 nocache;


select * from join_member

drop table join_member