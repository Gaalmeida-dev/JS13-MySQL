DROP DATABASE IF EXISTS db_cursoPowerTech;
CREATE DATABASE db_cursoPowerTech;
USE db_cursoPowerTech;

CREATE TABLE tb_categorias (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(60) NOT NULL UNIQUE,
  area VARCHAR(60) NOT NULL
);

CREATE TABLE tb_cursos (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(100) NOT NULL,
  descricao VARCHAR(255) NOT NULL,
  carga_horaria INT NOT NULL,
  valor DECIMAL(10,2) NOT NULL,
  categoria_id BIGINT NOT NULL,
  FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

INSERT INTO tb_categorias (nome, area) VALUES
('Java','Back-end'),
('Front-end','Web'),
('Dados','Data'),
('Mobile','Aplicativos'),
('Cloud','Infra');

INSERT INTO tb_cursos (nome, descricao, carga_horaria, valor, categoria_id) VALUES
('Java do Zero ao Avançado','Fundamentos, POO, coleções e APIs',120,799.90,1),
('Java Web com Spring Boot','REST, JPA, segurança e testes',100,999.90,1),
('React Completo','Componentes, hooks e consumo de API',80,699.90,2),
('TypeScript na Prática','Tipagem, generics e padrões',40,549.90,2),
('SQL e Modelagem de Dados','Modelagem, joins e otimização',60,649.90,3),
('Power BI para Análise','Dashboards, DAX e relatórios',50,599.90,3),
('Android com Kotlin','UI, APIs e persistência',90,899.90,4),
('AWS Cloud Practitioner','Fundamentos de cloud e serviços AWS',35,629.90,5);

SELECT * FROM tb_cursos WHERE valor > 500.00;
SELECT * FROM tb_cursos WHERE valor BETWEEN 600.00 AND 1000.00;
SELECT * FROM tb_cursos WHERE nome LIKE '%J%';

SELECT
  c.id, c.nome, c.descricao, c.carga_horaria, c.valor,
  cat.nome AS categoria, cat.area
FROM tb_cursos c INNER JOIN tb_categorias cat ON cat.id = c.categoria_id;

SELECT
  c.id, c.nome, c.descricao, c.carga_horaria, c.valor,
  cat.nome AS categoria, cat.area
FROM tb_cursos c INNER JOIN tb_categorias cat ON cat.id = c.categoria_id WHERE cat.nome = 'Java';