-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 05, 2021 at 01:06 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jspbanque`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_depot` (IN `Somme` FLOAT, IN `Cpte` INT, IN `Type` INT, IN `Agent` INT)  NO SQL
BEGIN
DECLARE val1 float;
DECLARE val2 float;

SET val1 = func_solde(Cpte);
SET val2 = val1+Somme;

UPDATE t_compte SET Solde=val1+Somme WHERE CodeCompte=Cpte;

INSERT INTO t_mouvement(Montant, CodeCompte, CodeType, CodeAgent) 
VALUES (Somme,Cpte,Type,Agent);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_retrait` (IN `Somme` FLOAT, IN `Cpte` INT, IN `Type` INT, IN `Agent` INT)  NO SQL
BEGIN
DECLARE val1 float;
DECLARE val2 float;

SET val1 = func_solde(Cpte);
SET val2 = val1-Somme;

IF(Somme<val1) THEN

UPDATE t_compte SET Solde=val1-Somme WHERE CodeCompte=Cpte;

INSERT INTO t_mouvement(Montant, CodeCompte, CodeType, CodeAgent) 
VALUES (Somme,Cpte,Type,Agent);

END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_virement` (IN `Somme` FLOAT, IN `CpteDebuteur` INT, IN `CpteCrediteur` INT, IN `Agent` INT, IN `Type` INT)  NO SQL
BEGIN
DECLARE val1 float;
DECLARE val2 float;
DECLARE val3 float;
DECLARE val4 float;

SET val1 = func_solde(CpteDebuteur);
SET val2 = val1+Somme;
SET val3 = func_solde(CpteCrediteur);
SET val4 = val3-Somme;

IF(Somme<val3) THEN

UPDATE t_compte SET Solde=val2 WHERE CodeCompte=CpteDebuteur;
UPDATE t_compte SET Solde=val4 WHERE CodeCompte=CpteCrediteur;

INSERT INTO t_mouvement(Montant, CodeCompte, CodeType, CodeAgent, CompteCrediteur, CompteDebiteur) 
VALUES (Somme,CpteCrediteur,Type,Agent,CpteCrediteur,CpteCrediteur);

END IF;
END$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `func_solde` (`cpte` INT) RETURNS FLOAT NO SQL
BEGIN
DECLARE valeur double;
SET valeur = (SELECT Solde FROM t_compte WHERE CodeCompte=cpte ORDER BY CodeCompte DESC LIMIT 0,1);
RETURN valeur;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `t_agent`
--

