/* Formatted on 11/15/2015 9:09:45 PM (QP5 v5.185.11230.41888) */
DECLARE
   L_DOCUMENT_PATH   VARCHAR2 (300);
BEGIN
   L_DOCUMENT_PATH := '/oracle/apps/fnd/framework/navigate/webui/customizations/org/204/NewHomePG';
   JDR_UTILS.DELETEDOCUMENT (P_DOCUMENT => L_DOCUMENT_PATH);
END;