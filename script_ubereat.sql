-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Lun 19 Mars 2018 à 19:34
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `ubereat`
--

-- --------------------------------------------------------

--
-- Structure de la table `acceuil`
--

CREATE TABLE IF NOT EXISTS `acceuil` (
  `ID_ACCEUIL` int(4) NOT NULL AUTO_INCREMENT,
  `RUE_ACCEUIL` varchar(32) COLLATE utf8_bin NOT NULL,
  `VILLE_ACCEUIL` varchar(32) COLLATE utf8_bin NOT NULL,
  `NOM_RESPONSABLE` varchar(32) COLLATE utf8_bin NOT NULL,
  `NUM_TEL_ACCEUIL` varchar(32) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID_ACCEUIL`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=3 ;

--
-- Contenu de la table `acceuil`
--

INSERT INTO `acceuil` (`ID_ACCEUIL`, `RUE_ACCEUIL`, `VILLE_ACCEUIL`, `NOM_RESPONSABLE`, `NUM_TEL_ACCEUIL`) VALUES
(1, 'léon blum', 'clermont ferrand', 'yous', '1868716786');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE IF NOT EXISTS `client` (
  `ID_CLIENT` int(4) NOT NULL AUTO_INCREMENT,
  `NOM_CLIENT` varchar(32) COLLATE utf8_bin NOT NULL,
  `PRENOM_CLIENT` varchar(32) COLLATE utf8_bin NOT NULL,
  `ADMIN` tinyint(1) NOT NULL DEFAULT '0',
  `RUE_CLIENT` varchar(32) COLLATE utf8_bin NOT NULL,
  `VILLE_CLIENT` varchar(32) COLLATE utf8_bin NOT NULL,
  `NUM_TEL_CLIENT` varchar(32) COLLATE utf8_bin NOT NULL,
  `USERNAME_CLIENT` varchar(32) COLLATE utf8_bin NOT NULL,
  `PASSWORD_CLIENT` varchar(32) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID_CLIENT`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=11 ;

--
-- Contenu de la table `client`
--

INSERT INTO `client` (`ID_CLIENT`, `NOM_CLIENT`, `PRENOM_CLIENT`, `ADMIN`, `RUE_CLIENT`, `VILLE_CLIENT`, `NUM_TEL_CLIENT`, `USERNAME_CLIENT`, `PASSWORD_CLIENT`) VALUES
(8, 'jandu', 'harry', 0, 'cezeaux', 'aubiere', '015445', 'hawk', '6923'),
(9, 'nekkaa', 'yousra', 1, 'hkgyjf', 'gjh', '787373573785', 'yous', '1507'),
(10, 'nekkaa', 'hamid', 0, 'guhg', 'guyg', '84564658', 'mido', '0425');

-- --------------------------------------------------------

--
-- Structure de la table `commander`
--

CREATE TABLE IF NOT EXISTS `commander` (
  `id_commande` int(4) NOT NULL AUTO_INCREMENT,
  `ID_RESTO` int(4) NOT NULL,
  `ID_CLIENT` int(4) NOT NULL,
  `Plat_commande` varchar(128) COLLATE utf8_bin NOT NULL,
  `prix_plat` double NOT NULL,
  PRIMARY KEY (`id_commande`),
  KEY `fk_resto` (`ID_RESTO`),
  KEY `fk_client` (`ID_CLIENT`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=21 ;

--
-- Contenu de la table `commander`
--

INSERT INTO `commander` (`id_commande`, `ID_RESTO`, `ID_CLIENT`, `Plat_commande`, `prix_plat`) VALUES
(14, 1, 8, 'kebab', 6),
(15, 1, 8, 'kebab', 6),
(16, 1, 8, 'kebab', 6),
(17, 3, 8, 'pizza', 10),
(18, 3, 8, 'apples', 4.15),
(19, 3, 8, 'pizza', 10),
(20, 3, 8, 'apples', 4.15);

-- --------------------------------------------------------

--
-- Structure de la table `livraison`
--

CREATE TABLE IF NOT EXISTS `livraison` (
  `ID_RESTO` int(4) NOT NULL,
  `ID_LIVREUR` int(4) NOT NULL,
  `ID_CLIENT` int(4) NOT NULL,
  `CODE_LIVRAISON` int(4) NOT NULL,
  PRIMARY KEY (`ID_RESTO`,`ID_LIVREUR`,`ID_CLIENT`,`CODE_LIVRAISON`),
  KEY `I_FK_LIVRAISON_CLIENT` (`ID_CLIENT`),
  KEY `I_FK_LIVRAISON_LIVREUR` (`ID_LIVREUR`),
  KEY `I_FK_LIVRAISON_RESTAURANT` (`ID_RESTO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `livreur`
--

CREATE TABLE IF NOT EXISTS `livreur` (
  `ID_LIVREUR` int(4) NOT NULL AUTO_INCREMENT,
  `ID_ACCEUIL` int(4) NOT NULL,
  `NOM_LIVREUR` varchar(32) COLLATE utf8_bin NOT NULL,
  `PRENOM_LIVREUR` varchar(32) COLLATE utf8_bin NOT NULL,
  `NUM_TEL_LIVREUR` varchar(32) COLLATE utf8_bin NOT NULL,
  `RUE_LIVREUR` varchar(32) COLLATE utf8_bin NOT NULL,
  `VILLE_LIVREUR` varchar(32) COLLATE utf8_bin NOT NULL,
  `USERNAME_LIVREUR` varchar(32) COLLATE utf8_bin NOT NULL,
  `PASSWORD_LIVREUR` varchar(128) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID_LIVREUR`),
  KEY `I_FK_LIVREUR_ACCEUIL` (`ID_ACCEUIL`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

--
-- Contenu de la table `livreur`
--

INSERT INTO `livreur` (`ID_LIVREUR`, `ID_ACCEUIL`, `NOM_LIVREUR`, `PRENOM_LIVREUR`, `NUM_TEL_LIVREUR`, `RUE_LIVREUR`, `VILLE_LIVREUR`, `USERNAME_LIVREUR`, `PASSWORD_LIVREUR`) VALUES
(1, 1, 'yous', 'youss', '878763', 'leon blum', 'clermont ferrand', 'yousra', '1234');

-- --------------------------------------------------------

--
-- Structure de la table `restaurant`
--

CREATE TABLE IF NOT EXISTS `restaurant` (
  `ID_RESTO` int(4) NOT NULL AUTO_INCREMENT,
  `NOM_RESTO` varchar(32) COLLATE utf8_bin NOT NULL,
  `RUE_RESTO` varchar(32) COLLATE utf8_bin NOT NULL,
  `VILLE_RESTO` varchar(32) COLLATE utf8_bin NOT NULL,
  `NUM_TEL_RESTO` varchar(32) COLLATE utf8_bin NOT NULL,
  `NOM_PROP` varchar(32) COLLATE utf8_bin NOT NULL,
  `PRENOM_PROP` varchar(32) COLLATE utf8_bin NOT NULL,
  `Menu` varchar(128) COLLATE utf8_bin NOT NULL,
  `Prix_Menu` double NOT NULL,
  PRIMARY KEY (`ID_RESTO`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=7 ;

--
-- Contenu de la table `restaurant`
--

INSERT INTO `restaurant` (`ID_RESTO`, `NOM_RESTO`, `RUE_RESTO`, `VILLE_RESTO`, `NUM_TEL_RESTO`, `NOM_PROP`, `PRENOM_PROP`, `Menu`, `Prix_Menu`) VALUES
(1, 'kanka', 'blaaaa', 'blouuuu', '6876817861', 'nekkaa', 'yousra', 'kebab', 6),
(3, 'rodisio', 'haaaa', 'houuu', '35534534', 'jandu ', 'harry', 'pizza', 10),
(5, 'kanka', 'blaaaa', 'blouuuu', '6876817861', 'nekkaa', 'yousra', 'panini', 5),
(6, 'rodisio', 'haaaa', 'houuu', '35534534', 'jandu', 'harry', 'apples', 4.15);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `commander`
--
ALTER TABLE `commander`
  ADD CONSTRAINT `commander_ibfk_2` FOREIGN KEY (`ID_CLIENT`) REFERENCES `client` (`ID_CLIENT`),
  ADD CONSTRAINT `commander_ibfk_1` FOREIGN KEY (`ID_RESTO`) REFERENCES `restaurant` (`ID_RESTO`);

--
-- Contraintes pour la table `livraison`
--
ALTER TABLE `livraison`
  ADD CONSTRAINT `livraison_ibfk_1` FOREIGN KEY (`ID_CLIENT`) REFERENCES `client` (`ID_CLIENT`),
  ADD CONSTRAINT `livraison_ibfk_2` FOREIGN KEY (`ID_LIVREUR`) REFERENCES `livreur` (`ID_LIVREUR`),
  ADD CONSTRAINT `livraison_ibfk_3` FOREIGN KEY (`ID_RESTO`) REFERENCES `restaurant` (`ID_RESTO`);

--
-- Contraintes pour la table `livreur`
--
ALTER TABLE `livreur`
  ADD CONSTRAINT `livreur_ibfk_1` FOREIGN KEY (`ID_ACCEUIL`) REFERENCES `acceuil` (`ID_ACCEUIL`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
