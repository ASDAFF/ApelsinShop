-- phpMyAdmin SQL Dump
-- version 4.2.13.1
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Май 21 2015 г., 12:49
-- Версия сервера: 10.0.13-MariaDB
-- Версия PHP: 5.6.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `apelsin_shop_db`
--

-- --------------------------------------------------------

--
-- Структура таблицы `CreatedModules`
--

DROP TABLE IF EXISTS `CreatedModules`;
CREATE TABLE IF NOT EXISTS `CreatedModules` (
  `id` bigint(20) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  `module` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Очистить таблицу перед добавлением данных `CreatedModules`
--

TRUNCATE TABLE `CreatedModules`;
--
-- Дамп данных таблицы `CreatedModules`
--

INSERT IGNORE INTO `CreatedModules` (`id`, `name`, `module`) VALUES(101, 'Панель авторизации', 'authorizationUserPanel');
INSERT IGNORE INTO `CreatedModules` (`id`, `name`, `module`) VALUES(102, 'Переключение языка', 'langPanel');
INSERT IGNORE INTO `CreatedModules` (`id`, `name`, `module`) VALUES(201, 'Главное меню', 'menu');
INSERT IGNORE INTO `CreatedModules` (`id`, `name`, `module`) VALUES(401, 'ShopNavigationPanel', 'ShopNavigationPanel');
INSERT IGNORE INTO `CreatedModules` (`id`, `name`, `module`) VALUES(901, 'Основной копирайт', 'html');
INSERT IGNORE INTO `CreatedModules` (`id`, `name`, `module`) VALUES(902, 'Дополнительный копирайт', 'html');

-- --------------------------------------------------------

--
-- Структура таблицы `HtmlModul`
--

DROP TABLE IF EXISTS `HtmlModul`;
CREATE TABLE IF NOT EXISTS `HtmlModul` (
  `name` varchar(100) NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Очистить таблицу перед добавлением данных `HtmlModul`
--

TRUNCATE TABLE `HtmlModul`;
--
-- Дамп данных таблицы `HtmlModul`
--

INSERT IGNORE INTO `HtmlModul` (`name`, `description`) VALUES('copyMain', 'Основной копирайт');
INSERT IGNORE INTO `HtmlModul` (`name`, `description`) VALUES('copyText', 'Копирайт в футэре');

-- --------------------------------------------------------

--
-- Структура таблицы `HtmlModul_Lang`
--

DROP TABLE IF EXISTS `HtmlModul_Lang`;
CREATE TABLE IF NOT EXISTS `HtmlModul_Lang` (
  `htmlModul` varchar(100) NOT NULL,
  `lang` varchar(3) NOT NULL,
  `html` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Очистить таблицу перед добавлением данных `HtmlModul_Lang`
--

TRUNCATE TABLE `HtmlModul_Lang`;
--
-- Дамп данных таблицы `HtmlModul_Lang`
--

INSERT IGNORE INTO `HtmlModul_Lang` (`htmlModul`, `lang`, `html`) VALUES('copyMain', 'eng', '<div class="futerAdress">Ryazan</div>\r\n<div class="futerCopy">© 2011-2015<br>company «Apelsin»</div>');
INSERT IGNORE INTO `HtmlModul_Lang` (`htmlModul`, `lang`, `html`) VALUES('copyMain', 'rus', '<div class="futerAdress">г. Рязань</div>\r\n<div class="futerCopy">© 2011-2015<br>компания «Апельсин»</div>');
INSERT IGNORE INTO `HtmlModul_Lang` (`htmlModul`, `lang`, `html`) VALUES('copyText', 'eng', '<p>Apelsin company reserves the right to change the information published on the site. </p>\r\n<p>Information available at this site is not a public offer.  </p>\r\n<p>For more information about pricing and terms, please call us at the telephone numbers provided on the <a href="./contacts/en">OUR CONTACTS</a> page.</p>\r\n<p>The use of information from the site <a href="./en/">www.apelsin.ru</a> is prohibited without the prior permission from the  <a href="mailto:site.support@apelsin.ru">Site managers</a>.</p>\r\n');
INSERT IGNORE INTO `HtmlModul_Lang` (`htmlModul`, `lang`, `html`) VALUES('copyText', 'rus', '<p>Компания Апельсин оставляет за собой право вносить изменения в информацию, размещенную на этом сайте.</p>\r\n<p>Информация, размещенная на сайте ни в каком виде не является публичной офертой. </p>\r\n<p>Более подробную информацию о ценах и условиях просьба узнавать по телефонам на странице <a href="./contacts/ru">Контакты</a>.</p>\r\n<p>Использование информации с сайта <a href="./ru/">www.apelsin.ru</a> запрещено без разрешения <a href="mailto:site.support@apelsin.ru">Администрации сайта</a></p>\r\n');

-- --------------------------------------------------------

--
-- Структура таблицы `Menu`
--

DROP TABLE IF EXISTS `Menu`;
CREATE TABLE IF NOT EXISTS `Menu` (
  `name` varchar(100) NOT NULL COMMENT 'Название меню',
  `description` text COMMENT 'описание',
  `type` varchar(50) NOT NULL COMMENT 'тип меню',
  `cssClass` varchar(200) DEFAULT NULL COMMENT 'ункиальный стиль меню'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Очистить таблицу перед добавлением данных `Menu`
--

TRUNCATE TABLE `Menu`;
--
-- Дамп данных таблицы `Menu`
--

INSERT IGNORE INTO `Menu` (`name`, `description`, `type`, `cssClass`) VALUES('mainMenu', 'Основное меню', 'horizontal_1_lvl', 'mainMenu');

-- --------------------------------------------------------

--
-- Структура таблицы `MenuItemParent`
--

DROP TABLE IF EXISTS `MenuItemParent`;
CREATE TABLE IF NOT EXISTS `MenuItemParent` (
  `menuItem` bigint(20) unsigned NOT NULL COMMENT 'Элемент меню',
  `parent` bigint(20) unsigned NOT NULL COMMENT 'Родитель элемента меню'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Таблица родственных связей элементов меню.';

--
-- Очистить таблицу перед добавлением данных `MenuItemParent`
--

TRUNCATE TABLE `MenuItemParent`;
-- --------------------------------------------------------

--
-- Структура таблицы `MenuItems`
--

DROP TABLE IF EXISTS `MenuItems`;
CREATE TABLE IF NOT EXISTS `MenuItems` (
`id` bigint(20) unsigned NOT NULL COMMENT 'Идентификатор элемента меню',
  `menu` varchar(100) NOT NULL COMMENT 'идентификатор меню',
  `url` text COMMENT 'ссылка которую можно указать вместо идентификатора страницы. Если указана URL то ее приоритет будет выше чем у id страницы',
  `target` int(1) unsigned NOT NULL COMMENT 'как открывать ссылку',
  `sequence` int(5) unsigned NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;

--
-- Очистить таблицу перед добавлением данных `MenuItems`
--

TRUNCATE TABLE `MenuItems`;
--
-- Дамп данных таблицы `MenuItems`
--

INSERT IGNORE INTO `MenuItems` (`id`, `menu`, `url`, `target`, `sequence`) VALUES(101, 'mainMenu', 'http://global.apelsin/', 1, 1);
INSERT IGNORE INTO `MenuItems` (`id`, `menu`, `url`, `target`, `sequence`) VALUES(102, 'mainMenu', 'http://global.apelsin/information/', 1, 2);
INSERT IGNORE INTO `MenuItems` (`id`, `menu`, `url`, `target`, `sequence`) VALUES(103, 'mainMenu', 'http://global.apelsin/vacancies/', 1, 3);
INSERT IGNORE INTO `MenuItems` (`id`, `menu`, `url`, `target`, `sequence`) VALUES(104, 'mainMenu', 'http://global.apelsin/service_centers/', 1, 4);
INSERT IGNORE INTO `MenuItems` (`id`, `menu`, `url`, `target`, `sequence`) VALUES(105, 'mainMenu', 'http://global.apelsin/contacts/', 1, 5);

-- --------------------------------------------------------

--
-- Структура таблицы `MenuItemsPage`
--

DROP TABLE IF EXISTS `MenuItemsPage`;
CREATE TABLE IF NOT EXISTS `MenuItemsPage` (
  `menuItem` bigint(20) unsigned NOT NULL,
  `page` varchar(50) NOT NULL,
  `postfix` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Очистить таблицу перед добавлением данных `MenuItemsPage`
--

TRUNCATE TABLE `MenuItemsPage`;
--
-- Дамп данных таблицы `MenuItemsPage`
--

INSERT IGNORE INTO `MenuItemsPage` (`menuItem`, `page`, `postfix`) VALUES(101, 'test', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `MenuItems_Lang`
--

DROP TABLE IF EXISTS `MenuItems_Lang`;
CREATE TABLE IF NOT EXISTS `MenuItems_Lang` (
  `menuItem` bigint(20) unsigned NOT NULL,
  `lang` varchar(3) NOT NULL,
  `title` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Очистить таблицу перед добавлением данных `MenuItems_Lang`
--

TRUNCATE TABLE `MenuItems_Lang`;
--
-- Дамп данных таблицы `MenuItems_Lang`
--

INSERT IGNORE INTO `MenuItems_Lang` (`menuItem`, `lang`, `title`) VALUES(101, 'eng', 'News');
INSERT IGNORE INTO `MenuItems_Lang` (`menuItem`, `lang`, `title`) VALUES(101, 'rus', 'Акции');
INSERT IGNORE INTO `MenuItems_Lang` (`menuItem`, `lang`, `title`) VALUES(102, 'eng', 'Information');
INSERT IGNORE INTO `MenuItems_Lang` (`menuItem`, `lang`, `title`) VALUES(102, 'rus', 'Информация');
INSERT IGNORE INTO `MenuItems_Lang` (`menuItem`, `lang`, `title`) VALUES(103, 'eng', 'Vacancies');
INSERT IGNORE INTO `MenuItems_Lang` (`menuItem`, `lang`, `title`) VALUES(103, 'rus', 'Вакансии');
INSERT IGNORE INTO `MenuItems_Lang` (`menuItem`, `lang`, `title`) VALUES(104, 'eng', 'Service Centers');
INSERT IGNORE INTO `MenuItems_Lang` (`menuItem`, `lang`, `title`) VALUES(104, 'rus', 'Сервисные центры');
INSERT IGNORE INTO `MenuItems_Lang` (`menuItem`, `lang`, `title`) VALUES(105, 'eng', 'Contacts');
INSERT IGNORE INTO `MenuItems_Lang` (`menuItem`, `lang`, `title`) VALUES(105, 'rus', 'Контакты');

-- --------------------------------------------------------

--
-- Структура таблицы `MenuTypes`
--

DROP TABLE IF EXISTS `MenuTypes`;
CREATE TABLE IF NOT EXISTS `MenuTypes` (
  `type` varchar(50) NOT NULL,
  `description` text,
  `default` tinyint(1) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Типы меню:\nВертикальный\nГоризонтальный\nКарусель\nСлайдер';

--
-- Очистить таблицу перед добавлением данных `MenuTypes`
--

TRUNCATE TABLE `MenuTypes`;
--
-- Дамп данных таблицы `MenuTypes`
--

INSERT IGNORE INTO `MenuTypes` (`type`, `description`, `default`) VALUES('horizontal_1_lvl', 'Горизонтальное одноуровневое меню', 0);
INSERT IGNORE INTO `MenuTypes` (`type`, `description`, `default`) VALUES('vertical_1_lvl', 'Вертикальное одноуровневое меню', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `ModulesInBlocks`
--

DROP TABLE IF EXISTS `ModulesInBlocks`;
CREATE TABLE IF NOT EXISTS `ModulesInBlocks` (
`id` bigint(20) unsigned NOT NULL,
  `module` bigint(20) unsigned NOT NULL,
  `block` bigint(20) unsigned NOT NULL,
  `sequence` int(10) unsigned NOT NULL,
  `showTitle` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `cssClasses` varchar(200) DEFAULT NULL,
  `display` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `onAllPages` tinyint(3) unsigned NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=901111 DEFAULT CHARSET=utf8;

--
-- Очистить таблицу перед добавлением данных `ModulesInBlocks`
--

TRUNCATE TABLE `ModulesInBlocks`;
--
-- Дамп данных таблицы `ModulesInBlocks`
--

INSERT IGNORE INTO `ModulesInBlocks` (`id`, `module`, `block`, `sequence`, `showTitle`, `cssClasses`, `display`, `onAllPages`) VALUES(1, 101, 1000, 1, 0, NULL, 1, 1);
INSERT IGNORE INTO `ModulesInBlocks` (`id`, `module`, `block`, `sequence`, `showTitle`, `cssClasses`, `display`, `onAllPages`) VALUES(201103, 201, 103, 1, 0, NULL, 1, 1);
INSERT IGNORE INTO `ModulesInBlocks` (`id`, `module`, `block`, `sequence`, `showTitle`, `cssClasses`, `display`, `onAllPages`) VALUES(401104, 401, 104, 1, 0, NULL, 1, 1);
INSERT IGNORE INTO `ModulesInBlocks` (`id`, `module`, `block`, `sequence`, `showTitle`, `cssClasses`, `display`, `onAllPages`) VALUES(901108, 901, 108, 1, 0, NULL, 1, 1);
INSERT IGNORE INTO `ModulesInBlocks` (`id`, `module`, `block`, `sequence`, `showTitle`, `cssClasses`, `display`, `onAllPages`) VALUES(901110, 102, 103, 2, 0, NULL, 1, 1);
INSERT IGNORE INTO `ModulesInBlocks` (`id`, `module`, `block`, `sequence`, `showTitle`, `cssClasses`, `display`, `onAllPages`) VALUES(902109, 902, 109, 1, 0, NULL, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `ModulesInBlocks_Lang`
--

DROP TABLE IF EXISTS `ModulesInBlocks_Lang`;
CREATE TABLE IF NOT EXISTS `ModulesInBlocks_Lang` (
  `module` bigint(20) unsigned NOT NULL,
  `lang` varchar(3) NOT NULL,
  `title` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Очистить таблицу перед добавлением данных `ModulesInBlocks_Lang`
--

TRUNCATE TABLE `ModulesInBlocks_Lang`;
-- --------------------------------------------------------

--
-- Структура таблицы `ModulesOnPages`
--

DROP TABLE IF EXISTS `ModulesOnPages`;
CREATE TABLE IF NOT EXISTS `ModulesOnPages` (
  `module` bigint(20) unsigned NOT NULL,
  `page` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Очистить таблицу перед добавлением данных `ModulesOnPages`
--

TRUNCATE TABLE `ModulesOnPages`;
-- --------------------------------------------------------

--
-- Структура таблицы `ModulesParam`
--

DROP TABLE IF EXISTS `ModulesParam`;
CREATE TABLE IF NOT EXISTS `ModulesParam` (
  `module` bigint(20) unsigned NOT NULL,
  `param` varchar(100) NOT NULL,
  `value` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Очистить таблицу перед добавлением данных `ModulesParam`
--

TRUNCATE TABLE `ModulesParam`;
--
-- Дамп данных таблицы `ModulesParam`
--

INSERT IGNORE INTO `ModulesParam` (`module`, `param`, `value`) VALUES(201, 'name', 'mainMenu');
INSERT IGNORE INTO `ModulesParam` (`module`, `param`, `value`) VALUES(901, 'name', 'copyText');
INSERT IGNORE INTO `ModulesParam` (`module`, `param`, `value`) VALUES(902, 'name', 'copyMain');

-- --------------------------------------------------------

--
-- Структура таблицы `PageParam`
--

DROP TABLE IF EXISTS `PageParam`;
CREATE TABLE IF NOT EXISTS `PageParam` (
  `page` varchar(50) NOT NULL,
  `param` varchar(100) NOT NULL,
  `value` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Очистить таблицу перед добавлением данных `PageParam`
--

TRUNCATE TABLE `PageParam`;
--
-- Дамп данных таблицы `PageParam`
--

INSERT IGNORE INTO `PageParam` (`page`, `param`, `value`) VALUES('test', 'name', 'test');

-- --------------------------------------------------------

--
-- Структура таблицы `Pages`
--

DROP TABLE IF EXISTS `Pages`;
CREATE TABLE IF NOT EXISTS `Pages` (
  `alias` varchar(50) NOT NULL,
  `showTitle` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `cssClasses` varchar(200) DEFAULT NULL,
  `componentElement` bigint(20) unsigned NOT NULL,
  `template` varchar(50) NOT NULL,
  `isMainPage` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `index` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `follow` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `archive` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `notModifiable` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Означает что страница была создана не пользователем а компонентой и может быть удалена только через эту компоненту.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Очистить таблицу перед добавлением данных `Pages`
--

TRUNCATE TABLE `Pages`;
--
-- Дамп данных таблицы `Pages`
--

INSERT IGNORE INTO `Pages` (`alias`, `showTitle`, `cssClasses`, `componentElement`, `template`, `isMainPage`, `index`, `follow`, `archive`, `notModifiable`) VALUES('accounts', 1, NULL, 999801, 'apelsinShopTest', 0, 1, 1, 1, 0);
INSERT IGNORE INTO `Pages` (`alias`, `showTitle`, `cssClasses`, `componentElement`, `template`, `isMainPage`, `index`, `follow`, `archive`, `notModifiable`) VALUES('account_settings', 1, NULL, 999802, 'apelsinShopTest', 0, 1, 1, 1, 0);
INSERT IGNORE INTO `Pages` (`alias`, `showTitle`, `cssClasses`, `componentElement`, `template`, `isMainPage`, `index`, `follow`, `archive`, `notModifiable`) VALUES('adminpanel', 1, NULL, 999901, 'apelsinShopTest', 0, 0, 0, 0, 0);
INSERT IGNORE INTO `Pages` (`alias`, `showTitle`, `cssClasses`, `componentElement`, `template`, `isMainPage`, `index`, `follow`, `archive`, `notModifiable`) VALUES('test', 1, NULL, 201, 'apelsinShop', 1, 1, 1, 1, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `Pages_Lang`
--

DROP TABLE IF EXISTS `Pages_Lang`;
CREATE TABLE IF NOT EXISTS `Pages_Lang` (
  `page` varchar(50) NOT NULL,
  `lang` varchar(3) NOT NULL,
  `browserTitle` varchar(100) NOT NULL,
  `pageTitle` varchar(100) NOT NULL,
  `description` text,
  `keywords` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Очистить таблицу перед добавлением данных `Pages_Lang`
--

TRUNCATE TABLE `Pages_Lang`;
--
-- Дамп данных таблицы `Pages_Lang`
--

INSERT IGNORE INTO `Pages_Lang` (`page`, `lang`, `browserTitle`, `pageTitle`, `description`, `keywords`) VALUES('test', 'rus', 'Тестовая страница', 'Тестовая страница', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `TemplateBlocks`
--

DROP TABLE IF EXISTS `TemplateBlocks`;
CREATE TABLE IF NOT EXISTS `TemplateBlocks` (
`id` bigint(20) unsigned NOT NULL,
  `block` varchar(50) NOT NULL,
  `template` varchar(50) NOT NULL,
  `description` text
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8;

--
-- Очистить таблицу перед добавлением данных `TemplateBlocks`
--

TRUNCATE TABLE `TemplateBlocks`;
--
-- Дамп данных таблицы `TemplateBlocks`
--

INSERT IGNORE INTO `TemplateBlocks` (`id`, `block`, `template`, `description`) VALUES(101, 'LeftTopHeadBlock', 'apelsinShop', NULL);
INSERT IGNORE INTO `TemplateBlocks` (`id`, `block`, `template`, `description`) VALUES(102, 'LeftBottomHeadBlock', 'apelsinShop', NULL);
INSERT IGNORE INTO `TemplateBlocks` (`id`, `block`, `template`, `description`) VALUES(103, 'MenuBlock', 'apelsinShop', NULL);
INSERT IGNORE INTO `TemplateBlocks` (`id`, `block`, `template`, `description`) VALUES(104, 'BeforeContentBlock', 'apelsinShop', NULL);
INSERT IGNORE INTO `TemplateBlocks` (`id`, `block`, `template`, `description`) VALUES(105, 'ContentTopBlock', 'apelsinShop', NULL);
INSERT IGNORE INTO `TemplateBlocks` (`id`, `block`, `template`, `description`) VALUES(106, 'ContentBottomBlock', 'apelsinShop', NULL);
INSERT IGNORE INTO `TemplateBlocks` (`id`, `block`, `template`, `description`) VALUES(107, 'AfterContentBlock', 'apelsinShop', NULL);
INSERT IGNORE INTO `TemplateBlocks` (`id`, `block`, `template`, `description`) VALUES(108, 'FutterLeftBlock', 'apelsinShop', NULL);
INSERT IGNORE INTO `TemplateBlocks` (`id`, `block`, `template`, `description`) VALUES(109, 'FutterRightBlock', 'apelsinShop', NULL);
INSERT IGNORE INTO `TemplateBlocks` (`id`, `block`, `template`, `description`) VALUES(1000, 'test', 'apelsinShopTest', NULL);
INSERT IGNORE INTO `TemplateBlocks` (`id`, `block`, `template`, `description`) VALUES(2000, 'ShopNavigationPanel', 'apelsinShopTest', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `Templates`
--

DROP TABLE IF EXISTS `Templates`;
CREATE TABLE IF NOT EXISTS `Templates` (
  `alias` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `author` varchar(100) NOT NULL,
  `version` varchar(100) NOT NULL,
  `description` text,
  `default` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `main` varchar(100) NOT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `print` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Очистить таблицу перед добавлением данных `Templates`
--

TRUNCATE TABLE `Templates`;
--
-- Дамп данных таблицы `Templates`
--

INSERT IGNORE INTO `Templates` (`alias`, `name`, `author`, `version`, `description`, `default`, `main`, `mobile`, `print`) VALUES('apelsinShop', 'Магазин Апельсин', 'Compu Project', '1.0', 'Шаблон для магазина', 0, 'index.php', 'mobile.php', 'print.php');
INSERT IGNORE INTO `Templates` (`alias`, `name`, `author`, `version`, `description`, `default`, `main`, `mobile`, `print`) VALUES('apelsinShopTest', 'Апельсин', 'Compu Project', '1.0', 'Основной шаблон сайта', 1, 'index.php', 'mobile.php', 'print.php');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `CreatedModules`
--
ALTER TABLE `CreatedModules`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `id_UNIQUE` (`id`), ADD KEY `fk_CreatedModules_1_idx` (`module`);

--
-- Индексы таблицы `HtmlModul`
--
ALTER TABLE `HtmlModul`
 ADD PRIMARY KEY (`name`), ADD UNIQUE KEY `name_UNIQUE` (`name`);

--
-- Индексы таблицы `HtmlModul_Lang`
--
ALTER TABLE `HtmlModul_Lang`
 ADD PRIMARY KEY (`htmlModul`,`lang`), ADD KEY `fk_HtmlModul_Lang_HtmlModul_idx` (`htmlModul`), ADD KEY `fk_HtmlModul_Lang_Lang_idx` (`lang`);

--
-- Индексы таблицы `Menu`
--
ALTER TABLE `Menu`
 ADD PRIMARY KEY (`name`), ADD UNIQUE KEY `name_UNIQUE` (`name`), ADD KEY `fk_Menu_MenuTypes` (`type`);

--
-- Индексы таблицы `MenuItemParent`
--
ALTER TABLE `MenuItemParent`
 ADD PRIMARY KEY (`menuItem`,`parent`), ADD UNIQUE KEY `menuItem_UNIQUE` (`menuItem`), ADD KEY `fk_MenuItemParent_MenuItems1` (`menuItem`), ADD KEY `fk_MenuItemParent_MenuItems2` (`parent`);

--
-- Индексы таблицы `MenuItems`
--
ALTER TABLE `MenuItems`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `id_UNIQUE` (`id`), ADD UNIQUE KEY `key_UNIQUE` (`sequence`,`menu`), ADD KEY `fk_MenuItems_UrlTarget` (`target`), ADD KEY `fk_MenuElements_Menu` (`menu`);

--
-- Индексы таблицы `MenuItemsPage`
--
ALTER TABLE `MenuItemsPage`
 ADD PRIMARY KEY (`menuItem`,`page`), ADD UNIQUE KEY `menuItem_UNIQUE` (`menuItem`), ADD KEY `fk_MenuItemsPage_MenuItems` (`menuItem`), ADD KEY `fk_MenuItemsPage_Pages` (`page`);

--
-- Индексы таблицы `MenuItems_Lang`
--
ALTER TABLE `MenuItems_Lang`
 ADD PRIMARY KEY (`menuItem`,`lang`), ADD KEY `fk_MenuItems_Lang_MenuItems` (`menuItem`), ADD KEY `fk_MenuItems_Lang_Lang` (`lang`);

--
-- Индексы таблицы `MenuTypes`
--
ALTER TABLE `MenuTypes`
 ADD PRIMARY KEY (`type`), ADD UNIQUE KEY `type_UNIQUE` (`type`);

--
-- Индексы таблицы `ModulesInBlocks`
--
ALTER TABLE `ModulesInBlocks`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `module_UNIQUE` (`module`,`block`), ADD UNIQUE KEY `sequence_UNIQUE` (`sequence`,`block`), ADD KEY `fk_ModulesInBlocks_2_idx` (`block`);

--
-- Индексы таблицы `ModulesInBlocks_Lang`
--
ALTER TABLE `ModulesInBlocks_Lang`
 ADD PRIMARY KEY (`module`,`lang`), ADD KEY `fk_ModulesInBlocks_Lang_2_idx` (`lang`);

--
-- Индексы таблицы `ModulesOnPages`
--
ALTER TABLE `ModulesOnPages`
 ADD PRIMARY KEY (`module`,`page`), ADD KEY `fk_ModulesOnPages_2_idx` (`page`), ADD KEY `fk_ModulesOnPages_1_idx` (`module`);

--
-- Индексы таблицы `ModulesParam`
--
ALTER TABLE `ModulesParam`
 ADD PRIMARY KEY (`module`,`param`);

--
-- Индексы таблицы `PageParam`
--
ALTER TABLE `PageParam`
 ADD PRIMARY KEY (`page`,`param`);

--
-- Индексы таблицы `Pages`
--
ALTER TABLE `Pages`
 ADD PRIMARY KEY (`alias`), ADD UNIQUE KEY `alias_UNIQUE` (`alias`), ADD KEY `fk_Pages_1_idx` (`componentElement`), ADD KEY `fk_Pages_2_idx` (`template`);

--
-- Индексы таблицы `Pages_Lang`
--
ALTER TABLE `Pages_Lang`
 ADD PRIMARY KEY (`page`,`lang`), ADD KEY `fk_Pages_Lang_2_idx` (`lang`);

--
-- Индексы таблицы `TemplateBlocks`
--
ALTER TABLE `TemplateBlocks`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `id_UNIQUE` (`id`), ADD UNIQUE KEY `block_UNIQUE` (`block`,`template`), ADD KEY `fk_TemplateBlocks_1_idx` (`template`);

--
-- Индексы таблицы `Templates`
--
ALTER TABLE `Templates`
 ADD PRIMARY KEY (`alias`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `MenuItems`
--
ALTER TABLE `MenuItems`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор элемента меню',AUTO_INCREMENT=106;
--
-- AUTO_INCREMENT для таблицы `ModulesInBlocks`
--
ALTER TABLE `ModulesInBlocks`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=901111;
--
-- AUTO_INCREMENT для таблицы `TemplateBlocks`
--
ALTER TABLE `TemplateBlocks`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=110;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `CreatedModules`
--
ALTER TABLE `CreatedModules`
ADD CONSTRAINT `fk_CreatedModules_1` FOREIGN KEY (`module`) REFERENCES `Modules` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `HtmlModul_Lang`
--
ALTER TABLE `HtmlModul_Lang`
ADD CONSTRAINT `fk_HtmlModul_Lang_HtmlModul` FOREIGN KEY (`htmlModul`) REFERENCES `HtmlModul` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_HtmlModul_Lang_Lang` FOREIGN KEY (`lang`) REFERENCES `Lang` (`lang`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `Menu`
--
ALTER TABLE `Menu`
ADD CONSTRAINT `fk_Menu_MenuTypes` FOREIGN KEY (`type`) REFERENCES `MenuTypes` (`type`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `MenuItemParent`
--
ALTER TABLE `MenuItemParent`
ADD CONSTRAINT `fk_MenuItemParent_MenuItems1` FOREIGN KEY (`menuItem`) REFERENCES `MenuItems` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_MenuItemParent_MenuItems2` FOREIGN KEY (`parent`) REFERENCES `MenuItems` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `MenuItems`
--
ALTER TABLE `MenuItems`
ADD CONSTRAINT `fk_MenuElements_Menu` FOREIGN KEY (`menu`) REFERENCES `Menu` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_MenuItems_UrlTarget` FOREIGN KEY (`target`) REFERENCES `UrlTarget` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `MenuItemsPage`
--
ALTER TABLE `MenuItemsPage`
ADD CONSTRAINT `fk_MenuItemsPage_MenuItems` FOREIGN KEY (`menuItem`) REFERENCES `MenuItems` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_MenuItemsPage_Pages` FOREIGN KEY (`page`) REFERENCES `Pages` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `MenuItems_Lang`
--
ALTER TABLE `MenuItems_Lang`
ADD CONSTRAINT `fk_MenuItems_Lang_Lang` FOREIGN KEY (`lang`) REFERENCES `Lang` (`lang`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_MenuItems_Lang_MenuItems` FOREIGN KEY (`menuItem`) REFERENCES `MenuItems` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `ModulesInBlocks`
--
ALTER TABLE `ModulesInBlocks`
ADD CONSTRAINT `fk_ModulesInBlocks_1` FOREIGN KEY (`module`) REFERENCES `CreatedModules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_ModulesInBlocks_2` FOREIGN KEY (`block`) REFERENCES `TemplateBlocks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `ModulesInBlocks_Lang`
--
ALTER TABLE `ModulesInBlocks_Lang`
ADD CONSTRAINT `fk_ModulesInBlocks_Lang_1` FOREIGN KEY (`module`) REFERENCES `ModulesInBlocks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_ModulesInBlocks_Lang_2` FOREIGN KEY (`lang`) REFERENCES `Lang` (`lang`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `ModulesOnPages`
--
ALTER TABLE `ModulesOnPages`
ADD CONSTRAINT `fk_ModulesOnPages_1` FOREIGN KEY (`module`) REFERENCES `ModulesInBlocks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_ModulesOnPages_2` FOREIGN KEY (`page`) REFERENCES `Pages` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `ModulesParam`
--
ALTER TABLE `ModulesParam`
ADD CONSTRAINT `fk_ModulesParam_1` FOREIGN KEY (`module`) REFERENCES `CreatedModules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `PageParam`
--
ALTER TABLE `PageParam`
ADD CONSTRAINT `fk_PageParam_1` FOREIGN KEY (`page`) REFERENCES `Pages` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `Pages`
--
ALTER TABLE `Pages`
ADD CONSTRAINT `fk_Pages_1` FOREIGN KEY (`componentElement`) REFERENCES `ComponentsElements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_Pages_2` FOREIGN KEY (`template`) REFERENCES `Templates` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `Pages_Lang`
--
ALTER TABLE `Pages_Lang`
ADD CONSTRAINT `fk_Pages_Lang_1` FOREIGN KEY (`page`) REFERENCES `Pages` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_Pages_Lang_2` FOREIGN KEY (`lang`) REFERENCES `Lang` (`lang`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `TemplateBlocks`
--
ALTER TABLE `TemplateBlocks`
ADD CONSTRAINT `fk_TemplateBlocks_1` FOREIGN KEY (`template`) REFERENCES `Templates` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
