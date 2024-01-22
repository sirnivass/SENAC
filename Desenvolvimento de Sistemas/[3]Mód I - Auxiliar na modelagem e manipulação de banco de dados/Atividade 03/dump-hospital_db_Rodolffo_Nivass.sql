-- MariaDB dump 10.19  Distrib 10.6.12-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: hospital_db_Rodolffo_Nivass
-- ------------------------------------------------------
-- Server version	10.6.12-MariaDB-0ubuntu0.22.04.1

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
  `meidco_id` int(11) NOT NULL,
  `pacinete_id` int(11) NOT NULL,
  `convenio_id` int(11) DEFAULT NULL,
  `valor_consulta` double DEFAULT NULL,
  `anamnese` text DEFAULT NULL,
  `receita` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `consulta_medico_FK` (`meidco_id`),
  KEY `consulta_convenio_FK` (`convenio_id`),
  KEY `consulta_paciente_FK` (`pacinete_id`),
  CONSTRAINT `consulta_convenio_FK` FOREIGN KEY (`convenio_id`) REFERENCES `convenio` (`id`) ON UPDATE CASCADE,
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
) ENGINE=InnoDB AUTO_INCREMENT=225 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especialidade`
--

LOCK TABLES `especialidade` WRITE;
/*!40000 ALTER TABLE `especialidade` DISABLE KEYS */;
INSERT INTO `especialidade` VALUES (170,'Acupuntura'),(171,'Alergia e Imunologia'),(172,'Anestesiologia'),(173,'Angiologia'),(174,'Cardiologia'),(175,'Cirurgia Cardiovascular'),(176,'Cirurgia da Mão'),(177,'Cirurgia de Cabeça e Pescoço'),(178,'Cirurgia do Aparelho Digestivo'),(179,'Cirurgia Geral'),(180,'Cirurgia Oncológica'),(181,'Cirurgia Pediátrica'),(182,'Cirurgia Plástica'),(183,'Cirurgia Torácica'),(184,'Cirurgia Vascular'),(185,'Clínica Médica'),(186,'Coloproctologia'),(187,'Dermatologia'),(188,'Endocrinologia e Metabologia'),(189,'Endoscopia'),(190,'Gastroenterologia'),(191,'Genética Médica'),(192,'Geriatria'),(193,'Ginecologia e Obstetrícia'),(194,'Hematologia e Hemoterapia'),(195,'Homeopatia'),(196,'Infectologia'),(197,'Mastologia'),(198,'Medicina de Emergência'),(199,'Medicina de Família e Comunidade'),(200,'Medicina do Trabalho'),(201,'Medicina de Tráfego'),(202,'Medicina Esportiva'),(203,'Medicina Física e Reabilitação'),(204,'Medicina Intensiva'),(205,'Medicina Legal e Perícia Médica'),(206,'Medicina Nuclear'),(207,'Medicina Preventiva e Social'),(208,'Nefrologia'),(209,'Neurocirurgia'),(210,'Neurologia'),(211,'Nutrologia'),(212,'Oftalmologia'),(213,'Oncologia Clínica'),(214,'Ortopedia e Traumatologia'),(215,'Otorrinolaringologia'),(216,'Patologia'),(217,'Patologia Clínica/ Medicina Laboratorial'),(218,'Pediatria'),(219,'Pneumologia'),(220,'Psiquiatria'),(221,'Radiologia e Diagnóstico por Imagem'),(222,'Radioterapia'),(223,'Reumatologia'),(224,'Urologia');
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
  `id_medico` int(11) DEFAULT NULL,
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
  KEY `internacao_quarto_FK` (`in_quartos`),
  KEY `internacao_medico_FK` (`id_medicos`),
  KEY `internacao_paciente_FK` (`id_pacientes`),
  KEY `internacao_enfermeiro_FK` (`id_enfermeiros`),
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
  KEY `internacao_enfermeiro_enfermeiro_FK` (`id_enfermeiro`),
  KEY `internacao_enfermeiro_internacao_FK_1` (`id_internacao`),
  CONSTRAINT `internacao_enfermeiro_enfermeiro_FK` FOREIGN KEY (`id_enfermeiro`) REFERENCES `enfermeiro` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `internacao_enfermeiro_internacao_FK_1` FOREIGN KEY (`id_internacao`) REFERENCES `internacao` (`id`) ON UPDATE CASCADE
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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medico`
--

