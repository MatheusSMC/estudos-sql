-- parte 1
use restaurante;

-- parte 2
select
  p.id_produto,
  p.nome,
  p.descricao,
  ip.ingredientes
from produtos p
join info_produtos ip
  on p.id_produto = ip.id_produto;

-- parte 3
select
  ped.id_pedido,
  ped.quantidade,
  ped.data_pedido,
  c.nome as cliente_nome,
  c.email as cliente_email
from pedidos ped
join clientes c
  on ped.id_cliente = c.id_cliente;

-- parte 4
select
  ped.id_pedido,
  ped.quantidade,
  ped.data_pedido,
  c.nome as cliente_nome,
  c.email as cliente_email,
  f.nome as funcionario_nome
from pedidos ped
join clientes c on ped.id_cliente = c.id_cliente
join funcionarios f on ped.id_funcionario = f.id_funcionario;

-- parte 5
select
  ped.id_pedido,
  ped.quantidade,
  ped.data_pedido,
  c.nome as cliente_nome,
  c.email as cliente_email,
  f.nome as funcionario_nome,
  prod.nome as produto_nome,
  prod.preco as produto_preco
from pedidos ped
join clientes c     on ped.id_cliente = c.id_cliente
join funcionarios f on ped.id_funcionario = f.id_funcionario
join produtos prod  on ped.id_produto = prod.id_produto;

-- parte 6
select
  ped.id_pedido,
  c.nome as cliente_nome,
  c.email
from pedidos ped
join clientes c on ped.id_cliente = c.id_cliente
where ped.status = 'pendente'
order by ped.id_pedido desc;

-- parte 7
select
  c.id_cliente,
  c.nome,
  c.email,
  c.telefone
from clientes c
left join pedidos p on c.id_cliente = p.id_cliente
where p.id_pedido is null;

-- parte 8
select
  c.id_cliente,
  c.nome,
  count(p.id_pedido) as total_pedidos
from clientes c
left join pedidos p on c.id_cliente = p.id_cliente
group by c.id_cliente, c.nome
order by total_pedidos desc;

-- parte 9
select
  ped.id_pedido,
  ped.quantidade,
  prod.id_produto,
  prod.nome as produto_nome,
  prod.preco as preco_unitario,
  round(ped.quantidade * prod.preco, 2) as total_pedido
from pedidos ped
join produtos prod on ped.id_produto = prod.id_produto;