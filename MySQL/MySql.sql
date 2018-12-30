
-- DDL - DATA DEFINITION LANGUAGE
	-- CREATE DATABASE
	-- CREATE TABLE
	-- ALTER TABLE
	-- DROP TABLE
    
-- DML - DATA MANIPULATION LANGUAGE
	-- INSERT INTO
    -- UPDATE
    -- DELETE
    -- TRUNCATE

-- DQL - DATA QUERY LANGUAGE
	-- SELECT

-- Definição de padrão de campos ------------------------------------------------

DEFAULT NULL -> valor será nulo e pode ser passado ou não na hora de armazenar o dado;
DEFAULT CURRENT_TIMESTAMP -> o valor padrão do campo terá a data e hora do armazenamento;

-- CRIAR QUERYs ALEATÓRIAS -------------------------------------------
https://www.generatedata.com/

-- Comentário em MySql ---------------------------------------------------------------------------------

	-- Pode ser usado o #, --, /* */	
    
    
-- SELECIONAR DATABASE (BANCO DE DADOS) -----------------------------------------------------------------

USE cadastro;


-- MOSTRAR OS DATABASES (BANCO DE DADOS)/TABELAS CRIADO(AS) (PRECISA USAR O COMANDO USE 'database')-----

SHOW DATABASES;

SHOW TABLES;


-- MOSTRA O COMANDO QUE CRIOU O DATABASE / TABELA -------------------------------------------------------

SHOW CREATE DATABASE exemplo;

SHOW CREATE TABLE amigos;


-- DESCRIÇÃO DA TABELA ---------------------------------------------------------------------------------

DESCRIBE pessoas;
	-- OU --
DESC pessoas;


-- DELETAR DATABASE/TABELA ----------------------------------------------------------------------------

DROP DATABASE cadastro;

DROP TABLE pessoas;


-- CRIAR DATABASE (BANCO DE DADOS) -------------------------------------------------------------------

CREATE DATABASE cadastro;
	-- ou
CREATE DATABASE cadastro
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;

-- Tipos de Dados ---------------------------------------
A separação de fração é feita por . (ponto);

BOOLEAN    -> TINYINT (numérico; 0 = false; outro valor = true);
CHAR       -> string (fixo; 0 até 255 caracteres; rápido em pesquisa; reserva espaço de forma desnecessária; campos com a quantidade de caracteres fixo: ex: UF, sexo);
VARCHAR    -> string (variável; 0 até 255 caracteres; ocupa apenas espaço necessário; lento em pesquisa; Ex: rua, email, nome, endereço);
INT        -> numérico (até 11, mas pode ser passado valor, Ex: int(2));
FLOAT(x,y) -> numérico (x->indica a quantidade de dígitos e y-> quantidade de casas decimais que estão inclusos na quantidade de dígitos);
DATETIME   -> recebe a data como string, mas armazena como data (utiliza o formato ISO 8601, ou seja, as datas devem ter o formato 'AAAA-MM-DD');


-- CRIAR TABELAS -------------------------------------------------------------------------------------
	-- campos com a definição NULL podem ser omitidas na hora da inserção de valores nos campos
CREATE TABLE pessoas (
	nome VARCHAR(30),
    idade TINYINT,
    sexo CHAR(1),
    peso FLOAT,
    altura FLOAT,
    nacionalidade VARCHAR(20)
);

CREATE TABLE tb_cursos (
	id_curso INT NOT NULL,
    imagem_curso VARCHAR(100) NOT NULL,
    nome_curso CHAR(50) NOT NULL,
    resumo TEXT NULL,
    data_cadastro DATETIME NOT NULL,
    ativo BOOLEAN DEFAULT TRUE,
    investimento FLOAT(8,2) DEFAULT 0
);

CREATE TABLE tb_descricoes_tecnicas(
	id_descricao_tecnica INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    fk_id_produto INT NOT NULL, 
    descricao_tecnica TEXT NOT NULL,
    FOREIGN KEY(fk_id_produto) REFERENCES tb_produtos(id_produto)
);

