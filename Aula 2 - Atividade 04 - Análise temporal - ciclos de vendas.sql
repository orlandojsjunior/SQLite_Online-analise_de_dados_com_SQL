-- Aula 2 - Atividade 4 Análise temporal: ciclos de vendas

/*
Período dos dados
No SQLite, vamos escrever após a última consulta. Já descobrimos que a informação de data de venda está na tabela de vendas e na coluna data_venda. 
Para descobrir o período dessas vendas, devemos consultar algo nesse sentido.

Em uma nova linha escrever SELECT e focar na data_venda. Para começar, queremos saber o período do ano. Como extraímos da data apenas o ano? Na data atual, 
temos o ano, mês e dia.

Por exemplo, no primeiro registro, temos 2021-05-01, ou seja, o ano 2021, o mês de maio e o primeiro dia. Mas não estamos interessados exatamente na data que 
aconteceu essa venda, queremos saber o ano.

Para fazer isso, podemos usar a função strftime().

Essa função recebe dois parâmetros. O primeiro é a informação que você quer extrair. Então, antes de data_venda, podemos colocar aspas duplas. Entre elas, 
vamos colocar um símbolo, que é o sinal de porcentagem (%) e um Y maiúsculo.

Isso indica que estamos interessados em extrair o ano. O Y vem de year (ano em inglês).

O segundo parâmetro é o nome da coluna da qual desejamos extrair aquela informação. Nesse caso, será a data_venda. Devemos colocar uma vírgula separando essas duas informações.

Para conferir se a consulta já está funcionando como esperamos, vamos digitar o FROM vendas. E, no final, vamos colocar um limite de 5 novamente seguido do ponto e vírgula.
*/

SELECT strftime("%Y", data_venda)
FROM vendas
LIMIT 5;


/*
Foram retornados cinco valores: 2021, 2023, 2023, 2021 e 2022. Mas isso significa que só temos esses anos em nossa base? Na verdade, estamos conferindo apenas cinco registros - o que é uma 
amostra muito pequena da base.

O ideal é percorrer toda a base para fazer a consulta de ano. Existe uma função que vai facilitar esse processo.

Podemos apagar a parte do LIMIT 5. Além de fazer a extração do ano, também vamos chamar outra função, que é a função DISTINCT(). Entre os parênteses, englobaremos a strftime().

O que essa função faz? Ela vai pegar todos os valores de anos que ela encontrar e vai trazer apenas os valores únicos. Assim, cada um desses registros só vão aparecer uma vez. 
Isso vai permitir que saibamos todos os anos que existem em nossa tabela.

*/

SELECT DISTINCT(strftime("%Y", data_venda))
FROM vendas;

SELECT DISTINCT(strftime("%Y", data_venda)) AS Ano
FROM vendas
ORDER BY Ano;


-- Vendas ao longo dos anos

SELECT strftime("%Y", data_venda) AS Ano,
    COUNT(id_venda) AS Total_Vendas
FROM vendas
GROUP BY Ano
ORDER BY Ano;


-- Vendas por mês

SELECT strftime("%Y", data_venda) AS Ano,
    strftime("%m", data_venda) AS Mes,
    COUNT(id_venda) AS Total_Vendas
FROM vendas
GROUP BY Ano
ORDER BY Ano;


SELECT strftime("%Y", data_venda) AS Ano,
    strftime("%m", data_venda) AS Mes,
    COUNT(id_venda) AS Total_Vendas
FROM vendas
GROUP BY Ano,
    Mes
ORDER BY Ano;