CREATE TABLE cargo (
  id SERIAL,
  nome VARCHAR(100) NOT NULL,
  CONSTRAINT pk_cargo PRIMARY KEY (id)
);

CREATE TABLE funcionario (
  id SERIAL,
  cpf VARCHAR(14) NOT NULL UNIQUE,
  nome_completo VARCHAR(200) NOT NULL,
  endereco VARCHAR(200),
  telefone_residencial VARCHAR(20),
  telefone_celular VARCHAR(20),
  data_nascimento DATE,
  cargo_id INT,
  CONSTRAINT pk_funcionario PRIMARY KEY (id),
  CONSTRAINT fk_funcionario_cargo FOREIGN KEY (cargo_id) REFERENCES cargo(id)
);

CREATE TABLE cliente (
  id SERIAL,
  cpf VARCHAR(14) NOT NULL UNIQUE,
  nome_completo VARCHAR(200) NOT NULL,
  endereco VARCHAR(200),
  telefone_comercial VARCHAR(20),
  telefone_residencial VARCHAR(20),
  telefone_celular VARCHAR(20),
  data_nascimento DATE,
  email VARCHAR(100),
  CONSTRAINT pk_cliente PRIMARY KEY (id)
);

CREATE TABLE tipo_animal (
  id SERIAL,
  nome VARCHAR(50),
  CONSTRAINT pk_tipo_animal PRIMARY KEY (id)
);

CREATE TABLE animal (
  id SERIAL,
  cliente_id INT,
  nome VARCHAR(100) NOT NULL,
  data_nascimento DATE,
  sexo VARCHAR(10),
  raca VARCHAR(100),
  cor_predominante VARCHAR(50),
  tipo_animal_id INT,
  CONSTRAINT pk_animal PRIMARY KEY (id),
  CONSTRAINT fk_animal_cliente FOREIGN KEY (cliente_id) REFERENCES cliente(id),
  CONSTRAINT fk_animal_tipo FOREIGN KEY (tipo_animal_id) REFERENCES tipo_animal(id)
);

CREATE TABLE fornecedor (
  id SERIAL,
  nome VARCHAR(100),
  cnpj VARCHAR(20),
  telefone VARCHAR(20),
  email VARCHAR(100),
  CONSTRAINT pk_fornecedor PRIMARY KEY (id)
);

CREATE TABLE produto (
  id SERIAL,
  nome VARCHAR(100),
  marca VARCHAR(100),
  valor_unitario NUMERIC(10,2),
  validade DATE,
  fornecedor_id INT,
  CONSTRAINT pk_produto PRIMARY KEY (id),
  CONSTRAINT fk_produto_fornecedor FOREIGN KEY (fornecedor_id) REFERENCES fornecedor(id)
);

CREATE TABLE tipo_servico (
  id SERIAL,
  nome VARCHAR(100),
  CONSTRAINT pk_tipo_servico PRIMARY KEY (id)
);

CREATE TABLE servico (
  id SERIAL,
  funcionario_id INT,
  cliente_id INT,
  animal_id INT,
  tipo_servico_id INT,
  data_servico DATE,
  valor NUMERIC(10,2),
  CONSTRAINT pk_servico PRIMARY KEY (id),
  CONSTRAINT fk_servico_funcionario FOREIGN KEY (funcionario_id) REFERENCES funcionario(id),
  CONSTRAINT fk_servico_cliente FOREIGN KEY (cliente_id) REFERENCES cliente(id),
  CONSTRAINT fk_servico_animal FOREIGN KEY (animal_id) REFERENCES animal(id),
  CONSTRAINT fk_servico_tipo FOREIGN KEY (tipo_servico_id) REFERENCES tipo_servico(id)
);

CREATE TABLE venda (
  id SERIAL,
  cliente_id INT,
  funcionario_id INT,
  data_venda DATE,
  valor_total NUMERIC(10,2),
  forma_pagamento VARCHAR(50),
  CONSTRAINT pk_venda PRIMARY KEY (id),
  CONSTRAINT fk_venda_cliente FOREIGN KEY (cliente_id) REFERENCES cliente(id),
  CONSTRAINT fk_venda_funcionario FOREIGN KEY (funcionario_id) REFERENCES funcionario(id)
);

CREATE TABLE item_venda (
  id SERIAL,
  venda_id INT,
  produto_id INT,
  quantidade INT,
  valor_unitario NUMERIC(10,2),
  CONSTRAINT pk_item_venda PRIMARY KEY (id),
  CONSTRAINT fk_item_venda_venda FOREIGN KEY (venda_id) REFERENCES venda(id),
  CONSTRAINT fk_item_venda_produto FOREIGN KEY (produto_id) REFERENCES produto(id)
);
