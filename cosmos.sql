create table product(
product_seq number(20) primary key,
product_title varchar2(500),
product_price number(20),
product_color varchar2(500),
product_img varchar2(500),
product_gender varchar2(500),
product_size varchar2(500),
product_stock number(20),
product_sale number(20),
product_category varchar2(500),
product_content varchar2(3000)
);

drop table product;
create sequence product_seq INCREMENT by 1 start with 0 minvalue 0;
drop sequence product_seq;
insert into product values(product_seq.nextval, '��������Ʈ �� �巹��', 150000, 'BLACK', '�̹���1', '����', 'XL', 350, 78, '����', '��ǳ �ߵǴ� ����');
insert into product values(product_seq.nextval, '', 30000, 'BLUE', '�̹���2', '����', 'M', 120, 31, 'ġ��', '�� ġ��');
insert into product values(product_seq.nextval, '��������Ʈ �� �巹��', 150000, 'Blue', '�̹���1', '����', 'XL', 350, 78, '����', '��ǳ �ߵǴ� ����');

insert into product values(product_seq.nextval, '��������Ʈ �� �巹��', 150000, 'red', '�̹���1', '����', 'XL', 350, 78, '����', '��ǳ �ߵǴ� ����');

insert into product values(product_seq.nextval, '��������Ʈ �� �巹��', 150000, 'yellow', '�̹���1', '����', 'XL', 350, 78, '����', '��ǳ �ߵǴ� ����');

delete from product;
select * from product;
commit;
SELECT * FROM PRODUCT;

        SELECT * FROM product
        ORDER BY product_seq;
        
        SELECT * FROM product WHERE product_seq = 1;
        
        select * from users;
        
        commit;
        
        
create table fileuploadtest(
fileseq number(5) primary key,
filename varchar2(300),
filecontent blob
);



create table test1(
test1_seq number(5) primary key,
test1_name varchar2(300),
test1_price number(10),
test1_style varchar2(300));

drop table test1;
drop table test2;
create table test2(
test1_seq number(5),
test2_size1 varchar2(300),
constraints test1_seq foreign key(test1_seq) references test1(test1_seq));

create sequence test1_seq increment by 1 start with 0 minvalue 0;

select * from test1;
select * from test2;
insert into test1 values(test1_seq.nextval, '��ǰ4', 4000, '����');
insert into test1 values(test1_seq.nextval, '��ǰ5', 57000, '����');
insert into test1 values(test1_seq.nextval, '��ǰ6', 63000, '����');
insert into test1 values(test1_seq.nextval, '��ǰ7', 25000, '�Ź�');
insert into test1 values(test1_seq.nextval, '��ǰ8', 14000, '�Ź�');
insert into test1 values(test1_seq.nextval, '��ǰ9', 28000, '����');
insert into test1 values(test1_seq.nextval, '��ǰ10', 72000, '����');
insert into test1 values(test1_seq.nextval, '��ǰ11', 30000, '����');

insert into test2 values(1, 'black');
insert into test2 values(1, 'blue');
insert into test2 values(1, 'lightblue');
insert into test2 values(1, 'yellow');
insert into test2 values(1, 'pink');
insert into test2 values(1, 'white');
insert into test2 values(1, 'green');

insert into test2 values(2, 'black');
insert into test2 values(2, 'blue');
insert into test2 values(2, 'lightblue');
insert into test2 values(2, 'yellow');
insert into test2 values(2, 'pink');
insert into test2 values(2, 'white');
insert into test2 values(2, 'green');

select * from test2;
select * from test1;

select * from (select t1.test1_name, t1.test1_price, t1.test1_style, t2.test2_size1 from test1 t1, test2 t2) where test1_name='��ǰ1' and test2_size1='black';




-- USER SQL
CREATE USER "test1" IDENTIFIED BY "test1"  
DEFAULT TABLESPACE "USERS"
TEMPORARY TABLESPACE "TEMP";

-- QUOTAS
ALTER USER "test1" QUOTA UNLIMITED ON "USERS";

-- ROLES
GRANT "DBA" TO "test1" WITH ADMIN OPTION;

-- SYSTEM PRIVILEGES

        select * from (select p.product_seq, p.product_title, p.product_price, p.product_img, p.product_gender, p.product_size, p.product_saled, p.product_category, p.product_content, c.color1, c.color2, c.color3, c.color4, c.color5, c.color6, c.color7, c.color8, c.color9, c.color10, c.color11, c.color12
        from product p, product_color c where p.product_seq = c.fk_product_seq);
        select * from product_color where fk_product_seq = 1;
        
        select * from product where product_category = 'ġ��';
        select * from product_color;
        update product_color set color1='black' where fk_product_seq = 5;
        commit;
        
        select * from product;
        
        select * from color;
        
create table color(
product_seq number(5),
product_color varchar2(300),
constraints product_seq foreign key(product_seq) references product(product_seq));


insert into color values(4,'black');
insert into color values(4,'pink');
insert into color values(4,'blue');
insert into color values(4,'white');
insert into color values(4,'gray');
insert into color values(4,'green');
insert into color values(5,'yellow');
insert into color values(6,'orange');
insert into color values(6,'purple');
select * from color;
commit;


create table test1(
seq number(5) primary key,
title varchar2(30),
content varchar2(30));

drop table test1;

create table test2(
seq number(5),
color varchar2(50),
constraints seq foreign key(seq) references test1(seq));

insert into test1 values(3,'��ǰ3','��ǰ3');

insert into test2 values(3,'blue');

select * from test1;

select t1.seq,t1.title,t1.content,t2.color from test1 t1, test2 t2 where t1.seq=t2.seq;

select * from test2;

select seq, max(case when color = 'black' then 1 else 0 end) color1 from 
(select t1.seq, t1.title, t1.content, t2.color from test1 t1, test2 t2 where t1.seq=t2.seq) group by seq;

select * from test1 t1,
(select seq,
max(decode(color, 'black', 'black',null)) as black, 
max(decode(color, 'purple', 'purple', null)) as purple,
max(decode(color, 'blue', 'blue', null)) as blue,
max(decode(color, 'white', 'white', null)) as white,
max(decode(color, 'green', 'green', null)) as green,
max(decode(color, 'gray', 'gray', null)) as gray,
max(decode(color, 'yellow', 'yellow', null)) as yellow
from test2 group by seq) t2 where t1.seq = t2.seq;


select t1.seq, min(decode(color, 'black', 'black', null)) as black from ;
select * from product;
select * from color;

select * from (select p.product_title, p.product_price, p.product_gender, p.product_category, p.product_content, c.* from product p,
(select product_seq,
max(decode(product_color, 'black','black',null)) as black,
max(decode(product_color, 'pink','pink',null)) as pink,
max(decode(product_color, 'blue','blue',null)) as blue,
max(decode(product_color, 'white','white',null)) as white,
max(decode(product_color, 'gray','gray',null)) as gray,
max(decode(product_color, 'green','green',null)) as green,
max(decode(product_color, 'yellow','yellow',null)) as yellow,
max(decode(product_color, 'orange','orange',null)) as orange,
max(decode(product_color, 'purple','purple',null)) as purple
from color group by product_seq) c where p.product_seq = c.product_seq) where product_category = 'ġ��';


select * from color where product_seq = 4;


SELECT * FROM COLOR WHERE PRODUCT_SEQ = 4 ;

select p.*,c.product_color from product p, (select product_seq, substr(xmlagg(xmlelement(col,',',product_color)).extract('//text()').getstringval(),2)product_color from color group by product_seq) c where p.product_seq = c.product_seq;
commit;
--select product_seq, group_concat(product_color) from color group by product_seq;


select p.*,c.product_color from product p, (select product_seq, substr(xmlagg(xmlelement(col,',',product_color)).extract('//text()').getstringval(),2)product_color from color group by product_seq) c where p.product_seq = c.product_seq;
commit;

select * from color;

create table optiontest(
product_seq number(5),
product_color varchar2(30),
product_size varchar2(30));

insert into optiontest values(17,'black','95');
insert into optiontest values(18,'white','95');
insert into optiontest values(19,'white','100');
insert into optiontest values(20,'white','105');
insert into optiontest values(20,'pink','95');
insert into optiontest values(20,'yellow','95');
insert into optiontest values(21,'green','95');
insert into optiontest values(22,'black','95');
insert into optiontest values(23,'purple','95');
insert into optiontest values(22,'purple','100');
insert into optiontest values(24,'purple','105');

select * from optiontest  order by product_color desc;
select * from product;
select * from product p, optiontest o where p.product_seq = o.product_seq;

insert into product values(4,'��ǰ2',27000,'�̹���2','����','L',300,120,'ġ��','���� ġ��');

select p.*,c.product_color, c.product_size from product p, 
(select 
product_seq, 
substr(xmlagg(xmlelement(col,',',product_color)).extract('//text()').getstringval(),2)product_color, 
substr(xmlagg(xmlelement(col,',',product_size)).extract('//text()').getstringval(),2)product_size 
from optiontest group by product_seq) 
c where p.product_seq = c.product_seq and p.product_category = 'ġ��' and c.product_color like '%pink%' and c.product_size like '%95%';

