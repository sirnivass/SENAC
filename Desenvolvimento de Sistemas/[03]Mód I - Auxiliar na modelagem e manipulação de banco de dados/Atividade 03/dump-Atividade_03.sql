-- MariaDB dump 10.19  Distrib 10.6.16-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: Atividade_03
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
  `data` date DEFAULT NULL,
  `meidco_id` int(11) NOT NULL,
  `pacinete_id` int(11) NOT NULL,
  `convenio_id` int(11) DEFAULT NULL,
  `valor_consulta` decimal(10,2) unsigned DEFAULT NULL,
  `anamnese` text DEFAULT NULL,
  `receita` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `consulta_medico_FK` (`meidco_id`),
  KEY `consulta_convenio_FK` (`convenio_id`),
  KEY `consulta_paciente_FK` (`pacinete_id`),
  CONSTRAINT `consulta_convenio_FK` FOREIGN KEY (`convenio_id`) REFERENCES `convenio` (`id`),
  CONSTRAINT `consulta_medico_FK` FOREIGN KEY (`meidco_id`) REFERENCES `medico` (`id`),
  CONSTRAINT `consulta_paciente_FK` FOREIGN KEY (`pacinete_id`) REFERENCES `paciente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consulta`
--

LOCK TABLES `consulta` WRITE;
/*!40000 ALTER TABLE `consulta` DISABLE KEYS */;
INSERT INTO `consulta` VALUES (1,'2019-02-01',2,20,2,900.00,'Paciente Doente, tadinho....','Uns remédio BRABO e injeção na bunda.'),(2,'2019-02-01',2,20,2,900.00,'O que o pato disse para a pata?','Vem Quá!'),(3,'2020-01-01',1,5,1,500.00,'A enfermeira ao médico - Tem um homem invisível na sala de espera.','Médico:  - Diga a ele que não posso vê-lo agora.'),(4,'2018-07-17',3,3,3,500.00,'Qual é a fórmula da água benta?','R.: H Deus O!'),(5,'2018-07-17',4,4,3,999.99,' - Doutor, estou com algum problema. Eu ando esquecendo tudo muito rápido. Um minuto depois, já esqueci.',' - E quando isso começou?, perguntou o médico. - Isso o que, doutor?'),(6,'2020-06-01',5,5,4,521.00,'O condenado à morte esperava a hora da execução, quando chegou o padre: - Meu filho, vim trazer a palavra de Deus para você.','- Perda de tempo, seu padre. Daqui a pouco vou falar com Ele pessoalmente. Algum recado?'),(7,'2021-02-05',6,6,5,725.32,'Qual é a cidade brasileira que não tem táxi?','R: Uberlandia'),(8,'2021-02-05',7,7,5,1000.99,'Um rapaz vai à padaria e pergunta se o salgado era de hoje.- Não, é de ontem. Diz a atendente.','- E como faço para comer o de hoje? - Volte amanhã!'),(9,'2021-02-05',8,8,6,650.99,'O que o tijolo falou para o outro?','- Há um \"ciumento\" entre nós...'),(11,'2020-05-05',2,3,NULL,2500.00,'Paciente reclama de dor de CORNO. Fortes dores de cabeça e uma vontade de ligar para o(a) ex.','Evitar músicas como PAGODE e SERTANOJO, não assistir comédias românticas e não ingerir bebidas alcólicas perto de algum tipo de acesso para redes sociais e/ou telefones. Não se humilhe amiga...'),(12,'2020-06-05',2,3,NULL,2500.00,'Paciente da dor de CORNO voltou, não me ouviu e ligou para o bofe. Agora sente-se um lixinho por conseguir ser forte o suficiente e superar o término.','Arrume um ou uma amiga(o)(e) piriguete/putão, você precisa superar, a recomentação agora é putaria, sexo drogas e balada todos os dias. Se assim como eu você nascei na década de 80 e não aguenta mais de 20 min em pé numa festa, vá para um barzinho. Repetir o uso até esquecer o traste.');
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
  `CNPJ` varchar(14) DEFAULT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `numero_carteira` varchar(10) DEFAULT NULL,
  `tempo_de_carencia` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `convenio`
--

