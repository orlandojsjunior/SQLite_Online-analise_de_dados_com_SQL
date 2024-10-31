-- Calcular a quantidade de vendas, mas desta vez, categorizada por ano


SELECT Mes,
SUM(CASE WHEN Ano=="2020" THEN Qtd_Vendas ELSE 0 END) AS "2020",
SUM(CASE WHEN Ano=="2021" THEN Qtd_Vendas ELSE 0 END) AS "2021",
SUM(CASE WHEN Ano=="2022" THEN Qtd_Vendas ELSE 0 END) AS "2022",
SUM(CASE WHEN Ano=="2023" THEN Qtd_Vendas ELSE 0 END) AS "2023"
FROM(
    SELECT strftime("%m", data_venda) AS Mes, strftime("%Y", data_venda) AS Ano, COUNT(*) AS Qtd_Vendas
    FROM Vendas
    GROUP BY Mes, Ano
    ORDER BY Mes
    )
    GROUP BY Mes
    ;