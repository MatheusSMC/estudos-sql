-- Criando um banco de dados
CREATE DATABASE escola;
-- Selecionando um banco de dados para usar
USE escola;
-- Criando uma tabela
create table alunos (
id int AUTO_INCREMENT primary key,
nome varchar(100),
idade int
);
-- Inserindo valores a tabela
insert into alunos (nome, idade)
values ('Caio', 14),
 ('Jamilly', 14), 
 ('Lara', 15), 
 ('Livia', 14), 
 ('Maria S', 13), 
 ('Miguel', 14);
 -- Inserindo novos valores a tabela
insert into alunos (nome, idade)
values ('Laura', 12),
('Luisa', 11),
('Eduarda', 15),
('João', 10),
('Matheus', 15),
('Miguel', 12);
-- Mostrando todos os alunos
select * from alunos;
-- Mostrando apenas o nome dos alunos
select nome from alunos;
-- Mostrando apenas o nome dos alunos que tem 14 anos
select * from alunos where idade = 14;
-- Mostrando os alunos em ordem alfabetica
select * from alunos order by nome;
-- Mostrando os alunos que tem mais de 14 anos
select * from alunos where idade > 14;
