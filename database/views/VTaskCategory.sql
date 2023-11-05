CREATE VIEW taskFlow.VTaskCategory AS
SELECT
    t.task_id,
    t.title,
    t.description,
    t.due_date,
    t.completed,
    t.priority,
    c.category_id,
    c.name AS category_name
FROM taskflow.task AS t
LEFT JOIN taskflow.category AS c ON t.category_id = c.category_id;
