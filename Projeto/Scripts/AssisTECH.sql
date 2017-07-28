USE assistech;

#TABELA UNIDADE DE SUPORTE
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

#TABELA EMPRESA
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

#TABELA CONTRATO
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
    
#Adicionando a coluna código equipamento à tabela contrato.
ALTER TABLE contrato ADD Cod_Equipamento VARCHAR(8);
#atualizando a chave primária de contrato.
ALTER TABLE contrato DROP PRIMARY KEY; #dropando a chave primária de contrato(cod, ID_Documento, ID_Tipo_Contrato)
#renomeando a coluna COD para COD_Contrato
ALTER TABLE contrato change COD COD_Contrato VARCHAR(5);
ALTER TABLE contrato ADD PRIMARY KEY(COD_Contrato, ID_Documento, ID_Tipo_Contrato, Cod_Equipamento);
#adicionando chave estrangeira Cod_Equipamento a contrato 
ALTER TABLE contrato  
	ADD CONSTRAINT contrato_equipamento_fk foreign key(Cod_Equipamento) references equipamento(Cod_Equipamento);

#adicionando chave estrangeira ID_Documento a contrato. RODAR QUANDO PEGAR O CÓDIGO DE LUCAS    
ALTER TABLE contrato
	ADD CONSTRAINT contrato_documento_fk foreign key(ID_Documento) references documento(ID_Documento) ON DELETE CASCADE ON UPDATE CASCADE;

#TABELA DOCUMENTO
CREATE TABLE documento(
ID_Documento VARCHAR(10),
Tipo VARCHAR(30),
Título VARCHAR(50),
Data_De_Criação DATE,
Arquivo VARCHAR(6),
Versão VARCHAR(4),
CONSTRAINT documento_pk primary key(ID_Documento)
);

#TABELA TIPO_CONTRATO
CREATE TABLE tipo_contrato(
ID_Tipo_Contrato varchar(5),
Descrição Varchar(30),
CONSTRAINT tipo_contrato_pk primary key(ID_Tipo_Contrato)
);

#TABELA EQUIPAMENTO
CREATE TABLE equipamento(
Cod_Equipamento VARCHAR(8),
StatusEquip ENUM('Bom', 'Regular', 'Ruim'),
FabricanteEquip VARCHAR(30),
HistoricoEquip VARCHAR(40),
DescricaoEquip VARCHAR(50),
SetorEquip VARCHAR(20),
DataEntradaEquip DATE,
CONSTRAINT equipamento_pk primary key(Cod_Equipamento)
);

#TABELA COMPUTADOR
#CREATE TABLE computador(



#TABELA ORDEM DE SERVICO
CREATE TABLE ordem_de_servico(
Num_OS VARCHAR(10),
Status_OS ENUM('Aberto', 'Fechado'),
DataCricao_OS DATE,
PrazoEmDiasOS DATE,
DtDevida DATE,
CodOrcamento VARCHAR(10),
CONSTRAINT ordem_de_servico_pk primary key(Num_OS),
CONSTRAINT ordem_de_servico_fk foreign key(CodOrcamento) references orcamento(CodOrcamento)
);


#TABELA ORCAMENTO
CREATE TABLE orcamento(
CodOrcamento VARCHAR(10),
DescOrcamento VARCHAR(50),
DtAbert_Orcto DATE,
DtEmissao_Orcto DATE,
ValidadeEmDias_Orcto DATE,
UltimaData_Orcto DATE,
CONSTRAINT orcamento_pk primary key(CodOrcamento));

#adicionando coluna 
ALTER TABLE orcamento ADD Num_OS VARCHAR(10);
#inserindo chave estrangeira orcamento-os NumOS à tabela orcamento
ALTER TABLE orcamento  
	ADD CONSTRAINT orcamento_os_fk foreign key(Num_OS) references ordem_de_servico(Num_OS);

#Criando tabela funcionário.    
CREATE TABLE funcionario(
Matricula VARCHAR(10),
Cod_Contracheque VARCHAR(10),
Sequencial_Dependente VARCHAR(12),
Id_Jornada_Trabalho VARCHAR(8),
Login VARCHAR(15),
Senha VARCHAR(8),
Nome VARCHAR(15),
Cpf INTEGER(9),
Email VARCHAR(12),
Carga_hora INTEGER(10),
CONSTRAINT funcionario_pk primary key(Matricula)
);

#Criando tabela supervisor
CREATE TABLE supervisor(
Matricula_funcionario VARCHAR(10),
CONSTRAINT funcionario_pk primary key(Matricula_funcionario),
CONSTRAINT funcionario_supervisor_fk foreign key(Matricula_funcionario) references funcionario(Matricula)
);    

#Criando tabela tecnico
CREATE TABLE tecnico(
Matricula_funcionario VARCHAR(10),
CONSTRAINT funcionario_pk primary key(Matricula_funcionario),
CONSTRAINT funcionario_tecnico_fk foreign key(Matricula_funcionario) references funcionario(Matricula)
);

