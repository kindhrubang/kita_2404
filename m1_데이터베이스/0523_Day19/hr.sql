select * from employees;


--Q. 사번이 120번인 사람의 사번, 이름, 업무(job_id) 업무명(job_title)을 출력.
select e.employee_id 사번, e.first_name 이름, e.last_name 성, e.job_id, j.job_title
from employees e
inner join jobs j on e.job_id = j.job_id
where e.employee_id = 120;

--FIRST_NAME ||''|| LAST_NAME AS 이름: FIRST_NAME과 LAST_NAME을 공백으로 연결하여
--하나의 문자열로 합치고, 이 결과의 별칭을 '이름'으로 지정
select e.employee_id 사번, e.first_name ||' '|| e.last_name 이름, e.job_id, j.job_title
from employees e
inner join jobs j on e.job_id = j.job_id
where e.employee_id = 120;

select
employee_id 사번,
first_name ||' '|| last_name as 이름,
j.job_id 업무,
j.job_title 업무명
from employees e, jobs j
where e.employee_id = 120
and e.job_id = j.job_id;

--Q. 2005년 상반기에 입사한 사람들의 이름(FULL NAME)과 입사일만 출력

select * from employees ;
select 
e.first_name ||' '|| e.last_name "FULL NAME",
e.HIRE_DATE
from employees e
where to_char(hire_date, 'yy/mm') between '05/01' and '05/06';

--_을 와일드카드가 아닌 문자로 취급하고 싶을 때 escape 옵션을 사용
select * from employees where job_id like '%\_A%';
select * from employees where job_id like '%\_A%'escape '\';
select * from employees where job_id like '%#_A%'escape '#';

--in : or대신 사용
select * from employees where manager_id = 101 or  manager_id = 102 or  manager_id = 103;
select * from employees where manager_id in (101, 102, 103);

--Q. 업무 SA_MAN, IT_PROG, ST_MAN인 사람만 출력
select * 
from employees
where job_id in ('SA_MAN', 'IT_PROG','ST_MAN');

--IS NULL / IS NOT NULL
--null 값인지를 확인할 경우 = 비교 연산자를 사용하지 않고 is_null을 사용한다.
select * from employees where commission_pct is not null;

--ORDER BY
--ORDER BY 칼럼명 [ASC | DESC]
select * from employees order by salary asc;
select * from employees order by salary desc;
select * from employees order by salary asc, last_name desc;

--DUAL 테이블
--mod는 나머지 구하는 함수
select * from employees where mod( employee_id, 2)=1; --2로 나눌때 1이면
select mod(10,3) from dual;

--round()
select round(355.95555) from dual;
select round(355.95555, 2) from dual;
select round(355.95555, -2) from dual;

--trunc() 버림 함수, 지정한 자리수 이하를 버린 결과 제공
select trunc(45.555,1) from dual;

--ceil() 무조건 올림
select  ceil(45.111) from dual;

--Q. HR EMPLOYEES 테이블에서 이름, 급여, 10%인상된  급여를 출력하세요.
select last_name 이름, salary 급여, salary*1.1 "인상된 급여"
from employees;

--Q. employee_id가 홀수인 직원의 employee_id와 last_name을 출력하세요.
select employee_id , last_name  이름
from employees
where mod(employee_id, 2) = 1;

SELECT
    *
FROM
employees;

--Q. employees 테이블에서 commission_pct 의 Null값의 갯수를 출력하세요
select count(*) from employees where commission_pct is null;

--Q. employees 테이블에서 deparment_id 가 없는 직원을 추출하여 position을 '신입'으로 출력하세요. (position열을 추가)
select employee_id, first_name ||' '|| last_name 이름, '신입' position
from employees
where department_id is null;

--Q. hr EMPLOYEES 테이블에서 salary, last_name 순으로 올림차순 정렬하여 출력하세요
select *
from employees
order by salary, last_name;

--날짜 관련
select sysdate from dual;
select sysdate +1 from dual;
select sysdate -1 from dual;

select * from employees;
--근무한 날짜 계산
select last_name, sysdate, hire_date, trunc(sysdate - hire_date) 근무기간
from employees;

--add_months()              특정 개월 수를 더한 날짜를 구한다
select last_name, hire_date, add_months(hire_date, 6) revised_date from employees;

