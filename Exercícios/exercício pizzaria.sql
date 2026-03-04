DROP DATABASE IF EXISTS db_pizzaria;
CREATE DATABASE db_pizzaria;
USE db_pizzaria;

-- Definição
CREATE TABLE tb_sabores (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(40) NOT NULL UNIQUE,
  categoria ENUM('salgado','doce') NOT NULL
);

CREATE TABLE tb_preco_sabor_tamanho (
  id INT AUTO_INCREMENT PRIMARY KEY,
  sabor_id INT NOT NULL,
  tamanho ENUM('P','M','G','GG') NOT NULL,
  preco DECIMAL(10,2) NOT NULL,
  UNIQUE KEY uq_sabor_tamanho (sabor_id, tamanho),
  FOREIGN KEY (sabor_id) REFERENCES tb_sabores(id)
);

CREATE TABLE tb_pizzas (
  id INT AUTO_INCREMENT PRIMARY KEY,
  tamanho ENUM('P','M','G','GG') NOT NULL,
  tipo ENUM('inteira','mista') NOT NULL,
  sabor1_id INT NOT NULL,
  sabor2_id INT NULL,
  preco DECIMAL(10,2) NOT NULL,
  CHECK ( (tipo='inteira' AND sabor2_id IS NULL)
       OR (tipo='mista' AND sabor2_id IS NOT NULL) ),
  FOREIGN KEY (sabor1_id) REFERENCES tb_sabores(id),
  FOREIGN KEY (sabor2_id) REFERENCES tb_sabores(id)
);

 -- alimentação com dados
INSERT INTO tb_sabores (nome, categoria) VALUES
('Calabresa','salgado'),
('Quatro Queijos','salgado'),
('Brigadeiro','doce'),
('Romeu e Julieta','doce');

-- precificação

-- calabresa
INSERT INTO tb_preco_sabor_tamanho (sabor_id,tamanho,preco) VALUES
(1,'P',45.00),(1,'M',60.00),(1,'G',70.00),(1,'GG',90.00);

-- Quatro Queijos (id=2)
INSERT INTO tb_preco_sabor_tamanho (sabor_id,tamanho,preco) VALUES
(2,'P',48.00),(2,'M',63.00),(2,'G',74.00),(2,'GG',94.00);

-- Brigadeiro (id=3)
INSERT INTO tb_preco_sabor_tamanho (sabor_id,tamanho,preco) VALUES
(3,'P',52.00),(3,'M',68.00),(3,'G',80.00),(3,'GG',99.00);

-- Romeu e Julieta (id=4)
INSERT INTO tb_preco_sabor_tamanho (sabor_id,tamanho,preco) VALUES
(4,'P',49.00),(4,'M',65.00),(4,'G',76.00),(4,'GG',96.00);

INSERT INTO tb_pizzas (tamanho, tipo, sabor1_id, sabor2_id, preco)
SELECT p.tamanho, 'inteira', p.sabor_id, NULL, p.preco
FROM tb_preco_sabor_tamanho p;

INSERT INTO tb_pizzas (tamanho, tipo, sabor1_id, sabor2_id, preco)
SELECT
  ps.tamanho,
  'mista',
  ps.sabor_id AS sabor1_id,
  pd.sabor_id AS sabor2_id,
  ROUND(ps.preco/2 + pd.preco/2, 2) AS preco
FROM tb_preco_sabor_tamanho ps
JOIN tb_sabores ss ON ss.id = ps.sabor_id AND ss.categoria='salgado'
JOIN tb_preco_sabor_tamanho pd ON pd.tamanho = ps.tamanho
JOIN tb_sabores sd ON sd.id = pd.sabor_id AND sd.categoria='doce';

SELECT * FROM tb_pizzas;

-- filtragem
SELECT * FROM tb_pizzas WHERE preco > 45.00;
SELECT * FROM tb_pizzas WHERE preco BETWEEN 50.00 AND 100.00;
SELECT * FROM tb_pizzas WHERE tamanho LIKE '%M%';

SELECT
  p.id,
  p.tamanho,
  p.tipo,
  p.preco,
  s1.nome  AS sabor1,
  s1.categoria AS categoria_sabor1
FROM tb_pizzas p INNER JOIN tb_sabores s1 ON s1.id = p.sabor1_id;

SELECT
  p.id,
  p.tamanho,
  p.tipo,
  p.preco,
  s1.nome AS sabor
FROM tb_pizzas p INNER JOIN tb_sabores s1 ON s1.id = p.sabor1_id WHERE s1.categoria = 'doce' AND p.tipo = 'inteira';
