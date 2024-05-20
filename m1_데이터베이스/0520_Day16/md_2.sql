select * from BOOK;
select bookid,price from Book;
select * from customer;
select * from orders;
select * from imported_book;

--�ߺ� ���� ��� distinct
select distinct publisher from book;

--Q. ������ ���� �̻��� ������ �˻�
select * from book 
WHERE price > 10000;

--Q. ������ 10000�� �̻� 20000�� ������ ������ �˻��Ͻÿ�. (2���� ���)
select * from book
where 10000<=price AND price<=20000;

select * from book
where price between 10000 and 20000;

--Task1_0517. ���ǻ簡 '�½�����' Ȥ�� '���ѹ̵��' �� ������ �˻��Ͻÿ�.(3���� ���)/*��*/
select * from BOOK
where publisher = '�½�����' or publisher = '���ѹ̵��';

select *
from book
where publisher in ('�½�����' , '���ѹ̵��');

select *
from book
where publisher = '�½�����'
union
select *
from book
where publisher = '���ѹ̵��';

select * from book
where publisher like '�½�����' or publisher like'���ѹ̵��';




--Task2_0517. ���ǻ簡 '�½�����' Ȥ�� '���ѹ̵��'�� �ƴ� ������ �˻�./*��*/
select * from book
where not publisher= '�½�����' and not publisher= '���ѹ̵��' ;

SELECT * FROM book
WHERE publisher NOT IN ('�½�����','���ѹ̵��');

--like�� ��Ȯ��'�౸�� ����'�� ��ġ�ϴ� �ุ ����
select bookname, publisher from book
where bookname like '�౸�� ����';



--%: 0�� �̻��� ������ ����
--_: ��Ȯ�� 1���� ������ ����
--'�౸'�� ���Ե� ���ǻ�
--%...%�� ...�� �����Ѱ��� ���� 
select bookname, publisher from book
where bookname like '%�౸%';

--�����̸��� ���� �� ��° ��ġ�� '��'��� ���ڿ��� ���� ����
select bookname, publisher from book
where bookname like '_��%';

--Task3_0517. �౸�� ���� ������ ������ 20000�� �̻��� ������ �˻��Ͻÿ�./*��*/
select * from book
where bookname like '%�౸%' and price >20000;

--ORDER BY : �⺻ �ø����� ����
select * from book
order by bookname;

select * from book
order by price;

--��������
select * from book
order by price desc;

--Q. ������ ���ݼ����� �˻��ϰ�, ������ ������ �̸������� �˻��Ͻÿ�
select * from book
order by price desc ,bookname;

--Q. 2���� �ֹ��� ������ �� �Ǹž��� ���Ͻÿ�.
select * from orders;
select sum(saleprice) as "�� �Ǹž�" 
from orders
where custid =2;

--GROUP BY : �����͸� Ư�� ���ؿ� ���� �׷�ȭ�ϴµ� ���. �̸� ���� ���� �Լ�(SUM, AVG, MAX, MIN, COUNT)�� �̿�, ���
select sum(saleprice) as total,
avg(saleprice) as average,
min(saleprice) as mininum,
MAX(saleprice) as maximum
from orders;

--���Ǹž��� custid �������� �׷�ȭ
select custid, count(*) as ��������, sum(saleprice) as "�� �Ǹž�"
from orders
Group by custid;

--bookid�� 5���� ū ����
select custid, count(*) as ��������, sum(saleprice) as "�� �Ǹž�"
from orders
where bookid >= 5
Group by custid;

--���������� 2���� ū ����
select custid, count(*) as ��������, sum(saleprice) as "�� �Ǹž�"
from orders
where bookid >= 5
Group by custid
having count(*) >2;

--Task4_0517. 2�� �迬�� ���� �ֹ��� ������ ������ �� �Ǹž��� ���Ͻÿ�.
SELECT  sum(saleprice) as "����" 
from orders
WHERE orderid = 2;


SELECT Customer.name, sum(Orders.saleprice) as ����
FROM Orders,Customer 
WHERE Orders.custid = Customer.custid and orders.custid = 2
group by customer.name;

select customer.name, orders.custid, sum(orders.saleprice) as ����
from orders, customer
where orders.custid = 2 and orders.custid=customer.custid
group by customer.name, orders.custid;


