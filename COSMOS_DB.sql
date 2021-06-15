-- DB ���� ����

drop table tbl_user;
drop table tbl_address_info;
drop table tbl_product;
drop table tbl_product_option;
drop table tbl_order;
drop table tbl_order_detail;
drop sequence tbl_address_info_seq;
drop sequence tbl_order_details_seq;
drop sequence test1_seq;


CREATE TABLE tbl_product (
	product_seq NUMERIC NOT NULL, -- ��ǰ��ȣ,
	product_id NUMERIC NOT NULL, -- ��ǰ���̵�,
	product_title VARCHAR2(100) NOT NULL, -- ��ǰ����,
	product_price NUMERIC NOT NULL, -- ��ǰ����,
	product_img VARCHAR2(100) NOT NULL, -- ��ǰ�̹���,
	product_size VARCHAR2(100) NULL, -- ��ǰ������,
	product_color VARCHAR2(100) NULL, -- ��ǰ�÷�,
	product_gender VARCHAR2(100) NOT NULL, -- ��ǰ����,
	product_content VARCHAR2(100) NULL, -- ��ǰ����,
	product_material VARCHAR2(100) NULL, -- ��ǰ����,
	product_category VARCHAR2(50) NULL, -- ��ǰī�װ�,
	product_date VARCHAR2(30) NULL -- ��ǰ��ϳ�¥
);

-- ��ǰ
ALTER TABLE tbl_product
	ADD CONSTRAINT PK_tbl_product -- ��ǰ �⺻Ű
	PRIMARY KEY (
		product_seq -- ��ǰ��ȣ
	);
    
    
    
-- ��ǰ�ɼ�
CREATE TABLE tbl_product_option (
	product_seq NUMERIC NULL, -- ��ǰ��ȣ,
	product_id NUMERIC NULL, -- ��ǰ���̵�,
	product_stock NUMERIC NULL, -- ��ǰ���,
	product_saled NUMERIC NULL -- ��ǰ�Ǹŷ�
);

ALTER TABLE tbl_product_option
	ADD CONSTRAINT fk_tbl_product_option foreign key(product_seq)-- ��ǰ �⺻Ű
	references tbl_product(product_seq); -- ��ǰ��ȣ;
    
    
    
    
    
    
    
    
    
    
    
    
    
    
-- �ֹ�


create table tbl_order (
    order_id     varchar2(50) not null,
    user_email      VARCHAR2(200) not null,
    post_code varchar2(100) not null,
    address   varchar2(100) not null,
    detail_address varchar2(100) not null,
    order_product_amount number       not null,
    total_price number not null,
    order_status varchar2(20) default '����غ���',
    order_date   varchar2(50),   
    primary key(order_Id)
);
alter table tbl_order
    add constraint tbl_order_user_email foreign key(user_email)
    references tbl_user(user_email);
alter table tbl_order add pay_info varchar2(100);
update tbl_order set pay_info = 'īī������';
alter table tbl_order add user_name varchar2(100);
update tbl_order set user_name = '�Ĵ��ù�';

-- �ֹ� ��



create table tbl_order_detail (
    order_detail_num number not null,
    order_id     varchar2(50) not null,
    product_seq number(20) not null,
    money number       not null,
    amount number not null,
    primary key(order_detail_num)
);

create sequence tbl_order_details_seq;

create sequence tbl_address_info_seq;

create sequence tbl_product_seq;

create sequence tbl_product_option_seq;

alter table tbl_order_detail
    add constraint tbl_order_detail_orderId foreign key(order_Id)
    references tbl_order(order_id);
    
alter table tbl_order_detail
    add constraint tbl_order_detail_product_seq foreign key(product_seq)
    references tbl_product(product_seq);
    
    
    
-- ����


CREATE TABLE tbl_user (
    user_email VARCHAR2(100) primary key, -- �̸���,
    user_password VARCHAR2(100), -- ��й�ȣ,
    user_name VARCHAR2(50), -- �̸�,
    user_birthday VARCHAR2(100) , -- �������,
    user_phone VARCHAR2(100) , -- �ڵ���,
    user_gender VARCHAR2(20) , --����
    user_regdate VARCHAR2(50), -- ��������,
    user_role NUMBER, -- ������
    user_bank varchar2(20), --���� 
    user_account varchar2(100), --���¹�ȣ
    user_repay varchar2(100) -- �ҵ������ ����
);