select * from color;
insert into color values(;

select * from optiontest;

select p.*,c.product_color, c.product_size from product p, 
(select 
product_seq, 
substr(xmlagg(xmlelement(col,',',product_color)).extract('//text()').getstringval(),2)product_color, 
substr(xmlagg(xmlelement(col,',',product_size)).extract('//text()').getstringval(),2)product_size 
from optiontest group by product_seq) 
c where p.product_seq = c.product_seq;

commit;




-- rownum�� �����ؼ� �ش� �ุ ����ϴ� ����
select * from
(select ROW_NUMBER() OVER(ORDER BY p.product_seq) RNUM, p.* ,c.product_color, c.product_size as product_size2 from product p, 
(select product_seq, substr(xmlagg(xmlelement(col,',',product_color)).extract('//text()').getstringval(),2)product_color, substr(xmlagg(xmlelement(col,',',product_size)).extract('//text()').getstringval(),2)product_size from optiontest group by product_seq) c 
where p.product_seq = c.product_seq) where rownum between ((1-1)*10)+1 and (1*10);


select rownum, p.* from product p;


WITH MAIN AS
(
SELECT 'R1' SEQ FROM DUAL UNION ALL
SELECT 'R2' SEQ FROM DUAL UNION ALL
SELECT 'R3' SEQ FROM DUAL UNION ALL
SELECT 'R4' SEQ FROM DUAL UNION ALL
SELECT 'R5' SEQ FROM DUAL UNION ALL
SELECT 'R6' SEQ FROM DUAL UNION ALL
SELECT 'R7' SEQ FROM DUAL UNION ALL
SELECT 'R8' SEQ FROM DUAL UNION ALL
SELECT 'R9' SEQ FROM DUAL UNION ALL
SELECT 'R10' SEQ FROM DUAL 
)
SELECT * FROM 
(SELECT ROW_NUMBER() OVER(ORDER BY SEQ) RNUM, SEQ FROM MAIN) TOTAL
WHERE TOTAL.RNUM >= 1 AND TOTAL.RNUM <= 5;

-- �ϳ��� �������� 5�� �ุ �����شٸ� 1page �Ķ���ʹ� 1,5 2page �Ķ���ʹ� 6,10




-- ���δ�Ʈ ���̺� rownum �־ ��ȸ - ����
select * from (select ROW_NUMBER() OVER(ORDER BY p.product_seq) RNUM, p.* from product p) where rownum between ((1-1)*10)+1 and (1*10);



-- product + optiontest ���̺� ���� �� rownum �־ ��ȸ - ����
select * from
(select ROW_NUMBER() OVER(ORDER BY p.product_seq) RNUM, p.* ,c.product_color, c.product_size as product_size2 from product p, 
(select product_seq, wm_concat(product_color) product_color, wm_concat(product_size) product_size from optiontest group by product_seq) c 
where p.product_seq = c.product_seq) where rnum between ((1-1)*10)+1 and (1*10) and product_color like '%purple%' order by product_seq;

select * from optiontest;


create table product(
product_seq number(20) primary key,
product_title varchar2(500),
product_content varchar2(3000),
product_price number(20),
product_gender varchar2(500),
product_category varchar2(500),
product_img varchar2(500)
);

create table product_option(
product_option_seq number(5),
constraints product_option_seq foreign key(product_option_seq) references product(product_seq),
product_color varchar2(30),
product_size varchar2(30),
product_stock number(30),
product_saled number(30));

drop table product_option;

select /* +INDEX_DESC(product SYS_C0011407) */ * from product where product_seq > 0 order by product_seq desc;
select * from product_option;

select /* +index_desc(product STS_C0011407)*/* from optiontest order by product_seq;
select /* +index_desc(product STS_C0011407)*/ * from optiontest;
select * from optiontest;
-- �� �ΰ��� �� ���̰� ���� ���ϱ�? -> 2���� �������� ���̱� ���ؼ� ORDER BY�� ����� �� �ְ�, ��Ʈ�� �� ���� �ִ�. 

select * from user_indexes;


SELECT * FROM PRODUCT;


select ROW_NUMBER() OVER(ORDER BY p.product_seq) RNUM, p.* ,c.product_color, c.product_size as product_size2 from product p, 
(select product_seq, wm_concat(product_color) product_color, wm_concat(product_size) product_size from optiontest group by product_seq) c 
where p.product_seq = c.product_seq and rownum between ((3-1)*2)+1 and (3*2) and c.product_color like '%purple%' order by p.product_seq;



select * from (select rownum rnum, p.* from product p where rownum <= 10) where rnum >=1;

select * from (select rownum rnum, p.* from product p where rownum <= (2*10)) where rnum >=((2-1)*10)+1;

-- ����
select * from
(select rownum rnum, p.* ,c.product_color, c.product_size as product_size2 from product p, 
(select product_seq, wm_concat(product_color) product_color, wm_concat(product_size) product_size from optiontest group by product_seq) c 
where p.product_seq = c.product_seq and rownum <= (1*10)) where rnum >= ((1-1)*10)+1 and product_category = '����';

-- ���� : 1���������Ϳ��߸� ���.
select rownum rnum, p.* ,c.product_color, c.product_size as product_size2 from product p, 
(select product_seq, wm_concat(product_color) product_color, wm_concat(product_size) product_size from optiontest group by product_seq) c 
where p.product_seq = c.product_seq and rownum between ((1-1)*10)+1 and (1*10);

-- ���� : where�� �ȿ� ����
select * from (select rownum rnum, p.* ,c.product_color, c.product_size as product_size2 from product p, 
(select product_seq, wm_concat(product_color) product_color, wm_concat(product_size) product_size from optiontest group by product_seq) c 
where p.product_seq = c.product_seq and p.product_category='����') where rnum between 1 and 3;


-- max rownum�� �̰�;�
select max(rownum) from product p,
(select product_seq, wm_concat(product_color) product_color, wm_concat(product_size) product_size from optiontest group by product_seq) c 
where p.product_seq = c.product_seq and p.product_category='����';

select * from product;
select * from product_option;



drop table product;
drop table product_option;
drop sequence product_seq;

create sequence product_seq increment by 1 start with 0 minvalue 0;



create table product(
product_seq number(20) primary key,
product_title varchar2(500),
product_content varchar2(3000),
product_price number(20),
product_gender varchar2(500),
product_category varchar2(500),
product_img varchar2(500)
);




create table product_option(
product_option_seq number(5),
constraints product_option_seq foreign key(product_option_seq) references product(product_seq),
product_color varchar2(30),
product_size varchar2(30),
product_stock number(30),
product_saled number(30));




insert into product values(product_seq.nextval, '��ǰ1', '��ǰ1����', 25000, 'M', '����', 'IMAGE01');
insert into product values(product_seq.nextval, '��ǰ2', '��ǰ2����', 25000, 'W', '����', 'IMAGE02');
insert into product values(product_seq.nextval, '��ǰ3', '��ǰ3����', 25000, 'M', '����', 'IMAGE03');
insert into product values(product_seq.nextval, '��ǰ4', '��ǰ4����', 25000, 'W', 'ġ��', 'IMAGE04');
insert into product values(product_seq.nextval, '��ǰ5', '��ǰ5����', 25000, 'W', '���ǽ�', 'IMAGE05');
insert into product values(product_seq.nextval, '��ǰ6', '��ǰ6����', 25000, 'W', '���ǽ�', 'IMAGE06');
insert into product values(product_seq.nextval, '��ǰ7', '��ǰ7����', 25000, 'W', '���ǽ�', 'IMAGE07');
insert into product values(product_seq.nextval, '��ǰ8', '��ǰ8����', 25000, 'W', 'ġ��', 'IMAGE08');
insert into product values(product_seq.nextval, '��ǰ9', '��ǰ9����', 25000, 'M', '����', 'IMAGE09');
insert into product values(product_seq.nextval, '��ǰ10', '��ǰ10����', 25000, 'W', 'ġ��', 'IMAGE10');
insert into product values(product_seq.nextval, '��ǰ11', '��ǰ11����', 25000, 'W', 'ġ��', 'IMAGE11');
insert into product values(product_seq.nextval, '��ǰ12', '��ǰ12����', 25000, 'W', 'ġ��', 'IMAGE12');
insert into product values(product_seq.nextval, '��ǰ13', '��ǰ13����', 25000, 'W', '���ǽ�', 'IMAGE13');
insert into product values(product_seq.nextval, '��ǰ14', '��ǰ14����', 25000, 'W', 'ġ��', 'IMAGE14');
insert into product values(product_seq.nextval, '��ǰ15', '��ǰ15����', 25000, 'W', '���ǽ�', 'IMAGE15');
insert into product values(product_seq.nextval, '��ǰ16', '��ǰ16����', 25000, 'M', '����', 'IMAGE16');
insert into product values(product_seq.nextval, '��ǰ17', '��ǰ17����', 25000, 'W', 'ġ��', 'IMAGE17');
insert into product values(product_seq.nextval, '��ǰ18', '��ǰ18����', 25000, 'M', '����', 'IMAGE18');
insert into product values(product_seq.nextval, '��ǰ19', '��ǰ19����', 25000, 'W', 'ġ��', 'IMAGE19');
insert into product values(product_seq.nextval, '��ǰ20', '��ǰ20����', 25000, 'W', '����', 'IMAGE20');
insert into product values(product_seq.nextval, '��ǰ21', '��ǰ21����', 25000, 'W', 'ġ��', 'IMAGE21');
insert into product values(product_seq.nextval, '��ǰ22', '��ǰ22����', 25000, 'W', 'ġ��', 'IMAGE22');
insert into product values(product_seq.nextval, '���ַ� �� ����', '���� �ӿ� Ŭ�������� ���ϴ� �ϻ����� �������� �����Դϴ�. ���� ������ ������� ���۵� �ټ��� ���̿����� ��ư ȥ�� ����� �����������, ������ �������� ���Ծ��� �Բ��ϱ� ���� �������� �������Դϴ�. - ���ַ� �� - Ŭ���� Į�� - �ո� ��ư�� ������ - Ŀ���� Ÿ���� ��Ҹ� - ���� �κ��� ��ġ ����', 27000, 'M', 'Ƽ����', 'Ƽ��������');
insert into product values(product_seq.nextval, '���� �� ����', '���� �ӿ� �ִ� Ƽ������ �ǻ츱 �������� ����', 31000, 'M', '����', '��������');
insert into product values(product_seq.nextval, 'Ƽ����', 'Ƽ����', 26000, 'M', 'Ƽ����', 'IMAGEƼ����');
insert into product values(product_seq.nextval, '�Ǽ��縮�̸�1', '����1', 26000, 'W', '�Ǽ��縮', '�̹���');
insert into product values(product_seq.nextval, '�Ǽ��縮�̸�2', '����2', 27000, 'M', '�Ǽ��縮', '�̹���');
insert into product values(product_seq.nextval, '�Ǽ��縮�̸�3', '����3', 28000, 'W', '�Ǽ��縮', '�̹���');
insert into product values(product_seq.nextval, '�Ǽ��縮�̸�4', '����4', 20000, 'M', '�Ǽ��縮', '�̹���');
insert into product values(product_seq.nextval, '�Ƶ���1', '����1', 20000, 'KIDS', '����', '�̹���');
insert into product values(product_seq.nextval, '�Ƶ���2', '����2', 25000, 'KIDS', 'Ƽ����', '�̹���');
insert into product values(product_seq.nextval, '�Ƶ���3', '����3', 15000, 'KIDS', 'Ƽ����', '�̹���');
insert into product values(product_seq.nextval, '�Ƶ���4', '����4', 29000, 'KIDS', '����', '�̹���');
insert into product values(product_seq.nextval, '�Ƶ���5', '����5', 30000, 'KIDS', '����', '�̹���');
insert into product values(product_seq.nextval, '�Ƶ���6', '����6', 27000, 'KIDS', 'Ƽ����', '�̹���');
insert into product values(product_seq.nextval, '�Ƶ���7', '����7', 21000, 'KIDS', '���ǽ�', '�̹���');
insert into product values(product_seq.nextval, '�Ƶ���8', '����8', 15000, 'KIDS', '���ǽ�', '�̹���');
insert into product values(product_seq.nextval, '�Ƶ���ǰ1', '����1', 21000, 'KIDS', '�Ǽ��縮', '�̹���');
insert into product values(product_seq.nextval, '�Ƶ���ǰ2', '����2', 30000, 'KIDS', '�Ǽ��縮', '�̹���');
insert into product values(product_seq.nextval, '�Ƶ���ǰ3', '����3', 87000, 'KIDS', '�Ǽ��縮', '�̹���');
insert into product values(product_seq.nextval, '�Ƶ���ǰ4', '����4', 10000, 'KIDS', '�Ǽ��縮', '�̹���');
insert into product values(product_seq.nextval, '�Ƶ���ǰ5', '����5', 8000, 'KIDS', '�Ǽ��縮', '�̹���');
insert into product values(product_seq.nextval, '�Ƶ���ǰ6', '����6', 20000, 'KIDS', '�Ǽ��縮', '�̹���');


insert into product_option values(1, 'BLACK', 'M', 250, 250);
insert into product_option values(1, 'WHITE', 'XL', 250, 250);
insert into product_option values(1, 'RED', 'L', 250, 250);
insert into product_option values(2, 'YELLOW', 'S', 250, 250);
insert into product_option values(2, 'GREEN', 'M', 250, 250);
insert into product_option values(2, 'BLACK', 'M', 250, 250);
insert into product_option values(2, 'WHITE', 'XL', 250, 250);
insert into product_option values(2, 'RED', 'L', 250, 250);
insert into product_option values(3, 'YELLOW', 'S', 250, 250);
insert into product_option values(3, 'GREEN', 'M', 250, 250);
insert into product_option values(3, 'BLACK', 'M', 250, 250);
insert into product_option values(3, 'WHITE', 'XL', 250, 250);
insert into product_option values(4, 'RED', 'L', 250, 250);
insert into product_option values(4, 'YELLOW', 'S', 250, 250);
insert into product_option values(4, 'GREEN', 'M', 250, 250);
insert into product_option values(4, 'BLACK', 'M', 250, 250);
insert into product_option values(5, 'WHITE', 'XL', 250, 250);
insert into product_option values(5, 'RED', 'L', 250, 250);
insert into product_option values(6, 'YELLOW', 'S', 250, 250);
insert into product_option values(6, 'GREEN', 'M', 250, 250);
insert into product_option values(7, 'BLACK', 'M', 250, 250);
insert into product_option values(8, 'WHITE', 'XL', 250, 250);
insert into product_option values(9, 'RED', 'L', 250, 250);
insert into product_option values(10, 'YELLOW', 'S', 250, 250);
insert into product_option values(11, 'GREEN', 'M', 250, 250);
insert into product_option values(12, 'BLACK', 'M', 250, 250);
insert into product_option values(12, 'WHITE', 'XL', 250, 250);
insert into product_option values(12, 'RED', 'L', 250, 250);
insert into product_option values(13, 'YELLOW', 'S', 250, 250);
insert into product_option values(13, 'GREEN', 'M', 250, 250);
insert into product_option values(13, 'BLACK', 'M', 250, 250);
insert into product_option values(14, 'WHITE', 'XL', 250, 250);
insert into product_option values(14, 'RED', 'L', 250, 250);
insert into product_option values(14, 'YELLOW', 'S', 250, 250);
insert into product_option values(15, 'GREEN', 'M', 250, 250);
insert into product_option values(15, 'BLACK', 'M', 250, 250);
insert into product_option values(16, 'WHITE', 'XL', 250, 250);
insert into product_option values(16, 'RED', 'L', 250, 250);
insert into product_option values(16, 'YELLOW', 'S', 250, 250);
insert into product_option values(16, 'GREEN', 'M', 250, 250);
insert into product_option values(16, 'BLACK', 'M', 250, 250);
insert into product_option values(17, 'WHITE', 'XL', 250, 250);
insert into product_option values(18, 'RED', 'L', 250, 250);
insert into product_option values(19, 'YELLOW', 'S', 250, 250);
insert into product_option values(19, 'GREEN', 'M', 250, 250);
insert into product_option values(19, 'BLACK', 'M', 250, 250);
insert into product_option values(20, 'WHITE', 'XL', 250, 250);
insert into product_option values(21, 'RED', 'L', 250, 250);
insert into product_option values(22, 'YELLOW', 'S', 250, 250);
insert into product_option values(22, 'GREEN', 'M', 250, 250);
insert into product_option values(22, 'BLACK', 'M', 250, 250);
insert into product_option values(23, 'WHITE', 'XL', 250, 250);
insert into product_option values(23, 'RED', 'L', 250, 250);
insert into product_option values(23, 'YELLOW', 'S', 250, 250);
insert into product_option values(24, 'GREEN', 'M', 250, 250);
insert into product_option values(24, 'BLACK', 'L', 250, 220);
insert into product_option values(24, 'YELLOW', 'M', 250, 200);
insert into product_option values(24, 'PINK', 'XS', 250, 220);
insert into product_option values(24, 'ORANGE', 'XS', 250, 200);

insert into product_option values(25, 'BLACK', 'L', 250, 150);
insert into product_option values(25, 'YELLOW', 'M', 250, 120);
insert into product_option values(25, 'PINK', 'XS', 250, 210);
insert into product_option values(25, 'ORANGE', 'XS', 250, 240);

insert into product_option values(26, 'BLACK', 'L', 250, 150);
insert into product_option values(26, 'BLACK', 'M', 250, 120);
insert into product_option values(26, 'BLACK', 'XS', 250, 210);
insert into product_option values(26, 'BLACK', 'XL', 250, 240);
insert into product_option values(26, 'YELLOW', 'L', 250, 150);
insert into product_option values(26, 'YELLOW', 'M', 250, 120);
insert into product_option values(26, 'YELLOW', 'XS', 250, 210);
insert into product_option values(26, 'YELLOW', 'XL', 250, 240);
insert into product_option values(26, 'RED', 'L', 250, 150);
insert into product_option values(26, 'RED', 'M', 250, 120);
insert into product_option values(26, 'RED', 'XS', 250, 210);
insert into product_option values(26, 'RED', 'XL', 250, 240);

insert into product_option values(27, 'BLACK', 'L', 250, 150);
insert into product_option values(27, 'BLACK', 'M', 250, 120);
insert into product_option values(27, 'BLACK', 'XS', 250, 210);
insert into product_option values(27, 'BLACK', 'XL', 250, 240);
insert into product_option values(27, 'YELLOW', 'L', 250, 150);
insert into product_option values(27, 'YELLOW', 'M', 250, 120);
insert into product_option values(27, 'YELLOW', 'XS', 250, 210);
insert into product_option values(27, 'YELLOW', 'XL', 250, 240);
insert into product_option values(27, 'RED', 'L', 250, 150);
insert into product_option values(27, 'RED', 'M', 250, 120);
insert into product_option values(27, 'RED', 'XS', 250, 210);
insert into product_option values(27, 'RED', 'XL', 250, 240);

insert into product_option values(28, 'BLACK', 'L', 250, 150);
insert into product_option values(28, 'BLACK', 'M', 250, 120);
insert into product_option values(28, 'BLACK', 'XS', 250, 210);
insert into product_option values(28, 'RED', 'L', 250, 150);
insert into product_option values(28, 'RED', 'M', 250, 120);
insert into product_option values(28, 'RED', 'XL', 250, 240);

insert into product_option values(29, 'YELLOW', 'L', 250, 150);
insert into product_option values(29, 'YELLOW', 'M', 250, 120);
insert into product_option values(29, 'YELLOW', 'XS', 250, 210);
insert into product_option values(29, 'YELLOW', 'XL', 250, 240);
insert into product_option values(29, 'RED', 'L', 250, 150);
insert into product_option values(29, 'RED', 'M', 250, 120);
insert into product_option values(29, 'RED', 'XS', 250, 210);
insert into product_option values(29, 'RED', 'XL', 250, 240);

insert into product_option values(30, 'BLACK', 'L', 250, 150);
insert into product_option values(30, 'BLACK', 'M', 250, 120);
insert into product_option values(30, 'BLACK', 'XS', 250, 210);
insert into product_option values(30, 'BLACK', 'XL', 250, 240);
insert into product_option values(30, 'YELLOW', 'L', 250, 150);
insert into product_option values(30, 'YELLOW', 'M', 250, 120);
insert into product_option values(30, 'YELLOW', 'XS', 250, 210);
insert into product_option values(30, 'YELLOW', 'XL', 250, 240);
insert into product_option values(30, 'RED', 'L', 250, 150);
insert into product_option values(30, 'RED', 'M', 250, 120);
insert into product_option values(30, 'RED', 'XS', 250, 210);
insert into product_option values(30, 'RED', 'XL', 250, 240);

insert into product_option values(31, 'DARKRED', 'XS', 250, 240);
insert into product_option values(31, 'INDIANRED', 'L', 250, 240);
insert into product_option values(32, 'LIGHTYELLOW', 'L', 250, 240);
insert into product_option values(32, 'DARKRED', 'S', 250, 240);
insert into product_option values(33, 'LIMEGREEN', 'XL', 250, 240);
insert into product_option values(33, 'RED', 'L', 250, 240);
insert into product_option values(33, 'INDIANRED', 'XL', 250, 240);
insert into product_option values(34, 'RED', 'L', 250, 240);
insert into product_option values(34, 'LIGHTYELLOW', 'XL', 250, 240);
insert into product_option values(34, 'DARKRED', 'L', 250, 240);
insert into product_option values(34, 'RED', 'XL', 250, 240);
insert into product_option values(35, 'LIGHTYELLOW', 'XL', 250, 240);
insert into product_option values(36, 'DARKRED', 'XS', 250, 240);
insert into product_option values(36, 'RED', 'XL', 250, 240);
insert into product_option values(37, 'GREENYELLOW', 'XL', 250, 240);
insert into product_option values(37, 'INDIANRED', 'XS', 250, 240);
insert into product_option values(38, 'DARKRED', 'S', 250, 240);
insert into product_option values(38, 'YELLOW', 'M', 250, 240);
insert into product_option values(39, 'INDIANRED', 'M', 250, 240);
insert into product_option values(39, 'DARKRED', 'XL', 250, 240);
insert into product_option values(40, 'LAWNGREEN', 'XL', 250, 240);
insert into product_option values(40, 'RED', 'XL', 250, 240);
insert into product_option values(41, 'YELLOW', 'M', 250, 240);
insert into product_option values(41, 'INDIANRED', 'M', 250, 240);
insert into product_option values(41, 'RED', 'XL', 250, 240);
insert into product_option values(42, 'LAWNGREEN', 'M', 250, 240);
insert into product_option values(42, 'LAWNGREEN', 'L', 250, 240);
insert into product_option values(43, 'LIMEGREEN', 'XS', 250, 240);
insert into product_option values(44, 'GREENYELLOW', 'L', 250, 240);
insert into product_option values(44, 'LAWNGREEN', 'S', 250, 240);


DELETE FROM PRODUCT_OPTION WHERE product_option_seq BETWEEN 31 AND 44;






select * from product order by product_seq desc;
select * from product_option;


select rownum rnum, p.* ,o.product_color, o.product_size, o.product_saled from product p, 
(select product_option_seq, wm_concat(product_color) product_color, wm_concat(product_size) product_size, sum(product_saled) product_saled from product_option group by product_option_seq) o 
where p.product_seq = o.product_option_seq and p.product_category != '�Ǽ��縮';

select 
    product_option_seq, 
    wm_concat(product_color) product_color, 
    wm_concat(product_size) product_size, 
    sum(product_saled) product_saled 
    from product_option 
    group by product_option_seq;



COMMIT;

select product_img from (select rownum rnum, p.* from product p where p.product_gender =#{product_gender}) where rnum between #{product_~} and #{~~};


drop table product;
drop table product_option;
drop table product1;
drop table product_option1;
drop sequence product_seq;

create sequence product_seq increment by 1 start with 0 minvalue 0;



-- 20210604 ���̺� ���� --

-- ���̺� ������
create table product(
product_seq number(20) primary key,
product_id number(20) not null,
product_title varchar2(500) not null,
product_content varchar2(3000) not null,
product_price number(20) not null,
product_gender varchar2(500) not null,
product_category varchar2(500) not null,
product_img varchar2(500) not null,
product_color varchar2(30) not null,
product_size varchar2(30) not null,
product_material varchar2(30) not null,
product_date date default sysdate
);



create table product_option(
product_option_seq number(5),
constraints product_option_seq foreign key(product_option_seq) references product(product_seq),
product_option_id number(5) not null,
product_stock number(30) not null,
product_saled number(30) default 0
);


insert into product values(1, 1, '�Ƶ���ǰ1', '��ǰ1', 20000, 'KIDS', '�Ǽ��縮', '�̹���', 'BLACK', 'XL', '��', sysdate);
insert into product values(2, 1, '�Ƶ���ǰ1', '��ǰ1', 20000, 'KIDS', '�Ǽ��縮', '�̹���', 'BLACK', 'L', '��', sysdate);
insert into product values(3, 1, '�Ƶ���ǰ1', '��ǰ1', 20000, 'KIDS', '�Ǽ��縮', '�̹���', 'WHITE', 'XS', '��', sysdate);
insert into product values(4, 1, '�Ƶ���ǰ1', '��ǰ1', 20000, 'KIDS', '�Ǽ��縮', '�̹���', 'WHITE', 'M', '��', sysdate);
insert into product values(5, 2, '���ڻ�ǰ1', '��ǰ1', 20000, 'M', '�Ǽ��縮', '�̹���', 'BLACK', 'XL', '�췹ź', sysdate);
insert into product values(6, 2, '���ڻ�ǰ1', '��ǰ1', 20000, 'M', '�Ǽ��縮', '�̹���', 'BLACK', 'L', '�췹ź', sysdate);
insert into product values(7, 2, '���ڻ�ǰ1', '��ǰ1', 20000, 'M', '�Ǽ��縮', '�̹���', 'WHITE', 'XS', '�췹ź', sysdate);
insert into product values(8, 3, '���ڻ�ǰ1', '��ǰ1', 20000, 'W', '�Ǽ��縮', '�̹���', 'WHITE', 'M', '���Ϸ�', sysdate);
insert into product values(9, 3, '���ڻ�ǰ1', '��ǰ1', 20000, 'W', '�Ǽ��縮', '�̹���', 'BLACK', 'XL', '���Ϸ�', sysdate);
insert into product values(10, 4, '�Ƶ���ǰ2', '��ǰ1', 20000, 'KIDS', '����', '�̹���', 'BLACK', 'L', '���Ϸ�', sysdate);
insert into product values(11, 4, '�Ƶ���ǰ2', '��ǰ1', 20000, 'KIDS', '����', '�̹���', 'WHITE', 'XS', '���Ϸ�', sysdate);
insert into product values(12, 4, '�Ƶ���ǰ2', '��ǰ1', 20000, 'KIDS', '����', '�̹���', 'WHITE', 'M', '���Ϸ�', sysdate);
insert into product values(13, 5, '���ڻ�ǰ2', '��ǰ1', 20000, 'W', 'ġ��', '�̹���', 'BLACK', 'XL', '����', sysdate);
insert into product values(14, 5, '���ڻ�ǰ2', '��ǰ1', 20000, 'W', 'ġ��', '�̹���', 'BLACK', 'L', '����', sysdate);
insert into product values(15, 5, '���ڻ�ǰ2', '��ǰ1', 20000, 'W', 'ġ��', '�̹���', 'WHITE', 'XS', '����', sysdate);
insert into product values(16, 6, '���ڻ�ǰ2', '��ǰ1', 20000, 'M', '����', '�̹���', 'WHITE', 'M', '����', sysdate);
insert into product values(17, 6, '���ڻ�ǰ2', '��ǰ1', 20000, 'M', '����', '�̹���', 'BLACK', 'XL', '����', sysdate);
insert into product values(18, 6, '���ڻ�ǰ2', '��ǰ1', 20000, 'M', '����', '�̹���', 'BLACK', 'L', '����', sysdate);
insert into product values(19, 6, '���ڻ�ǰ2', '��ǰ1', 20000, 'M', '����', '�̹���', 'WHITE', 'XS', '����', sysdate);
insert into product values(20, 7, '���ڻ�ǰ3', '��ǰ1', 20000, 'M', '����', '�̹���', 'WHITE', 'M', '����', sysdate);
insert into product values(21, 7, '���ڻ�ǰ3', '��ǰ1', 20000, 'M', '����', '�̹���', 'BLACK', 'XL', '����', sysdate);
insert into product values(22, 8, '���ڻ�ǰ3', '��ǰ1', 20000, 'W', '����', '�̹���', 'BLACK', 'L', '��', sysdate);
insert into product values(23, 8, '���ڻ�ǰ3', '��ǰ1', 20000, 'W', '����', '�̹���', 'WHITE', 'XS', '��', sysdate);
insert into product values(24, 8, '���ڻ�ǰ3', '��ǰ1', 20000, 'W', '����', '�̹���', 'WHITE', 'M', '��', sysdate);
insert into product values(25, 8, '���ڻ�ǰ3', '��ǰ1', 20000, 'W', '����', '�̹���', 'BLACK', 'XL', '��', sysdate);
insert into product values(26, 9, '�Ƶ���ǰ3', '��ǰ1', 20000, 'KIDS', '����', '�̹���', 'BLACK', 'L', '��', sysdate);
insert into product values(27, 9, '�Ƶ���ǰ3', '��ǰ1', 20000, 'KIDS', '����', '�̹���', 'WHITE', 'XS', '��', sysdate);
insert into product values(28, 10, '���ڻ�ǰ4', '��ǰ1', 20000, 'W', '���ǽ�', '�̹���', 'WHITE', 'M', '�췹ź', sysdate);
insert into product values(29, 11, '���ڻ�ǰ5', '��ǰ1', 20000, 'W', '����', '�̹���', 'WHITE', 'XS', '�췹ź', sysdate);
insert into product values(30, 12, '���ڻ�ǰ4', '��ǰ1', 20000, 'M', '���ǽ�', '�̹���', 'WHITE', 'M', '�췹ź', sysdate);
insert into product values(31, 13, '�Ƶ���ǰ1', '��ǰ1', 20000, 'KIDS', '�Ǽ��縮', '�̹���', 'RED', 'XL', '��', sysdate);
insert into product values(32, 13, '�Ƶ���ǰ1', '��ǰ1', 20000, 'KIDS', '�Ǽ��縮', '�̹���', 'GREEN', 'L', '��', sysdate);
insert into product values(33, 14, '�Ƶ���ǰ1', '��ǰ1', 20000, 'KIDS', '�Ǽ��縮', '�̹���', 'PINK', 'XS', '��', sysdate);
insert into product values(34, 14, '�Ƶ���ǰ1', '��ǰ1', 20000, 'KIDS', '�Ǽ��縮', '�̹���', 'WHITE', 'M', '��', sysdate);
insert into product values(35, 15, '���ڻ�ǰ1', '��ǰ1', 20000, 'M', '�Ǽ��縮', '�̹���', 'YELLOW', 'XL', '�췹ź', sysdate);
insert into product values(36, 15, '���ڻ�ǰ1', '��ǰ1', 20000, 'M', '�Ǽ��縮', '�̹���', 'BLACK', 'L', '�췹ź', sysdate);
insert into product values(37, 16, '���ڻ�ǰ1', '��ǰ1', 20000, 'M', '�Ǽ��縮', '�̹���', 'ORANGE', 'XS', '�췹ź', sysdate);
insert into product values(38, 16, '���ڻ�ǰ1', '��ǰ1', 20000, 'W', '�Ǽ��縮', '�̹���', 'WHITE', 'M', '���Ϸ�', sysdate);
insert into product values(39, 16, '���ڻ�ǰ1', '��ǰ1', 20000, 'W', '�Ǽ��縮', '�̹���', 'GREEN', 'XL', '���Ϸ�', sysdate);
insert into product values(40, 16, '�Ƶ���ǰ2', '��ǰ1', 20000, 'KIDS', '����', '�̹���', 'YELLOW', 'L', '���Ϸ�', sysdate);
insert into product values(41, 17, '�Ƶ���ǰ2', '��ǰ1', 20000, 'KIDS', '����', '�̹���', 'PURPLE', 'XS', '���Ϸ�', sysdate);
insert into product values(42, 17, '�Ƶ���ǰ2', '��ǰ1', 20000, 'KIDS', '����', '�̹���', 'RED', 'M', '���Ϸ�', sysdate);
insert into product values(43, 17, '���ڻ�ǰ2', '��ǰ1', 20000, 'W', 'ġ��', '�̹���', 'RED', 'XL', '����', sysdate);
insert into product values(44, 17, '���ڻ�ǰ2', '��ǰ1', 20000, 'W', 'ġ��', '�̹���', 'PURPLE', 'L', '����', sysdate);
insert into product values(45, 18, '���ڻ�ǰ2', '��ǰ1', 20000, 'W', 'ġ��', '�̹���', 'YELLOW', 'XS', '����', sysdate);
insert into product values(46, 18, '���ڻ�ǰ2', '��ǰ1', 20000, 'M', '����', '�̹���', 'PURPLE', 'M', '����', sysdate);
insert into product values(47, 19, '���ڻ�ǰ2', '��ǰ1', 20000, 'M', '����', '�̹���', 'BLACK', 'XL', '����', sysdate);
insert into product values(48, 19, '���ڻ�ǰ2', '��ǰ1', 20000, 'M', '����', '�̹���', 'RED', 'L', '����', sysdate);
insert into product values(49, 19, '���ڻ�ǰ2', '��ǰ1', 20000, 'M', '����', '�̹���', 'YELLOW', 'XS', '����', sysdate);
insert into product values(50, 20, '���ڻ�ǰ3', '��ǰ1', 20000, 'M', '����', '�̹���', 'PURPLE', 'M', '����', sysdate);
insert into product values(51, 20, '���ڻ�ǰ3', '��ǰ1', 20000, 'M', '����', '�̹���', 'GREEN', 'XL', '����', sysdate);
insert into product values(52, 20, '���ڻ�ǰ3', '��ǰ1', 20000, 'W', '����', '�̹���', 'PURPLE', 'L', '��', sysdate);
insert into product values(53, 21, '���ڻ�ǰ3', '��ǰ1', 20000, 'W', '����', '�̹���', 'RED', 'XS', '��', sysdate);
insert into product values(54, 22, '���ڻ�ǰ3', '��ǰ1', 20000, 'W', '����', '�̹���', 'WHITE', 'M', '��', sysdate);
insert into product values(55, 23, '���ڻ�ǰ3', '��ǰ1', 20000, 'W', '����', '�̹���', 'GREEN', 'XL', '��', sysdate);
insert into product values(56, 24, '�Ƶ���ǰ3', '��ǰ1', 20000, 'KIDS', '����', '�̹���', 'PURPLE', 'L', '��', sysdate);
insert into product values(57, 24, '�Ƶ���ǰ3', '��ǰ1', 20000, 'KIDS', '����', '�̹���', 'RED', 'XS', '��', sysdate);
insert into product values(58, 25, '���ڻ�ǰ4', '��ǰ1', 20000, 'W', '���ǽ�', '�̹���', 'WHITE', 'M', '�췹ź', sysdate);
insert into product values(59, 25, '���ڻ�ǰ5', '��ǰ1', 20000, 'W', '����', '�̹���', 'GREEN', 'XS', '�췹ź', sysdate);
insert into product values(60, 26, '���ڻ�ǰ4', '��ǰ1', 20000, 'M', '���ǽ�', '�̹���', 'RED', 'M', '�췹ź', sysdate);
insert into product values(61, 27, '���ڻ�ǰ9', '��ǰ2', 25000, 'M', '����', '�̹���1,�̹���2', 'BLACK', 'M', '�췹ź');
insert into product values(62, 27, '���ڻ�ǰ9', '��ǰ2', 25000, 'M', '����', '�̹���1,�̹���2', 'RED', 'L', '�췹ź');
insert into product values(63, 27, '���ڻ�ǰ9', '��ǰ2', 25000, 'M', '����', '�̹���1,�̹���2', 'YELLOW', 'XL', '�췹ź');
delete from product where product_seq = 63;
select * from product;

insert into product_option values(1, 1, 250, 200);
insert into product_option values(2, 1, 230, 100);
insert into product_option values(3, 1, 210, 500);
insert into product_option values(4, 1, 240, 700);
insert into product_option values(5, 2, 250, 200);
insert into product_option values(6, 2, 230, 100);
insert into product_option values(7, 2, 210, 500);
insert into product_option values(8, 3, 240, 700);
insert into product_option values(9, 3, 250, 200);
insert into product_option values(10, 4, 230, 100);
insert into product_option values(11, 4, 210, 500);
insert into product_option values(12, 4, 240, 700);
insert into product_option values(13, 5, 250, 200);
insert into product_option values(14, 5, 230, 100);
insert into product_option values(15, 5, 210, 500);
insert into product_option values(16, 6, 240, 700);
insert into product_option values(17, 6, 250, 200);
insert into product_option values(18, 6, 230, 100);
insert into product_option values(19, 6, 210, 500);
insert into product_option values(20, 7, 240, 700);
insert into product_option values(21, 7, 250, 200);
insert into product_option values(22, 8, 230, 100);
insert into product_option values(23, 8, 210, 500);
insert into product_option values(24, 8, 240, 700);
insert into product_option values(25, 8, 250, 200);
insert into product_option values(26, 9, 230, 100);
insert into product_option values(27, 9, 210, 500);
insert into product_option values(28, 10, 240, 700);
insert into product_option values(29, 11, 240, 700);
insert into product_option values(30, 12, 240, 700);
insert into product_option values(31, 13, 250, 200);
insert into product_option values(32, 13, 230, 100);
insert into product_option values(33, 14, 210, 500);
insert into product_option values(34, 14, 240, 700);
insert into product_option values(35, 15, 250, 200);
insert into product_option values(36, 15, 230, 100);
insert into product_option values(37, 16, 210, 500);
insert into product_option values(38, 16, 240, 700);
insert into product_option values(39, 16, 250, 200);
insert into product_option values(40, 16, 230, 100);
insert into product_option values(41, 17, 210, 500);
insert into product_option values(42, 17, 240, 700);
insert into product_option values(43, 17, 250, 200);
insert into product_option values(44, 17, 230, 100);
insert into product_option values(45, 18, 210, 500);
insert into product_option values(46, 18, 240, 700);
insert into product_option values(47, 19, 250, 200);
insert into product_option values(48, 19, 230, 100);
insert into product_option values(49, 19, 210, 500);
insert into product_option values(50, 20, 240, 700);
insert into product_option values(51, 20, 250, 200);
insert into product_option values(52, 20, 230, 100);
insert into product_option values(53, 21, 210, 500);
insert into product_option values(54, 22, 240, 700);
insert into product_option values(55, 23, 250, 200);
insert into product_option values(56, 24, 230, 100);
insert into product_option values(57, 24, 210, 500);
insert into product_option values(58, 25, 240, 700);
insert into product_option values(59, 25, 240, 700);
insert into product_option values(60, 26, 240, 700);
insert into product_option values(61, 27, 240, 150);
insert into product_option values(62, 27, 240, 660);
insert into product_option values(63, 27, 240, 100);












COMMIT;







select p.product_id, p.product_title, p.product_content, p.product_price, p.product_gender, p.product_category, p.product_img, p.product_color, p.product_size, o.product_stock, o.product_saled from product1 p, product_option1 o where p.product_seq = o.product_option1_seq;


select * from product1 p, product_option1 o where p.product_seq = o.product_option1_seq;

select * from product1;

select product_id, product_title, product_content, product_price, product_gender, product_category, product_img, wm_concat(product_color) product_color, wm_concat(product_size) product_size from product1 group by product_id, product_title, product_content, product_price, product_gender, product_category, product_img;

select max(rnum) from (select rownum rnum, t.* from (select p.product_title, product_content, product_price, product_gender, product_category, product_img, product_color, product_size, sum(o.product_saled) product_saled from (select product_id, product_title, product_content, product_price, product_gender, product_category, product_img, wm_concat(product_color) product_color, wm_concat(product_size) product_size from product1 group by product_id, product_title, product_content, product_price, product_gender, product_category, product_img) p, product_option1 o group by product_title, product_content, product_price, product_gender, product_category, product_img, product_color, product_size) t where product_size like '%L%');

commit;

select rownum rnum, p.* ,o.product_color, o.product_size, o.product_saled from product p,
(select product_option_seq, wm_concat(product_color) product_color, wm_concat(product_size) product_size, sum(product_saled) product_saled from product_option group by product_option_seq) o
 where p.product_seq = o.product_option_seq;
 
 
 
select max(rownum) 
from product p, 
(select product_option_seq, wm_concat(product_color) product_color, wm_concat(product_size) product_size from product_option group by product_option_seq) o 
where p.product_seq = o.product_option_seq;

select * from product;
select * from product_option;



select *
from 
(select rownum rnum, t.* 
from 
(select product_title, product_content, product_price, product_gender, product_category, product_img, product_color, product_size, sum(o.product_saled) product_saled 
from 
(select product_id, product_title, product_content, product_price, product_gender, product_category, product_img, wm_concat(product_color) product_color, wm_concat(product_size) product_size 
from product1 
group by product_id, product_title, product_content, product_price, product_gender, product_category, product_img) p, product_option1 o 
group by product_title, product_content, product_price, product_gender, product_category, product_img, product_color, product_size) t 
where product_size like '%L%');








commit;


-- ���ǿ� �´� ��ǰ ����Ʈ ��� ������
select * from (select rownum rnum, p.* from (select product_id, product_title, product_content, product_price, product_gender, product_category, product_img, wm_concat(product_color) product_color, wm_concat(product_size) product_size 
from product1 group by product_id, product_title, product_content, product_price, product_gender, product_category, product_img) p where product_category = 'ġ��') where rnum between 1 and 20;

-- ���ǿ� �´� ��ǰ ������ ��� ������
select max(rownum) from (select product_id, product_title, product_content, product_price, product_gender, product_category, product_img, wm_concat(product_color) product_color, wm_concat(product_size) product_size 
from product1 group by product_id, product_title, product_content, product_price, product_gender, product_category, product_img) p;

select max(rownum) from (select product_id, product_title, product_content, product_price, product_gender, product_category, product_img, wm_concat(product_color) product_color, wm_concat(product_size) product_size
from product1 group by product_id, product_title, product_content, product_price, product_gender, product_category, product_img) p where product_color like '%BLACK%';


select * from (select rownum rnum, p.* from (select product_id, product_title, product_content, product_price, product_gender, product_category, product_img, wm_concat(product_color) product_color, wm_concat(product_size) product_size 
from product1 group by product_id, product_title, product_content, product_price, product_gender, product_category, product_img) p where product_gender = 'W') where rnum between 1 and 20;




select product_id, product_title, product_content, product_price, product_gender, product_category, product_img, wm_concat(product_color) product_color, wm_concat(product_size) product_size from product;
select * from product;

select product_id, product_title, product_content, product_price, product_gender, product_category, product_img, wm_concat(product_color) product_color, wm_concat(product_size) product_size 
from product group by product_id, product_title, product_content, product_price, product_gender, product_category, product_img;


































-- 20210606 �������̺� ����


-- ��
CREATE TABLE cos_user (
    user_seq number(20) primary key, -- �⺻Ű
    user_email VARCHAR2(200) not null, -- �̸���,
    user_password VARCHAR2(200) NOT NULL, -- ��й�ȣ,
    user_name VARCHAR2(200) NOT NULL, -- �̸�,
    user_birthday VARCHAR2(200) NOT NULL, -- �������,
    user_phone VARCHAR2(200) NOT NULL, -- �ڵ���,
    user_regdate date default sysdate, -- ��������
    user_role varchar2(200) -- ������
);


-- �� �ּ�
CREATE TABLE tbl_address (
    user_seq number(20),
    constraints user_seq foreign key(user_seq) references tbl_user(user_seq),
    user_email VARCHAR2(100) not null, -- �̸���
    address_name varchar2(100) not null,
    postcode NUMERIC NULL, -- �����ȣ,
    address VARCHAR2(200) NULL, -- �ּ�,
    detailAddress VARCHAR2(200) NULL -- ���ּ�
);

select * from cos_user;

select * from cos_address;

drop table cos_user;
drop table cos_address;

insert into tbl_user values(1, 'suovj140@gmail.com', 'rnwlgns2', '������', '1993-06-15', '010-4474-9986','M',sysdate, 'costomer', null, null, null);
insert into tbl_user values(2, 'test1@gmail.com', 'test1', 'test1', '1966-04-85', '010-4357-7979','W',sysdate, 'costomer', null, null, null);

insert into tbl_address values(1, 'suovj140@gmail.com', '����', 95554, '����Ư���� �������� ��굿 121-289', '���º� 701ȣ');
insert into tbl_address values(1, 'suovj140@gmail.com', '����', 95554, '����Ư���� ������ �̴�', '�п� 301ȣ');
insert into tbl_address values(1, 'suovj140@gmail.com', '�����', 95554, '����Ư���� ���ʱ� ����', '���� 1��');
insert into tbl_address values(1, 'suovj140@gmail.com', 'ģ����', 95554, '����Ư���� ��� ����', '����Ʈ 44��');


insert into tbl_address values(2, 'test1@gmail.com', '���1', 54354, '�̼��� ��� 1', '�������');
insert into tbl_address values(2, 'test1@gmail.com', '���2', 46748, '�̼����� �³�', '���������');


commit;



select * from cos_address where user_email = 'suovj140@gmail.com';



update cos_user set user_email = '�����Ұ�' where user_email = '�Ѿ�°�'

vo�� change_email, change_phone, change_password �ʿ���;






select * from cos_user;
select * from cos_address;

update cos_user set user_email = 'test2@gmail.com' where user_email = 'suovj140@gmail.com';
update cos_user set user_email = 'suovj140@gmail.com' where user_email = 'test2@gmail.com';

commit;



SELECT P.PRODUCT_ID, P.PRODUCT_TITLE, P.PRODUCT_PRICE, P.PRODUCT_GENDER, P.PRODUCT_CATEGORY, P.PRODUCT_IMG, 
    SUBSTR(XMLAGG(XMLELEMENT(COL,',',P.PRODUCT_COLOR)).EXTRACT('//text()').GETSTRINGVAL(),2) PRODUCT_COLOR, 
    SUBSTR(XMLAGG(XMLELEMENT(COL,',',P.PRODUCT_SIZE)).EXTRACT('//text()').GETSTRINGVAL(),2) PRODUCT_SIZE,
    SUBSTR(XMLAGG(XMLELEMENT(COL,',',PO.PRODUCT_STOCK)).EXTRACT('//text()').GETSTRINGVAL(),2) PRODUCT_STOCK,
    SUBSTR(XMLAGG(XMLELEMENT(COL,',',PO.PRODUCT_SALED)).EXTRACT('//text()').GETSTRINGVAL(),2) PRODUCT_SALED 
    FROM PRODUCT P, PRODUCT_OPTION PO 
    WHERE P.PRODUCT_ID=PO.PRODUCT_OPTION_ID 
    GROUP BY P.PRODUCT_ID,PO.PRODUCT_OPTION_ID, P.PRODUCT_TITLE, P.PRODUCT_PRICE, P.PRODUCT_GENDER, P.PRODUCT_CATEGORY, P.PRODUCT_IMG,PO.PRODUCT_OPTION_ID
   ;
   
select * from (select product_id, product_title, product_price, product_gender, product_category, product_img,
SUBSTR(XMLAGG(XMLELEMENT(COL,',',PRODUCT_COLOR)).EXTRACT('//text()').GETSTRINGVAL(),2) PRODUCT_COLOR, 
SUBSTR(XMLAGG(XMLELEMENT(COL,',',PRODUCT_SIZE)).EXTRACT('//text()').GETSTRINGVAL(),2) PRODUCT_SIZE from product group by product_id, product_title, product_price, product_gender, product_category, product_img) p;

select  * from (select product_option_id, SUBSTR(XMLAGG(XMLELEMENT(COL,',',PRODUCT_STOCK)).EXTRACT('//text()').GETSTRINGVAL(),2) PRODUCT_STOCK,
    SUBSTR(XMLAGG(XMLELEMENT(COL,',',PRODUCT_SALED)).EXTRACT('//text()').GETSTRINGVAL(),2) PRODUCT_SALED 
    from product_option group by product_option_id) o;







select * from 
(select product_id, product_title, product_price, product_gender, product_category, product_img,
SUBSTR(XMLAGG(XMLELEMENT(COL,',',PRODUCT_COLOR)).EXTRACT('//text()').GETSTRINGVAL(),2) PRODUCT_COLOR, 
SUBSTR(XMLAGG(XMLELEMENT(COL,',',PRODUCT_SIZE)).EXTRACT('//text()').GETSTRINGVAL(),2) PRODUCT_SIZE 
from product group by product_id, product_title, product_price, product_gender, product_category, product_img) p, 
(select product_option_id, SUBSTR(XMLAGG(XMLELEMENT(COL,',',PRODUCT_STOCK)).EXTRACT('//text()').GETSTRINGVAL(),2) PRODUCT_STOCK,
SUBSTR(XMLAGG(XMLELEMENT(COL,',',PRODUCT_SALED)).EXTRACT('//text()').GETSTRINGVAL(),2) PRODUCT_SALED 
from product_option group by product_option_id) o where p.product_id = o.product_option_id;


drop table cos_address;
drop table cos_user;


CREATE TABLE tbl_user (
    user_seq number(20) primary key, -- �⺻Ű
    user_email VARCHAR2(200) not null, -- �̸���,
    user_password VARCHAR2(200) NOT NULL, -- ��й�ȣ,
    user_name VARCHAR2(200) NOT NULL, -- �̸�,
    user_birthday VARCHAR2(200) NOT NULL, -- �������,
    user_phone VARCHAR2(200) NOT NULL, -- �ڵ���,
    user_gender VARCHAR2(50) NULL, --����
    user_regdate date default sysdate, -- ��������
    user_role varchar2(200), -- ������
    user_bank varchar2(200), -- �� ����
    user_account varchar2(200), -- �� ȯ�� ���¹�ȣ
    user_repay varchar2(200) -- �ҵ������ ��ȣ
);

COMMIT;


select * from cos_user;
select * from cos_address;


-- order table --


create table tbl_order(

order_id number(20) not null primary key, --order_id�� null���� �������ϰ� �ϰ� �⺻Ű�� ������

user_email varchar2(100) not null, --user_email�� null���� �������ϰ� ����

product_seq number(20) not null, --product_seq�� null���� �������ϰ� ����

amount number(20) default 0, --amount�Ӽ��� �⺻���� 0���� ����

total_price number(20) default 0
);

alter table tbl_order add constraint order_user_email_fk
foreign key(user_email) references cos_user(user_email);

alter table tbl_order add constraint order_product_seq_fk
foreign key(product_seq) references product(product_seq);

select * from product;
select * from tbl_order;

insert into tbl_order values(1, 'suovj140@gmail.com', 1, 0, 0);

-- 
select product_title, p.product_price, p.product_img from product p, (select * from tbl_order where user_email = 'suovj140@gmail.com') o where p.product_seq = o.product_seq;

select * from product where ;


create table user_account(
user_email varchar2(100) primary key,
user_name varchar2(100),
user_bank varchar2(100),
user_account number(30)
);

drop table user_account;
commit;

select * from user_account;

select * from cos_user;
select * from cos_address;
drop table cos_address;
drop table user_account;
drop table cos_user;











-- 2021 06 07 ���̺� ����


CREATE TABLE tbl_user (
    user_seq number(20) primary key, -- �⺻Ű
    user_email VARCHAR2(200) not null, -- �̸���,
    user_password VARCHAR2(200) NOT NULL, -- ��й�ȣ,
    user_name VARCHAR2(200) NOT NULL, -- �̸�,
    user_birthday VARCHAR2(200) NOT NULL, -- �������,
    user_phone VARCHAR2(200) NOT NULL, -- �ڵ���,
    user_gender VARCHAR2(50) NULL, --����
    user_regdate date default sysdate, -- ��������
    user_role varchar2(200), -- ������
    user_bank varchar2(200), -- �� ����
    user_account varchar2(200), -- �� ȯ�� ���¹�ȣ
    user_repay varchar2(200) -- �ҵ������ ��ȣ
);


CREATE TABLE tbl_address (
    address_seq number(20) primary key,
    user_seq number(20),
    constraints user_seq foreign key(user_seq) references tbl_user(user_seq),
    user_email VARCHAR2(100) not null, -- �̸���
    address_name varchar2(100) not null,
    postcode varchar2(50) NULL, -- �����ȣ,
    address VARCHAR2(200) NULL, -- �ּ�,
    detailAddress VARCHAR2(200) NULL, -- ���ּ�
    user_phone varchar2(200) not null,
    user_phone2 varchar2(200)
);

insert into tbl_user values(1, 'suovj140@gmail.com', 'rnwlgns2', '������', '1993-06-15', '010-4474-9986','M',sysdate, 'costomer', null, null, null);
insert into tbl_user values(2, 'test1@gmail.com', 'test1', 'test1', '1966-04-85', '010-4357-7979','W',sysdate, 'costomer', null, null, null);

insert into tbl_address values(1, 1, 'suovj140@gmail.com', '����', '95554', '����Ư���� �������� ��굿 121-289', '���º� 701ȣ', '010-4474-9986', null);
insert into tbl_address values(2, 1, 'suovj140@gmail.com', '����', '95554', '����Ư���� ������ �̴�', '�п� 301ȣ', '010-4444-7897', null);
insert into tbl_address values(3, 1, 'suovj140@gmail.com', '�����', '95554', '����Ư���� ���ʱ� ����', '���� 1��', '010-0044-4979', null);
insert into tbl_address values(4, 1, 'suovj140@gmail.com', 'ģ����', '95554', '����Ư���� ��� ����', '����Ʈ 44��', '010-4949-7797', null);


insert into tbl_address values(2, 'test1@gmail.com', '���1', 54354, '�̼��� ��� 1', '�������');
insert into tbl_address values(2, 'test1@gmail.com', '���2', 46748, '�̼����� �³�', '���������');


create table tbl_order(

order_id number(20) not null primary key, --order_id�� null���� �������ϰ� �ϰ� �⺻Ű�� ������
user_email varchar2(100) not null, --user_email�� null���� �������ϰ� ����
product_seq number(20) not null, --product_seq�� null���� �������ϰ� ����
amount number(20) default 0, --amount�Ӽ��� �⺻���� 0���� ����
total_price number(20) default 0
);

select * from tbl_user;
select * from tbl_address;


drop table tbl_address;
commit;

update tbl_user set user_repay = null where user_email = 'suovj140@gmail.com';

create sequence tbl_address_seq increment by 1 start with 0 minvalue 0;

insert into dual values(tbl_address_seq.nextval);


select * from product;

select * from ;

commit;















--
 select *
        from
        (select rownum rnum, p.*
        from
        (select product_id, product_title, product_content, product_price, product_gender, product_category, product_img, wm_concat(product_color) product_color, wm_concat(product_size) product_size
        from
        product group by product_id, product_title, product_content, product_price, product_gender, product_category, product_img) p);
       
       
       
       
       
       
       
       
select product_option_id, sum(product_saled) product_saled from product_option group by product_option_id;
       
select *
from
(select rownum rnum, p.* 
from
(select product_id, product_title, product_content, product_price, product_gender, product_category, product_img, wm_concat(product_color) product_color, wm_concat(product_size) product_size, product_saled
from
product, (select product_option_id, sum(product_saled) product_saled from product_option group by product_option_id) where product_id = product_option_id
group by product_id, product_title, product_content, product_price, product_gender, product_category, product_img, product_saled) p);

commit;






select *
from
(select rownum rnum, p.*        
from
(select product_id, product_title, product_content, product_price, product_gender, product_category, product_img, wm_concat(product_color) product_color, wm_concat(product_size) product_size
from
product, (select product_option_id, sum(product_saled) product_saled from product_option group by product_option_id) where product_id = product_option_id
group by product_id, product_title, product_content, product_price, product_gender, product_category, product_img, product_saled) p);
       
       
update product set product_img = '�̹���1.jpg,�̹���2.jpg';
       
    
commit;


drop table tbl_order;
receipt;

-- 20210611
-- �ֹ� ���̺� 


create table tbl_order (
    order_id     varchar2(50) not null,
    user_email      VARCHAR2(200) not null,
    address   varchar2(100) not null,
    detailAddress varchar2(100) not null,
    orderProductAmount number       not null,
    total_price number not null,
    order_status varchar2(20) default '����غ���',
    orderDate   Date default sysdate,   
    primary key(order_Id)
);

drop table tbl_order;

select * from tbl_user;

create table tbl_orderDetail (
    orderDetailsNum number not null,
    order_id     varchar2(50) not null,
    product_seq number(20) not null,
    money number       not null,
    amount number not null,
    primary key(orderDetailsNum)
);
create sequence tbl_order_details_seq;

alter table tbl_orderDetail
    add constraint tbl_order_detail_orderId foreign key(order_Id)
    references tbl_order(order_id);
alter table tbl_orderDetail
    add constraint tbl_order_detail_product_seq foreign key(product_seq)
    references product(product_seq);
    
    select * from tbl_order where user_email = 'suovj140@gmail.com';
    
select * from tbl_order;

insert into tbl_order values('�ֹ�1', 'suovj140@gmail.com', '����Ư���� �������� ��굿 121-289', '���º� 701ȣ', 2, 254000, '����غ���', sysdate);
insert into tbl_order values('�ֹ�2', 'suovj140@gmail.com', '����Ư���� �������� ��굿 121-111', '���º� 1101ȣ', 3, 557000, '����غ���', sysdate);
insert into tbl_order values('�ֹ�3', 'suovj140@gmail.com', '����Ư���� �������� ��굿 121-111', '���º� 1101ȣ', 3, 557000, '����غ���', sysdate);
insert into tbl_order values('�ֹ�4', 'suovj140@gmail.com', '����Ư���� �������� ��굿 121-111', '���º� 1101ȣ', 3, 557000, '����غ���', sysdate);
insert into tbl_order values('�ֹ�5', 'suovj140@gmail.com', '����Ư���� �������� ��굿 121-111', '���º� 1101ȣ', 3, 557000, '����غ���', sysdate);
insert into tbl_order values('�ֹ�6', 'suovj140@gmail.com', '����Ư���� �������� ��굿 121-111', '���º� 1101ȣ', 3, 557000, '����غ���', sysdate);
insert into tbl_order values('�ֹ�7', 'suovj140@gmail.com', '����Ư���� �������� ��굿 121-111', '���º� 1101ȣ', 3, 557000, '����غ���', sysdate);
insert into tbl_order values('�ֹ�8', 'suovj140@gmail.com', '����Ư���� �������� ��굿 121-111', '���º� 1101ȣ', 3, 557000, '����غ���', sysdate);
insert into tbl_order values('�ֹ�9', 'suovj140@gmail.com', '����Ư���� �������� ��굿 121-111', '���º� 1101ȣ', 3, 557000, '����غ���', sysdate);
insert into tbl_order values('�ֹ�10', 'suovj140@gmail.com', '����Ư���� �������� ��굿 121-111', '���º� 1101ȣ', 3, 557000, '����غ���', sysdate);
insert into tbl_order values('�ֹ�11', 'suovj140@gmail.com', '����Ư���� �������� ��굿 121-111', '���º� 1101ȣ', 3, 557000, '����غ���', sysdate);
insert into tbl_order values('�ֹ�12', 'suovj140@gmail.com', '����Ư���� �������� ��굿 121-111', '���º� 1101ȣ', 3, 557000, '����غ���', sysdate);
insert into tbl_order values('�ֹ�13', 'suovj140@gmail.com', '����Ư���� �������� ��굿 121-111', '���º� 1101ȣ', 3, 557000, '����غ���', sysdate);
insert into tbl_order values('�ֹ�14', 'suovj140@gmail.com', '����Ư���� �������� ��굿 121-111', '���º� 1101ȣ', 3, 557000, '����غ���', sysdate);


commit;















-- ���̺� ��� ����

SELECT * FROM tbl_user WHERE user_email = 'suovj140@gmail.com';
select * from tbl_address where user_email = 'suovj140@gmail.com';



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


insert into tbl_user values('suovj140@gmail.com', 'rnwlgns2', '������', '1993-06-15', '010-4474-9986','M', '2021-06-11', 0, null, null, null);
insert into tbl_user values('test1@gmail.com', 'test1', 'test1', '1966-04-85', '010-4357-7979','W',sysdate, 1, null, null, null);

commit;

drop table tbl_user;
drop table tbl_address;




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


insert into tbl_address_info values(tbl_address_info_seq.nextval, 'suovj140@gmail.com', '95554', '����Ư���� �������� ��굿 121-289', '���º� 701ȣ', '����',   '010-4474-9986', null);
insert into tbl_address_info values(2, 'suovj140@gmail.com', '95554', '����Ư���� ������ �̴�', '�п� 301ȣ', '����',   '010-4444-7897', null);
insert into tbl_address_info values(3, 'suovj140@gmail.com', '95554', '����Ư���� ���ʱ� ����', '���� 1��', '�����',   '010-0044-4979', null);
insert into tbl_address_info values(4, 'suovj140@gmail.com', '95554', '����Ư���� ��� ����', '����Ʈ 44��', 'ģ����',   '010-4949-7797', null);


insert into tbl_address_info values(5, 'test1@gmail.com', '54354', '�̼��� ��� 1', '�������', '���1',  '010-0000-0000', null);
insert into tbl_address_info values(6, 'test1@gmail.com', '46748', '�̼����� �³�', '���������', '���2',  '010-0000-0000', null);



commit;

select * from tbl_user;
select * from tbl_address_info;
delete tbl_address_info;


drop sequence tbl_address_seq;

create sequence tbl_address_info_seq;


drop table tbl_user;
drop table tbl_address;
drop table users;


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













create table tbl_order_detail (
    order_detail_num number not null,
    order_id     varchar2(50) not null,
    product_seq number(20) not null,
    money number       not null,
    amount number not null,
    primary key(order_detail_num)
);
drop sequence tbl_order_details_seq;

create sequence tbl_order_details_seq;

create sequence tbl_address_info_seq;

alter table tbl_order_detail
    add constraint tbl_order_detail_orderId foreign key(order_Id)
    references tbl_order(order_id);
    
alter table tbl_order_detail
    add constraint tbl_order_detail_product_seq foreign key(product_seq)
    references tbl_product(product_seq);
    
    
    
select * from tbl_order;

commit;


select * from product;

update product set product_img = '�̹���1.jpg';

drop sequence product_seq;
drop table product;
drop table product_option;








-- 2021 06 13 ��ǰ, ��ǰ�ɼ����̺� ����


select *
from
(select rownum rnum, p.*
from
(select product_id, product_title, product_content, product_price, product_gender, product_category, product_img, wm_concat(product_color) product_color, wm_concat(product_size) product_size, product_saled
from
product, (select product_option_id, sum(product_saled) product_saled from product_option group by product_option_id) where product_id = product_option_id
group by product_id, product_title, product_content, product_price, product_gender, product_category, product_img, product_saled) p);



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
    
    
    
    
select * from tbl_product;
    
    
create sequence tbl_product_seq increment by 1 start with 0 minvalue 0;
create sequence tbl_product_option_seq increment by 1 start with 0 minvalue 0;
drop table tbl_product;
drop table tbl_product_option;
drop table tbl_order;
drop table tbl_order_detail;
drop table product;
drop sequence tbl_product_seq;
drop sequence tbl_product_option_seq;

select * from tbl_product;

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

insert into tbl_product values(tbl_product_seq.nextval, 5, '������ǰ1', 20000, '�̹���4.jpg', 'XL','BLACK','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 5, '������ǰ1', 20000, '�̹���4.jpg', 'L','WHITH','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 6, '������ǰ2', 23000, '�̹���4.jpg', 'XL','BLACK','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 6, '������ǰ2', 23000, '�̹���4.jpg', 'L','BLACK','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 6, '������ǰ2', 23000, '�̹���4.jpg', 'L','RED','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 7, '������ǰ3', 25000, '�̹���4.jpg', 'M','DARKRED','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 7, '������ǰ3', 25000, '�̹���4.jpg', 'S','BLACK','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 8, '������ǰ4', 25000, '�̹���4.jpg', 'S','GREEN','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 8, '������ǰ4', 25000, '�̹���4.jpg', 'XS','YELLOW','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 9, '������ǰ5', 19000, '�̹���4.jpg', 'XL','BLACK','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);

insert into tbl_product values(tbl_product_seq.nextval, 10, '������ǰ1', 20000, '�̹���4.jpg', 'XL','BLACK','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 10, '������ǰ1', 20000, '�̹���4.jpg', 'L','WHITH','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 11, '������ǰ2', 23000, '�̹���4.jpg', 'XL','BLACK','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 11, '������ǰ2', 23000, '�̹���4.jpg', 'L','BLACK','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 12, '������ǰ3', 25000, '�̹���4.jpg', 'L','RED','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 12, '������ǰ3', 25000, '�̹���4.jpg', 'M','DARKRED','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 13, '������ǰ4', 26000, '�̹���4.jpg', 'S','BLACK','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 13, '������ǰ4', 26000, '�̹���4.jpg', 'S','GREEN','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 13, '������ǰ4', 26000, '�̹���4.jpg', 'XS','YELLOW','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 13, '������ǰ4', 26000, '�̹���4.jpg', 'XL','BLACK','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);

insert into tbl_product values(tbl_product_seq.nextval, 14, '�Ƶ��Ǽ�����1', 20000, '�̹���4.jpg', 'XL','BLACK','KIDS','�Ƶ���ǰ�Դϴ�.','��','�Ǽ��縮',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 14, '�Ƶ��Ǽ�����1', 20000, '�̹���4.jpg', 'L','WHITH','KIDS','�Ƶ���ǰ�Դϴ�.','��','�Ǽ��縮',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 14, '�Ƶ��Ǽ�����1', 20000, '�̹���4.jpg', 'XL','BLACK','KIDS','�Ƶ���ǰ�Դϴ�.','��','�Ǽ��縮',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 15, '�Ƶ��Ǽ�����2', 23000, '�̹���4.jpg', 'L','BLACK','KIDS','�Ƶ���ǰ�Դϴ�.','��','�Ǽ��縮',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 15, '�Ƶ��Ǽ�����2', 23000, '�̹���4.jpg', 'L','RED','KIDS','�Ƶ���ǰ�Դϴ�.','��','�Ǽ��縮',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 15, '�Ƶ��Ǽ�����2', 23000, '�̹���4.jpg', 'M','DARKRED','KIDS','�Ƶ���ǰ�Դϴ�.','��','�Ǽ��縮',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 15, '�Ƶ��Ǽ�����2', 23000, '�̹���4.jpg', 'S','BLACK','KIDS','�Ƶ���ǰ�Դϴ�.','��','�Ǽ��縮',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 16, '�Ƶ��Ǽ�����3', 25000, '�̹���4.jpg', 'S','GREEN','KIDS','�Ƶ���ǰ�Դϴ�.','��','�Ǽ��縮',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 16, '�Ƶ��Ǽ�����3', 25000, '�̹���4.jpg', 'XS','YELLOW','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 16, '�Ƶ��Ǽ�����3', 25000, '�̹���4.jpg', 'XL','BLACK','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);

insert into tbl_product values(tbl_product_seq.nextval, 20, '�����Ǽ�����1', 20000, '�̹���4.jpg', 'XL','BLACK','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 20, '�����Ǽ�����1', 20000, '�̹���4.jpg', 'L','WHITH','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 21, '�����Ǽ�����2', 23000, '�̹���4.jpg', 'XL','BLACK','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 21, '�����Ǽ�����2', 23000, '�̹���4.jpg', 'L','BLACK','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 22, '�����Ǽ�����3', 25000, '�̹���4.jpg', 'L','RED','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 22, '�����Ǽ�����3', 25000, '�̹���4.jpg', 'M','DARKRED','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 23, '�����Ǽ�����4', 25000, '�̹���4.jpg', 'S','BLACK','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 23, '�����Ǽ�����4', 25000, '�̹���4.jpg', 'S','GREEN','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 23, '�����Ǽ�����4', 25000, '�̹���4.jpg', 'XS','YELLOW','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 24, '�����Ǽ�����5', 19000, '�̹���4.jpg', 'XL','BLACK','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);

insert into tbl_product values(tbl_product_seq.nextval, 25, '�����Ǽ�����1', 20000, '�̹���4.jpg', 'XL','BLACK','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 25, '�����Ǽ�����1', 20000, '�̹���4.jpg', 'L','WHITH','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 26, '�����Ǽ�����2', 23000, '�̹���4.jpg', 'XL','BLACK','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 26, '�����Ǽ�����2', 23000, '�̹���4.jpg', 'L','BLACK','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 27, '�����Ǽ�����3', 25000, '�̹���4.jpg', 'L','RED','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 27, '�����Ǽ�����3', 25000, '�̹���4.jpg', 'M','DARKRED','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 27, '�����Ǽ�����3', 25000, '�̹���4.jpg', 'S','BLACK','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 27, '�����Ǽ�����3', 25000, '�̹���4.jpg', 'S','GREEN','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 27, '�����Ǽ�����3', 25000, '�̹���4.jpg', 'XS','YELLOW','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 27, '�����Ǽ�����3', 25000, '�̹���4.jpg', 'XL','BLACK','KIDS','�Ƶ���ǰ�Դϴ�.','��','����',SYSDATE);


update tbl_product set product_gender = 'W' where product_id between 20 and 24;
update tbl_product set product_gender = 'M' where product_id between 25 and 27;
update tbl_product set product_category = '�Ǽ��縮' where product_id between 14 and 27;

commit;


DROP TABLE TBL_PRODUCT;
drop table tbl_product_option;
drop sequence tbl_product_seq;
drop sequence tbl_product_option_seq;

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

select * from tbl_product;

select * from tbl_product_option;








commit;





select max(rownum) from (select product_id, product_title, product_content, product_price, product_gender, product_category, product_img, wm_concat(product_color) product_color, wm_concat(product_size) product_size
from tbl_product group by product_id, product_title, product_content, product_price, product_gender, product_category, product_img) p;






select *
from
(select rownum rnum, p.*
from
(select product_id, product_title, product_content, product_price, product_gender, product_category, product_img, wm_concat(product_color) product_color, wm_concat(product_size) product_size, product_saled
from
tbl_product, (select product_id product_option_id, sum(product_saled) product_saled from tbl_product_option group by product_id) where product_id = product_option_id
group by product_id, product_title, product_content, product_price, product_gender, product_category, product_img, product_saled) p);










drop table tbl_orderdetail;




select * from tbl_order_detail;
insert into tbl_order_detail values(1, '�ֹ�1', 1, 172000, 2);
insert into tbl_order_detail values(2, '�ֹ�1', 7, 10000, 1);
insert into tbl_order_detail values(3, '�ֹ�1', 8, 25000, 4);
select * from tbl_order o, tbl_order_detail od where o.order_id = od.order_id;


alter table tbl_order add pay_info varchar2(100);
update tbl_order set pay_info = 'īī������';

select * from tbl_order where order_id = '�ֹ�1';
select p.*, od.order_id, od.money, od.amount from tbl_order_detail od, tbl_product p where od.order_id = '�ֹ�1' and od.product_seq = p.product_seq;




-- 20210614 ��ħ����
select * from tbl_user;
select * from tbl_address_info;
select * from tbl_product;
select * from tbl_product_option;
select * from tbl_order;
select * from tbl_order_detail;
insert into tbl_order_detail values(4, '�ֹ�2', 3, 27560, 3);
insert into tbl_order_detail values(5, '�ֹ�2', 1, 2550, 7);
insert into tbl_order_detail values(6, '�ֹ�3', 2, 277760, 2);
insert into tbl_order_detail values(7, '�ֹ�3', 7, 2990, 1);
insert into tbl_order_detail values(8, '�ֹ�3', 10, 23000, 3);


alter table tbl_order add user_name varchar2(100);
update tbl_order set user_name = '�Ĵ��ù�';

commit;