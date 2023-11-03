-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema dbfirst
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema dbfirst
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dbfirst` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
-- -----------------------------------------------------
-- Schema gaming
-- -----------------------------------------------------
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Vlucht`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Vlucht` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Vlucht` (
  `VluchtID` INT NOT NULL,
  `vluchtnummer` VARCHAR(45) NULL,
  `vliegtuig type` VARCHAR(45) NULL,
  `vertrektijd` VARCHAR(45) NULL,
  `aankomst tijd` INT NULL,
  `vertrek vluchthaven` INT NULL,
  `aankomst vluchthaven` VARCHAR(45) NULL,
  PRIMARY KEY (`VluchtID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Vlucht_has_Personeel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Vlucht_has_Personeel` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Vlucht_has_Personeel` (
  `Vlucht_vluchtID` INT NOT NULL,
  `Personeel_PersoneelID` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Vlucht_vluchtID`, `Personeel_PersoneelID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Personeel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Personeel` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Personeel` (
  `PersoneelID` INT NOT NULL,
  `naam` VARCHAR(45) NULL,
  `taak` VARCHAR(45) NULL,
  PRIMARY KEY (`PersoneelID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Vlucht_has_Vlucht_has_Personeel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Vlucht_has_Vlucht_has_Personeel` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Vlucht_has_Vlucht_has_Personeel` (
  `Vlucht_VluchtID` INT NOT NULL,
  `Vlucht_has_Personeel_Vlucht_vluchtID` INT NOT NULL,
  `Vlucht_has_Personeel_Personeel_PersoneelID` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Vlucht_VluchtID`, `Vlucht_has_Personeel_Vlucht_vluchtID`, `Vlucht_has_Personeel_Personeel_PersoneelID`),
  INDEX `fk_Vlucht_has_Vlucht_has_Personeel_Vlucht_has_Personeel1_idx` (`Vlucht_has_Personeel_Vlucht_vluchtID` ASC, `Vlucht_has_Personeel_Personeel_PersoneelID` ASC) VISIBLE,
  INDEX `fk_Vlucht_has_Vlucht_has_Personeel_Vlucht_idx` (`Vlucht_VluchtID` ASC) VISIBLE,
  CONSTRAINT `fk_Vlucht_has_Vlucht_has_Personeel_Vlucht`
    FOREIGN KEY (`Vlucht_VluchtID`)
    REFERENCES `mydb`.`Vlucht` (`VluchtID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vlucht_has_Vlucht_has_Personeel_Vlucht_has_Personeel1`
    FOREIGN KEY (`Vlucht_has_Personeel_Vlucht_vluchtID` , `Vlucht_has_Personeel_Personeel_PersoneelID`)
    REFERENCES `mydb`.`Vlucht_has_Personeel` (`Vlucht_vluchtID` , `Personeel_PersoneelID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `dbfirst` ;

-- -----------------------------------------------------
-- Table `dbfirst`.`craften`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbfirst`.`craften` ;

CREATE TABLE IF NOT EXISTS `dbfirst`.`craften` (
  `Craftingtable` INT NOT NULL,
  `Wood log` VARCHAR(45) NULL DEFAULT NULL,
  `wood planks` VARCHAR(45) NULL DEFAULT NULL,
  `item` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`Craftingtable`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dbfirst`.`enchtantment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbfirst`.`enchtantment` ;

CREATE TABLE IF NOT EXISTS `dbfirst`.`enchtantment` (
  `enchtantment table` INT NOT NULL,
  `Lapis` VARCHAR(45) NULL DEFAULT NULL,
  `xp` VARCHAR(45) NULL DEFAULT NULL,
  `item` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`enchtantment table`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dbfirst`.`traden`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbfirst`.`traden` ;

CREATE TABLE IF NOT EXISTS `dbfirst`.`traden` (
  `Villager` INT NOT NULL,
  `find a village` VARCHAR(45) NULL DEFAULT NULL,
  `find a villager with job` VARCHAR(45) NULL DEFAULT NULL,
  `emeralds` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`Villager`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dbfirst`.`table1`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `dbfirst`.`table1` ;

CREATE TABLE IF NOT EXISTS `dbfirst`.`table1` (
)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
