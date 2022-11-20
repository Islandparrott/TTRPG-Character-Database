
DROP TABLE IF EXISTS `AbilityScores`;
CREATE TABLE `AbilityScores` (
  `Char_ID` int(8) NOT NULL,
  `STR` int(2) DEFAULT NULL,
  `DEX` int(2) DEFAULT NULL,
  `CON` int(2) DEFAULT NULL,
  `INT` int(2) DEFAULT NULL,
  `WIS` int(2) DEFAULT NULL,
  `CHA` int(2) DEFAULT NULL,
  PRIMARY KEY (`Char_ID`),
  KEY `Char_ID` (`Char_ID`),
  CONSTRAINT `AbilityScores_ibfk_1` FOREIGN KEY (`Char_ID`) REFERENCES `PlayerCharacter` (`Char_ID`)
)

DROP TABLE IF EXISTS `AbilityScoreIncrease`;
CREATE TABLE `AbilityScoreIncrease` (
  `ASIID` int(8) AUTO_INCREMENT NOT NULL,
  `STR` int(2) DEFAULT NULL,
  `DEX` int(2) DEFAULT NULL,
  `CON` int(2) DEFAULT NULL,
  `INT` int(2) DEFAULT NULL,
  `WIS` int(2) DEFAULT NULL,
  `CHA` int(2) DEFAULT NULL,
  PRIMARY KEY (`ASIID`)
)

DROP TABLE IF EXISTS `Account`;
CREATE TABLE `Account` (
  `Username` varchar(32) NOT NULL,
  `Password` varchar(32) NOT NULL,
  PRIMARY KEY (`Username`)
) 

DROP TABLE IF EXISTS `Background`;
CREATE TABLE `Background` (
  `Bckgrnd_Name` varchar(32) NOT NULL,
  `ERID` int(8) DEFAULT NULL,
  `FRID` int(8) DEFAULT NULL,
  `LRID` int(8) DEFAULT NULL,
  `PRID` int(8) DEFAULT NULL,
  `Description` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`Bckgrnd_Name`)
  KEY `ERID` (`ERID`),
  KEY `FRID` (`FRID`),
  KEY `LRID` (`LRID`),
  KEY `PRID` (`PRID`),
  CONSTRAINT `Background_ibfk_1` FOREIGN KEY (`ERID`) REFERENCES `EquipmentRepo` (`ERID`),
  CONSTRAINT `Background_ibfk_2` FOREIGN KEY (`FRID`) REFERENCES `FeatRepo` (`FRID`),
  CONSTRAINT `Background_ibfk_3` FOREIGN KEY (`LRID`) REFERENCES `LanguageRepo` (`LRID`),
  CONSTRAINT `Background_ibfk_4` FOREIGN KEY (`PRID`) REFERENCES `Proficiencies` (`PRID`)
)

DROP TABLE IF EXISTS `Campaign`;
CREATE TABLE `Campaign` (
  `Camp_ID` int(8) AUTO_INCREMENT NOT NULL,
  `Username` varchar(32) NOT NULL,
  `Name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`Camp_ID`),
  KEY `Username` (`Username`),
  CONSTRAINT `Campaign_ibfk_1` FOREIGN KEY (`Username`) REFERENCES `Account` (`Username`)
)

DROP TABLE IF EXISTS `Class`;
CREATE TABLE `Class` (
  `Class_Name` varchar(100) NOT NULL,
  `ERID` int(8) DEFAULT NULL,
  `FRID` int(8) DEFAULT NULL,
  `PRID` int(8) DEFAULT NULL,
  `Description` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`Class_Name`),
  KEY `ERID` (`ERID`),
  KEY `FRID` (`FRID`),
  KEY `PRID` (`PRID`),
  CONSTRAINT `Background_ibfk_1` FOREIGN KEY (`ERID`) REFERENCES `EquipmentRepo` (`ERID`),
  CONSTRAINT `Background_ibfk_2` FOREIGN KEY (`FRID`) REFERENCES `FeatRepo` (`FRID`),
  CONSTRAINT `Background_ibfk_4` FOREIGN KEY (`PRID`) REFERENCES `Proficiencies` (`PRID`)
)

DROP TABLE IF EXISTS `Equipment`;
CREATE TABLE `Equipment` (
  `Eqpmnt_Name` varchar(32) NOT NULL,
  `Description` varchar(500) DEFAULT NULL,
  `EID` int(8) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Eqpmnt_Name`)
) 

