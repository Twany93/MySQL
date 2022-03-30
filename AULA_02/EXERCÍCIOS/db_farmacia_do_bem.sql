-- Apagar Banco de Dados db_farmacia_do_bem
DROP DATABASE db_farmacia_do_bem;

-- Criar o Banco de dados db_pizzaria
CREATE DATABASE db_farmacia_do_bem;

-- Selecionar o Banco de Dados db_quitanda
USE db_farmacia_do_bem;

-- Criar tabela tb_categoria
CREATE TABLE tb_categoria(
id bigint AUTO_INCREMENT,
tipo varchar(255) NOT NULL,
receita varchar(255),
classificacao varchar(255),
PRIMARY KEY (id)
);

-- Insere dados na tabela tb_categorias
INSERT INTO tb_categoria (tipo,receita,classificacao)
VALUES ("Analgésico","Não","Referência");

INSERT INTO tb_categoria (tipo,receita,classificacao)
VALUES ("Antiácido","Não","Referência");

INSERT INTO tb_categoria (tipo,receita,classificacao)
VALUES ("Antibiótico","Sim","Genérico");

INSERT INTO tb_categoria (tipo,receita,classificacao)
VALUES ("Fitoterápico","Sim","Manipulado");

INSERT INTO tb_categoria (tipo,receita,classificacao)
VALUES ("Antitérmicos","Não","Genérico");

-- Lista todos os dados da tabela tb_categorias
SELECT * FROM tb_categoria;

-- Criar a Tabela tb_produtos
CREATE TABLE tb_produto(
id bigint AUTO_INCREMENT,
nome varchar(255) NOT NULL,
quantidade int, 
doenca varchar(255) NOT NULL,
preco decimal(6, 2),
categoria_id bigint, 
PRIMARY KEY (id),
FOREIGN KEY (categoria_id) REFERENCES tb_categoria(id)
);

-- Insere dados na tabela tb_produtos
INSERT INTO tb_produto(nome, quantidade, doenca, preco, categoria_id)
VALUES ("ENO", 3, "transtornos estomacais", 12.99, 2);

INSERT INTO tb_produto(nome, quantidade, doenca, preco, categoria_id)
VALUES ("Gastrol", 1, "transtornos estomacais", 9.99, 2);

INSERT INTO tb_produto (nome, quantidade, doenca, preco, categoria_id)
VALUES ("Dipirona", 1, "Febre e Dor no corpo", 3.99, 5);

INSERT INTO tb_produto(nome, quantidade, doenca, preco, categoria_id)
VALUES ("Paracetamol", 1, "Febre e Dor no corpo", 5.79, 5);

INSERT INTO tb_produto(nome, quantidade, doenca, preco, categoria_id)
VALUES ("Dorflex", 1, "Dores musculares", 19.90, 1);

INSERT INTO tb_produto(nome, quantidade, doenca, preco, categoria_id)
VALUES ("Advil", 1, "Dores musculares", 14.89, 1);

INSERT INTO tb_produto(nome, quantidade, doenca, preco, categoria_id)
VALUES ("Amoxicilina", 1, "Sinusite", 23.99, 3);

INSERT INTO tb_produto (nome, quantidade, doenca, preco, categoria_id)
VALUES ("Maracujax", 1, "Ansiedade", 58.80, 4);

-- Visualiza todos os dados da tabela tb_produtos
SELECT * FROM tb_produto;

-- Mostrar a tabela no intervalo da condição:
SELECT * FROM tb_produto WHERE preco BETWEEN 3 and 60;

-- Mostrar produtos que tem a letra B:
SELECT * FROM tb_produto WHERE nome LIKE "%b%";

-- mostrar produtos com o preço maior que 50 reais
SELECT * FROM tb_produto WHERE preco >50;

-- ------------------------------------------------------------------------------
-- COMO CONSTRUIR A CONSULTA USANDO O JOIN, PRIMEIRO CASO (INNER):
-- pegar a chave primária que está na tabela categoria
-- INNER = intersecção de tb_farmacia_do_bem com tb_categoria

SELECT nome, quantidade, doenca, preco, categoria_id, 
tb_categoria.tipo, tb_categoria.classificacao, tb_categoria.receita
FROM tb_produto INNER JOIN tb_categoria
ON tb_produto.categoria_id = tb_categoria.id;

-- INTERSECÇÃO + ESPECIFICAÇÃO DA CATEGORIA
SELECT nome, quantidade, doenca, preco, categoria_id, 
tb_categoria.tipo, tb_categoria.classificacao, tb_categoria.receita
FROM tb_produto INNER JOIN tb_categoria
ON tb_produto.categoria_id = tb_categoria.id WHERE tb_categoria.tipo = "Antitérmicos";