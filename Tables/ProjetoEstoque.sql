-- MySQL Script generated by MySQL Workbench
-- 09/04/17 14:26:02
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema PerfilAluminios
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema PerfilAluminios
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `PerfilAluminios` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `PerfilAluminios` ;

-- -----------------------------------------------------
-- Table `PerfilAluminios`.`produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PerfilAluminios`.`produto` (
  `idproduto` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NOT NULL,
  `valor` FLOAT NOT NULL,
  `tamanho` FLOAT NOT NULL,
  `cor` VARCHAR(45) NULL,
  PRIMARY KEY (`idproduto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PerfilAluminios`.`estoque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PerfilAluminios`.`estoque` (
  `idestoque` INT NOT NULL,
  `qtde` INT NOT NULL,
  `data` DATE NOT NULL,
  `produto_idproduto` INT NOT NULL,
  PRIMARY KEY (`idestoque`, `produto_idproduto`),
  INDEX `fk_estoque_produto1_idx` (`produto_idproduto` ASC),
  CONSTRAINT `fk_estoque_produto1`
    FOREIGN KEY (`produto_idproduto`)
    REFERENCES `PerfilAluminios`.`produto` (`idproduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PerfilAluminios`.`fornecedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PerfilAluminios`.`fornecedor` (
  `idfornecedor` INT NOT NULL AUTO_INCREMENT,
  `nome_empresa` VARCHAR(45) NOT NULL,
  `nome_responsavel` VARCHAR(45) NOT NULL,
  `cnpj` VARCHAR(14) NOT NULL,
  `cpf_responsavel` VARCHAR(14) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(14) NOT NULL,
  `endereco` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`idfornecedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PerfilAluminios`.`produto_has_fornecedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PerfilAluminios`.`produto_has_fornecedor` (
  `produto_idproduto` INT NOT NULL,
  `produto_estoque_idestoque` INT NOT NULL,
  `fornecedor_idfornecedor` INT NOT NULL,
  PRIMARY KEY (`produto_idproduto`, `produto_estoque_idestoque`, `fornecedor_idfornecedor`),
  INDEX `fk_produto_has_fornecedor_fornecedor1_idx` (`fornecedor_idfornecedor` ASC),
  INDEX `fk_produto_has_fornecedor_produto1_idx` (`produto_idproduto` ASC, `produto_estoque_idestoque` ASC),
  CONSTRAINT `fk_produto_has_fornecedor_produto1`
    FOREIGN KEY (`produto_idproduto`)
    REFERENCES `PerfilAluminios`.`produto` (`idproduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_produto_has_fornecedor_fornecedor1`
    FOREIGN KEY (`fornecedor_idfornecedor`)
    REFERENCES `PerfilAluminios`.`fornecedor` (`idfornecedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
