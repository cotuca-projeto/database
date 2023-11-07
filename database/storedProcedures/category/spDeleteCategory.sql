CREATE OR ALTER PROCEDURE taskFlow.spDeleteCategory
  @category_id INT
AS
BEGIN
  DELETE FROM taskflow.task
  WHERE category_id = @category_id;

  DELETE FROM taskflow.category
  WHERE category_id = @category_id;
END

-- Execute
