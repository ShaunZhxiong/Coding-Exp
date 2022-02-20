# SQLite

**Create a new table with new values and columns**

```sql
select [expression] as [name], [expression2] as [name2]
```

```sql
select [expression] as [column], [expression2] as [column2] union
select [expression3] as [column], [expression4] as [column2];
```
**Create table**

```sql
**Create table [name] as [select statement]**

create table cities as
select 38 as latitude, 122 as longitude, "Berkely" as name union
select 42			 , 71			   , "Cambridge" 	   union
select 45			 , 93			   , "Minneapolis"			;
```

**Create table with specific column conditions**

```sqlite
create table numbers (n,note);
create table numbers (n unique, note);
create table numbers (n, note default "No comment");
```



**Show all data in a table**

```sql
select * from [table name]; 
```

**Show column information in a table**

```sql
PRAGMA table_info(table_name);
```

**Select columns on conditions**

```
**Select [columns] from [table] where [condition] order by [order]**

select name from cities where name='Berkely';
->Berkely

select name,latitude,longitude from cities where name='Berkely';
->Berkely|38|122

select name as NAME,latitude as Latitude,longitude as Longitude from cities where name='Berkely';
->Berkely|38|122
->comment: it changes the name of the column
```



**Join two tables**

by a comma to yield all combos of a row from A & a row from B
Or
join on command

```sql
select * from table1, table2;
-> this command produce all combination of rows of table1, table2

select * from table1 
join table2 on column1 = column2;
```

**Differ two datasets with same column names***

```sql
create table grandparents as
select a.parent as grandog, b.child as grandpup
from parents as a, parents as b
where a.child=b.parent;

select * from parents as a
   ...> join parents as b
   ...> on a.child=b.parent
```

**Count the number of rows**

```sqlite
select count(legs) from animals;
select count(*) from animals;
select count(distinct legs) from animals;
```

**Group by and Having**

```sqlite 
select [columns] from [table] group by [expression] having [expression];

* can group by columns
* having function is similar with where. However, 'HAVING' Clause can contain aggregate function, while 'where' function cannot.
* HAVING Clause is used after GROUP BY Clause, WHERE Clause is used before GROUP BY Clause
```

```mysql
SELECT DISTINCT
    l1.Num AS ConsecutiveNums
FROM
    Logs AS l1,
    Logs AS l2,
    Logs AS l3
WHERE
    l1.Id = l2.Id - 1
    AND l2.Id = l3.Id - 1
    AND l1.Num = l2.Num
    AND l2.Num = l3.Num;


Write an SQL query to find all numbers that appear at least three times consecutively.
Return the result table in any order.
The query result format is in the following example.

Input: 
Logs table:
+----+-----+
| id | num |
+----+-----+
| 1  | 1   |
| 2  | 1   |
| 3  | 1   |
| 4  | 2   |
| 5  | 1   |
| 6  | 2   |
| 7  | 2   |
+----+-----+
Output: 
+-----------------+
| ConsecutiveNums |
+-----------------+
| 1               |
+-----------------+
Explanation: 1 is the only number that appears consecutively for at least three times.
```



**Insert values into columns**

```sqlite
insert into table(column) values (value);
insert into table(columns) values (value0, value1);
```

**Update values**

```sqlite
update tablename set column1=0, column2=0 where n>2 and n%2=0;
```



# MySQL

## **Select the second highest value**

```mysql
select salary as "SecondHighestSalary" from Employee
order by salary desc limit 1,1;

#What if there is not second highest salary?
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
    DECLARE _offset int ;
    SET _offset = N-1;
  RETURN (
      select
         ifnull(
            (select distinct(salary) from Employee order by salary desc limit _offset,1)
             ,null) as "getNthHighestSalary(N)"
  );
END
```