--last_day()                해당되는 월의 마지막 날짜를 반환하는 함수
select last_name, hire_date, last_day(hire_date) from employees;

select last_name, hire_date, last_day(add_months(hire_date, 1)) from employees;

--next_day()                해당 날짜를 기준으로 다음에 오는 요일에 해당하는 날짜를 반환
--일 ~ 토, 1 ~ 7 로 표현가능
select hire_date, next_day(hire_date, '월') from employees;
select hire_date, next_day(hire_date, 2) from employees;

--months_between()          날'자와 날짜 사이의 개월수를 구한다.(개월 수를 소수점 첫째 자리까지 반올림)
select hire_date, round(months_between(sysdate, hire_date),1) from employees;

--형 변환 함수 : to_date()    문자열을 날짜로
--'2023-01-01'이라는 문자열을 날짜 타입으로 변환
select to_date('2023-01-01', 'yyyy-mm-dd') from dual;

--to_char(날짜)              날짜를 문자로 변환
select to_char(sysdate, 'YYyy/mM/dd  mon-dy- ') from dual;

--형식
--YYYY       네 자리 연도
--YY      두 자리 연도
--YEAR      연도 영문 표기
--MM      월을 숫자로
--MON      월을 알파벳으로
--DD      일을 숫자로
--DAY      요일 표현
--DY      요일 약어 표현
--D      요일 숫자 표현
--AM 또는 PM   오전 오후
--HH 또는 HH12   12시간
--HH24      24시간
--MI      분
--SS      초

--Q. 현재 날짜를 (sysdate)를 'yyyy/mm/dd'형식의 문자열로 변환하세요.
select to_char(sysdate, 'yyyy|\mm|\dd') from dual;
--Q. '01-01-2023'이라는 문자열을 날짜 타입으로 변환하세요.
select to_date('01-01-2023', 'dd/mm/yyyy') from dual;

--Q. 현재 날짜와 시간(sysdate)을 'YYYY-MM-DD HH24:MI:ss'형식의 문자열로 바꾸시오
select to_char(sysdate, 'YYYY-MM-DD HH24:MI:ss') from dual;

--Q. '2023-01-01 15:30:00'이라는 문자열을 날짜 및 시간 타입으로 변환하세요.
select to_date('2023-01-01 15:30:30', 'YYYY-mm-dd hh24:mi:ss') 길어 from dual;



--to_char( 숫자 )   숫자를 문자로 변환
--9      한 자리의 숫자 표현      ( 1111, ‘99999’ )      1111   
--0      앞 부분을 0으로 표현      ( 1111, ‘099999’ )      001111
--$      달러 기호를 앞에 표현      ( 1111, ‘$99999’ )      $1111
--.      소수점을 표시         ( 1111, ‘99999.99’ )      1111.00
--,      특정 위치에 , 표시      ( 1111, ‘99,999’ )      1,111
--MI      오른쪽에 - 기호 표시      ( 1111, ‘99999MI’ )      1111-
--PR      음수값을 <>로 표현      ( -1111, ‘99999PR’ )      <1111>
--EEEE      과학적 표현         ( 1111, ‘99.99EEEE’ )      1.11E+03
--V      10을 n승 곱한값으로 표현   ( 1111, ‘999V99’ )      111100
--B      공백을 0으로 표현      ( 1111, ‘B9999.99’ )      1111.00
--L      지역통화         ( 1111, ‘L9999’ )

select salary, to_char(salary, '0999999')from employees;
select to_char(-salary,'999999pr') from employees;
--1111->1.11E+03
select to_char(11111, '9.999eeee') from dual;
select to_char(-1111111, '9999999mi') from dual;

--width_bucket()               지정값, 최소값, 최대값, bucket개수
select width_bucket(92, 0, 100, 10) from dual;
select width_bucket(100, 0, 100, 10) from dual;

select * from employees;
--Q. employees 테이블의 salary를 5개 등급으로 표시하세요
select max(salary) max, min(salary) min from employees;
select salary, width_bucket(salary, 2100, 24001, 5) as grade
from employees;

--문자 함수 character function
--upper()       대문자로 변경
select upper('Hello World') from dual;
--lower()       소문자로 변경
select lower('Hello World') from dual;

--Q. last_name이 seo인 직원의 last_name과 salary를 구하세요 (seo, SEO, Seo 모두 검출)
select last_name, salary
from  employees where lower(last_name) = 'seo';

