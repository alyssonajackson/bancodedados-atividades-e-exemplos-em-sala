
-- MySQL dump 10.13  Distrib 5.1.51, for Win32 (ia32)
--
-- Host: localhost    Database: clinica
-- ------------------------------------------------------
-- Server version	5.1.51-community

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
-- Table structure for table `ambulatorio`
--

DROP TABLE IF EXISTS `ambulatorio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ambulatorio` (
  `idAmbulatorio` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `andar` int(11) NOT NULL,
  `capacidade` int(11) DEFAULT NULL,
  PRIMARY KEY (`idAmbulatorio`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ambulatorio`
--

LOCK TABLES `ambulatorio` WRITE;
/*!40000 ALTER TABLE `ambulatorio` DISABLE KEYS */;
INSERT INTO `ambulatorio` VALUES (1,1,30),(2,1,30),(3,1,30),(4,1,50),(5,2,44),(6,2,28),(7,2,61),(8,3,60),(9,3,37);
/*!40000 ALTER TABLE `ambulatorio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consulta`
--

DROP TABLE IF EXISTS `consulta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consulta` (
  `idConsulta` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idMedico` int(10) unsigned NOT NULL,
  `idPaciente` int(10) unsigned NOT NULL,
  `Data` date NOT NULL,
  `Doenca` varchar(30) NOT NULL,
  PRIMARY KEY (`idConsulta`),
  KEY `idMedico` (`idMedico`),
  KEY `idPaciente` (`idPaciente`),
  CONSTRAINT `consulta_ibfk_1` FOREIGN KEY (`idMedico`) REFERENCES `medico` (`idMedico`) ON UPDATE CASCADE,
  CONSTRAINT `consulta_ibfk_2` FOREIGN KEY (`idPaciente`) REFERENCES `paciente` (`idPaciente`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consulta`
--

LOCK TABLES `consulta` WRITE;
/*!40000 ALTER TABLE `consulta` DISABLE KEYS */;
INSERT INTO `consulta` VALUES (1,1,1,'2010-11-12','fratura perna'),(2,1,4,'2010-11-13','fratura braco'),(3,2,1,'2010-11-13','traumatismo'),(4,2,2,'2010-11-13','traumatismo'),(5,2,3,'2010-11-14','traumatismo'),(6,6,4,'2010-11-14','pneumonia'),(7,4,1,'2010-10-19','consulta'),(8,5,3,'2010-11-12','enxaqueca'),(9,6,4,'2010-11-19','dor no peito'),(10,4,4,'2010-10-20','fratura braco'),(11,6,4,'2010-10-22','arritimia'),(12,5,5,'2010-11-19','enxaqueca');
/*!40000 ALTER TABLE `consulta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `funcionario` (
  `idFuncionario` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `idade` smallint(6) NOT NULL,
  `CPF` decimal(11,0) NOT NULL,
  `cidade` varchar(45) DEFAULT 'Montes Claros',
  `salario` decimal(10,0) NOT NULL,
  PRIMARY KEY (`idFuncionario`),
  UNIQUE KEY `CPF` (`CPF`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` VALUES (1,'Rita Kadilac',33,'20000100000','Montes Claros','1200'),(2,'Maria Bonita',56,'30000110000','Montes Claros','1320'),(3,'Caio Pereira',46,'41000100000','Montes Claros','1235'),(4,'Carlos Lucena',45,'51000110000','Montes Claros','1200'),(5,'Juliana Paes',34,'61000111000','Montes Claros','5500');
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medico`
--

DROP TABLE IF EXISTS `medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medico` (
  `idMedico` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `idade` smallint(6) NOT NULL,
  `especialidade` char(20) DEFAULT NULL,
  `CPF` decimal(11,0) NOT NULL,
  `cidade` varchar(45) DEFAULT 'Montes Claros',
  `idAmbulatorio` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idMedico`),
  UNIQUE KEY `CPF` (`CPF`),
  UNIQUE KEY `iCPF` (`CPF`),
  KEY `idAmbulatorio` (`idAmbulatorio`),
  CONSTRAINT `medico_ibfk_1` FOREIGN KEY (`idAmbulatorio`) REFERENCES `ambulatorio` (`idAmbulatorio`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medico`
--

LOCK TABLES `medico` WRITE;
/*!40000 ALTER TABLE `medico` DISABLE KEYS */;
INSERT INTO `medico` VALUES (1,'Tiago',40,'Ortopedia','10080100000','Montes Claros',1),(2,'Marco Aurelio',48,'Obstetricia','12345678932','Montes Claros',1),(3,'Joao',40,'Ortopedia','10000100000','Montes Claros',1),(4,'Maria',42,'Traumatologia','10000110000','Janauba',2),(5,'Pedro',51,'Pediatra','11000100000','Pirapora',2),(6,'Carlos',28,'Ortopedia','11000110000','Ipatinga',5),(7,'Marcia',33,'Neurologia','11000111000','Cataguaes',3),(8,'Renato',29,'Cardiologista','10000110001','Montes Claros',4);
/*!40000 ALTER TABLE `medico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente`
--

DROP TABLE IF EXISTS `paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paciente` (
  `idPaciente` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `idade` smallint(6) NOT NULL,
  `CPF` decimal(11,0) NOT NULL,
  `cidade` varchar(45) DEFAULT 'Montes Claros',
  PRIMARY KEY (`idPaciente`),
  UNIQUE KEY `CPF` (`CPF`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente`
--

LOCK TABLES `paciente` WRITE;
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
INSERT INTO `paciente` VALUES (1,'Ana Paula',20,'90000200000','Pirapora'),(2,'Paulo Freitas',24,'20000220000','Janauba'),(3,'Lucia Ramos',30,'22000200000','Montes Claros'),(4,'Carlos Jos‚',28,'12300110000','Montes Claros'),(5,'Maria Jos‚',60,'93785697435','Iapu');
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-11-23  9:04:01
