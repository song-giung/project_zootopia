create table pete_reservation(
	pete_id varchar2(20)
	REFERENCES pete_entrust ( pete_id ) ON DELETE CASCADE,
	join_id varchar2(20) UNIQUE,
	pete_kind varchar2(50),--��������
	pete_board_num number(11), --�Խñ� ��ȣ, ����
	pete_kind_many varchar2(20),--����������
	pete_date varchar2(50),   --������۳�¥
	pete_date2 varchar2(50),   --���ೡ��¥
	pete_price number(30),     --���డ��
	foreign key (pete_id) references pete_entrust(pete_id),
	foreign key (join_id) references join_member(join_id),
	foreign key (pete_board_num) references pete_entrust(pete_board_num)
)

select CONSTRAINT_NAME, TABLE_NAME, R_CONSTRAINT_NAME
from user_constraints
where CONSTRAINT_NAME = 'FK_LEPORTS__REF_50276_EVENT_RE'
delete from pete_reservation
select * from pete_reservation
drop table pete_reservation
drop table pete_entrust
select * from pete_entrust

ALTER TABLE pete_reservation DROP COLUMN pete_raise_pet
alter table pete_reservation add foreign key(pete_id) references pete_entrust(pete_entrust) on delete cascade

ALTER TABLE pete_reservation
ADD CONSTRAINT FK_PETEDELETE
FOREIGN KEY (pete_id)
REFERENCES pete_entrust ( pete_id )
ON DELETE CASCADE


delete from pete_entrust where pete_board_num=89