select * from employees;


--Q. ����� 120���� ����� ���, �̸�, ����(job_id) ������(job_title)�� ���.
select e.employee_id ���, e.first_name �̸�, e.last_name ��, e.job_id, j.job_title
from employees e
inner join jobs j on e.job_id = j.job_id
where e.employee_id = 120;

--FIRST_NAME ||''|| LAST_NAME AS �̸�: FIRST_NAME�� LAST_NAME�� �������� �����Ͽ�
--�ϳ��� ���ڿ��� ��ġ��, �� ����� ��Ī�� '�̸�'���� ����
select e.employee_id ���, e.first_name ||' '|| e.last_name �̸�, e.job_id, j.job_title
from employees e
inner join jobs j on e.job_id = j.job_id
where e.employee_id = 120;

select
employee_id ���,
first_name ||' '|| last_name as �̸�,
j.job_id ����,
j.job_title ������
from employees e, jobs j
where e.employee_id = 120
and e.job_id = j.job_id;

--Q. 2005�� ��ݱ⿡ �Ի��� ������� �̸�(FULL NAME)�� �Ի��ϸ� ���

select * from employees ;
select 
e.first_name ||' '|| e.last_name "FULL NAME",
e.HIRE_DATE
from employees e
where to_char(hire_date, 'yy/mm') between '05/01' and '05/06';

--_�� ���ϵ�ī�尡 �ƴ� ���ڷ� ����ϰ� ���� �� escape �ɼ��� ���
select * from employees where job_id like '%\_A%';
select * from employees where job_id like '%\_A%'escape '\';
select * from employees where job_id like '%#_A%'escape '#';

--in : or��� ���
select * from employees where manager_id = 101 or  manager_id = 102 or  manager_id = 103;
select * from employees where manager_id in (101, 102, 103);

--Q. ���� SA_MAN, IT_PROG, ST_MAN�� ����� ���
select * 
from employees
where job_id in ('SA_MAN', 'IT_PROG','ST_MAN');

--IS NULL / IS NOT NULL
--null �������� Ȯ���� ��� = �� �����ڸ� ������� �ʰ� is_null�� ����Ѵ�.
select * from employees where commission_pct is not null;

--ORDER BY
--ORDER BY Į���� [ASC | DESC]
select * from employees order by salary asc;
select * from employees order by salary desc;
select * from employees order by salary asc, last_name desc;

--DUAL ���̺�
--mod�� ������ ���ϴ� �Լ�
select * from employees where mod( employee_id, 2)=1; --2�� ������ 1�̸�
select mod(10,3) from dual;

--round()
select round(355.95555) from dual;
select round(355.95555, 2) from dual;
select round(355.95555, -2) from dual;

--trunc() ���� �Լ�, ������ �ڸ��� ���ϸ� ���� ��� ����
select trunc(45.555,1) from dual;

--ceil() ������ �ø�
select  ceil(45.111) from dual;

--Q. HR EMPLOYEES ���̺��� �̸�, �޿�, 10%�λ��  �޿��� ����ϼ���.
select last_name �̸�, salary �޿�, salary*1.1 "�λ�� �޿�"
from employees;

--Q. employee_id�� Ȧ���� ������ employee_id�� last_name�� ����ϼ���.
select employee_id , last_name  �̸�
from employees
where mod(employee_id, 2) = 1;

SELECT
    *
FROM
employees;

--Q. employees ���̺��� commission_pct �� Null���� ������ ����ϼ���
select count(*) from employees where commission_pct is null;

--Q. employees ���̺��� deparment_id �� ���� ������ �����Ͽ� position�� '����'���� ����ϼ���. (position���� �߰�)
select employee_id, first_name ||' '|| last_name �̸�, '����' position
from employees
where department_id is null;

--Q. hr EMPLOYEES ���̺��� salary, last_name ������ �ø����� �����Ͽ� ����ϼ���
select *
from employees
order by salary, last_name;

--��¥ ����
select sysdate from dual;
select sysdate +1 from dual;
select sysdate -1 from dual;

select * from employees;
--�ٹ��� ��¥ ���
select last_name, sysdate, hire_date, trunc(sysdate - hire_date) �ٹ��Ⱓ
from employees;

--add_months()              Ư�� ���� ���� ���� ��¥�� ���Ѵ�
select last_name, hire_date, add_months(hire_date, 6) revised_date from employees;

--last_day()                �ش�Ǵ� ���� ������ ��¥�� ��ȯ�ϴ� �Լ�
select last_name, hire_date, last_day(hire_date) from employees;

