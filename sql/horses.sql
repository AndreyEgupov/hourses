-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Май 05 2015 г., 20:33
-- Версия сервера: 5.5.43-0ubuntu0.14.04.1
-- Версия PHP: 5.5.9-1ubuntu4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `horses`
--

-- --------------------------------------------------------

--
-- Структура таблицы `attributes`
--

CREATE TABLE IF NOT EXISTS `attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT 'цвет',
  `alias` varchar(45) DEFAULT NULL COMMENT 'color',
  `type` varchar(45) NOT NULL DEFAULT 'string' COMMENT 'int,string,date,boolean,color',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `parent_sort_id` varchar(255) DEFAULT NULL COMMENT 'by 1.2.3 or 4.',
  `title` varchar(255) NOT NULL,
  `icon_class` varchar(45) DEFAULT NULL COMMENT 'fa-*',
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=114 ;

--
-- Дамп данных таблицы `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `parent_sort_id`, `title`, `icon_class`, `sort`) VALUES
(1, NULL, '1.', 'всадник \n', NULL, 1),
(2, 1, '1.2.', 'бриджи', NULL, 9999),
(3, 1, '1.3.', 'ботинки, краги, сапоги', NULL, 9999),
(4, 1, '1.4.', 'куртки', NULL, 9999),
(5, 1, '1.5.', 'толстовки,свитера', NULL, 9999),
(6, 1, '1.6.', 'гольфы,носки', NULL, 9999),
(7, 1, '1.7.', 'перчатки', NULL, 9999),
(8, 1, '1.8.', 'футболки,рубашки', NULL, 9999),
(9, 1, '1.9.', 'жилеты', NULL, 9999),
(10, 1, '1.10.', 'шлема.защитные жилеты', NULL, 9999),
(11, 1, '1.11.', 'для выступлений', NULL, 9999),
(12, 1, '1.12.', 'сумки. ремни. чехлы', NULL, 9999),
(13, 1, '1.13.', 'головные уборы. шарфы', NULL, 9999),
(14, 1, '1.14.', 'нижнее белье', NULL, 9999),
(15, 1, '1.15.', 'светоотражающие изделия', NULL, 9999),
(16, 1, '1.16.', 'хлысты', NULL, 9999),
(17, 1, '1.17.', 'шпоры', NULL, 9999),
(18, NULL, '18.', 'лошадь\n', NULL, 2),
(19, 18, '18.19.', 'оголовья. железо. поводья', NULL, 9999),
(20, 18, '18.20.', 'недоуздки и чумбуры', NULL, 9999),
(21, 18, '18.21.', 'вальтрапы', NULL, 9999),
(22, 18, '18.22.', 'ушки', NULL, 9999),
(23, 18, '18.23.', 'амортизаторы', NULL, 9999),
(24, 18, '18.24.', 'седла.подпруги стремена', NULL, 9999),
(25, 18, '18.25.', 'ногавки', NULL, 9999),
(26, 18, '18.26.', 'бинты', NULL, 9999),
(27, 18, '18.27.', 'попоны', NULL, 9999),
(28, 18, '18.28.', 'работа на корде', NULL, 9999),
(29, 18, '18.29.', 'для выступлений', NULL, 9999),
(30, 18, '18.30.', 'светоотражающие изделия', NULL, 9999),
(31, 18, '18.31.', 'подкормки. лакомства', NULL, 9999),
(32, 18, '18.32.', 'уход за лошадью', NULL, 9999),
(33, 18, '18.33.', 'уход за амуницией', NULL, 9999),
(34, 18, '18.34.', 'ковка,расчистка', NULL, 9999),
(35, NULL, '35.', 'конюшня ', NULL, 3),
(36, 35, '35.36.', 'кормление и поение', NULL, 9999),
(37, 35, '35.37.', 'кронштейны и карабины', NULL, 9999),
(38, 35, '35.38.', 'манежное оборудование', NULL, 9999),
(39, 35, '35.39.', 'уборка конюшни', NULL, 9999),
(40, NULL, '40.', 'упряжь', NULL, 9999),
(41, NULL, '41.', 'вестерн всадник лошадь', NULL, 9999),
(42, 41, '41.42.', 'всадник', NULL, 9999),
(43, 41, '41.43.', 'лошадь', NULL, 9999),
(44, NULL, '44.', 'для собак ', NULL, 4),
(45, 44, '44.45.', 'лежанки, одежда', NULL, 9999),
(46, 44, '44.46.', 'ошейники, поводки', NULL, 9999),
(47, 44, '44.47.', 'игрушки', NULL, 9999),
(48, NULL, '48.', 'сувениры ', NULL, 9999),
(49, 48, '48.49.', 'брелоки', NULL, 9999),
(50, 48, '48.50.', 'игрушки', NULL, 9999),
(51, 48, '48.51.', 'подарки, кружки', NULL, 9999),
(52, 48, '48.52.', 'подушки, одеяла', NULL, 9999),
(53, 48, '48.53.', 'украшения, часы', NULL, 9999),
(54, NULL, '54.', 'скидки ', NULL, 9999),
(55, NULL, '55.', 'новинки ', NULL, 9999),
(56, NULL, '56.', 'товар в наличии ', NULL, 9999),
(57, 56, '56.57.', 'для всадника', NULL, 9999),
(58, 56, '56.58.', 'для лошади', NULL, 9999),
(59, 1, '1.59.', 'бриджи ', NULL, 9999),
(60, 2, '1.2.60.', 'женские бриджи ', NULL, 9999),
(61, 2, '1.2.61.', 'детские бриджи ', NULL, 9999),
(62, 2, '1.2.62.', 'мужские бриджи ', NULL, 9999),
(63, 3, '1.3.63.', 'сапоги ', NULL, 9999),
(64, 3, '1.3.64.', 'ботинки ', NULL, 9999),
(65, 3, '1.3.65.', 'краги ', NULL, 9999),
(66, 3, '1.3.66.', 'аксессуары ', NULL, 9999),
(67, 19, '18.19.67.', 'трензельные ', NULL, 9999),
(68, 19, '18.19.68.', 'мундштучные ', NULL, 9999),
(69, 19, '18.19.69.', 'железо ', NULL, 9999),
(70, 19, '18.19.70.', 'капсюли ', NULL, 9999),
(71, 19, '18.19.71.', 'налобники ', NULL, 9999),
(72, 19, '18.19.72.', 'поводья, вспомогательные элементы ', NULL, 9999),
(73, 19, '18.19.73.', 'аксессуары ', NULL, 9999),
(74, 20, '18.20.74.', 'недоуздки ', NULL, 9999),
(75, 20, '18.20.75.', 'чумбуры ', NULL, 9999),
(76, 24, '18.24.76.', 'седла ', NULL, 9999),
(77, 24, '18.24.77.', 'подпруги ', NULL, 9999),
(78, 24, '18.24.78.', 'стремена ', NULL, 9999),
(79, 24, '18.24.79.', 'путлища ', NULL, 9999),
(80, 24, '18.24.80.', 'аксессуары ', NULL, 9999),
(81, 25, '18.25.81.', 'колокольчики ', NULL, 9999),
(82, 25, '18.25.82.', 'ногавки ', NULL, 9999),
(83, 25, '18.25.83.', 'транспортные, денниковые ногавки ', NULL, 9999),
(84, 27, '18.27.84.', 'прогулочные попоны ', NULL, 9999),
(85, 27, '18.27.85.', 'попоны-сетки ', NULL, 9999),
(86, 27, '18.27.86.', 'попоны под седло ', NULL, 9999),
(87, 27, '18.27.87.', 'теплые попоны ', NULL, 9999),
(88, 27, '18.27.88.', 'флисовые попоны ', NULL, 9999),
(89, 27, '18.27.89.', 'аксессуары ', NULL, 9999),
(90, 32, '18.32.90.', 'щётки, скребницы ', NULL, 9999),
(91, 32, '18.32.91.', 'ящики, сумки ', NULL, 9999),
(92, 32, '18.32.92.', 'машинки для стрижки, пылесосы ', NULL, 9999),
(93, 32, '18.32.93.', 'уход за лошадью ', NULL, 9999),
(94, 42, '41.42.94.', 'одежда western ', NULL, 9999),
(95, 42, '41.42.95.', 'обувь western ', NULL, 9999),
(96, 42, '41.42.96.', 'шпоры western ', NULL, 9999),
(97, 42, '41.42.97.', 'головные уборы western ', NULL, 9999),
(98, 42, '41.42.98.', 'аксессуары western ', NULL, 9999),
(99, 43, '41.43.99.', 'седла ', NULL, 9999),
(100, 43, '41.43.100.', 'амортизаторы ', NULL, 9999),
(101, 43, '41.43.101.', 'оголовья ', NULL, 9999),
(102, 43, '41.43.102.', 'железо ', NULL, 9999),
(103, 43, '41.43.103.', 'аксессуары ', NULL, 9999),
(104, 43, '41.43.104.', 'нагрудники ', NULL, 9999),
(105, 43, '41.43.105.', 'подпруги ', NULL, 9999),
(106, 69, '18.19.69.106.', 'трензеля ', NULL, 9999),
(107, 69, '18.19.69.107.', 'мундштуки ', NULL, 9999),
(108, 69, '18.19.69.108.', 'пелямы ', NULL, 9999),
(109, 69, '18.19.69.109.', 'хакаморы ', NULL, 9999),
(110, 76, '18.24.76.110.', 'выездковые ', NULL, 9999),
(111, 76, '18.24.76.111.', 'конкурные ', NULL, 9999),
(112, 76, '18.24.76.112.', 'универсальные ', NULL, 9999),
(113, 76, '18.24.76.113.', 'для пони ', NULL, 9999);

