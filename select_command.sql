
/* Selecionar todos os produtos de um unico usuario */
SELECT 
    produto.nome AS "produto",
    produto.descricao,
    valor,
    quantidade
FROM produtos AS produto
INNER JOIN 
    usuarios AS usuario 
ON 
    produto.dono_fk_id = usuario.id; 


-- Selecionando todos os endereços de um determinado usuário.
SELECT 
    endereco.*, usuario.nome , usuario.contato
FROM 
    enderecos AS endereco 
INNER JOIN
    usuarios AS usuario
ON
    endereco.usuario_fk_id = usuario.id;


-- Selecionando todos os endereços de um determinado usuário.
SELECT 
    endereco.*, usuario.nome, usuario.contato
FROM 
    enderecos AS endereco 
INNER JOIN
    usuarios AS usuario
ON
    endereco.usuario_fk_id = 1;


-- Selecionando todas as compras de um determinado usuário
SELECT 
    pedido.id, 
    usuario.nome AS "comprador", 
    produto.nome AS "produto", 
    produto.descricao, 
    pedido.quantidade, 
    pedido.preco_total
FROM 
    usuarios AS usuario
INNER JOIN 
    produtos AS produto 
ON
    pedido.produtos_fk_id = produto.id
INNER JOIN 
    pedidos AS pedido
ON 
    pedido.comprador_fk_id = usuario.id
WHERE usuario.id = 1;


-- Selecionando todos os pedidos com os dados de produto e usuário incluso.
SELECT 
    pedido.id, 
    usuario.nome as "comprador", 
    produto.nome as "produto", 
    produto.descricao, 
    pedido.quantidade, 
    pedido.preco_total
FROM 
    pedidos AS pedido
INNER JOIN 
    usuarios AS usuario 
ON 
    pedido.comprador_fk_id = usuario.id
INNER JOIN 
    produtos AS produto 
ON
    pedido.produtos_fk_id = produto.id;