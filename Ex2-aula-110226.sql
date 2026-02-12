CREATE TABLE cargo (
    id SERIAL,
    nome_cargo VARCHAR(50) NOT NULL,
    CONSTRAINT pk_cargo PRIMARY KEY (id)
);

CREATE TABLE fornecedor (
    id SERIAL,
    nome_fantasia VARCHAR(100) NOT NULL,
    cnpj CHAR(14) UNIQUE NOT NULL,
    CONSTRAINT pk_fornecedor PRIMARY KEY (id)
);

CREATE TABLE funcionario (
    id SERIAL,
    cpf CHAR(11) NOT NULL,
    nome_completo VARCHAR(150) NOT NULL,
    endereco VARCHAR(200),
    tel_residencial VARCHAR(15),
    tel_celular VARCHAR(15),
    data_nascimento DATE,
    cargo_id INTEGER NOT NULL,
    CONSTRAINT pk_funcionario PRIMARY KEY (id),
    CONSTRAINT un_func_cpf UNIQUE (cpf),
    CONSTRAINT fk_func_cargo FOREIGN KEY (cargo_id) REFERENCES cargo(id)
);

CREATE TABLE cliente (
    id SERIAL,
    cpf CHAR(11) NOT NULL,
    nome_completo VARCHAR(150) NOT NULL,
    endereco VARCHAR(200),
    tel_comercial VARCHAR(15),
    tel_residencial VARCHAR(15),
    tel_celular VARCHAR(15),
    data_nascimento DATE,
    email VARCHAR(100),
    CONSTRAINT pk_cliente PRIMARY KEY (id),
    CONSTRAINT un_cliente_cpf UNIQUE (cpf)
);

CREATE TABLE animal (
    id SERIAL,
    nome VARCHAR(50) NOT NULL,
    data_nascimento DATE,
    sexo CHAR(1),
    raca VARCHAR(50),
    cor_predominante VARCHAR(30),
    tipo_animal VARCHAR(30),
    cliente_id INTEGER NOT NULL,
    CONSTRAINT pk_animal PRIMARY KEY (id),
    CONSTRAINT fk_animal_cliente FOREIGN KEY (cliente_id) REFERENCES cliente(id) ON DELETE CASCADE
);

CREATE TABLE produto (
    codigo SERIAL,
    nome_produto VARCHAR(100) NOT NULL,
    marca VARCHAR(50),
    valor_unitario DECIMAL(10,2) NOT NULL,
    validade DATE,
    fornecedor_id INTEGER NOT NULL,
    CONSTRAINT pk_produto PRIMARY KEY (codigo),
    CONSTRAINT fk_prod_fornecedor FOREIGN KEY (fornecedor_id) REFERENCES fornecedor(id)
);

CREATE TABLE servico (
    id SERIAL,
    tipo_servico VARCHAR(100) NOT NULL,
    data_servico TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    valor DECIMAL(10,2) NOT NULL,
    funcionario_id INTEGER NOT NULL,
    cliente_id INTEGER NOT NULL,
    animal_id INTEGER NOT NULL,
    CONSTRAINT pk_servico PRIMARY KEY (id),
    CONSTRAINT fk_serv_func FOREIGN KEY (funcionario_id) REFERENCES funcionario(id),
    CONSTRAINT fk_serv_cli FOREIGN KEY (cliente_id) REFERENCES cliente(id),
    CONSTRAINT fk_serv_animal FOREIGN KEY (animal_id) REFERENCES animal(id)
);

CREATE TABLE venda (
    id SERIAL,
    data_venda TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    forma_pagamento VARCHAR(50),
    funcionario_id INTEGER NOT NULL,
    cliente_id INTEGER NOT NULL,
    CONSTRAINT pk_venda PRIMARY KEY (id),
    CONSTRAINT fk_venda_func FOREIGN KEY (funcionario_id) REFERENCES funcionario(id),
    CONSTRAINT fk_venda_cli FOREIGN KEY (cliente_id) REFERENCES cliente(id)
);

CREATE TABLE venda_item (
    venda_id INTEGER NOT NULL,
    produto_id INTEGER NOT NULL,
    quantidade INTEGER NOT NULL,
    valor_no_momento DECIMAL(10,2) NOT NULL,
    CONSTRAINT pk_venda_item PRIMARY KEY (venda_id, produto_id),
    CONSTRAINT fk_item_venda FOREIGN KEY (venda_id) REFERENCES venda(id),
    CONSTRAINT fk_item_prod FOREIGN KEY (produto_id) REFERENCES produto(codigo)
);