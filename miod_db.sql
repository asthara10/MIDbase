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

CREATE SCHEMA IF NOT EXISTS `miod` DEFAULT CHARACTER SET utf8 ;
USE `miod` ;

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
INSERT INTO `ClinicalSignificance` VALUES (1,'Not provided'),(2,'Benign'),(3,'Likely Benign'),(4,'Association'),(5,'Confers Sensitivity'),(6,'Drug Response'),(7,'Protective'),(8,'Risk Factor'),(9,'Likely Pathogenic'),(10,'Pathogenic'),(11,'Uncertain Significance'),(12,'Other');
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
  FULLTEXT (`DiseaseName`),
  FULLTEXT (`idMIM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Disease`
--

LOCK TABLES `Disease` WRITE;
/*!40000 ALTER TABLE `Disease` DISABLE KEYS */;
INSERT INTO `Disease` VALUES (1,'Not provided','Not provided'),(2,'ZELLWEGER SYNDROME','Not provided'),(3,'608363',''),(4,'','300705'),(5,'','611936'),(6,'','300942'),(7,'','612001'),(8,'DDHC','300475'),(9,'','609425'),(10,'Koolen-de_Vries_syndrome(KDVS)','610443'),(11,'neurofibromatosis1(NF1)','613675');
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
  `Location_idLocation` int(11) NOT NULL,
  PRIMARY KEY (`idGene`,`Location_idLocation`),
  KEY `fk_Gene_Location_idx` (`Location_idLocation`),
  FULLTEXT (`GeneName`),
  FULLTEXT (`idENSEMBL`),
  CONSTRAINT `fk_Gene_Location` FOREIGN KEY (`Location_idLocation`) REFERENCES `Location` (`idLocation`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Gene`
--

LOCK TABLES `Gene` WRITE;
/*!40000 ALTER TABLE `Gene` DISABLE KEYS */;
INSERT INTO `Gene` VALUES (1,'Not provided','ENSG00000241484',1),(2,'Not provided','ENSG00000248405',1),(3,'Not provided','ENSG00000235954',2),(4,'Not provided','ENSG00000100154',2),(5,'Not provided','ENSG00000096433',3),(6,'Not provided','ENSG00000137288',3),(7,'Not provided','ENSG00000266509',3),(8,'Not provided','ENSG00000154127',4),(9,'Not provided','ENSG00000135333',5),(10,'Not provided','ENSG00000207827',6),(11,'Not provided','ENSG00000269966',6),(12,'Not provided','ENSG00000233237',6),(13,'Not provided','ENSG00000145979',7),(14,'Not provided','ENSG00000272379',7),(15,'Not provided','ENSG00000215022',7),(16,'Not provided','ENSG00000112137',7),(17,'Not provided','ENSG00000282833',7),(18,'Not provided','ENSG00000231389',8),(19,'Not provided','ENSG00000235844',9),(20,'Not provided','ENSG00000224103',10),(21,'Not provided','ENSG00000229685',11),(22,'Not provided','ENSG00000228163',12),(23,'Not provided','ENSG00000168384',13),(24,'Not provided','ENSG00000206291',14),(25,'Not provided','ENSG00000236177',15),(26,'Not provided','ENSG00000099940',16),(27,'Not provided','ENSG00000241973',17),(28,'Not provided','ENSG00000093010',18),(29,'Not provided','LRG_1010',18),(30,'Not provided','ENSG00000215193',20),(31,'Not provided','ENSG00000280007',20),(32,'Not provided','ENSG00000183785',20),(33,'Not provided','ENSG00000250261',22),(34,'Not provided','ENSG00000070371',23),(35,'Not provided','ENSG00000099889',27),(36,'Not provided','ENSG00000100285',30),(37,'Not provided','ENSG00000099917',31),(38,'Not provided','ENSG00000207343',32),(39,'Not provided','ENSG00000244486',32),(40,'Not provided','ENSG00000185252',34),(41,'Not provided','ENSG00000100320',39),(42,'Not provided','ENSG00000277564',40),(43,'Not provided','Not provided',41),(44,'Not provided','ENSG00000099937',42),(45,'Not provided','ENSG00000184979',43),(46,'Not provided','ENSG00000100181',44),(47,'Not provided','ENSG00000273244',44),(48,'Not provided','ENSG00000241717',44),(49,'Not provided','ENSG00000272600',47),(50,'Not provided','ENSG00000100368',50),(51,'Not provided','ENSG00000161103',51),(52,'Not provided','ENSG00000235617',52),(53,'Not provided','ENSG00000225225',52),(54,'Not provided','ENSG00000099910',53),(55,'Not provided','ENSG00000255156',53),(56,'Not provided','ENSG00000175329',57),(57,'Not provided','ENSG00000237689',61),(58,'Not provided','ENSG00000237358',62),(59,'Not provided','ENSG00000228122',62),(60,'Not provided','ENSG00000161133',63),(61,'Not provided','ENSG00000234121',68),(62,'Not provided','ENSG00000278008',73),(63,'Not provided','ENSG00000237835',80),(64,'Not provided','ENSG00000220248',80),(65,'Not provided','ENSG00000201916',83),(66,'Not provided','ENSG00000242876',83),(67,'Not provided','ENSG00000236670',83),(68,'Not provided','ENSG00000099954',88),(69,'Not provided','ENSG00000239547',88),(70,'Not provided','ENSG00000281471',95),(71,'Not provided','ENSG00000280941',95),(72,'Not provided','ENSG00000215544',98),(73,'Not provided','ENSG00000211655',112),(74,'Not provided','ENSG00000273737',113),(75,'Not provided','ENSG00000236256',114),(76,'Not provided','ENSG00000147202',114),(77,'Not provided','ENSG00000146678',116),(78,'Not provided','ENSG00000261115',118),(79,'Not provided','ENSG00000005108',119),(80,'Not provided','ENSG00000230333',119),(81,'Not provided','ENSG00000130038',120),(82,'Not provided','ENSG00000237851',121),(83,'Not provided','ENSG00000010818',121),(84,'Not provided','ENSG00000016402',122),(85,'Not provided','ENSG00000230597',125),(86,'Not provided','ENSG00000232295',125),(87,'Not provided','ENSG00000153162',126),(88,'Not provided','ENSG00000137203',127),(89,'Not provided','ENSG00000257228',129),(90,'Not provided','ENSG00000165966',129),(91,'Not provided','ENSG00000183023',130),(92,'Not provided','ENSG00000227028',130),(93,'Not provided','ENSG00000230472',131),(94,'Not provided','ENSG00000137161',133),(95,'Not provided','ENSG00000171611',133),(96,'Not provided','ENSG00000251680',135),(97,'Not provided','ENSG00000145808',135),(98,'Not provided','ENSG00000197594',136),(99,'Not provided','ENSG00000118495',137),(100,'Not provided','ENSG00000006432',139),(101,'Not provided','ENSG00000077935',142),(102,'Not provided','ENSG00000085449',143),(103,'Not provided','ENSG00000148488',144),(104,'Not provided','ENSG00000151067',145),(105,'Not provided','LRG_334',145),(106,'Not provided','ENSG00000282863',146),(107,'Not provided','ENSG00000230417',146),(108,'Not provided','ENSG00000141510',147),(109,'Not provided','LRG_321',147),(110,'Not provided','ENSG00000154556',149),(111,'Not provided','ENSG00000233110',149),(112,'Not provided','ENSG00000148120',152),(113,'Not provided','ENSG00000003436',153),(114,'Not provided','ENSG00000224063',153),(115,'Not provided','ENSG00000138182',154),(116,'Not provided','ENSG00000248905',155),(117,'Not provided','ENSG00000282513',155),(118,'Not provided','ENSG00000216853',156),(119,'Not provided','ENSG00000276023',158),(120,'Not provided','ENSG00000275066',158),(121,'Not provided','ENSG00000274047',159),(122,'Not provided','ENSG00000275932',159),(123,'Not provided','ENSG00000164463',160),(124,'Not provided','ENSG00000207210',160),(125,'Not provided','ENSG00000196670',162),(126,'Not provided','ENSG00000279047',165),(127,'Not provided','ENSG00000279558',165),(128,'Not provided','ENSG00000161011',166),(129,'Not provided','ENSG00000161010',166),(130,'Not provided','ENSG00000113269',168),(131,'Not provided','ENSG00000164574',169),(132,'Not provided','ENSG00000164199',170),(133,'Not provided','ENSG00000224186',171),(134,'Not provided','ENSG00000249082',171),(135,'Not provided','ENSG00000253980',173),(136,'Not provided','ENSG00000113263',173),(137,'Not provided','LRG_189',173),(138,'Not provided','ENSG00000254163',174),(139,'Not provided','ENSG00000170624',174),(140,'Not provided','LRG_205',174),(141,'Not provided','ENSG00000170892',175),(142,'Not provided','ENSG00000125505',175),(143,'Not provided','ENSG00000276935',176),(144,'Not provided','ENSG00000278622',176),(145,'Not provided','ENSG00000274796',177),(146,'Not provided','ENSG00000278322',177),(147,'Not provided','ENSG00000274078',177),(148,'Not provided','ENSG00000278519',177),(149,'Not provided','ENSG00000274672',177),(150,'Not provided','ENSG00000277025',177),(151,'Not provided','ENSG00000275165',177),(152,'Not provided','ENSG00000277733',177),(153,'Not provided','ENSG00000273896',177),(154,'Not provided','ENSG00000277923',177),(155,'Not provided','ENSG00000274129',178),(156,'Not provided','ENSG00000273592',178),(157,'Not provided','ENSG00000278712',178),(158,'Not provided','ENSG00000274194',178),(159,'Not provided','ENSG00000278605',178),(160,'Not provided','ENSG00000275118',178),(161,'Not provided','ENSG00000248127',179),(162,'Not provided','ENSG00000122012',179),(163,'Not provided','ENSG00000197948',180),(164,'Not provided','ENSG00000171720',180),(165,'Not provided','ENSG00000164620',180),(166,'Not provided','ENSG00000153922',181),(167,'Not provided','ENSG00000145781',183),(168,'Not provided','ENSG00000145723',184),(169,'Not provided','ENSG00000105053',185),(170,'Not provided','ENSG00000112851',186),(171,'Not provided','ENSG00000184349',187),(172,'Not provided','ENSG00000113448',188),(173,'Not provided','ENSG00000272103',189),(174,'Not provided','ENSG00000113441',190),(175,'Not provided','ENSG00000145569',191),(176,'Not provided','ENSG00000174837',192),(177,'Not provided','ENSG00000086200',193),(178,'Not provided','ENSG00000068796',193),(179,'Not provided','ENSG00000248791',194),(180,'Not provided','ENSG00000168418',195),(181,'Not provided','ENSG00000021645',196),(182,'Not provided','ENSG00000216863',197),(183,'Not provided','ENSG00000282218',201),(184,'Not provided','ENSG00000164465',201),(185,'Not provided','ENSG00000141027',202),(186,'Not provided','ENSG00000273217',203),(187,'Not provided','ENSG00000158987',203),(188,'Not provided','ENSG00000145730',204),(189,'Not provided','ENSG00000113356',209),(190,'Not provided','ENSG00000176018',209),(191,'Not provided','ENSG00000113580',210),(192,'Not provided','Not provided',210),(193,'MRX17','Not provided',212),(194,'MRX31','Not provided',212),(195,'Not provided','Not provided',213),(196,'XLAG','Not provided',214),(197,'EIG7','Not provided',215),(198,'SCZD13','Not provided',215),(199,'Not provided','Not provided',216),(200,'Not provided','Not provided',217),(201,'Not provided','Not provided',218),(202,'Not provided','Not provided',219),(203,'Not provided','Not provided',220),(204,'Not provided','Not provided',221);
/*!40000 ALTER TABLE `Gene` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Location`
--

DROP TABLE IF EXISTS `Location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Location` (
  `idLocation` int(11) NOT NULL,
  `StartGRCh38` varchar(45) DEFAULT NULL,
  `EndGRCh38` varchar(45) DEFAULT NULL,
  `CythogeneticLocation` varchar(45) DEFAULT NULL,
  `Strand` varchar(45) DEFAULT NULL,
  `Microindel_idMicroindel` int(11) NOT NULL,
  PRIMARY KEY (`idLocation`,`Microindel_idMicroindel`),
  FULLTEXT (`CythogeneticLocation`),
  KEY `fk_Location_Variant1_idx` (`Microindel_idMicroindel`),
  CONSTRAINT `fk_Location_Variant1` FOREIGN KEY (`Microindel_idMicroindel`) REFERENCES `Microindel` (`idMicroindel`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Location`
--

LOCK TABLES `Location` WRITE;
/*!40000 ALTER TABLE `Location` DISABLE KEYS */;
INSERT INTO `Location` VALUES (1,'44816166','44816165','22','1',1),(2,'27989229','27989228','22','1',2),(3,'33694405','33694404','6','1',3),(4,'122713975','122713974','11','1',4),(5,'93347441','93347440','6','1',5),(6,'71403291','71403290','6','1',6),(7,'13289793','13289792','6','1',7),(8,'33065144','33065143','6','1',8),(9,'33104231','33104230','CHR_HSCHR6_MHC_APD_CTG1','1',8),(10,'32987114','32987113','CHR_HSCHR6_MHC_COX_CTG1','1',8),(11,'33043082','33043081','CHR_HSCHR6_MHC_DBB_CTG1','1',8),(12,'33219248','33219247','CHR_HSCHR6_MHC_MANN_CTG1','1',8),(13,'33098616','33098615','CHR_HSCHR6_MHC_MCF_CTG1','1',8),(14,'32994183','32994182','CHR_HSCHR6_MHC_QBL_CTG1','1',8),(15,'33205592','33205591','CHR_HSCHR6_MHC_SSTO_CTG1','1',8),(16,'20880028','20880027','22','1',9),(17,'20821609','20821608','22','1',10),(18,'19958723','19958722','22','1',11),(19,'20809432','20809431','22','1',12),(20,'18132284','18132283','22','1',13),(21,'18089737','18089736','22','1',14),(22,'20592924','20592923','22','1',15),(23,'19216604','19216603','22','1',16),(24,'18094220','18094219','22','1',17),(25,'20814181','20814180','22','1',18),(26,'18125535','18125534','22','1',19),(27,'19971168','19971167','22','1',20),(28,'20594218','20594217','22','1',21),(29,'20592935','20592934','22','1',22),(30,'29486205','29486204','22','1',23),(31,'20572984','20572983','22','1',24),(32,'20420745','20420744','22','1',25),(33,'20800908','20800907','22','1',26),(34,'20397072','20397071','22','1',27),(35,'29494327','29494326','22','1',28),(36,'20872848','20872847','22','1',29),(37,'20595016','20595015','22','1',30),(38,'19954220','19954219','22','1',31),(39,'35927605','35927604','22','1',32),(40,'35933836','35933835','CHR_HSCHR22_1_CTG4','1',32),(41,'20901094','20901093','22','1',33),(42,'20773300','20773299','22','1',34),(43,'18154624','18154623','22','1',35),(44,'16685334','16685333','22','1',36),(45,'20837388','20837387','22','1',37),(46,'20594240','20594239','22','1',38),(47,'20892504','20892503','22','1',39),(48,'20884794','20884793','22','1',40),(49,'20843099','20843098','22','1',41),(50,'36943772','36943771','22','1',42),(51,'18849022','18849021','22','1',43),(52,'18103113','18103112','22','1',44),(53,'20470799','20470798','22','1',45),(54,'18089607','18089606','22','1',46),(55,'18108999','18108998','22','1',47),(56,'20898009','20898008','22','1',48),(57,'35061940','35061939','22','1',49),(58,'20594226','20594225','22','1',50),(59,'20769684','20769683','22','1',51),(60,'20897527','20897526','22','1',52),(61,'16865721','16865720','22','1',53),(62,'16877499','16877498','22','1',54),(63,'20369563','20369562','22','1',55),(64,'20592928','20592927','22','1',56),(65,'20568274','20568273','22','1',57),(66,'20892517','20892516','22','1',58),(67,'20570753','20570752','22','1',59),(68,'16835031','16835030','22','1',60),(69,'20587936','20587935','22','1',61),(70,'20419969','20419968','22','1',62),(71,'20402803','20402802','22','1',63),(72,'20850451','20850450','22','1',64),(73,'18718507','18718506','22','1',65),(74,'20462277','20462276','22','1',66),(75,'18095831','18095830','22','1',67),(76,'18127714','18127713','22','1',68),(77,'20566563','20566562','22','1',69),(78,'29497789','29497788','22','1',70),(79,'20851191','20851190','22','1',71),(80,'16853013','16853012','22','1',72),(81,'20847755','20847754','22','1',73),(82,'20833658','20833657','22','1',74),(83,'20482748','20482747','22','1',75),(84,'20842824','20842823','22','1',76),(85,'20780792','20780791','22','1',77),(86,'20811624','20811623','22','1',78),(87,'36942078','36942077','22','1',79),(88,'17356068','17356067','22','1',80),(89,'20808503','20808502','22','1',81),(90,'20594237','20594236','22','1',82),(91,'20592867','20592866','22','1',83),(92,'20797795','20797794','22','1',84),(93,'20572640','20572639','22','1',85),(94,'18098769','18098768','22','1',86),(95,'22435667','22435666','CHR_HSCHR22_1_CTG3','1',87),(96,'20813318','20813317','22','1',88),(97,'20377725','20377724','22','1',89),(98,'18850928','18850927','22','1',90),(99,'20886120','20886119','22','1',91),(100,'18092834','18092833','22','1',92),(101,'18154615','18154614','22','1',93),(102,'20399572','20399571','22','1',94),(103,'20830356','20830355','22','1',95),(104,'18093563','18093562','22','1',96),(105,'20469779','20469778','22','1',97),(106,'20897718','20897717','22','1',98),(107,'20868616','20868615','22','1',99),(108,'20863315','20863314','22','1',100),(109,'20861137','20861136','22','1',101),(110,'20825087','20825086','22','1',102),(111,'20800715','20800714','22','1',103),(112,'22435450','22435449','22','1',104),(113,'22444536','22444535','CHR_HSCHR22_1_CTG3','1',104),(114,'97600481','97600480','X','1',105),(115,'97602951','97602950','X','1',106),(116,'45887947','45887946','7','1',107),(117,'125673143','125673142','X','1',108),(118,'141249660','141249659','7','1',109),(119,'11522624','11522623','7','1',110),(120,'3678761','3678760','12','1',111),(121,'142790939','142790938','6','1',112),(122,'137024721','137024720','6','1',113),(123,'8564382','8564381','6','1',114),(124,'94533476','94533475','6','1',115),(125,'71331637','71331636','6','1',116),(126,'7771694','7771693','6','1',117),(127,'10402207','10402206','6','1',118),(128,'52620988','52620987','6','1',119),(129,'41417424','41417423','12','1',120),(130,'40101530','40101529','2','1',121),(131,'50602735','50602734','6','1',122),(132,'85142666','85142665','6','1',123),(133,'42929214','42929213','6','1',124),(134,'11166697','11166696','6','1',125),(135,'129642851','129642850','5','1',126),(136,'131844594','131844593','6','1',127),(137,'143952478','143952477','6','1',128),(138,'61092412','61092411','4','1',129),(139,'70751060','70751059','14','1',130),(140,'26843945','26843944','22','1',131),(141,'87296446','87296445','1','1',132),(142,'45401856','45401855','22','1',133),(143,'223929861','223929860','2','1',134),(144,'17320673','17320672','10','1',135),(145,'2576752','2576751','12','1',136),(146,'78449547','78449546','10','1',137),(147,'7680212','7680211','17','1',138),(148,'77587966','77587965','8','1',139),(149,'185589630','185589629','4','1',140),(150,'22226456','22226455','1','1',141),(151,'40299126','40299125','14','1',142),(152,'94736780','94736779','9','1',143),(153,'187505129','187505128','2','1',144),(154,'89751667','89751666','10','1',145),(155,'33127359','33127358','15','1',146),(156,'94449713','94449712','6','1',147),(157,'143966530','143966529','3','1',148),(158,'37515410','37515409','17','1',149),(159,'37520046','37520045','CHR_HSCHR17_7_CTG4','1',149),(160,'173055380','173055379','5','1',150),(161,'98605679','98605678','5','1',151),(162,'180846616','180846615','5','1',152),(163,'169539293','169539292','5','1',153),(164,'175350398','175350397','5','1',154),(165,'141089380','141089379','5','1',155),(166,'179840473','179840472','5','1',156),(167,'171750455','171750454','5','1',157),(168,'179976001','179976000','5','1',158),(169,'154272459','154272458','5','1',159),(170,'90573121','90573120','5','1',160),(171,'135042137','135042136','5','1',161),(172,'175349304','175349303','5','1',162),(173,'157194955','157194954','5','1',163),(174,'156708665','156708664','5','1',164),(175,'54189048','54189047','19','1',165),(176,'54189478','54189477','CHR_HSCHR19LRC_COX1_CTG3_1','1',165),(177,'54189646','54189645','CHR_HSCHR19LRC_COX2_CTG3_1','1',165),(178,'54189645','54189644','CHR_HSCHR19LRC_PGF1_CTG3_1','1',165),(179,'76086641','76086640','5','1',166),(180,'141641287','141641286','5','1',167),(181,'98874095','98874094','5','1',168),(182,'142063833','142063832','5','1',169),(183,'116290380','116290379','5','1',170),(184,'103112319','103112318','5','1',171),(185,'49993026','49993025','19','1',172),(186,'66082633','66082632','5','1',173),(187,'107501497','107501496','5','1',174),(188,'59286920','59286919','5','1',175),(189,'36860949','36860948','5','1',176),(190,'96991846','96991845','5','1',177),(191,'14596637','14596636','5','1',178),(192,'6935111','6935110','19','1',179),(193,'62460270','62460269','5','1',180),(194,'14615399','14615398','5','1',181),(195,'84240872','84240871','16','1',182),(196,'78957403','78957402','14','1',183),(197,'6559178','6559177','6','1',184),(198,'32621581','32621580','20','1',185),(199,'178051912','178051911','4','1',186),(200,'58708731','58708730','14','1',187),(201,'117463497','117463496','6','1',188),(202,'16181675','16181674','17','1',189),(203,'131594911','131594910','5','1',190),(204,'102841049','102841048','5','1',191),(205,'116394816','116394815','5','1',192),(206,'98560999','98560998','5','1',193),(207,'156235247','156235246','5','1',194),(208,'68443039','68443038','5','1',195),(209,'90518788','90518787','5','1',196),(210,'143301530','143301529','5','1',197),(211,'17,400,000','25,500,000','22q11.2','Not provided',198),(212,'50,100,000','54,800,000','Xp11.22','Not provided',199),(213,'192,600,000','198,295,559','3q29','Not provided',200),(214,'134,500,000','138,900,000','Xq26.3','Not provided',201),(215,'30,900,000','33,400,000','15q13.3','Not provided',202),(216,'','','Xq28','Not provided',203),(217,'192,600,000','198,295,559','3q29','Not provided',204),(218,'','','17q21.31','Not provided',205),(219,'','','15q13.3','Not provided',206),(220,'','','15q13.2','Not provided',207),(221,'27,400,000','33,500,000','17q11.2','Not provided',208);
/*!40000 ALTER TABLE `Location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Microindel`
--

DROP TABLE IF EXISTS `Microindel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Microindel` (
  `idMicroindel` int(11) NOT NULL,
  `Info` text,
  `Name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idMicroindel`),
  FULLTEXT (`Info`),
  FULLTEXT (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Microindel`
--

LOCK TABLES `Microindel` WRITE;
/*!40000 ALTER TABLE `Microindel` DISABLE KEYS */;
INSERT INTO `Microindel` VALUES (1,'-/AT','rs470063'),(2,'-/CA','rs470099'),(3,'-/C/CC','rs866898'),(4,'-/G','rs866904'),(5,'-/A','rs361504'),(6,'-/A/T','rs361518'),(7,'-/A','rs361523'),(8,'-/TCAACATTTAT','rs361527'),(9,'-/CAA','rs361532'),(10,'-/GTTTGTTT','rs361536'),(11,'-/A','rs361549'),(12,'-/T','rs361552'),(13,'-/TTTG','rs361560'),(14,'-/ACTC','rs361571'),(15,'-/G','rs361576'),(16,'-/G','rs361578'),(17,'-/T','rs361590'),(18,'-/A','rs361610'),(19,'-/A','rs361619'),(20,'-/C','rs361622'),(21,'-/AA','rs361625'),(22,'-/C','rs361628'),(23,'-/T','rs361629'),(24,'-/TT','rs361635'),(25,'-/GTA','rs361638'),(26,'-/T','rs361649'),(27,'-/TTTCTT','rs361657'),(28,'-/AAAC/AAACAAAC','rs361665'),(29,'-/TTT/TTTT','rs361677'),(30,'-/A','rs361690'),(31,'-/A','rs361699'),(32,'-/A','rs361700'),(33,'-/A','rs361706'),(34,'-/T','rs361707'),(35,'-/TTTTTGT','rs361711'),(36,'-/AATA/AATAAATA','rs361719'),(37,'-/ACAG','rs361723'),(38,'-/G','rs361740'),(39,'-/A/G','rs361745'),(40,'-/TTTTG','rs361756'),(41,'-/A','rs361761'),(42,'-/GTGTGTGTGC','rs361765'),(43,'-/T','rs361770'),(44,'-/A/AAA/AAAA','rs361772'),(45,'-/GATG/TATG','rs361774'),(46,'-/TGGG/TGGT/TTGG','rs361782'),(47,'-/GAAA','rs361786'),(48,'-/GC','rs361804'),(49,'-/TACAAA/A','rs361806'),(50,'-/G','rs361819'),(51,'-/A/AA','rs361824'),(52,'-/A','rs361831'),(53,'-/G','rs361832'),(54,'-/AGGA/GGA','rs361833'),(55,'-/GCAGTC','rs361839'),(56,'-/G','rs361840'),(57,'-/GTG','rs361841'),(58,'-/G','rs361848'),(59,'-/CT','rs361849'),(60,'-/T','rs361869'),(61,'-/TG','rs361870'),(62,'-/TTT/TT/T','rs361881'),(63,'-/AA/A','rs361884'),(64,'-/T','rs361892'),(65,'-/CGGAGCCAGAGGGCCGGGGGGTCCCACA','rs361903'),(66,'-/AA/A','rs361908'),(67,'-/T','rs361910'),(68,'-/T/TT','rs361911'),(69,'-/CAG','rs361923'),(70,'-/A/AA/AAAAAAAA','rs361931'),(71,'-/CT','rs361941'),(72,'-/A','rs361943'),(73,'-/A/AA','rs361953'),(74,'-/GT/GTTTTT/TTTTG/TTTTTTTTT','rs361962'),(75,'-/T','rs361967'),(76,'-/C','rs361968'),(77,'-/AAAAAAAAAAAAAAAA','rs361972'),(78,'-/AAA/AAAAA','rs361977'),(79,'-/C','rs361994'),(80,'-/T/TAAAA/TAAAATAAAATAAAA/TAAAG','rs362018'),(81,'-/GAA','rs362033'),(82,'-/GA/GAAA/GATA','rs362034'),(83,'-/A/AA','rs362039'),(84,'-/T','rs362055'),(85,'-/C','rs362058'),(86,'-/TA','rs362081'),(87,'-/A','rs362104'),(88,'-/ACA','rs362114'),(89,'-/A','rs362117'),(90,'-/A','rs362121'),(91,'-/TT','rs362122'),(92,'-/G','rs362123'),(93,'-/GGTA/T','rs362127'),(94,'-/CT/TTT/TT/T','rs362136'),(95,'-/CATA','rs362140'),(96,'-/A','rs362143'),(97,'-/TT/T','rs362145'),(98,'-/A','rs362170'),(99,'-/A','rs362186'),(100,'-/CCT','rs362224'),(101,'-/TT','rs362237'),(102,'-/AAAAA/AAAAAAA/AAAAAAAA','rs362248'),(103,'-/AA','rs362260'),(104,'-/T','rs362261'),(105,'-/TCT','rs363764'),(106,'-/ACAC','rs363779'),(107,'-/TGTT/TTGTT','rs1143705'),(108,'-/CCT','rs1160845'),(109,'-/CTTGTG','rs1160846'),(110,'-/TAAAA','rs1160847'),(111,'-/GCCCC','rs1160848'),(112,'-/TATA','rs1160849'),(113,'-/AA','rs1160852'),(114,'-/CT','rs1160856'),(115,'-/TG','rs1160857'),(116,'-/TG','rs1160858'),(117,'-/AG','rs1160859'),(118,'-/GA','rs1160860'),(119,'-/CT','rs1160861'),(120,'-/TA','rs1160863'),(121,'-/TC','rs1160864'),(122,'-/CCAGTC','rs1160865'),(123,'-/CTT/TTC','rs1160866'),(124,'-/CTC/CT','rs1160867'),(125,'-/TT','rs1160870'),(126,'-/C','rs1160874'),(127,'-/AAGTA','rs1160877'),(128,'-/GTGA','rs1160878'),(129,'-/AAG','rs1160879'),(130,'-/TCTA','rs1160880'),(131,'-/GAT/TGA','rs1160885'),(132,'-/CAAA/AAAC','rs1160888'),(133,'-/AGAA/CAGA/AGA','rs1160889'),(134,'-/AG','rs1160893'),(135,'-/CAT','rs1160894'),(136,'-/GT','rs1160895'),(137,'-/TCT','rs1160897'),(138,'-/ACA','rs1160901'),(139,'-/AAT','rs1160904'),(140,'-/AACTC','rs1160906'),(141,'-/GA','rs1160907'),(142,'-/GTCA','rs1160909'),(143,'-/CTTT','rs1160910'),(144,'-/AT','rs1160911'),(145,'-/AAG','rs1160913'),(146,'-/AAGA','rs1160915'),(147,'-/AC','rs1160916'),(148,'-/CACT','rs1160918'),(149,'-/AC','rs1160919'),(150,'-/CA','rs1160920'),(151,'-/TT','rs1160921'),(152,'-/CT','rs1160922'),(153,'-/AG','rs1160923'),(154,'-/A/AG','rs1160924'),(155,'-/AT','rs1160926'),(156,'-/CA','rs1160927'),(157,'-/CT','rs1160929'),(158,'-/AG','rs1160931'),(159,'-/GG','rs1160932'),(160,'-/CA','rs1160934'),(161,'-/CTC','rs1160938'),(162,'-/CCT','rs1160940'),(163,'-/GCTTTT','rs1160941'),(164,'-/TTGT','rs1160942'),(165,'-/CCT','rs1160945'),(166,'-/GGTA/GG','rs1160946'),(167,'-/AGT','rs1160948'),(168,'-/ATA','rs1160951'),(169,'-/GGA','rs1160952'),(170,'-/TAGA','rs1160953'),(171,'-/ACA','rs1160954'),(172,'-/AC/CA','rs1160955'),(173,'-/TCT','rs1160956'),(174,'-/GTA/TAG','rs1160957'),(175,'-/C/CAT','rs1160958'),(176,'-/TT','rs1160961'),(177,'-/TT','rs1160962'),(178,'-/CT','rs1160967'),(179,'-/AA','rs1160969'),(180,'-/TT','rs1160972'),(181,'-/AG','rs1160973'),(182,'-/AA','rs1160975'),(183,'-/TA/TC','rs1160978'),(184,'-/CATA','rs1305039'),(185,'-/CATT','rs1305040'),(186,'-/CT','rs1305043'),(187,'-/CCTTGTTGC','rs1305044'),(188,'-/TG/GT','rs1305046'),(189,'-/CACA','rs1305047'),(190,'-/AACT/TAAC','rs1305050'),(191,'-/TT','rs1305053'),(192,'-/CCTACAAAACTACTGTAGTTTTT','rs1305054'),(193,'-/AAAG','rs1305055'),(194,'-/CTACTGAT','rs1305056'),(195,'-/GCTCCAGACATCTGGGGA/CTCCAGACATCTGGGGAG','rs1305058'),(196,'-/TGACC','rs1305059'),(197,'-/AATTA','rs1305061'),(198,'','DUP22Q11.2'),(199,'','DUPXP11.22'),(200,'','DUP3Q29'),(201,'','CXDUPQ26.3'),(202,'','DEL15Q13.3'),(203,'','DELXQ28'),(204,'','DEL3Q29'),(205,'','DEL17Q21.31'),(206,'This region is known to undergo non-allelic homologous recombination (NAHR) with a similar low-copy repeat region, the 15q13 proximal microdeletion breakpoint recombination region, which is located nearly 2 Mb centromere-proximal to this region, in direct orientation. NAHR between these recombination regions can lead to deletions of the intervening sequence, and has been associated with intellectual disabilities and/or developmental delays. While deletions of the intervening sequences has been observed in many affected individuals, finer mapping of the recombination regions has been limited to a small number of individuals. This recombination region partially overlaps that of a golgin A8 family member (GOLGA8 family), and the palindromic nature of the genes within this gene family has been implicated in the recombination events. [provided by RefSeq, Oct 2016]','LOC106736481'),(207,'This region is known to undergo non-allelic homologous recombination (NAHR) with a similar low-copy repeat region, the 15q13 distal microdeletion recombination region, which is located nearly 2 Mb centromere-distal to this region, in direct orientation. NAHR between these recombination regions can lead to deletions of the intervening sequence, and may be associated with autism. While deletions of the intervening sequences has been observed in many affected individuals, finer mapping of the recombination regions has been limited to a small number of individuals. This recombination region partially overlaps that of a golgin A8 family member (GOLGA8 family), and the palindromic nature of the genes within this gene family has been implicated in the recombination events. [provided by RefSeq, Oct 2016]','LOC106736480'),(208,'','DEL17Q11.2');
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
INSERT INTO `Microindel_has_ClinicalSignificance` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(31,1),(32,1),(33,1),(34,1),(35,1),(36,1),(37,1),(38,1),(39,1),(40,1),(41,1),(42,1),(43,1),(44,1),(45,1),(46,1),(47,1),(48,1),(49,1),(50,1),(51,1),(52,1),(53,1),(54,1),(55,1),(56,1),(57,1),(58,1),(59,1),(60,1),(61,1),(62,1),(63,1),(64,1),(65,1),(66,1),(67,1),(68,1),(69,1),(70,1),(71,1),(72,1),(73,1),(74,1),(75,1),(76,1),(77,1),(78,1),(79,1),(80,1),(81,1),(82,1),(83,1),(84,1),(85,1),(86,1),(87,1),(88,1),(89,1),(90,1),(91,1),(92,1),(93,1),(94,1),(95,1),(96,1),(97,1),(98,1),(99,1),(100,1),(101,1),(102,1),(103,1),(104,1),(105,1),(106,1),(107,1),(108,1),(109,1),(110,1),(111,1),(112,1),(113,1),(114,1),(115,1),(116,1),(117,1),(118,1),(119,1),(120,1),(121,1),(122,1),(123,1),(124,1),(125,1),(126,1),(127,1),(128,1),(129,1),(130,1),(131,1),(132,1),(133,1),(134,1),(135,1),(136,1),(137,1),(138,1),(139,1),(140,1),(141,1),(142,1),(143,1),(144,1),(145,1),(146,1),(147,1),(148,1),(149,1),(150,1),(151,1),(152,1),(153,1),(154,1),(155,1),(156,1),(157,1),(158,1),(159,1),(160,1),(161,1),(162,1),(163,1),(164,1),(165,1),(166,1),(167,1),(168,1),(169,1),(170,1),(171,1),(172,1),(173,1),(174,1),(175,1),(176,1),(177,1),(178,1),(179,1),(180,1),(181,1),(182,1),(183,1),(184,1),(185,1),(186,1),(187,1),(188,1),(189,1),(190,1),(191,1),(192,1),(193,1),(194,1),(195,1),(196,1),(197,1),(198,1),(199,1),(200,1),(201,1),(202,1),(203,1),(204,1),(205,1),(206,1),(207,1),(208,1),(14,2);
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
INSERT INTO `Microindel_has_Disease` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(31,1),(32,1),(33,1),(34,1),(35,1),(36,1),(37,1),(38,1),(39,1),(40,1),(41,1),(42,1),(43,1),(44,1),(45,1),(46,1),(47,1),(48,1),(49,1),(50,1),(51,1),(52,1),(53,1),(54,1),(55,1),(56,1),(57,1),(58,1),(59,1),(60,1),(61,1),(62,1),(63,1),(64,1),(65,1),(66,1),(67,1),(68,1),(69,1),(70,1),(71,1),(72,1),(73,1),(74,1),(75,1),(76,1),(77,1),(78,1),(79,1),(80,1),(81,1),(82,1),(83,1),(84,1),(85,1),(86,1),(87,1),(88,1),(89,1),(90,1),(91,1),(92,1),(93,1),(94,1),(95,1),(96,1),(97,1),(98,1),(99,1),(100,1),(101,1),(102,1),(103,1),(104,1),(105,1),(106,1),(107,1),(108,1),(109,1),(110,1),(111,1),(112,1),(113,1),(114,1),(115,1),(116,1),(117,1),(118,1),(119,1),(120,1),(121,1),(122,1),(123,1),(124,1),(125,1),(126,1),(127,1),(128,1),(129,1),(130,1),(131,1),(132,1),(133,1),(134,1),(135,1),(136,1),(137,1),(138,1),(139,1),(140,1),(141,1),(142,1),(143,1),(144,1),(145,1),(146,1),(147,1),(148,1),(149,1),(150,1),(151,1),(152,1),(153,1),(154,1),(155,1),(156,1),(157,1),(158,1),(159,1),(160,1),(161,1),(162,1),(163,1),(164,1),(165,1),(166,1),(167,1),(168,1),(169,1),(170,1),(171,1),(172,1),(173,1),(174,1),(175,1),(176,1),(177,1),(178,1),(179,1),(180,1),(181,1),(182,1),(183,1),(184,1),(185,1),(186,1),(187,1),(188,1),(189,1),(190,1),(191,1),(192,1),(193,1),(194,1),(195,1),(196,1),(197,1),(206,1),(207,1),(14,2),(198,3),(199,4),(200,5),(201,6),(202,7),(203,8),(204,9),(205,10),(208,11);
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
INSERT INTO `Microindel_has_Reference` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(31,1),(32,1),(33,1),(34,1),(35,1),(36,1),(37,1),(38,1),(39,1),(40,1),(41,1),(42,1),(43,1),(44,1),(45,1),(46,1),(47,1),(48,1),(49,1),(50,1),(51,1),(52,1),(53,1),(54,1),(55,1),(56,1),(57,1),(58,1),(59,1),(60,1),(61,1),(62,1),(63,1),(64,1),(65,1),(66,1),(67,1),(68,1),(69,1),(70,1),(71,1),(72,1),(73,1),(74,1),(75,1),(76,1),(77,1),(78,1),(79,1),(80,1),(81,1),(82,1),(83,1),(84,1),(85,1),(86,1),(87,1),(88,1),(89,1),(90,1),(91,1),(92,1),(93,1),(94,1),(95,1),(96,1),(97,1),(98,1),(99,1),(100,1),(102,1),(103,1),(104,1),(105,1),(106,1),(107,1),(108,1),(109,1),(110,1),(111,1),(112,1),(114,1),(115,1),(116,1),(117,1),(118,1),(119,1),(120,1),(121,1),(122,1),(123,1),(124,1),(125,1),(126,1),(127,1),(128,1),(129,1),(130,1),(131,1),(132,1),(133,1),(135,1),(136,1),(137,1),(139,1),(140,1),(141,1),(142,1),(143,1),(144,1),(145,1),(146,1),(147,1),(148,1),(149,1),(150,1),(151,1),(152,1),(153,1),(154,1),(155,1),(156,1),(157,1),(158,1),(159,1),(160,1),(161,1),(162,1),(163,1),(164,1),(165,1),(166,1),(167,1),(168,1),(169,1),(170,1),(171,1),(172,1),(173,1),(174,1),(175,1),(176,1),(177,1),(178,1),(179,1),(180,1),(181,1),(183,1),(184,1),(185,1),(186,1),(187,1),(188,1),(190,1),(191,1),(192,1),(193,1),(196,1),(197,1),(199,1),(203,1),(204,1),(205,1),(208,1),(21,2),(101,3),(113,4),(134,4),(138,5),(182,6),(189,7),(189,8),(189,9),(194,9),(189,10),(195,11),(198,12),(198,13),(200,14),(201,14),(202,15),(206,16),(207,16);
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
  PRIMARY KEY (`idReference`),
  FULLTEXT (`PMID`,`DB`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reference`
--

LOCK TABLES `Reference` WRITE;
/*!40000 ALTER TABLE `Reference` DISABLE KEYS */;
INSERT INTO `Reference` VALUES (1,'Not provided','dbSNP'),(2,'26837816','dbSNP'),(3,'21285523','dbSNP'),(4,'22272242','dbSNP'),(5,'16039051','dbSNP'),(6,'17997390','dbSNP'),(7,'21359226','dbSNP'),(8,'22124616','dbSNP'),(9,'23690203','dbSNP'),(10,'24416183','dbSNP'),(11,'19515250','dbSNP'),(12,'22876571','NCBI'),(13,'23521024','NCBI'),(14,'25470569','NCBI'),(15,'24246141','NCBI'),(16,'25326701','NCBI');
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

-- Dump completed on 2018-02-02 15:27:47
