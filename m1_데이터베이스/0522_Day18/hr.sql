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

--�ټ��ϼ��� ����
select employee_id,first_name||''||last_name,job_id,manager_id,salary, trunc(sysdate - hire_date) as �ٹ��Ⱓ
from employees
order by �ٹ��Ⱓ;

--�μ��� �Ҽ��ο��� ���ӻ�� ǥ��
select dp.department_name, ep.employee_id, ep.job_id, ep.first_name||''||ep.last_name, ep.job_id, ep.manager_id, ep.salary
from employees ep
join departments dp on dp.department_id=ep.department_id
order by dp.department_name,ep.employee_id;

--1�� ������ sales�ε� �μ��� ����

--��纰 ���������� ��(���� �ο��� ������ ���� �˼�����)
select ep1.first_name||''||ep1.last_name ���, ep2.first_name||''||ep2.last_name ����, ep2.job_id ����
from employees ep1, employees ep2
where ep1.employee_id = ep2.manager_id;


order by ep1.first_name||''||ep1.last_name, ep2.job_id
select min(salary) �ּ�, max(salary) �ִ� from employees;