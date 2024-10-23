-- SQLite


SELECT *
FROM categorias;

SELECT *
FROM produtos;

UPDATE produtos
SET preco = 50.00
WHERE nome_produto = 'Bola de Futebol';


UPDATE produtos
SET preco = 15.00
WHERE nome_produto = 'Chocolate';

UPDATE produtos
SET preco = 2000.00
WHERE nome_produto = 'Celular';

UPDATE produtos
SET preco = 120.00
WHERE nome_produto = 'Livro de Ficção';

UPDATE produtos
SET preco = 150.00
WHERE nome_produto = 'Camisa';
