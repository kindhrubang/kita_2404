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

select *
from book
where publisher in ('굿스포츠' , '대한미디어');

select *
from book
where publisher = '굿스포츠'
union
select *
from book
where publisher = '대한미디어';

select * from book
where publisher like '굿스포츠' or publisher like'대한미디어';




--Task2_0517. 출판사가 '굿스포츠' 혹은 '대한미디어'가 아닌 도서를 검색./*완*/
select * from book
where not publisher= '굿스포츠' and not publisher= '대한미디어' ;

SELECT * FROM book
WHERE publisher NOT IN ('굿스포츠','대한미디어');

--like는 정확히'축구의 역사'와 일치하는 행만 선택
select bookname, publisher from book
where bookname like '축구의 역사';



--%: 0개 이상의 임의의 문자
--_: 정확히 1개의 임의의 문자
--'축구'가 포함된 출판사
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

--Task4_0517. 2번 김연아 고객이 주문한 도서의 개수와 총 판매액을 구하시오.
SELECT  sum(saleprice) as "총판" 
from orders
WHERE orderid = 2;


SELECT Customer.name, sum(Orders.saleprice) as 총판
FROM Orders,Customer 
WHERE Orders.custid = Customer.custid and orders.custid = 2
group by customer.name;

select customer.name, orders.custid, sum(orders.saleprice) as 총판
from orders, customer
where orders.custid = 2 and orders.custid=customer.custid
group by customer.name, orders.custid;


select customer.name, orders.custid, sum(orders.saleprice) 총판
from orders
inner join customer on orders.custid = customer.custid
where orders.custid =2
group by customer.name, orders.custid;
--Task4_0517-2. 2번 김연아 고객이 주문한 도서의 수량과 총 판매액을 구하시오.
select customer.name, orders.custid ,count(orders.orderid) as 판매권수, sum(orders.saleprice) as 총판
from customer, orders
where orders.custid = customers.custid and orders.custid = 2
group by customer.name, orders,custid;

select customer.name, orders.custid, count(orders.orderid) "도서 수량", sum(orders.saleprice) "총 판매액"
from orders
inner join customer on orders.custid = customer.custid
where orders.custid=2
group by customer.name, orders.custid;

--Task5_0517. 가격이 8,000원 이상인 도서를 구매한 고객에 대하여 고객별 주문 도서의 총 수량을 구하시오. 
--단, 두 권 이상 구매한 고객만 구하시오.

SELECT custid, COUNT(*) as "총 권수"
FROM Orders
WHERE saleprice >= 8000 
GROUP BY custid
HAVING COUNT(*) >= 2
order by custid;

select custid , sum(saleprice) as "총판" , count(*) as "구매횟수"
from orders
where saleprice > 8000
group by custid;


--Task6_0517. 고객의 이름과 고객이 주문한 도서의 판매가격을 검색하시오.
SELECT Customer.name, Orders.saleprice
FROM Orders,Customer 
WHERE Orders.custid = Customer.custid;


SELECT Customer.name, sum(Orders.saleprice) as 총판
FROM Orders,Customer 
WHERE Orders.custid = Customer.custid
group by customer.name;

select name, saleprice
from customer, orders
where customer.custid=orders.custid;

select name, orders.custid, saleprice
from customer, orders
where customer.custid=orders.custid;


--Task7_0517. 고객별로 주문한 모든 도서의 총 판매액을 구하고, 고객별로 정렬하시오.
SELECT Customer.name, sum(Orders.saleprice) as 총판
FROM Orders,Customer 
WHERE Orders.custid = Customer.custid
group by customer.name;

select custid, sum(saleprice) 총판
from orders
group by custid
order by 총판;

select custid, sum(saleprice) 총판
from orders
group by custid
order by sum(saleprice);

select name, sum(saleprice) as 총판
from customer C, orders O
where C.custid = O.custid
group by C.name
order by C.name;

--Q. 고객의 이름과 고객이 주문한 도서의 이름을 구하시오.
select c.name, O.bookid, b.bookname
from customer C, book B ,orders O
where C.custid = o.custid and o.bookid = b.bookid;

select customer.name, book.bookname
from orders
inner join customer on orders.custid = customer.custid
inner join book on orders.bookid = book.bookid;

--Q. 가격이 20,000원인 도서를 주문한 고객의 이름과 도서의 이름을 구하시오,

select c.name, O.bookid, b.bookname
from customer C, book B ,orders O
where C.custid = o.custid and o.bookid = b.bookid and B.price = 20000;

--JOIN은 두 개 이상의 테이블을 연결하여 관련된 데이터를 결합할 때 사용
select  * from customer;
select * from orders;

--내부 조인 (INNER JOIN)
select customer.name, orders.saleprice
from customer
inner join orders on orders.custid = customer.custid;

--왼쪽 외부 조인 (Left Outer Join) : . 두 번째 테이블에 일치하는 데이터가 없는 경우 NULL 값이 사용
select customer.name, orders.saleprice
from customer
left outer join orders on customer.custid=orders.custid;