-- --------------------------------------------------------

--
-- Структура таблицы `config`
--

CREATE TABLE IF NOT EXISTS `config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Структура таблицы `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `position` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Структура таблицы `news`
--

CREATE TABLE IF NOT EXISTS `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `short_description` text NOT NULL,
  `date_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `meta_keywords` text,
  `meta_description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Структура таблицы `pages`
--

CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_keywords` tinytext,
  `meta_description` tinytext,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `price_old` double DEFAULT NULL,
  `description` text,
  `date_create` datetime DEFAULT NULL,
  `date_update` datetime DEFAULT NULL,
  `is_available` int(11) NOT NULL DEFAULT '1' COMMENT 'есть в наличии',
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `category_id`, `title`, `price`, `price_old`, `description`, `date_create`, `date_update`, `is_available`) VALUES
(1, 1, 'Тестовый продукт', 1000, 1200, 'Описание продкута', '2015-05-05 00:00:00', '2015-05-05 15:00:00', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `products_attribute`
--

CREATE TABLE IF NOT EXISTS `products_attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `attribute_value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `attribute_id` (`attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `products_image`
--

CREATE TABLE IF NOT EXISTS `products_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `src` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `products_image`
--

INSERT INTO `products_image` (`id`, `product_id`, `src`) VALUES
(3, 1, '/img/products/printed-summer-dress.jpg'),
(4, 1, '/img/products/printed-summer-dress2.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status_id` int(11) DEFAULT '1',
  `code_validate` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_group_id` int(11) DEFAULT '1',
  `balance` int(11) DEFAULT '0',
  `tariff_plan_id` int(11) DEFAULT '1' COMMENT 'тарифный план, по-умолчанию бесплатный, если 2 - оплаченный',
  `binding_ip` int(11) DEFAULT '0' COMMENT 'привязка к ip адрессу',
  `date_register` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `is_new` int(11) DEFAULT '1',
  `newsletter` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status_id` (`status_id`),
  KEY `user_group_id` (`user_group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Структура таблицы `users_autorisation`
--

CREATE TABLE IF NOT EXISTS `users_autorisation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `session_id` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `hash` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `last_ip` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `useragent` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `session_id` (`session_id`),
  KEY `session_id_2` (`session_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=25 ;

-- --------------------------------------------------------

--
-- Структура таблицы `user_group`
--

CREATE TABLE IF NOT EXISTS `user_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`);

--
-- Ограничения внешнего ключа таблицы `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Ограничения внешнего ключа таблицы `products_attribute`
--
ALTER TABLE `products_attribute`
  ADD CONSTRAINT `products_attribute_ibfk_2` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`),
  ADD CONSTRAINT `products_attribute_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Ограничения внешнего ключа таблицы `products_image`
--
ALTER TABLE `products_image`
  ADD CONSTRAINT `products_image_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Ограничения внешнего ключа таблицы `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`user_group_id`) REFERENCES `user_group` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
