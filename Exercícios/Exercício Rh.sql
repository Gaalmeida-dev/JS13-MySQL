DROP DATABASE IF EXISTS db_rh

;
CREATE DATABASE db_rh;
USE db_rh;

-- Tabela de colaboradores e atributos
 CREATE TABLE tb_colaborador(
	id BIGINT AUTO_INCREMENT, 
    nome VARCHAR(255) NOT NULL,
    ocupacao VARCHAR(250) NOT NULL,
    salario DECIMAL(10, 2) NOT NULL, 
    contratacao DATE,
    turno ENUM('Manha','Tarde') NOT NULL,
    PRIMARY KEY(id)
);


-- Alimentando a tabela

INSERT INTO tb_colaborador (nome, ocupacao, salario, contratacao, turno)
VALUES	("Tiago", "Marketing", 4560.00, "2023-04-20", "Tarde"),
	    ("Pedro", "Serviços Gerais", 1512.00, "2026-01-03", "Manha"),
	    ("Ohana", "Diretora de projetos", 14000.00, "2015-07-13", "Manha"),
	    ("Iolanda", "Engenheira de Software", 6780.00, "2022-11-25", "Tarde"),
	    ("Isla", "Segurança", 1800.00, "2020-03-15", "Tarde"),
	    ("Iago", "Analista de Sistemas", 6118.00, "2024-06-08", "Manha");
        
-- Filtragem
SELECT * FROM tb_colaborador;
SELECT * FROM tb_colaborador WHERE salario > 2000.00;
SELECT * FROM tb_colaborador WHERE salario < 2000.00;

-- manipulação estrutural
SELECT nome, DATE_FORMAT(contratacao, '%d/%m/%Y') AS Contratacao, 
CONCAT('R$ ', FORMAT(salario, 2, 'pt_BR')) AS Salario FROM tb_colaborador;

-- Atualização
UPDATE tb_colaborador SET salario = 1800.00 WHERE id = 2;