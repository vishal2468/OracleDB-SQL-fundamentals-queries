-- Comparison conditions fall into two classes:
-- single-row operators (>, =, >=, <, <>, <=)
-- multiple-row operators IN, ANY, ALL, EXISTS

-- You can place the subquery in a number of SQL clauses, including the following:
-- • WHERE clause
-- • HAVING clause
-- • FROM clause

SELECT
    SALARY,
    FIRST_NAME
FROM
    EMPLOYEES
WHERE
    SALARY>(
        SELECT
            SALARY
        FROM
            EMPLOYEES
        WHERE
            LAST_NAME='Abel'
    );

/

-- single row subqueries retune only one row from the inner select STATEMENT
-- single row subquery should return only one record or else it will throw an error
-- also select only one filed that is to be compared
SELECT
    *
FROM
    EMPLOYEES
WHERE
    JOB_ID=(
        SELECT
            JOB_ID
        FROM
            EMPLOYEES
        WHERE
            EMPLOYEE_ID=141
    )
    AND SALARY>(
        SELECT
            SALARY
        FROM
            EMPLOYEES
        WHERE
            EMPLOYEE_ID=141
    );

/

-- subqueries in having clause
SELECT
    DEPARTMENT_ID,
    MIN(SALARY)
FROM
    EMPLOYEES
GROUP BY
    DEPARTMENT_ID
HAVING
    MIN(SALARY)>(
        SELECT
            MIN(SALARY)
        FROM
            EMPLOYEES
        WHERE
            DEPARTMENT_ID=50
    );

/

-- multiple row queries

-- Find the employees who earn the same salary as the minimum salary for each department.
-- Equals to any member in the list

SELECT
    *
FROM
    EMPLOYEES
WHERE
    SALARY IN (
        SELECT
            MIN(SALARY)
        FROM
            EMPLOYEES
        GROUP BY
            DEPARTMENT_ID
    );

/

-- similarly if for ANY and ALL
-- any is used when any row satisfy the condition
-- all is when all the rows in the subquery should satisfy the condition DELETE

-- find the employees that earn less than any of the IT_prog
SELECT
    *
FROM
    EMPLOYEES
WHERE
    SALARY > ANY (
        SELECT
            SALARY
        FROM
            EMPLOYEES
        WHERE
            JOB_ID='IT_PROG'
    );

/

-- find the employees that earn less then all of the it prog
SELECT
    *
FROM
    EMPLOYEES
WHERE
    SALARY > ALL (
        SELECT
            SALARY
        FROM
            EMPLOYEES
        WHERE
            JOB_ID='IT_PROG'
    );
/

-- not opeareror can be used in ANY , ALL or IN 
-- note that not will come before the field that is to be compared
SELECT
    *
FROM
    EMPLOYEES
WHERE
    NOT SALARY > ALL (
        SELECT
            SALARY
        FROM
            EMPLOYEES
        WHERE
            JOB_ID='IT_PROG'
    );
/
