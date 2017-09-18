-------------------------------------------------------------------------------------------
-- ACCOUNT
-------------------------------------------------------------------------------------------
CREATE TABLE ACCOUNT
(
  ACCOUNT_ID        INT             NOT NULL AUTO_INCREMENT PRIMARY KEY,
  ACCOUNT_TYPE		VARCHAR(200)	NOT NULL,
  CREATION_DATE		TIMESTAMP		NOT NULL,
  BALANCE			INT			NOT NULL
);