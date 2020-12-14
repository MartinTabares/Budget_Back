-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema budget
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `budget` ;

-- -----------------------------------------------------
-- Schema budget
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `budget` DEFAULT CHARACTER SET utf8 ;
USE `budget` ;

-- -----------------------------------------------------
-- Table `budget`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `budget`.`user` ;

CREATE TABLE IF NOT EXISTS `budget`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fullname` VARCHAR(30) NOT NULL,
  `dni` INT NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`));
  
  insert into user(fullname, dni, email) values ('Martin Tabares', 37851936, 'martinalejandrotabares@gmail.com');
  insert into user(fullname, dni, email) values ('Micaela Lucero', 38765498, 'micalucero@gmail.com');
  insert into user(fullname, dni, email) values ('Leonardo Tulian', 35678765, 'leotulian@gmail.com');

-- -----------------------------------------------------
-- Table `budget`.`income`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `budget`.`income` ;

CREATE TABLE IF NOT EXISTS `budget`.`income` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(30) NOT NULL,
  `amount` DOUBLE NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`, `user_id`),
  CONSTRAINT `fk_income_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `budget`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE INDEX `fk_income_user_idx` ON `budget`.`income` (`user_id` ASC);

insert into income(description, amount, user_id) values ('Sueldo mensual', '50000', 1);
insert into income(description, amount, user_id) values ('Aguinaldo', '25000', 1);
insert into income(description, amount, user_id) values ('Alquiler', '15000', 1);
insert into income(description, amount, user_id) values ('Devolución de préstamo', '5000', 1);
insert into income(description, amount, user_id) values ('Venta de ajedrez', '10000', 1);
insert into income(description, amount, user_id) values ('Juego de quiniela', '2000', 1);
insert into income(description, amount, user_id) values ('Inversión', '10000', 1);
insert into income(description, amount, user_id) values ('Plazo Fijo', '23000', 1);
insert into income(description, amount, user_id) values ('Venta de PlayStation', '34000', 1);
insert into income(description, amount, user_id) values ('Sueldo mensual', '60500', 2);
insert into income(description, amount, user_id) values ('Aguinaldo', '30250', 2);
insert into income(description, amount, user_id) values ('Sueldo mensual', '89300', 3);
insert into income(description, amount, user_id) values ('Aguinaldo', '44650', 3);

-- -----------------------------------------------------
-- Table `budget`.`expenses`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `budget`.`expenses` ;

CREATE TABLE IF NOT EXISTS `budget`.`expenses` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(30) NOT NULL,
  `amount` DOUBLE NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`, `user_id`),
  CONSTRAINT `fk_expenses_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `budget`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE INDEX `fk_expenses_user1_idx` ON `budget`.`expenses` (`user_id` ASC);

insert into expenses(description, amount, user_id) values ('Tarjeta Naranja', '20000', 1);
insert into expenses(description, amount, user_id) values ('Tarjeta Macro', '5000', 1);
insert into expenses(description, amount, user_id) values ('Gimnasio', '1500', 1);
insert into expenses(description, amount, user_id) values ('Nafta', '4000', 1);
insert into expenses(description, amount, user_id) values ('Jardín', '4500', 1);
insert into expenses(description, amount, user_id) values ('Comida', '17500', 1);
insert into expenses(description, amount, user_id) values ('Ropa', '13000', 1);
insert into expenses(description, amount, user_id) values ('Juguetes', '2300', 1);
insert into expenses(description, amount, user_id) values ('Servicios', '7000', 1);
insert into expenses(description, amount, user_id) values ('Alquiler', '20500', 2);
insert into expenses(description, amount, user_id) values ('Comida', '25250', 2);
insert into expenses(description, amount, user_id) values ('Comida', '19300', 3);
insert into expenses(description, amount, user_id) values ('Servicios', '4650', 3);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
