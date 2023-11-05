CREATE VIEW taskFlow.TimeLogInfo AS
SELECT
    tl.id AS time_log_id,
    u.user_id,
    u.first_name,
    u.last_name,
    t.task_id,
    t.title AS task_title,
    tl.updated_at,
    tl.created_at
FROM taskflow.timeLog AS tl
LEFT JOIN taskflow.users AS u ON tl.user_id = u.user_id
LEFT JOIN taskflow.task AS t ON tl.task_id = t.task_id;
