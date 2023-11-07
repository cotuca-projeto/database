CREATE OR ALTER PROCEDURE taskFlow.spAddCategory
    @username VARCHAR(50),
    @name VARCHAR(50)

AS 
BEGIN
    BEGIN TRY
    DECLARE
    @user_id INT

    SELECT @user_id = user_id FROM taskFlow.users WHERE username = @username

    INSERT INTO taskFlow.category (user_id, name) VALUES
    (@user_id, @name)

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
EXEC taskFlow.spAddCategory
    @username = 'johndoe', 
    @name = 'Matemática' 
END TRY
begin catch
	declare @Mensagem nvarchar(2048)
	Select @Mensagem = Error_Message();
	print 'Catchou:'+@mensagem
end catch