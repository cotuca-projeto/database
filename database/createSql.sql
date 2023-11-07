CREATE SCHEMA taskFlow;

-- Tabela users
CREATE TABLE taskflow.users (
  user_id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  username VARCHAR(50) UNIQUE  NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  password_hash CHAR(64) UNIQUE NOT NULL,
  profile_image IMAGE,
 
);

-- Tabela category
CREATE TABLE taskflow.category (
  category_id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
  user_id INT NOT NULL,
  name VARCHAR(50) NOT NULL,

  CONSTRAINT FK_CategoryUser FOREIGN KEY (user_id) 
    REFERENCES taskflow.users (user_id) ON DELETE CASCADE
);

-- Tabela task
CREATE TABLE taskflow.task (
  task_id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
  user_id INT NOT NULL,
  title VARCHAR(100) NOT NULL,
  description VARCHAR(MAX),
  due_date DATETIME, -- Se o usuário quiser definir uma data limite para completar a task
  completed CHAR DEFAULT('N') NOT NULL, -- Sempre será 'N' até que seja completado(update)
  priority TINYINT DEFAULT(0) NOT NULL, -- Se for 1 terá prioridade na tela
  category_id INT,

  CONSTRAINT FK_TaskCategory FOREIGN KEY (category_id) 
    REFERENCES taskflow.category (category_id) ON DELETE CASCADE,
  CONSTRAINT FK_TaskUsers FOREIGN KEY (user_id)
     REFERENCES taskflow.users (user_id) 
);

-- Tabela timeTable
CREATE TABLE taskflow.timeLog (
  id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
  user_id INT NOT NULL,
  task_id INT,
  updated_at DATETIME DEFAULT GETDATE() NOT NULL,
  created_at DATETIME DEFAULT GETDATE() NOT NULL,

  CONSTRAINT FK_TimeLogUsers FOREIGN KEY (user_id) 
    REFERENCES taskflow.users (user_id),
  CONSTRAINT FK_TimeLogTask FOREIGN KEY (task_id) 
    REFERENCES taskflow.task (task_id) ON DELETE CASCADE
);


select * from taskFlow.task
select * from taskFlow.category
select * from taskFlow.users
select * from taskFlow.timeLog