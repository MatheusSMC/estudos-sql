show databases;
create database EBAC;
USE EBAC;
create database restaurante;
use restaurante;
create table funcionarios (
id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    data_nascimento DATE NOT NULL,
    endereco VARCHAR(255),
    telefone VARCHAR(15),
    email VARCHAR(100) UNIQUE,
    cargo VARCHAR(100) NOT NULL,
    salario DECIMAL(10,2) NOT NULL,
    data_admissao DATE NOT NULL
);

create table clientes (
id_cliente INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(255) NOT NULL,
cpf VARCHAR(14),
data_nascimento date NOT NULL,
endereco VARCHAR(255) NOT NULL,
telefone VARCHAR(15),
email VARCHAR(100) UNIQUE,
data_cadastro DATE NOT NULL
);

CREATE TABLE produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10,2) NOT NULL,
    categoria VARCHAR(100) NOT NULL
);

CREATE TABLE pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_funcionario INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    data_pedido DATE NOT NULL,
    status VARCHAR(50) NOT NULL DEFAULT 'Pendente',
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_funcionario) REFERENCES funcionarios(id_funcionario),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

CREATE TABLE info_produtos (
    id_info INT AUTO_INCREMENT PRIMARY KEY,
    id_produto INT NOT NULL,
    ingredientes TEXT,
    fornecedor VARCHAR(255),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);