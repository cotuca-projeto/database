
CREATE TRIGGER taskFlow.trCheckDueDate
ON taskflow.task
AFTER INSERT, UPDATE
AS
BEGIN
  SET NOCOUNT ON;

  IF EXISTS (
    SELECT 1
    FROM inserted i
    INNER JOIN taskflow.task t ON i.task_id = t.task_id
    WHERE i.due_date IS NOT NULL AND i.due_date < GETDATE()
  )
  BEGIN
    THROW 51000, 'A data de vencimento (due_date) não pode ser anterior à data atual.', 1;
    ROLLBACK TRANSACTION;
  END
END;


--CHECA SE A DATA DE ENTREGA É INFERIOR À DATA ATUAL


select * from taskFlow.task

INSERT INTO taskFlow.task(user_id,title,description,due_date,priority) VALUES (2,'NewTask','Descrição', '25/11/2023', 1);
