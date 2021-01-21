-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : jeu. 21 jan. 2021 à 10:28
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `express_food`
--

-- --------------------------------------------------------

--
-- Structure de la table `categorie_plat`
--

DROP TABLE IF EXISTS `categorie_plat`;
CREATE TABLE IF NOT EXISTS `categorie_plat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(42) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `categorie_plat`
--

INSERT INTO `categorie_plat` (`id`, `libelle`) VALUES
(1, 'plat de résistance'),
(2, 'dessert');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `telephone` varchar(42) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id`, `telephone`) VALUES
(5, NULL),
(7, NULL),
(8, '0657832411'),
(9, NULL),
(10, NULL),
(11, NULL),
(12, '0766354942'),
(13, NULL),
(14, '0682649367'),
(15, NULL),
(16, NULL);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `clients (commandes >= 1)`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `clients (commandes >= 1)`;
CREATE TABLE IF NOT EXISTS `clients (commandes >= 1)` (
`id` int(11)
,`nom` varchar(85)
,`Email` varchar(42)
,`Tél.` varchar(42)
,`date 1ère commande` datetime
,`nb de commandes` bigint(21)
,`montant TTC moyen` varchar(12)
);

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `date_heure_creation` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ref_client` int(11) NOT NULL,
  `statut` set('validée','en attente de paiement','en cours de livraison','terminée','annulée') DEFAULT NULL,
  `adresse_livraison` varchar(255) DEFAULT NULL,
  `ref_livreur` int(11) DEFAULT NULL,
  `heure_livraison_estimee` datetime DEFAULT NULL,
  `heure_livraison_reelle` datetime DEFAULT NULL,
  `montant_TTC` decimal(7,2) DEFAULT NULL,
  `moyen_paiement` set('CB','Paypal') DEFAULT NULL,
  PRIMARY KEY (`num`),
  KEY `client_id` (`ref_client`) USING BTREE,
  KEY `livreur_id` (`ref_livreur`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`num`, `date_heure_creation`, `ref_client`, `statut`, `adresse_livraison`, `ref_livreur`, `heure_livraison_estimee`, `heure_livraison_reelle`, `montant_TTC`, `moyen_paiement`) VALUES
(1, '2021-01-06 11:09:10', 5, 'terminée', '39-45 Quai du Président Roosevelt, 92130 Issy-les-Moulineaux', 4, '2021-01-06 11:18:00', '2021-01-06 11:16:45', '27.28', 'CB'),
(2, '2021-01-06 12:03:10', 7, 'terminée', '6 Avenue Marcel Doret, 75016 Paris', 3, '2021-01-06 12:14:00', '2021-01-06 12:16:45', '8.03', 'CB'),
(3, '2021-01-07 12:07:04', 8, 'terminée', '25 Avenue Pierre Grenier, 92100 Boulogne-Billancourt', 4, '2021-01-07 12:25:00', '2021-01-07 12:26:40', '35.20', 'CB'),
(4, '2021-01-07 12:33:07', 9, 'annulée', '7 Square des Moulineaux, 92100 Boulogne-Billancourt', NULL, NULL, NULL, '35.20', NULL),
(5, '2021-01-07 12:38:24', 9, 'terminée', '7 Square des Moulineaux, 92100 Boulogne-Billancourt', 4, '2021-01-07 12:49:00', '2021-01-07 12:50:30', '62.48', 'CB'),
(6, '2021-01-07 12:57:21', 10, 'terminée', '9 Rue Camille Desmoulins, 92130 Issy-les-Moulineaux', 6, '2021-01-07 13:05:00', '2021-01-07 13:03:40', '13.64', 'Paypal'),
(7, '2021-01-08 13:14:07', 11, 'terminée', '88 Avenue Georges Lafont, 75016 Paris', 3, '2021-01-08 13:18:00', '2021-01-08 13:20:56', '14.85', 'CB'),
(8, '2021-01-08 11:12:10', 5, 'terminée', '39-45 Quai du Président Roosevelt, 92130 Issy-les-Moulineaux', 4, '2021-01-08 11:30:00', '2021-01-08 11:29:15', '24.09', 'CB'),
(9, '2021-01-09 12:27:21', 10, 'terminée', '9 Rue Camille Desmoulins, 92130 Issy-les-Moulineaux', 17, '2021-01-09 12:42:00', '2021-01-09 12:47:40', '45.21', 'Paypal'),
(10, '2021-01-09 12:52:14', 5, 'terminée', '39-45 Quai du Président Roosevelt, 92130 Issy-les-Moulineaux', 6, '2021-01-09 13:03:00', '2021-01-09 13:02:15', '28.82', 'CB');

-- --------------------------------------------------------

--
-- Structure de la table `jour`
--

DROP TABLE IF EXISTS `jour`;
CREATE TABLE IF NOT EXISTS `jour` (
  `date` date NOT NULL,
  PRIMARY KEY (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `jour`
--

INSERT INTO `jour` (`date`) VALUES
('2021-01-06'),
('2021-01-07'),
('2021-01-08'),
('2021-01-09'),
('2021-01-10'),
('2021-01-12'),
('2021-01-13');

-- --------------------------------------------------------

--
-- Structure de la table `livreur`
--

DROP TABLE IF EXISTS `livreur`;
CREATE TABLE IF NOT EXISTS `livreur` (
  `id` int(11) NOT NULL,
  `statut` set('libre','en livraison') DEFAULT NULL,
  `position` varchar(42) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `livreur_ibfk_1_idx` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `livreur`
--

INSERT INTO `livreur` (`id`, `statut`, `position`) VALUES
(3, 'libre', '48.833623, 2.260490'),
(4, 'en livraison', NULL),
(6, NULL, NULL),
(17, 'libre', '48.859964, 2.276373');

-- --------------------------------------------------------

--
-- Structure de la table `plat`
--

DROP TABLE IF EXISTS `plat`;
CREATE TABLE IF NOT EXISTS `plat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categorie` int(11) NOT NULL,
  `libelle` varchar(42) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `ref_administrateur` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `categorie_plat` (`categorie`),
  KEY `admin_id` (`ref_administrateur`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `plat`
--

INSERT INTO `plat` (`id`, `categorie`, `libelle`, `description`, `ref_administrateur`) VALUES
(3, 1, 'chili con carne', 'Recette traditionnelle, épicé, viande origine France', 1),
(4, 1, 'bœuf bourguignon', 'Bœuf (origine France), riz, carottes', 1),
(5, 2, 'flan patissier', NULL, 1),
(6, 2, 'salade de fruits', 'Pommes, ananas, raisin', 2),
(7, 1, 'hachis parmentier', NULL, 1),
(8, 2, 'mousse au chocolat', 'Mousse chocolat intense maison', 1),
(9, 1, 'gratin de légumes', 'Plat végétarien, légumes de saison', 2),
(10, 1, 'tagliatelles aux champignons de Paris', NULL, 2),
(11, 2, 'galette des rois', 'Galette maison traditionnelle à la frangipane avec une fève en porcelaine, livrée avec une couronne', 2),
(12, 1, 'risotto aux asperges', 'Risotto végétarien', 2),
(13, 1, 'saumon aux haricots verts', NULL, 2),
(14, 2, 'panacotta fruits rouge', NULL, 2),
(15, 2, 'fondant au chocolat', 'Livré avec un petit pot de crème anglaise', 1),
(16, 2, 'tarte aux pommes à la canelle', 'Tarte maison à base de pommes bio françaises', 2),
(17, 1, 'moussaka grecque', 'Moussaka maison accompagnée de salade verte', 1),
(18, 1, 'tarte tatin de légumes', 'Plat végétarien', 1),
(19, 1, 'ratatouille', NULL, 2),
(20, 1, 'rôti de porc à la moutarde', 'Porc français à la moutarde de Dijon', 1),
(21, 2, 'tiramisu', 'Recette originale', 2),
(22, 2, 'crumble fruits rouges', NULL, 1);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `plats du jour`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `plats du jour`;
CREATE TABLE IF NOT EXISTS `plats du jour` (
`date` date
,`id` int(11)
,`nom` varchar(42)
,`description` varchar(255)
,`catégorie` varchar(42)
,`prix unitaire HT` decimal(7,2)
,`ajouté par` varchar(85)
);

-- --------------------------------------------------------

--
-- Structure de la table `plat_commande`
--

DROP TABLE IF EXISTS `plat_commande`;
CREATE TABLE IF NOT EXISTS `plat_commande` (
  `ref_commande` int(11) NOT NULL,
  `ref_plat` int(11) NOT NULL,
  `ref_jour` date NOT NULL,
  `quantite_commandee` int(11) DEFAULT NULL,
  `prix_total_TTC` decimal(7,2) DEFAULT NULL,
  PRIMARY KEY (`ref_commande`,`ref_plat`,`ref_jour`),
  KEY `plat_du_jour` (`ref_plat`,`ref_jour`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `plat_commande`
--

INSERT INTO `plat_commande` (`ref_commande`, `ref_plat`, `ref_jour`, `quantite_commandee`, `prix_total_TTC`) VALUES
(1, 4, '2021-01-06', 2, '16.06'),
(1, 8, '2021-01-06', 1, '5.61'),
(1, 14, '2021-01-06', 1, '5.61'),
(2, 9, '2021-01-06', 1, '8.03'),
(3, 7, '2021-01-07', 2, '17.60'),
(3, 11, '2021-01-07', 2, '17.60'),
(4, 7, '2021-01-07', 4, '35.20'),
(5, 7, '2021-01-07', 2, '17.60'),
(5, 11, '2021-01-07', 4, '27.28'),
(5, 13, '2021-01-07', 2, '17.60'),
(6, 11, '2021-01-07', 2, '13.64'),
(7, 10, '2021-01-08', 1, '8.03'),
(7, 15, '2021-01-08', 1, '6.82'),
(8, 4, '2021-01-08', 3, '24.09'),
(9, 6, '2021-01-09', 1, '5.61'),
(9, 10, '2021-01-09', 1, '8.80'),
(9, 16, '2021-01-09', 2, '13.20'),
(10, 6, '2021-01-09', 2, '11.22'),
(10, 10, '2021-01-09', 2, '17.60');

-- --------------------------------------------------------

--
-- Structure de la table `plat_du_jour`
--

DROP TABLE IF EXISTS `plat_du_jour`;
CREATE TABLE IF NOT EXISTS `plat_du_jour` (
  `ref_plat` int(11) NOT NULL,
  `ref_jour` date NOT NULL,
  `prix_unitaire_HT` decimal(7,2) DEFAULT NULL,
  `taux_TVA` decimal(5,2) NOT NULL DEFAULT '10.00',
  PRIMARY KEY (`ref_plat`,`ref_jour`) USING BTREE,
  KEY `date` (`ref_jour`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `plat_du_jour`
--

INSERT INTO `plat_du_jour` (`ref_plat`, `ref_jour`, `prix_unitaire_HT`, `taux_TVA`) VALUES
(3, '2021-01-09', '8.00', '10.00'),
(4, '2021-01-06', '7.30', '10.00'),
(4, '2021-01-08', '7.30', '10.00'),
(5, '2021-01-07', '4.80', '10.00'),
(5, '2021-01-08', '4.80', '10.00'),
(5, '2021-01-13', '4.80', '10.00'),
(6, '2021-01-09', '5.10', '10.00'),
(7, '2021-01-07', '8.00', '10.00'),
(7, '2021-01-13', '8.00', '10.00'),
(8, '2021-01-06', '5.10', '10.00'),
(8, '2021-01-12', '5.10', '10.00'),
(9, '2021-01-06', '7.30', '10.00'),
(10, '2021-01-08', '7.30', '10.00'),
(10, '2021-01-09', '8.00', '10.00'),
(11, '2021-01-07', '6.20', '10.00'),
(11, '2021-01-10', '7.20', '10.00'),
(12, '2021-01-13', '7.40', '10.00'),
(13, '2021-01-07', '8.00', '10.00'),
(14, '2021-01-06', '5.10', '10.00'),
(14, '2021-01-13', '5.10', '10.00'),
(15, '2021-01-08', '6.20', '10.00'),
(16, '2021-01-09', '6.00', '10.00'),
(17, '2021-01-10', '9.00', '10.00'),
(18, '2021-01-10', '8.50', '10.00'),
(19, '2021-01-12', '7.10', '10.00'),
(20, '2021-01-12', '8.00', '10.00'),
(21, '2021-01-10', '7.00', '10.00'),
(22, '2021-01-12', '6.00', '10.00');

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(42) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`id`, `libelle`) VALUES
(1, 'Default'),
(2, 'Administrateur'),
(3, 'Livreur'),
(4, 'Client');

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `stats commandes par jour`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `stats commandes par jour`;
CREATE TABLE IF NOT EXISTS `stats commandes par jour` (
`date` date
,`nombre de commandes terminées` bigint(21)
,`nombre de plats commandés` decimal(32,0)
,`montant TTC total` decimal(29,2)
,`montant TTC minimum` decimal(7,2)
,`montant TTC maximum` decimal(7,2)
);

-- --------------------------------------------------------

--
-- Doublure de structure pour la vue `stats livraisons`
-- (Voir ci-dessous la vue réelle)
--
DROP VIEW IF EXISTS `stats livraisons`;
CREATE TABLE IF NOT EXISTS `stats livraisons` (
`num commande` int(11)
,`date et heure de livraison` datetime
,`adresse de livraison` varchar(255)
,`livreur` varchar(42)
,`temps de livraison` time
,`différence avec l'estimation` time
);

