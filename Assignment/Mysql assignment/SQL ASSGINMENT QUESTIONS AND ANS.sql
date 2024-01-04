 USE HR ;
 SELECT*FROM countries ;
 SELECT*FROM DEPARTMENTS ;
 SELECT*FROM EMPLOYEES ;
 SELECT*FROM job_history;
 SELECT*FROM JOBS ;
 SELECT*FROM locations;
 SELECT*FROM regions;
  
  
-- ///////////////////////////////////  PAGE NO 29 ///////////////////////////////

-- Q1 DISPLAY ALL INFORMATION IN THE TABLE EMP AND DEPT .

select departments.department_id, departments.department_name, employees.first_name, 
employees.last_name,employees.email, employees.employee_id
from departments
left join employees on departments.department_id = employees.department_id ;


-- Q2 DISPLAY ONLY THE HIRE DATE EMPLOYEE NAME FOR EACH EMPLOYEE.
 
 SELECT FIRST_NAME, HIRE_DATE FROM employees ;
 
 -- Q3 . Display the ename concatenated with the job ID, separated by a comma and space, and
-- name the column Employee and Title .

SELECT concat(FIRST_NAME, ' ', JOB_ID) AS 'EMPLOYEE AND TITLE' FROM employees ;

-- Q4  Display the hire date, name and department number for all clerks. 

SELECT FIRST_NAME, HIRE_DATE , DEPARTMENT_ID from employees ;

-- Q5 Create a query to display all the data from the EMP table. Separate each column by a
-- comma. Name the column THE OUTPUT 

select employee_id,first_name,last_name,email,phone_number,hire_date,job_id, salary,
 commission_pct, manager_id, department_id from employees 
order by employee_id ; 

--- Q6 Display the names and salaries of all employees with a salary greater than 2000. 

select first_name , salary
from employees
where salary >2000 ;

-- Q7 Display the names and dates of employees with the column headers "Name" and "Start Date"		

SELECT FIRST_NAME , HIRE_DATE
FROM EMPLOYEES ;

-- Q8 Display the names and hire dates of all employees in the order they were hired

SELECT FIRST_NAME, HIRE_DATE FROM EMPLOYEES order by HIRE_DATE;
 
 -- Q9 Display the names and salaries of all employees in reverse salary order.
 
  SELECT FIRST_NAME , SALARY FROM EMPLOYEES order by FIRST_NAME , SALARY DESC ;
  
  -- Q10 Display 'ename" and "deptno" who are all earned commission and display salary in reverse order.
  
  SELECT FIRST_NAME , DEPARTMENT_ID, COMMISSION_PCT, SALARY
  FROM EMPLOYEES 
  order by FIRST_NAME, DEPARTMENT_ID, COMMISSION_PCT, SALARY desc;
  
  -- Q11 Display the last name and job title of all employees who do not have a manager.
  SELECT LAST_NAME,'JOB TITLE' FROM EMPLOYEES WHERE MANAGER_ID IS NULL;
  
  -- Q12 Display the last name, job, and salary for all employees whose job is sales representative
-- or stock clerk and whose salary is not equal to $2,500, $3,500, or $5,000

SELECT last_name, job_id, salary
FROM employees
WHERE (job_id = 'sales representative' OR job_id = 'stock clerk')
AND salary NOT IN (2500, 3500, 5000);



  -- ///////////////////////////////////  PAGE NO 30 ///////////////////////////////
  
  -- Q1 ) Display the maximum, minimum and average salary and commission earned.
  
  SELECT
  max( SALARY) AS MAX_SALARY,
  min(SALARY) AS MIN_SALARY,
  avg(SALARY) AS AVG_SALARY,
  max(COMMISSION_PCT) AS MAX_COMMISSION_PCT,
  min(COMMISSION_PCT) AS MIN_COMMISSION_PCT,
  avg(COMMISSION_PCT) AS AVG_COMMISSION_PCT
  FROM EMPLOYEES ;
  
  -- Q2 ) Display the department number, total salary payout and total commission payout for
 -- each department.
 
 SELECT DEPARTMENT_ID,sum(SALARY) AS TOTAL_SALARY_PAYOUT ,
  sum(COMMISSION_PCT) AS TOTAL_COMMISSION_PCT_PAYOUT 
  FROM EMPLOYEES
  group by DEPARTMENT_ID ;
  
 -- Q3 Display the department number and total salary of employees in each department.
 
 SELECT DEPARTMENT_ID , sum(SALARY)
 FROM EMPLOYEES
 group by DEPARTMENT_ID ;
 
 -- Q4 Display the department number and total salary of employees in each department. 
 
 SELECT DEPARTMENT_ID, SUM(SALARY) FROM EMPLOYEES group by DEPARTMENT_ID ;
 
 -- Q 5 Display the employee's name who doesn't earn a commission. Order the result set
