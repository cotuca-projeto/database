-- Desabilitar as restrições de chave estrangeira temporariamente
ALTER TABLE taskFlow.users NOCHECK CONSTRAINT ALL;
ALTER TABLE taskFlow.task NOCHECK CONSTRAINT ALL;
ALTER TABLE taskFlow.category NOCHECK CONSTRAINT ALL;


-- Exclusão dos dados da tabela taskFlow.user
DELETE FROM taskFlow.users;

-- Exclusão dos dados da tabela taskFlow.task
DELETE FROM taskFlow.task;

-- Exclusão dos dados da tabela taskFlow.category
DELETE FROM taskFlow.category;


-- Habilitar as restrições de chave estrangeira novamente
ALTER TABLE taskFlow.users WITH CHECK CHECK CONSTRAINT ALL;
ALTER TABLE taskFlow.task WITH CHECK CHECK CONSTRAINT ALL;
ALTER TABLE taskFlow.category WITH CHECK CHECK CONSTRAINT ALL;


--Comando para apaagar as Tabelas

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[taskFlow].[category]') AND type in (N'U'))
DROP TABLE [taskFlow].[category]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[taskFlow].[task]') AND type in (N'U'))
DROP TABLE [taskFlow].[task]
GO

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[taskFlow].[users]') AND type in (N'U'))
DROP TABLE [taskFlow].[users]
GO
