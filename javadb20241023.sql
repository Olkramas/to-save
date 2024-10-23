select *
from   tbl_board;

select *
from   tbl_member;

create table tbl_board (
       board_no number primary key, -- �Խñ۹�ȣ
       title    varchar2(100) not null,-- ����
       content  varchar2(1000) not null, -- ����
       writer   varchar2(50) not null,--�ۼ���
       view_cnt number default 0, --��ȸ��
       write_date date default sysdate, --�� �ۼ��Ͻ�
       update_date date default sysdate -- ���� ������
       );
commit;
ALTER TABLE tbl_board 
RENAME Column upddate_date to update_date;
--board_no�� ����� ������ ����
create sequence board_seq;

select *
from   tbl_board;

--����¡. ���������� 5�Ǿ� ���
--����ѹ��� �������� 5����
--page��� �Ķ���͸� �޾Ƽ� Ŀ������ �����ϰ� ��

--rownum�� ���� ���ĵ� �����Ϳ��� ������ ���̱� ���ؼ� ���ѹ� b�� �������
select b.*
--rownum�� ���̱� ���� ���ĵ� �����͸� a�� �������.
from   ( select rownum rn, a.*
         from   ( select *
                  from   tbl_board
                  order by board_no) a ) b
where b.rn > (:page - 1) * 5
and   b.rn <= (:page * 5);
--�����͸� ����ѹ��� ������� ���� -> ���ĵ� ����ѹ� ������ rownum�� �ٿ��� -> �װ� ���� ����ؼ� ������ �ɾ���.


insert into tbl_board (board_no, title, content, writer)
select board_seq.nextval, title, content, writer
from tbl_board;
commit;
--���� ������ �־��
insert into tbl_board (board_no, title, content, writer)
values (board_seq.nextval, '�Խñ� �׽�Ʈ', '���ۼ� �����Դϴ�', 'user11'); 

insert into tbl_board (board_no, title, content, writer)
values (board_seq.nextval, '�Խñ� �׽�Ʈ', '���ۼ� �����Դϴ�', 'user15');

insert into tbl_board (board_no, title, content, writer)
values (board_seq.nextval, '�Խñ� �׽�Ʈ','���ۼ� �����Դϴ�', 'user14') ;

insert into tbl_board (board_no, title, content, writer)
values (board_seq.nextval, '�Խñ� �׽�Ʈ', '���ۼ� �����Դϴ�', 'test0001');

select m.member_name,
       b.*
from   tbl_board b JOIN tbl_member m
                     on b.writer = m.member_id
order by b.board_no;

--���ε��� �����̸� �����ϴ� �÷�
alter table tbl_board
add img varchar2(100);
--���ε� �Ǵ� ������ ��Ĺ ������ �ø��� ��.

--��� (��۹�ȣ, ����, �ۼ���, �ۼ��Ͻ�, �Խñ۹�ȣ)
create table tbl_reply (
       reply_no number,
       reply    varchar2(1000) not null,
       replyer  varchar2(30) not null,
       board_no number not null,
       reply_date date default sysdate
);

create sequence reply_seq;

alter table tbl_reply add constraint pk_reply primary key (reply_no);
            
insert into tbl_reply(
       reply_no,
       reply,
       replyer,
       board_no)
values (reply_seq.nextval,
        '���5',
        'user01',
        173);
        
--173�� �Խù��� ���� ����� ���� ����
select *
from   tbl_reply
where  board_no = 173;

commit;

desc tbl_reply;

--/*+ */ �� �ȿ� �����ȹ�� ���� �� ����
select a.*
from (  select /*+ INDEX_DESC (r pk_reply)*/ rownum rn, r.*
        from   tbl_reply r
        where  board_no = :boardNo) a
where a.rn > (:page - 1) * 5
and   a.rn <= :page * 5;


delete from tbl_reply;

select count(1)
from   tbl_reply;
select reply_seq.nextval