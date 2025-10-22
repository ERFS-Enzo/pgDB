CREATE TABLE clientes(
	cpf INTEGER NOT NULL,
	nome VARCHAR(50),
	rua VARCHAR(50),
	numero INTEGER,
	bairro VARCHAR(30)
);

ALTER TABLE clientes ADD CONSTRAINT pk_cpf PRIMARY KEY (cpf);

INSERT INTO clientes (cpf, nome, rua, numero, bairro) 
VALUES (02, 'PEDRO CALANGO', 'RUA B', 24, 'BAIRRO DAS NACÕES');

UPDATE clientes SET nome = 'PEDRO CALANGO LULA' 
WHERE cpf = 02;

SELECT * FROM clientes;