CREATE OR ALTER PROCEDURE taskFlow.spAddTask
    @username VARCHAR(50),
    @title VARCHAR(100),
    @description VARCHAR(MAX),
    @priority TINYINT,
    @category_id INT
    -- ,@idTask int OUTPUT
AS
BEGIN
    BEGIN TRY
        DECLARE 
        @user_id VARCHAR(50)

        SELECT @user_id = user_id from taskFlow.users where username = @username;
        
        INSERT INTO taskflow.task (user_id, title, description,  priority, category_id)
        VALUES (@user_id, @title, @description, @priority, @category_id)

        -- SET @idTask = @@IDENTITY
    END TRY
    BEGIN CATCH 
        DECLARE 
        @Mensagem nvarchar(2048)
        SET @Mensagem = 'Erro: '+Error_Message();
        THROW 51200, @Mensagem, 1
    END CATCH
END


-- Execute
BEGIN TRY
-- DECLARE @idTask INT OUTPUT
EXEC taskFlow.spAddTask
    @username = 'johndoe', 
    @title = 'Nova Tarefa',
    @description = 'Descrição da nova tarefa',
    @priority = 2, 
    @category_id = Null
    -- @idTask; 

    -- PRINT @idTask;
END TRY
begin catch
	declare @Mensagem nvarchar(2048)
	Select @Mensagem = Error_Message();
	print 'Catchou:'+@mensagem
end catch



select * from taskFlow.task



