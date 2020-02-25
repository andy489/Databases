/*
MySQL & Oracle
*/
SELECT ceil(avg(SALARY)-avg(replace(SALARY,'0',''))) 
FROM EMPLOYEES;

/*
OR
*/
SELECT round(avg(SALARY)-avg(replace(SALARY,'0',''))+0.5)
FROM EMPLOYEES;
