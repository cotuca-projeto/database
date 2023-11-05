CREATE OR ALTER PROCEDURE taskFlow.spDeleteTask
    @task_id int
AS 
BEGIN 
    BEGIN TRY
        DELETE FROM taskflow.timeLog
        WHERE task_id = @task_id;
        
        DELETE FROM taskflow.task
        WHERE task_id = @task_id;
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
EXEC taskFlow.spDeleteTask
    @idTask = 1; 
END TRY
begin catch
	declare @Mensagem nvarchar(2048)
	Select @Mensagem = Error_Message();
	print 'Catchou:'+@mensagem
end catch
