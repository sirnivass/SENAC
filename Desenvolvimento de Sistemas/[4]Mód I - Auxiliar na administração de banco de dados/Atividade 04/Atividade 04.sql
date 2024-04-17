-- Criar uc4atividades
CREATE DATABASE `uc4atividades` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;

-- Usar uc4atividades
USE uc4atividades;

-- Criar Tabela `uc4atividades`.`cargo`
CREATE TABLE `uc4atividades`.`cargo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NULL DEFAULT NULL,
  `salario` DECIMAL(9,2) NULL DEFAULT NULL,
  `comissao` FLOAT NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- Criar Tabela `uc4atividades`.`usuario`
CREATE TABLE `uc4atividades`.`usuario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `login` VARCHAR(100) NOT NULL,
  `senha` VARCHAR(100) NOT NULL,
  `ultimo_login` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
  );

 -- Criar Tabela `uc4atividades`.`cliente`
CREATE TABLE `uc4atividades`.`cliente` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `cpf` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`id`)
);
-- Criar Tabela `uc4atividades`.`telefone_cliente`
CREATE TABLE telefone_cliente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    numero_telefone VARCHAR(20),
    FOREIGN KEY (cliente_id) REFERENCES cliente(id)
);
-- Criar Tabela `uc4atividades`.`endereco_cliente`
CREATE TABLE endereco_cliente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    logradouro VARCHAR(50),
    bairro VARCHAR(50),
    cidade VARCHAR(50),
    cep VARCHAR(50),
    FOREIGN KEY (cliente_id) REFERENCES cliente(id)
);
-- Criar Tabela `uc4atividades`.`funcionario`
CREATE TABLE `uc4atividades`.`funcionario` (
  `nome` VARCHAR(255) NOT NULL,
  `telefone` VARCHAR(45) NULL DEFAULT NULL,
  `cpf` VARCHAR(11) NULL DEFAULT NULL,
  `id` INT NOT NULL AUTO_INCREMENT,
  `cargo_id` INT NULL DEFAULT NULL,
  `usuario_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `cargo_id` (`cargo_id` ASC) VISIBLE,
  INDEX `fk_funcionario_usuario` (`usuario_id` ASC) VISIBLE,
  CONSTRAINT `fk_funcionario_usuario`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `uc4atividades`.`usuario` (`id`),
  CONSTRAINT `funcionario_ibfk_1`
    FOREIGN KEY (`cargo_id`)
    REFERENCES `uc4atividades`.`cargo` (`id`)
);
-- Criar Tabela `uc4atividades`.`venda`
CREATE TABLE venda (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    funcionario_id INT,
    data_venda DATE,
    tipo_pagamento VARCHAR(50),
    FOREIGN KEY (cliente_id) REFERENCES cliente(id),
    FOREIGN KEY (funcionario_id) REFERENCES funcionario(id)
);
-- Criar Tabela `uc4atividades`.`produto`

CREATE TABLE `uc4atividades`.`produto` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `descricao` VARCHAR(255) NULL DEFAULT NULL,
  `estoque` INT NULL DEFAULT NULL,
  `fabricante` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
  );
-- Criar Tabela `uc4atividades`.`item_venda`

CREATE TABLE item_venda (
    id INT AUTO_INCREMENT PRIMARY KEY,
    venda_id INT,
    produto_id INT,
    quantidade INT,
    preco_total DECIMAL(10,2),
    FOREIGN KEY (venda_id) REFERENCES venda(id),
    FOREIGN KEY (produto_id) REFERENCES produto(id)
);
-- Criar Tabela `uc4atividades`.`item_vendido`
CREATE TABLE item_vendido (
    id INT AUTO_INCREMENT PRIMARY KEY,
    venda_id INT,
    produto_id INT,
    quantidade INT,
    preco_unitario DECIMAL(10,2),
    FOREIGN KEY (venda_id) REFERENCES venda(id),
    FOREIGN KEY (produto_id) REFERENCES produto(id)
);