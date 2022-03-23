-- Apagar Banco de Dados db_cursoDaMinhaVida
DROP DATABASE db_construindo_a_nossa_vida;

-- Recriar o Banco de db_cidade_das_frutas
CREATE DATABASE db_construindo_a_nossa_vida;

-- Selecionar o Banco de Dados db_cidade_das_frutas
USE db_construindo_a_nossa_vida;

-- Criar a tabela tb_categoria
CREATE TABLE tb_categoria(
id bigint AUTO_INCREMENT,
tipo varchar(255) NOT NULL,
categoria varchar(255),
PRIMARY KEY (id)
);

-- Insere dados na tabela tb_categoria
INSERT INTO tb_categoria (tipo,categoria)
VALUES ("Pisos","Alvenaria");

INSERT INTO tb_categoria (tipo,categoria)
VALUES ("Revestimentos","Alvenaria");

INSERT INTO tb_categoria (tipo,categoria)
VALUES ("Material de Construção","Construção");

INSERT INTO tb_categoria (tipo,categoria)
VALUES ("Tubos e conexão","Hidraulico");

INSERT INTO tb_categoria (tipo,categoria)
VALUES ("Equipamento para Construção","Construção");

-- Lista todos os dados da tabela tb_categorias
SELECT * FROM tb_categoria;

-- Criar a Tabela tb_produtos
CREATE TABLE tb_produto(
id bigint AUTO_INCREMENT,
nome varchar(255) NOT NULL,
quantidade varchar(255), 
especificacao varchar(255),
precoun decimal(6, 2) NOT NULL,
categoria_id bigint, 
PRIMARY KEY (id),
FOREIGN KEY (categoria_id) REFERENCES tb_categoria(id)
);

-- Insere dados na tabela tb_produtos
INSERT INTO tb_produto (nome, quantidade, especificacao, precoun, categoria_id)
VALUES ("Porcelanato","20m² ","Cor - cinza" ,34.99 , 1);

INSERT INTO tb_produto (nome, quantidade, especificacao, precoun, categoria_id)
VALUES ("Piso Cerâmico","32m² ","Cor - bege" ,27.99 , 1);

INSERT INTO tb_produto(nome, quantidade, especificacao, precoun, categoria_id)
VALUES ("Piso Le Blanc","24m² ","Cor - branco" ,31.99 , 1);

INSERT INTO tb_produto (nome, quantidade, especificacao, precoun, categoria_id)
VALUES ("Revestimento Galicia","12m² ","Cor - cinza" ,41.99 , 2);

INSERT INTO tb_produto (nome, quantidade, especificacao, precoun, categoria_id)
VALUES ("Revestimento Montaggio","10m² ","Cor - Preto" ,38.99 , 2);

INSERT INTO tb_produto (nome, quantidade, especificacao, precoun, categoria_id)
VALUES ("Areia","40kg ","Nenhuma" ,3.99 , 3);

INSERT INTO tb_produto (nome, quantidade, especificacao, precoun, categoria_id)
VALUES ("Cano PVC","100mm ","Nenhuma",124.99 , 4);

INSERT INTO tb_produto (nome, quantidade, especificacao, precoun, categoria_id)
VALUES ("Abafador de Ruído","3 unidades ","Nenhuma" ,38.99 , 5);

-- Visualiza todos os dados da tabela tb_produtos
SELECT * FROM tb_produto;

-- Mostrar a tabela no intervalo da condição:
SELECT * FROM tb_produto WHERE precoun BETWEEN 3 and 60;

-- Mostrar produtos que tem a letra c:
SELECT * FROM tb_produto WHERE nome LIKE "%c%";

-- mostrar produtos com o preço maior que 50 reais
SELECT * FROM tb_produto WHERE precoun >50;

-- ------------------------------------------------------------------------------
-- COMO CONSTRUIR A CONSULTA USANDO O JOIN, PRIMEIRO CASO (INNER):
-- pegar a chave primária que está na tabela categoria
-- INNER = intersecção de tb_produto com tb_categoria

SELECT nome, quantidade, especificacao, precoun, categoria_id, 
tb_categoria.tipo, tb_categoria.categoria
FROM tb_produto INNER JOIN tb_categoria
ON tb_produto.categoria_id = tb_categoria.id;

-- INTERSECÇÃO + ESPECIFICAÇÃO DA CATEGORIA
SELECT nome, quantidade, especificacao, precoun, categoria_id, 
tb_categoria.tipo, tb_categoria.categoria
FROM tb_produto INNER JOIN tb_categoria
ON tb_produto.categoria_id = tb_categoria.id WHERE tb_categoria.tipo="Pisos";
