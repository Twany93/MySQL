-- Apagar Banco de Dados db_rh
DROP DATABASE db_rh;

-- Recriar o Banco de db_rh
CREATE DATABASE db_rh;

-- Selecionar o Banco de Dados db_rh
USE db_rh;

-- Criar a Tabela tb_colaboradores
CREATE TABLE tb_colaboradores(
id bigint AUTO_INCREMENT,
nome varchar(255) NOT NULL,
setor varchar(255) NOT NULL,
funcao varchar(255) NOT NULL,
email varchar(255) NOT NULL,
salario decimal(6, 2), 
PRIMARY KEY (id)
);

-- Insere dados na tabela tb_colaboradores
INSERT INTO tb_colaboradores(nome, setor,funcao, email, salario)
VALUES ("Jorge Igor", "Seleção e treinamento","Recrutador", "jorgeigor.rh@gmail.com", 4499.90);

INSERT INTO tb_colaboradores(nome, setor,funcao, email, salario)
VALUES ("Marcelo Bechler", "Consultoria","Consultor Sr", "bechler.rh@gmail.com", 6999.90);

INSERT INTO tb_colaboradores(nome, setor,funcao, email, salario)
VALUES ("Tati Montovani", "Contabilidade","Analista", "ttmontovani.rh@gmail.com", 5000.90);

INSERT INTO tb_colaboradores(nome, setor,funcao, email, salario)
VALUES ("isabelli Pagliari", "Estagiária","Assistente da Consultoria" ,"isapagliari.rh@gmail.com", 1999.90);

INSERT INTO tb_colaboradores(nome, setor,funcao, email, salario)
VALUES ("Fred Caldeira", "Marketing", "Coordenador de Marketing Digital","fredcaldeira.rh@gmail.com", 4799.90);

-- Lista todos os dados da tabela tb_categorias
SELECT * FROM tb_colaboradores;

-- mostrar salario com o preço maior que 2000 reais
SELECT * FROM tb_colaboradores WHERE salario >2000;

-- mostrar salario com o preço menor que 2000 reais
SELECT * FROM tb_colaboradores WHERE salario <2000;

-- atualizar registro com um novo
UPDATE tb_colaboradores SET salario= 4999.99, nome="Jorge Ighor" Where id=1;

-- Lista todos os dados da tabela tb_categorias
SELECT * FROM tb_colaboradores ORDER BY id;

