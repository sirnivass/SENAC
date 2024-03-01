USE hospital_db_Rodolffo_Nivass;

-- Consulta 1: Dados e valor médio das consultas do ano de 2020 realizadas sem convênio
/*SELECT: Usado apra selecionar dados de uma tabela
 *FROM:  Cláusula que indica a tabela "alvo", tabela que queremos recuperar os dados.
 *WHERE: Cláusula usada para filtrar os resultados com base em uma condição específica. Ela permite que você especifique critérios para restringir os dados retornados.
 *AND: Comando lógico para adicionar uma condição.
 */
SELECT * 
FROM hospital_db_Rodolffo_Nivass.consulta
WHERE YEAR(data) = 2020
  AND convenio_id IS NULL;

-- Consulta 2: Dados e valor médio das consultas do ano de 2020 realizadas por convênio
/*AVG(valor_consulta) AS ValorMedio: Calcula a média dos valores da coluna “valor_consulta” e renomeia o resultado como “ValorMedio”.
 *GROUP BY: Agrupa os resultados com base nos valores únicos da coluna “convenio_id”. Isso nos permite calcular a média separadamente para cada convênio.
 */

 SELECT convenio_id, AVG(valor_consulta) AS ValorMedio
FROM hospital_db_Rodolffo_Nivass.consulta
WHERE YEAR(data) = 2020
  AND convenio_id IS NOT NULL
  GROUP BY convenio_id;
 

-- Consulta 3: Internações com data de alta maior que a data prevista
-- Consulta 3: Internações com data de alta maior que a data prevista
/*
 * FROM: Indica a tabela da qual queremos recuperar os dados. Aqui, estamos selecionando dados da tabela “internacao”.
 * i: É um "alias", o famoso apelido, para a tabela “internacao”. 
 * WHERE alta > i.alta_prevista: usando funções da lógica, temos o uso de um ">" Assim duas colunas são comparadas 1 > 2, caso seja True, ela sera selecionada.
 * Podemos usar "<" ou "=" para comparar essas colunas.
*/
 
 SELECT *
FROM hospital_db_Rodolffo_Nivass.internacao i 
WHERE alta = i.alta_prevista;

-- Consulta 4: Receituário completo da primeira consulta registrada com receituário associado
/*
 * ORDER BY: cria ordenação a partir de um parâmetro.
 * LIMIT, limita a consulta em x, a partir da ordenação feita acima.
 */
SELECT *
FROM hospital_db_Rodolffo_Nivass.consulta
WHERE receita  IS NOT NULL
ORDER BY `data` 
LIMIT 1;

-- Consulta 5: Consulta de maior e menor valor (não realizadas sob convênio)
/*
 * Deferente do exemplo acima, aqui a ordenação pode ser feita com oparâmetro DESC (descendente) ou ASC (Ascendente)
 */

SELECT *
FROM hospital_db_Rodolffo_Nivass.consulta
WHERE convenio_id  IS NULL
ORDER BY valor_consulta  DESC -- Maior valor
 LIMIT 1;

SELECT *
FROM hospital_db_Rodolffo_Nivass.consulta c 
WHERE convenio_id  IS NULL
ORDER BY valor_consulta ASC -- Menor valor
 LIMIT 1;


-- Consulta 6: Dados das internações e cálculo do total
/* 
 * I, Q e T são alias, apelidos que adoto para tabelas
 * I = Tabela Internação
 * Q = Tabewla quarto
 * T = Tabela tipo_quarto
 * I.* todos os dados da internação.
 * T.<coluna> = Valor da coluna
 * SELECT DATEDIFF('2024-02-28','2023-02-28'); = Retorna o número de dias.
 * AS = Retorna uma coluna onde os resultados serão mostrados.
 * JOIN é usado para combinar linhas tabelas.No caso, combinando dados de três tabelas: internacao, quarto e tipo_quarto.
 *  
*/

SELECT I.*, T.valor_diaria * DATEDIFF(I.alta, I.data_entrada) AS ValorDaInternação
FROM hospital_db_Rodolffo_Nivass.internacao I
JOIN quarto Q ON I.id_quartos = Q.id
JOIN tipo_quarto T ON Q.id_tipo_quarto = T.id;

-- Alternativamente podemos ver a tabela de outros modos, que eu até prefiro sabe?

