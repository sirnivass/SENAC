/* Atividade 02

Contexto

Ainda no contexto do sistema para lojas, após os ajustes de segurança, observaram-se outras necessidades, 
para as quais devem ser criadas sub-rotinas em banco de dados (stored functions, stored procedures e triggers).
 
Atividade
Utilizando o banco de dados disponível no script em Conteúdos > Material complementar, realize as seguintes ações:

    1- Crie um stored procedure que receba id de cliente, data inicial e data final, e que mostre a lista de compras 
    realizadas pelo referido cliente entre as datas informadas (incluindo essas datas), mostrando nome do cliente, 
    id da compra, total, nome e quantidade de cada produto comprado. No script, inclua o código de criação e o comando de chamada da procedure.
    
    2- Crie uma stored function que receba id de cliente e retorne se o cliente é “PREMIUM” ou “REGULAR”. Um cliente é “PREMIUM” 
    se já realizou mais de R$ 10 mil em compras na loja.  Se não, é um cliente “REGULAR”. No script, inclua o código de criação e o 
    comando de chamada da function.
    
    3- Crie um trigger que atue sobre a tabela “usuário” de modo que, ao incluir um novo usuário, aplique automaticamente MD5() à coluna “senha”; utilize nesta atividade variáveis com NEW.

 
Dica: para fazer uma busca entre datas solicitadas nas atividades, você pode usar between e o DATE_SUB().
 
Entrega
Envie, no local destinado à entrega da atividade, até a data indicada no cronograma de estudos, os scripts .sql com os comandos de criação e execução dos procedures, das functions e dos triggers desenvolvidos.
*/

-- 01) Crie um stored procedure que mostre a lista de compras realizadas pelo referido cliente entre as datas informadas:
   

/* O padrão MySQL é o ponto e vírgula (;) como delimitador de instruções SQL. 
 * No entanto, quando estamos escrevendo procedures/funções que contêm 
 * várias instruções SQL, precisamos mudar o delimitador para que o MySQL 
 * não trate cada ponto e vírgula como o final da procedure ou função. 
 * Neste caso, estamos mudando o delimitador para //, mas poderia ser outro delimitador.
*/
DELIMITER //
/*Esta linha está criando uma nova procedure chamada ComprasCliente. 
 * A procedure aceita três parâmetros: clienteID (um inteiro que representa o ID do cliente), 
 * dataInicial (uma data que representa a data inicial do intervalo de tempo) e 
 * dataFinal (uma data que representa a data final do intervalo de tempo).
*/
CREATE PROCEDURE ComprasCliente(IN clienteID INT, IN dataInicial DATE, IN dataFinal DATE)
BEGIN -- Define o início do bloco de código da procedure.
	-- Selecionando a tabela cliente (alias c) faz JOIN com as tabelas venda (alias v), item_venda (alias iv) e produto (alias p).
	SELECT c.nome AS 'Nome do Cliente', v.id AS 'ID da Venda', v.valor_total AS 'Total', p.nome AS 'Nome do Produto', iv.quantidade AS 'Quantidade'
    FROM cliente c
    JOIN venda v ON c.id = v.cliente_id
    JOIN item_venda iv ON v.id = iv.venda_id
    JOIN produto p ON iv.produto_id = p.id
    -- WHERE filtra os resultados para incluir apenas as vendas feitas pelo cliente especificado (c.id) 
    -- e que ocorreram entre as datas especificadas (v.data BETWEEN dataInicial AND dataFinal).
    WHERE c.id = clienteID AND v.data BETWEEN dataInicial AND dataFinal;
END // -- Define o fim do bloco de código da procedure.
DELIMITER ;

-- CALL chama a procedure, passando o id, e um intervalo de datas.
CALL ComprasCliente(1, '2018-01-01', '2023-12-31');

-- 02) Crie uma stored function que receba id de cliente e retorne se o cliente é “PREMIUM” ou “REGULAR”.

-- Como já explicado anteriormente, essa FUNCTION está dentro de um DELIMITER. Não pretendo me deter muito em cada linha.

USE uc4atividades;

DELIMITER //

CREATE FUNCTION StatusCliente(clienteID INT) RETURNS VARCHAR(10) DETERMINISTIC
BEGIN -- Início das instruções da FUNCTION.
    DECLARE gastoTotal DECIMAL(10,2);-- Declaração da variável gastoTotal
    SELECT SUM(v.valor_total) INTO gastoTotal FROM venda v WHERE v.cliente_id = clienteID; -- Este comando SQL calcula a soma total dos valores de todas as vendas para o cliente com o ID clienteID e armazena o resultado na variável gastoTotal.
    IF gastoTotal > 10000 THEN -- Inicia uma instrução IF que verifica se o valor total gasto pelo cliente é maior que 10000.
        RETURN 'PREMIUM'; --  Se a condição IF for verdadeira, a função retorna a string 'PREMIUM'.
    ELSE
        RETURN 'REGULAR'; -- Se a condição IF for falsa, a função retorna a string 'REGULAR'.
    END IF;
END // -- -- Fim das instruções da FUNCTION.
DELIMITER ;

-- Chamada da function
SELECT StatusCliente(25);
-- Alguns cliente PREMIUM: 09, 16, 25 

-- 03) Crie trigger que atue sobre a tabela “usuário” de modo que, ao incluir um novo usuário, aplique automaticamente MD5() à coluna “senha”

DELIMITER //
CREATE TRIGGER encripta_senha -- comando para criar um novo trigger. encrypt_password é o nome que você está dando a este trigger.
BEFORE INSERT ON usuario -- especifica quando o trigger deve ser ativado
FOR EACH ROW -- significa que o trigger será ativado para cada linha que está sendo inserida.
/*Este é o bloco de código que será executado cada vez que o trigger for ativado. 
 * NEW.senha se refere ao valor da coluna senha na nova linha. 
 * MD5(NEW.senha) aplica a função MD5(uma função hash criptográfica) a esse valor. 
 */
BEGIN
   SET NEW.senha = MD5(NEW.senha); -- Atualiza o valor da coluna senha na nova linha para ser o hash MD5 da senha original.
END;//
DELIMITER ;


































