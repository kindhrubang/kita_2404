
drop table student;
create table student(
    student_id Number primary key
    , name varchar2(20) not null
    , sex char not null
    , teacher_id number not null
    , school_year number not null
    , class number not null
    , age number not null
    , birth_day date not null
    , phone_number varchar(20)
    , family_phone_number varchar(20) not null
    , note varchar(20)
);

INSERT INTO student (student_id, name, sex, teacher_id, school_year, class, age, birth_day, phone_number, family_phone_number) VALUES (1, 'John Doe', 'M', 101, 3, 1, 16, TO_DATE('2007-05-15', 'YYYY-MM-DD'), '555-1234', '555-5678');
INSERT INTO student (student_id, name, sex, teacher_id, school_year, class, age, birth_day, phone_number, family_phone_number) VALUES (2, 'Jane Smith', 'F', 102, 2, 2, 17, TO_DATE('2006-07-21', 'YYYY-MM-DD'), '555-2345', '555-6789');
INSERT INTO student (student_id, name, sex, teacher_id, school_year, class, age, birth_day, phone_number, family_phone_number) VALUES (3, 'Sam Brown', 'M', 101, 3, 3, 16, TO_DATE('2007-02-11', 'YYYY-MM-DD'), '555-3456', '555-7890');
INSERT INTO student (student_id, name, sex, teacher_id, school_year, class, age, birth_day, phone_number, family_phone_number) VALUES (4, 'Alice Johnson', 'F', 103, 1, 1, 18, TO_DATE('2005-11-13', 'YYYY-MM-DD'), '555-4567', '555-8901');
INSERT INTO student (student_id, name, sex, teacher_id, school_year, class, age, birth_day, phone_number, family_phone_number) VALUES (5, 'Michael White', 'M', 102, 2, 2, 17, TO_DATE('2006-04-25', 'YYYY-MM-DD'), '555-5678', '555-9012');
INSERT INTO student (student_id, name, sex, teacher_id, school_year, class, age, birth_day, phone_number, family_phone_number) VALUES (6, 'Emily Davis', 'F', 101, 3, 3, 16, TO_DATE('2007-09-30', 'YYYY-MM-DD'), '555-6789', '555-0123');
INSERT INTO student (student_id, name, sex, teacher_id, school_year, class, age, birth_day, phone_number, family_phone_number) VALUES (7, 'David Wilson', 'M', 103, 1, 1, 18, TO_DATE('2005-06-07', 'YYYY-MM-DD'), '555-7890', '555-1234');
INSERT INTO student (student_id, name, sex, teacher_id, school_year, class, age, birth_day, phone_number, family_phone_number) VALUES (8, 'Sarah Martinez', 'F', 102, 2, 2, 17, TO_DATE('2006-12-19', 'YYYY-MM-DD'), '555-8901', '555-2345');
INSERT INTO student (student_id, name, sex, teacher_id, school_year, class, age, birth_day, phone_number, family_phone_number) VALUES (9, 'Chris Lee', 'M', 101, 3, 3, 16, TO_DATE('2007-03-14', 'YYYY-MM-DD'), '555-9012', '555-3456');
INSERT INTO student (student_id, name, sex, teacher_id, school_year, class, age, birth_day, phone_number, family_phone_number) VALUES (10, 'Sophia Hernandez', 'F', 103, 1, 1, 18, TO_DATE('2005-08-22', 'YYYY-MM-DD'), '555-0123', '555-4567');
INSERT INTO student (student_id, name, sex, teacher_id, school_year, class, age, birth_day, phone_number, family_phone_number, note) VALUES (11, 'James Clark', 'M', 102, 2, 2, 17, TO_DATE('2006-10-05', 'YYYY-MM-DD'), '555-1234', '555-5678', '간질');
INSERT INTO student (student_id, name, sex, teacher_id, school_year, class, age, birth_day, phone_number, family_phone_number) VALUES (12, 'Olivia Lewis', 'F', 101, 3, 3, 16, TO_DATE('2007-01-18', 'YYYY-MM-DD'), '555-2345', '555-6789');
INSERT INTO student (student_id, name, sex, teacher_id, school_year, class, age, birth_day, phone_number, family_phone_number) VALUES (13, 'Daniel Walker', 'M', 103, 1, 1, 18, TO_DATE('2005-05-29', 'YYYY-MM-DD'), '555-3456', '555-7890');
INSERT INTO student (student_id, name, sex, teacher_id, school_year, class, age, birth_day, phone_number, family_phone_number) VALUES (14, 'Emma Hall', 'F', 102, 2, 2, 17, TO_DATE('2006-11-27', 'YYYY-MM-DD'), '555-4567', '555-8901');
INSERT INTO student (student_id, name, sex, teacher_id, school_year, class, age, birth_day, phone_number, family_phone_number) VALUES (15, 'Matthew Young', 'M', 101, 3, 3, 16, TO_DATE('2007-04-10', 'YYYY-MM-DD'), '555-5678', '555-9012');
INSERT INTO student (student_id, name, sex, teacher_id, school_year, class, age, birth_day, phone_number, family_phone_number) VALUES (16, 'Hannah Davis', 'F', 102, 2, 2, 17, TO_DATE('2006-08-14', 'YYYY-MM-DD'), '555-9012', '555-3456');
INSERT INTO student (student_id, name, sex, teacher_id, school_year, class, age, birth_day, phone_number, family_phone_number) VALUES (17, 'Ryan Lee', 'M', 101, 3, 3, 16, TO_DATE('2007-03-21', 'YYYY-MM-DD'), '555-1234', '555-5678');
INSERT INTO student (student_id, name, sex, teacher_id, school_year, class, age, birth_day, phone_number, family_phone_number) VALUES (18, 'Isabella Martin', 'F', 103, 1, 1, 18, TO_DATE('2005-09-12', 'YYYY-MM-DD'), '555-6789', '555-8901');
INSERT INTO student (student_id, name, sex, teacher_id, school_year, class, age, birth_day, phone_number, family_phone_number) VALUES (19, 'Ethan Kim', 'M', 102, 2, 2, 17, TO_DATE('2006-11-15', 'YYYY-MM-DD'), '555-4567', '555-9012');
INSERT INTO student (student_id, name, sex, teacher_id, school_year, class, age, birth_day, phone_number, family_phone_number) VALUES (20, 'Lily Patel', 'F', 101, 3, 3, 16, TO_DATE('2007-07-17', 'YYYY-MM-DD'), '555-2345', '555-1234');
INSERT INTO student (student_id, name, sex, teacher_id, school_year, class, age, birth_day, phone_number, family_phone_number) VALUES (21, 'Aidan Chen', 'M', 103, 1, 1, 18, TO_DATE('2005-01-06', 'YYYY-MM-DD'), '555-3456', '555-5678');
INSERT INTO student (student_id, name, sex, teacher_id, school_year, class, age, birth_day, phone_number, family_phone_number) VALUES (22, 'Victoria Brown', 'F', 102, 2, 2, 17, TO_DATE('2006-10-24', 'YYYY-MM-DD'), '555-9012', '555-8901');
INSERT INTO student (student_id, name, sex, teacher_id, school_year, class, age, birth_day, phone_number, family_phone_number) VALUES (23, 'Julian Rodriguez', 'M', 101, 3, 3, 16, TO_DATE('2007-06-03', 'YYYY-MM-DD'), '555-4567', '555-1234');
INSERT INTO student (student_id, name, sex, teacher_id, school_year, class, age, birth_day, phone_number, family_phone_number) VALUES (24, 'Ava Nguyen', 'F', 103, 1, 1, 18, TO_DATE('2005-08-25', 'YYYY-MM-DD'), '555-5678', '555-9012');
INSERT INTO student (student_id, name, sex, teacher_id, school_year, class, age, birth_day, phone_number, family_phone_number) VALUES (25, 'Owen White', 'M', 102, 2, 2, 17, TO_DATE('2006-04-19', 'YYYY-MM-DD'), '555-2345', '555-3456');
INSERT INTO student (student_id, name, sex, teacher_id, school_year, class, age, birth_day, phone_number, family_phone_number) VALUES (26, 'Sophia Patel', 'F', 101, 3, 3, 16, TO_DATE('2007-09-05', 'YYYY-MM-DD'), '555-1234', '555-5678');
INSERT INTO student (student_id, name, sex, teacher_id, school_year, class, age, birth_day, phone_number, family_phone_number) VALUES (27, 'Gabriel Lee', 'M', 103, 1, 1, 18, TO_DATE('2005-12-11', 'YYYY-MM-DD'), '555-9012', '555-8901');


