CREATE OR ALTER PROCEDURE taskFlow.spDeleteUser
  @user_id INT
AS
BEGIN
    BEGIN TRY
        IF EXISTS(SELECT 1 FROM taskFlow.users WHERE user_id = @user_id)
        BEGIN
            DELETE FROM taskflow.timeLog
            WHERE user_id = @user_id;

            DELETE FROM taskflow.task
            WHERE user_id = @user_id;

            DELETE FROM taskflow.category
            WHERE user_id = @user_id;

            DELETE FROM taskflow.users
            WHERE user_id = @user_id;
        END
        ELSE
        THROW 51000, 'Usuário Inexistente.', 1; 
    END TRY
    BEGIN CATCH 
        DECLARE 
        @Mensagem nvarchar(2048)
        SET @Mensagem = 'Erro: '+Error_Message();
        THROW 51200, @Mensagem, 1
        ROLLBACK TRANSACTION;
    END CATCH
END


-- Execute
BEGIN TRY
EXEC taskFlow.spDeleteUser
    @user_id = 2
END TRY
begin catch
	declare @Mensagem nvarchar(2048)
	Select @Mensagem = Error_Message();
	print @mensagem
end catch

SELECT * from taskFlow.users
