select * from BOOK;
select bookid,price from Book;
select * from customer;
select * from orders;
select * from imported_book;

--중복 없이 출력 distinct
select distinct publisher from book;

--Q. 가격이 만원 이상인 도서를 검색
select * from book 
WHERE price > 10000;

--Q. 가격이 10000원 이상 20000원 이하인 도서를 검색하시오. (2가지 방법)
select * from book
where 10000<=price AND price<=20000;

select * from book
where price between 10000 and 20000;

--Task1_0517. 출판사가 '굿스포츠' 혹은 '대한미디어' 인 도서를 검색하시오.(3가지 방법)/*완*/
select * from BOOK
where publisher = '굿스포츠' or publisher = '대한미디어';

select * from book
where publisher like '굿스포츠' or publisher like'대한미디어';

--Task2_0517. 출판사가 '굿스포츠' 혹은 '대한미디어'가 아닌 도서를 검색./*완*/
select * from book
where not publisher= '굿스포츠' and not publisher= '대한미디어' ;

--like는 정확히'축구의 역사'와 일치하는 행만 선택
select bookname, publisher from book
where bookname like '축구의 역사';

--%...%는 ...을 포함한것을 선택 
select bookname, publisher from book
where bookname like '%축구%';

--도서이름의 왼쪽 두 번째 위치에 '구'라는 문자열을 갖는 도서
select bookname, publisher from book
where bookname like '_구%';

--Task3_0517. 축구에 관한 도서중 가격이 20000원 이상인 도서를 검색하시오./*완*/
select * from book
where bookname like '%축구%' and price >20000;

--ORDER BY : 기본 올림차순 정렬
select * from book
order by bookname;

select * from book
order by price;

--내림차순
select * from book
order by price desc;

--Q. 도서를 가격순으로 검색하고, 가격이 같으면 이름순으로 검색하시오
select * from book
order by price desc ,bookname;

--Q. 2번이 주문한 도서의 총 판매액을 구하시오.
select * from orders;
select sum(saleprice) as "총 판매액" 
from orders
where custid =2;

--GROUP BY : 데이터를 특정 기준에 따라 그룹화하는데 사용. 이를 통해 집계 함수(SUM, AVG, MAX, MIN, COUNT)를 이용, 계산
select sum(saleprice) as total,
avg(saleprice) as average,
min(saleprice) as mininum,
MAX(saleprice) as maximum
from orders;

--총판매액을 custid 기준으로 그룹화
select custid, count(*) as 도서수량, sum(saleprice) as "총 판매액"
from orders
Group by custid;

--bookid가 5보다 큰 조건
select custid, count(*) as 도서수량, sum(saleprice) as "총 판매액"
from orders
where bookid >= 5
Group by custid;

--도서수량이 2보다 큰 조건
select custid, count(*) as 도서수량, sum(saleprice) as "총 판매액"
from orders
where bookid >= 5
Group by custid
having count(*) >2;

--Task4_0517. 2번 김연아 고객이 주문한 도서의 총 판매액을 구하시오.
SELECT sum(saleprice) as "총판"
from orders
WHERE orderid = 2;

SELECT Customer.name, sum(Orders.saleprice) as 총판
FROM Orders,Customer 
WHERE Orders.custid = Customer.custid and orders.custid = 2
group by customer.name;
--Task5_0517. 가격이 8,000원 이상인 도서를 구매한 고객에 대하여 고객별 주문 도서의 총 수량을 구하시오. 
--단, 두 권 이상 구매한 고객만 구하시오.

SELECT custid, COUNT(*) as "총 권수"
FROM Orders
WHERE saleprice >= 8000 
GROUP BY custid
HAVING COUNT(*) >= 2;

select custid , sum(saleprice) as "총판" , count(*) as "구매횟수"
from orders
where saleprice > 8000
group by custid;


--Task6_0517. 고객의 이름과 고객이 주문한 도서의 판매가격을 검색하시오.
SELECT Customer.name,Orders.saleprice FROM Orders,Customer 
WHERE Orders.custid = Customer.custid;

SELECT Customer.name, sum(Orders.saleprice) as 총판
FROM Orders,Customer 
WHERE Orders.custid = Customer.custid
group by customer.name;

--Task7_0517. 고객별로 주문한 모든 도서의 총 판매액을 구하고, 고객별로 정렬하시오.
SELECT Customer.name, sum(Orders.saleprice) as 총판
FROM Orders,Customer 
WHERE Orders.custid = Customer.custid
group by customer.name;
