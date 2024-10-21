# DBMS_ASSERT

**DBMS_ASSERT** is a built-in Oracle PL/SQL package designed to protect against SQL injection by validating and cleaning up user inputs, especially in dynamic SQL. It includes a set of functions that check whether inputs are valid schema names, object names, SQL identifiers, and literals, ensuring only legitimate values are used in SQL queries. This helps safeguard the database from malicious input and ensures data integrity.

<br>

## SQL Injection
SQL injection is a critical security vulnerability in which attackers manipulate SQL queries by inserting malicious code into an application's input fields or parameters. If the application fails to validate or sanitize these inputs properly, the attacker can modify the SQL queries in harmful ways. This can enable them to access sensitive data, alter or delete records, bypass authentication, or even gain control of the database.

### SQL Injection Techniques
- Statement Modification (Oracle)
- Statement Injection (Oracle)
- Data Type Conversion (Oracle)
- Classic SQL Injection
- Union-based SQL Injection
- Error-based SQL Injection
- Blind SQL Injection
- Time-based Blind SQL Injection
- Second-order SQL Injection
- Out-of-band SQL Injection

<be>

 ## Demo

```sql
CREATE TABLE XXD.XXD_USERS
(
    USER_ID          NUMBER,
    USER_NAME        VARCHAR2 (20),
    CREATION_DATE    DATE
);
```

```sql
SET DEFINE OFF;

INSERT INTO XXD.XXD_USERS (USER_ID, USER_NAME, CREATION_DATE)
     VALUES (1, 'demasy', TO_DATE ('11/13/1986', 'MM/DD/YYYY'));

INSERT INTO XXD.XXD_USERS (USER_ID, USER_NAME, CREATION_DATE)
     VALUES (2, 'merihan', TO_DATE ('11/13/1986', 'MM/DD/YYYY'));

INSERT INTO XXD.XXD_USERS (USER_ID, USER_NAME, CREATION_DATE)
     VALUES (3, 'omar', TO_DATE ('11/13/1986', 'MM/DD/YYYY'));

INSERT INTO XXD.XXD_USERS (USER_ID, USER_NAME, CREATION_DATE)
     VALUES (4, 'line', TO_DATE ('11/13/1986', 'MM/DD/YYYY'));

INSERT INTO XXD.XXD_USERS (USER_ID, USER_NAME, CREATION_DATE)
     VALUES (5, 'nada', TO_DATE ('11/13/1986', 'MM/DD/YYYY'));

COMMIT;
```
