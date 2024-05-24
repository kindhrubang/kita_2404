교과목명 : 데이터베이스 구축 및 활용

- 평가일 : 24.05.24
- 성명 :이상협
- 점수 :

※ HR TABLES(EMPLOYEES, DEPARTMENTS, COUNTRIES, JOB_HISSTORY, JOBS, LOCATIONS, REGIONS)를 활용하여 다음 질문들을 수행하세요.
--Q1. EMPLOYEES 테이블에서 이름, 연봉, 10% 인상된 연봉을 출력하세요.
select 
    first_name ||' '|| last_name as "이름",salary 연봉 ,salary * 1.1 as "인상된 연봉"
from
    employees;
    
--Q2. EMPLOYEES 테이블에서 2005년 상반기에 입사한 사람들만 출력	
select hire_date, (sysdate-hire_date) from employees;

select
    * 
from 
    employees 
where 
    (sysdate-hire_date) between 6903 and 7083;
    
select sysdate from dual;
--Q3. EMPLOYEES 테이블에서 업무 SA_MAN, IT_PROG, ST_MAN 인 사람만 출력 *
select
    *
from
    employees
where 
    job_id in ('SA_MAN','IT_PROG','ST_MAN');
   
--Q4. EMPLOYEES 테이블에서 manager_id 가 101에서 103인 사람만 출력
select
    *
from 
    employees
where
    manager_id between 101 and 103;

--Q5. EMPLOYEES 테이블에서 LAST_NAME, HIRE_DATE 및 입사일의 6개월 후 첫 번째 월요일을 출력하세요.
select 
    last_name, hire_date, next_day(hire_date+180, '월') as 첫월
from
    employees;
--Q6. EMPLOYEES 테이블에서 EMPLPYEE_ID, LAST_NAME, SALARY, HIRE_DATE 및 입사일 기준으로 현재일까지의 W_MONTH(근속월수)를 정수로 계산해서 출력하세요.(근속월수 기준 내림차순)
select
    employee_id, last_name, salary, hire_date, round(sysdate-hire_date) as W_MONTH
from
    employees
order by
    W_MONTH desc;

--Q7. EMPLOYEES 테이블에서 EMPLPYEE_ID, LAST_NAME, SALARY, HIRE_DATE 및 입사일 기준으로 W_YEAR(근속년수)를 계산해서 출력하세요.(근속년수 기준 내림차순)
select 
    employee_id, last_name, salary, hire_date, round((sysdate - hire_date)/365) as W_YEAR
from
    employees
order by
    W_YEAR;

--Q8. EMPLOYEE_ID가 홀수인 직원의 EMPLPYEE_ID와 LAST_NAME을 출력하세요.
select
    employee_id, last_name
from
    employees
where mod( employee_id, 2)=1;


--Q9. EMPLOYEES 테이블에서 EMPLPYEE_ID, LAST_NAME 및 M_SALARY(월급)을 출력하세요. 단 월급은 소수점 둘째자리까지만 표현하세요.
select
    employee_id, last_name, round(salary/12,2) as M_SALARY
from
    employees;

--Q10. employees 테이블에서 salary가 10000원 이상인 직원만을 포함하는 뷰 special_employee를 생성하는 SQL 명령문을 작성하시오.
drop view special_employee;
create view special_employee as
    select
        *
    from
        employees
    where
        salary >= 10000;

select * from special_employee;

--Q11. EMPLOYEES 테이블에서 commission_pct 의  Null값 갯수를  출력하세요.
select 
    count(commission_pct is null then 1)
from 
    employees;

--Q12. EMPLOYEES 테이블에서 deparment_id 가 없는 직원을 추출하여  POSITION을 '신입'으로 출력하세요.
select
    employee_id,
    first_name||' '||last_name as "직원", 
    case 
        when department_id is null then '신입' 
    end as POSITION 
from employees 
where department_id is null;

--Q13. 사번이 120번인 사람의 사번, 이름, 업무(job_id), 업무명(job_title)을 출력(join~on, where 로 조인하는 두 가지 방법 모두)
--1번
select
    E.employee_id, 
    E.first_name||' '||E.last_name as "이름",
    E.job_id, 
    J.job_title
from employees E
left join jobs J on E.job_id = J.job_id
where e.employee_id = 120;
--2번
select
    E.employee_id, 
    E.first_name||' '||E.last_name as "이름",
    E.job_id, 
    J.job_title
from
    employees E, Jobs J
where
    e.job_id = j.job_id and e.employee_id = 120;


--Q14. HR EMPLOYEES 테이블에서 이름에 FIRST_NAME에 LAST_NAME을 붙여서 'NAME' 컬럼명으로 출력하세요.
--예) Steven King
    
    select E.first_name||' '||E.last_name as "NAME" from employees e;

