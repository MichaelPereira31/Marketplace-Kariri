CREATE TABLE IF NOT EXISTS usuarios(
    id SERIAL PRIMARY KEY,
    nome VARCHAR(30),
    email VARCHAR(30) NOT NULL,
    username VARCHAR(30) NOT NULL UNIQUE,
    contato VARCHAR(30)
);


CREATE TABLE IF NOT EXISTS enderecos(
    id SERIAL PRIMARY KEY,
    cep VARCHAR(30) NOT NULL,
    rua VARCHAR(50) NOT NULL,
    numero INTEGER NOT NULL,
    bairro VARCHAR(30) NOT NULL,
    cidade VARCHAR(30) NOT NULL,
    complemento VARCHAR(30),
    usuario_fk_id INTEGER NOT NULL,
    principal BOOLEAN DEFAULT FALSE,

    FOREIGN KEY (usuario_fk_id) REFERENCES usuarios(id)
);


CREATE TABLE IF NOT EXISTS produtos(
    id SERIAL PRIMARY KEY,
    nome VARCHAR(30),
    descricao TEXT,
    valor DECIMAL(18, 2) NOT NULL,
    quantidade INTEGER,
    dono_fk_id INTEGER,
    
    FOREIGN KEY(dono_fk_id) REFERENCES usuarios(id)
);


CREATE TABLE IF NOT EXISTS pedidos(
    id SERIAL PRIMARY KEY,
    quantidade INTEGER NOT NULL,
    preco_total DECIMAL(18, 2) NOT NULL,
    adicionado_em DATE DEFAULT CURRENT_TIMESTAMP,
    produtos_fk_id INTEGER NOT NULL,
    comprador_fk_id INTEGER NOT NULL,
    endereco_fk_id INTEGER NOT NULL,
    
    FOREIGN KEY (produtos_fk_id) REFERENCES produtos(id),
    FOREIGN KEY (endereco_fk_id) REFERENCES enderecos(id),
    FOREIGN KEY (comprador_fk_id) REFERENCES usuarios(id)
);