commit;





CREATE TABLE tbl_address_info (
    address_seq number(20) primary key,
    user_email VARCHAR2(100) not null, -- �̸���
    constraints user_email foreign key(user_email) references tbl_user(user_email),
    post_code varchar2(100) NULL, -- �����ȣ,
    address VARCHAR2(200) NULL, -- �ּ�,
    detail_address VARCHAR2(200) NULL, -- ���ּ�
    address_name varchar2(100) not null,
    address_phone varchar2(100) not null,
    address_phone2 varchar2(100)
);
alter table tbl_address_info add user_name varchar2(100);


commit;

select * from tbl_user;
select * from tbl_address_info;
delete tbl_address_info;


drop sequence tbl_address_seq;

create sequence tbl_address_info_seq;


-- ��ǰ ������

insert into tbl_product values(tbl_product_seq.nextval, 1, '�Ƶ���ǰ1', 20000, '�̹���4.jpg', 'XL','BLACK','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 1, '�Ƶ���ǰ1', 20000, '�̹���4.jpg', 'L','WHITH','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 2, '�Ƶ���ǰ2', 23000, '�̹���4.jpg', 'XL','BLACK','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 2, '�Ƶ���ǰ2', 23000, '�̹���4.jpg', 'L','BLACK','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 3, '�Ƶ���ǰ3', 25000, '�̹���4.jpg', 'L','RED','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 3, '�Ƶ���ǰ3', 25000, '�̹���4.jpg', 'M','DARKRED','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 3, '�Ƶ���ǰ3', 25000, '�̹���4.jpg', 'S','BLACK','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 3, '�Ƶ���ǰ3', 25000, '�̹���4.jpg', 'S','GREEN','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 3, '�Ƶ���ǰ3', 25000, '�̹���4.jpg', 'XS','YELLOW','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 4, '�Ƶ���ǰ4', 19000, '�̹���4.jpg', 'XL','BLACK','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);

insert into tbl_product values(tbl_product_seq.nextval, 5, '������ǰ1', 20000, '�̹���1.jpg', 'XL','BLACK','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 5, '������ǰ1', 20000, '�̹���1.jpg', 'L','WHITH','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 6, '������ǰ2', 23000, '�̹���1.jpg', 'XL','BLACK','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 6, '������ǰ2', 23000, '�̹���1.jpg', 'L','BLACK','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 6, '������ǰ2', 23000, '�̹���1.jpg', 'L','RED','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 7, '������ǰ3', 25000, '�̹���1.jpg', 'M','DARKRED','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 7, '������ǰ3', 25000, '�̹���1.jpg', 'S','BLACK','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 8, '������ǰ4', 25000, '�̹���1.jpg', 'S','GREEN','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 8, '������ǰ4', 25000, '�̹���1.jpg', 'XS','YELLOW','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 9, '������ǰ5', 19000, '�̹���1.jpg', 'XL','BLACK','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);

insert into tbl_product values(tbl_product_seq.nextval, 10, '������ǰ1', 20000, '�̹���2.jpg', 'XL','BLACK','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 10, '������ǰ1', 20000, '�̹���2.jpg', 'L','WHITH','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 11, '������ǰ2', 23000, '�̹���2.jpg', 'XL','BLACK','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 11, '������ǰ2', 23000, '�̹���2.jpg', 'L','BLACK','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 12, '������ǰ3', 25000, '�̹���2.jpg', 'L','RED','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 12, '������ǰ3', 25000, '�̹���2.jpg', 'M','DARKRED','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 13, '������ǰ4', 26000, '�̹���2.jpg', 'S','BLACK','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 13, '������ǰ4', 26000, '�̹���2.jpg', 'S','GREEN','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 13, '������ǰ4', 26000, '�̹���2.jpg', 'XS','YELLOW','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 13, '������ǰ4', 26000, '�̹���2.jpg', 'XL','BLACK','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);

