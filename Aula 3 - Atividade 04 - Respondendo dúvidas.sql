-- Aula 3 - Atividade 04 - Respondendo dúvidas

SELECT strftime("%Y/%m", v.data_venda) AS "Ano/Mes",
    f.nome AS Nome_Fornecedor,
    COUNT(iv.produto_id) AS Qtd_Vendas
FROM itens_venda iv
    JOIN vendas v ON v.id_venda = iv.venda_id
    JOIN produtos p ON p.id_produto = iv.produto_id
    JOIN fornecedores f ON f.id_fornecedor = p.fornecedor_id
WHERE strftime("%m", v.data_venda) = "11"
GROUP BY Nome_Fornecedor,
    "Ano/Mes"
ORDER BY "Ano/Mes",
    Qtd_Vendas;


SELECT strftime("%Y/%m", v.data_venda) AS "Ano/Mes",
    c.nome_categoria AS Nome_Categoria,
    COUNT(iv.produto_id) AS Qtd_Vendas
FROM itens_venda iv
    JOIN vendas v ON v.id_venda = iv.venda_id
    JOIN produtos p ON p.id_produto = iv.produto_id
    JOIN categorias c ON c.id_categoria = p.categoria_id
WHERE strftime("%m", v.data_venda) = "11"
GROUP BY Nome_Categoria,
    "Ano/Mes"
ORDER BY "Ano/Mes",
    Qtd_Vendas;


SELECT SUM(Qtd_Vendas)
FROM (
        SELECT strftime("%Y/%m", v.data_venda) AS "Ano/Mes",
            f.nome AS Nome_Fornecedor,
            COUNT(iv.produto_id) AS Qtd_Vendas
        FROM itens_venda iv
            JOIN vendas v ON v.id_venda = iv.venda_id
            JOIN produtos p ON p.id_produto = iv.produto_id
            JOIN fornecedores f ON f.id_fornecedor = p.fornecedor_id
        GROUP BY Nome_Fornecedor,
            "Ano/Mes"
        ORDER BY "Ano/Mes",
            Qtd_Vendas
    );