--오른쪽 외부 조인 (Right Outer Join) : 첫 번째 테이블에 일치하는 데이터가 없는 경우 NULL 값이 사용
select customer.name, orders.saleprice
from customer
right outer join orders on customer.custid = orders.custid;

--FULL OUTER JOIN : 일치하는 데이터가 없는 경우 해당 테이블에서는 NULL 값이 사용
select customer.name, orders.saleprice
from customer
full outer join orders on customer.custid=orders.custid;

--CROSS JOIN : 두 테이블 간의 모든 가능한 조합을 생성
select customer.name, orders.saleprice
from customer
cross join orders;

--Q. 도서를 구매하지 않은 고객을 포함하여 고객의 이름과 고객이 주문한 도서의 판매가격을 구하시오.(두가지 방법, where, join)
select customer.name, orders.saleprice
from customer
left outer join orders on customer.custid = orders.custid;

select customer.name, orders.saleprice
from customer, orders
where orders.custid(+) = customer.custid;


--부속 질의
select * from customer;
select * from orders;
select * from book;
--Q. 도서를 구매한 적이 있는 고객의 이름을 검색하시오.
select name
from customer
where custid in (select custid from orders);

--Q. ‘대한미디어’에서 출판한 도서를 구매한 고객의 이름을 보이시오.
select name
from customer
where custid in (select custid from orders 
where bookid in (select bookid from book 
where PUBLISHER = '대한미디어'));


--Q. 출판사별로 출판사의 평균 도서 가격보다 비싼 도서를 구하시오.
select publisher, bookname, price
from book
where price>(select avg(price) from book );

--Q. 도서를 주문하지 않은 고객의 이름을 보이시오.
select name
from customer
where custid not in(select custid from orders);

--Q. 주문이 있는 고객의 이름과 주소를 보이시오.
select name, address
from customer
where custid in(select custid from orders);

--문자 인코딩의 의미
--컴퓨터는 숫자로 이루어진 데이터를 처리. 인코딩을 통해 문자(예: 'A', '가', '?')를 
--숫자(코드 포인트)로 변환하여 컴퓨터가 이해하고 저장할 수 있게 한다.
--예를 들어, ASCII 인코딩에서는 대문자 'A'를 65로, 소문자 'a'를 97로 인코딩. 
--유니코드 인코딩에서는 'A'를 U+0041, 한글 '가'를 U+AC00, 이모티콘 '?'를 U+1F60A로 인코딩
--아스키는 7비트를 사용하여 총 128개의 문자를 표현하는 반면 유니코드는 최대 1,114,112개의 문자를 표현

--ASCII 인코딩:
--문자 'A' -> 65 (10진수) -> 01000001 (2진수)
--문자 'B' -> 66 (10진수) -> 01000010 (2진수)

--유니코드(UTF-8) 인코딩: 
--문자 'A' -> U+0041 -> 41 (16진수) -> 01000001 (2진수, ASCII와 동일)
--문자 '가' -> U+AC00 -> EC 95 80 (16진수) -> 11101100 10010101 10000000 (2진수)

--CLOB: CLOB은 일반적으로 데이터베이스의 기본 문자 집합(예: ASCII, LATIN1 등)을 사용하여 텍스트 데이터를 저장. 
--이 때문에 주로 영어와 같은 단일 바이트 문자로 이루어진 텍스트를 저장하는 데 사용.
--NCLOB: NCLOB은 유니코드(UTF-16)를 사용하여 텍스트 데이터를 저장. 따라서 다국어 지원이 필요할 때, \
--즉 다양한 언어로 구성된 텍스트 데이터를 저장할 때 적합. 다국어 문자가 포함된 데이터를 효율적으로 처리할 수 있다.



--데이터 타입
--숫자형 (Numeric Types)
--NUMBER: 가장 범용적인 숫자 데이터 타입. 정수, 실수, 고정 소수점, 부동 소수점 수를 저장
--NUMBER는 NUMBER(38,0)와 같은 의미로 해석, Precision 38은 자리수, Scale 0은 소수점 이하 자릿수
--NUMBER(10), NUMBER(8,2)<=******.**임

--문자형 (Character Types)
--VARCHAR2(size): 가변 길이 문자열을 저장. size는 최대 문자 길이를 바이트, 혹은 글자수로 지정
--NVARCHAR2(size)의 사이즈를 지정할 때는 바이트 단위 대신 항상 문자 단위로 크기가 지정
--CHAR(size): 고정 길이 문자열을 저장. 지정된 길이보다 짧은 문자열이 입력되면 나머지는 공백으로 채워짐

