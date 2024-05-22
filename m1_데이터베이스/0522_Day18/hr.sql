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

--근속일수별 월급
select employee_id,first_name||''||last_name,job_id,manager_id,salary, trunc(sysdate - hire_date) as 근무기간
from employees
order by 근무기간;

--부서별 소속인원과 직속상관 표시
select dp.department_name, ep.employee_id, ep.job_id, ep.first_name||''||ep.last_name, ep.job_id, ep.manager_id, ep.salary
from employees ep
join departments dp on dp.department_id=ep.department_id
order by dp.department_name,ep.employee_id;

--1명 직급은 sales인데 부서가 없음

--상사별 부하직원의 수(현재 인원이 부족한 팀을 알수있음)
select ep1.first_name||''||ep1.last_name 상사, ep2.first_name||''||ep2.last_name 직원, ep2.job_id 직급
from employees ep1, employees ep2
where ep1.employee_id = ep2.manager_id;


order by ep1.first_name||''||ep1.last_name, ep2.job_id
select min(salary) 최소, max(salary) 최대 from employees;