LOCK TABLES `medico` WRITE;
/*!40000 ALTER TABLE `medico` DISABLE KEYS */;
INSERT INTO `medico` VALUES (1,'15945','DF',200,1),(2,'15945','DF',185,28),(3,'15945','DF',212,1),(4,'35222','GO',223,20),(5,'46548','GO',222,8),(6,'19374','RJ',209,17),(7,'18146','PE',191,23),(8,'32322','RJ',201,12),(9,'64773','RJ',199,20),(10,'23896','PA',195,26),(11,'77907','SC',224,25),(12,'42132','CE',215,16),(13,'61823','MA',192,13),(14,'35634','PA',214,22),(15,'60678','PE',183,15),(16,'57925','PR',181,14),(17,'67448','SC',185,16),(18,'55425','PB',177,17),(19,'62114','PB',184,18),(20,'04646','PE',189,9),(21,'81877','CE',204,19),(22,'54542','PB',185,11),(23,'42855','PB',214,3),(24,'30496','PA',218,10),(25,'91435','MG',191,27),(26,'77447','PE',212,21),(27,'28727','RS',190,24),(28,'24074','CE',179,6),(29,'79232','RS',195,9),(30,'04467','GO',184,7),(31,'16739','PE',188,2),(32,'12396','RS',215,3),(33,'55617','BA',205,4),(34,'42890','SC',198,5),(35,'47730','PR',196,5),(36,'74364','RS',214,29),(37,'85544','CE',205,9),(38,'42989','SP',171,3);
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
  CONSTRAINT `paciente_pessoa_FK` FOREIGN KEY (`pessoa_id`) REFERENCES `pessoa` (`id`)
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
  `cpf` varchar(30) NOT NULL,
  `telefone` varchar(25) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=702 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa`
--

LOCK TABLES `pessoa` WRITE;
/*!40000 ALTER TABLE `pessoa` DISABLE KEYS */;
INSERT INTO `pessoa` VALUES (1,'Letícia Nascimento','1986-02-01','45879654','(55) 9 5896-6974','letinasc@gmaill.com','Rua polegares, 123'),(2,'Ciara Domingos','1988-08-31','317891','(71) 9 4658-4886','at.lacus@google.com','P.O. Box 310, 2168 Nunc Rd.'),(3,'Zahir Matias','1989-08-19','25442439','(22) 9 2114-7465','tincidunt@outlook.com','Ap #297-347 Faucibus. St.'),(4,'Rosalyn Souza','1989-04-12','3841697','(62) 9 9835-4874','at.nisi.cum@hotmail.com','P.O. Box 181, 9609 Mollis Street'),(5,'Dennis Barreto','1987-10-24','32813152','(24) 9 5797-5563','dignissim.tempor@google.com','P.O. Box 958, 5082 Fames Ave'),(6,'Olympia Gonzaga','1987-11-15','158364','(84) 9 1799-1158','vel.turpis.aliquam@google.com','6617 Vehicula Road'),(7,'Kylan Rocha','1989-10-23','37808952','(26) 9 8574-7522','tempus.lorem.fringilla@icloud.com','Ap #173-2136 Et Ave'),(8,'Rhea Bento','1989-09-05','31709728','(25) 9 1539-7865','adipiscing@icloud.com','451-5112 Odio. Road'),(9,'Zeus Silveira','1989-01-13','11571157','(27) 9 4825-4254','massa.integer.vitae@hotmail.com','4675 Quam St.'),(10,'Larissa Mendonca','1988-05-07','19509103','(82) 9 8822-7132','posuere@hotmail.com','1710 Nam Rd.'),(11,'Blaze de Moraes','1989-01-09','5095875','(52) 9 3287-2148','parturient@outlook.com','189-6611 Mauris Avenue'),(12,'Victoria Correa','1988-06-17','27659775','(52) 9 6281-8244','eget.lacus@google.com','Ap #907-9833 Etiam Rd.'),(13,'Vladimir de Campos','1989-08-18','27283170','(46) 9 8443-4822','nec@icloud.com','Ap #564-5333 Non, Rd.'),(14,'John Ribeiro','1989-05-22','14578298','(76) 9 2624-6935','congue.in@google.com','P.O. Box 419, 2075 Purus Road'),(15,'Kiayada do Nascimento','1987-02-18','20390725','(88) 9 5263-5828','morbi.non@icloud.com','118-3684 Magna St.'),(16,'Curran Inacio','1987-07-16','23112424','(34) 9 4148-4892','molestie.sodales@google.com','Ap #107-3200 In St.'),(17,'Jameson Menezes','1988-09-06','957962','(22) 9 3338-6546','cras@icloud.com','P.O. Box 229, 8478 Augue Avenue'),(18,'Noelle Silva','1987-12-20','16795683','(58) 9 8647-8566','iaculis.enim@outlook.com','130-2248 Erat Rd.'),(19,'Hedda Ferreira','1987-08-31','50282966','(52) 9 2963-5345','amet.orci.ut@icloud.com','Ap #220-2034 Feugiat Ave'),(20,'Calista Macedo','1988-05-22','2775826','(27) 9 2246-7458','ullamcorper.eu@hotmail.com','P.O. Box 143, 7972 Arcu Avenue'),(21,'Shaeleigh Aparecido','1988-06-18','34661555','(35) 9 6728-8257','vestibulum.ut@google.com','144-2432 Nonummy Road'),(22,'Elmo Cruz','1988-09-12','17327859','(65) 9 4326-8259','et.malesuada@icloud.com','2768 Pede. Road'),(23,'Idona Fonseca','1987-07-16','24645525','(38) 9 7292-4532','cras.vehicula@google.com','3729 Nunc Rd.'),(24,'Ali da Luz','1989-11-19','16464828','(55) 9 5468-7731','mattis.cras@icloud.com','5467 Convallis Street'),(25,'Robin Lima','1989-08-13','39216670','(16) 9 8275-1466','sit@outlook.com','5848 Facilisis Avenue'),(26,'Amena Guimaraes','1989-10-03','6204578','(62) 9 7567-2699','facilisi.sed@google.com','7837 Diam Av.'),(27,'Hyacinth Siqueira','1989-05-13','29702747','(97) 9 8677-7576','ut@hotmail.com','Ap #451-296 Dignissim. Avenue'),(28,'Cathleen Pires','1988-01-23','17657729','(36) 9 2676-4571','adipiscing.elit@outlook.com','7134 Id, Avenue'),(29,'Dane da Silva','1987-05-09','26630920','(35) 9 7773-8285','purus@google.com','Ap #257-508 Et, Avenue'),(30,'Steel de Brito','1987-11-25','19164308','(43) 9 3788-4976','dolor.dapibus@hotmail.com','774-3253 Non St.'),(31,'Sawyer Costa','1989-02-13','12731343','(74) 9 8747-6828','morbi.accumsan.laoreet@google.com','Ap #130-2420 Aliquet Ave'),(32,'Addison Sousa','1989-11-03','10757579','(26) 9 3398-4622','dui.suspendisse@google.com','Ap #216-1508 Nec Avenue'),(33,'Roary Inacio','1988-02-27','31236613','(84) 9 2688-6825','a.sollicitudin@hotmail.com','337-4524 Ipsum Rd.'),(34,'Wayne Galdino','1989-02-02','41187762','(73) 9 1744-6362','sed.eu@google.com','677-1685 Quisque Ave'),(35,'Hermione Freitas','1987-07-02','31725204','(48) 9 3576-6282','tellus@hotmail.com','P.O. Box 594, 7141 Libero. St.'),(36,'Brody Aparecido','1988-03-02','6682648','(34) 9 5756-3542','eu.nibh@outlook.com','843-8124 Arcu. Av.'),(37,'Rahim da Rosa','1989-05-07','2529429','(52) 9 7872-5818','ipsum.suspendisse@outlook.com','Ap #608-4500 Magna Rd.'),(38,'Inez Aparecido','1987-04-30','44120484','(85) 9 8355-4378','tortor.dictum@outlook.com','Ap #221-7776 Vitae, Avenue'),(39,'Keaton Maciel','1988-12-24','38842748','(37) 9 2787-5538','sem.elit.pharetra@outlook.com','Ap #603-2053 At Rd.'),(40,'Melissa Faria','1987-12-14','3888171','(66) 9 8748-6713','non.enim.mauris@icloud.com','Ap #700-9911 Non, Street'),(41,'Gisela Das Dores','1988-01-27','29475583','(42) 9 1246-7385','justo@google.com','456-8736 Ac, Road'),(42,'Skyler Gonçalves','1988-08-21','13411985','(21) 9 4312-1222','interdum@icloud.com','9714 Sodales Rd.'),(43,'Dexter Firmino','1987-02-19','11574147','(17) 9 2431-1534','scelerisque@google.com','Ap #702-1492 Mi Road'),(44,'Inga Braga','1988-12-23','28452430','(66) 9 4529-5732','ultrices.mauris@hotmail.com','5408 Vel Rd.'),(45,'Ariel de Abreu','1988-11-09','44122549','(62) 9 3215-7719','suspendisse@outlook.com','4342 Id, Road'),(46,'Carissa Antunes','1987-06-14','14434568','(38) 9 2187-5321','sed.eu@google.com','Ap #754-4966 Elit Avenue'),(47,'Ira Freitas','1988-10-31','13192454','(25) 9 4582-2876','velit.pellentesque.ultricies@icloud.com','Ap #949-4445 Interdum Rd.'),(48,'Gannon de Brito','1989-07-20','22383104','(42) 9 2227-3727','praesent@hotmail.com','Ap #615-8972 A, Road'),(49,'Delilah Das Gracas','1989-04-24','39438825','(88) 9 3945-7156','risus.in.mi@icloud.com','Ap #715-5394 Consectetuer Road'),(50,'Jaime Cavalcante','1988-06-11','18365411','(73) 9 2667-5243','etiam.imperdiet@icloud.com','3907 Ornare. Ave'),(51,'Garrison Matos','1988-03-07','24468374','(23) 9 8832-6581','magna.duis.dignissim@icloud.com','314-9570 Sem. Road'),(52,'Andrew da Conceiçao','1987-02-02','29933855','(26) 9 4479-6729','semper.dui.lectus@icloud.com','Ap #479-4063 Sed Street'),(53,'Faith Medeiros','1989-10-04','12245579','(76) 9 3818-9246','dolor.donec@google.com','117-6940 Quisque Rd.'),(54,'Sebastian Paulino','1987-09-19','42714831','(36) 9 4842-7844','senectus.et@google.com','329-3215 Fames Street'),(55,'Hadley Nunes','1987-05-25','10308307','(59) 9 9396-8449','odio.aliquam.vulputate@icloud.com','Ap #603-5799 Torquent Av.'),(56,'Orlando Nascimento','1988-10-09','6527370','(85) 9 2233-4862','est.tempor@outlook.com','Ap #560-7458 Proin St.'),(57,'Lacota Santos','1987-03-13','34762493','(79) 9 5637-7293','a@hotmail.com','Ap #749-1515 Ipsum Rd.'),(58,'Ira Matos','1989-09-24','44540562','(75) 9 2393-1552','consequat@google.com','P.O. Box 683, 1545 Neque. St.'),(59,'Chase de Almeida','1987-04-05','2466042','(58) 9 6646-7859','auctor.nunc@outlook.com','Ap #474-7551 Tellus Road'),(60,'Ariana Mendes','1988-01-27','29299791','(36) 9 8882-3156','luctus.lobortis.class@outlook.com','367-1065 Nunc St.'),(61,'Raja Bastos','1988-05-29','36871645','(48) 9 4594-3843','quisque.ornare.tortor@google.com','Ap #944-5770 Bibendum Street'),(62,'Christopher Macedo','1989-02-18','4574860','(26) 9 6366-5236','purus@outlook.com','9523 Dignissim. Street'),(63,'Neville do Nascimento','1988-02-11','44582424','(78) 9 7441-2536','sagittis.placerat@google.com','Ap #746-1345 Sit Rd.'),(64,'Shannon Messias','1988-11-13','22363891','(96) 9 5692-4238','egestas.urna.justo@google.com','724-6434 At, St.'),(65,'Julian Leal','1988-10-11','37437507','(86) 9 5633-9258','ornare@icloud.com','Ap #339-8665 Cursus Road'),(66,'Hashim de Matos','1988-02-14','50272755','(78) 9 4839-7527','amet.ante@outlook.com','Ap #801-2799 A Road'),(67,'Nash Rocha','1989-07-04','46586169','(41) 9 7242-5112','molestie.sed@icloud.com','949-2963 Proin Avenue'),(68,'Samuel Matias','1988-07-30','196683','(88) 9 2144-7316','aptent.taciti@icloud.com','Ap #797-1465 Eu Rd.'),(69,'Scarlet Abreu','1987-09-28','3592912','(23) 9 2527-5574','ut@outlook.com','P.O. Box 367, 2432 Aptent Av.'),(70,'Anjolie Siqueira','1987-08-08','40450991','(56) 9 1678-3644','sagittis.nullam@icloud.com','459-8158 Eget Ave'),(71,'Macy Silveira','1987-06-16','6604441','(54) 9 8345-9248','consectetuer@google.com','P.O. Box 679, 3116 Laoreet Street'),(72,'Branden Das Gracas','1989-11-29','30607525','(14) 9 3928-5178','aliquam.tincidunt.nunc@icloud.com','870-5024 Consectetuer Avenue'),(73,'Tobias Bento','1988-11-16','1885658','(76) 9 6792-6321','proin.vel@outlook.com','819-1293 Ut Av.'),(74,'Francesca da Rocha','1988-02-24','23242221','(16) 9 3235-4777','phasellus.vitae@outlook.com','Ap #854-2378 Neque Rd.'),(75,'Zachery de Araujo','1987-09-16','2696399','(49) 9 2482-8568','nibh@hotmail.com','157-2388 A, Road'),(76,'Piper Pinheiro','1988-12-02','37801533','(28) 9 6871-5562','enim@hotmail.com','P.O. Box 717, 3558 Ut St.'),(77,'Christine Firmino','1988-08-23','31615476','(37) 9 3569-5572','lorem.lorem@outlook.com','Ap #675-6585 Mollis St.'),(78,'Mara Marques','1987-10-24','2045874','(55) 9 8332-6474','ornare@outlook.com','593-1584 Ornare. St.'),(79,'Nathaniel Martins','1989-07-30','29274634','(47) 9 7425-6225','metus.aenean.sed@hotmail.com','358-1436 Porttitor St.'),(80,'Geoffrey Inacio','1987-04-22','17358505','(88) 9 9349-5349','dolor.quam.elementum@hotmail.com','616-4045 Pede Rd.'),(81,'Duncan Galdino','1989-09-14','1470953','(45) 9 6917-7878','ullamcorper.nisl.arcu@google.com','838-6357 Urna. Ave'),(82,'Zachery Figueiredo','1988-11-29','42506492','(45) 9 8115-7637','eget.ipsum@outlook.com','Ap #772-2786 Curabitur Avenue'),(83,'Benjamin Monteiro','1989-02-16','21302697','(88) 9 7757-7662','in@google.com','Ap #561-4870 Lacinia Avenue'),(84,'Dillon Macedo','1989-09-07','30548371','(79) 9 8257-2714','enim.mauris@icloud.com','1126 Odio St.'),(85,'Kenyon Bastos','1988-05-11','12810379','(35) 9 2172-4932','vitae.diam.proin@hotmail.com','191-7092 Lectus. Road'),(86,'Jael Diniz','1989-11-04','31583666','(81) 9 7541-6826','interdum.feugiat.sed@hotmail.com','Ap #792-7304 Magna. Ave'),(87,'William Maciel','1989-01-12','3566358','(14) 9 5597-2457','vel.lectus.cum@outlook.com','398-5288 Non Avenue'),(88,'Quail Amorim','1987-07-20','13689200','(92) 9 5778-5861','orci.adipiscing@icloud.com','198-8816 Nisi. Street'),(89,'Lars Feitosa','1988-09-16','50923608','(61) 9 2517-2355','integer.vitae@outlook.com','Ap #411-7830 Felis, St.'),(90,'Hilary Aparecido','1988-07-19','10879938','(48) 9 7883-2731','magna.et.ipsum@hotmail.com','141-2800 Commodo Ave'),(91,'Claudia Abreu','1988-08-16','23956214','(34) 9 8676-7785','nec@outlook.com','8077 Auctor Street'),(92,'Drake Maia','1989-11-15','11321412','(94) 9 3465-8949','lorem.tristique@google.com','5269 Lacus. St.'),(93,'Tashya Almeida','1989-03-12','14979302','(61) 9 4393-3885','sociis.natoque.penatibus@hotmail.com','750-7179 Sed Ave'),(94,'Harper Camargo','1989-09-14','47135990','(37) 9 3839-2825','erat.neque.non@hotmail.com','Ap #268-6406 Ac, St.'),(95,'Madeline Fagundes','1989-01-19','30650943','(76) 9 5382-4544','enim@outlook.com','Ap #659-1407 Lorem. Street'),(96,'Skyler Barboza','1987-01-22','22144494','(58) 9 6744-5676','et.rutrum@outlook.com','P.O. Box 722, 9175 Sit Road'),(97,'Ginger Macedo','1988-06-04','35805912','(46) 9 6323-8777','quis.pede@icloud.com','488-729 Augue Avenue'),(98,'Ulysses Das Chagas','1987-08-19','47982532','(45) 9 7145-1928','imperdiet@icloud.com','P.O. Box 471, 111 Sed Rd.'),(99,'Dale Paulino','1989-04-02','1073392','(73) 9 3536-7964','magna.tellus.faucibus@google.com','Ap #549-6791 Magnis St.'),(100,'Paki Rezende','1987-01-25','22866559','(52) 9 1782-3378','duis.dignissim.tempor@icloud.com','P.O. Box 639, 7537 In Rd.'),(101,'Chastity dos Reis','1987-04-14','48478389','(61) 9 5712-2214','facilisis.facilisis@google.com','P.O. Box 238, 6081 Primis Street');
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
-- Dumping routines for database 'hospital_db_Rodolffo_Nivass'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-22  2:22:14