-- without using the column name
 
 SELECT FIRST_NAME
 FROM EMPLOYEES
 where COMMISSION_PCT OR COMMISSION_PCT = 0
 order by 1;
 
 -- Q6 Display the employees name, department id and commission. If an Employee doesn't
 -- earn the commission, then display as 'No commission'. Name the columns appropriately
 
 SELECT
    FIRST_name AS Employee_Name,
    department_id AS Department_ID,
    COALESCE(commission_PCT, 'No commission') AS Commission
FROM
    employees;

-- Q7 Display the employee's name, salary and commission multiplied by 2. If an Employee
-- doesn't earn the commission, then display as 'No commission. Name the columns appropriately

SELECT FIRST_NAME , LAST_NAME , SALARY,
CASE WHEN COMMISSION_PCT IS NULL THEN
 'NO COMMISSION' else COMMISSION_PCT*2 end FROM EMPLOYEES ;
 
 -- Q8  Display the employee's name, department id who have the first name same as another
 -- employee in the same department

SELECT FIRST_NAME, DEPARTMENT_ID FROM EMPLOYEES WHERE DEPARTMENT_ID
IN (SELECT DEPARTMENT_ID FROM EMPLOYEES GROUP BY DEPARTMENT_ID HAVING COUNT(*)>1);

-- Q 9 Display the sum of salaries of the employees working under each Manager

SELECT MANAGER_ID, sum(SALARY) 
FROM EMPLOYEES 
group by MANAGER_ID ;

-- Q10 Select the Managers name, the count of employees working under and the department
-- ID of the manager. 

SELECT MANAGER_ID, COUNT(EMPLOYEE_ID)
FROM EMPLOYEES
group by MANAGER_ID;

-- 11 Select the employee name, department id, and the salary. Group the result with the
 -- manager name and the employee last name should have second letter 'a! 
select first_name , department_id , salary , manager_id 
from employees  
where employees.LAST_NAME LIKE '_A%'
group by manager_id, department_id, salary , first_name ;


-- Q 12 Display the average of sum of the salaries and group the result with the department id.
-- Order the result with the department id. 
SELECT AVG(A.SALARY) FROM EMPLOYEES A 
 WHERE A.SALARY  IN 
 (
 SELECT SUM(B.SALARY)  FROM EMPLOYEES B GROUP BY B.DEPARTMENT_ID 
 ); 

--  AVERAGE OF   (SUM OF DEPARTMENTWISE SALARIES)

-- q 13 Select the maximum salary of each department along with the department id 

select max(salary)from employees group by department_id ;

-- q 14 Display the commission, if not null display 10% of salary, if null display a default value 1


select coalesce(commission_pct , salary * 
0.10) as 'commission' from employees;


  -- ///////////////////////////////////  PAGE NO 31 ///////////////////////////////
  
  -- Q1 . Write a query that displays the employee's last names only from the string's 2-5th
-- position with the first letter capitalized and all other letters lowercase, Give each column an
 -- appropriate label. 

SELECT
    CONCAT(UPPER(SUBSTRING(first_name, 2, 1)), LOWER(SUBSTRING(last_name, 3, 4))) AS Last_Name
FROM Employees;



-- Q2 Write a query that displays the employee's first name and last name along with a " in
-- between for e.g.: first name : Ram; last name : Kumar then Ram-Kumar. Also displays the
-- month on which the employee has joined


select concat(first_name , ',' , last_name),
 month(hire_date) from employees
 WHERE FIRST_NAME LIKE 'A%' or last_name like 'A%';

 
-- Q3. Write a query to display the employees last name and if half of the salary is greater than
-- ten thousand then increase the salary by 10% else by 11.5% along with the bonus amount of
-- 1500 each. Provide each column an appropriate label. 

select last_name, case when salary/2 >10000 then salary*1.1+ 1500 
else salary*1.1+1500 end, 1500 as " bonus amount" from employees ;

