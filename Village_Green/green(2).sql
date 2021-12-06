-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : lun. 06 déc. 2021 à 11:52
-- Version du serveur :  10.3.31-MariaDB-0ubuntu0.20.04.1
-- Version de PHP : 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `green`
--

-- --------------------------------------------------------

--
-- Structure de la table `cat`
--

CREATE TABLE `cat` (
  `cat_id` int(11) NOT NULL,
  `cat_name` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `cat`
--

INSERT INTO `cat` (`cat_id`, `cat_name`) VALUES
(1, 'Guit/Bass'),
(2, 'Batteries'),
(3, 'Clavier'),
(4, 'Studio'),
(5, 'Sono'),
(6, 'DJ'),
(7, 'Cases'),
(8, 'Accessoires'),
(13, 'Eclairage');

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

CREATE TABLE `clients` (
  `client_id` int(11) NOT NULL,
  `client_type` tinyint(1) NOT NULL DEFAULT 0,
  `client_name` varchar(50) NOT NULL,
  `client_surname` varchar(50) NOT NULL,
  `client_adress` varchar(200) NOT NULL,
  `client_adress_complete` varchar(200) NOT NULL,
  `client_zipcode` varchar(5) NOT NULL,
  `client_city` varchar(50) NOT NULL,
  `client_country` varchar(50) NOT NULL,
  `client_email` varchar(50) NOT NULL,
  `client_password` varchar(255) NOT NULL,
  `client_date_add` datetime NOT NULL DEFAULT current_timestamp(),
  `count_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `clients`
--

INSERT INTO `clients` (`client_id`, `client_type`, `client_name`, `client_surname`, `client_adress`, `client_adress_complete`, `client_zipcode`, `client_city`, `client_country`, `client_email`, `client_password`, `client_date_add`, `count_id`) VALUES
(10, 1, 'Alice', 'toto0103', '78 avenue de Jules Verne', '', '59666', 'Aras', 'France', '78787@huhg.com', '$2y$10$4pn4fIuMjLqyNrdgQu6pCuvkD6EPte6cKhpotM0/CQfMffRrQOE/O', '2021-09-30 10:07:51', 1),
(11, 1, 'White', 'John', '30 rue Poulanvile', '', '80000', 'Amiens', 'France', 'afpa@gmail.com', '$2y$10$RyF3WTXBTuvWckijGHz1VONvmx7GKlc60PyOMloS3rPkqUVXEf59G', '2021-09-30 10:07:51', 1),
(21, 1, 'Boss', 'Main', '777 Avenue du Générale', '', '80000', 'Amiens', 'France', 'admin@gmail.com', '$2y$10$LT29V6mdNd/PVZtPmLeMHu3pVyAGIZNDfMjrEXYWNzQ7HNgnkxqyS', '2021-09-30 10:07:51', 1),
(22, 1, 'Van Damme', 'Jean-Claude', '3 Avenue Pierre 1er de Serbie', 'chez AAC AGENCE ARTISTIQUE', '75116', 'PARIS', 'France', 'jcvd@gmail.com', '$2y$10$t23v7Fj22BihoMtsHXpKhuP8idjBZFZFdyLlkLgtEZjM8T4Q9yFky', '2021-10-19 16:40:41', 1);

-- --------------------------------------------------------

--
-- Structure de la table `countries`
--

CREATE TABLE `countries` (
  `count_id` int(11) NOT NULL,
  `count_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `countries`
--

INSERT INTO `countries` (`count_id`, `count_name`) VALUES
(1, 'France'),
(2, 'Belgique'),
(3, 'Allemagne'),
(4, 'Suisse'),
(5, 'Pays-Bas'),
(6, 'Danemark'),
(7, 'Suède'),
(8, 'Italie'),
(9, 'Espagne'),
(10, 'Luxembourg');

-- --------------------------------------------------------

--
-- Structure de la table `employees`
--

CREATE TABLE `employees` (
  `emp_id` int(11) NOT NULL,
  `emp_name` varchar(50) DEFAULT NULL,
  `emp_surname` varchar(50) DEFAULT NULL,
  `emp_adress` varchar(200) DEFAULT NULL,
  `emp_zipcode` varchar(5) DEFAULT NULL,
  `emp_email` varchar(50) DEFAULT NULL,
  `emp_tel` varchar(10) DEFAULT NULL,
  `count_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `order_date` datetime NOT NULL DEFAULT current_timestamp(),
  `order_date_pay` datetime NOT NULL DEFAULT current_timestamp(),
  `order_date_send` datetime NOT NULL DEFAULT current_timestamp(),
  `order_date_receive` datetime NOT NULL DEFAULT current_timestamp(),
  `order_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `order_details`
--

CREATE TABLE `order_details` (
  `order_details_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `prod_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `total` float(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

CREATE TABLE `products` (
  `prod_id` int(11) NOT NULL,
  `prod_cat_id` int(11) NOT NULL,
  `prod_subcat_id` int(11) NOT NULL,
  `prod_lib` varchar(50) NOT NULL,
  `prod_model` varchar(50) NOT NULL,
  `prod_pic` varchar(60) DEFAULT 'jpg',
  `prod_price` float(10,2) NOT NULL,
  `prod_stock` int(11) NOT NULL,
  `prod_det` varchar(5000) NOT NULL,
  `prod_desc` varchar(5000) NOT NULL,
  `prod_date_add` datetime NOT NULL DEFAULT current_timestamp(),
  `prod_date_mod` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `products`
--

INSERT INTO `products` (`prod_id`, `prod_cat_id`, `prod_subcat_id`, `prod_lib`, `prod_model`, `prod_pic`, `prod_price`, `prod_stock`, `prod_det`, `prod_desc`, `prod_date_add`, `prod_date_mod`) VALUES
(19, 1, 1, 'AMERICAN PROFESSIONAL II', 'STRATOCASTER', '0113900705_fen_ins_frt_1_rr.jpg', 1949.00, 6, '<ul>\r\n<li>Trois micros Stratocaster V-Mod II &agrave; simples bobinages</li>\r\n<li>Vibrato &agrave; 2 Points Retravaill&eacute; avec Bloc en Acier Lamin&eacute; &agrave; Froid</li>\r\n<li>Profil de manche Deep &rdquo;C&rdquo; avec bords de touche arrondis</li>\r\n<li>Sillet de t&ecirc;te en os ; 22 frettes narrow-tall pour faciliter les bendings</li>\r\n<li>Circuit \"Treble Bleed\" pour conserver les aigus lorsque vous baissez le volume</li>\r\n<li>&Eacute;tui rigide moul&eacute; Elite inclus</li>\r\n</ul>', '<p>L&rsquo;American Professional II Stratocaster&reg; profite de plus de soixante ans d&rsquo;innovation, d&rsquo;inspiration et d&rsquo;&eacute;volution pour satisfaire les besoins des guitaristes professionnels d&rsquo;aujourd&rsquo;hui. Notre manche populaire au profil Deep &rdquo;C&rdquo; pr&eacute;sente dor&eacute;navant des bords de touche arrondis tr&egrave;s agr&eacute;ables, une finition satin&eacute;e &rdquo;Super-Natural&rdquo; et un tout nouveau talon sculpt&eacute; qui offre un toucher particuli&egrave;rement confortable et un acc&egrave;s ais&eacute; aux aigus. Les nouveaux micros V-Mod II Stratocaster &agrave; simples bobinages continuent &agrave; produire le m&ecirc;me son chaleureux et chatoyant mais sont plus pr&eacute;cis que jamais. Un vibrato &agrave; deux points retravaill&eacute; avec un bloc en acier lamin&eacute; &agrave; froid accro&icirc;t le sustain, la clart&eacute; et la brillance dans les aigus.</p>', '2021-09-30 10:04:08', '2021-10-05 12:32:21'),
(21, 1, 1, 'AMERICAN PROFESSIONAL II', 'TELECASTER', '0113942750_fen_ins_frt_1_rr.jpg', 2049.00, 4, '<ul>\r\n<li>Deux micros &agrave; simples bobinages V-Mod II Telecaster</li>\r\n<li>Nouveau chevalet Telecaster Top Load/String-Through avec pontets &rdquo;Bullet&rdquo; compens&eacute;s en laiton</li>\r\n<li>Profil de manche Deep &rdquo;C&rdquo; avec bords de touche arrondis</li>\r\n<li>Sillet de t&ecirc;te en os ; 22 frettes narrow-tall pour faciliter les bendings</li>\r\n<li>Circuit \"Treble Bleed\" pour conserver les aigus lorsque vous baissez le volume</li>\r\n<li>&Eacute;tui rigide moul&eacute; Elite inclus</li>\r\n</ul>', '<p style=\"text-align: justify;\"><span style=\"color: #212529; font-family: SourceSansPro, Helvetica, Arial, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">L&rsquo;American Professional II Telecaster&reg; profite de plus de soixante-dix ans d&rsquo;innovation, d&rsquo;inspiration et d&rsquo;&eacute;volution pour satisfaire les besoins des guitaristes professionnels d&rsquo;aujourd&rsquo;hui.</span><br style=\"box-sizing: border-box; color: #212529; font-family: SourceSansPro, Helvetica, Arial, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\" /><br style=\"box-sizing: border-box; color: #212529; font-family: SourceSansPro, Helvetica, Arial, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\" /><span style=\"color: #212529; font-family: SourceSansPro, Helvetica, Arial, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">Notre manche populaire au profil Deep &rdquo;C&rdquo; pr&eacute;sente dor&eacute;navant des bords de touche arrondis tr&egrave;s agr&eacute;ables, une finition satin&eacute;e &rdquo;Super-Natural&rdquo; et un tout nouveau talon sculpt&eacute; qui offre un toucher particuli&egrave;rement confortable et un acc&egrave;s ais&eacute; aux aigus. Les nouveaux micros &agrave; simples bobinages V-Mod II Telecaster produisent le twang, le claquant et la p&ecirc;che qui ont fait la r&eacute;putation de la Tele mais sont plus pr&eacute;cis que jamais. Le nouveau chevalet Top-Load/String-Through (Installation des cordes depuis la table/au travers du corps), avec ses pontets &rdquo;Bullet&rdquo; compens&eacute;s, est le mod&egrave;le le plus confortable que nous ayons jamais cr&eacute;&eacute; sur une Tele. Il conserve le timbre classique offert par les pontets en laiton et offre une excellente intonation ainsi que diff&eacute;rentes options de configuration. Vous pouvez ainsi r&eacute;gler la tension et le son de chaque corde comme vous le souhaitez.</span></p>', '2021-09-30 10:04:08', '2021-10-05 14:28:36'),
(29, 1, 4, 'AMERICAN PROFESSIONAL II', 'JAZZ BASS', '0147362376_fen_ins_frt_1_rr.jpg', 2199.00, 4, '<ul>\r\n<li>Deux micros V-Mod II Jazz Bass &agrave; simples bobinages</li>\r\n<li>Profil de manche Slim &rdquo;C&rdquo; avec bords de touche arrondis</li>\r\n<li>Sillet en os ; 20 frettes narrow-tall</li>\r\n<li>Chevalet HiMass&trade; Vintage pour un sustain accru</li>\r\n<li>Tiges de renfort du manche Posiflex en graphite</li>\r\n<li>&Eacute;tui rigide moul&eacute; Elite inclus</li>\r\n</ul>', '<p style=\"text-align: justify;\">L&rsquo;American Professional II Jazz Bass&reg; profite de plus de soixante ans d&rsquo;innovation, d&rsquo;inspiration et d&rsquo;&eacute;volution pour satisfaire les besoins des bassistes professionnels d&rsquo;aujourd&rsquo;hui. Notre manche populaire au profil Slim &rdquo;C&rdquo; pr&eacute;sente dor&eacute;navant des bords de touche arrondis tr&egrave;s agr&eacute;ables, une finition satin&eacute;e &rdquo;Super-Natural&rdquo; et un tout nouveau talon de manche sculpt&eacute; qui offre un toucher particuli&egrave;rement confortable et un acc&egrave;s ais&eacute; aux aigus. Les nouveaux micros &agrave; simples bobinages V-Mod II Jazz Bass produisent le son clair et punchy qui fait la r&eacute;putation de la Jazz Bass mais ils sont plus pr&eacute;cis que jamais. L&rsquo;American Pro II Jazz Bass est un instrument polyvalent qui vous semblera imm&eacute;diatement familier.</p>', '2021-09-30 10:04:08', '2021-12-02 16:14:43'),
(30, 1, 2, 'REDONDO', 'CLASSIC', '0970913137_gtr_frt_001_rr.jpg', 768.00, 4, '<ul>\r\n<li>Forme de corps Redondo, une exclusivit&eacute; de Fender</li>\r\n<li>Table en &eacute;pic&eacute;a massif ; dos et &eacute;clisses en acajou massif</li>\r\n<li>Syst&egrave;me de micro/pr&eacute;ampli Fishman con&ccedil;u en exclusivit&eacute; pour Fender</li>\r\n<li>Manche en acajou au profil Slim-Taper en \"C\" ; touche rapport&eacute;e et chevalet en pau ferro</li>\r\n<li>T&ecirc;te de manche inclin&eacute;e vers l&rsquo;arri&egrave;re avec 6 m&eacute;caniques en ligne</li>\r\n<li>Housse deluxe incluse</li>\r\n</ul>', '<p style=\"text-align: justify;\"><span style=\"color: #212529; font-family: SourceSansPro, Helvetica, Arial, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">Cette guitare dreadnought acoustique, audacieuse et impertinente, a &eacute;t&eacute; pens&eacute;e pour d&eacute;clencher l\'inspiration d&egrave;s les premi&egrave;res notes. La Redondo Classic pr&eacute;sente une table en &eacute;pic&eacute;a massif, un dos et des &eacute;clisses en acajou massif pour que son timbre riche et imposant r&eacute;sonne dans n&rsquo;importe quel espace. Cette guitare pens&eacute;e pour le jeu en direct est &eacute;galement &eacute;quip&eacute;e d\'un syst&egrave;me de pr&eacute;ampli con&ccedil;u par Fender et Fishman&reg; et r&eacute;gl&eacute; sp&eacute;cialement pour la forme du corps de la Redondo. Il permet de reproduire le timbre naturel de l&rsquo;instrument lorsqu&rsquo;il est branch&eacute; &agrave; un amplificateur. Le manche en acajou pr&eacute;sente un confortable profil Slim-Taper en &rdquo;C&rdquo; inspir&eacute; des mod&egrave;les &eacute;lectriques historiques de Fender.</span></p>', '2021-09-30 10:04:08', '2021-10-05 14:42:02'),
(33, 8, 9, 'JOE STRUMMER', '13\' INSTRUMENT CABLE', '0990810276_fen_acc_frt_1_nr.jpg', 30.00, 7, '<ul>\r\n<li>Available in 13\' length</li>\r\n<li>Offered in Drab Green</li>\r\n<li>8mm outer diameter wire jacket</li>\r\n<li>23 AWG</li>\r\n<li>90% OFC spiral shielding</li>\r\n<li>Nickel-plated connectors</li>\r\n<li>Backed by a lifetime guarantee</li>\r\n</ul>', '<p style=\"text-align: justify;\">The Legendary Joe Strummer played guitar with an intensity that cut like a knife with raw energy and passion in every intense swipe at the strings. He was the embodiment of Punk culture and a crucial component to its development. Best known for his work with The Clash, Strummer and his bandmates were a major part of creating punk rock and has inspired countless other bands to this day.</p>', '2021-10-04 10:13:12', '2021-10-04 14:19:16'),
(34, 4, 18, 'Rode', 'NT1-A Complete Vocal Recording', 'crop_2.jpg', 159.00, 9, '<ul>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">Microphone large membrane de 1 pouce</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">Diagramme polaire : cardio&iuml;de</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">R&eacute;ponse en fr&eacute;quence : 20 - 20000 Hz</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">Niveau de pression acoustique limite : 137 dB</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">Imp&eacute;dance de sortie : 100 Ohm</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">Contacts de sortie plaqu&eacute;s or</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">Dimensions (H x L x P) : 190 x 50 x 50 mm</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">Poids : 326 g</span></li>\r\n</ul>', '<ul>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">Microphone large membrane Rode NT1-A</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">Suspension &eacute;lastique deluxe SM6 avec filtre anti-pop en tissu int&eacute;gr&eacute;</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">C&acirc;ble XLR de 6 m</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">Sac de protection contre la poussi&egrave;re</span></li>\r\n</ul>', '2021-10-04 20:41:47', '2021-10-26 09:12:53'),
(35, 2, 11, 'Millenium', 'Focus Junior Drum Set Black', '15776950_800.jpg', 148.00, 1, '<ul>\r\n<li><span style=\"box-sizing: border-box; padding: 1px 0px 0px; vertical-align: top; font-size: 14px; margin: 0px; display: block; line-height: 21px; letter-spacing: -0.1px; font-weight: 400;\">S&eacute;rie Focus</span></li>\r\n<li><span style=\"box-sizing: border-box; padding: 1px 0px 0px; vertical-align: top; font-size: 14px; margin: 0px; display: block; line-height: 21px; letter-spacing: -0.1px; font-weight: 400;\">Convient aux enfants de 4 &agrave; 7 ans</span></li>\r\n<li><span style=\"box-sizing: border-box; padding: 1px 0px 0px; vertical-align: top; font-size: 14px; margin: 0px; display: block; line-height: 21px; letter-spacing: -0.1px; font-weight: 400;\">Grosse caisse 16\"x10\"</span></li>\r\n<li><span style=\"box-sizing: border-box; padding: 1px 0px 0px; vertical-align: top; font-size: 14px; margin: 0px; display: block; line-height: 21px; letter-spacing: -0.1px; font-weight: 400;\">Tom 08\"x05\"</span></li>\r\n<li><span style=\"box-sizing: border-box; padding: 1px 0px 0px; vertical-align: top; font-size: 14px; margin: 0px; display: block; line-height: 21px; letter-spacing: -0.1px; font-weight: 400;\">Tom 10\"x06\"</span></li>\r\n<li><span style=\"box-sizing: border-box; padding: 1px 0px 0px; vertical-align: top; font-size: 14px; margin: 0px; display: block; line-height: 21px; letter-spacing: -0.1px; font-weight: 400;\">Stand tom 13\"x11\"</span></li>\r\n<li><span style=\"box-sizing: border-box; padding: 1px 0px 0px; vertical-align: top; font-size: 14px; margin: 0px; display: block; line-height: 21px; letter-spacing: -0.1px; font-weight: 400;\">Caisse claire en bois 12\"x05\"</span></li>\r\n<li><span style=\"box-sizing: border-box; padding: 1px 0px 0px; vertical-align: top; font-size: 14px; margin: 0px; display: block; line-height: 21px; letter-spacing: -0.1px; font-weight: 400;\">Finition: Rhodo&iuml;d</span></li>\r\n<li><span style=\"box-sizing: border-box; padding: 1px 0px 0px; vertical-align: top; font-size: 14px; margin: 0px; display: block; line-height: 21px; letter-spacing: -0.1px; font-weight: 400;\">Couleur: Noir</span></li>\r\n</ul>', '<p style=\"text-align: justify;\"><span style=\"color: #3b3b3b; font-family: \'Open Sans\', Verdana, Tahoma, Arial, Helvetica, sans-serif; font-size: 15.36px; font-style: normal; font-variant-ligatures: no-common-ligatures; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; float: none; display: inline !important;\">Le Focus Junior Drum Set Black de Millenium propose un &eacute;quipement complet pour accompagner sans prise de t&ecirc;te les premiers pas des jeunes batteurs ambitieux ! Apr&egrave;s avoir d&eacute;ball&eacute;, mont&eacute; et accord&eacute; votre batterie, votre enfant aura tout ce qu\'il faut pour commencer &agrave; \"tambouriner\" sans plus attendre. L\'ensemble comprend cinq f&ucirc;ts dont une caisse claire en bois, ainsi qu\'une charley de 10 pouces, une cymbale crash/ride de 12 pouces, tous les pieds n&eacute;cessaires dont celui de la charley, une p&eacute;dale de grosse caisse et un tabouret. <br /></span></p>', '2021-10-05 09:13:37', '2021-10-06 14:39:32'),
(36, 2, 11, 'Millenium', 'Youngster Drum Set Green', '11680618_800.jpg', 98.00, 2, '<ul>\r\n<li><span style=\"box-sizing: border-box; padding: 1px 0px 0px; vertical-align: top; font-size: 14px; margin: 0px; display: block; line-height: 21px; letter-spacing: -0.1px; font-weight: 400;\">Id&eacute;ale pour les enfants &agrave; partir de 3 ans</span></li>\r\n<li><span style=\"box-sizing: border-box; padding: 1px 0px 0px; vertical-align: top; font-size: 14px; margin: 0px; display: block; line-height: 21px; letter-spacing: -0.1px; font-weight: 400;\">Grosse caisse 16\"x12\"</span></li>\r\n<li><span style=\"box-sizing: border-box; padding: 1px 0px 0px; vertical-align: top; font-size: 14px; margin: 0px; display: block; line-height: 21px; letter-spacing: -0.1px; font-weight: 400;\">Tom 08\"x05\"</span></li>\r\n<li><span style=\"box-sizing: border-box; padding: 1px 0px 0px; vertical-align: top; font-size: 14px; margin: 0px; display: block; line-height: 21px; letter-spacing: -0.1px; font-weight: 400;\">Caisse claire 10\"x04\"</span></li>\r\n<li><span style=\"box-sizing: border-box; padding: 1px 0px 0px; vertical-align: top; font-size: 14px; margin: 0px; display: block; line-height: 21px; letter-spacing: -0.1px; font-weight: 400;\">F&ucirc;ts en bois dur</span></li>\r\n<li><span style=\"box-sizing: border-box; padding: 1px 0px 0px; vertical-align: top; font-size: 14px; margin: 0px; display: block; line-height: 21px; letter-spacing: -0.1px; font-weight: 400;\">Accastillage noir</span></li>\r\n<li><span style=\"box-sizing: border-box; padding: 1px 0px 0px; vertical-align: top; font-size: 14px; margin: 0px; display: block; line-height: 21px; letter-spacing: -0.1px; font-weight: 400;\">Finition: Rhodo&iuml;d</span></li>\r\n<li><span style=\"box-sizing: border-box; padding: 1px 0px 0px; vertical-align: top; font-size: 14px; margin: 0px; display: block; line-height: 21px; letter-spacing: -0.1px; font-weight: 400;\">Couleur: Green Sparkle</span></li>\r\n</ul>', '<p style=\"text-align: justify;\"><span style=\"color: #000000;\"><span style=\"font-family: \'Open Sans\', Verdana, Tahoma, Arial, Helvetica, sans-serif; font-size: 15.36px; font-style: normal; font-variant-ligatures: no-common-ligatures; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; float: none; display: inline !important;\">La </span><span style=\"font-family: \'Open Sans\', Verdana, Tahoma, Arial, Helvetica, sans-serif; font-size: 15.36px; font-style: normal; font-variant-ligatures: no-common-ligatures; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; float: none; display: inline !important;\">batterie Millenium pour enfants en jette carr&eacute;ment avec son vert brillant m&eacute;tallis&eacute; ! Cette batterie est si petite que m&ecirc;me les enfants de trois ans pourront se d&eacute;fouler avec! Elle poss&egrave;de tous les &eacute;l&eacute;ments que vous pourriez attendre d\'une batterie professionnelle : une caisse claire, un tom alto, un tom m&eacute;dium, une grosse caisse, une charleston, une cymbale crash, des p&eacute;dales et m&ecirc;me un tabouret. Le rev&ecirc;tement noir de la ferrure tape &eacute;galement &agrave; l&rsquo;&oelig;il, et, bien entendu, une paire de baguettes est fournie afin de pouvoir imm&eacute;diatement se mettre &agrave; l&rsquo;&oelig;uvre.</span></span></p>', '2021-10-05 09:42:07', '2021-10-05 10:05:45'),
(37, 1, 1, 'PLAYER PLUS', 'TELECASTER', '0147333336_fen_ins_frt_1_rr.jpg', 1049.00, 2, '<ul>\r\n<li>Micros Telecaster Player Plus Noiseless</li>\r\n<li>Touche au radius de 12\" (305 mm) avec bords arrondis</li>\r\n<li>Chevalet de Tele moderne &agrave; 6 pontets moul&eacute;s en acier</li>\r\n<li>Contr&ocirc;le de tonalit&eacute; push-pull activant le c&acirc;blage des deux micros en s&eacute;rie</li>\r\n<li>M&eacute;caniques bloquantes</li>\r\n</ul>', '<p style=\"text-align: justify;\"><span style=\"color: #212529; font-family: SourceSansPro, Helvetica, Arial, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">La Player Plus Telecaster&reg; fusionne le design classique de Fender&reg;, des fonctionnalit&eacute;s pens&eacute;es pour le jeu et de nouvelles finitions &eacute;tonnantes, pour vous faire profiter d&rsquo;un toucher exceptionnel et d&rsquo;un style inimitable. La Player Plus Tele&reg; vous permet de retrouver le doux twang chaleureux de la Tele&reg;, mais sans aucun souffle, gr&acirc;ce &agrave; son jeu de micros Player Plus Noiseless&trade;. Un commutateur push-pull install&eacute; sur le contr&ocirc;le de tonalit&eacute; configure les deux micros en s&eacute;rie, ce qui accroit le niveau de sortie et produit un son plus charnu. Gr&acirc;ce &agrave; la douce finition satin&eacute;e et aux bords arrondis du manche au profil &rdquo;Modern C&rdquo;, votre main glissera sur cette Player Plus Tele&reg; avec une facilit&eacute; d&eacute;concertante. La touche au radius de 12&rdquo; (305 mm), avec ses 22 frettes medium jumbo, vous aidera &agrave; jouer des solos avec une fluidit&eacute; hors pair et &agrave; effectuer des bendings sans faire friser les cordes.</span><span style=\"color: #212529; font-family: SourceSansPro, Helvetica, Arial, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\"> </span><span style=\"color: #212529; font-family: SourceSansPro, Helvetica, Arial, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\"><br /></span></p>', '2021-10-05 14:33:26', '2021-10-05 14:36:07'),
(38, 1, 2, 'CD-60S', 'ALL-MAHOGANY', '0970110022_gtr_frt_001_rr.jpg', 220.00, 8, '<ul>\r\n<li>Corps de style Dreadnought</li>\r\n<li>Table en acajou massif avec barrage scallop&eacute; en \"X\"</li>\r\n<li>Dos et &eacute;clisses en acajou</li>\r\n<li>Manche \"facile &agrave; jouer\" avec bords de touche arrondis</li>\r\n</ul>', '<p style=\"text-align: justify;\"><span style=\"color: #212529; font-family: SourceSansPro, Helvetica, Arial, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">La CD-60S All-Mahogany ajoute &agrave; l\'un de nos mod&egrave;les les plus populaires une table en acajou massif pour un son organique unique. Elle est id&eacute;ale pour les guitaristes qui recherchent un mod&egrave;le Dreadnought de haute qualit&eacute;, aussi bien en termes de son que de facilit&eacute; de jeu, mais qui reste malgr&eacute; tout abordable. Avec son nouveau manche \"facile &agrave; jouer\", son dos et ses &eacute;clisses en acajou, la CD-60S All-Mahogany trouvera aussi bien sa place chez vous que sur la plage ou dans un caf&eacute;-concert &mdash; partout o&ugrave; vous souhaitez partager le son et le style classiques de Fender.</span></p>', '2021-10-05 14:44:41', '2021-10-05 16:44:41'),
(39, 1, 3, 'AMERICAN ACOUSTASONIC®', 'STRATOCASTER® COCOBOLO', '0972023096_fen_ins_frt_1_rr.jpg', 3499.00, 2, '<ul>\r\n<li><span style=\"box-sizing: border-box;\" data-sheets-value=\"{\" data-sheets-userformat=\"{\">Guitare &eacute;lectro-acoustique de pointe<br style=\"box-sizing: border-box;\" /></span></li>\r\n<li><span style=\"box-sizing: border-box;\" data-sheets-value=\"{\" data-sheets-userformat=\"{\">L&rsquo;Acoustic Engine offre de nouvelles combinaisons de styles de corps et de bois<br style=\"box-sizing: border-box;\" /></span></li>\r\n<li><span style=\"box-sizing: border-box;\" data-sheets-value=\"{\" data-sheets-userformat=\"{\">Potentiom&egrave;tre Mod pour s&eacute;lectionner et m&eacute;langer les timbres<br style=\"box-sizing: border-box;\" /></span></li>\r\n<li><span style=\"box-sizing: border-box;\" data-sheets-value=\"{\" data-sheets-userformat=\"{\">Syst&egrave;me SIRS (Stringed Instrument Resonance System) Brevet&eacute;<br style=\"box-sizing: border-box;\" /></span></li>\r\n<li><span style=\"box-sizing: border-box;\" data-sheets-value=\"{\" data-sheets-userformat=\"{\">Trois syst&egrave;mes de micros : Piezo Fishman sous le Chevalet ; Fishman Acoustasonic Enhancer ; micro &eacute;lectromagn&eacute;tique Fender Acoustasonic Noiseless&trade;</span></li>\r\n</ul>', '<p style=\"text-align: justify;\"><span style=\"color: #212529; font-family: SourceSansPro, Helvetica, Arial, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">L&rsquo;American Acoustasonic&trade; Stratocaster&reg; continue d&rsquo;incarner l&rsquo;esprit r&eacute;solument tourn&eacute; vers l&rsquo;innovation qui nourrit la cr&eacute;ation des guitares Fender. La puissance de l&rsquo;Acoustic Engine con&ccedil;u par Fender et Fishman&reg; est indubitablement un moteur d&rsquo;inspiration. Des sons acoustiques m&eacute;tamorphes aux variations rythmiques &eacute;lectriques, cette guitare particuli&egrave;rement polyvalente ouvre une nouvelle voie sonore.</span></p>', '2021-10-05 14:49:22', '2021-10-05 16:49:22'),
(40, 3, 14, 'Roland', 'GO:KEYS', '12368157_800.jpg', 255.55, 9, '<ul>\r\n<li><span style=\"box-sizing: border-box;\">Nombre de touches </span><span class=\"fx-text fx-text--bold fx-text--no-margin\" style=\"box-sizing: border-box; line-height: 24px; letter-spacing: -0.26px; font-weight: bold; margin: 0px;\">61</span></li>\r\n<li><span style=\"box-sizing: border-box;\">Touches lumineuses </span><span class=\"fx-text fx-text--bold fx-text--no-margin\" style=\"box-sizing: border-box; line-height: 24px; letter-spacing: -0.26px; font-weight: bold; margin: 0px;\">Non</span></li>\r\n<li><span style=\"box-sizing: border-box;\">Sensible &agrave; la v&eacute;locit&eacute; </span><span class=\"fx-text fx-text--bold fx-text--no-margin\" style=\"box-sizing: border-box; line-height: 24px; letter-spacing: -0.26px; font-weight: bold; margin: 0px;\">Oui</span></li>\r\n<li><span style=\"box-sizing: border-box;\">Aftertouch</span><span class=\"fx-text fx-text--bold fx-text--no-margin\" style=\"box-sizing: border-box; line-height: 24px; letter-spacing: -0.26px; font-weight: bold; margin: 0px;\">Non</span></li>\r\n<li><span style=\"box-sizing: border-box;\">M&eacute;dia de sauvegarde </span><span class=\"fx-text fx-text--bold fx-text--no-margin\" style=\"box-sizing: border-box; line-height: 24px; letter-spacing: -0.26px; font-weight: bold; margin: 0px;\">Aucun</span></li>\r\n<li><span style=\"box-sizing: border-box;\">Affichage des paroles </span><span class=\"fx-text fx-text--bold fx-text--no-margin\" style=\"box-sizing: border-box; line-height: 24px; letter-spacing: -0.26px; font-weight: bold; margin: 0px;\">Non</span></li>\r\n<li><span style=\"box-sizing: border-box;\">Affichage de la partition </span><span class=\"fx-text fx-text--bold fx-text--no-margin\" style=\"box-sizing: border-box; line-height: 24px; letter-spacing: -0.26px; font-weight: bold; margin: 0px;\">Non</span></li>\r\n<li><span style=\"box-sizing: border-box;\">Harmonie vocale </span><span class=\"fx-text fx-text--bold fx-text--no-margin\" style=\"box-sizing: border-box; line-height: 24px; letter-spacing: -0.26px; font-weight: bold; margin: 0px;\">Non</span></li>\r\n<li><span style=\"box-sizing: border-box;\">Enregistreur audio USB</span><span class=\"fx-text fx-text--bold fx-text--no-margin\" style=\"box-sizing: border-box; line-height: 24px; letter-spacing: -0.26px; font-weight: bold; margin: 0px;\">Non</span></li>\r\n<li><span style=\"box-sizing: border-box;\">Interface MIDI </span><span class=\"fx-text fx-text--bold fx-text--no-margin\" style=\"box-sizing: border-box; line-height: 24px; letter-spacing: -0.26px; font-weight: bold; margin: 0px;\">Aucune</span></li>\r\n<li><span style=\"box-sizing: border-box;\">Entr&eacute;e microphone </span><span class=\"fx-text fx-text--bold fx-text--no-margin\" style=\"box-sizing: border-box; line-height: 24px; letter-spacing: -0.26px; font-weight: bold; margin: 0px;\">Non</span></li>\r\n<li><span style=\"box-sizing: border-box;\">Port USB </span><span class=\"fx-text fx-text--bold fx-text--no-margin\" style=\"box-sizing: border-box; line-height: 24px; letter-spacing: -0.26px; font-weight: bold; margin: 0px;\">Oui</span></li>\r\n</ul>', '<ul>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">61 touches Ivory Feel et boutons en forme de boite sensible &agrave; la v&eacute;locit&eacute;</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">Polyphonie 128 voix</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">Bluetooth 4.2</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">Format MIDI conforme GM2</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">Plus de 500 sons</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">Multi effets / Chorus / Reverb</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">Fonction de transposition</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">Plus de 12 boucles</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">Plus de 672 motifs (12 sets x 56 motifs)</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">10 Pads de performance</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">Fonctions Bender: Pitch Bend et effet de modulation: Roll / Filter</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">Enregistreur: format de fichier MIDI standard 0</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">Affichage LCD</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">2 haut-parleurs de 2,5 Watt chacun</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">Fonctionnement sur batterie possible</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">Dimensions: 877 x 271 x 82 mm</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">Connexions: sorties jack, entr&eacute;e auxiliaire, p&eacute;dale, port USB h&ocirc;te</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">Poids sans alimentation: 3,9 kg</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">Bloc d\'alimentation PSD-230 EU incl.</span></li>\r\n</ul>', '2021-10-13 08:49:26', '2021-10-13 13:55:15');

-- --------------------------------------------------------

--
-- Structure de la table `subcat`
--

CREATE TABLE `subcat` (
  `subcat_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `subcat_name` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `subcat`
--

INSERT INTO `subcat` (`subcat_id`, `cat_id`, `subcat_name`) VALUES
(1, 1, 'Guitares Electriques'),
(2, 1, 'Guitares Classiques'),
(3, 1, 'Guitares Acoustiques & Electro-Acoustiques'),
(4, 1, 'Basses Electriques'),
(5, 1, 'Basses Acoustiques'),
(6, 1, 'Basses Semi-Acoustiques'),
(7, 1, 'Ukulélés'),
(8, 1, 'Autres instruments à cordes pincées'),
(9, 8, 'Câbles'),
(10, 8, 'Pieds & Supports'),
(11, 2, 'Acoustiques'),
(12, 2, 'Electroniques'),
(13, 2, 'Percussions'),
(14, 3, 'Arrangeurs'),
(15, 3, 'Maîtres'),
(16, 3, 'Pianos de Scène'),
(17, 4, 'Interfaces Audio'),
(18, 4, 'Microphones'),
(19, 4, 'Casques'),
(20, 5, 'Tables de Mixage'),
(21, 5, 'Systèmes sans Fil'),
(22, 5, 'Connectique'),
(23, 6, 'Contrôleurs DJ'),
(24, 6, 'Platines Vinyles'),
(25, 6, 'Tables/Meubles DJ'),
(26, 7, 'Flight Cases'),
(27, 7, 'Housses & Etuis'),
(28, 7, 'Système de Transport'),
(29, 8, 'Sièges & Tabourets'),
(30, 13, 'Projecteurs'),
(31, 13, 'Machines à Fumée'),
(32, 13, 'Lasers');

-- --------------------------------------------------------

--
-- Structure de la table `suppliers`
--

CREATE TABLE `suppliers` (
  `sup_id` int(11) NOT NULL,
  `sup_type` varchar(50) NOT NULL,
  `sup_name` varchar(200) NOT NULL,
  `sup_surname` varchar(50) NOT NULL,
  `sup_adresse` int(200) NOT NULL,
  `sup_zipcode` varchar(5) NOT NULL,
  `sup_city` varchar(50) NOT NULL,
  `count_id` int(11) NOT NULL,
  `prod_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `cat`
--
ALTER TABLE `cat`
  ADD PRIMARY KEY (`cat_id`);

--
-- Index pour la table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`client_id`),
  ADD UNIQUE KEY `client_email` (`client_email`),
  ADD KEY `count_id` (`count_id`);

--
-- Index pour la table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`count_id`);

--
-- Index pour la table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`emp_id`),
  ADD KEY `count_id` (`count_id`);

--
-- Index pour la table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `client_id` (`client_id`);

--
-- Index pour la table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`order_details_id`),
  ADD KEY `ord_id` (`order_id`);

--
-- Index pour la table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`prod_id`),
  ADD KEY `prod_cat_id` (`prod_subcat_id`),
  ADD KEY `prod_cat_id_2` (`prod_cat_id`);

--
-- Index pour la table `subcat`
--
ALTER TABLE `subcat`
  ADD PRIMARY KEY (`subcat_id`),
  ADD KEY `souscat_cat_id` (`cat_id`);

--
-- Index pour la table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`sup_id`),
  ADD KEY `count_id` (`count_id`),
  ADD KEY `prod_id` (`prod_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `cat`
--
ALTER TABLE `cat`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `clients`
--
ALTER TABLE `clients`
  MODIFY `client_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT pour la table `countries`
--
ALTER TABLE `countries`
  MODIFY `count_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `employees`
--
ALTER TABLE `employees`
  MODIFY `emp_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `order_details_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `products`
--
ALTER TABLE `products`
  MODIFY `prod_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT pour la table `subcat`
--
ALTER TABLE `subcat`
  MODIFY `subcat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT pour la table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `sup_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `clients_ibfk_1` FOREIGN KEY (`count_id`) REFERENCES `countries` (`count_id`);

--
-- Contraintes pour la table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`count_id`) REFERENCES `countries` (`count_id`);

--
-- Contraintes pour la table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`client_id`);

--
-- Contraintes pour la table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`prod_id`) REFERENCES `products` (`prod_id`),
  ADD CONSTRAINT `order_details_ibfk_3` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);

--
-- Contraintes pour la table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`prod_subcat_id`) REFERENCES `subcat` (`subcat_id`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`prod_cat_id`) REFERENCES `cat` (`cat_id`);

--
-- Contraintes pour la table `subcat`
--
ALTER TABLE `subcat`
  ADD CONSTRAINT `subcat_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `cat` (`cat_id`);

--
-- Contraintes pour la table `suppliers`
--
ALTER TABLE `suppliers`
  ADD CONSTRAINT `suppliers_ibfk_1` FOREIGN KEY (`count_id`) REFERENCES `countries` (`count_id`),
  ADD CONSTRAINT `suppliers_ibfk_2` FOREIGN KEY (`prod_id`) REFERENCES `products` (`prod_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
