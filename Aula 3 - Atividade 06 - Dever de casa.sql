-- SQLite


SELECT strftime("%Y/%m", v.data_venda) AS "Ano/Mes", f.nome AS Nome_Fornecedor, COUNT(iv.produto_id) AS Qtd_Vendas
FROM itens_venda iv
    JOIN vendas v ON v.id_venda = iv.venda_id
    JOIN produtos p ON p.id_produto = iv.produto_id
    JOIN fornecedores f ON f.id_fornecedor = p.fornecedor_id
GROUP BY Nome_Fornecedor, "Ano/Mes"
ORDER BY "Ano/Mes", Qtd_Vendas
;

/*
A consulta mostra vários fornecedores e queremos focar apenas naquele que teve a pior performance na última Black Friday, que ocorreu em 2022 no mês de novembro. 
Os dados estão ordenados do menor para o maior, então procuramos pelo primeiro com a data 2022/11.

Em 2022, no mês 11, o fornecedor com menor número de vendas durante a Black Friday foi a NebulaNetworks. Essa foi a informação que passamos na reunião e estava correta.

-- Criando a nova consulta

Vamos copiar o nome da NebulaNetwork e começar a criar uma consulta. Na consulta existente, que calcula, ao longo do tempo, cada fornecedor, queremos fazer um filtro.

Após o último JOIN, vamos digitar o comando WHERE seguido do nome do fornecedor (Nome_Fornecedor). Queremos que ele seja igual a "NebulaNetworks". Dessa maneira, a consulta 
trará apenas os dados do fornecedor NebulaNetworks.
*/


SELECT strftime("%Y/%m", v.data_venda) AS "Ano/Mes", f.nome AS Nome_Fornecedor, COUNT(iv.produto_id) AS Qtd_Vendas
FROM itens_venda iv
    JOIN vendas v ON v.id_venda = iv.venda_id
    JOIN produtos p ON p.id_produto = iv.produto_id
    JOIN fornecedores f ON f.id_fornecedor = p.fornecedor_id
WHERE Nome_Fornecedor="NebulaNetworks"
GROUP BY Nome_Fornecedor, "Ano/Mes"
ORDER BY "Ano/Mes", Qtd_Vendas
;


SELECT strftime("%Y/%m", v.data_venda) AS "Ano/Mes", COUNT(iv.produto_id) AS Qtd_Vendas
FROM itens_venda iv
    JOIN vendas v ON v.id_venda = iv.venda_id
    JOIN produtos p ON p.id_produto = iv.produto_id
    JOIN fornecedores f ON f.id_fornecedor = p.fornecedor_id
WHERE f.nome="NebulaNetworks"
GROUP BY f.nome, "Ano/Mes"
ORDER BY "Ano/Mes", Qtd_Vendas
;
    