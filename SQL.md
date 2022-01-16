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

**Select the second highest value**

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
