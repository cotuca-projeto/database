CREATE OR ALTER PROCEDURE taskFlow.spUpdateUser
    @user_id INT,
    @first_name VARCHAR(50), 
    @last_name VARCHAR(50), 
    @username VARCHAR(50),   
    @email VARCHAR(100) 
AS 
BEGIN 
    BEGIN TRAN;

    BEGIN TRY
        UPDATE taskflow.users SET first_name = @first_name, last_name = @last_Name, username = @username, email = @email WHERE user_id = @user_id;
        COMMIT TRAN;
    END TRY
    BEGIN CATCH
        ROLLBACK TRAN;
        THROW 51000, 'Update Error!', 1

    END CATCH
END

SELECT * FROM taskFlow.users

EXEC taskFLow.spUpdateUser 
    @user_id = 3
    @first_name = 'Jane', 
    @last_name = 'Smithhhhh', 
    @username = 'janesmith',   
    @email = 'Teste'