CREATE TABLE pessoas (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR (30) NOT NULL,
	nascimento DATE,
	sexo ENUM('M', 'F'),
    peso DECIMAL(5,2),
    altura DECIMAL(3,2),
    nacionalidade VARCHAR(20) DEFAULT 'BRASIL'
) DEFAULT CHARSET = utf8;

CREATE TABLE pessoas (
	id INT NOT NULL AUTO_INCREMENT,
	nome VARCHAR (30) NOT NULL,
	nascimento DATE,
	sexo ENUM('M', 'F'),
    peso DECIMAL(5,2),
    altura DECIMAL(3,2),
    nacionalidade VARCHAR(20) DEFAULT 'BRASIL',
    PRIMARY KEY (id)
) DEFAULT CHARSET = utf8;

CREATE TABLE IF NOT EXISTS cursos(
	nome VARCHAR(30) NOT NULL UNIQUE,
	descricao TEXT,
    carga INT UNSIGNED,
    totaulas INT UNSIGNED,
    ano YEAR DEFAULT '2018' 
) DEFAULT CHARSET=utf8;


-- INSERIR DADOS NA TABELA ----------------------------------------------------------------------------

INSERT INTO pessoas 
(id, nome, nascimento, sexo, peso, altura, nacionalidade)
VALUES
('1', 'Creuza', '1920-12-30', 'F', '50.2', '1.65', 'Brasil');

INSERT INTO pessoas 
(id, nome, nascimento, sexo, peso, altura, nacionalidade)
VALUES
(DEFAULT, 'Creuza', '1920-12-30', 'F', '50.2', '1.65', DEFAULT);

INSERT INTO pessoas 
VALUES
(DEFAULT, 'Creuza', '1920-12-30', 'F', '50.2', '1.65', DEFAULT);

INSERT INTO pessoas 
(id, nome, nascimento, sexo, peso, altura, nacionalidade)
VALUES
(DEFAULT, 'Jota', '1955-12-30', 'F', '50.2', '1.65', 'EUA'),
(DEFAULT, 'Carlos', '1955-12-30', 'F', '50.2', '1.65', 'Irlanda'),
(DEFAULT, 'Fátima', '1955-12-30', 'F', '50.2', '1.65', 'Japão');

INSERT INTO pessoas 
VALUES
(DEFAULT, 'Jota', '1955-12-30', 'F', '50.2', '1.65', 'EUA'),
(DEFAULT, 'Carlos', '1955-12-30', 'F', '50.2', '1.65', 'Irlanda'),
(DEFAULT, 'Fátima', '1955-12-30', 'F', '50.2', '1.65', 'Japão');


-- ALTERAR CAMPOS/COLUNAS DA TABELA ------------------------------------------------------------------------------

ALTER TABLE cursos
RENAME TO teste;
	-- É opcional usar COLUMN
ALTER TABLE pessoas
ADD COLUMN profissao VARCHAR(10);
	-- OU --
ALTER TABLE pessoas
ADD profissao VARCHAR(10);

ALTER TABLE pessoas
ADD COLUMN profissao VARCHAR(10) AFTER nome;

ALTER TABLE pessoas
ADD COLUMN codigo INT FIRST;

ALTER TABLE cursos
ADD COLUMN idcurso INT FIRST;

ALTER TABLE cursos
ADD PRIMARY KEY (idcurso);
	-- MODIFY não permite renomear nome da tabela, somente o CHANGE
ALTER TABLE pessoas
MODIFY COLUMN profissao VARCHAR(20) NOT NULL DEFAULT '';

ALTER TABLE pessoas
CHANGE COLUMN profissao prof VARCHAR(20);

ALTER TABLE pessoas
DROP COLUMN profissao;
	-- OU --
ALTER TABLE pessoas
DROP profissao;

ALTER TABLE email_list ADD id INT NOT NULL AUTO_INCREMENT FIRST,
ADD PRIMARY KEY (id);

-- SELECIONAR TABELA ----------------------------------------------------------------------------------

	-- operadores lógicos e comparação
