-- Inserindo dados na tabela taskFlow.users
INSERT INTO taskFlow.users (first_name, last_name,username, email, password_hash)
VALUES
  ('John', 'Doe','johndoe', 'john.doe@example.com', 'hashed_password_1'),
  ('Jane', 'Smith','janesmith', 'jane.smith@example.com', 'hashed_password_2');

  SELECT * from taskFlow.users

-- Inserindo dados na tabela taskFlow.category
INSERT INTO taskFlow.category (user_id, name)
VALUES
  (2, 'Trabalho'),
  (2, 'Pessoal'),
  (3, 'Estudos');

  SELECT * FROM taskFlow.category

-- Inserindo dados na tabela taskFlow.task
INSERT INTO taskFlow.task (user_id, title, description, due_date, priority, category_id)
VALUES
  (2, 'Reunião de equipe', 'Reunião semanal de equipe', '2024-10-05', 2, 4),
  (2, 'Comprar mantimentos', 'Leite, ovos, pão, etc.', '2024-10-02', 1, 5),
  (3, 'Ler livro', 'Concluir capítulo 5', '2024-10-10T20:00:00', 1, 6);
