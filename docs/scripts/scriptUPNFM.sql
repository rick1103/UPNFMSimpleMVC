-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema eti_upnfm
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema eti_upnfm
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `eti_upnfm` DEFAULT CHARACTER SET utf8 ;
USE `eti_upnfm` ;

-- -----------------------------------------------------
-- Table `eti_upnfm`.`asignatura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eti_upnfm`.`asignatura` (
  `cod_asignatura` INT(11) NOT NULL AUTO_INCREMENT,
  `des_asignatura` VARCHAR(30) NOT NULL,
  `des_unidad_valorativa` VARCHAR(5) NOT NULL,
  `cant_cupos` INT(11) NOT NULL,
  PRIMARY KEY (`cod_asignatura`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `eti_upnfm`.`areas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eti_upnfm`.`areas` (
  `cod_area` INT(11) NOT NULL AUTO_INCREMENT,
  `descripcion_area` VARCHAR(30) NOT NULL,
  `cod_asignatura` INT(11) NOT NULL,
  PRIMARY KEY (`cod_area`),
  INDEX `FK__Areas__cod_asign__44FF419A` (`cod_asignatura` ASC) VISIBLE,
  CONSTRAINT `FK__Areas__cod_asign__44FF419A`
    FOREIGN KEY (`cod_asignatura`)
    REFERENCES `eti_upnfm`.`asignatura` (`cod_asignatura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `eti_upnfm`.`carreras`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eti_upnfm`.`carreras` (
  `cod_carrera` INT(11) NOT NULL AUTO_INCREMENT,
  `des_carrera` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`cod_carrera`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `eti_upnfm`.`docentes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eti_upnfm`.`docentes` (
  `cod_docente` VARCHAR(15) NOT NULL,
  `primer_nombre` VARCHAR(15) NOT NULL,
  `segundo_nombre` VARCHAR(15) NOT NULL,
  `prime_apelliod` VARCHAR(15) NOT NULL,
  `segundo_apellido` VARCHAR(15) NOT NULL,
  `titulo_docente` VARCHAR(50) NOT NULL,
  `correo` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`cod_docente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `eti_upnfm`.`aulas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eti_upnfm`.`aulas` (
  `cod_aula` INT(11) NOT NULL AUTO_INCREMENT,
  `des_aula` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`cod_aula`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `eti_upnfm`.`edificio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eti_upnfm`.`edificio` (
  `cod_edificio` INT(11) NOT NULL AUTO_INCREMENT,
  `des_edificio` VARCHAR(25) NOT NULL,
  `cod_aula` INT(11) NOT NULL,
  PRIMARY KEY (`cod_edificio`),
  INDEX `FK__Edificio__cod_au__5629CD9C` (`cod_aula` ASC) VISIBLE,
  CONSTRAINT `FK__Edificio__cod_au__5629CD9C`
    FOREIGN KEY (`cod_aula`)
    REFERENCES `eti_upnfm`.`aulas` (`cod_aula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `eti_upnfm`.`seccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eti_upnfm`.`seccion` (
  `cod_seccion` INT(11) NOT NULL AUTO_INCREMENT,
  `des_seccion` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`cod_seccion`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `eti_upnfm`.`dias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eti_upnfm`.`dias` (
  `id_dias` INT(11) NOT NULL AUTO_INCREMENT,
  `des_dias` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id_dias`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `eti_upnfm`.`horarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eti_upnfm`.`horarios` (
  `id_horario` INT(11) NOT NULL AUTO_INCREMENT,
  `hora_inicio` TIME NOT NULL,
  `hora_finaliza` TIME NOT NULL,
  PRIMARY KEY (`id_horario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `eti_upnfm`.`asesoria_academica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eti_upnfm`.`asesoria_academica` (
  `cod_asesoria` INT(11) NOT NULL AUTO_INCREMENT,
  `cod_asignatura` INT(11) NOT NULL,
  `id_horario` INT(11) NOT NULL,
  `id_dias` INT(11) NOT NULL,
  `cod_docente` VARCHAR(15) NOT NULL,
  `cod_carrera` INT(11) NOT NULL,
  `cod_seccion` INT(11) NOT NULL,
  `cod_edificio` INT(11) NOT NULL,
  PRIMARY KEY (`cod_asesoria`),
  INDEX `FK__Asesoria___cod_a__45F365D3` (`cod_asignatura` ASC) VISIBLE,
  INDEX `FK__Asesoria___cod_c__46E78A0C` (`cod_carrera` ASC) VISIBLE,
  INDEX `FK__Asesoria___cod_d__47DBAE45` (`cod_docente` ASC) VISIBLE,
  INDEX `FK__Asesoria___cod_e__48CFD27E` (`cod_edificio` ASC) VISIBLE,
  INDEX `FK__Asesoria___cod_s__49C3F6B7` (`cod_seccion` ASC) VISIBLE,
  INDEX `FK__Asesoria___id_di__4AB81AF0` (`id_dias` ASC) VISIBLE,
  INDEX `FK__Asesoria___id_ho__4BAC3F29` (`id_horario` ASC) VISIBLE,
  CONSTRAINT `FK__Asesoria___cod_a__45F365D3`
    FOREIGN KEY (`cod_asignatura`)
    REFERENCES `eti_upnfm`.`asignatura` (`cod_asignatura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK__Asesoria___cod_c__46E78A0C`
    FOREIGN KEY (`cod_carrera`)
    REFERENCES `eti_upnfm`.`carreras` (`cod_carrera`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK__Asesoria___cod_d__47DBAE45`
    FOREIGN KEY (`cod_docente`)
    REFERENCES `eti_upnfm`.`docentes` (`cod_docente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK__Asesoria___cod_e__48CFD27E`
    FOREIGN KEY (`cod_edificio`)
    REFERENCES `eti_upnfm`.`edificio` (`cod_edificio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK__Asesoria___cod_s__49C3F6B7`
    FOREIGN KEY (`cod_seccion`)
    REFERENCES `eti_upnfm`.`seccion` (`cod_seccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK__Asesoria___id_di__4AB81AF0`
    FOREIGN KEY (`id_dias`)
    REFERENCES `eti_upnfm`.`dias` (`id_dias`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK__Asesoria___id_ho__4BAC3F29`
    FOREIGN KEY (`id_horario`)
    REFERENCES `eti_upnfm`.`horarios` (`id_horario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `eti_upnfm`.`clase_secundaria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eti_upnfm`.`clase_secundaria` (
  `cod_clase_secundaria` INT(11) NOT NULL AUTO_INCREMENT,
  `cod_asignatura` INT(11) NOT NULL,
  `boleano` TINYINT(3) UNSIGNED NOT NULL,
  PRIMARY KEY (`cod_clase_secundaria`),
  INDEX `FK__Clase_Sec__cod_a__5070F446` (`cod_asignatura` ASC) VISIBLE,
  CONSTRAINT `FK__Clase_Sec__cod_a__5070F446`
    FOREIGN KEY (`cod_asignatura`)
    REFERENCES `eti_upnfm`.`asignatura` (`cod_asignatura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `eti_upnfm`.`asignatura_carrera`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eti_upnfm`.`asignatura_carrera` (
  `cod_asignatura` INT(11) NOT NULL,
  `cod_carrera` INT(11) NOT NULL,
  `cod_clase_secundaria` INT(11) NOT NULL,
  INDEX `FK__Asignatur__cod_a__4CA06362` (`cod_asignatura` ASC) VISIBLE,
  INDEX `FK__Asignatur__cod_c__4D94879B` (`cod_carrera` ASC) VISIBLE,
  INDEX `FK__Asignatur__cod_c__4E88ABD4` (`cod_clase_secundaria` ASC) VISIBLE,
  CONSTRAINT `FK__Asignatur__cod_a__4CA06362`
    FOREIGN KEY (`cod_asignatura`)
    REFERENCES `eti_upnfm`.`asignatura` (`cod_asignatura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK__Asignatur__cod_c__4D94879B`
    FOREIGN KEY (`cod_carrera`)
    REFERENCES `eti_upnfm`.`carreras` (`cod_carrera`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK__Asignatur__cod_c__4E88ABD4`
    FOREIGN KEY (`cod_clase_secundaria`)
    REFERENCES `eti_upnfm`.`clase_secundaria` (`cod_clase_secundaria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `eti_upnfm`.`años`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eti_upnfm`.`años` (
  `cod_año` INT(11) NOT NULL AUTO_INCREMENT,
  `des_año` INT(11) NOT NULL,
  PRIMARY KEY (`cod_año`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `eti_upnfm`.`años_asesoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eti_upnfm`.`años_asesoria` (
  `cod_año` INT(11) NOT NULL AUTO_INCREMENT,
  `cod_asesoria` INT(11) NOT NULL,
  INDEX `ix_Años_Asesoria_autoinc` (`cod_año` ASC) VISIBLE,
  INDEX `FK__Años_Ases__cod_a__440B1D61` (`cod_asesoria` ASC) VISIBLE,
  CONSTRAINT `FK__Años_Ases__cod_a__4316F928`
    FOREIGN KEY (`cod_año`)
    REFERENCES `eti_upnfm`.`años` (`cod_año`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK__Años_Ases__cod_a__440B1D61`
    FOREIGN KEY (`cod_asesoria`)
    REFERENCES `eti_upnfm`.`asesoria_academica` (`cod_asesoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `eti_upnfm`.`cargos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eti_upnfm`.`cargos` (
  `cod_cargo_docente` INT(11) NOT NULL AUTO_INCREMENT,
  `des_cargo` VARCHAR(50) NOT NULL,
  `cod_docente` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`cod_cargo_docente`),
  INDEX `FK__Cargos__cod_doce__4F7CD00D` (`cod_docente` ASC) VISIBLE,
  CONSTRAINT `FK__Cargos__cod_doce__4F7CD00D`
    FOREIGN KEY (`cod_docente`)
    REFERENCES `eti_upnfm`.`docentes` (`cod_docente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `eti_upnfm`.`especialidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eti_upnfm`.`especialidad` (
  `cod_especialidad` INT(11) NOT NULL AUTO_INCREMENT,
  `des_especialidad` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`cod_especialidad`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `eti_upnfm`.`docente_especialidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eti_upnfm`.`docente_especialidad` (
  `cod_especialidad` INT(11) NOT NULL AUTO_INCREMENT,
  `cod_docente` VARCHAR(15) NOT NULL,
  INDEX `ix_Docente_Especialidad_autoinc` (`cod_especialidad` ASC) VISIBLE,
  INDEX `FK__Docente_E__cod_d__5165187F` (`cod_docente` ASC) VISIBLE,
  CONSTRAINT `FK__Docente_E__cod_d__5165187F`
    FOREIGN KEY (`cod_docente`)
    REFERENCES `eti_upnfm`.`docentes` (`cod_docente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK__Docente_E__cod_e__52593CB8`
    FOREIGN KEY (`cod_especialidad`)
    REFERENCES `eti_upnfm`.`especialidad` (`cod_especialidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `eti_upnfm`.`periodos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eti_upnfm`.`periodos` (
  `cod_periodos` INT(11) NOT NULL AUTO_INCREMENT,
  `des_periodos` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`cod_periodos`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `eti_upnfm`.`docente_perido_asig`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `eti_upnfm`.`docente_perido_asig` (
  `cod_periodos` INT(11) NOT NULL,
  `cod_docente` VARCHAR(15) NOT NULL,
  `cod_asignatura` INT(11) NOT NULL,
  INDEX `FK__Docente_P__cod_a__534D60F1` (`cod_asignatura` ASC) VISIBLE,
  INDEX `FK__Docente_P__cod_d__5441852A` (`cod_docente` ASC) VISIBLE,
  INDEX `FK__Docente_P__cod_p__5535A963` (`cod_periodos` ASC) VISIBLE,
  CONSTRAINT `FK__Docente_P__cod_a__534D60F1`
    FOREIGN KEY (`cod_asignatura`)
    REFERENCES `eti_upnfm`.`asignatura` (`cod_asignatura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK__Docente_P__cod_d__5441852A`
    FOREIGN KEY (`cod_docente`)
    REFERENCES `eti_upnfm`.`docentes` (`cod_docente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK__Docente_P__cod_p__5535A963`
    FOREIGN KEY (`cod_periodos`)
    REFERENCES `eti_upnfm`.`periodos` (`cod_periodos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
