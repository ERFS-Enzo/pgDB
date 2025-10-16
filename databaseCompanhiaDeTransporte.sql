CREATE TABLE Armazem (
    id_armazem SERIAL CONSTRAINT pk_armazem PRIMARY KEY,
    localizacao VARCHAR(100) NOT NULL
);

CREATE TABLE Deposito (
    id_deposito SERIAL CONSTRAINT pk_deposito PRIMARY KEY,
    localizacao VARCHAR(100) NOT NULL
);

CREATE TABLE Caminhao (
    codigo_licenca VARCHAR(20) CONSTRAINT pk_caminhao PRIMARY KEY,
    capacidade_peso DECIMAL(10,2) NOT NULL,
    capacidade_volume DECIMAL(10,2) NOT NULL
);

CREATE TABLE Viagem (
    id_viagem SERIAL CONSTRAINT pk_viagem PRIMARY KEY,
    id_armazem_origem INT NOT NULL,
    codigo_licenca VARCHAR(20) NOT NULL,
    peso_total DECIMAL(10,2) NOT NULL,
    volume_total DECIMAL(10,2) NOT NULL,
    CONSTRAINT fk_viagem_armazem FOREIGN KEY (id_armazem_origem) REFERENCES Armazem(id_armazem),
    CONSTRAINT fk_viagem_caminhao FOREIGN KEY (codigo_licenca) REFERENCES Caminhao(codigo_licenca)
);

CREATE TABLE Remessa (
    id_remessa SERIAL CONSTRAINT pk_remessa PRIMARY KEY,
    id_viagem INT NOT NULL,
    id_deposito_destino INT NOT NULL,
    peso DECIMAL(10,2) NOT NULL,
    volume DECIMAL(10,2) NOT NULL,
    CONSTRAINT fk_remessa_viagem FOREIGN KEY (id_viagem) REFERENCES Viagem(id_viagem),
    CONSTRAINT fk_remessa_deposito FOREIGN KEY (id_deposito_destino) REFERENCES Deposito(id_deposito)
);