DROP TABLE IF EXISTS `EquipmentRepo`;
CREATE TABLE `EquipmentRepo` (
  `ERID` int(8) AUTO_INCREMENT NOT NULL,
  `EID` int(8) NOT NULL,
  PRIMARY KEY (`ERID`),
  KEY `EID` (`EID`),
  CONSTRAINT `Class_ibfk_1` FOREIGN KEY (`EID`) REFERENCES `Equipment` (`EID`)
) 

DROP TABLE IF EXISTS `Feats`;
CREATE TABLE `Feats` (
  `FRID` varchar(8) NOT NULL,
  `FID` int(8) AUTO_INCREMENT NOT NULL,
  `Description` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`FRID`)
) 

DROP TABLE IF EXISTS `FeatRepo`;
CREATE TABLE `FeatRepo` (
  `FRID` int(8) AUTO_INCREMENT NOT NULL,
  `FID` int(8) NOT NULL,
  PRIMARY KEY (`FRID`),
  KEY `FID` (`FID`),
  CONSTRAINT `FeatRepo_ibfk_1` FOREIGN KEY (`FID`) REFERENCES `Feat` (`FID`)
) 

DROP TABLE IF EXISTS `Languages`;
CREATE TABLE `Languages` (
  `Lang_Name` varchar(32) NOT NULL,
  `LID` int(8) AUTO_INCREMENT NOT NULL,
  PRIMARY KEY (`Lang_Name`)
) 

DROP TABLE IF EXISTS `LanguageRepo`;
CREATE TABLE `LanguageRepo` (
  `LRID` int(8) AUTO_INCREMENT NOT NULL,
  `LID` int(8) NOT NULL,
  PRIMARY KEY (`LRID`),
  KEY `LID` (`LID`),
  CONSTRAINT `LanguageRepo_ibfk_1` FOREIGN KEY (`LID`) REFERENCES `Languages` (`LID`)
) 

DROP TABLE IF EXISTS `ParticipatesIn`;
CREATE TABLE `ParticipatesIn` (
  `Char_ID` int(8) NOT NULL,
  `Camp_ID` int(8) NOT NULL,
  PRIMARY KEY (`Char_ID`,`Camp_ID`),
  KEY `Camp_ID` (`Camp_ID`),
  CONSTRAINT `ParticipatesIn_ibfk_1` FOREIGN KEY (`Char_ID`) REFERENCES `PlayerCharacter` (`Char_ID`),
  CONSTRAINT `ParticipatesIn_ibfk_2` FOREIGN KEY (`Camp_ID`) REFERENCES `Campaign` (`Camp_ID`)
)

