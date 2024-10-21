select *
from   tbl_board;

select *
from   tbl_member;

create table tbl_board (
       board_no number primary key, -- 게시글번호
       title    varchar2(100) not null,-- 제목
       content  varchar2(1000) not null, -- 내용
       writer   varchar2(50) not null,--작성자
       view_cnt number default 0, --조회수
       write_date date default sysdate, --글 작성일시
       update_date date default sysdate -- 최종 수정일
       );
commit;
ALTER TABLE tbl_board 
RENAME Column upddate_date to update_date;
--board_no에 사용할 시퀀스 생성
create sequence board_seq;

select *
from   tbl_board;

--페이징. 한페이지당 5건씩 출력
--보드넘버를 기준으로 5개씩
--page라는 파라미터를 받아서 커리문을 실행하게 됨

--rownum을 붙인 정렬된 데이터에서 조건을 붙이기 위해서 또한번 b로 만들었음
select b.*
--rownum을 붙이기 위해 정렬된 데이터를 a로 만들었음.
from   ( select rownum rn, a.*
         from   ( select *
                  from   tbl_board
                  order by board_no) a ) b
where b.rn > (:page - 1) * 5
and   b.rn <= (:page * 5);
--데이터를 보드넘버로 순서대로 정렬 -> 정렬된 보드넘버 순으로 rownum을 붙였음 -> 그걸 전부 출력해서 조건을 걸었음.


insert into tbl_board (board_no, title, content, writer)
select board_seq.nextval, title, content, writer
from tbl_board;
commit;
--샘플 데이터 넣어보기
insert into tbl_board (board_no, title, content, writer)
values (board_seq.nextval, '게시글 테스트', '글작성 내용입니다', 'user11'); 

insert into tbl_board (board_no, title, content, writer)
values (board_seq.nextval, '게시글 테스트', '글작성 내용입니다', 'user15');

insert into tbl_board (board_no, title, content, writer)
values (board_seq.nextval, '게시글 테스트','글작성 내용입니다', 'user14') ;

insert into tbl_board (board_no, title, content, writer)
values (board_seq.nextval, '게시글 테스트', '글작성 내용입니다', 'test0001');

select m.member_name,
       b.*
from   tbl_board b JOIN tbl_member m
                     on b.writer = m.member_id
order by b.board_no;

--업로드할 파일이름 저장하는 컬럼
alter table tbl_board
add img varchar2(100);
--업로드 되는 파일은 톰캣 서버에 올리게 됨.


select *
from tbl_board;

                     