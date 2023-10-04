-- Criação de um esquema chamado "taskFlow" para organizar as tabelas
CREATE SCHEMA taskFlow;

-- Tabela de informações do usuário
CREATE TABLE taskFlow.users (
  user_id INT PRIMARY KEY NOT NULL,     -- Identificador único do usuário
  first_name VARCHAR(50) NOT NULL,      -- Nome do usuário (não pode ser nulo)
  last_name VARCHAR(50) NOT NULL,       -- Sobrenome do usuário (não pode ser nulo)
  username VARCHAR(50) NOT NULL,   
  email VARCHAR(100) NOT NULL,          -- Endereço de email do usuário (não pode ser nulo)
  password_hash CHAR(64) NOT NULL,     -- Hash da senha do usuário (não pode ser nulo)
  created_at DATETIME NOT NULL,         -- Data e hora de criação do usuário (não pode ser nulo)
  updated_at DATETIME NOT NULL,
  profle_image IMAGE
);

-- Tabela de informações de categorias
CREATE TABLE taskFlow.category (
  category_id INT PRIMARY KEY NOT NULL,  -- Identificador único da categoria
  user_id INT NOT NULL,                  -- ID do usuário proprietário da categoria (não pode ser nulo)
  name VARCHAR(50) NOT NULL,             -- Nome da categoria (não pode ser nulo)
  FOREIGN KEY (user_id) REFERENCES taskFlow.users(user_id) -- Chave estrangeira para o usuário
);

-- Tabela de informações de tarefas
CREATE TABLE taskFlow.task (
  task_id INT PRIMARY KEY NOT NULL,     -- Identificador único da tarefa
  user_id INT NOT NULL,                -- ID do usuário responsável pela tarefa (não pode ser nulo)
  title VARCHAR(100) NOT NULL,         -- Título da tarefa (não pode ser nulo)
  description VARCHAR(MAX),            -- Descrição da tarefa
  due_date DATETIME2 NOT NULL,         -- Data e hora de vencimento da tarefa (não pode ser nulo)
  created_at DATETIME2 NOT NULL,       -- Data e hora de criação da tarefa (não pode ser nulo)
  updated_at DATETIME NOT NULL,
  completed BIT NOT NULL,             -- Indicador de tarefa concluída (não pode ser nulo)
  priority TINYINT NOT NULL,          -- Prioridade da tarefa (não pode ser nulo)
  category_id INT,                    -- ID da categoria à qual a tarefa pertence (pode ser nulo)
  FOREIGN KEY (user_id) REFERENCES taskFlow.users(user_id),       -- Chave estrangeira para o usuário
  FOREIGN KEY (category_id) REFERENCES taskFlow.category(category_id) -- Chave estrangeira para a categoria
);


