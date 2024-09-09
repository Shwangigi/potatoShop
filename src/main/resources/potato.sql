create table member(
   member_number varchar2(100) constraint pk_member_num primary key, -- 회원번호
   id varchar2(30) not null unique,  -- 아이디
   pass varchar2(30) not null, -- 비밀번호
   name varchar2(30) not null, -- 이름
   nickName varchar2(30) not null, -- 닉네임
   phone varchar2(30) not null, -- 전화번호
   adress varchar2(100) not null, -- 주소
   grade number(1) not null, -- 회원등급
   profile_image varchar2(1000) not null, -- 프로필
   regidate date default sysdate, -- 회원가입일  
   update_date date default sysdate -- 회원수정일
); -- 멤버 테이블

select * from member;
SELECT * FROM member WHERE id = 'sql3';

CREATE TABLE user_table (
  user_number VARCHAR2(100), -- 회원번호 member_number외래키
  likes NUMBER NOT NULL, -- 좋아요 수
  reports NUMBER NOT NULL, -- 신고 수
  temper NUMBER NOT NULL, -- 온도
  trades NUMBER NOT NULL, -- 거래완료 수
  CONSTRAINT fk_user_member_num FOREIGN KEY (user_number) REFERENCES member(member_number)
); -- user 테이블

create table reports(
   report_number varchar2(1000) constraint pk_report_num primary key, -- 신고번호
   writer_id varchar2(30) not null, -- 신고자 (member_id)
   defendant varchar2(100), -- 신고 당한사람 fk(member_number)
   status number(1) not null, -- 신고처리 상태
   regidate date default sysdate, -- 신고일
   done_date date default sysdate, -- 신고처리일
   constraint fk_report_defendant_number foreign key(defendant) references member(member_number)
); -- 신고 테이블

select * from reports;

create table board(
   board_number varchar2(1000) constraint pk_board_num primary key, -- 글 번호
   types varchar2(100) not null, -- 게시판 구분
   title varchar2(100) not null, -- 글 제목
   content varchar2(1000) not null, -- 글 내용
   writer varchar2(30) not null, -- 작성자 
   writer_number varchar(50) , -- 작성자 번호 fk(member_number)
   status varchar2(1000) not null, -- 상품의 상태
   photo_name varchar2(1000) , -- 첨부사진
   regidate date default sysdate, -- 등록일/   수정일 필요하면 추가해주세욤
   constraint fk_board_writer_number foreign key(writer_number) references member(member_number)
); -- 게시판

alter table board rename column photoname to photo_name;

select * from member;
select * from board;
select * from reports;

create sequence seq_board;

create table reply(
   reply_number varchar2(100) constraint pk_reply_num primary key, -- 댓글 번호
   board_number varchar2(100), -- 글 번호 fk board_number
   content varchar2(1000) not null, -- 댓글 내용
   writer varchar2(30) not null, -- 작성자(member.nickname) 자바에서 연결
   regidate date default sysdate, -- 등록일
   constraint fk_reply_board_number foreign key(board_number) references board(board_number)
); -- 댓글

create table re_reply(
   re_reply_number varchar2(1000) constraint pk_re_reply_num primary key, -- 대댓글 번호
   reply_number varchar2(100), -- 댓글 번호
   content varchar2(1000) not null, -- 댓글 내용
   writer varchar2(30) not null, -- 작성자
   regidate date default sysdate, -- 등록일
    constraint fk_re_reply_number foreign key(reply_number) references reply(reply_number)
); -- 대댓글

create table chat(
   chat_number varchar2(1000) constraint pk_chat_num primary key, -- 채팅번호
   sender varchar2(100) not null, -- 보낸사람
   reciever varchar2(100) not null, -- 받는 사람 
   content varchar2(1000) not null, -- 내용
   time_stamp date default sysdate  -- 보낸시간
);


insert into reports(report_number, writer_id, defendant, status) values(seq_board.nextval,'qqq', '01J6TP08EPYFFXJYAAMJ9KV2QW' ,0);
insert into reports(report_number, writer_id, defendant, status) values(seq_board.nextval,'twrt', 'B1DDC50458AF4A179FE27CA0857B8E8A' ,1);
insert into reports(report_number, writer_id, defendant, status) values(seq_board.nextval,'sql5', '9A3897B0C5C643B3A7DF98EB5697C3F3' ,4);

UPDATE reports
SET status = 0,
    regidate = SYSDATE,
    done_date = SYSDATE
WHERE status = 1;