select last_name, hire_date, last_day(add_months(hire_date, 1)) from employees;

--next_day()                �ش� ��¥�� �������� ������ ���� ���Ͽ� �ش��ϴ� ��¥�� ��ȯ
--�� ~ ��, 1 ~ 7 �� ǥ������
select hire_date, next_day(hire_date, '��') from employees;
select hire_date, next_day(hire_date, 2) from employees;

--months_between()          ��'�ڿ� ��¥ ������ �������� ���Ѵ�.(���� ���� �Ҽ��� ù° �ڸ����� �ݿø�)
select hire_date, round(months_between(sysdate, hire_date),1) from employees;

--�� ��ȯ �Լ� : to_date()    ���ڿ��� ��¥��
--'2023-01-01'�̶�� ���ڿ��� ��¥ Ÿ������ ��ȯ
select to_date('2023-01-01', 'yyyy-mm-dd') from dual;

--to_char(��¥)              ��¥�� ���ڷ� ��ȯ
select to_char(sysdate, 'YYyy/mM/dd  mon-dy- ') from dual;

--����
--YYYY       �� �ڸ� ����
--YY      �� �ڸ� ����
--YEAR      ���� ���� ǥ��
--MM      ���� ���ڷ�
--MON      ���� ���ĺ�����
--DD      ���� ���ڷ�
--DAY      ���� ǥ��
--DY      ���� ��� ǥ��
--D      ���� ���� ǥ��
--AM �Ǵ� PM   ���� ����
--HH �Ǵ� HH12   12�ð�
--HH24      24�ð�
--MI      ��
--SS      ��

--Q. ���� ��¥�� (sysdate)�� 'yyyy/mm/dd'������ ���ڿ��� ��ȯ�ϼ���.
select to_char(sysdate, 'yyyy|\mm|\dd') from dual;
--Q. '01-01-2023'�̶�� ���ڿ��� ��¥ Ÿ������ ��ȯ�ϼ���.
select to_date('01-01-2023', 'dd/mm/yyyy') from dual;

--Q. ���� ��¥�� �ð�(sysdate)�� 'YYYY-MM-DD HH24:MI:ss'������ ���ڿ��� �ٲٽÿ�
select to_char(sysdate, 'YYYY-MM-DD HH24:MI:ss') from dual;

--Q. '2023-01-01 15:30:00'�̶�� ���ڿ��� ��¥ �� �ð� Ÿ������ ��ȯ�ϼ���.
select to_date('2023-01-01 15:30:30', 'YYYY-mm-dd hh24:mi:ss') ��� from dual;



--to_char( ���� )   ���ڸ� ���ڷ� ��ȯ
--9      �� �ڸ��� ���� ǥ��      ( 1111, ��99999�� )      1111   
--0      �� �κ��� 0���� ǥ��      ( 1111, ��099999�� )      001111
--$      �޷� ��ȣ�� �տ� ǥ��      ( 1111, ��$99999�� )      $1111
--.      �Ҽ����� ǥ��         ( 1111, ��99999.99�� )      1111.00
--,      Ư�� ��ġ�� , ǥ��      ( 1111, ��99,999�� )      1,111
--MI      �����ʿ� - ��ȣ ǥ��      ( 1111, ��99999MI�� )      1111-
--PR      �������� <>�� ǥ��      ( -1111, ��99999PR�� )      <1111>
--EEEE      ������ ǥ��         ( 1111, ��99.99EEEE�� )      1.11E+03
--V      10�� n�� ���Ѱ����� ǥ��   ( 1111, ��999V99�� )      111100
--B      ������ 0���� ǥ��      ( 1111, ��B9999.99�� )      1111.00
--L      ������ȭ         ( 1111, ��L9999�� )

select salary, to_char(salary, '0999999')from employees;
select to_char(-salary,'999999pr') from employees;
--1111->1.11E+03
select to_char(11111, '9.999eeee') from dual;
select to_char(-1111111, '9999999mi') from dual;

--width_bucket()               ������, �ּҰ�, �ִ밪, bucket����
select width_bucket(92, 0, 100, 10) from dual;
select width_bucket(100, 0, 100, 10) from dual;

select * from employees;
--Q. employees ���̺��� salary�� 5�� ������� ǥ���ϼ���
select max(salary) max, min(salary) min from employees;
select salary, width_bucket(salary, 2100, 24001, 5) as grade
from employees;