-- q4. Display the employee ID by Appending two zeros after 2nd digit and 'E' in the end,
 -- department id, salary and the manager name all in Upper case, if the Manager name
-- consists of 'z' replace it with '$! 

SELECT 
    CONCAT(SUBSTRING(employee_id, 1, 2), 'E'),
    UPPER(department_id),
    salary,REPLACE(UPPER(manager_id), 'Z', '$!')
FROM employees;

-- q5. Write a query that displays the employee's last names with the first letter capitalized and
-- all other letters lowercase, and the length of the names, for all employees whose name
-- starts with J, A, or M. Give each column an appropriate label. Sort the results by the
-- employees' last names 

SELECT 
    CONCAT(UPPER(LEFT(last_name, 1)), LOWER(RIGHT(last_name, LENGTH(last_name) - 1))),
    LENGTH(last_name)
FROM employees
WHERE last_name LIKE 'J%' OR last_name LIKE 'A%' OR last_name LIKE 'M%'
ORDER BY last_name;

-- q 6. Create a query to display the last name and salary for all employees. Format the salary to
-- be 15 characters long, left-padded with $. Label the column SALARY 

select last_name, salary , lpad(salary,15,'$') as salary from employees;

-- Q 7 Display the employee's name if it is a palindrome

select reverse(first_name) as employeesname from employees ;

-- Q 8 Display First names of all employees with initcaps
 select concat(UPPER(SUBSTRING(FIRST_NAME ,1,1)),LOWER(SUBSTRING(FIRST_NAME, 2))) AS NAME FROM EMPLOYEES;
 
 -- Q9 From LOCATIONS table, extract the word between first and second space from the
-- STREET ADDRESS column. 

  SELECT substring_index(SUBSTRING_INDEX(STREET_ADDRESS,' ',2),' ',-1) FROM LOCATIONS; 
  
  -- Q10  Extract first letter from First Name column and append it with the Last Name. Also add
-- "@systechusa.com" at the end. Name the column as e-mail address. All characters should
-- be in lower case. Display this along with their First Name. 

 SELECT CONCAT(LOWER(SUBSTRING(FIRST_NAME,1 , 1)),LOWER(LAST_NAME) ,'@SYSTECHUSA.COM')
 AS'E-MAIL_ADDRESS',FIRST_NAME FROM EMPLOYEES ;
 
-- Q11  Display the names and job titles of all employees with the same job as Trenna.

select FIRST_NAME, JOB_ID FROM EMPLOYEES WHERE JOB_ID = (SELECT JOB_ID FROM EMPLOYEES WHERE FIRST_NAME="Trenna");

-- Q 12 . Display the names and department name of all employees working in the same city as Trenna. 

select E.first_name,d.department_name,l.city 
from employees e
join departments d on e.department_id = d.department_id
join locations l on d.location_id = l.location_id 
 where l.city = 'oxford';

-- Q13  Display the name of the employee whose salary is the lowest. 
  select first_name, salary
  from employees
  where salary =(select min(salary)from employees);
  
-- Q14 Display the names of all employees except the lowest paid.
select first_name ,salary 
from employees 
where salary >(select min(salary) from employees) ;

  -- ///////////////////////////////////  PAGE NO 32 ///////////////////////////////

-- Q 1. Write a query to display the last name, department number, department name for all employees.

 select e.last_name ,e.department_id, d.department_name
 from employees E 
 join departments D
 on e.department_id = d.department_id ;
 
 -- Q2. Create a unique list of all jobs that are in department 40. Include the location of the
-- department in the output. 
SELECT DISTINCT D.Department_Name, E.Job_id
FROM Departments D
JOIN Employees E ON D.Department_ID = E.Department_ID
WHERE D.Department_ID = 40;

-- Q3. Write a query to display the employee last name,department name,location id and city of
-- all employees who earn commission.
   
   SELECT e.last_name, d.department_name, d.location_id, l.city
	FROM employees e, departments d, locations l
	WHERE e.department_id = d.department_id
	AND
	d.location_id = l.location_id
	AND e.commission_pct IS NOT NULL;
    
-- Q4 . Display the employee last name and department name of all employees who have an 'a'
-- in their last name 
 
 select last_name,department_name 
 from employees 
 join departments on employees.department_id = departments. department_id
 where last_name like 'a%';
 
 -- Q5 Write a query to display the last name,job,department number and department name for
