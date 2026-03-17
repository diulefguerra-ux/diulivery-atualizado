DROP DATABASE IF EXISTS diulivery;
CREATE DATABASE diulivery;
USE diulivery;

-- Tabela de pratos
CREATE TABLE prato (
    idprato INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10,2) NOT NULL
);

-- Tabela de categorias
CREATE TABLE categoria (
    idCategoria INT PRIMARY KEY AUTO_INCREMENT,
    nome_Categoria VARCHAR(50) NOT NULL,
    prato_idprato INT,
    FOREIGN KEY (prato_idprato) REFERENCES prato(idprato) ON DELETE CASCADE
);

-- Tabela de clientes
CREATE TABLE cliente (
    idcliente INT PRIMARY KEY AUTO_INCREMENT,
    nome_cliente VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    telefone VARCHAR(20)
);

-- Tabela de pedidos
CREATE TABLE pedido (
    idpedido INT PRIMARY KEY AUTO_INCREMENT,
    data_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status_pedido VARCHAR(45) DEFAULT 'Pendente',
    cliente_idcliente INT,
    prato_idprato INT,
    FOREIGN KEY (cliente_idcliente) REFERENCES cliente(idcliente),
    FOREIGN KEY (prato_idprato) REFERENCES prato(idprato)
);

-- Tabela de usuários (login do sistema)
CREATE TABLE usuario (
    idusuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    senha VARCHAR(50)
);

-------------------------------------------------
-- INSERTS
-------------------------------------------------

-- Usuários
INSERT INTO usuario (nome, email, senha) VALUES
('Diule', 'diule@email.com', '123456'),
('Admin', 'admin@diulivery.com', 'admin123');

-- Pratos
INSERT INTO prato (nome, descricao, preco) VALUES
('Hambúrguer Artesanal', 'Hambúrguer com queijo, alface e tomate', 25.90),
('Pizza Calabresa', 'Pizza com calabresa e cebola', 39.90),
('Lasanha Bolonhesa', 'Lasanha tradicional com molho bolonhesa', 32.50),
('Salada Caesar', 'Salada com frango, croutons e molho caesar', 22.00);

-- Categorias
INSERT INTO categoria (nome_Categoria, prato_idprato) VALUES
('Lanches', 1),
('Pizzas', 2),
('Massas', 3),
('Saladas', 4);

-- Clientes
INSERT INTO cliente (nome_cliente, email, telefone) VALUES
('João Silva', 'joao@email.com', '71999990001'),
('Maria Souza', 'maria@email.com', '71999990002'),
('Carlos Lima', 'carlos@email.com', '71999990003');

-- Pedidos
INSERT INTO pedido (status_pedido, cliente_idcliente, prato_idprato) VALUES
('Pendente', 1, 1),
('Em preparo', 2, 2),
('Entregue', 3, 3),
('Pendente', 1, 4);