CREATE VIEW taskFlow.VUserTasks AS
SELECT
    u.user_id,
    u.first_name,
    u.last_name,
    t.task_id,
    t.title,
    t.description,
    t.due_date,
    t.completed,
    t.priority
FROM taskflow.users AS u
LEFT JOIN taskflow.task AS t ON u.user_id = t.user_id;
