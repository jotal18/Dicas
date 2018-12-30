-- Tipos de Dados ---------------------------------------
A separação de fração é feita por . (ponto);

BOOLEAN    -> TINYINT (numérico; 0 = false; outro valor = true);
CHAR       -> string (fixo; 0 até 255 caracteres; rápido em pesquisa; reserva espaço de forma desnecessária; campos com a quantidade de caracteres fixo: ex: UF, sexo);
VARCHAR    -> string (variável; 0 até 255 caracteres; ocupa apenas espaço necessário; lento em pesquisa; Ex: rua, email, nome, endereço);
INT        -> numérico (até 11, mas pode ser passado valor, Ex: int(2));
FLOAT(x,y) -> numérico (x->indica a quantidade de dígitos e y-> quantidade de casas decimais que estão inclusos na quantidade de dígitos);
DATETIME   -> recebe a data como string, mas armazena como data (utiliza o formato ISO 8601, ou seja, as datas devem ter o formato 'AAAA-MM-DD');

-- CRIAR DATABASE
CREATE DATABASE db_curso_web;

-- APAGAR DATABASE
DROP DATABASE db_curso_web;

-- CRIAR TABELA 
CREATE TABLE tb_cursos (
	id_curso INT NOT NULL,
    imagem_curso VARCHAR(100) NOT NULL,
    nome_curso CHAR(50) NOT NULL,
    resumo TEXT NULL,
    data_cadastro DATETIME NOT NULL,
    ativo BOOLEAN DEFAULT TRUE,
    investimento FLOAT(8,2) DEFAULT 0
);

-- APAGAR TABELA
DROP TABLE tb_cursos;

-- DEFININAÇÃO PADRÃO DE CAMPOS
NULL;
CURRENT_TIMESTAMP -> o valor padrão do campo terá a data e hora do armazenamento;

-- RENOMEAR TABELA 
RENAME TABLE tb_cursos TO tb_cursos_web;

-- ADICIONAR COLUNA
ALTER TABLE tb_cursos ADD COLUMN carga_horaria VARCHAR(5) NOT NULL;

-- MODIFICAR COLUNA
ALTER TABLE tb_cursos CHANGE COLUMN carga_horaria carga_horaria INT(5) NOT NULL;

-- REMOVER COLUNA
ALTER TABLE tb_cursos DROP COLUMN carga_horaria;

-- INSERIR DADOS 
	-- A ordem das colunas não importa, mas os valores sim 
INSERT INTO tb_cursos(
	ativo, carga_horaria, data_cadastro, id_curso, imagem_curso, investimento, nome_curso, resumo
)
VALUES(
	1, 35, '2018-07-17 12:25:35', 2, 'curso_angular.jpg', 576.86, 'Web completo com JS','Aprenda a criar aplicações incríveis.'
	);
	
INSERT INTO pessoas(
	id, nome, nascimento, sexo, peso, altura, nacionalidade)
VALUES
(DEFAULT, 'Jota', '1955-12-30', 'F', '50.2', '1.65', 'EUA'),
(DEFAULT, 'Carlos', '1955-12-30', 'F', '50.2', '1.65', 'Irlanda'),
(DEFAULT, 'Fátima', '1955-12-30', 'F', '50.2', '1.65', 'Japão');

-- SELECT
SELECT ativo, resumo FROM tb_cursos;
SELECT ativo FROM tb_cursos;
SELECT * FROM tb_cursos;
	-- Operadores de comparação e lógico
SELECT * FROM tb_cursos WHERE interesse = 'jogos';
SELECT * FROM tb_cursos WHERE idade < 25;
SELECT * FROM tb_cursos WHERE idade = 25;
SELECT * FROM tb_cursos WHERE idade != 25;
SELECT * FROM tb_cursos WHERE idade <> 25;
SELECT * FROM tb_cursos WHERE idade < 25;
SELECT * FROM tb_cursos WHERE idade >= 25;
SELECT * FROM tb_cursos WHERE idade <= 25;
SELECT * FROM tb_cursos WHERE interesse = 'jogos' AND idade > 45;
SELECT * FROM tb_cursos WHERE interesse = 'jogos' OR idade > 45;
	-- Filtros
