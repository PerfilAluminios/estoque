-- MySQL Script generated by MySQL Workbench
-- Wed Sep 20 21:11:40 2017
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema perfilAluminio
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema perfilAluminio
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `perfilAluminio` DEFAULT CHARACTER SET utf8 ;
USE `perfilAluminio` ;

-- -----------------------------------------------------
-- Table `perfilAluminio`.`produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `perfilAluminio`.`produto` (
  `idproduto` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NOT NULL,
  `valor` FLOAT NOT NULL,
  `cor` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idproduto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `perfilAluminio`.`estoque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `perfilAluminio`.`estoque` (
  `idestoque` INT NOT NULL AUTO_INCREMENT,
  `qtnde` INT NOT NULL,
  `data` DATE NOT NULL,
  `produto_idproduto` INT NOT NULL,
  PRIMARY KEY (`idestoque`, `produto_idproduto`),
  INDEX `fk_estoque_produto1_idx` (`produto_idproduto` ASC),
  CONSTRAINT `fk_estoque_produto1`
    FOREIGN KEY (`produto_idproduto`)
    REFERENCES `perfilAluminio`.`produto` (`idproduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `perfilAluminio`.`fornecedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `perfilAluminio`.`fornecedor` (
  `idfornecedor` INT NOT NULL AUTO_INCREMENT,
  `nome_empresa` VARCHAR(45) NOT NULL,
  `nome_responsavel` VARCHAR(45) NOT NULL,
  `cnpj` VARCHAR(45) NOT NULL,
  `cpf_responsavel` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idfornecedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `perfilAluminio`.`produto_has_fornecedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `perfilAluminio`.`produto_has_fornecedor` (
  `produto_idproduto` INT NOT NULL,
  `fornecedor_idfornecedor` INT NOT NULL,
  PRIMARY KEY (`produto_idproduto`, `fornecedor_idfornecedor`),
  INDEX `fk_produto_has_fornecedor_fornecedor1_idx` (`fornecedor_idfornecedor` ASC),
  INDEX `fk_produto_has_fornecedor_produto_idx` (`produto_idproduto` ASC),
  CONSTRAINT `fk_produto_has_fornecedor_produto`
    FOREIGN KEY (`produto_idproduto`)
    REFERENCES `perfilAluminio`.`produto` (`idproduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_produto_has_fornecedor_fornecedor1`
    FOREIGN KEY (`fornecedor_idfornecedor`)
    REFERENCES `perfilAluminio`.`fornecedor` (`idfornecedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
 
