
SELECT * FROM employees;

SELECT *
FROM countries;

-- query to display table info , including col names and data types
describe employees;


describe departments;
    describe locations;


//Monika Karanovic
    Select table_name from user_tables;

//Tina Karanovic

    -- giving you firstname and last name of the employees
    SELECT first_name, last_name
FROM employees;


--Task Query to see emp first name , lastname, salary , job id:

SELECT first_name, last_name, salary, job_id
From employees;

-- from smaller to larger
Select last_name, employee_id, email
From employees
ORDER BY last_name ;

-- from larger to smaller
 Select employee_id, last_name, job_id, salary
 From employees
 ORDER BY salary desc;

 -- if you are lazy you can put instead of salary order by you can put number 4 , because it's fourth position after select
 Select employee_id, last_name, job_id, salary
 From employees
 ORDER BY 4 desc;
 -- when we are changing order here , we are not changing actual order in data-base it's changing only here


 -- ARITHEMTIC EXPRESSIONS:
 SELECT 10*10 + 2000
FROM Employees;

-- Calculating annual salary
SELECT last_name, salary * 12   --how to rename name columns in result " AS " keyword or just space
From employees
ORDER BY 2 desc;


SELECT last_name, salary * 12 AS annual_salary   --how to rename name columns in result " AS " keyword or just space
From employees
ORDER BY 2 desc;

--Task : Display empl lastname, job id , hourly, daily, weekly , moonthly, yearly salaries, and rename accordingly
SELECT last_name, job_id , salary/160 AS hourly, salary/20 AS daily, salary/4 AS weekly, salary AS monthly, salary *12 As yearly
From employees
ORDER BY last_name ;

-- unique job id is getting using DISTINCT keyword
SELECT DISTINCT job_id
FROM employees;

-- It's returning us every single last name , cuz it append to id job id , and duplicates with same JOB ID and SAME last name doesent exist
SELECT DISTINCT job_id, last_name
FROM employees;


-- CONCATENATION : get first name and last name and put @gmail.com using " || "
SELECT first_name ||'_'|| last_name || '@gmail.com' AS real_Email
From employees;


-- WHERE SAME AS " IF " condtion , this one is returning you all last name person who have salaty under 5000
SELECT last_name, salary
FROM employees
WHERE salary<5000;

-- SHow all IT programmers
SELECT *
FROM employees
WHERE  job_id = 'IT_PROG'; -- = 'IT_PROG' is equal and return all of them


-- Returning us job id and department id of guy who is first name + last name == David Austion
SELECT job_id, department_id
FROM employees
WHERE first_name || last_name = 'DavidAustin';

--------------------------------------------------------- DAY 2 ----------------------------------------------------------------

--SHOW all employees whose salary is more than 4000 and less then 6000 1.)
SELECT *
FROM employees
WHERE salary>4000
AND salary<6000;

--SHOW all employees whose salary is more than 4000 and less then 6000 2.) USING between
SELECT *
FROM employees
WHERE salary BETWEEN 4000 AND 6000; --- When we type BETWEEN it means it will take 4000 and 6000 thousend as well

-- DISPLAY ALL employees lastnames and job ids who are not sales perestatives
SELECT last_name, job_id
FROM employees
WHERE job_id<>'SA_REP';

-- DISPLAY ALL employees lastnames and job ids who are not sales perestatives 2) second way
SELECT last_name, job_id
FROM employees
WHERE NOT job_id = 'SA_REP';


--List all employees who joined the company after jan 1 , 2001 and before jan 1, 2004.
SELECT first_name||' ' || last_name || '      ' || hire_date
FROM employees
WHERE hire_date BETWEEN '01-JAN-01' AND '01-JAN-04'
ORDER BY hire_date;

-- Show all employees who work in any one of these departments 90, 60 , 100, 130 , 120
SELECT *
FROM employees
WHERE department_id = 90
or department_id = 60
or  department_id = 100
or  department_id = 130
or  department_id = 120;

-- Show all employees who work in any one of these departments 90, 60 , 100, 130 , 120 ---> USING IN OPERATOR
SELECT *
FROM employees
WHERE department_id IN(90,60,100,130,120);

-- TASK : SHOW all employee who work as any of these jobs :
SELECT *
FROM employees
WHERE job_id IN ('IT_PROG', 'SA_REP' , 'FI_ACCOUNT' , 'AD_VP');

-- LIKE OPERATOR IN SQL  --- > LIST all employees whose first name starts with N
SELECT *
FROM employees
WHERE first_name like 'N%';

--LIST all employees whose last name ends with a
SELECT *
FROM employees
WHERE last_name like '%a';

-- TASK List all employees who start working in month of February
SELECT *
FROM employees
Where hire_date LIKE '%FEB%';