SELECT * FROM tb_cursos WHERE idade BETWEEN 18 AND 25; (pesquisa campos entre números/números e datas/datas)
SELECT * FROM tb_cursos WHERE idade IN ('jogos', 'Música', 'Esporte'); (pesquisa uma cadeia de valores que estão entre parênteses, números, string, datas, etc...)
		-- ou
SELECT * FROM tb_cursos WHERE idade NOT IN  ('jogos', 'Música', 'Esporte'); (pesquisa uma cadeia de valores que não estejam entre parênteses, números, string, datas, etc...)
SELECT * FROM tb_cursos WHERE nome LIKE '%e'; (Like pesquisa ocorrência dentro de uma coluna textual; % -> significa algum caractere ou não; _ -> significa que deve ter caractere)
SELECT * FROM tb_cursos WHERE nome LIKE '%e%';
SELECT * FROM tb_cursos WHERE nome LIKE 'e%';
SELECT * FROM tb_cursos WHERE nome LIKE '_riel';
SELECT * FROM tb_cursos WHERE nome LIKE '_ru_';
SELECT * FROM tb_cursos WHERE nome LIKE 'I_ _';
SELECT * FROM tb_cursos WHERE nome LIKE '%tt_';
	-- Ordenar resultado
SELECT * FROM tb_alunos WHERE idade BETWEEN 18 AND 59 ORDER BY nome ASC; (ASC é o ordenamento padrão)
SELECT * FROM tb_alunos WHERE idade BETWEEN 18 AND 59 ORDER BY nome DESC; (ordem decrescente)
SELECT * FROM tb_alunos WHERE idade BETWEEN 18 AND 59 ORDER BY nome ASC, idade DESC, estado ASC; (podem ser combinados)
	-- Limitar retorno da consulta
SELECT ativo FROM tb_alunos LIMIT 5; (limita a quantidade de registros; deve ser usado no final da query; começa do 0)
SELECT ativo FROM tb_alunos LIMIT 4 OFFSET 0; (o OFFSET determina de qual posição será retornado a quantidade de registros do LIMIT; o primeiro registro é considerado como 0)
		-- ou
SELECT * FROM tb_alunos LIMIT 4,0; (no caso o OFFSET foi omitido )
	-- Funções de agregação (MIN, MAX, AVG, SUM, COUNT)
SELECT MIN(investimento) FROM tb_cursos WHERE ativo = TRUE; (retorna o menor valor de uma coluna)
SELECT MAX(investimento) FROM tb_cursos; (retorna o menor valor de uma coluna)
SELECT AVG(investimento) FROM tb_cursos; (calcula a média dos valores da coluna)
SELECT SUM(investimento) FROM tb_cursos; (calcula todos os valores da coluna)
SELECT COUNT(investimento) FROM tb_cursos WHERE ativo = true; (retorna a quantidade de todos os registros da tabela)
	-- Seleções de agrupamento (GROUP BY, HAVING)
SELECT *, COUNT(*) AS Qtd FROM tb_alunos GROUP BY interesse; (agrupa registros com base em uma ou mais colunas cujos valores sejam iguais; permite realizar funções de agregação em cada subconjunto; deve ficar depois de FROM, WHERE e antes de ORDER BY)
SELECT estado, COUNT(*) AS total_de_registros FROM tb_alunos GROUP BY estado HAVING total_de_registros >= 5; (o HAVING precisa do GROUP BY; funciona como um filtro (parecido com WHERE) que atua em cima do GROUP BY)
SELECT estado, COUNT(*) AS total_de_registros FROM tb_alunos GROUP BY estado HAVING estado IN ('MG', 'SP');

