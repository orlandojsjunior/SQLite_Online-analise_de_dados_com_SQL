-- Verificando a quantidade de registros presentes em cada tabela



    SELECT 'Categorias' AS Tabela, COUNT(*) AS quantidade
    FROM categorias
UNION ALL
    SELECT 'Clientes' AS Tabela, COUNT(*) AS quantidade
    FROM clientes
UNION ALL
    SELECT 'Fornecedores' AS Tabela, COUNT(*) AS quantidade
    FROM fornecedores
UNION ALL
    SELECT 'Itens Venda' AS Tabela, COUNT(*) AS quantidade
    FROM itens_venda
UNION ALL
    SELECT 'Marcas' AS Tabela, COUNT(*) AS quantidade
    FROM marcas
UNION ALL
    SELECT 'Produtos' AS Tabela, COUNT(*) AS quantidade
    FROM produtos
UNION ALL
    SELECT 'Vendas' AS Tabela, COUNT(*) AS quantidade
    FROM vendas;
