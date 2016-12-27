CREATE TABLE  "TRAINEE" 
   (	"TRAINEE_ID" NUMBER NOT NULL ENABLE, 
	"TRAINEE_NAME" VARCHAR2(50), 
	"MAJOR" VARCHAR2(50), 
	 PRIMARY KEY ("TRAINEE_ID") ENABLE
   ) ;
/
CREATE SEQUENCE TRAINEE_PK START WITH 1 INCREMENT BY 1;
/
   
CREATE OR REPLACE TRIGGER  "TRAINEE_PK_TRIGGER" 
BEFORE INSERT ON TRAINEE
FOR EACH ROW
DECLARE
  pk NUMBER;
BEGIN
  DBMS_OUTPUT.PUT_LINE('GENERATING PRIMARY KEY FOR TRAINEE...');
  
  SELECT TRAINEE_PK.NEXTVAL INTO pk
  FROM DUAL; -- generate PK from sequence
  
  :new.TRAINEE_ID := pk; -- replace whatever value in the insert stmt 
END;
/
ALTER TRIGGER  "TRAINEE_PK_TRIGGER" ENABLE;
/