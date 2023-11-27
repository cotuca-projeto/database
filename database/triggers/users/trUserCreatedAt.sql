CREATE TRIGGER taskFlow.trUserCreatedAt
ON taskflow.users
FOR INSERT
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @user_id INT
	SELECT @user_id = I.user_id FROM INSERTED I
 

    INSERT INTO taskflow.timeLog(user_id,updated_at,created_at) VALUES 
    (@user_id, GETDATE(),GETDATE())
END;


-- INSERE NA TABELA DE RELACIONAMENTO timeLog OD DADOS NECESSÁRIOS PARA RELACIONAR UM USUÁRIO A SUA RESPECTIVA DATA DE CREATE/UPDATE

EXEC taskFlow.spAddUser
    @first_name = 'JohHHn',
    @last_name = 'DoeEE',
    @username = 'johndoeEE',
    @email = 'johndoeEE@example.com',
    @password_hash = 'hashed_password',
    @profile_image = NULL; 

SELECT * FROM taskFlow.timeLog
SELECT * FROM taskFlow.task