select customer.name, orders.custid, sum(orders.saleprice) ����
from orders
inner join customer on orders.custid = customer.custid
where orders.custid =2
group by customer.name, orders.custid;
--Task4_0517-2. 2�� �迬�� ���� �ֹ��� ������ ������ �� �Ǹž��� ���Ͻÿ�.
select customer.name, orders.custid ,count(orders.orderid) as �ǸűǼ�, sum(orders.saleprice) as ����
from customer, orders
where orders.custid = customers.custid and orders.custid = 2
group by customer.name, orders,custid;

select customer.name, orders.custid, count(orders.orderid) "���� ����", sum(orders.saleprice) "�� �Ǹž�"
from orders
inner join customer on orders.custid = customer.custid
where orders.custid=2
group by customer.name, orders.custid;

--Task5_0517. ������ 8,000�� �̻��� ������ ������ ���� ���Ͽ� ���� �ֹ� ������ �� ������ ���Ͻÿ�. 
--��, �� �� �̻� ������ ���� ���Ͻÿ�.

SELECT custid, COUNT(*) as "�� �Ǽ�"
FROM Orders
WHERE saleprice >= 8000 
GROUP BY custid
HAVING COUNT(*) >= 2
order by custid;

select custid , sum(saleprice) as "����" , count(*) as "����Ƚ��"
from orders
where saleprice > 8000
group by custid;


--Task6_0517. ���� �̸��� ���� �ֹ��� ������ �ǸŰ����� �˻��Ͻÿ�.
SELECT Customer.name, Orders.saleprice
FROM Orders,Customer 
WHERE Orders.custid = Customer.custid;


SELECT Customer.name, sum(Orders.saleprice) as ����
FROM Orders,Customer 
WHERE Orders.custid = Customer.custid
group by customer.name;

select name, saleprice
from customer, orders
where customer.custid=orders.custid;

select name, orders.custid, saleprice
from customer, orders
where customer.custid=orders.custid;


--Task7_0517. ������ �ֹ��� ��� ������ �� �Ǹž��� ���ϰ�, ������ �����Ͻÿ�.
SELECT Customer.name, sum(Orders.saleprice) as ����
FROM Orders,Customer 
WHERE Orders.custid = Customer.custid
group by customer.name;

select custid, sum(saleprice) ����
from orders
group by custid
order by ����;

select custid, sum(saleprice) ����
from orders
group by custid
order by sum(saleprice);

select name, sum(saleprice) as ����
from customer C, orders O
where C.custid = O.custid
group by C.name
order by C.name;

--Q. ���� �̸��� ���� �ֹ��� ������ �̸��� ���Ͻÿ�.
select c.name, O.bookid, b.bookname
from customer C, book B ,orders O
where C.custid = o.custid and o.bookid = b.bookid;

select customer.name, book.bookname
from orders
inner join customer on orders.custid = customer.custid
inner join book on orders.bookid = book.bookid;

--Q. ������ 20,000���� ������ �ֹ��� ���� �̸��� ������ �̸��� ���Ͻÿ�,

select c.name, O.bookid, b.bookname
from customer C, book B ,orders O
where C.custid = o.custid and o.bookid = b.bookid and B.price = 20000;

--JOIN�� �� �� �̻��� ���̺��� �����Ͽ� ���õ� �����͸� ������ �� ���
select  * from customer;
select * from orders;

--���� ���� (INNER JOIN)
select customer.name, orders.saleprice
from customer
inner join orders on orders.custid = customer.custid;

--���� �ܺ� ���� (Left Outer Join) : . �� ��° ���̺� ��ġ�ϴ� �����Ͱ� ���� ��� NULL ���� ���
select customer.name, orders.saleprice
from customer
left outer join orders on customer.custid=orders.custid;

--������ �ܺ� ���� (Right Outer Join) : ù ��° ���̺� ��ġ�ϴ� �����Ͱ� ���� ��� NULL ���� ���
select customer.name, orders.saleprice
from customer
right outer join orders on customer.custid = orders.custid;

--FULL OUTER JOIN : ��ġ�ϴ� �����Ͱ� ���� ��� �ش� ���̺����� NULL ���� ���
select customer.name, orders.saleprice
from customer
full outer join orders on customer.custid=orders.custid;

