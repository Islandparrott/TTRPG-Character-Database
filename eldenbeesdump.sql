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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ASI`
--

LOCK TABLES `ASI` WRITE;
/*!40000 ALTER TABLE `ASI` DISABLE KEYS */;
INSERT INTO `ASI` VALUES (1,1,1,1,1,1,1);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Account`
--

LOCK TABLES `Account` WRITE;
/*!40000 ALTER TABLE `Account` DISABLE KEYS */;
INSERT INTO `Account` VALUES ('Island','Dnalsi'),('Parrott','Ttarrop');
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
INSERT INTO `Background` VALUES ('Soldier',1,2,NULL,1,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Campaign`
--

LOCK TABLES `Campaign` WRITE;
/*!40000 ALTER TABLE `Campaign` DISABLE KEYS */;
INSERT INTO `Campaign` VALUES (1,'Island','Foundation');
/*!40000 ALTER TABLE `Campaign` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `Class` VALUES ('Fighter',6,2,1,1,1,NULL);
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
  `Weight` double DEFAULT NULL,
  `Damage` varchar(32) DEFAULT NULL,
  `ACBonus` varchar(32) DEFAULT NULL,
  `Description` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`EID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Equipment`
--

LOCK TABLES `Equipment` WRITE;
/*!40000 ALTER TABLE `Equipment` DISABLE KEYS */;
INSERT INTO `Equipment` VALUES (1,'Longsword','Martial Melee Weapon',3,'1d8 OH, 1d10 TH, Slashing',NULL,'Versatile | A sword which may be used in one or two hands.'),(2,'Rank Insignia','Trinket',NULL,NULL,NULL,'An insignia showing rank in some order.');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EquipmentHaver`
--

LOCK TABLES `EquipmentHaver` WRITE;
/*!40000 ALTER TABLE `EquipmentHaver` DISABLE KEYS */;
INSERT INTO `EquipmentHaver` VALUES (1,'Soldier'),(2,'Fighter');
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
INSERT INTO `EquipmentRepo` VALUES (1,1),(1,2),(2,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FeatHaver`
--

LOCK TABLES `FeatHaver` WRITE;
/*!40000 ALTER TABLE `FeatHaver` DISABLE KEYS */;
INSERT INTO `FeatHaver` VALUES (1,'Fighter'),(2,'Soldier'),(5,'Champion');
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
INSERT INTO `FeatRepo` VALUES (1,1),(2,2),(5,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Feats`
--

LOCK TABLES `Feats` WRITE;
/*!40000 ALTER TABLE `Feats` DISABLE KEYS */;
INSERT INTO `Feats` VALUES (1,'Second Wind',1,'Once per rest. 1 Bonus action to regain HP equal to 1d10 + fighter level.'),(2,'Military Rank',NULL,'You have a military rank. You may use this to exert your influence where it is recognized.'),(3,'Improved Critical',3,'Your weapon attacks are criticals on a 19 or 20'),(12,'Darkvision',NULL,'You can see dim light within 60 feet of you as bright light, and darkness as if it were dim.');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Languages`
--

LOCK TABLES `Languages` WRITE;
/*!40000 ALTER TABLE `Languages` DISABLE KEYS */;
INSERT INTO `Languages` VALUES (1,'Common');
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
INSERT INTO `ParticipatesIn` VALUES (1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PlayerCharacter`
--

LOCK TABLES `PlayerCharacter` WRITE;
/*!40000 ALTER TABLE `PlayerCharacter` DISABLE KEYS */;
INSERT INTO `PlayerCharacter` VALUES (1,'Island','Anton','Soldier','Human',NULL,NULL,NULL,NULL,NULL,10,NULL,'6',1,NULL,NULL);
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
INSERT INTO `PlayerClass` VALUES (1,'Fighter',NULL,1);
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
  `Acrobatics` tinyint(1) DEFAULT 0,
  `AnimalHandling` tinyint(1) DEFAULT 0,
  `Athletics` tinyint(1) DEFAULT 0,
  `Deception` tinyint(1) DEFAULT 0,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PlayerProf`
--

LOCK TABLES `PlayerProf` WRITE;
/*!40000 ALTER TABLE `PlayerProf` DISABLE KEYS */;
INSERT INTO `PlayerProf` VALUES (1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
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
  `Animal Handling` tinyint(1) DEFAULT NULL,
  `Athletics` tinyint(1) DEFAULT NULL,
  `Deception` tinyint(1) DEFAULT NULL,
  `Insight` tinyint(1) DEFAULT NULL,
  `Intimidation` tinyint(1) DEFAULT NULL,
  `Investigation` tinyint(1) DEFAULT NULL,
  `Medicine` tinyint(1) DEFAULT NULL,
  `Nature` tinyint(1) DEFAULT NULL,
  `Perception` tinyint(1) DEFAULT NULL,
  `Performance` tinyint(1) DEFAULT NULL,
  `Persuasion` tinyint(1) DEFAULT NULL,
  `Religion` tinyint(1) DEFAULT NULL,
  `Sleight of Hand` tinyint(1) DEFAULT NULL,
  `Stealth` tinyint(1) DEFAULT NULL,
  `Survival` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`PRID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Proficiencies`
--

LOCK TABLES `Proficiencies` WRITE;
/*!40000 ALTER TABLE `Proficiencies` DISABLE KEYS */;
INSERT INTO `Proficiencies` VALUES (1,NULL,NULL,1,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Saves`
--

LOCK TABLES `Saves` WRITE;
/*!40000 ALTER TABLE `Saves` DISABLE KEYS */;
INSERT INTO `Saves` VALUES (1,1,NULL,1,NULL,NULL,NULL);
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
  `Race_Name` varchar(32) NOT NULL,
  `FRID` int(8) DEFAULT NULL,
  `PRID` int(8) DEFAULT NULL,
  `SPRID` int(8) DEFAULT NULL,
  `Description` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`SubR_Name`),
  KEY `Race_Name` (`Race_Name`),
  KEY `FRID` (`FRID`),
  KEY `PRID` (`PRID`),
  KEY `SPRID` (`SPRID`),
  CONSTRAINT `SubRace_ibfk_1` FOREIGN KEY (`Race_Name`) REFERENCES `Race` (`Race_Name`),
  CONSTRAINT `SubRace_ibfk_2` FOREIGN KEY (`FRID`) REFERENCES `FeatHaver` (`FRID`),
  CONSTRAINT `SubRace_ibfk_3` FOREIGN KEY (`PRID`) REFERENCES `Proficiencies` (`PRID`),
  CONSTRAINT `SubRace_ibfk_4` FOREIGN KEY (`SPRID`) REFERENCES `SpellHaver` (`SPRID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SubRace`
--

LOCK TABLES `SubRace` WRITE;
/*!40000 ALTER TABLE `SubRace` DISABLE KEYS */;
/*!40000 ALTER TABLE `SubRace` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-30 13:20:57
