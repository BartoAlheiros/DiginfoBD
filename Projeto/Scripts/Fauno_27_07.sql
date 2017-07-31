USE assistech;

CREATE TABLE UNIDADE_DE_SUPORTE(
CNPJ VARCHAR(14), 
estado VARCHAR(10),
uf VARCHAR(2), 
endereco VARCHAR(30), 
nome VARCHAR(15), 
matriz VARCHAR(20),
primary key(CNPJ) );

alter table unidade_de_suporte 
change estado Estado VARCHAR(10),
change uf UF VARCHAR(2), 
change endereco Endereço VARCHAR(30), 
change nome Nome VARCHAR(15), 
change matriz Matriz VARCHAR(20);

#tentando resolver o problema de não conseguir adicionar CNPJ como chave estrangeira de empresa
alter table unidade_de_suporte change CNPJ CNPJ INTEGER(14);
alter table unidade_de_suporte add RazãoSocial VARCHAR(20);
alter table unidade_de_suporte change RazãoSocial RazaoSocial VARCHAR(20);

ALTER TABLE unidade_de_suporte
CHANGE COLUMN RazaoSocial RazaoSocial VARCHAR(20) NOT NULL ,
DROP PRIMARY KEY,
ADD PRIMARY KEY (RazaoSocial);

#ajeitando as besteiras que fiz nas linhas de cima
ALTER TABLE unidade_de_suporte drop primary key;
ALTER TABLE unidade_de_suporte add primary key(CNPJ);
#adicionando constraint...
ALTER TABLE unidade_de_suporte drop primary key;
ALTER TABLE unidade_de_suporte add constraint unidade_sup_cnpj_pk primary key(CNPJ);

CREATE TABLE empresa(
CNPJ INTEGER(14),
RazaoSocial VARCHAR(20),
Endereço VARCHAR(30),
Fone VARCHAR(15),
CONSTRAINT empresa_cnpj_pk primary key(CNPJ)
);

ALTER TABLE empresa
ADD CONSTRAINT CNPJ_empresa_fk
  FOREIGN KEY (CNPJ)
  REFERENCES unidade_de_suporte(CNPJ)
  ON DELETE CASCADE
  ON UPDATE CASCADE;
  
#agora há um caminho entre empresa e unidade_de_suporte e vice-versa
CREATE TABLE contrato(
COD VARCHAR(5),
DataInicio DATE,
DataFim DATE,
StatusContrato ENUM('Aberto', 'Finalizado'),
ID_Documento VARCHAR(10),
ID_Tipo_Contrato VARCHAR(5),
CONSTRAINT contrato_pk primary key(cod, ID_Documento, ID_Tipo_Contrato)
);

ALTER TABLE contrato
	ADD CONSTRAINT contrato_ID_Documento_fk foreign key(ID_Documento) references documento(ID_Documento) ON DELETE CASCADE ON UPDATE CASCADE,
	ADD CONSTRAINT contrato_ID_Tipo_Contrato_fk foreign key(ID_Tipo_Contrato) references tipo_contrato(ID_Tipo_Contrato) ON DELETE CASCADE ON UPDATE CASCADE;


CREATE TABLE documento(
ID_Documento VARCHAR(10),
Tipo VARCHAR(30),
Título VARCHAR(50),
Data_De_Criação DATE,
Arquivo VARCHAR(6),
Versão VARCHAR(4),
CONSTRAINT documento_pk primary key(ID_Documento)
);

CREATE TABLE tipo_contrato(
ID_Tipo_Contrato varchar(5),
Descrição Varchar(30),
CONSTRAINT tipo_contrato_pk primary key(ID_Tipo_Contrato)
);

CREATE TABLE funcionario(
Matricula_funcionario INTEGER,
Cod_Contracheque VARCHAR(10),
Sequencial_Dependente VARCHAR(12),
Id_Jornada_Trabalho VARCHAR(13),
Login VARCHAR(15),
Senha VARCHAR(8),
Nome VARCHAR(15),
Cpf INTEGER(9),
Email VARCHAR(12),
Carga_hora INTEGER,
CONSTRAINT funcionario_pk primary key(Matricula_funcionario),
CONSTRAINT funcionario_fk foreign key(Codigo, Sequencial, id)
);

CREATE TABLE supervisor(
Matricula_funcionario INTEGER,
CONSTRAINT funcionario_pk primary key(Matricula_funcionario)
);

CREATE TABLE tecnico(
Matricula_funcionario INTEGER,
CONSTRAINT funcionario_pk primary key(Matricula_funcionario)
);

CREATE TABLE tecnico_campo(
Matricula_funcionario INTEGER,
Telefone_movel integer,
CONSTRAINT funcionario_pk primary key(Matricula_funcionario)
);

CREATE TABLE atendente_solucionador_direcionador(
Matricula_funcionario INTEGER,
CONSTRAINT funcionario_pk primary key(Matricula_funcionario)
);

CREATE TABLE kpi(
Matricula_funcionario INTEGER,
Sequencial_kpi INTEGER,
Dsk_kpi_1 INTEGER,
Dsk_kpi_2 INTEGER,
Kpi_1 INTEGER,
Kpi_2 INTEGER,
CONSTRAINT funcionario_pk primary key(Matricula_funcionario)
);

CREATE TABLE supervisiona(
Matricula_funcionario INTEGER,
Data_inicio_supervisiona DATE,
CONSTRAINT funcionario_pk primary key(Matricula_funcionario)
);

CREATE TABLE supervisor(
Matricula_funcionario INTEGER,
CONSTRAINT funcionario_pk primary key(Matricula_funcionario)
);

CREATE TABLE tecnico_interno(
Ramal INTEGER,
Grau_tecnico VARCHAR(30)
);

CREATE TABLE dependente(
Sequencial INTEGER,
Sexo CHAR(1) not null,
Data_Nascimento DATE,
Parentesco VARCHAR(8),
Idade INTEGER,
CONSTRAINT dependente_fk foreign key(Sequencial, Matricula_funcionario)
);

CREATE TABLE contracheque(
Codigo INTEGER,
Data_Contracheque DATE,
Horas_extras INTEGER,
Salario_Base INTEGER,
Adicional_Salario INTEGER,
CONSTRAINT contracheque_pk primary key(Codigo)
);

CREATE TABLE jornada_trabalho(
ID_Jornada_Trabalho VARCHAR(8),
Horario_Inicio INTEGER,
Horario_Fim INTEGER,
Trabalha_Sabado VARCHAR(5),
Descricao VARCHAR(7),
CONSTRAINT jornada_trabalho_pk primary key(ID_Jornada_Trabalho)
);