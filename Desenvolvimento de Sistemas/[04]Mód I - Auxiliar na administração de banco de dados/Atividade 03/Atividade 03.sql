/*
Atividade 3

Contexto
Percebe-se que o banco de dados para o sistema de lojas enfrenta alguns “gargalos” de desempenho, de modo que as operações no sistema 
estão demorando mais do que o esperado – algumas delas acontecem com frequência. Você tem a tarefa de propor melhorias a algumas dessas consultas, 
tornando-as mais eficientes.
 
Atividade
Utilizando o banco de dados proposto para as atividades, realize as consultas expostas no arquivo do item 'Scripts de Consulta - Atividade 3'.
Para cada consulta presente no script, faça o seguinte:

    1- Execute o comando EXPLAIN mostrando detalhes da execução da consulta e tire um print.
    
    2- Realize ajustes de otimização nas consultas utilizando JOINs entre as tabelas, assim como removendo os asteriscos (*) 
    e definindo quais colunas devem ser retornadas de cada consulta, a fim de otimizá-la.
    
    3- Crie índices que possam se beneficiar do recurso para melhorar o desempenho das consultas, considerando principalmente colunas utilizadas nas cláusulas WHERE.
    
    4- Execute novamente o comando EXPLAIN, mostrando agora os detalhes da execução da consulta depois das otimizações realizadas e tire um print.
    
    5- Crie uma view para cada uma das consultas ajustadas com JOINS.
    
    6- Armazene as consultas ajustadas e os demais comandos em scripts .sql para a entrega. Utilize comentários para organizar e explicar seus scripts.

 
Entrega
Envie, no local destinado à entrega, até a data indicada no cronograma de estudos, os scripts .sql desenvolvidos na atividade.
*/
USE uc4atividades;

/***
consulta para um relatório de todas as vendas pagas em dinheiro. 
Necessários para o relatório data da venda, valor total; produtos vendidos, quantidade e valor unitário; nome do cliente, cpf e telefone.
Ordena-se pela data de venda, as mais recentes primeiro.
**/
EXPLAIN SELECT * FROM venda v, item_venda iv, produto p, cliente c, funcionario f
WHERE v.id = iv.venda_id AND c.id = v.cliente_id AND p.id = iv.produto_id AND f.id = v.funcionario_id and tipo_pagamento = 'D'

/*Observa-se:

    Tabela v (venda):
        O tipo de junção é ALL, o que indica uma varredura completa da tabela. 
        Isso significa que não está sendo usado nenhum índice para acessar os registros, 
        o que pode resultar em um desempenho mais baixo, especialmente se a tabela for grande.

    Tabela f (funcionario);
    Tabela c (cliente);
    Tabela p (produto):

        Estão usando o índice primário (PRIMARY), o que é eficiente.
        O tipo de junção é eq_ref, o que, segundo a documentação é bem recomendada por ser uma comparação exara entre chaves.
        Fonte: https://dev.mysql.com/doc/refman/8.0/en/explain-output.html


    Tabela iv (item_venda):
        Está usando o índice primário (PRIMARY), o que é eficiente.
        Ja uqe os o índice primário garante a unicidade dos valores na coluna indexada. 
        Isso permite uma rápida localização de registros específicos com base nessa chave.
        
    A mensagem Using where indica que a condição tipo_pagamento = 'D' (Dinheiro) está sendo aplicada à tabela v.

	Em resumo, a principal preocupação é a varredura completa da tabela venda sem o uso de índices, 
	o que pode afetar negativamente o desempenho da consulta, especialmente se a tabela for grande. 
	Para melhorar o desenpenho criar um índice adequado para a coluna id na tabela venda é necessário.
*/

-- 2) Realize ajustes de otimização nas consultas utilizando JOINs entre as tabelas.

SELECT v.id AS venda_id, v.data AS data_venda, v.valor_total, 
       p.nome AS nome_produto, iv.quantidade, iv.valor_unitario, 
       c.nome AS nome_cliente, c.cpf, c.telefone
FROM venda v
JOIN funcionario f ON v.funcionario_id = f.id
JOIN item_venda iv ON v.id = iv.venda_id
JOIN produto p ON iv.produto_id = p.id
JOIN cliente c ON v.cliente_id = c.id
WHERE v.tipo_pagamento = 'D'
ORDER BY v.data DESC;

-- 3) Crie índices para melhorar o desempenho das consultas.

CREATE INDEX idx_tipo_pagamento ON venda (tipo_pagamento);
-- Permite que o MySQL localize rapidamente as vendas com o tipo de pagamento específico.

-- 4) Executand novamente o comando EXPLAIN:

