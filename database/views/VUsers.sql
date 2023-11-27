CREATE OR ALTER VIEW taskFlow.vUsers AS 
SELECT
    U.user_id,
    U.first_name,
    U.last_name,
    U.username,
    U.email,
    TL.created_at,
    TL.updated_at
FROM taskFlow.users U 
    INNER JOIN taskFlow.timeLog TL ON TL.user_id = u.user_id AND TL.task_id is NULL;


SELECT * FROM taskFlow.vUsers WHERE 