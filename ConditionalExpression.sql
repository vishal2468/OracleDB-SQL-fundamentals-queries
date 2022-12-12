-- The IF-THEN-ELSE logic can be applied within a SQL statement by using the CASE
-- expression or the DECODE function.
-- case is like if then else in sql
SELECT
    LAST_NAME,
    JOB_ID,
    SALARY,
    CASE JOB_ID
        WHEN 'IT_PROG' THEN
            1.1*SALARY
        WHEN 'ST_CLERK' THEN
            1.15*SALARY
        WHEN 'SA_REP' THEN
            1.5*SALARY
        ELSE
            SALARY
    END
 AS REVISED_SALARY
FROM
    EMPLOYEES;

/

--  else case is not MANDATORY
-- if the else condition is not present and no case is met , null is returned
-- we can also place brackets in the case statement
SELECT
    LAST_NAME,
    JOB_ID,
    SALARY,
    (CASE JOB_ID
        WHEN 'IT_PROG' THEN
            1.1*SALARY
        WHEN 'ST_CLERK' THEN
            1.15*SALARY
        WHEN 'SA_REP' THEN
            1.5*SALARY
    END) AS REVISED_SALARY
FROM
    EMPLOYEES;

/

-- decode
-- it is very similar to case
-- DECODE(P_ /*EXPR*/,
--         P_ /*SEARCH*/,
--         P_ /*RESULT*/,
--         P_ /*SEARCH, RESULT*/,
--         P_ /*SEARCH, RESULT...*/,
--         P_ /*DEFAULT*/)
SELECT
    FIRST_NAME,
    LAST_NAME,
    SALARY,
    JOB_ID,
    DECODE(JOB_ID,
    'IT_PROG',
    1.10*SALARY,
    'ST_CLERK',
    1.15*SALARY,
    'SA_REP',
    1.5*SALARY,
    SALARY) AS REVISED_SALARY
FROM
    EMPLOYEES