--CROSS JOIN : �� ���̺� ���� ��� ������ ������ ����
select customer.name, orders.saleprice
from customer
cross join orders;

--Q. ������ �������� ���� ���� �����Ͽ� ���� �̸��� ���� �ֹ��� ������ �ǸŰ����� ���Ͻÿ�.(�ΰ��� ���, where, join)
select customer.name, orders.saleprice
from customer
left outer join orders on customer.custid = orders.custid;

select customer.name, orders.saleprice
from customer, orders
where orders.custid(+) = customer.custid;


--�μ� ����
select * from customer;
select * from orders;
select * from book;
--Q. ������ ������ ���� �ִ� ���� �̸��� �˻��Ͻÿ�.
select name
from customer
where custid in (select custid from orders);

--Q. �����ѹ̵����� ������ ������ ������ ���� �̸��� ���̽ÿ�.
select name
from customer
where custid in (select custid from orders 
where bookid in (select bookid from book 
where PUBLISHER = '���ѹ̵��'));


--Q. ���ǻ纰�� ���ǻ��� ��� ���� ���ݺ��� ��� ������ ���Ͻÿ�.
select publisher, bookname, price
from book
where price>(select avg(price) from book );

--Q. ������ �ֹ����� ���� ���� �̸��� ���̽ÿ�.
select name
from customer
where custid not in(select custid from orders);

--Q. �ֹ��� �ִ� ���� �̸��� �ּҸ� ���̽ÿ�.
select name, address
from customer
where custid in(select custid from orders);

--���� ���ڵ��� �ǹ�
--��ǻ�ʹ� ���ڷ� �̷���� �����͸� ó��. ���ڵ��� ���� ����(��: 'A', '��', '?')�� 
--����(�ڵ� ����Ʈ)�� ��ȯ�Ͽ� ��ǻ�Ͱ� �����ϰ� ������ �� �ְ� �Ѵ�.
--���� ���, ASCII ���ڵ������� �빮�� 'A'�� 65��, �ҹ��� 'a'�� 97�� ���ڵ�. 
--�����ڵ� ���ڵ������� 'A'�� U+0041, �ѱ� '��'�� U+AC00, �̸�Ƽ�� '?'�� U+1F60A�� ���ڵ�
--�ƽ�Ű�� 7��Ʈ�� ����Ͽ� �� 128���� ���ڸ� ǥ���ϴ� �ݸ� �����ڵ�� �ִ� 1,114,112���� ���ڸ� ǥ��

--ASCII ���ڵ�:
--���� 'A' -> 65 (10����) -> 01000001 (2����)
--���� 'B' -> 66 (10����) -> 01000010 (2����)

--�����ڵ�(UTF-8) ���ڵ�: 
--���� 'A' -> U+0041 -> 41 (16����) -> 01000001 (2����, ASCII�� ����)
--���� '��' -> U+AC00 -> EC 95 80 (16����) -> 11101100 10010101 10000000 (2����)

--CLOB: CLOB�� �Ϲ������� �����ͺ��̽��� �⺻ ���� ����(��: ASCII, LATIN1 ��)�� ����Ͽ� �ؽ�Ʈ �����͸� ����. 
--�� ������ �ַ� ����� ���� ���� ����Ʈ ���ڷ� �̷���� �ؽ�Ʈ�� �����ϴ� �� ���.
--NCLOB: NCLOB�� �����ڵ�(UTF-16)�� ����Ͽ� �ؽ�Ʈ �����͸� ����. ���� �ٱ��� ������ �ʿ��� ��, \
--�� �پ��� ���� ������ �ؽ�Ʈ �����͸� ������ �� ����. �ٱ��� ���ڰ� ���Ե� �����͸� ȿ�������� ó���� �� �ִ�.



--������ Ÿ��
--������ (Numeric Types)
--NUMBER: ���� �������� ���� ������ Ÿ��. ����, �Ǽ�, ���� �Ҽ���, �ε� �Ҽ��� ���� ����
--NUMBER�� NUMBER(38,0)�� ���� �ǹ̷� �ؼ�, Precision 38�� �ڸ���, Scale 0�� �Ҽ��� ���� �ڸ���
--NUMBER(10), NUMBER(8,2)<=******.**��

