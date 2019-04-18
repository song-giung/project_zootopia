create table pete_epil(
	pete_epil_id varchar2(20)
	REFERENCES pete_entrust ( pete_id ) ON DELETE CASCADE,
	join_epil_id varchar2(20),
	pete_epil_subject varchar2(100), --����
	pete_epil_content varchar2(500), --����
	pete_epil_star varchar2(30), --����
	foreign key (pete_epil_id) references pete_entrust(pete_id),
	foreign key (join_epil_id) references join_member(join_id)
)
drop table pete_epil
select * from pete_epil

delete pete_epil where pete_epil_subject = 'ㅋ'

 popf6        popf4        고양이가 불안해해요        고양이를 맡겼었는데 돌아오고 나서부터 고양이가 불안 증세가 생겼어요.. 이게 어찌된 일이죠? NULL
