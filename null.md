#NULL

---
!History Of NULL

https://en.wikipedia.org/wiki/Null_(SQL)


---
#ω

^
The Greek lowercase omega (ω) character is used to represent Null in database theory.

---
#NULL IS NOT 0

---
#How Many Beers is Kamil Holding?

---
![inline](images/kamil1.jpg)

---
![inline](images/kamil0.jpeg)

---
![inline](images/kamil_null.jpg)


---
#Comparisons

* `NULL = NULL` (always FALSE)
* `NULL <> NULL` (always FALSE)

---
#Comparisons

* `IS NULL`
* `IS NOT NULL`

---


`SELECT * FROM t`
` `
` WHERE (x = 10) OR NOT (x = 10)`
`OR (x IS NULL)`

---
#Operations

* `NULL + 1 `
* `NULL - 1`
* `NULL * 2`
* `NULL / 2`
* `NULL / 0`

---
#String Concatentation

* `'PIVA' || NULL = 'PIVA'`[^*]

[^*]: Oracle Database

---
#Boolean Logic


---
#⠀ 

|`NOT (!)` |             |
|-----------|------------|
|`FALSE(❌)` | `(!❌)=✅` |
|`TRUE (✅)` | `(!✅)=❌` |
|            |           |           


---
#⠀ 

|`AND (&&)` | `FALSE(❌)` |`TRUE (✅)` | |
|-----------|----------|----------- |---| 
|`FALSE(❌)` | `(❌&&❌)=❌` | `(❌&&✅)=❌` |   |
|`TRUE (✅)` | `(✅&&❌)=❌` | `(✅&&✅)=✅` |   |
|            |              |              |   |

---
#⠀

|`AND (&&)`   |`FALSE(❌)`  |`TRUE (✅)`      | `NULL (⚪)`|
|-------------|-------------|---------------|----------- | 
|`FALSE(❌)` |`(❌&&❌)=❌`  | `(❌&&✅)=❌` |`(❌&&⚪)=❌`  |
|`TRUE (✅)`  |`(✅&&❌)=❌` | `(✅&&✅)=✅` |`(✅&&⚪)=⚪`  |
|`NULL (⚪)`  |`(⚪&&❌)=❌` | `(⚪&&✅)=⚪` | `(⚪&&⚪)=⚪` |


---
#⠀

|```OR (¦¦)``` |`FALSE(❌)`  |`TRUE (✅)`    |          |
|--------------|-------------|---------------|---------| 
| `FALSE(❌)`  |`(❌¦¦❌)=❌` | `(❌¦¦✅)=✅` |   |
| `TRUE (✅)`  |`(✅¦¦❌)=✅` | `(✅¦¦✅)=✅` |   |
|              |                |                |   |

---
#⠀

|`OR (¦¦)`    |`FALSE(❌)`  |`TRUE (✅)`    |`NULL (⚪)`     |
|-------------|-------------|--------------|----------------| 
|`FALSE(❌)`  |`(❌¦¦❌)=❌` | `(❌¦¦❌)=❌` |`(❌¦¦⚪)=❌` |
|`TRUE (✅)`  |`(✅¦¦✅)=✅` | `(✅¦¦❌)=❌` |`(✅¦¦⚪)=⚪` |
|`NULL (⚪)`  |`(⚪¦¦✅)=⚪` | `(⚪¦¦❌)=❌` |`[⚪¦¦⚪]=⚪` |   



---


```
┌───────────┬───────────┬───────────┐
│ ✅ AND ✅: ✅│ ✅ AND ❌: ❌│ ✅ AND ⚪: ⚪│
├───────────┼───────────┼───────────┤
│ ❌ AND ✅: ❌│ ❌ AND ❌: ❌│ ❌ AND ⚪: ❌│
├───────────┼───────────┼───────────┤
│ ⚪ AND ✅: ⚪│ ⚪ AND ❌: ❌│ ⚪ AND ⚪: ⚪│
└───────────┴───────────┴───────────┘```
---

 `(FALSE OR NULL) => NULL`
 `(TRUE AND NULL) => NULL`
 `(NOT NULL) => NULL`

---
#Boolean Logic

* `(FALSE AND NULL) => FALSE`
* `(TRUE OR NULL) => TRUE`

---

COALESCE and NVL functions: These are important for handling NULL values in queries and could be worth mentioning.

