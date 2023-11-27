
CREATE OR ALTER TRIGGER taskFlow.trUserUpdatedAt
ON taskflow.users
FOR UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @user_id INT
    SELECT @user_id = user_id FROM INSERTED

    UPDATE taskflow.timeLog
    SET updated_at = GETDATE()
    WHERE user_id = @user_id
END

-- ATUALIZA NA TABELA DE RELACIONAMENTO timeLog A DATA DE ATUALIZAÇÃO DOS DADOS DO USER

SELECT * FROM taskFlow.users

EXEC taskFLow.spUpdateUser 
    @user_id = 3
    @first_name = 'Jane', 
    @last_name = 'Smithhhhh', 
    @username = 'janesmith',   
    @email = 'Teste'

SELECT * FROM taskFlow.timeLog;