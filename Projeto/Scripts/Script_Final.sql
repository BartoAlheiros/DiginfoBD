create schema assistech;
use assistech;

CREATE TABLE EMPRESA ( 
CNPJ BIGINT(14) UNSIGNED,
Razao_social VARCHAR(20), 
Endereco VARCHAR(30) NOT NULL, 
Fone VARCHAR(15) NOT NULL, 
estado VARCHAR(50),
CONSTRAINT PRIMARY KEY(CNPJ)
);


CREATE TABLE UNIDADE_DE_SUPORTE ( 
CNPJ BIGINT(14) UNSIGNED, 
Nro_funcionarios INT, 
Nome VARCHAR(50), 
Matriz VARCHAR(20), 
endereco VARCHAR(50),
FONE VARCHAR(16),
CONSTRAINT PRIMARY KEY(CNPJ),
CONSTRAINT fk_unid_suporte_empresa FOREIGN KEY(CNPJ) REFERENCES EMPRESA(CNPJ)
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
CONSTRAINT funcionario_unid_sup_fk FOREIGN KEY (CNPJ) REFERENCES UNIDADE_DE_SUPORTE (CNPJ),
CONSTRAINT funcionario_supervisiona_fk FOREIGN KEY(Matricula_supervisor) REFERENCES SUPERVISIONA(Matricula_supervisor)
);

CREATE TABLE SUPERVISOR ( 
matricula VARCHAR(13),
CONSTRAINT PRIMARY KEY(matricula),
CONSTRAINT funcionario_supervisor_fk FOREIGN KEY(matricula) REFERENCES FUNCIONARIO (Matricula)
);

CREATE TABLE SUPERVISIONA ( 
Matricula_supervisor VARCHAR(13), 
data_inicio DATE,
CONSTRAINT PRIMARY KEY(Matricula_supervisor),
CONSTRAINT FOREIGN KEY(Matricula_supervisor) REFERENCES SUPERVISOR (matricula) 
);

CREATE TABLE TECNICO ( 
Matricula_tecnico VARCHAR(13),
CONSTRAINT PRIMARY KEY(Matricula_tecnico),
CONSTRAINT tecnico_funcionario_fk FOREIGN KEY(Matricula_tecnico) references FUNCIONARIO( Matricula )
);

CREATE TABLE TECNICO_CAMPO ( 
matricula VARCHAR(13), 
tel_movel VARCHAR(14),
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
Grau_tec VARCHAR(30) ,
CONSTRAINT PRIMARY KEY(matricula),
CONSTRAINT tec_interno_tecnico_fk FOREIGN KEY(matricula) references TECNICO (Matricula_tecnico)
);

CREATE TABLE DEPENDENTE ( 
Sequencial INT(10), 
Matricula_funcionario VARCHAR(13), 
Sexo VARCHAR(1), 
Data_nascimento DATE, 
Parentesco VARCHAR(20), 
Idade INT(3),
PRIMARY KEY(Sequencial, Matricula_funcionario),
CONSTRAINT dependente_funcionario_fk FOREIGN KEY(Matricula_funcionario) references FUNCIONARIO(Matricula)
);

CREATE TABLE JORNADA_DE_TRABALHO ( 
Id VARCHAR(8), 
Hora_inicio TIME, 
Hora_final TIME, 
Trabalha_sabado BOOLEAN, 
descricao VARCHAR(60), 
Matricula_funcionario VARCHAR(13),
CONSTRAINT PRIMARY KEY(Id),
CONSTRAINT jorn_trab_funcionario_fk FOREIGN KEY(Matricula_funcionario) references FUNCIONARIO (Matricula)
);


CREATE TABLE CONTRACHEQUE ( 
Codigo VARCHAR(14), 
Horas_extras SMALLINT UNSIGNED, 
Salario_Base INT(9), 
Adicional_Salario INT(9), 
Dta DATE, 
Matricula_Funcionario VARCHAR(13),
Matricula_adm_financeiro VARCHAR(13), 
CONSTRAINT PRIMARY KEY(Codigo),
CONSTRAINT contracheque_funcionario_fk FOREIGN KEY( Matricula_Funcionario ) references FUNCIONARIO(Matricula),
CONSTRAINT contracheque_adm_finc_fk FOREIGN KEY(Matricula_adm_financeiro ) references ADM_FINANCEIRO(Matricula)
);


CREATE TABLE ADM_FINANCEIRO ( 
Matricula VARCHAR(13),
CONSTRAINT PRIMARY KEY(Matricula),
CONSTRAINT adm_financeiro_func_fk FOREIGN KEY(Matricula) references FUNCIONARIO(Matricula)
);


