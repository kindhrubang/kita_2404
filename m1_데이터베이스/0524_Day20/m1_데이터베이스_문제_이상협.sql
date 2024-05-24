������� : �����ͺ��̽� ���� �� Ȱ��

- ���� : 24.05.24
- ���� :�̻���
- ���� :

�� HR TABLES(EMPLOYEES, DEPARTMENTS, COUNTRIES, JOB_HISSTORY, JOBS, LOCATIONS, REGIONS)�� Ȱ���Ͽ� ���� �������� �����ϼ���.
--Q1. EMPLOYEES ���̺��� �̸�, ����, 10% �λ�� ������ ����ϼ���.
select 
    first_name ||' '|| last_name as "�̸�",salary ���� ,salary * 1.1 as "�λ�� ����"
from
    employees;
    
--Q2. EMPLOYEES ���̺��� 2005�� ��ݱ⿡ �Ի��� ����鸸 ���	
select hire_date, (sysdate-hire_date) from employees;

select
    * 
from 
    employees 
where 
    (sysdate-hire_date) between 6903 and 7083;
    
select sysdate from dual;
--Q3. EMPLOYEES ���̺��� ���� SA_MAN, IT_PROG, ST_MAN �� ����� ��� *
select
    *
from
    employees
where 
    job_id in ('SA_MAN','IT_PROG','ST_MAN');
   
--Q4. EMPLOYEES ���̺��� manager_id �� 101���� 103�� ����� ���
select
    *
from 
    employees
where
    manager_id between 101 and 103;

--Q5. EMPLOYEES ���̺��� LAST_NAME, HIRE_DATE �� �Ի����� 6���� �� ù ��° �������� ����ϼ���.
select 
    last_name, hire_date, next_day(hire_date+180, '��') as ù��
from
    employees;
--Q6. EMPLOYEES ���̺��� EMPLPYEE_ID, LAST_NAME, SALARY, HIRE_DATE �� �Ի��� �������� �����ϱ����� W_MONTH(�ټӿ���)�� ������ ����ؼ� ����ϼ���.(�ټӿ��� ���� ��������)
select
    employee_id, last_name, salary, hire_date, round(sysdate-hire_date) as W_MONTH
from
    employees
order by
    W_MONTH desc;

--Q7. EMPLOYEES ���̺��� EMPLPYEE_ID, LAST_NAME, SALARY, HIRE_DATE �� �Ի��� �������� W_YEAR(�ټӳ��)�� ����ؼ� ����ϼ���.(�ټӳ�� ���� ��������)
select 
    employee_id, last_name, salary, hire_date, round((sysdate - hire_date)/365) as W_YEAR
from
    employees
order by
    W_YEAR;

--Q8. EMPLOYEE_ID�� Ȧ���� ������ EMPLPYEE_ID�� LAST_NAME�� ����ϼ���.
select
    employee_id, last_name
from
    employees
where mod( employee_id, 2)=1;


--Q9. EMPLOYEES ���̺��� EMPLPYEE_ID, LAST_NAME �� M_SALARY(����)�� ����ϼ���. �� ������ �Ҽ��� ��°�ڸ������� ǥ���ϼ���.
select
    employee_id, last_name, round(salary/12,2) as M_SALARY
from
    employees;

--Q10. employees ���̺��� salary�� 10000�� �̻��� �������� �����ϴ� �� special_employee�� �����ϴ� SQL ��ɹ��� �ۼ��Ͻÿ�.
drop view special_employee;
create view special_employee as
    select
        *
    from
        employees
    where
        salary >= 10000;

select * from special_employee;

--Q11. EMPLOYEES ���̺��� commission_pct ��  Null�� ������  ����ϼ���.
select 
    count(commission_pct is null then 1)
from 
    employees;

--Q12. EMPLOYEES ���̺��� deparment_id �� ���� ������ �����Ͽ�  POSITION�� '����'���� ����ϼ���.
select
    employee_id,
    first_name||' '||last_name as "����", 
    case 
        when department_id is null then '����' 
    end as POSITION 
from employees 
where department_id is null;

--Q13. ����� 120���� ����� ���, �̸�, ����(job_id), ������(job_title)�� ���(join~on, where �� �����ϴ� �� ���� ��� ���)
--1��
select
    E.employee_id, 
    E.first_name||' '||E.last_name as "�̸�",
    E.job_id, 
    J.job_title