SELECT * FROM tb_cursos WHERE interesse = 'jogos';
SELECT * FROM tb_cursos WHERE idade < 25;
SELECT * FROM tb_cursos WHERE idade = 25;
SELECT * FROM tb_cursos WHERE idade < 25;
SELECT * FROM tb_cursos WHERE idade >= 25;
SELECT * FROM tb_cursos WHERE idade <= 25;
SELECT * FROM tb_cursos WHERE interesse = 'jogos' AND idade > 45;
SELECT * FROM tb_cursos WHERE interesse = 'jogos' OR idade > 45;

SELECT ativo FROM tb_cursos;
SELECT ativo, resumo FROM tb_cursos;

SELECT * FROM cursos
ORDER BY nome ASC; -- Padrão de ordenamento

SELECT * FROM cursos
ORDER BY nome DESC;

SELECT nome, carga, ano FROM cursos
ORDER BY nome;

SELECT ano, nome, carga FROM cursos
ORDER BY ano, nome;

SELECT * FROM cursos
WHERE ano = '2016'
ORDER BY nome;
	-- Operadores Lógicos permitidos = > < != <>
SELECT nome, descricao FROM cursos
WHERE ano <= '2015'
ORDER BY nome;

SELECT nome, descricao ano FROM cursos
WHERE ano != 2016
ORDER BY ano, nome;
	-- Filtra registros entre números e datas ('AAAA-MM-DD')
SELECT nome, ano FROM cursos
WHERE ano BETWEEN 2014 AND 2016
ORDER BY ano DESC, nome ASC;
	-- Ou
SELECT nome FROM cursos
WHERE ano BETWEEN '2018-05-01' AND '2015-05-02';

SELECT nome FROM cursos
WHERE nome.fk_id_cursos = 2;

	-- IN procura somente critérios de busca dentro dos agurmentos ()
SELECT nome, descricao, ano FROM cursos
WHERE ano IN (2014, 2016)
ORDER BY ano;
	-- Ou
SELECT nome, descricao, ano FROM cursos
WHERE ano IN (2014, 2016)
ORDER BY ano;

SELECT nome, carga, totaulas FROM cursos
WHERE carga > 35 AND totaulas < 30;

SELECT nome, carga, totaulas FROM cursos
WHERE carga > 35 OR totaulas < 30;
	-- % no LIKE significa nada ou várias coisas
SELECT * FROM cursos
WHERE nome LIKE 'p%';

SELECT * FROM cursos
WHERE nome LIKE '%A';

SELECT * FROM cursos
WHERE nome LIKE '%A%';

SELECT * FROM cursos
WHERE nome NOT LIKE '%A%';

SELECT * FROM cursos
WHERE nome LIKE 'PH%P';
	-- O '_' exige que tenha algum caractere
SELECT * FROM cursos
WHERE nome LIKE 'PH%P_';

SELECT * FROM cursos
WHERE nome LIKE 'P_P%';

SELECT ativo FROM tb_alunos LIMIT 5;
SELECT ativo FROM tb_alunos LIMIT 4 OFFSET 0;
	-- ou
SELECT * FROM tb_alunos LIMIT 4,0;
	
SELECT * FROM tb_alunos LIMIT 4,0; (no caso o OFFSET foi omitido )
	-- Seleciona todas as ocorrências diferentes em uma tabela sem repeti-las
SELECT DISTINCT nacionalidade FROM gafanhotos ORDER BY nacionalidade;
	-- Conta os registros da tabela
SELECT COUNT(*) FROM cursos;

SELECT COUNT(nome) FROM cursos;

SELECT COUNT(*) FROM cursos WHERE carga > 40;

SELECT MAX(carga) FROM cursos;

SELECT MIN(totaulas) FROM cursos;

SELECT MAX(totaulas) FROM cursos WHERE ano = '2016';

SELECT nome, MIN(totaulas) FROM cursos WHERE ano = '2016';
	-- Soma os campos de uma coluna
