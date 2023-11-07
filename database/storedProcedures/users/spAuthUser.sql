CREATE OR ALTER PROCEDURE taskFlow.spAuthUser
  @inputUsername VARCHAR(50),
  @inputPasswordHash CHAR(64),
  @return bit OUTPUT
AS
BEGIN
  SET NOCOUNT ON;
  DECLARE @result INT;

  SELECT @result = COUNT(*)
  FROM taskflow.users
  WHERE username = @inputUsername
    AND password_hash = @inputPasswordHash;

  IF @result = 1
    SET @return = 1;
  ELSE
     SET @return = 0;
END;


-- Execute
DECLARE @Username VARCHAR(50);
DECLARE @PasswordHash CHAR(64);
DECLARE @returnValue BIT;
SET @Username = 'johndoe'; 
SET @PasswordHash = 'hashed_password'; 

EXEC taskFlow.spAuthUser
  @Username,
  @PasswordHash,
  @returnValue OUTPUT;

PRINT 'Resultado da autenticação: ' + CAST(@returnValue AS VARCHAR);
