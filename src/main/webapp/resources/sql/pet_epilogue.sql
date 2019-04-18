create table pet_epilogue(
	pet_id varchar2(20)
	REFERENCES pete_entrust ( pete_id ) ON DELETE CASCADE,
	pet_info varchar2(100), --������
	pet_feces varchar2(20), --��Һ� ������ ����
	pet_vaccin varchar2(20), --�������� ����
	pet_friendly varchar2(20), --ģȭ�� ����
	pet_disease varchar2(20), --�� ���� ����
	pet_bark varchar2(20), --�� ¢����
	foreign key(pet_id) references join_member(join_id)
)
select * from pet_epilogue
drop table pet_epilogue
delete from PET_EPILOGUE

insert into pet_epilogue 
values('admin9','zzz','YES','YES','YES','YES','YES')

select * from pet_epilogue where pet_id = 'admin9'

select count(pet_id) from pet_epilogue