CREATE TABLE DESPESA_VIAGEM ( 
Cod VARCHAR(10), 
Valor INT, 
Id_tipo_despesa VARCHAR(8), 
Mat_adm_financeiro VARCHAR(13), 
Sequencial_chamado INT(11),  
Mat_tec_campo VARCHAR(13),
CONSTRAINT PRIMARY KEY(Cod),
CONSTRAINT despesa_tipo_despesa_fk FOREIGN KEY(Id_tipo_despesa) references TIPO_DESPESA(Id),
CONSTRAINT despesa_adm_financeiro_fk FOREIGN KEY(Mat_adm_financeiro) references ADM_FINANCEIRO(Matricula),
CONSTRAINT despesa_atende_fk FOREIGN KEY(Sequencial_chamado) references ATENDE(Sequencial_chamado),
CONSTRAINT despesa_atende_fk FOREIGN KEY(Mat_tec_campo) references ATENDE (Mat_tec_campo)
);

CREATE TABLE TIPO_DESPESA ( 
Id INT, 
Descricao VARCHAR(50),
PRIMARY KEY(Id)
);

CREATE TABLE KPI ( 
Sequencial, Matricula_tecnico, KPI_1, KPI_2, Dsc_KPI_1, Dsk_KPI_2 )
FK ( Matricula_tecnico ) referencia TECNICO ( Matricula )

CHAMADO ( Sequencial, Tipo, Status, Descricao, Prioridade, Mat_supervisor, Mat_tec_campo, Mat_tec_interno, Mat_atend, Num_ordem_servico )
FK ( Mat_supervisor ) referencia SUPERVISOR ( Matricula_supervisor )
FK ( Mat_tec_campo ) referencia TECNICO_CAMPO ( Matricula_tec_campo )
FK ( Mat_tec_interno ) referencia TECNICO_INTERNO ( Matricula_tec_interno )
FK ( Mat_atend ) referencia ATENDENTE_SOLUCIONADOR/DIRECIONADOR 
( Matricula_atend )
FK ( Num_ordem_servico ) referencia ORDEM_SERVICO ( Num )

ORDEM_SERVICO ( Num, Data_devida, Prazo_em_dias, Data_criacao, Status,  Cod_servico, sequencial_chamado )
FK (Cod_orcamento ) referencia ORCAMENTO ( Cod )
FK ( sequencial_chamado ) referencia CHAMADO ( Sequencial )

SERVICO ( Cod, Descricao, Valor, Status, Cod_Tipo_Servico )
FK ( Num_ordem_servico ) referencia ORDEM_SERVICO ( Num )
FK (  Cod_Tipo_Servico ) referencia TIPO_SERVICO ( Cod )

TIPO_SERVICO ( Cod, Descricao )

ORCAMENTO ( Cod, Data_emissao, Validade_num_dias, ultima_data, Descricao, Data_abertura, Num_Ordem_servico )
FK  (Num_Ordem_servico ) referencia ORDEM_SERVICO ( Num )

BASE_PROBLEMAS(KB) ( Id, Descricao, Procedimento, Solucao, Data_entrada, Tempo_necessario, obs, Id_relacionado, Cod_servico )
FK ( Id_relacionado ) referencia BASE_PROBLEMAS(KB) ( Id )
FK ( Cod_servico ) referencia SERVICO ( Cod )

BASEOU_EM ( Id_base_prob, Cod_servico)
FK ( Id_base_prob ) referencia BASE_PROBLEMAS(KB) ( Id )
FK ( Cod_servico ) referencia SERVICO ( Cod )

ATENDE ( Sequencial_chamado,  Mat_tec_campo)

ENVOLVEU ( Num_ordem_servico, Cod_equipamento )
FK ( Num_ordem_servico ) referencia ORDEM_SERVICO ( Num )
FK ( Cod_equipamento ) referencia EQUIPAMENTO ( Cod )

CLIE_ABRE ( Cod, Data, Cod_Cliente ) 
FK ( Cod_Cliente ) referencia CLIENTE ( Cod )

FATURA ( Cod, Num_parcelas, Valor_total, Status, Cod_cliente )
FK ( Cod_cliente ) referencia CLIENTE ( Cod )

PARCELA_PAGAMENTO ( Sequencial, Cod_fatura, Data_pagamento, Data_parcela, Juros, Valor_total, Valor_pagamento_parcelado, Cod_fatura )
FK ( Cod_fatura ) referencia FATURA ( Cod )

CONTRATO ( Cod_contrato, Cnpj_Unidade_suporte, Id_tipo_contrato, Data_inicio, Data_fim, Status, ID_Tipo_Contrato, Cnpj_Unidade_suporte)
FK( ID_Tipo_Contrato ) referencia  TIPO_CONTRATO ( ID )
FK( Cnpj_Unidade_suporte ) referencia  UNIDADE_SUPORTE ( Cnpj )