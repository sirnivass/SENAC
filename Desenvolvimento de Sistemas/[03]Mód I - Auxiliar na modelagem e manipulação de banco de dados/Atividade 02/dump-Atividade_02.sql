-- MariaDB dump 10.19  Distrib 10.6.16-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: Atividade_02
-- ------------------------------------------------------
-- Server version	10.6.16-MariaDB-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `consulta`
--

DROP TABLE IF EXISTS `consulta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consulta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` datetime DEFAULT NULL,
  `especialidade_buscada` varchar(100) DEFAULT NULL,
  `meidco_id` int(11) NOT NULL,
  `pacinete_id` int(11) NOT NULL,
  `convenio_id` int(11) DEFAULT NULL,
  `valor_consulta` double DEFAULT NULL,
  `anamnese` text DEFAULT NULL,
  `receita` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `consulta_paciente_FK` (`pacinete_id`),
  KEY `consulta_medico_FK` (`meidco_id`),
  KEY `consulta_convenio_FK` (`convenio_id`),
  CONSTRAINT `consulta_convenio_FK` FOREIGN KEY (`convenio_id`) REFERENCES `convenio` (`id`),
  CONSTRAINT `consulta_medico_FK` FOREIGN KEY (`meidco_id`) REFERENCES `medico` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `consulta_paciente_FK` FOREIGN KEY (`pacinete_id`) REFERENCES `paciente` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consulta`
--

LOCK TABLES `consulta` WRITE;
/*!40000 ALTER TABLE `consulta` DISABLE KEYS */;
/*!40000 ALTER TABLE `consulta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `convenio`
--

DROP TABLE IF EXISTS `convenio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `convenio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CNPJ` varchar(14) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `numero_carteira` int(11) DEFAULT NULL,
  `tempo_de_carencia` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `convenio`
--

LOCK TABLES `convenio` WRITE;
/*!40000 ALTER TABLE `convenio` DISABLE KEYS */;
/*!40000 ALTER TABLE `convenio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enfermeiro`
--

DROP TABLE IF EXISTS `enfermeiro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `enfermeiro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cre` int(11) NOT NULL,
  `pessoa_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `enfermeiro_pessoa_FK` (`pessoa_id`),
  CONSTRAINT `enfermeiro_pessoa_FK` FOREIGN KEY (`pessoa_id`) REFERENCES `pessoa` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enfermeiro`
--

