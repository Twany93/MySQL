-- Apagar Banco de Dados db_cursoDaMinhaVida
DROP DATABASE db_cursoDaMinhaVida;

-- Recriar o Banco de db_cidade_das_frutas
CREATE DATABASE db_cursoDaMinhaVida;

-- Selecionar o Banco de Dados db_cidade_das_frutas
USE db_cursoDaMinhaVida;

-- Criar a tabela tb_categoria
CREATE TABLE tb_categoria(
id bigint AUTO_INCREMENT,
tipo varchar(255) NOT NULL,
area varchar(255),
qthoras int,
PRIMARY KEY (id)
);

-- Insere dados na tabela tb_categoria
INSERT INTO tb_categoria (tipo,area,qthoras)
VALUES ("longa duração","Ciências Biológicas",40);

INSERT INTO tb_categoria (tipo,area,qthoras)
VALUES ("média duração","Linguagem de Programação ",26);

INSERT INTO tb_categoria (tipo,area,qthoras)
VALUES ("média duração","Banco de dados",24);

INSERT INTO tb_categoria (tipo,area,qthoras)
VALUES ("curta duração","rede social profissional",8);

INSERT INTO tb_categoria (tipo,area,qthoras)
VALUES ("média duração","linguagem de Programação voltada a Matemática",22);

-- Lista todos os dados da tabela tb_categorias
SELECT * FROM tb_categoria;

-- Criar a Tabela tb_produtos
CREATE TABLE tb_produto(
id bigint AUTO_INCREMENT,
curso varchar(255) NOT NULL,
professor varchar(255) NOT NULL,
metodologia varchar(255) NOT NULL,
preco decimal(6, 2),
categoria_id bigint, 
PRIMARY KEY (id),
FOREIGN KEY (categoria_id) REFERENCES tb_categoria(id)
);

-- Insere dados na tabela tb_produtos
INSERT INTO tb_produto(curso, professor, metodologia, preco, categoria_id)
VALUES ("JAVA", "Jeff", "material didático + vídeos", 249.90, 2);

INSERT INTO tb_produto(curso, professor, metodologia, preco, categoria_id)
VALUES ("Git e Github", "Natalia", "vídeos", 49.90, 4);

INSERT INTO tb_produto(curso, professor, metodologia, preco, categoria_id)
VALUES ("Biologia Enem", "Jubilu", "material didático + vídeos + testes", 399.90, 1);

INSERT INTO tb_produto(curso, professor, metodologia, preco, categoria_id)
VALUES ("Python", "Renato", "material didático + vídeos", 269.90, 5);

INSERT INTO tb_produto(curso, professor, metodologia, preco, categoria_id)
VALUES ("C++", "Guilherme", "material didático + vídeos + exercícios ", 249.90, 2);

INSERT INTO tb_produto(curso, professor, metodologia, preco, categoria_id)
VALUES ("MySQL", "Rafael", "material didático + vídeos + exercícios", 149.90, 3);

INSERT INTO tb_produto(curso, professor, metodologia, preco, categoria_id)
VALUES ("Linkedin", "Daniela", "material didático", 49.90, 4);

INSERT INTO tb_produto(curso, professor, metodologia, preco, categoria_id)
VALUES ("JavaScript", "Isabel", "material didático + vídeo + exercício", 289.90, 2);

-- Visualiza todos os dados da tabela tb_produtos
SELECT * FROM tb_produto;

-- Mostrar a tabela no intervalo da condição:
SELECT * FROM tb_produto WHERE preco BETWEEN 3 and 60;

-- Mostrar produtos que tem a letra c:
SELECT * FROM tb_produto WHERE curso LIKE "%j%";

-- mostrar produtos com o preço maior que 50 reais
SELECT * FROM tb_produto WHERE preco >50;

-- ------------------------------------------------------------------------------
-- COMO CONSTRUIR A CONSULTA USANDO O JOIN, PRIMEIRO CASO (INNER):
-- pegar a chave primária que está na tabela categoria
-- INNER = intersecção de tb_produto com tb_categoria

SELECT curso, professor, metodologia, preco, categoria_id, 
tb_categoria.area, tb_categoria.tipo, tb_categoria.qthoras
FROM tb_produto INNER JOIN tb_categoria
ON tb_produto.categoria_id = tb_categoria.id;

-- INTERSECÇÃO + ESPECIFICAÇÃO DA CATEGORIA
SELECT curso, professor, metodologia, preco, categoria_id, 
tb_categoria.area, tb_categoria.tipo, tb_categoria.qthoras
FROM tb_produto INNER JOIN tb_categoria
ON tb_produto.categoria_id = tb_categoria.id WHERE tb_categoria.area="Linguagem de Programação " ;