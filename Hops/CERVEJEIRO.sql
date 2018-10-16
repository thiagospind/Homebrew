-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.96-community-nt-log


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
-- Temporary table structure for view `lupulo_oleo_ext`
--
DROP TABLE IF EXISTS `lupulo_oleo_ext`;
DROP VIEW IF EXISTS `lupulo_oleo_ext`;
CREATE TABLE `lupulo_oleo_ext` (
  `idLupOleo` int(10) unsigned,
  `idLup` int(10) unsigned,
  `idOleo` int(10) unsigned,
  `quantOleo` decimal(10,2),
  `Myrcene` decimal(10,2),
  `Humulene` decimal(10,2),
  `B-Pinene` decimal(10,2),
  `Caryophyllene` decimal(10,2),
  `Farnesene` decimal(10,2),
  `Geraniol` decimal(10,2),
  `Linalool` decimal(10,2)
);

--
-- Temporary table structure for view `lupulo_oleo_ext_pivot`
--
DROP TABLE IF EXISTS `lupulo_oleo_ext_pivot`;
DROP VIEW IF EXISTS `lupulo_oleo_ext_pivot`;
CREATE TABLE `lupulo_oleo_ext_pivot` (
  `idlup` int(10) unsigned,
  `Myrcene` decimal(32,2),
  `Humulene` decimal(32,2),
  `B-Pinene` decimal(32,2),
  `Caryophyllene` decimal(32,2),
  `Farnesene` decimal(32,2),
  `Geraniol` decimal(32,2),
  `Linalool` decimal(32,2),
  `Outros` decimal(39,2)
);

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lupulo`
--

/*!40000 ALTER TABLE `lupulo` DISABLE KEYS */;
INSERT INTO `lupulo` (`idLup`,`nomeLup`,`paisLup`,`tipoLup`,`AALup`,`safraLup`,`BALup`,`estilosLup`,`perfilAromaLup`) VALUES 
 (1,'Citra','EUA','Amargor e Aroma','15.00',NULL,'4.00','India Pale Ale, Ales Americanas, Amber','Cítrico, toranja, limão, frutas tropicais, harsh'),
 (2,'Centennial','EUA','Amargor e Aroma','10.00',NULL,'4.00','Extra Special Bitter, Barley Wine, Imperial Stout, India Pale Ale, Pale Ale','Terroso e floral com um elemento cítrico'),
 (3,'Amarillo','EUA','Aroma','9.50',NULL,'6.50','American Pale Ale, India Pale Ale, American Wheat, Bitter, Wheat Beer, Red Ale, ESB','Laranja e cítrico'),
 (4,'Azacca','EUA','Amargor e Aroma','15.00',NULL,'5.00','India Pale Ale','Aromas de frutas tropicais e cítrico. Notas de manga, abacaxi, tangerina e pinho.'),
 (5,'Bravo','EUA','Amargor','15.50',NULL,'4.00','India Pale Ale, American Pale Ale, Extra Special Bitter','Picante, terroso e levemente floral');
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

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
 (21,3,7,'0.61'),
 (22,1,8,'0.11'),
 (23,1,9,'0.89'),
 (24,1,10,'0.23'),
 (25,1,11,'0.86'),
 (26,1,12,'0.41'),
 (27,1,13,'0.44'),
 (28,1,14,'0.63');
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `oleo`
--

/*!40000 ALTER TABLE `oleo` DISABLE KEYS */;
INSERT INTO `oleo` (`idOleo`,`nomeOleo`,`caracteristicaOleo`) VALUES 
 (1,'Myrcene','Resina, pinho, herbal, picante, cítrico e floral.'),
 (2,'Humulene','Floral, herbal e condimentado.'),
 (3,'B_Pinene','Picante, Pinho'),
 (4,'Caryophyllene','Madeira'),
 (5,'Farnesene','Floral'),
 (6,'Geraniol','Floral, doce, rosa'),
 (7,'Linalool','Floral, laranja'),
 (8,'A_Pinene','A'),
 (9,'II_MethylButyl','A'),
 (10,'Limonene','A'),
 (11,'Citral','A'),
 (12,'Geranyl_Acet1','A'),
 (13,'Geranyl_Acet2','A'),
 (14,'Citronellol','A'),
 (15,'Nerol',' '),
 (16,'Geraniol',' ');
/*!40000 ALTER TABLE `oleo` ENABLE KEYS */;


--
-- Definition of table `tbproj_cenario`
--

DROP TABLE IF EXISTS `tbproj_cenario`;
CREATE TABLE `tbproj_cenario` (
  `projCenProj_Id` int(11) default NULL,
  `projCenNome` varchar(20) default NULL,
  `valor` float(4,2) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbproj_cenario`
