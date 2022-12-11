-- These functions operate on single rows only and return one result per row
-- Can be used in SELECT, WHERE, and ORDER BY clauses; can be nested
-- Character functions: Αccept character input and can return both character and number values
-- Number functions: Accept numeric input and return numeric values
-- Date functions: Operate on values of the DATE data type (except the MONTHS_BETWEEN)
-- Conversion functions: Convert a value from one data type to another
-- General functions:

-----------------------------Character functions----------------------------------
-- Case-conversion functions
-- Character-manipulation functions


-- convert the name to lowercase
SELECT
    LOWER('Stuart Little')
FROM
    DUAL;

/

-- convert the name to upper case
SELECT
    UPPER('you are an idiot!!')
FROM
    DUAL;

/

-- trim the name
SELECT
    TRIM(' Hello World     ')
FROM
    DUAL;

/

-- print the name as it should be
SELECT
    INITCAP('vishal poddar')
FROM
    DUAL;

/

-- trim and then conver in upper case
-- note that we can cascade the functions
SELECT
    TRIM(UPPER('     Mount Everest     '))
FROM
    DUAL;

/

-- find lenght of a string
SELECT
    LENGTH('123456789')
FROM
    DUAL;

/

--  get 5 characters from the 3rd position
SELECT
    SUBSTR('ABCDEFGH',
    3,
    5)
FROM
    DUAL;

/

-- concat first name and lastname
SELECT
    CONCAT('Vishal',
    'Poddar')
FROM
    DUAL;

/

-- find the index of string
-- we can even tell from which index to start searching and which occurance to return.
-- case sensitive
SELECT
    INSTR('Hello world',
    'Hell')
FROM
    DUAL;

-- what if we dont find the string
SELECT
    INSTR('hello world',
    'Hi')
FROM
    DUAL;

-- left pad the string with string
SELECT
    LPAD('panda',
    10,
    'he')
FROM
    DUAL;

/

-- lets make this out of scope
-- explore this if you want
SELECT
    LPAD('🎃🎃',
    10,
    '😀🥹')
FROM
    DUAL;

-- right pad the string with string
SELECT
    RPAD('panda',
    10,
    'he')
FROM
    DUAL;

/

--
SELECT
    REPLACE('Vishal',
    'shal',
    'month')
FROM
    DUAL;

/

--
SELECT
    REPLACE('hehehe! ok enough',
    'he',
    'yes')
FROM
    DUAL;

/

-- can use the function even in fields name
SELECT
    *
FROM
    EMPLOYEES
WHERE
    LOWER(LAST_NAME)='higgins';

/

-- trim set can only have one character
-- trim chould be further studied.
SELECT
    TRIM(LEADING 'H'
FROM
    'HeHelloWorld')
FROM
    DUAL;

-------------------------------------------------Numeric Functions--------------------

-- ROUND: Rounds value to a specified decimal
-- TRUNC: Truncates value to a specified decimal
-- MOD: Returns remainder of division


--  second arg signifies the decimal to the right to roundoff
SELECT
    ROUND(111.111,
    2),
    ROUND(111.111,
    0),
    ROUND(111.111,
    -1)
FROM
    DUAL;

/

-- same concept of sign applies here as well
SELECT
    TRUNC(45.926,
    1)
FROM
    DUAL;

/

-- mod is % in java
SEELCT MOD(1600, 300) FROM DUAL;

/

----------------------------------------working with dates-----------------------------------
-- In 'YY' format, a 2-digit year is assumed to be in the 100 consecutive years starting with the most recent xx00 and ending with the next xx99.
-- In 'RR' format, a 2-digit year is assumed to be in the 100 consecutive years starting with the most recent xx50 and ending with the next xx49
-- default is RR format

SELECT
    *
FROM
    EMPLOYEES
WHERE
    HIRE_DATE>'26-JAN-08';

-- sysdate is the current system date
SELECT
    SYSDATE
FROM
    DUAL;

/

-- we can add subtract date to date or date to number

-- 10 days from now
SELECT
    SYSDATE+10
FROM
    DUAL;

-- 10 hours from now
-- we divide a day by 24 to represent an hour
SELECT
    SYSDATE-10/24
FROM
    DUAL;

--  find the average number of weeks a employee has worked
SELECT
    AVG((SYSDATE-HIRE_DATE)/7)
FROM
    EMPLOYEES
WHERE
    DEPARTMENT_ID=90;

-- note that we can't just divide dates by number.

------------------------------------Using Date Functions--------------------------------

-- all the functions return except date except MONTHS_BETWEEN
-- above fact is very important is remembering the functionality of all the below functions
-- MONTHS_BETWEEN
-- ADD_MONTHS
-- NEXT_DAY
-- LAST_DAY
-- ROUND
-- TRUNC

-- https://docs.oracle.com/cd/B19306_01/server.102/b14200/functions230.htm#i1002084
-- a lot of precison levels are present for round and trunc for dates.
SELECT
    ROUND(SYSDATE,
    'YEAR')
FROM
    DUAL;

/

-- find the date of the next monday
-- similarly we can find for previous date
SELECT
    NEXT_DAY(SYSDATE,
    'MON')
FROM
    DUAL;

/

-- dont know why it works, but it does
SELECT
    *
FROM
    EMPLOYEES
WHERE
    HIRE_DATE LIKE '%08';
/

