-- Cria��o da tabela empresa
CREATE TABLE empresa
(
� � id_emp INT PRIMARY KEY,� -- Definido o campo id_emp como chave prim�ria
� � nome_emp VARCHAR(100) NOT NULL,
� � email_emp VARCHAR(100),
� � cnpj VARCHAR(20),� -- Alterado para VARCHAR, pois CNPJ pode ter zeros � esquerda
� � ins_est_emp VARCHAR(20)� -- Alterado para VARCHAR, pois Inscri��o Estadual pode ter zeros � esquerda
);

-- Cria��o da tabela depto
CREATE TABLE depto
(
� � id_depto INT PRIMARY KEY,
� � nome_depto VARCHAR(100) NOT NULL,
� � local_depto VARCHAR(100)
);

-- Cria��o da tabela funcionarios
CREATE TABLE funcionarios
(
� � id_depto INT,
� � id_func INT PRIMARY KEY,
	id_jobs INT,
� � nome_func VARCHAR(100),
� � email_func VARCHAR(100),
� � data_nasc DATE,� -- Tipo DATE para a data de nascimento
	CONSTRAINT fk_depto FOREIGN KEY (id_depto) REFERENCES depto(id_depto)
);

CREATE TABLE jobs
(
� � job_id INT PRIMARY KEY,
� � job_title VARCHAR(100),
� � salario INT,
� � comissao INT
);

CREATE TABLE Countries (
� � country_id INT PRIMARY KEY,
� � country_name VARCHAR(100)
);



INSERT INTO Countries VALUES (1, 'Noruega');
INSERT INTO Countries VALUES (2, 'Nig�ria');
INSERT INTO Countries VALUES (3, 'Brasil');
INSERT INTO Countries VALUES (4, 'Nepal');
INSERT INTO Countries VALUES (5, 'Canad�');
INSERT INTO Countries VALUES (6, 'Nova Zel�ndia');
INSERT INTO Countries VALUES (7, 'Nam�bia');
INSERT INTO Countries VALUES (8, 'N�ger');
INSERT INTO Countries VALUES (9, 'Estados Unidos');
INSERT INTO Countries VALUES (10, 'Fran�a');


-- Inserindo dados na tabela empresa
INSERT INTO empresa VALUES (1, 'Unicsul', 'unicsul@gmail.com', '12332323232', '21212312');
INSERT INTO empresa VALUES (2, 'Escola Cruzeiro', 'escola@gmail.com', '5154564854', '848515656');
INSERT INTO empresa VALUES (3, 'Empresa C', 'empresa@gmail.com', '4556558949', '775484984');

-- Inserindo dados na tabela depto
INSERT INTO depto VALUES (1, 'Financeiro', 'SP');
INSERT INTO depto VALUES (2, 'Administra��o', 'RJ');
INSERT INTO depto VALUES (3, 'Academia', 'DF');

-- Inserindo dados na tabela funcionarios
INSERT INTO funcionarios VALUES (1, 1, 1, 'Igor', 'igorv4282@gmail.com', '1990-01-01'); -- Corre��o na ordem dos valores
INSERT INTO funcionarios VALUES (2, 2, 2, 'Silva', 'silva@gmail.com', '1992-03-15'); -- Corre��o na ordem dos valores
INSERT INTO funcionarios VALUES (3, 3, 3, 'Jose', 'jose@gmail.com', '1985-07-20'); -- Corre��o na ordem dos valores

-- Inserindo dados na tabela jobs (cargos)
INSERT INTO jobs VALUES (1, 'Manager', 5000, 1200);
INSERT INTO jobs VALUES (2, 'Clerk', 1500, 200);
INSERT INTO jobs VALUES (3, 'Analyst', 2500, 300);
INSERT INTO jobs VALUES (4, 'Director', 8000, 1500);


--1 Exibir a estrutura da tabela DEPT
SELECT id_depto, nome_depto, local_depto
FROM depto;



--- 2 Exibir todos os dados da tabela EMP
SELECT id_emp, nome_emp, email_emp, cnpj, ins_est_emp
FROM empresa;