DROP TABLE IF EXISTS `PlayerCharacter`;
CREATE TABLE `PlayerCharacter` (
  `Char_ID` int(8) AUTO_INCREMENT NOT NULL,
  `Username` varchar(32) NOT NULL,
  `Bckgrnd_Name` varchar(32) NOT NULL,
  `Camp_ID` int(8) DEFAULT NULL,
  `Race_Name` varchar(32) NOT NULL,
  `SubR_Name` varchar(32) NOT NULL,
  `ERID` int(8) DEFAULT NULL,
  `FRID` int(8) DEFAULT NULL,
  `LRID` int(8) DEFAULT NULL,
  `PRID` int(8) DEFAULT NULL,
  `ArmorClass` int(2) DEFAULT NULL,
  `Biography` varchar(512) DEFAULT NULL,
  `Level` int(2) DEFAULT NULL,
  `Char_Name` varchar(32) NOT NULL,
  `PersonalityTraits` varchar(512) DEFAULT NULL,
  `Photo` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`Char_ID`),
  KEY `Username` (`Username`),
  KEY `Bckgrnd_Name` (`Bckgrnd_Name`),
  KEY `Camp_ID` (`Camp_ID`),
  KEY `Race_Name` (`Race_Name`),
  KEY `SubR_Name` (`SubR_Name`),
  KEY `ERID` (`ERID`),
  KEY `FRID` (`FRID`),
  KEY `LRID` (`LRID`),
  KEY `PRID` (`PRID`),
  CONSTRAINT `PlayerCharacter_ibfk_1` FOREIGN KEY (`Username`) REFERENCES `Account` (`Username`),
  CONSTRAINT `PlayerCharacter_ibfk_2` FOREIGN KEY (`Bckgrnd_Name`) REFERENCES `Background` (`Bckgrnd_Name`),
  CONSTRAINT `PlayerCharacter_ibfk_3` FOREIGN KEY (`Camp_ID`) REFERENCES `Campaign` (`Camp_ID`),
  CONSTRAINT `PlayerCharacter_ibfk_4` FOREIGN KEY (`Race_Name`) REFERENCES `Race` (`Race_Name`),
  CONSTRAINT `PlayerCharacter_ibfk_5` FOREIGN KEY (`SubR_Name`) REFERENCES `SubRace` (`SubR_Name`),
  CONSTRAINT `PlayerCharacter_ibfk_8` FOREIGN KEY (`ERID`) REFERENCES `EquipmentRepo` (`ERID`),
  CONSTRAINT `PlayerCharacter_ibfk_7` FOREIGN KEY (`FRID`) REFERENCES `FeatRepo` (`FRID`),
  CONSTRAINT `PlayerCharacter_ibfk_8` FOREIGN KEY (`LRID`) REFERENCES `LanguageRepo` (`LRID`),
  CONSTRAINT `PlayerCharacter_ibfk_9` FOREIGN KEY (`PRID`) REFERENCES `Proficiencies` (`PRID`)
)

DROP TABLE IF EXISTS `PlayerClass`;
CREATE TABLE `PlayerClass` (
  `Char_ID` int(8) NOT NULL,
  `Class_Name` varchar(32) NOT NULL,
  `SubC_Name` int(32) NOT NULL,
  `Level` int(2) NOT NULL,
  PRIMARY KEY (`Char_ID`),
  KEY `Char_ID` (`Char_ID`),
  KEY `Class_Name` (`Class_Name`),
  KEY `SubC_Name` (`SubC_Name`),
  CONSTRAINT `PlayerClass_ibfk_1` FOREIGN KEY (`SubC_Name`) REFERENCES `Class` (`Class_Name`),
  CONSTRAINT `PlayerClass_ibfk_2` FOREIGN KEY (`Char_ID`) REFERENCES `PlayerCharacter` (`Char_ID`),
  CONSTRAINT `PlayerClass_ibfk_3` FOREIGN KEY (`SubC_Name`) REFERENCES `SubClass` (`SubC_Name`)
)

DROP TABLE IF EXISTS `PlayerProf`;
CREATE TABLE `PlayerProf` (
  `Char_ID` int(8) NOT NULL,
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
  PRIMARY KEY (`Char_ID`),
  KEY `Char_ID` (`Char_ID`),
  CONSTRAINT `PlayerProf_ibfk_1` FOREIGN KEY (`Char_ID`) REFERENCES `PlayerCharacter` (`Char_ID`)
) 

DROP TABLE IF EXISTS `Proficiencies`;
CREATE TABLE `Proficiencies` (
  `PRID` int(8) AUTO_INCREMENT NOT NULL,
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

DROP TABLE IF EXISTS `Race`;
CREATE TABLE `Race` (
  `Race_Name` varchar(32) NOT NULL,
  `ASIID` int(8) NOT NULL,
  `FRID` varchar(8) NOT NULL,
  `PRID` varchar(8) NOT NULL,
  `SPRID` varchar(8) NOT NULL,
  `Size` varchar(8) DEFAULT NULL,
  `Speed` int(8) DEFAULT NULL,
  `Description` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`Race_Name`),
  KEY `ASIID` (`ASIID`),
  KEY `FRID` (`FRID`),
  KEY `PRID` (`PRID`),
  KEY `SPRID` (`SPRID`),
  CONSTRAINT `Race_ibfk_1` FOREIGN KEY (`ASIID`) REFERENCES `ASIRepo` (`ASIID`),
  CONSTRAINT `Race_ibfk_2` FOREIGN KEY (`FRID`) REFERENCES `FeatRepo` (`FRID`),
  CONSTRAINT `Race_ibfk_3` FOREIGN KEY (`PRID`) REFERENCES `Proficiencies` (`PRID`),
  CONSTRAINT `Race_ibfk_4` FOREIGN KEY (`SPRID`) REFERENCES `SpellRepo` (`SPRID`)
)

