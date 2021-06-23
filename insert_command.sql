INSERT INTO usuarios 
    (nome, email, username, contato)
VALUES
    ('José Pedro da Silva Gomes', 'jgomes@marketplace.com', 'jgomes', '(88) 0 00000000'),
    ('Michael Pereira da Silva', 'mpereira@marketplace.com', 'mpereira', '(88) 0 00000000'),
    ('João Gabriel da Silva', 'jgabriel@marketplace.com', 'jgabriel', '(88) 0 00000000'),
    ('Pedro Henrique da Silva', 'phenrique@marketplace.com', 'phenrique', '(88) 0 00000000');


INSERT INTO produtos
    (nome, descricao, valor, quantidade, dono_fk_id) 
VALUES 
    ('Maça', 'Maça Australiana', 5.0, 25, 1),
    ('Banana', 'Banana Maça', 10.0, 22, 2),
    ('Manga', 'Manga Espada', 3.0, 22, 3),
    ('Uva','Uva Branca', 5.5, 22, 4),
    ('Uva','Uva Roxa', 6.75, 23, 2);


INSERT INTO enderecos 
    (cep, numero, complemento, rua, bairro, cidade, usuario_fk_id, principal) 
VALUES
    (63119017, 89, 'Perto de Nenem Burger', 'Tenente Antonio João', 'Vila Alta', 'Crato', 4, TRUE),
    (63119000, 165, 'Marcelo Burger', 'Jose Carvalho', 'Vila Alta', 'Crato', 3, TRUE),
    (63113430, 264, 'Perto do educandário', 'Marcos Macêdo', 'Seminário', 'Crato', 1, TRUE),
    (63180650, 117, 'Casa', 'Professor walter barbosa', 'Triangulo', 'Juazeiro do Norte', 2, TRUE);


DO $$
DECLARE
    pedido_id pedidos.id%type;
	produto_id INTEGER = 7;
    quantidade_item INTEGER = 3;
BEGIN
    INSERT INTO pedidos 
        (quantidade, preco_total, produtos_fk_id, comprador_fk_id, endereco_fk_id)
    SELECT 
        quantidade_item, quantidade_item * valor, produto_id, u.id, e.id
    FROM produtos p
    INNER JOIN usuarios u ON u.username = 'phenrique'
	INNER JOIN enderecos e ON u.id = e.usuario_fk_id AND e.principal = TRUE
	WHERE p.id = produto_id
    RETURNING id INTO pedido_id;
	
	UPDATE produtos
	SET quantidade=subquery.quantidade - subquery.quantidade_vendido
	FROM (
		SELECT pe.quantidade AS quantidade_vendido, pe.produtos_fk_id, p.quantidade AS quantidade
		FROM pedidos pe
		INNER JOIN produtos p ON p.id = pe.produtos_fk_id
		WHERE pe.id = pedido_id
	) AS subquery
	WHERE produtos.id = subquery.produtos_fk_id;
END $$;
 
SELECT * FROM produtos;



