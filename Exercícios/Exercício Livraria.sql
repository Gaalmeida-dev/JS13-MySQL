DROP DATABASE IF EXISTS db_livraria;
CREATE DATABASE db_livraria;
USE db_livraria;

-- Definição
CREATE TABLE tb_produtos(
  id BIGINT AUTO_INCREMENT,
  nome VARCHAR(255) NOT NULL,
  quantidade INT NOT NULL,
  genero VARCHAR(255),
  indicacao ENUM ("L", "+10", "+12", "+14", "+16", "+18"), 
  preco DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (id)
);

INSERT INTO tb_produtos (nome, quantidade, genero, indicacao, preco)
VALUES ("Crônicas de Nárnia", 65, "Fantasia", "+12", 120.00),
	   ("Percy Jackson e os Olimpianos", 23, "Fantasia", "+10", 83.00),
       ("Diário de um banana", 7, "InfantoJuvenil", "L", 53.00),
       ("Querido diário otário", 14, "InfantoJuvenil", "+10", 32.00),
       ("As crônicas de gelo e fogo", 4, "Fantasia", "+18", 150.00),
       ("A noiva do Deus do Mar", 2, "Fantasia", "+14", 63.00),
       ("Pequeno Príncipe", 31, "Infantil", "L", 43.00),
       ("A menina que roubava livros", 17, "Drama", "+14", 89.00),
       ("Se eu ficar", 5, "Drama", "+16", 58.00),
       ("Rainha Vermelha", 43, "Fantasia", "+14", 64.00);

SELECT * FROM tb_produtos;

-- Filtragem 
SELECT * FROM tb_produtos WHERE preco > 80;
SELECT * FROM tb_produtos WHERE preco < 80;
SELECT * FROM tb_produtos WHERE indicacao IN ('+16', '+18');
SELECT * FROM tb_produtos WHERE indicacao IN ('L', '+10', '+12', '+14');

-- Estrutura
Select nome,CONCAT('R$ ', FORMAT(preco, 2, 'pt_BR')) AS Preco FROM tb_produtos;

-- Atualização
UPDATE tb_produtos SET quantidade = 27 WHERE id <= 3;