LOCK TABLES `convenio` WRITE;
/*!40000 ALTER TABLE `convenio` DISABLE KEYS */;
INSERT INTO `convenio` VALUES (1,'47695058023','Deixou Saudades','G01-2','1 ano'),(2,'74165373961','Sem Saúde','T77-5','6 meses'),(3,'75789797940','Missa de Sétimo Dia','I18-4','6 meses'),(4,'93910477455','Vai PraVala','R21-6','6 meses'),(5,'67402790239','Convênio TeDeixa NaMão','C12-4','1 ano'),(6,'96743136068','Pagua e nunca usa Saúde','T84-6','6 meses'),(7,'99014452097','Convenio Doente','W54-2','1 ano'),(8,'78073240220','Paciente Terminal','K49-6','6 meses'),(9,'38084267684','Idoso Paga Mais','U26-6','1 ano'),(10,'82647776067','Atalho pro Céu','B19-3','1 ano'),(11,'18574330579','Vaga da Vala','Z31-2','6 meses'),(12,'26732890971','Tirranco U Coro','R32-8','1 ano'),(13,'97935964383','TosseKe Morre','D49-1','1 ano'),(14,'83295786512','Convênio Presunto','E27-1','1 ano'),(15,'87457460990','Convênio Era Só Mais Um Silva','A13-4','1 ano'),(16,'64624926877','A Estrela Não Brilha','D27-8','6 meses'),(17,'80343460057','Abordado Pela Polícia','K14-8','6 meses'),(18,'99519042417','Tem Chifre Mas não é Corno','P92-1','1 ano'),(19,'42697666595','Terror do INSS','L91-3','1 ano');
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
  CONSTRAINT `enfermeiro_pessoa_FK` FOREIGN KEY (`pessoa_id`) REFERENCES `pessoa` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enfermeiro`
--

LOCK TABLES `enfermeiro` WRITE;
/*!40000 ALTER TABLE `enfermeiro` DISABLE KEYS */;
INSERT INTO `enfermeiro` VALUES (1,3471,43),(2,9102,38),(3,6666,32),(4,7248,37),(5,3297,40),(6,1977,39),(7,6225,41),(8,6291,39),(9,7289,40),(10,5890,46),(11,3547,41),(12,2365,47),(13,7023,34),(14,9637,30),(15,5337,31),(16,2451,37),(17,6400,43),(18,5015,40),(19,2566,36),(20,8978,42),(21,4673,33),(22,6944,40),(23,9460,44),(24,9047,32),(25,2645,43),(26,7538,46),(27,7526,30),(28,2329,39),(29,2094,38),(30,7570,41),(31,8584,36),(32,5568,34),(33,7734,43),(34,3106,39),(35,8927,45),(36,4096,47),(37,9026,48),(38,9221,34),(39,6942,37),(40,4447,32),(41,4100,37),(42,8779,45),(43,9421,47),(44,3914,31),(45,5038,30),(46,7402,33),(47,7146,37),(48,3209,40),(49,6503,37),(50,4995,41);
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
  CONSTRAINT `especialidade_medico_especialidade_FK` FOREIGN KEY (`id_especialidade`) REFERENCES `especialidade` (`id`),
  CONSTRAINT `especialidade_medico_medico_FK` FOREIGN KEY (`id_medico`) REFERENCES `medico` (`id`)
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
  `id_quartos` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `internacao_quarto_FK` (`id_quartos`),
  KEY `internacao_medico_FK` (`id_medicos`),
  KEY `internacao_paciente_FK` (`id_pacientes`),
  KEY `internacao_enfermeiro_FK` (`id_enfermeiros`),
  CONSTRAINT `internacao_enfermeiro_FK` FOREIGN KEY (`id_enfermeiros`) REFERENCES `enfermeiro` (`id`),
  CONSTRAINT `internacao_medico_FK` FOREIGN KEY (`id_medicos`) REFERENCES `medico` (`id`),
  CONSTRAINT `internacao_paciente_FK` FOREIGN KEY (`id_pacientes`) REFERENCES `paciente` (`id`),
  CONSTRAINT `internacao_quarto_FK` FOREIGN KEY (`id_quartos`) REFERENCES `quarto` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `internacao`
--

LOCK TABLES `internacao` WRITE;
/*!40000 ALTER TABLE `internacao` DISABLE KEYS */;
INSERT INTO `internacao` VALUES (1,'2017-11-28','2017-11-29','2017-11-28','Lavagem gástrica',1,10,2,5),(2,'2018-11-28','2018-09-12','2018-11-27','Remoção de molusco contagioso',1,10,3,1),(3,'2019-01-02','2019-01-15','2019-01-15',' Tratamento de unha encravada',1,5,1,4),(4,'2019-02-04','2019-02-06','2019-02-07','Lipoma',3,4,4,3),(5,'2019-04-12','2019-04-14','2019-04-14','Remoção de molusco contagioso',4,3,5,2),(6,'2020-04-20','2020-04-25','2020-04-22','Exérese de cistos, lipomas e nevos',6,7,8,6),(7,'2020-02-12','2020-02-25','2020-02-25','Exérese de cistos, lipomas e nevos',9,7,4,7),(8,'2020-02-12','2020-02-25','2020-02-15','Exérese de cistos, lipomas e nevos',9,7,4,11),(9,'2020-02-12','2020-02-25','2020-02-15','Exérese de cistos, lipomas e nevos',9,7,4,13);
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
  CONSTRAINT `internacao_enfermeiro_enfermeiro_FK` FOREIGN KEY (`id_enfermeiro`) REFERENCES `enfermeiro` (`id`),
  CONSTRAINT `internacao_enfermeiro_internacao_FK_1` FOREIGN KEY (`id_internacao`) REFERENCES `internacao` (`id`)
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
  `pessoa_id` int(11) DEFAULT NULL,
  `atividade` bit(1) NOT NULL DEFAULT b'1',
  PRIMARY KEY (`id`),
  KEY `medico_pessoa_FK` (`pessoa_id`),
  CONSTRAINT `medico_pessoa_FK` FOREIGN KEY (`pessoa_id`) REFERENCES `pessoa` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medico`
