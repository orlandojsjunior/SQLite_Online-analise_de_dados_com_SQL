SELECT *
FROM categorias;
SELECT *
FROM fornecedores;
SELECT *
FROM marcas;



-- Quantidade de registros
/*
 Essas tabelas têm poucos registros, por isso não tinha problema rodá-las sem filtro algum, porque é uma informação que conseguimos consumir. 
 Por exemplo, as marcas têm apenas 10 registros e uma coluna de nomes. Bem simples de interpretar esse resultado.
 
 Como fazemos para saber se a quantidade de linhas que temos e saber se vamos conseguir consumir aquele resultado? Através da função COUNT().
 
 Fizemos COUNT() para produtos e para vendas. Poderíamos fazer para as outras tabelas também.
 */

SELECT COUNT(*) as Qtd_Categorias
FROM categorias;
SELECT COUNT(*) as Qtd_Clientes
FROM clientes;
SELECT COUNT(*) as Qtd_Fornecedores
FROM fornecedores;
SELECT COUNT(*) as Qtd_ItensVenda
FROM itens_venda;
SELECT COUNT(*) as Qtd_Marcas
FROM marcas;
SELECT COUNT(*) as Qtd_Produtos
from produtos;
SELECT COUNT(*) as Qtd_Vendas
from vendas;



-- Limite de registros
/*
 Com essas informações, conhecemos um pouco melhor a nossa base de dados. Mas deixamos duas provocações para você.
 
 Existem tabelas que não conseguimos explorar por conta da grande quantidade de linhas, como, por exemplo, a tabela de vendas. 
 Como podemos resolver isso? Existe outra função chamada LIMIT.
 
 Faremos mais uma consulta. Faremos SELECT e asterico, pois queremos selecionar todas as colunas. Depois, escrevemos FROM vendas para selecionar apenas a tabela de vendas.
 
 Mas queremos só uma amostra desses dados. Antes de colocar o ponto e vírgula, chamaremos o LIMIT, que é uma função que permite pegar apenas alguns registros da tabela. 
 Nesse caso, colocaremos o número 5, pois queremos os cinco primeiros registros.
 */

SELECT *
FROM vendas
LIMIT
5;



/*
 São exibidas quatro colunas que são da tabela vendas. A primeira é o ID da venda, a segunda é a data da venda, a terceira é o total da venda e a quarta é o ID do cliente, ou seja, 
 quem comprou esse produto.
 
 Recomendamos novamente que você explore as tabelas que têm muitos registros na base de dados usando o LIMIT. E aí você confere atentamente cada uma das linhas para entender como 
 funciona aquele registro.
 */