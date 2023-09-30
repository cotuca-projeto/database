-- Inserindo dados na tabela taskFlow.users
INSERT INTO taskFlow.users (user_id, first_name, last_name, email, password_hash, created_at)
VALUES
  (1, 'John', 'Doe', 'john.doe@example.com', 'hashed_password_1', '2023-09-30T10:00:00'),
  (2, 'Jane', 'Smith', 'jane.smith@example.com', 'hashed_password_2', '2023-09-30T11:00:00');

-- Inserindo dados na tabela taskFlow.category
INSERT INTO taskFlow.category (category_id, user_id, name)
VALUES
  (1, 1, 'Trabalho'),
  (2, 1, 'Pessoal'),
  (3, 2, 'Estudos');

-- Inserindo dados na tabela taskFlow.task
INSERT INTO taskFlow.task (task_id, user_id, title, description, due_date, created_at, completed, priority, category_id)
VALUES
  (1, 1, 'Reunião de equipe', 'Reunião semanal de equipe', '2023-10-05T15:00:00', '2023-09-30T12:00:00', 0, 2, 1),
  (2, 1, 'Comprar mantimentos', 'Leite, ovos, pão, etc.', '2023-10-02T18:00:00', '2023-09-30T13:00:00', 0, 1, 2),
  (3, 2, 'Ler livro', 'Concluir capítulo 5', '2023-10-10T20:00:00', '2023-09-30T14:00:00', 0, 1, 3);
