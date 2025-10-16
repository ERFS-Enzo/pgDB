CREATE TABLE funcionarios(
	cpf VARCHAR(20) NOT NULL,
	CONSTRAINT pk_cpf PRIMARY KEY (cpf),
	priNome VARCHAR(20) NOT NULL,
	segNome VARCHAR(20),
	ultNome VARCHAR(20),
	rua VARCHAR(50),
	bairro VARCHAR(50),
	cidade VARCHAR(50),
	numeroEnd VARCHAR(50),
	sexo VARCHAR(50),
	dataNasc DATE NOT NULL,
	depto_id INTEGER NOT NULL,
    CONSTRAINT fk_func_depto FOREIGN KEY (depto_id)
    REFERENCES departamentos(id_depto)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
);

CREATE TABLE telefones(
	id_tel INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    func_cpf VARCHAR(20) NOT NULL,
    telefone VARCHAR(30) NOT NULL,
    CONSTRAINT fk_tel_func FOREIGN KEY (func_cpf)
    REFERENCES funcionarios(cpf)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);

CREATE TABLE dependentes(
	cpf_dep VARCHAR(20),
	CONSTRAINT pk_cpf_dep PRIMARY KEY (cpf_dep),
    priNome VARCHAR(50) NOT NULL,
    segNome VARCHAR(50),
    ultNome VARCHAR(50),
    rua VARCHAR(100),
    bairro VARCHAR(100),
    cidade VARCHAR(100),
    numero_end VARCHAR(20),
    sexo CHAR(1),
    data_nasc DATE,
    func_cpf VARCHAR(20) NOT NULL,
    CONSTRAINT fk_dep_func FOREIGN KEY (func_cpf)
	REFERENCES funcionarios(cpf)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);
CREATE TABLE departamentos (
    id_depto INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome_depart VARCHAR(50) NOT NULL,
	gerente_depart VARCHAR(20) NOT NULL
);
CREATE TABLE projetos (
    id_proj INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    codigo VARCHAR(50) UNIQUE,
    nome VARCHAR(100) NOT NULL,
    data_inicio DATE,
    data_fim DATE,
    depto_id INT NOT NULL,
    CONSTRAINT fk_proj_depto FOREIGN KEY (depto_id)
    REFERENCES departamentos(id_depto)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
);
CREATE TABLE trabalha_em (
    func_cpf VARCHAR(20) NOT NULL,
    proj_id INT NOT NULL,
    horas NUMERIC(7,2) DEFAULT 0,  
    PRIMARY KEY (func_cpf, proj_id),
    CONSTRAINT fk_trab_func FOREIGN KEY (func_cpf)
    REFERENCES funcionarios(cpf)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT fk_trab_proj FOREIGN KEY (proj_id)
    REFERENCES projetos(id_proj)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

ALTER TABLE funcionarios
ADD COLUMN supervisor_cpf VARCHAR(20);

ALTER TABLE funcionarios
ADD CONSTRAINT fk_supervisor
FOREIGN KEY (supervisor_cpf)
REFERENCES funcionarios(cpf)
ON DELETE SET NULL
ON UPDATE CASCADE

ALTER TABLE departamentos
ADD COLUMN gerente_cpf VARCHAR(20);

ALTER TABLE departamentos
ADD CONSTRAINT fk_depto_gerente
FOREIGN KEY (gerente_cpf)
REFERENCES funcionarios(cpf)
ON DELETE SET NULL
ON UPDATE CASCADE;

SELECT * FROM funcionarios
SELECT * FROM departamentos
SELECT * FROM dependentes
SELECT * FROM projetos
SELECT * FROM telefones
SELECT * FROM trabalha_em