DROP TABLE IF EXISTS `Saves`;
CREATE TABLE `Saves` (
  `ASIID` int(8) AUTO_INCREMENT NOT NULL,
  `STR` int(2) DEFAULT NULL,
  `DEX` int(2) DEFAULT NULL,
  `CON` int(2) DEFAULT NULL,
  `INT` int(2) DEFAULT NULL,
  `WIS` int(2) DEFAULT NULL,
  `CHA` int(2) DEFAULT NULL,
  PRIMARY KEY (`ASIID`)
)

DROP TABLE IF EXISTS `Spells`;
CREATE TABLE `Spells` (
  `SPRID` varchar(8) NOT NULL,
  `SPID` int(8) AUTO_INCREMENT NOT NULL,
  `School` varchar(32) NOT NULL,
  `Level` int(2) NOT NULL,
  `Description` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`SPRID`)
) 

DROP TABLE IF EXISTS `SpellRepo`;
CREATE TABLE `Spellrepo` (
  `SPRID` int(8) AUTO_INCREMENT NOT NULL,
  `SPID` int(8)  NOT NULL,
  PRIMARY KEY (`SPRID`),
  KEY `SPID` (`SPID`),
  CONSTRAINT `SpellRepo_ibfk_1` FOREIGN KEY (`SPID`) REFERENCES `Spells` (`SPID`)
) 

DROP TABLE IF EXISTS `SubClass`;
CREATE TABLE `SubClass` (
  `SubC_Name` varchar(32) NOT NULL,
  `FRID` varchar(8) NOT NULL,
  `PRID` varchar(8) NOT NULL,
  `SPRID` varchar(8) NOT NULL,
  `Description` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`SubC_Name`),
  KEY `ASIID` (`ASIID`),
  KEY `FRID` (`FRID`),
  KEY `PRID` (`PRID`),
  KEY `SPRID` (`SPRID`),
  CONSTRAINT `SubClass_ibfk_1` FOREIGN KEY (`ASIID`) REFERENCES `ASIRepo` (`ASIID`),
  CONSTRAINT `SubClass_ibfk_2` FOREIGN KEY (`FRID`) REFERENCES `FeatRepo` (`FRID`),
  CONSTRAINT `SubClass_ibfk_3` FOREIGN KEY (`PRID`) REFERENCES `Proficiencies` (`PRID`),
  CONSTRAINT `SubClass_ibfk_4` FOREIGN KEY (`SPRID`) REFERENCES `SpellRepo` (`SPRID`)
)

DROP TABLE IF EXISTS `SubRace`;
CREATE TABLE `SubClass` (
  `SubC_Name` varchar(32) NOT NULL,
  `FRID` varchar(8) NOT NULL,
  `PRID` varchar(8) NOT NULL,
  `SPRID` varchar(8) NOT NULL,
  `Description` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`SubC_Name`),
  KEY `FRID` (`FRID`),
  KEY `PRID` (`PRID`),
  KEY `SPRID` (`SPRID`),
  CONSTRAINT `SubRace_ibfk_1` FOREIGN KEY (`FRID`) REFERENCES `FeatRepo` (`FRID`),
  CONSTRAINT `SubRace_ibfk_2` FOREIGN KEY (`PRID`) REFERENCES `Proficiencies` (`PRID`),
  CONSTRAINT `SubRace_ibfk_3` FOREIGN KEY (`SPRID`) REFERENCES `SpellRepo` (`SPRID`)
)
