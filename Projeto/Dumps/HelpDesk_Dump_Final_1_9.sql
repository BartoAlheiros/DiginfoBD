CREATE DATABASE  IF NOT EXISTS `assistech` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `assistech`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: assistech
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.25-MariaDB

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
  `Matricula` varchar(13) NOT NULL,
  PRIMARY KEY (`Matricula`),
  CONSTRAINT `adm_financeiro_func_fk` FOREIGN KEY (`Matricula`) REFERENCES `funcionario` (`Matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adm_financeiro`
--

LOCK TABLES `adm_financeiro` WRITE;
/*!40000 ALTER TABLE `adm_financeiro` DISABLE KEYS */;
INSERT INTO `adm_financeiro` VALUES ('3221219790136'),('3221219790137'),('3221219790138'),('3221219790139'),('3221219790140'),('3221219790141'),('3221219790142'),('3221219790143'),('3221219790144');
/*!40000 ALTER TABLE `adm_financeiro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `almoxarifado`
--

DROP TABLE IF EXISTS `almoxarifado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `almoxarifado` (
  `Id` int(11) NOT NULL,
  `Saida_mes` varchar(20) NOT NULL,
  `Descricao` varchar(255) NOT NULL,
  `Entrada_mes` varchar(20) NOT NULL,
  `Quantidade_total` int(11) NOT NULL,
  `Cod_Insumo` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almoxarifado`
--

LOCK TABLES `almoxarifado` WRITE;
/*!40000 ALTER TABLE `almoxarifado` DISABLE KEYS */;
INSERT INTO `almoxarifado` VALUES (141,'2011-01-06','Informática','2011-04-14',123,65412),(277,'2011-01-12','Eletrônico','2011-04-20',333,21639),(336,'2011-01-11','Eletrônico','2011-04-19',567,55610),(341,'2011-01-13','Eletrônico','2011-04-21',765,18795),(582,'2011-01-10','Carcaças Notebook','2011-04-18',532,34094),(634,'2011-01-09','Eletrônico','2011-04-17',234,31916),(704,'2011-01-07','Informática','2011-04-15',123,45737),(780,'2011-01-08','Eletrônico','2011-04-16',653,70039),(955,'2011-01-03','Eletrônico','2011-04-11',135,67333),(983,'2011-01-04','Eletrônico','2011-04-12',432,47092),(987,'2011-01-05','Eletrônico','2011-04-13',443,13720);
/*!40000 ALTER TABLE `almoxarifado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `atende`
--

DROP TABLE IF EXISTS `atende`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `atende` (
  `Sequencial_chamado` int(11) NOT NULL,
  `Mat_tec_campo` varchar(13) NOT NULL,
  PRIMARY KEY (`Sequencial_chamado`,`Mat_tec_campo`),
  KEY `atemnde_tec_campo_fk` (`Mat_tec_campo`),
  CONSTRAINT `atemnde_tec_campo_fk` FOREIGN KEY (`Mat_tec_campo`) REFERENCES `tecnico_campo` (`matricula`),
  CONSTRAINT `atende_chamado_fk` FOREIGN KEY (`Sequencial_chamado`) REFERENCES `chamado` (`Sequencial`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atende`
--

LOCK TABLES `atende` WRITE;
/*!40000 ALTER TABLE `atende` DISABLE KEYS */;
INSERT INTO `atende` VALUES (127003,'3221219790182'),(142530,'3221219790179'),(285228,'3221219790187'),(326138,'3221219790180'),(375295,'3221219790186'),(414136,'3221219790162'),(449291,'3221219790179'),(455427,'3221219790188'),(469529,'3221219790184'),(474898,'3221219790163'),(721605,'3221219790189'),(831513,'3221219790164'),(857233,'3221219790185'),(888642,'3221219790181'),(993477,'3221219790183');
/*!40000 ALTER TABLE `atende` ENABLE KEYS */;
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
INSERT INTO `atendente_solucionador_direcionador` VALUES ('3221219790118'),('3221219790119'),('3221219790120'),('3221219790121'),('3221219790122'),('3221219790123'),('3221219790124'),('3221219790125'),('3221219790126'),('3221219790127'),('3221219790128'),('3221219790129'),('3221219790130'),('3221219790131'),('3221219790132'),('3221219790133'),('3221219790134'),('3221219790135'),('3221219790136'),('3221219790137'),('3221219790138'),('3221219790139'),('3221219790140'),('3221219790141'),('3221219790142'),('3221219790143'),('3221219790144'),('3221219790145'),('3221219790146'),('3221219790147'),('3221219790148'),('3221219790149'),('3221219790150'),('3221219790151'),('3221219790152');
/*!40000 ALTER TABLE `atendente_solucionador_direcionador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `base_problemas_kb`
--

DROP TABLE IF EXISTS `base_problemas_kb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `base_problemas_kb` (
  `Id` int(11) NOT NULL,
  `Descricao` varchar(255) NOT NULL,
  `Procedimento` varchar(1023) NOT NULL,
  `Solucao` varchar(1023) NOT NULL,
  `Data_entrada` date NOT NULL,
  `Tempo_necessario` int(11) NOT NULL,
  `obs` varchar(1023) NOT NULL,
  `Id_relacionado` int(11) NOT NULL,
  `Cod_servico` int(11) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `base_probs_relacionado_com_fk` (`Id_relacionado`),
  KEY `base_probs_servico_fk` (`Cod_servico`),
  CONSTRAINT `base_probs_relacionado_com_fk` FOREIGN KEY (`Id_relacionado`) REFERENCES `base_problemas_kb` (`Id`),
  CONSTRAINT `base_probs_servico_fk` FOREIGN KEY (`Cod_servico`) REFERENCES `servico` (`Cod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_problemas_kb`
--

LOCK TABLES `base_problemas_kb` WRITE;
/*!40000 ALTER TABLE `base_problemas_kb` DISABLE KEYS */;
INSERT INTO `base_problemas_kb` VALUES (139060,'Tela escura','Verificou-se em outro monitor','Foi efetuada a troca da tela/monitor','2012-11-10',105,'-',663349,267080),(295099,'Tela escura','Verificou-se em outro monitor','Foi efetuada a troca da tela/monitor','2012-11-11',105,'-',561412,613590),(337771,'Tela escura','Verificou-se em outro monitor. Verificou-se a placa de vídeo.','Foi efetuada a troca da placa de vídeo.','2012-11-05',7,'-',139060,855547),(551337,'Tela escura','Verificou-se em outro monitor','Foi efetuada a troca da tela/monitor','2012-11-09',7,'-',551337,983704),(561412,'Tela escura. Sem resposta de som.','Verificou-se em outro monitor. Sem resposta.','Efetuou-se a troca da placa mãe.','2012-11-07',1,'-',561412,215386),(576879,'Teclado sem funcionalidade do lado esquerdo.','Verificou-se outro teclado.','Foi efetuada a troca do teclado.','2012-11-06',1,'-',576879,556703),(663349,'Não liga','Verificou-se o circuito da fonte de alimentação','Foi efetuada a troca dos diodos e do transistor regulador de tensão','2012-11-08',13,'-',663349,341250),(707902,'Tela escura','Verificou-se em outro monitor','Foi efetuada a troca da tela/monitor','2012-11-03',1,'-',707902,204239),(821136,'Tela escura','Verificou-se em outro monitor','Foi efetuada a troca da tela/monitor','2012-11-12',1,'-',821136,605518),(877866,'Lentidão','Verificou-se a pasta térmica do processador e quantidade de memória no comptador.','Foi efetuada a troca da pasta térmica e aumento da memória RAM de 2GB para 4GB','2012-11-04',13,'-',877866,461863);
/*!40000 ALTER TABLE `base_problemas_kb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `baseou_em`
--

DROP TABLE IF EXISTS `baseou_em`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `baseou_em` (
  `Id_base_prob` int(11) NOT NULL,
  `Cod_servico` int(11) NOT NULL,
  PRIMARY KEY (`Id_base_prob`,`Cod_servico`),
  KEY `baseou_em_servico_fk` (`Cod_servico`),
  CONSTRAINT `baseou_em_base_probs_fk` FOREIGN KEY (`Id_base_prob`) REFERENCES `base_problemas_kb` (`Id`),
  CONSTRAINT `baseou_em_servico_fk` FOREIGN KEY (`Cod_servico`) REFERENCES `servico` (`Cod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baseou_em`
--

LOCK TABLES `baseou_em` WRITE;
/*!40000 ALTER TABLE `baseou_em` DISABLE KEYS */;
INSERT INTO `baseou_em` VALUES (139060,267080),(295099,613590),(337771,855547),(345877,613677),(551337,983704),(561412,215386),(576879,556703),(626060,193624),(663349,341250),(707902,204239),(811100,904566),(811853,459121),(821136,605518),(877866,461863);
/*!40000 ALTER TABLE `baseou_em` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `Cod` varchar(20) NOT NULL,
  `Descricao` varchar(80) NOT NULL,
  PRIMARY KEY (`Cod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES ('1','Mecânicos Impressora'),('2','Peças Computador PC'),('3','Peças Notebook');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chamado`
--

DROP TABLE IF EXISTS `chamado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chamado` (
  `Sequencial` int(11) NOT NULL,
  `Tipo` varchar(30) DEFAULT NULL,
  `Status_` varchar(20) DEFAULT NULL,
  `Descricao` varchar(100) DEFAULT NULL,
  `Prioridade` varchar(20) DEFAULT NULL,
  `Mat_supervisor` varchar(13) DEFAULT NULL,
  `Mat_tec_campo` varchar(13) DEFAULT NULL,
  `Mat_tec_interno` varchar(13) DEFAULT NULL,
  `Mat_atend` varchar(13) DEFAULT NULL,
  `Num_ordem_servico` int(11) DEFAULT NULL,
  PRIMARY KEY (`Sequencial`),
  KEY `chamado_supervisor_fk` (`Mat_supervisor`),
  KEY `chamado_tec_campo_fk` (`Mat_tec_campo`),
  KEY `chamado_tec_interno_fk` (`Mat_tec_interno`),
  KEY `chamado_atend_sol_direc_fk` (`Mat_atend`),
  KEY `chamado_ordem_servico_fk` (`Num_ordem_servico`),
  CONSTRAINT `chamado_atend_sol_direc_fk` FOREIGN KEY (`Mat_atend`) REFERENCES `atendente_solucionador_direcionador` (`matricula`),
  CONSTRAINT `chamado_ordem_servico_fk` FOREIGN KEY (`Num_ordem_servico`) REFERENCES `ordem_servico` (`Num`),
  CONSTRAINT `chamado_supervisor_fk` FOREIGN KEY (`Mat_supervisor`) REFERENCES `supervisor` (`matricula`),
  CONSTRAINT `chamado_tec_campo_fk` FOREIGN KEY (`Mat_tec_campo`) REFERENCES `tecnico_campo` (`matricula`),
  CONSTRAINT `chamado_tec_interno_fk` FOREIGN KEY (`Mat_tec_interno`) REFERENCES `tecnico_interno` (`matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chamado`
--

LOCK TABLES `chamado` WRITE;
/*!40000 ALTER TABLE `chamado` DISABLE KEYS */;
INSERT INTO `chamado` VALUES (127003,'Interno','Concluido','Sem descricao','Sim','3221219790121','3992769196736','4037469036387','2246705981087',538507),(142530,'Interno','Em processo','Sem descricao','Sim','3221219790118','8818508758096','4974678704490','6758517699760',628743),(285228,'Externo','Concluido','Sem descricao','Não','3221219790126','2110524116817','6857090937968','5968756780532',702449),(326138,'Externo','Concluido','Sem descricao','Sim','3221219790119','6700807866985','9607524394231','6977418034599',896492),(375295,'Interno','Em processo','Sem descricao','Sim','3221219790125','6236152121781','1013901989839','1539784638533',901221),(455427,'Externo','Em processo','Sem descricao','Sim','3221219790127','4603930496974','7897223023730','6985312133607',743273),(469529,'Interno','Em processo','Sem descricao','Sim','3221219790123','8667373023668','5720417742894','2329300698267',579148),(857233,'Interno','Em processo','Sem descricao','Não','3221219790124','5103288720152','4101975791421','7006151265588',977699),(888642,'Interno','Em processo','Sem descricao','Não','3221219790120','1186005853714','7128959997536','6335131046868',109006),(993477,'Interno','Na espera','Sem descricao','Não','3221219790122','9831778124583','7067254094982','6248141194587',293137);
/*!40000 ALTER TABLE `chamado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clie_abre`
--

DROP TABLE IF EXISTS `clie_abre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clie_abre` (
  `Cod` bigint(12) NOT NULL,
  `Dta_abertura` date NOT NULL,
  `Cod_Cliente` int(11) NOT NULL,
  PRIMARY KEY (`Cod`),
  KEY `clie_abre_cliente_fk` (`Cod_Cliente`),
  CONSTRAINT `clie_abre_cliente_fk` FOREIGN KEY (`Cod_Cliente`) REFERENCES `cliente` (`Cod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clie_abre`
--

LOCK TABLES `clie_abre` WRITE;
/*!40000 ALTER TABLE `clie_abre` DISABLE KEYS */;
/*!40000 ALTER TABLE `clie_abre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `Cod` int(11) NOT NULL,
  `Prioridade` varchar(20) NOT NULL,
  `Endereco` varchar(200) NOT NULL,
  `Estado` varchar(50) NOT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Fone` varchar(30) NOT NULL,
  PRIMARY KEY (`Cod`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (122211,'Baixa','Rua Alvares Marques Sinesiando, 75, Recife.','PE','nonummy.ipsum.non@Morbiaccumsan.com','81324556612'),(143693,'Media','9271 Donec Street','PC','sagittis.Duis@eleifendvitaeerat.net','81324556624'),(219478,'Baixa','8048 Dui. Rd.','BL','Nunc.lectus@sed.edu','81324556623'),(236843,'Media','Ap #813-6435 Pellentesque Rd.','UR','Morbi.vehicula.Pellentesque@miDuisrisus.co.uk','81324556626'),(237669,'Baixa','469-6007 Non Ave','AM','elit.fermentum@molestiedapibusligula.ca','81324556635'),(293827,'Baixa','P.O. Box 714, 4676 Magna. Avenue','TK','Duis@ultriciesdignissim.net','81324556631'),(301898,'Baixa','Ap #264-2826 Montes, Av.','BH','at.velit.Pellentesque@Aeneansedpede.com','81324556630'),(323110,'Media','279-395 Ornare Avenue','PA','amet@eget.co.uk','81324556636'),(333493,'Baixa','419-1184 Justo. Rd.','PE','penatibus.et.magnis@vestibulum.edu','81324556627'),(374702,'Baixa','767-7067 Et Street','AL','pretium@sitametconsectetuer.net','81324556618'),(419036,'Baixa','545-5308 Aliquam Rd.','BH','molestie.tellus.Aenean@etmagnisdis.com','81324556615'),(421804,'Media','P.O. Box 228, 5687 Fermentum Street','CA','dictum@ettristiquepellentesque.co.uk','81324556619'),(444272,'Baixa','P.O. Box 683, 1827 Magna. Street','SP','egestas.Duis.ac@nonvestibulumnec.ca','81324556614'),(448803,'Baixa','P.O. Box 774, 5509 Felis. Street','AC','scelerisque.sed.sapien@arcu.com','81324556625'),(468928,'Alta','Ap #108-1456 Nec, Street','RU','sem.Nulla@facilisislorem.co.uk','81324556617'),(494738,'Media','P.O. Box 852, 3735 Libero Avenue','TK','Aenean.euismod@estconguea.com','81324556616'),(546312,'Media','1128 Eget, Rd.','PA','Mauris.ut@nonjustoProin.com','81324556621'),(570551,'Baixa','Ap #478-5357 Venenatis Rd.','MG','nisi.a@aaliquet.ca','81324556637'),(596328,'Baixa','2813 A, Ave','CA','lacinia.orci@euelit.org','81324556634'),(654214,'Baixa','P.O. Box 489, 5083 Mollis Rd.','MS','Phasellus.at@Aliquamornare.co.uk','81324556628'),(690810,'Baixa','Ap #428-6491 Curabitur Rd.','MG','at.pede.Cras@metus.co.uk','81324556622'),(754431,'Alta','9327 Sed, Road, Manaus.','AM','lobortis@interdumenim.ca','81324556620'),(768352,'Media','Ap #429-4302 Tempus Ave','PC','ut.ipsum.ac@vel.org','81324556639'),(780419,'Media','7163 Orci, St.','SP','tristique.neque.venenatis@euaugueporttitor.edu','81324556629'),(829521,'Baixa','P.O. Box 862, 6019 Proin Av.','BL','arcu.imperdiet.ullamcorper@pulvinararcu.net','81324556638'),(921567,'Media','Ap #506-9024 Semper St.','MS','tempus@purusmauris.net','81324556613'),(959091,'Alta','4081 Elit. Av.','PE','et@magna.edu','81324556640');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente_fis`
--

DROP TABLE IF EXISTS `cliente_fis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente_fis` (
  `Cod_cliente` int(11) NOT NULL,
  `Cpf` varchar(11) NOT NULL,
  `Nome` varchar(255) NOT NULL,
  PRIMARY KEY (`Cod_cliente`),
  CONSTRAINT `cliente_fis_cliente_fk` FOREIGN KEY (`Cod_cliente`) REFERENCES `cliente` (`Cod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_fis`
--

LOCK TABLES `cliente_fis` WRITE;
/*!40000 ALTER TABLE `cliente_fis` DISABLE KEYS */;
INSERT INTO `cliente_fis` VALUES (141076,'19259570240','Quinlan Harris'),(145281,'92758354968','Brock Kaufman'),(216951,'31347097759','Maxwell Whitfield'),(220323,'88474497403','Brennan Buck'),(299644,'56354010375','Amos Park'),(300460,'91590170883','Callum Sutton'),(467429,'37373657682','Melvin Wade'),(625728,'61284091132','Paul Golden'),(631420,'82801587954','Tiger Stuart'),(782268,'90811376199','Marshall Hammond'),(834677,'37509548198','Brady Stokes'),(898542,'71431942027','Odysseus Oconnor'),(925755,'85360179529','Clinton Chang'),(934833,'66114713274','Carson Alvarado'),(978804,'76668539554','Felix Mack');
/*!40000 ALTER TABLE `cliente_fis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente_jur`
--

DROP TABLE IF EXISTS `cliente_jur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente_jur` (
  `Cod_cliente` int(11) NOT NULL,
  `Cnpj` bigint(14) NOT NULL,
  `Razao_social` varchar(100) NOT NULL,
  PRIMARY KEY (`Cod_cliente`),
  CONSTRAINT `cliente_jur_cliente_fk` FOREIGN KEY (`Cod_cliente`) REFERENCES `cliente` (`Cod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_jur`
--

LOCK TABLES `cliente_jur` WRITE;
/*!40000 ALTER TABLE `cliente_jur` DISABLE KEYS */;
INSERT INTO `cliente_jur` VALUES (122211,14195624706335,'Enim Suspendisse Aliquet Corp.'),(374702,48321955981664,'Lectus A Sollicitudin Industries'),(419036,40437113121151,'Sed Sapien Nunc Consulting'),(421804,86837971587665,'Nisi A Odio Industries'),(444272,95936731831170,'Duis Volutpat Foundation'),(468928,18111112839542,'Elementum Ltd'),(494738,55055838939733,'A Purus Inc.'),(546312,27047773194499,'Sed Nec Metus Corporation'),(754431,13129212181083,'A Arcu Sed Limited'),(921567,76869739387184,'Ipsum Suspendisse Non Corp.');
/*!40000 ALTER TABLE `cliente_jur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `computador`
--

DROP TABLE IF EXISTS `computador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `computador` (
  `Cod_equipamento` varchar(15) NOT NULL,
  `Sistema_operacional` varchar(10) NOT NULL,
  `Endereco_IP` varchar(15) NOT NULL,
  PRIMARY KEY (`Cod_equipamento`),
  CONSTRAINT `computador_equipamento_fk` FOREIGN KEY (`Cod_equipamento`) REFERENCES `equipamento` (`Cod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `computador`
--

LOCK TABLES `computador` WRITE;
/*!40000 ALTER TABLE `computador` DISABLE KEYS */;
INSERT INTO `computador` VALUES ('13508','Windows 7 ','192.168.100.01'),('18398','Linux Ubun','192.168.100.05'),('19703','Windows 10','192.168.100.02'),('29476','Windows 7 ','192.168.100.03'),('34993','Cent OS','192.168.100.00'),('36512','Windows 10','192.168.100.08'),('41246','Windows 7 ','192.168.100.07'),('53435','Cent OS','192.168.100.09'),('55377','Windows 7 ','192.168.100.06'),('79969','Cent OS','192.168.100.04');
/*!40000 ALTER TABLE `computador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contracheque`
--

DROP TABLE IF EXISTS `contracheque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contracheque` (
  `Codigo` varchar(14) NOT NULL DEFAULT '',
  `Horas_extras` time NOT NULL,
  `Salario_Base` decimal(6,2) NOT NULL,
  `Adicional_Salario` decimal(6,2) NOT NULL DEFAULT '0.00',
  `Data_` date NOT NULL,
  `Matricula_Funcionario` varchar(13) NOT NULL,
  `Matricula_adm_financeiro` varchar(13) NOT NULL,
  PRIMARY KEY (`Codigo`),
  KEY `contracheque_func_fk_idx` (`Matricula_Funcionario`),
  KEY `contracheque_adm_financ_fk_idx` (`Matricula_adm_financeiro`),
  CONSTRAINT `contracheque_adm_financ_fk` FOREIGN KEY (`Matricula_adm_financeiro`) REFERENCES `adm_financeiro` (`Matricula`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `contracheque_func_fk` FOREIGN KEY (`Matricula_Funcionario`) REFERENCES `funcionario` (`Matricula`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contracheque`
--

LOCK TABLES `contracheque` WRITE;
/*!40000 ALTER TABLE `contracheque` DISABLE KEYS */;
INSERT INTO `contracheque` VALUES ('','00:00:00',0.00,0.00,'0000-00-00','',''),('105496','00:00:00',0.00,0.00,'2012-11-13','1','-'),('105496;Tela es','00:00:00',0.00,0.00,'0000-00-00','',''),('112181','00:00:00',0.00,0.00,'2012-11-27','1','-'),('112181;Tela es','00:00:00',0.00,0.00,'0000-00-00','',''),('139060','00:00:00',0.00,0.00,'2012-11-10','105','-'),('139060;Tela es','00:00:00',0.00,0.00,'0000-00-00','',''),('168377','00:00:00',0.00,0.00,'2012-11-27','7','-'),('168377;Tela es','00:00:00',0.00,0.00,'0000-00-00','',''),('188043','00:00:00',0.00,0.00,'2012-11-14','4.35','-'),('188043;Tela es','00:00:00',0.00,0.00,'0000-00-00','',''),('198633','00:00:00',0.00,0.00,'2012-11-13','7','-'),('198633;Tela es','00:00:00',0.00,0.00,'0000-00-00','',''),('209576','00:00:00',0.00,0.00,'2012-11-23','7','-'),('209576;Tela es','00:00:00',0.00,0.00,'0000-00-00','',''),('217310','00:00:00',0.00,0.00,'2012-11-24','4.35','-'),('217310;Tela es','00:00:00',0.00,0.00,'0000-00-00','',''),('238523','00:00:00',0.00,0.00,'2012-11-26','52','-'),('238523;Tela es','00:00:00',0.00,0.00,'0000-00-00','',''),('253155','00:00:00',0.00,0.00,'2012-03-12','10','-'),('253155;Tela es','00:00:00',0.00,0.00,'0000-00-00','',''),('295099','00:00:00',0.00,0.00,'2012-11-11','105','-'),('295099;Tela es','00:00:00',0.00,0.00,'0000-00-00','',''),('318914','00:00:00',0.00,0.00,'2012-11-25','1','-'),('318914;Tela es','00:00:00',0.00,0.00,'0000-00-00','',''),('328215','00:00:00',0.00,0.00,'2012-11-28','4.35','-'),('328215;Tela es','00:00:00',0.00,0.00,'0000-00-00','',''),('337113','00:00:00',0.00,0.00,'2012-11-14','4.35','-'),('337113;Tela es','00:00:00',0.00,0.00,'0000-00-00','',''),('337771','00:00:00',0.00,0.00,'2012-11-05','7','-'),('337771;Tela es','00:00:00',0.00,0.00,'0000-00-00','',''),('345877','00:00:00',0.00,0.00,'2012-11-16','10','-'),('345877;Tela es','00:00:00',0.00,0.00,'0000-00-00','',''),('380272','00:00:00',0.00,0.00,'2012-11-12','48','-'),('380272;Tela es','00:00:00',0.00,0.00,'0000-00-00','',''),('399518','00:00:00',0.00,0.00,'2012-11-22','4.35','-'),('399518;Tela es','00:00:00',0.00,0.00,'0000-00-00','',''),('411660','00:00:00',0.00,0.00,'2012-11-26','48','-'),('411660;Tela es','00:00:00',0.00,0.00,'0000-00-00','',''),('417500','00:00:00',0.00,0.00,'2012-11-17','1','-'),('417500;Tela es','00:00:00',0.00,0.00,'0000-00-00','',''),('453367','00:00:00',0.00,0.00,'2012-11-24','48','-'),('453367;Tela es','00:00:00',0.00,0.00,'0000-00-00','',''),('466384','00:00:00',0.00,0.00,'2012-11-12','10','-'),('466384;Tela es','00:00:00',0.00,0.00,'0000-00-00','',''),('488857','00:00:00',0.00,0.00,'2012-11-15','1','-'),('488857;Tela es','00:00:00',0.00,0.00,'0000-00-00','',''),('498421','00:00:00',0.00,0.00,'2012-11-28','105','-'),('498421;Tela es','00:00:00',0.00,0.00,'0000-00-00','',''),('509620','00:00:00',0.00,0.00,'2012-11-15','10','-'),('509620;Tela es','00:00:00',0.00,0.00,'0000-00-00','',''),('522679','00:00:00',0.00,0.00,'2012-11-24','13.00','-'),('522679;Tela es','00:00:00',0.00,0.00,'0000-00-00','',''),('524404','00:00:00',0.00,0.00,'2012-11-28','105','-'),('524404;Tela es','00:00:00',0.00,0.00,'0000-00-00','',''),('52984762741196','01:00:00',2500.00,300.00,'2014-04-19','3221219790118','3221219790139'),('52984762741198','01:00:00',2500.00,300.02,'2001-05-03','3221219790120','3221219790139'),('52984762741199','01:00:00',2500.00,300.03,'2010-12-15','3221219790121','3221219790140'),('52984762741200','01:00:00',2500.00,300.04,'2012-07-15','3221219790122','3221219790139'),('52984762741201','01:00:00',2500.00,300.05,'2015-03-12','3221219790123','3221219790139'),('52984762741202','01:00:00',2500.00,300.06,'2001-05-03','3221219790124','3221219790139'),('52984762741203','01:00:00',2500.00,300.07,'2014-04-10','3221219790125','3221219790139'),('52984762741204','01:00:00',2500.00,300.08,'2001-05-03','3221219790126','3221219790139'),('52984762741205','01:00:00',2500.00,300.09,'2012-07-15','3221219790127','3221219790139'),('52984762741208','01:00:00',2500.00,300.12,'2014-04-19','3221219790130','3221219790139'),('52984762741209','03:30:00',1200.00,450.13,'2009-09-12','3221219790131','3221219790139'),('52984762741210','01:00:00',2500.00,300.14,'2014-04-10','3221219790132','3221219790139'),('52984762741211','12:00:00',2500.00,900.15,'2010-12-15','3221219790133','3221219790139'),('52984762741212','01:00:00',2500.16,300.16,'2009-09-12','3221219790134','3221219790139'),('52984762741213','02:00:00',1500.17,400.17,'2014-04-19','3221219790135','3221219790139'),('52984762741214','01:00:00',1500.18,300.18,'2009-09-12','3221219790136','3221219790139'),('52984762741215','01:00:00',2500.19,300.19,'2001-05-03','3221219790137','3221219790139'),('52984762741216','05:00:00',2500.20,300.20,'2014-04-10','3221219790138','3221219790139'),('52984762741217','01:00:00',2500.21,300.21,'2014-04-10','3221219790139','3221219790139'),('52984762741218','01:00:00',1300.00,120.00,'2001-05-03','3221219790140','3221219790139'),('52984762741219','07:00:00',1300.01,500.01,'2014-04-10','3221219790141','3221219790139'),('52984762741220','02:00:00',1300.02,400.02,'2014-04-19','3221219790142','3221219790139'),('551337','00:00:00',0.00,0.00,'2012-11-09','7','-'),('551337;Tela es','00:00:00',0.00,0.00,'0000-00-00','',''),('559978','00:00:00',0.00,0.00,'2012-11-23','13.00','-'),('559978;Tela es','00:00:00',0.00,0.00,'0000-00-00','',''),('561412','00:00:00',0.00,0.00,'2012-11-07','1','-'),('561412;Tela es','00:00:00',0.00,0.00,'0000-00-00','',''),('567703','00:00:00',0.00,0.00,'2012-11-29','1','-'),('567703;Tela es','00:00:00',0.00,0.00,'0000-00-00','',''),('574564','00:00:00',0.00,0.00,'2012-11-27','1','-'),('574564;Tela es','00:00:00',0.00,0.00,'0000-00-00','',''),('575864','00:00:00',0.00,0.00,'2012-11-16','52','-'),('575864;Tela es','00:00:00',0.00,0.00,'0000-00-00','',''),('576879','00:00:00',0.00,0.00,'2012-11-06','1','-'),('576879;Tela es','00:00:00',0.00,0.00,'0000-00-00','',''),('584483','00:00:00',0.00,0.00,'2012-11-13','105','-'),('584483;Tela es','00:00:00',0.00,0.00,'0000-00-00','',''),('591905','00:00:00',0.00,0.00,'2012-11-22','4.35','-'),('591905;Tela es','00:00:00',0.00,0.00,'0000-00-00','',''),('615362','00:00:00',0.00,0.00,'2012-11-22','10','-'),('615362;Tela es','00:00:00',0.00,0.00,'0000-00-00','',''),('626060','00:00:00',0.00,0.00,'2012-11-15','7','-'),('626060;Tela es','00:00:00',0.00,0.00,'0000-00-00','',''),('643124','00:00:00',0.00,0.00,'2012-11-13','52','-'),('643124;Tela es','00:00:00',0.00,0.00,'0000-00-00','',''),('646626','00:00:00',0.00,0.00,'2012-11-18','13.00','-'),('646626;Tela es','00:00:00',0.00,0.00,'0000-00-00','',''),('656592','00:00:00',0.00,0.00,'2012-11-18','7','-'),('656592;Tela es','00:00:00',0.00,0.00,'0000-00-00','',''),('659951','00:00:00',0.00,0.00,'2012-11-26','1','-'),('659951;Tela es','00:00:00',0.00,0.00,'0000-00-00','',''),('663349','00:00:00',0.00,0.00,'2012-11-08','13.00','-'),('663349;Tela es','00:00:00',0.00,0.00,'0000-00-00','',''),('665413','00:00:00',0.00,0.00,'2012-11-30','48','-'),('665413;Tela es','00:00:00',0.00,0.00,'0000-00-00','',''),('676549','00:00:00',0.00,0.00,'2012-11-14','10','-'),('676549;Tela es','00:00:00',0.00,0.00,'0000-00-00','',''),('704995','00:00:00',0.00,0.00,'2012-11-14','7','-'),('704995;Tela es','00:00:00',0.00,0.00,'0000-00-00','',''),('707902','00:00:00',0.00,0.00,'2012-11-03','1','-'),('707902;Tela es','00:00:00',0.00,0.00,'0000-00-00','',''),('733204','00:00:00',0.00,0.00,'2012-11-12','1','-'),('733204;Tela es','00:00:00',0.00,0.00,'0000-00-00','',''),('757198','00:00:00',0.00,0.00,'2012-11-12','4.35','-'),('757198;Tela es','00:00:00',0.00,0.00,'0000-00-00','',''),('793531','00:00:00',0.00,0.00,'2012-11-17','48','-'),('793531;Tela es','00:00:00',0.00,0.00,'0000-00-00','',''),('794924','00:00:00',0.00,0.00,'2012-11-17','48','-'),('794924;Tela es','00:00:00',0.00,0.00,'0000-00-00','',''),('804383','00:00:00',0.00,0.00,'2012-11-21','7','-'),('804383;Tela es','00:00:00',0.00,0.00,'0000-00-00','',''),('811100','00:00:00',0.00,0.00,'2012-11-14','105','-'),('811100;Tela es','00:00:00',0.00,0.00,'0000-00-00','',''),('811853','00:00:00',0.00,0.00,'2012-11-13','7','-'),('811853;Tela es','00:00:00',0.00,0.00,'0000-00-00','',''),('821136','00:00:00',0.00,0.00,'2012-11-12','1','-'),('821136;Tela es','00:00:00',0.00,0.00,'0000-00-00','',''),('830606','00:00:00',0.00,0.00,'2012-11-14','52','-'),('830606;Tela es','00:00:00',0.00,0.00,'0000-00-00','',''),('832026','00:00:00',0.00,0.00,'2012-11-20','105','-'),('832026;Tela es','00:00:00',0.00,0.00,'0000-00-00','',''),('838551','00:00:00',0.00,0.00,'2012-11-23','48','-'),('838551;Tela es','00:00:00',0.00,0.00,'0000-00-00','',''),('877866','00:00:00',0.00,0.00,'2012-11-04','13.00','-'),('877866;Tela es','00:00:00',0.00,0.00,'0000-00-00','',''),('880556','00:00:00',0.00,0.00,'2012-03-19','4.35','-'),('880556;Tela es','00:00:00',0.00,0.00,'0000-00-00','',''),('890173','00:00:00',0.00,0.00,'2012-11-13','7','-'),('890173;Tela es','00:00:00',0.00,0.00,'0000-00-00','',''),('893721','00:00:00',0.00,0.00,'2012-11-18','10','-'),('893721;Tela es','00:00:00',0.00,0.00,'0000-00-00','',''),('923332','00:00:00',0.00,0.00,'2012-11-12','4.35','-'),('923332;Tela es','00:00:00',0.00,0.00,'0000-00-00','',''),('940202','00:00:00',0.00,0.00,'2012-11-25','4.35','-'),('940202;Tela es','00:00:00',0.00,0.00,'0000-00-00','',''),('949611','00:00:00',0.00,0.00,'2012-11-16','10','-'),('949611;Tela es','00:00:00',0.00,0.00,'0000-00-00','',''),('957124','00:00:00',0.00,0.00,'2012-11-12','48','-'),('957124;Tela es','00:00:00',0.00,0.00,'0000-00-00','',''),('967215','00:00:00',0.00,0.00,'2012-03-19','4.35','-'),('967215;Tela es','00:00:00',0.00,0.00,'0000-00-00','',''),('971260','00:00:00',0.00,0.00,'2012-11-20','105','-'),('971260;Tela es','00:00:00',0.00,0.00,'0000-00-00','',''),('973198','00:00:00',0.00,0.00,'2012-11-25','105','-'),('973198;Tela es','00:00:00',0.00,0.00,'0000-00-00','',''),('992798','00:00:00',0.00,0.00,'2012-03-19','10','-'),('992798;Tela es','00:00:00',0.00,0.00,'0000-00-00','',''),(';;;;;;;;\r','00:00:00',0.00,0.00,'0000-00-00','',''),('BASE_PROBLEMAS','00:00:00',0.00,0.00,'0000-00-00','',''),('Id;Descricao;P','00:00:00',0.00,0.00,'0000-00-00','','');
/*!40000 ALTER TABLE `contracheque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contrato`
--

DROP TABLE IF EXISTS `contrato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contrato` (
  `Cod_contrato` varchar(15) NOT NULL,
  `Cnpj_Unidade_suporte` bigint(14) unsigned NOT NULL,
  `Id_tipo_contrato` int(10) NOT NULL,
  `Data_inicio` date NOT NULL,
  `Data_fim` date NOT NULL,
  `Status_contrato` varchar(58) NOT NULL,
  PRIMARY KEY (`Cod_contrato`,`Cnpj_Unidade_suporte`,`Id_tipo_contrato`),
  KEY `contrato_tipo_contrato_fk` (`Id_tipo_contrato`),
  KEY `contrato_unidade_suporte_fk` (`Cnpj_Unidade_suporte`),
  CONSTRAINT `contrato_tipo_contrato_fk` FOREIGN KEY (`Id_tipo_contrato`) REFERENCES `tipo_contrato` (`Id`),
  CONSTRAINT `contrato_unidade_suporte_fk` FOREIGN KEY (`Cnpj_Unidade_suporte`) REFERENCES `unidade_de_suporte` (`CNPJ_empresa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contrato`
--

LOCK TABLES `contrato` WRITE;
/*!40000 ALTER TABLE `contrato` DISABLE KEYS */;
INSERT INTO `contrato` VALUES ('1450279',13496314178483,1,'2012-11-26','2020-11-26','Em andamento'),('1759570',13496314178476,1,'2012-03-19','2013-03-19','Concluído'),('3578660',13496314178467,2,'2012-11-28','2019-11-28','Concluído'),('4914676',13496314178482,3,'2012-11-25','2017-11-25','Em andamento'),('6711649',13496314178466,2,'2012-11-27','2016-11-27','Concluído'),('6787223',13496314178479,2,'2012-11-22','2014-11-22','Concluído'),('6926065',13496314178477,2,'2012-11-20','2016-11-20','Concluído'),('7917849',13496314178481,3,'2012-11-24','2018-11-24','Em andamento'),('8367571',13496314178480,1,'2012-11-23','2015-11-23','Concluído'),('9302429',13496314178478,2,'2012-11-21','2020-11-21','Em andamento');
/*!40000 ALTER TABLE `contrato` ENABLE KEYS */;
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
  `Nome` varchar(50) NOT NULL,
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
INSERT INTO `dependente` VALUES (1289876876,'3221219790124','Hayley Medina','F','1987-10-07','Filho',10),(1289876877,'3221219790125','Teegan Mccray','F','1987-10-08','Filha',10),(1289876878,'3221219790126','Hannah Buck','F','1955-10-09','Filha',3),(1289876879,'3221219790127','Allegra Reynolds','F','1977-10-10','Filho',43),(1289876880,'3221219790128','Jordan Mercer','F','1954-10-11','Esposa',48),(1289876881,'3221219790129','Breanna Clay','M','1959-10-12','Filho',30),(1289876882,'3221219790130','Jolene House','F','1969-10-13','Filho',12),(1289876883,'3221219790131','Bianca Wilcox','M','1987-10-14','Filho',29),(1289876884,'3221219790132','Lynn Combs','F','1987-10-15','Esposa',22),(1289876885,'3221219790133','Sarah Duke','F','1987-10-16','Filho',55),(1289876886,'3221219790134','Tatyana Haynes','M','1987-10-17','Esposa',27),(1289876887,'3221219790135','Nora Baxter','M','1987-10-18','Filha',15),(1289876888,'3221219790136','Iris Mcbride','F','1987-10-19','Esposa',26),(1289876889,'3221219790145','Rae Roman','M','1987-10-20','Filha',4),(1289876890,'3221219790146','Indira Spears','F','1987-10-21','Esposa',40),(1289876891,'3221219790147','Cassidy Todd','M','1987-10-22','Filho',19),(1289876892,'3221219790148','Margaret Church','M','1987-10-23','Filho',17),(1289876893,'3221219790149','Urielle Frost','F','1987-10-24','Esposa',33),(1289876894,'3221219790150','Geraldine Anthony','M','1987-10-25','Esposa',45),(1289876895,'3221219790151','Candace Roberts','F','1987-10-26','Esposa',52),(1289876896,'3221219790152','Susan Burgess','M','1987-10-27','Esposa',54),(1289876897,'3221219790153','McKenzie Roberts','M','1987-10-28','Filho',12),(1289876898,'3221219790154','Cheyenne Alston','F','1987-10-29','Filha',10),(1289876899,'3221219790155','Piper Perez','F','1987-10-30','Filha',13),(1289876900,'3221219790156','Hillary Foreman','F','1987-10-31','Esposa',30),(1289876901,'3221219790157','Leigh Lester','M','1987-10-20','Filha',17),(1289876902,'3221219790158','Tasha Tran','F','1987-10-13','Esposa',29),(1289876903,'3221219790153','Cynthia Gill','F','1987-10-03','Filha',15),(1289876904,'3221219790154','Kirestin Ortega','F','1987-10-15','Esposa',56),(1289876905,'3221219790155','Shoshana Kent','M','1987-10-06','Filha',20),(1289876906,'3221219790156','Leslie Thompson','F','1987-10-07','Filha',22),(1289876907,'3221219790157','Brielle Burke','F','1987-10-18','Esposa',37);
/*!40000 ALTER TABLE `dependente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `despesa_viagem`
--

DROP TABLE IF EXISTS `despesa_viagem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `despesa_viagem` (
  `Cod` varchar(10) NOT NULL,
  `Valor` int(11) NOT NULL,
  `Id_tipo_despesa` int(11) NOT NULL,
  `Mat_adm_financeiro` varchar(13) NOT NULL,
  `Sequencial_chamado` int(11) NOT NULL,
  `Mat_tec_campo` varchar(13) NOT NULL,
  PRIMARY KEY (`Cod`),
  UNIQUE KEY `Mat_adm_financeiro` (`Mat_adm_financeiro`),
  KEY `despesa_tipo_despesa_fk` (`Id_tipo_despesa`),
  KEY `chamado_fk` (`Sequencial_chamado`),
  KEY `tec_campo_fk` (`Mat_tec_campo`),
  CONSTRAINT `chamado_fk` FOREIGN KEY (`Sequencial_chamado`) REFERENCES `atende` (`Sequencial_chamado`),
  CONSTRAINT `despesa_adm_financeiro_fk` FOREIGN KEY (`Mat_adm_financeiro`) REFERENCES `adm_financeiro` (`Matricula`),
  CONSTRAINT `despesa_tipo_despesa_fk` FOREIGN KEY (`Id_tipo_despesa`) REFERENCES `tipo_despesa` (`Id`),
  CONSTRAINT `tec_campo_fk` FOREIGN KEY (`Mat_tec_campo`) REFERENCES `atende` (`Mat_tec_campo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `despesa_viagem`
--

LOCK TABLES `despesa_viagem` WRITE;
/*!40000 ALTER TABLE `despesa_viagem` DISABLE KEYS */;
INSERT INTO `despesa_viagem` VALUES ('1115896532',124,831787,'3221219790136',142530,'3221219790153'),('1115896533',124,503241,'3221219790137',326138,'3221219790154'),('1115896534',124,331281,'3221219790138',888642,'3221219790155'),('1115896535',24,314099,'3221219790139',127003,'3221219790156'),('1115896536',124,453579,'3221219790140',993477,'3221219790157'),('1115896537',124,817396,'3221219790141',469529,'3221219790158'),('1115896538',124,788367,'3221219790142',857233,'3221219790159'),('1115896539',124,626228,'3221219790143',375295,'3221219790160'),('1115896540',124,790839,'3221219790144',285228,'3221219790161');
/*!40000 ALTER TABLE `despesa_viagem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documento`
--

DROP TABLE IF EXISTS `documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documento` (
  `Id` int(11) NOT NULL,
  `Tipo` varchar(60) NOT NULL,
  `Data_Criacao` date NOT NULL,
  `Arquivo` varchar(50) NOT NULL,
  `Versao` varchar(20) NOT NULL,
  `Titulo` varchar(50) NOT NULL,
  `Cod_contrato` varchar(15) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Cod_contrato` (`Cod_contrato`),
  CONSTRAINT `documento_cod_contrato_fk` FOREIGN KEY (`Cod_contrato`) REFERENCES `contrato` (`Cod_contrato`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documento`
--

LOCK TABLES `documento` WRITE;
/*!40000 ALTER TABLE `documento` DISABLE KEYS */;
INSERT INTO `documento` VALUES (238911,'Fiscal','2009-11-13','Paudalho','1.0','Do Prazo de Vigência do Contrato','8367571'),(272788,'Fiscal','2009-11-12','Boa Vista','3.0','Dos Contratantes','6787223'),(314526,'Fiscal','2009-11-15','Paulista','4.2','Dos Contratantes','4914676'),(557666,'Fiscal','2009-11-11','Boa Viagem','5.0','Da jornada de trabalho contratada','9302429'),(573071,'Fiscal','2009-11-09','Boa Vista','1.3','Dos Contratantes','1759570'),(781263,'Fiscal','2009-11-14','Imbiribeira','1.3','Do Prazo de Vigência do Contrato','7917849'),(848454,'Fiscal','2009-11-10','Bom Pastor','1.4.2','Do Contratado','6926065'),(860894,'Fiscal','2009-11-17','Paulista','1.1','Do Contratado','6711649'),(884060,'Fiscal','2009-11-16','Boa Viagem','2.1','Do Contratado','1450279'),(891266,'Fiscal','2009-11-18','Boa Viagem','4.2','Do Contratado','3578660');
/*!40000 ALTER TABLE `documento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empresa` (
  `CNPJ` bigint(14) unsigned NOT NULL DEFAULT '0',
  `Razao_social` varchar(60) NOT NULL,
  `Endereco` varchar(60) NOT NULL,
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
INSERT INTO `empresa` VALUES (13496314178466,'Proin Foundation','775-3538 Euismod Road','(81) 3031-2526','Bahia'),(13496314178467,'Ac Inc.','154-7105 A Ave','(81) 3031-2525','Ceará'),(13496314178468,'Euismod Mauris Eu Consulting','P.O. Box 135, 8214 Morbi St.','(81) 3031-2524','São Paulo'),(13496314178469,'Libero Morbi Industries','Ap #659-5123 Sit Street','(81) 3031-2523','São Paulo'),(13496314178470,'Sapien Molestie Orci LLP','332-3298 Interdum Road','(81) 3031-2522','Minas Gerais'),(13496314178471,'Proin Velit Company','4468 Sagittis Street','(81) 3031-2521','São Paulo'),(13496314178472,'Donec Tempus LLP','Ap #222-1785 Mauris Ave','(81) 3031-2520','São Paulo'),(13496314178473,'Duis Foundation','4658 Nulla Road','(81) 3031-2519','São Paulo'),(13496314178474,'Ullamcorper Duis At Inc.','P.O. Box 811, 504 Faucibus St.','(81) 3031-2518','Minas Gerais'),(13496314178475,'Orci Inc.','P.O. Box 866, 7025 Phasellus Road','(81) 3031-2517','Paraná');
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `end_fornecedor`
--

DROP TABLE IF EXISTS `end_fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `end_fornecedor` (
  `Cnpj_Fornecedor` bigint(14) NOT NULL,
  `Endereco` varchar(30) NOT NULL,
  PRIMARY KEY (`Cnpj_Fornecedor`,`Endereco`),
  CONSTRAINT `end_fornecedor_fk` FOREIGN KEY (`Cnpj_Fornecedor`) REFERENCES `fornecedor` (`Cnpj`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `end_fornecedor`
--

LOCK TABLES `end_fornecedor` WRITE;
/*!40000 ALTER TABLE `end_fornecedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `end_fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `envolveu`
--

DROP TABLE IF EXISTS `envolveu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `envolveu` (
  `Num_ordem_servico` int(11) NOT NULL,
  `Cod_equipamento` varchar(15) NOT NULL,
  PRIMARY KEY (`Num_ordem_servico`,`Cod_equipamento`),
  KEY `envolve_equipamento_fk` (`Cod_equipamento`),
  CONSTRAINT `envolve_equipamento_fk` FOREIGN KEY (`Cod_equipamento`) REFERENCES `equipamento` (`Cod`),
  CONSTRAINT `envolveu_os_fk` FOREIGN KEY (`Num_ordem_servico`) REFERENCES `ordem_servico` (`Num`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `envolveu`
--

LOCK TABLES `envolveu` WRITE;
/*!40000 ALTER TABLE `envolveu` DISABLE KEYS */;
INSERT INTO `envolveu` VALUES (109006,'19703'),(251182,'20790'),(293137,'79969'),(538507,'29476'),(579148,'18398'),(628743,'34993'),(640479,'99542'),(702449,'36512'),(743273,'53435'),(812795,'44201'),(896492,'13508'),(901221,'41246'),(977699,'55377');
/*!40000 ALTER TABLE `envolveu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipamento`
--

DROP TABLE IF EXISTS `equipamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipamento` (
  `Cod` varchar(15) NOT NULL,
  `Data_entrada` date NOT NULL,
  `Setor` varchar(50) NOT NULL,
  `historico` varchar(1023) NOT NULL,
  `Fabricante` varchar(20) NOT NULL,
  `Estado` varchar(30) NOT NULL,
  `Cod_contrato` varchar(15) NOT NULL,
  PRIMARY KEY (`Cod`),
  KEY `Cod_contrato_fk` (`Cod_contrato`),
  CONSTRAINT `Cod_contrato_fk` FOREIGN KEY (`Cod_contrato`) REFERENCES `contrato` (`Cod_contrato`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipamento`
--

LOCK TABLES `equipamento` WRITE;
/*!40000 ALTER TABLE `equipamento` DISABLE KEYS */;
INSERT INTO `equipamento` VALUES ('13508','2012-11-11','Automacao','Equipamento passou por regulagem e calibração 2 vezes.','Lenovo','Bahia','6926065'),('18398','2012-11-15','Automacao','Equipamento nunca passou por manutenção.','Positivo','Minas Gerais','7917849'),('19703','2012-11-12','Almoxarifado','11','Philco','Santa Catarina','9302429'),('29476','2012-11-13','Almoxarifado','4','Lenovo','São Paulo','6787223'),('34993','2012-11-10','Ferragens','Equipamento já passou por troca de tela.','CCE','Rio de Janeiro','1759570'),('36512','2012-11-18','Almoxarifado','5','CCE','São Paulo','6711649'),('41246','2012-11-17','Recepcao','6','Itautech','Bahia','1450279'),('53435','2012-03-19','Automacao','10','Philco','Rio Grande do Sul','3578660'),('55377','2012-11-16','Automacao','5','Philco','Pará','4914676'),('79969','2012-11-14','Automacao','2','Philco','Rio Grande do Sul','8367571');
/*!40000 ALTER TABLE `equipamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fatura`
--

DROP TABLE IF EXISTS `fatura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fatura` (
  `Cod` int(11) NOT NULL,
  `Num_parcelas` int(11) NOT NULL,
  `Valor_total` decimal(6,2) NOT NULL,
  `Status_` varchar(30) NOT NULL,
  `Cod_cliente` int(11) NOT NULL,
  PRIMARY KEY (`Cod`),
  KEY `fatura_cliente_fk` (`Cod_cliente`),
  CONSTRAINT `fatura_cliente_fk` FOREIGN KEY (`Cod_cliente`) REFERENCES `cliente` (`Cod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fatura`
--

LOCK TABLES `fatura` WRITE;
/*!40000 ALTER TABLE `fatura` DISABLE KEYS */;
INSERT INTO `fatura` VALUES (117095,12,200.00,'Incompleto',122211),(231307,12,200.00,'Incompleto',419036),(254807,12,466.67,'Concluído',921567),(332619,12,200.00,'Incompleto',546312),(417174,12,156.00,'Concluído',494738),(525009,12,200.00,'Em andamento',468928),(544386,12,1500.00,'Concluído',421804),(743797,12,200.00,'Em andamento',444272),(805070,12,200.00,'Incompleto',374702),(857787,12,330.00,'Em andamento',754431);
/*!40000 ALTER TABLE `fatura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornece`
--

DROP TABLE IF EXISTS `fornece`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fornece` (
  `Cnpj_Fornecedor` bigint(14) NOT NULL,
  `Cod_Insumo` varchar(15) NOT NULL,
  `Data_inicio` date NOT NULL,
  `Data_fim` date NOT NULL,
  `Valor_unitario` float(4,2) NOT NULL,
  PRIMARY KEY (`Cnpj_Fornecedor`),
  KEY `Cod_Insumo_fk` (`Cod_Insumo`),
  CONSTRAINT `Cnpj_Fornecedor_fk` FOREIGN KEY (`Cnpj_Fornecedor`) REFERENCES `fornecedor` (`Cnpj`),
  CONSTRAINT `Cod_Insumo_fk` FOREIGN KEY (`Cod_Insumo`) REFERENCES `insumo` (`Cod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornece`
--

LOCK TABLES `fornece` WRITE;
/*!40000 ALTER TABLE `fornece` DISABLE KEYS */;
/*!40000 ALTER TABLE `fornece` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fornecedor` (
  `Cnpj` bigint(14) NOT NULL,
  `Razao_social` varchar(30) NOT NULL,
  `Email` varchar(40) NOT NULL,
  `Telefone` varchar(20) NOT NULL,
  PRIMARY KEY (`Cnpj`),
  UNIQUE KEY `Razao_social` (`Razao_social`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor`
--

LOCK TABLES `fornecedor` WRITE;
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `fornecedor` ENABLE KEYS */;
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
  UNIQUE KEY `Login` (`Login`),
  UNIQUE KEY `Senha` (`Senha`),
  UNIQUE KEY `Cod_Contracheque` (`Cod_Contracheque`),
  UNIQUE KEY `Email` (`Email`),
  KEY `funcionario_supervisiona_fk` (`Matricula_supervisor`),
  CONSTRAINT `funcionario_supervisiona_fk` FOREIGN KEY (`Matricula_supervisor`) REFERENCES `supervisiona` (`Matricula_supervisor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` VALUES ('3221219790118',11898352001,'1312438672230',13496314178466,'Kylan','131274509274058','Collier, Alexis Q.',1884639000,'non.hendrerit@quismassa.com',6),('3221219790119',11898352002,'1312438672231',13496314178467,'Finn','131274509274059','Thompson, David N.',1884639001,'sapien@Duisami.org',6),('3221219790120',11898352003,'1312438672232',13496314178468,'Harlan','131274509274060','Calhoun, Tatum V.',1884639002,'at.risus@pede.edu',4),('3221219790121',11898352004,'1312438672233',13496314178469,'Francis','131274509274061','Ayala, Francesca U.',1884639003,'aliquam@tempusnonlacinia.net',4),('3221219790122',11898352005,'1312438672234',13496314178470,'Minerva','131274509274062','Herman, Damian L.',1884639004,'tempus.lorem@tempor.net',4),('3221219790123',11898352006,'1312438672235',13496314178471,'Derek','131274509274063','Mcneil, Kendall S.',1884639005,'orci.lacus@gravidamolestiearcu.com',8),('3221219790124',11898352007,'1312438672236',13496314178472,'Isabella','131274509274064','Gould, Beatrice T.',1884639006,'neque@lacus.net',6),('3221219790125',11898352008,'1312438672237',13496314178473,'Jasper','131274509274065','Willis, Marny R.',1884639007,'adipiscing@luctuslobortisClass.ca',6),('3221219790126',11898352009,'1312438672238',13496314178474,'Kyra','131274509274066','Downs, Callum A.',1884639008,'nonummy@dolortempus.ca',6),('3221219790127',11898352010,'1312438672239',13496314178475,'Dane','131274509274067','Orr, Cain Z.',1884639009,'dictum.sapien@uteros.edu',4),('3221219790128',11898352011,'1312438672240',13496314178476,'Branden','131274509274068','Malone, Xena W.',1884639010,'magna.Cras@eulacus.ca',6),('3221219790129',11898352012,'1312438672241',13496314178477,'Dexter','131274509274069','Buckner, Martina X.',1884639011,'risus.In@ipsumDonecsollicitudin.edu',4),('3221219790130',11898352013,'1312438672242',13496314178478,'Leila','131274509274070','Downs, Athena Q.',1884639012,'nulla@Nam.org',6),('3221219790131',11898352014,'1312438672243',13496314178479,'Haviva','131274509274071','Kirk, Trevor H.',1884639013,'eu@nunc.co.uk',4),('3221219790132',11898352015,'1312438672244',13496314178480,'Molly','131274509274072','Coffey, Drew N.',1884639014,'Nullam@nec.net',4),('3221219790133',11898352016,'1312438672245',13496314178481,'Sawyer','131274509274073','Maddox, Kareem O.',1884639015,'ligula.Aenean@sedfacilisis.edu',6),('3221219790134',11898352017,'1312438672246',13496314178482,'Axel','131274509274074','Lawrence, Gavin R.',1884639016,'nec.imperdiet@dui.ca',4),('3221219790135',11898352018,'1312438672247',13496314178483,'Russell','131274509274075','Bowers, Leilani X.',1884639017,'eu.dolor@purusac.ca',4),('3221219790136',11898352019,'1312438672248',13496314178469,'Joy','131274509274076','Baldwin, Berk A.',1884639018,'Maecenas.libero.est@sodalesatvelit.co.uk',8),('3221219790137',11898352020,'1312438672249',13496314178470,'Ivy','131274509274077','Davidson, Axel O.',1884639019,'et@Fuscedolorquam.org',8),('3221219790138',11898352021,'1312438672250',13496314178471,'Quintessa','131274509274078','Bean, Yasir Y.',1884639020,'Phasellus@sitamet.com',6),('3221219790139',11898352022,'1312438672251',13496314178472,'Kieran','131274509274079','Crane, Isaiah Y.',1884639021,'nec@ipsumdolorsit.com',6),('3221219790140',11898352023,'1312438672252',13496314178473,'Oprah','131274509274080','Johns, Oliver R.',1884639022,'a@lorem.edu',4),('3221219790141',11898352024,'1312438672253',13496314178474,'Dana','131274509274081','Gilliam, Nash K.',1884639023,'justo.nec.ante@vulputate.ca',4),('3221219790142',11898352025,'1312438672254',13496314178475,'Ursa','131274509274082','Blair, Hashim G.',1884639024,'pharetra@maurisa.org',4),('3221219790143',11898352026,'1312438672255',13496314178476,'Lynn','131274509274083','Norris, Harrison R.',1884639025,'ullamcorper.nisl.arcu@semperrutrumFusce.ca',8),('3221219790144',11898352027,'1312438672256',13496314178474,'Baxter','131274509274084','Shepherd, Thor S.',1884639026,'amet@lacusvarius.net',6),('3221219790145',11898352028,'1312438672257',13496314178475,'Maile','131274509274085','Hubbard, Lacota D.',1884639027,'arcu.Sed@eratvitae.co.uk',8),('3221219790146',11898352029,'1312438672258',13496314178476,'Paloma','131274509274086','Johnson, Winifred S.',1884639028,'purus@vitaesemperegestas.ca',4),('3221219790147',11898352030,'1312438672259',13496314178477,'Melyssa','131274509274087','Odonnell, Leroy S.',1884639029,'aliquet@tellusnonmagna.edu',8),('3221219790148',11898352031,'1312438672260',13496314178478,'Rigel','131274509274088','Pacheco, Daquan R.',1884639030,'magna.Phasellus.dolor@Nullamfeugiatplacerat.edu',6),('3221219790149',11898352032,'1312438672261',13496314178479,'Keaton','131274509274089','Sutton, Prescott H.',1884639031,'dui@Curabiturconsequat.edu',8),('3221219790150',11898352033,'1312438672262',13496314178480,'Olga','131274509274090','Murphy, MacKenzie J.',1884639032,'elit.elit@dolordapibus.net',6),('3221219790152',11898352035,'1312438672264',13496314178470,'Kathleen','131274509274092','Cox, Holly W.',1884639034,'rhoncus.id.mollis@nunc.net',8),('3221219790153',11898352036,'1312438672265',13496314178471,'Halee','131274509274093','Olsen, Salvador E.',1884639035,'eget.laoreet@fringilla.ca',4),('3221219790154',11898352037,'1312438672266',13496314178472,'Ulric','131274509274094','Haney, Inga E.',1884639036,'Lorem.ipsum@Proinvel.net',4),('3221219790155',11898352038,'1312438672267',13496314178473,'Matthew','131274509274095','Whitehead, Michelle H.',1884639037,'augue.porttitor@InloremDonec.com',6),('3221219790156',11898352039,'1312438672268',13496314178474,'Chaney','131274509274096','Willis, Jack G.',1884639038,'ornare.facilisis@aliquetnec.ca',8),('3221219790157',11898352040,'1312438672269',13496314178475,'Denton','131274509274097','Sparks, Mannix N.',1884639039,'lacus@Cumsociisnatoque.edu',6),('3221219790158',11898352041,'1312438672270',13496314178476,'Craig','131274509274098','Peterson, Francesca H.',1884639040,'nec.tellus.Nunc@ornareelit.net',6),('3221219790159',11898352042,'1312438672271',13496314178477,'Lee','131274509274099','Rios, Halee N.',1884639041,'nunc.sit.amet@felisDonec.net',4),('3221219790160',11898352043,'1312438672272',13496314178478,'Amery','131274509274100','Olson, Uriah K.',1884639042,'aliquet@quispede.co.uk',4),('3221219790161',11898352044,'1312438672273',13496314178479,'Barrett','131274509274101','Cooper, Basia M.',1884639043,'enim.mi.tempor@Nulla.net',8),('3221219790162',11898352045,'1312438672274',13496314178480,'Erasmus','131274509274102','Conway, Sasha I.',1884639044,'mollis@iaculisenim.org',6),('3221219790163',11898352046,'1312438672275',13496314178481,'Hamish','131274509274103','Gross, Gray Y.',1884639045,'aliquet.Proin@amet.co.uk',8),('3221219790164',11898352047,'1312438672276',13496314178482,'Vaughan','131274509274104','Pruitt, Margaret O.',1884639046,'vestibulum@Curabitursedtortor.co.uk',6),('3221219790165',11898352048,'1312438672277',13496314178483,'Jerome','131274509274105','Perkins, Mona K.',1884639047,'ut@consectetuerrhoncus.com',6),('3221219790166',11898352049,'1312438672278',13496314178469,'Troy','131274509274106','Joyner, Indira H.',1884639048,'dui.augue.eu@enim.com',6),('3221219790167',11898352050,'1312438672279',13496314178470,'Angelica','131274509274107','Kirby, Ruby J.',1884639049,'Phasellus@adui.co.uk',4),('3221219790168',11898352051,'1312438672280',13496314178471,'Emily','131274509274108','Young, Ashton M.',1884639050,'non@vehicularisusNulla.ca',4),('3221219790169',11898352052,'1312438672281',13496314178472,'Hayley','131274509274109','Robertson, Gretchen B.',1884639051,'Integer.tincidunt@congueturpis.co.uk',8),('3221219790171',11898352054,'1312438672283',13496314178474,'Penelope','131274509274111','Freeman, Randall N.',1884639053,'Praesent.eu.nulla@viverra.co.uk',4),('3221219790172',11898352055,'1312438672284',13496314178481,'Sonia','131274509274112','Sanders, Cherokee Y.',1884639054,'mi@ligulaNullam.ca',4),('3221219790173',11898352056,'1312438672285',13496314178482,'Tatum','131274509274113','Miller, Lars Q.',1884639055,'sagittis@egestasadui.co.uk',4),('3221219790174',11898352057,'1312438672286',13496314178483,'Brendan','131274509274114','Giles, Knox T.',1884639056,'pede.sagittis@inconsectetueripsum.net',6),('3221219790175',11898352058,'1312438672287',13496314178469,'Emmanuel','131274509274115','Blair, Dustin D.',1884639057,'Suspendisse.sed@Curabituregestas.org',4),('3221219790176',11898352059,'1312438672288',13496314178470,'Nelle','131274509274116','Ayers, Brian D.',1884639058,'consectetuer@ante.com',6),('3221219790177',11898352060,'1312438672289',13496314178471,'Magee','131274509274117','Castillo, Oren J.',1884639059,'tempus.risus.Donec@Sed.edu',6),('3221219790178',11898352061,'1312438672290',13496314178472,'Winifred','131274509274118','Daniel, Sloane M.',1884639060,'urna@consequatlectussit.net',8),('3221219790179',11898352062,'1312438672291',13496314178473,'Mona','131274509274119','Olsen, Cassady T.',1884639061,'sem.elit.pharetra@gravida.ca',8),('3221219790180',11898352063,'1312438672292',13496314178474,'Dominique','131274509274120','Orr, Amelia A.',1884639062,'accumsan.convallis@Aliquamadipiscinglobortis.co.uk',8),('3221219790181',11898352064,'1312438672293',13496314178475,'Charity','131274509274121','Emerson, Len D.',1884639063,'suscipit.nonummy.Fusce@idlibero.co.uk',4),('3221219790182',11898352065,'1312438672294',13496314178476,'Wyatt','131274509274122','Ochoa, Wilma F.',1884639064,'a.tortor.Nunc@Nunc.org',8),('3221219790183',11898352066,'1312438672295',13496314178474,'Barretto','131274509274123','Witt, Kenneth H.',1884639065,'libero.at.auctor@dui.com',4),('3221219790184',11898352067,'1312438672296',13496314178475,'Noble','131274509274124','Stevens, Basil D.',1884639066,'dapibus.rutrum@Donecnibh.org',6),('3221219790185',11898352068,'1312438672297',13496314178476,'Cara','131274509274125','Pitts, Hayley R.',1884639067,'Duis@nulla.net',6),('3221219790186',11898352069,'1312438672298',13496314178477,'Wolf','131274509274126','Crawford, Hamilton V.',1884639068,'nec.imperdiet.nec@mienim.edu',4),('3221219790187',11898352070,'1312438672299',13496314178478,'Medge','131274509274127','Woods, Halla A.',1884639069,'eu@iaculisneceleifend.edu',4),('3221219790188',11898352071,'1312438672300',13496314178474,'Geoffrey','131274509274128','Larsen, Holmes J.',1884639070,'Morbi@nasceturridiculus.net',8),('3221219790189',11898352072,'1312438672301',13496314178475,'Knox','131274509274129','Gutierrez, Chastity X.',1884639071,'interdum@erat.net',6),('3221219790190',11898352073,'1312438672302',13496314178476,'Richard','131274509274130','Craig, Xander M.',1884639072,'varius@tinciduntcongueturpis.edu',6),('3221219790191',11898352074,'1312438672303',13496314178474,'Elliott','131274509274131','Ryan, Salvador B.',1884639073,'vitae.purus.gravida@cursusNunc.edu',4),('3221219790192',11898352075,'1312438672304',13496314178475,'MacKensie','131274509274132','Kinney, Matthew H.',1884639074,'In@sedorcilobortis.ca',4),('3221219790193',11898352076,'1312438672305',13496314178476,'Zena','131274509274133','Hancock, Lane Y.',1884639075,'magna@orciUtsagittis.edu',6),('3221219790194',11898352077,'1312438672306',13496314178477,'Tasha','131274509274134','Valencia, Wesley N.',1884639076,'blandit@velvulputateeu.net',6),('3221219790195',11898352078,'1312438672307',13496314178478,'Evan','131274509274135','Barry, Hamilton B.',1884639077,'nec.urna.et@faucibusorciluctus.edu',4),('3221219790196',11898352079,'1312438672308',13496314178479,'Anastasia','131274509274136','Eaton, Maia P.',1884639078,'erat@vel.net',8),('3221219790197',11898352080,'1312438672309',13496314178480,'Dylan','131274509274137','Pratt, Clayton L.',1884639079,'Nulla.facilisi@facilisiseget.co.uk',8),('3221219790198',11898352081,'1312438672310',13496314178481,'Gabriel','131274509274138','Hardin, Rahim V.',1884639080,'metus.eu@Proinvelnisl.com',6),('3221219790199',11898352082,'1312438672311',13496314178470,'America','131274509274139','Fletcher, Palmer U.',1884639081,'elementum.dui@fringilla.com',4),('3221219790200',11898352083,'1312438672312',13496314178471,'Xena','131274509274140','Green, Yoshio H.',1884639082,'erat.nonummy@auguemalesuadamalesuada.net',8),('3221219790201',11898352084,'1312438672313',13496314178472,'Quemby','131274509274141','Ellis, Teagan U.',1884639083,'eu@Sed.edu',6),('3221219790202',11898352085,'1312438672314',13496314178474,'Audrey','131274509274142','Richmond, Ila B.',1884639084,'pulvinar@sedlibero.com',4),('3221219790203',11898352086,'1312438672315',13496314178475,'Martin','131274509274143','Schroeder, Lysandra P.',1884639085,'metus.facilisis.lorem@sagittisplaceratCras.org',4),('3221219790204',11898352087,'1312438672316',13496314178476,'Travis','131274509274144','Cantu, Ryan X.',1884639086,'Nunc.pulvinar@ac.edu',6),('3221219790205',11898352088,'1312438672317',13496314178477,'Aladdin','131274509274145','Serrano, Vivian Y.',1884639087,'convallis.erat.eget@leoVivamus.ca',6),('3221219790206',11898352089,'1312438672318',13496314178478,'Phillip','131274509274146','Dyer, Herman K.',1884639088,'metus.Vivamus@porttitorinterdum.edu',4),('3221219790207',11898352090,'1312438672319',13496314178479,'Jonah','131274509274147','Graves, Hope D.',1884639089,'dictum.mi.ac@consectetuercursuset.com',6),('3221219790208',11898352091,'1312438672320',13496314178480,'Zelda','131274509274148','Bolton, Nita E.',1884639090,'nulla@tincidunt.com',4),('3221219790209',11898352092,'1312438672321',13496314178481,'Teegan','131274509274149','Wilcox, Lacey K.',1884639091,'lorem@inconsectetueripsum.org',4),('3221219790210',11898352093,'1312438672322',13496314178470,'Montana','131274509274150','Craft, Erasmus O.',1884639092,'Quisque@euelitNulla.ca',6),('3221219790211',11898352094,'1312438672323',13496314178471,'Grace','131274509274151','David, Xander G.',1884639093,'tempus.risus.Donec@nasceturridiculus.co.uk',4),('3221219790212',11898352095,'1312438672324',13496314178472,'Britanney','131274509274152','Cotton, Ima I.',1884639094,'luctus.Curabitur.egestas@nislQuisque.org',8),('3221219790213',11898352096,'1312438672325',13496314178473,'Hasad','131274509274153','Wynn, Francis J.',1884639095,'massa.lobortis.ultrices@libero.com',6),('3221219790214',11898352097,'1312438672326',13496314178474,'Keith','131274509274154','Miranda, Libby D.',1884639096,'Quisque@luctus.net',8),('3221219790215',11898352098,'1312438672327',13496314178475,'Luke','131274509274155','Schultz, Tamara P.',1884639097,'sociis.natoque.penatibus@Nuncac.ca',6);
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `impressora`
--

DROP TABLE IF EXISTS `impressora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `impressora` (
  `Cod_equipamento` varchar(15) NOT NULL,
  `Modelo` varchar(15) NOT NULL,
  PRIMARY KEY (`Cod_equipamento`),
  CONSTRAINT `impressora_equipamento_fk` FOREIGN KEY (`Cod_equipamento`) REFERENCES `equipamento` (`Cod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `impressora`
--

LOCK TABLES `impressora` WRITE;
/*!40000 ALTER TABLE `impressora` DISABLE KEYS */;
/*!40000 ALTER TABLE `impressora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insumo`
--

DROP TABLE IF EXISTS `insumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `insumo` (
  `Cod` varchar(15) NOT NULL,
  `Descricao` varchar(128) NOT NULL,
  `Cod_categoria` varchar(20) NOT NULL,
  `Mat_supervisor` varchar(13) NOT NULL,
  PRIMARY KEY (`Cod`),
  KEY `insumo_categoria_fk` (`Cod_categoria`),
  KEY `insumo_solicita_fk` (`Mat_supervisor`),
  CONSTRAINT `insumo_categoria_fk` FOREIGN KEY (`Cod_categoria`) REFERENCES `categoria` (`Cod`),
  CONSTRAINT `insumo_solicita_fk` FOREIGN KEY (`Mat_supervisor`) REFERENCES `solicita` (`Mat_supervisor`),
  CONSTRAINT `insumo_supervisor_fk` FOREIGN KEY (`Mat_supervisor`) REFERENCES `supervisor` (`matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insumo`
--

LOCK TABLES `insumo` WRITE;
/*!40000 ALTER TABLE `insumo` DISABLE KEYS */;
INSERT INTO `insumo` VALUES ('13720','Memória','2','3221219790120'),('21639','Processador I3','1','3221219790127'),('31916','Fonte de Alimentação ATX 230W','1','3221219790124'),('34094','Toner','2','3221219790125'),('45737','Carcaça Notebook Positivo','2','3221219790122'),('47092','Cabeamento','2','3221219790119'),('55610','Tela LED Noetbook','3','3221219790126'),('65412','Parafuso Notebook Acer 1149','1','3221219790121'),('67333','Antenas','1','3221219790118'),('70039','Teclado Notebook HP','2','3221219790123');
/*!40000 ALTER TABLE `insumo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insumo_usado_servico`
--

DROP TABLE IF EXISTS `insumo_usado_servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `insumo_usado_servico` (
  `Cod_Insumo` varchar(15) NOT NULL,
  `Cod_servico` int(11) NOT NULL,
  `Quantidade` varchar(29) NOT NULL,
  PRIMARY KEY (`Cod_Insumo`,`Cod_servico`),
  KEY `insumo_usado_servico_servico` (`Cod_servico`),
  CONSTRAINT `insumo_usado_servico_insumo_fk` FOREIGN KEY (`Cod_Insumo`) REFERENCES `insumo` (`Cod`),
  CONSTRAINT `insumo_usado_servico_servico` FOREIGN KEY (`Cod_servico`) REFERENCES `servico` (`Cod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insumo_usado_servico`
--

LOCK TABLES `insumo_usado_servico` WRITE;
/*!40000 ALTER TABLE `insumo_usado_servico` DISABLE KEYS */;
INSERT INTO `insumo_usado_servico` VALUES ('13720',855547,'33'),('21639',605518,'99'),('31916',983704,'22'),('34094',267080,'44'),('45737',215386,'78'),('47092',461863,'65'),('55610',613590,'65'),('65412',556703,'65'),('67333',204239,'34'),('70039',341250,'96');
/*!40000 ALTER TABLE `insumo_usado_servico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_estoque`
--

DROP TABLE IF EXISTS `item_estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_estoque` (
  `Sequencial` int(8) NOT NULL,
  `Cod_Insumo` varchar(15) NOT NULL,
  `Quantidade_Atual` int(6) NOT NULL,
  `Data_validade` date NOT NULL,
  `Data_final` date NOT NULL,
  `Data_entrada` date NOT NULL,
  `Preco_compra` int(8) NOT NULL,
  `Quantidade_minima` int(6) NOT NULL,
  `Id_almoxarifado` int(11) NOT NULL,
  PRIMARY KEY (`Sequencial`,`Cod_Insumo`),
  KEY `item_estoque_insumo_fk` (`Cod_Insumo`),
  KEY `item_estoque_almoxarifado_fk` (`Id_almoxarifado`),
  CONSTRAINT `item_estoque_almoxarifado_fk` FOREIGN KEY (`Id_almoxarifado`) REFERENCES `almoxarifado` (`Id`),
  CONSTRAINT `item_estoque_insumo_fk` FOREIGN KEY (`Cod_Insumo`) REFERENCES `insumo` (`Cod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_estoque`
--

LOCK TABLES `item_estoque` WRITE;
/*!40000 ALTER TABLE `item_estoque` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_estoque` ENABLE KEYS */;
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
  `Trabalha_sabado` varchar(3) NOT NULL,
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
INSERT INTO `jornada_de_trabalho` VALUES ('32163328','08:00:00','18:00:00','Não','Não_Tem','3221219790118'),('32163329','08:00:00','18:00:00','Não','Não_Tem','3221219790119'),('32163330','08:00:00','18:00:00','Sim','Não_Tem','3221219790120'),('32163331','08:00:00','18:00:00','Sim','Não_Tem','3221219790121'),('32163332','08:00:00','18:00:00','Não','Não_Tem','3221219790122'),('32163333','08:00:00','18:00:00','Não','Não_Tem','3221219790123'),('32163334','08:00:00','18:00:00','Sim','Não_Tem','3221219790124'),('32163335','08:00:00','18:00:00','Não','Não_Tem','3221219790125'),('32163338','08:00:00','18:00:00','Não','Não_Tem','3221219790128'),('32163339','08:00:00','18:00:00','Sim','Não_Tem','3221219790129'),('32163340','08:00:00','18:00:00','Sim','Não_Tem','3221219790130'),('32163341','08:00:00','16:00:00','Sim','Não_Tem','3221219790131'),('32163342','08:00:00','16:00:00','Sim','Não_Tem','3221219790132'),('32163343','08:00:00','18:00:00','Não','Não_Tem','3221219790133'),('32163344','08:00:00','18:00:00','Não','Não_Tem','3221219790134'),('32163345','08:00:00','16:00:00','Não','Não_Tem','3221219790135'),('32163346','08:00:00','18:00:00','Não','Não_Tem','3221219790136'),('32163347','08:00:00','16:00:00','Não','Não_Tem','3221219790137'),('32163348','08:00:00','18:00:00','Não','Não_Tem','3221219790138'),('32163349','08:00:00','16:00:00','Sim','Não_Tem','3221219790139'),('32163350','08:00:00','18:00:00','Não','Não_Tem','3221219790140'),('32163351','08:00:00','18:00:00','Não','Não_Tem','3221219790141'),('32163352','08:00:00','18:00:00','Não','Não_Tem','3221219790142'),('32163353','08:00:00','18:00:00','Não','Não_Tem','3221219790143'),('32163354','08:00:00','18:00:00','Não','Não_Tem','3221219790144'),('32163355','08:00:00','18:00:00','Sim','Não_Tem','3221219790145'),('32163356','08:00:00','18:00:00','Não','Não_Tem','3221219790146'),('32163357','08:00:00','16:00:00','Não','Não_Tem','3221219790147'),('32163358','08:00:00','18:00:00','Sim','Não_Tem','3221219790148'),('32163359','08:00:00','18:00:00','Não','Não_Tem','3221219790149'),('32163360','08:00:00','18:00:00','Não','Não_Tem','3221219790150'),('32163361','08:00:00','18:00:00','Não','Não_Tem','3221219790151'),('32163362','08:00:00','18:00:00','Sim','Não_Tem','3221219790152'),('32163363','08:00:00','18:00:00','Não','Não_Tem','3221219790153'),('32163364','08:00:00','18:00:00','Não','Não_Tem','3221219790154'),('32163365','08:00:00','18:00:00','Sim','Não_Tem','3221219790155'),('32163366','08:00:00','18:00:00','Não','Não_Tem','3221219790156'),('32163367','08:00:00','16:00:00','Sim','Não_Tem','3221219790157'),('32163368','08:00:00','18:00:00','Não','Não_Tem','3221219790158'),('32163369','08:00:00','18:00:00','Sim','Não_Tem','3221219790159'),('32163370','08:00:00','18:00:00','Não','Não_Tem','3221219790160'),('32163371','08:00:00','16:00:00','Sim','Não_Tem','3221219790161'),('32163372','08:00:00','18:00:00','Não','Não_Tem','3221219790162'),('32163373','08:00:00','18:00:00','Não','Não_Tem','3221219790163'),('32163374','08:00:00','18:00:00','Sim','Não_Tem','3221219790164'),('32163375','08:00:00','18:00:00','Não','Não_Tem','3221219790165'),('32163376','08:00:00','18:00:00','Sim','Não_Tem','3221219790166'),('32163377','08:00:00','18:00:00','Sim','Não_Tem','3221219790167'),('32163378','08:00:00','18:00:00','Não','Não_Tem','3221219790168'),('32163379','08:00:00','18:00:00','Não','Não_Tem','3221219790169'),('32163380','08:00:00','18:00:00','Não','Não_Tem','3221219790170'),('32163381','08:00:00','18:00:00','Não','Não_Tem','3221219790171'),('32163382','08:00:00','18:00:00','Sim','Não_Tem','3221219790172'),('32163383','08:00:00','18:00:00','Não','Não_Tem','3221219790173'),('32163384','08:00:00','18:00:00','Não','Não_Tem','3221219790174'),('32163385','08:00:00','16:00:00','Não','Não_Tem','3221219790175'),('32163386','08:00:00','18:00:00','Não','Não_Tem','3221219790176'),('32163387','08:00:00','18:00:00','Não','Não_Tem','3221219790177'),('32163388','08:00:00','18:00:00','Não','Não_Tem','3221219790178'),('32163389','08:00:00','18:00:00','Não','Não_Tem','3221219790179'),('32163390','08:00:00','18:00:00','Não','Não_Tem','3221219790180'),('32163391','08:00:00','18:00:00','Não','Não_Tem','3221219790181'),('32163392','08:00:00','18:00:00','Não','Não_Tem','3221219790182'),('32163393','08:00:00','18:00:00','Não','Não_Tem','3221219790183'),('32163395','08:00:00','18:00:00','Não','Não_Tem','3221219790185'),('32163396','08:00:00','18:00:00','Não','Não_Tem','3221219790186'),('32163397','08:00:00','18:00:00','Sim','Não_Tem','3221219790187'),('32163398','08:00:00','18:00:00','Não','Não_Tem','3221219790188'),('32163399','08:00:00','18:00:00','Não','Não_Tem','3221219790189'),('32163400','08:00:00','18:00:00','Não','Não_Tem','3221219790190'),('32163401','08:00:00','18:00:00','Não','Não_Tem','3221219790191'),('32163402','08:00:00','18:00:00','Sim','Não_Tem','3221219790192'),('32163403','08:00:00','18:00:00','Não','Não_Tem','3221219790193'),('32163404','08:00:00','18:00:00','Não','Não_Tem','3221219790194'),('32163405','08:00:00','16:00:00','Não','Não_Tem','3221219790195'),('32163406','08:00:00','18:00:00','Não','Não_Tem','3221219790196'),('32163407','08:00:00','18:00:00','Não','Não_Tem','3221219790197'),('32163408','08:00:00','18:00:00','Não','Não_Tem','3221219790198'),('32163409','08:00:00','18:00:00','Não','Não_Tem','3221219790199'),('32163410','08:00:00','18:00:00','Não','Não_Tem','3221219790200'),('32163411','08:00:00','18:00:00','Não','Não_Tem','3221219790201'),('32163412','08:00:00','18:00:00','Não','Não_Tem','3221219790202'),('32163413','08:00:00','18:00:00','Não','Não_Tem','3221219790203'),('32163414','08:00:00','18:00:00','Sim','Não_Tem','3221219790204'),('32163415','08:00:00','18:00:00','Não','Não_Tem','3221219790205'),('32163416','08:00:00','18:00:00','Não','Não_Tem','3221219790206'),('32163417','08:00:00','18:00:00','Sim','Não_Tem','3221219790207'),('32163418','08:00:00','18:00:00','Não','Não_Tem','3221219790208'),('32163419','08:00:00','18:00:00','Não','Não_Tem','3221219790209'),('32163420','08:00:00','16:00:00','Não','Não_Tem','3221219790210'),('32163421','08:00:00','18:00:00','Não','Não_Tem','3221219790211'),('32163422','08:00:00','18:00:00','Não','Não_Tem','3221219790212'),('32163423','08:00:00','18:00:00','Não','Não_Tem','3221219790213'),('32163424','08:00:00','18:00:00','Não','Não_Tem','3221219790214'),('32163425','08:00:00','18:00:00','Não','Não_Tem','3221219790215');
/*!40000 ALTER TABLE `jornada_de_trabalho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kpi`
--

DROP TABLE IF EXISTS `kpi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kpi` (
  `Matricula_tecnico` varchar(13) DEFAULT NULL,
  `Sequencial` int(11) DEFAULT NULL,
  `KPI_1` varchar(30) DEFAULT NULL,
  `KPI_2` varchar(30) DEFAULT NULL,
  `Dsc_KPI_1` varchar(100) DEFAULT NULL,
  `Dsk_KPI_2` varchar(100) DEFAULT NULL,
  KEY `kpi_tecnico_fk` (`Matricula_tecnico`),
  CONSTRAINT `kpi_tecnico_fk` FOREIGN KEY (`Matricula_tecnico`) REFERENCES `tecnico` (`Matricula_tecnico`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kpi`
--

LOCK TABLES `kpi` WRITE;
/*!40000 ALTER TABLE `kpi` DISABLE KEYS */;
INSERT INTO `kpi` VALUES ('3221219790136',25848,'10','59','Total de Máquinas Consertadas por Semana','Máquinas Consertadas sem Retorno por Mês'),('3221219790137',93220,'52','50','Total de Máquinas Consertadas por Semana','Máquinas Consertadas sem Retorno por Mês'),('3221219790138',16491,'3','6','Total de Máquinas Consertadas por Semana','Máquinas Consertadas sem Retorno por Mês'),('3221219790139',74103,'49','38','Total de Máquinas Consertadas por Semana','Máquinas Consertadas sem Retorno por Mês'),('3221219790140',54382,'11','56','Total de Máquinas Consertadas por Semana','Máquinas Consertadas sem Retorno por Mês'),('3221219790141',50748,'10','29','Total de Máquinas Consertadas por Semana','Máquinas Consertadas sem Retorno por Mês'),('3221219790142',94257,'9','9','Total de Máquinas Consertadas por Semana','Máquinas Consertadas sem Retorno por Mês'),('3221219790143',44985,'47','23','Total de Máquinas Consertadas por Semana','Máquinas Consertadas sem Retorno por Mês'),('3221219790144',32823,'60','22','Total de Máquinas Consertadas por Semana','Máquinas Consertadas sem Retorno por Mês'),('3221219790145',64408,'24','36','Total de Máquinas Consertadas por Semana','Máquinas Consertadas sem Retorno por Mês');
/*!40000 ALTER TABLE `kpi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nobreak`
--

DROP TABLE IF EXISTS `nobreak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nobreak` (
  `Cod_equipamento` varchar(15) NOT NULL,
  `KVA` varchar(20) NOT NULL,
  PRIMARY KEY (`Cod_equipamento`),
  CONSTRAINT `nobreak_equipamento_fk` FOREIGN KEY (`Cod_equipamento`) REFERENCES `equipamento` (`Cod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nobreak`
--

LOCK TABLES `nobreak` WRITE;
/*!40000 ALTER TABLE `nobreak` DISABLE KEYS */;
/*!40000 ALTER TABLE `nobreak` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orcamento`
--

DROP TABLE IF EXISTS `orcamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orcamento` (
  `Cod` int(11) NOT NULL,
  `Data_emissao` date NOT NULL,
  `Validade_num_dias` int(11) NOT NULL,
  `ultima_data` date NOT NULL,
  `Descricao` varchar(255) NOT NULL,
  `Data_abertura` date NOT NULL,
  `Num_OS` int(11) NOT NULL,
  PRIMARY KEY (`Cod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orcamento`
--

LOCK TABLES `orcamento` WRITE;
/*!40000 ALTER TABLE `orcamento` DISABLE KEYS */;
INSERT INTO `orcamento` VALUES (130254,'2005-09-30',5,'2006-12-29','Sem descricao','2016-01-10',109006),(214748,'2005-09-21',5,'2006-12-29','Sem descricao','2016-03-15',214748),(272995,'2005-08-31',5,'2006-12-29','Sem descricao','2016-09-12',579148),(326744,'2005-07-24',5,'2006-12-29','Sem descricao','2016-03-15',896492),(408327,'2005-10-03',5,'2006-12-29','Sem descricao','2015-09-05',702449),(412926,'2005-09-02',5,'2006-12-29','Sem descricao','2016-09-12',977699),(438497,'2005-08-30',5,'2006-12-29','Sem descricao','2010-09-10',293137),(756250,'2005-09-21',5,'2006-12-29','Sem descricao','2016-03-15',628743),(758001,'2005-08-15',5,'2006-12-29','Sem descricao','2016-03-15',743273),(896738,'2005-08-26',5,'2006-12-29','Sem descricao','2010-09-10',901221),(905543,'2005-10-11',5,'2006-12-29','Sem descricao','2016-03-15',538507);
/*!40000 ALTER TABLE `orcamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordem_servico`
--

DROP TABLE IF EXISTS `ordem_servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordem_servico` (
  `Num` int(11) NOT NULL DEFAULT '0',
  `Data_devida` date NOT NULL,
  `Prazo_em_dias` int(11) NOT NULL,
  `Data_criacao` date NOT NULL,
  `Status_` varchar(20) NOT NULL,
  `Cod_servico` int(11) NOT NULL,
  `sequencial_chamado` int(11) NOT NULL,
  `Cod_orcamento` int(11) DEFAULT NULL,
  PRIMARY KEY (`Num`),
  UNIQUE KEY `Cod_orcamento` (`Cod_orcamento`),
  KEY `ord_servico_chamado_fk` (`sequencial_chamado`),
  CONSTRAINT `ord_servico_chamado_fk` FOREIGN KEY (`sequencial_chamado`) REFERENCES `chamado` (`Sequencial`),
  CONSTRAINT `ord_servico_orcamento_fk` FOREIGN KEY (`Cod_orcamento`) REFERENCES `orcamento` (`Cod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordem_servico`
--

LOCK TABLES `ordem_servico` WRITE;
/*!40000 ALTER TABLE `ordem_servico` DISABLE KEYS */;
INSERT INTO `ordem_servico` VALUES (109006,'2014-10-13',3,'2015-01-19','Em Curso',855547,888642,130254),(293137,'2014-10-15',3,'2015-01-21','Em Curso',215386,993477,438497),(538507,'2014-10-14',3,'2015-01-20','Em aberto',556703,127003,905543),(579148,'2014-10-16',3,'2015-01-22','Em Curso',341250,469529,272995),(628743,'2014-10-11',3,'2015-01-17','Em Curso',204239,142530,756250),(702449,'2014-10-19',3,'2015-01-25','Em Curso',613590,285228,408327),(743273,'2014-10-20',3,'2015-01-26','Em Curso',605518,455427,758001),(896492,'2014-10-12',3,'2015-01-18','Em Curso',461863,326138,326744),(901221,'2014-10-18',3,'2015-01-24','Em Curso',267080,375295,896738),(977699,'2014-10-17',3,'2015-01-23','Em Curso',983704,857233,412926);
/*!40000 ALTER TABLE `ordem_servico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parcela_pagamento`
--

DROP TABLE IF EXISTS `parcela_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parcela_pagamento` (
  `Sequencial` int(11) NOT NULL,
  `Cod_fatura` int(11) NOT NULL,
  `Data_pagamento` date NOT NULL,
  `Data_parcela` date NOT NULL,
  `Juros` float(2,2) NOT NULL,
  `Valor_total` int(11) NOT NULL,
  `Valor_pagamento_parcelado` int(11) NOT NULL,
  PRIMARY KEY (`Sequencial`,`Cod_fatura`),
  KEY `parcela_pagamento_fatura_fk` (`Cod_fatura`),
  CONSTRAINT `parcela_pagamento_fatura_fk` FOREIGN KEY (`Cod_fatura`) REFERENCES `fatura` (`Cod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parcela_pagamento`
--

LOCK TABLES `parcela_pagamento` WRITE;
/*!40000 ALTER TABLE `parcela_pagamento` DISABLE KEYS */;
INSERT INTO `parcela_pagamento` VALUES (186637,332619,'2012-11-13','2012-11-13',0.02,169,100),(258868,544386,'2012-11-11','2012-11-11',0.70,90,100),(404938,743797,'2012-11-06','2012-11-06',0.03,39,100),(584790,805070,'2012-11-10','2012-11-10',0.03,90,100),(705602,117095,'2012-11-04','2012-11-04',0.03,300,30),(708697,525009,'2012-11-09','2012-11-09',0.70,300,25),(717795,417174,'2012-11-08','2012-11-08',0.02,363,55),(797332,857787,'2012-11-12','2012-11-12',0.70,90,13),(873814,231307,'2012-11-07','2012-11-07',0.01,150,100),(874591,254807,'2012-11-05','2012-11-05',0.70,169,30);
/*!40000 ALTER TABLE `parcela_pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servico`
--

DROP TABLE IF EXISTS `servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servico` (
  `Cod` int(11) NOT NULL,
  `Descricao` varchar(255) NOT NULL,
  `Valor` int(11) NOT NULL,
  `Status_` varchar(255) NOT NULL,
  `Cod_Tipo_Servico` int(11) NOT NULL,
  `Num_OS` int(11) NOT NULL,
  PRIMARY KEY (`Cod`),
  UNIQUE KEY `Num_OS` (`Num_OS`),
  KEY `servico_tipo_servic_fk` (`Cod_Tipo_Servico`),
  CONSTRAINT `servico_ord_servico_fk` FOREIGN KEY (`Num_OS`) REFERENCES `ordem_servico` (`Num`),
  CONSTRAINT `servico_tipo_servic_fk` FOREIGN KEY (`Cod_Tipo_Servico`) REFERENCES `tipo_servico` (`Cod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servico`
--

LOCK TABLES `servico` WRITE;
/*!40000 ALTER TABLE `servico` DISABLE KEYS */;
INSERT INTO `servico` VALUES (204239,'Cliente relatou instabilidade no browser(Chrome).  Aguardando Análise para possível Volta ou Visita de Reparo.',263,'Análise Pendente',1345966586,628743),(215386,'-',55,'Concluído',1345966586,293137),(267080,'-',125,'Concluído',1345966586,901221),(341250,'Comprar CI TDA2030A',15,'Compra a fazer',1345966598,579148),(461863,'-',123,'Concluído',1345966588,896492),(556703,'Comprar capacitores 1uF 6V, 10uF 16V',65,'Compra a fazer',1345966589,538507),(605518,'-',133,'Incompleto',1345966598,743273),(613590,'-',300,'Em andamento',1345966586,702449),(855547,'Testar os HDs em estoque para ver se algum pode ser usado no micro.',300,'Teste a fazer',1345966588,109006),(983704,'-',65,'Incompleto',1345966586,977699);
/*!40000 ALTER TABLE `servico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicita`
--

DROP TABLE IF EXISTS `solicita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solicita` (
  `Mat_supervisor` varchar(13) NOT NULL,
  `Quantidade` int(4) DEFAULT NULL,
  PRIMARY KEY (`Mat_supervisor`),
  CONSTRAINT `solicita_supervisor_fk` FOREIGN KEY (`Mat_supervisor`) REFERENCES `supervisor` (`matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicita`
--

LOCK TABLES `solicita` WRITE;
/*!40000 ALTER TABLE `solicita` DISABLE KEYS */;
INSERT INTO `solicita` VALUES ('3221219790118',65),('3221219790119',33),('3221219790120',82),('3221219790121',25),('3221219790122',38),('3221219790123',77),('3221219790124',37),('3221219790125',52),('3221219790126',50),('3221219790127',21),('3221219790128',100);
/*!40000 ALTER TABLE `solicita` ENABLE KEYS */;
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
  CONSTRAINT `suepervisiona_supervisor_fk` FOREIGN KEY (`Matricula_supervisor`) REFERENCES `supervisor` (`matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supervisiona`
--

LOCK TABLES `supervisiona` WRITE;
/*!40000 ALTER TABLE `supervisiona` DISABLE KEYS */;
INSERT INTO `supervisiona` VALUES ('3221219790118','2005-04-02'),('3221219790119','2003-04-03'),('3221219790120','2004-04-04'),('3221219790121','2001-04-05'),('3221219790122','2007-04-06'),('3221219790123','2009-04-07'),('3221219790124','2000-04-08'),('3221219790125','2005-03-27'),('3221219790126','2000-04-10'),('3221219790127','2016-04-11'),('3221219790128','2012-04-12'),('3221219790129','2001-07-13'),('3221219790130','2011-11-14'),('3221219790131','2002-09-15'),('3221219790132','2000-01-16'),('3221219790133','2004-06-17'),('3221219790134','2012-12-18'),('3221219790135','2014-02-19');
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
INSERT INTO `supervisor` VALUES ('3221219790118'),('3221219790119'),('3221219790120'),('3221219790121'),('3221219790122'),('3221219790123'),('3221219790124'),('3221219790125'),('3221219790126'),('3221219790127'),('3221219790128'),('3221219790129'),('3221219790130'),('3221219790131'),('3221219790132'),('3221219790133'),('3221219790134'),('3221219790135');
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
INSERT INTO `tecnico` VALUES ('3221219790136'),('3221219790137'),('3221219790138'),('3221219790139'),('3221219790140'),('3221219790141'),('3221219790142'),('3221219790143'),('3221219790144'),('3221219790145'),('3221219790146'),('3221219790147'),('3221219790148'),('3221219790149'),('3221219790150'),('3221219790151'),('3221219790152'),('3221219790153'),('3221219790154'),('3221219790155'),('3221219790162'),('3221219790163'),('3221219790164'),('3221219790165'),('3221219790166'),('3221219790167'),('3221219790168'),('3221219790169'),('3221219790170'),('3221219790171'),('3221219790172'),('3221219790173'),('3221219790174'),('3221219790175'),('3221219790176'),('3221219790177'),('3221219790178'),('3221219790179'),('3221219790180'),('3221219790181'),('3221219790182'),('3221219790183'),('3221219790184'),('3221219790185'),('3221219790186'),('3221219790187'),('3221219790188'),('3221219790189');
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
  `tel_movel` varchar(30) DEFAULT NULL,
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
INSERT INTO `tecnico_campo` VALUES ('3221219790164','(81)998990-0098'),('3221219790163','(81)998990-0099'),('3221219790162','(81)998990-0100'),('3221219790189','(81)998990-0101'),('3221219790188','(81)998990-0102'),('3221219790187','(81)998990-0103'),('3221219790186','(81)998990-0104'),('3221219790185','(81)998990-0105'),('3221219790184','(81)998990-0106'),('3221219790183','(81)998990-0107'),('3221219790182','(81)998990-0108'),('3221219790181','(81)998990-0109'),('3221219790180','(81)998990-0110'),('3221219790179','(81)998990-0111');
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
INSERT INTO `tecnico_interno` VALUES ('3221219790156','3122','Técnico em Eletrônica'),('3221219790157','3123','Técnico em Eletrônica'),('3221219790158','3124','Técnico em Informática'),('3221219790159','3125','Técnico em Informática'),('3221219790160','3126','Técnico em Eletrônica'),('3221219790161','3127','Técnico em Eletrônica'),('3221219790162','3128','Técnico em Informática'),('3221219790163','3129','Técnico em Eletrônica'),('3221219790164','3130','Técnico em Eletrônica'),('3221219790165','3131','Técnico em Informática'),('3221219790166','3132','Técnico em Informática'),('3221219790167','3133','Técnico em Informática'),('3221219790168','3134','Técnico em Informática'),('3221219790169','3135','Técnico em Eletrônica'),('3221219790170','3136','Técnico em Eletrônica'),('3221219790171','3137','Técnico em Informática'),('3221219790172','3138','Técnico em Informática'),('3221219790173','3139','Técnico em Eletrônica'),('3221219790174','3140','Técnico em Informática'),('3221219790175','3141','Técnico em Informática');
/*!40000 ALTER TABLE `tecnico_interno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_contrato`
--

DROP TABLE IF EXISTS `tipo_contrato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_contrato` (
  `Id` int(10) NOT NULL,
  `Descricao` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_contrato`
--

LOCK TABLES `tipo_contrato` WRITE;
/*!40000 ALTER TABLE `tipo_contrato` DISABLE KEYS */;
INSERT INTO `tipo_contrato` VALUES (1,'Manutenção'),(2,'Manutenção de Sistema Operacional'),(3,'Treinamento'),(4,'-'),(5,'-'),(6,'-'),(7,'-'),(8,'-'),(9,'-'),(10,'-');
/*!40000 ALTER TABLE `tipo_contrato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_despesa`
--

DROP TABLE IF EXISTS `tipo_despesa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_despesa` (
  `Id` int(11) NOT NULL,
  `Descricao` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_despesa`
--

LOCK TABLES `tipo_despesa` WRITE;
/*!40000 ALTER TABLE `tipo_despesa` DISABLE KEYS */;
INSERT INTO `tipo_despesa` VALUES (314099,'-'),(331281,'Transporte Interurbano'),(453579,'-'),(503241,'Transporte Urbano'),(626228,'-'),(788367,'-'),(790839,'-'),(817396,'-'),(831787,'Alimentação');
/*!40000 ALTER TABLE `tipo_despesa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_servico`
--

DROP TABLE IF EXISTS `tipo_servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_servico` (
  `Cod` int(11) NOT NULL,
  `Descricao` varchar(255) NOT NULL,
  PRIMARY KEY (`Cod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_servico`
--

LOCK TABLES `tipo_servico` WRITE;
/*!40000 ALTER TABLE `tipo_servico` DISABLE KEYS */;
INSERT INTO `tipo_servico` VALUES (1345966586,'Substituição de Monitor'),(1345966588,'Reparo de Fonte de Alimentação'),(1345966589,'Troca de Tela'),(1345966598,'Troca de Placa Mãe');
/*!40000 ALTER TABLE `tipo_servico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tv`
--

DROP TABLE IF EXISTS `tv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tv` (
  `Cod_equipamento` varchar(15) NOT NULL,
  `Modelo` varchar(15) NOT NULL,
  PRIMARY KEY (`Cod_equipamento`),
  CONSTRAINT `tv_equipamento_fk` FOREIGN KEY (`Cod_equipamento`) REFERENCES `equipamento` (`Cod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tv`
--

LOCK TABLES `tv` WRITE;
/*!40000 ALTER TABLE `tv` DISABLE KEYS */;
INSERT INTO `tv` VALUES ('20790','LG'),('24829','TOSHIBA'),('31115','ALV'),('34357','LG'),('44201','SAMSUNG'),('60101','SAMSUG'),('63820','ALV'),('71545','SEMP'),('71963','LG'),('75322','TOSHIBA'),('98911','SEMP');
/*!40000 ALTER TABLE `tv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidade_de_suporte`
--

DROP TABLE IF EXISTS `unidade_de_suporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unidade_de_suporte` (
  `Cod` varchar(15) NOT NULL,
  `CNPJ_empresa` bigint(14) unsigned NOT NULL DEFAULT '0',
  `Nro_funcionarios` int(11) DEFAULT NULL,
  `Nome` varchar(50) NOT NULL,
  `Matriz` varchar(20) NOT NULL,
  `endereco` varchar(50) NOT NULL,
  `FONE` varchar(16) NOT NULL,
  PRIMARY KEY (`CNPJ_empresa`,`Cod`),
  UNIQUE KEY `endereco` (`endereco`),
  KEY `funcionario_unid_sup_fk` (`CNPJ_empresa`),
  CONSTRAINT `fk_unid_suporte_empresa` FOREIGN KEY (`CNPJ_empresa`) REFERENCES `empresa` (`CNPJ`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidade_de_suporte`
--

LOCK TABLES `unidade_de_suporte` WRITE;
/*!40000 ALTER TABLE `unidade_de_suporte` DISABLE KEYS */;
INSERT INTO `unidade_de_suporte` VALUES ('279097806',13496314178466,402,'Posuere Vulputate Industries','Bahia','114-4625 Sed Ave','(81) 3031-2509'),('509237061',13496314178466,77,'A Enim LLC','Ceará','P.O. Box 100, 4841 Velit. Street','(81) 3031-2491'),('317477054',13496314178467,466,'Varius Et LLC','São Paulo','Ap #333-7229 Pellentesque Avenue','(81) 3031-2508'),('854717401',13496314178467,314,'Dui Company','Pará','Ap #159-5610 Eget Ave','(81) 3031-2490'),('117645345',13496314178468,262,'Fermentum Convallis Incorporated','São Paulo','P.O. Box 295, 5585 Quam Street','(81) 3031-2507'),('974031777',13496314178468,28,'Dolor Company','Bahia','Ap #550-8282 Aliquam, Road','(81) 3031-2489'),('747482687',13496314178469,120,'Donec Dignissim Associates','São Paulo','826-4805 Magna. St.','(81) 3031-2488'),('752583069',13496314178469,285,'Sed Neque Sed Associates','São Paulo','7595 Curabitur St.','(81) 3031-2506'),('799478856',13496314178470,102,'Ligula Aenean Euismod LLC','Rio de Janeiro','3905 Semper. St.','(81) 3031-2505'),('809949674',13496314178470,134,'Vestibulum Associates','Rio de Janeiro','P.O. Box 967, 3103 Magnis Rd.','(81) 3031-2487'),('735070983',13496314178471,130,'Quisque Tincidunt Pede Incorporated','Minas Gerais','Ap #560-3318 Eget Ave','(81) 3031-2504'),('742709653',13496314178471,121,'Facilisis Corp.','Rio de Janeiro','1025 Nunc Road','(81) 3031-2486'),('304286936',13496314178472,214,'Et Rutrum Limited','Bahia','9206 Nec Rd.','(81) 3031-2485'),('466025271',13496314178472,9,'Quisque PC','Bahia','Ap #317-4665 Lorem, St.','(81) 3031-2503'),('664392322',13496314178473,326,'Fusce Mi Incorporated','Minas Gerais','P.O. Box 226, 3174 Felis Street','(81) 3031-2484'),('928346701',13496314178473,27,'A PC','Paraíba','P.O. Box 129, 1164 Cras Road','(81) 3031-2502'),('364705840',13496314178474,40,'Interdum Enim Non LLP','Rio de Janeiro','166-1000 Libero. Av.','(81) 3031-2501'),('544306033',13496314178474,15,'Nibh Foundation','Minas Gerais','3849 Neque Avenue','(81) 3031-2483'),('268566562',13496314178475,72,'Luctus Lobortis Class Corp.','São Paulo','645-6334 Turpis Rd.','(81) 3031-2482'),('341809184',13496314178475,381,'Porttitor Eros Foundation','Minas Gerais','P.O. Box 581, 6377 Natoque Road','(81) 3031-2500'),('127347720',13496314178476,190,'Sit Amet Ultricies LLP','Maranhão','188-4432 Dui. St.','(81) 3031-2481'),('266231311',13496314178476,347,'In Scelerisque Scelerisque LLP','Goiás','4466 Vitae, Av.','(81) 3031-2499'),('263690136',13496314178477,492,'A Limited','Bahia','P.O. Box 699, 9231 Commodo St.','(81) 3031-2498'),('919034641',13496314178477,378,'Nec Corp.','São Paulo','Ap #542-1293 Vel Street','(81) 3031-2480'),('320491609',13496314178478,94,'Sed Malesuada Augue Institute','Pernambuco','464-3546 Dapibus St.','(81) 3031-2479'),('392933559',13496314178478,293,'Vitae Sodales Institute','Rio Grande do Sul','9472 Nunc Rd.','(81) 3031-2497'),('552846280',13496314178479,184,'Ipsum Institute','Ceará','P.O. Box 673, 8337 Egestas Road','(81) 3031-2478'),('967406139',13496314178479,215,'Nonummy Ac Foundation','Minas Gerais','Ap #910-3882 Praesent Avenue','(81) 3031-2496'),('736023275',13496314178480,8,'Curabitur Ut Odio Limited','Paraíba','P.O. Box 224, 1203 Rutrum. Road','(81) 3031-2477'),('745019521',13496314178480,411,'Nec Luctus Foundation','Rio de Janeiro','5142 Aliquet Rd.','(81) 3031-2495'),('222110944',13496314178481,411,'Id Enim Foundation','Minas Gerais','Ap #853-7739 Mauris St.','(81) 3031-2494'),('343768265',13496314178481,178,'Ante Ipsum Primis Industries','São Paulo','9416 Nec Ave','(81) 3031-2476'),('569099945',13496314178482,5,'Nunc Sed Libero Associates','Maranhão','P.O. Box 420, 1918 Morbi Av.','(81) 3031-2493'),('722878906',13496314178482,126,'Vivamus Nisi PC','São Paulo','P.O. Box 856, 916 Senectus Avenue','(81) 3031-2475'),('875769624',13496314178483,247,'Dolor Egestas Rhoncus Foundation','São Paulo','1032 Egestas Ave','(81) 3031-2474'),('994112396',13496314178483,219,'Ut Nulla Cras Institute','Ceará','638-5569 Nunc Rd.','(81) 3031-2492');
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

-- Dump completed on 2017-08-18 21:33:23
