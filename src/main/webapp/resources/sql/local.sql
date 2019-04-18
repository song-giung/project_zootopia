--경보



create table Map_Marker(
	mark_no			number primary key,			/*장소 번호*/
	mark_type		number not null,			/*장소 종류(병원,공원 등등)*/
	mark_name		varchar2(60) not null,		/*장소 이름*/
	mark_x			number not null,			/*장소 x좌표*/
	mark_y			number not null,			/*장소 y좌표*/
	mark_address	varchar2(100),				/*장소 주소*/
	mark_comment	varchar2(3000),				/*장소 설명*/
	pet_funeral		number,						/*장례 여부*/
	pet_beauty		number,						/*미용 여부*/
	pet_hotel		number						/*숙박 여부*/
);

create table Place_Evaluation(
	id				varchar2(20),				/*평가자 아이디*/
	mark_no			number,						/*장소 번호*/
	mark_type		number,						/*장소 종류*/
	mark_name		varchar2(60),				/*장소 이름*/
	place_comment	varchar2(1000),				/*장소 후기*/
	star_score		number,						/*별점*/
	foreign key(id) references join_member(join_id),
	foreign key(mark_no) references Map_Marker(mark_no)
)

create table QnA_Question(
	q_no		number primary key,				/*질문글 번호*/
	id			varchar2(20),					/*질문자 아이디*/
	q_subject	varchar2(100),					/*질문 제목*/
	q_content	varchar2(4000),					/*질문 내용*/
	q_date		date,							/*글 등록 시간*/
	foreign key(id) references join_member(join_id)
)

create table QnA_Answer(
	q_no	 	number,							/*질문글 번호*/
	a_no		number,							/*답변 글 번호*/
	id			varchar2(20),					/*답변자 아이디*/
	a_comment	varchar2(4000),					/*답변*/
	a_date		date,							/*답변 시간*/
	foreign key(q_no) references QnA_Question(q_no),
	foreign key(id) references join_member(join_id)
)

create table QnA_Evaluation(
	q_no	 	number,							/*질문글 번호*/
	a_no		number,							/*답변 글 번호*/
	id			varchar2(20),					/*답변자 아이디*/
	star_score	number,							/*별점*/
	foreign key(q_no) references QnA_Question(q_no),
	foreign key(id) references join_member(join_id)
)