--initcap() 첫글자만 대문자
select job_id, initcap(job_id) from employees;

--instr()       문자열의 길이
select job_id, length(job_id) from employees;

--instr()       문자열, 찾을 문자, 찾을 위치, 찾은 문자열중 몇번째
select instr('hello world','o' , 3 ,2) from dual;

--substr()      문자열, 시작위치 개수
select substr('hello world', 0, 3) from dual;
select substr('hello world', 9, 3) from dual;
select substr('hello world', -3, 3) from dual;

--lpad()        오른쪽 정렬 후 왼쪽에 문자를 채운다.
select lpad('Hello World', 20, '#') from dual;

--rpad()        왼쪽 정렬 후 오른쪽에 문자를 채운다.
select rpad('Hello World', 20, '#') from dual;

--ltrim()
select ltrim('aaaHello Worldaaa', 'a') from dual;
select ltrim('   Hello World   ') from dual;

--rtrim()
select rtrim('aaaHello Worldaaa', 'a') from dual;
select rtrim('   Hello World   ') from dual;

select last_name from employees;
select last_name as 이름, ltrim(last_name , 'A')as 변환 
from employees;

--trim
select trim('   Hello World   ') from dual;
--앞뒤의 특정 문자 제거
select last_name, trim('A' from last_name) 
from employees;

--nvl()     null을 0또는 다른값으로 변경
select last_name, manager_id, nvl(to_char(manager_id) ,'ceo') from employees;

--decode()    if문이나 case문과 같이 여러 경우를 선택할 수 있도록 하는 함수
--DECODE 함수는 단순한 조건에 기반하여 값을 반환합니다. 구문은 DECODE(expression, search1, result1, ..., searchN, resultN, default) 
--여기서 expression은 검사할 값을 나타내고, search와 result는 각각 조건과 해당 조건이 참일 때 반환할 값
--default는 모든 search 조건이 거짓일 때 반환할 기본 값 출력
select last_name, department_id,
decode(department_id,
    90, '경영지원실',
    60, '프로그래머',
    100,'인사부', '기타') 부서
from employees;
select * from employees;
--Q. employees 테이블에서 commission_pct가 null이 아닌 경우, 'A' null인 경우 'n'을 표시하는 쿼리 작성
select commission_pct as commission
    ,decode(commission_pct, null, 'N', 'A') as 변환 
from employees
order by 변환 desc;

--case()
--decode() 함수와 유사하나 decode() 함수는 조건이 단순한 조건 비교에 사용되는 반면
--case() 함수는 다양한 비교연산자로 조건을 제시할 수 있다.
--CASE 문은 조건에 따라 다른 값을 반환하는 데 사용되며, DECODE보다 복잡한 조건을 표현할 수 있다. 
--구문은 CASE WHEN condition THEN result ... ELSE default END이다. 

select 
last_name, 
department_id,
case 
    when department_id = 90 then '경영지원실'
    when department_id = 60 then '프로그래머'
    when department_id = 100 then '인사부'
    else '기타'
end as 소속
from employees;


--Q. employees 테이블에서 salary가 20000 이상이면 'a', 10000과 20000 사이면'b', 그 이하면 'c'로 표시하는 쿼리를
-- 작성하시오.(case)
select last_name, salary,
case
    when salary >=20000 then 'A'
    when salary between 10000 and 20000 then 'B'
    else 'c'
end as 등급
from employees;

--INSERT
--테이블에 데이터를 입력하는 방법은 두 가지 유형이 있으며 한 번에 한 건만 입력된다.
--a. INSERT INTO 테이블명 (COLUMN_LIST) VALUES (COLUMN_LIST에 넣을 VALUE_LIST);
--b. INSERT INTO 테이블명 VALUES (전체 COLUMN에 넣을 VALUE_LIST);

--concatenation : 콤마 대신에 사용하면 문자열이 연결되어 출력된다.
select last_name, 'is a', job_id from employees;
select last_name ||' is a '|| job_id from employees;

--UNION
--UNION(합집합) INTERSECT(교집합),MINUS(차집합) UNION ALL(겹치는 것까지 포함);
--두개의 쿼리문을 사용해야한다. 데이터 타입을 일치 시켜야 한다.
select first_name 이름, salary 급여 , hire_date from employees
where salary<5000
union
select first_name 이름, salary 급여 , hire_date from employees
where hire_date <'05/01/01';

