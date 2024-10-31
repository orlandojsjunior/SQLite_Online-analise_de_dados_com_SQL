-- Construindo a consulta de métricas


/*
Uma CTE (Common Table Expression), ou Expressão de Tabela Comum, é um recurso do SQL que permite criar tabelas temporárias para 
simplificar consultas complexas. Basicamente, é como se você criasse uma tabela virtual que só existe durante a execução da consulta. 
Isso torna o código mais legível e organizado.
*/


-- Definindo a CTE para calcular a média de vendas anteriores
WITH Media_Vendas_Anteriores AS (
    -- Calculando a média da quantidade de vendas para novembro (excluindo 2022)
    SELECT AVG(Qtd_Vendas) AS Media_Qtd_Vendas
    FROM (
        -- Contando as vendas por ano para novembro, exceto 2022
        SELECT COUNT(*) AS Qtd_Vendas, strftime("%Y", v.data_venda) AS Ano
        FROM vendas v
        WHERE strftime("%m", v.data_venda) = "11" AND Ano != "2022"
        GROUP BY Ano
    )
),
-- Definindo a CTE para obter as vendas de novembro de 2022
Vendas_Atual AS (
    -- Selecionando a quantidade de vendas para novembro de 2022
    SELECT Qtd_Vendas AS Qtd_Vendas_Atual
    FROM (
        -- Contando as vendas por ano para novembro de 2022
        SELECT COUNT(*) AS Qtd_Vendas, strftime("%Y", v.data_venda) AS Ano
        FROM vendas v
        WHERE strftime("%m", v.data_venda) = "11" AND Ano = "2022"
        GROUP BY Ano
    )
)
-- Selecionando a média de vendas anteriores, as vendas atuais e a porcentagem de variação
SELECT 
    mva.Media_Qtd_Vendas,  -- Média da quantidade de vendas de novembro dos anos anteriores (excluindo 2022)
    va.Qtd_Vendas_Atual,  -- Quantidade de vendas de novembro de 2022
    ROUND((va.Qtd_Vendas_Atual - mva.Media_Qtd_Vendas)/mva.Media_Qtd_Vendas *100.0, 2) || "%" AS Porcentagem  -- Calculando a diferença percentual
FROM 
    Vendas_Atual va,  -- Referenciando a CTE de vendas atuais
    Media_Vendas_Anteriores mva  -- Referenciando a CTE de média de vendas anteriores
;