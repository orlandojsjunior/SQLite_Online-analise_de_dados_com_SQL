-- Aula 3 - Atividade 3 Mão na massa: preparativos finais para a reunião

-- Consulta Modificada para Categorias

SELECT strftime("%Y", v.data_venda) AS "Ano", c.nome_categoria AS Nome_Categoria, COUNT(iv.produto_id) AS Qtd_Vendas
FROM itens_venda iv
JOIN vendas v ON v.id_venda = iv.venda_id
JOIN produtos p ON p.id_produto = iv.produto_id
JOIN categorias c ON c.id_categoria = p.categoria_id
WHERE strftime("%m", v.data_venda) = "11"
GROUP BY Nome_Categoria, "Ano"
ORDER BY "Ano", Qtd_Vendas DESC;


/*
Obs:

Pedi pro Copilot explica a query


Consulta SQL Explicada:

Selecionando Colunas:

SELECT strftime("%Y", v.data_venda) AS "Ano", c.nome_categoria AS Nome_Categoria, COUNT(iv.produto_id) AS Qtd_Vendas
strftime("%Y", v.data_venda) AS "Ano": Extrai o ano da coluna data_venda da tabela vendas e a renomeia como "Ano".

c.nome_categoria AS Nome_Categoria: Seleciona o nome da categoria da tabela categorias e a renomeia como "Nome_Categoria".

COUNT(iv.produto_id) AS Qtd_Vendas: Conta o número de vezes que produto_id aparece na tabela itens_venda e a renomeia como "Qtd_Vendas".

Fonte dos Dados e Junções:

FROM itens_venda iv
JOIN vendas v ON v.id_venda = iv.venda_id
JOIN produtos p ON p.id_produto = iv.produto_id
JOIN categorias c ON c.id_categoria = p.categoria_id
FROM itens_venda iv: A consulta começa com a tabela itens_venda apelidada de iv.

JOIN vendas v ON v.id_venda = iv.venda_id: Junta a tabela vendas apelidada de v onde id_venda na tabela vendas corresponde a venda_id 
na tabela itens_venda.

JOIN produtos p ON p.id_produto = iv.produto_id: Junta a tabela produtos apelidada de p onde id_produto na tabela produtos corresponde 
a produto_id na tabela itens_venda.

JOIN categorias c ON c.id_categoria = p.categoria_id: Junta a tabela categorias apelidada de c onde id_categoria na tabela categorias 
corresponde a categoria_id na tabela produtos.

Condições de Filtro:

sql

Copiar
WHERE strftime("%m", v.data_venda) = "11"
WHERE strftime("%m", v.data_venda) = "11": Filtra para incluir apenas os registros onde o mês extraído de data_venda na tabela 
vendas é novembro ("11").

Agrupamento e Ordenação:

GROUP BY Nome_Categoria, "Ano"
ORDER BY "Ano", Qtd_Vendas DESC;
GROUP BY Nome_Categoria, "Ano": Agrupa os resultados por nome da categoria e ano.

ORDER BY "Ano", Qtd_Vendas DESC: Ordena os resultados por ano e quantidade de vendas em ordem decrescente.

Resumo
Essa consulta retorna o número de vendas (Qtd_Vendas) para cada categoria de produtos (Nome_Categoria) feitas em novembro, 
agrupando os resultados por ano (Ano) e categoria, e ordenando-os por ano e quantidade de vendas em ordem decrescente.

*/