#Criando tabela tecnico_campo
CREATE TABLE tecnico_campo(
Matricula_funcionario VARCHAR(10),
Telefone_movel integer,
CONSTRAINT funcionario_pk primary key(Matricula_funcionario),
CONSTRAINT funcionario_tecnico_campo_fk foreign key(Matricula_funcionario) references funcionario(Matricula)
);

#Criando tabela tecnico_interno
CREATE TABLE tecnico_interno(
Matricula_funcionario VARCHAR(10),
Ramal INTEGER,
Grau_tecnico VARCHAR(30),
CONSTRAINT tecnico_interno_pk primary key(Matricula_funcionario),
CONSTRAINT tecnico_interno_funcionario_fk foreign key(Matricula_funcionario) references funcionario(Matricula)
);

#Criando tabela atendente_solucionador_direcionador
CREATE TABLE atendente_solucionador_direcionador(
Matricula_funcionario VARCHAR(10),
CONSTRAINT funcionario_pk primary key(Matricula_funcionario),
CONSTRAINT atendente_solucionador_direcionador_funcionario_fk foreign key(Matricula_funcionario) references funcionario(Matricula)
);

#Criando tabela kpi
CREATE TABLE kpi(
Matricula_tecnico Varchar(10),
Sequencial INTEGER,
Kpi_1 VARCHAR(30),
Kpi_2 VARCHAR(30),
Dsc_kpi_1 VARCHAR(100),
Dsc_kpi_2 VARCHAR(100),
CONSTRAINT funcionario_pk primary key(Sequencial, Matricula_tecnico),
CONSTRAINT kpi_tecnico_fk foreign key(Matricula_tecnico) references tecnico(Matricula_funcionario)
);

CREATE TABLE supervisao(
Data_inicio date,
Matricula_supervisor VARCHAR(10),
Matricula_supervisionado VARCHAR(10),
CONSTRAINT supervisao_pk primary key(Matricula_supervisor, Matricula_supervisionado),
CONSTRAINT supervisao_supervisor_fk foreign key(Matricula_supervisor) references funcionario(Matricula),
CONSTRAINT supervisao_supervisionado_fk foreign key(Matricula_supervisionado) references funcionario(Matricula)
);
#ADD CONSTRAINT funcionario_contracheque_fk foreign key(Cod_Contracheque) references contracheque(Codigo),
#ADD CONSTRAINT funcionario_dependente_fk foreign key(Sequencial_Dependente) references dependente(Sequencial),

#Definindo Id_jornada_Trabalho como chave estrangeira para a jornada de trabalho, na tabela de funcionario.
ALTER TABLE funcionario
	ADD CONSTRAINT funcionario_jornada_trabalho_fk foreign key(Id_Jornada_Trabalho) references jornada_trabalho(ID_Jornada_Trabalho);

CREATE TABLE dependente(
Sequencial INTEGER(10),
Matricula_Func VARCHAR(10),
Sexo VARCHAR(1),
Data_Nascimento DATE,
Parentesco VARCHAR(8),
Idade INTEGER(3),
CONSTRAINT dependente_pk primary key(Matricula_Func, Sequencial),
CONSTRAINT dependente_funcionario_fk foreign key(Matricula_Func) references funcionario(Matricula)
);

CREATE TABLE contracheque(
Codigo INTEGER(14),
Data_Contracheque DATE,
Horas_extras INTEGER(10),
Salario_Base INTEGER(9),
Adicional_Salario INTEGER(9),
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

#alterando o tipo de dado de Código em contracheque de Integer pra Varchar.
ALTER TABLE contracheque	
	CHANGE Codigo Codigo VARCHAR(14);
#Adicionando código de contracheque à tabela funcionário e tornando-o uma chave estrangeira para tabela contracheque.
ALTER TABLE funcionario 
	ADD CONSTRAINT funcionario_contracheque_fk foreign key(Cod_Contracheque) references contracheque(Codigo);

CREATE TABLE adm_financeiro(
Matricula VARCHAR(10),
CONSTRAINT adm_financeiro_pk primary key(Matricula),
CONSTRAINT adm_financeiro_funcionario_fk foreign key(Matricula) references funcionario(Matricula)
);

ALTER TABLE adm_financeiro
	ADD Cod_Contracheque VARCHAR(14),
    ADD CONSTRAINT adm_fincanceiro_contracheque foreign key(Cod_Contracheque) references contracheque(Codigo);
    
ALTER TABLE contracheque
	ADD CONSTRAINT contracheque_admin_financeiro_fk foreign key(Matricula_Admin_Financeiro) references adm_financeiro(Matricula);
    
ALTER TABLE adm_financeiro
	DROP foreign key adm_fincanceiro_contracheque;
    
