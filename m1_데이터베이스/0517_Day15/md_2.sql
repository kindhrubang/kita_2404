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

select * from book
where publisher like '�½�����' or publisher like'���ѹ̵��';

--Task2_0517. ���ǻ簡 '�½�����' Ȥ�� '���ѹ̵��'�� �ƴ� ������ �˻�./*��*/
select * from book
where not publisher= '�½�����' and not publisher= '���ѹ̵��' ;

--like�� ��Ȯ��'�౸�� ����'�� ��ġ�ϴ� �ุ ����
select bookname, publisher from book
where bookname like '�౸�� ����';

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

--Task4_0517. 2�� �迬�� ���� �ֹ��� ������ �� �Ǹž��� ���Ͻÿ�.
SELECT sum(saleprice) as "����"
from orders
WHERE orderid = 2;

SELECT Customer.name, sum(Orders.saleprice) as ����
FROM Orders,Customer 
WHERE Orders.custid = Customer.custid and orders.custid = 2
group by customer.name;
--Task5_0517. ������ 8,000�� �̻��� ������ ������ ���� ���Ͽ� ���� �ֹ� ������ �� ������ ���Ͻÿ�. 
--��, �� �� �̻� ������ ���� ���Ͻÿ�.

SELECT custid, COUNT(*) as "�� �Ǽ�"
FROM Orders
WHERE saleprice >= 8000 
GROUP BY custid
HAVING COUNT(*) >= 2;

select custid , sum(saleprice) as "����" , count(*) as "����Ƚ��"
from orders
where saleprice > 8000
group by custid;


--Task6_0517. ���� �̸��� ���� �ֹ��� ������ �ǸŰ����� �˻��Ͻÿ�.
SELECT Customer.name,Orders.saleprice FROM Orders,Customer 
WHERE Orders.custid = Customer.custid;

SELECT Customer.name, sum(Orders.saleprice) as ����
FROM Orders,Customer 
WHERE Orders.custid = Customer.custid
group by customer.name;

--Task7_0517. ������ �ֹ��� ��� ������ �� �Ǹž��� ���ϰ�, ������ �����Ͻÿ�.
SELECT Customer.name, sum(Orders.saleprice) as ����
FROM Orders,Customer 
WHERE Orders.custid = Customer.custid
group by customer.name;
