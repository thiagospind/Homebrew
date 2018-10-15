-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.96-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema cervejeiro
--

CREATE DATABASE IF NOT EXISTS cervejeiro;
USE cervejeiro;

--
-- Definition of table `lupulo`
--

DROP TABLE IF EXISTS `lupulo`;
CREATE TABLE `lupulo` (
  `idLup` int(10) unsigned NOT NULL auto_increment,
  `nomeLup` varchar(100) NOT NULL,
  `paisLup` varchar(50) default NULL,
  `tipoLup` varchar(45) default NULL,
  `AALup` decimal(10,2) NOT NULL COMMENT 'Alfa Acidos',
  `safraLup` int(10) unsigned default NULL,
  `BALup` decimal(10,2) default NULL COMMENT 'Beta Acidos',
  `estilosLup` text,
  `perfilAromaLup` text,
  PRIMARY KEY  (`idLup`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lupulo`
--

/*!40000 ALTER TABLE `lupulo` DISABLE KEYS */;
INSERT INTO `lupulo` (`idLup`,`nomeLup`,`paisLup`,`tipoLup`,`AALup`,`safraLup`,`BALup`,`estilosLup`,`perfilAromaLup`) VALUES 
 (1,'Citra','EUA','Amargor e Aroma','15.00',NULL,'4.00','India Pale Ale, Ales Americanas, Amber','Cítrico, toranja, limão, frutas tropicais, harsh'),
 (2,'Centennial','EUA','Amargor e Aroma','10.00',NULL,'4.00','Extra Special Bitter, Barley Wine, Imperial Stout, India Pale Ale, Pale Ale','Terroso e floral com um elemento cítrico'),
 (3,'Amarillo','EUA','Aroma','9.50',NULL,'6.50','American Pale Ale, India Pale Ale, American Wheat, Bitter, Wheat Beer, Red Ale, ESB','Laranja e cítrico'),
 (4,'Azacca','EUA','Amargor e Aroma','15.00',NULL,'5.00','India Pale Ale','Aromas de frutas tropicais e cítrico. Notas de manga, abacaxi, tangerina e pinho.');
/*!40000 ALTER TABLE `lupulo` ENABLE KEYS */;


--
-- Definition of table `lupulo_oleo`
--

DROP TABLE IF EXISTS `lupulo_oleo`;
CREATE TABLE `lupulo_oleo` (
  `idLupOleo` int(10) unsigned NOT NULL auto_increment,
  `idLup` int(10) unsigned NOT NULL,
  `idOleo` int(10) unsigned NOT NULL,
  `quantOleo` decimal(10,2) NOT NULL,
  PRIMARY KEY  (`idLupOleo`),
  KEY `FK_lupulo_oleo_idLup` (`idLup`),
  KEY `FK_lupulo_oleo_idOleo` (`idOleo`),
  CONSTRAINT `FK_lupulo_oleo_idLup` FOREIGN KEY (`idLup`) REFERENCES `lupulo` (`idLup`),
  CONSTRAINT `FK_lupulo_oleo_idOleo` FOREIGN KEY (`idOleo`) REFERENCES `oleo` (`idOleo`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lupulo_oleo`
--

/*!40000 ALTER TABLE `lupulo_oleo` DISABLE KEYS */;
INSERT INTO `lupulo_oleo` (`idLupOleo`,`idLup`,`idOleo`,`quantOleo`) VALUES 
 (1,1,3,'0.88'),
 (2,1,2,'8.73'),
 (3,1,4,'5.58'),
 (4,1,5,'0.15'),
 (5,1,6,'0.30'),
 (6,1,7,'0.77'),
 (7,1,1,'66.53'),
 (8,2,1,'65.37'),
 (9,2,2,'10.68'),
 (10,2,3,'1.09'),
 (11,2,4,'5.23'),
 (12,2,5,'0.20'),
 (13,2,6,'1.14'),
 (14,2,7,'0.67'),
 (15,3,1,'52.14'),
 (16,3,2,'17.90'),
 (17,3,3,'0.79'),
 (18,3,4,'6.53'),
 (19,3,5,'6.39'),
 (20,3,6,'0.16'),
 (21,3,7,'0.61');
/*!40000 ALTER TABLE `lupulo_oleo` ENABLE KEYS */;


--
-- Definition of table `oleo`
--

DROP TABLE IF EXISTS `oleo`;
CREATE TABLE `oleo` (
  `idOleo` int(10) unsigned NOT NULL auto_increment,
  `nomeOleo` varchar(70) NOT NULL,
  `caracteristicaOleo` text NOT NULL,
  PRIMARY KEY  (`idOleo`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `oleo`
--

/*!40000 ALTER TABLE `oleo` DISABLE KEYS */;
INSERT INTO `oleo` (`idOleo`,`nomeOleo`,`caracteristicaOleo`) VALUES 
 (1,'Myrcene','Resina, pinho, herbal, picante, cítrico e floral.'),
 (2,'Humulene','Floral, herbal e condimentado.'),
 (3,'B-Pinene','Picante, Pinho'),
 (4,'Caryophyllene','Madeira'),
 (5,'Farnesene','Floral'),
 (6,'Geraniol','Floral, doce, rosa'),
 (7,'Linalool','Floral, laranja');
/*!40000 ALTER TABLE `oleo` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
