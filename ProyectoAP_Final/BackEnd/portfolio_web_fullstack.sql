-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema porfolio_web_fullstack
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `portfolio_fullstack_ap` DEFAULT CHARACTER SET utf8 ;
USE `porfolio_web_fullstack` ;

-- -----------------------------------------------------
-- Table `porfolio_web_fullstack`.`persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `porfolio_web_fullstack`.`persona` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `apellido` VARCHAR(45) NULL,
  `profesion` VARCHAR(45) NULL,
  `telefono` VARCHAR(45) NULL,
  `correo` VARCHAR(45) NULL,
  `acerca_de` VARCHAR(300) NULL,
  `url_foto` VARCHAR(300) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `porfolio_web_fullstack`.`tipo_empleo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `porfolio_web_fullstack`.`tipo_empleo` (
  `id` INT NOT NULL,
  `nombre_tipo` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `porfolio_web_fullstack`.`experiencia_laboral`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `porfolio_web_fullstack`.`experiencia_laboral` (
id` INT NOT NULL,
  `nombre_empresa` VARCHAR(45) NULL,
  `es_trabajo_actual` TINYINT NULL,
  `fecha_inicio` DATE NULL,
  `fecha_fin` DATE NULL,
  `descripcion` VARCHAR(200) NULL,
  `persona_id` INT NOT NULL,
  `tipo_empleo_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_experiencia_laboral_persona1_idx` (`persona_id` ASC) ,
  INDEX `fk_experiencia_laboral_tipo_empleo1_idx` (`tipo_empleo_id` ASC) ,
  CONSTRAINT `fk_experiencia_laboral_persona1`
    FOREIGN KEY (`persona_id`)
    REFERENCES `porfolio_web_fullstack`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_experiencia_laboral_tipo_empleo1`
    FOREIGN KEY (`tipo_empleo_id`)
    REFERENCES `porfolio_web_fullstack`.`tipo_empleo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `porfolio_web_fullstack`.`educacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `porfolio_web_fullstack`.`educacion` (
  `id` INT NOT NULL,
  `tipo_educacion` VARCHAR(45) NULL,
  `titulo` VARCHAR(45) NULL,
  `recibio` TINYINT NULL,
  `persona_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_educacion_persona1_idx` (`persona_id` ASC) ,
  CONSTRAINT `fk_educacion_persona1`
    FOREIGN KEY (`persona_id`)
    REFERENCES `porfolio_web_fullstack`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `porfolio_web_fullstack`.`domicilio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `porfolio_web_fullstack`.`domicilio` (
  `id` INT NOT NULL,
  `localidad` VARCHAR(45) NULL,
  `provincia` VARCHAR(45) NULL,
  `pais` VARCHAR(45) NULL,
  `persona_id` INT NOT NULL,
  PRIMARY KEY (`id`, `persona_id`),
  INDEX `fk_domicilio_persona1_idx` (`persona_id` ASC) ,
  CONSTRAINT `fk_domicilio_persona1`
    FOREIGN KEY (`persona_id`)
    REFERENCES `porfolio_web_fullstack`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `porfolio_web_fullstack`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `porfolio_web_fullstack`.`usuario` (
  `id` INT NOT NULL,
  `persona_id` INT NOT NULL,
  `usuario` VARCHAR(45) NULL,
  `contraseña` VARCHAR(45) NULL,
  PRIMARY KEY (`id`, `persona_id`),
  INDEX `fk_usuarios_persona1_idx` (`persona_id` ASC) ,
  CONSTRAINT `fk_usuarios_persona1`
    FOREIGN KEY (`persona_id`)
    REFERENCES `porfolio_web_fullstack`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `porfolio_web_fullstack`.`proyecto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `porfolio_web_fullstack`.`proyecto` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `descripcion` VARCHAR(200) NULL,
  `nombre_cliente` VARCHAR(45) NULL,
  `persona_id` INT NOT NULL,
  `persona_id1` INT NOT NULL,
  PRIMARY KEY (`id`, `persona_id`),
  INDEX `fk_proyecto_persona1_idx` (`persona_id1` ASC) ,
  CONSTRAINT `fk_proyecto_persona1`
    FOREIGN KEY (`persona_id1`)
    REFERENCES `porfolio_web_fullstack`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `porfolio_web_fullstack`.`tecnologia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `porfolio_web_fullstack`.`tecnologia` (
  `id` INT NOT NULL,
  `tipo_tecnologia` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `porfolio_web_fullstack`.`tecnologia_has_proyecto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `porfolio_web_fullstack`.`tecnologia_has_proyecto` (
  `proyecto_id` INT NOT NULL,
  `proyecto_persona_id` INT NOT NULL,
  `tecnologia_id` INT NOT NULL,
  INDEX `fk_tecnologia_has_proyecto_proyecto1_idx` (`proyecto_id` ASC, `proyecto_persona_id` ASC) ,
  INDEX `fk_tecnologia_has_proyecto_tecnologia1_idx` (`tecnologia_id` ASC) ,
  CONSTRAINT `fk_tecnologia_has_proyecto_proyecto1`
    FOREIGN KEY (`proyecto_id` , `proyecto_persona_id`)
    REFERENCES `porfolio_web_fullstack`.`proyecto` (`id` , `persona_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tecnologia_has_proyecto_tecnologia1`
    FOREIGN KEY (`tecnologia_id`)
    REFERENCES `porfolio_web_fullstack`.`tecnologia` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `porfolio_web_fullstack`.`skills`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `porfolio_web_fullstack`.`skills` (
  `idskills` INT NOT NULL,
  `skill_name` VARCHAR(45) NULL,
  `persona_id` INT NOT NULL,
  PRIMARY KEY (`idskills`),
  INDEX `fk_skills_persona1_idx` (`persona_id` ASC) VISIBLE,
  CONSTRAINT `fk_skills_persona1`
    FOREIGN KEY (`persona_id`)
    REFERENCES `porfolio_web_fullstack`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
