DROP DATABASE IF EXISTS db_alunos;
CREATE DATABASE db_alunos;
USE db_alunos;

-- Definição
CREATE TABLE tb_alunos(
  id BIGINT AUTO_INCREMENT,
  nome VARCHAR(255) NOT NULL,
  idade INT,
  turma INT,
  nota1 DECIMAL(4,2),
  nota2 DECIMAL(4,2),
  nota3 DECIMAL(4,2),
  nota4 DECIMAL(4,2),
  media DECIMAL(4,2),
  resultado VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);

INSERT INTO tb_alunos (nome, idade, turma, nota1, nota2, nota3, nota4, media, resultado)
VALUES ('Ana Silva', 15, 101, 8.5, 7.0, 9.0, 8.0, 8.1, 'Aprovado'),
('Bruno Oliveira', 16, 101, 5.0, 4.5, 6.0, 5.5, 5.2, 'Em Exame'),
('Carla Souza', 15, 101, 9.5, 10.0, 9.0, 9.5, 9.5, 'Aprovado'),
('Diego Santos', 17, 102, 4.0, 3.0, 5.0, 2.0, 3.5, 'Reprovado'),
('Elena Martins', 16, 102, 7.0, 7.5, 8.0, 7.0, 7.3, 'Aprovado'),
('Fabio Costa', 15, 101, 6.5, 6.0, 7.0, 6.5, 6.5, 'Em Exame'),
('Giovanna Lima', 16, 103, 8.0, 8.5, 9.0, 8.0, 8.3, 'Aprovado'),
('Henrique Rocha', 17, 103, 3.0, 4.0, 2.5, 5.0, 3.6, 'Reprovado'),
('Isabela Alves', 15, 101, 10.0, 9.5, 10.0, 10.0, 9.8, 'Aprovado'),
('João Pedro', 16, 102, 5.5, 6.0, 5.0, 5.5, 5.5, 'Em Exame'),
('Karina Dias', 15, 103, 7.5, 8.0, 7.5, 8.5, 7.8, 'Aprovado'),
('Leonardo Cruz', 17, 102, 2.0, 1.5, 3.0, 2.5, 2.2, 'Reprovado'),
('Mariana Melo', 16, 101, 9.0, 8.5, 8.0, 9.0, 8.6, 'Aprovado'),
('Natan Ferreira', 15, 102, 6.0, 5.5, 6.5, 6.0, 6.0, 'Em Exame'),
('Olivia Castro', 16, 103, 8.5, 9.0, 8.5, 9.5, 8.8, 'Aprovado'),
('Paulo Souza', 17, 101, 4.5, 5.0, 4.0, 4.5, 4.5, 'Reprovado'),
('Queliane Rosa', 15, 102, 7.0, 7.0, 7.5, 8.0, 7.3, 'Aprovado'),
('Ricardo Lima', 16, 103, 5.0, 5.5, 4.5, 6.0, 5.2, 'Em Exame'),
('Sabrina Paiva', 15, 101, 9.5, 9.0, 9.5, 10.0, 9.5, 'Aprovado'),
('Tiago Gomes', 17, 102, 3.5, 4.0, 3.0, 3.5, 3.5, 'Reprovado'),
('Ursula Vaz', 16, 103, 8.0, 7.5, 8.5, 8.0, 8.0, 'Aprovado'),
('Vitor Hugo', 15, 101, 6.5, 7.0, 6.0, 7.5, 6.7, 'Em Exame'),
('Wanda Nara', 16, 102, 5.5, 5.0, 6.0, 5.5, 5.5, 'Em Exame'),
('Xavier Neto', 17, 103, 2.5, 3.0, 2.0, 4.0, 2.8, 'Reprovado'),
('Yara Lopes', 15, 101, 9.0, 9.5, 9.0, 9.0, 9.1, 'Aprovado'),
('Zeca Pagode', 18, 102, 4.0, 4.5, 5.0, 4.0, 4.3, 'Reprovado'),
('Arthur Aguiar', 16, 103, 7.5, 7.0, 8.0, 7.5, 7.5, 'Aprovado'),
('Beatriz Reis', 15, 101, 10.0, 10.0, 10.0, 10.0, 10.0, 'Aprovado'),
('Caio Castro', 17, 102, 3.0, 2.5, 4.0, 3.0, 3.1, 'Reprovado'),
('Dandara Silva', 16, 103, 8.5, 8.0, 8.5, 9.0, 8.5, 'Aprovado'),
('Eduardo Cunha', 15, 101, 6.0, 6.5, 5.5, 6.0, 6.0, 'Em Exame'),
('Fernanda Lima', 16, 102, 5.0, 4.0, 5.5, 5.0, 4.8, 'Reprovado'),
('Gabriel Pensador', 17, 103, 9.0, 9.0, 9.5, 9.5, 9.2, 'Aprovado'),
('Heloísa Perissé', 15, 101, 7.0, 7.5, 7.0, 8.0, 7.3, 'Aprovado'),
('Ítalo Ferreira', 16, 102, 4.5, 4.0, 5.0, 4.5, 4.5, 'Reprovado'),
('Jéssica Ellen', 15, 103, 8.0, 8.5, 8.0, 8.5, 8.2, 'Aprovado'),
('Kleber Toledo', 17, 101, 3.5, 3.0, 4.0, 3.5, 3.5, 'Reprovado'),
('Larissa Manoela', 16, 102, 9.5, 9.0, 9.5, 9.5, 9.3, 'Aprovado'),
('Murilo Benício', 15, 103, 6.5, 6.0, 7.0, 6.5, 6.5, 'Em Exame'),
('Natália Do Vale', 16, 101, 5.5, 5.0, 6.0, 5.5, 5.5, 'Em Exame'),
('Otávio Müller', 17, 102, 2.0, 2.5, 1.5, 2.0, 2.0, 'Reprovado'),
('Patrícia Pillar', 15, 103, 8.5, 9.0, 8.5, 9.0, 8.7, 'Aprovado'),
('Quinzinho Silva', 16, 101, 4.0, 4.5, 4.0, 4.0, 4.1, 'Reprovado'),
('Rafa Kalimann', 15, 102, 7.5, 7.5, 8.0, 8.0, 7.7, 'Aprovado'),
('Samuel Rosa', 17, 103, 5.5, 5.0, 6.0, 5.5, 5.5, 'Em Exame'),
('Tais Araújo', 16, 101, 9.5, 9.5, 10.0, 10.0, 9.7, 'Aprovado'),
('Ubirajara Gois', 15, 102, 3.0, 3.5, 3.0, 3.0, 3.1, 'Reprovado'),
('Valéria Almeida', 16, 103, 8.0, 8.0, 8.5, 8.5, 8.2, 'Aprovado'),
('Wagner Moura', 17, 101, 6.0, 6.5, 6.0, 6.0, 6.1, 'Em Exame'),
('Yasmin Brunet', 15, 102, 4.5, 4.0, 5.0, 4.5, 4.5, 'Reprovado');

SELECT * FROM tb_alunos;

SELECT * FROM tb_alunos WHERE media > 7;
SELECT * FROM tb_alunos WHERE media < 7;

UPDATE tb_alunos SET turma = 103 WHERE id = 1;