EXPLAIN SELECT v.id AS venda_id, v.data AS data_venda, v.valor_total, 
       p.nome AS nome_produto, iv.quantidade, iv.valor_unitario, 
       c.nome AS nome_cliente, c.cpf, c.telefone
FROM venda v
JOIN item_venda iv ON v.id = iv.venda_id
JOIN produto p ON iv.produto_id = p.id
JOIN cliente c ON v.cliente_id = c.id
JOIN funcionario f ON v.funcionario_id = f.id
WHERE v.tipo_pagamento = 'D'
ORDER BY v.data DESC;

/*
A tabela v está sendo acessada usando um índice do tipo ref, utilizando a chave idx_tipo_pagamento. 
A otimização Using index condition indica que a filtragem está ocorrendo diretamente no índice.

Segundo a documentação oficial:
Using filesort (Extra, 1ª linha)
O MySQL precisará fazer uma passada extra para descobrir como recuperar os registros na ordem de classificação. A classificação 
é feita indo através de todos os registros de acordo com join type e armazenar a chave de ordenação mais o ponteiro para o registro 
para todos os registros que combinarem com o WHERE. Então as chaves são classificadas. Finalmente os registros são recuperados na ordem de classificação.

Using index (Extra, 1ª linha)
A informação da coluna é recuperada da tabela utilizando somente informações na árvore de índices sem ter que fazer uma
pesquisa adicional para ler o registro atual. Isto pode ser feito quando todas as colunas usadas para a tabela fizerem parte do
mesmo índice.

Fonte: https://downloads.mysql.com/docs/refman-4.1-pt.a4.pdf

**/

-- 5) Crie uma view para cada uma das consultas ajustadas com JOINS.

CREATE VIEW Relatorio_Vendas_Dinheiro AS
SELECT v.id AS venda_id, v.data AS data_venda, v.valor_total, 
       p.nome AS nome_produto, iv.quantidade, iv.valor_unitario, 
       c.nome AS nome_cliente, c.cpf, c.telefone
FROM venda v
JOIN item_venda iv ON v.id = iv.venda_id
JOIN produto p ON iv.produto_id = p.id
JOIN cliente c ON v.cliente_id = c.id
JOIN funcionario f ON v.funcionario_id = f.id
WHERE v.tipo_pagamento = 'D'
ORDER BY v.data DESC;


-- =====================================================================================================================================================

/***
consulta para encontrar todas as vendas de produtos de um dado fabricante
Mostrar dados do produto, quantidade vendida, data da venda.
Ordena-se pelo nome do produto.
***/
EXPLAIN SELECT * 
FROM produto p, item_venda iv, venda v
WHERE p.id = iv.produto_id AND v.id = iv.venda_id AND p.fabricante like '%lar%'
 

/*
     Tabela p (produto):
        O tipo de junção é ALL, o que indica uma varredura completa da tabela, como no caso anterior.
        De novo, caso a tabela seja grande pode resultar em um desempenho mais baixo.
        Não há um índice sendo usado (key é NULL)
        Esta tabela é a principal tabela da consulta e não está utilizando índices eficientes.

    Tabela iv (item_venda):
        Está usando o índice produto_id, o que é eficiente para a junção com a tabela produto.
        O tipo de junção é ref, o que é mais eficiente do que uma varredura completa.

    Tabela v (venda):
        Está usando o índice primário (PRIMARY), o que é eficiente.
        O tipo de junção é eq_ref, o que é muito eficiente para consultas de junção.

    A mensagem Using where indica que a condição p.fabricante like '%lar%' está sendo aplicada à tabela produto.

	Mais uma vez, a criação de índices melhoraria o desempenho da consulta.
*/

-- 2) Realize ajustes de otimização nas consultas utilizando JOINs entre as tabelas.


EXPLAIN SELECT p.nome AS nome_produto, iv.quantidade, v.data AS data_venda
FROM produto p
JOIN item_venda iv ON p.id = iv.produto_id
JOIN venda v ON iv.venda_id = v.id
WHERE p.fabricante = 'Venus'
ORDER BY p.nome;

-- 3) Crie índices para melhorar o desempenho das consultas.

CREATE INDEX idx_fabricante ON produto (fabricante);
-- Permite que o MySQL localize rapidamente os produtos com um fabricante específico.


-- 4) Executand novamente o comando EXPLAIN:

EXPLAIN SELECT p.nome AS nome_produto, iv.quantidade, v.data AS data_venda
FROM produto p
JOIN item_venda iv ON p.id = iv.produto_id
JOIN venda v ON iv.venda_id = v.id
WHERE p.fabricante = 'Bons Ventos'
ORDER BY p.nome;

