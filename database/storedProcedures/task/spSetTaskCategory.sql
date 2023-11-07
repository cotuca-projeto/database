CREATE OR ALTER PROCEDURE taskFlow.spSetTaskCategory
    @username VARCHAR(50),
    @title VARCHAR(100),
    @newCategory int
AS 
BEGIN
    BEGIN TRY
    IF EXISTS (SELECT 1 FROM taskFlow.category WHERE category_id = @newCategory or @newCategory = Null)
        DECLARE
        @task_id int,
        @user_id INT
        SELECT @user_id = user_id FROM taskFlow.users WHERE username = @username

        SELECT @task_id = task_id FROM taskFlow.task WHERE title = @title and user_id = @user_id

        UPDATE taskFlow.task SET category_id = @newCategory WHERE task_id = @task_id and user_id = @user_id
    END TRY
    BEGIN CATCH 
        DECLARE 
        @Mensagem nvarchar(2048)
        SET @Mensagem = 'Erro: '+Error_Message();
        THROW 51200, @Mensagem, 1
    END CATCH
END


-- Execute
begin try
	exec taskFlow.spSetTaskCategory
        @username = 'johndoe', 
        @title = 'Nova Tarefa',
        @newCategory = 1
end try
begin catch
	declare @Mensagem nvarchar(2048)
	Select @Mensagem = Error_Message();
	print 'Catchou:'+@mensagem
end catch

SELECT * FROM taskFlow.task