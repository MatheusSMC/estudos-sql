-- ============================================
-- SISTEMA DE GESTÃO ACADÊMICA
-- Banco de dados para gerenciamento de alunos, disciplinas e notas
-- ============================================

-- Criando o banco de dados
CREATE DATABASE escola;

-- Selecionando o banco de dados para uso
USE escola;

-- ============================================
-- CRIAÇÃO DAS TABELAS
-- ============================================

-- Tabela de Alunos (versão melhorada)
CREATE TABLE alunos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    idade INT,
    turma VARCHAR(10),
    nota_media DECIMAL(4,2),
    data_matricula DATE DEFAULT (CURRENT_DATE)
);

-- Tabela de Disciplinas
CREATE TABLE disciplinas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome_disciplina VARCHAR(50) NOT NULL,
    professor VARCHAR(100)
);

-- Tabela de Notas (relacionamento entre alunos e disciplinas)
CREATE TABLE notas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    aluno_id INT,
    disciplina_id INT,
    nota DECIMAL(4,2),
    bimestre INT,
    FOREIGN KEY (aluno_id) REFERENCES alunos(id),
    FOREIGN KEY (disciplina_id) REFERENCES disciplinas(id)
);

-- ============================================
-- INSERÇÃO DE DADOS
-- ============================================

-- Inserindo alunos na tabela
INSERT INTO alunos (nome, idade, turma, data_matricula)
VALUES 
    ('Caio', 14, '9A', '2024-01-15'),
    ('Jamilly', 14, '9A', '2024-01-15'),
    ('Lara', 15, '9B', '2024-01-15'),
    ('Livia', 14, '9A', '2024-01-15'),
    ('Maria S', 13, '8A', '2024-01-15'),
    ('Miguel', 14, '9B', '2024-01-15'),
    ('Laura', 12, '7A', '2024-01-20'),
    ('Luisa', 11, '6B', '2024-01-20'),
    ('Eduarda', 15, '9B', '2024-01-20'),
    ('João', 10, '5A', '2024-01-20'),
    ('Matheus', 15, '9A', '2024-01-20'),
    ('Miguel', 12, '7B', '2024-01-20');

-- Inserindo disciplinas
INSERT INTO disciplinas (nome_disciplina, professor)
VALUES 
    ('Matemática', 'Prof. Carlos Silva'),
    ('Português', 'Prof. Ana Costa'),
    ('História', 'Prof. João Santos'),
    ('Ciências', 'Prof. Maria Oliveira'),
    ('Geografia', 'Prof. Pedro Lima');

-- Inserindo notas dos alunos
INSERT INTO notas (aluno_id, disciplina_id, nota, bimestre)
VALUES 
    -- Notas do Caio (id: 1)
    (1, 1, 8.5, 1), (1, 2, 7.0, 1), (1, 3, 9.0, 1), (1, 4, 8.0, 1),
    -- Notas da Jamilly (id: 2)
    (2, 1, 9.0, 1), (2, 2, 8.5, 1), (2, 3, 9.5, 1), (2, 4, 9.0, 1),
    -- Notas da Lara (id: 3)
    (3, 1, 7.5, 1), (3, 2, 8.0, 1), (3, 3, 7.0, 1), (3, 4, 8.5, 1),
    -- Notas da Livia (id: 4)
    (4, 1, 6.5, 1), (4, 2, 7.0, 1), (4, 3, 6.0, 1), (4, 4, 7.5, 1),
    -- Notas da Maria S (id: 5)
    (5, 1, 9.5, 1), (5, 2, 9.0, 1), (5, 3, 10.0, 1), (5, 4, 9.5, 1),
    -- Notas do Miguel (id: 6)
    (6, 1, 8.0, 1), (6, 2, 8.5, 1), (6, 3, 8.0, 1), (6, 4, 8.5, 1),
    -- Notas da Laura (id: 7)
    (7, 1, 7.0, 1), (7, 2, 7.5, 1), (7, 3, 7.0, 1), (7, 4, 7.5, 1),
    -- Notas da Luisa (id: 8)
    (8, 1, 8.5, 1), (8, 2, 9.0, 1), (8, 3, 8.5, 1), (8, 4, 9.0, 1),
    -- Notas da Eduarda (id: 9)
    (9, 1, 6.0, 1), (9, 2, 6.5, 1), (9, 3, 6.0, 1), (9, 4, 6.5, 1),
    -- Notas do João (id: 10)
    (10, 1, 9.0, 1), (10, 2, 8.5, 1), (10, 3, 9.0, 1), (10, 4, 8.5, 1),
    -- Notas do Matheus (id: 11)
    (11, 1, 7.5, 1), (11, 2, 8.0, 1), (11, 3, 7.5, 1), (11, 4, 8.0, 1),
    -- Notas do Miguel (id: 12)
    (12, 1, 8.0, 1), (12, 2, 7.5, 1), (12, 3, 8.0, 1), (12, 4, 7.5, 1);

-- ============================================
-- CONSULTAS BÁSICAS (suas queries originais)
-- ============================================

-- Mostrando todos os alunos
SELECT * FROM alunos;

-- Mostrando apenas o nome dos alunos
SELECT nome FROM alunos;