--���� �Լ� character function
--upper()       �빮�ڷ� ����
select upper('Hello World') from dual;
--lower()       �ҹ��ڷ� ����
select lower('Hello World') from dual;

--Q. last_name�� seo�� ������ last_name�� salary�� ���ϼ��� (seo, SEO, Seo ��� ����)
select last_name, salary
from  employees where lower(last_name) = 'seo';

--initcap() ù���ڸ� �빮��
select job_id, initcap(job_id) from employees;

--instr()       ���ڿ��� ����
select job_id, length(job_id) from employees;

--instr()       ���ڿ�, ã�� ����, ã�� ��ġ, ã�� ���ڿ��� ���°
select instr('hello world','o' , 3 ,2) from dual;

--substr()      ���ڿ�, ������ġ ����
select substr('hello world', 0, 3) from dual;
select substr('hello world', 9, 3) from dual;
select substr('hello world', -3, 3) from dual;

--lpad()        ������ ���� �� ���ʿ� ���ڸ� ä���.
select lpad('Hello World', 20, '#') from dual;

--rpad()        ���� ���� �� �����ʿ� ���ڸ� ä���.
select rpad('Hello World', 20, '#') from dual;

--ltrim()
select ltrim('aaaHello Worldaaa', 'a') from dual;
select ltrim('   Hello World   ') from dual;

--rtrim()
select rtrim('aaaHello Worldaaa', 'a') from dual;
select rtrim('   Hello World   ') from dual;

select last_name from employees;
select last_name as �̸�, ltrim(last_name , 'A')as ��ȯ 
from employees;

--trim
select trim('   Hello World   ') from dual;
--�յ��� Ư�� ���� ����
select last_name, trim('A' from last_name) 
from employees;

--nvl()     null�� 0�Ǵ� �ٸ������� ����
select last_name, manager_id, nvl(to_char(manager_id) ,'ceo') from employees;

--decode()    if���̳� case���� ���� ���� ��츦 ������ �� �ֵ��� �ϴ� �Լ�
--DECODE �Լ��� �ܼ��� ���ǿ� ����Ͽ� ���� ��ȯ�մϴ�. ������ DECODE(expression, search1, result1, ..., searchN, resultN, default) 
--���⼭ expression�� �˻��� ���� ��Ÿ����, search�� result�� ���� ���ǰ� �ش� ������ ���� �� ��ȯ�� ��
--default�� ��� search ������ ������ �� ��ȯ�� �⺻ �� ���
select last_name, department_id,
decode(department_id,
    90, '�濵������',
    60, '���α׷���',
    100,'�λ��', '��Ÿ') �μ�
from employees;
select * from employees;
--Q. employees ���̺��� commission_pct�� null�� �ƴ� ���, 'A' null�� ��� 'n'�� ǥ���ϴ� ���� �ۼ�
select commission_pct as commission
    ,decode(commission_pct, null, 'N', 'A') as ��ȯ 
from employees
order by ��ȯ desc;

--case()
--decode() �Լ��� �����ϳ� decode() �Լ��� ������ �ܼ��� ���� �񱳿� ���Ǵ� �ݸ�
--case() �Լ��� �پ��� �񱳿����ڷ� ������ ������ �� �ִ�.
--CASE ���� ���ǿ� ���� �ٸ� ���� ��ȯ�ϴ� �� ���Ǹ�, DECODE���� ������ ������ ǥ���� �� �ִ�. 
--������ CASE WHEN condition THEN result ... ELSE default END�̴�. 

select 
last_name, 
department_id,
case 
    when department_id = 90 then '�濵������'
    when department_id = 60 then '���α׷���'
    when department_id = 100 then '�λ��'
    else '��Ÿ'
end as �Ҽ�
from employees;


--Q. employees ���̺��� salary�� 20000 �̻��̸� 'a', 10000�� 20000 ���̸�'b', �� ���ϸ� 'c'�� ǥ���ϴ� ������
-- �ۼ��Ͻÿ�.(case)
select last_name, salary,
case
    when salary >=20000 then 'A'
    when salary between 10000 and 20000 then 'B'
    else 'c'
end as ���
from employees;

--INSERT
--���̺� �����͸� �Է��ϴ� ����� �� ���� ������ ������ �� ���� �� �Ǹ� �Էµȴ�.
--a. INSERT INTO ���̺�� (COLUMN_LIST) VALUES (COLUMN_LIST�� ���� VALUE_LIST);
--b. INSERT INTO ���̺�� VALUES (��ü COLUMN�� ���� VALUE_LIST);