select first_name 이름, salary 급여 , hire_date from employees
where salary<5000
minus
select first_name 이름, salary 급여 , hire_date from employees
where hire_date <'05/01/01';

select first_name 이름, salary 급여 , hire_date from employees
where salary<5000
intersect
select first_name 이름, salary 급여 , hire_date from employees
where hire_date <'05/01/01';

select first_name 이름, salary 급여 , hire_date from employees
where salary<5000
union all
select first_name 이름, salary 급여 , hire_date from employees
where hire_date <'05/01/01';

--CREATE VIEW 명령어는 오라클 SQL에서 테이블의 특정 부분이나 조인된 결과를 논리적인 뷰(view)로 만들 때 사용
--뷰는 데이터를 요약하거나 복잡한 조인을 단순화하며, 사용자에게 필요한 데이터만을 보여주는 데 유용
--뷰는 실제 테이블 데이터를 저장하지 않고, 대신 쿼리문 자체를 저장
--뷰의 주요 특징
--쿼리 단순화: 복잡한 쿼리를 뷰로 저장함으로써 사용자는 복잡한 쿼리문을 반복해서 작성할 필요 없이 간단하게 뷰를 참조할 수 있다.
--데이터 추상화: 뷰는 기본 테이블의 구조를 숨기고 사용자에게 필요한 데이터만을 보여줄 수 있어, 데이터 추상화를 제공.
--보안 강화: 뷰를 사용하면 특정 데이터에 대한 접근을 제한할 수 있으며, 사용자가 볼 수 있는 데이터의 범위를 제어할 수 있다.
--데이터 무결성 유지: 뷰를 사용하여 데이터를 수정하더라도, 이 변경사항이 기본 테이블의 데이터 무결성 규칙을 위반하지 않도록 관리할 수 있다.

create view employee_details as
select employee_id, last_name, department_id
from employees;


select * from employee_details;

--Q. employees  테이블에서 salary가 10000원 이상인 직원만을 포함하는 view special_employee를 생성하는 sql 명령문을 작성하시오.
create view special_employee as
select * 
from employees
where salary >= 10000;

select * from special_employee;

--Q. employees 테이블에서 각 부서별 직원 수를 포함하는 뷰를 생성하세요.
create view department_emp as
select department_id, count(*) as 부서별_직원수
from employees
group by department_id
order by 부서별_직원수;

select * from department_emp;


--Q. employees 테이블에서 근속기간이 10년 이상인 직원을 포함하는 뷰를 생성하세요.
create view goinmul as
select last_name, round(sysdate-hire_date) as 근속기간
from employees
where round(sysdate - hire_date) > 365*10;

select * from goinmul;

create view goinmul as
select last_name, round(sysdate-hire_date) as 근속기간
from employees
where round(sysdate - hire_date) > 365*10
order by '근속기간';

--TCL (Transaction Control Language)
--COMMIT: 현재 트랜잭션 내에서 수행된 모든 변경(INSERT, UPDATE, DELETE 등)을 데이터베이스에 영구적으로 저장.
--COMMIT 명령을 실행하면, 트랜잭션은 완료되며, 그 이후에는 변경 사항을 되돌릴 수 없다.
--ROLLBACK: 현재 트랜잭션 내에서 수행된 변경들을 취소하고, 데이터베이스를 트랜잭션이 시작하기 전의 상태로 되돌린다. 
--오류가 발생했거나 다른 이유로 트랜잭션을 취소해야 할 경우에 사용된다.
--SAVEPOINT: 트랜잭션 내에서 중간 체크포인트를 생성합니다. 오류가 발생할 경우, ROLLBACK을 사용하여 최근의 SAVEPOINT까지 되돌릴 수 있다.
--트랜잭션을 콘트롤하는 TCL(TRANSACTION CONTROL LANGUAGE)

-- members 테이블 생성
drop table members;
create table members (
    member_id number primary key,
    name varchar2(100),
    email varchar2(100),
    join_date date,
    status varchar2(20)
);

