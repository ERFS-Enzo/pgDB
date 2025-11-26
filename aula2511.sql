CREATE TABLE medico(
	crm INTEGER NOT NULL,
	nome VARCHAR(50) NOT NULL,
	dtaNasc DATE,
	rua VARCHAR(50),
	numero VARCHAR(04),
	cep INTEGER,
	cidade VARCHAR(50),
	estado VARCHAR(02),
	CONSTRAINT pk_crm PRIMARY KEY (crm)
);

ALTER TABLE medico ADD COLUMN cod_espec INTEGER NOT NULL;
ALTER TABLE medico ADD COLUMN cod_tel INTEGER NOT NULL;

ALTER TABLE medico ADD CONSTRAINT fk_cod_espec FOREIGN KEY (cod_espec) 
REFERENCES especialidade (cod_espec);

ALTER TABLE medico ADD CONSTRAINT fk_cod_tel FOREIGN KEY (cod_tel)
REFERENCES telefone (cod_tel);

CREATE TABLE especialidade(
	cod_espec SERIAL NOT NULL,
	especialidade VARCHAR(20) NOT NULL,
	CONSTRAINT pk_cod_espec PRIMARY KEY (cod_espec)
);
CREATE TABLE telefone(
	cod_tel SERIAL NOT NULL,
	NUMERO VARCHAR(12),
	CONSTRAINT pk_cod_tel PRIMARY KEY (cod_tel)
);

SELECT * FROM medico;
SELECT * FROM especialidade;
SELECT * FROM telefone;