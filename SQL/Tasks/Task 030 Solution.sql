/*
MySQL
*/
SELECT (SALARY * MONTHS) AS EARNINGS, count(*) 
FROM EMPLOYEE group by 1 order by EARNINGS desc limit 1;
