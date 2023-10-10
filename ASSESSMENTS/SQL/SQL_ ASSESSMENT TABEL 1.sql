CREATE DATABASE WORKER;
USE WORKER;
CREATE TABLE WORKER(WORKER_ID INT PRIMARY KEY,
FIRST_NAME VARCHAR(50),
LAST_NAME VARCHAR(50),
SALARY BIGINT,
JOINING_DATE timestamp,
DEPARTMENT VARCHAR(50)
);
SELECT *FROM WORKER;
insert INTO WORKER(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT)
values(1, 'MONIKA', 'ARORA', 100000, '2014-2-20 9:00', 'HR'),
(2, 'NIHARIKA', 'VARMA', 80000, '2014-6-11 9:00', 'ADMIN'),
(3, 'VISHAL', 'SINGHAL', 300000, '2014-2-20 9:00', 'HR'),
(4, 'AMITABH', 'SINGH', 500000,'2014-2-20 9:00', 'ADMIN'),
(5,'VIVEK', 'BHATI', 500000, '2014-6-11 9:00', 'ADMIN'),
(6, 'VIPUL', 'DIWAN', 200000, '2014-6-11 9:00', 'ACCOUNT'),
(7, 'SATISH', 'KUMAR', 75000, '2014-1-20 9:00', 'ACCOUNT'),
(8,'GEETIKA', 'CHAUHAN', 90000, '2014-5-11 9:00','ADMIN');
 
 select* FROM WORKER
 order by FIRST_NAME ASC, DEPARTMENT DESC;
 
 DROP TABLE WORKER;
 SELECT *
FROM WORKER
WHERE FIRST_NAME IN ('VIPUL', 'SATISH');

SELECT *FROM  WORKER
WHERE FIRST_NAME like '__h%';
SELECT *
FROM WORKER
WHERE SALARY between 100000 and 500000;

select salary,DEPARTMENT, count(worker_id)
from worker
group by salary, DEPARTMENT
having count(salary)>1;

select department, count(*)
from worker
group by department
having count(department)<5;

SELECT *FROM 
WORKER LIMIT 6;

SELECT DEPARTMENT, COUNT(FIRST_NAME) 
AS WORKER_STRENGTH FROM worker
  GROUP BY DEPARTMENT ORDER BY DEPARTMENT ASC;
 
SELECT FIRST_NAME, SALARY, DEPARTMENT FROM WORKER WHERE SALARY IN 
(SELECT max(SALARY) FROM WORKER group by DEPARTMENT);

CREATE TABLE STU_DENT( STU_DENT_ID INT primary KEY,
STU_DENT_NAME VARCHAR(50),
sex  enum('MALE','FEMALE'),
PERCENTAGE INT,
CLASS INT,
GRADE VARCHAR(50),
STREAM VARCHAR(50),
DOB date);

INSERT INTO STU_DENT(STU_DENT_ID, STU_DENT_NAME, SEX, PERCENTAGE, CLASS, GRADE, STREAM, DOB)
VALUE ( 1001, 'SUREKHA JOSHI', '2', 82, 12, 'A', 'SCIENCE', '1998-8-2'),
(1002, 'MAAHI AGARWAL', '2', 56, 11, 'C', 'COMMERCE', '2008-11-23'),
(1003, 'SANAM VARMA', '1', 59, 11, 'C', 'COMMERCE', '2006-6-29'),
(1004, 'RONIT KUMAR', '1', 63, 11, 'C', 'COMMERCE', '1997-11-5'),
(1005,'DIPESH PULKIT', '1',78, 11,'B', 'SCIENCE', '2003-09-14'),
(1006,'JAHANVI PURI', '2' ,60, 11, 'B', 'COMMERCE', '2008-07-11'),
(1007,'SANAM KUMAR', '1', 23, 12, 'F', 'COMMERCE', '1998-08-03'),
(1008, 'SAHIL SARAS', '1', 56, 11, 'C', 'COMMERCE', '2008-07-11'),
(1009, 'AKSHARA AGARWAL', '2', 72, 12, 'B', 'COMMERCE', '1996-01-10'),
(1010, 'STUTI MISHRA', '2', 39, 11, 'F', 'SCIENCE', '2008-11-23'),
(1011, 'HARSH AGARWAL', '1',42, 11, 'C', 'SCIENCE', '1998-08-03'),
(1012, 'NINUNJ AGARWAL', '1',49, 12, 'C', 'COMMERCE', '1998-06-23'),
(1013, 'AKRITI SAXENA', '2', 89, 12, 'A','SICENCE','2008-11-23'),
(1014, 'TANI RASTOGI', '2', 82, 12, 'A', 'SCIENCE', '2008-11-23');

DROP TABLE STU_DENT;


SELECT* FROM STU_DENT;

 SELECT STU_DENT_NAME,DOB FROM STU_DENT;
 
 SELECT*FROM STU_DENT
 WHERE PERCENTAGE >= 80;

SELECT STU_DENT_NAME, 
STREAM, PERCENTAGE FROM STU_DENT WHERE PERCENTAGE >80;


SELECT STU_DENT_NAME, STREAM, PERCENTAGE FROM STU_DENT WHERE PERCENTAGE >= 75 ;

SELECT *FROM STU_DENT
 WHERE stream ='SCIECNE'AND PERCENTAGE >75;

SELECT STU_DENT_NAME, STREAM = 'SCIENCE' FROM STU_DENT PERCENTAGE WHERE  PERCENTAGE >= 75; 