insert into tbl_product values(tbl_product_seq.nextval, 14, '�Ƶ��Ǽ�����1', 20000, '�̹���3.jpg', 'XL','BLACK','KIDS','�Ƶ���ǰ�Դϴ�.','��','�Ǽ��縮',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 14, '�Ƶ��Ǽ�����1', 20000, '�̹���3.jpg', 'L','WHITH','KIDS','�Ƶ���ǰ�Դϴ�.','��','�Ǽ��縮',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 14, '�Ƶ��Ǽ�����1', 20000, '�̹���3.jpg', 'XL','BLACK','KIDS','�Ƶ���ǰ�Դϴ�.','��','�Ǽ��縮',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 15, '�Ƶ��Ǽ�����2', 23000, '�̹���3.jpg', 'L','BLACK','KIDS','�Ƶ���ǰ�Դϴ�.','��','�Ǽ��縮',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 15, '�Ƶ��Ǽ�����2', 23000, '�̹���3.jpg', 'L','RED','KIDS','�Ƶ���ǰ�Դϴ�.','��','�Ǽ��縮',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 15, '�Ƶ��Ǽ�����2', 23000, '�̹���3.jpg', 'M','DARKRED','KIDS','�Ƶ���ǰ�Դϴ�.','��','�Ǽ��縮',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 15, '�Ƶ��Ǽ�����2', 23000, '�̹���3.jpg', 'S','BLACK','KIDS','�Ƶ���ǰ�Դϴ�.','��','�Ǽ��縮',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 16, '�Ƶ��Ǽ�����3', 25000, '�̹���3.jpg', 'S','GREEN','KIDS','�Ƶ���ǰ�Դϴ�.','��','�Ǽ��縮',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 16, '�Ƶ��Ǽ�����3', 25000, '�̹���3.jpg', 'XS','YELLOW','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 16, '�Ƶ��Ǽ�����3', 25000, '�̹���3.jpg', 'XL','BLACK','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);

insert into tbl_product values(tbl_product_seq.nextval, 20, '�����Ǽ�����1', 20000, '�̹���5.jpg', 'XL','BLACK','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 20, '�����Ǽ�����1', 20000, '�̹���5.jpg', 'L','WHITH','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 21, '�����Ǽ�����2', 23000, '�̹���5.jpg', 'XL','BLACK','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 21, '�����Ǽ�����2', 23000, '�̹���5.jpg', 'L','BLACK','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 22, '�����Ǽ�����3', 25000, '�̹���5.jpg', 'L','RED','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 22, '�����Ǽ�����3', 25000, '�̹���5.jpg', 'M','DARKRED','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 23, '�����Ǽ�����4', 25000, '�̹���5.jpg', 'S','BLACK','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 23, '�����Ǽ�����4', 25000, '�̹���5.jpg', 'S','GREEN','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 23, '�����Ǽ�����4', 25000, '�̹���5.jpg', 'XS','YELLOW','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 24, '�����Ǽ�����5', 19000, '�̹���5.jpg', 'XL','BLACK','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);

insert into tbl_product values(tbl_product_seq.nextval, 25, '�����Ǽ�����1', 20000, '�̹���6.jpg', 'XL','BLACK','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 25, '�����Ǽ�����1', 20000, '�̹���6.jpg', 'L','WHITH','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 26, '�����Ǽ�����2', 23000, '�̹���6.jpg', 'XL','BLACK','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 26, '�����Ǽ�����2', 23000, '�̹���6.jpg', 'L','BLACK','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 27, '�����Ǽ�����3', 25000, '�̹���6.jpg', 'L','RED','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 27, '�����Ǽ�����3', 25000, '�̹���6.jpg', 'M','DARKRED','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 27, '�����Ǽ�����3', 25000, '�̹���6.jpg', 'S','BLACK','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 27, '�����Ǽ�����3', 25000, '�̹���6.jpg', 'S','GREEN','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 27, '�����Ǽ�����3', 25000, '�̹���6.jpg', 'XS','YELLOW','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 27, '�����Ǽ�����3', 25000, '�̹���6.jpg', 'XL','BLACK','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);

select * from tbl_product;
update tbl_product set product_gender = 'W' where product_id between 20 and 24;
update tbl_product set product_gender = 'M' where product_id between 25 and 27;
update tbl_product set product_category = '�Ǽ��縮' where product_id between 14 and 27;
update tbl_product set product_gender = 'M' where product_id between 10 and 13;
update tbl_product set product_gender = 'W' where product_id between 5 and 9;

-- ��ǰ �ɼ� ������


insert into tbl_product_option values(tbl_product_option_seq.nextval, 1, 250, 10);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 1, 260, 300);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 2, 240, 800);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 2, 100, 100);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 3, 200, 10);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 3, 30, 20);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 3, 250, 30);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 3, 270, 70);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 3, 290, 500);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 4, 100, 900);

