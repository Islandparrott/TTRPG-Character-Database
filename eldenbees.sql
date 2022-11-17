
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