![img](https://raw.githubusercontent.com/ShaunZhxiong/ImgGarage/main/img/MySQL-LIMIT-illustration.png)



## **DENSE RANK  & NORMAL RANK**

```mysql
Input: 
Scores table:
+----+-------+
| id | score |
+----+-------+
| 1  | 3.50  |
| 2  | 3.65  |
| 3  | 4.00  |
| 4  | 3.85  |
| 5  | 4.00  |
| 6  | 3.65  |
+----+-------+
Output: 
+-------+------+
| score | rank |
+-------+------+
| 4.00  | 1    |
| 4.00  | 1    |
| 3.85  | 2    |
| 3.65  | 3    |
| 3.65  | 3    |
| 3.50  | 4    |
+-------+------+

# DENSE RANK (After a tie, the next ranking number should be the next consecutive integer value. In other words, there should be no holes between ranks.)
SELECT score, DENSE_RANK() OVER(
    ORDER BY score DESC
) AS 'rank'
FROM Scores;

# NORMAL RANK (There might be holes between ranks)
SELECT score, RANK() OVER(
    ORDER BY score DESC
) AS 'rank'
FROM Scores;
```



## **Operators**

|                                                              |                                                              |
| :----------------------------------------------------------- | :----------------------------------------------------------- |
| Name                                                         | Description                                                  |
| [`&`](https://dev.mysql.com/doc/refman/8.0/en/bit-functions.html#operator_bitwise-and) | Bitwise AND                                                  |
| [`>`](https://dev.mysql.com/doc/refman/8.0/en/comparison-operators.html#operator_greater-than) | Greater than operator                                        |
| [`>>`](https://dev.mysql.com/doc/refman/8.0/en/bit-functions.html#operator_right-shift) | Right shift                                                  |
| [`>=`](https://dev.mysql.com/doc/refman/8.0/en/comparison-operators.html#operator_greater-than-or-equal) | Greater than or equal operator                               |
| [`<`](https://dev.mysql.com/doc/refman/8.0/en/comparison-operators.html#operator_less-than) | Less than operator                                           |
| [`<>`, `!=`](https://dev.mysql.com/doc/refman/8.0/en/comparison-operators.html#operator_not-equal) | Not equal operator                                           |
| [`<<`](https://dev.mysql.com/doc/refman/8.0/en/bit-functions.html#operator_left-shift) | Left shift                                                   |
| [`<=`](https://dev.mysql.com/doc/refman/8.0/en/comparison-operators.html#operator_less-than-or-equal) | Less than or equal operator                                  |
| [`<=>`](https://dev.mysql.com/doc/refman/8.0/en/comparison-operators.html#operator_equal-to) | NULL-safe equal to operator                                  |
| [`%`, `MOD`](https://dev.mysql.com/doc/refman/8.0/en/arithmetic-functions.html#operator_mod) | Modulo operator                                              |
| [`*`](https://dev.mysql.com/doc/refman/8.0/en/arithmetic-functions.html#operator_times) | Multiplication operator                                      |
| [`+`](https://dev.mysql.com/doc/refman/8.0/en/arithmetic-functions.html#operator_plus) | Addition operator                                            |
| [`-`](https://dev.mysql.com/doc/refman/8.0/en/arithmetic-functions.html#operator_minus) | Minus operator                                               |
| [`-`](https://dev.mysql.com/doc/refman/8.0/en/arithmetic-functions.html#operator_unary-minus) | Change the sign of the argument                              |
| [`->`](https://dev.mysql.com/doc/refman/8.0/en/json-search-functions.html#operator_json-column-path) | Return value from JSON column after evaluating path; equivalent to JSON_EXTRACT(). |
| [`->>`](https://dev.mysql.com/doc/refman/8.0/en/json-search-functions.html#operator_json-inline-path) | Return value from JSON column after evaluating path and unquoting the result; equivalent to JSON_UNQUOTE(JSON_EXTRACT()). |
| [`/`](https://dev.mysql.com/doc/refman/8.0/en/arithmetic-functions.html#operator_divide) | Division operator                                            |
| [`:=`](https://dev.mysql.com/doc/refman/8.0/en/assignment-operators.html#operator_assign-value) | Assign a value                                               |
| [`=`](https://dev.mysql.com/doc/refman/8.0/en/assignment-operators.html#operator_assign-equal) | Assign a value (as part of a [`SET`](https://dev.mysql.com/doc/refman/8.0/en/set-variable.html) statement, or as part of the `SET` clause in an [`UPDATE`](https://dev.mysql.com/doc/refman/8.0/en/update.html) statement) |
| [`=`](https://dev.mysql.com/doc/refman/8.0/en/comparison-operators.html#operator_equal) | Equal operator                                               |
| [`^`](https://dev.mysql.com/doc/refman/8.0/en/bit-functions.html#operator_bitwise-xor) | Bitwise XOR                                                  |
| [`AND`, `&&`](https://dev.mysql.com/doc/refman/8.0/en/logical-operators.html#operator_and) | Logical AND                                                  |
| [`BETWEEN ... AND ...`](https://dev.mysql.com/doc/refman/8.0/en/comparison-operators.html#operator_between) | Whether a value is within a range of values                  |
| [`BINARY`](https://dev.mysql.com/doc/refman/8.0/en/cast-functions.html#operator_binary) | Cast a string to a binary string                             |
| [`CASE`](https://dev.mysql.com/doc/refman/8.0/en/flow-control-functions.html#operator_case) | Case operator                                                |
| [`DIV`](https://dev.mysql.com/doc/refman/8.0/en/arithmetic-functions.html#operator_div) | Integer division                                             |
| [`IN()`](https://dev.mysql.com/doc/refman/8.0/en/comparison-operators.html#operator_in) | Whether a value is within a set of values                    |
| [`IS`](https://dev.mysql.com/doc/refman/8.0/en/comparison-operators.html#operator_is) | Test a value against a boolean                               |
| [`IS NOT`](https://dev.mysql.com/doc/refman/8.0/en/comparison-operators.html#operator_is-not) | Test a value against a boolean                               |
| [`IS NOT NULL`](https://dev.mysql.com/doc/refman/8.0/en/comparison-operators.html#operator_is-not-null) | NOT NULL value test                                          |
| [`IS NULL`](https://dev.mysql.com/doc/refman/8.0/en/comparison-operators.html#operator_is-null) | NULL value test                                              |
| [`LIKE`](https://dev.mysql.com/doc/refman/8.0/en/string-comparison-functions.html#operator_like) | Simple pattern matching                                      |
| [`MEMBER OF()`](https://dev.mysql.com/doc/refman/8.0/en/json-search-functions.html#operator_member-of) | Returns true (1) if first operand matches any element of JSON array passed as second operand, otherwise returns false (0) |
| [`NOT`, `!`](https://dev.mysql.com/doc/refman/8.0/en/logical-operators.html#operator_not) | Negates value                                                |
| [`NOT BETWEEN ... AND ...`](https://dev.mysql.com/doc/refman/8.0/en/comparison-operators.html#operator_not-between) | Whether a value is not within a range of values              |
| [`NOT IN()`](https://dev.mysql.com/doc/refman/8.0/en/comparison-operators.html#operator_not-in) | Whether a value is not within a set of values                |
| [`NOT LIKE`](https://dev.mysql.com/doc/refman/8.0/en/string-comparison-functions.html#operator_not-like) | Negation of simple pattern matching                          |
| [`NOT REGEXP`](https://dev.mysql.com/doc/refman/8.0/en/regexp.html#operator_not-regexp) | Negation of REGEXP                                           |
| [`OR`, `||`](https://dev.mysql.com/doc/refman/8.0/en/logical-operators.html#operator_or) | Logical OR                                                   |
| [`REGEXP`](https://dev.mysql.com/doc/refman/8.0/en/regexp.html#operator_regexp) | Whether string matches regular expression                    |
| [`RLIKE`](https://dev.mysql.com/doc/refman/8.0/en/regexp.html#operator_regexp) | Whether string matches regular expression                    |
| [`SOUNDS LIKE`](https://dev.mysql.com/doc/refman/8.0/en/string-functions.html#operator_sounds-like) | Compare sounds                                               |
| [`XOR`](https://dev.mysql.com/doc/refman/8.0/en/logical-operators.html#operator_xor) | Logical XOR                                                  |
| [`|`](https://dev.mysql.com/doc/refman/8.0/en/bit-functions.html#operator_bitwise-or) | Bitwise OR                                                   |
| [`~`](https://dev.mysql.com/doc/refman/8.0/en/bit-functions.html#operator_bitwise-invert) | Bitwise inversion                                            |



## **IN** judgement

```mysql
Write an SQL query to find employees who have the highest salary in each of the departments.

Return the result table in any order.

The query result format is in the following example.


Input: 
Employee table:
+----+-------+--------+--------------+
| id | name  | salary | departmentId |
+----+-------+--------+--------------+
| 1  | Joe   | 70000  | 1            |
| 2  | Jim   | 90000  | 1            |
| 3  | Henry | 80000  | 2            |
| 4  | Sam   | 60000  | 2            |
| 5  | Max   | 90000  | 1            |
+----+-------+--------+--------------+
Department table:
+----+-------+
| id | name  |
+----+-------+
| 1  | IT    |
| 2  | Sales |
+----+-------+
Output: 
+------------+----------+--------+
| Department | Employee | Salary |
+------------+----------+--------+
| IT         | Jim      | 90000  |
| Sales      | Henry    | 80000  |
| IT         | Max      | 90000  |
+------------+----------+--------+
Explanation: Max and Jim both have the highest salary in the IT department and Henry has the highest salary in the Sales department.
```

```mysql
SELECT
    Department.name AS 'Department',
    Employee.name AS 'Employee',
    Salary
FROM
    Employee, Department
WHERE
    Employee.DepartmentId = Department.Id AND
    (Employee.DepartmentId , Salary) IN
    (   SELECT
            DepartmentId, MAX(Salary)
        FROM
            Employee
        GROUP BY DepartmentId
    )
;
```



## **MySQL uses DATEDIFF to compare two data type values**

```mysql
mysql> SELECT DATEDIFF('2007-12-31 23:59:59','2007-12-30');
        -> 1
mysql> SELECT DATEDIFF('2010-11-30 23:59:59','2010-12-31');
        -> -31
```

example

```mysql
Write an SQL query to find all dates' Id with higher temperatures compared to its previous dates (yesterday).

Return the result table in any order.

The query result format is in the following example.


Input: 
Weather table:
+----+------------+-------------+
| id | recordDate | temperature |
+----+------------+-------------+
| 1  | 2015-01-01 | 10          |
| 2  | 2015-01-02 | 25          |
| 3  | 2015-01-03 | 20          |
| 4  | 2015-01-04 | 30          |
+----+------------+-------------+
Output: 
+----+
| id |
+----+
| 2  |
| 4  |
+----+
Explanation: 
In 2015-01-02, the temperature was higher than the previous day (10 -> 25).
In 2015-01-04, the temperature was higher than the previous day (20 -> 30).
```

```mysql
# Write your MySQL query statement below
SELECT W2.id as id FROM Weather as W1, Weather as W2
WHERE (DATEDIFF(W2.recordDate, W1.recordDate) = 1) AND
W1.temperature < W2.temperature;
```



## **CASE WHEN function**

EXAMPLE1

```mysql
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
+-------------+---------+
id is the primary key column for this table.
Each row of this table indicates the name and the ID of a student.
id is a continuous increment.

Input: 
Seat table:
+----+---------+
| id | student |
+----+---------+
| 1  | Abbot   |
| 2  | Doris   |
| 3  | Emerson |
| 4  | Green   |
| 5  | Jeames  |
+----+---------+
Output: 
+----+---------+
| id | student |
+----+---------+
| 1  | Doris   |
| 2  | Abbot   |
| 3  | Green   |
| 4  | Emerson |
| 5  | Jeames  |
+----+---------+
Explanation: 
Note that if the number of students is odd, there is no need to change the last one's seat.
```

Write an SQL query to swap the seat id of every two consecutive students. If the number of students is odd, the id of the last student is not swapped.

Return the result table ordered by `id` **in ascending order**.

The query result format is in the following example.

```mysql
SELECT (CASE 
        WHEN (id % 2) != 0 AND id < (SELECT COUNT(*) FROM Seat) THEN id + 1
        WHEN (id % 2) != 0 AND id = (SELECT COUNT(*) FROM Seat) THEN id
        ELSE id - 1
        END) AS id, student FROM Seat
ORDER BY id ASC;
```



EXAMPLE2

```mysql
Write an SQL query to swap all 'f' and 'm' values (i.e., change all 'f' values to 'm' and vice versa) with a single update statement and no intermediate temporary tables.

Note that you must write a single update statement, do not write any select statement for this problem.

The query result format is in the following example.

Input: 
Salary table:
+----+------+-----+--------+
| id | name | sex | salary |
+----+------+-----+--------+
| 1  | A    | m   | 2500   |
| 2  | B    | f   | 1500   |
| 3  | C    | m   | 5500   |
| 4  | D    | f   | 500    |
+----+------+-----+--------+
Output: 
+----+------+-----+--------+
| id | name | sex | salary |
+----+------+-----+--------+
| 1  | A    | f   | 2500   |
| 2  | B    | m   | 1500   |
| 3  | C    | f   | 5500   |
| 4  | D    | m   | 500    |
+----+------+-----+--------+
Explanation: 
(1, A) and (3, C) were changed from 'm' to 'f'.
(2, B) and (4, D) were changed from 'f' to 'm'.
```

```mysql
# Write your MySQL query statement below
UPDATE Salary SET sex = (CASE sex WHEN 'm' THEN 'f'
                         ELSE 'm'
                         END);
```



**Find Prime Numbers**

## **Set User-defined variables**

**GROUP_CONCAT function**

example

```mysql
SET @potential_prime = 1;
SET @divisor = 1;

SELECT GROUP_CONCAT(POTENTIAL_PRIME SEPARATOR '&') FROM
    (SELECT @potential_prime := @potential_prime + 1 AS POTENTIAL_PRIME FROM
    information_schema.tables t1,
    information_schema.tables t2
    LIMIT 1000) list_of_potential_primes
WHERE NOT EXISTS(
	SELECT * FROM
        (SELECT @divisor := @divisor + 1 AS DIVISOR FROM
	    information_schema.tables t4,
        information_schema.tables t5
	    LIMIT 1000) list_of_divisors
	WHERE MOD(POTENTIAL_PRIME, DIVISOR) = 0 AND POTENTIAL_PRIME <> DIVISOR);
```

here, 

assign value should use `:=`

`@potential_prime` is [a user-defined variable.](https://dev.mysql.com/doc/refman/8.0/en/user-variables.html)

[`information_schema.tables`](https://dev.mysql.com/doc/mysql-infoschema-excerpt/5.7/en/information-schema-tables-table.html) is a system file which provides information about tables in databases

```
Explanation:

1) The two inner SELECTs (SELECT @potential_prime and SELECT @divisor) create two lists. Both of them contain numbers from 1 to 1000. The first list is list_of_potential_primes and the second is list_of_divisors.

2) Then, we iterate over the list of the potential primes (the outer SELECT) and for each number from this list we look for divisors (SELECT * FROM clause) that can divide the number without a reminder and are not equal to the number (WHERE MOD... clause). If at least one such divisor exists, the number is not prime and is not selected (WHERE NOT EXISTS... clause).
```



## Regular Expression

```mysql
Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.
```

```mysql
SELECT DISTINCT city FROM station
WHERE city REGEXP "^[aeiou].*";
```

More details are here: https://dataschool.com/how-to-teach-people-sql/how-regex-works-in-sql/

```mysql
Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.
```

```MYSQL
SELECT DISTINCT CITY FROM STATION 
WHERE RIGHT(CITY,1) IN ('a','i','e','o','u');
```

THERE IS ANOTHER FUNCTION `NOT IN`



## RIGHT FUNCTION & LEFT FUNCTION

The RIGHT() function extracts a number of characters from a string (starting from right).

The LEFT() function extracts a number of characters from a string (starting from left).

```MYSQL
RIGHT(string, number_of_chars)
LEFT(string, number_of_chars)
```

```
Query the Name of any student in STUDENTS who scored higher than  Marks. Order your output by the last three characters of each name. If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.
```

```MYSQL
SELECT NAME FROM STUDENTS
WHERE Marks > 75
ORDER BY RIGHT(Name,3), ID ASC;
```



## Case When

```mysql
Write a query identifying the type of each record in the TRIANGLES table using its three side lengths. Output one of the following statements for each record in the table:

Equilateral: It's a triangle with  sides of equal length.
Isosceles: It's a triangle with  sides of equal length.
Scalene: It's a triangle with  sides of differing lengths.
Not A Triangle: The given values of A, B, and C don't form a triangle.
```

```mysql
SELECT
CASE WHEN A + B > C AND B + C > A AND A + C > B THEN
CASE WHEN A = B AND B = C THEN
'Equilateral'
WHEN A = B OR B = C OR A = C THEN
'Isosceles'
ELSE 'Scalene'
END
ELSE 'Not A Triangle'
END
FROM TRIANGLES;
```



## concat

```mysql
Query an alphabetically ordered list of all names in OCCUPATIONS, immediately followed by the first letter of each profession as a parenthetical (i.e.: enclosed in parentheses). For example: AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S).
Query the number of ocurrences of each occupation in OCCUPATIONS. Sort the occurrences in ascending order, and output them in the following format:

There are a total of [occupation_count] [occupation]s.
where [occupation_count] is the number of occurrences of an occupation in OCCUPATIONS and [occupation] is the lowercase occupation name. If more than one Occupation has the same [occupation_count], they should be ordered alphabetically.

select concat(Name,'(',left(Occupation,1),')') as Name
from occupations
Order by Name;

select concat('There are a total of',' ',count(Occupation),' ',lower(occupation),'s.') as total
from occupations
group by occupation
order by total;
```



## Pivot

[Pivot](https://en.wikipedia.org/wiki/Pivot_table) the *Occupation* column in **OCCUPATIONS** so that each *Name* is sorted alphabetically and displayed underneath its corresponding *Occupation*. The output column headers should be *Doctor*, *Professor*, *Singer*, and *Actor*, respectively.

**Note:** Print **NULL** when there are no more names corresponding to an occupation.

```mysql
set @r1=0, @r2=0, @r3=0, @r4=0;
select min(Doctor), min(Professor), min(Singer), min(Actor)
from(
  select case when Occupation='Doctor' then (@r1:=@r1+1)
            when Occupation='Professor' then (@r2:=@r2+1)
            when Occupation='Singer' then (@r3:=@r3+1)
            when Occupation='Actor' then (@r4:=@r4+1) end as RowNumber,
    case when Occupation='Doctor' then Name end as Doctor,
    case when Occupation='Professor' then Name end as Professor,
    case when Occupation='Singer' then Name end as Singer,
    case when Occupation='Actor' then Name end as Actor
  from OCCUPATIONS
  order by Name
    ) temp
group by RowNumber;
```



# IF & Between

```mysql
SELECT IF(GRADE < 8, NULL, NAME), GRADE, MARKS
FROM STUDENTS JOIN GRADES
WHERE MARKS BETWEEN MIN_MARK AND MAX_MARK
ORDER BY GRADE DESC, NAME;
```



```mysql
SELECT h.hacker_id, h.name, COUNT(c.challenge_id) AS challenge_counter
FROM hackers h
JOIN challenges c
    ON h.hacker_id = c.hacker_id
GROUP BY h.hacker_id, h.name
HAVING challenge_counter IN (
    SELECT aux_table.counter
    FROM(
        SELECT hacker_id, COUNT(challenge_id) AS counter 
        FROM challenges
        GROUP BY hacker_id
        ORDER BY counter DESC
    ) AS aux_table
    GROUP BY aux_table.counter 
    HAVING COUNT(aux_table.counter) = 1
)
OR
challenge_counter =(
    SELECT MAX(aux_table.counter)
    FROM(
        SELECT hacker_id, COUNT(challenge_id) AS counter
        FROM challenges
        GROUP BY hacker_id
        ORDER BY counter DESC
    ) AS aux_table)
ORDER BY challenge_counter DESC, h.hacker_id ASC;
```





# With Function

```mysql
WITH totalSalary(Airline, total) as
    (SELECT Airline, sum(Salary)
    FROM Pilot
    GROUP BY Airline),
    airlineAverage(avgSalary) as 
    (SELECT avg(Salary)
    FROM Pilot )
SELECT Airline
FROM totalSalary, airlineAverage
WHERE totalSalary.total > airlineAverage.avgSalary;
```



# datediff

```mysql
SELECT Start_Date, MIN(End_Date)
FROM 
    (SELECT Start_Date FROM Projects WHERE Start_Date NOT IN (SELECT End_Date FROM Projects)) a,
    (SELECT end_date FROM PROJECTS WHERE end_date NOT IN (SELECT start_date FROM PROJECTS)) b
where start_date < end_date
GROUP BY start_date
ORDER BY datediff(start_date, MIN(end_date)) DESC, start_date;
```

