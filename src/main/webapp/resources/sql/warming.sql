create table warning(
	warning_num varchar2(20),
	join_id varchar2(20) 
)

create table join_admin(
	join_id varchar2(20) primary key,	--관리자 아이디
	join_password varchar2(20) not null --관리자 패스워드
)

insert into join_admin values('admin', 1234);

select * from join_admin;

delete from join_admin;

create sequence joincode_seq 
increment by 1 start with 1 nocache;


select * from join_member

drop table join_member