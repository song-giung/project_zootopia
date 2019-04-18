
create table pet_board(
	board_num number primary key,
	join_id varchar2(30)  not null,
	board_subject varchar2(300) not null,
	board_content varchar2(3000) not null,
	check_image number not null,
	board_readcount number not null,
	board_date date not null,
	board_modify_date date,
	board_type number not null,
	board_state number not null,
	board_cate varchar2(100) not null,
	constraint board_join_id_fk foreign key(join_id) references join_member(join_id)
)



create table board_reply(
	b_reply_num number primary key,
	join_id varchar2(30) not null,
	b_reply_ref number not null,
	b_reply_content varchar2(3000) not null,
	b_reply_date date not null,
	b_reply_state number not null,
	constraint board_reply_b_reply_ref_fk foreign key(b_reply_ref) references pet_board(board_num),
	constraint board_reply_join_id_fk foreign key(join_id) references join_member(join_id)
)



create table report(
report_num number primary key,
report_board_ref number ,
report_reply_ref number ,
report_type varchar2(30) not null,
report_reason varchar2(300) not null,
report_state varchar2(60) not null,
join_id varchar2(30) not null,
report_date date not null,
constraint report_join_id_fk foreign key(join_id) references join_member(join_id)
)



create table tag(
tag_num number primary key,
join_id varchar2(30) not null,
tag_cont varchar2(30) not null,
constraint tag_join_id_fk foreign key(join_id) references join_member(join_id)
)

create table up(
up_num number primary key,
join_id varchar2(30) not null,
board_num number not null,
constraint up_down_join_id_fk foreign key(join_id) references join_member(join_id),
constraint up_down_board_num_fk foreign key(board_num) references pet_board(board_num)
)

create table board_favorite(
board_favorite_num number primary key,
join_id varchar2(30) not null,
board_num number not null,

constraint board_favorite_join_id_fk foreign key(join_id) references join_member(join_id),
constraint board_favorite_board_num_fk foreign key(board_num) references pet_board(board_num)
)

create table board_image(
image_num number primary key,
join_id varchar2(30) not null,
board_num number not null,
board_original varchar2(150) ,
board_DBfile varchar2(150) ,
constraint board_image_join_id_fk foreign key(join_id) references join_member(join_id),
constraint board_image_board_num_fk foreign key(board_num) references pet_board(board_num)
)


drop table board_favorite
drop table up
drop table tag
drop table report
drop table board_reply
drop table board_image
drop table pet_board

--시퀀스 생성 해야 한다.
create sequence image_seq
increment by 1
start with 2500;

create sequence board_seq 
increment by 1 
start with 1;

create sequence board_reply_seq
increment by 1
start with 1000;

create sequence board_favorite_num_seq
increment by 1
start with 5000;

create sequence up_num_seq
increment by 1
start with 8000

create sequence report_num_seq
increment by 1
start with 4000
---------test----------------

select * from join_member
insert into pet_board values(
board_Seq.nextval,'test_id','제목','내용',null,null,0,sysdate,null,'all',0,'all');

		 select * from
		 (select rownum rnum, board_num, join_id, board_subject, board_content,
		    	board_file, board_original, board_readcount, board_date, board_modify_date, board_type,
		    	board_state, board_cate from
		 (select * from pet_board  where board_cate='dog' order by board_num desc))
		 
		 select count(*) from board_reply where b_reply_ref=131
		 delete board_image
		 delete board_Reply
		 delete pet_board
		 delete from board_image where image_num = 2621
		select * from board_reply
		select* from board_image
		select * from pet_board
		select count(*) from pet_board WHERE board_subject = ?
		update board_image set check_image = 0 where board_num = #{board_num}
		
		select * from pet_board,board_favorite where pet_board.board_num = board_favorite.board_num and board_favorite.join_id = 'admin'
			order by pet_board.board_num desc
			
			select count(*) from pet_board,board_favorite where pet_board.board_num = board_favorite.board_num and board_favorite.join_id ='admin'
			
			
			
			
			
			
	select * from(
		select rownum  rnum,  board_num, join_id, board_subject, board_content, check_image, 
			   board_readcount, board_date, board_modify_date, board_type, board_state,board_cate from(
		(select pet_board.board_num, pet_board.join_id, board_subject, board_content, check_image, 
			   board_readcount, board_date, board_modify_date, board_type, board_state,board_cate from pet_board,board_favorite where pet_board.board_num = board_favorite.board_num and board_favorite.join_id = 'admin'
	
		 	and board_cate = '1'
 				and board_subject like '%a%'	
		order by board_num desc))) where rnum>='1' and rnum<='10'
		
		
		select count(*) from pet_board,board_favorite where pet_board.board_num = board_favorite.board_num and board_favorite.join_id = 'admin'
				select count(*) from pet_board,board_favorite where pet_board.board_num = board_favorite.board_num and board_favorite.join_id = #{join_id}
		
		
 				and board_type=#{fav_type}
		
		select count(*) from pet_board where board_state = 1;
		select * from pet_board where board_state=1 order by board_num desc
		select count(*) from report where report_board_ref =6