--

/*!40000 ALTER TABLE `tbproj_cenario` DISABLE KEYS */;
INSERT INTO `tbproj_cenario` (`projCenProj_Id`,`projCenNome`,`valor`) VALUES 
 (1,'Cenário I',1.00),
 (2,'Cenário II',2.00),
 (3,'Cenário III',2.40),
 (4,'Cenário III',5.00);
/*!40000 ALTER TABLE `tbproj_cenario` ENABLE KEYS */;


--
-- Definition of procedure `SP_LUPOLEO`
--

DROP PROCEDURE IF EXISTS `SP_LUPOLEO`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_LUPOLEO`()
BEGIN
  DECLARE qsql1 varchar(10000);
  -- SET @sql = NULL;
  SELECT
    GROUP_CONCAT(DISTINCT CONCAT('max(case when nomeOleo = "',nomeOleo,'" then quantOleo else 0 end) AS \'',nomeOleo, '\''
      )
    ) INTO qsql1

  from lupulo_oleo LO
  inner join lupulo L on LO.idlup = L.idlup
  inner join oleo O on LO.idoleo = O.idoleo;

  SET qsql1 := CONCAT('SELECT LO.idLup, L.nomeLup, ', qsql1, '
                    from lupulo_oleo LO
                    inner join lupulo L on LO.idlup = L.idlup
                    inner join oleo O on LO.idoleo = O.idoleo
                    GROUP BY LO.idlup');

  SET @sql = qsql1;
  PREPARE stmt FROM @sql;
  EXECUTE stmt;
  DEALLOCATE PREPARE stmt;
  -- select qsql1;
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of view `lupulo_oleo_ext`
--

DROP TABLE IF EXISTS `lupulo_oleo_ext`;
DROP VIEW IF EXISTS `lupulo_oleo_ext`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `lupulo_oleo_ext` AS (select `lo`.`idLupOleo` AS `idLupOleo`,`lo`.`idLup` AS `idLup`,`lo`.`idOleo` AS `idOleo`,`lo`.`quantOleo` AS `quantOleo`,(case when (`lo`.`idOleo` = 1) then `lo`.`quantOleo` end) AS `Myrcene`,(case when (`lo`.`idOleo` = 2) then `lo`.`quantOleo` end) AS `Humulene`,(case when (`lo`.`idOleo` = 3) then `lo`.`quantOleo` end) AS `B-Pinene`,(case when (`lo`.`idOleo` = 4) then `lo`.`quantOleo` end) AS `Caryophyllene`,(case when (`lo`.`idOleo` = 5) then `lo`.`quantOleo` end) AS `Farnesene`,(case when (`lo`.`idOleo` = 6) then `lo`.`quantOleo` end) AS `Geraniol`,(case when (`lo`.`idOleo` = 7) then `lo`.`quantOleo` end) AS `Linalool` from `lupulo_oleo` `lo`);

--
-- Definition of view `lupulo_oleo_ext_pivot`
--

DROP TABLE IF EXISTS `lupulo_oleo_ext_pivot`;
DROP VIEW IF EXISTS `lupulo_oleo_ext_pivot`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `lupulo_oleo_ext_pivot` AS (select `lupulo_oleo_ext`.`idLup` AS `idlup`,coalesce(sum(`lupulo_oleo_ext`.`Myrcene`),0) AS `Myrcene`,coalesce(sum(`lupulo_oleo_ext`.`Humulene`),0) AS `Humulene`,coalesce(sum(`lupulo_oleo_ext`.`B-Pinene`),0) AS `B-Pinene`,coalesce(sum(`lupulo_oleo_ext`.`Caryophyllene`),0) AS `Caryophyllene`,coalesce(sum(`lupulo_oleo_ext`.`Farnesene`),0) AS `Farnesene`,coalesce(sum(`lupulo_oleo_ext`.`Geraniol`),0) AS `Geraniol`,coalesce(sum(`lupulo_oleo_ext`.`Linalool`),0) AS `Linalool`,(((((((100 - sum(`lupulo_oleo_ext`.`Myrcene`)) - sum(`lupulo_oleo_ext`.`Humulene`)) - sum(`lupulo_oleo_ext`.`B-Pinene`)) - sum(`lupulo_oleo_ext`.`Caryophyllene`)) - sum(`lupulo_oleo_ext`.`Farnesene`)) - sum(`lupulo_oleo_ext`.`Geraniol`)) - sum(`lupulo_oleo_ext`.`Linalool`)) AS `Outros` from `lupulo_oleo_ext` group by `lupulo_oleo_ext`.`idLup`);



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
