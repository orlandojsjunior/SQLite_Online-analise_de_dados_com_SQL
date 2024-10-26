-- Consultando tabelas inteiras

SELECT *
FROM categorias;

SELECT *
FROM produtos;


-- Função COUNT

SELECT COUNT(*)
FROM produtos;

SELECT COUNT(*)
FROM vendas;


-- Criando alias para consultas

SELECT COUNT(*) AS Vendas_Totais
FROM vendas;