drop table subject;

CREATE TABLE subject (
    subject_id NUMBER PRIMARY KEY,
    subject_name VARCHAR2(50),
    teacher_id number,
    class number,
    period number
);

INSERT INTO subject(subject_id, subject_name, teacher_id, class, period) VALUES(1, '수학', 102, 1, 1);
INSERT INTO subject(subject_id, subject_name, teacher_id, class, period) VALUES(2, '영어', 103, 3, 2);
INSERT INTO subject(subject_id, subject_name, teacher_id, class, period) VALUES(3, '국어', 101, 2, 3);


select * from subject;


select * from student;
desc teacher;


drop table teacher;
CREATE TABLE teacher (
teacher_id NUMBER PRIMARY KEY,
name VARCHAR2(20) NOT NULL,
subject VARCHAR2(20) NOT NULL
);
INSERT INTO teacher (teacher_id, name, subject) VALUES (101, '원어민', 'Korean Language');
INSERT INTO teacher (teacher_id, name, subject) VALUES (102, '아인 슈타인', 'Math');
INSERT INTO teacher (teacher_id, name, subject) VALUES (103, '세종', 'English');
INSERT INTO teacher (teacher_id, name, subject) VALUES (104, '로니 콜먼', 'Health');
INSERT INTO teacher (teacher_id, name, subject) VALUES (105, '모나리자', 'Athletic');
INSERT INTO teacher (teacher_id, name, subject) VALUES (106, '최현우', 'Science');
INSERT INTO teacher (teacher_id, name, subject) VALUES (107, '김유신', 'History');
INSERT INTO teacher (teacher_id, name, subject) VALUES (108, '이순신', 'Military Studies');
INSERT INTO teacher (teacher_id, name, subject) VALUES (109, '장영실', 'Engineering');
INSERT INTO teacher (teacher_id, name, subject) VALUES (110, '유관순', 'Social Studies');
INSERT INTO teacher (teacher_id, name, subject) VALUES (111, '홍길동', 'Literature');
INSERT INTO teacher (teacher_id, name, subject) VALUES (112, '장보고', 'Maritime Studies');
INSERT INTO teacher (teacher_id, name, subject) VALUES (113, '신사임당', 'Art');
INSERT INTO teacher (teacher_id, name, subject) VALUES (114, '정약용', 'Philosophy');
INSERT INTO teacher (teacher_id, name, subject) VALUES (115, '김구', 'Political Science');
INSERT INTO teacher (teacher_id, name, subject) VALUES (116, '안중근', 'Ethics');
INSERT INTO teacher (teacher_id, name, subject) VALUES (117, '황희', 'Law');
INSERT INTO teacher (teacher_id, name, subject) VALUES (118, '정조', 'Governance');
INSERT INTO teacher (teacher_id, name, subject) VALUES (119, '광개토대왕', 'Strategy');
INSERT INTO teacher (teacher_id, name, subject) VALUES (120, '김홍도', 'Fine Arts');