-- TASK List all employees who start working in month of February or in MARCH or in APRIL
SELECT *
FROM employees
WHERE hire_date LIKE '%FEB%'
or hire_date LIKE '%MAR%'
or hire_date LIKE '%APR%';

-- List all employees whose last name second latter is 'a'
SELECT *
FROM employees
WHERE last_name LIKE '_a%'; --      _ -- > any single character

-- TASK list all employees whose first name contains eaither a or e, or b
SELECT *
FROM employees
WHERE first_name LIKE '%a%' -- contains that letter in first name
OR first_name LIKE '%e%'
OR first_name LIKE '%b%';

-- Show all records whose last name contains two lower case 'a'
SELECT *
FROM employees
WHERE last_name LIKE '%a%a%';

-- SHOW FIRST 5 RECORDS  in ORACLE : rownum in where condition   MYSQL : limit numberOfrows
-- SHOW all First five employees in company
SELECT *
FROM employees
WHERE rownum <=5;

-- TASK show top highest salary employees ---> We will come back ---> BUG
SELECT *
FROM employees
ORDER BY salary desc;

-- NULL in SQL  ---> Show all lastnames , salaries ,and commssions
SELECT last_name, salary, commission_pct
FROM employees;

-- SHOW ALL EMPLOYEES  who earn commsion:
SELECT last_name , salary , commission_pct
From employees
WHERE commission_pct IS NOT NULL;

-- SHOW ALL EMPLOYEES  who not earn commsion:
SELECT last_name , salary , commission_pct
From employees
WHERE commission_pct IS NULL; --- you cannot use =null you need to use is null

-----------------------------------------  FUNCTIONS IN SQL ----------------------------------------------------------

-- SINGLE ROW FUNCTION ---> LOWER , UPPER , INITCAP
SELECT UPPER(first_name) , UPPER (last_name)
FROM employees;

-- SHOW ALL EMAILS lowercased, uppercased and initial capital
SELECT LOWER(email), UPPER (email) , INITCAP(email)
FROM employees;


-- QUERY: SHOW all employees whose last name is 6 characters ---> Length
SELECT *
FROM employees
WHERE LENGTH (last_name) = 6;

-- Create a password for each employee that consist of first 3 letters of first name and first 3 letters of last name
Select SUBSTR(first_name, 0 ,3) || SUBSTR(last_name, 0,3) AS "Employee passwords"
FROM employees;

-- Create a password for each employee that consist of first 3 letters of first name and first 3 letters of last name all lower case
Select LOWER(SUBSTR(first_name, 0 ,3)) || LOWER(SUBSTR(last_name, 0,3)) AS "Employee passwords"
FROM employees;

--QUERY : SHOW all salaries and commision amount for employees who earn commissions
SELECT salary ,salary+ salary * commission_pct/4 AS commision
FROM employees
WHERE commission_pct IS NOT NULL;

-- ROUNDING -- ROUNDs number
SELECT ROUND (23.50, 1)
FROM dual;

-- DOES NOt ROUND only truncit
SELECT TRUNC (23.50, 1)
FROM dual;

-- Query: show all employees whose employee id is even number -- > using mod
SELECT *
FROM employees
WHERE MOD (employee_id,2)=0;

-- Query: show all employees whose employee id is ODD number -- > using mod
SELECT *
FROM employees
WHERE NOT MOD (employee_id,2)=0;

---- MULTIPLE ROW FUNCTIONS -------- OR ----- GROUP FUNCTIONS -----OR AGGREGATE FUCNCTIONS
--COUNT , MAX , MIN , AVG, SUM


--  proccesses multiple rows and return single result/ro
--Query : SHOW number of employees in the company .
SELECT COUNT (employee_id)
FROM employees;

-- Show number of employees who are IT_PROG
SELECT COUNT (job_id) --- we can put instead just *
FROM employees
WHERE job_id = 'IT_PROG';

-- TASK : Show all department ids that have more then 5 employees
SELECT department_id
FROM employees; --- later

-- SHOW number of unique job ids
SELECT COUNT (DISTINCT job_id )
from employees;

-- SHOW maximum salary in company , and highest employee_id
SELECT MAX(salary) , MAX (employee_id)
FROM employees;

--SHOW maximum salary in company , minumum salary in company , and avarage salary in company
SELECT MAX(salary), MIN(salary) , AVG(salary)
FROM employees;

-- HOW maximum salary in company , minumum salary in company , and avarage salary in company no decimals
SELECT MAX(salary), MIN(salary) , ROUND(AVG(salary),1)
FROM employees;

-- SHOW THE COMPANY monthly payyroll amount
SELECT SUM(salary)
FROM employees;

-- QUERY : Display department id's and count of people who work for that department ---> GROUP BY / keyword/ clause
SELECT department_id, COUNT(*)
FROM employees
GROUP BY department_id;

