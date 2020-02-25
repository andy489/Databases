## Higher Than 75 Marks

[Judge System](https://www.hackerrank.com/challenges/more-than-75-marks/problem)

Query the Name of any student in **STUDENTS** who scored higher than <img src="https://latex.codecogs.com/svg.latex?\Large&space;75"> Marks. Order your output by the last three characters of each name. If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.

#### Input Format

The **STUDENTS** table is described as follows: 

![](https://github.com/andy489/Database/blob/master/assets/Higher%20Than%2075%20Marks%2001.png)

The Name column only contains uppercase (A-Z) and lowercase (a-z) letters.

#### Sample Input

![](https://github.com/andy489/Database/blob/master/assets/Higher%20Than%2075%20Marks%2002.png)

#### Sample Output
```
Ashley
Julia
Belvet
```

#### Explanation
Only Ashley, Julia, and Belvet have Marks > <img src="https://latex.codecogs.com/svg.latex?\Large&space;75">. If you look at the last three characters of each of their names, there are no duplicates and 'ley' < 'lia' < 'vet'.