LOCK TABLES `enfermeiro` WRITE;
/*!40000 ALTER TABLE `enfermeiro` DISABLE KEYS */;
/*!40000 ALTER TABLE `enfermeiro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especialidade`
--

DROP TABLE IF EXISTS `especialidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `especialidade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `especialidade` tinytext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especialidade`
--

LOCK TABLES `especialidade` WRITE;
/*!40000 ALTER TABLE `especialidade` DISABLE KEYS */;
INSERT INTO `especialidade` VALUES (1,'PEDIATRIA'),(2,'CLÍNICA GERAL'),(3,'GASTROENTEROLOGIA'),(4,'DERMATOLOGIA');
/*!40000 ALTER TABLE `especialidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especialidade_medico`
--

DROP TABLE IF EXISTS `especialidade_medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `especialidade_medico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_medico` int(11) NOT NULL,
  `id_especialidade` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `especialidade_medico_medico_FK` (`id_medico`),
  KEY `especialidade_medico_especialidade_FK` (`id_especialidade`),
  CONSTRAINT `especialidade_medico_especialidade_FK` FOREIGN KEY (`id_especialidade`) REFERENCES `especialidade` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `especialidade_medico_medico_FK` FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especialidade_medico`
--

LOCK TABLES `especialidade_medico` WRITE;
/*!40000 ALTER TABLE `especialidade_medico` DISABLE KEYS */;
/*!40000 ALTER TABLE `especialidade_medico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `internacao`
--

DROP TABLE IF EXISTS `internacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `internacao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data_entrada` date NOT NULL,
  `alta_prevista` date NOT NULL,
  `alta` date NOT NULL,
  `procedimentos` text DEFAULT NULL,
  `id_medicos` int(11) DEFAULT NULL,
  `id_pacientes` int(11) DEFAULT NULL,
  `id_enfermeiros` int(11) NOT NULL,
  `in_quartos` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `internacao_medico_FK` (`id_medicos`),
  KEY `internacao_paciente_FK` (`id_pacientes`),
  KEY `internacao_enfermeiro_FK` (`id_enfermeiros`),
  KEY `internacao_quarto_FK` (`in_quartos`),
  CONSTRAINT `internacao_enfermeiro_FK` FOREIGN KEY (`id_enfermeiros`) REFERENCES `enfermeiro` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `internacao_medico_FK` FOREIGN KEY (`id_medicos`) REFERENCES `medico` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `internacao_paciente_FK` FOREIGN KEY (`id_pacientes`) REFERENCES `paciente` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `internacao_quarto_FK` FOREIGN KEY (`in_quartos`) REFERENCES `quarto` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `internacao`
--

LOCK TABLES `internacao` WRITE;
/*!40000 ALTER TABLE `internacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `internacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `internacao_enfermeiro`
--

DROP TABLE IF EXISTS `internacao_enfermeiro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `internacao_enfermeiro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_internacao` int(11) NOT NULL,
  `id_enfermeiro` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `internacao_enfermeiro_internacao_FK` (`id_internacao`),
  KEY `internacao_enfermeiro_enfermeiro_FK` (`id_enfermeiro`),
  CONSTRAINT `internacao_enfermeiro_enfermeiro_FK` FOREIGN KEY (`id_enfermeiro`) REFERENCES `enfermeiro` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `internacao_enfermeiro_internacao_FK` FOREIGN KEY (`id_internacao`) REFERENCES `internacao` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `internacao_enfermeiro`
--

LOCK TABLES `internacao_enfermeiro` WRITE;
/*!40000 ALTER TABLE `internacao_enfermeiro` DISABLE KEYS */;
/*!40000 ALTER TABLE `internacao_enfermeiro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medico`
--

DROP TABLE IF EXISTS `medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medico` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `crm` varchar(100) NOT NULL,
  `uf_crm` varchar(100) DEFAULT NULL,
  `id_especialidade` int(11) NOT NULL,
  `pessoa_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `medico_pessoa_FK` (`pessoa_id`),
  CONSTRAINT `medico_pessoa_FK` FOREIGN KEY (`pessoa_id`) REFERENCES `pessoa` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medico`
--

LOCK TABLES `medico` WRITE;
/*!40000 ALTER TABLE `medico` DISABLE KEYS */;
/*!40000 ALTER TABLE `medico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente`
--

DROP TABLE IF EXISTS `paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paciente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pessoa_id` int(11) DEFAULT NULL,
  `convenio_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `paciente_pessoa_FK` (`pessoa_id`),
  KEY `paciente_convenio_FK` (`convenio_id`),
  CONSTRAINT `paciente_convenio_FK` FOREIGN KEY (`convenio_id`) REFERENCES `convenio` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `paciente_pessoa_FK` FOREIGN KEY (`pessoa_id`) REFERENCES `pessoa` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente`
--

LOCK TABLES `paciente` WRITE;
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoa`
--

DROP TABLE IF EXISTS `pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pessoa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `data_nascimento` date NOT NULL,
  `cpf` int(11) NOT NULL,
  `telefone` int(11) NOT NULL,
  `endereco` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa`
--

LOCK TABLES `pessoa` WRITE;
/*!40000 ALTER TABLE `pessoa` DISABLE KEYS */;
/*!40000 ALTER TABLE `pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quarto`
--

DROP TABLE IF EXISTS `quarto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quarto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero` int(11) NOT NULL,
  `id_tipo_quarto` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `quarto_tipo_quarto_FK` (`id_tipo_quarto`),
  CONSTRAINT `quarto_tipo_quarto_FK` FOREIGN KEY (`id_tipo_quarto`) REFERENCES `tipo_quarto` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quarto`
--

LOCK TABLES `quarto` WRITE;
/*!40000 ALTER TABLE `quarto` DISABLE KEYS */;
/*!40000 ALTER TABLE `quarto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_quarto`
--

DROP TABLE IF EXISTS `tipo_quarto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_quarto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` text NOT NULL,
  `valor_diaria` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_quarto`
--

LOCK TABLES `tipo_quarto` WRITE;
/*!40000 ALTER TABLE `tipo_quarto` DISABLE KEYS */;
INSERT INTO `tipo_quarto` VALUES (1,'Apartamento',600),(2,'Quarto Duplo',250),(3,'Enfermaria',150);
/*!40000 ALTER TABLE `tipo_quarto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'Atividade_02'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-29 16:48:40
