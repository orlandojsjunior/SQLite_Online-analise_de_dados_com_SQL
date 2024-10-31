-- Quadro Geral



SELECT strftime("%Y/%m", data_venda) AS "Ano/Mes", COUNT(*) AS Qtd_Vendas
FROM Vendas
GROUP BY "Ano/Mes"
ORDER BY "Ano/Mes"
;

