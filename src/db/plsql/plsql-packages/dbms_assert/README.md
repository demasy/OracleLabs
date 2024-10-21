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
    USER_NAME        VARCHAR2 (20 CHAR),
    EMAIL            VARCHAR2 (100 BYTE),
    CREATION_DATE    DATE
);
```

```sql
SET DEFINE OFF;

DELETE FROM XXD.XXD_USERS;

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

```sql
CREATE OR REPLACE PACKAGE XXD.XXD_SQL_INJECTION_PKG
IS
    PROCEDURE GET_USER_REC (P_USER_NAME IN VARCHAR2, X_EMAIL OUT VARCHAR2);
END XXD_SQL_INJECTION_PKG;
/

CREATE OR REPLACE PACKAGE BODY XXD.XXD_SQL_INJECTION_PKG
IS
    PROCEDURE GET_USER_REC (P_USER_NAME IN VARCHAR2, X_EMAIL OUT VARCHAR2)
    IS
        L_QUERY_STAT   VARCHAR2 (4000);
    BEGIN
        L_QUERY_STAT :=
               'SELECT EMAIL FROM XXD.XXD_USERS WHERE 1 = 1 AND USER_NAME ='''
            || P_USER_NAME
            || '''';
        DBMS_OUTPUT.PUT_LINE ('Query=> ' || L_QUERY_STAT);

        EXECUTE IMMEDIATE L_QUERY_STAT
            INTO X_EMAIL;

        DBMS_OUTPUT.PUT_LINE ('X_EMAIL=> ' || X_EMAIL);
    END GET_USER_REC;
END XXD_SQL_INJECTION_PKG;
/
```

#### Call procedure without SQL injection

```sql
DECLARE
    l_USER_NAME   VARCHAR2 (32767);
    L_EMAIL       VARCHAR2 (32767);
BEGIN
    l_USER_NAME := 'demasy';

    XXD.XXD_SQL_INJECTION_PKG.GET_USER_REC (P_USER_NAME   => l_USER_NAME,
                                            X_EMAIL       => L_EMAIL);


    DBMS_OUTPUT.PUT_LINE ('User e-Mail=> ' || L_EMAIL);
END;
```
```
Query=> SELECT EMAIL FROM XXD.XXD_USERS WHERE 1 = 1 AND USER_NAME ='demasy'
X_EMAIL=> demasy@demasy.io
User e-Mail=> demasy@demasy.io
```


#### Example of statement modification

```sql
DECLARE
    l_USER_NAME   VARCHAR2 (32767);
    L_EMAIL       VARCHAR2 (32767);
BEGIN
    l_USER_NAME := 'ahmed '' OR USER_NAME=''merihan''--';

    XXD.XXD_SQL_INJECTION_PKG.GET_USER_REC (P_USER_NAME   => l_USER_NAME,
                                            X_EMAIL       => L_EMAIL);


    DBMS_OUTPUT.PUT_LINE ('User e-Mail=> ' || L_EMAIL);
END;
```

```
Query=> SELECT EMAIL FROM XXD.XXD_USERS WHERE 1 = 1 AND USER_NAME ='ahmed ' OR USER_NAME='merihan'--'
X_EMAIL=> merihan@demasy.io
User e-Mail=> merihan@demasy.io
```
