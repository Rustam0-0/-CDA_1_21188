-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : mar. 21 déc. 2021 à 14:16
-- Version du serveur :  10.3.32-MariaDB-0ubuntu0.20.04.1
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
  `client_address` varchar(200) NOT NULL,
  `client_address_complete` varchar(200) DEFAULT NULL,
  `client_zipcode` varchar(15) NOT NULL,
  `client_tel` varchar(15) DEFAULT NULL,
  `client_city` varchar(50) NOT NULL,
  `client_email` varchar(50) NOT NULL,
  `client_password` varchar(255) NOT NULL,
  `client_date_add` datetime NOT NULL DEFAULT current_timestamp(),
  `count_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `clients`
--

INSERT INTO `clients` (`client_id`, `client_type`, `client_name`, `client_surname`, `client_address`, `client_address_complete`, `client_zipcode`, `client_tel`, `client_city`, `client_email`, `client_password`, `client_date_add`, `count_id`) VALUES
(10, 1, 'Alice', 'toto0103', '78 avenue de Jules Verne', '', '59666', '', 'Aras', '78787@huhg.com', '$2y$10$4pn4fIuMjLqyNrdgQu6pCuvkD6EPte6cKhpotM0/CQfMffRrQOE/O', '2021-09-30 10:07:51', 1),
(11, 1, 'White', 'John', '30 rue Poulanvile', '', '80000', '', 'Amiens', 'afpa@gmail.com', '$2y$10$RyF3WTXBTuvWckijGHz1VONvmx7GKlc60PyOMloS3rPkqUVXEf59G', '2021-09-30 10:07:51', 1),
(21, 1, 'Boss', 'Main', '777 Avenue du Générale', '', '80000', '', 'Amiens', 'admin@gmail.com', '$2y$10$LT29V6mdNd/PVZtPmLeMHu3pVyAGIZNDfMjrEXYWNzQ7HNgnkxqyS', '2021-09-30 10:07:51', 1),
(22, 1, 'Van Damme', 'Jean-Claude', '3 Avenue Pierre 1er de Serbie', 'chez AAC AGENCE ARTISTIQUE', '75116', '', 'PARIS', 'jcvd@gmail.com', '$2y$10$t23v7Fj22BihoMtsHXpKhuP8idjBZFZFdyLlkLgtEZjM8T4Q9yFky', '2021-10-19 16:40:41', 1),
(33, 0, 'Bernard', 'Warren', '8963 Arcu. Road', NULL, '381061', '06 47 02 43 72', 'Chagai', 'enim.nunc@hotmail.edu', '*00A51F3F48415C7D4E8908980D443C29C69B60C9', '2021-08-30 03:44:04', 3),
(34, 0, 'Tallulah', 'Daniels', '422-6924 Aliquet Road', NULL, '16833-15795', '05 44 72 52 18', 'Tintigny', 'arcu.sed@protonmail.com', '12345', '2021-01-19 12:26:54', 4),
(35, 0, 'Emma', 'Walls', '3456 Semper Avenue', NULL, '18237', '08 75 47 17 86', 'Camarones', 'quis.diam@outlook.couk', '12345', '2021-06-14 06:49:54', 4),
(36, 1, 'Astra', 'Michael', 'P.O. Box 387, 5138 Id Road', NULL, '235865', '03 68 91 59 42', 'New Galloway', 'felis.ullamcorper.viverra@google.com', '12345', '2021-07-24 00:21:54', 7),
(37, 1, 'Ruth', 'Camacho', 'P.O. Box 950, 2185 Augue. Ave', NULL, '274731', '06 58 29 41 66', 'Kapfenberg', 'sit.amet@yahoo.com', '12345', '2021-11-14 17:31:51', 8),
(38, 0, 'Hanna', 'Greene', 'Ap #981-9207 Ullamcorper. St.', NULL, '38236', '06 34 10 79 75', 'Lanark County', 'sem.ut@google.couk', '12345', '2021-05-22 19:27:15', 3),
(39, 1, 'Urielle', 'Finley', 'Ap #304-8244 Pede Av.', NULL, '06831', '04 32 73 67 54', 'Innsbruck', 'eget.varius.ultrices@protonmail.edu', '12345', '2021-07-07 23:13:35', 4),
(40, 1, 'Jorden', 'Larson', '932-3599 Eu Avenue', NULL, '06647', '03 71 02 52 35', 'Chełm', 'hendrerit@protonmail.couk', '12345', '2022-03-29 00:27:15', 3),
(41, 0, 'Julian', 'Nelson', '107 Phasellus Av.', NULL, '52370', '05 52 60 56 23', 'Dudley', 'est.vitae.sodales@outlook.edu', '12345', '2021-08-17 08:56:20', 4),
(42, 0, 'Lisandra', 'Mcdowell', '882-3104 Luctus Road', NULL, 'E7E 4W4', '04 88 87 63 27', 'Te Awamutu', 'mauris.vestibulum@outlook.ca', '12345', '2022-06-30 23:50:51', 9);

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
  `emp_zipcode` varchar(10) DEFAULT NULL,
  `emp_city` varchar(50) NOT NULL,
  `emp_email` varchar(50) DEFAULT NULL,
  `emp_tel` varchar(15) DEFAULT NULL,
  `count_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `employees`
--

INSERT INTO `employees` (`emp_id`, `emp_name`, `emp_surname`, `emp_adress`, `emp_zipcode`, `emp_city`, `emp_email`, `emp_tel`, `count_id`) VALUES
(1, 'Baxter', 'Harrison', '553-5083 Sed Rd.', '64451', 'Hamburg', 'penatibus.et@aol.org', '03 73 81 96 56', 10),
(2, 'Dana', 'Giles', '700-7372 Arcu. Av.', '30115', 'Konin', 'cras@protonmail.com', '08 36 51 69 78', 4),
(3, 'Audra', 'Stone', 'Ap #797-5981 Vitae Ave', '253444', 'Jaén', 'sit.amet.orci@icloud.net', '02 51 88 97 63', 9),
(4, 'Jerry', 'Mcdaniel', '8944 Adipiscing Rd.', 'J5 1GD', 'Vienna', 'blandit@aol.com', '03 51 11 41 27', 6),
(5, 'Lacota', 'Langley', '268-4617 Praesent St.', '22842', 'Abeokuta', 'ipsum@google.couk', '07 11 76 40 54', 5),
(6, 'Rajah', 'Molina', '738-2370 Elit, Ave', '41284', 'Emden', 'elit.elit@protonmail.couk', '08 21 14 97 32', 1),
(7, 'Aquila', 'Trujillo', 'Ap #387-5831 Non Road', '51575', 'Sepino', 'ligula@aol.couk', '05 87 26 85 04', 8),
(8, 'Selma', 'Morgan', 'P.O. Box 404, 1237 Morbi Av.', '411427', 'Heerhugowaard', 'luctus@icloud.org', '02 22 51 21 61', 6),
(9, 'Guy', 'Pugh', 'P.O. Box 890, 5918 Sapien Avenue', '39792', 'Ceuta', 'curabitur.dictum@icloud.couk', '04 49 01 33 89', 6),
(10, 'Rajah', 'Powell', '822-763 Leo. Road', '167175', 'Ludvika', 'amet.metus.aliquam@icloud.couk', '06 26 15 31 86', 9);

-- --------------------------------------------------------

--
-- Structure de la table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `order_date` datetime NOT NULL DEFAULT current_timestamp(),
  `date_factur` datetime DEFAULT NULL,
  `date_pay` datetime DEFAULT NULL,
  `date_send` datetime DEFAULT NULL,
  `date_receive` datetime DEFAULT NULL,
  `order_status` varchar(50) NOT NULL,
  `ship_name` varchar(50) NOT NULL,
  `ship_surname` varchar(50) NOT NULL,
  `ship_address` varchar(200) NOT NULL,
  `ship_city` varchar(50) NOT NULL,
  `ship_zipcode` varchar(15) NOT NULL,
  `ship_country` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `orders`
--

