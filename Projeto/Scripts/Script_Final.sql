create schema assistech;
use assistech;

CREATE TABLE EMPRESA ( 
CNPJ BIGINT(14) UNSIGNED,
Razao_social VARCHAR(20) NOT NULL UNIQUE, 
Endereco VARCHAR(30) NOT NULL, 
Fone VARCHAR(15) NOT NULL, 
estado VARCHAR(50),
CONSTRAINT PRIMARY KEY(CNPJ)
);

DROP TABLE UNIDADE_DE_SUPORTE;

CREATE TABLE UNIDADE_DE_SUPORTE ( 
CNPJ BIGINT(14) UNSIGNED, 
Nro_funcionarios INT, 
Nome VARCHAR(50) NOT NULL, 
Matriz VARCHAR(20) NOT NULL, 
endereco VARCHAR(50) NOT NULL UNIQUE,
FONE VARCHAR(16) NOT NULL,
CONSTRAINT PRIMARY KEY(CNPJ),
CONSTRAINT fk_unid_suporte_empresa FOREIGN KEY(CNPJ) REFERENCES EMPRESA(CNPJ)
);

CREATE TABLE SUPERVISIONA ( 
Matricula_supervisor VARCHAR(13), 
data_inicio DATE NOT NULL,
CONSTRAINT PRIMARY KEY(Matricula_supervisor),
CONSTRAINT FOREIGN KEY(Matricula_supervisor) REFERENCES SUPERVISOR (matricula) 
);


CREATE TABLE FUNCIONARIO (
Matricula VARCHAR(13), 
CPF BIGINT(11) NOT NULL UNIQUE, 
Matricula_supervisor VARCHAR(13) NOT NULL, 
CNPJ BIGINT(14) UNSIGNED NOT NULL UNIQUE, 
Login VARCHAR(15) NOT NULL UNIQUE, 
Senha VARCHAR(15) NOT NULL UNIQUE, 
Nome VARCHAR(30), 
Cod_Contracheque BIGINT UNSIGNED UNIQUE, 
Email VARCHAR(50) UNIQUE, 
Carga_hora INT(2),
CONSTRAINT PRIMARY KEY(Matricula),
CONSTRAINT funcionario_unid_sup_fk FOREIGN KEY (CNPJ) REFERENCES UNIDADE_DE_SUPORTE (CNPJ)
);

ALTER TABLE FUNCIONARIO
	ADD CONSTRAINT funcionario_supervisiona_fk FOREIGN KEY(Matricula_supervisor) REFERENCES SUPERVISIONA(Matricula_supervisor);

CREATE TABLE SUPERVISOR ( 
matricula VARCHAR(13),
CONSTRAINT PRIMARY KEY(matricula),
CONSTRAINT funcionario_supervisor_fk FOREIGN KEY(matricula) REFERENCES FUNCIONARIO (Matricula)
);


CREATE TABLE TECNICO ( 
Matricula_tecnico VARCHAR(13),
CONSTRAINT PRIMARY KEY(Matricula_tecnico),
CONSTRAINT tecnico_funcionario_fk FOREIGN KEY(Matricula_tecnico) references FUNCIONARIO( Matricula )
);

CREATE TABLE TECNICO_CAMPO ( 
matricula VARCHAR(13), 
tel_movel VARCHAR(14) UNIQUE,
CONSTRAINT PRIMARY KEY(matricula),
CONSTRAINT tecnico_campo_tecnico_fk FOREIGN KEY(matricula) references TECNICO(Matricula_tecnico)
 );


CREATE TABLE ATENDENTE_SOLUCIONADOR_DIRECIONADOR (
matricula VARCHAR(13),
CONSTRAINT PRIMARY KEY(matricula),
CONSTRAINT atendente_soluc_direc_funciionario_fk FOREIGN KEY(matricula) references TECNICO (Matricula_tecnico)
);

CREATE TABLE TECNICO_INTERNO ( 
matricula VARCHAR(13), 
Ramall VARCHAR(20), 
Grau_tec VARCHAR(30),
CONSTRAINT PRIMARY KEY(matricula),
CONSTRAINT tec_interno_tecnico_fk FOREIGN KEY(matricula) references TECNICO (Matricula_tecnico)
);

CREATE TABLE DEPENDENTE ( 
Sequencial INT(10), 
Matricula_funcionario VARCHAR(13), 
Sexo VARCHAR(1) NOT NULL, 
Data_nascimento DATE NOT NULL, 
Parentesco VARCHAR(20) NOT NULL, 
Idade INT(3) NOT NULL,
PRIMARY KEY(Sequencial, Matricula_funcionario),
CONSTRAINT dependente_funcionario_fk FOREIGN KEY(Matricula_funcionario) references FUNCIONARIO(Matricula)
);