/*
    A tabela p está sendo acessada usando um índice idx_fabricante, o que é eficiente.
    A tabela iv está usando o índice produto_id, que também é eficiente.
    A tabela v está sendo acessada usando o índice primário (PRIMARY), o que é apropriado para uma junção com base na chave primária.

	O Using filesort na coluna Extra indica que uma ordenação está ocorrendo e está sendo feita no disco, conforme a documentação, isso pode diminuir o desempenho.

*/


-- 5) Crie uma view para cada uma das consultas ajustadas com JOINS.

CREATE VIEW Vendas_Por_Fabricante AS
SELECT p.nome AS nome_produto, iv.quantidade, v.data AS data_venda
FROM produto p
JOIN item_venda iv ON p.id = iv.produto_id
JOIN venda v ON iv.venda_id = v.id
WHERE p.fabricante = 'Ultralar'
ORDER BY p.nome;


-- =====================================================================================================================================================
/***
Relatório de vendas de produto por cliente.
Mostrar dados do cliente, dados do produto e valor e quantidade totais de venda ao cliente de cada produto.
*/
EXPLAIN SELECT SUM(iv.subtotal), SUM(iv.quantidade)
FROM produto p, item_venda iv, venda v, cliente c
WHERE p.id = iv.produto_id AND v.id = iv.venda_id AND c.id = v.cliente_id /*f.id = v.funcionario_id*/
GROUP BY c.nome, p.nome

/*
    Tabela c (cliente):
        Todos os problemas já citados, varredura completa da tabela, nenhum índice, (key é NULL)

    Tabela v (venda):
        Ok

    Tabela iv (item_venda) e Tabela p (produto):
        Índice primário (PRIMARY), o que é eficiente.


        A mensagem "Using temporary" indica que uma tabela temporária está sendo usada para processar os resultados da consulta. 
        Nesse caso específico, os resultados por c.nome (nome do cliente) e p.nome (nome do produto). Para ordenar, o MySQL usa uma tabela temporária.
        A mensagem Using index indica que está sendo usado um índice para a junção entre as tabelas v e c.

**/

-- 2) Realize ajustes de otimização nas consultas utilizando JOINs entre as tabelas.

EXPLAIN SELECT c.nome AS nome_cliente, c.cpf, c.telefone,
       p.nome AS nome_produto, SUM(iv.subtotal) AS valor_total_vendas,
       SUM(iv.quantidade) AS total_quantidade_vendida
FROM cliente c
JOIN venda v ON c.id = v.cliente_id
JOIN item_venda iv ON v.id = iv.venda_id
JOIN produto p ON iv.produto_id = p.id
GROUP BY c.nome, c.cpf, c.telefone, p.nome;

-- 3) Crie índices para melhorar o desempenho das consultas.
CREATE INDEX idx_cliente_id ON cliente (id);
-- Permite que o MySQL localize rapidamente as vendas associadas a cada cliente durante a execução da consulta.

-- 4) Executand novamente o comando EXPLAIN:

EXPLAIN SELECT c.nome AS nome_cliente, c.cpf, c.telefone,
       p.nome AS nome_produto, SUM(iv.subtotal) AS valor_total_vendas,
       SUM(iv.quantidade) AS total_quantidade_vendida
FROM cliente c
JOIN venda v ON c.id = v.cliente_id
JOIN item_venda iv ON v.id = iv.venda_id
JOIN produto p ON iv.produto_id = p.id
GROUP BY c.nome, c.cpf, c.telefone, p.nome;

/*
	A tabela c está realizando uma varredura completa, sem utilizar nenhum índice. 
	O "Using temporary" indica que uma tabela temporária está sendo usada para processar 
	os resultados, o que pode afetar o desempenho. Não sei exatamente como tratar isso... 
	
	As tabelas v, iv e p estão realizando uma junção eficiente.
	
	Em resumo, essa consulta envolve principalmente operações de junção eficientes, mas a tabela c está realizando uma varredura completa
	
 */

-- 5) Crie uma view para cada uma das consultas ajustadas com JOINS.

CREATE VIEW Relatorio_Vendas_Por_Cliente AS;
SELECT c.nome AS nome_cliente, c.cpf, c.telefone,
       p.nome AS nome_produto, SUM(iv.subtotal) AS valor_total_vendas,
       SUM(iv.quantidade) AS total_quantidade_vendida
FROM cliente c
JOIN venda v ON c.id = v.cliente_id
JOIN item_venda iv ON v.id = iv.venda_id
JOIN produto p ON iv.produto_id = p.id
GROUP BY c.nome, c.cpf, c.telefone, p.nome;