---
#COALESCE

COALESCE(expression1, expression2, ..., expressionN)


---
#NVL

NULL(expression1, expression2, ..., expressionN)

---

```
SQL> create table t (c NUMBER);

Table T created.

SQL> insert into t values (NULL);

1 row inserted.

SQL> select count(*) from t;

   COUNT(*) 
___________ 
          1 
```

^
By default columns can accept NULL


---
```
SQL> create table t(c number not null);

Table T created.

SQL> insert into t values (null);

SQL Error: ORA-01400: cannot insert NULL into ("PDBADMIN"."T"."C")
```

---
```
SQL> create table t (
  2      c1 number constraint nn_c1 not null,               -- User Defined Name
  3      c2 number not null,                                -- System Generated Name = SYS_C999999
  4      c3 number constraint nn_c3 check (c3 is not null), -- DON'T DO THIS!!!
  5      c4 number check (c4 is not null)                   -- DON'T DO THIS!!!
  6* );

Table T created.


SQL> select constraint_name, search_condition from dba_constraints where table_name = 'T';

CONSTRAINT_NAME    SEARCH_CONDITION    
__________________ ___________________ 
NN_C1              "C1" IS NOT NULL    
SYS_C008452        "C2" IS NOT NULL    
NN_C3              c3 is not null      
SYS_C008454        c4 is not null    


SQL> select column_name, nullable from dba_tab_cols where table_name = 'T';

COLUMN_NAME    NULLABLE    
______________ ___________ 
C1             N           
C2             N           
C3             Y           
C4             Y           
```

---
^
drop table t;

create table t (
    c1 number constraint nn_c1 not null,               -- User Defined Name
    c2 number not null,                                -- System Generated Name = SYS_C999999
    c3 number constraint nn_c3 check (c3 is not null), -- DON'T DO THIS!!!
    c4 number check (c4 is not null)                   -- DON'T DO THIS!!!
);

select column_name, nullable from dba_tab_cols where table_name = 'T';

---

Check if column nullable from nullable field in dba_tab_columns

(Possible from dba_constraints but icky)


---
!Storage Efficiency with Trailing Nulls

---
!Null Optimization for Columns Above 255

---
#Adding a Primary Key

Component columns => NULLABLE='Y' 

^
A Specific NOT NULL constraint is created)

---
When you delete a primary key then the column becomes NULLABLE (unless there is a specific NOT NULL constraint)

---
#Primary Keys Best Practice

Declare Primary Key Columns as "NOT NULL" explicitly

^
Or dropping PK will change the nullability

---
#Foreign Constraints

Essentially requires record in parent table to be present in child table.
However it does allow for NULL values
Hence define NOT NULL if that's what's needed

---
#Unique Constraints

Unique constraints can allow NULLs.
Unique constraints can allow rows with multiple NULL values

---
#Database Statistics

Unlike other states Oracle knows exactly how many NULL values for a column

NUM_DISTINCT does not include NULL


---
#Indexes

If all indexed fields are null, no index entry
if individual cop
Null Index Entries

   1 - access("ID1"=1 AND "ID2" IS NULL)         


---
#Usage of this                                       

```CREATE INDEX idx_status_n ON orderstatus ((CASE WHEN status = 'N' THEN 'N' END));```
CREATE INDEX idx_status_n2 ON orderstatus (DECODE(status, 'N', 1, NULL));



---
#Law of excluded middle

^
In logic, the law of excluded middle or the principle of excluded middle states that for every proposition, either this proposition or its negation is true.

---
#The Liars Paradox
"I am lying".

---

SELECT * FROM stuff;

SELECT * FROM stuff WHERE ( x = 10 ) OR NOT ( x = 10 );

SELECT * FROM stuff WHERE ( x = 10 ) OR NOT ( x = 10 ) OR X IS NULL;


---
#QUerying

COUNT(*) -- ALL ROWS (including NULLs)
COUNT(column_name) Excludes rows where col IS NULL

---
SUM() ignores NULL values if all values NULL, then returns NULL

---
AVG():
Excludes NVL in numerator and denominator
SUM(column) / COUNT(column)

---
DISTINCT

NULLs 


---
#Odds and Sodds

- String Concatenation
    1. Oracle ``'X' || NULL`` = 'X'"
    1. Other Databases ``'X' || NULL`` = NULL"