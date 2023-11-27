CREATE OR ALTER PROCEDURE taskFlow.spSearchUser
    @infoN VARCHAR(100)
AS 
BEGIN
    DECLARE 
    @info VARCHAR(100) = '%' + @infoN + '%';
    --@infoData DATETIME = CONVERT(DATETIME, @infoN,126);

    IF EXISTS (SELECT * FROM taskFlow.vUsers WHERE user_id LIKE @info)
    BEGIN
        (SELECT * FROM taskFlow.vUsers WHERE user_id LIKE @info)
        RETURN;
    END ELSE

    IF EXISTS (SELECT * FROM taskFlow.vUsers WHERE first_name LIKE @info)
    BEGIN
        (SELECT * FROM taskFlow.vUsers WHERE first_name LIKE @info)
        RETURN;
    END ELSE

    IF EXISTS (SELECT * FROM taskFlow.vUsers WHERE last_Name LIKE @info)
    BEGIN
        (SELECT * FROM taskFlow.vUsers WHERE last_Name LIKE @info)
        RETURN;
    END ELSE

    IF EXISTS (SELECT * FROM taskFlow.vUsers WHERE username LIKE @info)
    BEGIN
        (SELECT * FROM taskFlow.vUsers WHERE username LIKE @info)
        RETURN;
    END ELSE

    IF EXISTS (SELECT * FROM taskFlow.vUsers WHERE email LIKE @info)
    BEGIN
       (SELECT * FROM taskFlow.vUsers WHERE email LIKE @info)
       RETURN;
    END

    --IF EXISTS (SELECT * FROM taskFlow.vUsers WHERE created_at LIKE @infoData)
    --BEGIN 
        --(SELECT * FROM taskFlow.vUsers WHERE created_at LIKE @infoData)
        --RETURN;
    --END
    
END

EXEC taskFlow.spSearchUser 
    @infoN = '2023-11-25'
