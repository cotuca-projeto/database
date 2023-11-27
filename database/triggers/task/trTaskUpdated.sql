CREATE TRIGGER taskFlow.trTaskUpdatedAt
ON taskFlow.task
FOR UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE 
    @user_id INT,
    @task_id INT
    
    SELECT @user_id = user_id FROM INSERTED
    SELECT @task_id = task_id FROM DELETED

    UPDATE taskflow.timeLog
    SET updated_at = GETDATE()
    WHERE task_id = @task_id and user_id = @user_id
    
END

-- ATUALIZA NA TABELA DE RELACIONAMENTO timeLog A DATA DE ATUALIZAÇÃO DOS DADOS DA TASK

SELECT * FROM taskFlow.task

UPDATE taskFlow.task SET title = "TESTE" WHERE task_id = 12;

SELECT * FROM taskFlow.timeLog tl WHERE task_id = 12; 