--concatenation : �޸� ��ſ� ����ϸ� ���ڿ��� ����Ǿ� ��µȴ�.
select last_name, 'is a', job_id from employees;
select last_name ||' is a '|| job_id from employees;

--UNION
--UNION(������) INTERSECT(������),MINUS(������) UNION ALL(��ġ�� �ͱ��� ����);
--�ΰ��� �������� ����ؾ��Ѵ�. ������ Ÿ���� ��ġ ���Ѿ� �Ѵ�.
select first_name �̸�, salary �޿� , hire_date from employees
where salary<5000
union
select first_name �̸�, salary �޿� , hire_date from employees
where hire_date <'05/01/01';

select first_name �̸�, salary �޿� , hire_date from employees
where salary<5000
minus
select first_name �̸�, salary �޿� , hire_date from employees
where hire_date <'05/01/01';

select first_name �̸�, salary �޿� , hire_date from employees
where salary<5000
intersect
select first_name �̸�, salary �޿� , hire_date from employees
where hire_date <'05/01/01';

select first_name �̸�, salary �޿� , hire_date from employees
where salary<5000
union all
select first_name �̸�, salary �޿� , hire_date from employees
where hire_date <'05/01/01';

--CREATE VIEW ��ɾ�� ����Ŭ SQL���� ���̺��� Ư�� �κ��̳� ���ε� ����� ������ ��(view)�� ���� �� ���
--��� �����͸� ����ϰų� ������ ������ �ܼ�ȭ�ϸ�, ����ڿ��� �ʿ��� �����͸��� �����ִ� �� ����
--��� ���� ���̺� �����͸� �������� �ʰ�, ��� ������ ��ü�� ����
--���� �ֿ� Ư¡
--���� �ܼ�ȭ: ������ ������ ��� ���������ν� ����ڴ� ������ �������� �ݺ��ؼ� �ۼ��� �ʿ� ���� �����ϰ� �並 ������ �� �ִ�.
--������ �߻�ȭ: ��� �⺻ ���̺��� ������ ����� ����ڿ��� �ʿ��� �����͸��� ������ �� �־�, ������ �߻�ȭ�� ����.
--���� ��ȭ: �並 ����ϸ� Ư�� �����Ϳ� ���� ������ ������ �� ������, ����ڰ� �� �� �ִ� �������� ������ ������ �� �ִ�.
--������ ���Ἲ ����: �並 ����Ͽ� �����͸� �����ϴ���, �� ��������� �⺻ ���̺��� ������ ���Ἲ ��Ģ�� �������� �ʵ��� ������ �� �ִ�.

create view employee_details as
select employee_id, last_name, department_id
from employees;


select * from employee_details;

--Q. employees  ���̺��� salary�� 10000�� �̻��� �������� �����ϴ� view special_employee�� �����ϴ� sql ��ɹ��� �ۼ��Ͻÿ�.
create view special_employee as
select * 
from employees
where salary >= 10000;

select * from special_employee;

--Q. employees ���̺��� �� �μ��� ���� ���� �����ϴ� �並 �����ϼ���.
create view department_emp as
select department_id, count(*) as �μ���_������
from employees
group by department_id
order by �μ���_������;

select * from department_emp;


--Q. employees ���̺��� �ټӱⰣ�� 10�� �̻��� ������ �����ϴ� �並 �����ϼ���.
create view goinmul as
select last_name, round(sysdate-hire_date) as �ټӱⰣ
from employees
where round(sysdate - hire_date) > 365*10;

select * from goinmul;

create view goinmul as
select last_name, round(sysdate-hire_date) as �ټӱⰣ
from employees
where round(sysdate - hire_date) > 365*10
order by '�ټӱⰣ';

--TCL (Transaction Control Language)
--COMMIT: ���� Ʈ����� ������ ����� ��� ����(INSERT, UPDATE, DELETE ��)�� �����ͺ��̽��� ���������� ����.
--COMMIT ����� �����ϸ�, Ʈ������� �Ϸ�Ǹ�, �� ���Ŀ��� ���� ������ �ǵ��� �� ����.
--ROLLBACK: ���� Ʈ����� ������ ����� ������� ����ϰ�, �����ͺ��̽��� Ʈ������� �����ϱ� ���� ���·� �ǵ�����. 
--������ �߻��߰ų� �ٸ� ������ Ʈ������� ����ؾ� �� ��쿡 ���ȴ�.
--SAVEPOINT: Ʈ����� ������ �߰� üũ����Ʈ�� �����մϴ�. ������ �߻��� ���, ROLLBACK�� ����Ͽ� �ֱ��� SAVEPOINT���� �ǵ��� �� �ִ�.
--Ʈ������� ��Ʈ���ϴ� TCL(TRANSACTION CONTROL LANGUAGE)