-- --------------------------------------------------------

--
-- Structure de la table `stock_plat_livreur`
--

DROP TABLE IF EXISTS `stock_plat_livreur`;
CREATE TABLE IF NOT EXISTS `stock_plat_livreur` (
  `ref_livreur` int(11) NOT NULL,
  `ref_plat` int(11) NOT NULL,
  `ref_jour` date NOT NULL,
  `quantite_detenue` int(11) DEFAULT NULL,
  PRIMARY KEY (`ref_livreur`,`ref_plat`,`ref_jour`) USING BTREE,
  KEY `plat_du_jour` (`ref_plat`,`ref_jour`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `stock_plat_livreur`
--

INSERT INTO `stock_plat_livreur` (`ref_livreur`, `ref_plat`, `ref_jour`, `quantite_detenue`) VALUES
(3, 3, '2021-01-09', 5),
(3, 4, '2021-01-06', 0),
(3, 4, '2021-01-08', 2),
(3, 5, '2021-01-07', 0),
(3, 5, '2021-01-08', 2),
(3, 6, '2021-01-09', 4),
(3, 7, '2021-01-07', 0),
(3, 8, '2021-01-06', 0),
(3, 9, '2021-01-06', 0),
(3, 10, '2021-01-08', 1),
(3, 10, '2021-01-09', 5),
(3, 11, '2021-01-07', 0),
(3, 13, '2021-01-07', 0),
(3, 14, '2021-01-06', 1),
(3, 15, '2021-01-08', 0),
(3, 16, '2021-01-09', 6),
(4, 3, '2021-01-09', 3),
(4, 4, '2021-01-06', 0),
(4, 4, '2021-01-08', 3),
(4, 5, '2021-01-07', 0),
(4, 5, '2021-01-08', 1),
(4, 6, '2021-01-09', 3),
(4, 7, '2021-01-07', 2),
(4, 8, '2021-01-06', 0),
(4, 9, '2021-01-06', 1),
(4, 10, '2021-01-08', 0),
(4, 10, '2021-01-09', 2),
(4, 11, '2021-01-07', 0),
(4, 13, '2021-01-07', 3),
(4, 14, '2021-01-06', 1),
(4, 15, '2021-01-08', 2),
(4, 16, '2021-01-09', 4),
(6, 4, '2021-01-08', 1),
(6, 5, '2021-01-07', 0),
(6, 5, '2021-01-08', 0),
(6, 7, '2021-01-07', 0),
(6, 10, '2021-01-08', 0),
(6, 11, '2021-01-07', 1),
(6, 13, '2021-01-07', 2),
(6, 15, '2021-01-08', 2);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(42) NOT NULL,
  `password` varchar(42) NOT NULL,
  `adresse_email` varchar(42) DEFAULT NULL,
  `role` int(11) NOT NULL DEFAULT '1',
  `nom` varchar(42) DEFAULT NULL,
  `prenom` varchar(42) DEFAULT NULL,
  `statut_compte` set('actif','suspendu','desactive') NOT NULL DEFAULT 'actif',
  `date_creation_compte` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `role` (`role`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `login`, `password`, `adresse_email`, `role`, `nom`, `prenom`, `statut_compte`, `date_creation_compte`) VALUES
(1, 'ebichet', 'ab1732eb5879779ee91fad1ef5ecae5e', 'e_bichet@yahoo.fr', 2, 'Bichet', 'Elodie', 'actif', '2021-01-05 09:22:56'),
(2, 'mdupont', 'd41d8cd98f00b204e9800998ecf8427e', 'm.dupont@expressfood.com', 2, 'Dupont', 'Mélanie', 'actif', '2021-01-05 09:33:44'),
(3, 'bcarmin', 'c06bb72f0a282066dd8d9a0ad0e83ca0', 'b.carmin@expressfood.com', 3, 'Carmin', 'Benoît', 'actif', '2021-01-05 09:38:12'),
(4, 'lsigne', 'c9c775463b6f3be391963ab4db10fd81', 'l.signe@expressfood.com', 3, 'Signé', 'Liam', 'actif', '2021-01-05 09:42:08'),
(5, 'matt75', '96d2fa646b4085a5a123e6610a87043c', 'matt@le-domaine.com', 4, 'Sterne', 'Matthieu', 'actif', '2021-01-06 11:47:46'),
(6, 'smonnet', 'a4c18bea2b65aa3a58f60a5a49a1bf96', 's.monnet@expressfood.com', 3, 'Monnet', 'Sarah', 'actif', '2021-01-06 17:31:09'),
(7, 'gmilhares', '567051c3f68a641e45d788b3ebd1abad', 'gmilhares@yahoo.fr', 4, 'Milharès', 'Guillaume', 'actif', '2021-01-06 10:05:00'),
(8, 'dany33', '567051c3f68a641e45d788b3ebd1abad', 'daniel@monmail.fr', 4, 'Bateau', 'Daniel', 'actif', '2021-01-06 10:15:00'),
(9, 'romaneee', 'f5a7cd8ddd9c3dbf28914e2bf21f15ca', 'romane@monmail.fr', 4, 'Kempf', 'Romane', 'actif', '2021-01-06 11:35:00'),
(10, 'apriant', 'b5d23988dc0e8f88d14228a8c4ec164b', 'aline@monmail.fr', 4, 'Priant', 'Aline', 'actif', '2021-01-06 11:38:00'),
(11, 'mimimotta', 'f26ff6a18a3911bf57a59bcd923a12b0', 'michel@monmail.fr', 4, 'Motta', 'Michel', 'actif', '2021-01-06 11:43:00'),
(12, 'aabidi', '10c154bf86526ed1fdda336e37baffd1', 'ahmed@monmail.fr', 4, 'Abidi', 'Ahmed', 'actif', '2021-01-06 11:44:00'),
(13, 'paultran', '6bc5f2368e32563087c52b6633157a75', 'paul@monmail.fr', 4, 'Tran', 'Paul', 'actif', '2021-01-07 10:59:00'),
(14, 'lili78', '320814b160804494f1bcb68e8625473f', 'elise@monmail.fr', 4, 'Prala', 'Elise', 'actif', '2021-01-07 11:47:00'),
(15, 'johnjohn', '5e29c389bc351640537fe2799922fcf1', 'john@monmail.fr', 4, 'Mood', 'John', 'actif', '2021-01-07 12:28:00'),
(16, 'stephBig', '5e29c389bc351640537fe2799922fcf1', 'stephane@monmail.fr', 4, 'Bigot', 'Stéphane', 'actif', '2021-01-07 12:52:00'),
(17, 'pvilon', '0f7cd321bc17981bb25ab7d5b187145d', 'p.vilon@expressfood.com', 3, 'Vilon', 'Patrick', 'actif', '2021-01-08 09:59:14');

-- --------------------------------------------------------

--
-- Structure de la vue `clients (commandes >= 1)`
--
DROP TABLE IF EXISTS `clients (commandes >= 1)`;

DROP VIEW IF EXISTS `clients (commandes >= 1)`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `clients (commandes >= 1)`  AS  select `client`.`id` AS `id`,concat(`utilisateur`.`prenom`,' ',`utilisateur`.`nom`) AS `nom`,`utilisateur`.`adresse_email` AS `Email`,`client`.`telephone` AS `Tél.`,min(`commande`.`date_heure_creation`) AS `date 1ère commande`,count(`commande`.`num`) AS `nb de commandes`,concat(round(avg(`commande`.`montant_TTC`),2),' €') AS `montant TTC moyen` from ((`client` left join `utilisateur` on((`client`.`id` = `utilisateur`.`id`))) left join `commande` on((`commande`.`ref_client` = `client`.`id`))) where (`commande`.`statut` = 'terminée') group by `client`.`id` ;

-- --------------------------------------------------------

--
-- Structure de la vue `plats du jour`
--
DROP TABLE IF EXISTS `plats du jour`;

DROP VIEW IF EXISTS `plats du jour`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `plats du jour`  AS  select `plat_du_jour`.`ref_jour` AS `date`,`plat`.`id` AS `id`,`plat`.`libelle` AS `nom`,`plat`.`description` AS `description`,`categorie_plat`.`libelle` AS `catégorie`,`plat_du_jour`.`prix_unitaire_HT` AS `prix unitaire HT`,concat(`utilisateur`.`prenom`,' ',`utilisateur`.`nom`) AS `ajouté par` from (((`plat` left join `categorie_plat` on((`plat`.`categorie` = `categorie_plat`.`id`))) left join `plat_du_jour` on((`plat_du_jour`.`ref_plat` = `plat`.`id`))) left join `utilisateur` on((`utilisateur`.`id` = `plat`.`ref_administrateur`))) order by `plat_du_jour`.`ref_jour` desc,`categorie_plat`.`id` ;

-- --------------------------------------------------------

--
-- Structure de la vue `stats commandes par jour`
--
DROP TABLE IF EXISTS `stats commandes par jour`;

DROP VIEW IF EXISTS `stats commandes par jour`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `stats commandes par jour`  AS  select `plat_du_jour`.`ref_jour` AS `date`,count(`commande`.`num`) AS `nombre de commandes terminées`,sum(`plat_commande`.`quantite_commandee`) AS `nombre de plats commandés`,sum(`commande`.`montant_TTC`) AS `montant TTC total`,min(`commande`.`montant_TTC`) AS `montant TTC minimum`,max(`commande`.`montant_TTC`) AS `montant TTC maximum` from ((`plat_du_jour` left join `plat_commande` on(((`plat_commande`.`ref_plat` = `plat_du_jour`.`ref_plat`) and (`plat_commande`.`ref_jour` = `plat_du_jour`.`ref_jour`)))) left join `commande` on((`commande`.`num` = `plat_commande`.`ref_commande`))) where (`commande`.`statut` = 'terminée') group by `plat_du_jour`.`ref_jour` order by `plat_du_jour`.`ref_jour` desc limit 10 ;

-- --------------------------------------------------------

--
-- Structure de la vue `stats livraisons`
--
DROP TABLE IF EXISTS `stats livraisons`;

DROP VIEW IF EXISTS `stats livraisons`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `stats livraisons`  AS  select `commande`.`num` AS `num commande`,`commande`.`heure_livraison_reelle` AS `date et heure de livraison`,`commande`.`adresse_livraison` AS `adresse de livraison`,`utilisateur`.`prenom` AS `livreur`,timediff(`commande`.`heure_livraison_reelle`,`commande`.`date_heure_creation`) AS `temps de livraison`,timediff(`commande`.`heure_livraison_reelle`,`commande`.`heure_livraison_estimee`) AS `différence avec l'estimation` from (`commande` join `utilisateur` on((`utilisateur`.`id` = `commande`.`ref_livreur`))) where (`commande`.`statut` = 'terminée') order by `commande`.`date_heure_creation` desc ;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `client_ibfk_1` FOREIGN KEY (`id`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`ref_client`) REFERENCES `client` (`id`) ON DELETE NO ACTION,
  ADD CONSTRAINT `commande_ibfk_2` FOREIGN KEY (`ref_livreur`) REFERENCES `livreur` (`id`);

--
-- Contraintes pour la table `livreur`
--
ALTER TABLE `livreur`
  ADD CONSTRAINT `livreur_ibfk_1` FOREIGN KEY (`id`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `plat`
--
ALTER TABLE `plat`
  ADD CONSTRAINT `plat_ibfk_1` FOREIGN KEY (`categorie`) REFERENCES `categorie_plat` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `plat_ibfk_2` FOREIGN KEY (`ref_administrateur`) REFERENCES `utilisateur` (`id`);

--
-- Contraintes pour la table `plat_commande`
--
ALTER TABLE `plat_commande`
  ADD CONSTRAINT `plat_commande_ibfk_1` FOREIGN KEY (`ref_commande`) REFERENCES `commande` (`num`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `plat_commande_ibfk_2` FOREIGN KEY (`ref_plat`,`ref_jour`) REFERENCES `plat_du_jour` (`ref_plat`, `ref_jour`);

--
-- Contraintes pour la table `plat_du_jour`
--
ALTER TABLE `plat_du_jour`
  ADD CONSTRAINT `plat_du_jour_ibfk_1` FOREIGN KEY (`ref_jour`) REFERENCES `jour` (`date`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `plat_du_jour_ibfk_2` FOREIGN KEY (`ref_plat`) REFERENCES `plat` (`id`) ON UPDATE NO ACTION;

--
-- Contraintes pour la table `stock_plat_livreur`
--
ALTER TABLE `stock_plat_livreur`
  ADD CONSTRAINT `stock_plat_livreur_ibfk_1` FOREIGN KEY (`ref_livreur`) REFERENCES `livreur` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `stock_plat_livreur_ibfk_2` FOREIGN KEY (`ref_plat`,`ref_jour`) REFERENCES `plat_du_jour` (`ref_plat`, `ref_jour`);

--
-- Contraintes pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `utilisateur_ibfk_1` FOREIGN KEY (`role`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
