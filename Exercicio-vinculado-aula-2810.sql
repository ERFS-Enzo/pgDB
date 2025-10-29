SELECT * FROM departamentos;
SELECT * FROM bancos;
SELECT * FROM funcionarios;

INSERT INTO bancos(cod_banco, nome)
VALUES (5, 'Banco BMG');

UPDATE funcionarios
SET cod_banco = 5
WHERE cod_banco IS NULL;

DELETE FROM funcionarios
WHERE nome = 'Raimundo Pizzolo';

INSERT INTO departamentos(cod_depto, nome) 
VALUES (5, 'Tecnologia da informação');

UPDATE funcionarios
SET cod_depto = 5
WHERE nome = 'João Anastácio' OR nome = 'Pedro Brasona';
