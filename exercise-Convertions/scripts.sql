CREATE SCHEMA IF NOT EXISTS `moneychange` DEFAULT CHARACTER SET utf8 ;
USE `moneychange` ;

-- -----------------------------------------------------
-- Table `moneychange`.`change`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `moneychange`.`change` (
  `idChange` INT(11) NOT NULL,
  `base` VARCHAR(5) NOT NULL,
  `rateValue` FLOAT NOT NULL,
  `rateName` VARCHAR(5) NOT NULL,
  `createDate` DATE NOT NULL,
  PRIMARY KEY (`idChange`))
DEFAULT CHARACTER SET = utf8;

CREATE UNIQUE INDEX `idChange_UNIQUE` ON `moneychange`.`change` (`idChange` ASC);

CREATE TABLE IF NOT EXISTS `moneychange`.`user` (
  `idUser` INT(11) NOT NULL,
  `username` VARCHAR(8) NOT NULL,
  `password` VARCHAR(8)  NOT NULL,
  `createDate` DATE NOT NULL,
  `status` INT NOT NULL,
  PRIMARY KEY (`idUser`))
DEFAULT CHARACTER SET = utf8;
CREATE UNIQUE INDEX `idUser_UNIQUE` ON `moneychange`.`user` (`idUser` ASC);

INSERT INTO MONEYCHANGE.CHANGE (idChange, base, ratename, ratevalue, createdate) VALUES
(1,"USD","AUD", 1.2512, SYSDATE()),
(2,"USD","BGN", 1.5656, SYSDATE()),
(3,"USD","BRL", 3.2015, SYSDATE()),
(4,"USD","CAD", 1.2317, SYSDATE()),
(5,"USD","CHF", 0.92827, SYSDATE()),
(6,"USD","CNY", 6.288, SYSDATE()),
(7,"USD","CZK", 20.167, SYSDATE()),
(8,"USD","DKK", 5.9581, SYSDATE()),
(9,"USD","EUR", 0.80051, SYSDATE()),
(10,"USD","GBP", 0.70325, SYSDATE()),
(11,"USD","HKD", 7.8204, SYSDATE()),
(12,"USD","HRK", 5.9517, SYSDATE()),
(13,"USD","HUF", 247.75, SYSDATE()),
(14,"USD","IDR", 13466.0, SYSDATE()),
(15,"USD","ILS", 3.434, SYSDATE()),
(16,"USD","INR", 64.057, SYSDATE()),
(17,"USD","ISK", 100.22, SYSDATE()),
(18,"USD","JPY", 109.85, SYSDATE()),
(19,"USD","KRW", 1084.9, SYSDATE()),
(20,"USD","MXN", 18.457, SYSDATE()),
(21,"USD","MYR", 3.887, SYSDATE()),
(22,"USD","NOK", 7.6579, SYSDATE()),
(23,"USD","NZD", 1.3577, SYSDATE()),
(24,"USD","PHP", 51.625, SYSDATE()),
(25,"USD","PLN", 3.3254, SYSDATE()),
(26,"USD","RON", 3.719, SYSDATE()),
(27,"USD","RUB", 56.271, SYSDATE()),
(28,"USD","SEK", 7.8629, SYSDATE()),
(29,"USD","SGD", 1.3136, SYSDATE()),
(30,"USD","THB", 31.4, SYSDATE()),
(31,"USD","TRY", 3.746, SYSDATE()),
(32,"USD","ZAR", 11.974, SYSDATE());

INSERT INTO MONEYCHANGE.USER (idUser, username, password, createDate, status) VALUES 
(1,"admin", "admin", SYSDATE(),1);

        