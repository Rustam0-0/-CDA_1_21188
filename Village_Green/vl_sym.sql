-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Время создания: Мар 29 2022 г., 16:21
-- Версия сервера: 10.3.34-MariaDB-0ubuntu0.20.04.1
-- Версия PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `vl_sym`
--

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `picture` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`id`, `name`, `picture`) VALUES
(1, 'Guit/Bass', 'guitare.png'),
(2, 'Batteries', 'batterie.png'),
(3, 'Clavier', 'piano.png'),
(4, 'Studio', 'micro.png'),
(5, 'Sono', 'sono.png'),
(6, 'DJ', 'dj.jpg'),
(7, 'Cases', 'cases.png'),
(8, 'Accessoires', 'cable.png'),
(13, 'Eclairage', 'eclairage.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `client`
--

CREATE TABLE `client` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address_complete` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zipcode` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_add` datetime NOT NULL,
  `country_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `client`
--

INSERT INTO `client` (`id`, `name`, `surname`, `address`, `address_complete`, `zipcode`, `city`, `date_add`, `country_id`) VALUES
(3, 'klm', 'klm', '44 rue', 'a', '15', 'kjjkj', '2022-02-27 15:46:12', 1),
(4, 'Alice', 'Dupont', '1 rue de Paris', 'app 1', '80000', 'Amiens', '2022-02-27 17:40:09', 1),
(5, 'Admin', 'Boss', '1 rue de Paris', '1', '1515115', 'Paris', '2022-03-02 13:29:46', 1),
(6, 'Elena', 'iusupova', '477 AVENUE DU 14 JUILLET 1789', '19', '80000', 'AMIENS', '2022-03-24 20:42:49', 1),
(7, 'Jean-Claude', 'Van-Damme', '1 rue de Paris', NULL, '12345', 'Bruxelles', '2022-03-25 10:40:02', 2),
(8, 'Marion', 'Cotillard', '1 avenue de Lyon', NULL, '72000', 'Paris', '2022-03-25 11:34:51', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `country`
--

CREATE TABLE `country` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `country`
--

INSERT INTO `country` (`id`, `name`) VALUES
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
-- Структура таблицы `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zipcode` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tel` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `date_billing` datetime DEFAULT NULL,
  `date_pay` datetime DEFAULT NULL,
  `date_send` datetime DEFAULT NULL,
  `date_receive` datetime DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ship_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ship_surname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ship_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ship_city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ship_zipcode` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `order`
--

INSERT INTO `order` (`id`, `date`, `date_billing`, `date_pay`, `date_send`, `date_receive`, `status`, `ship_name`, `ship_surname`, `ship_address`, `ship_city`, `ship_zipcode`, `client_id`, `country_id`) VALUES
(1, '2022-03-10 16:23:01', NULL, NULL, NULL, NULL, NULL, 'Alice', 'Dupont', '1 rue de Paris', 'Amiens', '80000', 4, 1),
(2, '2022-03-10 16:56:30', NULL, NULL, NULL, NULL, NULL, 'Alice', 'Dupont', '1 rue de Paris', 'Amiens', '80000', 4, 1),
(3, '2022-03-11 10:38:25', NULL, NULL, NULL, NULL, NULL, 'Alice', 'Dupont', '1 rue de Paris', 'Amiens', '80000', 4, 1),
(4, '2022-03-14 11:34:25', NULL, NULL, NULL, NULL, NULL, 'Alice', 'Dupont', '1 rue de Paris', 'Amiens', '80000', 4, 1),
(5, '2022-03-14 11:34:32', NULL, NULL, NULL, NULL, NULL, 'Alice', 'Dupont', '1 rue de Paris', 'Amiens', '80000', 4, 1),
(6, '2022-03-14 13:18:57', NULL, NULL, NULL, NULL, NULL, 'Alice', 'Dupont', '1 rue de Paris', 'Amiens', '80000', 4, 1),
(7, '2022-03-14 13:19:23', NULL, NULL, NULL, NULL, NULL, 'Alice', 'Dupont', '1 rue de Paris', 'Amiens', '80000', 4, 1),
(8, '2022-03-14 13:21:20', NULL, NULL, NULL, NULL, NULL, 'Alice', 'Dupont', '1 rue de Paris', 'Amiens', '80000', 4, 1),
(9, '2022-03-14 13:30:11', NULL, NULL, NULL, NULL, NULL, 'Alice', 'Dupont', '1 rue de Paris', 'Paris', '80000', 4, 1),
(10, '2022-03-14 13:30:42', NULL, NULL, NULL, NULL, NULL, 'Alice', 'Dupont', '1 rue de Paris', 'Paris', '80000', 4, 1),
(11, '2022-03-14 13:33:45', NULL, NULL, NULL, NULL, NULL, 'Alice', 'Dupont', '1 rue de Paris', 'Amiens', '80000', 4, 1),
(12, '2022-03-14 13:47:54', NULL, NULL, NULL, NULL, NULL, 'Alice', 'Dupont', '1 rue de Paris', 'Amiens', '80000', 4, 1),
(13, '2022-03-14 15:26:25', NULL, NULL, NULL, NULL, NULL, 'Alice', 'Dupont', '1 rue de Paris', 'Amiens', '80000', 4, 1),
(14, '2022-03-14 15:35:41', NULL, NULL, NULL, NULL, NULL, 'Alice', 'Dupont', '1 rue de Paris', 'Amiens', '80000', 4, 1),
(15, '2022-03-14 15:39:13', NULL, NULL, NULL, NULL, NULL, 'Alice', 'Dupont', '1 rue de Paris', 'Amiens', '80000', 4, 1),
(16, '2022-03-14 15:40:16', NULL, NULL, NULL, NULL, NULL, 'Alice', 'Dupont', '1 rue de Paris', 'Amiens', '80000', 4, 1),
(17, '2022-03-14 15:41:58', NULL, NULL, NULL, NULL, NULL, 'Alice', 'Dupont', '1 rue de Paris', 'Amiens', '80000', 4, 1),
(18, '2022-03-14 15:42:50', NULL, NULL, NULL, NULL, NULL, 'Alice', 'Dupont', '1 rue de Paris', 'Amiens', '80000', 4, 1),
(19, '2022-03-14 16:02:58', NULL, NULL, NULL, NULL, NULL, 'Alice', 'Dupont', '1 rue de Paris', 'Amiens', '80000', 4, 1),
(20, '2022-03-14 16:12:04', NULL, NULL, NULL, NULL, NULL, 'Alice', 'Dupont', '1 rue de Paris', 'Amiens', '80000', 4, 1),
(21, '2022-03-17 10:14:41', NULL, NULL, NULL, NULL, NULL, 'Alice', 'Dupont', '1 rue de Paris', 'Amiens', '80000', 4, 1),
(22, '2022-03-21 13:31:45', NULL, NULL, NULL, NULL, NULL, 'Alice', 'Dupont', '1 rue de Paris', 'Amiens', '80000', 4, 1),
(23, '2022-03-24 20:44:37', NULL, NULL, NULL, NULL, NULL, 'Elena', 'iusupova', '477 AVENUE DU 14 JUILLET 1789', 'AMIENS', '80000', 6, 1),
(24, '2022-03-25 11:24:38', NULL, NULL, NULL, NULL, NULL, 'Jean-Claude', 'Van-Damme', '1 rue de Paris', 'Bruxelles', '12345', 7, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `order_detail`
--

CREATE TABLE `order_detail` (
  `id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `discount` decimal(2,0) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `orders_id` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `order_detail`
--

INSERT INTO `order_detail` (`id`, `quantity`, `discount`, `product_id`, `orders_id`, `price`) VALUES
(1, 1, '0', 21, 1, '2049.00'),
(2, 2, '0', 36, 1, '98.00'),
(3, 1, '0', 36, 2, '98.00'),
(4, 2, '0', 40, 2, '255.55'),
(5, 1, '0', 21, 3, '2049.00'),
(6, 1, '0', 36, 4, '98.00'),
(7, 1, '0', 36, 5, '98.00'),
(8, 2, '0', 30, 6, '768.00'),
(9, 2, '0', 30, 7, '768.00'),
(10, 2, '0', 30, 8, '768.00'),
(11, 2, '0', 30, 9, '768.00'),
(12, 2, '0', 30, 10, '768.00'),
(13, 2, '0', 30, 11, '768.00'),
(14, 1, '0', 30, 12, '768.00'),
(15, 2, '0', 29, 13, '2199.00'),
(16, 1, '0', 30, 14, '768.00'),
(17, 1, '0', 36, 15, '98.00'),
(18, 1, '0', 30, 16, '768.00'),
(19, 1, '0', 30, 17, '768.00'),
(20, 1, '0', 30, 18, '768.00'),
(21, 1, '0', 29, 19, '2199.00'),
(22, 1, '0', 34, 20, '159.00'),
(23, 2, '0', 36, 21, '98.00'),
(24, 4, '0', 40, 21, '255.55'),
(25, 2, '0', 39, 21, '3499.00'),
(26, 1, '0', 29, 22, '2199.00'),
(27, 1, '0', 36, 22, '98.00'),
(28, 1, '0', 19, 22, '1949.00'),
(29, 1, '0', 40, 22, '255.55'),
(30, 1, '0', 36, 23, '98.00'),
(31, 1, '0', 35, 24, '148.00');

-- --------------------------------------------------------

--
-- Структура таблицы `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `picture` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `details` varchar(5000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(5000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_add` datetime NOT NULL,
  `date_update` datetime DEFAULT NULL,
  `subcat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `product`
--

INSERT INTO `product` (`id`, `label`, `model`, `picture`, `price`, `stock`, `details`, `description`, `date_add`, `date_update`, `subcat_id`) VALUES
(19, 'AMERICAN PROFESSIONAL II', 'STRATOCASTER', '0113900705_fen_ins_frt_1_rr.jpg', '1949.00', 50, '<ul>\r\n<li>Trois micros Stratocaster V-Mod II &agrave; simples bobinages</li>\r\n<li>Vibrato &agrave; 2 Points Retravaill&eacute; avec Bloc en Acier Lamin&eacute; &agrave; Froid</li>\r\n<li>Profil de manche Deep &rdquo;C&rdquo; avec bords de touche arrondis</li>\r\n<li>Sillet de t&ecirc;te en os ; 22 frettes narrow-tall pour faciliter les bendings</li>\r\n<li>Circuit \"Treble Bleed\" pour conserver les aigus lorsque vous baissez le volume</li>\r\n<li>&Eacute;tui rigide moul&eacute; Elite inclus</li>\r\n</ul>', '<p>L&rsquo;American Professional II Stratocaster&reg; profite de plus de soixante ans d&rsquo;innovation, d&rsquo;inspiration et d&rsquo;&eacute;volution pour satisfaire les besoins des guitaristes professionnels d&rsquo;aujourd&rsquo;hui. Notre manche populaire au profil Deep &rdquo;C&rdquo; pr&eacute;sente dor&eacute;navant des bords de touche arrondis tr&egrave;s agr&eacute;ables, une finition satin&eacute;e &rdquo;Super-Natural&rdquo; et un tout nouveau talon sculpt&eacute; qui offre un toucher particuli&egrave;rement confortable et un acc&egrave;s ais&eacute; aux aigus. Les nouveaux micros V-Mod II Stratocaster &agrave; simples bobinages continuent &agrave; produire le m&ecirc;me son chaleureux et chatoyant mais sont plus pr&eacute;cis que jamais. Un vibrato &agrave; deux points retravaill&eacute; avec un bloc en acier lamin&eacute; &agrave; froid accro&icirc;t le sustain, la clart&eacute; et la brillance dans les aigus.</p>', '2021-09-30 10:04:08', '2022-03-23 14:56:49', 1),
(21, 'AMERICAN PROFESSIONAL II', 'TELECASTER', '0113942750_fen_ins_frt_1_rr.jpg', '2049.00', 40, '<ul>\r\n<li>Deux micros &agrave; simples bobinages V-Mod II Telecaster</li>\r\n<li>Nouveau chevalet Telecaster Top Load/String-Through avec pontets &rdquo;Bullet&rdquo; compens&eacute;s en laiton</li>\r\n<li>Profil de manche Deep &rdquo;C&rdquo; avec bords de touche arrondis</li>\r\n<li>Sillet de t&ecirc;te en os ; 22 frettes narrow-tall pour faciliter les bendings</li>\r\n<li>Circuit \"Treble Bleed\" pour conserver les aigus lorsque vous baissez le volume</li>\r\n<li>&Eacute;tui rigide moul&eacute; Elite inclus</li>\r\n</ul>', '<p style=\"text-align: justify;\"><span style=\"color: #212529; font-family: SourceSansPro, Helvetica, Arial, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">L&rsquo;American Professional II Telecaster&reg; profite de plus de soixante-dix ans d&rsquo;innovation, d&rsquo;inspiration et d&rsquo;&eacute;volution pour satisfaire les besoins des guitaristes professionnels d&rsquo;aujourd&rsquo;hui.</span><br style=\"box-sizing: border-box; color: #212529; font-family: SourceSansPro, Helvetica, Arial, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\" /><br style=\"box-sizing: border-box; color: #212529; font-family: SourceSansPro, Helvetica, Arial, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;\" /><span style=\"color: #212529; font-family: SourceSansPro, Helvetica, Arial, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">Notre manche populaire au profil Deep &rdquo;C&rdquo; pr&eacute;sente dor&eacute;navant des bords de touche arrondis tr&egrave;s agr&eacute;ables, une finition satin&eacute;e &rdquo;Super-Natural&rdquo; et un tout nouveau talon sculpt&eacute; qui offre un toucher particuli&egrave;rement confortable et un acc&egrave;s ais&eacute; aux aigus. Les nouveaux micros &agrave; simples bobinages V-Mod II Telecaster produisent le twang, le claquant et la p&ecirc;che qui ont fait la r&eacute;putation de la Tele mais sont plus pr&eacute;cis que jamais. Le nouveau chevalet Top-Load/String-Through (Installation des cordes depuis la table/au travers du corps), avec ses pontets &rdquo;Bullet&rdquo; compens&eacute;s, est le mod&egrave;le le plus confortable que nous ayons jamais cr&eacute;&eacute; sur une Tele. Il conserve le timbre classique offert par les pontets en laiton et offre une excellente intonation ainsi que diff&eacute;rentes options de configuration. Vous pouvez ainsi r&eacute;gler la tension et le son de chaque corde comme vous le souhaitez.</span></p>', '2021-09-30 10:04:08', '2021-10-05 14:28:36', 1),
(29, 'AMERICAN PROFESSIONAL II', 'JAZZ BASS', '0147362376_fen_ins_frt_1_rr.jpg', '2199.00', 75, '<ul>\r\n<li>Deux micros V-Mod II Jazz Bass &agrave; simples bobinages</li>\r\n<li>Profil de manche Slim &rdquo;C&rdquo; avec bords de touche arrondis</li>\r\n<li>Sillet en os ; 20 frettes narrow-tall</li>\r\n<li>Chevalet HiMass&trade; Vintage pour un sustain accru</li>\r\n<li>Tiges de renfort du manche Posiflex en graphite</li>\r\n<li>&Eacute;tui rigide moul&eacute; Elite inclus</li>\r\n</ul>', '<p style=\"text-align: justify;\">L&rsquo;American Professional II Jazz Bass&reg; profite de plus de soixante ans d&rsquo;innovation, d&rsquo;inspiration et d&rsquo;&eacute;volution pour satisfaire les besoins des bassistes professionnels d&rsquo;aujourd&rsquo;hui. Notre manche populaire au profil Slim &rdquo;C&rdquo; pr&eacute;sente dor&eacute;navant des bords de touche arrondis tr&egrave;s agr&eacute;ables, une finition satin&eacute;e &rdquo;Super-Natural&rdquo; et un tout nouveau talon de manche sculpt&eacute; qui offre un toucher particuli&egrave;rement confortable et un acc&egrave;s ais&eacute; aux aigus. Les nouveaux micros &agrave; simples bobinages V-Mod II Jazz Bass produisent le son clair et punchy qui fait la r&eacute;putation de la Jazz Bass mais ils sont plus pr&eacute;cis que jamais. L&rsquo;American Pro II Jazz Bass est un instrument polyvalent qui vous semblera imm&eacute;diatement familier.</p>', '2021-09-30 10:04:08', '2021-12-02 16:14:43', 4),
(30, 'REDONDO', 'CLASSIC', '0970913137_gtr_frt_001_rr.jpg', '768.00', 88, '<ul>\r\n<li>Forme de corps Redondo, une exclusivit&eacute; de Fender</li>\r\n<li>Table en &eacute;pic&eacute;a massif ; dos et &eacute;clisses en acajou massif</li>\r\n<li>Syst&egrave;me de micro/pr&eacute;ampli Fishman con&ccedil;u en exclusivit&eacute; pour Fender</li>\r\n<li>Manche en acajou au profil Slim-Taper en \"C\" ; touche rapport&eacute;e et chevalet en pau ferro</li>\r\n<li>T&ecirc;te de manche inclin&eacute;e vers l&rsquo;arri&egrave;re avec 6 m&eacute;caniques en ligne</li>\r\n<li>Housse deluxe incluse</li>\r\n</ul>', '<p style=\"text-align: justify;\"><span style=\"color: #212529; font-family: SourceSansPro, Helvetica, Arial, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">Cette guitare dreadnought acoustique, audacieuse et impertinente, a &eacute;t&eacute; pens&eacute;e pour d&eacute;clencher l\'inspiration d&egrave;s les premi&egrave;res notes. La Redondo Classic pr&eacute;sente une table en &eacute;pic&eacute;a massif, un dos et des &eacute;clisses en acajou massif pour que son timbre riche et imposant r&eacute;sonne dans n&rsquo;importe quel espace. Cette guitare pens&eacute;e pour le jeu en direct est &eacute;galement &eacute;quip&eacute;e d\'un syst&egrave;me de pr&eacute;ampli con&ccedil;u par Fender et Fishman&reg; et r&eacute;gl&eacute; sp&eacute;cialement pour la forme du corps de la Redondo. Il permet de reproduire le timbre naturel de l&rsquo;instrument lorsqu&rsquo;il est branch&eacute; &agrave; un amplificateur. Le manche en acajou pr&eacute;sente un confortable profil Slim-Taper en &rdquo;C&rdquo; inspir&eacute; des mod&egrave;les &eacute;lectriques historiques de Fender.</span></p>', '2021-09-30 10:04:08', '2021-10-05 14:42:02', 2),
(33, 'JOE STRUMMER', '13\' INSTRUMENT CABLE', '0990810276_fen_acc_frt_1_nr.jpg', '30.00', 69, '<ul>\r\n<li>Available in 13\' length</li>\r\n<li>Offered in Drab Green</li>\r\n<li>8mm outer diameter wire jacket</li>\r\n<li>23 AWG</li>\r\n<li>90% OFC spiral shielding</li>\r\n<li>Nickel-plated connectors</li>\r\n<li>Backed by a lifetime guarantee</li>\r\n</ul>', '<p style=\"text-align: justify;\">The Legendary Joe Strummer played guitar with an intensity that cut like a knife with raw energy and passion in every intense swipe at the strings. He was the embodiment of Punk culture and a crucial component to its development. Best known for his work with The Clash, Strummer and his bandmates were a major part of creating punk rock and has inspired countless other bands to this day.</p>', '2021-10-04 10:13:00', '2022-03-24 10:51:20', 9),
(34, 'Rode', 'NT1-A Complete Vocal Recording', 'crop_2.jpg', '159.00', 92, '<ul>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">Microphone large membrane de 1 pouce</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">Diagramme polaire : cardio&iuml;de</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">R&eacute;ponse en fr&eacute;quence : 20 - 20000 Hz</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">Niveau de pression acoustique limite : 137 dB</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">Imp&eacute;dance de sortie : 100 Ohm</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">Contacts de sortie plaqu&eacute;s or</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">Dimensions (H x L x P) : 190 x 50 x 50 mm</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">Poids : 326 g</span></li>\r\n</ul>', '<ul>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">Microphone large membrane Rode NT1-A</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">Suspension &eacute;lastique deluxe SM6 avec filtre anti-pop en tissu int&eacute;gr&eacute;</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">C&acirc;ble XLR de 6 m</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">Sac de protection contre la poussi&egrave;re</span></li>\r\n</ul>', '2021-10-04 20:41:47', '2021-10-26 09:12:53', 18),
(35, 'Millenium', 'Focus Junior Drum Set Black', '15776950_800.jpg', '148.00', 101, '<ul>\r\n<li><span style=\"box-sizing: border-box; padding: 1px 0px 0px; vertical-align: top; font-size: 14px; margin: 0px; display: block; line-height: 21px; letter-spacing: -0.1px; font-weight: 400;\">S&eacute;rie Focus</span></li>\r\n<li><span style=\"box-sizing: border-box; padding: 1px 0px 0px; vertical-align: top; font-size: 14px; margin: 0px; display: block; line-height: 21px; letter-spacing: -0.1px; font-weight: 400;\">Convient aux enfants de 4 &agrave; 7 ans</span></li>\r\n<li><span style=\"box-sizing: border-box; padding: 1px 0px 0px; vertical-align: top; font-size: 14px; margin: 0px; display: block; line-height: 21px; letter-spacing: -0.1px; font-weight: 400;\">Grosse caisse 16\"x10\"</span></li>\r\n<li><span style=\"box-sizing: border-box; padding: 1px 0px 0px; vertical-align: top; font-size: 14px; margin: 0px; display: block; line-height: 21px; letter-spacing: -0.1px; font-weight: 400;\">Tom 08\"x05\"</span></li>\r\n<li><span style=\"box-sizing: border-box; padding: 1px 0px 0px; vertical-align: top; font-size: 14px; margin: 0px; display: block; line-height: 21px; letter-spacing: -0.1px; font-weight: 400;\">Tom 10\"x06\"</span></li>\r\n<li><span style=\"box-sizing: border-box; padding: 1px 0px 0px; vertical-align: top; font-size: 14px; margin: 0px; display: block; line-height: 21px; letter-spacing: -0.1px; font-weight: 400;\">Stand tom 13\"x11\"</span></li>\r\n<li><span style=\"box-sizing: border-box; padding: 1px 0px 0px; vertical-align: top; font-size: 14px; margin: 0px; display: block; line-height: 21px; letter-spacing: -0.1px; font-weight: 400;\">Caisse claire en bois 12\"x05\"</span></li>\r\n<li><span style=\"box-sizing: border-box; padding: 1px 0px 0px; vertical-align: top; font-size: 14px; margin: 0px; display: block; line-height: 21px; letter-spacing: -0.1px; font-weight: 400;\">Finition: Rhodo&iuml;d</span></li>\r\n<li><span style=\"box-sizing: border-box; padding: 1px 0px 0px; vertical-align: top; font-size: 14px; margin: 0px; display: block; line-height: 21px; letter-spacing: -0.1px; font-weight: 400;\">Couleur: Noir</span></li>\r\n</ul>', '<p style=\"text-align: justify;\"><span style=\"color: #3b3b3b; font-family: \'Open Sans\', Verdana, Tahoma, Arial, Helvetica, sans-serif; font-size: 15.36px; font-style: normal; font-variant-ligatures: no-common-ligatures; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; float: none; display: inline !important;\">Le Focus Junior Drum Set Black de Millenium propose un &eacute;quipement complet pour accompagner sans prise de t&ecirc;te les premiers pas des jeunes batteurs ambitieux ! Apr&egrave;s avoir d&eacute;ball&eacute;, mont&eacute; et accord&eacute; votre batterie, votre enfant aura tout ce qu\'il faut pour commencer &agrave; \"tambouriner\" sans plus attendre. L\'ensemble comprend cinq f&ucirc;ts dont une caisse claire en bois, ainsi qu\'une charley de 10 pouces, une cymbale crash/ride de 12 pouces, tous les pieds n&eacute;cessaires dont celui de la charley, une p&eacute;dale de grosse caisse et un tabouret. <br /></span></p>', '2021-10-05 09:13:37', '2021-10-06 14:39:32', 11),
(36, 'Millenium', 'Youngster Drum Set Green', '11680618_800.jpg', '98.00', 29, '<ul>\r\n<li><span style=\"box-sizing: border-box; padding: 1px 0px 0px; vertical-align: top; font-size: 14px; margin: 0px; display: block; line-height: 21px; letter-spacing: -0.1px; font-weight: 400;\">Id&eacute;ale pour les enfants &agrave; partir de 3 ans</span></li>\r\n<li><span style=\"box-sizing: border-box; padding: 1px 0px 0px; vertical-align: top; font-size: 14px; margin: 0px; display: block; line-height: 21px; letter-spacing: -0.1px; font-weight: 400;\">Grosse caisse 16\"x12\"</span></li>\r\n<li><span style=\"box-sizing: border-box; padding: 1px 0px 0px; vertical-align: top; font-size: 14px; margin: 0px; display: block; line-height: 21px; letter-spacing: -0.1px; font-weight: 400;\">Tom 08\"x05\"</span></li>\r\n<li><span style=\"box-sizing: border-box; padding: 1px 0px 0px; vertical-align: top; font-size: 14px; margin: 0px; display: block; line-height: 21px; letter-spacing: -0.1px; font-weight: 400;\">Caisse claire 10\"x04\"</span></li>\r\n<li><span style=\"box-sizing: border-box; padding: 1px 0px 0px; vertical-align: top; font-size: 14px; margin: 0px; display: block; line-height: 21px; letter-spacing: -0.1px; font-weight: 400;\">F&ucirc;ts en bois dur</span></li>\r\n<li><span style=\"box-sizing: border-box; padding: 1px 0px 0px; vertical-align: top; font-size: 14px; margin: 0px; display: block; line-height: 21px; letter-spacing: -0.1px; font-weight: 400;\">Accastillage noir</span></li>\r\n<li><span style=\"box-sizing: border-box; padding: 1px 0px 0px; vertical-align: top; font-size: 14px; margin: 0px; display: block; line-height: 21px; letter-spacing: -0.1px; font-weight: 400;\">Finition: Rhodo&iuml;d</span></li>\r\n<li><span style=\"box-sizing: border-box; padding: 1px 0px 0px; vertical-align: top; font-size: 14px; margin: 0px; display: block; line-height: 21px; letter-spacing: -0.1px; font-weight: 400;\">Couleur: Green Sparkle</span></li>\r\n</ul>', '<p style=\"text-align: justify;\"><span style=\"color: #000000;\"><span style=\"font-family: \'Open Sans\', Verdana, Tahoma, Arial, Helvetica, sans-serif; font-size: 15.36px; font-style: normal; font-variant-ligatures: no-common-ligatures; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; float: none; display: inline !important;\">La </span><span style=\"font-family: \'Open Sans\', Verdana, Tahoma, Arial, Helvetica, sans-serif; font-size: 15.36px; font-style: normal; font-variant-ligatures: no-common-ligatures; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; float: none; display: inline !important;\">batterie Millenium pour enfants en jette carr&eacute;ment avec son vert brillant m&eacute;tallis&eacute; ! Cette batterie est si petite que m&ecirc;me les enfants de trois ans pourront se d&eacute;fouler avec! Elle poss&egrave;de tous les &eacute;l&eacute;ments que vous pourriez attendre d\'une batterie professionnelle : une caisse claire, un tom alto, un tom m&eacute;dium, une grosse caisse, une charleston, une cymbale crash, des p&eacute;dales et m&ecirc;me un tabouret. Le rev&ecirc;tement noir de la ferrure tape &eacute;galement &agrave; l&rsquo;&oelig;il, et, bien entendu, une paire de baguettes est fournie afin de pouvoir imm&eacute;diatement se mettre &agrave; l&rsquo;&oelig;uvre.</span></span></p>', '2021-10-05 09:42:07', '2021-10-05 10:05:45', 11),
(37, 'PLAYER PLUS', 'TELECASTER', '0147333336_fen_ins_frt_1_rr.jpg', '1049.00', 62, '<ul>\r\n<li>Micros Telecaster Player Plus Noiseless</li>\r\n<li>Touche au radius de 12\" (305 mm) avec bords arrondis</li>\r\n<li>Chevalet de Tele moderne &agrave; 6 pontets moul&eacute;s en acier</li>\r\n<li>Contr&ocirc;le de tonalit&eacute; push-pull activant le c&acirc;blage des deux micros en s&eacute;rie</li>\r\n<li>M&eacute;caniques bloquantes</li>\r\n</ul>', '<p style=\"text-align: justify;\"><span style=\"color: #212529; font-family: SourceSansPro, Helvetica, Arial, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">La Player Plus Telecaster&reg; fusionne le design classique de Fender&reg;, des fonctionnalit&eacute;s pens&eacute;es pour le jeu et de nouvelles finitions &eacute;tonnantes, pour vous faire profiter d&rsquo;un toucher exceptionnel et d&rsquo;un style inimitable. La Player Plus Tele&reg; vous permet de retrouver le doux twang chaleureux de la Tele&reg;, mais sans aucun souffle, gr&acirc;ce &agrave; son jeu de micros Player Plus Noiseless&trade;. Un commutateur push-pull install&eacute; sur le contr&ocirc;le de tonalit&eacute; configure les deux micros en s&eacute;rie, ce qui accroit le niveau de sortie et produit un son plus charnu. Gr&acirc;ce &agrave; la douce finition satin&eacute;e et aux bords arrondis du manche au profil &rdquo;Modern C&rdquo;, votre main glissera sur cette Player Plus Tele&reg; avec une facilit&eacute; d&eacute;concertante. La touche au radius de 12&rdquo; (305 mm), avec ses 22 frettes medium jumbo, vous aidera &agrave; jouer des solos avec une fluidit&eacute; hors pair et &agrave; effectuer des bendings sans faire friser les cordes.</span><span style=\"color: #212529; font-family: SourceSansPro, Helvetica, Arial, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\"> </span><span style=\"color: #212529; font-family: SourceSansPro, Helvetica, Arial, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\"><br /></span></p>', '2021-10-05 14:33:26', '2021-10-05 14:36:07', 1),
(38, 'CD-60S', 'ALL-MAHOGANY', '0970110022_gtr_frt_001_rr.jpg', '220.00', 88, '<ul>\r\n<li>Corps de style Dreadnought</li>\r\n<li>Table en acajou massif avec barrage scallop&eacute; en \"X\"</li>\r\n<li>Dos et &eacute;clisses en acajou</li>\r\n<li>Manche \"facile &agrave; jouer\" avec bords de touche arrondis</li>\r\n</ul>', '<p style=\"text-align: justify;\"><span style=\"color: #212529; font-family: SourceSansPro, Helvetica, Arial, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">La CD-60S All-Mahogany ajoute &agrave; l\'un de nos mod&egrave;les les plus populaires une table en acajou massif pour un son organique unique. Elle est id&eacute;ale pour les guitaristes qui recherchent un mod&egrave;le Dreadnought de haute qualit&eacute;, aussi bien en termes de son que de facilit&eacute; de jeu, mais qui reste malgr&eacute; tout abordable. Avec son nouveau manche \"facile &agrave; jouer\", son dos et ses &eacute;clisses en acajou, la CD-60S All-Mahogany trouvera aussi bien sa place chez vous que sur la plage ou dans un caf&eacute;-concert &mdash; partout o&ugrave; vous souhaitez partager le son et le style classiques de Fender.</span></p>', '2021-10-05 14:44:41', '2021-10-05 16:44:41', 2),
(39, 'AMERICAN ACOUSTASONIC®', 'STRATOCASTER® COCOBOLO', '0972023096_fen_ins_frt_1_rr.jpg', '3499.00', 58, '<ul>\r\n<li><span style=\"box-sizing: border-box;\" data-sheets-value=\"{\" data-sheets-userformat=\"{\">Guitare &eacute;lectro-acoustique de pointe<br style=\"box-sizing: border-box;\" /></span></li>\r\n<li><span style=\"box-sizing: border-box;\" data-sheets-value=\"{\" data-sheets-userformat=\"{\">L&rsquo;Acoustic Engine offre de nouvelles combinaisons de styles de corps et de bois<br style=\"box-sizing: border-box;\" /></span></li>\r\n<li><span style=\"box-sizing: border-box;\" data-sheets-value=\"{\" data-sheets-userformat=\"{\">Potentiom&egrave;tre Mod pour s&eacute;lectionner et m&eacute;langer les timbres<br style=\"box-sizing: border-box;\" /></span></li>\r\n<li><span style=\"box-sizing: border-box;\" data-sheets-value=\"{\" data-sheets-userformat=\"{\">Syst&egrave;me SIRS (Stringed Instrument Resonance System) Brevet&eacute;<br style=\"box-sizing: border-box;\" /></span></li>\r\n<li><span style=\"box-sizing: border-box;\" data-sheets-value=\"{\" data-sheets-userformat=\"{\">Trois syst&egrave;mes de micros : Piezo Fishman sous le Chevalet ; Fishman Acoustasonic Enhancer ; micro &eacute;lectromagn&eacute;tique Fender Acoustasonic Noiseless&trade;</span></li>\r\n</ul>', '<p style=\"text-align: justify;\"><span style=\"color: #212529; font-family: SourceSansPro, Helvetica, Arial, sans-serif; font-size: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">L&rsquo;American Acoustasonic&trade; Stratocaster&reg; continue d&rsquo;incarner l&rsquo;esprit r&eacute;solument tourn&eacute; vers l&rsquo;innovation qui nourrit la cr&eacute;ation des guitares Fender. La puissance de l&rsquo;Acoustic Engine con&ccedil;u par Fender et Fishman&reg; est indubitablement un moteur d&rsquo;inspiration. Des sons acoustiques m&eacute;tamorphes aux variations rythmiques &eacute;lectriques, cette guitare particuli&egrave;rement polyvalente ouvre une nouvelle voie sonore.</span></p>', '2021-10-05 14:49:22', '2021-10-05 16:49:22', 3),
(40, 'Roland', 'GO:KEYS', '12368157_800.jpg', '255.55', 97, '<ul>\r\n<li><span style=\"box-sizing: border-box;\">Nombre de touches </span><span class=\"fx-text fx-text--bold fx-text--no-margin\" style=\"box-sizing: border-box; line-height: 24px; letter-spacing: -0.26px; font-weight: bold; margin: 0px;\">61</span></li>\r\n<li><span style=\"box-sizing: border-box;\">Touches lumineuses </span><span class=\"fx-text fx-text--bold fx-text--no-margin\" style=\"box-sizing: border-box; line-height: 24px; letter-spacing: -0.26px; font-weight: bold; margin: 0px;\">Non</span></li>\r\n<li><span style=\"box-sizing: border-box;\">Sensible &agrave; la v&eacute;locit&eacute; </span><span class=\"fx-text fx-text--bold fx-text--no-margin\" style=\"box-sizing: border-box; line-height: 24px; letter-spacing: -0.26px; font-weight: bold; margin: 0px;\">Oui</span></li>\r\n<li><span style=\"box-sizing: border-box;\">Aftertouch</span><span class=\"fx-text fx-text--bold fx-text--no-margin\" style=\"box-sizing: border-box; line-height: 24px; letter-spacing: -0.26px; font-weight: bold; margin: 0px;\">Non</span></li>\r\n<li><span style=\"box-sizing: border-box;\">M&eacute;dia de sauvegarde </span><span class=\"fx-text fx-text--bold fx-text--no-margin\" style=\"box-sizing: border-box; line-height: 24px; letter-spacing: -0.26px; font-weight: bold; margin: 0px;\">Aucun</span></li>\r\n<li><span style=\"box-sizing: border-box;\">Affichage des paroles </span><span class=\"fx-text fx-text--bold fx-text--no-margin\" style=\"box-sizing: border-box; line-height: 24px; letter-spacing: -0.26px; font-weight: bold; margin: 0px;\">Non</span></li>\r\n<li><span style=\"box-sizing: border-box;\">Affichage de la partition </span><span class=\"fx-text fx-text--bold fx-text--no-margin\" style=\"box-sizing: border-box; line-height: 24px; letter-spacing: -0.26px; font-weight: bold; margin: 0px;\">Non</span></li>\r\n<li><span style=\"box-sizing: border-box;\">Harmonie vocale </span><span class=\"fx-text fx-text--bold fx-text--no-margin\" style=\"box-sizing: border-box; line-height: 24px; letter-spacing: -0.26px; font-weight: bold; margin: 0px;\">Non</span></li>\r\n<li><span style=\"box-sizing: border-box;\">Enregistreur audio USB</span><span class=\"fx-text fx-text--bold fx-text--no-margin\" style=\"box-sizing: border-box; line-height: 24px; letter-spacing: -0.26px; font-weight: bold; margin: 0px;\">Non</span></li>\r\n<li><span style=\"box-sizing: border-box;\">Interface MIDI </span><span class=\"fx-text fx-text--bold fx-text--no-margin\" style=\"box-sizing: border-box; line-height: 24px; letter-spacing: -0.26px; font-weight: bold; margin: 0px;\">Aucune</span></li>\r\n<li><span style=\"box-sizing: border-box;\">Entr&eacute;e microphone </span><span class=\"fx-text fx-text--bold fx-text--no-margin\" style=\"box-sizing: border-box; line-height: 24px; letter-spacing: -0.26px; font-weight: bold; margin: 0px;\">Non</span></li>\r\n<li><span style=\"box-sizing: border-box;\">Port USB </span><span class=\"fx-text fx-text--bold fx-text--no-margin\" style=\"box-sizing: border-box; line-height: 24px; letter-spacing: -0.26px; font-weight: bold; margin: 0px;\">Oui</span></li>\r\n</ul>', '<ul>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">61 touches Ivory Feel et boutons en forme de boite sensible &agrave; la v&eacute;locit&eacute;</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">Polyphonie 128 voix</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">Bluetooth 4.2</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">Format MIDI conforme GM2</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">Plus de 500 sons</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">Multi effets / Chorus / Reverb</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">Fonction de transposition</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">Plus de 12 boucles</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">Plus de 672 motifs (12 sets x 56 motifs)</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">10 Pads de performance</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">Fonctions Bender: Pitch Bend et effet de modulation: Roll / Filter</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">Enregistreur: format de fichier MIDI standard 0</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">Affichage LCD</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">2 haut-parleurs de 2,5 Watt chacun</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">Fonctionnement sur batterie possible</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">Dimensions: 877 x 271 x 82 mm</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">Connexions: sorties jack, entr&eacute;e auxiliaire, p&eacute;dale, port USB h&ocirc;te</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">Poids sans alimentation: 3,9 kg</span></li>\r\n<li><span class=\"fx-text fx-text--plus\" style=\"box-sizing: border-box; font-size: 18px; line-height: 22px; letter-spacing: -0.29px; margin: 0px 0px 26px;\">Bloc d\'alimentation PSD-230 EU incl.</span></li>\r\n</ul>', '2021-10-13 08:49:26', '2021-10-13 13:55:15', 14);

-- --------------------------------------------------------

--
-- Структура таблицы `subcat`
--

CREATE TABLE `subcat` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `subcat`
--

INSERT INTO `subcat` (`id`, `name`, `category_id`) VALUES
(1, 'Guitares Electriques', 1),
(2, 'Guitares Classiques', 1),
(3, 'Guitares Acoustiques & Electro-Acoustiques', 1),
(4, 'Basses Electriques', 1),
(5, 'Basses Acoustiques', 1),
(6, 'Basses Semi-Acoustiques', 1),
(7, 'Ukulélés', 1),
(8, 'Autres instruments à cordes pincées', 1),
(9, 'Câbles', 8),
(10, 'Pieds & Supports', 8),
(11, 'Acoustiques', 2),
(12, 'Electroniques', 2),
(13, 'Percussions', 2),
(14, 'Arrangeurs', 3),
(15, 'Maîtres', 3),
(16, 'Pianos de Scène', 3),
(17, 'Interfaces Audio', 4),
(18, 'Microphones', 4),
(19, 'Casques', 4),
(20, 'Tables de Mixage', 5),
(21, 'Systèmes sans Fil', 5),
(22, 'Connectique', 5),
(23, 'Contrôleurs DJ', 6),
(24, 'Platines Vinyles', 6),
(25, 'Tables/Meubles DJ', 6),
(26, 'Flight Cases', 7),
(27, 'Housses & Etuis', 7),
(28, 'Système de Transport', 7),
(29, 'Sièges & Tabourets', 8),
(30, 'Projecteurs', 13),
(31, 'Machines à Fumée', 13),
(32, 'Lasers', 13),
(33, 'En­ceintes de So­no­ri­sa­tion', 5);

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `client_id`) VALUES
(2, '44@ii.mm', '[\"ROLE_CLIENT\"]', '$2y$13$XH6Q0SUjv5YE3gGZYQCe6u6uWMymEeE9oQawW8.Nt3dBZ596pY25m', 3),
(3, 'alice@gmail.com', '[\"ROLE_CLIENT\"]', '$2y$13$5SL7Gl2OaT4QvzKVFZKJWuZckybN4yUn9MbdUqCWYo8j0LmWAmK4y', 4),
(6, 'admin@gmail.com', '[\"ROLE_ADMIN\"]', '$2y$13$yf3J6kYh42cv5QthW0Opz.8gWNRj4wGbfzXuv/ThaKHMo6.Lq8ooC', 5),
(7, 'murrrrrlena@gmail.com', '[\"ROLE_CLIENT\"]', '$2y$13$YMiWdQAXcof7TsI0otgTb.x1euq6obbEQQzaFSKXTMeMYWN90u0Ea', 6),
(8, 'vandamme@gmail.com', '[\"ROLE_CLIENT\"]', '$2y$13$AkMyHmexpNVfl1oXsfkCPePsskIJZD/9mXEk8KWNhuxoFrYQa/Y1K', 7),
(9, 'marion@gmail.com', '[\"ROLE_CLIENT\"]', '$2y$13$RMKX0hmlDYXWOtKxZ0cRCuV9KwFffwC3HM19EemJbdvHNzeNQ6.lq', 8);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_C7440455F92F3E70` (`country_id`);

--
-- Индексы таблицы `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_F529939819EB6921` (`client_id`),
  ADD KEY `IDX_F5299398F92F3E70` (`country_id`);

--
-- Индексы таблицы `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_ED896F464584665A` (`product_id`),
  ADD KEY `IDX_ED896F46CFFE9AD6` (`orders_id`);

--
-- Индексы таблицы `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D34A04AD80D12166` (`subcat_id`);

--
-- Индексы таблицы `subcat`
--
ALTER TABLE `subcat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_FD76144112469DE2` (`category_id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`),
  ADD UNIQUE KEY `UNIQ_8D93D64919EB6921` (`client_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `client`
--
ALTER TABLE `client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `country`
--
ALTER TABLE `country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT для таблицы `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT для таблицы `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT для таблицы `subcat`
--
ALTER TABLE `subcat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `FK_C7440455F92F3E70` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`);

--
-- Ограничения внешнего ключа таблицы `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `FK_F529939819EB6921` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`),
  ADD CONSTRAINT `FK_F5299398F92F3E70` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`);

--
-- Ограничения внешнего ключа таблицы `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `FK_ED896F464584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `FK_ED896F46CFFE9AD6` FOREIGN KEY (`orders_id`) REFERENCES `order` (`id`);

--
-- Ограничения внешнего ключа таблицы `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_D34A04AD80D12166` FOREIGN KEY (`subcat_id`) REFERENCES `subcat` (`id`);

--
-- Ограничения внешнего ключа таблицы `subcat`
--
ALTER TABLE `subcat`
  ADD CONSTRAINT `FK_FD76144112469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Ограничения внешнего ключа таблицы `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_8D93D64919EB6921` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
