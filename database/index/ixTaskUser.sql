

CREATE INDEX IxUsersEmail ON taskflow.users (email);

CREATE INDEX IxUsersUsername ON taskflow.users (username);

CREATE INDEX IxCategoryUserID ON taskflow.category (user_id);


CREATE INDEX IxTaskUserID ON taskflow.task (user_id);

CREATE INDEX IxTaskCategoryID ON taskflow.task (category_id);


CREATE INDEX IxtimeLogUserID ON taskflow.timeLog (user_id);

CREATE INDEX IxTimeLogTaskID ON taskflow.timeLog (task_id);