--Q15. HR EMPLOYEES 테이블에서 근속기간이 10년 이상인 직원을 포함하는 뷰를 생성하세요.
create view whasuk as
    select *
    from employees
    where (sysdate - hire_date)/365 >= 10;
    
select * from whasuk;

--Q16. HR EMPLOYEES 테이블에서 escape 옵션을 사용하여 아래와 같이 출력되는 SQL문을 작성하세요.
--job_id 칼럼에서  _을 와일드카드가 아닌 문자로 취급하여 '_A'를 포함하는  모든 행을 출력
select 
    * 
from 
    employees 
where 
    job_id like '%\_A%' escape '\';

--Q17. HR EMPLOYEES 테이블에서 SALARY, LAST_NAME 순으로 올림차순 정렬하여 출력하세요.
select
    *
from 
    employees
order by
    salary, last_name;
   
--Q18. Seo라는 사람의 부서명을 출력하세요.
select
    e.first_name||' '||e.last_name 풀네임,
    d.department_name as 부서명
from
    employees e
left join 
    departments d on e.department_id = d.department_id
where
    first_name like '%Seo%' or last_name like '%Seo%';

--Q19. JOB ID 별 몇년차는 얼마 받는지 각 년차별로 샐러리 평균을 구하세요.
select 
    job_id, 연차, round(avg(salary)) 평균급여
from 
    (select job_id, floor(months_between(sysdate, hire_date)/12) as 연차, salary from employees)
group by 
    job_id, 연차
order by 
    job_id, 연차;

--Q20. HR EMPLOYEES 테이블에서 salary가 20000 이상이면 'a', 10000과 20000 미만 사이면 'b', 그 이하면 'c'로 표시하는 쿼리를 
--작성하시오.(case)
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
--Q21. 학교 관리를 위하여 테이블 2개 이상으로 db를 구축하고 3개 이상 활용할 수 있는 case를 만드세요.(20점)
-- 학생 테이블 생성
-- 학생 테이블생성
CREATE TABLE Students (
    student_id NUMBER PRIMARY KEY,
    name VARCHAR2(100),
    birth_date DATE,
    gender VARCHAR2(10),
    address VARCHAR2(255),
    phone_number VARCHAR2(15)
);

-- 학생 테이블 삽입
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


-- 교사 테이블 생성
CREATE TABLE Teachers (
    teacher_id NUMBER PRIMARY KEY,
    name VARCHAR2(100),
    subject VARCHAR2(100),
    email VARCHAR2(100),
    phone_number VARCHAR2(15)
);

-- 교사 테이블 삽입
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

-- 강의 테이블 생성
CREATE TABLE Courses (
    course_id NUMBER PRIMARY KEY,
    course_name VARCHAR2(100),
    teacher_id NUMBER,
    schedule VARCHAR2(100),
    FOREIGN KEY (teacher_id) REFERENCES Teachers(teacher_id)
);

-- 강의 테이블 삽입
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


