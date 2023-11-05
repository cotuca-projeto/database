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