--

LOCK TABLES `medico` WRITE;
/*!40000 ALTER TABLE `medico` DISABLE KEYS */;
INSERT INTO `medico` VALUES (1,'15945','DF',1,''),(2,'69854','DF',28,''),(3,'15945','DF',1,''),(4,'35222','GO',20,''),(5,'46548','GO',8,''),(6,'19374','RJ',17,''),(7,'18146','PE',23,''),(8,'32322','RJ',12,''),(9,'64773','RJ',20,''),(10,'23896','PA',26,''),(11,'77907','SC',25,''),(12,'42132','CE',16,''),(13,'61823','MA',13,''),(14,'35634','PA',22,'\0'),(15,'60678','PE',15,''),(16,'57925','PR',14,'\0'),(17,'67448','SC',16,''),(18,'55425','PB',17,''),(19,'62114','PB',18,''),(20,'04646','PE',9,''),(21,'81877','CE',19,''),(22,'54542','PB',11,''),(23,'42855','PB',3,''),(24,'30496','PA',10,'\0'),(25,'91435','MG',27,''),(26,'77447','PE',21,''),(27,'28727','RS',24,''),(28,'24074','CE',6,''),(29,'79232','RS',9,''),(30,'04467','GO',7,'\0'),(31,'16739','PE',2,''),(32,'12396','RS',3,''),(33,'55617','BA',4,''),(34,'42890','SC',5,''),(35,'47730','PR',5,''),(36,'74364','RS',29,''),(37,'85544','CE',9,''),(38,'42989','SP',3,''),(39,'15945','DF',1,'');
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
  `convenio_id` int(11) DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `paciente_pessoa_FK` (`pessoa_id`),
  KEY `paciente_convenio_FK` (`convenio_id`),
  CONSTRAINT `paciente_convenio_FK` FOREIGN KEY (`convenio_id`) REFERENCES `convenio` (`id`),
  CONSTRAINT `paciente_pessoa_FK` FOREIGN KEY (`pessoa_id`) REFERENCES `pessoa` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente`
--

LOCK TABLES `paciente` WRITE;
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
INSERT INTO `paciente` VALUES (1,100,2),(2,69,5),(3,98,4),(4,10,13),(5,76,10),(6,69,7),(7,64,9),(8,74,1),(9,68,15),(10,70,2),(11,67,17),(12,68,4),(13,99,14),(14,53,11),(15,56,5),(16,97,6),(17,96,19),(18,78,17),(19,67,1),(20,91,16),(21,61,5),(22,96,13),(23,57,14),(24,57,10),(25,87,16),(26,68,3),(27,74,11),(28,60,19),(29,52,15),(30,53,19),(31,58,9),(32,83,9),(33,97,1),(34,97,10),(35,97,11),(36,78,14),(37,71,4),(38,62,19),(39,56,18),(40,90,14),(41,64,13),(42,73,8),(43,92,14),(44,54,2),(45,54,12),(46,85,17),(47,94,10),(48,59,18),(49,83,18),(50,80,7),(51,55,9);
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
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa`
--

