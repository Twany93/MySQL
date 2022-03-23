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
INSERT INTO tb_pizza (nome, quantidade, doenca, preco, categoria_id)
VALUES ("ENO", 3, "transtornos estomacais", 12.99, 2);

INSERT INTO tb_pizza (nome, quantidade, doenca, preco, categoria_id)
VALUES ("Gastrol", 1, "transtornos estomacais", 9.99, 2);

INSERT INTO tb_pizza (nome, quantidade, doenca, preco, categoria_id)
VALUES ("Gastrol", 1, "transtornos estomacais", 9.99, 2);