-- members ���̺� ����
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
--orders��� ���̺��� �����ϰ�, order_id, customer_id, order_date, amount, status��� �Ӽ��� �����ϼ���.
--�����͸� 5�� �Է��ϼ���.
--�Է��� ������ �� 2���� �����ϼ���.
--������ �����͸� ����ϱ� ���� �ѹ��� ����ϼ���.
--3���� ���ο� �����͸� �Է��ϰ�, �� �� ������ ������ �Է¸� ����� �� �������� Ŀ���ϼ���.

drop table orders;
create table orders(


);


select department_id
from employees
group by department_id
order by department_id desc;

--�μ� ��� department_id�� null ���� ��� ã��

select * 
from employees
where department_id is null;

--2. job_id �� sa_rep�� department_id ã�� (������ �´� �μ� ã��)

-------------------------------------------------------------------------------------------

--�μ��� �޿� ��Ȳ
--���̺����, �μ��� �޿��� �� �޿��� Ȯ�� �� �� ����.
--(�޿��� �� ��� �ּڰ� �ִ�, �� ������, �޿���ü����, ������ձ޿�, �μ���ձ޿�)
--table ����� �μ��� �޿��� �뷫������ ����
--����� ���̺� Ȯ��
select * from jobs;
select * from departments;
select * from employees;
select * from job_history;

--�μ� ��� Ȯ��
SELECT department_id
from employees
group by department_id
order by department_id DESC;
-- �μ� ��� department_id : 10,20,30,40,50,60,70,80,90,100,110 �� �� ������(120~200��..)�� ���� null ���� ����.
--department_id �� null �� ����� ��� job_id �� �´� department_id �� �ο����ַ�����(������ ���Ἲ)
--1. department_id �� null ���� ��� ã��
select *
from employees
where department_id IS NULL;
--�Ѹ� �ۿ� ����. department_id : null, employee_id : 178, Job_id : SA_REP

--2. job_id �� SA_REP �� department_id ã�� (������ �´� �μ� ã��)
select job_id, department_id
from job_history
where job_id IN 'SA_REP';
--SA_REP �� department_id �� 80

--3. ���� �� savepoint ����
SAVEPOINT null_to_80;
------------------------SAVEPOINT---------------------------------

--4. ��������primary key �� employee_id �� ã�Ƽ� derpartment_id �� 80���� ����
UPDATE employees
SET department_id = 80
WHERE employee_id = 178;

select * from employees where employee_id = 178;
--ROLLBACK null_to_80; -- savepoint�� ����
--commit;
--������

--������ �� ������ ������
--�� �μ����� ������ ����̰� � �����ǵ��� �ְ� ������ ��� �Ǵ���
--ROLLUP�� ���������� ���� ����� ���� : ��� �� �μ� �� ������ ���� ���� ����
select e.department_id, d.department_name, nvl(e.job_id,'Total') ����, count(*) ������
from employees E
left outer join departments D on e.department_id = D.department_id
group by rollup((e.department_id, d.department_name), e.job_id)
order by e.department_id;

--job id �� ������� �󸶳� ������ �� �������� ������ ���
select job_id, ����, round(avg(salary)) ��ձ޿�
from (select job_id, floor(months_between(sysdate, hire_date)/12) as ����, salary from employees)
group by job_id, ����
order by job_id, ����;
-------------------------------------------------------------------------------------------















--[�ǽ�]
---���� hr�� �ִ� 7�� ���̺���� �м��ؼ� �λ������ �ǹ��ִ� �λ���Ʈ 5���̻��� ����ϼ���.
---�λ���� ������ ���� KPI 2���� �����ϰ� �̰͵��� ���̺���� �����Ϳ� �ݿ��� �� �ٽ� �м��ؼ� �ݿ� ���θ� �����ϼ���.

select * from countries;
select * from departments;
select * from employees;
select * from job_history;
select * from jobs;
select * from locations;
select * from regions;

--null�� ����
select * from employees where department_id is null or department_id = 80;
savepoint qwe
UPDATE employees SET department_id = 80 WHERE department_id is null


