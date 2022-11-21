
CREATE TABLE `ASI` (
  `ASIID` int(8) AUTO_INCREMENT NOT NULL,
  `STR` int(2) DEFAULT NULL,
  `DEX` int(2) DEFAULT NULL,
  `CON` int(2) DEFAULT NULL,
  `INTe` int(2) DEFAULT NULL,
  `WIS` int(2) DEFAULT NULL,
  `CHA` int(2) DEFAULT NULL,
  PRIMARY KEY (`ASIID`)
);

DROP TABLE IF EXISTS `Account`;
CREATE TABLE `Account` (
  `Username` varchar(32) NOT NULL,
  `Password` varchar(32) NOT NULL,
  PRIMARY KEY (`Username`)
);

DROP TABLE IF EXISTS `Campaign`;
CREATE TABLE `Campaign` (
  `Camp_ID` int(8) AUTO_INCREMENT NOT NULL,
  `Username` varchar(32) NOT NULL,
  `Name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`Camp_ID`),
  FOREIGN KEY (`Username`) REFERENCES `Account` (`Username`)
);

DROP TABLE IF EXISTS `Equipment`;
CREATE TABLE `Equipment` (
  EID int(8) AUTO_INCREMENT NOT NULL,
  `Eqpmnt_Name` varchar(32) NOT NULL,
  `Description` varchar(512) DEFAULT NULL,
  PRIMARY KEY (EID)
);

DROP TABLE IF EXISTS `Feats`;
CREATE TABLE `Feats` (
  `FID` int(8) AUTO_INCREMENT NOT NULL,
  `Description` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`FID`)
);

DROP TABLE IF EXISTS `Languages`;
CREATE TABLE `Languages` (
  `LID` int(8) AUTO_INCREMENT NOT NULL,
  `Lang_Name` varchar(32) NOT NULL,
  PRIMARY KEY (LID)
);

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
  `Survival` boolean NOT NULL,
  PRIMARY KEY (`PRID`)
);

DROP TABLE IF EXISTS `Saves`;
CREATE TABLE `Saves` (
  `SAID` int(8) AUTO_INCREMENT NOT NULL,
  `STR` boolean DEFAULT NULL,
  `DEX` boolean DEFAULT NULL,
  `CON` boolean DEFAULT NULL,
  `INT` boolean DEFAULT NULL,
  `WIS` boolean DEFAULT NULL,
  `CHA` boolean DEFAULT NULL,
  PRIMARY KEY (`SAID`)
);

DROP TABLE IF EXISTS `Spells`;
CREATE TABLE `Spells` (
  SPID int(8) AUTO_INCREMENT NOT NULL,
  `Spell_Name` varchar(32) NOT NULL,
  `School` varchar(32) NOT NULL,
  `Level` int(2) NOT NULL,
  `Description` varchar(512) DEFAULT NULL,
  PRIMARY KEY (SPID)
);

/* ============ */

CREATE TABLE EquipmentHaver (
  ERID int(8) AUTO_INCREMENT NOT NULL,
  PRIMARY KEY (ERID)
);

CREATE TABLE FeatHaver (
  FRID int(8) AUTO_INCREMENT NOT NULL,
  PRIMARY KEY (FRID)
);

CREATE TABLE LanguageHaver (
  LRID int(8) AUTO_INCREMENT NOT NULL,
  PRIMARY KEY (LRID)
);

CREATE TABLE SpellHaver (
  SPRID int(8) AUTO_INCREMENT NOT NULL,
  PRIMARY KEY (SPRID)
);

/* ============ */

DROP TABLE IF EXISTS `Background`;
CREATE TABLE `Background` (
  `Bckgrnd_Name` varchar(32) NOT NULL,
  `ERID` int(8) DEFAULT NULL,
  `FRID` int(8) DEFAULT NULL,
  `LRID` int(8) DEFAULT NULL,
  `PRID` int(8) DEFAULT NULL,
  `Description` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`Bckgrnd_Name`),
  FOREIGN KEY (`ERID`) REFERENCES `EquipmentHaver` (`ERID`),
  FOREIGN KEY (`FRID`) REFERENCES `FeatHaver` (`FRID`),
  FOREIGN KEY (`LRID`) REFERENCES `LanguageHaver` (`LRID`),
  FOREIGN KEY (`PRID`) REFERENCES `Proficiencies` (`PRID`)
);

DROP TABLE IF EXISTS `Race`;
CREATE TABLE `Race` (
  `Race_Name` varchar(32) NOT NULL,
  `ASIID` int(8) NOT NULL,
  `FRID` int(8) NOT NULL,
  `PRID` int(8) NOT NULL,
  `SPRID` int(8) NOT NULL,
  `Size` varchar(16) DEFAULT NULL,
  `Speed` int(3) DEFAULT NULL,
  `Description` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`Race_Name`),
  FOREIGN KEY (`ASIID`) REFERENCES `ASI` (`ASIID`),
  FOREIGN KEY (`FRID`) REFERENCES `FeatHaver` (`FRID`),
  FOREIGN KEY (`PRID`) REFERENCES `Proficiencies` (`PRID`),
  FOREIGN KEY (`SPRID`) REFERENCES `SpellHaver` (`SPRID`)
);

DROP TABLE IF EXISTS `SubRace`;
CREATE TABLE `SubRace` (
  `SubR_Name` varchar(32) NOT NULL,
  Race_Name varchar(32) NOT NULL,
  `FRID` int(8)  NOT NULL,
  `PRID` int(8)  NOT NULL,
  `SPRID` int(8)  NOT NULL,
  `Description` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`SubR_Name`),
  FOREIGN KEY (Race_Name) REFERENCES Race (Race_Name),
  FOREIGN KEY (`FRID`) REFERENCES `FeatHaver` (`FRID`),
  FOREIGN KEY (`PRID`) REFERENCES `Proficiencies` (`PRID`),
  FOREIGN KEY (`SPRID`) REFERENCES `SpellHaver` (`SPRID`)
);

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
  FOREIGN KEY (`Username`) REFERENCES `Account` (`Username`),
  FOREIGN KEY (`Bckgrnd_Name`) REFERENCES `Background` (`Bckgrnd_Name`),
  FOREIGN KEY (`Camp_ID`) REFERENCES `Campaign` (`Camp_ID`),
  FOREIGN KEY (`Race_Name`) REFERENCES `Race` (`Race_Name`),
  FOREIGN KEY (`SubR_Name`) REFERENCES `SubRace` (`SubR_Name`),
  FOREIGN KEY (`ERID`) REFERENCES `EquipmentHaver` (`ERID`),
  FOREIGN KEY (`FRID`) REFERENCES `FeatHaver` (`FRID`),
  FOREIGN KEY (`LRID`) REFERENCES `LanguageHaver` (`LRID`),
  FOREIGN KEY (`PRID`) REFERENCES `Proficiencies` (`PRID`)
);

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
  `Survival` boolean NOT NULL,
  PRIMARY KEY (`Char_ID`),
  FOREIGN KEY (`Char_ID`) REFERENCES `PlayerCharacter` (`Char_ID`)
);

DROP TABLE IF EXISTS `PlayerSaves`;
CREATE TABLE `PlayerSaves` (
  `Char_ID` int(8) NOT NULL,
  `STR` boolean DEFAULT NULL,
  `DEX` boolean DEFAULT NULL,
  `CON` boolean DEFAULT NULL,
  `INT` boolean DEFAULT NULL,
  `WIS` boolean DEFAULT NULL,
  `CHA` boolean DEFAULT NULL,
  PRIMARY KEY (`Char_ID`),
  FOREIGN KEY (`Char_ID`) REFERENCES `PlayerCharacter` (`Char_ID`)
);

CREATE TABLE PlayerAS (
  Char_ID int(8) NOT NULL,
  Strength int(2),
  Dexterity int(2),
  Constitution int(2),
  Intelligence int(2),
  Wisdom int(2),
  Charisma int(2),
  PRIMARY KEY (Char_ID),
  FOREIGN KEY (Char_ID) REFERENCES PlayerCharacter (Char_ID)
);

DROP TABLE IF EXISTS `ParticipatesIn`;
CREATE TABLE `ParticipatesIn` (
  `Char_ID` int(8) NOT NULL,
  `Camp_ID` int(8) NOT NULL,
  PRIMARY KEY (`Char_ID`,`Camp_ID`),
  FOREIGN KEY (`Char_ID`) REFERENCES `PlayerCharacter` (`Char_ID`),
  FOREIGN KEY (`Camp_ID`) REFERENCES `Campaign` (`Camp_ID`)
);

DROP TABLE IF EXISTS `Class`;
CREATE TABLE `Class` (
  `Class_Name` varchar(100) NOT NULL,
  `ERID` int(8) DEFAULT NULL,
  `FRID` int(8) DEFAULT NULL,
  `PRID` int(8) DEFAULT NULL,
  `SAID` int(8) DEFAULT NULL,
  `Description` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`Class_Name`),
  FOREIGN KEY (`ERID`) REFERENCES `EquipmentHaver` (`ERID`),
  FOREIGN KEY (`FRID`) REFERENCES `FeatHaver` (`FRID`),
  FOREIGN KEY (`PRID`) REFERENCES `Proficiencies` (`PRID`),
  FOREIGN KEY (`SAID`) REFERENCES `Saves` (`SAID`)
);

DROP TABLE IF EXISTS `SubClass`;
CREATE TABLE `SubClass` (
  `SubC_Name` varchar(32) NOT NULL,
  Class_Name varchar(32) NOT NULL,
  `ASIID` int(8) NOT NULL,
  `FRID` int(8) NOT NULL,
  `PRID` int(8) NOT NULL,
  `SPRID` int(8) NOT NULL,
  `Description` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`SubC_Name`),
  FOREIGN KEY (Class_Name) REFERENCES Class (Class_Name),
  FOREIGN KEY (`ASIID`) REFERENCES `ASI` (`ASIID`),
  FOREIGN KEY (`FRID`) REFERENCES `FeatHaver` (`FRID`),
  FOREIGN KEY (`PRID`) REFERENCES `Proficiencies` (`PRID`),
  FOREIGN KEY (`SPRID`) REFERENCES `SpellHaver` (`SPRID`)
);

DROP TABLE IF EXISTS `PlayerClass`;
CREATE TABLE `PlayerClass` (
  `Char_ID` int(8) NOT NULL,
  `Class_Name` varchar(32) NOT NULL,
  `SubC_Name` varchar(32) NOT NULL,
  `Level` int(2) NOT NULL,
  FOREIGN KEY (`Char_ID`) REFERENCES `PlayerCharacter` (`Char_ID`),
  FOREIGN KEY (`Class_Name`) REFERENCES `Class` (`Class_Name`),
  FOREIGN KEY (`SubC_Name`) REFERENCES `SubClass` (`SubC_Name`)
);

/* ============ */

DROP TABLE IF EXISTS `EquipmentRepo`;
CREATE TABLE `EquipmentRepo` (
  `ERID` int(8) NOT NULL,
  `EID` int(8) NOT NULL,
  FOREIGN KEY (ERID) REFERENCES EquipmentHaver (ERID),
  FOREIGN KEY (`EID`) REFERENCES `Equipment` (`EID`)
);

DROP TABLE IF EXISTS `FeatRepo`;
CREATE TABLE `FeatRepo` (
  `FRID` int(8) NOT NULL,
  `FID` int(8) NOT NULL,
  FOREIGN KEY (FRID) REFERENCES FeatHaver (FRID),
  FOREIGN KEY (`FID`) REFERENCES `Feats` (`FID`)
);

DROP TABLE IF EXISTS `LanguageRepo`;
CREATE TABLE `LanguageRepo` (
  `LRID` int(8) NOT NULL,
  `LID` int(8) NOT NULL,
  FOREIGN KEY (LRID) REFERENCES LanguageHaver (LRID),
  FOREIGN KEY (`LID`) REFERENCES `Languages` (`LID`)
);

DROP TABLE IF EXISTS `SpellRepo`;
CREATE TABLE `Spellrepo` (
  `SPRID` int(8) NOT NULL,
  `SPID` int(8) NOT NULL,
  FOREIGN KEY (SPRID) REFERENCES SpellHaver (SPRID),
  FOREIGN KEY (`SPID`) REFERENCES `Spells` (`SPID`)
);

