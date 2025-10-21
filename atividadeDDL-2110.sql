CREATE TABLE clientes(
	id_cliente INT NOT NULL,
	CONSTRAINT pk_id_cliente PRIMARY KEY (id_cliente),
	nome VARCHAR(100),
	cpf VARCHAR(14) NOT NULL,
	cidade VARCHAR(50)
);
CREATE TABLE pedidos(
	id_pedido INT NOT NULL,
	data_pedido DATE,
	valor_total DECIMAL,
	id_cliente INT REFERENCES clientes (id_cliente)
);

ALTER TABLE clientes ADD COLUMN email VARCHAR(100);

ALTER TABLE Pedidos ALTER COLUMN valor_total DECIMAL(10,2);

ALTER TABLE Clientes RENAME COLUMN cidade TO municipio;

CREATE TABLE produtos(
	id_produto INT NOT NULL,
	CONSTRAINT pk_id_produto PRIMARY KEY (id_produto),
	nome VARCHAR(100) NOT NULL,
	preco DECIMAL(10,2) NOT NULL DEFAULT 0.00,
	estoque INT DEFAULT 0
);

ALTER TABLE clientes DROP COLUMN email; 

DROP TABLE pedidos;

TRUNCATE TABLE produtos;

CREATE SCHEMA empresa_db;
CREATE TABLE empresa_db.departamentos(
	id_departamento INT NOT NULL,
	CONSTRAINT pk_id_departamento PRIMARY KEY (id_departamento),
	nome varchar(100)
);