--날짜 및 시간형 (Date and Time Types)
--DATE: 날짜와 시간을 저장. 데이터 타입은 년, 월, 일, 시, 분, 초를 포함
--DATE 타입은 날짜와 시간을 YYYY-MM-DD HH24:MI:SS 형식으로 저장합니다.
--예를 들어, 2024년 5월 20일 오후 3시 45분 30초는 2024-05-20 15:45:30으로 저장
--TIMESTAMP: 날짜와 시간을 더 상세히 나노초 단위까지 저장

--이진 데이터형 (Binary Data Types)
--BLOB: 대량의 이진 데이터를 저장. 이미지, 오디오 파일 등을 저장하는 데 적합

--대규모 객체형 (Large Object Types)
--CLOB: 대량의 문자 데이터를 저장
--NCLOB: 대량의 국가별 문자 집합 데이터를 저장

--제약조건 : 
--PRIMARY KEY : 각 행을 고유하게 식별하는 열(또는 열들의 조합). 중복되거나 NULL 값을 허용하지 않는다.
--FOREIGN KEY : 다른 테이블의 기본 키를 참조하는 열. 참조 무결성을 유지
--UNIQUE : 열에 중복된 값이 없어야 함을 지정. NULL값이 허용
--NOT NULL : 열에 NULL 값을 허용하지 않는다.
--CHECK : 열 값이 특정 조건을 만족해야 함을 지정 (예: age > 18)
--DEFAULT : 열에 명시적인 값이 제공되지 않을 경우 사용될 기본값을 지정

--VARCHAR2는 두 가지 방식으로 길이를 정의 : 바이트와 문자
--설정 확인 방법
SELECT *
FROM v$nls_parameters
where parameter = 'nsl_length_semantics';


--AUTHOR 테이블 생성
CREATE TABLE authors (
    id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50) NOT NULL,
    last_name VARCHAR2(50) NOT NULL,
    nationality VARCHAR2(50)
);
DROP TABLE authors;

--Q. NEWBOOK이라는 테이블을 생성하세요.
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
--테이블 제약조건 수정, 추가, 속성 추가, 삭제, 수정
ALTER TABLE newbook MODIFY (isbn VARCHAR2(10));
ALTER TABLE newbook add author_id NUMBER;
ALTER TABLE newbook drop column author_id;

--ON DELETE CASCADE, 옵션이 설정되어 있어, newcustomer 테이블에서 어떤 고객의 레코드가 삭제되면, 해당 고객의 모든 주문이
--neworders 테이블에서도 자동으로 삭제
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



insert into newcustomer values(1,'KEVIN','역삼동','010-4630-7661');

insert into neworders values(10,1,100,1000,sysdate);

select * from newcustomer;
select * from neworders;

delete from newcustomer;
delete from neworders;


--Task1_0520. 10개의 속성으로 구성되는 테이블 2개를 작성하세요. 단 foreign key를 적용하여 한쪽 테이블의 데이터를 삭제 시 다른 테이블의
--관련되는 데이터도 모무 삭제되도록 하세요. (모든 제약조건을 사용)
--단, 각 테이블에 5개의 데이터를 입력하고 두번째 테이블에 첫번째 데이터를 참조하고 있는 속성을 선택하여 데이터 삭제

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

--Task2_0520. Customer 테이블에서 박세리 고객의 주소를 김연아 고객의 주소로 변경하시오.
select * from customer;

update customer set address  = (select address from customer where name = '박세리') where name = '김연아';

select * from customer;

--Task3_0520.도서 제목에 ‘야구’가 포함된 도서를 ‘농구’로 변경한 후 도서 목록, 가격을 보이시오.
select * from book;

update book set BOOKNAME = replace(bookname ,'야구', '농구') ;

select bookname, price from book;

--Task4_0520. 마당서점의 고객 중에서 같은 성(姓)을 가진 사람이 몇 명이나 되는지 성별 인원수를 구하시오.
select * from customer;

select 
count(case when NAME like '김__' then 1 end)  김씨,
count(case when NAME like '%박%' then 1 end)  박씨,
count(case when name like '%장%' then 1 end)  장씨,
count(case when name like '%추%' then 1 end)  추씨,
count(case when name like '%이%' then 1 end)  이씨
from customer;

SELECT SUBSTR(name, 1, 1) 성, COUNT(*) 인원
FROM Customer
GROUP BY SUBSTR(name, 1, 1);
--Task5_0520. 마당서점은 주문일로부터 10일 후 매출을 확정한다. 각 주문의 확정일자를 구하시오.
select orderid, orderdate +10 as 확정일자
from orders;

select * from orders;
--Task6_0520.마당서점이 2020년 7월 7일에 주문받은 도서의 주문번호, 주문일, 고객번호, 도서번호를 모두 보이시오. 
--단 주문일은 ‘yyyy-mm-dd 요일’ 형태로 표시한다.
select orderid, orderdate, custid, bookid
from orders
where orderdate = '2020-07-07';

--Task7_0520. 평균 주문금액 이하의 주문에 대해서 주문번호와 금액을 보이시오.
select orderid, saleprice
from orders
where saleprice<(select avg(saleprice) from orders);