CREATE TABLE `t_agent` (
  `CodeAgent` int(11) NOT NULL,
  `NomAgent` varchar(50) NOT NULL,
  `PostnomAgent` varchar(50) NOT NULL,
  `PrenomAgent` varchar(50) NOT NULL,
  `TelephoneAgent` varchar(15) NOT NULL,
  `AdresseAgent` varchar(100) NOT NULL,
  `SalaireMensuel` float NOT NULL,
  `Username` varchar(20) NOT NULL,
  `Password` varchar(200) NOT NULL,
  `CodeFonction` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_agent`
--

INSERT INTO `t_agent` (`CodeAgent`, `NomAgent`, `PostnomAgent`, `PrenomAgent`, `TelephoneAgent`, `AdresseAgent`, `SalaireMensuel`, `Username`, `Password`, `CodeFonction`) VALUES
(1, 'Baraka', 'Bigega', 'Espoir', '0977553723', 'Goma', 3000, '', '', 1),
(2, 'KAVIRA', 'MALEKANI', 'SHEKINAH', '09988776654', 'GOMA', 0, '', '', 2),
(4, 'SIWA', 'MUMBERE', 'CARIN', '0988776655', 'GOMA', 500, 'siwa1', 'admin', 2),
(5, 'Nicole', 'Mulasi', 'Nicky', '098833322', 'Goma', 0, '', '', 2),
(6, 'Akilimali', 'Baraka', 'Michael', '09883344', 'Goma', 1000, 'espoir', 'admin', 3),
(7, 'Shabani', 'Patrona', 'Roger', '0988776655', 'Goma', 1000, 'roger', 'admin', 2),
(8, 'Gaetan', 'Bomongoyo', 'Gaetan', '0977665544', 'Goma', 300, '', '', 3),
(9, 'Hakizimana', 'Claude', 'Bienfait', '0977665544', 'Goma', 500, 'hk', '1234', 3),
(10, 'Wivine', 'Mulasi', 'Wiva', '0988776655', 'Goma', 1000, 'wivine', 'ADMIN', 2);

-- --------------------------------------------------------

--
-- Table structure for table `t_annee`
--

CREATE TABLE `t_annee` (
  `CodeAnnee` int(11) NOT NULL,
  `Annee` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_annee`
--

INSERT INTO `t_annee` (`CodeAnnee`, `Annee`) VALUES
(1, 2021),
(2, 2022),
(3, 2023),
(4, 2024),
(5, 2025),
(6, 2026),
(7, 2027);

-- --------------------------------------------------------

--
-- Table structure for table `t_categorie_compte`
--

CREATE TABLE `t_categorie_compte` (
  `CodeCategorie` int(11) NOT NULL,
  `Categorie` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_categorie_compte`
--

INSERT INTO `t_categorie_compte` (`CodeCategorie`, `Categorie`) VALUES
(1, 'COMPTE COURANT'),
(2, 'COMPTE BLOQUE');

-- --------------------------------------------------------

--
-- Table structure for table `t_categorie_user`
--

CREATE TABLE `t_categorie_user` (
  `CodeCategorie` int(11) NOT NULL,
  `Categorie` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_categorie_user`
--

INSERT INTO `t_categorie_user` (`CodeCategorie`, `Categorie`) VALUES
(1, 'Administratif'),
(2, 'Client');

-- --------------------------------------------------------

--
-- Table structure for table `t_client`
--

CREATE TABLE `t_client` (
  `CodeClient` int(11) NOT NULL,
  `NomClient` varchar(50) NOT NULL,
  `PostnomClient` varchar(50) NOT NULL,
  `PrenomClient` varchar(50) NOT NULL,
  `SexeClient` varchar(10) NOT NULL,
  `DateNaissance` date NOT NULL,
  `LieuNaissance` varchar(100) NOT NULL,
  `AdresseClient` varchar(200) NOT NULL,
  `TelephoneClient` varchar(15) NOT NULL,
  `MailClient` varchar(50) NOT NULL,
  `ProfessionClient` varchar(100) NOT NULL,
  `AvoirClient` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_client`
--

INSERT INTO `t_client` (`CodeClient`, `NomClient`, `PostnomClient`, `PrenomClient`, `SexeClient`, `DateNaissance`, `LieuNaissance`, `AdresseClient`, `TelephoneClient`, `MailClient`, `ProfessionClient`, `AvoirClient`) VALUES
(4, 'Mugisho', 'Bashonga', 'Jeremie', 'M', '2021-10-01', 'Goma', 'Goma', '0977553723', 'jeremie@gmail.com', 'Enseignant', 3000),
(5, 'Mupenda', 'Paul', 'Paul', 'M', '1999-09-14', 'Goma', 'Goma', '0977553723', 'paul@gmail.com', 'Agent de l\'etat', 5000),
(6, 'Akilimali', 'Baraka', 'Michael', 'M', '2003-09-14', 'Goma', 'Goma', '0977665544', 'mick@gmail.com', 'Chauffeur', 2000),
(7, 'Baraka', 'Bigega', 'Franc', 'M', '2010-10-13', 'Goma', 'Goma', '0977665544', 'franck@gmail.com', 'Agent', 9999),
(8, 'Elizabeth', 'Kahindo', 'Hadassa', 'F', '2008-09-15', 'Goma', 'Goma', '0977553723', 'elize@gmail.com', 'Manager', 50000),
(11, 'Kakule', 'Wasyalya', 'Heritier', 'M', '2000-09-15', 'Goma', 'Goma', '09988333', 'kakule@gmail.com', 'Enseignant', 7000),
(12, 'Baraka', 'Mutabazi', 'Charles', 'M', '1990-09-14', 'Goma', 'Goma', '0977665544', 'charles@gmail.com', 'Chauffeur', 7000),
(13, 'Francois', 'Baraka', 'Bigega', 'M', '2021-10-13', 'Goma', 'Goma', '0977665544', 'franck@gmail.com', 'Electronicien', 20000);

-- --------------------------------------------------------

--
-- Table structure for table `t_compte`
--

CREATE TABLE `t_compte` (
  `CodeCompte` int(11) NOT NULL,
  `NumeroCompte` varchar(20) NOT NULL,
  `Created_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Solde` float NOT NULL,
  `CodeStatut` int(11) NOT NULL,
  `CodeCategorie` int(11) NOT NULL,
  `CodeClient` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_compte`
--

INSERT INTO `t_compte` (`CodeCompte`, `NumeroCompte`, `Created_on`, `Solde`, `CodeStatut`, `CodeCategorie`, `CodeClient`) VALUES
(38, 'COMPT53', '2021-09-27 14:53:34', 39, 1, 2, 4),
(39, 'COMPT47', '2021-09-28 20:17:29', 500, 1, 2, 4),
(42, 'COMPT16', '2021-09-28 11:43:57', 30, 1, 2, 6),
(43, 'COMPT33', '2021-09-28 17:31:20', 300, 1, 1, 8),
(44, 'COMPT54', '2021-09-27 15:11:42', 50, 1, 1, 4),
(45, 'COMPT09', '2021-09-28 20:21:49', 40, 1, 2, 4),
(46, 'COMPT14', '2021-10-05 08:51:28', 10, 1, 1, 5),
(47, 'COMPT03', '2021-09-29 13:23:20', 200, 1, 1, 7),
(48, 'COMPT13', '2021-09-28 20:24:51', 20, 1, 2, 7),
(49, 'COMPT09', '2021-09-28 17:28:43', 360, 1, 2, 6),
(50, 'COMPT19', '2021-10-04 15:11:57', 550554, 1, 1, 6),
(51, 'COMPT09', '2021-09-28 20:26:08', 30, 1, 1, 7),
(52, 'COMPT46', '2021-09-28 20:29:20', 1300, 1, 2, 8),
(53, 'COMPT33', '2021-10-05 08:52:03', 500, 1, 2, 5),
(54, 'COMPT07', '2021-09-29 07:38:24', 30, 1, 1, 6),
(55, 'COMPT48', '2021-09-29 11:00:48', 0, 1, 2, 6),
(56, 'COMPT38', '2021-09-29 12:52:47', 30, 1, 1, 12),
(57, 'COMPT43', '2021-09-29 13:23:20', 20, 1, 1, 7),
(58, 'COMPT59', '2021-10-04 19:26:41', 11000, 1, 1, 13),
(59, 'COMPT06', '2021-10-04 19:26:41', 1020, 1, 1, 13),
(60, 'COMPT08', '2021-10-04 20:13:08', 0, 1, 1, 7);

--
-- Triggers `t_compte`
--
DELIMITER $$
CREATE TRIGGER `before_create_compte` BEFORE INSERT ON `t_compte` FOR EACH ROW BEGIN
SET NEW.NumeroCompte=CONCAT(UCASE("COMPT"), SUBSTRING(CAST(NOW() AS CHAR),18,2));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `t_fonction`
--

CREATE TABLE `t_fonction` (
  `CodeFonction` int(11) NOT NULL,
  `Fonction` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_fonction`
--

INSERT INTO `t_fonction` (`CodeFonction`, `Fonction`) VALUES
(1, 'Recepteur'),
(2, 'Comptable'),
(3, 'Chef du personnel');

-- --------------------------------------------------------

--
-- Table structure for table `t_mois`
--

CREATE TABLE `t_mois` (
  `CodeMois` int(11) NOT NULL,
  `Mois` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_mois`
--

INSERT INTO `t_mois` (`CodeMois`, `Mois`) VALUES
(1, 'Janvier'),
(2, 'Fevrier'),
(3, 'Mars'),
(4, 'Avril'),
(5, 'Mai'),
(6, 'Juin'),
(7, 'Juillet'),
(8, 'Aout'),
(9, 'Septembre'),
(10, 'Octobre'),
(11, 'Novembre'),
(12, 'Decembre');

-- --------------------------------------------------------

--
-- Table structure for table `t_mouvement`
--

CREATE TABLE `t_mouvement` (
  `CodeMouvement` int(11) NOT NULL,
  `Date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Montant` float NOT NULL,
  `CompteCrediteur` int(11) DEFAULT NULL,
  `CompteDebiteur` int(11) DEFAULT NULL,
  `CodeCompte` int(11) NOT NULL,
  `CodeType` int(11) NOT NULL,
  `CodeAgent` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_mouvement`
--

INSERT INTO `t_mouvement` (`CodeMouvement`, `Date`, `Montant`, `CompteCrediteur`, `CompteDebiteur`, `CodeCompte`, `CodeType`, `CodeAgent`) VALUES
(23, '2021-09-27 14:52:56', 35, NULL, NULL, 38, 1, 1),
(24, '2021-09-27 14:53:34', 4, NULL, NULL, 38, 1, 1),
(25, '2021-09-27 15:11:42', 50, NULL, NULL, 44, 1, 1),
(26, '2021-09-28 09:26:28', 20, NULL, NULL, 47, 1, 1),
(27, '2021-09-28 09:28:58', 1, NULL, NULL, 47, 1, 1),
(28, '2021-09-28 11:43:57', 30, NULL, NULL, 42, 1, 1),
(29, '2021-09-28 11:58:48', 5, NULL, NULL, 39, 1, 1),
(30, '2021-09-28 11:59:20', 5, NULL, NULL, 39, 1, 1),
(31, '2021-09-28 11:59:36', 500, NULL, NULL, 39, 1, 1),
(32, '2021-09-28 12:22:02', 100, NULL, NULL, 47, 1, 1),
(33, '2021-09-28 12:22:22', 50, NULL, NULL, 47, 2, 1),
(34, '2021-09-28 12:22:35', 50, NULL, NULL, 47, 1, 1),
(35, '2021-09-28 12:22:44', 1, NULL, NULL, 47, 2, 1),
(36, '2021-09-28 12:23:27', 20, NULL, NULL, 47, 2, 1),
(37, '2021-09-28 17:26:44', 20, NULL, NULL, 49, 1, 1),
(38, '2021-09-28 17:27:14', 1000, NULL, NULL, 49, 1, 1),
(39, '2021-09-28 17:27:25', 300, NULL, NULL, 49, 1, 1),
(40, '2021-09-28 17:27:52', 1000, NULL, NULL, 49, 2, 1),
(41, '2021-09-28 17:28:07', 500, NULL, NULL, 49, 1, 1),
(42, '2021-09-28 17:28:25', 300, NULL, NULL, 49, 1, 1),
(43, '2021-09-28 17:28:34', 800, NULL, NULL, 49, 2, 1),
(44, '2021-09-28 17:28:43', 40, NULL, NULL, 49, 1, 1),
(45, '2021-09-28 17:31:20', 300, NULL, NULL, 43, 1, 1),
(46, '2021-09-29 07:05:28', 40, 39, 39, 39, 3, 1),
(47, '2021-09-29 07:05:29', 20, 47, 48, 47, 3, 1),
(48, '2021-09-29 07:05:29', 30, 47, 51, 47, 3, 1),
(49, '2021-09-28 20:27:59', 1000, NULL, NULL, 52, 1, 1),
(50, '2021-09-28 20:28:24', 400, NULL, NULL, 52, 1, 1),
(51, '2021-09-28 20:28:39', 100, NULL, NULL, 52, 2, 1),
(52, '2021-09-28 20:28:51', 50, NULL, NULL, 52, 1, 1),
(53, '2021-09-29 07:05:29', 50, 52, 47, 52, 3, 1),
(54, '2021-09-29 07:38:25', 30, NULL, NULL, 54, 1, 1),
(55, '2021-09-29 12:52:47', 30, NULL, NULL, 56, 1, 1),
(56, '2021-09-29 13:22:11', 20, NULL, NULL, 57, 1, 1),
(57, '2021-09-29 13:23:07', 100, NULL, NULL, 57, 1, 1),
(58, '2021-09-29 13:23:20', 100, 57, 57, 57, 3, 1),
(59, '2021-10-04 15:11:11', 2, NULL, NULL, 50, 1, 1),
(60, '2021-10-04 15:11:57', 550552, NULL, NULL, 50, 1, 1),
(61, '2021-10-04 19:24:31', 10, NULL, NULL, 59, 1, 1),
(62, '2021-10-04 19:24:49', 10, NULL, NULL, 59, 1, 1),
(63, '2021-10-04 19:25:21', 10000, NULL, NULL, 58, 1, 1),
(64, '2021-10-04 19:25:41', 5000, NULL, NULL, 58, 1, 1),
(65, '2021-10-04 19:25:54', 3000, NULL, NULL, 58, 2, 1),
(66, '2021-10-04 19:26:41', 1000, 58, 58, 58, 3, 1),
(67, '2021-10-05 08:48:25', 20, NULL, NULL, 53, 1, 1),
(68, '2021-10-05 08:48:46', 1000, NULL, NULL, 53, 1, 1),
(69, '2021-10-05 08:48:57', 500, NULL, NULL, 53, 2, 1),
(70, '2021-10-05 08:51:28', 20, 46, 46, 46, 3, 1),
(71, '2021-10-05 08:52:03', -20, NULL, NULL, 53, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `t_paiement_dette`
--

CREATE TABLE `t_paiement_dette` (
  `CodePaiement` int(11) NOT NULL,
  `Montant` float NOT NULL,
  `Date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `CodeClient` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `t_salaire`
--

CREATE TABLE `t_salaire` (
  `CodeSalaire` int(11) NOT NULL,
  `Montant` float NOT NULL,
  `CodeMois` int(11) NOT NULL,
  `CodeAnnee` int(11) NOT NULL,
  `CodeAgent` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_salaire`
--

INSERT INTO `t_salaire` (`CodeSalaire`, `Montant`, `CodeMois`, `CodeAnnee`, `CodeAgent`) VALUES
(1, 1000, 5, 1, 6),
(2, 998, 6, 1, 6),
(3, 900, 7, 1, 6),
(4, 3000, 9, 1, 1),
(5, 3000, 8, 1, 1),
(6, 3000, 7, 1, 1),
(7, 3000, 6, 1, 1),
(8, 3000, 5, 1, 1),
(9, 3000, 4, 1, 1),
(10, 1000, 2, 1, 7),
(11, 1000, 3, 1, 7),
(12, 1000, 3, 1, 7),
(13, 400, 8, 1, 9),
(14, 1000, 9, 1, 10),
(15, 1000, 10, 1, 10);

-- --------------------------------------------------------

--
-- Table structure for table `t_statut_compte`
--

CREATE TABLE `t_statut_compte` (
  `CodeStatut` int(11) NOT NULL,
  `Statut` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_statut_compte`
--

INSERT INTO `t_statut_compte` (`CodeStatut`, `Statut`) VALUES
(1, 'Non active'),
(2, 'Active'),
(3, 'Bloque');

-- --------------------------------------------------------

--
-- Table structure for table `t_type_mouvement`
--

CREATE TABLE `t_type_mouvement` (
  `CodeType` int(11) NOT NULL,
  `Type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_type_mouvement`
--

INSERT INTO `t_type_mouvement` (`CodeType`, `Type`) VALUES
(1, 'Depot'),
(2, 'Retrait'),
(3, 'Virement');

-- --------------------------------------------------------

--
-- Table structure for table `t_user`
--

CREATE TABLE `t_user` (
  `CodeUser` int(11) NOT NULL,
  `Username` varchar(20) NOT NULL,
  `Password` varchar(200) NOT NULL,
  `Created_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `CodeAgent` int(11) DEFAULT NULL,
  `CodeClient` int(11) NOT NULL,
  `CodeCategorie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_user`
--

INSERT INTO `t_user` (`CodeUser`, `Username`, `Password`, `Created_on`, `CodeAgent`, `CodeClient`, `CodeCategorie`) VALUES
(1, 'espoir', 'admin', '2021-09-22 07:06:23', 1, 0, 1),
(2, 'nicole', 'admin', '2021-09-22 07:20:15', 5, 0, 2),
(3, 'akili', 'admin', '2021-09-22 07:06:24', 6, 0, 1),
(4, 'siwa', 'admin', '2021-09-22 07:06:24', 4, 0, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `t_agent`
--
ALTER TABLE `t_agent`
  ADD PRIMARY KEY (`CodeAgent`),
  ADD KEY `fk_agent_fonction` (`CodeFonction`);

--
-- Indexes for table `t_annee`
--
ALTER TABLE `t_annee`
  ADD PRIMARY KEY (`CodeAnnee`);

--
-- Indexes for table `t_categorie_compte`
--
ALTER TABLE `t_categorie_compte`
  ADD PRIMARY KEY (`CodeCategorie`);

--
-- Indexes for table `t_categorie_user`
--
ALTER TABLE `t_categorie_user`
  ADD PRIMARY KEY (`CodeCategorie`);

--
-- Indexes for table `t_client`
--
ALTER TABLE `t_client`
  ADD PRIMARY KEY (`CodeClient`);

--
-- Indexes for table `t_compte`
--
ALTER TABLE `t_compte`
  ADD PRIMARY KEY (`CodeCompte`),
  ADD KEY `fk_compte_client` (`CodeClient`),
  ADD KEY `fk_compte_statut` (`CodeStatut`),
  ADD KEY `fk_compte_categorie` (`CodeCategorie`);

--
-- Indexes for table `t_fonction`
--
ALTER TABLE `t_fonction`
  ADD PRIMARY KEY (`CodeFonction`);

--
-- Indexes for table `t_mois`
--
ALTER TABLE `t_mois`
  ADD PRIMARY KEY (`CodeMois`);

--
-- Indexes for table `t_mouvement`
--
ALTER TABLE `t_mouvement`
  ADD PRIMARY KEY (`CodeMouvement`),
  ADD KEY `fk_mouvement_compte` (`CodeCompte`),
  ADD KEY `fk_mouvement_type` (`CodeType`),
  ADD KEY `fk_mouvement_agent` (`CodeAgent`);

--
-- Indexes for table `t_salaire`
--
ALTER TABLE `t_salaire`
  ADD PRIMARY KEY (`CodeSalaire`);

--
-- Indexes for table `t_statut_compte`
--
ALTER TABLE `t_statut_compte`
  ADD PRIMARY KEY (`CodeStatut`);

--
-- Indexes for table `t_type_mouvement`
--
ALTER TABLE `t_type_mouvement`
  ADD PRIMARY KEY (`CodeType`);

--
-- Indexes for table `t_user`
--
ALTER TABLE `t_user`
  ADD PRIMARY KEY (`CodeUser`),
  ADD KEY `fk_user_agent` (`CodeAgent`),
  ADD KEY `fk_user_categorie` (`CodeCategorie`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `t_agent`
--
ALTER TABLE `t_agent`
  MODIFY `CodeAgent` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `t_annee`
--
ALTER TABLE `t_annee`
  MODIFY `CodeAnnee` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `t_categorie_compte`
--
ALTER TABLE `t_categorie_compte`
  MODIFY `CodeCategorie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `t_categorie_user`
--
ALTER TABLE `t_categorie_user`
  MODIFY `CodeCategorie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `t_client`
--
ALTER TABLE `t_client`
  MODIFY `CodeClient` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `t_compte`
--
ALTER TABLE `t_compte`
  MODIFY `CodeCompte` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `t_fonction`
--
ALTER TABLE `t_fonction`
  MODIFY `CodeFonction` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `t_mois`
--
ALTER TABLE `t_mois`
  MODIFY `CodeMois` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `t_mouvement`
--
ALTER TABLE `t_mouvement`
  MODIFY `CodeMouvement` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `t_salaire`
--
ALTER TABLE `t_salaire`
  MODIFY `CodeSalaire` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `t_statut_compte`
--
ALTER TABLE `t_statut_compte`
  MODIFY `CodeStatut` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `t_type_mouvement`
--
ALTER TABLE `t_type_mouvement`
  MODIFY `CodeType` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `t_user`
--
ALTER TABLE `t_user`
  MODIFY `CodeUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `t_agent`
--
ALTER TABLE `t_agent`
  ADD CONSTRAINT `fk_agent_fonction` FOREIGN KEY (`CodeFonction`) REFERENCES `t_fonction` (`CodeFonction`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `t_compte`
--
ALTER TABLE `t_compte`
  ADD CONSTRAINT `fk_compte_categorie` FOREIGN KEY (`CodeCategorie`) REFERENCES `t_categorie_compte` (`CodeCategorie`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_compte_client` FOREIGN KEY (`CodeClient`) REFERENCES `t_client` (`CodeClient`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_compte_statut` FOREIGN KEY (`CodeStatut`) REFERENCES `t_statut_compte` (`CodeStatut`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `t_mouvement`
--
ALTER TABLE `t_mouvement`
  ADD CONSTRAINT `fk_mouvement_agent` FOREIGN KEY (`CodeAgent`) REFERENCES `t_agent` (`CodeAgent`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_mouvement_compte` FOREIGN KEY (`CodeCompte`) REFERENCES `t_compte` (`CodeCompte`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_mouvement_type` FOREIGN KEY (`CodeType`) REFERENCES `t_type_mouvement` (`CodeType`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `t_user`
--
ALTER TABLE `t_user`
  ADD CONSTRAINT `fk_user_agent` FOREIGN KEY (`CodeAgent`) REFERENCES `t_agent` (`CodeAgent`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_user_categorie` FOREIGN KEY (`CodeCategorie`) REFERENCES `t_categorie_user` (`CodeCategorie`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
