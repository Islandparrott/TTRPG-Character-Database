
DROP TABLE IF EXISTS `Account`;
CREATE TABLE `Account` (
  `Username` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  PRIMARY KEY (`Username`)
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
