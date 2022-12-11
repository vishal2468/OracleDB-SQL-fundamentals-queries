-- Joining tables with the NATURAL JOIN, USING, or ON clauses results in an INNER join.

-- the join will be performed based on all the columns with same name
-- only those rows will be salected where all the columns march
-- the columns with same name should have same data type or return srror
SELECT
    DEPARTMENT_ID,
    DEPARTMENT_NAME,
    CITY,
    LOCATION_ID
FROM
    DEPARTMENTS
    NATURAL JOIN LOCATIONS;

/

-- we can use using clause to join tables using only the filelds that we want
-- using clause and natural join are mutually exclusive
-- The relationship between the EMPLOYEES and DEPARTMENTS tables is an equijoin
-- Equijoins are also called simple joins or inner joins.
SELECT
    EMPLOYEE_ID,
    LAST_NAME,
    LOCATION_ID,
    DEPARTMENT_ID,
    MANAGER_ID
FROM
    EMPLOYEES
    JOIN DEPARTMENTS
    USING (DEPARTMENT_ID, MANAGER_ID);

/

-- we can specify where clause in join
-- and also use alias for the table names
SELECT
    DEPARTMENT_ID,
    LOCATION_ID,
    CITY,
    DEPARTMENT_NAME
FROM
    DEPARTMENTS D
    JOIN LOCATIONS L
    USING (LOCATION_ID)
WHERE
    D.DEPARTMENT_ID=110;

/

-- we cant have a qualifier for the column that is in the using clause
-- so the below query wont work
SELECT
    L.CITY,
    D.DEPARTMENT_NAME
FROM
    LOCATIONS   L
    JOIN DEPARTMENTS D
    USING (LOCATION_ID)
WHERE
    D.LOCATION_ID = 1400;

/

-- if the columns are common in both table and not in join that those column must be prefixed with table alias
-- the following code will not not work because the maanager id is ambigous
-- it must have been qualified
SELECT
    FIRST_NAME,
    DEPARTMENT_NAME,
    MANAGER_ID
FROM
    EMPLOYEES   E
    JOIN DEPARTMENTS D
    USING (DEPARTMENT_ID)
WHERE
    DEPARTMENT_ID = 50;

/

-- this will work because the department id is qualified here
SELECT
    FIRST_NAME,
    DEPARTMENT_NAME,
    E.MANAGER_ID
FROM
    EMPLOYEES   E
    JOIN DEPARTMENTS D
    USING (DEPARTMENT_ID)
WHERE
    DEPARTMENT_ID = 50;

/

-- on clause can be used similar to using clause but it is more clear
-- Use the ON clause to specify arbitrary conditions or specify columns to join
-- it is necessary to use alias or the table name while using on clause.
SELECT
    FIRST_NAME,
    DEPARTMENT_NAME
FROM
    EMPLOYEES   E
    JOIN DEPARTMENTS D
    ON E.DEPARTMENT_ID=D.DEPARTMENT_ID;

/

-- three way join
SELECT
    EMPLOYEE_ID,
    D.DEPARTMENT_NAME,
    D.DEPARTMENT_ID,
    CITY
FROM
    EMPLOYEES   E
    JOIN DEPARTMENTS D
    ON E.DEPARTMENT_ID=D.DEPARTMENT_ID JOIN LOCATIONS L
    ON D.LOCATION_ID=L.LOCATION_ID;

/

-- we can use and or where clause to filter the results
-- we can also use where in place of and
-- similar to three way join we can also have four way join
SELECT
    EMPLOYEE_ID,
    D.DEPARTMENT_NAME,
    D.DEPARTMENT_ID,
    CITY
FROM
    EMPLOYEES   E
    JOIN DEPARTMENTS D
    ON E.DEPARTMENT_ID=D.DEPARTMENT_ID JOIN LOCATIONS L
    ON D.LOCATION_ID=L.LOCATION_ID
    JOIN COUNTRIES C
    ON L.COUNTRY_ID=C.COUNTRY_ID
    AND D.DEPARTMENT_ID=100;

/

-- self join is joining table on itself
SELECT
    e.FIRST_NAME,
    e.MANAGER_ID,
    m.FIRST_NAME
FROM
    EMPLOYEES E
    JOIN EMPLOYEES M
    ON E.MANAGER_ID=M.EMPLOYEE_ID;