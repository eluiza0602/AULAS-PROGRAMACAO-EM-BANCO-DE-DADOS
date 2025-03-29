CREATE DATABASE Empresa;

USE Empresa;

CREATE TABLE Funcionarios(
   Id_Matricula INT  PRIMARY KEY AUTO_INCREMENT,
   Nome VARCHAR(100) NOT NULL,
   Data_Nasc DATE NOT NULL, 
   Salario DECIMAL (10.2) NOT NULL,
   Id_Departamento INT NOT NULL,
   Id_Cargo INT NOT NULL,
   FOREIGN KEY (Id_Departamento) REFERENCES Departamentos(Id),
   FOREIGN KEY (Id_Cargo) REFERENCES Cargos(Id)
);  

CREATE TABLE Cargos(
   Id INT PRIMARY KEY AUTO_INCREMENT,
   Cargo VARCHAR (100) NOT NULL,
   Hierarquia VARCHAR (50) NOT NULL
);

CREATE TABLE Departamentos(
   Id INT PRIMARY KEY AUTO_INCREMENT,
   Nome VARCHAR (100) NOT NULL
   );

INSERT INTO Departamentos (nome) VALUES 
('TI'), ('RH'), ('Financeiro'), ('Marketing'), ('Vendas');

INSERT INTO Cargos (Cargo, Hierarquia) VALUES
('Analista', 'Pleno'),
('Gerente', 'Sanior'),
('Assistente', 'Junior'),
('Coodernador', 'Senior'),
('Desenvoledor', 'Pleno');

INSERT INTO Funcionarios (Nome, Data_Nasc, Salario, Id_Departamento, Id_Cargo) VALUES
('Ana Silva', '1985-06-15', 5500.00, 1, 5),
('Carlos Santos', '1990-03-22', 4800.00, 2, 1),
('Bruna Costa', '1987-12-10', 6000.00, 3, 2),
('Daniel Oliveira', '1992-08-05', 5200.00, 1, 5),
('Fernando Lima', '1995-09-30', 4500.00, 2, 3), 
('Gustavo Souza', '1980-01-25', 7000.00, 3, 2),
('Helena Martins', '1983-11-17', 5300.00, 1, 4),
('Igor Ferreira', '1991-07-08', 4900.00, 2, 1),
('Juliana Rocha', '1989-04-19', 5600.00, 3, 2),
('Lucas Mendes', '1993-06-23', 5100.00, 1, 5); 

-- QUESTÃO 1 - ENCONTRE O MAIOR SALARIO:
SELECT max(Salario) FROM Funcionarios ; -- 7000

-- QUESTÃO 2 - ENCONTRE O MENOR SALARIO:
SELECT min(Salario) FROM Funcionarios; -- 4500

-- QUESTÃO 3 - QUAL A QUANIDADE DE FUNCIONARIOS: 
SELECT count(Id_Matricula) FROM Funcionarios; -- 10 

-- QUESTÃO 4 - FILTRE OS FUNCIONARIOS NASCIDOS A PARTIR DE 1990:
SELECT Nome FROM Funcionarios WHERE Data_Nasc >= '1990-01-01' -- Carlos Santos, Daniel Oliveira, Fernando Lima, Igor Ferreira, Lucas Mendes

-- QUESTÃO 5 - ENCONTRE A MEDIA SALARIO: 
SELECT avg(Salario) FROM Funcionarios; -- 5390.00

-- QUESTÃO 6 - EXTRAIR OS 3 PRIMEIROS CARACTERES DO NOME
SELECT substring(Nome, 1, 3) FROM Funcionarios; -- Ana, Car, Bru, Dan, Fer, Gus, Hel, Igo, Jul, Luc

-- QUESTÃO 7 - CONTAR QUANTOS FUNCIONARIOS POR DEPARTAMENTO:
SELECT count(*) as qt_Func, d.nome as dep 
FROM Funcionarios f
JOIN Departamentos d ON f.Id_Departamento = d.Id
GROUP BY d.nome;
-- 3 Financeiro
-- 3 RH
-- 4 TI

-- QUESTÃO 8 - CONTAR QUANTOS FUNCIONARIOS EXISTEM POR CARGO:
SELECT count(*) as qt_Func, c.cargo as cargo 
FROM Funcionarios f
JOIN Cargos c ON f.Id_Cargo = c.Id
GROUP BY c.cargo;
-- 2 Analista 
-- 1 Assistente
-- 1 Coodernador
-- 3 Desenvolvedor
-- 3 Gerente 