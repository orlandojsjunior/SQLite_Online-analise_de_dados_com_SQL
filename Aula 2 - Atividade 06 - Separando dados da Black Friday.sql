-- Aula 2 - Atividade 06 - Separando dados da Black Friday

-- Filtrando os meses que mais vendem

SELECT strftime("%Y", data_venda) AS Ano,
    strftime("%m", data_venda) AS Mes,
    COUNT(id_venda) AS Total_Vendas
FROM vendas
WHERE Mes = "01"
    OR Mes = "11"
    OR Mes = "12"
GROUP BY Ano,
    Mes
ORDER BY Ano;

