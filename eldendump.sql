-- MySQL dump 10.19  Distrib 10.3.31-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: eldenbees
-- ------------------------------------------------------
-- Server version	10.3.31-MariaDB-0+deb10u1

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
-- Table structure for table `ASI`
--

DROP TABLE IF EXISTS `ASI`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ASI` (
  `ASIID` int(8) NOT NULL AUTO_INCREMENT,
  `Strength` int(2) DEFAULT NULL,
  `Dexterity` int(2) DEFAULT NULL,
  `Constitution` int(2) DEFAULT NULL,
  `Intelligence` int(2) DEFAULT NULL,
  `Wisdom` int(2) DEFAULT NULL,
  `Charisma` int(2) DEFAULT NULL,
  PRIMARY KEY (`ASIID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ASI`
--

LOCK TABLES `ASI` WRITE;
/*!40000 ALTER TABLE `ASI` DISABLE KEYS */;
INSERT INTO `ASI` VALUES (1,1,1,1,1,1,1),(2,NULL,2,NULL,NULL,NULL,NULL),(3,NULL,NULL,NULL,1,NULL,NULL);
/*!40000 ALTER TABLE `ASI` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Account`
--

DROP TABLE IF EXISTS `Account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Account` (
  `Username` varchar(32) NOT NULL,
  `Password` varchar(60) NOT NULL,
  PRIMARY KEY (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 `ENCRYPTION_KEY_ID`=100;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Account`
--

LOCK TABLES `Account` WRITE;
/*!40000 ALTER TABLE `Account` DISABLE KEYS */;
INSERT INTO `Account` VALUES ('admin','$2y$10$V3EoUgJreBYpnY01APdUH.CSYNb/mahyHuQyohQHD51Eq9zHkx9jK'),('cchang3','$2y$10$ofEwIZYJ/IXczs/KE36wqui7Zrz9jD0Nos3CP0I773oJe.AaWg7Cu'),('cfulker0','$2y$10$xh9BuamcfvZCVmKiMirybuhJy0KPS3qRwDRiJEMjN2BwHPnsujSFG'),('dortiger2','$2y$10$ZfjBGCRvA5/EO8SwXhkoPOFRlOzUhGHRaG7iYXZO65rDRdMVgojnS'),('HellishDM','$2y$10$DE8xeKEKQ4MYpZUwR2Zfv.4RldK/h73DdYXkdFguYNIv2IVQZfBzG'),('ilebourn1','$2y$10$OApbckO4jNgdjtCKDOkmme7YNVZt2F5nQCbsmm./02B17XEqTHKsG'),('Island','$2y$10$t29M7cgZkE4L7gAfwctNfe2EGD7j5nce.g4ZUGfi6I.1DFlO7pMpa'),('wcrotch8','$2y$10$ne7lGwDak9JiuG6hgVxjS.uIi39VSUB8ifdq/FwQnnJrf38y7JI5O'),('wdandrea7','$2y$10$O.n/WjSPIj87AEKWf9C6A.PLLFgfN9B9p51sMTvpHlXA.rOnxbL3a'),('zgipps4','$2y$10$zu63iqjbPP/cWOF.ntmSpuFdRvuEbj5BUsmoQ6fQUYSkdlp3epvWW');
/*!40000 ALTER TABLE `Account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Background`
--

DROP TABLE IF EXISTS `Background`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Background` (
  `Bckgrnd_Name` varchar(32) NOT NULL,
  `ERID` int(8) DEFAULT NULL,
  `FRID` int(8) DEFAULT NULL,
  `LRID` int(8) DEFAULT NULL,
  `PRID` int(8) DEFAULT NULL,
  `Description` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`Bckgrnd_Name`),
  KEY `ERID` (`ERID`),
  KEY `FRID` (`FRID`),
  KEY `LRID` (`LRID`),
  KEY `PRID` (`PRID`),
  CONSTRAINT `Background_ibfk_1` FOREIGN KEY (`ERID`) REFERENCES `EquipmentHaver` (`ERID`),
  CONSTRAINT `Background_ibfk_2` FOREIGN KEY (`FRID`) REFERENCES `FeatHaver` (`FRID`),
  CONSTRAINT `Background_ibfk_3` FOREIGN KEY (`LRID`) REFERENCES `LanguageHaver` (`LRID`),
  CONSTRAINT `Background_ibfk_4` FOREIGN KEY (`PRID`) REFERENCES `Proficiencies` (`PRID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Background`
--

LOCK TABLES `Background` WRITE;
/*!40000 ALTER TABLE `Background` DISABLE KEYS */;
INSERT INTO `Background` VALUES ('Acolyte',4,7,NULL,2,NULL),('Soldier',1,2,NULL,1,NULL);
/*!40000 ALTER TABLE `Background` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Campaign`
--

DROP TABLE IF EXISTS `Campaign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Campaign` (
  `Camp_ID` int(8) NOT NULL AUTO_INCREMENT,
  `Username` varchar(32) NOT NULL,
  `Name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`Camp_ID`),
  KEY `Username` (`Username`),
  CONSTRAINT `Campaign_ibfk_1` FOREIGN KEY (`Username`) REFERENCES `Account` (`Username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Campaign`
--

LOCK TABLES `Campaign` WRITE;
/*!40000 ALTER TABLE `Campaign` DISABLE KEYS */;
INSERT INTO `Campaign` VALUES (1,'Island','Foundation'),(2,'HellishDM','NotNewVegas'),(3,'ilebourn1','FarFarAway');
/*!40000 ALTER TABLE `Campaign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `Campaign_Characters`
--

DROP TABLE IF EXISTS `Campaign_Characters`;
/*!50001 DROP VIEW IF EXISTS `Campaign_Characters`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `Campaign_Characters` (
  `Camp_ID` tinyint NOT NULL,
  `Char_Name` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `Campaign_DMs_Characters`
--

DROP TABLE IF EXISTS `Campaign_DMs_Characters`;
/*!50001 DROP VIEW IF EXISTS `Campaign_DMs_Characters`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `Campaign_DMs_Characters` (
  `Char_ID` tinyint NOT NULL,
  `Username` tinyint NOT NULL,
  `Char_Name` tinyint NOT NULL,
  `Camp_ID` tinyint NOT NULL,
  `Name` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `Characters_Count`
--

DROP TABLE IF EXISTS `Characters_Count`;
/*!50001 DROP VIEW IF EXISTS `Characters_Count`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `Characters_Count` (
  `Username` tinyint NOT NULL,
  `OwnedCharacters` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Class`
--

DROP TABLE IF EXISTS `Class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Class` (
  `Class_Name` varchar(100) NOT NULL,
  `HP` int(3) NOT NULL,
  `ERID` int(8) DEFAULT NULL,
  `FRID` int(8) DEFAULT NULL,
  `PRID` int(8) DEFAULT NULL,
  `SAID` int(8) DEFAULT NULL,
  `Description` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`Class_Name`),
  KEY `ERID` (`ERID`),
  KEY `FRID` (`FRID`),
  KEY `PRID` (`PRID`),
  KEY `SAID` (`SAID`),
  CONSTRAINT `Class_ibfk_1` FOREIGN KEY (`ERID`) REFERENCES `EquipmentHaver` (`ERID`),
  CONSTRAINT `Class_ibfk_2` FOREIGN KEY (`FRID`) REFERENCES `FeatHaver` (`FRID`),
  CONSTRAINT `Class_ibfk_3` FOREIGN KEY (`PRID`) REFERENCES `Proficiencies` (`PRID`),
  CONSTRAINT `Class_ibfk_4` FOREIGN KEY (`SAID`) REFERENCES `Saves` (`SAID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Class`
--

LOCK TABLES `Class` WRITE;
/*!40000 ALTER TABLE `Class` DISABLE KEYS */;
INSERT INTO `Class` VALUES ('Cleric',8,3,6,3,2,NULL),('Fighter',6,2,1,1,1,NULL);
/*!40000 ALTER TABLE `Class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Equipment`
--

DROP TABLE IF EXISTS `Equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Equipment` (
  `EID` int(8) NOT NULL AUTO_INCREMENT,
  `Eqpmnt_Name` varchar(32) NOT NULL,
  `Type` varchar(32) DEFAULT NULL,
  `Weight` float DEFAULT NULL,
  `Damage` varchar(32) DEFAULT NULL,
  `ACBonus` int(2) DEFAULT NULL,
  `Description` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`EID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 `ENCRYPTION_KEY_ID`=100;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Equipment`
--

LOCK TABLES `Equipment` WRITE;
/*!40000 ALTER TABLE `Equipment` DISABLE KEYS */;
INSERT INTO `Equipment` VALUES (1,'Longsword','Weapon, Melee, Martial',3,'1d8 OH, 1d10 TH, Slashing',NULL,'Versatile | A sword which may be used in one or two hands.'),(2,'Insignia of Rank','Trinket',NULL,NULL,NULL,'An insignia bearing a rank.'),(3,'Chain Mail','Armor, Heavy',55,NULL,6,'Stealth: Disadvantage | A layer of interlocked metal rings, under which a quilted fabric is worn.  Gauntlets are included.'),(4,'Leather Armor','Armor, Light',10,NULL,1,'Light Armor | A breastplate and pauldrons of hardened leather.'),(5,'Shield','Shield',6,NULL,2,'A wooden shield | Adds 2 to armor class when equipped.'),(6,'Holy Symbol','Trinket',NULL,NULL,NULL,'A holy symbol'),(7,'Prayer Book','Trinket',NULL,NULL,NULL,'A book of prayers.'),(8,'Vestments','Apparel',NULL,NULL,NULL,'A set of holy vestments.'),(9,'Common Clothes','Apparel',3,NULL,NULL,'5sp | A set of common Clothes'),(10,'Mace','Weapon, Melee, Simple',4,'1d6 Bludgeoning',NULL,'A stick with a metal ball on the end.'),(11,'Warhammer','Weapon, Melee, Martial',2,'1d8 OH, 1d10 TH, Bludgeoning',NULL,'15gp | Versatile | A hammer on a long stick built for war.'),(12,'Scale Mail','Armor, Medium',45,NULL,14,'A set of armor comprised of leather with overlapping pieces of metals.');
/*!40000 ALTER TABLE `Equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EquipmentHaver`
--

DROP TABLE IF EXISTS `EquipmentHaver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EquipmentHaver` (
  `ERID` int(8) NOT NULL AUTO_INCREMENT,
  `source` varchar(32) NOT NULL,
  PRIMARY KEY (`ERID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EquipmentHaver`
--

LOCK TABLES `EquipmentHaver` WRITE;
/*!40000 ALTER TABLE `EquipmentHaver` DISABLE KEYS */;
INSERT INTO `EquipmentHaver` VALUES (1,'Soldier'),(2,'Fighter'),(3,'Cleric'),(4,'Acolyte');
/*!40000 ALTER TABLE `EquipmentHaver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EquipmentRepo`
--

DROP TABLE IF EXISTS `EquipmentRepo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EquipmentRepo` (
  `ERID` int(8) NOT NULL,
  `EID` int(8) NOT NULL,
  KEY `ERID` (`ERID`),
  KEY `EID` (`EID`),
  CONSTRAINT `EquipmentRepo_ibfk_1` FOREIGN KEY (`ERID`) REFERENCES `EquipmentHaver` (`ERID`),
  CONSTRAINT `EquipmentRepo_ibfk_2` FOREIGN KEY (`EID`) REFERENCES `Equipment` (`EID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EquipmentRepo`
--

LOCK TABLES `EquipmentRepo` WRITE;
/*!40000 ALTER TABLE `EquipmentRepo` DISABLE KEYS */;
INSERT INTO `EquipmentRepo` VALUES (1,1),(1,2),(2,1),(3,10),(3,11),(3,12),(4,6),(4,7);
/*!40000 ALTER TABLE `EquipmentRepo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FeatHaver`
--

DROP TABLE IF EXISTS `FeatHaver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FeatHaver` (
  `FRID` int(8) NOT NULL AUTO_INCREMENT,
  `source` varchar(32) NOT NULL,
  PRIMARY KEY (`FRID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FeatHaver`
--

LOCK TABLES `FeatHaver` WRITE;
/*!40000 ALTER TABLE `FeatHaver` DISABLE KEYS */;
INSERT INTO `FeatHaver` VALUES (1,'Fighter'),(2,'Soldier'),(5,'Champion'),(6,'Cleric'),(7,'Acolyte');
/*!40000 ALTER TABLE `FeatHaver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FeatRepo`
--

DROP TABLE IF EXISTS `FeatRepo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FeatRepo` (
  `FRID` int(8) NOT NULL,
  `FID` int(8) NOT NULL,
  KEY `FRID` (`FRID`),
  KEY `FID` (`FID`),
  CONSTRAINT `FeatRepo_ibfk_1` FOREIGN KEY (`FRID`) REFERENCES `FeatHaver` (`FRID`),
  CONSTRAINT `FeatRepo_ibfk_2` FOREIGN KEY (`FID`) REFERENCES `Feats` (`FID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FeatRepo`
--

LOCK TABLES `FeatRepo` WRITE;
/*!40000 ALTER TABLE `FeatRepo` DISABLE KEYS */;
INSERT INTO `FeatRepo` VALUES (1,1),(2,2),(5,3),(1,15),(1,14),(1,3),(1,3),(6,19),(6,20),(7,21);
/*!40000 ALTER TABLE `FeatRepo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Feats`
--

DROP TABLE IF EXISTS `Feats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Feats` (
  `FID` int(8) NOT NULL AUTO_INCREMENT,
  `Ft_Name` varchar(512) NOT NULL,
  `Level` int(2) DEFAULT NULL,
  `Description` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`FID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Feats`
--

LOCK TABLES `Feats` WRITE;
/*!40000 ALTER TABLE `Feats` DISABLE KEYS */;
INSERT INTO `Feats` VALUES (1,'Second Wind',1,'Once per rest. 1 Bonus action to regain HP equal to 1d10 + fighter level.'),(2,'Military Rank',NULL,'You have a military rank. You may use this to exert your influence where it is recognized.'),(3,'Improved Critical',3,'Your weapon attacks are criticals on a 19 or 20'),(12,'Darkvision',NULL,'You can see dim light within 60 feet of you as bright light, and darkness as if it were dim.'),(14,'Action Surge',2,'Once per rest, on your turn, you take an additional action.'),(15,'Ability Score Improvement 4',4,'You may increase one ability score of your choice by 2, or 2 by 1. Or, you may take an additional feat.'),(16,'Fighting Style',1,'You choose a style of fighting from the options from the Fighter Fighting Styles.'),(17,'Martial Archetype',3,'You choose a subclass for the Fighter class.'),(18,'Extra Attack 5',5,'When you take the Attack Action, you may attack one more time.'),(19,'Spellcasting 1',1,'A conduit for magical powers, you may cast spells according to your class spellcasting rules.'),(20,'Divine Domain',1,'You choose a subclass for the Cleric Class'),(21,'Shelter of the Faithful',NULL,'People who share your religion will support you more heavily than usual.');
/*!40000 ALTER TABLE `Feats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LanguageHaver`
--

DROP TABLE IF EXISTS `LanguageHaver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LanguageHaver` (
  `LRID` int(8) NOT NULL AUTO_INCREMENT,
  `source` varchar(32) NOT NULL,
  PRIMARY KEY (`LRID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LanguageHaver`
--

LOCK TABLES `LanguageHaver` WRITE;
/*!40000 ALTER TABLE `LanguageHaver` DISABLE KEYS */;
INSERT INTO `LanguageHaver` VALUES (1,'Human');
/*!40000 ALTER TABLE `LanguageHaver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LanguageRepo`
--

DROP TABLE IF EXISTS `LanguageRepo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LanguageRepo` (
  `LRID` int(8) NOT NULL,
  `LID` int(8) NOT NULL,
  KEY `LRID` (`LRID`),
  KEY `LID` (`LID`),
  CONSTRAINT `LanguageRepo_ibfk_1` FOREIGN KEY (`LRID`) REFERENCES `LanguageHaver` (`LRID`),
  CONSTRAINT `LanguageRepo_ibfk_2` FOREIGN KEY (`LID`) REFERENCES `Languages` (`LID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LanguageRepo`
--

LOCK TABLES `LanguageRepo` WRITE;
/*!40000 ALTER TABLE `LanguageRepo` DISABLE KEYS */;
INSERT INTO `LanguageRepo` VALUES (1,1),(1,1);
/*!40000 ALTER TABLE `LanguageRepo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Languages`
--

DROP TABLE IF EXISTS `Languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Languages` (
  `LID` int(8) NOT NULL AUTO_INCREMENT,
  `Lang_Name` varchar(32) NOT NULL,
  PRIMARY KEY (`LID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Languages`
--

LOCK TABLES `Languages` WRITE;
/*!40000 ALTER TABLE `Languages` DISABLE KEYS */;
INSERT INTO `Languages` VALUES (1,'Common'),(2,'Elvish'),(4,'Dwarven'),(5,'Infernal'),(6,'Abyssal'),(7,'Primordial'),(8,'Aquan');
/*!40000 ALTER TABLE `Languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ParticipatesIn`
--

DROP TABLE IF EXISTS `ParticipatesIn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ParticipatesIn` (
  `Char_ID` int(8) NOT NULL,
  `Camp_ID` int(8) NOT NULL,
  PRIMARY KEY (`Char_ID`,`Camp_ID`),
  KEY `Camp_ID` (`Camp_ID`),
  CONSTRAINT `ParticipatesIn_ibfk_1` FOREIGN KEY (`Char_ID`) REFERENCES `PlayerCharacter` (`Char_ID`),
  CONSTRAINT `ParticipatesIn_ibfk_2` FOREIGN KEY (`Camp_ID`) REFERENCES `Campaign` (`Camp_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ParticipatesIn`
--

LOCK TABLES `ParticipatesIn` WRITE;
/*!40000 ALTER TABLE `ParticipatesIn` DISABLE KEYS */;
INSERT INTO `ParticipatesIn` VALUES (1,1),(27,2),(40,2),(76,1),(76,2),(77,2),(95,1),(99,2);
/*!40000 ALTER TABLE `ParticipatesIn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PlayerAS`
--

DROP TABLE IF EXISTS `PlayerAS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PlayerAS` (
  `Char_ID` int(8) NOT NULL,
  `Strength` int(2) DEFAULT 10,
  `Dexterity` int(2) DEFAULT 10,
  `Constitution` int(2) DEFAULT 10,
  `Intelligence` int(2) DEFAULT 10,
  `Wisdom` int(2) DEFAULT 10,
  `Charisma` int(2) DEFAULT 10,
  PRIMARY KEY (`Char_ID`),
  CONSTRAINT `PlayerAS_ibfk_1` FOREIGN KEY (`Char_ID`) REFERENCES `PlayerCharacter` (`Char_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PlayerAS`
--

LOCK TABLES `PlayerAS` WRITE;
/*!40000 ALTER TABLE `PlayerAS` DISABLE KEYS */;
INSERT INTO `PlayerAS` VALUES (1,10,10,10,10,10,10);
/*!40000 ALTER TABLE `PlayerAS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PlayerCharacter`
--

DROP TABLE IF EXISTS `PlayerCharacter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PlayerCharacter` (
  `Char_ID` int(8) NOT NULL AUTO_INCREMENT,
  `Username` varchar(32) NOT NULL,
  `Char_Name` varchar(32) NOT NULL,
  `Bckgrnd_Name` varchar(32) NOT NULL,
  `Race_Name` varchar(32) NOT NULL,
  `SubR_Name` varchar(32) DEFAULT NULL,
  `ERID` int(8) DEFAULT NULL,
  `FRID` int(8) DEFAULT NULL,
  `LRID` int(8) DEFAULT NULL,
  `PRID` int(8) DEFAULT NULL,
  `ArmorClass` int(2) DEFAULT NULL,
  `Biography` varchar(512) DEFAULT NULL,
  `HP` varchar(8) DEFAULT NULL,
  `Level` int(2) DEFAULT NULL,
  `PersonalityTraits` varchar(512) DEFAULT NULL,
  `Photo` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`Char_ID`),
  KEY `Username` (`Username`),
  KEY `Bckgrnd_Name` (`Bckgrnd_Name`),
  KEY `Race_Name` (`Race_Name`),
  KEY `SubR_Name` (`SubR_Name`),
  KEY `ERID` (`ERID`),
  KEY `FRID` (`FRID`),
  KEY `LRID` (`LRID`),
  KEY `PRID` (`PRID`),
  CONSTRAINT `PlayerCharacter_ibfk_1` FOREIGN KEY (`Username`) REFERENCES `Account` (`Username`),
  CONSTRAINT `PlayerCharacter_ibfk_2` FOREIGN KEY (`Bckgrnd_Name`) REFERENCES `Background` (`Bckgrnd_Name`),
  CONSTRAINT `PlayerCharacter_ibfk_3` FOREIGN KEY (`Race_Name`) REFERENCES `Race` (`Race_Name`),
  CONSTRAINT `PlayerCharacter_ibfk_4` FOREIGN KEY (`SubR_Name`) REFERENCES `SubRace` (`SubR_Name`),
  CONSTRAINT `PlayerCharacter_ibfk_5` FOREIGN KEY (`ERID`) REFERENCES `EquipmentHaver` (`ERID`),
  CONSTRAINT `PlayerCharacter_ibfk_6` FOREIGN KEY (`FRID`) REFERENCES `FeatHaver` (`FRID`),
  CONSTRAINT `PlayerCharacter_ibfk_7` FOREIGN KEY (`LRID`) REFERENCES `LanguageHaver` (`LRID`),
  CONSTRAINT `PlayerCharacter_ibfk_8` FOREIGN KEY (`PRID`) REFERENCES `Proficiencies` (`PRID`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PlayerCharacter`
--

LOCK TABLES `PlayerCharacter` WRITE;
/*!40000 ALTER TABLE `PlayerCharacter` DISABLE KEYS */;
INSERT INTO `PlayerCharacter` VALUES (1,'Island','Anton','Soldier','Human',NULL,NULL,NULL,NULL,NULL,10,NULL,'6',1,NULL,NULL),(27,'wdandrea7','Léa','Entertainer','Half-Orc','Survivor',NULL,NULL,NULL,NULL,NULL,NULL,NULL,20,NULL,NULL),(29,'cfulker0','Anaïs','Acolyte','Half-Elf','Wild Elf',NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,NULL,NULL),(40,'ilebourn1','Loïc','Fisher','Gnome','Halfling',NULL,NULL,NULL,NULL,NULL,NULL,NULL,17,NULL,NULL),(60,'zgipps4','Yóu','Marine','Elf','Fire Elf',NULL,NULL,NULL,NULL,NULL,NULL,NULL,11,NULL,NULL),(70,'swadge6','Ráo','Athlete','Dwarf','Arcadian',NULL,NULL,NULL,NULL,NULL,NULL,NULL,20,NULL,NULL),(76,'ilebourn1','Styrbjörn','Urchin','Human','European',NULL,NULL,NULL,NULL,NULL,NULL,NULL,12,NULL,NULL),(77,'dortiger2','Faîtes','Criminal','Dragonborn','Lizard',NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,NULL),(86,'wcrotch8','Clémence','Courtier','Human','European',NULL,NULL,NULL,NULL,NULL,NULL,NULL,20,NULL,NULL),(95,'cchang3','Mélina','Noble','Halfling','Quarterling',NULL,NULL,NULL,NULL,NULL,NULL,NULL,20,NULL,NULL),(99,'HellishDM','Shrek','Entertainer','Orc','Survivor',NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,NULL),(100,'Island','Temeluchus','Acolyte','Elf','High Elf',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `PlayerCharacter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PlayerClass`
--

DROP TABLE IF EXISTS `PlayerClass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PlayerClass` (
  `Char_ID` int(8) NOT NULL,
  `Class_Name` varchar(32) NOT NULL,
  `SubC_Name` varchar(32) DEFAULT NULL,
  `Level` int(2) NOT NULL,
  KEY `Char_ID` (`Char_ID`),
  KEY `Class_Name` (`Class_Name`),
  KEY `SubC_Name` (`SubC_Name`),
  CONSTRAINT `PlayerClass_ibfk_1` FOREIGN KEY (`Char_ID`) REFERENCES `PlayerCharacter` (`Char_ID`),
  CONSTRAINT `PlayerClass_ibfk_2` FOREIGN KEY (`Class_Name`) REFERENCES `Class` (`Class_Name`),
  CONSTRAINT `PlayerClass_ibfk_3` FOREIGN KEY (`SubC_Name`) REFERENCES `SubClass` (`SubC_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PlayerClass`
--

LOCK TABLES `PlayerClass` WRITE;
/*!40000 ALTER TABLE `PlayerClass` DISABLE KEYS */;
INSERT INTO `PlayerClass` VALUES (1,'Fighter',NULL,1),(100,'Cleric',NULL,10);
/*!40000 ALTER TABLE `PlayerClass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PlayerProf`
--

DROP TABLE IF EXISTS `PlayerProf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PlayerProf` (
  `Char_ID` int(8) NOT NULL,
  `ProfBonus` int(2) DEFAULT 2,
  `Acrobatics` tinyint(1) DEFAULT 0,
  `AnimalHandling` tinyint(1) DEFAULT 0,
  `Arcana` tinyint(1) DEFAULT 0,
  `Athletics` tinyint(1) DEFAULT 0,
  `Deception` tinyint(1) DEFAULT 0,
  `History` tinyint(1) DEFAULT 0,
  `Insight` tinyint(1) DEFAULT 0,
  `Intimidation` tinyint(1) DEFAULT 0,
  `Investigation` tinyint(1) DEFAULT 0,
  `Medicine` tinyint(1) DEFAULT 0,
  `Nature` tinyint(1) DEFAULT 0,
  `Perception` tinyint(1) DEFAULT 0,
  `Performance` tinyint(1) DEFAULT 0,
  `Persuasion` tinyint(1) DEFAULT 0,
  `Religion` tinyint(1) DEFAULT 0,
  `SleightOfHand` tinyint(1) DEFAULT 0,
  `Stealth` tinyint(1) DEFAULT 0,
  `Survival` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`Char_ID`),
  CONSTRAINT `PlayerProf_ibfk_1` FOREIGN KEY (`Char_ID`) REFERENCES `PlayerCharacter` (`Char_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 `ENCRYPTION_KEY_ID`=100;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PlayerProf`
--

LOCK TABLES `PlayerProf` WRITE;
/*!40000 ALTER TABLE `PlayerProf` DISABLE KEYS */;
INSERT INTO `PlayerProf` VALUES (1,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `PlayerProf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PlayerSaves`
--

DROP TABLE IF EXISTS `PlayerSaves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PlayerSaves` (
  `Char_ID` int(8) NOT NULL,
  `Strength` tinyint(1) DEFAULT 0,
  `Dexterity` tinyint(1) DEFAULT 0,
  `Constitution` tinyint(1) DEFAULT 0,
  `Intelligence` tinyint(1) DEFAULT 0,
  `Wisdom` tinyint(1) DEFAULT 0,
  `Charisma` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`Char_ID`),
  CONSTRAINT `PlayerSaves_ibfk_1` FOREIGN KEY (`Char_ID`) REFERENCES `PlayerCharacter` (`Char_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PlayerSaves`
--

LOCK TABLES `PlayerSaves` WRITE;
/*!40000 ALTER TABLE `PlayerSaves` DISABLE KEYS */;
INSERT INTO `PlayerSaves` VALUES (1,0,0,0,0,0,0);
/*!40000 ALTER TABLE `PlayerSaves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Proficiencies`
--

DROP TABLE IF EXISTS `Proficiencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Proficiencies` (
  `PRID` int(8) NOT NULL AUTO_INCREMENT,
  `Acrobatics` tinyint(1) DEFAULT NULL,
  `AnimalHandling` tinyint(1) DEFAULT NULL,
  `Arcana` tinyint(1) DEFAULT NULL,
  `Athletics` tinyint(1) DEFAULT NULL,
  `Deception` tinyint(1) DEFAULT NULL,
  `History` tinyint(1) DEFAULT NULL,
  `Insight` tinyint(1) DEFAULT NULL,
  `Intimidation` tinyint(1) DEFAULT NULL,
  `Investigation` tinyint(1) DEFAULT NULL,
  `Medicine` tinyint(1) DEFAULT NULL,
  `Nature` tinyint(1) DEFAULT NULL,
  `Perception` tinyint(1) DEFAULT NULL,
  `Performance` tinyint(1) DEFAULT NULL,
  `Persuasion` tinyint(1) DEFAULT NULL,
  `Religion` tinyint(1) DEFAULT NULL,
  `SleightOfHand` tinyint(1) DEFAULT NULL,
  `Stealth` tinyint(1) DEFAULT NULL,
  `Survival` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`PRID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 `ENCRYPTION_KEY_ID`=100;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Proficiencies`
--

LOCK TABLES `Proficiencies` WRITE;
/*!40000 ALTER TABLE `Proficiencies` DISABLE KEYS */;
INSERT INTO `Proficiencies` VALUES (1,NULL,NULL,NULL,1,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL),(3,NULL,NULL,NULL,NULL,NULL,1,1,NULL,NULL,1,NULL,NULL,NULL,1,1,NULL,NULL,NULL);
/*!40000 ALTER TABLE `Proficiencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Race`
--

DROP TABLE IF EXISTS `Race`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Race` (
  `Race_Name` varchar(32) NOT NULL,
  `ASIID` int(8) DEFAULT NULL,
  `FRID` int(8) DEFAULT NULL,
  `PRID` int(8) DEFAULT NULL,
  `SPRID` int(8) DEFAULT NULL,
  `Size` varchar(16) DEFAULT NULL,
  `Speed` int(3) DEFAULT NULL,
  `Description` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`Race_Name`),
  KEY `ASIID` (`ASIID`),
  KEY `FRID` (`FRID`),
  KEY `PRID` (`PRID`),
  KEY `SPRID` (`SPRID`),
  CONSTRAINT `Race_ibfk_1` FOREIGN KEY (`ASIID`) REFERENCES `ASI` (`ASIID`),
  CONSTRAINT `Race_ibfk_2` FOREIGN KEY (`FRID`) REFERENCES `FeatHaver` (`FRID`),
  CONSTRAINT `Race_ibfk_3` FOREIGN KEY (`PRID`) REFERENCES `Proficiencies` (`PRID`),
  CONSTRAINT `Race_ibfk_4` FOREIGN KEY (`SPRID`) REFERENCES `SpellHaver` (`SPRID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Race`
--

LOCK TABLES `Race` WRITE;
/*!40000 ALTER TABLE `Race` DISABLE KEYS */;
INSERT INTO `Race` VALUES ('Human',1,NULL,NULL,NULL,'Medium',30,NULL);
/*!40000 ALTER TABLE `Race` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Saves`
--

DROP TABLE IF EXISTS `Saves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Saves` (
  `SAID` int(8) NOT NULL AUTO_INCREMENT,
  `Strength` tinyint(1) DEFAULT NULL,
  `Dexterity` tinyint(1) DEFAULT NULL,
  `Constitution` tinyint(1) DEFAULT NULL,
  `Intelligence` tinyint(1) DEFAULT NULL,
  `Wisdom` tinyint(1) DEFAULT NULL,
  `Charisma` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`SAID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Saves`
--

LOCK TABLES `Saves` WRITE;
/*!40000 ALTER TABLE `Saves` DISABLE KEYS */;
INSERT INTO `Saves` VALUES (1,1,NULL,1,NULL,NULL,NULL),(2,NULL,NULL,NULL,NULL,1,1);
/*!40000 ALTER TABLE `Saves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SpellHaver`
--

DROP TABLE IF EXISTS `SpellHaver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SpellHaver` (
  `SPRID` int(8) NOT NULL AUTO_INCREMENT,
  `source` varchar(32) NOT NULL,
  PRIMARY KEY (`SPRID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SpellHaver`
--

LOCK TABLES `SpellHaver` WRITE;
/*!40000 ALTER TABLE `SpellHaver` DISABLE KEYS */;
/*!40000 ALTER TABLE `SpellHaver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Spellrepo`
--

DROP TABLE IF EXISTS `Spellrepo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Spellrepo` (
  `SPRID` int(8) NOT NULL,
  `SPID` int(8) NOT NULL,
  KEY `SPRID` (`SPRID`),
  KEY `SPID` (`SPID`),
  CONSTRAINT `Spellrepo_ibfk_1` FOREIGN KEY (`SPRID`) REFERENCES `SpellHaver` (`SPRID`),
  CONSTRAINT `Spellrepo_ibfk_2` FOREIGN KEY (`SPID`) REFERENCES `Spells` (`SPID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Spellrepo`
--

LOCK TABLES `Spellrepo` WRITE;
/*!40000 ALTER TABLE `Spellrepo` DISABLE KEYS */;
/*!40000 ALTER TABLE `Spellrepo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Spells`
--

DROP TABLE IF EXISTS `Spells`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Spells` (
  `SPID` int(8) NOT NULL AUTO_INCREMENT,
  `Spell_Name` varchar(32) NOT NULL,
  `Level` int(2) NOT NULL,
  `School` varchar(32) NOT NULL,
  `Spell_Range` varchar(32) DEFAULT NULL,
  `Components` varchar(3) DEFAULT NULL,
  `Duration` varchar(32) DEFAULT NULL,
  `Attack` varchar(32) DEFAULT NULL,
  `Damage` varchar(32) DEFAULT NULL,
  `Description` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`SPID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Spells`
--

LOCK TABLES `Spells` WRITE;
/*!40000 ALTER TABLE `Spells` DISABLE KEYS */;
INSERT INTO `Spells` VALUES (1,'Acid Splash',0,'Conjuration','60','VS','Instant','DEX Save','1d6 Acid','Choose one or two creatures within 5 feet of eachother you can see in range.');
/*!40000 ALTER TABLE `Spells` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SubClass`
--

DROP TABLE IF EXISTS `SubClass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SubClass` (
  `SubC_Name` varchar(32) NOT NULL,
  `Class_Name` varchar(32) NOT NULL,
  `ASIID` int(8) NOT NULL,
  `FRID` int(8) NOT NULL,
  `PRID` int(8) NOT NULL,
  `SPRID` int(8) NOT NULL,
  `Description` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`SubC_Name`),
  KEY `Class_Name` (`Class_Name`),
  KEY `ASIID` (`ASIID`),
  KEY `FRID` (`FRID`),
  KEY `PRID` (`PRID`),
  KEY `SPRID` (`SPRID`),
  CONSTRAINT `SubClass_ibfk_1` FOREIGN KEY (`Class_Name`) REFERENCES `Class` (`Class_Name`),
  CONSTRAINT `SubClass_ibfk_2` FOREIGN KEY (`ASIID`) REFERENCES `ASI` (`ASIID`),
  CONSTRAINT `SubClass_ibfk_3` FOREIGN KEY (`FRID`) REFERENCES `FeatHaver` (`FRID`),
  CONSTRAINT `SubClass_ibfk_4` FOREIGN KEY (`PRID`) REFERENCES `Proficiencies` (`PRID`),
  CONSTRAINT `SubClass_ibfk_5` FOREIGN KEY (`SPRID`) REFERENCES `SpellHaver` (`SPRID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SubClass`
--

LOCK TABLES `SubClass` WRITE;
/*!40000 ALTER TABLE `SubClass` DISABLE KEYS */;
/*!40000 ALTER TABLE `SubClass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SubRace`
--

DROP TABLE IF EXISTS `SubRace`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SubRace` (
  `SubR_Name` varchar(32) NOT NULL,
  `Race_Name` varchar(32) DEFAULT NULL,
  `ASIID` int(8) DEFAULT NULL,
  `FRID` int(8) DEFAULT NULL,
  `PRID` int(8) DEFAULT NULL,
  `SPRID` int(8) DEFAULT NULL,
  `Description` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`SubR_Name`),
  KEY `Race_Name` (`Race_Name`),
  KEY `ASIID` (`ASIID`),
  KEY `FRID` (`FRID`),
  KEY `PRID` (`PRID`),
  KEY `SPRID` (`SPRID`),
  CONSTRAINT `SubRace_ibfk_1` FOREIGN KEY (`Race_Name`) REFERENCES `Race` (`Race_Name`),
  CONSTRAINT `SubRace_ibfk_2` FOREIGN KEY (`ASIID`) REFERENCES `ASI` (`ASIID`),
  CONSTRAINT `SubRace_ibfk_3` FOREIGN KEY (`FRID`) REFERENCES `FeatHaver` (`FRID`),
  CONSTRAINT `SubRace_ibfk_4` FOREIGN KEY (`PRID`) REFERENCES `Proficiencies` (`PRID`),
  CONSTRAINT `SubRace_ibfk_5` FOREIGN KEY (`SPRID`) REFERENCES `SpellHaver` (`SPRID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 `ENCRYPTION_KEY_ID`=100;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SubRace`
--

LOCK TABLES `SubRace` WRITE;
/*!40000 ALTER TABLE `SubRace` DISABLE KEYS */;
INSERT INTO `SubRace` VALUES ('High Elf','Elf',3,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `SubRace` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `Campaign_Characters`
--

/*!50001 DROP TABLE IF EXISTS `Campaign_Characters`*/;
/*!50001 DROP VIEW IF EXISTS `Campaign_Characters`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`sflores`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `Campaign_Characters` AS select `ParticipatesIn`.`Camp_ID` AS `Camp_ID`,`PlayerCharacter`.`Char_Name` AS `Char_Name` from (`ParticipatesIn` join `PlayerCharacter` on(`ParticipatesIn`.`Char_ID` = `PlayerCharacter`.`Char_ID`)) order by `ParticipatesIn`.`Camp_ID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Campaign_DMs_Characters`
--

/*!50001 DROP TABLE IF EXISTS `Campaign_DMs_Characters`*/;
/*!50001 DROP VIEW IF EXISTS `Campaign_DMs_Characters`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`sflores`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `Campaign_DMs_Characters` AS select `PlayerCharacter`.`Char_ID` AS `Char_ID`,`PlayerCharacter`.`Username` AS `Username`,`PlayerCharacter`.`Char_Name` AS `Char_Name`,`ParticipatesIn`.`Camp_ID` AS `Camp_ID`,`Campaign`.`Name` AS `Name` from ((`PlayerCharacter` join `ParticipatesIn` on(`PlayerCharacter`.`Char_ID` = `ParticipatesIn`.`Char_ID`)) join `Campaign` on(`PlayerCharacter`.`Username` = `Campaign`.`Username` and `ParticipatesIn`.`Camp_ID` = `Campaign`.`Camp_ID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Characters_Count`
--

/*!50001 DROP TABLE IF EXISTS `Characters_Count`*/;
/*!50001 DROP VIEW IF EXISTS `Characters_Count`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`sflores`@`localhost` SQL SECURITY INVOKER */
/*!50001 VIEW `Characters_Count` AS select `PlayerCharacter`.`Username` AS `Username`,count(`PlayerCharacter`.`Username`) AS `OwnedCharacters` from (`PlayerCharacter` join `Account` on(`PlayerCharacter`.`Username` = `Account`.`Username`)) group by `PlayerCharacter`.`Username` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-12 13:32:44
