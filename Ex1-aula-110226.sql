CREATE TABLE departamento (
    numero SERIAL,
    nome VARCHAR(100) NOT NULL,
    local VARCHAR(150),
    CONSTRAINT pk_departamento PRIMARY KEY (numero)
);

CREATE TABLE funcionario (
    id SERIAL,
    primeiro_nome VARCHAR(50) NOT NULL,
    segundo_nome VARCHAR(100),
    ultimo_nome VARCHAR(50) NOT NULL,
    endereco VARCHAR(200),
    sexo CHAR(1),
    cpf CHAR(11) NOT NULL,
    data_nascimento DATE,
    departamento_id INTEGER,
    supervisor_id INTEGER,
    
    CONSTRAINT pk_funcionario PRIMARY KEY (id),
    CONSTRAINT un_funcionario_cpf UNIQUE (cpf),
    CONSTRAINT fk_func_depto FOREIGN KEY (departamento_id) REFERENCES departamento(numero),
    CONSTRAINT fk_func_supervisor FOREIGN KEY (supervisor_id) REFERENCES funcionario(id)
);

ALTER TABLE departamento ADD COLUMN gerente_id INTEGER UNIQUE;
ALTER TABLE departamento ADD CONSTRAINT fk_depto_gerente FOREIGN KEY (gerente_id) REFERENCES funcionario(id);

CREATE TABLE telefone (
    id SERIAL,
    numero VARCHAR(15) NOT NULL,
    funcionario_id INTEGER NOT NULL,
    CONSTRAINT pk_telefone PRIMARY KEY (id),
    CONSTRAINT fk_tel_func FOREIGN KEY (funcionario_id) REFERENCES funcionario(id) ON DELETE CASCADE
);

CREATE TABLE dependente (
    id SERIAL,
    primeiro_nome VARCHAR(50) NOT NULL,
    segundo_nome VARCHAR(100),
    ultimo_nome VARCHAR(50) NOT NULL,
    endereco VARCHAR(200),
    sexo CHAR(1),
    cpf CHAR(11) UNIQUE,
    data_nascimento DATE,
    funcionario_id INTEGER NOT NULL,
    CONSTRAINT pk_dependente PRIMARY KEY (id),
    CONSTRAINT fk_dep_func FOREIGN KEY (funcionario_id) REFERENCES funcionario(id) ON DELETE CASCADE
);

CREATE TABLE projeto (
    codigo SERIAL,
    nome VARCHAR(100) NOT NULL,
    data_inicio DATE,
    departamento_id INTEGER NOT NULL,
    CONSTRAINT pk_projeto PRIMARY KEY (codigo),
    CONSTRAINT fk_proj_depto FOREIGN KEY (departamento_id) REFERENCES departamento(numero)
);

CREATE TABLE alocacao_projeto (
    funcionario_id INTEGER NOT NULL,
    projeto_id INTEGER NOT NULL,
    quantidade_horas DECIMAL(10,2) DEFAULT 0,
    CONSTRAINT pk_alocacao PRIMARY KEY (funcionario_id, projeto_id),
    CONSTRAINT fk_aloc_func FOREIGN KEY (funcionario_id) REFERENCES funcionario(id),
    CONSTRAINT fk_aloc_proj FOREIGN KEY (projeto_id) REFERENCES projeto(codigo)
);