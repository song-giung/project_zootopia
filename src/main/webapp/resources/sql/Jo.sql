alter table join_member rename column join_join_tel to join_tel;
select * from join_member;
create table join_member(
	join_code number unique not null,          /* 회원 코드 */
	join_id varchar2(20) primary key not null, /* 회원 아이디 */
	join_password varchar2(20) not null,       /* 회원  비밀번호 */
	join_password2 varchar2(20) not null,      /* 비밀번호 확인 */
	join_name varchar2(50) not null,           /* 회원 이름  */
	join_jumin number not null,                /* 주민등록번호 앞자리 */
	join_tel varchar2(15) not null,       /* 회원 연락처  */
	join_email varchar2(100) not null,         /* 회원 이메일 */
	join_zipcode varchar2(5) not null,         /* 우편번호 */
	join_address1 varchar2(200) not null,      /* 회원 주소 */ 
	join_address2 varchar2(200) not null,      /* 나머지 주소 */
	join_type varchar2(20) not null,           /* 가입 희망 유형 */
	join_pet_picture varchar2(200),            /* 반려동물 사진 */
	join_pet_name varchar2(50),                /* 반려동물 이름 */
	join_pet_type varchar2(50),             /* 반려동물 종 */ 
	join_sitter_license varchar2(100),         /* 펫시터 자격증 */
	join_hospital_location varchar2(200),      /* 병원 위치 */
	join_hospital_name varchar2(30),           /* 병원 이름 */
	join_hospital_tel varchar2(15)             /* 병원 연락처 */
)



insert into join_member(join_code, join_id, join_password, join_password2, join_name, 
join_jumin, join_tel, join_email, join_zipcode, join_address1, join_address2, join_type)
values(0,'admin','1111','1111','관리자',0,'0','admin','admin','admin','admin','관리자')



create table Map_Marker(
	mark_no			number primary key,			/*장소 번호*/
	mark_type		number not null,			/*장소 종류(병원,공원 등등)*/
	mark_name		varchar2(60) not null,		/*장소 이름*/
	mark_lat		number not null,			/*장소 위도*/
	mark_lng		number not null,			/*장소 경도*/
	mark_address	varchar2(100),				/*장소 주소*/
	mark_comment	varchar2(3000),				/*장소 설명*/
	mark_tel		varchar2(20)				/*장소 전화번호*/

);
create sequence mark_seq
increment by 1 start with 5; 

select*from Map_Marker;
 
alter table Map_Marker rename column mark_x to mark_lat;
alter table Map_Marker rename column mark_y to mark_lng;
alter table Map_Marker drop column pet_funeral;
alter table Map_Marker drop column pet_beauty;
alter table Map_Marker drop column pet_hotel;
alter table Map_Marker add (mark_tel varchar2(20));

insert into Map_Marker 
values(1,1,'카카오', 37.56559065713043, 126.9838026967317,'1','1','1')

insert into Map_Marker
values(2,2,'생태연못', 37.56554576870923, 126.98502514369233,'2','2','2')

insert into Map_Marker
values(3,3,'텃밭', 37.56469869259932, 126.98396135214651,'3','3','3')

insert into MAP_Marker
values(4,4,'근린공원',37.56474406478562, 126.98654201560849,'4','4',4,4,4,02-123-1234)

select*from Map_Marker

drop table Place_Evaluation;
drop sequence evaluation_seq;

create sequence evaluation_seq
increment by 1 start with 1;

create table Place_Evaluation(
	evaluation_no	number primary key,			/*평가 글 번호*/
	id				varchar2(20),				/*평가자 아이디*/
	mark_no			number,						/*장소 번호*/
	mark_type		number,						/*장소 종류*/
	mark_name		varchar2(60),				/*장소 이름*/
	place_comment	varchar2(1000),				/*장소 후기*/
	star_score		number,						/*별점*/
	evaluation_date	date,						/*등록 날짜*/
	foreign key(id) references join_member(join_id),
	foreign key(mark_no) references Map_Marker(mark_no)
)

alter table Place_Evaluation add (evaluation_date date);
select*from Place_Evaluation;
select*from Place_Evaluation where mark_no=1;
select nvl(round(avg(star_score),1),0) from place_evaluation where mark_no=3
insert into Place_Evaluation values(evaluation_seq.nextval, 'admin',1,1,'카카오','가까움',3,sysdate);
insert into Place_Evaluation values(evaluation_seq.nextval, 'admin',6,2,'진짜을지로입구','가까움',8,sysdate);
insert into Place_Evaluation values(evaluation_seq.nextval, 'admin',6,2,'진짜을지로입구','두번째',8,sysdate);
select*from (select*from place_evaluation where id='admin' order by evaluation_no desc) where rownum=1;
delete Place_Evaluation
select*from PLACE_EVALUATION where id=null;
select round(avg(star_score),1) from place_evaluation where mark_no=6;

drop table QnA_Question;
drop table QnA_Answer;

select*from QNA_QUESTION
alter table QnA_Question add(category varchar(12))
alter table QnA_Question rename column category to q_category
select*from (select*from QnA_Question where q_id = 'admin' order by q_no desc) where rownum = 1 

create table QnA_Question(
	q_no		number primary key,				/*질문글 번호*/
	q_id		varchar2(20),				/*질문자 아이디*/
	q_subject	varchar2(100),					/*질문 제목*/
	q_content	varchar2(4000),					/*질문 내용*/
	q_date		date,							/*글 등록 시간*/
	q_category	varchar2(20),					/*글 분류*/
	foreign key(q_id) references join_member(join_id)
)
create sequence q_seq
increment by 1 start with 1;
insert into QnA_Question values(q_seq.nextval, 'admin','질문제목','질문내용',sysdate,'기타')
insert into QnA_Question values(q_seq.nextval, 'admin','질문제목2','질문내용2',sysdate,'기타')


select*from QNA_QUESTION
delete QnA_Question; 

create table QnA_Answer(
	q_no	 	number,							/*질문글 번호*/
	a_no		number,							/*답변 글 번호*/
	a_id		varchar2(20),					/*답변자 아이디*/
	a_content	varchar2(4000),					/*답변*/
	a_date		date,							/*답변 시간*/
	foreign key(q_no) references QnA_Question(q_no),
	foreign key(a_id) references join_member(join_id)
)
select*from QNA_ANSWER
drop table QnA_Evaluation;
insert into QnA_Answer values(13,1,'admin','답변내용',sysdate)
insert into QnA_Answer values(13,2,'admin','답변내용1-1',sysdate)
insert into QnA_Answer values(14,1,'admin','답변내용2',sysdate)


create table QnA_Evaluation(
	q_no	 	number,							/*질문글 번호*/
	a_no		number,							/*답변 글 번호*/
	id			varchar2(20),					/*답변자 아이디*/
	star_score	number,							/*별점*/
	foreign key(q_no) references QnA_Question(q_no),
	foreign key(id) references join_member(join_id)
)










