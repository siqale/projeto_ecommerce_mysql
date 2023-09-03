-- MySQL Script generated by MySQL Workbench
-- Sat Sep  2 10:42:05 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema desafio_ecommerce_base
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `desafio_ecommerce_base` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema desafio_ecommerce_refined
-- -----------------------------------------------------
USE `desafio_ecommerce_base` ;

-- -----------------------------------------------------
-- Table `desafio_ecommerce_base`.`fornecedor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `desafio_ecommerce_base`.`fornecedor` ;

CREATE TABLE IF NOT EXISTS `desafio_ecommerce_base`.`fornecedor` (
  `IDfornecedor` INT NOT NULL AUTO_INCREMENT,
  `razao_social` VARCHAR(255) NOT NULL,
  `nome_fantasia` VARCHAR(45) NOT NULL,
  `cnpj` CHAR(14) NOT NULL,
  `contato` CHAR(11) NULL DEFAULT NULL,
  PRIMARY KEY (`IDfornecedor`),
  UNIQUE INDEX `cnpj_UNIQUE` (`cnpj` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `desafio_ecommerce_base`.`cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `desafio_ecommerce_base`.`cliente` ;

CREATE TABLE IF NOT EXISTS `desafio_ecommerce_base`.`cliente` (
  `IDCliente` INT NOT NULL AUTO_INCREMENT,
  `FName` VARCHAR(255) NULL DEFAULT NULL COMMENT 'Adcionar constraint para tornar o nome e sobrenome como únicos',
  `NInit` VARCHAR(45) NULL DEFAULT NULL,
  `LName` VARCHAR(255) NULL DEFAULT NULL,
  `cpf` CHAR(11) NULL DEFAULT NULL,
  `address` VARCHAR(255) CHARACTER SET 'ascii' NOT NULL,
  `birthdate` DATE NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`IDCliente`),
  UNIQUE INDEX `cpf_UNIQUE` (`cpf` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `desafio_ecommerce_base`.`Terceiro_Vendedor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `desafio_ecommerce_base`.`Terceiro_Vendedor` ;

CREATE TABLE IF NOT EXISTS `desafio_ecommerce_base`.`Terceiro_Vendedor` (
  `IDTerceiro_Vendedor` INT NOT NULL AUTO_INCREMENT,
  `razao_social` VARCHAR(255) NULL DEFAULT NULL,
  `local` VARCHAR(45) NULL DEFAULT NULL,
  `nome_fantasia` VARCHAR(45) NULL DEFAULT NULL,
  `endereco` VARCHAR(255) NULL DEFAULT NULL,
  `cnpj` CHAR(14) NOT NULL,
  `cpf` CHAR(11) NOT NULL,
  PRIMARY KEY (`IDTerceiro_Vendedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `desafio_ecommerce_base`.`address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `desafio_ecommerce_base`.`address` ;

CREATE TABLE IF NOT EXISTS `desafio_ecommerce_base`.`address` (
  `idaddress` INT NOT NULL,
  `cliente_IDCliente` INT NULL,
  `fornecedor_IDfornecedor` INT NULL,
  `Terceiro_Vendedor_IDTerceiro_Vendedor` INT NULL,
  `tipo` ENUM("Entrega", "Faturamento") NOT NULL DEFAULT 'Faturamento',
  `logradouro` VARCHAR(255) NOT NULL,
  `numero` INT NOT NULL,
  `complemento` VARCHAR(45) NULL,
  `bairro` VARCHAR(50) NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  `estado` CHAR(2) NOT NULL,
  `país` VARCHAR(45) NOT NULL,
  `obs` VARCHAR(45) NULL,
  PRIMARY KEY (`idaddress`, `cliente_IDCliente`, `fornecedor_IDfornecedor`, `Terceiro_Vendedor_IDTerceiro_Vendedor`),
  INDEX `fk_address_fornecedor1_idx` (`fornecedor_IDfornecedor` ASC) VISIBLE,
  INDEX `fk_address_cliente1_idx` (`cliente_IDCliente` ASC) VISIBLE,
  INDEX `fk_address_Terceiro_Vendedor1_idx` (`Terceiro_Vendedor_IDTerceiro_Vendedor` ASC) VISIBLE,
  CONSTRAINT `fk_address_fornecedor1`
    FOREIGN KEY (`fornecedor_IDfornecedor`)
    REFERENCES `desafio_ecommerce_base`.`fornecedor` (`IDfornecedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_address_cliente1`
    FOREIGN KEY (`cliente_IDCliente`)
    REFERENCES `desafio_ecommerce_base`.`cliente` (`IDCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_address_Terceiro_Vendedor1`
    FOREIGN KEY (`Terceiro_Vendedor_IDTerceiro_Vendedor`)
    REFERENCES `desafio_ecommerce_base`.`Terceiro_Vendedor` (`IDTerceiro_Vendedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `desafio_ecommerce_base`.`cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `desafio_ecommerce_base`.`cliente` ;

CREATE TABLE IF NOT EXISTS `desafio_ecommerce_base`.`cliente` (
  `IDCliente` INT NOT NULL AUTO_INCREMENT,
  `FName` VARCHAR(255) NULL DEFAULT NULL COMMENT 'Adcionar constraint para tornar o nome e sobrenome como únicos',
  `NInit` VARCHAR(45) NULL DEFAULT NULL,
  `LName` VARCHAR(255) NULL DEFAULT NULL,
  `cpf` CHAR(11) NULL DEFAULT NULL,
  `address` VARCHAR(255) CHARACTER SET 'ascii' NOT NULL,
  `birthdate` DATE NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`IDCliente`),
  UNIQUE INDEX `cpf_UNIQUE` (`cpf` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `desafio_ecommerce_base`.`produto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `desafio_ecommerce_base`.`produto` ;

CREATE TABLE IF NOT EXISTS `desafio_ecommerce_base`.`produto` (
  `IDProduto` INT NOT NULL AUTO_INCREMENT,
  `NomeProduto` VARCHAR(255) NULL DEFAULT NULL,
  `preco` FLOAT NOT NULL COMMENT 'Preço do produto',
  `classification_kids` ENUM("0", "1") NOT NULL DEFAULT 0,
  `category` ENUM("Vestimentas", "Brinquedos", "Eletrônicos", "Alimentos") NOT NULL,
  `avaliacao` FLOAT NULL DEFAULT 0 COMMENT 'Estrelas que os clientes darão ao produto. Pode ser que na média seja float',
  `size` INT NULL DEFAULT NULL COMMENT 'Dimensão do produto',
  PRIMARY KEY (`IDProduto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `desafio_ecommerce_base`.`payments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `desafio_ecommerce_base`.`payments` ;

CREATE TABLE IF NOT EXISTS `desafio_ecommerce_base`.`payments` (
  `IDpayments` INT NOT NULL AUTO_INCREMENT,
  `available_limit` FLOAT NOT NULL,
  `descricao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`IDpayments`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `desafio_ecommerce_base`.`pedido`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `desafio_ecommerce_base`.`pedido` ;

CREATE TABLE IF NOT EXISTS `desafio_ecommerce_base`.`pedido` (
  `IDpedido` INT NOT NULL AUTO_INCREMENT,
  `cliente_IDCliente` INT NOT NULL,
  `payments_IDpayments` INT NOT NULL,
  `status` ENUM("Em Processamento", "Cancelado", "Enviado") NULL DEFAULT 'Em Processamento',
  `descricao` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`IDpedido`, `cliente_IDCliente`, `payments_IDpayments`),
  INDEX `fk_pedido_cliente1_idx` (`cliente_IDCliente` ASC) VISIBLE,
  INDEX `fk_pedido_payments1_idx` (`payments_IDpayments` ASC) VISIBLE,
  CONSTRAINT `fk_pedido_cliente1`
    FOREIGN KEY (`cliente_IDCliente`)
    REFERENCES `desafio_ecommerce_base`.`cliente` (`IDCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_payments1`
    FOREIGN KEY (`payments_IDpayments`)
    REFERENCES `desafio_ecommerce_base`.`payments` (`IDpayments`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `desafio_ecommerce_base`.`produto_has_pedido`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `desafio_ecommerce_base`.`produto_has_pedido` ;

CREATE TABLE IF NOT EXISTS `desafio_ecommerce_base`.`produto_has_pedido` (
  `pedido_IDPedido` INT NOT NULL,
  `produto_IDProduto` INT NOT NULL,
  `pedido_cliente_IDCliente` INT NOT NULL,
  `quantidade` INT NOT NULL,
  PRIMARY KEY (`pedido_IDPedido`, `produto_IDProduto`, `pedido_cliente_IDCliente`),
  INDEX `fk_produto_has_pedido_pedido1_idx` (`pedido_IDPedido` ASC) VISIBLE,
  INDEX `fk_produto_has_pedido_produto1_idx` (`produto_IDProduto` ASC) VISIBLE,
  INDEX `fk_produto_has_pedido_pedido2_idx` (`pedido_cliente_IDCliente` ASC) VISIBLE,
  CONSTRAINT `fk_produto_has_pedido_produto1`
    FOREIGN KEY (`produto_IDProduto`)
    REFERENCES `desafio_ecommerce_base`.`produto` (`IDProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_produto_has_pedido_pedido1`
    FOREIGN KEY (`pedido_IDPedido`)
    REFERENCES `desafio_ecommerce_base`.`pedido` (`IDpedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_produto_has_pedido_pedido2`
    FOREIGN KEY (`pedido_cliente_IDCliente`)
    REFERENCES `desafio_ecommerce_base`.`pedido` (`cliente_IDCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `desafio_ecommerce_base`.`fornecedor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `desafio_ecommerce_base`.`fornecedor` ;

CREATE TABLE IF NOT EXISTS `desafio_ecommerce_base`.`fornecedor` (
  `IDfornecedor` INT NOT NULL AUTO_INCREMENT,
  `razao_social` VARCHAR(255) NOT NULL,
  `nome_fantasia` VARCHAR(45) NOT NULL,
  `cnpj` CHAR(14) NOT NULL,
  `contato` CHAR(11) NULL DEFAULT NULL,
  PRIMARY KEY (`IDfornecedor`),
  UNIQUE INDEX `cnpj_UNIQUE` (`cnpj` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `desafio_ecommerce_base`.`estoque`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `desafio_ecommerce_base`.`estoque` ;

CREATE TABLE IF NOT EXISTS `desafio_ecommerce_base`.`estoque` (
  `IDestoque` INT NOT NULL AUTO_INCREMENT,
  `local` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`IDestoque`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `desafio_ecommerce_base`.`produto_has_estoque`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `desafio_ecommerce_base`.`produto_has_estoque` ;

CREATE TABLE IF NOT EXISTS `desafio_ecommerce_base`.`produto_has_estoque` (
  `produto_IDProduto` INT NOT NULL,
  `estoque_IDestoque` INT NOT NULL,
  `quantidade` INT(10) NOT NULL,
  PRIMARY KEY (`produto_IDProduto`, `estoque_IDestoque`),
  INDEX `fk_produto_has_estoque_estoque1_idx` (`estoque_IDestoque` ASC) VISIBLE,
  INDEX `fk_produto_has_estoque_produto1_idx` (`produto_IDProduto` ASC) VISIBLE,
  CONSTRAINT `fk_produto_has_estoque_produto1`
    FOREIGN KEY (`produto_IDProduto`)
    REFERENCES `desafio_ecommerce_base`.`produto` (`IDProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_produto_has_estoque_estoque1`
    FOREIGN KEY (`estoque_IDestoque`)
    REFERENCES `desafio_ecommerce_base`.`estoque` (`IDestoque`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `desafio_ecommerce_base`.`fornecedor_has_produto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `desafio_ecommerce_base`.`fornecedor_has_produto` ;

CREATE TABLE IF NOT EXISTS `desafio_ecommerce_base`.`fornecedor_has_produto` (
  `produto_IDProduto` INT NOT NULL,
  `fornecedor_IDfornecedor` INT NOT NULL,
  PRIMARY KEY (`produto_IDProduto`, `fornecedor_IDfornecedor`),
  INDEX `fk_fornercedor_has_produto_produto1_idx` (`produto_IDProduto` ASC) VISIBLE,
  INDEX `fk_fornercedor_has_produto_fornercedor1_idx` (`fornecedor_IDfornecedor` ASC) VISIBLE,
  CONSTRAINT `fk_fornercedor_has_produto_fornercedor1`
    FOREIGN KEY (`fornecedor_IDfornecedor`)
    REFERENCES `desafio_ecommerce_base`.`fornecedor` (`IDfornecedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_fornercedor_has_produto_produto1`
    FOREIGN KEY (`produto_IDProduto`)
    REFERENCES `desafio_ecommerce_base`.`produto` (`IDProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `desafio_ecommerce_base`.`Terceiro_Vendedor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `desafio_ecommerce_base`.`Terceiro_Vendedor` ;

CREATE TABLE IF NOT EXISTS `desafio_ecommerce_base`.`Terceiro_Vendedor` (
  `IDTerceiro_Vendedor` INT NOT NULL AUTO_INCREMENT,
  `razao_social` VARCHAR(255) NULL DEFAULT NULL,
  `local` VARCHAR(45) NULL DEFAULT NULL,
  `nome_fantasia` VARCHAR(45) NULL DEFAULT NULL,
  `endereco` VARCHAR(255) NULL DEFAULT NULL,
  `cnpj` CHAR(14) NOT NULL,
  `cpf` CHAR(11) NOT NULL,
  PRIMARY KEY (`IDTerceiro_Vendedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `desafio_ecommerce_base`.`Terceiro_Vendedor_has_produto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `desafio_ecommerce_base`.`Terceiro_Vendedor_has_produto` ;

CREATE TABLE IF NOT EXISTS `desafio_ecommerce_base`.`Terceiro_Vendedor_has_produto` (
  `produto_IDProduto` INT NOT NULL,
  `Terceiro_Vendedor_IDTerceiro_Vendedor` INT NOT NULL,
  `data` DATE NULL DEFAULT NULL,
  `quantidade` INT NULL DEFAULT NULL,
  `observacoes` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`produto_IDProduto`, `Terceiro_Vendedor_IDTerceiro_Vendedor`),
  INDEX `fk_Terceiro_Vendedor_has_produto_produto1_idx` (`produto_IDProduto` ASC) VISIBLE,
  INDEX `fk_Terceiro_Vendedor_has_produto_Terceiro_Vendedor1_idx` (`Terceiro_Vendedor_IDTerceiro_Vendedor` ASC) VISIBLE,
  CONSTRAINT `fk_Terceiro_Vendedor_has_produto_Terceiro_Vendedor1`
    FOREIGN KEY (`Terceiro_Vendedor_IDTerceiro_Vendedor`)
    REFERENCES `desafio_ecommerce_base`.`Terceiro_Vendedor` (`IDTerceiro_Vendedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Terceiro_Vendedor_has_produto_produto1`
    FOREIGN KEY (`produto_IDProduto`)
    REFERENCES `desafio_ecommerce_base`.`produto` (`IDProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `desafio_ecommerce_base`.`cartoes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `desafio_ecommerce_base`.`cartoes` ;

CREATE TABLE IF NOT EXISTS `desafio_ecommerce_base`.`cartoes` (
  `IDcartoes` INT NOT NULL AUTO_INCREMENT,
  `cliente_IDCliente` INT NOT NULL,
  `bandeira` ENUM("Mastercard", "Visa", "Elo", "Outras") NULL DEFAULT 'Visa',
  `numero` CHAR(16) NULL DEFAULT NULL,
  `vencimento` DATE NULL DEFAULT NULL,
  `cod_verificacao` CHAR(3) NULL DEFAULT NULL,
  PRIMARY KEY (`IDcartoes`, `cliente_IDCliente`),
  INDEX `fk_cartoes_cliente1_idx` (`cliente_IDCliente` ASC) VISIBLE,
  CONSTRAINT `fk_cartoes_cliente1`
    FOREIGN KEY (`cliente_IDCliente`)
    REFERENCES `desafio_ecommerce_base`.`cliente` (`IDCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `desafio_ecommerce_base`.`reposicao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `desafio_ecommerce_base`.`reposicao` ;

CREATE TABLE IF NOT EXISTS `desafio_ecommerce_base`.`reposicao` (
  `IDreposicao` INT NOT NULL AUTO_INCREMENT,
  `fornecedor_IDfornecedor` INT NOT NULL,
  `payments_IDpayments` INT NOT NULL,
  `data` DATE NOT NULL,
  `status` ENUM("Em trânsito", "Entregue") NOT NULL DEFAULT 'Em trânsito',
  `descricao` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`IDreposicao`, `fornecedor_IDfornecedor`, `payments_IDpayments`),
  INDEX `fk_reposicao_fornecedor1_idx` (`fornecedor_IDfornecedor` ASC) VISIBLE,
  INDEX `fk_reposicao_payments1_idx` (`payments_IDpayments` ASC) VISIBLE,
  CONSTRAINT `fk_reposicao_fornecedor1`
    FOREIGN KEY (`fornecedor_IDfornecedor`)
    REFERENCES `desafio_ecommerce_base`.`fornecedor` (`IDfornecedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reposicao_payments1`
    FOREIGN KEY (`payments_IDpayments`)
    REFERENCES `desafio_ecommerce_base`.`payments` (`IDpayments`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `desafio_ecommerce_base`.`reposicao_has_produto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `desafio_ecommerce_base`.`reposicao_has_produto` ;

CREATE TABLE IF NOT EXISTS `desafio_ecommerce_base`.`reposicao_has_produto` (
  `reposicao_IDreposicao` INT NOT NULL,
  `reposicao_fornecedor_IDfornecedor` INT NOT NULL,
  `produto_IDProduto` INT NOT NULL,
  `quantidade` INT NOT NULL,
  PRIMARY KEY (`reposicao_IDreposicao`, `reposicao_fornecedor_IDfornecedor`, `produto_IDProduto`),
  INDEX `fk_reposicao_has_produto_produto1_idx` (`produto_IDProduto` ASC) VISIBLE,
  INDEX `fk_reposicao_has_produto_reposicao1_idx` (`reposicao_IDreposicao` ASC, `reposicao_fornecedor_IDfornecedor` ASC) VISIBLE,
  CONSTRAINT `fk_reposicao_has_produto_reposicao1`
    FOREIGN KEY (`reposicao_IDreposicao` , `reposicao_fornecedor_IDfornecedor`)
    REFERENCES `desafio_ecommerce_base`.`reposicao` (`IDreposicao` , `fornecedor_IDfornecedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reposicao_has_produto_produto1`
    FOREIGN KEY (`produto_IDProduto`)
    REFERENCES `desafio_ecommerce_base`.`produto` (`IDProduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
