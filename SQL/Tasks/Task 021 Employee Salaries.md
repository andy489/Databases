## Employee Salaries

[Judge System](https://www.hackerrank.com/challenges/salary-of-employees/problem)

Write a query that prints a list of employee names (i.e.: the name attribute) for employees in **Employee** having a salary greater than <img src="https://latex.codecogs.com/svg.latex?\Large&space;$2000"> per month who have been <img src="https://latex.codecogs.com/svg.latex?\Large&space;10"> months. Sort your result by ascending employee_id.
#### Input Format

The **Employee** table containing employee data for a company is described as follows:

![](https://github.com/andy489/Database/blob/master/assets/Employee%20Names%2001.png)

where employee_id is an employee's ID number, name is their name, months is the total number of months they've been working for the company, and salary is the their monthly salary.

#### Sample Input

![](https://github.com/andy489/Database/blob/master/assets/Employee%20Names%2002.png)

#### Sample Output
```
Angela
Michael
Todd
Joe
```
#### Explanation

Angela has been an employee for <img src="https://latex.codecogs.com/svg.latex?\Large&space;1"> month and earns <img src="https://latex.codecogs.com/svg.latex?\Large&space;$3443"> month.<br>
Michael has been an employee for <img src="https://latex.codecogs.com/svg.latex?\Large&space;6"> months and earns <img src="https://latex.codecogs.com/svg.latex?\Large&space;2017"> per month.<br>
Todd has been an employee for <img src="https://latex.codecogs.com/svg.latex?\Large&space;5"> months and earns <img src="https://latex.codecogs.com/svg.latex?\Large&space;3396"> per month.<br>
Joe has been an employee for <img src="https://latex.codecogs.com/svg.latex?\Large&space;9"> months and earns <img src="https://latex.codecogs.com/svg.latex?\Large&space;3573"> per month.<br>
We order our output by ascending employee_id.
