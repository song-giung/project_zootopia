create table pete_entrust(
	--user_id varchar2(30) primary key ȸ�� ���̺� ID ����
	pete_id varchar2(20) UNIQUE
	REFERENCES join_member ( join_id ) ON DELETE CASCADE,
	pete_board_num number(11) primary key, --�Խñ۹�ȣ, ������
	pete_subject varchar2(100), --����
	pete_content varchar2(500), --����
	pete_house_photo varchar2(300), --������	
	pete_location varchar2(100),--����ġ
	pete_space varchar2(20), --���� ����, ����or����Ʈ
	pete_animals_kind varchar2(20), --�ٸ� ���� ����
	pete_walk varchar2(20),    --���å ����
	pete_family varchar2(20),   --���� ���� ����
	pete_house_original varchar2(300), --������ ��������
	pete_pass varchar2(50), --��й�ȣ
	pete_time_in varchar2(50),    --üũ�� �ð�
	pete_time_in2 varchar2(50),    --üũ�� �ð�
	pete_time_out varchar2(50),    --üũ�ƿ� �ð�
	pete_time_out2 varchar2(50),    --üũ�ƿ� �ð�	
	foreign key (pete_id) references join_member(join_id)
)

alter table pete_entrust modify(pete_content varchar2(2000))

select * from pete_entrust where pete_board_num =90
select CONSTRAINT_NAME, TABLE_NAME, R_CONSTRAINT_NAME
delete from pete_entrust where pete_board_num = 89
from user_constraints
where CONSTRAINT_NAME = 'SYS_C007804' 
insert into pete_entrust values('admin',)
select * from pete_entrust

SELECT * FROM ALL_CONSTRAINTS WHERE TABLE_NAME = 'pete_entrust';

insert into pete_entrust values(
	'admin', pete_num_seq.nextval, '����','�����Դϴ�','������','����ġ',
	'��������','�ٸ���������','���å','������������','��������������'
)
alter table pete_entrust modify(pete_subject varchar2(100)) 
drop table pete_entrust
delete from pete_entrust
alter table pete_entrust add(pete_time_in2 varchar2(50))
alter table pete_entrust drop column petc_original
alter table pete_entrust rename column pete_houst_photo to pete_house_photo
select * from pete_entrust
select * from (select rownum rnum, pete_id, pete_board_num, pete_subject, pete_content,
		pete_house_photo, pete_location, pete_house_original from pete_entrust)
		
		
create sequence pete_num_seq
increment by 1 start with 1 nocache;


select last_number from user_sequences where sequence_name='pete_num_seq'
select * from pete_entrust where pete_board_num = 70;
select * from (select rownum rnum, pete_id, pete_board_num, pete_subject, pete_content, pete_house_photo, pete_location,pete_space,pete_animals_kind, pete_walk,pete_family,pete_house_original from 
(select * from pete_entrust WHERE pete_id like '%pop%' ) )
where rnum >= ((1-1) * ? + 1 ) and rnum <= (? * ?) 