## Occupations

[Judge System](https://www.hackerrank.com/challenges/occupations/problem)

[Pivot](https://en.wikipedia.org/wiki/Pivot_table) the Occupation column in **OCCUPATIONS** so that each Name is sorted alphabetically and displayed underneath its corresponding Occupation. The output column headers should be Doctor, Professor, Singer, and Actor, respectively.

**Note:** Print **NULL** when there are no more names corresponding to an occupation.

#### Input Format

The **OCCUPATIONS** table is described as follows:

![](https://github.com/andy489/Database/blob/master/assets/Occupations%2001.png)

Occupation will only contain one of the following values: **Doctor, Professor, Singer** or **Actor**.

#### Sample Input

![](https://github.com/andy489/Database/blob/master/assets/Occupatons%2002.png)

#### Sample Output
```
Jenny    Ashley     Meera  Jane
Samantha Christeen  Priya  Julia
NULL     Ketty      NULL   Maria
```

#### Explanation

The first column is an alphabetically ordered list of Doctor names.<br>
The second column is an alphabetically ordered list of Professor names.<br>
The third column is an alphabetically ordered list of Singer names.<br>
The fourth column is an alphabetically ordered list of Actor names.<br>
The empty cell data for columns with less than the maximum number of names per occupation (in this case, the Professor and Actor columns) are filled with **NULL** values.