SELECT SUM(totaulas) FROM cursos WHERE ano = '2016';
	-- Média dos registros
SELECT AVG(totaulas) FROM cursos WHERE ano = '2016';
	-- O GROUP BY deve ficar depois de FROM, WHERE e antes de ORDER BY 
SELECT DISTINCT totaulas, count(*) FROM cursos 
GROUP BY totaulas
ORDER BY totaulas;

SELECT carga, count(nome) FROM cursos WHERE totaulas = '30'
GROUP BY carga;
	-- O HAVING funciona como um critério de seleção do GROUP BY / O HAVING só funciona com o campo informado no GROUP BY
SELECT ano, count(*) FROM cursos 
GROUP BY ano
HAVING count(ano) >= '5'
ORDER BY count(*);

SELECT ano, count(*) FROM cursos
WHERE totaulas > '30'
GROUP BY ano
HAVING ano > '2013'
ORDER BY count(*) desc;
	-- Irá informar um erro conforme exposto acima
SELECT ano, count(*) FROM cursos 
GROUP BY ano
HAVING totaulas >= '5'
ORDER BY count(*);

SELECT AVG(carga) FROM cursos;

SELECT carga, count(*) FROM cursos
WHERE ano > '2015'
GROUP BY carga
HAVING carga > (SELECT AVG(carga) FROM cursos);


-- UPDATE/ATUALIZAR CAMPOS/LINHAS DA TABELA ----------------------------------------------------------------------

UPDATE cursos
SET nome = 'HTML5'
WHERE idcurso = '1';

UPDATE cursos
SET nome = 'Java', ano = '2018'
WHERE idcurso = '5';

UPDATE cursos
SET nome = 'Java', carga = '10',ano = '2018'
WHERE idcurso = '5'
LIMIT 1;

-- DELETAR/APAGAR CAMPOS/LINHAS DA TABELA ------------------------------------------------------------------------

	-- Deleta todas as linhas da tabela cursos
DELETE FROM cursos;
	-- Deleta a linha da tabela cursos quando o idcuro for igual a 8
DELETE FROM cursos
WHERE idcurso = '8';
	-- Opcional colocar o nome do banco de dados e o nome da tabela antes
DELETE FROM cadastro . cursos
WHERE cursos . idcurso = '8';


-- DELETAR/APAGAR TODAS AS LINHAS/REGISTROS DA TABELA --------------------------------------------------------------

TRUNCATE TABLE cursos;
	-- OU
TRUNCATE cursos;


-- FOREIGN KEY (A CHAVE ESTRANGEIRA DEVE SER DO MESMO TIPO DA CHAVE PRIMÁRIA) ------------------------------

CREATE TABLE tb_descricoes_tecnicas(
	id_descricao_tecnica INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_produto INT NOT NULL, -- a chave estrangeira não pode ser vazia; não precisa ter o mesmo nome da primary key; deve ser do mesmo tipo da chave primária
    descricao_tecnica TEXT NOT NULL,
    FOREIGN KEY(id_produto) REFERENCES tb_produtos(id_produto) -- indicar a tabela original da primary key
);


ALTER TABLE gafanhotos 
ADD COLUMN cursopreferido INT;

ALTER TABLE gafanhotos
ADD FOREIGN KEY(cursopreferido)
REFERENCES cursos(idcurso);

-- INNER JOIN -------------------------------------------------------------------------------
	
    -- Criar JOIN
    -- INNER JOIN - mostrará somente os registros que se relacionarem
SELECT * FROM tb_pedidos 
INNER JOIN tb_pedidos_produtos 
ON (tb_pedidos_produtos = tb_pedidos);
	-- ou
SELECT g.nome, g.cursopreferido, c.nome, c.ano
FROM gafanhotos AS g JOIN cursos AS c
ON c.idcurso = g.cursopreferido 
ORDER BY g.nome;
	-- LEFT JOIN - priorizará a tabela depois do FROM, ou seja, irá mostrar todos os registros da
	-- tabela gafanhotos e mostrará os registro onde houver a associação da tabela cursos com a 
	 -- tabela gafanhoto