-- all employees who work in ATLANTA. 
 
 
 select e.last_name,e.Job_id,e.department_id ,d.department_name 
 from employees e
 join departments d on e.department_id = d.department_id
 where last_name = 'ATLANTA' ;
 
-- Q6. Display the employee last name and employee number along with their manager's last
 -- name and manager number.  
 
 SELECT e.employee_id as Emp_Id, e.last_name as Employee, 
m.employee_id as Mgr_Id, m.last_name as Manager 
FROM employees e 
join employees m 
ON e.manager_id = m.employee_id;
  
  -- Q7. Display the employee last name and employee number along with their manager's last
-- name and manager number (including the employees who have no manager). 

select e.employee_id as emp_id , e.last_name as employee,
m.employee_id as mgr_id , m.last_name as manager_name 
from employees e
 left join employees m
on e.manager_id = m.manager_id ;

-- Q 8 Create query that displays employees last name , department numbar, 
-- and all the employees who work in the same department as a given employees.
select e1.last_name , e1.department_id , e2.last_name , e2.department_id 
from employees e1
join employees e2 on e1.department_id = e2.department_id 
where e1.employee_id = 123 
order by e2.last_name ;

-- Q9 create Query That  displays tha name, job ,department name , salary, grade for all
-- employees Derive grade based on salary (>=50000=A,>=30000=B,>=30000=c)
select e.first_name,e.job_id,e.salary,
d.department_name,
case 
when salary >= 50000 then 'A'
when salary >= 30000 then 'B' 
else 'C'
end as grade
from employees e
JOIN
    departments d ON e.department_id = d.department_id;


-- Q10 display the names and hire date for all employees who were hired before their managers along withe
-- their manager names and hire date.label the columns as Employee name, emp_hire_date, manager name,
-- man_hire_date.
select E1.first_name as emp_name , E1.hire_date as emp_hire_date , E2.first_name as managare_name,
E2.hire_date as man_hire_date 
from employees e1
join employees e2 on e1.manager_id = e2.employee_id
where e1.hire_date < e2.hire_date ;


-- ///////////////////////////////////  PAGE NO 34 ///////////////////////////////

-- Q 1 write a query to display the last_name and hire_date of any employee in the same department as sales.
 
 select last_name,hire_date 
 from employees 
 where department_id in
 (select department_id as sales
 from employees
 where department_id  );
  
 -- Q2 Create a Query to Display the employee numbars and last name of all employees who earn mero then
 -- the average salary. sort the results in ascending order of salary.
 
 select employee_id,last_name,salary 
 from employees 
 where salary <(select avg(salary) from employees order by salary asc);

-- Q3. Write a query that displays the employee numbers and last names of all employees who
-- work in a department with any employee whose last name contains a' u

select employee_id , last_name ,department_id
from employees 
where last_name like '%u%';

-- Q 4 Display the last name , department numbar and job id of all employees whose department
-- location is ATLANTA . 
SELECT E.LAST_NAME, DEPARTMENTS.DEPARTMENT_ID AS DEPARTMENT_NUMBER , E.JOB_ID, LOCATIONS.CITY 
        FROM EMPLOYEES E
        JOIN DEPARTMENTS ON E.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID
        JOIN LOCATIONS ON DEPARTMENTS.LOCATION_ID = LOCATIONS.LOCATION_ID 
         where city = "oxford" ;
 
-- Q5 Display The last Name and Salary of every employees who reports to fillmore.
SELECT e.last_name, e.salary
FROM employees e
JOIN employees m ON e.manager_id = m.employee_id
WHERE m.last_name = 'king' ;

-- Q6 Display the department number, last name, and job ID for every employee in the
-- OPERATIONS department. 

SELECT department_id as department_numbar , last_name, job_id from employees where department_id in
( select department_id from departments where department_name = "operations" );

 -- Q7 Modify the above query to display the employee numbers, last names, and salaries of all
-- employees who earn more than the average salary and who work in a department with any
-- employee with a 'u'in their name. 

select employee_id , last_name , salary 
from employees 
where salary > ( select avg(salary) from employees )
and  department_id in 
(select department_id from employees where last_name like '%u%');


-- Q8 Display The names of all employees whose job title is the same as anyone in the sales dept.