-- UPDATE (DML)
UPDATE tb_cursos SET interesse = 'tecnologia', idade = 50; (atualiza os campos da tabela)
UPDATE tb_cursos SET interesse = 'tecnologia' WHERE id = 10; 

-- Deletar registros (DML)
DELETE FROM tb_cursos WHERE interesse = 'saúde';
DELETE FROM tb_alunos WHERE idade IN (10,18,22,28,34) AND interesse = 'Esporte';

-- Foreign Key
CREATE TABLE tb_descricoes_tecnicas(
	id_descricao_tecnica INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    fk_id_produto INT NOT NULL, -- a foreign key deve ser do mesmo tipo do campo da primary key
    descricao_tecnica TEXT NOT NULL,
    FOREIGN KEY(fk_id_produto) REFERENCES tb_produtos(id_produto)
);

-- Relacionamento entre tabelas
Um para Um -> cada item da tabela principal corresponde a um item da tabela secundária; o id da tabela principal será uma foreign key na tabela secundária;
Um para muitos -> um item da tabela principal poderá estar relacionado com vários itens da tabela secundária; o id da tabela principal será uma foreign key na tabela secundária;
Muitos para muitos -> um item de tabela estar relacionado com vários itens da outra tabela e vice-versa; é preciso cria uma tabela secundária para armazenar as foreign keys de ambas as tabelas;

-- JOIN 
		-- Right -> a junção começará da coluna imediatamente à direita
		-- Left -> a junção começará da coluna imediatamente à esquerda
	
	-- Left Join (prioriza todos os registros que estão na tabela depois de palavra FROM, 
	-- e somente mostrará os registros da tabela tb_pedidos que tiverem ocorrência com a tb_clientes)
SELECT * FROM tb_clientes LEFT JOIN tb_pedidos ON (tb_clientes.id_cliente = tb.pedidos.fk_id_cliente);
	-- ou várias junções
SELECT * FROM tb_pedidos LEFT JOIN tb_pedidos_produtos ON (tb_pedidos.id_pedido = tb_pedidos_produtos.fk_id_pedido) LEFT JOIN tb_produtos ON (tb_pedidos_produtos.fk_id_produto = tb_produtos.id_produto)
	
	-- Right Join (prioriza todos os registros que estão na tabela depois palavra RIGHT JOIN, 
	-- e somente mostrará os registros da tabela tb_clientes que tiverem ocorrência com a tb_clientes)
	-- caso na tb_pedidos tenha ocorrência do tipo null e na tb_clientes tenha algum registro, 
	-- essa linha não será mostrada, pois tb_pedidos está vazia neste registro e é é prioritária 
	-- por causa do RIGHT JOIN
SELECT * FROM tb_clientes RIGHT JOIN tb_pedidos ON (tb_clientes.id_cliente = tb.pedidos.fk_id_cliente);
	-- ou várias junções
SELECT * FROM tb_pedidos RIGHT JOIN tb_pedidos_produtos ON (tb_pedidos.id_pedido = tb_pedidos_produtos.fk_id_pedido) LEFT JOIN tb_produtos ON (tb_pedidos_produtos.fk_id_produto = tb_produtos.id_produto)

	-- Inner Join (mostrará somente os registros que se relacionarem)
SELECT * FROM tb_pedidos INNER JOIN tb_pedidos_produtos ON (tb_pedidos.id_pedido = tb_pedidos_produtos.fk_id_pedido);

-- Apelidar tabela (AS)
SELECT * FROM tb_produtos AS p LEFT JOIN tb_descricoes_tecnicas AS dt ON (p.id = dt.id_produto);

SELECT p.id_produto, p.produto, p.valor, dt.descricao_tecnica 
FROM tb_produtos AS p LEFT JOIN tb_descricoes_tecnicas AS dt ON (p.id_produto = dt.id_produto)
WHERE p.valor >= 500 ORDER BY p.valor ASC;

-- Formatar data
DATE_FORMAT(t.data, '%d/%m/%Y %H:%i');