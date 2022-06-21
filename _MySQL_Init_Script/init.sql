CREATE DATABASE Alunosdb;

USE Alunosdb;

DROP TABLE IF EXISTS `Alunos`;

CREATE TABLE `Alunos` (
  `AlunosId` INT AUTO_INCREMENT,
  `Nome` VARCHAR(80) NOT NULL,
  `Email` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`AlunosId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Alunos` WRITE;
INSERT INTO `Alunos` VALUES (1, 'MATHEUS', 'mat@gmail.com');
INSERT INTO `Alunos` VALUES (2, 'THIAGO', 'thi@gmail.com');
INSERT INTO `Alunos` VALUES (3, 'ANDREA', 'and@gmail.com');
INSERT INTO `Alunos` VALUES (4, 'CLAITON', 'cla@gmail.com');
UNLOCK TABLES;