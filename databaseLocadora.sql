CREATE TABLE categoria (
    cod_categoria SERIAL,
    nome_categoria VARCHAR(50) NOT NULL,
    preco_diaria NUMERIC(10,2) NOT NULL,
    descricao TEXT,
    CONSTRAINT pk_categoria PRIMARY KEY (cod_categoria)
);

CREATE TABLE carro (
    num_chassi VARCHAR(17),
    placa VARCHAR(10) UNIQUE NOT NULL,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    ano INT NOT NULL,
    cor VARCHAR(30),
    cod_categoria INT NOT NULL,
    CONSTRAINT pk_carro PRIMARY KEY (num_chassi),
    CONSTRAINT fk_carro_categoria FOREIGN KEY (cod_categoria) REFERENCES categoria(cod_categoria)
);

CREATE TABLE cliente (
    rg VARCHAR(15),
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(150),
    cnh VARCHAR(20) UNIQUE NOT NULL,
    idade INT,
    CONSTRAINT pk_cliente PRIMARY KEY (rg)
);

CREATE TABLE locacao (
    id_locacao SERIAL,
    rg_cliente VARCHAR(15) NOT NULL,
    num_chassi VARCHAR(17) NOT NULL,
    data_locacao DATE NOT NULL,
    hora_locacao TIME NOT NULL,
    CONSTRAINT pk_locacao PRIMARY KEY (id_locacao),
    CONSTRAINT fk_locacao_cliente FOREIGN KEY (rg_cliente) REFERENCES cliente(rg),
    CONSTRAINT fk_locacao_carro FOREIGN KEY (num_chassi) REFERENCES carro(num_chassi)
);

CREATE TABLE oficina (
    id_oficina SERIAL,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(150),
    telefone VARCHAR(20),
    CONSTRAINT pk_oficina PRIMARY KEY (id_oficina)
);

CREATE TABLE conserto (
    id_conserto SERIAL,
    num_chassi VARCHAR(17) NOT NULL,
    id_oficina INT NOT NULL,
    data_conserto DATE NOT NULL,
    valor NUMERIC(10,2) NOT NULL,
    descricao TEXT,
    CONSTRAINT pk_conserto PRIMARY KEY (id_conserto),
    CONSTRAINT fk_conserto_carro FOREIGN KEY (num_chassi) REFERENCES carro(num_chassi),
    CONSTRAINT fk_conserto_oficina FOREIGN KEY (id_oficina) REFERENCES oficina(id_oficina)
);