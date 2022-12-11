-- when we apply a filter we "limit" the result.
-- You can restrict the rows that are returned from the query by using the WHERE clause
-- SELECT *|{[DISTINCT] column|expression [alias],...} FROM table WHERE logical expression(s)];
-- WHERE   Restricts the query to rows that meet a condition
-- logical expression   -- It specifies a combination of one or more expressions and Boolean operators,
-- and returns a value of TRUE, FALSE, or UNKNOWN.



----- The WHERE -----------------------------------------------------------------------------

-- WHERE clause contains a condition that must be met and it directly follows the FROM clause

-- display employees of dept 90
SELECT
    *
FROM
    EMPLOYEES
WHERE
    DEPARTMENT_ID=90;

/

-- we cannot use column alias in where clause
-- below code wont work
SELECT
    DEPARTMENT_ID AS DEPT
FROM
    EMPLOYEES
WHERE
    DEPT=90;

/

-- find a employee by hire date
-- default date format is DD-MON-RR
SELECT
    *
FROM
    EMPLOYEES
WHERE
    HIRE_DATE = '17-JUN-03';

/

-- comparasion operator--------------------------------------------------------------

-- find employees with salary <=3000
SELECT
    *
FROM
    EMPLOYEES
WHERE
    SALARY<=3000;

-- salary between 2500 and 3000 inclusive
-- must specify the lower limit first
SELECT
    *
FROM
    EMPLOYEES
WHERE
    SALARY BETWEEN 2500
    AND 3000;

/

-- name between king and smith
-- between can also be used with string
SELECT
    *
FROM
    EMPLOYEES
WHERE
    FIRST_NAME BETWEEN 'King'
    AND 'Smith';

/

-- where MANAGER_ID is 100 or manager_id is 101 or manager id is 201
SELECT
    EMPLOYEE_ID,
    LAST_NAME,
    SALARY,
    MANAGER_ID
FROM
    EMPLOYEES
WHERE
    MANAGER_ID IN (100,
    101,
    201);

/

-- The IN operator can be used with any data type
-- the in operator is internally evaluated as or and therefor it has no performance benefits
-- although it has logical simplicity.
-- The condition defined using the IN operator is also known as the membership condition.
SELECT
    *
FROM
    EMPLOYEES
WHERE
    FIRST_NAME IN ('King',
    'Steven')

/

-- where name starts with s
-- LIKE
-- %denotes many characters
SELECT
    *
FROM
    EMPLOYEES
WHERE
    FIRST_NAME LIKE 'S%';

/

-- where second character is o
-- _ means a single character
SELECT
    FIRST_NAME
FROM
    EMPLOYEES
WHERE
    LAST_NAME LIKE '_o%';

/

-- what if we want to find the job_id which starts with SA_
-- we need to escape the _ for that we use ESCAPE and we need to pressed _ with a escape character thet is defind after escape keyword
SELECT
    *
FROM
    EMPLOYEES
WHERE
    JOB_ID LIKE 'SA\_%' ESCAPE '\';

/

-- find if the manager is null
-- is null operator
SELECT
    *
FROM
    EMPLOYEES
WHERE
    MANAGER_ID IS NULL;

/

--  A null value means that the value is unavailable, unassigned, unknown, or inapplicable.
-- therefore we cannot test with =, because a null cannot be equal or unequal to any value.
SELECT
    *
FROM
    EMPLOYEES
WHERE
    MANAGER_ID IS NOT NULL;

/

----- Logical Operators--------------------------------------------------------------
-- and ,or, not
-- null and null is null
-- null and true is null
-- null and false is false
-- null or false is null
-- null or true is true
-- not null is null
-- etc

-- join two conditions using and
SELECT
    *
FROM
    EMPLOYEES
WHERE
    SALARY>10000
    AND JOB_ID LIKE '%MAN%';

/

-- and has more precedence than or DELETE
-- so JOB_ID='AD_PRES' AND SALARY>15000 is one condition
-- JOB_ID='SA_REP' is other condition
SELECT
    *
FROM
    EMPLOYEES
WHERE
    JOB_ID='SA_REP'
    OR JOB_ID='AD_PRES'
    AND SALARY>15000;

/

-- we can over ride the precedence using ()
SELECT
    *
FROM
    EMPLOYEES
WHERE
    (JOB_ID='SA_REP'
    OR JOB_ID='AD_PRES')
    AND SALARY>15000;

/

--  highest to lowest precedence ( one in the top will be calculated first)
-- Arithmetic operators
-- Concatenation operator
-- Comparison conditions
-- IS [NOT] NULL, LIKE, [NOT] IN
-- [NOT] BETWEEN
-- Not equal to
-- NOT logical condition
-- AND logical condition
-- OR logical condition

-- Using the ORDER BY Clause


-- sort by hiredate ascending order
SELECT
    *
FROM
    EMPLOYEES
ORDER BY
    HIRE_DATE;

/

-- sort by name desc
SELECT
    *
FROM
    EMPLOYEES
ORDER BY
    FIRST_NAME;

/

--  we can use alias while sorting
-- recall that we can use alias when filtering using where clause
SELECT
    FIRST_NAME AS NAME
FROM
    EMPLOYEES
ORDER BY
    NAME;

/

-- we can sort by multiple columns and also specify there sorting order
-- note for name alexander
SELECT
    FIRST_NAME,
    LAST_NAME
FROM
    EMPLOYEES
ORDER BY
    FIRST_NAME ASC,
    LAST_NAME DESC;

/

-- we can provide the filed number in order by clause
-- starting from 1
SELECT
    *
FROM
    EMPLOYEES
ORDER BY
    1;

/

-- substitution variables using &
-- we can also define values
DEFINE SAL_VAL=12000;

SELECT
    *
FROM
    EMPLOYEES
WHERE
    SALARY>&SAL_VAL;

/

-- if the value does not exist , sql prompts user to provide the value
SELECT
    *
FROM
    EMPLOYEES
WHERE
    SALARY>&SALARY_VAL;

/

-- date and character values must be enclosed with single quotation marks.
SELECT
    *
FROM
    EMPLOYEES
WHERE
    FIRST_NAME='&name';

/

-- same applies if we are defining it beforehand
DEFINE NAME='Steven';

SELECT
    *
FROM
    EMPLOYEES
WHERE
    FIRST_NAME='&name';

/

-- we can && if the same variable is used multiple times and we dont want to take several inputs for same variable.
SELECT
    EMPLOYEE_ID,
    &&COLUMN
FROM
    EMPLOYEES
ORDER BY
    &COLUMN;

/

-- using accept we take input from the user and store it in a variable like define
-- please we are still using && in the col_name
ACCEPT COL_NAME PROMPT 'Please specify the column name:'

SELECT
    &&COL_NAME
FROM
    EMPLOYEES
ORDER BY
    &COL_NAME;

/

-- we are still able to use the col_name variable , we can remove a variabel using undefine
SELECT
    &&COL_NAME
FROM
    EMPLOYEES
ORDER BY
    &COL_NAME;

UNDEFINE COL_NAME;

/
-- verify command
-- we can set verify on if want to view the substituted sql query.
-- try turning verify OFF
SET VERIFY ON
SELECT
    &&COL_NAME
FROM
    EMPLOYEES
ORDER BY
    &COL_NAME;
/
