use restaurante;
-- Selecione o nome e a categoria dos produtos que tem o preço superior a 30;
select nome, categoria from produtos where preco > 30;

-- Selecione o nome, telefone e data de nascimento dos clientes que nasceram antes do ano de 1985;
select nome, telefone, data_nascimento from clientes where year(data_nascimento) < 1985;

-- Selecione o id do produto e os ingredientes de informações de produto para os ingredientes que contenham a palavra “carne”;
select id_produto, ingredientes from info_produtos where ingredientes like '%carne%';

-- Selecione o nome e a categoria dos produtos ordenados em ordem alfabética por categoria, para cada categoria deve ser ordenada pelo nome do produto;
select nome, categoria from produtos order by categoria asc, nome asc;

-- Selecione os 5 produtos mais caros do restaurante;
select nome, preco from produtos order by preco desc limit 5;

-- A cada dia da semana 2 pratos principais estão na promoção, hoje você deve selecionar 2 produtos da categoria ‘Prato Principal’ e pular 6 registros (offset = 5);
Select nome, categoria from produtos where categoria = 'Prato Principal' limit 2 offset 6;

-- Faça backup dos dados da tabela pedidos com o nome de backup_pedidos.
create table backup_pedidos as select * from pedidos;