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

