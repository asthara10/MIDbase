-- MySQL dump 10.13  Distrib 5.7.21, for Linux (x86_64)
--
-- Host: localhost    Database: miod
-- ------------------------------------------------------
-- Server version	5.7.21-0ubuntu0.16.04.1

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

-- -----------------------------------------------------
-- Schema miod
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `miod` DEFAULT CHARACTER SET utf8 ;
USE `miod` ;

--
-- Table structure for table `Chromosome`
--

DROP TABLE IF EXISTS `Chromosome`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Chromosome` (
  `idChromosome` int(11) NOT NULL,
  `Chromosome` varchar(45) DEFAULT NULL,
  `Strand` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idChromosome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Chromosome`
--

LOCK TABLES `Chromosome` WRITE;
/*!40000 ALTER TABLE `Chromosome` DISABLE KEYS */;
INSERT INTO `Chromosome` VALUES (1,'5','+'),(2,'22','+'),(3,'19','+'),(4,'20','+'),(5,'3','+'),(6,'4','+'),(7,'14','+'),(8,'X','+'),(9,'6','+'),(10,'17','+'),(11,'9','+'),(12,'2','+'),(13,'10','+'),(14,'15','+'),(15,'12','+'),(16,'16','+'),(17,'7','+'),(18,'1','+'),(19,'8','+'),(20,'11','+'),(21,'21','+'),(22,'18','+'),(23,'13','+'),(24,'Y','+'),(25,'5','-'),(26,'22','-'),(27,'19','-'),(28,'20','-'),(29,'3','-'),(30,'4','-'),(31,'14','-'),(32,'X','-'),(33,'6','-'),(34,'17','-'),(35,'9','-'),(36,'2','-'),(37,'10','-'),(38,'15','-'),(39,'12','-'),(40,'16','-'),(41,'7','-'),(42,'1','-'),(43,'8','-'),(44,'11','-'),(45,'21','-'),(46,'18','-'),(47,'13','-'),(48,'Y','-');
/*!40000 ALTER TABLE `Chromosome` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ClinicalSignificance`
--

DROP TABLE IF EXISTS `ClinicalSignificance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ClinicalSignificance` (
  `idClinicalSignificance` int(11) NOT NULL,
  `Value` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idClinicalSignificance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ClinicalSignificance`
--

LOCK TABLES `ClinicalSignificance` WRITE;
/*!40000 ALTER TABLE `ClinicalSignificance` DISABLE KEYS */;
INSERT INTO `ClinicalSignificance` VALUES (1,'-'),(2,'benign'),(3,'likely_benign'),(4,'association'),(5,'sensitivity'),(6,'drug_res'),(7,'protective'),(8,'risk'),(9,'likely_pathogenic'),(10,'pathogenic'),(11,'uncertain'),(12,'other');
/*!40000 ALTER TABLE `ClinicalSignificance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Disease`
--

DROP TABLE IF EXISTS `Disease`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Disease` (
  `idDisease` int(11) NOT NULL,
  `DiseaseName` varchar(45) DEFAULT NULL,
  `idMIM` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idDisease`),
  FULLTEXT KEY `FullText` (`DiseaseName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Disease`
--

LOCK TABLES `Disease` WRITE;
/*!40000 ALTER TABLE `Disease` DISABLE KEYS */;
INSERT INTO `Disease` VALUES (1,'-','-'),(2,'ZELLWEGER SYNDROME','-');
/*!40000 ALTER TABLE `Disease` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Gene`
--

DROP TABLE IF EXISTS `Gene`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Gene` (
  `idGene` int(11) NOT NULL AUTO_INCREMENT,
  `GeneName` varchar(45) DEFAULT NULL,
  `idENSEMBL` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idGene`),
  FULLTEXT KEY `FullText` (`GeneName`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Gene`
--

LOCK TABLES `Gene` WRITE;
/*!40000 ALTER TABLE `Gene` DISABLE KEYS */;
INSERT INTO `Gene` VALUES (1,'-','ENSG00000122012'),(2,'-','LRG_1010'),(3,'-','ENSG00000272103'),(4,'-','ENSG00000164620'),(5,'-','ENSG00000113441'),(6,'-','ENSG00000161133'),(7,'-','ENSG00000250261'),(8,'-','ENSG00000241973'),(9,'-','ENSG00000100285'),(10,'-','ENSG00000145569'),(11,'-','ENSG00000099917'),(12,'-','ENSG00000174837'),(13,'-','ENSG00000239547'),(14,'-','-'),(15,'-','ENSG00000273737'),(16,'-','ENSG00000215193'),(17,'-','ENSG00000183785'),(18,'-','ENSG00000147202'),(19,'-','ENSG00000164465'),(20,'-','ENSG00000277564'),(21,'-','ENSG00000141027'),(22,'-','ENSG00000113580'),(23,'-','ENSG00000016402'),(24,'-','ENSG00000272600'),(25,'-','ENSG00000233237'),(26,'-','ENSG00000099940'),(27,'-','ENSG00000232295'),(28,'-','ENSG00000153162'),(29,'-','ENSG00000145808'),(30,'-','ENSG00000185252'),(31,'-','ENSG00000100368'),(32,'-','ENSG00000148120'),(33,'-','ENSG00000197594'),(34,'-','ENSG00000224063'),(35,'-','ENSG00000118495'),(36,'-','ENSG00000138182'),(37,'-','ENSG00000085449'),(38,'-','ENSG00000148488'),(39,'-','ENSG00000282513'),(40,'-','LRG_334'),(41,'-','ENSG00000216853'),(42,'-','ENSG00000175329'),(43,'-','ENSG00000230417'),(44,'-','ENSG00000113269'),(45,'-','ENSG00000164574'),(46,'-','ENSG00000275932'),(47,'-','ENSG00000164199'),(48,'-','ENSG00000070371'),(49,'-','ENSG00000100154'),(50,'-','ENSG00000153922'),(51,'-','ENSG00000249082'),(52,'-','ENSG00000145781'),(53,'-','ENSG00000145723'),(54,'-','ENSG00000105053'),(55,'-','ENSG00000266509'),(56,'-','ENSG00000112851'),(57,'-','ENSG00000184349'),(58,'-','ENSG00000113448'),(59,'-','ENSG00000068796'),(60,'-','ENSG00000248791'),(61,'-','ENSG00000168418'),(62,'-','ENSG00000244486'),(63,'-','ENSG00000021645'),(64,'-','ENSG00000234121'),(65,'-','ENSG00000278008'),(66,'-','ENSG00000158987'),(67,'-','ENSG00000216863'),(68,'-','ENSG00000145730'),(69,'-','ENSG00000099910'),(70,'-','ENSG00000170624'),(71,'-','ENSG00000184979'),(72,'-','ENSG00000176018'),(73,'-','ENSG00000220248'),(74,'-','ENSG00000225225'),(75,'-','ENSG00000135333'),(76,'-','ENSG00000241717'),(77,'-','ENSG00000280941'),(78,'-','ENSG00000261115'),(79,'-','ENSG00000137203'),(80,'-','ENSG00000230333'),(81,'-','ENSG00000215544'),(82,'-','ENSG00000282833'),(83,'-','ENSG00000130038'),(84,'-','ENSG00000010818'),(85,'-','ENSG00000165966'),(86,'-','ENSG00000236670'),(87,'-','ENSG00000227028'),(88,'-','ENSG00000146678'),(89,'-','ENSG00000236177'),(90,'-','ENSG00000230472'),(91,'-','ENSG00000006432'),(92,'-','ENSG00000171611'),(93,'-','ENSG00000161103'),(94,'-','LRG_321'),(95,'-','ENSG00000248405'),(96,'-','ENSG00000255156'),(97,'-','ENSG00000233110'),(98,'-','ENSG00000207210'),(99,'-','ENSG00000196670'),(100,'-','ENSG00000077935'),(101,'-','ENSG00000279558'),(102,'-','ENSG00000161010'),(103,'-','LRG_189'),(104,'-','ENSG00000154127'),(105,'-','LRG_205'),(106,'-','ENSG00000237689'),(107,'-','ENSG00000228122'),(108,'-','ENSG00000275118');
/*!40000 ALTER TABLE `Gene` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Microindel`
--

DROP TABLE IF EXISTS `Microindel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Microindel` (
  `idMicroindel` int(11) NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Start` varchar(45) DEFAULT NULL,
  `End` varchar(45) DEFAULT NULL,
  `Info` text,
  `Gene_idGene` int(11) NOT NULL,
  `Chromosome_idChromosome` int(11) NOT NULL,
  PRIMARY KEY (`idMicroindel`,`Gene_idGene`,`Chromosome_idChromosome`),
  KEY `fk_Microindel_Gene1_idx` (`Gene_idGene`),
  KEY `fk_Microindel_Chromosome1_idx` (`Chromosome_idChromosome`),
  FULLTEXT KEY `FullText` (`Name`),
  CONSTRAINT `fk_Microindel_Chromosome1` FOREIGN KEY (`Chromosome_idChromosome`) REFERENCES `Chromosome` (`idChromosome`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Microindel_Gene1` FOREIGN KEY (`Gene_idGene`) REFERENCES `Gene` (`idGene`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Microindel`
--

LOCK TABLES `Microindel` WRITE;
/*!40000 ALTER TABLE `Microindel` DISABLE KEYS */;
INSERT INTO `Microindel` VALUES (1,'rs1160946','76086641','76086640','-/GGTA/GG',1,1),(2,'rs361622','19971168','19971167','-/C',2,2),(3,'rs1160961','36860949','36860948','-/TT',3,1),(4,'rs1160948','141641287','141641286','-/AGT',4,1),(5,'rs1160962','96991846','96991845','-/TT',5,1),(6,'rs361839','20369563','20369562','-/GCAGTC',6,2),(7,'rs361625','20594218','20594217','-/AA',7,2),(8,'rs362224','20863315','20863314','-/CCT',8,2),(9,'rs361628','20592935','20592934','-/C',7,2),(10,'rs361629','29486205','29486204','-/T',9,2),(11,'rs1160967','14596637','14596636','-/CT',10,1),(12,'rs361870','20587936','20587935','-/TG',11,2),(13,'rs1160969','6935111','6935110','-/AA',12,3),(14,'rs362018','17356068','17356067','-/T/TAAAA/TAAAATAAAATAAAA/TAAAG',13,2),(15,'rs1305040','32621581','32621580','-/CATT',14,4),(16,'rs362260','20800715','20800714','-/AA',8,2),(17,'rs362033','20808503','20808502','-/GAA',8,2),(18,'rs361649','20800908','20800907','-/T',8,2),(19,'rs362261','22444536','22444535','-/T',15,5),(20,'rs362248','20825087','20825086','-/AAAAA/AAAAAAA/AAAAAAAA',8,2),(21,'rs362034','20594237','20594236','-/GA/GAAA/GATA',7,2),(22,'rs361910','18095831','18095830','-/T',16,2),(23,'rs1305043','178051912','178051911','-/CT',14,6),(24,'rs361911','18127714','18127713','-/T/TT',17,2),(25,'rs1305044','58708731','58708730','-/CCTTGTTGC',14,7),(26,'rs361892','20850451','20850450','-/T',8,2),(27,'rs361665','29494327','29494326','-/AAAC/AAACAAAC',9,2),(28,'rs363764','97600481','97600480','-/TCT',18,8),(29,'rs1305046','117463497','117463496','-/TG/GT',19,9),(30,'rs361700','35933836','35933835','-/A',20,6),(31,'rs1305047','16181675','16181674','-/CACA',21,10),(32,'rs362039','20592867','20592866','-/A/AA',7,2),(33,'rs1305061','143301530','143301529','-/AATTA',22,1),(34,'rs362055','20797795','20797794','-/T',8,2),(35,'rs361931','29497789','29497788','-/A/AA/AAAAAAAA',14,2),(36,'rs361706','20901094','20901093','-/A',14,2),(37,'rs362058','20572640','20572639','-/C',11,2),(38,'rs361707','20773300','20773299','-/T',8,2),(39,'rs361723','20837388','20837387','-/ACAG',8,2),(40,'rs361953','20847755','20847754','-/A/AA',8,2),(41,'rs361740','20594240','20594239','-/G',7,2),(42,'rs1160852','137024721','137024720','-/AA',23,9),(43,'rs362114','20813318','20813317','-/ACA',8,2),(44,'rs361972','20780792','20780791','-/AAAAAAAAAAAAAAAA',8,2),(45,'rs361745','20892504','20892503','-/A/G',24,2),(46,'rs361518','71403291','71403290','-/A/T',25,9),(47,'rs1160856','8564382','8564381','-/CT',14,9),(48,'rs362117','20377725','20377724','-/A',6,2),(49,'rs361532','20880028','20880027','-/CAA',26,2),(50,'rs1160870','11166697','11166696','-/TT',14,9),(51,'rs1160857','94533476','94533475','-/TG',14,9),(52,'rs1160858','71331637','71331636','-/TG',27,9),(53,'rs361761','20843099','20843098','-/A',8,2),(54,'rs1160859','7771694','7771693','-/AG',28,9),(55,'rs361977','20811624','20811623','-/AAA/AAAAA',8,2),(56,'rs361536','20821609','20821608','-/GTTTGTTT',8,2),(57,'rs1160874','129642851','129642850','-/C',29,1),(58,'rs362136','20399572','20399571','-/CT/TTT/TT/T',30,2),(59,'rs361765','36943772','36943771','-/GTGTGTGTGC',31,2),(60,'rs361552','20809432','20809431','-/T',8,2),(61,'rs1160910','94736780','94736779','-/CTTT',32,11),(62,'rs1160877','131844594','131844593','-/AAGTA',33,9),(63,'rs361994','36942078','36942077','-/C',31,2),(64,'rs1160911','187505129','187505128','-/AT',34,12),(65,'rs1160878','143952478','143952477','-/GTGA',35,9),(66,'rs1160879','61092412','61092411','-/AAG',14,6),(67,'rs361782','18089607','18089606','-/TGGG/TGGT/TTGG',16,2),(68,'rs1160913','89751667','89751666','-/AAG',36,13),(69,'rs1160893','223929861','223929860','-/AG',37,12),(70,'rs1160894','17320673','17320672','-/CAT',38,13),(71,'rs361804','20898009','20898008','-/GC',14,2),(72,'rs1160915','33127359','33127358','-/AAGA',39,14),(73,'rs1160895','2576752','2576751','-/GT',40,15),(74,'rs361571','18089737','18089736','-/ACTC',16,2),(75,'rs1160916','94449713','94449712','-/AC',41,9),(76,'rs362170','20897718','20897717','-/A',14,2),(77,'rs361806','35061940','35061939','-/TACAAA/A',42,2),(78,'rs361786','18108999','18108998','-/GAAA',17,2),(79,'rs1160897','78449547','78449546','-/TCT',43,13),(80,'rs1160931','179976001','179976000','-/AG',44,1),(81,'rs1160918','143966530','143966529','-/CACT',14,5),(82,'rs1160932','154272459','154272458','-/GG',45,1),(83,'rs1160919','37520046','37520045','-/AC',46,6),(84,'rs361576','20592924','20592923','-/G',7,2),(85,'rs1160934','90573121','90573120','-/CA',47,1),(86,'rs361824','20769684','20769683','-/A/AA',8,2),(87,'rs361590','18094220','18094219','-/T',16,2),(88,'rs361610','20814181','20814180','-/A',8,2),(89,'rs361578','19216604','19216603','-/G',48,2),(90,'rs361840','20592928','20592927','-/G',7,2),(91,'rs470099','27989229','27989228','-/CA',49,2),(92,'rs1160951','98874095','98874094','-/ATA',50,1),(93,'rs1160938','135042137','135042136','-/CTC',51,1),(94,'rs361841','20568274','20568273','-/GTG',11,2),(95,'rs1160952','142063833','142063832','-/GGA',14,1),(96,'rs1160953','116290380','116290379','-/TAGA',52,1),(97,'rs1160954','103112319','103112318','-/ACA',53,1),(98,'rs1160955','49993026','49993025','-/AC/CA',54,3),(99,'rs866898','33694405','33694404','-/C/CC',55,9),(100,'rs1160956','66082633','66082632','-/TCT',56,1),(101,'rs361619','18125535','18125534','-/A',17,2),(102,'rs1160957','107501497','107501496','-/GTA/TAG',57,1),(103,'rs1160958','59286920','59286919','-/C/CAT',58,1),(104,'rs361848','20892517','20892516','-/G',24,2),(105,'rs1160972','62460270','62460269','-/TT',59,1),(106,'rs361849','20570753','20570752','-/CT',11,2),(107,'rs361635','20572984','20572983','-/TT',11,2),(108,'rs1160973','14615399','14615398','-/AG',60,1),(109,'rs1160975','84240872','84240871','-/AA',61,16),(110,'rs361638','20420745','20420744','-/GTA',62,2),(111,'rs362237','20861137','20861136','-/TT',8,2),(112,'rs1160978','78957403','78957402','-/TA/TC',63,7),(113,'rs361881','20419969','20419968','-/TTT/TT/T',62,2),(114,'rs361869','16835031','16835030','-/T',64,2),(115,'rs361903','18718507','18718506','-/CGGAGCCAGAGGGCCGGGGGGTCCCACA',65,2),(116,'rs361884','20402803','20402802','-/AA/A',30,2),(117,'rs361657','20397072','20397071','-/TTTCTT',30,2),(118,'rs1305050','131594911','131594910','-/AACT/TAAC',66,1),(119,'rs1305039','6559178','6559177','-/CATA',67,9),(120,'rs1305053','102841049','102841048','-/TT',68,1),(121,'rs361908','20462277','20462276','-/AA/A',69,2),(122,'rs1305054','116394816','116394815','-/CCTACAAAACTACTGTAGTTTTT',52,1),(123,'rs1305055','98560999','98560998','-/AAAG',14,1),(124,'rs361923','20566563','20566562','-/CAG',11,2),(125,'rs1305056','156235247','156235246','-/CTACTGAT',70,1),(126,'rs361677','20872848','20872847','-/TTT/TTTT',26,2),(127,'rs361690','20595016','20595015','-/A',7,2),(128,'rs361711','18154624','18154623','-/TTTTTGT',71,2),(129,'rs1305058','68443039','68443038','-/GCTCCAGACATCTGGGGA/CTCCAGACATCTGGGGAG',14,1),(130,'rs1305059','90518788','90518787','-/TGACC',72,1),(131,'rs363779','97602951','97602950','-/ACAC',18,8),(132,'rs361941','20851191','20851190','-/CT',8,2),(133,'rs361943','16853013','16853012','-/A',73,2),(134,'rs362081','18098769','18098768','-/TA',74,2),(135,'rs361504','93347441','93347440','-/A',75,9),(136,'rs361699','19954220','19954219','-/A',2,2),(137,'rs361719','16685334','16685333','-/AATA/AATAAATA',76,2),(138,'rs362104','22435667','22435666','-/A',77,5),(139,'rs1160845','125673143','125673142','-/CCT',14,8),(140,'rs361962','20833658','20833657','-/GT/GTTTTT/TTTTG/TTTTTTTTT',8,2),(141,'rs1160846','141249660','141249659','-/CTTGTG',78,17),(142,'rs1160860','10402207','10402206','-/GA',79,9),(143,'rs1160847','11522624','11522623','-/TAAAA',80,17),(144,'rs362121','18850928','18850927','-/A',81,2),(145,'rs361523','13289793','13289792','-/A',82,9),(146,'rs1160861','52620988','52620987','-/CT',14,9),(147,'rs1160848','3678761','3678760','-/GCCCC',83,15),(148,'rs362122','20886120','20886119','-/TT',24,2),(149,'rs1160849','142790939','142790938','-/TATA',84,9),(150,'rs362123','18092834','18092833','-/G',16,2),(151,'rs1160863','41417424','41417423','-/TA',85,15),(152,'rs361967','20482748','20482747','-/T',86,2),(153,'rs1160864','40101530','40101529','-/TC',87,12),(154,'rs1143705','45887947','45887946','-/TGTT/TTGTT',88,17),(155,'rs361968','20842824','20842823','-/C',8,2),(156,'rs361527','33205592','33205591','-/TCAACATTTAT',89,18),(157,'rs1160865','50602735','50602734','-/CCAGTC',90,9),(158,'rs1160866','85142666','85142665','-/CTT/TTC',14,9),(159,'rs362140','20830356','20830355','-/CATA',8,2),(160,'rs362127','18154615','18154614','-/GGTA/T',71,2),(161,'rs361756','20884794','20884793','-/TTTTG',24,2),(162,'rs1160880','70751060','70751059','-/TCTA',91,7),(163,'rs1160867','42929214','42929213','-/CTC/CT',92,9),(164,'rs361770','18849022','18849021','-/T',93,2),(165,'rs1160901','7680212','7680211','-/ACA',94,10),(166,'rs470063','44816166','44816165','-/AT',95,2),(167,'rs362143','18093563','18093562','-/A',16,2),(168,'rs361772','18103113','18103112','-/A/AAA/AAAA',74,2),(169,'rs1160904','77587966','77587965','-/AAT',14,19),(170,'rs362145','20469779','20469778','-/TT/T',69,2),(171,'rs361774','20470799','20470798','-/GATG/TATG',96,2),(172,'rs361560','18132284','18132283','-/TTTG',17,2),(173,'rs1160885','26843945','26843944','-/GAT/TGA',14,2),(174,'rs1160906','185589630','185589629','-/AACTC',97,6),(175,'rs361549','19958723','19958722','-/A',2,2),(176,'rs1160920','173055380','173055379','-/CA',98,1),(177,'rs1160907','22226456','22226455','-/GA',14,18),(178,'rs1160921','98605679','98605678','-/TT',14,1),(179,'rs1160888','87296446','87296445','-/CAAA/AAAC',14,18),(180,'rs1160922','180846616','180846615','-/CT',99,1),(181,'rs1160909','40299126','40299125','-/GTCA',14,7),(182,'rs1160889','45401856','45401855','-/AGAA/CAGA/AGA',100,2),(183,'rs1160923','169539293','169539292','-/AG',14,1),(184,'rs1160924','175350398','175350397','-/A/AG',14,1),(185,'rs1160926','141089380','141089379','-/AT',101,1),(186,'rs1160940','175349304','175349303','-/CCT',14,1),(187,'rs1160927','179840473','179840472','-/CA',102,1),(188,'rs1160941','157194955','157194954','-/GCTTTT',103,1),(189,'rs361831','20897527','20897526','-/A',14,2),(190,'rs866904','122713975','122713974','-/G',104,20),(191,'rs1160942','156708665','156708664','-/TTGT',105,1),(192,'rs1160929','171750455','171750454','-/CT',14,1),(193,'rs361832','16865721','16865720','-/G',106,2),(194,'rs361819','20594226','20594225','-/G',7,2),(195,'rs361833','16877499','16877498','-/AGGA/GGA',107,2),(196,'rs1160945','54189646','54189645','-/CCT',108,18),(197,'rs362186','20868616','20868615','-/A',26,2);
/*!40000 ALTER TABLE `Microindel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Microindel_has_ClinicalSignificance`
--

DROP TABLE IF EXISTS `Microindel_has_ClinicalSignificance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Microindel_has_ClinicalSignificance` (
  `Microindel_idMicroindel` int(11) NOT NULL,
  `ClinicalSignificance_idClinicalSignificance` int(11) NOT NULL,
  PRIMARY KEY (`Microindel_idMicroindel`,`ClinicalSignificance_idClinicalSignificance`),
  KEY `fk_Microindel_has_ClinicalSignificance_ClinicalSignificance_idx` (`ClinicalSignificance_idClinicalSignificance`),
  KEY `fk_Microindel_has_ClinicalSignificance_Microindel1_idx` (`Microindel_idMicroindel`),
  CONSTRAINT `fk_Microindel_has_ClinicalSignificance_ClinicalSignificance1` FOREIGN KEY (`ClinicalSignificance_idClinicalSignificance`) REFERENCES `ClinicalSignificance` (`idClinicalSignificance`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Microindel_has_ClinicalSignificance_Microindel1` FOREIGN KEY (`Microindel_idMicroindel`) REFERENCES `Microindel` (`idMicroindel`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Microindel_has_ClinicalSignificance`
--

LOCK TABLES `Microindel_has_ClinicalSignificance` WRITE;
/*!40000 ALTER TABLE `Microindel_has_ClinicalSignificance` DISABLE KEYS */;
INSERT INTO `Microindel_has_ClinicalSignificance` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(31,1),(32,1),(33,1),(34,1),(35,1),(36,1),(37,1),(38,1),(39,1),(40,1),(41,1),(42,1),(43,1),(44,1),(45,1),(46,1),(47,1),(48,1),(49,1),(50,1),(51,1),(52,1),(53,1),(54,1),(55,1),(56,1),(57,1),(58,1),(59,1),(60,1),(61,1),(62,1),(63,1),(64,1),(65,1),(66,1),(67,1),(68,1),(69,1),(70,1),(71,1),(72,1),(73,1),(75,1),(76,1),(77,1),(78,1),(79,1),(80,1),(81,1),(82,1),(83,1),(84,1),(85,1),(86,1),(87,1),(88,1),(89,1),(90,1),(91,1),(92,1),(93,1),(94,1),(95,1),(96,1),(97,1),(98,1),(99,1),(100,1),(101,1),(102,1),(103,1),(104,1),(105,1),(106,1),(107,1),(108,1),(109,1),(110,1),(111,1),(112,1),(113,1),(114,1),(115,1),(116,1),(117,1),(118,1),(119,1),(120,1),(121,1),(122,1),(123,1),(124,1),(125,1),(126,1),(127,1),(128,1),(129,1),(130,1),(131,1),(132,1),(133,1),(134,1),(135,1),(136,1),(137,1),(138,1),(139,1),(140,1),(141,1),(142,1),(143,1),(144,1),(145,1),(146,1),(147,1),(148,1),(149,1),(150,1),(151,1),(152,1),(153,1),(154,1),(155,1),(156,1),(157,1),(158,1),(159,1),(160,1),(161,1),(162,1),(163,1),(164,1),(165,1),(166,1),(167,1),(168,1),(169,1),(170,1),(171,1),(172,1),(173,1),(174,1),(175,1),(176,1),(177,1),(178,1),(179,1),(180,1),(181,1),(182,1),(183,1),(184,1),(185,1),(186,1),(187,1),(188,1),(189,1),(190,1),(191,1),(192,1),(193,1),(194,1),(195,1),(196,1),(197,1),(74,2);
/*!40000 ALTER TABLE `Microindel_has_ClinicalSignificance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Microindel_has_Disease`
--

DROP TABLE IF EXISTS `Microindel_has_Disease`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Microindel_has_Disease` (
  `Microindel_idMicroindel` int(11) NOT NULL,
  `Disease_idDisease` int(11) NOT NULL,
  PRIMARY KEY (`Microindel_idMicroindel`,`Disease_idDisease`),
  KEY `fk_Microindel_has_Disease_Disease1_idx` (`Disease_idDisease`),
  KEY `fk_Microindel_has_Disease_Microindel1_idx` (`Microindel_idMicroindel`),
  CONSTRAINT `fk_Microindel_has_Disease_Disease1` FOREIGN KEY (`Disease_idDisease`) REFERENCES `Disease` (`idDisease`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Microindel_has_Disease_Microindel1` FOREIGN KEY (`Microindel_idMicroindel`) REFERENCES `Microindel` (`idMicroindel`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Microindel_has_Disease`
--

LOCK TABLES `Microindel_has_Disease` WRITE;
/*!40000 ALTER TABLE `Microindel_has_Disease` DISABLE KEYS */;
INSERT INTO `Microindel_has_Disease` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(31,1),(32,1),(33,1),(34,1),(35,1),(36,1),(37,1),(38,1),(39,1),(40,1),(41,1),(42,1),(43,1),(44,1),(45,1),(46,1),(47,1),(48,1),(49,1),(50,1),(51,1),(52,1),(53,1),(54,1),(55,1),(56,1),(57,1),(58,1),(59,1),(60,1),(61,1),(62,1),(63,1),(64,1),(65,1),(66,1),(67,1),(68,1),(69,1),(70,1),(71,1),(72,1),(73,1),(75,1),(76,1),(77,1),(78,1),(79,1),(80,1),(81,1),(82,1),(83,1),(84,1),(85,1),(86,1),(87,1),(88,1),(89,1),(90,1),(91,1),(92,1),(93,1),(94,1),(95,1),(96,1),(97,1),(98,1),(99,1),(100,1),(101,1),(102,1),(103,1),(104,1),(105,1),(106,1),(107,1),(108,1),(109,1),(110,1),(111,1),(112,1),(113,1),(114,1),(115,1),(116,1),(117,1),(118,1),(119,1),(120,1),(121,1),(122,1),(123,1),(124,1),(125,1),(126,1),(127,1),(128,1),(129,1),(130,1),(131,1),(132,1),(133,1),(134,1),(135,1),(136,1),(137,1),(138,1),(139,1),(140,1),(141,1),(142,1),(143,1),(144,1),(145,1),(146,1),(147,1),(148,1),(149,1),(150,1),(151,1),(152,1),(153,1),(154,1),(155,1),(156,1),(157,1),(158,1),(159,1),(160,1),(161,1),(162,1),(163,1),(164,1),(165,1),(166,1),(167,1),(168,1),(169,1),(170,1),(171,1),(172,1),(173,1),(174,1),(175,1),(176,1),(177,1),(178,1),(179,1),(180,1),(181,1),(182,1),(183,1),(184,1),(185,1),(186,1),(187,1),(188,1),(189,1),(190,1),(191,1),(192,1),(193,1),(194,1),(195,1),(196,1),(197,1),(74,2);
/*!40000 ALTER TABLE `Microindel_has_Disease` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Microindel_has_Reference`
--

DROP TABLE IF EXISTS `Microindel_has_Reference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Microindel_has_Reference` (
  `Microindel_idMicroindel` int(11) NOT NULL,
  `Reference_idReference` int(11) NOT NULL,
  PRIMARY KEY (`Microindel_idMicroindel`,`Reference_idReference`),
  KEY `fk_Microindel_has_Reference_Reference1_idx` (`Reference_idReference`),
  KEY `fk_Microindel_has_Reference_Microindel1_idx` (`Microindel_idMicroindel`),
  CONSTRAINT `fk_Microindel_has_Reference_Microindel1` FOREIGN KEY (`Microindel_idMicroindel`) REFERENCES `Microindel` (`idMicroindel`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Microindel_has_Reference_Reference1` FOREIGN KEY (`Reference_idReference`) REFERENCES `Reference` (`idReference`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Microindel_has_Reference`
--

LOCK TABLES `Microindel_has_Reference` WRITE;
/*!40000 ALTER TABLE `Microindel_has_Reference` DISABLE KEYS */;
INSERT INTO `Microindel_has_Reference` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(32,1),(33,1),(34,1),(35,1),(36,1),(37,1),(38,1),(39,1),(40,1),(41,1),(43,1),(44,1),(45,1),(46,1),(47,1),(48,1),(49,1),(50,1),(51,1),(52,1),(53,1),(54,1),(55,1),(56,1),(57,1),(58,1),(59,1),(60,1),(61,1),(62,1),(63,1),(64,1),(65,1),(66,1),(67,1),(68,1),(70,1),(71,1),(72,1),(73,1),(74,1),(75,1),(76,1),(77,1),(78,1),(79,1),(80,1),(81,1),(82,1),(83,1),(84,1),(85,1),(86,1),(87,1),(88,1),(89,1),(90,1),(91,1),(92,1),(93,1),(94,1),(95,1),(96,1),(97,1),(98,1),(99,1),(100,1),(101,1),(102,1),(103,1),(104,1),(105,1),(106,1),(107,1),(108,1),(110,1),(112,1),(113,1),(114,1),(115,1),(116,1),(117,1),(118,1),(119,1),(120,1),(121,1),(122,1),(123,1),(124,1),(126,1),(127,1),(128,1),(130,1),(131,1),(132,1),(133,1),(134,1),(135,1),(136,1),(137,1),(138,1),(139,1),(140,1),(141,1),(142,1),(143,1),(144,1),(145,1),(146,1),(147,1),(148,1),(149,1),(150,1),(151,1),(152,1),(153,1),(154,1),(155,1),(156,1),(157,1),(158,1),(159,1),(160,1),(161,1),(162,1),(163,1),(164,1),(166,1),(167,1),(168,1),(169,1),(170,1),(171,1),(172,1),(173,1),(174,1),(175,1),(176,1),(177,1),(178,1),(179,1),(180,1),(181,1),(182,1),(183,1),(184,1),(185,1),(186,1),(187,1),(188,1),(189,1),(190,1),(191,1),(192,1),(193,1),(194,1),(195,1),(196,1),(197,1),(7,2),(31,3),(42,4),(69,4),(109,5),(111,6),(125,7),(129,8),(165,9);
/*!40000 ALTER TABLE `Microindel_has_Reference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reference`
--

DROP TABLE IF EXISTS `Reference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Reference` (
  `idReference` int(11) NOT NULL,
  `PMID` text,
  `DB` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idReference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reference`
--

LOCK TABLES `Reference` WRITE;
/*!40000 ALTER TABLE `Reference` DISABLE KEYS */;
INSERT INTO `Reference` VALUES (1,'-','dbSNP'),(2,'26837816','dbSNP'),(3,'24416183','dbSNP'),(4,'22272242','dbSNP'),(5,'17997390','dbSNP'),(6,'21285523','dbSNP'),(7,'23690203','dbSNP'),(8,'19515250','dbSNP'),(9,'16039051','dbSNP');
/*!40000 ALTER TABLE `Reference` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-02 15:38:11
