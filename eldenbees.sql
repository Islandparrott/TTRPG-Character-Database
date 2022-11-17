
DROP TABLE IF EXISTS `Account`;
CREATE TABLE `Account` (
  `Username` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  PRIMARY KEY (`Username`)
) 

DROP TABLE IF EXISTS `Background`;
CREATE TABLE `Background` (
  `Bckgrnd_Name` varchar(100) NOT NULL,
  `Description` varchar(350) DEFAULT NULL,
  PRIMARY KEY (`Bckgrnd_Name`)
)

DROP TABLE IF EXISTS `Campaign`;
CREATE TABLE `Campaign` (
  `Camp_ID` int(11) NOT NULL,
  `Username` varchar(100) NOT NULL,
  `Name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`Camp_ID`),
  KEY `Username` (`Username`),
  CONSTRAINT `Campaign_ibfk_1` FOREIGN KEY (`Username`) REFERENCES `Account` (`Username`)
)

DROP TABLE IF EXISTS `Equipment`;
CREATE TABLE `Equipment` (
  `Eqpmnt_Name` varchar(100) NOT NULL,
  `Description` varchar(550) DEFAULT NULL,
  `EID` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Eqpmnt_Name`)
) 

DROP TABLE IF EXISTS `EquipmentRepo`;
CREATE TABLE `EquipmentRepo` (
  `ERID`, int(11) AUTO_INCREMENT NOT NULL,
  `EID`, int(11) NOT NULL,
  PRIMARY KEY (`ERID`),
  KEY `EID` (`EID`),
  CONSTRAINT `Class_ibfk_1` FOREIGN KEY (`EID`) REFERENCES `Equipment` (`EID`),
) 

DROP TABLE IF EXISTS `Feats`;
CREATE TABLE `Feats` (
  `Ft_Name` varchar(100) NOT NULL,
  `FID`, int(11) NOT NULL,
  `Description` varchar(350) DEFAULT NULL,
  PRIMARY KEY (`FRID`),
) 

DROP TABLE IF EXISTS `FeatRepo`;
CREATE TABLE `FeatRepo` (
  `FRID`, int(11) AUTO_INCREMENT NOT NULL,
  `FID`, int(11) NOT NULL,
  PRIMARY KEY (`FRID`),
  KEY `FID` (`FID`),
  CONSTRAINT `Class_ibfk_1` FOREIGN KEY (`FID`) REFERENCES `Feat` (`FID`),
) 

DROP TABLE IF EXISTS `Languages`;
CREATE TABLE `Languages` (
  `Lang_Name` varchar(100) NOT NULL,
  `LID`, int(11) NOT NULL,
  PRIMARY KEY (`Lang_Name`)
) 

DROP TABLE IF EXISTS `LanguageRepo`;
CREATE TABLE `LanguageRepo` (
  `LRID`, int(11) AUTO_INCREMENT NOT NULL,
  `LID`, int(11) NOT NULL,
  PRIMARY KEY (`LRID`),
  KEY `LID` (`LID`),
  CONSTRAINT `Class_ibfk_1` FOREIGN KEY (`LID`) REFERENCES `Languages` (`LID`),
) 

DROP TABLE IF EXISTS `Proficiencies`;
CREATE TABLE `Proficiencies` (
  `PRID` int(11) AUTO_INCREMENT NOT NULL,
  `School` boolean NOT NULL,
  `Acrobatics` boolean NOT NULL, 
  `Animal Handling` boolean NOT NULL, 
  `Athletics` boolean NOT NULL, 
  `Deception` boolean NOT NULL, 
  `Insight` boolean NOT NULL, 
  `Intimidation` boolean NOT NULL, 
  `Investigation` boolean NOT NULL, 
  `Medicine` boolean NOT NULL, 
  `Nature` boolean NOT NULL, 
  `Perception` boolean NOT NULL, 
  `Performance` boolean NOT NULL, 
  `Persuasion` boolean NOT NULL, 
  `Religion` boolean NOT NULL, 
  `Sleight of Hand` boolean NOT NULL, 
  `Stealth` boolean NOT NULL, 
  `Survival` boolean NOT NULL
  PRIMARY KEY (`PRID`)
) 

DROP TABLE IF EXISTS `Spells`;
CREATE TABLE `Spells` (
  `Spell_Name` varchar(100) NOT NULL,
  `School` varchar(100) NOT NULL,
  `Level` int NOT NULL,
  `Description` varchar(350) DEFAULT NULL,
  PRIMARY KEY (`Spell_Name`)
) 

DROP TABLE IF EXISTS `SpellRepo`;
CREATE TABLE `Spellrepo` (
  `SPRID`, int(11) AUTO_INCREMENT NOT NULL,
  `SPID`, int(11) NOT NULL,
  PRIMARY KEY (`SPRID`),
  KEY `SPID` (`SPID`),
  CONSTRAINT `Class_ibfk_1` FOREIGN KEY (`SPID`) REFERENCES `Spells` (`SPID`),
) 
