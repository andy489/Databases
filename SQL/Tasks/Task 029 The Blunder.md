## The Blunder

[Judge System](https://www.hackerrank.com/challenges/the-blunder/problem)

Samantha was tasked with calculating the average monthly salaries for all employees in the **EMPLOYEES** table, but did not realize her keyboard's <img src="https://latex.codecogs.com/svg.latex?\Large&space;0"> key was broken until after completing the calculation. She wants your help finding the difference between her miscalculation (using salaries with any zeroes removed), and the actual average salary.
Write a query calculating the amount of error (i.e.: <img src="https://latex.codecogs.com/svg.latex?\Large&space;actual-miscalculated"> average monthly salaries), and round it up to the next integer.

#### Input Format

The **EMPLOYEES** table is described as follows:

![](https://github.com/andy489/Database/blob/master/assets/Higher%20Than%2075%20Marks%2001.png)

**Note:** Salary is measured in dollars per month and its value is <img src="https://latex.codecogs.com/svg.latex?\Large&space;<10^5">.

#### Sample Input

![](https://github.com/andy489/Database/blob/master/assets/The%20Blunder%2001.png)

#### Sample Output
```
2061
```
#### Explanation

The table below shows the salaries without zeroes as they were entered by Samantha:

![](https://github.com/andy489/Database/blob/master/assets/The%20Blunder%2002.png)

Samantha computes an average salary of <img src="https://latex.codecogs.com/svg.latex?\Large&space;98.00">. The actual average salary is <img src="https://latex.codecogs.com/svg.latex?\Large&space;2159.00">.<br>
The resulting error between the two calculations is <img src="https://latex.codecogs.com/svg.latex?\Large&space;2159.00-98.00=2061.00"> which, when rounded to the next integer, is <img src="https://latex.codecogs.com/svg.latex?\Large&space;2061">.