-- 성적 테이블 생성
CREATE TABLE Grades (
    grade_id NUMBER PRIMARY KEY,
    student_id NUMBER,
    course_id NUMBER,
    grade CHAR(1),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- 각 학생의 성적 데이터 삽입 (예시 데이터)
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

-- 출석 테이블 생성
CREATE TABLE Attendance (
    attendance_id NUMBER PRIMARY KEY,
    student_id NUMBER,
    course_id NUMBER,
    attendance_date DATE,
    status VARCHAR2(10),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

-- 예시 출석 데이터 삽입
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

-- 학사 일정 테이블 생성
CREATE TABLE AcademicSchedule (
    event_id NUMBER PRIMARY KEY,
    event_name VARCHAR2(100),
    event_date DATE,
    description CLOB
);

-- 학사 일정 테이블 삽입
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

-- 학생-이벤트 일정 테이블 생성  
CREATE TABLE StudentEvents (
    id NUMBER PRIMARY KEY,
    student_id NUMBER,
    event_id NUMBER,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (event_id) REFERENCES AcademicSchedule(event_id)
);

-- 학생-이벤트 일정 테이블 삽입

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


-- 학급 테이블 생성
CREATE TABLE Classes (
    class_id NUMBER PRIMARY KEY,
    class_name VARCHAR2(100),
    teacher_id NUMBER,
    schedule VARCHAR2(100),
    FOREIGN KEY (teacher_id) REFERENCES Teachers(teacher_id)
);

-- 학급 테이블 삽입
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





-- 학생-학급 테이블 생성 (join으로 다시 만들기)
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


-- 학교시설 테이블 생성
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







학생의 성적 관리
SELECT s.name, c.course_name, g.grade
FROM Students s
JOIN Grades g ON s.student_id = g.student_id
JOIN Courses c ON g.course_id = c.course_id;


교사의 강의 스케줄 관리
SELECT t.name, c.course_name, c.schedule
FROM Teachers t
JOIN Courses c ON t.teacher_id = c.teacher_id;

학생 출석 관리
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


학사일정 관리
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
    
학교시설 이용관리
SELECT facility_name, location, status
FROM Facilities

시간표 조회
SELECT cl.class_name, t.name AS teacher_name, c.course_name, c.schedule
FROM Classes cl
JOIN Courses c ON cl.class_id = c.course_id
JOIN Teachers t ON c.teacher_id = t.teacher_id

--Q22. 다음 실습과제를 수행하세요.(20점)
-- 1. 현재 hr에 있는 7개 테이블들을 분석해서 인사관리에 의미있는 인사이트 5개 이상을 기술하세요.
-- 2. 인사관리 개선을 위한 KPI 2개를 설정하고 이것들을 테이블들의 데이터에 반영한 후 다시 분석해서 반영 여부를 검증하세요. 
--null값 제거 => 직무에 맞는 부서로 넣어주기
select * from jobs;
select * from employees where job_id like 'SA_REP';
select * from employees where department_id is null or department_id = 80;
savepoint qwe;
ROLLBACK;
UPDATE employees SET department_id = 80 WHERE department_id is null;

 
--직원의 경력 파악
--분석: 20년 이상의 직원과 과거 이직경험이 있는 직원을 경력직으로 취급하였습니다 
--     이로인해 경력자들을 프로젝트 등에 적절히 배치하여 높은 성과를 기대할 수 있습니다.
   
SELECT 
    E.EMPLOYEE_ID,
    E.HIRE_DATE AS 입사일,
    E.SALARY AS 급여,
    COALESCE(J.이직횟수, 0) AS 이직횟수
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
        EMPLOYEE_ID AS 사원번호, 
        COUNT(*) AS 이직횟수
     FROM 
        JOB_HISTORY
     GROUP BY 
        EMPLOYEE_ID) J
ON 
    E.EMPLOYEE_ID = J.사원번호
ORDER BY 
    E.HIRE_DATE ASC;   
    
    
    
--근속일수별 월급
--근속일수가 높은 사람이 최근 입사한 사람보다 월급이 적으면 불만이 생김-> 이를 파악하고 조정을 시행해야함
select employee_id,first_name||' '||last_name as 이름,job_id,salary, round(trunc(sysdate - hire_date)/365)  as "근무기간/년" 
from employees
order by  job_id,"근무기간/년" desc;





--팀별 부하직원의 수(현재 인원이 부족한 팀을 알수있음)
SELECT ep1.department_id, ep1.first_name || ' ' || ep1.last_name AS 상사, COUNT(*) AS "부하 직원수"
FROM  employees ep1
JOIN  employees ep2 ON ep1.employee_id = ep2.manager_id
LEFT OUTER JOIN departments d ON ep1.department_id = d.department_id
GROUP BY ep1.department_id, ep1.first_name || ' ' || ep1.last_name
ORDER BY ep1.department_id;




    

--직원의 지역별 분포
--분석: 각 위치(Location)에서 근무하는 직원 수를 분석합니다. 이를 통해 특정 지역의 인력 배치를 평가하고, 지역별 인력 자원을 최적화할 수 있습니다.
SELECT L.LOCATION_ID, L.CITY as 도시명, COUNT(E.EMPLOYEE_ID) AS 국가
FROM EMPLOYEES E
JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
JOIN LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID
GROUP BY L.LOCATION_ID, L.CITY
ORDER BY 국가 DESC;


-- 직원의 직무별 급여 범위*********************************************************************************************************************
--분석: 각 직무별로 급여 범위를 분석합니다. 이를 통해 같은 직무 내에서의 급여 차이를 평가하고, 급여 체계의 공정성을 높일 수 있습니다.
SELECT JOB_ID ,AVG(SALARY)as "급여 평균" , MAX(SALARY) as "급여 최댓값", MIN(SALARY) as "급여 최솟값"
FROM EMPLOYEES
GROUP BY JOB_ID;

SELECT 
    E.JOB_ID,
    E.SALARY AS "현재 급여",
    AVG(E.SALARY) OVER (PARTITION BY E.JOB_ID) AS "직무별 급여 평균",
    MAX(E.SALARY) OVER (PARTITION BY E.JOB_ID) AS "직무별 급여 최댓값",
    MIN(E.SALARY) OVER (PARTITION BY E.JOB_ID) AS "직무별 급여 최솟값"
FROM 
    EMPLOYEES E
JOIN 
    JOBS J ON E.JOB_ID = J.JOB_ID;
    
select * from employees;
select * from departments;