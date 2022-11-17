
DROP TABLE IF EXISTS `Account`;
CREATE TABLE `Account` (
  `Username` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  PRIMARY KEY (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `Equipment`;
CREATE TABLE `Equipment` (
  `Eqpmnt_Name` varchar(100) NOT NULL,
  `Description` varchar(550) DEFAULT NULL,
  `EID` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Eqpmnt_Name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `EquipmentRepo`;
CREATE TABLE `EquipmentRepo` (
  `ERID`, int(11) NOT NULL,
  `EID`, int(11) NOT NULL,
  PRIMARY KEY (`ERID`),
  KEY `ERID` (`ERID`),
  KEY `EID` (`EID`),
  CONSTRAINT `Class_ibfk_1` FOREIGN KEY (`ERID`) REFERENCES `Equipment` (`ERID`),
  CONSTRAINT `Class_ibfk_2` FOREIGN KEY (`EID`) REFERENCES `Equipment` (`EID`),

) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