from employees E
left join jobs J on E.job_id = J.job_id
where e.employee_id = 120;
--2��
select
    E.employee_id, 
    E.first_name||' '||E.last_name as "�̸�",
    E.job_id, 
    J.job_title
from
    employees E, Jobs J
where
    e.job_id = j.job_id and e.employee_id = 120;


--Q14. HR EMPLOYEES ���̺��� �̸��� FIRST_NAME�� LAST_NAME�� �ٿ��� 'NAME' �÷������� ����ϼ���.
--��) Steven King
    
    select E.first_name||' '||E.last_name as "NAME" from employees e;

--Q15. HR EMPLOYEES ���̺��� �ټӱⰣ�� 10�� �̻��� ������ �����ϴ� �並 �����ϼ���.
create view whasuk as
    select *
    from employees
    where (sysdate - hire_date)/365 >= 10;
    
select * from whasuk;

--Q16. HR EMPLOYEES ���̺��� escape �ɼ��� ����Ͽ� �Ʒ��� ���� ��µǴ� SQL���� �ۼ��ϼ���.
--job_id Į������  _�� ���ϵ�ī�尡 �ƴ� ���ڷ� ����Ͽ� '_A'�� �����ϴ�  ��� ���� ���
select 
    * 
from 
    employees 
where 
    job_id like '%\_A%' escape '\';

--Q17. HR EMPLOYEES ���̺��� SALARY, LAST_NAME ������ �ø����� �����Ͽ� ����ϼ���.
select
    *
from 
    employees
order by
    salary, last_name;
   
--Q18. Seo��� ����� �μ����� ����ϼ���.
select
    e.first_name||' '||e.last_name Ǯ����,
    d.department_name as �μ���
from
    employees e
left join 
    departments d on e.department_id = d.department_id
where
    first_name like '%Seo%' or last_name like '%Seo%';

--Q19. JOB ID �� ������� �� �޴��� �� �������� ������ ����� ���ϼ���.
select 
    job_id, ����, round(avg(salary)) ��ձ޿�
from 
    (select job_id, floor(months_between(sysdate, hire_date)/12) as ����, salary from employees)
group by 
    job_id, ����
order by 
    job_id, ����;

--Q20. HR EMPLOYEES ���̺��� salary�� 20000 �̻��̸� 'a', 10000�� 20000 �̸� ���̸� 'b', �� ���ϸ� 'c'�� ǥ���ϴ� ������ 
--�ۼ��Ͻÿ�.(case)
select
    employee_id,
    last_name,
    case
        when salary >= 20000 then 'a'
        when salary between 10000 and 19999 then 'b'
        else 'c'
    end as grade
from 
    employees;
--Q21. �б� ������ ���Ͽ� ���̺� 2�� �̻����� db�� �����ϰ� 3�� �̻� Ȱ���� �� �ִ� case�� ���弼��.(20��)
-- �л� ���̺� ����
-- �л� ���̺����
CREATE TABLE Students (
    student_id NUMBER PRIMARY KEY,
    name VARCHAR2(100),
    birth_date DATE,
    gender VARCHAR2(10),
    address VARCHAR2(255),
    phone_number VARCHAR2(15)
);

-- �л� ���̺� ����
INSERT INTO Students (student_id, name, birth_date, gender, address, phone_number) VALUES
(1, 'John Doe', TO_DATE('2005-04-23', 'YYYY-MM-DD'), 'Male', '123 Maple Street, Springfield', '010-1234-5678');

INSERT INTO Students (student_id, name, birth_date, gender, address, phone_number) VALUES
(2, 'Jane Smith', TO_DATE('2006-07-15', 'YYYY-MM-DD'), 'Female', '456 Oak Avenue, Springfield', '010-2345-6789');

INSERT INTO Students (student_id, name, birth_date, gender, address, phone_number) VALUES
(3, 'Michael Johnson', TO_DATE('2005-11-02', 'YYYY-MM-DD'), 'Male', '789 Pine Road, Springfield', '010-3456-7890');

INSERT INTO Students (student_id, name, birth_date, gender, address, phone_number) VALUES
(4, 'Emily Davis', TO_DATE('2007-01-30', 'YYYY-MM-DD'), 'Female', '321 Birch Lane, Springfield', '010-4567-8901');

INSERT INTO Students (student_id, name, birth_date, gender, address, phone_number) VALUES
(5, 'Chris Brown', TO_DATE('2006-09-12', 'YYYY-MM-DD'), 'Male', '654 Cedar Street, Springfield', '010-5678-9012');