INSERT INTO `orders` (`order_id`, `client_id`, `emp_id`, `order_date`, `date_factur`, `date_pay`, `date_send`, `date_receive`, `order_status`, `ship_name`, `ship_surname`, `ship_address`, `ship_city`, `ship_zipcode`, `ship_country`) VALUES
(1, 36, 3, '2021-06-03 12:41:41', '2021-10-09 08:58:21', '2021-10-11 05:16:32', '2021-10-07 06:19:05', '2021-02-16 02:21:14', 'en cours de préparation', 'Georgia', 'Singleton', 'Ap #860-9679 Dui. Rd.', 'Waiheke Island', '777208', '4'),
(2, 41, 4, '2022-01-11 18:39:43', '2021-04-11 07:21:28', '2021-05-17 16:18:53', '2021-10-02 02:41:30', '2021-07-01 09:31:54', 'en cours de préparation', 'Shaeleigh', 'Puckett', 'Ap #622-7894 Enim. Avenue', 'Chitral', '38576', '5'),
(3, 34, 10, '2021-04-19 22:51:05', '2021-06-18 05:46:04', '2022-02-15 02:23:19', '2021-08-16 09:18:50', '2022-01-14 17:10:27', 'en cours de préparation', 'Riley', 'Marks', 'P.O. Box 973, 6170 Sem. St.', 'Wałbrzych', 'Y3B 6Y4', '1'),
(4, 36, 8, '2021-05-18 13:41:00', '2021-04-12 05:55:45', '2021-03-11 18:16:06', '2021-05-06 01:02:32', '2021-01-25 06:51:23', 'en cours de préparation', 'Julie', 'Guerrero', 'Ap #815-924 Aliquet Road', 'Cañas', '87697', '3'),
(5, 39, 3, '2022-03-16 03:07:33', '2021-05-18 21:07:18', '2021-06-03 05:27:55', '2022-01-25 20:00:46', '2021-07-19 10:11:13', 'livré', 'Victor', 'Conway', 'P.O. Box 590, 3384 Mollis. Road', 'Voronezh', '4783', '2'),
(6, 37, 7, '2022-01-15 21:32:15', '2022-03-30 14:15:05', '2021-08-08 22:32:49', '2022-03-03 17:08:48', '2021-06-08 04:51:26', 'livré', 'Oliver', 'Carter', '476-6659 Dictum Road', 'Qinghai', '54134', '7'),
(7, 33, 2, '2021-09-17 23:09:44', '2021-01-02 03:31:47', '2021-09-26 17:30:31', '2021-08-23 05:30:00', '2021-10-28 02:34:23', 'envoyé', 'Abra', 'Fox', 'P.O. Box 358, 4578 Malesuada Street', 'Sioux City', '93866', '3'),
(8, 35, 3, '2021-04-19 07:07:02', '2022-02-13 18:55:07', '2021-12-18 14:27:44', '2021-09-16 10:20:39', '2022-03-17 15:50:56', 'livré', 'Phillip', 'Jacobson', 'P.O. Box 324, 6248 Convallis Rd.', 'Lleida', '61122', '5'),
(9, 41, 8, '2021-09-04 01:50:20', '2021-09-09 09:14:02', '2021-09-13 03:46:29', '2021-05-25 06:07:04', '2021-10-14 05:35:42', 'envoyé', 'Karly', 'Vega', 'Ap #305-1921 Curabitur Av.', 'Palma de Mallorca', '25412', '4'),
(10, 36, 2, '2021-02-10 05:24:39', '2021-03-22 02:15:54', '2021-02-22 23:10:06', '2022-03-13 22:08:33', '2021-04-07 22:31:25', 'livré', 'Brody', 'Gilmore', '727-131 Enim Rd.', 'Istanbul', '73752', '3'),
(11, 36, 3, '2021-06-03 12:41:41', '2021-10-09 08:58:21', '2021-10-11 05:16:32', '2021-10-07 06:19:05', '2021-02-16 02:21:14', 'en cours de préparation', 'Georgia', 'Singleton', 'Ap #860-9679 Dui. Rd.', 'Waiheke Island', '777208', '4'),
(12, 41, 4, '2022-01-11 18:39:43', '2021-04-11 07:21:28', '2021-05-17 16:18:53', '2021-10-02 02:41:30', '2021-07-01 09:31:54', 'en cours de préparation', 'Shaeleigh', 'Puckett', 'Ap #622-7894 Enim. Avenue', 'Chitral', '38576', '5'),
(13, 34, 10, '2021-04-19 22:51:05', '2021-06-18 05:46:04', '2022-02-15 02:23:19', '2021-08-16 09:18:50', '2022-01-14 17:10:27', 'en cours de préparation', 'Riley', 'Marks', 'P.O. Box 973, 6170 Sem. St.', 'Wałbrzych', 'Y3B 6Y4', '1'),
(14, 36, 8, '2021-05-18 13:41:00', '2021-04-12 05:55:45', '2021-03-11 18:16:06', '2021-05-06 01:02:32', '2021-01-25 06:51:23', 'en cours de préparation', 'Julie', 'Guerrero', 'Ap #815-924 Aliquet Road', 'Cañas', '87697', '3'),
(15, 39, 3, '2022-03-16 03:07:33', '2021-05-18 21:07:18', '2021-06-03 05:27:55', '2022-01-25 20:00:46', '2021-07-19 10:11:13', 'livré', 'Victor', 'Conway', 'P.O. Box 590, 3384 Mollis. Road', 'Voronezh', '4783', '2'),
(16, 37, 7, '2022-01-15 21:32:15', '2022-03-30 14:15:05', '2021-08-08 22:32:49', '2022-03-03 17:08:48', '2021-06-08 04:51:26', 'livré', 'Oliver', 'Carter', '476-6659 Dictum Road', 'Qinghai', '54134', '7'),
(17, 33, 2, '2021-09-17 23:09:44', '2021-01-02 03:31:47', '2021-09-26 17:30:31', '2021-08-23 05:30:00', '2021-10-28 02:34:23', 'envoyé', 'Abra', 'Fox', 'P.O. Box 358, 4578 Malesuada Street', 'Sioux City', '93866', '3'),
(18, 35, 3, '2021-04-19 07:07:02', '2022-02-13 18:55:07', '2021-12-18 14:27:44', '2021-09-16 10:20:39', '2022-03-17 15:50:56', 'livré', 'Phillip', 'Jacobson', 'P.O. Box 324, 6248 Convallis Rd.', 'Lleida', '61122', '5'),
(19, 41, 8, '2021-09-04 01:50:20', '2021-09-09 09:14:02', '2021-09-13 03:46:29', '2021-05-25 06:07:04', '2021-10-14 05:35:42', 'envoyé', 'Karly', 'Vega', 'Ap #305-1921 Curabitur Av.', 'Palma de Mallorca', '25412', '4'),
(20, 36, 2, '2021-02-10 05:24:39', '2021-03-22 02:15:54', '2021-02-22 23:10:06', '2022-03-13 22:08:33', '2021-04-07 22:31:25', 'livré', 'Brody', 'Gilmore', '727-131 Enim Rd.', 'Istanbul', '73752', '3'),
(21, 35, 6, '2022-03-22 22:15:29', '2021-09-04 02:58:30', '2021-09-18 21:37:46', '2021-04-21 00:57:38', '2021-11-03 22:12:12', 'en cours de préparation', 'Laurel', 'Hopper', '461-1043 Nec Avenue', 'Bairnsdale', '46085', '8'),
(22, 37, 9, '2021-12-26 03:03:19', '2021-07-16 01:41:54', '2021-12-08 05:54:41', '2021-10-09 06:27:45', '2021-12-09 19:33:24', 'livré', 'Abdul', 'Olson', 'Ap #984-216 Massa Road', 'Stirling', '485552', '7'),
(23, 39, 6, '2021-12-25 19:12:39', '2021-11-02 10:28:59', '2022-01-05 22:44:50', '2021-11-05 17:11:48', '2022-01-04 06:20:33', 'livré', 'Naomi', 'Jimenez', 'P.O. Box 418, 6197 Eget, Ave', 'Cañas', '296943', '2'),
(24, 34, 8, '2021-01-20 11:40:51', '2021-08-10 13:22:01', '2021-09-27 14:20:04', '2021-03-25 20:02:22', '2021-12-08 15:33:43', 'envoyé', 'Kaye', 'Terry', '775-9459 Eu, Street', 'San Francisco', '4737', '8'),
(25, 42, 3, '2022-02-04 02:10:09', '2022-04-15 00:39:08', '2022-02-15 14:50:56', '2021-11-20 12:25:25', '2021-05-23 16:33:47', 'en cours de préparation', 'Todd', 'Alston', 'Ap #159-9748 Dictum Avenue', 'Beijing', '83840', '2'),
(26, 38, 2, '2021-04-09 18:43:27', '2021-12-28 21:03:03', '2021-09-08 19:28:41', '2021-08-07 17:14:04', '2021-01-24 05:21:03', 'envoyé', 'Gregory', 'Nash', 'Ap #980-3393 Magna Road', 'Đà Nẵng', '211511', '3'),
(27, 37, 3, '2021-09-23 23:05:10', '2022-03-05 20:58:56', '2022-02-03 00:12:46', '2021-12-12 04:55:51', '2020-12-23 03:56:15', 'livré', 'Whilemina', 'Maxwell', '443-8292 Ipsum Avenue', 'Hofors', '3167', '2'),
(28, 36, 8, '2021-08-26 22:41:47', '2021-06-15 22:58:40', '2021-10-25 17:50:25', '2021-10-20 16:09:37', '2021-10-16 16:25:19', 'envoyé', 'Allistair', 'Huffman', '666-9871 Malesuada Rd.', 'Wageningen', '623483', '3'),
(29, 33, 5, '2021-07-17 14:20:22', '2021-12-13 04:21:32', '2022-02-01 10:54:11', '2021-03-12 03:48:28', '2022-02-11 15:08:20', 'envoyé', 'Alexandra', 'Shaw', 'Ap #753-5409 Phasellus Rd.', 'Vänersborg', '78841', '2'),
(30, 35, 5, '2022-03-20 23:13:05', '2022-03-17 09:22:12', '2021-04-06 14:03:55', '2022-03-03 21:21:40', '2021-03-16 15:16:02', 'livré', 'Felix', 'Mcmillan', 'Ap #124-8204 Eu Av.', 'Kaliningrad', '63-741', '3'),
(31, 33, 9, '2021-03-05 05:34:39', '2022-04-16 11:14:06', '2021-03-31 02:50:45', '2022-03-28 23:05:07', '2020-12-21 06:21:33', 'en cours de préparation', 'Denton', 'Marquez', 'Ap #289-8828 Sit Ave', 'Boneffe', '66585', '8'),
(32, 37, 10, '2021-01-07 15:38:17', '2021-02-13 07:28:22', '2021-02-17 13:41:00', '2021-01-17 12:00:05', '2022-01-02 12:18:51', 'envoyé', 'Colton', 'Alston', 'Ap #891-9374 Purus St.', 'Novosibirsk', '207912', '7'),
(33, 40, 9, '2021-05-11 03:11:07', '2022-02-05 12:58:45', '2021-03-04 11:33:31', '2020-12-22 20:20:14', '2021-09-25 18:13:49', 'livré', 'Lee', 'Douglas', 'Ap #608-4727 Tempus St.', 'Barchi', '9465', '4'),
(34, 37, 4, '2021-08-30 15:47:18', '2020-12-26 21:13:49', '2021-12-22 07:54:41', '2021-03-10 10:04:13', '2021-06-25 07:13:52', 'livré', 'Kadeem', 'Tate', '630-1150 Pellentesque Rd.', 'Bayreuth', '91-423', '3'),
(35, 39, 3, '2021-11-04 14:59:12', '2022-03-31 16:44:18', '2022-02-19 22:53:27', '2021-04-30 09:15:30', '2021-03-09 23:34:05', 'livré', 'Patrick', 'Blackwell', '1929 Egestas St.', 'Tarakan', '78254', '10'),
(36, 41, 8, '2021-03-30 23:47:44', '2021-05-25 11:48:55', '2021-08-21 01:08:57', '2021-08-30 23:16:13', '2021-02-04 18:48:30', 'livré', 'Armando', 'Larson', '688-3341 Nec, Rd.', 'Tibet', '0188 DT', '3'),
(37, 34, 5, '2021-08-24 10:26:09', '2021-01-13 08:52:07', '2021-03-17 01:18:16', '2021-04-10 16:00:36', '2021-09-08 00:25:32', 'en cours de préparation', 'Jocelyn', 'Mullen', 'Ap #748-2729 Consequat Ave', 'Morpeth', '43651', '6'),
(38, 33, 4, '2021-04-30 22:09:40', '2022-01-07 20:06:52', '2021-05-12 22:51:18', '2022-03-27 06:57:48', '2021-04-26 18:37:39', 'livré', 'Flynn', 'Langley', '102-7240 Erat St.', 'Bloxham', '87257', '9'),
(39, 35, 4, '2021-01-24 09:06:27', '2021-04-03 11:28:22', '2021-05-29 16:25:26', '2022-01-30 21:14:31', '2022-01-21 19:35:58', 'en cours de préparation', 'Duncan', 'Donaldson', 'Ap #889-313 Tellus. Avenue', 'Szczecin', 'JH8R 9NW', '2'),
(40, 34, 10, '2022-03-18 08:17:18', '2021-07-19 21:39:40', '2021-03-06 19:19:42', '2021-08-16 12:59:49', '2022-03-09 01:55:17', 'livré', 'McKenzie', 'Stevenson', '269-1982 Sollicitudin Street', 'Nazilli', '984739', '7'),
(41, 35, 7, '2022-03-03 06:54:50', '2021-01-01 15:20:04', '2021-05-26 12:30:15', '2021-09-30 04:27:30', '2021-05-23 00:17:00', 'envoyé', 'Nola', 'Stanley', '9511 Orci. Ave', 'Puntarenas', '4275', '10'),
(42, 38, 6, '2022-03-17 11:02:03', '2021-02-26 03:22:02', '2021-12-21 03:57:53', '2021-10-13 02:51:46', '2021-08-08 08:03:57', 'en cours de préparation', 'Maryam', 'Howell', 'P.O. Box 720, 1069 Parturient Avenue', 'La Dorada', '2606', '7'),
(43, 41, 9, '2021-09-11 17:47:18', '2020-12-21 14:55:32', '2021-03-11 01:50:00', '2021-04-16 02:59:08', '2022-02-26 23:07:10', 'livré', 'Aline', 'Horton', '230-2642 Leo. Road', 'Hà Tĩnh', '8133', '5'),
(44, 36, 4, '2021-03-27 14:46:38', '2021-08-08 22:35:09', '2022-02-13 22:27:28', '2021-10-19 02:27:28', '2021-08-17 21:07:27', 'en cours de préparation', 'Mara', 'Barrera', '417-796 Eu Av.', 'Altach', '24273', '5'),
(45, 41, 3, '2021-11-23 13:30:27', '2022-03-01 05:07:50', '2021-10-19 11:16:49', '2022-02-21 20:05:30', '2021-03-20 02:53:04', 'envoyé', 'Ezekiel', 'Beard', '281-4410 Sed St.', 'Olympia', '584468', '5'),
(46, 34, 9, '2021-09-05 14:14:28', '2021-05-29 23:25:28', '2021-09-05 07:38:16', '2021-10-27 19:49:39', '2021-10-11 17:50:39', 'envoyé', 'Astra', 'Oneal', 'Ap #977-9031 Eu Av.', 'Gimcheon', '49974', '4'),
(47, 36, 7, '2021-01-06 11:34:34', '2021-02-17 12:03:31', '2021-05-05 18:57:01', '2021-09-02 03:17:46', '2021-08-01 02:03:51', 'envoyé', 'Ralph', 'Potter', 'Ap #246-5226 Semper Ave', 'Lorient', '41407', '7'),
(48, 41, 4, '2021-04-30 08:58:33', '2021-05-18 07:09:45', '2021-06-10 15:06:07', '2021-04-14 19:36:39', '2022-01-27 16:52:22', 'envoyé', 'Hollee', 'Moreno', '3072 A Av.', 'Telfs', '97433-017', '1'),
(49, 42, 3, '2021-04-09 20:47:00', '2021-02-11 09:44:42', '2021-06-15 04:06:31', '2021-01-27 14:05:43', '2021-05-31 20:47:31', 'envoyé', 'Regan', 'Barnett', '986-5733 Vitae Rd.', 'Şereflikoçhisar', '119867', '7'),
(50, 37, 2, '2022-02-25 02:31:23', '2021-02-24 01:57:51', '2021-03-11 08:57:27', '2021-03-29 08:18:15', '2022-03-31 11:14:35', 'envoyé', 'Meghan', 'Acevedo', '957-4219 A St.', 'Bremerhaven', '51-238', '3'),
(51, 42, 6, '2021-04-06 04:35:41', '2021-09-01 06:15:17', '2022-02-24 16:27:51', '2021-03-12 02:11:49', '2021-10-13 20:03:42', 'en cours de préparation', 'Dennis', 'Kelly', '993-1173 Ligula. St.', 'Roksem', '67-531', '2'),
(52, 38, 8, '2021-11-27 18:01:28', '2021-03-09 20:22:38', '2021-08-15 20:42:56', '2022-02-25 00:34:32', '2022-02-21 02:32:55', 'livré', 'Benedict', 'Valenzuela', '882-4277 Eu Rd.', 'Pachuca', '32121', '5'),
(53, 38, 4, '2021-01-20 05:50:28', '2021-08-04 05:49:11', '2021-02-15 08:15:27', '2021-07-02 22:12:04', '2021-03-29 09:26:19', 'en cours de préparation', 'Eric', 'Faulkner', '347-9816 Euismod Rd.', 'Radom', '2695', '5'),
(54, 41, 6, '2021-07-07 04:42:30', '2021-09-17 08:16:39', '2021-06-29 13:40:01', '2021-08-03 08:45:23', '2021-11-16 00:02:35', 'envoyé', 'Shaeleigh', 'Mejia', 'Ap #409-239 Orci. Street', 'Lloydminster', '626101', '7'),
(55, 34, 10, '2021-02-13 00:10:18', '2020-12-29 08:51:08', '2022-03-20 23:33:40', '2022-02-03 04:06:33', '2021-06-27 14:02:39', 'livré', 'Hanna', 'Wilkinson', 'P.O. Box 199, 9715 Nonummy Ave', 'Birmingham', 'X24 7GB', '3'),
(56, 41, 7, '2021-09-11 07:43:54', '2021-09-15 13:34:16', '2021-07-31 18:59:26', '2021-10-11 04:08:23', '2021-10-07 05:31:51', 'envoyé', 'Yolanda', 'Romero', '293 Morbi Rd.', 'Szczecin', '9412', '6'),
(57, 34, 5, '2021-01-22 09:13:36', '2021-05-24 08:08:05', '2021-08-07 23:06:12', '2021-12-08 03:20:07', '2021-09-12 23:05:24', 'en cours de préparation', 'Adrienne', 'Kennedy', 'P.O. Box 743, 7207 Nec, Rd.', 'Pohang', '13385', '5'),
(58, 41, 9, '2021-10-07 09:09:45', '2021-03-31 22:55:48', '2021-01-14 19:42:44', '2022-03-30 01:18:21', '2021-04-30 22:09:43', 'envoyé', 'Dean', 'Calderon', 'P.O. Box 145, 5239 Felis Rd.', 'Cherbourg-Octeville', '634146', '4'),
(59, 39, 3, '2021-01-22 13:29:09', '2021-09-08 01:14:13', '2021-01-08 15:04:07', '2021-04-17 07:57:14', '2021-07-06 20:43:58', 'livré', 'Davis', 'Dunn', '496-7686 Egestas St.', 'Vaux-lez-Rosieres', '8490', '8'),
(60, 37, 2, '2021-10-24 17:03:20', '2022-03-19 10:19:37', '2021-09-08 05:21:34', '2021-06-26 18:26:52', '2021-09-13 20:22:51', 'envoyé', 'Keefe', 'Stanton', 'Ap #708-9568 Feugiat Rd.', 'Boo', '8883', '3'),
(61, 34, 2, '2021-05-20 06:19:50', '2021-04-03 05:39:21', '2021-10-08 15:26:52', '2021-11-06 10:28:25', '2022-02-09 19:54:00', 'envoyé', 'Emily', 'Berg', '831-1140 A, St.', 'Córdoba', '772442', '2'),
(62, 41, 5, '2022-02-03 23:00:45', '2021-10-09 23:35:02', '2021-11-08 00:13:58', '2021-08-19 23:15:36', '2021-01-25 10:23:43', 'en cours de préparation', 'Quentin', 'Gutierrez', '980-3924 Fusce Rd.', 'Polpenazze del Garda', '17647', '1'),
(63, 36, 6, '2021-06-04 19:32:54', '2021-09-26 17:28:01', '2021-11-29 15:22:58', '2021-10-09 05:46:01', '2021-12-27 09:58:19', 'envoyé', 'Dalton', 'Mendoza', '521-1212 Cras Rd.', 'Reynosa', '62553', '10'),
(64, 39, 8, '2021-03-13 03:09:47', '2021-05-25 00:47:06', '2021-02-15 21:05:11', '2020-12-26 23:47:21', '2021-10-03 07:50:47', 'en cours de préparation', 'Graiden', 'Juarez', 'Ap #237-6406 Viverra. Avenue', 'Nuevo Laredo', '718572', '5'),
(65, 37, 8, '2021-08-31 15:28:45', '2021-02-17 14:22:12', '2021-05-30 17:31:19', '2021-05-11 07:45:35', '2022-02-15 19:13:01', 'livré', 'Elmo', 'Garrison', '461-9182 Magna. Road', 'Palmerston', '99881', '3'),
(66, 42, 9, '2021-04-12 00:11:31', '2021-06-23 04:38:42', '2021-08-06 02:50:50', '2021-03-30 03:41:18', '2022-03-09 05:04:53', 'envoyé', 'Baker', 'Meyers', 'P.O. Box 898, 7405 Euismod Av.', 'Falmouth', '7243', '5'),
(67, 36, 3, '2021-08-22 12:54:09', '2021-10-28 09:21:41', '2021-10-28 11:33:39', '2021-01-20 21:34:28', '2021-06-16 04:24:37', 'livré', 'Orlando', 'Johns', '151-4865 Ac Rd.', 'Ceuta', '21422', '2'),
(68, 40, 3, '2021-08-11 08:01:43', '2021-05-24 19:05:21', '2021-03-28 20:47:37', '2021-10-30 10:02:54', '2021-07-31 11:20:25', 'en cours de préparation', 'Preston', 'Monroe', '648-4186 Donec Rd.', 'Muzzafarabad', '65828', '4'),
(69, 35, 3, '2021-12-10 00:41:47', '2021-07-04 19:41:09', '2021-04-05 18:28:52', '2021-10-02 22:41:21', '2021-04-24 14:32:04', 'envoyé', 'Dieter', 'Valencia', '696-9210 Mi. St.', 'Amsterdam', '8613', '5'),
(70, 39, 7, '2021-08-24 21:40:56', '2021-03-27 03:46:40', '2021-12-28 14:04:54', '2021-02-19 17:33:35', '2022-04-07 05:05:20', 'envoyé', 'Stephanie', 'Wallace', '286-1607 Nibh St.', 'Norrköping', '643922', '3'),
(71, 38, 6, '2021-01-26 01:19:01', '2021-11-14 16:21:34', '2022-01-10 17:58:56', '2021-02-10 16:27:56', '2022-04-10 10:35:54', 'livré', 'Selma', 'O\'brien', 'Ap #445-1209 Fermentum Street', 'Nizhny', '6978 OO', '5'),
(72, 33, 9, '2021-05-05 19:02:21', '2021-10-22 14:46:30', '2021-08-11 20:40:05', '2021-08-09 22:02:18', '2021-12-23 12:57:56', 'envoyé', 'Tate', 'Harmon', '513-4577 Non, Road', 'Alexandra', '25438', '8'),
(73, 41, 9, '2021-06-29 02:10:12', '2022-03-06 05:41:28', '2021-04-15 08:19:52', '2021-05-05 15:44:31', '2021-08-26 05:35:35', 'livré', 'Fulton', 'Leon', '6895 Enim. St.', 'Suruç', 'T0G 8C7', '10'),
(74, 37, 4, '2022-01-14 16:31:35', '2021-12-02 00:46:04', '2021-08-22 04:30:09', '2021-04-21 01:15:21', '2021-03-20 03:45:11', 'en cours de préparation', 'Stacey', 'Huber', '686-9035 Nec, St.', 'Nîmes', '20216', '3'),
(75, 38, 6, '2021-12-17 19:45:58', '2021-01-21 11:41:58', '2021-10-03 00:58:22', '2021-05-06 19:24:44', '2022-02-12 00:29:27', 'envoyé', 'Madeson', 'Wolfe', 'Ap #991-4794 Sed Road', 'Tranås', '46568', '2'),
(76, 39, 9, '2022-02-14 15:58:39', '2021-01-22 07:02:23', '2021-03-05 10:48:19', '2021-05-13 02:10:00', '2021-01-27 17:53:20', 'livré', 'Phillip', 'Bond', '160-8102 Sapien. St.', 'Camarones', 'R3Z 3M8', '3'),
(77, 39, 10, '2021-02-28 10:41:05', '2022-01-05 00:59:49', '2021-08-26 10:14:11', '2021-05-21 15:45:08', '2021-11-24 06:22:51', 'livré', 'Calista', 'Frank', 'Ap #842-4938 Scelerisque Street', 'Manokwari', '29598', '10'),
(78, 33, 3, '2021-01-02 04:01:04', '2022-03-28 18:01:55', '2021-02-10 23:09:32', '2021-07-16 18:34:28', '2022-03-29 01:33:02', 'envoyé', 'Wallace', 'Fischer', '104-4990 Mus. Rd.', 'GrivegnŽe', '272729', '5'),
(79, 34, 7, '2022-02-17 09:45:58', '2022-03-08 00:30:08', '2021-08-19 03:14:22', '2022-02-20 00:12:52', '2021-03-09 11:09:36', 'livré', 'Nelle', 'Dalton', '399-5367 Dolor. Street', 'Gore', '4761', '6'),
(80, 33, 5, '2021-09-28 00:47:54', '2021-05-12 18:55:54', '2021-03-17 15:02:42', '2022-03-25 02:10:17', '2020-12-25 06:01:05', 'livré', 'Kasper', 'Thornton', 'Ap #380-5910 Sagittis Avenue', 'Cuernavaca', '13245', '10'),
(81, 37, 4, '2021-07-22 00:50:36', '2021-03-31 07:27:51', '2021-01-08 00:45:39', '2021-09-28 14:11:57', '2021-10-05 22:01:33', 'livré', 'Eleanor', 'Whitehead', '390-963 Integer Rd.', 'Đà Nẵng', '28-375', '10'),
(82, 38, 2, '2021-10-24 07:30:51', '2021-10-07 12:06:45', '2021-01-04 10:12:37', '2021-02-08 05:11:41', '2022-02-28 03:42:57', 'envoyé', 'Sharon', 'Leblanc', 'Ap #330-8417 In Street', 'Hong Kong', '660828', '6'),
(83, 42, 5, '2021-07-22 19:40:29', '2021-03-23 08:03:48', '2021-04-19 17:08:40', '2021-10-29 20:53:00', '2021-12-28 20:34:26', 'livré', 'Joan', 'Ewing', '753-4865 Ut Ave', 'Da Lat', '435194', '4'),
(84, 33, 8, '2021-12-18 01:09:26', '2020-12-31 04:01:50', '2021-07-12 07:49:53', '2021-11-19 10:19:06', '2021-10-29 12:03:35', 'livré', 'Norman', 'Chase', 'P.O. Box 383, 5354 Pede Street', 'Hà Nội', '79156', '10'),
(85, 36, 4, '2021-09-06 22:21:23', '2020-12-30 14:40:11', '2021-08-26 20:42:59', '2021-04-27 09:43:27', '2021-02-01 02:22:19', 'livré', 'Arthur', 'Nelson', 'P.O. Box 402, 4911 Molestie Street', 'Rostov', '6483', '8'),
(86, 37, 8, '2021-09-06 19:56:32', '2021-08-30 11:46:36', '2021-12-06 03:08:55', '2021-12-01 19:22:20', '2021-05-23 14:38:21', 'envoyé', 'Bevis', 'Ewing', '229-5019 Feugiat Rd.', 'Ife', '33050', '9'),
(87, 38, 2, '2021-10-22 02:23:46', '2020-12-24 12:06:51', '2022-01-25 08:59:08', '2021-08-11 19:06:43', '2021-01-25 07:24:50', 'envoyé', 'Walker', 'Clemons', '292-8407 Mattis. Rd.', 'Port Lincoln', '13012', '7'),
(88, 39, 10, '2021-06-13 23:57:40', '2022-03-25 09:05:42', '2021-06-22 09:11:23', '2021-01-09 17:54:05', '2021-07-05 21:52:56', 'en cours de préparation', 'Cody', 'Barron', 'Ap #442-2221 Fringilla Rd.', 'Lansing', '313277', '6'),
(89, 41, 8, '2022-02-28 13:53:09', '2021-03-18 19:33:36', '2022-01-24 17:24:40', '2021-06-19 03:21:40', '2021-05-31 05:06:21', 'en cours de préparation', 'Laurel', 'Vincent', '570-4485 Eu, Rd.', 'Lede', '611188', '8'),
(90, 34, 3, '2021-03-20 14:16:46', '2021-10-09 08:17:13', '2021-11-29 02:45:22', '2021-10-27 18:03:41', '2021-05-15 01:31:14', 'envoyé', 'Zia', 'Bruce', 'Ap #929-6321 Et Road', 'Hà Tĩnh', '83740', '2'),
(91, 34, 2, '2021-01-23 08:46:57', '2021-02-06 15:48:32', '2021-10-21 22:40:14', '2021-04-08 05:20:31', '2021-04-08 10:37:36', 'en cours de préparation', 'Zahir', 'Mcgee', '915-3637 Ullamcorper, St.', 'Villenave-d\'Ornon', '6632 EM', '2'),
(92, 37, 4, '2021-06-24 23:35:22', '2021-10-13 09:52:22', '2021-07-06 11:38:27', '2021-12-16 14:10:11', '2022-02-04 18:44:23', 'envoyé', 'Talon', 'Pierce', '276-220 At Avenue', 'İmamoğlu', 'A7C 0G2', '2'),
(93, 39, 2, '2021-01-04 04:32:55', '2022-03-07 19:29:31', '2021-05-22 23:45:34', '2021-11-19 23:25:34', '2021-09-04 03:53:54', 'en cours de préparation', 'Sheila', 'Franklin', '8357 Cursus Rd.', 'Cajamarca', '37838', '10'),
(94, 36, 6, '2022-01-16 22:02:49', '2021-07-18 17:34:29', '2022-01-20 18:23:27', '2021-06-27 03:36:07', '2021-11-05 01:52:10', 'en cours de préparation', 'George', 'Duke', 'Ap #528-7171 Enim. Rd.', 'Cartagena', '163428', '2'),
(95, 35, 7, '2021-12-28 00:44:20', '2021-05-10 10:08:51', '2021-03-11 08:30:27', '2022-03-22 01:56:08', '2021-09-22 15:51:14', 'envoyé', 'Keane', 'Branch', 'Ap #475-8724 Sociis Rd.', 'Klagenfurt', '522863', '9'),
(96, 36, 6, '2021-02-18 02:06:56', '2020-12-31 20:09:53', '2021-02-03 20:06:04', '2021-01-17 09:09:18', '2021-01-04 02:09:16', 'en cours de préparation', 'Marcia', 'Becker', '299-3012 Rhoncus. Rd.', 'Arnhem', '13157', '4'),
(97, 36, 9, '2021-11-03 14:41:26', '2021-11-30 21:23:41', '2021-04-15 07:07:50', '2022-01-30 01:03:43', '2022-04-21 04:37:39', 'envoyé', 'Aquila', 'Burnett', '143-8530 Nec Rd.', 'Jilin', '699626', '6'),
(98, 38, 9, '2021-10-17 00:40:41', '2022-01-23 03:47:57', '2021-08-16 09:49:21', '2021-05-05 13:56:28', '2021-04-04 18:18:23', 'envoyé', 'Zachary', 'Kidd', '635-3861 Nullam St.', 'Lasbela', '93738', '8'),
(99, 34, 3, '2021-08-01 12:33:16', '2022-02-05 07:33:21', '2021-02-22 22:26:39', '2021-10-30 06:46:21', '2021-01-25 15:29:50', 'envoyé', 'Gannon', 'Rasmussen', '665-5201 A St.', 'Uppingham. Cottesmore', '1333', '6'),
(100, 36, 8, '2021-08-03 06:56:32', '2021-03-07 08:46:42', '2021-07-24 02:45:47', '2021-06-29 11:30:58', '2021-09-15 09:03:50', 'envoyé', 'Devin', 'Barton', '512-9042 Sed Rd.', 'Hisar', '57846', '9'),
(101, 34, 3, '2021-05-20 10:08:32', '2021-10-30 03:12:14', '2021-03-15 09:23:53', '2021-04-27 16:06:38', '2021-04-03 17:04:31', 'livré', 'Wayne', 'Hernandez', 'Ap #632-7364 Aliquam Rd.', 'Sluis', '24941', '9'),
(102, 40, 5, '2021-10-21 00:43:48', '2021-12-02 01:15:07', '2022-01-23 04:22:34', '2021-09-07 00:36:28', '2021-08-25 04:10:40', 'en cours de préparation', 'Jessamine', 'Webster', '513-8291 Nulla Ave', 'Oviedo', '24713', '10'),
(103, 34, 5, '2021-01-12 00:19:09', '2021-10-03 06:44:09', '2021-03-01 16:11:23', '2021-04-16 12:07:33', '2021-04-04 11:34:52', 'livré', 'Phyllis', 'Davidson', '806-5407 Accumsan Rd.', 'Ceuta', '13843', '3'),
(104, 37, 6, '2022-03-11 18:00:21', '2021-02-10 13:11:33', '2021-02-03 19:38:42', '2021-10-03 02:54:00', '2021-08-21 09:47:51', 'en cours de préparation', 'Quentin', 'Beck', '862-2878 Tellus. Ave', 'General Escobedo', '01608', '8'),
(105, 34, 4, '2021-03-25 21:14:46', '2021-09-04 01:22:05', '2021-07-02 11:17:41', '2021-10-15 15:54:54', '2022-03-31 17:29:56', 'livré', 'Bryar', 'Browning', 'Ap #624-6642 Eleifend St.', 'Idaho Falls', '16861', '3'),
(106, 38, 6, '2021-09-06 23:19:01', '2022-03-27 10:02:32', '2021-10-31 23:29:46', '2022-01-07 23:45:01', '2022-02-18 12:18:04', 'envoyé', 'Robert', 'Navarro', 'P.O. Box 703, 327 Vestibulum Ave', 'Canberra', '588253', '3'),
(107, 34, 2, '2021-02-09 08:40:30', '2021-05-02 08:02:30', '2021-06-05 16:09:21', '2022-01-20 06:13:04', '2022-04-11 10:28:00', 'livré', 'Fiona', 'Stevens', '334-8178 Non St.', 'Joondalup', 'L7A 4T3', '1'),
(108, 38, 3, '2021-12-31 16:01:21', '2021-02-08 16:57:32', '2021-09-09 08:39:43', '2022-02-07 02:10:56', '2021-12-10 15:13:48', 'livré', 'Colton', 'Mayer', '610-488 Pharetra Road', 'Kỳ Sơn', '876413', '8'),
(109, 41, 3, '2021-11-27 15:02:24', '2021-12-31 10:41:42', '2021-02-22 00:38:15', '2021-04-06 05:51:06', '2022-01-23 14:00:07', 'livré', 'Tasha', 'Gentry', 'P.O. Box 453, 2575 Malesuada Street', 'Pollein', '12435-64169', '7'),
(110, 41, 4, '2022-01-07 23:24:03', '2022-01-22 13:30:54', '2022-02-24 14:52:32', '2021-10-22 04:20:50', '2021-03-02 13:45:47', 'envoyé', 'Lana', 'Talley', '175-5953 Morbi Avenue', 'Zamość', '155117', '6');

