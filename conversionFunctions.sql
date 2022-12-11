-- implicit and explicit conversions

-- oracle server can automatically convert
-- NUMBER to VARCHAR2 or CHAR and vice versa
-- DATE to VARCHAR2 or CHAR and vice versa

-- convert varchar2 to number implicitly
SELECT
    10+'20'
FROM
    DUAL;

-- here varchar is implicity converted to date

SELECT
    *
FROM
    EMPLOYEES
WHERE
    HIRE_DATE>'10-JAN-06';

-- explicit conversion
-- sql provides 3 funtions to convert value from one type to another

-- TO_CHAR
-- TO_NUMBER
-- To_DATE


-- This can be useful when you want to display the date in a specific way
-- For example, you might use TO_CHAR to convert a date value to a string like '2022-12-08' or 'December 8, 2022'.
-- there a lot of elements what we can use in the format string
SELECT
    TO_CHAR(SYSDATE,
    'MM/YY')
FROM
    DUAL;

/

-- elements like DATE, YEAR,SCC etc , we can place them anywhere we want
-- there are also various time elements that can be present in date

SELECT
    TO_CHAR(SYSDATE,
    'DAY/MONTH/YEAR  HH24 SCC')
FROM
    DUAL;

/

-- we can even enter string in the date format
SELECT
    TO_CHAR(SYSDATE,
    '"Today is "DD/MM/RR')
FROM
    DUAL;

/

-- TO_CHAR function can also be used with numbers
-- there a lot of number format elements present that can be used
SELECT
    TO_CHAR(SALARY,
    '$099,999.99')
FROM
    EMPLOYEES;

/

-- the input string is '12,345.67' and the format model is '9,999,999.99'.
-- The TO_NUMBER function will interpret the input string according to the format specified by the format model.
SELECT
    TO_NUMBER('12,345.67',
    '9,999,999.99')
FROM
    DUAL;

/

-- here no format is provided
-- there are also some very advanc masks that can be provided
SELECT
    TO_NUMBER('12345.67')
FROM
    DUAL;

/

-- To_DATE
-- The fx modifier specifies the exact match for the character argument and date format model of a TO_DATE function
SELECT
    LAST_NAME,
    HIRE_DATE
FROM
    EMPLOYEES
WHERE
    HIRE_DATE = TO_DATE('June 17, 2003',
    'fxMonth DD, YYYY');
/