INSERT INTO Students (student_id, name, birth_date, gender, address, phone_number) VALUES
(6, 'Jessica Wilson', TO_DATE('2005-05-18', 'YYYY-MM-DD'), 'Female', '987 Willow Drive, Springfield', '010-6789-0123');

INSERT INTO Students (student_id, name, birth_date, gender, address, phone_number) VALUES
(7, 'David Lee', TO_DATE('2006-12-25', 'YYYY-MM-DD'), 'Male', '543 Elm Circle, Springfield', '010-7890-1234');

select * from Students;


-- ���� ���̺� ����
CREATE TABLE Teachers (
    teacher_id NUMBER PRIMARY KEY,
    name VARCHAR2(100),
    subject VARCHAR2(100),
    email VARCHAR2(100),
    phone_number VARCHAR2(15)
);

-- ���� ���̺� ����
INSERT INTO Teachers (teacher_id, name, subject, email, phone_number) VALUES
(1, 'Alice Johnson', 'Mathematics', 'alice.johnson@school.edu', '010-1111-2222');

INSERT INTO Teachers (teacher_id, name, subject, email, phone_number) VALUES
(2, 'Bob Smith', 'English', 'bob.smith@school.edu', '010-2222-3333');

INSERT INTO Teachers (teacher_id, name, subject, email, phone_number) VALUES
(3, 'Carol Williams', 'Science', 'carol.williams@school.edu', '010-3333-4444');

INSERT INTO Teachers (teacher_id, name, subject, email, phone_number) VALUES
(4, 'David Brown', 'History', 'david.brown@school.edu', '010-4444-5555');

INSERT INTO Teachers (teacher_id, name, subject, email, phone_number) VALUES
(5, 'Eve Davis', 'Art', 'eve.davis@school.edu', '010-5555-6666');


select * from Teachers;

-- ���� ���̺� ����
CREATE TABLE Courses (
    course_id NUMBER PRIMARY KEY,
    course_name VARCHAR2(100),
    teacher_id NUMBER,
    schedule VARCHAR2(100),
    FOREIGN KEY (teacher_id) REFERENCES Teachers(teacher_id)
);

-- ���� ���̺� ����
INSERT INTO Courses (course_id, course_name, teacher_id, schedule) VALUES
(1, 'Algebra I', 1, 'Monday 10:00-11:30');

INSERT INTO Courses (course_id, course_name, teacher_id, schedule) VALUES
(2, 'English Literature', 2, 'Wednesday 13:00-14:30');

INSERT INTO Courses (course_id, course_name, teacher_id, schedule) VALUES
(3, 'Biology', 3, 'Friday 09:00-10:30');

INSERT INTO Courses (course_id, course_name, teacher_id, schedule) VALUES
(4, 'World History', 4, 'Tuesday 11:00-12:30');

INSERT INTO Courses (course_id, course_name, teacher_id, schedule) VALUES
(5, 'Modern Art', 5, 'Thursday 15:00-16:30');


