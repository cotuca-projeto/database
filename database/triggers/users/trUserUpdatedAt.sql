
CREATE OR ALTER TRIGGER taskFlow.trUserUpdatedAt
ON taskflow.users
FOR UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @user_id INT
    SELECT @user_id = user_id FROM INSERTED

    UPDATE taskflow.timeLog
    SET updated_at = GETDATE()
    WHERE user_id = @user_id
END