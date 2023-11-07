CREATE OR ALTER PROCEDURE taskFlow.spAddUser
    @first_name VARCHAR(50),
    @last_name VARCHAR(50),
    @username VARCHAR(50),
    @email VARCHAR(100),
    @password_hash CHAR(64),
    @profile_image IMAGE
AS
BEGIN
    BEGIN TRY
        INSERT INTO taskflow.users (first_name, last_name, username, email, password_hash, profile_image)
        VALUES (@first_name, @last_name, @username, @email, @password_hash, @profile_image)
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
EXEC taskFlow.spAddUser
     @first_name = 'John',
    @last_name = 'Doe',
    @username = 'johndoe',
    @email = 'johndoe@example.com',
    @password_hash = 'hashed_password',
    @profile_image = NULL;  
END TRY
begin catch
	declare @Mensagem nvarchar(2048)
	Select @Mensagem = Error_Message();
	print 'Catchou:'+@mensagem
end catch

select * from taskFlow.users

    
 

