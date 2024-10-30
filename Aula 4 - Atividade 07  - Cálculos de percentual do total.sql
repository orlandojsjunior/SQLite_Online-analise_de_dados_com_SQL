-- Calculando e exibindo percentuais de vendas


SELECT 
    Nome_Categoria, 
    Qtd_Vendas, 
    ROUND(100.0 * Qtd_Vendas / (SELECT COUNT(*) FROM itens_venda), 2) || '%' AS Porcentagem  -- Calcula a porcentagem de vendas
FROM (
    SELECT 
        c.nome_categoria AS Nome_Categoria,  -- Seleciona o nome da categoria
        COUNT(iv.produto_id) AS Qtd_Vendas  -- Conta o número de produtos vendidos por categoria
    FROM 
        itens_venda iv  -- Tabela de itens vendidos
    JOIN 
        vendas v ON v.id_venda = iv.venda_id  -- Junta com a tabela de vendas
    JOIN 
        produtos p ON p.id_produto = iv.produto_id  -- Junta com a tabela de produtos
    JOIN 
        categorias c ON c.id_categoria = p.categoria_id  -- Junta com a tabela de categorias
    GROUP BY 
        Nome_Categoria  -- Agrupa os resultados pelo nome da categoria
    ORDER BY 
        Qtd_Vendas DESC  -- Ordena os resultados pela quantidade de vendas em ordem decrescente
);
