INSERT INTO funcionarios
	VALUES (10, 'João Silva', 'Analista', '15/05/1990'),
		(11, 'Carla Souza', 'Gerente', '22/11/1985');
INSERT INTO funcionarios (cpf, nome, data_nasc)
	VALUES (12, 'Lucas Pereira', '01/01/2000');


UPDATE funcionarios
	SET funcao = 'Coordenador'
	WHERE cpf = 10;

UPDATE funcionarios
	SET nome = 'Carla Andrade', funcao = 'Diretora'
	WHERE cpf = 11;

UPDATE funcionarios
	SET funcao = 'TEMPORÁRIO';

DELETE FROM funcionarios
	WHERE cpf = 12;

DELETE FROM funcionarios
	WHERE funcao = 'TEMPORÁRIO';

INSERT INTO funcionarios(cpf, nome, data_nasc)
	VALUES (01, 'Ana Costa', '01/01/2001'),
		(02, 'Marcos Lima', '02/02/2002'),
		(03, 'Fernanda Alves', '03/03/2003');

DELETE FROM funcionarios;

INSERT INTO funcionarios
	VALUES(16, 'Paulo Mendes', null, '10/10/1991'),
		(17, 'Juliana Rocha', 'Estagiária', now() );

UPDATE funcionarios
	SET nome = UPPER(nome);

UPDATE funcionarios
	SET funcao = 'APOSENTADO'
	WHERE data_nasc < '01/01/1970';

UPDATE funcionarios
	SET funcao = 'GERENTE', nome = 'Carlos Gerente'
	WHERE cpf = 13;

DELETE FROM funcionarios
	WHERE cpf BETWEEN 14 AND 16;


DELETE FROM funcionarios
	WHERE nome = 'MARIA';

INSERT INTO funcionarios 
	VALUES (01, 'Ricardo Lopes', 'Professor', '01/01/2001'),
		(02, 'Sofia Martins', 'Professor', '02/02/2002');

UPDATE funcionarios
	SET funcao = 'Coordenador Acad'
	WHERE funcao = 'Professor';

DELETE FROM funcionarios
	WHERE funcao IS NULL;
	
SELECT * FROM funcionarios;
