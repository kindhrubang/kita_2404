--Task1_0521. ���̺� �߹����� ����� + erd�׸���
--�п� ���� DB
drop table student;
CREATE TABLE student(
    id number primary key,
    name varchar(20) not null,
    age number not null check(age<21),
    reg_date date not null,
    phone varchar(20),
    Subjects_korean char DEFAULT 'O',
    Subjects_English char DEFAULT 'O',
    Subjects_Math char DEFAULT 'O',
    mentor varchar(20) not null
);


drop table mentor;
create table mentor(


);

drop table mentor;
create table mentor(


);

drop table mentor;
create table mentor(


);