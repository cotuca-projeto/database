CREATE OR ALTER PROCEDURE taskFlow.spCompleteTask
    @username VARCHAR(50),
    @title VARCHAR(100)
AS 
BEGIN
    BEGIN TRY
        DECLARE
        @isCompleted CHAR,
        @task_id int,
        @user_id INT

        SELECT @user_id = user_id FROM taskFlow.users WHERE username = @username

        SELECT @task_id = task_id FROM taskFlow.task WHERE title = @title and user_id = @user_id

        SELECT @isCompleted = completed FROM taskFlow.task WHERE task_id = @task_id;

        IF @isCompleted = 'N'
            UPDATE taskFlow.task set completed = 'S' where task_id = @task_id and user_id = @user_id
        ELSE 
            UPDATE taskFlow.task set completed = 'N' where task_id = @task_id and user_id = @user_id
    END TRY
    BEGIN CATCH 
        DECLARE 
        @Mensagem nvarchar(2048)
        SET @Mensagem = 'Erro: '+Error_Message();
        THROW 51200, @Mensagem, 1
    END CATCH
END;

BEGIN TRY
EXEC taskFlow.spCompleteTask
    @username = 'johndoe', 
    @title = 'Nova Tarefa'
END TRY
BEGIN CATCH
    DECLARE 
    @Mensagem nvarchar(2048)
    SET @Mensagem = 'Erro: '+Error_Message();
    THROW 51200, @Mensagem, 1
END CATCH

select * from taskFlow.task