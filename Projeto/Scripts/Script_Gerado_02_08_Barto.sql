-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
-- -----------------------------------------------------
-- Schema assistech
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema assistech
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `assistech` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `assistech`.`empresa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`empresa` (
  `CNPJ` VARCHAR(18) NOT NULL,
  `RazaoSocial` VARCHAR(20) NULL DEFAULT NULL,
  `Endereço` VARCHAR(30) NULL DEFAULT NULL,
  `Fone` VARCHAR(15) NULL DEFAULT NULL,
  PRIMARY KEY (`CNPJ`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `assistech`.`unidade_de_suporte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`unidade_de_suporte` (
  `COD` VARCHAR(15) NOT NULL,
  `CNPJ_Empresa` VARCHAR(18) NOT NULL,
  `Nome` VARCHAR(15) NULL DEFAULT NULL,
  `Estado` VARCHAR(10) NOT NULL,
  `UF` VARCHAR(2) NOT NULL,
  `RazaoSocial` VARCHAR(20) NOT NULL,
  `Endereço` VARCHAR(30) NOT NULL,
  `Matriz` VARCHAR(20) NOT NULL,
  `Matricula_Funcionarios` VARCHAR(10) NULL,
  PRIMARY KEY (`COD`),
  INDEX `empresa_un_sup_fk_idx` (`CNPJ_Empresa` ASC),
  CONSTRAINT `empresa_un_sup_fk`
    FOREIGN KEY (`CNPJ_Empresa`)
    REFERENCES `assistech`.`empresa` (`CNPJ`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`unid_suporte_tem_funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`unid_suporte_tem_funcionario` (
  `Cod_Unid_Sup` VARCHAR(15) NOT NULL,
  `Mat_Funcionario` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`Cod_Unid_Sup`, `Mat_Funcionario`),
  INDEX `unid_suporte_multiv_fk_idx` (`Cod_Unid_Sup` ASC),
  CONSTRAINT `unid_suporte_multiv_fk`
    FOREIGN KEY (`Cod_Unid_Sup`)
    REFERENCES `assistech`.`unidade_de_suporte` (`COD`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

USE `assistech` ;


DROP TABLE jornada_trabalho;
-- -----------------------------------------------------
-- Table `assistech`.`jornada_trabalho`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`jornada_trabalho` (
  `ID` VARCHAR(8) NOT NULL DEFAULT '',
  `Horario_Inicio` INT(11) NULL DEFAULT NULL,
  `Horario_Fim` INT(11) NULL DEFAULT NULL,
  `Trabalha_Sabado` VARCHAR(5) NULL DEFAULT NULL,
  `Descricao` VARCHAR(7) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `assistech`.`funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`funcionario` (
  `Matricula` VARCHAR(10) NOT NULL DEFAULT '',
  `Cpf` INT(9) NULL DEFAULT NULL,
  `Nome` VARCHAR(15) NULL DEFAULT NULL,
  `Id_Jornada_Trabalho` VARCHAR(8) NULL,
  `Cod_Contracheque` VARCHAR(10) NULL DEFAULT NULL,
  `Sequencial_Dependente` VARCHAR(15) NULL DEFAULT NULL,
  `Login` VARCHAR(15) NULL DEFAULT NULL,
  `Senha` VARCHAR(8) NULL DEFAULT NULL,
  `Email` VARCHAR(12) NULL DEFAULT NULL,
  `Carga_hora` INT(10) NULL DEFAULT NULL,
  PRIMARY KEY (`Matricula`),
  UNIQUE INDEX `Matricula_UNIQUE` (`Matricula` ASC),
  INDEX `func_j_trabalho_fk_idx` (`Id_Jornada_Trabalho` ASC),
  CONSTRAINT `func_j_trabalho_fk`
    FOREIGN KEY (`Id_Jornada_Trabalho`)
    REFERENCES `assistech`.`jornada_trabalho` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `assistech`.`adm_financeiro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`adm_financeiro` (
  `Matricula` VARCHAR(10) NOT NULL DEFAULT '',
  `Cod_Desp_Viag` VARCHAR(10) NULL DEFAULT NULL,
  `Cod_Contracheque` VARCHAR(14) NULL DEFAULT NULL,
  PRIMARY KEY (`Matricula`),
  INDEX `adm_fincanceiro_contracheque` (`Cod_Contracheque` ASC),
  CONSTRAINT `adm_financeiro_funcionario_fk`
    FOREIGN KEY (`Matricula`)
    REFERENCES `assistech`.`funcionario` (`Matricula`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `assistech`.`almoxarifado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`almoxarifado` (
  `COD_ID` VARCHAR(14) NOT NULL,
  `Qtd_total` INT(11) NULL DEFAULT NULL,
  `Entrada_mes` DATE NULL DEFAULT NULL,
  `Saida_mes` DATE NULL DEFAULT NULL,
  `Descricao` VARCHAR(16) NULL DEFAULT NULL,
  PRIMARY KEY (`COD_ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `assistech`.`atendente_solucionador_direcionador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`atendente_solucionador_direcionador` (
  `Matricula_funcionario` VARCHAR(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`Matricula_funcionario`),
  CONSTRAINT `atendente_solucionador_direcionador_funcionario_fk`
    FOREIGN KEY (`Matricula_funcionario`)
    REFERENCES `assistech`.`funcionario` (`Matricula`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `assistech`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`categoria` (
  `Cod_categoria` VARCHAR(15) NOT NULL,
  `Descricao` VARCHAR(12) NULL DEFAULT NULL,
  PRIMARY KEY (`Cod_categoria`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `assistech`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`cliente` (
  `COD` VARCHAR(7) NOT NULL DEFAULT '',
  `Prioridade` ENUM('Alta','Media','Baixa') NULL DEFAULT NULL,
  `Endereco` VARCHAR(100) NULL DEFAULT NULL,
  `UF_Estado` VARCHAR(2) NULL DEFAULT NULL,
  PRIMARY KEY (`COD`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `assistech`.`cliente_contato`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`cliente_contato` (
  `Cod_Cliente` VARCHAR(7) NOT NULL DEFAULT '',
  `Fone` VARCHAR(12) NULL DEFAULT NULL,
  `Celular` VARCHAR(13) NULL DEFAULT NULL,
  `Email` VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (`Cod_Cliente`),
  CONSTRAINT `cliente_contato_cliente_fk`
    FOREIGN KEY (`Cod_Cliente`)
    REFERENCES `assistech`.`cliente` (`COD`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `assistech`.`cliente_fisico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`cliente_fisico` (
  `Cod_Cliente` VARCHAR(7) NOT NULL DEFAULT '',
  `CPF` VARCHAR(11) NOT NULL,
  `Nome` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`Cod_Cliente`),
  UNIQUE INDEX `CPF` (`CPF` ASC),
  CONSTRAINT `cliente_fisico_cliente_fk`
    FOREIGN KEY (`Cod_Cliente`)
    REFERENCES `assistech`.`cliente` (`COD`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `assistech`.`cliente_jur`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`cliente_jur` (
  `Cod_Cliente` VARCHAR(7) NOT NULL DEFAULT '',
  `CNPJ` VARCHAR(14) NOT NULL,
  `Razao_Social` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`Cod_Cliente`),
  UNIQUE INDEX `CNPJ` (`CNPJ` ASC),
  CONSTRAINT `cliente_jur_fk`
    FOREIGN KEY (`Cod_Cliente`)
    REFERENCES `assistech`.`cliente` (`COD`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `assistech`.`documento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`documento` (
  `ID_Documento` VARCHAR(10) NOT NULL,
  `Tipo` VARCHAR(30) NULL DEFAULT NULL,
  `Título` VARCHAR(50) NULL DEFAULT NULL,
  `Data_De_Criação` DATE NULL DEFAULT NULL,
  `Arquivo` VARCHAR(6) NULL DEFAULT NULL,
  `Versão` VARCHAR(4) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_Documento`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `assistech`.`tipo_contrato`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`tipo_contrato` (
  `ID` VARCHAR(5) NOT NULL,
  `Descrição` VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `assistech`.`contrato`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`contrato` (
  `COD_Contrato` VARCHAR(5) NOT NULL DEFAULT '',
  `DataInicio` DATE NULL DEFAULT NULL,
  `DataFim` DATE NULL DEFAULT NULL,
  `StatusContrato` ENUM('Aberto','Finalizado') NULL DEFAULT NULL,
  `ID_Documento` VARCHAR(10) NOT NULL,
  `ID_Tipo_Contrato` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`COD_Contrato`),
  INDEX `contrato_ID_Documento_fk` (`ID_Documento` ASC),
  INDEX `contrato_ID_Tipo_Contrato_fk` (`ID_Tipo_Contrato` ASC),
  UNIQUE INDEX `ID_Tipo_Contrato_UNIQUE` (`ID_Tipo_Contrato` ASC),
  CONSTRAINT `contrato_ID_Documento_fk`
    FOREIGN KEY (`ID_Documento`)
    REFERENCES `assistech`.`documento` (`ID_Documento`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `contrato_ID_Tipo_Contrato_fk`
    FOREIGN KEY (`ID_Tipo_Contrato`)
    REFERENCES `assistech`.`tipo_contrato` (`ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `assistech`.`equipamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`equipamento` (
  `Cod_Equipamento` VARCHAR(8) NOT NULL DEFAULT '',
  `Cod_Contrato` VARCHAR(5) NULL DEFAULT NULL,
  `Fabricante` VARCHAR(30) NOT NULL,
  `Modelo` VARCHAR(30) NOT NULL,
  `Status` ENUM('Bom','Regular','Ruim') NOT NULL,
  `Historico` VARCHAR(40) NULL DEFAULT NULL,
  `Descricao` VARCHAR(50) NOT NULL,
  `Setor` VARCHAR(20) NOT NULL,
  `DataEntrada` DATE NOT NULL,
  `Num_Serie` VARCHAR(11) NULL DEFAULT NULL,
  `IP_Rede` VARCHAR(12) NULL DEFAULT NULL,
  `Mask_Rede` VARCHAR(12) NULL DEFAULT NULL,
  PRIMARY KEY (`Cod_Equipamento`),
  INDEX `equipamento_contrato_fk_idx` (`Cod_Contrato` ASC),
  CONSTRAINT `equipamento_contrato_fk`
    FOREIGN KEY (`Cod_Contrato`)
    REFERENCES `assistech`.`contrato` (`COD_Contrato`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `assistech`.`computador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`computador` (
  `Cod_Equipamento` VARCHAR(8) NOT NULL DEFAULT '',
  `Sist_OP` VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (`Cod_Equipamento`),
  UNIQUE INDEX `Cod_Equipamento_UNIQUE` (`Cod_Equipamento` ASC),
  CONSTRAINT `computador_equipamento_fk`
    FOREIGN KEY (`Cod_Equipamento`)
    REFERENCES `assistech`.`equipamento` (`Cod_Equipamento`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `assistech`.`contracheque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`contracheque` (
  `Codigo` VARCHAR(14) NOT NULL DEFAULT '',
  `Matricula_Admin_Financeiro` VARCHAR(10) NOT NULL,
  `Mat_Funcionario` VARCHAR(10) NOT NULL,
  `Data_Contracheque` DATE NULL DEFAULT NULL,
  `Horas_extras` INT(10) NULL DEFAULT NULL,
  `Salario_Base` INT(9) NULL DEFAULT NULL,
  `Adicional_Salario` INT(9) NULL DEFAULT NULL,
  PRIMARY KEY (`Codigo`),
  INDEX `contracheque_admin_fincanceiro_fk_idx` (`Matricula_Admin_Financeiro` ASC),
  INDEX `contracheque_func_fk` (`Mat_Funcionario` ASC),
  CONSTRAINT `contracheque_admin_financeiro_fk`
    FOREIGN KEY (`Matricula_Admin_Financeiro`)
    REFERENCES `assistech`.`adm_financeiro` (`Matricula`),
  CONSTRAINT `contracheque_func_fk`
    FOREIGN KEY (`Mat_Funcionario`)
    REFERENCES `assistech`.`funcionario` (`Matricula`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `assistech`.`dependente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`dependente` (
  `Sequencial` VARCHAR(15) NOT NULL DEFAULT '0',
  `Matricula_Func` VARCHAR(10) NOT NULL DEFAULT '',
  `Sexo` VARCHAR(1) NULL DEFAULT NULL,
  `Data_Nascimento` DATE NULL DEFAULT NULL,
  `Parentesco` VARCHAR(8) NULL DEFAULT NULL,
  `Idade` INT(3) NULL DEFAULT NULL,
  PRIMARY KEY (`Matricula_Func`, `Sequencial`),
  CONSTRAINT `dependente_funcionario_fk`
    FOREIGN KEY (`Matricula_Func`)
    REFERENCES `assistech`.`funcionario` (`Matricula`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `assistech`.`despesa_viagem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`despesa_viagem` (
  `COD` VARCHAR(10) NOT NULL,
  `Mat_Admin_Fin` VARCHAR(10) NULL,
  `Valor` MEDIUMINT(9) NOT NULL,
  PRIMARY KEY (`COD`),
  INDEX `despesa_adm_fin_fk_idx` (`Mat_Admin_Fin` ASC),
  CONSTRAINT `despesa_adm_fin_fk`
    FOREIGN KEY (`Mat_Admin_Fin`)
    REFERENCES `assistech`.`adm_financeiro` (`Matricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `assistech`.`estante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`estante` (
  `COD` INT(11) NOT NULL,
  `COD_ID_Almoxarif` VARCHAR(10) NOT NULL,
  `Descric` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`COD`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `assistech`.`insumo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`insumo` (
  `Cod_Insumo` VARCHAR(15) NOT NULL,
  `Descri` VARCHAR(15) NULL DEFAULT NULL,
  PRIMARY KEY (`Cod_Insumo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `assistech`.`fornecedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`fornecedor` (
  `Cnpj_fornecedor` VARCHAR(10) NOT NULL,
  `Telefone` INT(11) NULL DEFAULT NULL,
  `Razao` VARCHAR(20) NULL DEFAULT NULL,
  `Endereco` VARCHAR(30) NULL DEFAULT NULL,
  `Email` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`Cnpj_fornecedor`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `assistech`.`fornece`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`fornece` (
  `Cnpj_fornecedor` VARCHAR(10) NOT NULL,
  `Cod_insumo` VARCHAR(10) NOT NULL,
  `Dta` VARCHAR(15) NOT NULL,
  `Valor_unit` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`Cnpj_fornecedor`, `Cod_insumo`),
  INDEX `fornece_fk` (`Cod_insumo` ASC),
  CONSTRAINT `fornece_fk`
    FOREIGN KEY (`Cod_insumo`)
    REFERENCES `assistech`.`insumo` (`Cod_Insumo`),
  CONSTRAINT `fornece_fornecedor_fk`
    FOREIGN KEY (`Cnpj_fornecedor`)
    REFERENCES `assistech`.`fornecedor` (`Cnpj_fornecedor`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `assistech`.`item_estoque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`item_estoque` (
  `Sequencial_insumo` VARCHAR(16) NOT NULL,
  `Cod_insumo` VARCHAR(15) NOT NULL,
  `Data_entrada` DATE NULL DEFAULT NULL,
  `Data_final` DATE NULL DEFAULT NULL,
  `Data_valida` DATE NULL DEFAULT NULL,
  `Preco_compra` VARCHAR(14) NULL DEFAULT NULL,
  `Qtd_minima` INT(11) NULL DEFAULT NULL,
  `Qtd_atual` INT(11) NULL DEFAULT NULL,
  `Cod_Estante` INT(11) NULL DEFAULT NULL,
  `Cod_Almoxarif` VARCHAR(14) NOT NULL,
  PRIMARY KEY (`Cod_insumo`, `Sequencial_insumo`),
  INDEX `item_estoq_estante_fk` (`Cod_Estante` ASC),
  INDEX `item_estoq_almoxarif_fk` (`Cod_Almoxarif` ASC),
  CONSTRAINT `insumo_fk`
    FOREIGN KEY (`Cod_insumo`)
    REFERENCES `assistech`.`insumo` (`Cod_Insumo`),
  CONSTRAINT `item_estoq_almoxarif_fk`
    FOREIGN KEY (`Cod_Almoxarif`)
    REFERENCES `assistech`.`almoxarifado` (`COD_ID`),
  CONSTRAINT `item_estoq_estante_fk`
    FOREIGN KEY (`Cod_Estante`)
    REFERENCES `assistech`.`estante` (`COD`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `assistech`.`tecnico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`tecnico` (
  `Matricula_funcionario` VARCHAR(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`Matricula_funcionario`),
  CONSTRAINT `funcionario_tecnico_fk`
    FOREIGN KEY (`Matricula_funcionario`)
    REFERENCES `assistech`.`funcionario` (`Matricula`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `assistech`.`kpi`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`kpi` (
  `Matricula_tecnico` VARCHAR(10) NOT NULL DEFAULT '',
  `Sequencial` INT(11) NOT NULL DEFAULT '0',
  `Kpi_1` VARCHAR(30) NULL DEFAULT NULL,
  `Kpi_2` VARCHAR(30) NULL DEFAULT NULL,
  `Dsc_kpi_1` VARCHAR(100) NULL DEFAULT NULL,
  `Dsc_kpi_2` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`Sequencial`, `Matricula_tecnico`),
  INDEX `kpi_tecnico_fk` (`Matricula_tecnico` ASC),
  CONSTRAINT `kpi_tecnico_fk`
    FOREIGN KEY (`Matricula_tecnico`)
    REFERENCES `assistech`.`tecnico` (`Matricula_funcionario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `assistech`.`orcamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`orcamento` (
  `CodOrcamento` VARCHAR(10) NOT NULL DEFAULT '',
  `DescOrcamento` VARCHAR(50) NULL DEFAULT NULL,
  `DtAbert_Orcto` DATE NULL DEFAULT NULL,
  `DtEmissao_Orcto` DATE NULL DEFAULT NULL,
  `ValidadeEmDias_Orcto` DATE NULL DEFAULT NULL,
  `UltimaData_Orcto` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`CodOrcamento`),
  UNIQUE INDEX `CodOrcamento_UNIQUE` (`CodOrcamento` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `assistech`.`ordem_de_servico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`ordem_de_servico` (
  `Num_OS` VARCHAR(10) NOT NULL DEFAULT '',
  `Cod_Orcamento` VARCHAR(10) NULL DEFAULT NULL,
  `Status_OS` ENUM('Aberto','Fechado') NULL DEFAULT NULL,
  `DataCricao_OS` DATE NULL DEFAULT NULL,
  `Prazo_EmDias_OS` SMALLINT(6) NULL DEFAULT NULL,
  `DtDevida` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`Num_OS`),
  UNIQUE INDEX `Cod_Orcamento_UNIQUE` (`Cod_Orcamento` ASC),
  CONSTRAINT `orcamento_ordem_fk`
    FOREIGN KEY (`Cod_Orcamento`)
    REFERENCES `assistech`.`orcamento` (`CodOrcamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `assistech`.`supervisao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`supervisao` (
  `Matricula_supervisor` VARCHAR(10) NOT NULL DEFAULT '',
  `Matricula_supervisionado` VARCHAR(10) NOT NULL DEFAULT '',
  `Data_inicio` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`Matricula_supervisor`, `Matricula_supervisionado`),
  UNIQUE INDEX `Matricula_supervisor_UNIQUE` (`Matricula_supervisor` ASC),
  INDEX `supervisao_supervisionado_fk` (`Matricula_supervisionado` ASC),
  CONSTRAINT `supervisao_supervisionado_fk`
    FOREIGN KEY (`Matricula_supervisionado`)
    REFERENCES `assistech`.`funcionario` (`Matricula`),
  CONSTRAINT `supervisao_supervisor_fk`
    FOREIGN KEY (`Matricula_supervisor`)
    REFERENCES `assistech`.`funcionario` (`Matricula`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `assistech`.`supervisor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`supervisor` (
  `Matricula_funcionario` VARCHAR(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`Matricula_funcionario`),
  CONSTRAINT `funcionario_supervisor_fk`
    FOREIGN KEY (`Matricula_funcionario`)
    REFERENCES `assistech`.`funcionario` (`Matricula`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `assistech`.`tecnico_campo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`tecnico_campo` (
  `Matricula_funcionario` VARCHAR(10) NOT NULL DEFAULT '',
  `Telefone_movel` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`Matricula_funcionario`),
  UNIQUE INDEX `Matricula_funcionario_UNIQUE` (`Matricula_funcionario` ASC),
  CONSTRAINT `funcionario_tecnico_campo_fk`
    FOREIGN KEY (`Matricula_funcionario`)
    REFERENCES `assistech`.`funcionario` (`Matricula`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `assistech`.`tecnico_interno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`tecnico_interno` (
  `Matricula_funcionario` VARCHAR(10) NOT NULL DEFAULT '',
  `Ramal` INT(11) NULL DEFAULT NULL,
  `Grau_tecnico` VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (`Matricula_funcionario`),
  CONSTRAINT `tecnico_interno_funcionario_fk`
    FOREIGN KEY (`Matricula_funcionario`)
    REFERENCES `assistech`.`funcionario` (`Matricula`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `assistech`.`tipo_despesa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assistech`.`tipo_despesa` (
  `ID` VARCHAR(7) NOT NULL,
  `Cod_Despesa` VARCHAR(10) NOT NULL,
  `dsc` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `tipo_despesa_desp_viag_fk` (`Cod_Despesa` ASC),
  CONSTRAINT `tipo_despesa_desp_viag_fk`
    FOREIGN KEY (`Cod_Despesa`)
    REFERENCES `assistech`.`despesa_viagem` (`COD`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
