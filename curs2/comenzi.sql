CREATE SCHEMA `universitate2023` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE `universitate2023`.`utilizatori` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nume` VARCHAR(45) NOT NULL,
  `prenume` VARCHAR(45) NOT NULL,
  `email` VARCHAR(145) NULL,
  `telefon` CHAR(10) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

-- magazin aplicatia 1
CREATE SCHEMA `magazin2023` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE `magazin2023`.`produse` (
  `idproduse` INT NOT NULL AUTO_INCREMENT,
  `nume` VARCHAR(45) NOT NULL,
  `cantitate` INT NOT NULL,
  `idfirma` INT NOT NULL,
  `firma` VARCHAR(45) NOT NULL,
  `adresafirma` VARCHAR(45) NOT NULL,
  `modelp` VARCHAR(45) NOT NULL,
  `stocp` VARCHAR(45) NOT NULL,
  `pret` DECIMAL(7,2) NOT NULL,
  `categoriep` VARCHAR(45) NOT NULL,
  `descrierep` TINYTEXT NOT NULL,
  `data_addp` DATE NOT NULL,
  PRIMARY KEY (`idproduse`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

INSERT INTO `magazin2023`.`produse` (`idproduse`, `nume`, `cantitate`, `idfirma`, `firma`, `adresafirma`, `modelp`, `stocp`, `pret`, `categoriep`, `descrierep`) VALUES ('1', 'pix', '25', '1', 'BIC', 'Dreptatii 83', 'mecanic', '25', '17.9', 'recuzite', 'pix mecanic - mina de 0.7');

UPDATE `magazin2023`.`produse` SET `data_addp` = '2023.05.09' WHERE (`idproduse` = '1');
INSERT INTO `magazin2023`.`produse` (`idproduse`, `nume`, `cantitate`, `idfirma`, `firma`, `adresafirma`, `modelp`, `stocp`, `pret`, `categoriep`, `descrierep`, `data_addp`) VALUES ('2', 'rigla', '20', '2', 'LOPSMARKA', 'Ion Campineanu 20', '20cm', '20', '15.99', 'recuzite', 'rigla transparenta de 20 cm', '2023.05.09');



-- aplicatia 2

CREATE SCHEMA `facultate2023` DEFAULT CHARACTER SET utf8 ;

CREATE DATABASE `facultate2023` /*!40100 DEFAULT CHARACTER SET utf8 */;
CREATE TABLE `studenti` (
  `idstudent` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nume` varchar(45) NOT NULL,
  `prenume` varchar(45) NOT NULL,
  `grupa` set('1','2','3','4') DEFAULT NULL,
  `email` varchar(145) DEFAULT NULL,
  `data_adaugare` varchar(45) DEFAULT NULL,
  `status` enum('admis','respins','neevaluat') DEFAULT 'neevaluat',
  PRIMARY KEY (`idstudent`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `nume_unic` (`nume`,`prenume`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



-- aplicatie 3 comenzi

SELECT COUNT(id_curs) AS nr_cursuri,an FROM cursuri GROUP BY an HAVING nr_cursuri<=5;

SELECT VERSION(),NOW();


SELECT nume,prenume FROM student;
SELECT titlu_curs FROM cursuri;
SELECT COUNT(id) AS nr,an FROM student GROUP BY an;
SELECT SUM(bursa) FROM student WHERE an=1 AND bursa IS NOT NULL GROUP BY an;

SELECT SUM(bursa) AS total, an FROM student WHERE  bursa IS NOT NULL GROUP BY an;

UPDATE student set status='bursier' WHERE bursa IS NOT NULL;

SELECT CONCAT(nume,' ',prenume) AS full_name, an FROM universitate.student;