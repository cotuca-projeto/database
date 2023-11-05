CREATE TRIGGER taskFlow.trUserCreatedAt
ON taskflow.users
FOR INSERT
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @user_id INT
	SELECT @user_id = I.user_id FROM INSERTED I
 

    INSERT INTO taskflow.timeLog(user_id,updated_at,created_at) VALUES 
    (@user_id, GETDATE(),GETDATE())
END;