INSERT INTO members (member_id, name, email, join_date, status) VALUES (1, 'John Doe', 'john@example.com', SYSDATE, 'Active');
INSERT INTO members (member_id, name, email, join_date, status) VALUES (2, 'Jane Doe', 'jane@example.com', SYSDATE, 'Active');
INSERT INTO members (member_id, name, email, join_date, status) VALUES (3, 'Mike Smith', 'mike@example.com', SYSDATE, 'Inactive');

select * from members;

INSERT INTO members (member_id, name, email, join_date, status) VALUES (4, 'Alice Johnson', 'alice@example.com', SYSDATE, 'Active');
INSERT INTO members (member_id, name, email, join_date, status) VALUES (5, 'Bob Brown', 'bob@example.com', SYSDATE, 'Inactive');
INSERT INTO members (member_id, name, email, join_date, status) VALUES (6, 'Bob Brown', 'bob@example.com', SYSDATE, 'Inactive');

savepoint spl;

INSERT INTO members (member_id, name, email, join_date, status) VALUES (7, 'dfsf aqweas', 'aweqeqe@example.com', SYSDATE, 'Active');


rollback to spl;
commit;


--Task1_0523. 
--orders라는 테이블을 생성하고, order_id, customer_id, order_date, amount, status라는 속성을 설정하세요.
--데이터를 5개 입력하세요.
--입력한 데이터 중 2개를 수정하세요.
--수정한 데이터를 취소하기 위해 롤백을 사용하세요.
--3개의 새로운 데이터를 입력하고, 그 중 마지막 데이터 입력만 취소한 후 나머지를 커밋하세요.

drop table orders;
create table orders(


);


select department_id
from employees
group by department_id
order by department_id desc;

--부서 목록 department_id가 null 값인 사람 찾기

select * 
from employees
where department_id is null;

--2. job_id 가 sa_rep인 department_id 찾기 (직업에 맞는 부서 찾기)

-------------------------------------------------------------------------------------------

--부서별 급여 현황
--테이블생성, 부서별 급여와 총 급여를 확인 할 수 있음.
--(급여의 합 평균 최솟값 최댓값, 총 직원수, 급여전체총합, 직원평균급여, 부서평균급여)
--table 만들기 부서별 급여를 대략적으로 보기
--사용할 테이블 확인
select * from jobs;
select * from departments;
select * from employees;
select * from job_history;

--부서 목록 확인
SELECT department_id
from employees
group by department_id
order by department_id DESC;
-- 부서 목록 department_id : 10,20,30,40,50,60,70,80,90,100,110 그 외 나머지(120~200등..)는 없고 null 값이 있음.
--department_id 가 null 인 사람은 모두 job_id 에 맞는 department_id 를 부여해주려고함(데이터 무결성)
--1. department_id 가 null 값인 사람 찾기
select *
from employees
where department_id IS NULL;
--한명 밖에 없음. department_id : null, employee_id : 178, Job_id : SA_REP

--2. job_id 가 SA_REP 인 department_id 찾기 (직업에 맞는 부서 찾기)
select job_id, department_id
from job_history
where job_id IN 'SA_REP';
--SA_REP 의 department_id 는 80

--3. 수정 전 savepoint 생성
SAVEPOINT null_to_80;
------------------------SAVEPOINT---------------------------------

--4. 제약조건primary key 인 employee_id 로 찾아서 derpartment_id 를 80으로 수정
UPDATE employees
SET department_id = 80
WHERE employee_id = 178;

select * from employees where employee_id = 178;
--ROLLBACK null_to_80; -- savepoint로 가기
--commit;
--수정끝

--팀구성 및 년차별 샐러리
--각 부서마다 팀원은 몇명이고 어떤 포지션들이 있고 구성은 어떻게 되는지
--ROLLUP은 다차원적인 집계 결과를 도출 : 사용 각 부서 및 직무별 직원 수를 집게
select e.department_id, d.department_name, nvl(e.job_id,'Total') 직무, count(*) 직원수
from employees E
left outer join departments D on e.department_id = D.department_id
group by rollup((e.department_id, d.department_name), e.job_id)
order by e.department_id;

--job id 별 몇년차는 얼마나 맏는지 각 년차별로 샐러리 평균
select job_id, 연차, round(avg(salary)) 평균급여
from (select job_id, floor(months_between(sysdate, hire_date)/12) as 연차, salary from employees)
group by job_id, 연차
order by job_id, 연차;
-------------------------------------------------------------------------------------------