insert into tbl_product_option values(tbl_product_option_seq.nextval, 5, 250, 10);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 5, 260, 300);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 6, 240, 800);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 6, 100, 100);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 6, 200, 10);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 7, 30, 20);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 7, 250, 30);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 8, 270, 70);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 8, 290, 500);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 9, 100, 900);

insert into tbl_product_option values(tbl_product_option_seq.nextval, 10, 250, 10);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 10, 260, 300);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 11, 240, 800);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 11, 100, 100);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 12, 200, 10);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 12, 30, 20);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 13, 250, 30);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 13, 270, 70);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 13, 290, 500);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 13, 100, 900);

insert into tbl_product_option values(tbl_product_option_seq.nextval, 14, 250, 10);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 14, 260, 300);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 14, 240, 800);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 15, 100, 100);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 15, 200, 10);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 15, 30, 20);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 15, 250, 30);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 16, 270, 70);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 16, 290, 500);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 16, 100, 900);

insert into tbl_product_option values(tbl_product_option_seq.nextval, 20, 250, 10);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 20, 260, 300);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 21, 240, 800);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 21, 100, 100);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 22, 200, 10);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 22, 30, 20);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 23, 250, 30);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 23, 270, 70);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 23, 290, 500);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 24, 100, 900);

insert into tbl_product_option values(tbl_product_option_seq.nextval, 25, 250, 10);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 25, 260, 300);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 26, 240, 800);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 26, 100, 100);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 27, 200, 10);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 27, 30, 20);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 27, 250, 30);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 27, 270, 70);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 27, 290, 500);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 27, 100, 900);





-- ȸ�� ���� ������
insert into tbl_user values('suovj140@gmail.com', 'rnwlgns2', '������', '1993-06-15', '010-4474-9986','M', '2021-06-11', 0, null, null, null);
insert into tbl_user values('test1@gmail.com', 'test1', 'test1', '1966-04-85', '010-4357-7979','W',sysdate, 1, null, null, null);


-- ȸ�� ����� ������
insert into tbl_address_info values(tbl_address_info_seq.nextval, 'suovj140@gmail.com', '95554', '����Ư���� �������� ��굿 121-289', '���º� 701ȣ', '����',   '010-4474-9986', null);
insert into tbl_address_info values(tbl_address_info_seq.nextval, 'suovj140@gmail.com', '95554', '����Ư���� ������ �̴�', '�п� 301ȣ', '����',   '010-4444-7897', null);
insert into tbl_address_info values(tbl_address_info_seq.nextval, 'suovj140@gmail.com', '95554', '����Ư���� ���ʱ� ����', '���� 1��', '�����',   '010-0044-4979', null);
insert into tbl_address_info values(tbl_address_info_seq.nextval, 'suovj140@gmail.com', '95554', '����Ư���� ��� ����', '����Ʈ 44��', 'ģ����',   '010-4949-7797', null);
insert into tbl_address_info values(tbl_address_info_seq.nextval, 'test1@gmail.com', '54354', '�̼��� ��� 1', '�������', '���1',  '010-0000-0000', null);
insert into tbl_address_info values(tbl_address_info_seq.nextval, 'test1@gmail.com', '46748', '�̼����� �³�', '���������', '���2',  '010-0000-0000', null);


