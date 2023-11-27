CREATE TRIGGER taskFlow.trTaskCreatedAt
ON taskFlow.task
FOR INSERT 
AS
BEGIN

    SET NOCOUNT ON;
    DECLARE 
    @task_id INT,
    @user_id INT

    SELECT @task_id = T.task_id, @user_id = I.user_id FROM taskflow.task T, INSERTED I WHERE T.task_id = I.task_id;
    
    INSERT INTO taskFlow.timeLog(user_id,task_id,updated_at,created_at) VALUES 
    (@user_id,@task_id,GETDATE(),GETDATE())
    
END

-- INSERE NA TABELA DE RELACIONAMENTO timeLog OD DADOS NECESSÁRIOS PARA RELACIONAR UMA TASK AO SEU RESPECTIVO USUÁRIO, ALÉM DE SUA DATA DE CREATE/UPDATE

INSERT INTO taskFlow.task(user_id,title,description,due_date,priority) VALUES (2,'NewTask','Descrição', '25/11/2023', 1);

SELECT * FROM taskFlow.timeLog
SELECT * FROM taskFlow.task


