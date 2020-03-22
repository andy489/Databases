-- github.com/andy489

-- MS SQL Server, MySQL, Oracle, DB2
SELECT CASE 
WHEN A+B>C AND A+C>B AND B+C>A 
     THEN CASE 
     WHEN A=B AND B=C 
          THEN 'Equilateral' 
          WHEN A=B OR B=C OR A=C 
               THEN 'Isosceles' 
               ELSE 'Scalene' END 
ELSE 'Not A Triangle' END 
FROM TRIANGLES;

-- MS SQL Server, MySQL, Oracle
SELECT CASE WHEN A + B <= C OR A + C <= B OR B + C <= A THEN 'Not A Triangle'
            WHEN A = B AND B = C THEN 'Equilateral'
            WHEN A = B OR A = C OR B = C THEN 'Isosceles'
            ELSE 'Scalene'
        END
FROM TRIANGLES