--[실습]
---현재 hr에 있는 7개 테이블들을 분석해서 인사관리에 의미있는 인사이트 5개이상을 기술하세요.
---인사관리 개선을 위한 KPI 2개를 설정하고 이것들을 테이블들의 데이터에 반영한 후 다시 분석해서 반영 여부를 검증하세요.

select * from countries;
select * from departments;
select * from employees;
select * from job_history;
select * from jobs;
select * from locations;
select * from regions;

--null값 제거
select * from employees where department_id is null or department_id = 80;
savepoint qwe
UPDATE employees SET department_id = 80 WHERE department_id is null


--근속일수별 월급
select employee_id,first_name||' '||last_name,job_id,manager_id,salary, trunc(sysdate - hire_date) as 근무기간
from employees
order by  job_id,근무기간 desc;



select * from employees;
select * from job_history;
select hire_date,to_char(hire_date, 'YYYY-MM-DD') from employees;

--부서별 소속인원과 직속상관 표시
select dp.department_name, ep.employee_id, ep.job_id, ep.first_name||''||ep.last_name, ep.job_id, ep.manager_id, ep.salary
from employees ep
join departments dp on dp.department_id=ep.department_id
order by dp.department_name, ep.salary desc;

select * from employees;
--팀별 부하직원의 수(현재 인원이 부족한 팀을 알수있음)

select ep1.first_name||' '||ep1.last_name 상사, count(*) "부하 직원수"
from employees ep1, employees ep2
where ep1.employee_id = ep2.manager_id
group by ep1.first_name||' '||ep1.last_name
order by "부하 직원수";


SELECT ep1.department_id, ep1.first_name || ' ' || ep1.last_name AS 상사, COUNT(*) AS "부하 직원수"
FROM  employees ep1
JOIN  employees ep2 ON ep1.employee_id = ep2.manager_id
LEFT OUTER JOIN departments d ON ep1.department_id = d.department_id
GROUP BY ep1.department_id, ep1.first_name || ' ' || ep1.last_name
ORDER BY ep1.department_id;


-- 직원의 급여 분포 ***********************************************************************************************************************
분석: 직원 급여의 평균, 최대, 최소 값을 분석합니다. 이를 통해 급여 체계의 공정성을 평가하고, 필요시 급여 조정의 기준으로 사용할 수 있습니다.

SELECT DEPARTMENT_ID, round(AVG(SALARY)) AS AVG_SALARY, MAX(SALARY) AS MAX_SALARY, MIN(SALARY) AS MIN_SALARY
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;


-- 부서별 입사일자 분포**********************************************************************************************************
분석: 부서별 직원의 입사일자 분포를 분석합니다. 이를 통해 특정 부서의 이직률을 파악하고, 직원의 근속 기간을 평가할 수 있습니다.
SELECT DEPARTMENT_ID, TO_CHAR(HIRE_DATE, 'YYYY') AS YEAR, COUNT(*) AS EMPLOYEE_COUNT
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID, TO_CHAR(HIRE_DATE, 'YYYY')
ORDER BY DEPARTMENT_ID, YEAR;






-- 직원의 직무별 급여 범위*********************************************************************************************************************
분석: 각 직무별로 급여 범위를 분석합니다. 이를 통해 같은 직무 내에서의 급여 차이를 평가하고, 급여 체계의 공정성을 높일 수 있습니다.
SELECT JOB_ID, AVG(SALARY) AS AVG_SALARY, MAX(SALARY) AS MAX_SALARY, MIN(SALARY) AS MIN_SALARY
FROM EMPLOYEES
GROUP BY JOB_ID;



--직원의 직무 변경 이력
--분석: 직원들의 직무 변경 이력을 분석합니다. 이를 통해 직무 이동의 빈도와 패턴을 파악하고, 적절한 직무 이동 정책을 수립할 수 있습니다.
SELECT EMPLOYEE_ID, COUNT(*) AS JOB_CHANGE_COUNT
FROM JOB_HISTORY
GROUP BY EMPLOYEE_ID
ORDER BY JOB_CHANGE_COUNT DESC;

select * from job_history;
select * from employees;


