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
-- Schema portfoliowrg
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema portfoliowrg
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `portfoliowrg` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `portfoliowrg`.`Persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfoliowrg`.`Persona` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NULL DEFAULT NULL,
  `lastname` VARCHAR(50) NULL DEFAULT NULL,
  `birth` DATE NULL,
  `position` VARCHAR(50) NULL DEFAULT NULL,
  `place` VARCHAR(80) NULL DEFAULT NULL,
  `about` VARCHAR(300) NULL DEFAULT NULL,
  `emai` VARCHAR(50) NULL DEFAULT NULL,
  `telephone` VARCHAR(45) NULL DEFAULT NULL,
  `photo` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfoliowrg`.`skills`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfoliowrg`.`skills` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `percent` VARCHAR(10) NULL DEFAULT NULL,
  `type` INT NULL DEFAULT NULL,
  `description` VARCHAR(50) NULL DEFAULT NULL,
  `Persona_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Persona_id`),
  INDEX `fk_skills_Persona1_idx` (`Persona_id` ASC) VISIBLE,
  CONSTRAINT `fk_skills_Persona1`
    FOREIGN KEY (`Persona_id`)
    REFERENCES `portfoliowrg`.`Persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`type` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(45) NULL,
  `skills_id` INT NOT NULL,
  `skills_Persona_id` INT NOT NULL,
  PRIMARY KEY (`id`, `skills_id`, `skills_Persona_id`),
  INDEX `fk_type_skills_idx` (`skills_id` ASC, `skills_Persona_id` ASC) VISIBLE,
  CONSTRAINT `fk_type_skills`
    FOREIGN KEY (`skills_id` , `skills_Persona_id`)
    REFERENCES `portfoliowrg`.`skills` (`id` , `Persona_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `portfoliowrg` ;

-- -----------------------------------------------------
-- Table `portfoliowrg`.`experience`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfoliowrg`.`experience` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `company` VARCHAR(50) NULL DEFAULT NULL,
  `position` VARCHAR(45) NULL DEFAULT NULL,
  `description` VARCHAR(300) NULL DEFAULT NULL,
  `start` VARCHAR(50) NULL DEFAULT NULL,
  `end` VARCHAR(45) NULL DEFAULT NULL,
  `Persona_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Persona_id`),
  INDEX `fk_experiencia_Persona1_idx` (`Persona_id` ASC) VISIBLE,
  CONSTRAINT `fk_experiencia_Persona1`
    FOREIGN KEY (`Persona_id`)
    REFERENCES `portfoliowrg`.`Persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfoliowrg`.`education`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfoliowrg`.`education` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `institution` VARCHAR(50) NULL DEFAULT NULL,
  `start` VARCHAR(50) NULL DEFAULT NULL,
  `end` VARCHAR(50) NULL DEFAULT NULL,
  `career` VARCHAR(100) NULL DEFAULT NULL,
  `Persona_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Persona_id`),
  INDEX `fk_educacion_Persona_idx` (`Persona_id` ASC) VISIBLE,
  CONSTRAINT `fk_educacion_Persona`
    FOREIGN KEY (`Persona_id`)
    REFERENCES `portfoliowrg`.`Persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfoliowrg`.`logoee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfoliowrg`.`logoee` (
  `id` INT NOT NULL AUTO_INCREMENT,
  ` photo` VARCHAR(200) NULL DEFAULT NULL,
  `education_id` INT NOT NULL,
  `education_Persona_id` INT NOT NULL,
  `experience_id` INT NOT NULL,
  `experience_Persona_id` INT NOT NULL,
  PRIMARY KEY (`id`, `education_id`, `education_Persona_id`, `experience_id`, `experience_Persona_id`),
  INDEX `fk_logoee_education1_idx` (`education_id` ASC, `education_Persona_id` ASC) VISIBLE,
  INDEX `fk_logoee_experience1_idx` (`experience_id` ASC, `experience_Persona_id` ASC) VISIBLE,
  CONSTRAINT `fk_logoee_education1`
    FOREIGN KEY (`education_id` , `education_Persona_id`)
    REFERENCES `portfoliowrg`.`education` (`id` , `Persona_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_logoee_experience1`
    FOREIGN KEY (`experience_id` , `experience_Persona_id`)
    REFERENCES `portfoliowrg`.`experience` (`id` , `Persona_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfoliowrg`.`proyect`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfoliowrg`.`proyect` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NULL DEFAULT NULL,
  `description` VARCHAR(200) NULL DEFAULT NULL,
  `photo` VARCHAR(200) NULL DEFAULT NULL,
  `Persona_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Persona_id`),
  INDEX `fk_proyecto_Persona1_idx` (`Persona_id` ASC) VISIBLE,
  CONSTRAINT `fk_proyecto_Persona1`
    FOREIGN KEY (`Persona_id`)
    REFERENCES `portfoliowrg`.`Persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfoliowrg`.`other`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfoliowrg`.`other` (
  `banner` CHAR(200) NULL DEFAULT NULL,
  `ministerio` VARCHAR(200) NULL DEFAULT NULL,
  `ap` VARCHAR(200) NULL DEFAULT NULL,
  `add` VARCHAR(200) NULL DEFAULT NULL,
  `idadd` VARCHAR(20) NULL DEFAULT NULL,
  `pencil` VARCHAR(200) NULL DEFAULT NULL,
  `idpencil` VARCHAR(20) NULL DEFAULT NULL,
  `trash` VARCHAR(200) NULL DEFAULT NULL,
  `idtrash` VARCHAR(20) NULL DEFAULT NULL,
  `Persona_id` INT NOT NULL,
  INDEX `fk_other_Persona1_idx` (`Persona_id` ASC) VISIBLE,
  CONSTRAINT `fk_other_Persona1`
    FOREIGN KEY (`Persona_id`)
    REFERENCES `portfoliowrg`.`Persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfoliowrg`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfoliowrg`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user` VARCHAR(50) NULL,
  `password` VARCHAR(50) NULL DEFAULT NULL,
  `Persona_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Persona_id`),
  INDEX `fk_user_Persona1_idx` (`Persona_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_Persona1`
    FOREIGN KEY (`Persona_id`)
    REFERENCES `portfoliowrg`.`Persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfoliowrg`.`social`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfoliowrg`.`social` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(50) NULL DEFAULT NULL,
  `photo` VARCHAR(200) NULL DEFAULT NULL,
  `Persona_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Persona_id`),
  INDEX `fk_social_Persona1_idx` (`Persona_id` ASC) VISIBLE,
  CONSTRAINT `fk_social_Persona1`
    FOREIGN KEY (`Persona_id`)
    REFERENCES `portfoliowrg`.`Persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
