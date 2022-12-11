-- The join of two tables returning only matched rows are called inner join
-- A join between two tables that returns the results of the INNER join as well as the unmatched rows from the left (or right) table is called a left (or right) OUTER join.
-- A join between two tables that returns the results of an INNER join as well as the results of a left and right join is a full OUTER join.


-- returns the results of the INNER join as well as the unmatched rows from the left table.
SELECT
    E.LAST_NAME,
    D.DEPARTMENT_ID
FROM
    EMPLOYEES   E
    LEFT OUTER JOIN DEPARTMENTS D
    ON E.DEPARTMENT_ID=D.DEPARTMENT_ID;

/

--  returns the results of the Outer join as well as the unmatched rows from the rigth table.
SELECT
    E.LAST_NAME,
    D.DEPARTMENT_ID
FROM
    EMPLOYEES   E
    RIGHT OUTER JOIN DEPARTMENTS D
    ON E.DEPARTMENT_ID=D.DEPARTMENT_ID;

/

-- left +right + inner = full
SELECT
    E.LAST_NAME,
    D.DEPARTMENT_ID,
    D.DEPARTMENT_NAME
FROM
    EMPLOYEES   E
    FULL OUTER JOIN DEPARTMENTS D
    ON (E.DEPARTMENT_ID = D.DEPARTMENT_ID);

-- cross joins are rarely used
SELECT
    count(*)
FROM
    EMPLOYEES CROSS
    JOIN DEPARTMENTS;