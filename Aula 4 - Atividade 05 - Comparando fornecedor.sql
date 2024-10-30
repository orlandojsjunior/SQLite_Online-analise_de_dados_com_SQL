-- Comparando dados

 SELECT 
    "Ano/Mes", 
    SUM(CASE WHEN Nome_Fornecedor = "NebulaNetworks" THEN Qtd_Vendas ELSE 0 END) AS Qtd_Vendas_NebulaNetworks, 
    SUM(CASE WHEN Nome_Fornecedor = "HorizonDistributors" THEN Qtd_Vendas ELSE 0 END) AS Qtd_Vendas_HorizonDistributors, 
    SUM(CASE WHEN Nome_Fornecedor = "AstroSupply" THEN Qtd_Vendas ELSE 0 END) AS Qtd_Vendas_AstroSupply 
FROM (
    SELECT 
        strftime("%Y/%m", v.data_venda) AS "Ano/Mes", 
        f.nome AS Nome_Fornecedor, 
        COUNT(iv.produto_id) AS Qtd_Vendas
    FROM 
        itens_venda iv
    JOIN 
        vendas v ON v.id_venda = iv.venda_id
    JOIN 
        produtos p ON p.id_produto = iv.produto_id
    JOIN 
        fornecedores f ON f.id_fornecedor = p.fornecedor_id
    WHERE 
        f.nome IN ("NebulaNetworks", "HorizonDistributors", "AstroSupply")
    GROUP BY 
        Nome_Fornecedor, "Ano/Mes"
    ORDER BY 
        "Ano/Mes", Qtd_Vendas
) 
GROUP BY 
    "Ano/Mes";