CREATE TABLE JORNADA_DE_TRABALHO ( 
Id VARCHAR(8), 
Hora_inicio TIME NOT NULL, 
Hora_final TIME NOT NULL, 
Trabalha_sabado BOOLEAN NOT NULL, 
descricao VARCHAR(60), 
Matricula_funcionario VARCHAR(13) NOT NULL UNIQUE,
CONSTRAINT PRIMARY KEY(Id),
CONSTRAINT jorn_trab_funcionario_fk FOREIGN KEY(Matricula_funcionario) references FUNCIONARIO (Matricula)
);

CREATE TABLE ADM_FINANCEIRO ( 
Matricula VARCHAR(13),
CONSTRAINT PRIMARY KEY(Matricula),
CONSTRAINT adm_financeiro_func_fk FOREIGN KEY(Matricula) references FUNCIONARIO(Matricula)
);

CREATE TABLE CONTRACHEQUE ( 
Codigo VARCHAR(14), 
Horas_extras SMALLINT UNSIGNED NOT NULL, 
Salario_Base INT(9) NOT NULL, 
Adicional_Salario INT(9), 
Dta DATE NOT NULL, 
Matricula_Funcionario VARCHAR(13) NOT NULL UNIQUE,
Matricula_adm_financeiro VARCHAR(13) NOT NULL UNIQUE, 
CONSTRAINT PRIMARY KEY(Codigo),
CONSTRAINT contracheque_funcionario_fk FOREIGN KEY( Matricula_Funcionario ) references FUNCIONARIO(Matricula),
CONSTRAINT contracheque_adm_finc_fk FOREIGN KEY(Matricula_adm_financeiro ) references ADM_FINANCEIRO(Matricula)
);

CREATE TABLE ORDEM_SERVICO ( 
Num INT, 
Data_devida DATE NOT NULL, 
Prazo_em_dias INT NOT NULL, 
Data_criacao DATE NOT NULL, 
Status_ VARCHAR(20) NOT NULL,  
Cod_servico INT NOT NULL, 
sequencial_chamado INT(11) NOT NULL,
CONSTRAINT PRIMARY KEY(Num),
CONSTRAINT ord_servico_orcamento_fk FOREIGN KEY(Cod_orcamento) references ORCAMENTO(Cod),
CONSTRAINT ord_servico_chamado_fk FOREIGN KEY(sequencial_chamado) references CHAMADO (Sequencial) 
);

CREATE TABLE CHAMADO ( 
Sequencial INT(11), 
Tipo VARCHAR(30), 
Status_ VARCHAR(20), 
Descricao VARCHAR(100), 
Prioridade VARCHAR(20), 
Mat_supervisor VARCHAR(13), 
Mat_tec_campo VARCHAR(13), 
Mat_tec_interno VARCHAR(13), 
Mat_atend VARCHAR(13), 
Num_ordem_servico INT,
PRIMARY KEY(Sequencial),
CONSTRAINT chamado_supervisor_fk FOREIGN KEY(Mat_supervisor) references SUPERVISOR(Matricula_supervisor),
CONSTRAINT chamado_tec_campo_fk FOREIGN KEY(Mat_tec_campo) references TECNICO_CAMPO(Matricula_tec_campo),
CONSTRAINT chamado_tec_interno_fk FOREIGN KEY(Mat_tec_interno) references TECNICO_INTERNO(Matricula_tec_interno),
CONSTRAINT chamado_atend_sol_direc_fk FOREIGN KEY(Mat_atend) references ATENDENTE_SOLUCIONADOR_DIRECIONADOR(matricula), 
CONSTRAINT chamado_ordem_servico_fk FOREIGN KEY(Num_ordem_servico) references ORDEM_SERVICO(Num)
);

CREATE TABLE ATENDE ( 
Sequencial_chamado INT(11),  
Mat_tec_campo VARCHAR(13),
CONSTRAINT PRIMARY KEY(Sequencial_chamado, Mat_tec_campo)
);

CREATE TABLE DESPESA_VIAGEM ( 
Cod VARCHAR(10), 
Valor INT NOT NULL, 
Id_tipo_despesa VARCHAR(8) NOT NULL, 
Mat_adm_financeiro VARCHAR(13) NOT NULL UNIQUE, 
Sequencial_chamado INT(11) NOT NULL,  
Mat_tec_campo VARCHAR(13) NOT NULL,
CONSTRAINT PRIMARY KEY(Cod),
CONSTRAINT despesa_tipo_despesa_fk FOREIGN KEY(Id_tipo_despesa) references TIPO_DESPESA(Id),
CONSTRAINT despesa_adm_financeiro_fk FOREIGN KEY(Mat_adm_financeiro) references ADM_FINANCEIRO(Matricula),
CONSTRAINT chamado_fk FOREIGN KEY(Sequencial_chamado) references ATENDE(Sequencial_chamado),
CONSTRAINT tec_campo_fk FOREIGN KEY(Mat_tec_campo) references ATENDE (Mat_tec_campo)
);

CREATE TABLE TIPO_DESPESA ( 
Id INT, 
Descricao VARCHAR(50) NOT NULL,
PRIMARY KEY(Id)
);

