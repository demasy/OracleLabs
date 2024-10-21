# DBMS_ASSERT

**DBMS_ASSERT** is a built-in Oracle PL/SQL package designed to protect against SQL injection by validating and cleaning up user inputs, especially in dynamic SQL. It includes a set of functions that check whether inputs are valid schema names, object names, SQL identifiers, and literals, ensuring only legitimate values are used in SQL queries. This helps safeguard the database from malicious input and ensures data integrity.

<br>

## SQL Injection
SQL injection is a critical security vulnerability in which attackers manipulate SQL queries by inserting malicious code into an application's input fields or parameters. If the application fails to validate or sanitize these inputs properly, the attacker can modify the SQL queries in harmful ways. This can enable them to access sensitive data, alter or delete records, bypass authentication, or even gain control of the database.
