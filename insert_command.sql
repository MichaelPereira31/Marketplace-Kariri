INSERT INTO usuarios 
    (nome, email, username, contato)
VALUES
    ("José Pedro da Silva Gomes", "jgomes@marketplace.com", "jgomes", "(88) 0 00000000"),
    ("Michael Pereira da Silva", "mpereira@marketplace.com", "mpereira", "(88) 0 00000000"),
    ("João Gabriel da Silva", "jgabriel@marketplace.com", "jgabriel", "(88) 0 00000000"),
    ("Pedro Henrique da Silva", "phenrique@marketplace.com", "phenrique", "(88) 0 00000000");


INSERT INTO produtos
    (nome, descricao, valor, quantidade, dono_fk_id) 
VALUES 
    ("Maça", "Maça Australiana", 5.0, 5, 1),
    ("Banana", "Banana Maça", 10.0, 2, 2),
    ("Manga", "Manga Espada", 3.0, 2, 3),
    ("Uva","Uva Branca", 5.5, 2, 4),
    ("Uva","Uva Roxa", 6.75, 3, 2);


INSERT INTO enderecos 
    (cep, numero, complemento, rua, bairro, cidade, usuario_fk_id) 
VALUES
    (63119017, 89, "Perto de Nenem Burger", "Tenente Antonio João", "Vila Alta", "Crato", 4),
    (63119000, 165, "Marcelo Burger", "Jose Carvalho", "Vila Alta", "Crato", 3),
    (63113430, 264, "Perto do educandário", "Marcos Macêdo", "Seminário", "Crato", 1),
    (63180650, 117, "Casa", "Professor walter barbosa", "Triangulo", "Juazeiro do Norte", 2);


INSERT INTO pedidos 
    (quantidade, preco_total, produtos_fk_id, comprador_fk_id)
SELECT 
	3, 3 * valor, 1, 1
FROM produtos
WHERE id = 1;




