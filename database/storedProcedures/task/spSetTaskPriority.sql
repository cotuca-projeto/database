-- Crie a Stored Procedure
CREATE OR ALTER PROCEDURE taskFlow.spSetTaskPriority
  @task_id INT
AS
BEGIN
    DECLARE 
    @priority BIT

    IF NOT EXISTS (SELECT 1 FROM taskflow.task WHERE task_id = @task_id)
    BEGIN
        THROW 51000, 'Task Inexistente.', 1; 
       
    END

    SELECT @priority = priority FROM taskFlow.task WHERE task_id = @task_id;
        IF @priority = 0
            UPDATE taskflow.task
            SET priority = 1
            WHERE task_id = @task_id;
        ELSE
            UPDATE taskflow.task
            SET priority = 0
            WHERE task_id = @task_id;
END;


-- Execute
EXEC taskFlow.spSetTaskPriority
    @task_id = 2; 


  
