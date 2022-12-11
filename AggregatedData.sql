-- avg salary
SELECT
    AVG(SALARY)
FROM
    EMPLOYEES;

/

--  ignored null
SELECT
    AVG(DISTINCT SALARY)
FROM
    EMPLOYEES;

/

-- ignores null
-- default is null
SELECT
    AVG(ALL SALARY)
FROM
    EMPLOYEES;

/

--ignores null
-- default is null
SELECT
    COUNT( ALL COMMISSION_PCT)
FROM
    EMPLOYEES;

/

-- AVG([DISTINCT|ALL]n)
-- MAX([DISTINCT|ALL]expr)
-- STDDEV([DISTINCT|ALL]n)
-- MIN([DISTINCT|ALL]expr)
-- SUM([DISTINCT|ALL]n)
-- VARIANCE([DISTINCT|ALL]n)
/

SELECT
    AVG(SALARY) AS AVERAGE_SALARY,
    MAX(SALARY) AS MAX_SALARY,
    MIN(SALARY) AS MIN_SALARY,
    SUM(SALARY) AS TOTAL_PAYMENT
FROM
    EMPLOYEES;

/

-- You can use the GROUP BY clause to divide the rows in a table into groups.
-- You can then use the group functions to return summary information for each group.

-- SELECT column, group_function(column) FROM table
-- [WHERE condition]
-- [GROUP BY group_by_expression]
-- [ORDER BY column];

-- When using the GROUP BY clause,
-- make sure that all columns in the SELECT list that are not group functions are included in the GROUP BY clause.

SELECT
    AVG(SALARY)
FROM
    EMPLOYEES
GROUP BY
    DEPARTMENT_ID;

/

-- sometimes we need to see results for group within groups
-- You can return summary results for groups and subgroups by listing multiple GROUP BY columns.
-- The GROUP BY clause groups rows but does not guarantee the order of the result set.
-- To order the groupings, use the ORDER BY clause.
SELECT
    DEPARTMENT_ID,
    JOB_ID,
    SUM(SALARY)
FROM
    EMPLOYEES
GROUP BY
    DEPARTMENT_ID,
    JOB_ID
ORDER BY
    JOB_ID;

/

-- this wont work as we cant restrict groups using where clause
SELECT
    DEPARTMENT_ID,
    AVG(SALARY)
FROM
    EMPLOYEES
WHERE
    AVG(SALARY)>6000
GROUP BY
    DEPARTMENT_ID;

/

-- we have to use having clause
SELECT
    DEPARTMENT_ID,
    AVG(SALARY)
FROM
    EMPLOYEES
GROUP BY
    DEPARTMENT_ID
HAVING
    AVG(SALARY)>6000;

/

-- Group functions can be nested to a depth of two functions
SELECT
    MAX(AVG(SALARY))
FROM
    EMPLOYEES
GROUP BY
    DEPARTMENT_ID;

/

-- Place the HAVING and GROUP BY clauses after the WHERE clause in a statement.
-- The order of the GROUP BY and HAVING clauses following the WHERE clause is not important.
-- You can have either the GROUP BY clause or the HAVING clause first as long as they follow the WHERE clause.
