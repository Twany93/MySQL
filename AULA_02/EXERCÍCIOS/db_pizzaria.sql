-- Crie um banco de dados para um serviço de pizzaria de uma empresa,
-- o nome do banco deverá ter o seguinte nome db_pizzaria_legal, onde o sistema 
-- trabalhará com as informações dos produtos desta empresa. 
-- O sistema trabalhará com 2 tabelas tb_pizza e tb_categoria.

-- Apagar Banco de Dados db_pizzaria
DROP DATABASE db_pizzaria;

-- Criar o Banco de dados db_pizzaria
CREATE DATABASE db_pizzaria;

-- Selecionar o Banco de Dados db_quitanda
USE db_pizzaria;

-- Criar a tabela tb_categoria
CREATE TABLE tb_categoria(
id bigint AUTO_INCREMENT,
descricao varchar(255) NOT NULL,
frete varchar(255) NOT NULL,
vale_refri varchar(255) NOT NULL,
PRIMARY KEY (id)
);

-- Insere dados na tabela tb_categorias
INSERT INTO tb_categoria (descricao,frete,vale_refri)
VALUES ("Pizza doce","grátis","Não");

INSERT INTO tb_categoria (descricao,frete,vale_refri)
VALUES ("Pizza salgada","pago", "Sim");

INSERT INTO tb_categoria (descricao,frete,vale_refri)
VALUES ("Pizza com borda","grátis","Sim" );

INSERT INTO tb_categoria (descricao,frete,vale_refri)
VALUES ("Pizza Salgada (meia)","pago","Sim");

INSERT INTO tb_categoria (descricao,frete,vale_refri)
VALUES ("Pizza doce (meia)", "pago","Não");

-- Lista todos os dados da tabela tb_categorias
SELECT * FROM tb_categoria;

-- Criar a Tabela tb_produtos
CREATE TABLE tb_pizza(
id bigint AUTO_INCREMENT,
sabor varchar(255) NOT NULL,
quantidade int, 
tipo varchar(255) NOT NULL,
preco decimal(6, 2),
categoria_id bigint, 
PRIMARY KEY (id),
FOREIGN KEY (categoria_id) REFERENCES tb_categoria(id)
);

-- Insere dados na tabela tb_produtos
INSERT INTO tb_pizza (sabor, quantidade, tipo, preco, categoria_id)
VALUES ("calabresa com catupiry", 2, "grande", 69.99, 2);

INSERT INTO tb_pizza (sabor, quantidade, tipo, preco, categoria_id)
VALUES ("marguerita", 2, "grande", 69.99, 2);

INSERT INTO tb_pizza (sabor, quantidade, tipo, preco, categoria_id)
VALUES ("chocolate com M&M´s", 1, "pequeno", 23.99, 1);

INSERT INTO tb_pizza (sabor, quantidade, tipo, preco, categoria_id)
VALUES ("doce de leite com banana ", 1, "grande", 34.99, 1);

INSERT INTO tb_pizza (sabor, quantidade, tipo, preco, categoria_id)
VALUES ("frango, milho e catupiry", 2, "pequena", 39.99, 3);

INSERT INTO tb_pizza (sabor, quantidade, tipo, preco, categoria_id)
VALUES ("frango, milho e catupiry", 1, "pequena", 25.99, 3);

INSERT INTO tb_pizza (sabor, quantidade, tipo, preco, categoria_id)
VALUES ("frango, milho e catupiry + calabresa", 2, "pequena", 69.99, 4);

INSERT INTO tb_pizza (sabor, quantidade, tipo, preco, categoria_id)
VALUES ("meia doce de leite e banana + chocolate e M&M´s ", 1, "pequena", 29.99, 5);

-- Visualiza todos os dados da tabela tb_produtos
SELECT * FROM tb_pizza;

-- Mostrar a tabela no intervalo da condição:
SELECT * FROM tb_pizza WHERE preco BETWEEN 29 and 60;

-- Mostrar produtos que tem a letra c:
SELECT * FROM tb_pizza WHERE sabor LIKE "%c%";

-- mostrar produtos com o preço maior que 45 reais
SELECT * FROM tb_pizza WHERE preco >45;

-- ------------------------------------------------------------------------
-- COMO CONSTRUIR A CONSULTA USANDO O JOIN, PRIMEIRO CASO (INNER):
-- pegar a chave primária que está na tabela categoria
-- INNER = intersecção de tb_pizza com tb_categoria

SELECT sabor, preco, quantidade, tipo, tb_categoria.descricao, tb_categoria.frete, tb_categoria.vale_refri
FROM tb_pizza INNER JOIN tb_categoria
ON tb_pizza.categoria_id = tb_categoria.id;

-- COMO CONSTRUIR A CONSULTA USANDO O JOIN, TERCEIRO CASO (RIGHT - direito):
SELECT sabor, preco, quantidade, tipo, tb_categoria.descricao, tb_categoria.frete, tb_categoria.vale_refri 
FROM tb_pizza RIGHT JOIN tb_categoria
ON tb_pizza.categoria_id = tb_categoria.id WHERE tb_categoria.descricao= "Pizza salgada";
-- filtra os dados pra achar somente a categoria = Pizza salgada