--�ټ��ϼ��� ����
select employee_id,first_name||' '||last_name,job_id,manager_id,salary, trunc(sysdate - hire_date) as �ٹ��Ⱓ
from employees
order by  job_id,�ٹ��Ⱓ desc;



select * from employees;
select * from job_history;
select hire_date,to_char(hire_date, 'YYYY-MM-DD') from employees;

--�μ��� �Ҽ��ο��� ���ӻ�� ǥ��
select dp.department_name, ep.employee_id, ep.job_id, ep.first_name||''||ep.last_name, ep.job_id, ep.manager_id, ep.salary
from employees ep
join departments dp on dp.department_id=ep.department_id
order by dp.department_name, ep.salary desc;

select * from employees;
--���� ���������� ��(���� �ο��� ������ ���� �˼�����)

select ep1.first_name||' '||ep1.last_name ���, count(*) "���� ������"
from employees ep1, employees ep2
where ep1.employee_id = ep2.manager_id
group by ep1.first_name||' '||ep1.last_name
order by "���� ������";


SELECT ep1.department_id, ep1.first_name || ' ' || ep1.last_name AS ���, COUNT(*) AS "���� ������"
FROM  employees ep1
JOIN  employees ep2 ON ep1.employee_id = ep2.manager_id
LEFT OUTER JOIN departments d ON ep1.department_id = d.department_id
GROUP BY ep1.department_id, ep1.first_name || ' ' || ep1.last_name
ORDER BY ep1.department_id;


-- ������ �޿� ���� ***********************************************************************************************************************
�м�: ���� �޿��� ���, �ִ�, �ּ� ���� �м��մϴ�. �̸� ���� �޿� ü���� �������� ���ϰ�, �ʿ�� �޿� ������ �������� ����� �� �ֽ��ϴ�.

SELECT DEPARTMENT_ID, round(AVG(SALARY)) AS AVG_SALARY, MAX(SALARY) AS MAX_SALARY, MIN(SALARY) AS MIN_SALARY
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;


-- �μ��� �Ի����� ����**********************************************************************************************************
�м�: �μ��� ������ �Ի����� ������ �м��մϴ�. �̸� ���� Ư�� �μ��� �������� �ľ��ϰ�, ������ �ټ� �Ⱓ�� ���� �� �ֽ��ϴ�.
SELECT DEPARTMENT_ID, TO_CHAR(HIRE_DATE, 'YYYY') AS YEAR, COUNT(*) AS EMPLOYEE_COUNT
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID, TO_CHAR(HIRE_DATE, 'YYYY')
ORDER BY DEPARTMENT_ID, YEAR;






-- ������ ������ �޿� ����*********************************************************************************************************************
�м�: �� �������� �޿� ������ �м��մϴ�. �̸� ���� ���� ���� �������� �޿� ���̸� ���ϰ�, �޿� ü���� �������� ���� �� �ֽ��ϴ�.
SELECT JOB_ID, AVG(SALARY) AS AVG_SALARY, MAX(SALARY) AS MAX_SALARY, MIN(SALARY) AS MIN_SALARY
FROM EMPLOYEES
GROUP BY JOB_ID;



--������ ���� ���� �̷�
--�м�: �������� ���� ���� �̷��� �м��մϴ�. �̸� ���� ���� �̵��� �󵵿� ������ �ľ��ϰ�, ������ ���� �̵� ��å�� ������ �� �ֽ��ϴ�.
SELECT EMPLOYEE_ID, COUNT(*) AS JOB_CHANGE_COUNT
FROM JOB_HISTORY
GROUP BY EMPLOYEE_ID
ORDER BY JOB_CHANGE_COUNT DESC;

select * from job_history;
select * from employees;


--������ ���� ���� �̷�
--�м�: �������� ���� ���� �̷��� �м��մϴ�. �̸� ���� ���� �̵��� �󵵿� ������ �ľ��ϰ�, ������ ���� �̵� ��å�� ������ �� �ֽ��ϴ�.
SELECT EMPLOYEE_ID, COUNT(*) AS JOB_CHANGE_COUNT
FROM JOB_HISTORY
GROUP BY EMPLOYEE_ID
ORDER BY JOB_CHANGE_COUNT DESC;

select * from departments;
--������ ������ ����
--�м�: �� ��ġ(Location)���� �ٹ��ϴ� ���� ���� �м��մϴ�. �̸� ���� Ư�� ������ �η� ��ġ�� ���ϰ�, ������ �η� �ڿ��� ����ȭ�� �� �ֽ��ϴ�.
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