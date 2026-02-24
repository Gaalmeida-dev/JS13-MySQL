DROP DATABASE IF EXISTS db_quitanda;
CREATE DATABASE db_quitanda;
USE db_quitanda;

CREATE TABLE tb_produtos(
  id BIGINT AUTO_INCREMENT,
  nome VARCHAR(255) NOT NULL,
  quantidade INT,
  data_validade DATE,
  preco DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (id)
);

-- Comandos de manipulação de dados

-- Insere um único registros
INSERT INTO tb_produtos (nome, quantidade, data_validade, preco)
VALUES ("tomate", 1000, "2026-03-24", 8.99);

-- Insere múltiplos registros
INSERT INTO tb_produtos (nome, quantidade, data_validade, preco)
VALUES ("banana", 15000, "2026-03-14", 12.50),
       ("morango", 5000, "2026-03-14", 22.00),
       ("alface", 500, "2026-03-12", 6.50),
       ("beterraba", 4000, "2026-03-24", 9.50);

INSERT INTO tb_produtos (nome, quantidade, data_validade, preco)
VALUES ("Kiwi", 1000, "2026-03-24", 25.50);
	   
SELECT * FROM tb_produtos;


-- Formatando saída
SELECT nome, DATE_FORMAT(data_validade, '%d/%m/%Y') AS Data_Validade, 
CONCAT('R$ ', FORMAT(preco, 2, 'pt_BR')) AS Preco FROM tb_produtos;

-- Filtragem
SELECT * FROM tb_produtos WHERE id = 2;
SELECT * FROM tb_produtos WHERE preco > 10;
SELECT * FROM tb_produtos WHERE preco < 10;

-- Consulta composta
SELECT * FROM tb_produtos WHERE nome = "banana" OR preco > 10;
SELECT * FROM tb_produtos WHERE nome = "banana" OR preco > 20;

SELECT * FROM tb_produtos WHERE nome = "banana" AND preco > 10;
SELECT * FROM tb_produtos WHERE nome = "banana" AND preco < 10;

SELECT * FROM tb_produtos WHERE nome != "banana";

-- Exceto
UPDATE tb_produtos SET preco = 8.99 WHERE id = 1;

DELETE FROM tb_produtos WHERE id = 6;

SET SQL_SAFE_UPDATES = 1;

-- Comandos estruturais
ALTER TABLE tb_produtos MODIFY preco decimal(6, 2);

-- Para modificar, trocar ADD por CHANGE
ALTER TABLE tb_produtos ADD descricao varchar(500);

ALTER TABLE tb_produtos CHANGE descricao descricao_produto varchar(500);

-- Remover atributo
ALTER TABLE tb_produtos DROP descricao_produto;

