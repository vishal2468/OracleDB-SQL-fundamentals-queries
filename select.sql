-- most basic select statement
SELECT
    *
FROM
    EMPLOYEES;

/

-- select statement with selected fields
SELECT
    LOCATION_ID,
    DEPARTMENT_ID
FROM
    DEPARTMENTS;

/

-- perform arithmetic calculations in a field
SELECT
    FIRST_NAME,
    SALARY,
    (SALARY*12)+100
FROM
    EMPLOYEES;

/

-- most of the fields of COMMISSION_PCT is null
-- null is different from 0 or space
-- some constraints (NOT NULL and PRIMARY KEY) prevent nulls from being used in the column.
SELECT
    LAST_NAME,
    SALARY,
    COMMISSION_PCT
FROM
    EMPLOYEES;

-------------------------------------------------------------------------------------------------------------
-- column alias

-- give column a custom name
SELECT
    FIRST_NAME,
    SALARY,
    (SALARY*12)+100 ANNUAL_SALARY
FROM
    EMPLOYEES;

/

-- can use as between the field and the alias to make it easier to read
SELECT
    FIRST_NAME,
    SALARY,
    (SALARY*12)+100 AS ANNUAL_SALARY
FROM
    EMPLOYEES;

/

-- if the alias is case sensitive or contain special characters , enclose it in " "
SELECT
    FIRST_NAME,
    SALARY,
    (SALARY*12)+100 "New Salary*"
FROM
    EMPLOYEES;

/

-------------------------------------------------------------------------------------------------------------

-- concatenation operator
SELECT
    LAST_NAME||SALARY
FROM
    EMPLOYEES;

/

-- display DISTINCT DEPARTMENT_ID
SELECT
    DISTINCT DEPARTMENT_ID
FROM
    EMPLOYEES;

/

-- display DISTINCT departmentID and JOB_id
-- result is every distinct combination of the columns
SELECT
    DISTINCT DEPARTMENT_ID,
    JOB_ID
FROM
    EMPLOYEES;

/
-- show the details of the fileds in the table
DESC EMPLOYEES;
/
-- desc and describe both are excatly the same
DESCRIBE EMPLOYEES;