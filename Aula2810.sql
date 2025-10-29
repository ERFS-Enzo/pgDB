CREATE TABLE departamentos (
    cod_depto INT NOT NULL,
    nome VARCHAR(50),
    CONSTRAINT pk_cod_depto PRIMARY KEY (cod_depto)
);
CREATE TABLE bancos (
    cod_banco INT NOT NULL,
    nome VARCHAR(50),
    agencia VARCHAR(50),
    numero_banco VARCHAR(50),
    CONSTRAINT pk_cod_banco PRIMARY KEY (cod_banco)
);
CREATE TABLE funcionarios (
    cod_func INT NOT NULL,
    nome VARCHAR(50),
    cod_depto INT,
    salario NUMERIC(10,2),
    dt_admissao DATE,
    dt_nascto DATE,
    cod_banco INT,
    CONSTRAINT pk_cod_func PRIMARY KEY (cod_func),
    CONSTRAINT fk_departamento FOREIGN KEY (cod_depto)
        REFERENCES departamentos (cod_depto),
    CONSTRAINT fk_banco FOREIGN KEY (cod_banco)
        REFERENCES bancos (cod_banco)
);

INSERT INTO departamentos (cod_depto, nome) VALUES
(1, 'Recursos Humanos'),
(2, 'Desenvolvimento'),
(3, 'Financeiro'),
(4, 'Editoração');

INSERT INTO bancos (cod_banco, nome, agencia, numero_banco) VALUES
(1, 'Banco do Brasil', '0407-3', '6620-6'),
(2, 'Bradesco', '500-4', '1246-88'),
(3, 'Bradesco', '345-1', '1232-2'),
(4, 'Itaú', '2323-24', '34534');

INSERT INTO funcionarios (cod_func, nome, cod_depto, salario, dt_admissao, dt_nascto, cod_banco) VALUES
(1, 'João Anastácio', 1, 500.00, '1995-01-01', '1975-01-02', 1),
(2, 'Pedro Brasona', 2, 800.00, '2001-02-05', '1980-12-01', 2),
(3, 'Manoel da R. Pizzolo', 3, 1500.00, '1990-05-02', '1930-10-08', 3),
(4, 'João Malha', 3, 1800.00, '1999-04-10', '1988-04-13', 4),
(5, 'Antônio Nascimento', 3, 200.00, '1985-01-10', '1967-01-10', NULL),
(6, 'Maria de Jesus', 4, 180.00, '1985-02-11', '1967-02-11', NULL),
(7, 'Raimundo Pizzolo', 4, 180.00, '1985-02-11', '1967-02-11', NULL);

UPDATE funcionarios
SET salario = 2000.00
WHERE nome = 'João Malha';

UPDATE funcionarios
SET cod_banco = 1
WHERE nome = 'Maria de Jesus';

DELETE FROM funcionarios
WHERE nome = 'Pedro Brasona';

SELECT * FROM bancos;
SELECT * FROM departamentos;
SELECT * FROM funcionarios;