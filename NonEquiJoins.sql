-- A nonequijoin is a join condition containing something other than an equality operator
-- grades when salary between
-- this is not working because we dont have a job_grade table
SELECT
    E.LAST_NAME,
    J.GRADE_LEVEL
FROM
    EMPLOYEES  E
    JOIN JOB_GRADES J
    ON E.SALARY BETWEEN J.LOWEST_SAL
    AND J.HIGHEST_SAL;