-- 특정 선생님이 가르치는 과목의 정보를 가져오는 케이스
SELECT t.name AS teacher_name, t.subject, s.subject_name, s.class, s.period
FROM teacher t
JOIN subject s ON t.teacher_id = s.teacher_id;

-- 하루 일과표를 짜주는 케이스
select * 
from (  select  DISTINCT student.class, teacher.subject
            from student
            cross join teacher
            where class = 1
            order by student.class, DBMS_RANDOM.RANDOM)
where rownum<=6
union
select * 
from (  select  DISTINCT student.class, teacher.subject
            from student
            cross join teacher
            where class = 2
            order by student.class, DBMS_RANDOM.RANDOM)
where rownum<=6
union
select * 
from (  select  DISTINCT student.class, teacher.subject
            from student
            cross join teacher
            where class = 3
            order by student.class, DBMS_RANDOM.RANDOM)
where rownum<=6;

select class1.subject as "1반 시간표", class2.subject as "2반 시간표", class3.subject as "3반 시간표"
from 
    (select subject, ROW_NUMBER() over (Order By DBMS_RANDOM.value()) As rn from teacher Where subject is not null) class1
left join 
    (select subject, ROW_NUMBER() over (Order by DBMS_RANDOM.value()) As rn from teacher Where subject Is Not null) class2 on class1.rn = class2.rn
LEFT JOIN 
    (select subject, ROW_NUMBER() over (order by DBMS_RANDOM.value()) as rn from teacher where subject is not null) class3 on class1.rn = class3.rn
Where class1.rn <= 6
Order by class1.rn;