CREATE TABLE KPI ( 
Sequencial INT(11), 
Matricula_tecnico VARCHAR(10), 
KPI_1 VARCHAR(30), 
KPI_2 VARCHAR(30), 
Dsc_KPI_1 VARCHAR(100), 
Dsk_KPI_2 VARCHAR(100),

CONSTRAINT kpi_tecnico_fk FOREIGN KEY(Matricula_tecnico) references TECNICO (Matricula)
);

CREATE TABLE SERVICO ( 
Cod INT, 
Descricao VARCHAR(255) NOT NULL, 
Valor INT NOT NULL, 
Status_ VARCHAR(255) NOT NULL, 
Cod_Tipo_Servico INT NOT NULL,
Num_OS INT NOT NULL UNIQUE,
CONSTRAINT PRIMARY KEY(Cod),
CONSTRAINT servico_ord_servico_fk FOREIGN KEY(Num_OS) references ORDEM_SERVICO(Num),
CONSTRAINT servico_tipo_servic_fk FOREIGN KEY(Cod_Tipo_Servico) references TIPO_SERVICO(Cod)
);

CREATE TABLE TIPO_SERVICO ( 
Cod INT, 
Descricao VARCHAR(255) NOT NULL,
CONSTRAINT PRIMARY KEY(Cod)
);

CREATE TABLE ORCAMENTO ( 
Cod INT, 
Data_emissao DATE NOT NULL, 
Validade_num_dias INT NOT NULL, 
ultima_data DATE NOT NULL, 
Descricao VARCHAR(255) NOT NULL, 
Data_abertura DATE NOT NULL, 
Num_OS INT NOT NULL UNIQUE,
CONSTRAINT PRIMARY KEY(Cod),
CONSTRAINT orcamento_os_fk FOREIGN KEY(Num_OS) references ORDEM_SERVICO(Num)
);


CREATE TABLE BASE_PROBLEMAS_KB ( 
Id INT, 
Descricao VARCHAR(255) NOT NULL, 
Procedimento VARCHAR(1023) NOT NULL, 
Solucao VARCHAR(1023) NOT NULL, 
Data_entrada DATE NOT NULL, 
Tempo_necessario INT NOT NULL, 
obs VARCHAR(1023) NOT NULL, 
Id_relacionado INT NOT NULL, 
Cod_servico INT NOT NULL,
CONSTRAINT PRIMARY KEY(Id),
CONSTRAINT base_probs_relacionado_com_fk FOREIGN KEY(Id_relacionado) references BASE_PROBLEMAS_KB(Id),
CONSTRAINT base_probs_servico_fk FOREIGN KEY(Cod_servico) references SERVICO(Cod)
);


CREATE TABLE BASEOU_EM ( 
Id_base_prob INT, 
Cod_servico INT,
CONSTRAINT PRIMARY KEY(Id_base_prob, Cod_servico),
CONSTRAINT baseou_em_base_probs_fk FOREIGN KEY(Id_base_prob) references BASE_PROBLEMAS_KB(Id),
CONSTRAINT baseou_em_servico_fk FOREIGN KEY(Cod_servico) references SERVICO(Cod)
);

CREATE TABLE CLIENTE ( 
Cod INT, 
Prioridade VARCHAR(20) NOT NULL, 
Endereco VARCHAR(200) NOT NULL, 
Estado VARCHAR(50) NOT NULL, 
Email VARCHAR(100) UNIQUE, 
Fone VARCHAR(30) NOT NULL,
CONSTRAINT PRIMARY KEY(Cod)
);

CREATE TABLE CLIENTE_JUR ( 
Cod_cliente INT, 
Cnpj INT(11) NOT NULL, 
Razao_social VARCHAR(100) NOT NULL,
CONSTRAINT PRIMARY KEY(Cod_Cliente),
CONSTRAINT cliente_jur_cliente_fk FOREIGN KEY( Cod_cliente ) references CLIENTE(Cod)
);

CREATE TABLE CLIENTE_FIS ( 
Cod_cliente INT, 
Cpf VARCHAR(11) NOT NULL, 
Nome VARCHAR(255) NOT NULL,
CONSTRAINT PRIMARY KEY(Cod_Cliente),
CONSTRAINT cliente_fis_cliente_fk FOREIGN KEY( Cod_cliente ) references CLIENTE(Cod)
);


CREATE TABLE FATURA ( 
Cod INT, 
Num_parcelas INT NOT NULL,
Valor_total INT NOT NULL, 
Status_ VARCHAR(30) NOT NULL, 
Cod_cliente INT NOT NULL,
CONSTRAINT PRIMARY KEY(Cod), 
CONSTRAINT fatura_cliente_fk FOREIGN KEY(Cod_cliente) references CLIENTE(Cod)
);


CREATE TABLE ALMOXARIFADO ( 
Id INT, 
Saida_mes VARCHAR(20) NOT NULL, 
Descricao VARCHAR(255) NOT NULL, 
Entrada_mes VARCHAR(20) NOT NULL, 
Quantidade_total INT NOT NULL, 
Cod_Insumo INT NOT NULL,
CONSTRAINT PRIMARY KEY(Id)
);