select e.first_name , j.job_title , d.department_name
from employees e 
join jobs j on e.job_id = j.job_id 
join departments d on e.department_id = d.department_id 
where department_name = 'sales' ;

-- Q 9. Write a compound query to produce a list of employees showing raise percentages,
-- employee IDs, and salaries. Employees in department 1 and 3 are given a 5% raise,
-- employees in department 2 are given a 10% raise, employees in departments 4 and 5 are
-- given a 15% raise, and employees in department 6 are not given a raise.

select
Employee_ID,
    Salary,
    CASE
        WHEN Department_id IN (90,100) THEN Salary * 0.05
        WHEN Department_id = 100 THEN Salary * 0.10
        WHEN Department_id IN (60,100) THEN Salary * 0.15
        ELSE 0
    END AS RaiseAmount 
    from employees ;

-- Q10 Wirte a query to display the top three earners in the employees table.display their last name and salarys.

select last_name, salary from employees order by salary desc limit 3;

-- Q11 Display the names of all employees with their salary and commission earned. enployees with null commission
-- should have o in the commission column

select first_name, last_name , salary ,
coalesce(commission_pct , '0' ) as commission 
from employees ;

-- Q 12 Display The Managers(Name) with Top Three Salaries Along with Their Salaries And Department information.

select first_name as managaer_name, salary as manager_salary, 
department_id as managar_dpartment from employees order by salary desc limit 3 ;

-- ///////////////////////////////////  PAGE NO 34 ///////////////////////////////

-- Q1) Find the date difference between the hire date and resignation_date for all the
-- employees. Display in no. of days, months and year(1 year 3 months 5 days).
-- Emp_ID Hire Date Resignation_Date
-- 1 1/1/2000 7/10/2013
-- 2 4/12/2003 3/8/2017
-- 3 22/9/2012 21/6/2015
-- 4 13/4/2015 NULL
-- 5 03/06/2016 NULL
-- 6 08/08/2017 NULL
-- 7 13/11/2016 NULL

select employees.hire_date , job_history.end_date,
 concat(
 floor(datediff(job_history.end_date ,employees.hire_date)/365), 'year',
 floor((datediff(job_history.end_date, employees.hire_date)%365)/30), 'month',
 datediff(job_history.end_date , employees.hire_date)%'30', 'days') as resignations
from employees  
 join job_history on employees.employee_id =job_history.employee_id ;

-- Q2 ) Format the hire date as mm/dd/yyyy(09/22/2003) and resignation_date as mon dd,
-- yyyy(Aug 12th, 2004). Display the null as (DEC, 01th 1900) 

select coalesce(date_format(employees.hire_date , '%M/%D/%Y')) as hire_date,
coalesce(date_format(job_history.end_date , '%M/%D/%Y'),'des-01-1900')as end_date
 from employees
    join job_history on employees.employee_id = job_history.employee_id ;

-- Q3) Calcuate experience of the employee till date in Years and months(example 1 year and 3 months)
 -- Use Getdate() as input date for the below three questions.
 
 SELECT employee_id,  
 CONCAT(
 floor( DATEDIFF(NOW() , Hire_date)/365 ) , 'year',
floor((DATEDIFF(NOW(), hire_date) %365) /30), 'MONTH')  as experience
 from employees where employee_id ;
 
 -- Q 4 Display the count of days in previous quarter.
 
 SELECT DATE_ADD(END_DATE,INTERVAL -1 QUARTER)AS PREVIOUS_QUARTER_START_DATE FROM JOB_HISTORY;

-- Q 5 Fetch the previous Quarter's second week's first day's date. 

SELECT DATE_SUB(DATE_ADD(DATE_ADD(END_DATE,INTERVAL -1 QUARTER),INTERVAL 14 DAY),INTERVAL 6 DAY)AS 
"previous Quarter's second week's first day's date" FROM JOB_HISTORY;

--- Q.6 Fetch the financial year's 15th week's dates (Format: Mon DD YYYY)

select date_format( '2023-04-01' + interval (15*7) day, '%M %D, %Y') AS WEEK_15TH_FIRSTDAY;


--- Q.7.Find out the date that corresponds to the last Saturday of January, 2015 using with clause

SELECT DATE_FORMAT(DATE_SUB(LAST_DAY('2023-01-01'),INTERVAL 3 DAY),'%W-%y-%m_%d');


               
   


