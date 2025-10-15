CREATE TABLE funcionarios(
	cpf VARCHAR(20) NOT NULL,
	CONSTRAINT pk_cpf PRIMARY KEY (cpf),
	priNome VARCHAR(20),
	segNome VARCHAR(20),
	ultNome VARCHAR(20),
	rua VARCHAR(50),
	bairro VARCHAR(50),
	cidade VARCHAR(50),
	numeroEnd VARCHAR(50),
	sexo VARCHAR(50),
	dataNasc DATE	
);

CREATE TABLE telefones(
	idTel INTEGER NOT NULL,
	CONSTRAINT pk_idTel PRIMARY KEY (idTel),
	telefone varchar(20) NOT NULL,
	func_cpf VARCHAR(20) REFERENCES funcionarios(cpf)
);

INSERT INTO funcionarios(
	cpf
) VALUES (101010)

SELECT * FROM funcionarios WHERE priNome LIKE 'G%'

INSERT INTO telefones(
 idTel, telefone, func_cpf
) VALUES (2, 996116255, 101010)

SELECT * FROM telefones

INSERT INTO funcionarios(
 cpf, priNome
) VALUES(404040, 'Heitor')