-- QUERY : Display job id's and count of people who work for that jobs
SELECT job_id, COUNT(*)
FROM employees
GROUP BY job_id;
-- WHENEVER you use group fucntion in SELECT statment and you include also columns that are not with GROUP functions,-
--those columns must be in GROUP BY clause/keyword

--Query : display Department id and min salary for that department that have min salary less then 3500 ---> HAVING KEYWORD / Clause
SELECT department_id, MIN(salary)
FROM employees
GROUP BY department_id
HAVING MIN (salary)<3500;

-- QUERY : display job_id's and count of ppl for those jobs that have more than 4 ppl
SELECT job_id, COUNT (*)
FROM employees
GROUP by job_id
HAVING COUNT (*)>4;


 ------ DAY 4 --------
SELECT department_id, department_name, city
FROM departments inner Join locations
ON departments.location_id= locations.location_id
WHERE department_id =100;


SELECT city, country_name
FROM locations join countries
ON locations.country_id = countries.country_id;

SELECT country_id , country_name , c.region_id , region_name
FROM countries c INNER JOIN regions r
ON c.region_id = r.region_id;


SELECT employee_id , last_name , d.department_id, department_name, d.location_id, city, country_name
FROM employees e join departments d
ON e.department_id= d.department_id
JOIN locations l
ON d.location_id = l.location_id
JOIN countries c
ON l.country_id = c.country_id;


------------- OUTER JOINS -------------

-- 3 types of outer joins

-- 1.) Right outer join
-- 2.) Left outer join
-- 3.) Full outer join

-- Right outer join - is used to display data from multiple tables and return matching records as well as non matching records
-- from right hand side table

SELECT department_id
FROM departments;


Select last_name, d.department_id, department_name
FROM employees e FULL OUTER JOIN departments d
ON e.department_id=d.department_id
WHERE last_name IS NULL;

--- SUBQUERIES : --- IS nested queri . Query within another query , like nested loops , looks like nested method calls

SELECT first_name , last_name, salary , job_id
FROM employees
WHERE salary = (SELECT MIN (salary)FROM employees);


SELECT first_name , last_name, salary , job_id
FROM employees
WHERE salary = (SELECT MAX (salary)FROM employees);


SELECT employee_id, job_id , department_id
FROM employees
WHERE NOT employee_id IN (SELECT DISTINCT manager_id FROM employees where manager_id is not null);


---- How to find second lowest salary ------
-- WE need to use correlated subquery----

---- SET OPERATORS ----

-- UNION , UNION ALL , MINUS , INTERSECT

 -- UNION --> return combined rows from 2 independent queries and removes duplicates and sorts them



(SELECT employee_id , last_name, salary , department_id
FROM employees
WHERE department_id =100)
UNION
(SELECT employee_id , last_name, salary ,department_id
FROM employees
WHERE department_id =10);


--- FOR SET OPERATORS TO WORK
-- SAME NUMBER OF COLUMNS IN SELECT STATMENT

-- UNION ALL ---- same as union but doesn't remove duplicates , and doesen't sort it

(SELECT employee_id , last_name, salary , department_id
FROM employees
WHERE department_id =100)
UNION ALL
(SELECT employee_id , last_name, salary ,department_id
FROM employees
WHERE department_id =10);


--- Minus--- present records which are not present in second query


SELECT first_name, last_name
FROM employees
MINUS
SELECT first_name, last_name
FROM employees;


---- INTERSECT ---
--

(SELECT first_name, last_name ,job_id
FROM employees)
INTERSECT
(SELECT first_name, last_name
FROM employees) ;    ---- ???????????


-- DATA migration from database1 (MYSQL)
-- TO database2(ORACLE)
-- Same data base schema in both.


-- CREATING TABLE
CREATE TABLE STUDENTS
(
    Student_id number(4) primary key,
    last_name varchar2(30) NOT NULL,
    course_id number(4) null
);


describe STUDENTS;



-- INSERTING VALUE INTO TABLE

INSERT INTO Students values(200,'Jones',101);
INSERT INTO Students values(201,'Smith',101);
INSERT INTO Students values(202,'Siddiqui',102);
INSERT INTO Students values(203,'Kim',104);
INSERT INTO Students values(204,'Lee',103);
INSERT INTO Students values(205,'Kumar',104);
INSERT INTO Students values(206,'Gonzales',null);

Select *
FROM STUDENTS;

-- COURSE ID OF KIM
Select course_id
FROM STUDENTS
WHERE last_name='Kim';

-- UPDATE COMMAND IS USED TO UPDATE RECORDS , VALUES IN DATA BASE TABLE

UPDATE students SET course_id ='102'
WHERE last_name = 'Jones';

Select *
FROM STUDENTS;


---- DELETE command is used to delete data from database table

DELETE FROM STUDENTS
WHERE student_id='204';

Mergin the file to Master branch
akjdssajdbsakd
sadsadasdsadasdadadssada