-- �ֹ� ������
insert into tbl_order values('�ֹ�1', 'suovj140@gmail.com', '53497', '����Ư���� �������� ��굿 121-289', '���º� 701ȣ', 2, 254000, '����غ���', sysdate);
insert into tbl_order values('�ֹ�2', 'suovj140@gmail.com', '53497','����Ư���� �������� ��굿 121-111', '���º� 1101ȣ', 3, 557000, '����غ���', sysdate);
insert into tbl_order values('�ֹ�3', 'suovj140@gmail.com', '53497','����Ư���� �������� ��굿 121-111', '���º� 1101ȣ', 3, 557000, '����غ���', sysdate);
insert into tbl_order values('�ֹ�4', 'suovj140@gmail.com', '53497','����Ư���� �������� ��굿 121-111', '���º� 1101ȣ', 3, 557000, '����غ���', sysdate);
insert into tbl_order values('�ֹ�5', 'suovj140@gmail.com', '53497','����Ư���� �������� ��굿 121-111', '���º� 1101ȣ', 3, 557000, '����غ���', sysdate);
insert into tbl_order values('�ֹ�6', 'suovj140@gmail.com', '53497','����Ư���� �������� ��굿 121-111', '���º� 1101ȣ', 3, 557000, '����غ���', sysdate);
insert into tbl_order values('�ֹ�7', 'suovj140@gmail.com', '53497','����Ư���� �������� ��굿 121-111', '���º� 1101ȣ', 3, 557000, '����غ���', sysdate);
insert into tbl_order values('�ֹ�8', 'suovj140@gmail.com', '53497','����Ư���� �������� ��굿 121-111', '���º� 1101ȣ', 3, 557000, '����غ���', sysdate);
insert into tbl_order values('�ֹ�9', 'suovj140@gmail.com', '53497','����Ư���� �������� ��굿 121-111', '���º� 1101ȣ', 3, 557000, '����غ���', sysdate);
insert into tbl_order values('�ֹ�10', 'suovj140@gmail.com', '53497','����Ư���� �������� ��굿 121-111', '���º� 1101ȣ', 3, 557000, '����غ���', sysdate);
insert into tbl_order values('�ֹ�11', 'suovj140@gmail.com', '53497','����Ư���� �������� ��굿 121-111', '���º� 1101ȣ', 3, 557000, '����غ���', sysdate);
insert into tbl_order values('�ֹ�12', 'suovj140@gmail.com', '53497','����Ư���� �������� ��굿 121-111', '���º� 1101ȣ', 3, 557000, '����غ���', sysdate);
insert into tbl_order values('�ֹ�13', 'suovj140@gmail.com', '53497','����Ư���� �������� ��굿 121-111', '���º� 1101ȣ', 3, 557000, '����غ���', sysdate);
insert into tbl_order values('�ֹ�14', 'suovj140@gmail.com', '53497','����Ư���� �������� ��굿 121-111', '���º� 1101ȣ', 3, 557000, '����غ���', sysdate);


-- �ֹ� �� ������

insert into tbl_order_detail values(tbl_order_details_seq.nextval, '�ֹ�1', 1, 172000, 2);
insert into tbl_order_detail values(tbl_order_details_seq.nextval, '�ֹ�1', 7, 10000, 1);
insert into tbl_order_detail values(tbl_order_details_seq.nextval, '�ֹ�1', 8, 25000, 4);
insert into tbl_order_detail values(tbl_order_details_seq.nextval, '�ֹ�2', 3, 27560, 3);
insert into tbl_order_detail values(tbl_order_details_seq.nextval, '�ֹ�2', 1, 2550, 7);
insert into tbl_order_detail values(tbl_order_details_seq.nextval, '�ֹ�3', 2, 277760, 2);
insert into tbl_order_detail values(tbl_order_details_seq.nextval, '�ֹ�3', 7, 2990, 1);
insert into tbl_order_detail values(tbl_order_details_seq.nextval, '�ֹ�3', 10, 23000, 3);

select * from tbl_product;
select * from tbl_product_option;
select * from tbl_user;
select * from tbl_address_info;
select * from tbl_order;
select * from tbl_order_detail;

commit;



-- ��ǰ ����Ʈ ���

select *
from
(select rownum rnum, p.*
from
(select product_id, product_title, product_content, product_price, product_gender, product_category, product_img, wm_concat(product_color) product_color, wm_concat(product_size) product_size, product_saled
from
tbl_product, (select product_id product_option_id, sum(product_saled) product_saled from tbl_product_option group by product_id) where product_id = product_option_id
group by product_id, product_title, product_content, product_price, product_gender, product_category, product_img, product_saled) p where product_gender = 'KIDS');


-- �� ��ǰ ���� (����¡ ó���� �ʿ���)
select max(rownum) from (select product_id, product_title, product_content, product_price, product_gender, product_category, product_img, wm_concat(product_color) product_color, wm_concat(product_size) product_size
from tbl_product group by product_id, product_title, product_content, product_price, product_gender, product_category, product_img) p;

-- �ֹ� ���̺� ��ȸ
select * from tbl_order where order_id = '�ֹ�1';

-- �ش� �ֹ��� �� ���̺� ��ȸ
select p.*, od.order_id, od.money, od.amount from tbl_order_detail od, tbl_product p where od.order_id = '�ֹ�1' and od.product_seq = p.product_seq;