SELECT I.data_entrada, I.alta , DATEDIFF(I.alta, I.data_entrada) AS DiasInternacao, T.valor_diaria * DATEDIFF(I.alta, I.data_entrada) AS TotalInternacao
FROM hospital_db_Rodolffo_Nivass.internacao I
JOIN quarto Q ON I.id_quartos = Q.id
JOIN tipo_quarto T ON Q.id_tipo_quarto = T.id;



-- Consulta 7: Internações em quartos do tipo "apartamento"
SELECT I.data_entrada, I.procedimentos, I.id_quartos 
FROM hospital_db_Rodolffo_Nivass.internacao I
JOIN quarto Q ON I.id_quartos = Q.id
JOIN tipo_quarto T ON Q.id_tipo_quarto = T.id
WHERE T.descricao = 'Apartamento';

-- Sabendo que meu 1ª andar são apartamentos, ou seja os núemros 101 ao 105, prefiro ver assim:

SELECT I.data_entrada, I.procedimentos, Q.numero , I.id_quartos
FROM hospital_db_Rodolffo_Nivass.internacao I
JOIN quarto Q ON I.id_quartos = Q.id
JOIN tipo_quarto T ON Q.id_tipo_quarto = T.id
WHERE T.descricao = 'Apartamento';

-- Consulta 8: Consultas de pacientes menores de 18 anos (não pediatria)
/*
 * A função TIMESTAMPDIFF do SQL para calcular a diferença entre a data atual e a data de nascimento da pessoa. 
 * Confesso que foi difícil conseguir exibir o que eu gostaria. Mas deu certo.
*/

SELECT p.nome AS Nome_do_Paciente, c.data AS Data_da_Consulta, e.especialidade 
FROM hospital_db_Rodolffo_Nivass.consulta c
JOIN paciente pa ON c.pacinete_id = pa.id
JOIN pessoa p ON pa.pessoa_id = p.id
JOIN especialidade e ON c.especialidade_desejada = e.id
WHERE TIMESTAMPDIFF(YEAR, p.data_nascimento, c.data) < 18  AND e.especialidade  != 'Pediatria'
ORDER BY c.data;



-- Consulta 9: Internações realizadas por médicos da especialidade "gastroenterologia" em "enfermaria"

/*
 * JESUS AMADO! Que maçaroca virou isso aqui, é tabela dentro de tabela, consulta dentro de consulta, confesso que pensei em desistir.
 * Mas deu certo, depois de muito sofrer. 
 * Tenho certeza que nao fiz do modo certo e que poderia ser mais otimizado, mas em time que tá ganhando nao se mexe.
*/

SELECT pac.nome AS NomePaciente, med.nome AS NomeMedico, i.data_entrada , i.procedimentos 
FROM hospital_db_Rodolffo_Nivass.internacao i
JOIN medico m ON i.id_medicos = m.id
JOIN pessoa med ON m.pessoa_id = med.id
JOIN especialidade_medico em ON m.id = em.id_medico
JOIN especialidade e ON em.id_especialidade = e.id
JOIN paciente p ON i.id_pacientes = p.id
JOIN pessoa pac ON p.pessoa_id = pac.id
JOIN quarto q ON i.id_quartos = q.id
JOIN tipo_quarto tq ON q.id_tipo_quarto = tq.id
WHERE e.especialidade = 'Gastroenterologia'  AND tq.descricao = 'enfermaria';



-- Consulta 10: Nomes, números de registro no CRM e quantidade de consultas realizadas por médicos

SELECT med.nome AS Nome_do_Medico, m.crm AS Registro_CRM, COUNT(c.id) AS Quantidade_de_Consultas
FROM hospital_db_Rodolffo_Nivass.medico m
JOIN pessoa med ON m.pessoa_id = med.id
JOIN consulta c ON m.id = c.meidco_id
GROUP BY m.id;

-- Consulta 11: Enfermeiros que participaram de mais de uma internação e seus números de registro no CRE

SELECT e.nome AS Nome_do_Enfermeiro, enf.cre AS Registro_CRE, COUNT(i.id) AS Quantidade_de_Internacoes
FROM hospital_db_Rodolffo_Nivass.enfermeiro enf
JOIN pessoa e ON enf.pessoa_id = e.id
JOIN internacao i ON enf.id = i.id_enfermeiros
GROUP BY enf.id;

   
