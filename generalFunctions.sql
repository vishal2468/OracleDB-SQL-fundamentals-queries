-- NVL takes two arguments , if the first argument is the nvl return the second argument
SELECT
    NVL(COMMISSION_PCT,
    0) AS COM_PCT
FROM
    EMPLOYEES;

/

--  is first argument is not null it returns argument 2 elese it returns arg 3
SELECT
    FIRST_NAME,
    SALARY,
    COMMISSION_PCT,
    NVL2(COMMISSION_PCT,
    SALARY+COMMISSION_PCT*SALARY,
    SALARY) AS COMPENSATION
FROM
    EMPLOYEES

/

-- if both the arguments are equal the function return null
-- else it return the first argument
SELECT
    LENGTH(FIRST_NAME),
    LENGTH(LAST_NAME),
    NULLIF(LENGTH(FIRST_NAME),
    LENGTH(LAST_NAME))
FROM
    EMPLOYEES;

/

-- null if cant take null as the first argument
SELECT
    NULLIF(NULL,
    LENGTH(LAST_NAME))
FROM
    EMPLOYEES;

/

-- 2nd arg can be null though
SELECT
    NULLIF(LENGTH(FIRST_NAME),
    NULL)
FROM
    EMPLOYEES;

/
-- COALESCE returns the first not null argument
-- all args must be of same datatype
SELECT COALESCE(2,3) from DUAL;
SELECT COALESCE(10,null) from DUAL;
SELECT COALESCE(10,10,10,5,null) from DUAL;
SELECT COALESCE(null,null) from DUAL;
--  need to have atleast 2 arguments
SELECT COALESCE(null) from DUAL;