LOCK TABLES `pessoa` WRITE;
/*!40000 ALTER TABLE `pessoa` DISABLE KEYS */;
INSERT INTO `pessoa` VALUES (1,'Letícia Nascimento','1986-02-01','45879654','(55) 9 5896-6974','letinasc@gmaill.com','Rua polegares, 123'),(2,'Ciara Domingos','1988-08-31','317891','(71) 9 4658-4886','at.lacus@google.com','P.O. Box 310, 2168 Nunc Rd.'),(3,'Zahir Matias','1989-08-19','25442439','(22) 9 2114-7465','tincidunt@outlook.com','Ap #297-347 Faucibus. St.'),(4,'Rosalyn Souza','1989-04-12','3841697','(62) 9 9835-4874','at.nisi.cum@hotmail.com','P.O. Box 181, 9609 Mollis Street'),(5,'Dennis Barreto','1987-10-24','32813152','(24) 9 5797-5563','dignissim.tempor@google.com','P.O. Box 958, 5082 Fames Ave'),(6,'Olympia Gonzaga','1987-11-15','158364','(84) 9 1799-1158','vel.turpis.aliquam@google.com','6617 Vehicula Road'),(7,'Kylan Rocha','1989-10-23','37808952','(26) 9 8574-7522','tempus.lorem.fringilla@icloud.com','Ap #173-2136 Et Ave'),(8,'Rhea Bento','1989-09-05','31709728','(25) 9 1539-7865','adipiscing@icloud.com','451-5112 Odio. Road'),(9,'Zeus Silveira','1989-01-13','11571157','(27) 9 4825-4254','massa.integer.vitae@hotmail.com','4675 Quam St.'),(10,'Larissa Mendonca','1988-05-07','19509103','(82) 9 8822-7132','posuere@hotmail.com','1710 Nam Rd.'),(11,'Blaze de Moraes','1989-01-09','5095875','(52) 9 3287-2148','parturient@outlook.com','189-6611 Mauris Avenue'),(12,'Victoria Correa','1988-06-17','27659775','(52) 9 6281-8244','eget.lacus@google.com','Ap #907-9833 Etiam Rd.'),(13,'Vladimir de Campos','1989-08-18','27283170','(46) 9 8443-4822','nec@icloud.com','Ap #564-5333 Non, Rd.'),(14,'John Ribeiro','1989-05-22','14578298','(76) 9 2624-6935','congue.in@google.com','P.O. Box 419, 2075 Purus Road'),(15,'Kiayada do Nascimento','1987-02-18','20390725','(88) 9 5263-5828','morbi.non@icloud.com','118-3684 Magna St.'),(16,'Curran Inacio','1987-07-16','23112424','(34) 9 4148-4892','molestie.sodales@google.com','Ap #107-3200 In St.'),(17,'Jameson Menezes','1988-09-06','957962','(22) 9 3338-6546','cras@icloud.com','P.O. Box 229, 8478 Augue Avenue'),(18,'Noelle Silva','1987-12-20','16795683','(58) 9 8647-8566','iaculis.enim@outlook.com','130-2248 Erat Rd.'),(19,'Hedda Ferreira','1987-08-31','50282966','(52) 9 2963-5345','amet.orci.ut@icloud.com','Ap #220-2034 Feugiat Ave'),(20,'Calista Macedo','1988-05-22','2775826','(27) 9 2246-7458','ullamcorper.eu@hotmail.com','P.O. Box 143, 7972 Arcu Avenue'),(21,'Shaeleigh Aparecido','1988-06-18','34661555','(35) 9 6728-8257','vestibulum.ut@google.com','144-2432 Nonummy Road'),(22,'Elmo Cruz','1988-09-12','17327859','(65) 9 4326-8259','et.malesuada@icloud.com','2768 Pede. Road'),(23,'Idona Fonseca','1987-07-16','24645525','(38) 9 7292-4532','cras.vehicula@google.com','3729 Nunc Rd.'),(24,'Ali da Luz','1989-11-19','16464828','(55) 9 5468-7731','mattis.cras@icloud.com','5467 Convallis Street'),(25,'Robin Lima','1989-08-13','39216670','(16) 9 8275-1466','sit@outlook.com','5848 Facilisis Avenue'),(26,'Amena Guimaraes','1989-10-03','6204578','(62) 9 7567-2699','facilisi.sed@google.com','7837 Diam Av.'),(27,'Hyacinth Siqueira','1989-05-13','29702747','(97) 9 8677-7576','ut@hotmail.com','Ap #451-296 Dignissim. Avenue'),(28,'Cathleen Pires','1988-01-23','17657729','(36) 9 2676-4571','adipiscing.elit@outlook.com','7134 Id, Avenue'),(29,'Dane da Silva','1987-05-09','26630920','(35) 9 7773-8285','purus@google.com','Ap #257-508 Et, Avenue'),(30,'Steel de Brito','1987-11-25','19164308','(43) 9 3788-4976','dolor.dapibus@hotmail.com','774-3253 Non St.'),(31,'Sawyer Costa','1989-02-13','12731343','(74) 9 8747-6828','morbi.accumsan.laoreet@google.com','Ap #130-2420 Aliquet Ave'),(32,'Addison Sousa','1989-11-03','10757579','(26) 9 3398-4622','dui.suspendisse@google.com','Ap #216-1508 Nec Avenue'),(33,'Roary Inacio','1988-02-27','31236613','(84) 9 2688-6825','a.sollicitudin@hotmail.com','337-4524 Ipsum Rd.'),(34,'Wayne Galdino','1989-02-02','41187762','(73) 9 1744-6362','sed.eu@google.com','677-1685 Quisque Ave'),(35,'Hermione Freitas','1987-07-02','31725204','(48) 9 3576-6282','tellus@hotmail.com','P.O. Box 594, 7141 Libero. St.'),(36,'Brody Aparecido','1988-03-02','6682648','(34) 9 5756-3542','eu.nibh@outlook.com','843-8124 Arcu. Av.'),(37,'Rahim da Rosa','1989-05-07','2529429','(52) 9 7872-5818','ipsum.suspendisse@outlook.com','Ap #608-4500 Magna Rd.'),(38,'Inez Aparecido','1987-04-30','44120484','(85) 9 8355-4378','tortor.dictum@outlook.com','Ap #221-7776 Vitae, Avenue'),(39,'Keaton Maciel','1988-12-24','38842748','(37) 9 2787-5538','sem.elit.pharetra@outlook.com','Ap #603-2053 At Rd.'),(40,'Melissa Faria','1987-12-14','3888171','(66) 9 8748-6713','non.enim.mauris@icloud.com','Ap #700-9911 Non, Street'),(41,'Gisela Das Dores','1988-01-27','29475583','(42) 9 1246-7385','justo@google.com','456-8736 Ac, Road'),(42,'Skyler Gonçalves','1988-08-21','13411985','(21) 9 4312-1222','interdum@icloud.com','9714 Sodales Rd.'),(43,'Dexter Firmino','1987-02-19','11574147','(17) 9 2431-1534','scelerisque@google.com','Ap #702-1492 Mi Road'),(44,'Inga Braga','1988-12-23','28452430','(66) 9 4529-5732','ultrices.mauris@hotmail.com','5408 Vel Rd.'),(45,'Ariel de Abreu','1988-11-09','44122549','(62) 9 3215-7719','suspendisse@outlook.com','4342 Id, Road'),(46,'Carissa Antunes','1987-06-14','14434568','(38) 9 2187-5321','sed.eu@google.com','Ap #754-4966 Elit Avenue'),(47,'Ira Freitas','1988-10-31','13192454','(25) 9 4582-2876','velit.pellentesque.ultricies@icloud.com','Ap #949-4445 Interdum Rd.'),(48,'Gannon de Brito','1989-07-20','22383104','(42) 9 2227-3727','praesent@hotmail.com','Ap #615-8972 A, Road'),(49,'Delilah Das Gracas','1989-04-24','39438825','(88) 9 3945-7156','risus.in.mi@icloud.com','Ap #715-5394 Consectetuer Road'),(50,'Jaime Cavalcante','1988-06-11','18365411','(73) 9 2667-5243','etiam.imperdiet@icloud.com','3907 Ornare. Ave'),(51,'Garrison Matos','1988-03-07','24468374','(23) 9 8832-6581','magna.duis.dignissim@icloud.com','314-9570 Sem. Road'),(52,'Andrew da Conceiçao','1987-02-02','29933855','(26) 9 4479-6729','semper.dui.lectus@icloud.com','Ap #479-4063 Sed Street'),(53,'Faith Medeiros','1989-10-04','12245579','(76) 9 3818-9246','dolor.donec@google.com','117-6940 Quisque Rd.'),(54,'Sebastian Paulino','1987-09-19','42714831','(36) 9 4842-7844','senectus.et@google.com','329-3215 Fames Street'),(55,'Hadley Nunes','1987-05-25','10308307','(59) 9 9396-8449','odio.aliquam.vulputate@icloud.com','Ap #603-5799 Torquent Av.'),(56,'Orlando Nascimento','1988-10-09','6527370','(85) 9 2233-4862','est.tempor@outlook.com','Ap #560-7458 Proin St.'),(57,'Lacota Santos','1987-03-13','34762493','(79) 9 5637-7293','a@hotmail.com','Ap #749-1515 Ipsum Rd.'),(58,'Ira Matos','1989-09-24','44540562','(75) 9 2393-1552','consequat@google.com','P.O. Box 683, 1545 Neque. St.'),(59,'Chase de Almeida','1987-04-05','2466042','(58) 9 6646-7859','auctor.nunc@outlook.com','Ap #474-7551 Tellus Road'),(60,'Ariana Mendes','1988-01-27','29299791','(36) 9 8882-3156','luctus.lobortis.class@outlook.com','367-1065 Nunc St.'),(61,'Raja Bastos','1988-05-29','36871645','(48) 9 4594-3843','quisque.ornare.tortor@google.com','Ap #944-5770 Bibendum Street'),(62,'Christopher Macedo','1989-02-18','4574860','(26) 9 6366-5236','purus@outlook.com','9523 Dignissim. Street'),(63,'Neville do Nascimento','1988-02-11','44582424','(78) 9 7441-2536','sagittis.placerat@google.com','Ap #746-1345 Sit Rd.'),(64,'Shannon Messias','1988-11-13','22363891','(96) 9 5692-4238','egestas.urna.justo@google.com','724-6434 At, St.'),(65,'Julian Leal','1988-10-11','37437507','(86) 9 5633-9258','ornare@icloud.com','Ap #339-8665 Cursus Road'),(66,'Hashim de Matos','1988-02-14','50272755','(78) 9 4839-7527','amet.ante@outlook.com','Ap #801-2799 A Road'),(67,'Nash Rocha','1989-07-04','46586169','(41) 9 7242-5112','molestie.sed@icloud.com','949-2963 Proin Avenue'),(68,'Samuel Matias','1988-07-30','196683','(88) 9 2144-7316','aptent.taciti@icloud.com','Ap #797-1465 Eu Rd.'),(69,'Scarlet Abreu','1987-09-28','3592912','(23) 9 2527-5574','ut@outlook.com','P.O. Box 367, 2432 Aptent Av.'),(70,'Anjolie Siqueira','1987-08-08','40450991','(56) 9 1678-3644','sagittis.nullam@icloud.com','459-8158 Eget Ave'),(71,'Macy Silveira','1987-06-16','6604441','(54) 9 8345-9248','consectetuer@google.com','P.O. Box 679, 3116 Laoreet Street'),(72,'Branden Das Gracas','1989-11-29','30607525','(14) 9 3928-5178','aliquam.tincidunt.nunc@icloud.com','870-5024 Consectetuer Avenue'),(73,'Tobias Bento','1988-11-16','1885658','(76) 9 6792-6321','proin.vel@outlook.com','819-1293 Ut Av.'),(74,'Francesca da Rocha','1988-02-24','23242221','(16) 9 3235-4777','phasellus.vitae@outlook.com','Ap #854-2378 Neque Rd.'),(75,'Zachery de Araujo','1987-09-16','2696399','(49) 9 2482-8568','nibh@hotmail.com','157-2388 A, Road'),(76,'Piper Pinheiro','1988-12-02','37801533','(28) 9 6871-5562','enim@hotmail.com','P.O. Box 717, 3558 Ut St.'),(77,'Christine Firmino','1988-08-23','31615476','(37) 9 3569-5572','lorem.lorem@outlook.com','Ap #675-6585 Mollis St.'),(78,'Mara Marques','1987-10-24','2045874','(55) 9 8332-6474','ornare@outlook.com','593-1584 Ornare. St.'),(79,'Nathaniel Martins','1989-07-30','29274634','(47) 9 7425-6225','metus.aenean.sed@hotmail.com','358-1436 Porttitor St.'),(80,'Geoffrey Inacio','1987-04-22','17358505','(88) 9 9349-5349','dolor.quam.elementum@hotmail.com','616-4045 Pede Rd.'),(81,'Duncan Galdino','1989-09-14','1470953','(45) 9 6917-7878','ullamcorper.nisl.arcu@google.com','838-6357 Urna. Ave'),(82,'Zachery Figueiredo','1988-11-29','42506492','(45) 9 8115-7637','eget.ipsum@outlook.com','Ap #772-2786 Curabitur Avenue'),(83,'Benjamin Monteiro','1989-02-16','21302697','(88) 9 7757-7662','in@google.com','Ap #561-4870 Lacinia Avenue'),(84,'Dillon Macedo','1989-09-07','30548371','(79) 9 8257-2714','enim.mauris@icloud.com','1126 Odio St.'),(85,'Kenyon Bastos','1988-05-11','12810379','(35) 9 2172-4932','vitae.diam.proin@hotmail.com','191-7092 Lectus. Road'),(86,'Jael Diniz','1989-11-04','31583666','(81) 9 7541-6826','interdum.feugiat.sed@hotmail.com','Ap #792-7304 Magna. Ave'),(87,'William Maciel','1989-01-12','3566358','(14) 9 5597-2457','vel.lectus.cum@outlook.com','398-5288 Non Avenue'),(88,'Quail Amorim','1987-07-20','13689200','(92) 9 5778-5861','orci.adipiscing@icloud.com','198-8816 Nisi. Street'),(89,'Lars Feitosa','1988-09-16','50923608','(61) 9 2517-2355','integer.v11itae@outlook.com','Ap #411-7830 Felis, St.'),(90,'Hilary Aparecido','1988-07-19','10879938','(48) 9 7883-2731','magna.et.ipsum@hotmail.com','141-2800 Commodo Ave'),(91,'Claudia Abreu','1988-08-16','23956214','(34) 9 8676-7785','nec@outlook.com','8077 Auctor Street'),(92,'Drake Maia','1989-11-15','11321412','(94) 9 3465-8949','lorem.tristique@google.com','5269 Lacus. St.'),(93,'Tashya Almeida','1989-03-12','14979302','(61) 9 4393-3885','sociis.natoque.penatibus@hotmail.com','750-7179 Sed Ave'),(94,'Harper Camargo','1989-09-14','47135990','(37) 9 3839-2825','erat.neque.non@hotmail.com','Ap #268-6406 Ac, St.'),(95,'Madeline Fagundes','1989-01-19','30650943','(76) 9 5382-4544','enim@outlook.com','Ap #659-1407 Lorem. Street'),(96,'Skyler Barboza','1987-01-22','22144494','(58) 9 6744-5676','et.rutrum@outlook.com','P.O. Box 722, 9175 Sit Road'),(97,'Ginger Macedo','1988-06-04','35805912','(46) 9 6323-8777','quis.pede@icloud.com','488-729 Augue Avenue'),(98,'Ulysses Das Chagas','1987-08-19','47982532','(45) 9 7145-1928','imperdiet@icloud.com','P.O. Box 471, 111 Sed Rd.'),(99,'Dale Paulino','1989-04-02','1073392','(73) 9 3536-7964','magna.tellus.faucibus@google.com','Ap #549-6791 Magnis St.'),(100,'Paki Rezende','1987-01-25','22866559','(52) 9 1782-3378','duis.dignissim.tempor@icloud.com','P.O. Box 639, 7537 In Rd.'),(101,'Chastity dos Reis','1987-04-14','48478389','(61) 9 5712-2214','facilisis.facilisis@google.com','P.O. Box 238, 6081 Primis Street');
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
  CONSTRAINT `quarto_tipo_quarto_FK` FOREIGN KEY (`id_tipo_quarto`) REFERENCES `tipo_quarto` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quarto`
--

LOCK TABLES `quarto` WRITE;
/*!40000 ALTER TABLE `quarto` DISABLE KEYS */;
INSERT INTO `quarto` VALUES (1,101,1),(2,102,1),(3,103,1),(4,104,1),(5,105,1),(6,201,2),(7,202,2),(8,203,2),(9,204,2),(10,205,2),(11,301,3),(12,302,3),(13,303,3),(14,304,3),(15,305,3);
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
-- Dumping routines for database 'Atividade_03'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-01  3:20:02