--직원의 직무 변경 이력
--분석: 직원들의 직무 변경 이력을 분석합니다. 이를 통해 직무 이동의 빈도와 패턴을 파악하고, 적절한 직무 이동 정책을 수립할 수 있습니다.
SELECT EMPLOYEE_ID, COUNT(*) AS JOB_CHANGE_COUNT
FROM JOB_HISTORY
GROUP BY EMPLOYEE_ID
ORDER BY JOB_CHANGE_COUNT DESC;

select * from departments;
--직원의 지역별 분포
--분석: 각 위치(Location)에서 근무하는 직원 수를 분석합니다. 이를 통해 특정 지역의 인력 배치를 평가하고, 지역별 인력 자원을 최적화할 수 있습니다.
SELECT L.LOCATION_ID, L.CITY, COUNT(E.EMPLOYEE_ID) AS EMPLOYEE_COUNT
FROM EMPLOYEES E
JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
JOIN LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID
GROUP BY L.LOCATION_ID, L.CITY
ORDER BY EMPLOYEE_COUNT DESC;


SELECT JOB_HISTORY.JOB_ID, EMPLOYEES.EMPLOYEE_ID, EMPLOYEES.FIRST_NAME, EMPLOYEES.LAST_NAME, COUNT(*) AS JOB_COUNT
FROM EMPLOYEES
JOIN JOB_HISTORY ON EMPLOYEES.EMPLOYEE_ID = JOB_HISTORY.EMPLOYEE_ID
GROUP BY JOB_HISTORY.JOB_ID, EMPLOYEES.EMPLOYEE_ID, EMPLOYEES.FIRST_NAME, EMPLOYEES.LAST_NAME
ORDER BY JOB_COUNT DESC;
select * from job_history;

SELECT JOB_HISTORY.JOB_ID, EMPLOYEES.EMPLOYEE_ID, EMPLOYEES.FIRST_NAME, EMPLOYEES.LAST_NAME, COUNT(*) AS JOB_COUNT
FROM EMPLOYEES
JOIN JOB_HISTORY ON EMPLOYEES.EMPLOYEE_ID = JOB_HISTORY.EMPLOYEE_ID
GROUP BY JOB_HISTORY.JOB_ID, EMPLOYEES.EMPLOYEE_ID, EMPLOYEES.FIRST_NAME, EMPLOYEES.LAST_NAME
ORDER BY JOB_COUNT DESC;

---------------------------------------------------------------------------------------------------------------------
WITH RankedEmployees AS (
    SELECT 
        EMPLOYEES.EMPLOYEE_ID, 
        EMPLOYEES.FIRST_NAME, 
        EMPLOYEES.LAST_NAME, 
        JOB_HISTORY.JOB_ID,
        ROW_NUMBER() OVER (PARTITION BY EMPLOYEES.FIRST_NAME, EMPLOYEES.LAST_NAME ORDER BY EMPLOYEES.EMPLOYEE_ID DESC) AS rn
    FROM EMPLOYEES
    JOIN JOB_HISTORY ON EMPLOYEES.EMPLOYEE_ID = JOB_HISTORY.EMPLOYEE_ID
)
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_ID
FROM RankedEmployees
WHERE rn = 1
ORDER BY EMPLOYEE_ID;

WITH Dept_Avg AS (
    SELECT 
        DEPARTMENT_ID,
        AVG(MONTHS_BETWEEN(SYSDATE, HIRE_DATE) / 12) AS AVG_YEARS,
        AVG(SALARY) AS AVG_SALARY
    FROM 
        EMPLOYEES
    GROUP BY 
        DEPARTMENT_ID
)
SELECT 
    E.EMPLOYEE_ID,
    E.FIRST_NAME,
    E.LAST_NAME,
    E.DEPARTMENT_ID,
    ROUND(MONTHS_BETWEEN(SYSDATE, E.HIRE_DATE) / 12, 2) AS YEARS_AT_COMPANY,
    E.SALARY,
    DA.AVG_YEARS,
    DA.AVG_SALARY
FROM 
    EMPLOYEES E
JOIN 
    Dept_Avg DA ON E.DEPARTMENT_ID = DA.DEPARTMENT_ID
WHERE 
    ROUND(MONTHS_BETWEEN(SYSDATE, E.HIRE_DATE) / 12, 2) > DA.AVG_YEARS
    AND E.SALARY < DA.AVG_SALARY
ORDER BY 
    E.DEPARTMENT_ID, YEARS_AT_COMPANY DESC;

select * from departments;
select * from jobs;
select * from employees;