--������ (Character Types)
--VARCHAR2(size): ���� ���� ���ڿ��� ����. size�� �ִ� ���� ���̸� ����Ʈ, Ȥ�� ���ڼ��� ����
--NVARCHAR2(size)�� ����� ������ ���� ����Ʈ ���� ��� �׻� ���� ������ ũ�Ⱑ ����
--CHAR(size): ���� ���� ���ڿ��� ����. ������ ���̺��� ª�� ���ڿ��� �ԷµǸ� �������� �������� ä����

--��¥ �� �ð��� (Date and Time Types)
--DATE: ��¥�� �ð��� ����. ������ Ÿ���� ��, ��, ��, ��, ��, �ʸ� ����
--DATE Ÿ���� ��¥�� �ð��� YYYY-MM-DD HH24:MI:SS �������� �����մϴ�.
--���� ���, 2024�� 5�� 20�� ���� 3�� 45�� 30�ʴ� 2024-05-20 15:45:30���� ����
--TIMESTAMP: ��¥�� �ð��� �� ���� ������ �������� ����

--���� �������� (Binary Data Types)
--BLOB: �뷮�� ���� �����͸� ����. �̹���, ����� ���� ���� �����ϴ� �� ����

--��Ը� ��ü�� (Large Object Types)
--CLOB: �뷮�� ���� �����͸� ����
--NCLOB: �뷮�� ������ ���� ���� �����͸� ����

--�������� : 
--PRIMARY KEY : �� ���� �����ϰ� �ĺ��ϴ� ��(�Ǵ� ������ ����). �ߺ��ǰų� NULL ���� ������� �ʴ´�.
--FOREIGN KEY : �ٸ� ���̺��� �⺻ Ű�� �����ϴ� ��. ���� ���Ἲ�� ����
--UNIQUE : ���� �ߺ��� ���� ����� ���� ����. NULL���� ���
--NOT NULL : ���� NULL ���� ������� �ʴ´�.
--CHECK : �� ���� Ư�� ������ �����ؾ� ���� ���� (��: age > 18)
--DEFAULT : ���� ������� ���� �������� ���� ��� ���� �⺻���� ����

--VARCHAR2�� �� ���� ������� ���̸� ���� : ����Ʈ�� ����
--���� Ȯ�� ���
SELECT *
FROM v$nls_parameters
where parameter = 'nsl_length_semantics';


--AUTHOR ���̺� ����
CREATE TABLE authors (
    id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50) NOT NULL,
    last_name VARCHAR2(50) NOT NULL,
    nationality VARCHAR2(50)
);
DROP TABLE authors;

--Q. NEWBOOK�̶�� ���̺��� �����ϼ���.
CREATE TABLE NEWBOOK(
    booknumber NUMBER PRIMARY KEY,
    bookname VARCHAR2(50) NOT NULL,
    bookprice NUMBER CHECK(5000<bookprice) NOT NULL ,
    bookautohr varchar(50) NOT NULL
);
drop table newbook;


CREATE TABLE newbook(
    bookid NUMBER,
    isbn NUMBER(13),
    bookname VARCHAR2(50) NOT NULL,
    author VARCHAR2(50) NOT NULL,
    publisher VARCHAR2(30) NOT NULL,
    price NUMBER DEFAULT 10000 CHECK(price>1000),
    published_date DATE,
    PRIMARY KEY(bookid)
);

select * from newbook;

insert into newbook values( 1, 9781234567890, 'SQL Guide', 'John Doe', 'TechBooks', 15000,
TO_DATE('2024-05-20', 'YYYY-MM-DD'));


DELETE FROM newbook;

insert into newbook values( 2, 9781234567123213890, 'SQL Guide', 'John Doe', 'TechBooks', 15000,
TO_DATE('2024-05-20 15:45:30', 'YYYY-MM-DD HH24:MI:SS'));

insert into newbook values( 3, 978123498010213890, 'SQL Guide', 'John Doe', 'TechBooks', 15000,
TO_DATE('2024-05-20 15:45:30', 'YYYY-MM-DD HH24:MI:SS'));

