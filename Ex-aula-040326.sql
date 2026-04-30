CREATE TABLE funcionarios (
cpf INTEGER NOT NULL,
nome VARCHAR(50),
funcao VARCHAR(30),
salario DECIMAL(10,2),
dta_nasc DATE,
departamento VARCHAR(30),
CONSTRAINT pk_func_cpf PRIMARY KEY (cpf)
);

INSERT INTO funcionarios(cpf, nome, funcao, salario, dta_nasc, departamento)
	VALUES(7, 'Enzo', 'Dev full-stack', 1618.50, '16/02/2007', 'Desenvolvimento');

INSERT INTO funcionarios(cpf, nome, funcao, salario, dta_nasc, departamento)
	VALUES(1, 'José', 'Gerente', 50000.00, '10/10/1990', 'Gerencia'),
		(2, 'Bruno', 'Contador', 1618.00, '05/05/2005', 'Finanças'),
		(3, 'Miguel', 'Administrador', 3000.00, '01/01/2001', 'Administração');

INSERT INTO funcionarios(cpf, nome, dta_nasc)
	VALUES(4, 'Brian', '24/04/2004');

INSERT INTO funcionarios(cpf, nome, funcao, salario, dta_nasc, departamento)
	VALUES(5, 'Pedro', 'Analista de Sistema', 8750.90, '25/05/2005', 'Desenvolvimento');

INSERT INTO funcionarios(cpf, nome, funcao, salario, dta_nasc, departamento)
	VALUES(6, 'Simon', 'Desenvolvedor Frontend', 1618.00, '20/02/2002', 'Desenvolvimento'),
		(8, 'Theo', 'Desenvolvedor Frontend', 5000.00, '23/03/2000', 'Desenvolvimento');

INSERT INTO funcionarios
	VALUES(9, 'Maicon', 'Desenvolvedor Backend', 4000.00, '10/10/2007', 'TI'),
		(10, 'Breno', 'Cientista de Dados', 6000.00, '07/07/2007', 'TI'),
		(11, 'Kauan', 'Gestor de redes', 2000.00, '09/09/2006', 'TI'),
		(12, 'Marcos', 'Estagiário de Suporte', 800.00, '13/10/2005', 'TI'),
		(13, 'Alexandre', 'Desenvolvedor Backend', 6000.00, '07/07/1999', 'TI');

INSERT INTO funcionarios(cpf, nome, salario, dta_nasc, departamento)
	VALUES(14, 'Hiago', 3500.00, '28/08/2004', 'Administração');

UPDATE funcionarios
	SET salario = 5555.00
	WHERE cpf = 7;

UPDATE funcionarios
	SET funcao = 'DESENVOLVEDOR'
	WHERE departamento = 'TI';

UPDATE funcionarios
	SET salario = salario * 1.1
	WHERE cpf IS NOT NULL;

UPDATE funcionarios
	SET departamento = 'Administração'
	WHERE cpf = 1;

UPDATE funcionarios
	SET funcao = 'Segurança', salario = 2500.00
	WHERE cpf = 4;

UPDATE funcionarios
	SET salario = 0
	WHERE salario IS NULL;

UPDATE funcionarios
	SET funcao = 'Gerente'
	WHERE salario > 8000.00;

DELETE FROM funcionarios
	WHERE CPF = 14;

DELETE FROM funcionarios
	WHERE departamento = 'RH';

DELETE FROM funcionarios
	WHERE salario < 1500.00;


DELETE FROM funcionarios
	WHERE funcao IS NULL;


DELETE FROM funcionarios
	WHERE dta_nasc < '1980-01-01';


DELETE FROM funcionarios;

SELECT * FROM funcionarios;