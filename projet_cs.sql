-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 28 mars 2024 à 08:32
-- Version du serveur : 8.0.31
-- Version de PHP : 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `projet_cs`
--

-- --------------------------------------------------------

--
-- Structure de la table `chercheur`
--

DROP TABLE IF EXISTS `chercheur`;
CREATE TABLE IF NOT EXISTS `chercheur` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf16_bin NOT NULL,
  `prenom` varchar(255) COLLATE utf16_bin NOT NULL,
  `specialite_recherche` varchar(255) COLLATE utf16_bin NOT NULL,
  `annee_these` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf16 ;

-- --------------------------------------------------------

--
-- Structure de la table `intervient`
--

DROP TABLE IF EXISTS `intervient`;
CREATE TABLE IF NOT EXISTS `intervient` (
  `ticketId` int NOT NULL,
  `technicienId` int NOT NULL,
  PRIMARY KEY (`ticketId`,`technicienId`),
  KEY `id_1` (`technicienId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf16 ;

-- --------------------------------------------------------

--
-- Structure de la table `materiels`
--

DROP TABLE IF EXISTS `materiels`;
CREATE TABLE IF NOT EXISTS `materiels` (
  `id` int NOT NULL AUTO_INCREMENT,
  `processeur` varchar(50) COLLATE utf16_bin DEFAULT NULL,
  `memoire` varchar(50) COLLATE utf16_bin DEFAULT NULL,
  `disque` varchar(50) COLLATE utf16_bin DEFAULT NULL,
  `logicielsInstalles` mediumtext COLLATE utf16_bin,
  `dateAchat` date DEFAULT NULL,
  `garantie` varchar(50) COLLATE utf16_bin DEFAULT NULL,
  `fournisseur` varchar(50) COLLATE utf16_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf16 ;

-- --------------------------------------------------------

--
-- Structure de la table `personnels`
--

DROP TABLE IF EXISTS `personnels`;
CREATE TABLE IF NOT EXISTS `personnels` (
  `matricule` varchar(50) COLLATE utf16_bin NOT NULL,
  `dateEmbauche` date DEFAULT NULL,
  `motDePasse` varchar(50) COLLATE utf16_bin DEFAULT NULL,
  `type` int DEFAULT NULL,
  `materielId` int NOT NULL,
  PRIMARY KEY (`matricule`),
  UNIQUE KEY `id` (`materielId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf16 ;

--
-- Déchargement des données de la table `personnels`
--

INSERT INTO `personnels` (`matricule`, `dateEmbauche`, `motDePasse`, `type`, `materielId`) VALUES
('FLST012', '2023-10-10', 'MotDePasseDeFou', 2, 12);

-- --------------------------------------------------------

--
-- Structure de la table `phasetechniciens`
--

DROP TABLE IF EXISTS `phasetechniciens`;
CREATE TABLE IF NOT EXISTS `phasetechniciens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dateDebut` date DEFAULT NULL,
  `dateFin` date DEFAULT NULL,
  `travailRealise` mediumtext COLLATE utf16_bin,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf16 ;

-- --------------------------------------------------------

--
-- Structure de la table `regions`
--

DROP TABLE IF EXISTS `regions`;
CREATE TABLE IF NOT EXISTS `regions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) COLLATE utf16_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf16 ;

-- --------------------------------------------------------

--
-- Structure de la table `techniciens`
--

DROP TABLE IF EXISTS `techniciens`;
CREATE TABLE IF NOT EXISTS `techniciens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `niveau` varchar(50) COLLATE utf16_bin DEFAULT NULL,
  `formation` varchar(50) COLLATE utf16_bin DEFAULT NULL,
  `competences` varchar(50) COLLATE utf16_bin DEFAULT NULL,
  `matricule` varchar(50) COLLATE utf16_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `matricule` (`matricule`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf16 ;

--
-- Déchargement des données de la table `techniciens`
--

INSERT INTO `techniciens` (`id`, `niveau`, `formation`, `competences`, `matricule`) VALUES
(1, 'nouveau niveau', 'nouvelle formation', 'tout', 'Matricule');

-- --------------------------------------------------------

--
-- Structure de la table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
CREATE TABLE IF NOT EXISTS `tickets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `objet` mediumtext COLLATE utf16_bin,
  `niveauUrgence` int DEFAULT NULL,
  `dateCreation` datetime DEFAULT NULL,
  `etatDemande` varchar(50) COLLATE utf16_bin DEFAULT NULL,
  `technicienId` int DEFAULT NULL,
  `materielId` int NOT NULL,
  `personnelMatricule` varchar(50) COLLATE utf16_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_1` (`technicienId`),
  KEY `id_2` (`materielId`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf16 ;

-- --------------------------------------------------------

--
-- Structure de la table `travaille`
--

DROP TABLE IF EXISTS `travaille`;
CREATE TABLE IF NOT EXISTS `travaille` (
  `matricule` varchar(50) COLLATE utf16_bin NOT NULL,
  `idRegion` int NOT NULL,
  PRIMARY KEY (`matricule`,`idRegion`),
  KEY `id` (`idRegion`)
) ENGINE=MyISAM DEFAULT CHARSET=utf16 ;

-- --------------------------------------------------------

--
-- Structure de la table `visiteurs`
--

DROP TABLE IF EXISTS `visiteurs`;
CREATE TABLE IF NOT EXISTS `visiteurs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `prime` varchar(50) COLLATE utf16_bin DEFAULT NULL,
  `avantages` varchar(50) COLLATE utf16_bin DEFAULT NULL,
  `budget` varchar(50) COLLATE utf16_bin DEFAULT NULL,
  `objectif` varchar(50) COLLATE utf16_bin DEFAULT NULL,
  `matricule` varchar(50) COLLATE utf16_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `matricule` (`matricule`)
) ENGINE=MyISAM DEFAULT CHARSET=utf16 ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