-- ���� ���̺� ����
CREATE TABLE Grades (
    grade_id NUMBER PRIMARY KEY,
    student_id NUMBER,
    course_id NUMBER,
    grade CHAR(1),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- �� �л��� ���� ������ ���� (���� ������)
INSERT INTO Grades (grade_id, student_id, course_id, grade) VALUES
(1, 1, 1, 'A');

INSERT INTO Grades (grade_id, student_id, course_id, grade) VALUES
(2, 2, 1, 'B');

INSERT INTO Grades (grade_id, student_id, course_id, grade) VALUES
(3, 3, 2, 'A');

INSERT INTO Grades (grade_id, student_id, course_id, grade) VALUES
(4, 4, 3, 'C');

INSERT INTO Grades (grade_id, student_id, course_id, grade) VALUES
(5, 5, 4, 'B');

INSERT INTO Grades (grade_id, student_id, course_id, grade) VALUES
(6, 6, 5, 'A');

INSERT INTO Grades (grade_id, student_id, course_id, grade) VALUES
(7, 7, 3, 'B');


select * from Grades;

-- �⼮ ���̺� ����
CREATE TABLE Attendance (
    attendance_id NUMBER PRIMARY KEY,
    student_id NUMBER,
    course_id NUMBER,
    attendance_date DATE,
    status VARCHAR2(10),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- ���� �⼮ ������ ����
INSERT INTO Attendance (attendance_id, student_id, course_id, attendance_date, status) VALUES
(1, 1, 1, TO_DATE('2024-05-20', 'YYYY-MM-DD'), 'Present');

INSERT INTO Attendance (attendance_id, student_id, course_id, attendance_date, status) VALUES
(2, 2, 2, TO_DATE('2024-05-20', 'YYYY-MM-DD'), 'Absent');

INSERT INTO Attendance (attendance_id, student_id, course_id, attendance_date, status) VALUES
(3, 3, 3, TO_DATE('2024-05-20', 'YYYY-MM-DD'), 'Late');

INSERT INTO Attendance (attendance_id, student_id, course_id, attendance_date, status) VALUES
(4, 4, 4, TO_DATE('2024-05-20', 'YYYY-MM-DD'), 'Present');

INSERT INTO Attendance (attendance_id, student_id, course_id, attendance_date, status) VALUES
(5, 5, 5, TO_DATE('2024-05-20', 'YYYY-MM-DD'), 'Absent');

INSERT INTO Attendance (attendance_id, student_id, course_id, attendance_date, status) VALUES
(6, 6, 1, TO_DATE('2024-05-21', 'YYYY-MM-DD'), 'Present');

INSERT INTO Attendance (attendance_id, student_id, course_id, attendance_date, status) VALUES
(7, 7, 2, TO_DATE('2024-05-21', 'YYYY-MM-DD'), 'Late');


select * from  Attendance;

-- �л� ���� ���̺� ����
CREATE TABLE AcademicSchedule (
    event_id NUMBER PRIMARY KEY,
    event_name VARCHAR2(100),
    event_date DATE,
    description CLOB
);

-- �л� ���� ���̺� ����
INSERT INTO AcademicSchedule (event_id, event_name, event_date, description) VALUES
(1, 'Spring Festival', TO_DATE('2024-05-25', 'YYYY-MM-DD'), 'Annual spring festival with various activities.');

INSERT INTO AcademicSchedule (event_id, event_name, event_date, description) VALUES
(2, 'Science Fair', TO_DATE('2024-06-15', 'YYYY-MM-DD'), 'Exhibition of science projects by students.');

INSERT INTO AcademicSchedule (event_id, event_name, event_date, description) VALUES
(3, 'Sports Day', TO_DATE('2024-07-10', 'YYYY-MM-DD'), 'A day dedicated to sports and games.');

INSERT INTO AcademicSchedule (event_id, event_name, event_date, description) VALUES
(4, 'Art Exhibition', TO_DATE('2024-08-20', 'YYYY-MM-DD'), 'Display of artwork created by students.');

INSERT INTO AcademicSchedule (event_id, event_name, event_date, description) VALUES
(5, 'Music Concert', TO_DATE('2024-09-05', 'YYYY-MM-DD'), 'Music performances by students.');

select * from  AcademicSchedule;

-- �л�-�̺�Ʈ ���� ���̺� ����  
CREATE TABLE StudentEvents (
    id NUMBER PRIMARY KEY,
    student_id NUMBER,
    event_id NUMBER,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (event_id) REFERENCES AcademicSchedule(event_id)
);

-- �л�-�̺�Ʈ ���� ���̺� ����

INSERT INTO StudentEvents (id, student_id, event_id) VALUES
(1, 1, 1);

INSERT INTO StudentEvents (id, student_id, event_id) VALUES
(2, 2, 1);

INSERT INTO StudentEvents (id, student_id, event_id) VALUES
(3, 3, 2);

INSERT INTO StudentEvents (id, student_id, event_id) VALUES
(4, 4, 3);

INSERT INTO StudentEvents (id, student_id, event_id) VALUES
(5, 5, 4);

INSERT INTO StudentEvents (id, student_id, event_id) VALUES
(6, 6, 5);

INSERT INTO StudentEvents (id, student_id, event_id) VALUES
(7, 7, 3);



select * from  StudentEvents;


-- �б� ���̺� ����
CREATE TABLE Classes (
    class_id NUMBER PRIMARY KEY,
    class_name VARCHAR2(100),
    teacher_id NUMBER,
    schedule VARCHAR2(100),
    FOREIGN KEY (teacher_id) REFERENCES Teachers(teacher_id)
);

-- �б� ���̺� ����
INSERT INTO Classes (class_id, class_name, teacher_id, schedule) VALUES
(1, 'Math 101', 1, 'Monday 10:00-11:30');

INSERT INTO Classes (class_id, class_name, teacher_id, schedule) VALUES
(2, 'English 101', 2, 'Wednesday 13:00-14:30');

INSERT INTO Classes (class_id, class_name, teacher_id, schedule) VALUES
(3, 'Science 101', 3, 'Friday 09:00-10:30');

INSERT INTO Classes (class_id, class_name, teacher_id, schedule) VALUES
(4, 'History 101', 4, 'Tuesday 11:00-12:30');

INSERT INTO Classes (class_id, class_name, teacher_id, schedule) VALUES
(5, 'Art 101', 5, 'Thursday 15:00-16:30');


select * from  Classes;





-- �л�-�б� ���̺� ���� (join���� �ٽ� �����)
CREATE TABLE StudentClasses (
    id NUMBER PRIMARY KEY,
    student_id NUMBER,
    class_id NUMBER,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (class_id) REFERENCES Classes(class_id)
);

INSERT INTO StudentClasses (id, student_id, class_id) VALUES
(1, 1, 1);

INSERT INTO StudentClasses (id, student_id, class_id) VALUES
(2, 2, 2);

INSERT INTO StudentClasses (id, student_id, class_id) VALUES
(3, 3, 3);

INSERT INTO StudentClasses (id, student_id, class_id) VALUES
(4, 4, 4);

INSERT INTO StudentClasses (id, student_id, class_id) VALUES
(5, 5, 5);

INSERT INTO StudentClasses (id, student_id, class_id) VALUES
(6, 6, 1);

INSERT INTO StudentClasses (id, student_id, class_id) VALUES
(7, 7, 2);

select * from  StudentClasses;


-- �б��ü� ���̺� ����
CREATE TABLE Facilities (
    facility_id NUMBER PRIMARY KEY,
    facility_name VARCHAR2(100),
    location VARCHAR2(100),
    status VARCHAR2(20)
);

INSERT INTO Facilities (facility_id, facility_name, location, status) VALUES
(1, 'Library', 'Building A', 'Available');

INSERT INTO Facilities (facility_id, facility_name, location, status) VALUES
(2, 'Gymnasium', 'Building B', 'In Use');

INSERT INTO Facilities (facility_id, facility_name, location, status) VALUES
(3, 'Computer Lab', 'Building C', 'Maintenance');

INSERT INTO Facilities (facility_id, facility_name, location, status) VALUES
(4, 'Auditorium', 'Building D', 'Available');

INSERT INTO Facilities (facility_id, facility_name, location, status) VALUES
(5, 'Cafeteria', 'Building E', 'Available');







�л��� ���� ����
SELECT s.name, c.course_name, g.grade
FROM Students s
JOIN Grades g ON s.student_id = g.student_id
JOIN Courses c ON g.course_id = c.course_id;


������ ���� ������ ����
SELECT t.name, c.course_name, c.schedule
FROM Teachers t
JOIN Courses c ON t.teacher_id = c.teacher_id;

�л� �⼮ ����
SELECT
    s.student_id,
    s.name AS student_name,
    c.course_id,
    c.course_name,
    a.attendance_date,
    a.status
FROM
    Students s
JOIN
    Attendance a ON s.student_id = a.student_id
JOIN
    Courses c ON a.course_id = c.course_id
ORDER BY
    s.student_id,
    a.attendance_date;


�л����� ����
SELECT
    s.student_id,
    s.name AS student_name,
    a.event_id,
    a.event_name,
    a.event_date
FROM
    Students s
JOIN
    StudentEvents se ON s.student_id = se.student_id
JOIN
    AcademicSchedule a ON se.event_id = a.event_id
ORDER BY
    s.student_id,
    a.event_date;
    
�б��ü� �̿����
SELECT facility_name, location, status
FROM Facilities

�ð�ǥ ��ȸ
SELECT cl.class_name, t.name AS teacher_name, c.course_name, c.schedule
FROM Classes cl
JOIN Courses c ON cl.class_id = c.course_id
JOIN Teachers t ON c.teacher_id = t.teacher_id

--Q22. ���� �ǽ������� �����ϼ���.(20��)
-- 1. ���� hr�� �ִ� 7�� ���̺���� �м��ؼ� �λ������ �ǹ��ִ� �λ���Ʈ 5�� �̻��� ����ϼ���.
-- 2. �λ���� ������ ���� KPI 2���� �����ϰ� �̰͵��� ���̺���� �����Ϳ� �ݿ��� �� �ٽ� �м��ؼ� �ݿ� ���θ� �����ϼ���. 
--null�� ���� => ������ �´� �μ��� �־��ֱ�
select * from jobs;
select * from employees where job_id like 'SA_REP';
select * from employees where department_id is null or department_id = 80;
savepoint qwe;
ROLLBACK;
UPDATE employees SET department_id = 80 WHERE department_id is null;

 
--������ ��� �ľ�
--�м�: 20�� �̻��� ������ ���� ���������� �ִ� ������ ��������� ����Ͽ����ϴ� 
--     �̷����� ����ڵ��� ������Ʈ � ������ ��ġ�Ͽ� ���� ������ ����� �� �ֽ��ϴ�.
   
SELECT 
    E.EMPLOYEE_ID,
    E.HIRE_DATE AS �Ի���,
    E.SALARY AS �޿�,
    COALESCE(J.����Ƚ��, 0) AS ����Ƚ��
FROM 
    (SELECT 
        EMPLOYEE_ID, 
        HIRE_DATE,
        SALARY
     FROM 
        EMPLOYEES
     WHERE 
        HIRE_DATE <= ADD_MONTHS(SYSDATE, -240)) E
LEFT JOIN 
    (SELECT 
        EMPLOYEE_ID AS �����ȣ, 
        COUNT(*) AS ����Ƚ��
     FROM 
        JOB_HISTORY
     GROUP BY 
        EMPLOYEE_ID) J
ON 
    E.EMPLOYEE_ID = J.�����ȣ
ORDER BY 
    E.HIRE_DATE ASC;   
    
    
    
--�ټ��ϼ��� ����
--�ټ��ϼ��� ���� ����� �ֱ� �Ի��� ������� ������ ������ �Ҹ��� ����-> �̸� �ľ��ϰ� ������ �����ؾ���
select employee_id,first_name||' '||last_name as �̸�,job_id,salary, round(trunc(sysdate - hire_date)/365)  as "�ٹ��Ⱓ/��" 
from employees
order by  job_id,"�ٹ��Ⱓ/��" desc;





--���� ���������� ��(���� �ο��� ������ ���� �˼�����)
SELECT ep1.department_id, ep1.first_name || ' ' || ep1.last_name AS ���, COUNT(*) AS "���� ������"
FROM  employees ep1
JOIN  employees ep2 ON ep1.employee_id = ep2.manager_id
LEFT OUTER JOIN departments d ON ep1.department_id = d.department_id
GROUP BY ep1.department_id, ep1.first_name || ' ' || ep1.last_name
ORDER BY ep1.department_id;




    

--������ ������ ����
--�м�: �� ��ġ(Location)���� �ٹ��ϴ� ���� ���� �м��մϴ�. �̸� ���� Ư�� ������ �η� ��ġ�� ���ϰ�, ������ �η� �ڿ��� ����ȭ�� �� �ֽ��ϴ�.
SELECT L.LOCATION_ID, L.CITY as ���ø�, COUNT(E.EMPLOYEE_ID) AS ����
FROM EMPLOYEES E
JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
JOIN LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID
GROUP BY L.LOCATION_ID, L.CITY
ORDER BY ���� DESC;


-- ������ ������ �޿� ����*********************************************************************************************************************
--�м�: �� �������� �޿� ������ �м��մϴ�. �̸� ���� ���� ���� �������� �޿� ���̸� ���ϰ�, �޿� ü���� �������� ���� �� �ֽ��ϴ�.
SELECT JOB_ID ,AVG(SALARY)as "�޿� ���" , MAX(SALARY) as "�޿� �ִ�", MIN(SALARY) as "�޿� �ּڰ�"
FROM EMPLOYEES
GROUP BY JOB_ID;

SELECT 
    E.JOB_ID,
    E.SALARY AS "���� �޿�",
    AVG(E.SALARY) OVER (PARTITION BY E.JOB_ID) AS "������ �޿� ���",
    MAX(E.SALARY) OVER (PARTITION BY E.JOB_ID) AS "������ �޿� �ִ�",
    MIN(E.SALARY) OVER (PARTITION BY E.JOB_ID) AS "������ �޿� �ּڰ�"
FROM 
    EMPLOYEES E
JOIN 
    JOBS J ON E.JOB_ID = J.JOB_ID;
    
select * from employees;
select * from departments;