--- 3 Exibir o nome, departamento e sal�rios dos empregados da tabela EMP.
SELECT f.nome_func, d.nome_depto, j.salario
FROM funcionarios f
JOIN depto d ON f.id_depto = d.id_depto
JOIN jobs j ON f.id_jobs = j.job_id; -- Corre��o: Usar id_jobs para relacionar funcion�rios e cargos



--- 4 Exibir todos os cargos da tabela EMP, sem repeti��o.
SELECT DISTINCT job_title
FROM jobs;


--- 5 Exibir todos os empregados com sal�rio maior que 2000.
SELECT f.nome_func, j.salario
FROM funcionarios f
JOIN jobs j ON f.id_jobs = j.job_id -- Corre��o: Usar id_jobs
WHERE j.salario > 2000;



--- 6 Selecionar nome, sal�rio e comiss�o dos empregados que tenham sal�rio menor que recebido como comiss�o.


SELECT f.nome_func, j.salario, j.comissao
FROM funcionarios f
JOIN jobs j ON f.id_jobs = j.job_id -- Corre��o: Usar id_jobs
WHERE j.salario < j.comissao;



--- 7 R: A

--- 8 Selecionar todos os empregados com sal�rio entre 1000 e 1500

SELECT f.nome_func, j.salario
FROM funcionarios f
JOIN jobs j ON f.id_jobs = j.job_id -- Corre��o: Usar id_jobs
WHERE j.salario BETWEEN 1000 AND 1500;

--- 9 Exibir todos os empregados com os c�digos 7902, 7788 e 7876

SELECT * FROM funcionarios
WHERE id_func IN (7902, 7788, 7876);


--- 10 Selecionar todos os empregados que n�o sejam Clerk, Manager ou Analyst.
SELECT f.nome_func, j.job_title
FROM funcionarios f
JOIN jobs j ON f.id_jobs = j.job_id -- Corre��o: Usar id_jobs
WHERE j.job_title NOT IN ('Clerk', 'Manager', 'Analyst');



--- 11 Selecione todos os empregados dos departamentos 10 e 20.
SELECT f.nome_func, d.nome_depto
FROM funcionarios f
JOIN depto d ON f.id_depto = d.id_depto
WHERE d.id_depto IN (1, 2); -- Corre��o: Usar os id_depto existentes nos dados



--- 12 Exibir o sal�rio e rendimento anual do funcion�rio Jones, considerando 14 sal�rios por ano e b�nus de 1200 por m�s.
SELECT f.nome_func, j.salario,
� � � �(j.salario * 14) AS salario_anual,
� � � �((j.salario * 14) + (1200 * 12)) AS rendimento_anual
FROM funcionarios f
JOIN jobs j ON f.id_jobs = j.job_id -- Corre��o: Usar id_jobs
WHERE f.nome_func = 'Jones'; -- Corre��o: N�o h� funcion�rio com o nome 'Jones' nos dados inseridos



--- 13 Pesquise sobre a cl�usula Order By. Em seguida, tente selecionar o nome, sal�rio e data de admiss�o, com a listagem sendo ordenada pelo sal�rio
SELECT f.nome_func, j.salario, f.data_nasc
FROM funcionarios f
JOIN jobs j ON f.id_jobs = j.job_id -- Corre��o: Usar id_jobs
ORDER BY j.salario DESC;


--- 14 Selecionar os empregados que tenham o nome iniciado pela letra A;

SELECT * FROM funcionarios
WHERE nome_func LIKE 'A%';



--- 15 Exibir todos os empregados com a 2� letra do nome igual a L.
SELECT * FROM empresa
WHERE nome_emp LIKE '_L%';


--- 16 Exibir todos os pa�ses que tem o nome iniciado pela letra N (tabela: Countries)
SELECT * FROM Countries
WHERE country_name LIKE 'N%';


--- 17 Selecionar todos os empregados que tenham cargo com a palavra �Manager� (tabela: Jobs)
SELECT f.nome_func, j.job_title
FROM funcionarios f
JOIN jobs j ON f.id_jobs = j.job_id -- Corre��o: Usar id_jobs
WHERE j.job_title LIKE '%Manager%';