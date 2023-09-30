CREATE SCHEMA taskFlow;

USE taskFlow;

CREATE TABLE users (
  user_id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  email VARCHAR(100),
  password_hash CHAR(64),
  created_at TIMESTAMP
);

CREATE TABLE task (
  task_id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT,
  title VARCHAR(100),
  description TEXT,
  due_date DATETIME,
  created_at TIMESTAMP,
  completed BOOLEAN,
  priority TINYINT,
  category_id INT,
  FOREIGN KEY (user_id) REFERENCES user(user_id),
  FOREIGN KEY (category_id) REFERENCES category(category_id)
);

CREATE TABLE category (
  category_id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT,
  name VARCHAR(50),
  FOREIGN KEY (user_id) REFERENCES user(user_id)
);
