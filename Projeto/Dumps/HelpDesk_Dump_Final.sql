CREATE DATABASE  IF NOT EXISTS `assistech` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `assistech`;
-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: assistech
-- ------------------------------------------------------
-- Server version	5.6.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `adm_financeiro`
--

DROP TABLE IF EXISTS `adm_financeiro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adm_financeiro` (
  `Matricula` varchar(13) NOT NULL DEFAULT '',
  PRIMARY KEY (`Matricula`),
  CONSTRAINT `adm_financeiro_func_fk` FOREIGN KEY (`Matricula`) REFERENCES `funcionario` (`Matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adm_financeiro`
--

LOCK TABLES `adm_financeiro` WRITE;
/*!40000 ALTER TABLE `adm_financeiro` DISABLE KEYS */;
/*!40000 ALTER TABLE `adm_financeiro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `atendente_solucionador_direcionador`
--

DROP TABLE IF EXISTS `atendente_solucionador_direcionador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `atendente_solucionador_direcionador` (
  `matricula` varchar(13) NOT NULL DEFAULT '',
  PRIMARY KEY (`matricula`),
  CONSTRAINT `atendente_soluc_direc_funciionario_fk` FOREIGN KEY (`matricula`) REFERENCES `tecnico` (`Matricula_tecnico`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atendente_solucionador_direcionador`
--

LOCK TABLES `atendente_solucionador_direcionador` WRITE;
/*!40000 ALTER TABLE `atendente_solucionador_direcionador` DISABLE KEYS */;
/*!40000 ALTER TABLE `atendente_solucionador_direcionador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contracheque`
--

DROP TABLE IF EXISTS `contracheque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contracheque` (
  `Codigo` varchar(14) NOT NULL DEFAULT '',
  `Horas_extras` smallint(5) unsigned NOT NULL,
  `Salario_Base` int(9) NOT NULL,
  `Adicional_Salario` int(9) DEFAULT NULL,
  `Dta` date NOT NULL,
  `Matricula_Funcionario` varchar(13) NOT NULL,
  `Matricula_adm_financeiro` varchar(13) NOT NULL,
  PRIMARY KEY (`Codigo`),
  UNIQUE KEY `Matricula_Funcionario` (`Matricula_Funcionario`),
  UNIQUE KEY `Matricula_adm_financeiro` (`Matricula_adm_financeiro`),
  CONSTRAINT `contracheque_adm_finc_fk` FOREIGN KEY (`Matricula_adm_financeiro`) REFERENCES `adm_financeiro` (`Matricula`),
  CONSTRAINT `contracheque_funcionario_fk` FOREIGN KEY (`Matricula_Funcionario`) REFERENCES `funcionario` (`Matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contracheque`
--

LOCK TABLES `contracheque` WRITE;
/*!40000 ALTER TABLE `contracheque` DISABLE KEYS */;
/*!40000 ALTER TABLE `contracheque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependente`
--

DROP TABLE IF EXISTS `dependente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dependente` (
  `Sequencial` int(10) NOT NULL DEFAULT '0',
  `Matricula_funcionario` varchar(13) NOT NULL DEFAULT '',
  `Sexo` varchar(1) NOT NULL,
  `Data_nascimento` date NOT NULL,
  `Parentesco` varchar(20) NOT NULL,
  `Idade` int(3) NOT NULL,
  PRIMARY KEY (`Sequencial`,`Matricula_funcionario`),
  KEY `dependente_funcionario_fk` (`Matricula_funcionario`),
  CONSTRAINT `dependente_funcionario_fk` FOREIGN KEY (`Matricula_funcionario`) REFERENCES `funcionario` (`Matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependente`
--

LOCK TABLES `dependente` WRITE;
/*!40000 ALTER TABLE `dependente` DISABLE KEYS */;
/*!40000 ALTER TABLE `dependente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empresa` (
  `CNPJ` bigint(14) unsigned NOT NULL DEFAULT '0',
  `Razao_social` varchar(20) NOT NULL,
  `Endereco` varchar(30) NOT NULL,
  `Fone` varchar(15) NOT NULL,
  `estado` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CNPJ`),
  UNIQUE KEY `Razao_social` (`Razao_social`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funcionario` (
  `Matricula` varchar(13) NOT NULL DEFAULT '',
  `CPF` bigint(11) NOT NULL,
  `Matricula_supervisor` varchar(13) NOT NULL,
  `CNPJ` bigint(14) unsigned NOT NULL,
  `Login` varchar(15) NOT NULL,
  `Senha` varchar(15) NOT NULL,
  `Nome` varchar(30) DEFAULT NULL,
  `Cod_Contracheque` bigint(20) unsigned DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Carga_hora` int(2) DEFAULT NULL,
  PRIMARY KEY (`Matricula`),
  UNIQUE KEY `CPF` (`CPF`),
  UNIQUE KEY `CNPJ` (`CNPJ`),
  UNIQUE KEY `Login` (`Login`),
  UNIQUE KEY `Senha` (`Senha`),
  UNIQUE KEY `Cod_Contracheque` (`Cod_Contracheque`),
  UNIQUE KEY `Email` (`Email`),
  KEY `funcionario_supervisiona_fk` (`Matricula_supervisor`),
  CONSTRAINT `funcionario_supervisiona_fk` FOREIGN KEY (`Matricula_supervisor`) REFERENCES `supervisiona` (`Matricula_supervisor`),
  CONSTRAINT `funcionario_unid_sup_fk` FOREIGN KEY (`CNPJ`) REFERENCES `unidade_de_suporte` (`CNPJ`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jornada_de_trabalho`
--

DROP TABLE IF EXISTS `jornada_de_trabalho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jornada_de_trabalho` (
  `Id` varchar(8) NOT NULL DEFAULT '',
  `Hora_inicio` time NOT NULL,
  `Hora_final` time NOT NULL,
  `Trabalha_sabado` tinyint(1) NOT NULL,
  `descricao` varchar(60) DEFAULT NULL,
  `Matricula_funcionario` varchar(13) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Matricula_funcionario` (`Matricula_funcionario`),
  CONSTRAINT `jorn_trab_funcionario_fk` FOREIGN KEY (`Matricula_funcionario`) REFERENCES `funcionario` (`Matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jornada_de_trabalho`
--

LOCK TABLES `jornada_de_trabalho` WRITE;
/*!40000 ALTER TABLE `jornada_de_trabalho` DISABLE KEYS */;
/*!40000 ALTER TABLE `jornada_de_trabalho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supervisiona`
--

DROP TABLE IF EXISTS `supervisiona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supervisiona` (
  `Matricula_supervisor` varchar(13) NOT NULL DEFAULT '',
  `data_inicio` date NOT NULL,
  PRIMARY KEY (`Matricula_supervisor`),
  CONSTRAINT `supervisiona_ibfk_1` FOREIGN KEY (`Matricula_supervisor`) REFERENCES `supervisor` (`matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supervisiona`
--

LOCK TABLES `supervisiona` WRITE;
/*!40000 ALTER TABLE `supervisiona` DISABLE KEYS */;
/*!40000 ALTER TABLE `supervisiona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supervisor`
--

DROP TABLE IF EXISTS `supervisor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supervisor` (
  `matricula` varchar(13) NOT NULL DEFAULT '',
  PRIMARY KEY (`matricula`),
  CONSTRAINT `funcionario_supervisor_fk` FOREIGN KEY (`matricula`) REFERENCES `funcionario` (`Matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supervisor`
--

LOCK TABLES `supervisor` WRITE;
/*!40000 ALTER TABLE `supervisor` DISABLE KEYS */;
/*!40000 ALTER TABLE `supervisor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tecnico`
--

DROP TABLE IF EXISTS `tecnico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tecnico` (
  `Matricula_tecnico` varchar(13) NOT NULL DEFAULT '',
  PRIMARY KEY (`Matricula_tecnico`),
  CONSTRAINT `tecnico_funcionario_fk` FOREIGN KEY (`Matricula_tecnico`) REFERENCES `funcionario` (`Matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tecnico`
--

LOCK TABLES `tecnico` WRITE;
/*!40000 ALTER TABLE `tecnico` DISABLE KEYS */;
/*!40000 ALTER TABLE `tecnico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tecnico_campo`
--

DROP TABLE IF EXISTS `tecnico_campo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tecnico_campo` (
  `matricula` varchar(13) NOT NULL DEFAULT '',
  `tel_movel` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`matricula`),
  UNIQUE KEY `tel_movel` (`tel_movel`),
  CONSTRAINT `tecnico_campo_tecnico_fk` FOREIGN KEY (`matricula`) REFERENCES `tecnico` (`Matricula_tecnico`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tecnico_campo`
--

LOCK TABLES `tecnico_campo` WRITE;
/*!40000 ALTER TABLE `tecnico_campo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tecnico_campo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tecnico_interno`
--

DROP TABLE IF EXISTS `tecnico_interno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tecnico_interno` (
  `matricula` varchar(13) NOT NULL DEFAULT '',
  `Ramall` varchar(20) DEFAULT NULL,
  `Grau_tec` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`matricula`),
  CONSTRAINT `tec_interno_tecnico_fk` FOREIGN KEY (`matricula`) REFERENCES `tecnico` (`Matricula_tecnico`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tecnico_interno`
--

LOCK TABLES `tecnico_interno` WRITE;
/*!40000 ALTER TABLE `tecnico_interno` DISABLE KEYS */;
/*!40000 ALTER TABLE `tecnico_interno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidade_de_suporte`
--

DROP TABLE IF EXISTS `unidade_de_suporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unidade_de_suporte` (
  `CNPJ` bigint(14) unsigned NOT NULL DEFAULT '0',
  `Nro_funcionarios` int(11) DEFAULT NULL,
  `Nome` varchar(50) NOT NULL,
  `Matriz` varchar(20) NOT NULL,
  `endereco` varchar(50) NOT NULL,
  `FONE` varchar(16) NOT NULL,
  PRIMARY KEY (`CNPJ`),
  UNIQUE KEY `endereco` (`endereco`),
  CONSTRAINT `fk_unid_suporte_empresa` FOREIGN KEY (`CNPJ`) REFERENCES `empresa` (`CNPJ`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidade_de_suporte`
--

LOCK TABLES `unidade_de_suporte` WRITE;
/*!40000 ALTER TABLE `unidade_de_suporte` DISABLE KEYS */;
/*!40000 ALTER TABLE `unidade_de_suporte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'assistech'
--

--
-- Dumping routines for database 'assistech'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-09 21:44:06
