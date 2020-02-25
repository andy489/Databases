## Top Earners

[Judge System](https://www.hackerrank.com/challenges/earnings-of-employees/problem)

We define an employee's total earnings to be their monthly <img src="https://latex.codecogs.com/svg.latex?\Large&space;salary\times{months}"> worked, and the maximum total earnings to be the maximum total earnings for any employee in the **Employee** table. Write a query to find the maximum total earnings for all employees as well as the total number of employees who have maximum total earnings. Then print these values as <img src="https://latex.codecogs.com/svg.latex?\Large&space;2"> space-separated integers.

#### Input Format

The **Employee** table containing employee data for a company is described as follows:

![](https://github.com/andy489/Database/blob/master/assets/Employee%20Names%2001.png)

where employee_id is an employee's ID number, name is their name, months is the total number of months they've been working for the company, and salary is the their monthly salary.

#### Sample Input

![](https://github.com/andy489/Database/blob/master/assets/Employee%20Names%2002.png)

#### Sample Output
```
69952 1
```
#### Explanation
The table and earnings data is depicted in the following diagram: 

![](https://github.com/andy489/Database/blob/master/assets/Top%20Earners%2001.png)

The maximum earnings value is <img src="https://latex.codecogs.com/svg.latex?\Large&space;69952">. The only employee with earnings <img src="https://latex.codecogs.com/svg.latex?\Large&space;=69952"> is Kimberly, so we print the maximum earnings value (<img src="https://latex.codecogs.com/svg.latex?\Large&space;69952">) and a count of the number of employees who have earned <img src="https://latex.codecogs.com/svg.latex?\Large&space;69952"> (which is <img src="https://latex.codecogs.com/svg.latex?\Large&space;1">) as two space-separated values.
