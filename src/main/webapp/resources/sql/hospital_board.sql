
create table hospital_board(
	hospital_board_num number primary key,
	master_name varchar2(30) not null,
	master_tel varchar2(30) not null,
	pet_name varchar2(30) not null,
	pet_speices varchar2(30) not null,
	hospital_board_date date not null,
	hospital_name varchar2(40) not null,
	hospital_tel varchar2(30) not null,
	hospital_address varchar2(50) not null,
	hospital_subject varchar2(50) not null,
	hospital_content varchar2(200) not null
)

select * from hospital_board;

delete from hospital_board;

drop table hospital_board;

create sequence hospital_board_num_seq
increment by 1
start with 1
nocache;