SELECT g.nome, g.cursopreferido, c.nome, c.ano
FROM gafanhotos AS g LEFT OUTER JOIN cursos AS c
ON c.idcurso = g.cursopreferido;
	-- OU --
SELECT g.nome, g.cursopreferido, c.nome, c.ano
FROM gafanhotos AS g LEFT JOIN cursos AS c
ON c.idcurso = g.cursopreferido;
	-- RIGHT JOIN
SELECT g.nome, g.cursopreferido, c.nome, c.ano
FROM gafanhotos AS g RIGHT JOIN cursos AS c
ON c.idcurso = g.cursopreferido
ORDER BY c.nome;

-- APELIDAR / NOMES ALTERNATIVOS PARA COLUNAS / TABELAS  (ALIAS - AS) -----------------------------------------------------------------

SELECT * FROM gafanhotos AS g;
	-- OU --
SELECT * FROM gafanhotos g;

SELECT interesse AS I FROM gafanhotos AS g;

SELECT g.nome, g.cursopreferido, c.nome, c.ano
FROM gafanhotos AS g LEFT JOIN cursos AS c
ON c.idcurso = g.cursopreferido;

-- RENOMEAR TABELA ----------------------------------------------------------------------------------------------------

RENAME TABLE gafanhotos TO teste;
	-- OU --
ALTER TABLE teste
RENAME TO gafanhotos;

-- VIEW ----------------------------------------------------------------------------------------------------------
	
    -- Criar VIEW
CREATE VIEW vw_teste AS 
SELECT gafanhotos.nome AS g,
cursos.nome AS c
FROM gafanhotos
INNER JOIN cursos
ON gafanhotos.id = cursos.idcurso;
	-- SELECIONAR A VIEW
SELECT g, c FROM vw_teste;
	-- ALTERAR VIEW
ALTER VIEW vw_teste
AS SELECT gafanhotos.nome AS g,
cursos.nome AS c,
cursos.ano AS d
FROM gafanhotos
INNER JOIN cursos
ON gafanhotos.id = cursos.idcurso;
SELECT g, c, d FROM vw_teste;
	-- DELETAR VIEW
DROP VIEW vw_teste;

-- CRIAR VARIÁVEL -------------------------------------------------------------------------

SET @minhavariavel = 'teste';


-- FUNCÃO --------------------------------------------------------------------------------------------------------------
	
    -- Criar Função
CREATE FUNCTION fn_teste(a DECIMAL(10,2), b INT)
RETURNS INT
RETURN a*b;
	-- Invocar a função
SELECT fn_teste(2.5, 4) AS Resultado;
	-- ou
SELECT nome, fn_teste(carga, 6) AS 'QTD de horas do curso * 6' 
FROM cursos
WHERE idcurso = 7;
	-- Deletar a função
DROP FUNCTION fn_teste;

-- STORED PROCEDURES (Procedimento Armazenado - Desde a versão 5.0 do MySQL) -------------------------------------------------------------------------
	
    -- Criar PROCEDURE simples (sem delimitador)
CREATE PROCEDURE verTotaulas (varCurso SMALLINT)
SELECT CONCAT('O total de aulas do ', nome, ' é ', totaulas) AS total
FROM cursos
WHERE idcurso = varCurso;
	-- Invocar Procedure
CALL verTotaulas(5);
	-- Deletar Procedure
DROP PROCEDURE verTotaulas;

	-- TIPOS DE ARGUMENTOS DOS PARÂMETROS NAS PROCEDURES - IN (é padrão, não precisa escrever), OUT, INOUT; 

		-- Parâmetro do tipo IN (passagem por valor, ou seja, não é alterado)
DELIMITER $$
CREATE PROCEDURE verTotaulas (IN varCurso SMALLINT)
BEGIN
	SELECT CONCAT('O total de aulas do ', nome, ' é ', totaulas) AS total
	FROM cursos
	WHERE idcurso = varCurso;
END$$
DELIMITER ;

