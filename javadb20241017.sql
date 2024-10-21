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


select *
from tbl_board;

                     