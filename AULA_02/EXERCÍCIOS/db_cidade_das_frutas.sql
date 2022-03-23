-- Apagar Banco de Dados db_cidade_das_frutas
DROP DATABASE db_cidade_das_frutas;

-- Recriar o Banco de db_cidade_das_frutas
CREATE DATABASE db_cidade_das_frutas;

-- Selecionar o Banco de Dados db_cidade_das_frutas
USE db_cidade_das_frutas;

-- Criar a tabela tb_categoria
CREATE TABLE tb_categoria(
id bigint AUTO_INCREMENT,
descricao varchar(255) NOT NULL,
tipo varchar(255),
conservacao varchar(255),
PRIMARY KEY (id)
);

-- Insere dados na tabela tb_categoria
INSERT INTO tb_categoria (descricao,tipo,conservacao)
VALUES ("Frutas vermelhas","pote","refrigerado");

INSERT INTO tb_categoria (descricao, tipo, conservacao)
VALUES ("Frutas amarelas","unidade","refrigeradas");

INSERT INTO tb_categoria (descricao, tipo,conservacao)
VALUES ("Frutas secas","kg","local seco em temperatura ambiente");

INSERT INTO tb_categoria (descricao, tipo,conservacao)
VALUES ("Frutas verdes","kg","local seco em temperatura ambiente");

-- Lista todos os dados da tabela tb_categorias
SELECT * FROM tb_categoria;

-- Criar a Tabela tb_produtos
CREATE TABLE tb_produtos(
id bigint AUTO_INCREMENT,
nome varchar(255) NOT NULL,
quantidade int, 
dtvalidade date NULL,
preco decimal(6, 2),
categoria_id bigint, 
PRIMARY KEY (id),
FOREIGN KEY (categoria_id) REFERENCES tb_categoria(id)
);

-- Insere dados na tabela tb_produtos
INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Morango", 20, "2022-03-27",109.99 , 1);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Amora", 30, "2022-03-26",89.99 , 1);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Manga", 10, "2022-03-30", 49.00, 2);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Melão", 4, "2022-04-02",45.99 , 2);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Uva passa", 1, "2022-05-04",20.99 , 3);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Tamara", 1, "2022-05-04",45.99 , 3);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Abacate", 5, "2022-04-02",47.99 , 4);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Limão", 5, "2022-04-12",37.99 , 4);

-- Visualiza todos os dados da tabela tb_produtos
SELECT * FROM tb_produtos;

-- Mostrar a tabela no intervalo da condição:
SELECT * FROM tb_produtos WHERE preco BETWEEN 3 and 60;

-- Mostrar produtos que tem a letra c:
SELECT * FROM tb_produtos WHERE nome LIKE "%c%";

-- mostrar produtos com o preço maior que 50 reais
SELECT * FROM tb_produtos WHERE preco >50;

-- ------------------------------------------------------------------------------
-- COMO CONSTRUIR A CONSULTA USANDO O JOIN, PRIMEIRO CASO (INNER):
-- pegar a chave primária que está na tabela categoria
-- INNER = intersecção de tb_produto com tb_categoria

SELECT nome, quantidade,  dtvalidade, preco, categoria_id, 
tb_categoria.descricao, tb_categoria.tipo, tb_categoria.conservacao
FROM tb_produtos INNER JOIN tb_categoria
ON tb_produtos.categoria_id = tb_categoria.id;

-- INTERSECÇÃO + ESPECIFICAÇÃO DA CATEGORIA
SELECT nome, quantidade,  dtvalidade, preco, categoria_id, 
tb_categoria.descricao, tb_categoria.tipo, tb_categoria.conservacao
FROM tb_produtos INNER JOIN tb_categoria
ON tb_produtos.categoria_id = tb_categoria.id WHERE tb_categoria.descricao= "Frutas vermelhas";