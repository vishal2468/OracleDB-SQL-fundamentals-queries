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

-- EXISTS
-- exists is used when the main query is dependent of rows existing/not existing in the db
-- find departments that does not have any employees
SELECT
    *
FROM
    DEPARTMENTS D
WHERE
    NOT EXISTS (
        SELECT
            *
        FROM
            EMPLOYEES   E
        WHERE
            E.DEPARTMENT_ID=D.DEPARTMENT_ID
    );

/

-- managers in the EMPLOYEES table who earns a salary more than 10000.
-- in th inner query we find if employee existes whose manager is the employee in ouret query
SELECT
    *
FROM
    EMPLOYEES M
WHERE
    EXISTS(
        SELECT
            *
        FROM
            EMPLOYEES E
        WHERE
            E.MANAGER_ID=M.EMPLOYEE_ID
    )
    AND M.SALARY>10000;

/

-- display all the employees who do not have any subordinates.
-- we will look at this query again
SELECT
    *
FROM
    EMPLOYEES M
WHERE
    M.EMPLOYEE_ID NOT IN(
        SELECT
            E.MANAGER_ID
        FROM
            EMPLOYEES E
    );

/

-- display the employees who are manager
-- we have 18 employees who have subordinates
-- why the above query then didnot return any result?
SELECT
    *
FROM
    EMPLOYEES M
WHERE
    M.EMPLOYEE_ID IN(
        SELECT
            E.MANAGER_ID
        FROM
            EMPLOYEES E
    );

/

-- the reason that the above to above query did not work because there is a null value in the inner query DELETE
-- and when the employee is compared to null it returns null, not true or false
-- and therefor it is not selected
-- that query will start working if discard null from the inner query result
SELECT
    *
FROM
    EMPLOYEES M
WHERE
    M.EMPLOYEE_ID NOT IN(
        SELECT
            E.MANAGER_ID
        FROM
            EMPLOYEES E
        WHERE
            E.MANAGER_ID IS NOT NULL
    );
/
-- **********************************************************************--
-- so this concludes this tutional of Oracle sql foundations.