desc newbook;
--���̺� �������� ����, �߰�, �Ӽ� �߰�, ����, ����
ALTER TABLE newbook MODIFY (isbn VARCHAR2(10));
ALTER TABLE newbook add author_id NUMBER;
ALTER TABLE newbook drop column author_id;

--ON DELETE CASCADE, �ɼ��� �����Ǿ� �־�, newcustomer ���̺��� � ���� ���ڵ尡 �����Ǹ�, �ش� ���� ��� �ֹ���
--neworders ���̺����� �ڵ����� ����
CREATE TABLE newcustomer(
custid NUMBER PRIMARY KEY,
name varchar2(40),
address varchar2(40),
phone varchar2(30));

CREATE TABLE neworders(
orderid NUMBER,
custid number not null,
bookid number not null,
saleprice number,
orderdate date,
primary key(orderid),
foreign key(custid) references newcustomer(custid) on delete cascade);

desc neworders;
desc newcustomer;



insert into newcustomer values(1,'KEVIN','���ﵿ','010-4630-7661');

insert into neworders values(10,1,100,1000,sysdate);

select * from newcustomer;
select * from neworders;

delete from newcustomer;
delete from neworders;


--Task1_0520. 10���� �Ӽ����� �����Ǵ� ���̺� 2���� �ۼ��ϼ���. �� foreign key�� �����Ͽ� ���� ���̺��� �����͸� ���� �� �ٸ� ���̺���
--���õǴ� �����͵� �� �����ǵ��� �ϼ���. (��� ���������� ���)
--��, �� ���̺� 5���� �����͸� �Է��ϰ� �ι�° ���̺� ù��° �����͸� �����ϰ� �ִ� �Ӽ��� �����Ͽ� ������ ����

create table nbs(
    bidasd Number primary key,
    bnmasd varchar2(40) not null,
    bpcasd number default 5000 check(bpcasd >= 5000),
    bpsasd varchar2(40),
    pdsasd date
);

create table nods(
    odid number primary key,
    odbid number not null,
    odsp number not null,
    oddt date,
    odpk number unique,
    foreign key(odbid) references nbs(bidasd) on delete cascade
);

--Task2_0520. Customer ���̺��� �ڼ��� ���� �ּҸ� �迬�� ���� �ּҷ� �����Ͻÿ�.
select * from customer;

update customer set address  = (select address from customer where name = '�ڼ���') where name = '�迬��';

select * from customer;

--Task3_0520.���� ���� ���߱����� ���Ե� ������ ���󱸡��� ������ �� ���� ���, ������ ���̽ÿ�.
select * from book;

update book set BOOKNAME = replace(bookname ,'�߱�', '��') ;

select bookname, price from book;

--Task4_0520. ���缭���� �� �߿��� ���� ��(��)�� ���� ����� �� ���̳� �Ǵ��� ���� �ο����� ���Ͻÿ�.
select * from customer;

select 
count(case when NAME like '��__' then 1 end)  �达,
count(case when NAME like '%��%' then 1 end)  �ھ�,
count(case when name like '%��%' then 1 end)  �徾,
count(case when name like '%��%' then 1 end)  �߾�,
count(case when name like '%��%' then 1 end)  �̾�
from customer;

SELECT SUBSTR(name, 1, 1) ��, COUNT(*) �ο�
FROM Customer
GROUP BY SUBSTR(name, 1, 1);
--Task5_0520. ���缭���� �ֹ��Ϸκ��� 10�� �� ������ Ȯ���Ѵ�. �� �ֹ��� Ȯ�����ڸ� ���Ͻÿ�.
select orderid, orderdate +10 as Ȯ������
from orders;

select * from orders;
--Task6_0520.���缭���� 2020�� 7�� 7�Ͽ� �ֹ����� ������ �ֹ���ȣ, �ֹ���, ����ȣ, ������ȣ�� ��� ���̽ÿ�. 
--�� �ֹ����� ��yyyy-mm-dd ���ϡ� ���·� ǥ���Ѵ�.
select orderid, orderdate, custid, bookid
from orders
where orderdate = '2020-07-07';

--Task7_0520. ��� �ֹ��ݾ� ������ �ֹ��� ���ؼ� �ֹ���ȣ�� �ݾ��� ���̽ÿ�.
select orderid, saleprice
from orders
where saleprice<(select avg(saleprice) from orders);