-- Mostrando apenas os alunos que têm 14 anos
SELECT * FROM alunos WHERE idade = 14;

-- Mostrando os alunos em ordem alfabética
SELECT * FROM alunos ORDER BY nome;

-- Mostrando os alunos que têm mais de 14 anos
SELECT * FROM alunos WHERE idade > 14;

-- ============================================
-- CONSULTAS ANALÍTICAS AVANÇADAS
-- ============================================

-- 1. Média de idade por turma
SELECT 
    turma, 
    AVG(idade) AS media_idade,
    COUNT(*) AS total_alunos
FROM alunos 
GROUP BY turma
ORDER BY turma;

-- 2. Top 5 alunos por desempenho geral
SELECT 
    a.nome, 
    a.turma,
    AVG(n.nota) AS media_geral
FROM alunos a
JOIN notas n ON a.id = n.aluno_id
GROUP BY a.id, a.nome, a.turma
ORDER BY media_geral DESC
LIMIT 5;

-- 3. Alunos com média acima da média geral da escola
SELECT 
    a.nome, 
    a.turma,
    AVG(n.nota) AS media_aluno
FROM alunos a
JOIN notas n ON a.id = n.aluno_id
GROUP BY a.id, a.nome, a.turma
HAVING AVG(n.nota) > (SELECT AVG(nota) FROM notas)
ORDER BY media_aluno DESC;

-- 4. Desempenho por disciplina (média geral de cada matéria)
SELECT 
    d.nome_disciplina,
    d.professor,
    AVG(n.nota) AS media_disciplina,
    COUNT(n.id) AS total_avaliacoes
FROM disciplinas d
JOIN notas n ON d.id = n.disciplina_id
GROUP BY d.id, d.nome_disciplina, d.professor
ORDER BY media_disciplina DESC;

-- 5. Boletim completo de um aluno específico (exemplo: Caio)
SELECT 
    a.nome AS aluno,
    d.nome_disciplina AS disciplina,
    n.nota,
    n.bimestre
FROM alunos a
JOIN notas n ON a.id = n.aluno_id
JOIN disciplinas d ON n.disciplina_id = d.id
WHERE a.nome = 'Caio'
ORDER BY d.nome_disciplina;

-- 6. Alunos com dificuldade (média abaixo de 7.0)
SELECT 
    a.nome,
    a.turma,
    AVG(n.nota) AS media_geral
FROM alunos a
JOIN notas n ON a.id = n.aluno_id
GROUP BY a.id, a.nome, a.turma
HAVING AVG(n.nota) < 7.0
ORDER BY media_geral;

-- 7. Quantidade de alunos por faixa etária
SELECT 
    CASE 
        WHEN idade <= 11 THEN 'Até 11 anos'
        WHEN idade BETWEEN 12 AND 13 THEN '12-13 anos'
        WHEN idade BETWEEN 14 AND 15 THEN '14-15 anos'
        ELSE 'Acima de 15 anos'
    END AS faixa_etaria,
    COUNT(*) AS quantidade
FROM alunos
GROUP BY faixa_etaria
ORDER BY MIN(idade);

-- 8. Disciplinas mais desafiadoras (menor média)
SELECT 
    d.nome_disciplina,
    AVG(n.nota) AS media_disciplina
FROM disciplinas d
JOIN notas n ON d.id = n.disciplina_id
GROUP BY d.id, d.nome_disciplina
ORDER BY media_disciplina ASC
LIMIT 3;

-- 9. Ranking de turmas por desempenho
SELECT 
    a.turma,
    AVG(n.nota) AS media_turma,
    COUNT(DISTINCT a.id) AS total_alunos
FROM alunos a
JOIN notas n ON a.id = n.aluno_id
GROUP BY a.turma
ORDER BY media_turma DESC;

-- 10. Atualização de média geral dos alunos na tabela principal
UPDATE alunos a
SET nota_media = (
    SELECT AVG(n.nota)
    FROM notas n
    WHERE n.aluno_id = a.id
);

-- Verificando as médias atualizadas
SELECT id, nome, turma, nota_media 
FROM alunos 
ORDER BY nota_media DESC;

-- ============================================
-- OPERAÇÕES DE MANUTENÇÃO (UPDATE e DELETE)
-- ============================================

-- Exemplo de UPDATE: Corrigir a nota de um aluno
-- UPDATE notas SET nota = 9.5 WHERE aluno_id = 1 AND disciplina_id = 2;

-- Exemplo de DELETE: Remover um aluno (cuidado com integridade referencial)
-- DELETE FROM notas WHERE aluno_id = 12;
-- DELETE FROM alunos WHERE id = 12;

-- ============================================
-- VIEWS ÚTEIS (opcional - facilita consultas frequentes)
-- ============================================

-- View para ver o desempenho completo de todos os alunos
CREATE VIEW vw_desempenho_alunos AS
SELECT 
    a.id,
    a.nome,
    a.turma,
    a.idade,
    AVG(n.nota) AS media_geral,
    COUNT(n.id) AS total_avaliacoes
FROM alunos a
LEFT JOIN notas n ON a.id = n.aluno_id
GROUP BY a.id, a.nome, a.turma, a.idade;

-- Usando a view
SELECT * FROM vw_desempenho_alunos ORDER BY media_geral DESC;
