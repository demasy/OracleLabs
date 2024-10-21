DECLARE
   L_RESULT        BOOLEAN;
   L_USERNAME      VARCHAR2 (32767);
   L_NEWPASSWORD   VARCHAR2 (32767) := 'Dem@sy';
 
   CURSOR EMPLOYEES
   IS
        SELECT FU.USER_NAME
          FROM FND_USER FU
         WHERE     1 = 1
               AND FU.END_DATE IS NULL
               AND FU.EMPLOYEE_ID IS NOT NULL
               AND UPPER (FU.USER_NAME) = UPPER ('AHMED.ELDEMASY')
     ORDER BY USER_ID;
BEGIN
   FOR I IN EMPLOYEES
   LOOP
      L_USERNAME := I.USER_NAME;
 
      L_RESULT :=
         APPS.FND_USER_PKG.CHANGEPASSWORD (USERNAME      => L_USERNAME,
                                           NEWPASSWORD   => L_NEWPASSWORD);
 
      IF (L_RESULT)
      THEN
         DBMS_OUTPUT.PUT_LINE ('The password was changed.');
      ELSE
         DBMS_OUTPUT.PUT_LINE ('The password was''s changed');
      END IF;
   END LOOP;
 
   COMMIT;
END;