								//// -- SQL ASSESSMENT PRAT 1 -- ////


 -- Q1 WRITE AN SQL QUERY TO PRINT ALL WORKER DETAILS FROM THE WORKER TABLE ORDER BY FRIST_NAME ASCENDING AND DEPARTMENT DESCENDING.
                              --- ASCENDING AND DESCENDING----
									select* FROM WORKER
                                    order by FIRST_NAME ASC, DEPARTMENT DESC;
 
 -- Q2 WRITE AN SQL QUERY TO PRINT DETAIL FOR WORKERS WITH THE FIST NAMES "VIPUL" AND "SATISH" FROM THE WORKER TABLE.
								--- "VIPUL" AND "SATISH" ---
									SELECT* FROM WORKER 
									WHERE FIRST_NAME IN ('VIPUL','SATISH');  
     
-- Q3 WRITE AN SQL QUERY TO PRINT DETAILS OF THE WORKERS WHOSE FIRST_NAME ENDS WITH 'H' AND CONTAINS SIX ALPHABETS.
							--  FIRST_NAME ENDS WITH 'H' AND CONTAINS SIX ALPHABETS.
									SELECT*FROM WORKER
									WHERE FIRST_NAME LIKE '__h%';

-- Q4 WRITE AN SQL QUERY TO PRINT DETAILS OF THE WORKERS WHOSES SALARY LINES BETWEEN 1.               
							---  SALARY LINES BETWEEN 1
									SELECT *FROM WORKER 
									WHERE SALARY between 100000 AND 500000;
            
-- Q5 WRITE AN SQL QUERY TO FETCH DUPLICATE RECORDS HAVING MATCHING DATA IN SOME FIELDS OF A TABLE.
					--- DUPLICATE RECORDS HAVING MATCHING DATA IN SOME FIELDS OF A TABLE.
						select salary, count(worker_id) as duplicateranks
						from worker
						group by salary
						having count(salary)>1;
                    
-- Q6 WRITE AN SQL QUERY TO SHOW THE TOP 6 RECORDS OF A TABLE  
              --   	 	TOP 6 RECORDS OF A TABLE
						SELECT *FROM 
						WORKE LIMIT 6;
                    
-- Q7 WRITE AN SQL QUERY TO FETCH THE DEPARTMENTS THAT HAVE LESS FIVE PEOPLE IN THEM.
				-- DEPARTMENTS THAT HAVE LESS FIVE PEOPLE IN THEM.
						select department, count(*)
						from worker
						group by department
						having count(department)<5;
                    
-- Q8 WRITE AN SQL QUERY TO SHOW ALL DEPARTMENTS ALONG WITH THE NUMBER OF PEOPLE IN THERE. 

					SELECT DEPARTMENT, COUNT(FIRST_NAME) 
					AS WORKER_STRENGTH FROM worker
					GROUP BY DEPARTMENT ORDER BY DEPARTMENT ASC;

-- Q9  WRITE AN SQL QUERY TO PRINT THE NAME OF EMPLOYEE HAVING THE HIGHEST SALARY IN EACH DEPARTMENT.

					SELECT FIRST_NAME, SALARY, DEPARTMENT FROM WORKER WHERE SALARY IN 
					(SELECT max(SALARY) FROM WORKER group by DEPARTMENT);
                    
                    //// -- SQL ASSESSMENT PRAT 2 -- ////
-- Q2 OPEN SCHOOL DATABASE, THEN SELCET STUDENT TABLE AND USE FOLLOWIN SQL STATMENTS. TYPE THE STATMENT, PRESS ENTER AND 
--				NOTE THE OUTPUT.

-- Q2 
-- Q1 TO DISPLAY ALL THE RECORDS FORM STUDENT TABLE. SELECT*FROM STUSENT;
								
						SELECT*FROM STUSENT;       
                        
 -- Q2  TO DISPLAY ANY NAME AND DATE OF BIRTH  FROM THE TABLE STUDENT.SELECT STUDENT NAME,DOB FROM STUDENT;
 
					SELECT STU_DENT,DOB FROM STU_DENT;
 
 -- Q3 TO DISPALY ALL STUDENT RECODE WHERE PERCENTAGE IS GREATER OF EQUAL TO 80 FROM STUDENT TABLE.SELECT *FROM STUDENT WHERE PRECENTAGE >=80;
   
					SELECT*FROM STU_DENT
					WHERE PERCENTAGE >= 80;
                    
 -- Q4 TO DISPALY STUDENT NAME, STREAM AND PERCENTAGE WHERE PERCENTAGE OF STUDENT IS MORE THEN 80.
		SELECT STUDENT_NAME, STREAM, PERCENTAGE WHERE PERCENTAGE >80;
  
				SELECT STU_DENT_NAME, 
				STREAM, PERCENTAGE FROM STU_DENT WHERE PERCENTAGE >80;
   
   -- Q5  TO DISPALY ALL RECORDS OFF SCIENCE STUDENTS WHOSE PERCENTAGE IS MORE THAN 75 FORM STUDENT TABLE 
   
   SELECT STU_DENT_NAME, STREAM, PERCENTAGE FROM STU_DENT WHERE PERCENTAGE >= 75 ;