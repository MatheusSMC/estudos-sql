-- Use o banco de dados restaurante
use restaurante;
-- Calcule a quantidade de pedidos
select count(quantidade) as quantidade_pedidos from pedidos;
-- Calcule a quantidade de clientes únicos que realizaram pedidos
select count(distinct id_cliente) as clientes_unicos from pedidos;
-- Calcule a média de preço dos produtos
select avg(preco) as preço_produtos from pedidos;
-- Calcule o mínimo e máximo do preço dos produtos
select min(preco) from pedidos;
select max(preco) from pedidos;
-- Selecione o nome e o preço do produto e faça um rank dos 5 produtos mais caros
select nome, preco from produtos order by preco desc limit 5;
-- Selecione a média dos preços dos produtos agrupados por categoria
select categoria, round(avg(preco), 2) as media_categoria from produtos group by categoria;
-- Selecionar o fornecedor e a quantidade de produtos que vieram daquele fornecedor da informações de produtos
select fornecedor, count(id_produto) as quantidade_produtos from info_produtos group by fornecedor;
-- Selecionar os fornecedores que possuem mais de um produto cadastrado
select fornecedor, count(id_produto) as quantidade_produto from info_produtos group by fornecedor 
having count(id_produto) > 1;
-- Selecionar os clientes que realizaram apenas 1 pedido
select id_cliente, count(id_pedido) as quantidade_pedidos from pedidos group by id_cliente
having count(id_pedido) = 1;