-- --------------------------------------------------------

--
-- Structure de la table `order_details`
--

CREATE TABLE `order_details` (
  `order_id` int(11) NOT NULL,
  `prod_id` int(11) NOT NULL,
  `unit_price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `quantity` smallint(3) NOT NULL DEFAULT 1,
  `discount` smallint(2) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `order_details`
--

INSERT INTO `order_details` (`order_id`, `prod_id`, `unit_price`, `quantity`, `discount`) VALUES
(35, 36, '1215.76', 12, 5),
(68, 36, '1643.22', 11, 18),
(17, 38, '888.32', 2, 14),
(70, 34, '227.10', 9, 6),
(86, 38, '405.66', 3, 9),
(57, 35, '209.41', 6, 14),
(92, 35, '945.50', 2, 19),
(73, 37, '1057.89', 12, 16),
(96, 37, '291.96', 5, 18),
(85, 38, '534.66', 8, 13),
(84, 37, '1858.36', 1, 8),
(19, 37, '1883.94', 11, 6),
(19, 39, '1463.36', 6, 18),
(68, 33, '538.65', 9, 16),
(26, 36, '1699.02', 3, 4),
(16, 37, '1207.06', 9, 17),
(98, 38, '2195.38', 10, 11),
(64, 34, '1307.82', 3, 6),
(53, 40, '1543.84', 7, 2),
(38, 38, '1070.43', 5, 8),
(43, 37, '168.76', 12, 15),
(37, 38, '1994.58', 1, 2),
(51, 35, '628.44', 3, 20),
(16, 36, '1565.70', 2, 11),
(30, 39, '200.85', 1, 9),
(66, 37, '1345.55', 3, 14),
(97, 38, '170.56', 2, 18),
(72, 34, '322.97', 5, 3),
(30, 39, '1181.49', 11, 9),
(15, 35, '1604.23', 7, 19),
(75, 33, '1976.21', 4, 4),
(6, 40, '154.60', 2, 11),
(76, 36, '1454.80', 6, 13),
(60, 34, '1256.47', 5, 8),
(73, 37, '1169.93', 4, 3),
(1, 39, '667.15', 5, 1),
(64, 33, '1490.07', 8, 10),
(26, 34, '1968.79', 4, 11),
(40, 33, '230.13', 9, 4),
(3, 38, '200.04', 5, 4),
(99, 34, '693.01', 7, 19),
(95, 37, '678.58', 5, 3),
(93, 34, '1238.15', 2, 15),
(91, 35, '1357.62', 6, 2),
(71, 39, '521.60', 2, 18),
(66, 39, '451.79', 12, 20),
(8, 37, '852.37', 10, 15),
(5, 38, '1972.48', 2, 6),
(88, 38, '416.92', 10, 7),
(11, 37, '156.32', 12, 16),
(90, 38, '1793.58', 11, 15),
(24, 37, '1294.09', 9, 10),
(41, 37, '2196.73', 4, 10),
(77, 40, '356.85', 1, 17),
(60, 39, '269.96', 5, 6),
(13, 38, '582.54', 8, 9),
(82, 38, '1286.78', 7, 18),
(51, 40, '2034.93', 12, 10),
(9, 34, '1500.83', 10, 3),
(11, 39, '436.24', 7, 17),
(15, 37, '1031.03', 10, 3),
(69, 35, '715.85', 4, 3),
(53, 34, '933.48', 13, 7),
(77, 39, '853.26', 9, 2),
(16, 39, '930.98', 7, 17),
(73, 39, '349.35', 12, 4),
(16, 34, '1668.46', 11, 11),
(54, 35, '1511.05', 12, 19),
(45, 36, '1141.08', 12, 12),
(66, 39, '1847.19', 12, 12),
(19, 40, '1642.06', 9, 4),
(21, 36, '215.42', 5, 4),
(29, 35, '2050.97', 2, 2),
(30, 34, '195.76', 4, 19),
(19, 37, '969.17', 1, 15),
(21, 36, '349.66', 13, 19),
(29, 36, '195.01', 5, 7),
(30, 35, '1692.47', 10, 4),
(19, 37, '1633.40', 9, 2),
(21, 33, '1640.70', 6, 2),
(29, 35, '798.25', 5, 1),
(30, 40, '1084.91', 6, 17),
(19, 36, '1051.73', 11, 3),
(21, 34, '902.20', 9, 3),
(29, 33, '473.53', 8, 19),
(30, 36, '917.55', 7, 6),
(19, 37, '243.19', 11, 10),
(21, 36, '1248.46', 9, 12),
(29, 37, '2169.51', 6, 7),
(30, 37, '399.19', 3, 4),
(19, 38, '1356.93', 12, 2),
(21, 34, '1442.99', 3, 20),
(29, 34, '675.24', 12, 7),
(30, 33, '293.04', 6, 20),
(19, 35, '1415.53', 9, 6),
(21, 35, '863.10', 3, 12),
(29, 38, '973.74', 9, 9),
(30, 36, '1503.31', 5, 4),
(19, 35, '847.37', 9, 19),
(21, 36, '857.85', 6, 4);

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
  `prod_price` decimal(10,2) NOT NULL,
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
(19, 1, 1, 'AMERICAN PROFESSIONAL II', 'STRATOCASTER', '0113900705_fen_ins_frt_1_rr.jpg', '1949.00', 50, '<ul>\r\n<li>Trois micros Stratocaster V-Mod II &agrave; simples bobinages</li>\r\n<li>Vibrato &agrave; 2 Points Retravaill&eacute; avec Bloc en Acier Lamin&eacute; &agrave; Froid</li>\r\n<li>Profil de manche Deep &rdquo;C&rdquo; avec bords de touche arrondis</li>\r\n<li>Sillet de t&ecirc;te en os ; 22 frettes narrow-tall pour faciliter les bendings</li>\r\n<li>Circuit \"Treble Bleed\" pour conserver les aigus lorsque vous baissez le volume</li>\r\n<li>&Eacute;tui rigide moul&eacute; Elite inclus</li>\r\n</ul>', '<p>L&rsquo;American Professional II Stratocaster&reg; profite de plus de soixante ans d&rsquo;innovation, d&rsquo;inspiration et d&rsquo;&eacute;volution pour satisfaire les besoins des guitaristes professionnels d&rsquo;aujourd&rsquo;hui. Notre manche populaire au profil Deep &rdquo;C&rdquo; pr&eacute;sente dor&eacute;navant des bords de touche arrondis tr&egrave;s agr&eacute;ables, une finition satin&eacute;e &rdquo;Super-Natural&rdquo; et un tout nouveau talon sculpt&eacute; qui offre un toucher particuli&egrave;rement confortable et un acc&egrave;s ais&eacute; aux aigus. Les nouveaux micros V-Mod II Stratocaster &agrave; simples bobinages continuent &agrave; produire le m&ecirc;me son chaleureux et chatoyant mais sont plus pr&eacute;cis que jamais. Un vibrato &agrave; deux points retravaill&eacute; avec un bloc en acier lamin&eacute; &agrave; froid accro&icirc;t le sustain, la clart&eacute; et la brillance dans les aigus.</p>', '2021-09-30 10:04:08', '2021-10-05 12:32:21'),
(21, 1, 1, 'AMERICAN PROFESSIONAL II', 'TELECASTER', '0113942750_fen_ins_frt_1_rr.jpg', '2049.00', 40, '<ul>\r\n<li>Deux micros &agrave; simples bobinages V-Mod II Telecaster</li>\r\n<li>Nouveau chevalet Telecaster Top Load/String-Through avec pontets &rdquo;Bullet&rdquo; compens&eacute;s en laiton</li>\r\n<li>Profil de manche Deep &rdquo;C&rdquo; avec bords de touche arrondis</li>\r\n<li>Sillet de t&ecirc;te en os ; 22 frettes narrow-tall pour faciliter les bendings</li>\r\n<li>Circuit \"Treble Bleed\" pour conserver les aigus lorsque vous baissez le volume</li>\r\n<li>&Eacute;tui rigide moul&eacute; Elite inclus</li>\r\n</ul>', '<p style=\"text-align: justify;\"><span style=\"color: #212529; font-family: SourceSansPro, Helvetica, Arial, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">L&rsquo;American Professional II Telecaster&reg; profite de plus de soixante-dix ans d&rsquo;innovation, d&rsquo;inspiration et d&rsquo;&eacute;volution pour satisfaire les besoins des guitaristes professionnels d&rsquo;aujourd&rsquo;hui.</span><br style=\"box-sizing: border-box; color: #212529; font-family: SourceSansPro, Helvetica, Arial, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\" /><br style=\"box-sizing: border-box; color: #212529; font-family: SourceSansPro, Helvetica, Arial, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\" /><span style=\"color: #212529; font-family: SourceSansPro, Helvetica, Arial, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">Notre manche populaire au profil Deep &rdquo;C&rdquo; pr&eacute;sente dor&eacute;navant des bords de touche arrondis tr&egrave;s agr&eacute;ables, une finition satin&eacute;e &rdquo;Super-Natural&rdquo; et un tout nouveau talon sculpt&eacute; qui offre un toucher particuli&egrave;rement confortable et un acc&egrave;s ais&eacute; aux aigus. Les nouveaux micros &agrave; simples bobinages V-Mod II Telecaster produisent le twang, le claquant et la p&ecirc;che qui ont fait la r&eacute;putation de la Tele mais sont plus pr&eacute;cis que jamais. Le nouveau chevalet Top-Load/String-Through (Installation des cordes depuis la table/au travers du corps), avec ses pontets &rdquo;Bullet&rdquo; compens&eacute;s, est le mod&egrave;le le plus confortable que nous ayons jamais cr&eacute;&eacute; sur une Tele. Il conserve le timbre classique offert par les pontets en laiton et offre une excellente intonation ainsi que diff&eacute;rentes options de configuration. Vous pouvez ainsi r&eacute;gler la tension et le son de chaque corde comme vous le souhaitez.</span></p>', '2021-09-30 10:04:08', '2021-10-05 14:28:36'),
(29, 1, 4, 'AMERICAN PROFESSIONAL II', 'JAZZ BASS', '0147362376_fen_ins_frt_1_rr.jpg', '2199.00', 75, '<ul>\r\n<li>Deux micros V-Mod II Jazz Bass &agrave; simples bobinages</li>\r\n<li>Profil de manche Slim &rdquo;C&rdquo; avec bords de touche arrondis</li>\r\n<li>Sillet en os ; 20 frettes narrow-tall</li>\r\n<li>Chevalet HiMass&trade; Vintage pour un sustain accru</li>\r\n<li>Tiges de renfort du manche Posiflex en graphite</li>\r\n<li>&Eacute;tui rigide moul&eacute; Elite inclus</li>\r\n</ul>', '<p style=\"text-align: justify;\">L&rsquo;American Professional II Jazz Bass&reg; profite de plus de soixante ans d&rsquo;innovation, d&rsquo;inspiration et d&rsquo;&eacute;volution pour satisfaire les besoins des bassistes professionnels d&rsquo;aujourd&rsquo;hui. Notre manche populaire au profil Slim &rdquo;C&rdquo; pr&eacute;sente dor&eacute;navant des bords de touche arrondis tr&egrave;s agr&eacute;ables, une finition satin&eacute;e &rdquo;Super-Natural&rdquo; et un tout nouveau talon de manche sculpt&eacute; qui offre un toucher particuli&egrave;rement confortable et un acc&egrave;s ais&eacute; aux aigus. Les nouveaux micros &agrave; simples bobinages V-Mod II Jazz Bass produisent le son clair et punchy qui fait la r&eacute;putation de la Jazz Bass mais ils sont plus pr&eacute;cis que jamais. L&rsquo;American Pro II Jazz Bass est un instrument polyvalent qui vous semblera imm&eacute;diatement familier.</p>', '2021-09-30 10:04:08', '2021-12-02 16:14:43'),
(30, 1, 2, 'REDONDO', 'CLASSIC', '0970913137_gtr_frt_001_rr.jpg', '768.00', 88, '<ul>\r\n<li>Forme de corps Redondo, une exclusivit&eacute; de Fender</li>\r\n<li>Table en &eacute;pic&eacute;a massif ; dos et &eacute;clisses en acajou massif</li>\r\n<li>Syst&egrave;me de micro/pr&eacute;ampli Fishman con&ccedil;u en exclusivit&eacute; pour Fender</li>\r\n<li>Manche en acajou au profil Slim-Taper en \"C\" ; touche rapport&eacute;e et chevalet en pau ferro</li>\r\n<li>T&ecirc;te de manche inclin&eacute;e vers l&rsquo;arri&egrave;re avec 6 m&eacute;caniques en ligne</li>\r\n<li>Housse deluxe incluse</li>\r\n</ul>', '<p style=\"text-align: justify;\"><span style=\"color: #212529; font-family: SourceSansPro, Helvetica, Arial, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">Cette guitare dreadnought acoustique, audacieuse et impertinente, a &eacute;t&eacute; pens&eacute;e pour d&eacute;clencher l\'inspiration d&egrave;s les premi&egrave;res notes. La Redondo Classic pr&eacute;sente une table en &eacute;pic&eacute;a massif, un dos et des &eacute;clisses en acajou massif pour que son timbre riche et imposant r&eacute;sonne dans n&rsquo;importe quel espace. Cette guitare pens&eacute;e pour le jeu en direct est &eacute;galement &eacute;quip&eacute;e d\'un syst&egrave;me de pr&eacute;ampli con&ccedil;u par Fender et Fishman&reg; et r&eacute;gl&eacute; sp&eacute;cialement pour la forme du corps de la Redondo. Il permet de reproduire le timbre naturel de l&rsquo;instrument lorsqu&rsquo;il est branch&eacute; &agrave; un amplificateur. Le manche en acajou pr&eacute;sente un confortable profil Slim-Taper en &rdquo;C&rdquo; inspir&eacute; des mod&egrave;les &eacute;lectriques historiques de Fender.</span></p>', '2021-09-30 10:04:08', '2021-10-05 14:42:02'),
(33, 8, 9, 'JOE STRUMMER', '13\' INSTRUMENT CABLE', '0990810276_fen_acc_frt_1_nr.jpg', '30.00', 79, '<ul>\r\n<li>Available in 13\' length</li>\r\n<li>Offered in Drab Green</li>\r\n<li>8mm outer diameter wire jacket</li>\r\n<li>23 AWG</li>\r\n<li>90% OFC spiral shielding</li>\r\n<li>Nickel-plated connectors</li>\r\n<li>Backed by a lifetime guarantee</li>\r\n</ul>', '<p style=\"text-align: justify;\">The Legendary Joe Strummer played guitar with an intensity that cut like a knife with raw energy and passion in every intense swipe at the strings. He was the embodiment of Punk culture and a crucial component to its development. Best known for his work with The Clash, Strummer and his bandmates were a major part of creating punk rock and has inspired countless other bands to this day.</p>', '2021-10-04 10:13:12', '2021-10-04 14:19:16'),
(34, 4, 18, 'Rode', 'NT1-A Complete Vocal Recording', 'crop_2.jpg', '159.00', 92, '<ul>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">Microphone large membrane de 1 pouce</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">Diagramme polaire : cardio&iuml;de</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">R&eacute;ponse en fr&eacute;quence : 20 - 20000 Hz</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">Niveau de pression acoustique limite : 137 dB</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">Imp&eacute;dance de sortie : 100 Ohm</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">Contacts de sortie plaqu&eacute;s or</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">Dimensions (H x L x P) : 190 x 50 x 50 mm</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">Poids : 326 g</span></li>\r\n</ul>', '<ul>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">Microphone large membrane Rode NT1-A</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">Suspension &eacute;lastique deluxe SM6 avec filtre anti-pop en tissu int&eacute;gr&eacute;</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">C&acirc;ble XLR de 6 m</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">Sac de protection contre la poussi&egrave;re</span></li>\r\n</ul>', '2021-10-04 20:41:47', '2021-10-26 09:12:53'),
(35, 2, 11, 'Millenium', 'Focus Junior Drum Set Black', '15776950_800.jpg', '148.00', 101, '<ul>\r\n<li><span style=\"box-sizing: border-box; padding: 1px 0px 0px; vertical-align: top; font-size: 14px; margin: 0px; display: block; line-height: 21px; letter-spacing: -0.1px; font-weight: 400;\">S&eacute;rie Focus</span></li>\r\n<li><span style=\"box-sizing: border-box; padding: 1px 0px 0px; vertical-align: top; font-size: 14px; margin: 0px; display: block; line-height: 21px; letter-spacing: -0.1px; font-weight: 400;\">Convient aux enfants de 4 &agrave; 7 ans</span></li>\r\n<li><span style=\"box-sizing: border-box; padding: 1px 0px 0px; vertical-align: top; font-size: 14px; margin: 0px; display: block; line-height: 21px; letter-spacing: -0.1px; font-weight: 400;\">Grosse caisse 16\"x10\"</span></li>\r\n<li><span style=\"box-sizing: border-box; padding: 1px 0px 0px; vertical-align: top; font-size: 14px; margin: 0px; display: block; line-height: 21px; letter-spacing: -0.1px; font-weight: 400;\">Tom 08\"x05\"</span></li>\r\n<li><span style=\"box-sizing: border-box; padding: 1px 0px 0px; vertical-align: top; font-size: 14px; margin: 0px; display: block; line-height: 21px; letter-spacing: -0.1px; font-weight: 400;\">Tom 10\"x06\"</span></li>\r\n<li><span style=\"box-sizing: border-box; padding: 1px 0px 0px; vertical-align: top; font-size: 14px; margin: 0px; display: block; line-height: 21px; letter-spacing: -0.1px; font-weight: 400;\">Stand tom 13\"x11\"</span></li>\r\n<li><span style=\"box-sizing: border-box; padding: 1px 0px 0px; vertical-align: top; font-size: 14px; margin: 0px; display: block; line-height: 21px; letter-spacing: -0.1px; font-weight: 400;\">Caisse claire en bois 12\"x05\"</span></li>\r\n<li><span style=\"box-sizing: border-box; padding: 1px 0px 0px; vertical-align: top; font-size: 14px; margin: 0px; display: block; line-height: 21px; letter-spacing: -0.1px; font-weight: 400;\">Finition: Rhodo&iuml;d</span></li>\r\n<li><span style=\"box-sizing: border-box; padding: 1px 0px 0px; vertical-align: top; font-size: 14px; margin: 0px; display: block; line-height: 21px; letter-spacing: -0.1px; font-weight: 400;\">Couleur: Noir</span></li>\r\n</ul>', '<p style=\"text-align: justify;\"><span style=\"color: #3b3b3b; font-family: \'Open Sans\', Verdana, Tahoma, Arial, Helvetica, sans-serif; font-size: 15.36px; font-style: normal; font-variant-ligatures: no-common-ligatures; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; float: none; display: inline !important;\">Le Focus Junior Drum Set Black de Millenium propose un &eacute;quipement complet pour accompagner sans prise de t&ecirc;te les premiers pas des jeunes batteurs ambitieux ! Apr&egrave;s avoir d&eacute;ball&eacute;, mont&eacute; et accord&eacute; votre batterie, votre enfant aura tout ce qu\'il faut pour commencer &agrave; \"tambouriner\" sans plus attendre. L\'ensemble comprend cinq f&ucirc;ts dont une caisse claire en bois, ainsi qu\'une charley de 10 pouces, une cymbale crash/ride de 12 pouces, tous les pieds n&eacute;cessaires dont celui de la charley, une p&eacute;dale de grosse caisse et un tabouret. <br /></span></p>', '2021-10-05 09:13:37', '2021-10-06 14:39:32'),
(36, 2, 11, 'Millenium', 'Youngster Drum Set Green', '11680618_800.jpg', '98.00', 29, '<ul>\r\n<li><span style=\"box-sizing: border-box; padding: 1px 0px 0px; vertical-align: top; font-size: 14px; margin: 0px; display: block; line-height: 21px; letter-spacing: -0.1px; font-weight: 400;\">Id&eacute;ale pour les enfants &agrave; partir de 3 ans</span></li>\r\n<li><span style=\"box-sizing: border-box; padding: 1px 0px 0px; vertical-align: top; font-size: 14px; margin: 0px; display: block; line-height: 21px; letter-spacing: -0.1px; font-weight: 400;\">Grosse caisse 16\"x12\"</span></li>\r\n<li><span style=\"box-sizing: border-box; padding: 1px 0px 0px; vertical-align: top; font-size: 14px; margin: 0px; display: block; line-height: 21px; letter-spacing: -0.1px; font-weight: 400;\">Tom 08\"x05\"</span></li>\r\n<li><span style=\"box-sizing: border-box; padding: 1px 0px 0px; vertical-align: top; font-size: 14px; margin: 0px; display: block; line-height: 21px; letter-spacing: -0.1px; font-weight: 400;\">Caisse claire 10\"x04\"</span></li>\r\n<li><span style=\"box-sizing: border-box; padding: 1px 0px 0px; vertical-align: top; font-size: 14px; margin: 0px; display: block; line-height: 21px; letter-spacing: -0.1px; font-weight: 400;\">F&ucirc;ts en bois dur</span></li>\r\n<li><span style=\"box-sizing: border-box; padding: 1px 0px 0px; vertical-align: top; font-size: 14px; margin: 0px; display: block; line-height: 21px; letter-spacing: -0.1px; font-weight: 400;\">Accastillage noir</span></li>\r\n<li><span style=\"box-sizing: border-box; padding: 1px 0px 0px; vertical-align: top; font-size: 14px; margin: 0px; display: block; line-height: 21px; letter-spacing: -0.1px; font-weight: 400;\">Finition: Rhodo&iuml;d</span></li>\r\n<li><span style=\"box-sizing: border-box; padding: 1px 0px 0px; vertical-align: top; font-size: 14px; margin: 0px; display: block; line-height: 21px; letter-spacing: -0.1px; font-weight: 400;\">Couleur: Green Sparkle</span></li>\r\n</ul>', '<p style=\"text-align: justify;\"><span style=\"color: #000000;\"><span style=\"font-family: \'Open Sans\', Verdana, Tahoma, Arial, Helvetica, sans-serif; font-size: 15.36px; font-style: normal; font-variant-ligatures: no-common-ligatures; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; float: none; display: inline !important;\">La </span><span style=\"font-family: \'Open Sans\', Verdana, Tahoma, Arial, Helvetica, sans-serif; font-size: 15.36px; font-style: normal; font-variant-ligatures: no-common-ligatures; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; float: none; display: inline !important;\">batterie Millenium pour enfants en jette carr&eacute;ment avec son vert brillant m&eacute;tallis&eacute; ! Cette batterie est si petite que m&ecirc;me les enfants de trois ans pourront se d&eacute;fouler avec! Elle poss&egrave;de tous les &eacute;l&eacute;ments que vous pourriez attendre d\'une batterie professionnelle : une caisse claire, un tom alto, un tom m&eacute;dium, une grosse caisse, une charleston, une cymbale crash, des p&eacute;dales et m&ecirc;me un tabouret. Le rev&ecirc;tement noir de la ferrure tape &eacute;galement &agrave; l&rsquo;&oelig;il, et, bien entendu, une paire de baguettes est fournie afin de pouvoir imm&eacute;diatement se mettre &agrave; l&rsquo;&oelig;uvre.</span></span></p>', '2021-10-05 09:42:07', '2021-10-05 10:05:45'),
(37, 1, 1, 'PLAYER PLUS', 'TELECASTER', '0147333336_fen_ins_frt_1_rr.jpg', '1049.00', 62, '<ul>\r\n<li>Micros Telecaster Player Plus Noiseless</li>\r\n<li>Touche au radius de 12\" (305 mm) avec bords arrondis</li>\r\n<li>Chevalet de Tele moderne &agrave; 6 pontets moul&eacute;s en acier</li>\r\n<li>Contr&ocirc;le de tonalit&eacute; push-pull activant le c&acirc;blage des deux micros en s&eacute;rie</li>\r\n<li>M&eacute;caniques bloquantes</li>\r\n</ul>', '<p style=\"text-align: justify;\"><span style=\"color: #212529; font-family: SourceSansPro, Helvetica, Arial, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">La Player Plus Telecaster&reg; fusionne le design classique de Fender&reg;, des fonctionnalit&eacute;s pens&eacute;es pour le jeu et de nouvelles finitions &eacute;tonnantes, pour vous faire profiter d&rsquo;un toucher exceptionnel et d&rsquo;un style inimitable. La Player Plus Tele&reg; vous permet de retrouver le doux twang chaleureux de la Tele&reg;, mais sans aucun souffle, gr&acirc;ce &agrave; son jeu de micros Player Plus Noiseless&trade;. Un commutateur push-pull install&eacute; sur le contr&ocirc;le de tonalit&eacute; configure les deux micros en s&eacute;rie, ce qui accroit le niveau de sortie et produit un son plus charnu. Gr&acirc;ce &agrave; la douce finition satin&eacute;e et aux bords arrondis du manche au profil &rdquo;Modern C&rdquo;, votre main glissera sur cette Player Plus Tele&reg; avec une facilit&eacute; d&eacute;concertante. La touche au radius de 12&rdquo; (305 mm), avec ses 22 frettes medium jumbo, vous aidera &agrave; jouer des solos avec une fluidit&eacute; hors pair et &agrave; effectuer des bendings sans faire friser les cordes.</span><span style=\"color: #212529; font-family: SourceSansPro, Helvetica, Arial, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\"> </span><span style=\"color: #212529; font-family: SourceSansPro, Helvetica, Arial, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\"><br /></span></p>', '2021-10-05 14:33:26', '2021-10-05 14:36:07'),
(38, 1, 2, 'CD-60S', 'ALL-MAHOGANY', '0970110022_gtr_frt_001_rr.jpg', '220.00', 88, '<ul>\r\n<li>Corps de style Dreadnought</li>\r\n<li>Table en acajou massif avec barrage scallop&eacute; en \"X\"</li>\r\n<li>Dos et &eacute;clisses en acajou</li>\r\n<li>Manche \"facile &agrave; jouer\" avec bords de touche arrondis</li>\r\n</ul>', '<p style=\"text-align: justify;\"><span style=\"color: #212529; font-family: SourceSansPro, Helvetica, Arial, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">La CD-60S All-Mahogany ajoute &agrave; l\'un de nos mod&egrave;les les plus populaires une table en acajou massif pour un son organique unique. Elle est id&eacute;ale pour les guitaristes qui recherchent un mod&egrave;le Dreadnought de haute qualit&eacute;, aussi bien en termes de son que de facilit&eacute; de jeu, mais qui reste malgr&eacute; tout abordable. Avec son nouveau manche \"facile &agrave; jouer\", son dos et ses &eacute;clisses en acajou, la CD-60S All-Mahogany trouvera aussi bien sa place chez vous que sur la plage ou dans un caf&eacute;-concert &mdash; partout o&ugrave; vous souhaitez partager le son et le style classiques de Fender.</span></p>', '2021-10-05 14:44:41', '2021-10-05 16:44:41'),
(39, 1, 3, 'AMERICAN ACOUSTASONIC®', 'STRATOCASTER® COCOBOLO', '0972023096_fen_ins_frt_1_rr.jpg', '3499.00', 58, '<ul>\r\n<li><span style=\"box-sizing: border-box;\" data-sheets-value=\"{\" data-sheets-userformat=\"{\">Guitare &eacute;lectro-acoustique de pointe<br style=\"box-sizing: border-box;\" /></span></li>\r\n<li><span style=\"box-sizing: border-box;\" data-sheets-value=\"{\" data-sheets-userformat=\"{\">L&rsquo;Acoustic Engine offre de nouvelles combinaisons de styles de corps et de bois<br style=\"box-sizing: border-box;\" /></span></li>\r\n<li><span style=\"box-sizing: border-box;\" data-sheets-value=\"{\" data-sheets-userformat=\"{\">Potentiom&egrave;tre Mod pour s&eacute;lectionner et m&eacute;langer les timbres<br style=\"box-sizing: border-box;\" /></span></li>\r\n<li><span style=\"box-sizing: border-box;\" data-sheets-value=\"{\" data-sheets-userformat=\"{\">Syst&egrave;me SIRS (Stringed Instrument Resonance System) Brevet&eacute;<br style=\"box-sizing: border-box;\" /></span></li>\r\n<li><span style=\"box-sizing: border-box;\" data-sheets-value=\"{\" data-sheets-userformat=\"{\">Trois syst&egrave;mes de micros : Piezo Fishman sous le Chevalet ; Fishman Acoustasonic Enhancer ; micro &eacute;lectromagn&eacute;tique Fender Acoustasonic Noiseless&trade;</span></li>\r\n</ul>', '<p style=\"text-align: justify;\"><span style=\"color: #212529; font-family: SourceSansPro, Helvetica, Arial, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">L&rsquo;American Acoustasonic&trade; Stratocaster&reg; continue d&rsquo;incarner l&rsquo;esprit r&eacute;solument tourn&eacute; vers l&rsquo;innovation qui nourrit la cr&eacute;ation des guitares Fender. La puissance de l&rsquo;Acoustic Engine con&ccedil;u par Fender et Fishman&reg; est indubitablement un moteur d&rsquo;inspiration. Des sons acoustiques m&eacute;tamorphes aux variations rythmiques &eacute;lectriques, cette guitare particuli&egrave;rement polyvalente ouvre une nouvelle voie sonore.</span></p>', '2021-10-05 14:49:22', '2021-10-05 16:49:22'),
(40, 3, 14, 'Roland', 'GO:KEYS', '12368157_800.jpg', '255.55', 97, '<ul>\r\n<li><span style=\"box-sizing: border-box;\">Nombre de touches </span><span class=\"fx-text fx-text--bold fx-text--no-margin\" style=\"box-sizing: border-box; line-height: 24px; letter-spacing: -0.26px; font-weight: bold; margin: 0px;\">61</span></li>\r\n<li><span style=\"box-sizing: border-box;\">Touches lumineuses </span><span class=\"fx-text fx-text--bold fx-text--no-margin\" style=\"box-sizing: border-box; line-height: 24px; letter-spacing: -0.26px; font-weight: bold; margin: 0px;\">Non</span></li>\r\n<li><span style=\"box-sizing: border-box;\">Sensible &agrave; la v&eacute;locit&eacute; </span><span class=\"fx-text fx-text--bold fx-text--no-margin\" style=\"box-sizing: border-box; line-height: 24px; letter-spacing: -0.26px; font-weight: bold; margin: 0px;\">Oui</span></li>\r\n<li><span style=\"box-sizing: border-box;\">Aftertouch</span><span class=\"fx-text fx-text--bold fx-text--no-margin\" style=\"box-sizing: border-box; line-height: 24px; letter-spacing: -0.26px; font-weight: bold; margin: 0px;\">Non</span></li>\r\n<li><span style=\"box-sizing: border-box;\">M&eacute;dia de sauvegarde </span><span class=\"fx-text fx-text--bold fx-text--no-margin\" style=\"box-sizing: border-box; line-height: 24px; letter-spacing: -0.26px; font-weight: bold; margin: 0px;\">Aucun</span></li>\r\n<li><span style=\"box-sizing: border-box;\">Affichage des paroles </span><span class=\"fx-text fx-text--bold fx-text--no-margin\" style=\"box-sizing: border-box; line-height: 24px; letter-spacing: -0.26px; font-weight: bold; margin: 0px;\">Non</span></li>\r\n<li><span style=\"box-sizing: border-box;\">Affichage de la partition </span><span class=\"fx-text fx-text--bold fx-text--no-margin\" style=\"box-sizing: border-box; line-height: 24px; letter-spacing: -0.26px; font-weight: bold; margin: 0px;\">Non</span></li>\r\n<li><span style=\"box-sizing: border-box;\">Harmonie vocale </span><span class=\"fx-text fx-text--bold fx-text--no-margin\" style=\"box-sizing: border-box; line-height: 24px; letter-spacing: -0.26px; font-weight: bold; margin: 0px;\">Non</span></li>\r\n<li><span style=\"box-sizing: border-box;\">Enregistreur audio USB</span><span class=\"fx-text fx-text--bold fx-text--no-margin\" style=\"box-sizing: border-box; line-height: 24px; letter-spacing: -0.26px; font-weight: bold; margin: 0px;\">Non</span></li>\r\n<li><span style=\"box-sizing: border-box;\">Interface MIDI </span><span class=\"fx-text fx-text--bold fx-text--no-margin\" style=\"box-sizing: border-box; line-height: 24px; letter-spacing: -0.26px; font-weight: bold; margin: 0px;\">Aucune</span></li>\r\n<li><span style=\"box-sizing: border-box;\">Entr&eacute;e microphone </span><span class=\"fx-text fx-text--bold fx-text--no-margin\" style=\"box-sizing: border-box; line-height: 24px; letter-spacing: -0.26px; font-weight: bold; margin: 0px;\">Non</span></li>\r\n<li><span style=\"box-sizing: border-box;\">Port USB </span><span class=\"fx-text fx-text--bold fx-text--no-margin\" style=\"box-sizing: border-box; line-height: 24px; letter-spacing: -0.26px; font-weight: bold; margin: 0px;\">Oui</span></li>\r\n</ul>', '<ul>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">61 touches Ivory Feel et boutons en forme de boite sensible &agrave; la v&eacute;locit&eacute;</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">Polyphonie 128 voix</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">Bluetooth 4.2</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">Format MIDI conforme GM2</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">Plus de 500 sons</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">Multi effets / Chorus / Reverb</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">Fonction de transposition</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">Plus de 12 boucles</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">Plus de 672 motifs (12 sets x 56 motifs)</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">10 Pads de performance</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">Fonctions Bender: Pitch Bend et effet de modulation: Roll / Filter</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">Enregistreur: format de fichier MIDI standard 0</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">Affichage LCD</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">2 haut-parleurs de 2,5 Watt chacun</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">Fonctionnement sur batterie possible</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">Dimensions: 877 x 271 x 82 mm</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">Connexions: sorties jack, entr&eacute;e auxiliaire, p&eacute;dale, port USB h&ocirc;te</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">Poids sans alimentation: 3,9 kg</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">Bloc d\'alimentation PSD-230 EU incl.</span></li>\r\n</ul>', '2021-10-13 08:49:26', '2021-10-13 13:55:15');

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
  `sup_zipcode` varchar(10) NOT NULL,
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
  ADD KEY `client_id` (`client_id`),
  ADD KEY `emp_id` (`emp_id`);

--
-- Index pour la table `order_details`
--
ALTER TABLE `order_details`
  ADD KEY `ord_id` (`order_id`),
  ADD KEY `prod_id` (`prod_id`);

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
  MODIFY `client_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT pour la table `countries`
--
ALTER TABLE `countries`
  MODIFY `count_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `employees`
--
ALTER TABLE `employees`
  MODIFY `emp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

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
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`client_id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`emp_id`) REFERENCES `employees` (`emp_id`);

--
-- Contraintes pour la table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_3` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `order_details_ibfk_4` FOREIGN KEY (`prod_id`) REFERENCES `products` (`prod_id`);

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
