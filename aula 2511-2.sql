CREATE TABLE paciente ( 
cpf_paciente INTEGER NOT NULL, 
nome VARCHAR (50) NOT NULL, 
rua VARCHAR (50),
numero VARCHAR (04), 
cep INTEGER, 
cidade VARCHAR(20), 
estado VARCHAR (02), 
cod_telefone INTEGER NOT NULL 
);

ALTER TABLE paciente ADD CONSTRAINT pk_cpf_paciente PRIMARY KEY (cpf_paciente)

ALTER TABLE paciente ADD CONSTRAINT fk_cod_telefone FOREIGN KEY (cod_telefone) 
REFERENCES pac_tel (cod_pac_tel)

CREATE TABLE pac_tel( 
cod_pac_tel INTEGER NOT NULL,
num_tel VARCHAR (12),
CONSTRAINT pk_cod_pac_tel PRIMARY KEY (cod_pac_tel) 
);

CREATE TABLE consulta(
cod_consulta INTEGER NOT NULL,
dt_consulta DATE NOT NULL,
cpf_paciente INTEGER NOT NULL,
crm_medico INTEGER NOT NULL,
CONSTRAINT pk_cod_consulta PRIMARY KEY (cod_consulta),
CONSTRAINT fk_cpf_paciente FOREIGN KEY (cpf_paciente) 
REFERENCES paciente (cpf_paciente) 
);

ALTER TABLE consulta ADD CONSTRAINT fk_crm_medico FOREIGN KEY (crm_medico)
REFERENCES medico (crm)