CALL verTotaulas(5);
	-- OU --
SET @minhavariavel = '5';
CALL verTotaulas(@minhavariavel);

		-- Parâmetro do tipo OUT (o valor é alterado dentro da procedure - valor por referência)
DELIMITER $$
CREATE PROCEDURE verNome (IN varCurso SMALLINT, OUT nomeCurso VARCHAR(50))
BEGIN
	SELECT nome 
    INTO nomeCurso 
	FROM cursos
	WHERE idcurso = varCurso;
END$$
DELIMITER ;

CALL verNome(5, @nomeCurso);
SELECT @nomeCurso;

	-- Parâmetro do tipo INOUT (valor passado a procedure e na saída o valor é alterado)
DELIMITER //
CREATE PROCEDURE aumento (valor DECIMAL(10,2), taxa DECIMAL (10,2))
BEGIN
	SET valor = valor + valor * taxa  / 100;
END//
DELIMITER ; 

SET @valorinicial = 20.00;
SELECT @valorinicial;

CALL aumento(@valorinicial, 15.00);
SELECT @valorinicial;
	
-- Blocos BEGIN..END com DELIMITER --------------------------------------------------------------------------------------------------------------------
	
    -- Com função
		-- Criando a função
DELIMITER $$
CREATE FUNCTION fn_teste(a DECIMAL(10,2), b INT) RETURNS INT
BEGIN
	RETURN a*b;
END$$
DELIMITER ;
		-- Invocando a função
SELECT fn_teste(2.5, 7) AS Resultado;

	-- Com procedure
		-- Criano a Procedure
DELIMITER $$ -- Pode ser usado um delimitador diferente de $$, no caso foi utilizado o //
CREATE PROCEDURE verTotaulas (varCurso SMALLINT)
BEGIN
	SELECT CONCAT('O total de aulas do ', nome, ' é ', totaulas) AS total
	FROM cursos
	WHERE idcurso = varCurso;
    
    SELECT 'Procedimento executado com sucesso!';
END$$
DELIMITER ;
		-- Invocando a Procedure
CALL verTotaulas(3);

-- ESCOPO DAS VARIÁVEIS ---------------------------------------------------------------------------------------
DELIMITER //
CREATE FUNCTION calcula_desconto(curso INT, desconto DECIMAL(10,2)) RETURNS DECIMAL (10,2)
BEGIN
	DECLARE preco DECIMAL(10,2); -- Declarando variável
    
    SELECT totaulas FROM cursos
    WHERE idcurso = curso INTO preco;
    RETURN preco - desconto;
END //
DELIMITER ;

SELECT * FROM cursos WHERE idcurso = 4;
SELECT calcula_desconto(4, 10.00);


-- Algumas Funções --------------------------------------------------------------------
SLQ_CALC_FOUND_ROWS e FOUND_ROWS()
NOW() -- Insere data e hora locais;

-- COLLATION ----------------------------------------
utf8_general_ci -- reune o maior número de caracteres e não faz distinção entre maiúscula e minúscula

-- Executar scrip no phpmyadmim --------------------------------------
abra o script em algum editor de texto de código-fonte;
copie  o script;
abra o phpmyadmim e clique em cima do DB (lado esquerdo) que irá incluir o script;
clique na aba SQL do lado esquerdo e cole o script;
clique em executar no canto inferior direito;

-- RELACIONAMENTOS ENTRE TABELAS ------------------------------
Um para Um -> cada item da tabela principal corresponde a um item da tabela secundária; o id da tabela principal será uma foreign key na tabela secundária;
Um para muitos -> um item da tabela principal poderá estar relacionado com vários itens da tabela secundária; o id da tabela principal será uma foreign key na tabela secundária;
Muitos para muitos -> um item de tabela estar relacionado com vários itens da outra tabela e vice-versa; é preciso cria uma tabela secundária para armazenar as foreign keys de ambas as tabelas;

-- FORMATAR DATA ---------------------------------
DATE_FORMAT(t.data, '%d/%m/%Y %H:%i');





