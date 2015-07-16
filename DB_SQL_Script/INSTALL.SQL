-- phpMyAdmin SQL Dump
-- version 4.2.13.1
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Июл 16 2015 г., 10:07
-- Версия сервера: 10.0.13-MariaDB
-- Версия PHP: 5.6.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `apelsin_shop_db`
--
CREATE DATABASE IF NOT EXISTS `apelsin_shop_db` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `apelsin_shop_db`;

-- --------------------------------------------------------

--
-- Структура таблицы `Components`
--

CREATE TABLE IF NOT EXISTS `Components` (
  `alias` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `author` varchar(100) NOT NULL,
  `version` varchar(100) NOT NULL,
  `description` text,
  `adminDir` varchar(200) NOT NULL,
  `admin` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Components`
--

INSERT INTO `Components` (`alias`, `name`, `author`, `version`, `description`, `adminDir`, `admin`) VALUES
('Adminpanel', 'Adminpanel', 'Compu Project', '1.0', 'Панель администрирования', 'admin', 'index.php'),
('Materials', 'Материалы сайта', 'Compu Project', '1.0', 'Компонент для размещение материалов на сайте.', 'admin', 'index.php'),
('Shop', 'Магазин', 'CompuProject', '1.0', 'Компонента для работы с магазином', 'admin', 'index.php'),
('Users', 'Пользователи', 'Compu Project', '1.0', 'Компонент для работы с пользователями.', 'admin', 'index.php');

-- --------------------------------------------------------

--
-- Структура таблицы `ComponentsDepends`
--

CREATE TABLE IF NOT EXISTS `ComponentsDepends` (
`id` bigint(20) unsigned NOT NULL,
  `elementType` varchar(50) NOT NULL,
  `component` varchar(50) NOT NULL,
  `depends` varchar(50) NOT NULL,
  `versionStart` varchar(100) DEFAULT NULL,
  `versionEnd` varchar(100) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ComponentsDepends`
--

INSERT INTO `ComponentsDepends` (`id`, `elementType`, `component`, `depends`, `versionStart`, `versionEnd`) VALUES
(1, 'Plugins', 'Materials', 'appearingBox', '1.0', '1.0'),
(2, 'Modules', 'Materials', 'captcha', '1.0', '1.0'),
(3, 'Modules', 'Users', 'captcha', '1.0', '1.0');

-- --------------------------------------------------------

--
-- Структура таблицы `ComponentsDependsElementsType`
--

CREATE TABLE IF NOT EXISTS `ComponentsDependsElementsType` (
  `elementType` varchar(50) NOT NULL,
  `tableName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ComponentsDependsElementsType`
--

INSERT INTO `ComponentsDependsElementsType` (`elementType`, `tableName`) VALUES
('Components', 'Components'),
('Modules', 'Modules'),
('Plugins', 'Plugins');

-- --------------------------------------------------------

--
-- Структура таблицы `ComponentsElements`
--

CREATE TABLE IF NOT EXISTS `ComponentsElements` (
`id` bigint(20) unsigned NOT NULL,
  `alias` varchar(50) NOT NULL,
  `component` varchar(50) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` longtext,
  `mainPage` varchar(100) NOT NULL,
  `printPage` varchar(100) NOT NULL,
  `mobilePage` varchar(100) NOT NULL,
  `head` varchar(100) DEFAULT NULL,
  `bodyStart` varchar(100) DEFAULT NULL,
  `bodyEnd` varchar(100) DEFAULT NULL,
  `admin` varchar(100) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=999902 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ComponentsElements`
--

INSERT INTO `ComponentsElements` (`id`, `alias`, `component`, `name`, `description`, `mainPage`, `printPage`, `mobilePage`, `head`, `bodyStart`, `bodyEnd`, `admin`) VALUES
(101, 'Material', 'Materials', 'Материал', 'Выводит на страницу сайта один материал.', 'index.php', 'print.php', 'mobile.php', 'head.php', 'bodyStart.php', 'bodyEnd.php', 'index.php'),
(102, 'MaterialsList', 'Materials', 'Список материалов', 'Выводит на страницу сайта список материалов', 'index.php', 'print.php', 'mobile.php', 'head.php', 'bodyStart.php', 'bodyEnd.php', 'index.php'),
(103, 'MaterialsCategory', 'Materials', 'Категории материалов', 'Выводит на страницу сайта категорию материалов', 'index.php', 'print.php', 'mobile.php', 'head.php', 'bodyStart.php', 'bodyEnd.php', 'index.php'),
(104, 'MaterialsCategoryList', 'Materials', 'Список категорий материалов', 'Выводит на страницу сайта список категорий материалов', 'index.php', 'print.php', 'mobile.php', 'head.php', 'bodyStart.php', 'bodyEnd.php', 'index.php'),
(105, 'MaterialsBlog', 'Materials', 'Блог материалов', 'Выводит список материалов в виде блога. Отличается от обычного вывода списка материалов блочной структурой.', 'index.php', 'print.php', 'mobile.php', 'head.php', 'bodyStart.php', 'bodyEnd.php', 'index.php'),
(201, 'Shop', 'Shop', 'Магазин', NULL, 'index.php', 'print.php', 'mobile.php', 'head.php', 'bodyStart.php', 'bodyEnd.php', 'index.php'),
(999801, 'Accounts', 'Users', 'Аккаунт', 'Аккаунт пользователя', 'index.php', 'print.php', 'mobile.php', 'head.php', 'bodyStart.php', 'bodyEnd.php', 'index.php'),
(999802, 'AccountSettings', 'Users', 'Настройки аккаунта', 'Настройки аккаунта пользователя', 'index.php', 'print.php', 'mobile.php', 'head.php', 'bodyStart.php', 'bodyEnd.php', 'index.php'),
(999803, 'Registration', 'Users', 'Регистрация', 'Страница регистрации пользователя', 'index.php', 'print.php', 'mobile.php', 'head.php', 'bodyStart.php', 'bodyEnd.php', 'index.php'),
(999901, 'Adminpanel', 'Adminpanel', 'Панель администрирования', 'Панель администрирвоания', 'index.php', 'print.php', 'mobile.php', 'head.php', 'bodyStart.php', 'bodyEnd.php', 'index.php');

-- --------------------------------------------------------

--
-- Структура таблицы `CreatedModules`
--

CREATE TABLE IF NOT EXISTS `CreatedModules` (
  `id` bigint(20) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  `module` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `CreatedModules`
--

INSERT INTO `CreatedModules` (`id`, `name`, `module`) VALUES
(101, 'Панель авторизации', 'authorizationUserPanel'),
(102, 'Переключение языка', 'langPanel'),
(201, 'Главное меню', 'menu'),
(401, 'ShopNavigationPanel', 'ShopNavigationPanel'),
(501, 'ShopBasket', 'ShopBasket'),
(601, 'Поиск', 'Search'),
(901, 'Основной копирайт', 'html'),
(902, 'Дополнительный копирайт', 'html'),
(903, 'Наверх сайта', 'ToTopSite');

-- --------------------------------------------------------

--
-- Структура таблицы `DBerrors`
--

CREATE TABLE IF NOT EXISTS `DBerrors` (
`id` bigint(20) NOT NULL,
  `element` varchar(200) NOT NULL,
  `sql` longtext NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `HtmlModul`
--

CREATE TABLE IF NOT EXISTS `HtmlModul` (
  `name` varchar(100) NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `HtmlModul`
--

INSERT INTO `HtmlModul` (`name`, `description`) VALUES
('copyMain', 'Основной копирайт'),
('copyText', 'Копирайт в футэре');

-- --------------------------------------------------------

--
-- Структура таблицы `HtmlModul_Lang`
--

CREATE TABLE IF NOT EXISTS `HtmlModul_Lang` (
  `htmlModul` varchar(100) NOT NULL,
  `lang` varchar(3) NOT NULL,
  `html` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `HtmlModul_Lang`
--

INSERT INTO `HtmlModul_Lang` (`htmlModul`, `lang`, `html`) VALUES
('copyMain', 'eng', '<div class="futerAdress">Ryazan</div>\r\n<div class="futerCopy">© 2011-2015<br>company «Apelsin»</div>'),
('copyMain', 'rus', '<div class="futerAdress">г. Рязань</div>\r\n<div class="futerCopy">© 2011-2015<br>компания «Апельсин»</div>'),
('copyText', 'eng', '<p>Apelsin company reserves the right to change the information published on the site. </p>\r\n<p>Information available at this site is not a public offer.  </p>\r\n<p>For more information about pricing and terms, please call us at the telephone numbers provided on the <a href="./contacts/en">OUR CONTACTS</a> page.</p>\r\n<p>The use of information from the site <a href="./en/">www.apelsin.ru</a> is prohibited without the prior permission from the  <a href="mailto:site.support@apelsin.ru">Site managers</a>.</p>\r\n'),
('copyText', 'rus', '<p>Компания Апельсин оставляет за собой право вносить изменения в информацию, размещенную на этом сайте.</p>\r\n<p>Информация, размещенная на сайте ни в каком виде не является публичной офертой. </p>\r\n<p>Более подробную информацию о ценах и условиях просьба узнавать по телефонам на странице <a href="./contacts/ru">Контакты</a>.</p>\r\n<p>Использование информации с сайта <a href="./ru/">www.apelsin.ru</a> запрещено без разрешения <a href="mailto:site.support@apelsin.ru">Администрации сайта</a></p>\r\n');

-- --------------------------------------------------------

--
-- Структура таблицы `JCropTypes`
--

CREATE TABLE IF NOT EXISTS `JCropTypes` (
  `type` varchar(50) NOT NULL,
  `aspectRatio` float unsigned NOT NULL DEFAULT '0',
  `bgColor` varchar(45) NOT NULL DEFAULT 'black',
  `bgOpacity` float NOT NULL DEFAULT '0.5',
  `sideHandles` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `minWidth` int(10) unsigned DEFAULT NULL,
  `minHeight` int(10) unsigned DEFAULT NULL,
  `maxWidth` int(10) unsigned DEFAULT NULL,
  `maxHeight` int(10) unsigned DEFAULT NULL,
  `cssClasse` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `JCropTypes`
--

INSERT INTO `JCropTypes` (`type`, `aspectRatio`, `bgColor`, `bgOpacity`, `sideHandles`, `minWidth`, `minHeight`, `maxWidth`, `maxHeight`, `cssClasse`) VALUES
('Avatar', 1, 'black', 0.2, 1, 150, 150, 600, 600, 'JCrop_Avatar'),
('MaterialsImage', 0, 'black', 0.2, 1, 200, 150, 900, 500, 'JCrop_MaterialsImage');

-- --------------------------------------------------------

--
-- Структура таблицы `Jquery`
--

CREATE TABLE IF NOT EXISTS `Jquery` (
  `fileName` varchar(100) NOT NULL,
  `version` varchar(10) NOT NULL,
  `min` tinyint(1) unsigned NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Jquery`
--

INSERT INTO `Jquery` (`fileName`, `version`, `min`) VALUES
('jquery-1.10.1.min.js', '1.10.1', 1),
('jquery-1.6.3.min.js', '1.6.3', 1),
('jquery.1.8.2.min.js', '1.8.2', 1),
('jquery-1.9.0.min.js', '1.9.0', 1),
('jquery-2.0.3.min.js', '2.0.3', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `Lang`
--

CREATE TABLE IF NOT EXISTS `Lang` (
  `lang` varchar(3) NOT NULL,
  `langName` varchar(50) NOT NULL,
  `default` tinyint(1) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Lang`
--

INSERT INTO `Lang` (`lang`, `langName`, `default`) VALUES
('eng', 'English', 0),
('rus', 'Русский', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `Materials`
--

CREATE TABLE IF NOT EXISTS `Materials` (
  `alias` varchar(200) NOT NULL,
  `created` datetime NOT NULL,
  `lastChange` datetime NOT NULL,
  `showTitle` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `showCreated` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `showChange` tinyint(1) unsigned NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Materials`
--

INSERT INTO `Materials` (`alias`, `created`, `lastChange`, `showTitle`, `showCreated`, `showChange`) VALUES
('test', '2015-02-18 00:00:00', '2015-02-18 00:00:00', 1, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `MaterialsCategories`
--

CREATE TABLE IF NOT EXISTS `MaterialsCategories` (
  `alias` varchar(200) NOT NULL,
  `created` datetime NOT NULL,
  `lastChange` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `MaterialsCategoriesInList`
--

CREATE TABLE IF NOT EXISTS `MaterialsCategoriesInList` (
  `category` varchar(200) NOT NULL,
  `list` varchar(200) NOT NULL,
  `sequence` int(5) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `MaterialsCategoriesList`
--

CREATE TABLE IF NOT EXISTS `MaterialsCategoriesList` (
  `name` varchar(200) NOT NULL,
  `showFullMaterialsText` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `showShortMaterialsText` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `showCategories` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `showCreated` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `showChange` tinyint(1) unsigned zerofill NOT NULL DEFAULT '1',
  `categorialsAsURL` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `titleAsURL` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `showAllOnPage` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `onPage` int(2) unsigned NOT NULL DEFAULT '10',
  `maxPages` int(2) unsigned NOT NULL DEFAULT '6'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `MaterialsCategoriesList_Lang`
--

CREATE TABLE IF NOT EXISTS `MaterialsCategoriesList_Lang` (
  `list` varchar(200) NOT NULL,
  `lang` varchar(3) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `MaterialsCategories_Lang`
--

CREATE TABLE IF NOT EXISTS `MaterialsCategories_Lang` (
  `category` varchar(200) NOT NULL,
  `lang` varchar(3) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `MaterialsInCategories`
--

CREATE TABLE IF NOT EXISTS `MaterialsInCategories` (
  `material` varchar(200) NOT NULL,
  `category` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Materials_Lang`
--

CREATE TABLE IF NOT EXISTS `Materials_Lang` (
  `material` varchar(200) NOT NULL,
  `lang` varchar(3) NOT NULL,
  `title` varchar(200) NOT NULL,
  `text` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Materials_Lang`
--

INSERT INTO `Materials_Lang` (`material`, `lang`, `title`, `text`) VALUES
('test', 'rus', 'Тестовая странциа', 'Тестовая страница с тестовым текстом');

-- --------------------------------------------------------

--
-- Структура таблицы `Menu`
--

CREATE TABLE IF NOT EXISTS `Menu` (
  `name` varchar(100) NOT NULL COMMENT 'Название меню',
  `description` text COMMENT 'описание',
  `type` varchar(50) NOT NULL COMMENT 'тип меню',
  `cssClass` varchar(200) DEFAULT NULL COMMENT 'ункиальный стиль меню'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Menu`
--

INSERT INTO `Menu` (`name`, `description`, `type`, `cssClass`) VALUES
('mainMenu', 'Основное меню', 'horizontal_1_lvl', 'mainMenu');

-- --------------------------------------------------------

--
-- Структура таблицы `MenuItemParent`
--

CREATE TABLE IF NOT EXISTS `MenuItemParent` (
  `menuItem` bigint(20) unsigned NOT NULL COMMENT 'Элемент меню',
  `parent` bigint(20) unsigned NOT NULL COMMENT 'Родитель элемента меню'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Таблица родственных связей элементов меню.';

-- --------------------------------------------------------

--
-- Структура таблицы `MenuItems`
--

CREATE TABLE IF NOT EXISTS `MenuItems` (
`id` bigint(20) unsigned NOT NULL COMMENT 'Идентификатор элемента меню',
  `menu` varchar(100) NOT NULL COMMENT 'идентификатор меню',
  `url` text COMMENT 'ссылка которую можно указать вместо идентификатора страницы. Если указана URL то ее приоритет будет выше чем у id страницы',
  `target` int(1) unsigned NOT NULL COMMENT 'как открывать ссылку',
  `sequence` int(5) unsigned NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `MenuItems`
--

INSERT INTO `MenuItems` (`id`, `menu`, `url`, `target`, `sequence`) VALUES
(101, 'mainMenu', 'http://global.apelsin/', 1, 1),
(102, 'mainMenu', 'http://global.apelsin/information/', 1, 2),
(103, 'mainMenu', 'http://global.apelsin/vacancies/', 1, 3),
(104, 'mainMenu', 'http://global.apelsin/service_centers/', 1, 4),
(105, 'mainMenu', 'http://global.apelsin/contacts/', 1, 5),
(106, 'mainMenu', NULL, 2, 6);

-- --------------------------------------------------------

--
-- Структура таблицы `MenuItemsPage`
--

CREATE TABLE IF NOT EXISTS `MenuItemsPage` (
  `menuItem` bigint(20) unsigned NOT NULL,
  `page` varchar(50) NOT NULL,
  `postfix` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `MenuItemsPage`
--

INSERT INTO `MenuItemsPage` (`menuItem`, `page`, `postfix`) VALUES
(106, 'shop', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `MenuItems_Lang`
--

CREATE TABLE IF NOT EXISTS `MenuItems_Lang` (
  `menuItem` bigint(20) unsigned NOT NULL,
  `lang` varchar(3) NOT NULL,
  `title` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `MenuItems_Lang`
--

INSERT INTO `MenuItems_Lang` (`menuItem`, `lang`, `title`) VALUES
(101, 'eng', 'News'),
(101, 'rus', 'Акции'),
(102, 'eng', 'Information'),
(102, 'rus', 'Информация'),
(103, 'eng', 'Vacancies'),
(103, 'rus', 'Вакансии'),
(104, 'eng', 'Service Centers'),
(104, 'rus', 'Сервисные центры'),
(105, 'eng', 'Contacts'),
(105, 'rus', 'Контакты'),
(106, 'eng', 'Shop'),
(106, 'rus', 'Каталог');

-- --------------------------------------------------------

--
-- Структура таблицы `MenuTypes`
--

CREATE TABLE IF NOT EXISTS `MenuTypes` (
  `type` varchar(50) NOT NULL,
  `description` text,
  `default` tinyint(1) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Типы меню:\nВертикальный\nГоризонтальный\nКарусель\nСлайдер';

--
-- Дамп данных таблицы `MenuTypes`
--

INSERT INTO `MenuTypes` (`type`, `description`, `default`) VALUES
('horizontal_1_lvl', 'Горизонтальное одноуровневое меню', 0),
('vertical_1_lvl', 'Вертикальное одноуровневое меню', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `Modules`
--

CREATE TABLE IF NOT EXISTS `Modules` (
  `alias` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `author` varchar(100) NOT NULL,
  `version` varchar(100) NOT NULL,
  `description` text,
  `main` varchar(100) NOT NULL,
  `head` varchar(100) DEFAULT NULL,
  `bodyStart` varchar(100) DEFAULT NULL,
  `bodyEnd` varchar(100) DEFAULT NULL,
  `admin` varchar(100) DEFAULT NULL,
  `includeOnceHead` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `includeOnceBodyStart` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `includeOnceBodyEnd` tinyint(1) unsigned NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Modules`
--

INSERT INTO `Modules` (`alias`, `name`, `author`, `version`, `description`, `main`, `head`, `bodyStart`, `bodyEnd`, `admin`, `includeOnceHead`, `includeOnceBodyStart`, `includeOnceBodyEnd`) VALUES
('authorizationUserPanel', 'Панель авторизации', 'Compu Project', '1.0', 'Модуль для отображения панели авторизации пользователей', 'index.php', 'head.php', 'bodyStart.php', 'bodyEnd.php', 'admin/index.php', 1, 1, 1),
('html', 'Вывод HTML кода', 'Compu Project', '1.0', 'Данный модуль позволяет делать HTML вставки в указанные блоки сайта.', 'index.php', 'head.php', 'bodyStart.php', 'bodyEnd.php', 'admin/index.php', 1, 1, 1),
('langPanel', 'Языковая панель', 'Compu Project', '1.0', 'Панель выбора языка сайта.', 'index.php', 'head.php', 'bodyStart.php', 'bodyEnd.php', 'admin/index.php', 1, 1, 1),
('menu', 'Модуль меню', 'Compu Project', '1.0', 'Модуль для создания меню сайта.', 'index.php', 'head.php', 'bodyStart.php', 'bodyEnd.php', 'admin/index.php', 1, 1, 1),
('Search', 'Поиск', 'Compu Project', '1.0', 'Поле поиска', 'index.php', 'head.php', 'bodyStart.php', 'bodyEnd.php', '/admin/index.php', 1, 1, 1),
('ShopBasket', 'ShopBasket', 'Compu Project', '1.0', NULL, 'index.php', 'head.php', 'bodyStart.php', 'bodyEnd.php', NULL, 1, 1, 1),
('ShopNavigationPanel', 'Shop Navigation Panel', 'CompuProject', '1.0', NULL, 'index.php', 'head.php', 'bodyStart.php', 'bodyEnd.php', NULL, 1, 1, 1),
('slider', 'Слайдер', 'Compu Project', '1.0', 'Модуль для вывода слайдеров', 'index.php', 'head.php', 'bodyStart.php', 'bodyEnd.php', 'admin/index.php', 1, 1, 1),
('socialPanel', 'social panel', 'CompuProject', '1.0', 'социальные сети', 'index.php', 'head.php', 'bodyStart.php', 'bodyEnd.php', 'admin/index.php', 1, 1, 1),
('ToTopSite', 'ToTopSite', 'Compu Project', '1.0', NULL, 'index.php', 'head.php', 'bodyStart.php', 'bodyEnd.php', '/admin/index.php', 1, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `ModulesDepends`
--

CREATE TABLE IF NOT EXISTS `ModulesDepends` (
`id` bigint(20) unsigned NOT NULL,
  `elementType` varchar(50) NOT NULL,
  `module` varchar(50) NOT NULL,
  `depends` varchar(50) NOT NULL,
  `versionStart` varchar(100) DEFAULT NULL,
  `versionEnd` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `ModulesDependsElementsType`
--

CREATE TABLE IF NOT EXISTS `ModulesDependsElementsType` (
  `elementType` varchar(50) NOT NULL,
  `tableName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ModulesDependsElementsType`
--

INSERT INTO `ModulesDependsElementsType` (`elementType`, `tableName`) VALUES
('Components', 'Components'),
('Modules', 'Modules'),
('Plugins', 'Plugins');

-- --------------------------------------------------------

--
-- Структура таблицы `ModulesInBlocks`
--

CREATE TABLE IF NOT EXISTS `ModulesInBlocks` (
`id` bigint(20) unsigned NOT NULL,
  `module` bigint(20) unsigned NOT NULL,
  `block` bigint(20) unsigned NOT NULL,
  `sequence` int(10) unsigned NOT NULL,
  `showTitle` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `cssClasses` varchar(200) DEFAULT NULL,
  `display` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `onAllPages` tinyint(3) unsigned NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=903109 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ModulesInBlocks`
--

INSERT INTO `ModulesInBlocks` (`id`, `module`, `block`, `sequence`, `showTitle`, `cssClasses`, `display`, `onAllPages`) VALUES
(1, 101, 1000, 1, 0, NULL, 1, 1),
(102103, 102, 103, 2, 0, NULL, 1, 1),
(201103, 201, 103, 1, 0, NULL, 1, 1),
(401104, 401, 104, 1, 0, NULL, 1, 1),
(501101, 501, 101, 1, 0, NULL, 1, 1),
(601102, 601, 102, 1, 0, NULL, 1, 1),
(901108, 901, 108, 1, 0, NULL, 1, 1),
(902109, 902, 109, 1, 0, NULL, 1, 1),
(903108, 903, 108, 2, 0, NULL, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `ModulesInBlocks_Lang`
--

CREATE TABLE IF NOT EXISTS `ModulesInBlocks_Lang` (
  `module` bigint(20) unsigned NOT NULL,
  `lang` varchar(3) NOT NULL,
  `title` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `ModulesOnPages`
--

CREATE TABLE IF NOT EXISTS `ModulesOnPages` (
  `module` bigint(20) unsigned NOT NULL,
  `page` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `ModulesParam`
--

CREATE TABLE IF NOT EXISTS `ModulesParam` (
  `module` bigint(20) unsigned NOT NULL,
  `param` varchar(100) NOT NULL,
  `value` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ModulesParam`
--

INSERT INTO `ModulesParam` (`module`, `param`, `value`) VALUES
(201, 'name', 'mainMenu'),
(901, 'name', 'copyText'),
(902, 'name', 'copyMain');

-- --------------------------------------------------------

--
-- Структура таблицы `ModulesTitleIcon`
--

CREATE TABLE IF NOT EXISTS `ModulesTitleIcon` (
  `module` bigint(20) unsigned NOT NULL,
  `icon` varchar(200) NOT NULL,
  `style` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `ModulesTitleIconStile`
--

CREATE TABLE IF NOT EXISTS `ModulesTitleIconStile` (
  `style` varchar(50) NOT NULL,
  `align` varchar(50) NOT NULL,
  `width` int(10) unsigned NOT NULL,
  `height` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `PageParam`
--

CREATE TABLE IF NOT EXISTS `PageParam` (
  `page` varchar(50) NOT NULL,
  `param` varchar(100) NOT NULL,
  `value` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `PageParam`
--

INSERT INTO `PageParam` (`page`, `param`, `value`) VALUES
('test', 'name', 'test');

-- --------------------------------------------------------

--
-- Структура таблицы `Pages`
--

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
-- Дамп данных таблицы `Pages`
--

INSERT INTO `Pages` (`alias`, `showTitle`, `cssClasses`, `componentElement`, `template`, `isMainPage`, `index`, `follow`, `archive`, `notModifiable`) VALUES
('accounts', 1, NULL, 999801, 'apelsinShopTest', 0, 1, 1, 1, 0),
('account_settings', 1, NULL, 999802, 'apelsinShopTest', 0, 1, 1, 1, 0),
('adminpanel', 1, NULL, 999901, 'apelsinShopTest', 0, 0, 0, 0, 0),
('shop', 1, NULL, 201, 'apelsinShop', 1, 1, 1, 1, 0),
('test', 1, NULL, 101, 'apelsinShop', 0, 1, 1, 1, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `Pages_Lang`
--

CREATE TABLE IF NOT EXISTS `Pages_Lang` (
  `page` varchar(50) NOT NULL,
  `lang` varchar(3) NOT NULL,
  `browserTitle` varchar(100) NOT NULL,
  `pageTitle` varchar(100) NOT NULL,
  `description` text,
  `keywords` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Pages_Lang`
--

INSERT INTO `Pages_Lang` (`page`, `lang`, `browserTitle`, `pageTitle`, `description`, `keywords`) VALUES
('shop', 'rus', 'Каталог Товаров', 'Каталог Товаров', NULL, NULL),
('test', 'rus', 'Тестовая страница', 'Тестовая страница', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `ParamInfo_ComponentsElements`
--

CREATE TABLE IF NOT EXISTS `ParamInfo_ComponentsElements` (
`id` bigint(20) unsigned NOT NULL,
  `componentElement` bigint(20) unsigned NOT NULL,
  `param` varchar(100) NOT NULL DEFAULT 'name',
  `mandatory` tinyint(4) NOT NULL DEFAULT '1',
  `coments` text NOT NULL,
  `table` varchar(200) DEFAULT NULL,
  `column` varchar(200) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ParamInfo_ComponentsElements`
--

INSERT INTO `ParamInfo_ComponentsElements` (`id`, `componentElement`, `param`, `mandatory`, `coments`, `table`, `column`) VALUES
(1, 101, 'name', 1, 'alias материала для вывода настранице', 'Materials', 'alias'),
(2, 102, 'name', 1, 'name списка категорий', 'MaterialsCategoriesList', 'name'),
(5, 105, 'name', 1, 'name списка категорий для вывода списка материалов', 'MaterialsCategoriesList', 'name');

-- --------------------------------------------------------

--
-- Структура таблицы `PluginDefaultParam`
--

CREATE TABLE IF NOT EXISTS `PluginDefaultParam` (
  `plugin` varchar(50) NOT NULL,
  `param` varchar(100) NOT NULL,
  `value` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `PluginDefaultParam`
--

INSERT INTO `PluginDefaultParam` (`plugin`, `param`, `value`) VALUES
('jquery', 'min', '1'),
('jquery', 'version', '1.10.1');

-- --------------------------------------------------------

--
-- Структура таблицы `PluginDepends`
--

CREATE TABLE IF NOT EXISTS `PluginDepends` (
`id` bigint(20) unsigned NOT NULL,
  `elementType` varchar(50) NOT NULL,
  `plugin` varchar(50) NOT NULL,
  `depends` varchar(50) NOT NULL,
  `versionStart` varchar(100) DEFAULT NULL,
  `versionEnd` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `PluginOnPage`
--

CREATE TABLE IF NOT EXISTS `PluginOnPage` (
`id` int(10) unsigned NOT NULL,
  `plugin` varchar(50) NOT NULL,
  `page` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `PluginParam`
--

CREATE TABLE IF NOT EXISTS `PluginParam` (
  `plugin` int(10) unsigned NOT NULL,
  `param` varchar(100) NOT NULL,
  `value` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Plugins`
--

CREATE TABLE IF NOT EXISTS `Plugins` (
  `alias` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `author` varchar(100) NOT NULL,
  `version` varchar(100) NOT NULL,
  `description` text,
  `main` varchar(100) NOT NULL,
  `head` varchar(100) DEFAULT NULL,
  `bodyEnd` varchar(100) DEFAULT NULL,
  `admin` varchar(100) DEFAULT NULL,
  `onAllPages` tinyint(3) unsigned NOT NULL DEFAULT '1',
`sequence` int(10) unsigned NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Plugins`
--

INSERT INTO `Plugins` (`alias`, `name`, `author`, `version`, `description`, `main`, `head`, `bodyEnd`, `admin`, `onAllPages`, `sequence`) VALUES
('appearingBox', 'Всплывающий блок', 'Compu Project', '1.0', 'Всплывающий блок дял размещение изображений, страниц, видео и т.д.', 'index.php', 'head.php', '', './admin/index.php', 1, 5),
('AudioPlayer', 'AudioPlayer', 'Compu Project', '1.0', 'AudioPlayer', 'index.php', 'head.php', 'bodyEnd.php', 'admin/index.php', 1, 4),
('barcodegen', 'Генератор штрих кодов', 'Compu Project', '1.0', NULL, 'index.php', 'head.php', NULL, NULL, 1, 10),
('captcha', 'Captcha', 'Compu Project', '1.0', 'Генератор проверочного кода', 'index.php', 'head.php', '', './admin/index.php', 1, 2),
('ContentToColumns', 'Content To Columns', 'Compu Project', '1.0', 'Распределяет равномерно контент по колонкам', 'index.php', 'head.php', NULL, 'admin/index.php', 1, 7),
('JCrop', 'Обрезка изображений', 'Compu Project', '1.0', 'Обрезка изображения', 'index.php', 'head.php', '', './admin/index.php', 1, 3),
('JiraCollector', 'JiraCollector', 'CompuProject', '1.0', NULL, 'index.php', 'head.php', NULL, NULL, 1, 9),
('jquery', 'Библиотека Jquery', 'Compu Project', '1.0', 'Плагин для подключения библиотеки Jquery', 'index.php', 'head.php', '', './admin/index.php', 1, 1),
('printPage', 'Версия для печати', 'Compu Project', '1.0', 'Плагин генерирующий кнопку для открытия страницы версии для печати', 'index.php', 'head.php', 'bodyEnd.php', 'admin/index.php', 1, 6),
('snowflakes', 'Snowflakes', 'Compu Project', '1.0', 'Падающий снег', 'index.php', 'head.php', NULL, 'admin/index.php', 0, 8);

-- --------------------------------------------------------

--
-- Структура таблицы `PluginsDependsElementsType`
--

CREATE TABLE IF NOT EXISTS `PluginsDependsElementsType` (
  `elementType` varchar(50) NOT NULL,
  `tableName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `PluginsDependsElementsType`
--

INSERT INTO `PluginsDependsElementsType` (`elementType`, `tableName`) VALUES
('Components', 'Components'),
('Modules', 'Modules'),
('Plugins', 'Plugins');

-- --------------------------------------------------------

--
-- Структура таблицы `ROOT_SETTINGS`
--

CREATE TABLE IF NOT EXISTS `ROOT_SETTINGS` (
  `settingsName` varchar(50) NOT NULL,
  `superKey` varchar(100) NOT NULL,
  `multilanguage` tinyint(4) NOT NULL DEFAULT '0',
  `siteClosed` tinyint(4) NOT NULL DEFAULT '0',
  `charset` varchar(100) NOT NULL,
  `companyName` varchar(100) DEFAULT NULL,
  `siteName` varchar(100) NOT NULL,
  `activated` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ROOT_SETTINGS`
--

INSERT INTO `ROOT_SETTINGS` (`settingsName`, `superKey`, `multilanguage`, `siteClosed`, `charset`, `companyName`, `siteName`, `activated`) VALUES
('default', 'f1828ce9f26031573db9a3268b51041c', 1, 0, 'utf8', 'Compu Project', 'Апельсин', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `ShopGroups`
--

CREATE TABLE IF NOT EXISTS `ShopGroups` (
  `id` varchar(200) NOT NULL,
  `groupName` varchar(100) NOT NULL,
  `shown` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `showInHierarchy` tinyint(1) unsigned NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ShopGroups`
--

INSERT INTO `ShopGroups` (`id`, `groupName`, `shown`, `showInHierarchy`) VALUES
('00116a97-03a8-11e5-bad4-005056be1f7a', 'Межкомнатные двери', 1, 1),
('009ff15a-ff84-11e4-9228-005056be1f7a', 'Клея', 1, 1),
('009ff161-ff84-11e4-9228-005056be1f7a', 'Смеси для полов', 1, 1),
('00d87c7f-0433-11e5-bad4-005056be1f7a', 'Обои флизелиновые', 1, 1),
('01056f03-2ae6-11e5-811e-00155d3703b3', 'Защитные и смазочные материалы', 1, 1),
('010c78b8-043e-11e5-bad4-005056be1f7a', 'Камень натуральный', 1, 1),
('016eb767-2a03-11e5-80c2-00155d3703e1', 'Расширительные баки', 1, 1),
('01965e66-1b3a-11e5-80c1-00155d3703e2', 'Инструменты разметочные', 1, 1),
('01d2928f-26d1-11e5-80c1-00155d3703e2', 'Блок-хаус', 1, 1),
('01d29291-26d1-11e5-80c1-00155d3703e2', 'ДВП', 1, 1),
('01d29293-26d1-11e5-80c1-00155d3703e2', 'ДСП', 1, 1),
('02b6e5e7-2608-11e5-80c1-00155d3703e2', 'Измельчители', 1, 1),
('03348b08-2558-11e5-80c1-00155d3703e2', 'Кусторезы', 1, 1),
('03348b0b-2558-11e5-80c1-00155d3703e2', 'Аэраторы', 1, 1),
('04de12b5-1b38-11e5-80c1-00155d3703e2', 'Оснастка шлифовально-полировальная', 1, 1),
('054100dc-043c-11e5-bad4-005056be1f7a', 'Полипропилен', 1, 1),
('054100e0-043c-11e5-bad4-005056be1f7a', 'Полиэтилен', 1, 1),
('054100e4-043c-11e5-bad4-005056be1f7a', 'Радиаторы', 1, 1),
('054fbc85-1b40-11e5-80c1-00155d3703e2', 'Защита органов слуха', 1, 1),
('05b1fcfd-043f-11e5-bad4-005056be1f7a', 'Реечный потолок', 1, 1),
('05b8b0db-09e7-11e5-8d10-005056be1f7a', 'Заклепки', 1, 1),
('05b8b0dc-09e7-11e5-8d10-005056be1f7a', 'Клаймеры', 1, 1),
('05cdbcd4-1f27-11e5-80c1-00155d3703e2', 'Стусла', 1, 1),
('06029fbb-260c-11e5-80c1-00155d3703e2', 'Оборудование обогревательное ', 1, 1),
('06a3956c-2b8f-11e5-80c2-00155d3703e1', 'Жидкое стекло', 1, 1),
('06dd5e22-ff84-11e4-9228-005056be1f7a', 'Цемент и пескобетон', 1, 1),
('06dd5e26-ff84-11e4-9228-005056be1f7a', 'Шпаклевки', 1, 1),
('06dd5e28-ff84-11e4-9228-005056be1f7a', 'Штукатурки', 1, 1),
('073345bc-1b0b-11e5-80c1-00155d3703e2', 'Скобяные изделия', 1, 1),
('07dad57c-039a-11e5-bad4-005056be1f7a', 'Водоснабжение и отопление', 1, 1),
('08f3f1b2-03a8-11e5-bad4-005056be1f7a', 'Металлические двери', 1, 1),
('0920459a-26d1-11e5-80c1-00155d3703e2', 'Евровагонка', 1, 1),
('09a7f361-1b39-11e5-80c1-00155d3703e2', 'Угольники, линейки и угломеры', 1, 1),
('0b53abec-043c-11e5-bad4-005056be1f7a', 'Система контроля протечки воды', 1, 1),
('0bf01769-1b3d-11e5-80c1-00155d3703e2', 'Инструменты садовые', 1, 1),
('0bf6b716-03ad-11e5-bad4-005056be1f7a', 'Рулонные гидроизоляционные материалы', 1, 1),
('0c822838-03a9-11e5-bad4-005056be1f7a', 'Оборудование газовое', 1, 1),
('0d451922-043d-11e5-bad4-005056be1f7a', 'Системы антиобледенения', 1, 1),
('0e52feea-1b40-11e5-80c1-00155d3703e2', 'Защита органов зрения', 1, 1),
('0e52feeb-1b40-11e5-80c1-00155d3703e2', 'Защита кожи', 1, 1),
('10069b0c-1b39-11e5-80c1-00155d3703e2', 'Уровни', 1, 1),
('1141e9d3-26d5-11e5-80c1-00155d3703e2', 'Паркет виниловый', 1, 1),
('12222d1f-2b93-11e5-80c2-00155d3703e1', 'Аксессуары для ванной комнаты', 1, 1),
('12bcb99c-0399-11e5-bad4-005056be1f7a', 'Гипсокартон и профиль', 1, 1),
('1380a4c8-1b3c-11e5-80c1-00155d3703e2', 'Инструменты для обработки почвы', 1, 1),
('150b44f6-1b0b-11e5-80c1-00155d3703e2', 'Перфорированный крепеж', 1, 1),
('155cd485-260f-11e5-80c1-00155d3703e2', 'Материалы гидроизоляционные', 1, 1),
('166411d5-03a9-11e5-bad4-005056be1f7a', 'Оборудование грузоподъемное', 1, 1),
('174462b2-260b-11e5-80c1-00155d3703e2', 'Паяльные лампы', 1, 1),
('182c6c39-03ad-11e5-bad4-005056be1f7a', 'Системы поверхностного водоотвода', 1, 1),
('18af1cdf-039a-11e5-bad4-005056be1f7a', 'Панели ПВХ и МДФ', 1, 1),
('18c0600b-03aa-11e5-bad4-005056be1f7a', 'Герметики', 1, 1),
('18c06010-03aa-11e5-bad4-005056be1f7a', 'Жидкие гвозди', 1, 1),
('190af193-26d4-11e5-80c1-00155d3703e2', 'Текстиль', 1, 1),
('1a0c3e31-043d-11e5-bad4-005056be1f7a', 'Счетчики, манометры и термостаты', 1, 1),
('1a0c3e34-043d-11e5-bad4-005056be1f7a', 'Сшитый полиэтилен', 1, 1),
('1a8afb53-1b40-11e5-80c1-00155d3703e2', 'Защита от поражения электрическим током', 1, 1),
('1b565b65-03a8-11e5-bad4-005056be1f7a', 'Карнизы', 1, 1),
('1bf3e36b-1f29-11e5-80c1-00155d3703e2', 'Баки и контейнеры для мусора', 1, 1),
('1ce3a773-1b36-11e5-80c1-00155d3703e2', 'Малярные емкости', 1, 1),
('1d54b7c6-09e7-11e5-8d10-005056be1f7a', 'Хомуты', 1, 1),
('1e48fc26-1b39-11e5-80c1-00155d3703e2', 'Видеоскопы', 1, 1),
('1e48fc29-1b39-11e5-80c1-00155d3703e2', 'Дальномеры', 1, 1),
('1f0658e8-2b93-11e5-80c2-00155d3703e1', 'Бассейны и оборудование', 1, 1),
('1f0658e9-2b93-11e5-80c2-00155d3703e1', 'Биде', 1, 1),
('1f0658ee-2b93-11e5-80c2-00155d3703e1', 'Ванны', 1, 1),
('202781b9-1b3e-11e5-80c1-00155d3703e2', 'Тачки и носилки', 1, 1),
('203435bd-043d-11e5-bad4-005056be1f7a', 'Теплоизоляция для труб', 1, 1),
('203435bf-043d-11e5-bad4-005056be1f7a', 'Теплоносители', 1, 1),
('203435c1-043d-11e5-bad4-005056be1f7a', 'Фильтры', 1, 1),
('2161eebe-26d1-11e5-80c1-00155d3703e2', 'Оконные блоки', 1, 1),
('22403192-1f29-11e5-80c1-00155d3703e2', 'Канатно-веревочные изделия', 1, 1),
('235ae6b0-1b3c-11e5-80c1-00155d3703e2', 'Грунты садовые', 1, 1),
('23b8fbe7-03a2-11e5-bad4-005056be1f7a', 'Вентиляторы и приточные установки', 1, 1),
('24b8f33a-03ac-11e5-bad4-005056be1f7a', 'Черепица', 1, 1),
('255a6617-1b39-11e5-80c1-00155d3703e2', 'Детекторы', 1, 1),
('25a5ec12-260a-11e5-80c1-00155d3703e2', 'Шуруповерты', 1, 1),
('25a5ec13-260a-11e5-80c1-00155d3703e2', 'Гайковерты', 1, 1),
('26aadb27-043d-11e5-bad4-005056be1f7a', 'Фитинги', 1, 1),
('26aadb29-043d-11e5-bad4-005056be1f7a', 'Шланги и подводки', 1, 1),
('26aadb2b-043d-11e5-bad4-005056be1f7a', 'Котлы электрические', 1, 1),
('27d02a8e-2ad9-11e5-811e-00155d3703b3', 'Заклепочники', 1, 1),
('2848dfbc-043f-11e5-bad4-005056be1f7a', 'Профиля', 1, 1),
('28e5eb91-26d1-11e5-80c1-00155d3703e2', 'Рейка пола', 1, 1),
('2973eebe-260e-11e5-80c1-00155d3703e2', 'Оборудование навесное', 1, 1),
('2a4606c5-2ad5-11e5-811e-00155d3703b3', 'Электро и бензотехника', 1, 1),
('2c114f33-1b3c-11e5-80c1-00155d3703e2', 'Средства защиты растений', 1, 1),
('2c114f35-1b3c-11e5-80c1-00155d3703e2', 'Удобрения', 1, 1),
('2c5ecad0-2a04-11e5-80c2-00155d3703e1', 'Инфракрасные обогреватели', 1, 1),
('2c5ecad1-2a04-11e5-80c2-00155d3703e1', 'Конвекторы', 1, 1),
('2cc06b42-2b93-11e5-80c2-00155d3703e1', 'Душевые кабины и ограждения', 1, 1),
('2cc840ef-2608-11e5-80c1-00155d3703e2', 'Мультимоторы', 1, 1),
('2d01dc5e-2609-11e5-80c1-00155d3703e2', 'Вибраторы глубинные и виброрейки', 1, 1),
('2d570482-03a8-11e5-bad4-005056be1f7a', 'Зеркала интерьерные', 1, 1),
('2d7e5ac5-1b39-11e5-80c1-00155d3703e2', 'Построители плоскостей', 1, 1),
('2d7e5ac6-1b39-11e5-80c1-00155d3703e2', 'Нивелиры', 1, 1),
('2d9e2abc-03a9-11e5-bad4-005056be1f7a', 'Инструменты измерительные', 1, 1),
('2e93b209-1b3a-11e5-80c1-00155d3703e2', 'Топоры', 1, 1),
('2f3458c4-043f-11e5-bad4-005056be1f7a', 'Соединительные элементы', 1, 1),
('3129f712-26d1-11e5-80c1-00155d3703e2', 'Фанера', 1, 1),
('3129f713-26d1-11e5-80c1-00155d3703e2', 'ЦСП', 1, 1),
('31888b1e-1b36-11e5-80c1-00155d3703e2', 'Трафареты', 1, 1),
('318998c7-1f27-11e5-80c1-00155d3703e2', 'Пистолеты', 1, 1),
('31e7ccd6-2621-11e5-80c1-00155d3703e2', 'Счетчики', 1, 1),
('32439201-03ac-11e5-bad4-005056be1f7a', 'Битумные волнистые листы', 1, 1),
('33084ce7-2a04-11e5-80c2-00155d3703e1', 'Кондиционеры', 1, 1),
('33084ce8-2a04-11e5-80c2-00155d3703e1', 'Масляные радиаторы', 1, 1),
('33efa3aa-1f2a-11e5-80c1-00155d3703e2', 'Поролон', 1, 1),
('346c415c-2623-11e5-80c1-00155d3703e2', 'Оборудование осветительное', 1, 1),
('34c21df5-2622-11e5-80c1-00155d3703e2', 'Системы безопасности и видеонаблюдения', 1, 1),
('3506b754-03a2-11e5-bad4-005056be1f7a', 'Техника для кухни', 1, 1),
('354c066d-03ad-11e5-bad4-005056be1f7a', 'Фальцевая кровля', 1, 1),
('354c066f-03ad-11e5-bad4-005056be1f7a', 'Шифер', 1, 1),
('358ebff2-2610-11e5-80c1-00155d3703e2', 'Керамзит', 1, 1),
('362c971d-043d-11e5-bad4-005056be1f7a', 'Панели МДФ', 1, 1),
('362c971e-043d-11e5-bad4-005056be1f7a', 'Панели ПВХ', 1, 1),
('3742166c-1b3c-11e5-80c1-00155d3703e2', 'Газоны', 1, 1),
('37df52d8-1b37-11e5-80c1-00155d3703e2', 'Гладилки', 1, 1),
('37df52d9-1b37-11e5-80c1-00155d3703e2', 'Мастерки, кельмы', 1, 1),
('380cd94c-03a8-11e5-bad4-005056be1f7a', 'Натуральные покрытия', 1, 1),
('3877a9b9-2558-11e5-80c1-00155d3703e2', 'Бензобуры', 1, 1),
('399bae69-2a04-11e5-80c2-00155d3703e1', 'Тепловые завесы', 1, 1),
('399bae6b-2a04-11e5-80c2-00155d3703e1', 'Увлажнители и очистители воздуха', 1, 1),
('3a295f70-03ac-11e5-bad4-005056be1f7a', 'Водосточные системы', 1, 1),
('3dce9525-1f2a-11e5-80c1-00155d3703e2', 'Ткани технические', 1, 1),
('3df545ee-03aa-11e5-bad4-005056be1f7a', 'Клеи', 1, 1),
('3e03b410-1b3a-11e5-80c1-00155d3703e2', 'Системы полива', 1, 1),
('3e57384c-2608-11e5-80c1-00155d3703e2', 'Генераторы', 1, 1),
('3f4396fa-2b93-11e5-80c2-00155d3703e1', 'Инсталляции и дренажные системы', 1, 1),
('3f46d6ee-043b-11e5-bad4-005056be1f7a', 'Элементы мощения', 1, 1),
('3f61d979-1b39-11e5-80c1-00155d3703e2', 'Пирометры, термогигрометры и тепловизоры', 1, 1),
('405e422b-039a-11e5-bad4-005056be1f7a', 'Плитка', 1, 1),
('41a60e93-2557-11e5-80c1-00155d3703e2', 'Дрели', 1, 1),
('4256450d-03ad-11e5-bad4-005056be1f7a', 'Элементы безопастности кровли', 1, 1),
('42bcf384-1f26-11e5-80c1-00155d3703e2', 'Верстаки', 1, 1),
('43d68ec5-03ac-11e5-bad4-005056be1f7a', 'Гибкая черепица', 1, 1),
('43f9245e-2558-11e5-80c1-00155d3703e2', 'Устройства воздуходувные и всасывающие', 1, 1),
('441c3e00-1b38-11e5-80c1-00155d3703e2', 'Щетки', 1, 1),
('459c2b4d-1b37-11e5-80c1-00155d3703e2', 'Миксеры строительные', 1, 1),
('45a0421b-2b93-11e5-80c2-00155d3703e1', 'Компакты', 1, 1),
('45dc243e-03a9-11e5-bad4-005056be1f7a', 'Инструменты по кафелю и стеклу', 1, 1),
('46de7104-039a-11e5-bad4-005056be1f7a', 'Напольные покрытия', 1, 1),
('47e5c871-043d-11e5-bad4-005056be1f7a', 'Сэндвич-панели', 1, 1),
('4814fe34-1b39-11e5-80c1-00155d3703e2', 'Теодолиты', 1, 1),
('4814fe36-1b39-11e5-80c1-00155d3703e2', 'Толщинометры', 1, 1),
('48da8637-1b3a-11e5-80c1-00155d3703e2', 'Системы ограждения', 1, 1),
('49183541-2557-11e5-80c1-00155d3703e2', 'Лобзики', 1, 1),
('49183544-2557-11e5-80c1-00155d3703e2', 'Перфораторы', 1, 1),
('4a31c114-2558-11e5-80c1-00155d3703e2', 'Высоторезы', 1, 1),
('4c742265-03a9-11e5-bad4-005056be1f7a', 'Лестницы, вышки и леса', 1, 1),
('4cb9a8fe-1b37-11e5-80c1-00155d3703e2', 'Шпатели', 1, 1),
('4cb9a900-1b37-11e5-80c1-00155d3703e2', 'Терки', 1, 1),
('4d7089a1-2b93-11e5-80c2-00155d3703e1', 'Писсуары и чаши генуя', 1, 1),
('4fcd7ab7-1f28-11e5-80c1-00155d3703e2', 'Инструменты сварочные', 1, 1),
('50c4723a-2558-11e5-80c1-00155d3703e2', 'Пилы', 1, 1),
('513725f0-1f26-11e5-80c1-00155d3703e2', 'Инструмент губцевый', 1, 1),
('514f9517-2557-11e5-80c1-00155d3703e2', 'Рубанки', 1, 1),
('514f9518-2557-11e5-80c1-00155d3703e2', 'Термопистолеты', 1, 1),
('51dfd0e8-1b3d-11e5-80c1-00155d3703e2', 'Инструменты снегоочистительные', 1, 1),
('521dccb3-1b39-11e5-80c1-00155d3703e2', 'Уклономеры', 1, 1),
('52e7f1d7-043d-11e5-bad4-005056be1f7a', 'Поликарбонат', 1, 1),
('5316bc9e-1b36-11e5-80c1-00155d3703e2', 'Кисти', 1, 1),
('537d0fc7-039a-11e5-bad4-005056be1f7a', 'Потолочные системы', 1, 1),
('54062a42-2609-11e5-80c1-00155d3703e2', 'Виброплиты', 1, 1),
('54683e6f-2a28-11e5-80c2-00155d3703e1', 'Пневмоинструмент и оборудование', 1, 1),
('550d3de3-2b93-11e5-80c2-00155d3703e1', 'Мебель для ванной комнаты', 1, 1),
('553116e0-2556-11e5-80c1-00155d3703e2', 'Емкости и ящики хозяйственные', 1, 1),
('555254e5-1b37-11e5-80c1-00155d3703e2', 'Правила', 1, 1),
('55b4c74c-03a2-11e5-bad4-005056be1f7a', 'Системы дымохода', 1, 1),
('569e2343-ff83-11e4-9228-005056be1f7a', 'Антисептики, огнебиозащита и пропитки', 1, 1),
('569e2345-ff83-11e4-9228-005056be1f7a', 'Грунты для лакокрасочных материалов', 1, 1),
('57784d4c-2558-11e5-80c1-00155d3703e2', 'Оборудование уборочное и машины', 1, 1),
('57784d4d-2558-11e5-80c1-00155d3703e2', 'Устройства разбрызгивающие ', 1, 1),
('5b5007ea-2b93-11e5-80c2-00155d3703e1', 'Мойки кухонные', 1, 1),
('5c5f91f2-2556-11e5-80c1-00155d3703e2', 'Емкости и ящики садовые', 1, 1),
('5c7670be-260f-11e5-80c1-00155d3703e2', 'Специальные смеси, материалы и добавки', 1, 1),
('5d319232-03a8-11e5-bad4-005056be1f7a', 'Часы', 1, 1),
('5ea91f14-1b38-11e5-80c1-00155d3703e2', 'Головки торцевые и воротки', 1, 1),
('5ea91f15-1b38-11e5-80c1-00155d3703e2', 'Домкраты', 1, 1),
('5f6cdc82-2558-11e5-80c1-00155d3703e2', 'Триммеры', 1, 1),
('5f83b1b2-260b-11e5-80c1-00155d3703e2', 'Культиваторы', 1, 1),
('5f83b1b4-260b-11e5-80c1-00155d3703e2', 'Мотоблоки', 1, 1),
('5fc884ec-1b36-11e5-80c1-00155d3703e2', 'Буры', 1, 1),
('5fc884ed-1b36-11e5-80c1-00155d3703e2', 'Коронки', 1, 1),
('620af767-0436-11e5-bad4-005056be1f7a', 'Фотообои', 1, 1),
('620af768-0436-11e5-bad4-005056be1f7a', 'Фрески', 1, 1),
('62349219-2557-11e5-80c1-00155d3703e2', 'Углошлифовальные машины', 1, 1),
('6234921d-2557-11e5-80c1-00155d3703e2', 'Фрезеры', 1, 1),
('63760902-ff83-11e4-9228-005056be1f7a', 'Декоративные антисептики', 1, 1),
('64d1037e-03ac-11e5-bad4-005056be1f7a', 'Доборные элементы', 1, 1),
('6601337b-03a8-11e5-bad4-005056be1f7a', 'Шторы и жалюзи', 1, 1),
('665b9dfb-1b38-11e5-80c1-00155d3703e2', 'Ключи гаечные', 1, 1),
('673bd31a-03a2-11e5-bad4-005056be1f7a', 'Системы канального кондиционирования', 1, 1),
('6775c1a8-26cf-11e5-80c1-00155d3703e2', 'Заборы', 1, 1),
('68036402-1b36-11e5-80c1-00155d3703e2', 'Зенкеры', 1, 1),
('681bc395-2ad8-11e5-811e-00155d3703b3', 'Терки', 1, 1),
('681bc396-2ad8-11e5-811e-00155d3703b3', 'Губки', 1, 1),
('688ebe42-09e6-11e5-8d10-005056be1f7a', 'Саморезы и шурупы', 1, 1),
('69f60b03-2557-11e5-80c1-00155d3703e2', 'Шлифовальные и затирочные машины', 1, 1),
('6aa6af7c-ff83-11e4-9228-005056be1f7a', 'Декоративные покрытия', 1, 1),
('6aa6af80-ff83-11e4-9228-005056be1f7a', 'Лаки', 1, 1),
('6beba4d5-03ad-11e5-bad4-005056be1f7a', 'Ленты', 1, 1),
('6beba4d6-03ad-11e5-bad4-005056be1f7a', 'Сетки', 1, 1),
('6c7775ed-1b3a-11e5-80c1-00155d3703e2', 'Уборка и стирка', 1, 1),
('6e6c342e-1b36-11e5-80c1-00155d3703e2', 'Фрезы', 1, 1),
('6e6c3430-1b36-11e5-80c1-00155d3703e2', 'Сверла', 1, 1),
('6e712fd0-2558-11e5-80c1-00155d3703e2', 'Устройства многофункциональные', 1, 1),
('6ecba52d-fe13-11e4-9228-005056be1f7a', 'Эмали', 1, 1),
('6ed4079d-03ac-11e5-bad4-005056be1f7a', 'Дымоходы', 1, 1),
('6ee06265-2ad8-11e5-811e-00155d3703b3', 'Бумаги', 1, 1),
('6ee06266-2ad8-11e5-811e-00155d3703b3', 'Ленты', 1, 1),
('6f39f780-260e-11e5-80c1-00155d3703e2', 'Колесные опоры', 1, 1),
('6f79f632-2b93-11e5-80c2-00155d3703e1', 'Полотенцесушители', 1, 1),
('6f79f633-2b93-11e5-80c2-00155d3703e1', 'Раковины и пъедесталы', 1, 1),
('7065c1e0-1f27-11e5-80c1-00155d3703e2', 'Тиски, струбцины', 1, 1),
('7065c1e1-1f27-11e5-80c1-00155d3703e2', 'Труборезы', 1, 1),
('70a2b25f-03a9-11e5-bad4-005056be1f7a', 'Пистолеты', 1, 1),
('70b2ccea-043e-11e5-bad4-005056be1f7a', 'Доска террасная', 1, 1),
('70b2ccee-043e-11e5-bad4-005056be1f7a', 'Покрытия ковровые', 1, 1),
('712f0074-2557-11e5-80c1-00155d3703e2', 'Станки', 1, 1),
('71c2a514-03aa-11e5-bad4-005056be1f7a', 'Монтажная пена', 1, 1),
('72429776-ff83-11e4-9228-005056be1f7a', 'Мастики', 1, 1),
('72429777-ff83-11e4-9228-005056be1f7a', 'Растворители', 1, 1),
('7252346a-1b39-11e5-80c1-00155d3703e2', 'Штангенциркули и микрометры', 1, 1),
('72d240fe-2607-11e5-80c1-00155d3703e2', 'Миксеры', 1, 1),
('738043e3-1b38-11e5-80c1-00155d3703e2', 'Аксессуары автомобильные', 1, 1),
('73fef9ac-262f-11e5-80c1-00155d3703e2', 'Системы вентиляции', 1, 1),
('7413dcd3-2633-11e5-80c1-00155d3703e2', 'Элементы вентиляции для кровли', 1, 1),
('74e183f7-159d-11e5-811a-00155d3703b3', 'Сайдинг', 1, 1),
('75420508-2ad8-11e5-811e-00155d3703b3', 'Шкурки', 1, 1),
('75dcab8a-0441-11e5-bad4-005056be1f7a', 'Оборудование коммуникационное', 1, 1),
('76eb725d-043e-11e5-bad4-005056be1f7a', 'Ковры', 1, 1),
('76f0c641-2b93-11e5-80c2-00155d3703e1', 'Смесители', 1, 1),
('77d469b2-1b36-11e5-80c1-00155d3703e2', 'Остнастка ударная для перфораторов', 1, 1),
('7878dd29-ff83-11e4-9228-005056be1f7a', 'Смывки для лакокрасочных материалов', 1, 1),
('7878dd2a-ff83-11e4-9228-005056be1f7a', 'Специальные средства и растворители', 1, 1),
('79206b59-03ad-11e5-bad4-005056be1f7a', 'Скотчи', 1, 1),
('7ab9d88b-fe13-11e4-9228-005056be1f7a', 'Лакокрасочные материалы', 1, 1),
('7cb5f7e2-1f26-11e5-80c1-00155d3703e2', 'Степлеры и скобозабиватели', 1, 1),
('7ce3d8d3-2557-11e5-80c1-00155d3703e2', 'Ножницы', 1, 1),
('7ce3d8d4-2557-11e5-80c1-00155d3703e2', 'Отбойные молотки', 1, 1),
('7d588ba2-043e-11e5-bad4-005056be1f7a', 'Линолеум', 1, 1),
('7eada471-0438-11e5-bad4-005056be1f7a', 'Железобетонные изделия, кирпичи и блоки', 1, 1),
('7eed2035-ff83-11e4-9228-005056be1f7a', 'Шпатлевки', 1, 1),
('80fac221-1b38-11e5-80c1-00155d3703e2', 'Баллоны и тележки', 1, 1),
('819bcac7-03a8-11e5-bad4-005056be1f7a', 'Балки', 1, 1),
('81b6e14a-2622-11e5-80c1-00155d3703e2', 'Ленты осветительные', 1, 1),
('828d3720-03ad-11e5-bad4-005056be1f7a', 'Упаковочные материалы', 1, 1),
('82a97a56-2633-11e5-80c1-00155d3703e2', 'Элементы дымохода для кровли', 1, 1),
('834ac095-0441-11e5-bad4-005056be1f7a', 'Аппараты защиты и коммутации', 1, 1),
('834ac098-0441-11e5-bad4-005056be1f7a', 'Элементы питания и зарядные устройства', 1, 1),
('836bdaea-2a2a-11e5-80c2-00155d3703e1', 'Инструменты и техника', 1, 1),
('836bdaeb-2a2a-11e5-80c2-00155d3703e1', 'Строительные материалы', 1, 1),
('840866de-043e-11e5-bad4-005056be1f7a', 'Доска массивная', 1, 1),
('8711984a-1b38-11e5-80c1-00155d3703e2', 'Горелки', 1, 1),
('8719a7c6-2557-11e5-80c1-00155d3703e2', 'Резаки универсальные', 1, 1),
('87349786-1b37-11e5-80c1-00155d3703e2', 'Бруски', 1, 1),
('87349788-1b37-11e5-80c1-00155d3703e2', 'Круги', 1, 1),
('87792617-2606-11e5-80c1-00155d3703e2', 'Гравера', 1, 1),
('8893d813-2af9-11e5-811e-00155d3703b3', 'Элементы декора', 1, 1),
('8918a524-03a8-11e5-bad4-005056be1f7a', 'Бамбуковые изделия', 1, 1),
('8a0a1499-09e6-11e5-8d10-005056be1f7a', 'Анкеры', 1, 1),
('8a8bd771-03ac-11e5-bad4-005056be1f7a', 'Окна мансардные', 1, 1),
('8aec992e-03ad-11e5-bad4-005056be1f7a', 'Уплотнители', 1, 1),
('8b296d8e-0441-11e5-bad4-005056be1f7a', 'Распредилительные шкафы и боксы', 1, 1),
('8b323509-26cf-11e5-80c1-00155d3703e2', 'Кладочные растворы', 1, 1),
('8c0d32ed-043e-11e5-bad4-005056be1f7a', 'Покрытия грязезащитные', 1, 1),
('8c1d670d-039a-11e5-bad4-005056be1f7a', 'Теплоизоляционные материалы', 1, 1),
('8d3dcdc7-2608-11e5-80c1-00155d3703e2', 'Аксессуары электро и бензоинструментов', 1, 1),
('8d875d7f-2b93-11e5-80c2-00155d3703e1', 'Экраны для ванн', 1, 1),
('8e3fd2e1-2a2a-11e5-80c2-00155d3703e1', 'Отделочные материалы', 1, 1),
('8e679815-1b39-11e5-80c1-00155d3703e2', 'Крестики для плитки и клинья', 1, 1),
('8e679817-1b39-11e5-80c1-00155d3703e2', 'Плиткорезы', 1, 1),
('8faaccb5-1b40-11e5-80c1-00155d3703e2', 'Пояса предохранительные, когти и лазы', 1, 1),
('90873691-03a8-11e5-bad4-005056be1f7a', 'Интерьерные багеты', 1, 1),
('90873696-03a8-11e5-bad4-005056be1f7a', 'Канаты декоративные', 1, 1),
('928d5f0a-043e-11e5-bad4-005056be1f7a', 'Пороги и стыки', 1, 1),
('928d5f0c-043e-11e5-bad4-005056be1f7a', 'Доска паркетная', 1, 1),
('92a2d625-09e6-11e5-8d10-005056be1f7a', 'Гвозди', 1, 1),
('93394f7a-159d-11e5-811a-00155d3703b3', 'Электро и бензоинструменты', 1, 1),
('93d76140-1b38-11e5-80c1-00155d3703e2', 'Резаки', 1, 1),
('951c6015-1b39-11e5-80c1-00155d3703e2', 'Стеклодомкраты', 1, 1),
('97eb85d8-2a2a-11e5-80c2-00155d3703e1', 'Сантехника', 1, 1),
('97eb85d9-2a2a-11e5-80c2-00155d3703e1', 'Сад', 1, 1),
('99e3997e-1b38-11e5-80c1-00155d3703e2', 'Редукторы и регуляторы', 1, 1),
('9a77f745-043e-11e5-bad4-005056be1f7a', 'Плинтус', 1, 1),
('9b7a9d25-260b-11e5-80c1-00155d3703e2', 'Мотопомпы', 1, 1),
('9bfb8b34-0436-11e5-bad4-005056be1f7a', 'Пробковые настенные покрытия', 1, 1),
('9ca831e7-1b39-11e5-80c1-00155d3703e2', 'Стеклорезы', 1, 1),
('9cfa50d0-1f26-11e5-80c1-00155d3703e2', 'Инструмент ударно-режущий', 1, 1),
('9ed09d1a-0441-11e5-bad4-005056be1f7a', 'Звонки', 1, 1),
('9fa70d6a-2a2a-11e5-80c2-00155d3703e1', 'Баня', 1, 1),
('9fa70d6e-2a2a-11e5-80c2-00155d3703e1', 'Двери и окна', 1, 1),
('9fbfb3b3-09e6-11e5-8d10-005056be1f7a', 'Дюбели', 1, 1),
('a11feb9a-1b38-11e5-80c1-00155d3703e2', 'Шланги газовые и кислородные', 1, 1),
('a2520ad6-1b3c-11e5-80c1-00155d3703e2', 'Системы поддержки растений', 1, 1),
('a288b5e3-043e-11e5-bad4-005056be1f7a', 'Покрытия пробковые', 1, 1),
('a2a76fa2-2ada-11e5-811e-00155d3703b3', 'Пиломатериалы', 1, 1),
('a40d4938-043f-11e5-bad4-005056be1f7a', 'Базальтовая вата', 1, 1),
('a5139a27-2557-11e5-80c1-00155d3703e2', 'Штроборезы', 1, 1),
('a5154dc4-03a2-11e5-bad4-005056be1f7a', 'Аксессуары и расходные материалы', 1, 1),
('a51ea711-0435-11e5-bad4-005056be1f7a', 'Пленки декоративные', 1, 1),
('a5282d12-043b-11e5-bad4-005056be1f7a', 'Баки для воды', 1, 1),
('a593a937-ff83-11e4-9228-005056be1f7a', 'Сухие смеси и грунты', 1, 1),
('a5bd50e7-26d2-11e5-80c1-00155d3703e2', 'Арки', 1, 1),
('a6dcc0b2-2a02-11e5-80c2-00155d3703e1', 'Гидроаккумуляторы', 1, 1),
('a99df9d6-2a2a-11e5-80c2-00155d3703e1', 'Все для дома', 1, 1),
('a99df9d7-2a2a-11e5-80c2-00155d3703e1', 'Защита труда', 1, 1),
('aa1d7996-043e-11e5-bad4-005056be1f7a', 'Аксессуары и расходные материалы', 1, 1),
('aa47beb7-0441-11e5-bad4-005056be1f7a', 'Системы монтажа электропроводки', 1, 1),
('aa47beb9-0441-11e5-bad4-005056be1f7a', 'Кабель', 1, 1),
('aa6c0c5b-043f-11e5-bad4-005056be1f7a', 'Вспененный полиэтилен', 1, 1),
('aba134d6-043b-11e5-bad4-005056be1f7a', 'Водонагреватели', 1, 1),
('ac8ae411-0435-11e5-bad4-005056be1f7a', 'Стеклообои', 1, 1),
('ad4a2a75-1f28-11e5-80c1-00155d3703e2', 'Экстракторы', 1, 1),
('ae73d56b-ff83-11e4-9228-005056be1f7a', 'Абажуры', 1, 1),
('af2b26f1-03a8-11e5-bad4-005056be1f7a', 'Перфорированные панели', 1, 1),
('af50e83a-255a-11e5-80c1-00155d3703e2', 'Степлеры электрические', 1, 1),
('b02db436-2a06-11e5-80c2-00155d3703e1', 'Системы труб', 1, 1),
('b067512c-1f27-11e5-80c1-00155d3703e2', 'Напильники и надфили', 1, 1),
('b12591dd-043e-11e5-bad4-005056be1f7a', 'Системы обогрева пола', 1, 1),
('b26b7f27-0441-11e5-bad4-005056be1f7a', 'Лампы', 1, 1),
('b3391594-043f-11e5-bad4-005056be1f7a', 'Гидро-пароизоляция', 1, 1),
('b44b2b91-2a2a-11e5-80c2-00155d3703e1', 'Электрика', 1, 1),
('b466686a-26d4-11e5-80c1-00155d3703e2', 'Облицовочная плитка', 1, 1),
('b54d6afa-1b37-11e5-80c1-00155d3703e2', 'Сетки', 1, 1),
('b55a8ca1-ff83-11e4-9228-005056be1f7a', 'Арома для бани', 1, 1),
('b69b7c64-03a9-11e5-bad4-005056be1f7a', 'Инструменты столярно-слесарные', 1, 1),
('b81e73bd-1b3f-11e5-80c1-00155d3703e2', 'Защита органов дыхания', 1, 1),
('b8305848-2a06-11e5-80c2-00155d3703e1', 'Крепеж для труб', 1, 1),
('b84baf22-03a8-11e5-bad4-005056be1f7a', 'Ротанговое полотно', 1, 1),
('b89e40ef-2aca-11e5-811e-00155d3703b3', 'Вентиляция', 1, 1),
('ba6e74b6-043f-11e5-bad4-005056be1f7a', 'Межвенцовый утеплитель', 1, 1),
('bb11f694-1b3c-11e5-80c1-00155d3703e2', 'Системы укрыва', 1, 1),
('bb8be81e-1b38-11e5-80c1-00155d3703e2', 'Каретки', 1, 1),
('bb8e728d-ff83-11e4-9228-005056be1f7a', 'Баки', 1, 1),
('bb8e7290-ff83-11e4-9228-005056be1f7a', 'Бондарные изделия', 1, 1),
('bcd9f4aa-26d2-11e5-80c1-00155d3703e2', 'Корызьки', 1, 1),
('bda75778-043a-11e5-bad4-005056be1f7a', 'Металлопрокат', 1, 1),
('be9d3a6a-2b8c-11e5-80c2-00155d3703e1', 'Краски', 1, 1),
('c11daf88-2a2a-11e5-80c2-00155d3703e1', 'Системы и коммуникации', 1, 1),
('c1a4bf83-1b38-11e5-80c1-00155d3703e2', 'Лебедки', 1, 1),
('c1a4bf8a-1b38-11e5-80c1-00155d3703e2', 'Стропы', 1, 1),
('c1bd86aa-1b3f-11e5-80c1-00155d3703e2', 'Перчатки, руковицы и наколенники', 1, 1),
('c1c97f96-ff83-11e4-9228-005056be1f7a', 'Веники', 1, 1),
('c1c97f97-ff83-11e4-9228-005056be1f7a', 'Вентиляция для бани', 1, 1),
('c1cebe3e-043f-11e5-bad4-005056be1f7a', 'Пенополистирол', 1, 1),
('c2a0e4e2-2a06-11e5-80c2-00155d3703e1', 'Медная труба', 1, 1),
('c343f723-03a3-11e5-bad4-005056be1f7a', 'Аквапанели', 1, 1),
('c371b375-2ada-11e5-811e-00155d3703b3', 'Кровельные системы', 1, 1),
('c38d2490-26d2-11e5-80c1-00155d3703e2', 'Рольставни', 1, 1),
('c4863772-043b-11e5-bad4-005056be1f7a', 'Котлы газовые', 1, 1),
('c4863773-043b-11e5-bad4-005056be1f7a', 'Гофры и сифоны', 1, 1),
('c4ec89f6-1f28-11e5-80c1-00155d3703e2', 'Уголь, решетки и мангалы', 1, 1),
('c6cd3a9b-1f26-11e5-80c1-00155d3703e2', 'Инструменты электромонтажные', 1, 1),
('c8a4a1ce-2a06-11e5-80c2-00155d3703e1', 'Металлопласт', 1, 1),
('c8a90fb0-ff83-11e4-9228-005056be1f7a', 'Двери и окна для бани', 1, 1),
('c8a90fb1-ff83-11e4-9228-005056be1f7a', 'Дымоходы для бани', 1, 1),
('c9cc47b8-043a-11e5-bad4-005056be1f7a', 'Погонаж', 1, 1),
('cab56d19-255a-11e5-80c1-00155d3703e2', 'Плиткорезы и камнерезы', 1, 1),
('cb6a93d2-0441-11e5-bad4-005056be1f7a', 'Инструменты паяльные', 1, 1),
('cc0ea6a6-03a3-11e5-bad4-005056be1f7a', 'Гипсоволоконные листы', 1, 1),
('ccd27b93-2a03-11e5-80c2-00155d3703e1', 'Канализация внутренняя', 1, 1),
('cd21ee7e-043f-11e5-bad4-005056be1f7a', 'Стекловолокно', 1, 1),
('cefbf45b-ff83-11e4-9228-005056be1f7a', 'Изделия из камня', 1, 1),
('cefbf45c-ff83-11e4-9228-005056be1f7a', 'Интерьер для бани', 1, 1),
('cefbf45d-ff83-11e4-9228-005056be1f7a', 'Камни', 1, 1),
('cf5624a6-1b38-11e5-80c1-00155d3703e2', 'Тали и тельферы', 1, 1),
('d1037afa-1f26-11e5-80c1-00155d3703e2', 'Ломы, гвоздодеры', 1, 1),
('d24345ca-1b0a-11e5-80c1-00155d3703e2', 'Метрический крепеж', 1, 1),
('d3bb3ec7-03a3-11e5-bad4-005056be1f7a', 'Гипсокартонные листы', 1, 1),
('d4847a1e-043a-11e5-bad4-005056be1f7a', 'Сетки металлические', 1, 1),
('d4bd740f-2a03-11e5-80c2-00155d3703e1', 'Канализация наружняя', 1, 1),
('d4f70b75-043f-11e5-bad4-005056be1f7a', 'Пенополистирол экструдированный', 1, 1),
('d7b136a3-ff83-11e4-9228-005056be1f7a', 'Мебель для бани', 1, 1),
('d7b136a5-ff83-11e4-9228-005056be1f7a', 'Печи', 1, 1),
('d84001a8-0441-11e5-bad4-005056be1f7a', 'Удлинители, вилки, гнезда и разветвители', 1, 1),
('d87f8a4f-043d-11e5-bad4-005056be1f7a', 'Керамический гранит', 1, 1),
('d90dabf3-2adb-11e5-811e-00155d3703b3', 'Клеи, герметики и пены', 1, 1),
('d929955e-03a8-11e5-bad4-005056be1f7a', 'Инструменты малярные', 1, 1),
('d9effaa6-1f26-11e5-80c1-00155d3703e2', 'Молотки', 1, 1),
('d9effaa7-1f26-11e5-80c1-00155d3703e2', 'Ножницы и болторезы', 1, 1),
('da724cb4-2608-11e5-80c1-00155d3703e2', 'Бетоносмесители', 1, 1),
('dc09f758-03a3-11e5-bad4-005056be1f7a', 'Пазогребневые плиты', 1, 1),
('dc30b997-2ae2-11e5-811e-00155d3703b3', 'Ленты, сетки и скотчи', 1, 1),
('de447de1-ff83-11e4-9228-005056be1f7a', 'Средство для очистки дымоходов', 1, 1),
('de447de3-ff83-11e4-9228-005056be1f7a', 'Текстиль', 1, 1),
('dfd3f068-043e-11e5-bad4-005056be1f7a', 'Подвесная система', 1, 1),
('e057d072-03a8-11e5-bad4-005056be1f7a', 'Оснастка для электро и бензоинструментов', 1, 1),
('e2784c06-1f26-11e5-80c1-00155d3703e2', 'Ножовки и пилы', 1, 1),
('e2784c07-1f26-11e5-80c1-00155d3703e2', 'Отвертки', 1, 1),
('e2cc6837-0432-11e5-bad4-005056be1f7a', 'Обои акриловые', 1, 1),
('e2cc6838-0432-11e5-bad4-005056be1f7a', 'Обои виниловые', 1, 1),
('e41fe8a3-043b-11e5-bad4-005056be1f7a', 'Запорно-регулирующая арматура', 1, 1),
('e4ce3ba3-ff83-11e4-9228-005056be1f7a', 'Термоизоляция для бани', 1, 1),
('e4ce3ba5-ff83-11e4-9228-005056be1f7a', 'Термометры, гигрометры', 1, 1),
('e4ce3ba9-ff83-11e4-9228-005056be1f7a', 'Электрика для бани', 1, 1),
('e504229b-2557-11e5-80c1-00155d3703e2', 'Газонокосилки', 1, 1),
('e600a4e5-043e-11e5-bad4-005056be1f7a', 'Декоративные элементы', 1, 1),
('e63f75ec-0441-11e5-bad4-005056be1f7a', 'Электроустановочные изделия', 1, 1),
('e6ea5159-043d-11e5-bad4-005056be1f7a', 'Камень искусственный', 1, 1),
('e70e507a-1f27-11e5-80c1-00155d3703e2', 'Рубанки', 1, 1),
('e84cc2d6-03aa-11e5-bad4-005056be1f7a', 'Смазка', 1, 1),
('e8675698-1b35-11e5-80c1-00155d3703e2', 'Валики, ролики', 1, 1),
('e86fb2bc-03a8-11e5-bad4-005056be1f7a', 'Инструменты штукатурные', 1, 1),
('ea59248d-255a-11e5-80c1-00155d3703e2', 'Скарификаторы', 1, 1),
('ea805b1d-0432-11e5-bad4-005056be1f7a', 'Обои гофрированные', 1, 1),
('eb6760f6-1b0a-11e5-80c1-00155d3703e2', 'Такелаж', 1, 1),
('eba07a51-0433-11e5-bad4-005056be1f7a', 'Панно', 1, 1),
('ec0fbf89-260b-11e5-80c1-00155d3703e2', 'Стабилизаторы и трансформаторы', 1, 1),
('ee05c6a4-03a9-11e5-bad4-005056be1f7a', 'Ящики и органайзеры', 1, 1),
('f0402da3-043b-11e5-bad4-005056be1f7a', 'Водоотведение', 1, 1),
('f0402da7-043b-11e5-bad4-005056be1f7a', 'Системы климатические ', 1, 1),
('f05763f5-2a02-11e5-80c2-00155d3703e1', 'Газовые колонки', 1, 1),
('f1a53cb0-0432-11e5-bad4-005056be1f7a', 'Обои дуплексные', 1, 1),
('f1a53cb2-0432-11e5-bad4-005056be1f7a', 'Обои моющиеся', 1, 1),
('f1b67c1b-1b3e-11e5-80c1-00155d3703e2', 'Влагозащита', 1, 1),
('f1b67c1e-1b3e-11e5-80c1-00155d3703e2', 'Головные уборы', 1, 1),
('f1cbe028-255a-11e5-80c1-00155d3703e2', 'Тракторы', 1, 1),
('f3357d57-03ac-11e5-bad4-005056be1f7a', 'Чердачные лестницы', 1, 1),
('f4323b63-043d-11e5-bad4-005056be1f7a', 'Аксессуары и расходные материалы', 1, 1),
('f441d46a-1b38-11e5-80c1-00155d3703e2', 'Рулетки', 1, 1),
('f4f8a3bf-1f29-11e5-80c1-00155d3703e2', 'Москитные сетки', 1, 1),
('f732b015-03a8-11e5-bad4-005056be1f7a', 'Инструменты абразивно-шлифовальные', 1, 1),
('f74b121a-1f27-11e5-80c1-00155d3703e2', 'Инструменты сантехнические', 1, 1),
('f7818a2c-043b-11e5-bad4-005056be1f7a', 'Системы коллекторные', 1, 1),
('f82099f5-1b3e-11e5-80c1-00155d3703e2', 'Обувь и аксессуары', 1, 1),
('f9bc6209-0399-11e5-bad4-005056be1f7a', 'Обои', 1, 1),
('fa4db2b8-2a02-11e5-80c2-00155d3703e1', 'Оборудование котельное', 1, 1),
('fa733516-ff83-11e4-9228-005056be1f7a', 'Грунты', 1, 1),
('fa733518-ff83-11e4-9228-005056be1f7a', 'Затирки', 1, 1),
('fa860d03-1b38-11e5-80c1-00155d3703e2', 'Инструмент токоизмерительный', 1, 1),
('fae21c3b-043d-11e5-bad4-005056be1f7a', 'Мозайка', 1, 1),
('fb5af916-26d0-11e5-80c1-00155d3703e2', 'ОСБ', 1, 1),
('fd79a8f1-03a8-11e5-bad4-005056be1f7a', 'Инструменты автомобильные', 1, 1),
('fde74c14-2ad9-11e5-811e-00155d3703b3', 'Крепеж и такелаж', 1, 1),
('fe5439c3-03ac-11e5-bad4-005056be1f7a', 'Металлочерепица', 1, 1),
('fe5439c6-03ac-11e5-bad4-005056be1f7a', 'Профлист', 1, 1),
('feb257e0-043b-11e5-bad4-005056be1f7a', 'Оборудование насосное', 1, 1),
('feb257e2-043b-11e5-bad4-005056be1f7a', 'Пожарная техника', 1, 1),
('ff0e1054-043e-11e5-bad4-005056be1f7a', 'Потолок из пенополистирола', 1, 1),
('ff3c4a46-1b3e-11e5-80c1-00155d3703e2', 'Одежда', 1, 1),
('ff5ed528-26cf-11e5-80c1-00155d3703e2', 'Теплицы', 1, 1),
('ffb217d3-09e6-11e5-8d10-005056be1f7a', 'Заглушки', 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `ShopGroupsHierarchy`
--

CREATE TABLE IF NOT EXISTS `ShopGroupsHierarchy` (
  `group` varchar(200) NOT NULL,
  `parentGroup` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ShopGroupsHierarchy`
--

INSERT INTO `ShopGroupsHierarchy` (`group`, `parentGroup`) VALUES
('00116a97-03a8-11e5-bad4-005056be1f7a', '9fa70d6e-2a2a-11e5-80c2-00155d3703e1'),
('009ff15a-ff84-11e4-9228-005056be1f7a', 'a593a937-ff83-11e4-9228-005056be1f7a'),
('009ff161-ff84-11e4-9228-005056be1f7a', 'a593a937-ff83-11e4-9228-005056be1f7a'),
('00d87c7f-0433-11e5-bad4-005056be1f7a', 'f9bc6209-0399-11e5-bad4-005056be1f7a'),
('01056f03-2ae6-11e5-811e-00155d3703b3', '836bdaea-2a2a-11e5-80c2-00155d3703e1'),
('010c78b8-043e-11e5-bad4-005056be1f7a', '405e422b-039a-11e5-bad4-005056be1f7a'),
('016eb767-2a03-11e5-80c2-00155d3703e1', '07dad57c-039a-11e5-bad4-005056be1f7a'),
('01965e66-1b3a-11e5-80c1-00155d3703e2', '836bdaea-2a2a-11e5-80c2-00155d3703e1'),
('01d2928f-26d1-11e5-80c1-00155d3703e2', 'a2a76fa2-2ada-11e5-811e-00155d3703b3'),
('01d29291-26d1-11e5-80c1-00155d3703e2', 'a2a76fa2-2ada-11e5-811e-00155d3703b3'),
('01d29293-26d1-11e5-80c1-00155d3703e2', 'a2a76fa2-2ada-11e5-811e-00155d3703b3'),
('02b6e5e7-2608-11e5-80c1-00155d3703e2', '2a4606c5-2ad5-11e5-811e-00155d3703b3'),
('03348b08-2558-11e5-80c1-00155d3703e2', '93394f7a-159d-11e5-811a-00155d3703b3'),
('03348b0b-2558-11e5-80c1-00155d3703e2', '93394f7a-159d-11e5-811a-00155d3703b3'),
('04de12b5-1b38-11e5-80c1-00155d3703e2', 'f732b015-03a8-11e5-bad4-005056be1f7a'),
('054100dc-043c-11e5-bad4-005056be1f7a', 'b02db436-2a06-11e5-80c2-00155d3703e1'),
('054100e0-043c-11e5-bad4-005056be1f7a', 'b02db436-2a06-11e5-80c2-00155d3703e1'),
('054100e4-043c-11e5-bad4-005056be1f7a', '07dad57c-039a-11e5-bad4-005056be1f7a'),
('054fbc85-1b40-11e5-80c1-00155d3703e2', 'a99df9d7-2a2a-11e5-80c2-00155d3703e1'),
('05b1fcfd-043f-11e5-bad4-005056be1f7a', '537d0fc7-039a-11e5-bad4-005056be1f7a'),
('05b8b0db-09e7-11e5-8d10-005056be1f7a', 'fde74c14-2ad9-11e5-811e-00155d3703b3'),
('05b8b0dc-09e7-11e5-8d10-005056be1f7a', 'fde74c14-2ad9-11e5-811e-00155d3703b3'),
('05cdbcd4-1f27-11e5-80c1-00155d3703e2', 'b69b7c64-03a9-11e5-bad4-005056be1f7a'),
('06029fbb-260c-11e5-80c1-00155d3703e2', '93394f7a-159d-11e5-811a-00155d3703b3'),
('06a3956c-2b8f-11e5-80c2-00155d3703e1', '7878dd2a-ff83-11e4-9228-005056be1f7a'),
('06dd5e22-ff84-11e4-9228-005056be1f7a', 'a593a937-ff83-11e4-9228-005056be1f7a'),
('06dd5e26-ff84-11e4-9228-005056be1f7a', 'a593a937-ff83-11e4-9228-005056be1f7a'),
('06dd5e28-ff84-11e4-9228-005056be1f7a', 'a593a937-ff83-11e4-9228-005056be1f7a'),
('073345bc-1b0b-11e5-80c1-00155d3703e2', '836bdaeb-2a2a-11e5-80c2-00155d3703e1'),
('07dad57c-039a-11e5-bad4-005056be1f7a', 'c11daf88-2a2a-11e5-80c2-00155d3703e1'),
('08f3f1b2-03a8-11e5-bad4-005056be1f7a', '9fa70d6e-2a2a-11e5-80c2-00155d3703e1'),
('0920459a-26d1-11e5-80c1-00155d3703e2', 'a2a76fa2-2ada-11e5-811e-00155d3703b3'),
('09a7f361-1b39-11e5-80c1-00155d3703e2', '2d9e2abc-03a9-11e5-bad4-005056be1f7a'),
('0b53abec-043c-11e5-bad4-005056be1f7a', '07dad57c-039a-11e5-bad4-005056be1f7a'),
('0bf01769-1b3d-11e5-80c1-00155d3703e2', '97eb85d9-2a2a-11e5-80c2-00155d3703e1'),
('0bf6b716-03ad-11e5-bad4-005056be1f7a', 'c371b375-2ada-11e5-811e-00155d3703b3'),
('0c822838-03a9-11e5-bad4-005056be1f7a', '836bdaea-2a2a-11e5-80c2-00155d3703e1'),
('0d451922-043d-11e5-bad4-005056be1f7a', '07dad57c-039a-11e5-bad4-005056be1f7a'),
('0e52feea-1b40-11e5-80c1-00155d3703e2', 'a99df9d7-2a2a-11e5-80c2-00155d3703e1'),
('0e52feeb-1b40-11e5-80c1-00155d3703e2', 'a99df9d7-2a2a-11e5-80c2-00155d3703e1'),
('10069b0c-1b39-11e5-80c1-00155d3703e2', '2d9e2abc-03a9-11e5-bad4-005056be1f7a'),
('1141e9d3-26d5-11e5-80c1-00155d3703e2', '46de7104-039a-11e5-bad4-005056be1f7a'),
('12222d1f-2b93-11e5-80c2-00155d3703e1', '97eb85d8-2a2a-11e5-80c2-00155d3703e1'),
('12bcb99c-0399-11e5-bad4-005056be1f7a', '836bdaeb-2a2a-11e5-80c2-00155d3703e1'),
('1380a4c8-1b3c-11e5-80c1-00155d3703e2', '97eb85d9-2a2a-11e5-80c2-00155d3703e1'),
('150b44f6-1b0b-11e5-80c1-00155d3703e2', 'fde74c14-2ad9-11e5-811e-00155d3703b3'),
('155cd485-260f-11e5-80c1-00155d3703e2', 'a593a937-ff83-11e4-9228-005056be1f7a'),
('166411d5-03a9-11e5-bad4-005056be1f7a', '836bdaea-2a2a-11e5-80c2-00155d3703e1'),
('174462b2-260b-11e5-80c1-00155d3703e2', '93394f7a-159d-11e5-811a-00155d3703b3'),
('182c6c39-03ad-11e5-bad4-005056be1f7a', '3f46d6ee-043b-11e5-bad4-005056be1f7a'),
('18af1cdf-039a-11e5-bad4-005056be1f7a', '8e3fd2e1-2a2a-11e5-80c2-00155d3703e1'),
('18c0600b-03aa-11e5-bad4-005056be1f7a', 'd90dabf3-2adb-11e5-811e-00155d3703b3'),
('18c06010-03aa-11e5-bad4-005056be1f7a', 'd90dabf3-2adb-11e5-811e-00155d3703b3'),
('190af193-26d4-11e5-80c1-00155d3703e2', 'a99df9d6-2a2a-11e5-80c2-00155d3703e1'),
('1a0c3e31-043d-11e5-bad4-005056be1f7a', '07dad57c-039a-11e5-bad4-005056be1f7a'),
('1a0c3e34-043d-11e5-bad4-005056be1f7a', 'b02db436-2a06-11e5-80c2-00155d3703e1'),
('1a8afb53-1b40-11e5-80c1-00155d3703e2', 'a99df9d7-2a2a-11e5-80c2-00155d3703e1'),
('1b565b65-03a8-11e5-bad4-005056be1f7a', 'a99df9d6-2a2a-11e5-80c2-00155d3703e1'),
('1bf3e36b-1f29-11e5-80c1-00155d3703e2', '6c7775ed-1b3a-11e5-80c1-00155d3703e2'),
('1ce3a773-1b36-11e5-80c1-00155d3703e2', 'd929955e-03a8-11e5-bad4-005056be1f7a'),
('1d54b7c6-09e7-11e5-8d10-005056be1f7a', 'fde74c14-2ad9-11e5-811e-00155d3703b3'),
('1e48fc26-1b39-11e5-80c1-00155d3703e2', '2d9e2abc-03a9-11e5-bad4-005056be1f7a'),
('1e48fc29-1b39-11e5-80c1-00155d3703e2', '2d9e2abc-03a9-11e5-bad4-005056be1f7a'),
('1f0658e8-2b93-11e5-80c2-00155d3703e1', '97eb85d8-2a2a-11e5-80c2-00155d3703e1'),
('1f0658e9-2b93-11e5-80c2-00155d3703e1', '97eb85d8-2a2a-11e5-80c2-00155d3703e1'),
('1f0658ee-2b93-11e5-80c2-00155d3703e1', '97eb85d8-2a2a-11e5-80c2-00155d3703e1'),
('202781b9-1b3e-11e5-80c1-00155d3703e2', '97eb85d9-2a2a-11e5-80c2-00155d3703e1'),
('203435bd-043d-11e5-bad4-005056be1f7a', 'b02db436-2a06-11e5-80c2-00155d3703e1'),
('203435bf-043d-11e5-bad4-005056be1f7a', '07dad57c-039a-11e5-bad4-005056be1f7a'),
('203435c1-043d-11e5-bad4-005056be1f7a', '07dad57c-039a-11e5-bad4-005056be1f7a'),
('2161eebe-26d1-11e5-80c1-00155d3703e2', '9fa70d6e-2a2a-11e5-80c2-00155d3703e1'),
('22403192-1f29-11e5-80c1-00155d3703e2', 'a99df9d6-2a2a-11e5-80c2-00155d3703e1'),
('235ae6b0-1b3c-11e5-80c1-00155d3703e2', '97eb85d9-2a2a-11e5-80c2-00155d3703e1'),
('23b8fbe7-03a2-11e5-bad4-005056be1f7a', 'b89e40ef-2aca-11e5-811e-00155d3703b3'),
('24b8f33a-03ac-11e5-bad4-005056be1f7a', 'c371b375-2ada-11e5-811e-00155d3703b3'),
('255a6617-1b39-11e5-80c1-00155d3703e2', '2d9e2abc-03a9-11e5-bad4-005056be1f7a'),
('25a5ec12-260a-11e5-80c1-00155d3703e2', '93394f7a-159d-11e5-811a-00155d3703b3'),
('25a5ec13-260a-11e5-80c1-00155d3703e2', '93394f7a-159d-11e5-811a-00155d3703b3'),
('26aadb27-043d-11e5-bad4-005056be1f7a', 'b02db436-2a06-11e5-80c2-00155d3703e1'),
('26aadb29-043d-11e5-bad4-005056be1f7a', '07dad57c-039a-11e5-bad4-005056be1f7a'),
('26aadb2b-043d-11e5-bad4-005056be1f7a', '07dad57c-039a-11e5-bad4-005056be1f7a'),
('27d02a8e-2ad9-11e5-811e-00155d3703b3', 'b69b7c64-03a9-11e5-bad4-005056be1f7a'),
('2848dfbc-043f-11e5-bad4-005056be1f7a', '12bcb99c-0399-11e5-bad4-005056be1f7a'),
('28e5eb91-26d1-11e5-80c1-00155d3703e2', 'a2a76fa2-2ada-11e5-811e-00155d3703b3'),
('2973eebe-260e-11e5-80c1-00155d3703e2', '93394f7a-159d-11e5-811a-00155d3703b3'),
('2a4606c5-2ad5-11e5-811e-00155d3703b3', '836bdaea-2a2a-11e5-80c2-00155d3703e1'),
('2c114f33-1b3c-11e5-80c1-00155d3703e2', '97eb85d9-2a2a-11e5-80c2-00155d3703e1'),
('2c114f35-1b3c-11e5-80c1-00155d3703e2', '97eb85d9-2a2a-11e5-80c2-00155d3703e1'),
('2c5ecad0-2a04-11e5-80c2-00155d3703e1', 'f0402da7-043b-11e5-bad4-005056be1f7a'),
('2c5ecad1-2a04-11e5-80c2-00155d3703e1', 'f0402da7-043b-11e5-bad4-005056be1f7a'),
('2cc06b42-2b93-11e5-80c2-00155d3703e1', '97eb85d8-2a2a-11e5-80c2-00155d3703e1'),
('2cc840ef-2608-11e5-80c1-00155d3703e2', '2a4606c5-2ad5-11e5-811e-00155d3703b3'),
('2d01dc5e-2609-11e5-80c1-00155d3703e2', '2a4606c5-2ad5-11e5-811e-00155d3703b3'),
('2d570482-03a8-11e5-bad4-005056be1f7a', 'a99df9d6-2a2a-11e5-80c2-00155d3703e1'),
('2d7e5ac5-1b39-11e5-80c1-00155d3703e2', '2d9e2abc-03a9-11e5-bad4-005056be1f7a'),
('2d7e5ac6-1b39-11e5-80c1-00155d3703e2', '2d9e2abc-03a9-11e5-bad4-005056be1f7a'),
('2d9e2abc-03a9-11e5-bad4-005056be1f7a', '836bdaea-2a2a-11e5-80c2-00155d3703e1'),
('2e93b209-1b3a-11e5-80c1-00155d3703e2', 'b69b7c64-03a9-11e5-bad4-005056be1f7a'),
('2f3458c4-043f-11e5-bad4-005056be1f7a', '12bcb99c-0399-11e5-bad4-005056be1f7a'),
('3129f712-26d1-11e5-80c1-00155d3703e2', 'a2a76fa2-2ada-11e5-811e-00155d3703b3'),
('3129f713-26d1-11e5-80c1-00155d3703e2', '7eada471-0438-11e5-bad4-005056be1f7a'),
('31888b1e-1b36-11e5-80c1-00155d3703e2', 'd929955e-03a8-11e5-bad4-005056be1f7a'),
('318998c7-1f27-11e5-80c1-00155d3703e2', 'b69b7c64-03a9-11e5-bad4-005056be1f7a'),
('31e7ccd6-2621-11e5-80c1-00155d3703e2', 'b44b2b91-2a2a-11e5-80c2-00155d3703e1'),
('32439201-03ac-11e5-bad4-005056be1f7a', 'c371b375-2ada-11e5-811e-00155d3703b3'),
('33084ce7-2a04-11e5-80c2-00155d3703e1', 'f0402da7-043b-11e5-bad4-005056be1f7a'),
('33084ce8-2a04-11e5-80c2-00155d3703e1', 'f0402da7-043b-11e5-bad4-005056be1f7a'),
('33efa3aa-1f2a-11e5-80c1-00155d3703e2', 'a99df9d6-2a2a-11e5-80c2-00155d3703e1'),
('346c415c-2623-11e5-80c1-00155d3703e2', 'b44b2b91-2a2a-11e5-80c2-00155d3703e1'),
('34c21df5-2622-11e5-80c1-00155d3703e2', 'b44b2b91-2a2a-11e5-80c2-00155d3703e1'),
('3506b754-03a2-11e5-bad4-005056be1f7a', 'b89e40ef-2aca-11e5-811e-00155d3703b3'),
('354c066d-03ad-11e5-bad4-005056be1f7a', 'c371b375-2ada-11e5-811e-00155d3703b3'),
('354c066f-03ad-11e5-bad4-005056be1f7a', 'c371b375-2ada-11e5-811e-00155d3703b3'),
('358ebff2-2610-11e5-80c1-00155d3703e2', 'a593a937-ff83-11e4-9228-005056be1f7a'),
('362c971d-043d-11e5-bad4-005056be1f7a', '18af1cdf-039a-11e5-bad4-005056be1f7a'),
('362c971e-043d-11e5-bad4-005056be1f7a', '18af1cdf-039a-11e5-bad4-005056be1f7a'),
('3742166c-1b3c-11e5-80c1-00155d3703e2', '97eb85d9-2a2a-11e5-80c2-00155d3703e1'),
('37df52d8-1b37-11e5-80c1-00155d3703e2', 'e86fb2bc-03a8-11e5-bad4-005056be1f7a'),
('37df52d9-1b37-11e5-80c1-00155d3703e2', 'e86fb2bc-03a8-11e5-bad4-005056be1f7a'),
('380cd94c-03a8-11e5-bad4-005056be1f7a', 'f9bc6209-0399-11e5-bad4-005056be1f7a'),
('3877a9b9-2558-11e5-80c1-00155d3703e2', '93394f7a-159d-11e5-811a-00155d3703b3'),
('399bae69-2a04-11e5-80c2-00155d3703e1', 'f0402da7-043b-11e5-bad4-005056be1f7a'),
('399bae6b-2a04-11e5-80c2-00155d3703e1', 'f0402da7-043b-11e5-bad4-005056be1f7a'),
('3a295f70-03ac-11e5-bad4-005056be1f7a', 'c371b375-2ada-11e5-811e-00155d3703b3'),
('3dce9525-1f2a-11e5-80c1-00155d3703e2', 'a99df9d6-2a2a-11e5-80c2-00155d3703e1'),
('3df545ee-03aa-11e5-bad4-005056be1f7a', 'd90dabf3-2adb-11e5-811e-00155d3703b3'),
('3e03b410-1b3a-11e5-80c1-00155d3703e2', '97eb85d9-2a2a-11e5-80c2-00155d3703e1'),
('3e57384c-2608-11e5-80c1-00155d3703e2', '2a4606c5-2ad5-11e5-811e-00155d3703b3'),
('3f4396fa-2b93-11e5-80c2-00155d3703e1', '97eb85d8-2a2a-11e5-80c2-00155d3703e1'),
('3f46d6ee-043b-11e5-bad4-005056be1f7a', '836bdaeb-2a2a-11e5-80c2-00155d3703e1'),
('3f61d979-1b39-11e5-80c1-00155d3703e2', '2d9e2abc-03a9-11e5-bad4-005056be1f7a'),
('405e422b-039a-11e5-bad4-005056be1f7a', '8e3fd2e1-2a2a-11e5-80c2-00155d3703e1'),
('41a60e93-2557-11e5-80c1-00155d3703e2', '93394f7a-159d-11e5-811a-00155d3703b3'),
('4256450d-03ad-11e5-bad4-005056be1f7a', 'c371b375-2ada-11e5-811e-00155d3703b3'),
('42bcf384-1f26-11e5-80c1-00155d3703e2', 'b69b7c64-03a9-11e5-bad4-005056be1f7a'),
('43d68ec5-03ac-11e5-bad4-005056be1f7a', 'c371b375-2ada-11e5-811e-00155d3703b3'),
('43f9245e-2558-11e5-80c1-00155d3703e2', '93394f7a-159d-11e5-811a-00155d3703b3'),
('441c3e00-1b38-11e5-80c1-00155d3703e2', 'f732b015-03a8-11e5-bad4-005056be1f7a'),
('459c2b4d-1b37-11e5-80c1-00155d3703e2', 'e86fb2bc-03a8-11e5-bad4-005056be1f7a'),
('45a0421b-2b93-11e5-80c2-00155d3703e1', '97eb85d8-2a2a-11e5-80c2-00155d3703e1'),
('45dc243e-03a9-11e5-bad4-005056be1f7a', '836bdaea-2a2a-11e5-80c2-00155d3703e1'),
('46de7104-039a-11e5-bad4-005056be1f7a', '8e3fd2e1-2a2a-11e5-80c2-00155d3703e1'),
('47e5c871-043d-11e5-bad4-005056be1f7a', '18af1cdf-039a-11e5-bad4-005056be1f7a'),
('4814fe34-1b39-11e5-80c1-00155d3703e2', '2d9e2abc-03a9-11e5-bad4-005056be1f7a'),
('4814fe36-1b39-11e5-80c1-00155d3703e2', '2d9e2abc-03a9-11e5-bad4-005056be1f7a'),
('48da8637-1b3a-11e5-80c1-00155d3703e2', '97eb85d9-2a2a-11e5-80c2-00155d3703e1'),
('49183541-2557-11e5-80c1-00155d3703e2', '93394f7a-159d-11e5-811a-00155d3703b3'),
('49183544-2557-11e5-80c1-00155d3703e2', '93394f7a-159d-11e5-811a-00155d3703b3'),
('4a31c114-2558-11e5-80c1-00155d3703e2', '93394f7a-159d-11e5-811a-00155d3703b3'),
('4c742265-03a9-11e5-bad4-005056be1f7a', '836bdaea-2a2a-11e5-80c2-00155d3703e1'),
('4cb9a8fe-1b37-11e5-80c1-00155d3703e2', 'e86fb2bc-03a8-11e5-bad4-005056be1f7a'),
('4cb9a900-1b37-11e5-80c1-00155d3703e2', 'e86fb2bc-03a8-11e5-bad4-005056be1f7a'),
('4d7089a1-2b93-11e5-80c2-00155d3703e1', '97eb85d8-2a2a-11e5-80c2-00155d3703e1'),
('4fcd7ab7-1f28-11e5-80c1-00155d3703e2', '836bdaea-2a2a-11e5-80c2-00155d3703e1'),
('50c4723a-2558-11e5-80c1-00155d3703e2', '93394f7a-159d-11e5-811a-00155d3703b3'),
('513725f0-1f26-11e5-80c1-00155d3703e2', 'b69b7c64-03a9-11e5-bad4-005056be1f7a'),
('514f9517-2557-11e5-80c1-00155d3703e2', '93394f7a-159d-11e5-811a-00155d3703b3'),
('514f9518-2557-11e5-80c1-00155d3703e2', '93394f7a-159d-11e5-811a-00155d3703b3'),
('51dfd0e8-1b3d-11e5-80c1-00155d3703e2', '97eb85d9-2a2a-11e5-80c2-00155d3703e1'),
('521dccb3-1b39-11e5-80c1-00155d3703e2', '2d9e2abc-03a9-11e5-bad4-005056be1f7a'),
('52e7f1d7-043d-11e5-bad4-005056be1f7a', '18af1cdf-039a-11e5-bad4-005056be1f7a'),
('5316bc9e-1b36-11e5-80c1-00155d3703e2', 'd929955e-03a8-11e5-bad4-005056be1f7a'),
('537d0fc7-039a-11e5-bad4-005056be1f7a', '8e3fd2e1-2a2a-11e5-80c2-00155d3703e1'),
('54062a42-2609-11e5-80c1-00155d3703e2', '2a4606c5-2ad5-11e5-811e-00155d3703b3'),
('54683e6f-2a28-11e5-80c2-00155d3703e1', '836bdaea-2a2a-11e5-80c2-00155d3703e1'),
('550d3de3-2b93-11e5-80c2-00155d3703e1', '97eb85d8-2a2a-11e5-80c2-00155d3703e1'),
('553116e0-2556-11e5-80c1-00155d3703e2', 'a99df9d6-2a2a-11e5-80c2-00155d3703e1'),
('555254e5-1b37-11e5-80c1-00155d3703e2', 'e86fb2bc-03a8-11e5-bad4-005056be1f7a'),
('55b4c74c-03a2-11e5-bad4-005056be1f7a', 'b89e40ef-2aca-11e5-811e-00155d3703b3'),
('569e2343-ff83-11e4-9228-005056be1f7a', '836bdaeb-2a2a-11e5-80c2-00155d3703e1'),
('569e2345-ff83-11e4-9228-005056be1f7a', '7ab9d88b-fe13-11e4-9228-005056be1f7a'),
('57784d4c-2558-11e5-80c1-00155d3703e2', '2a4606c5-2ad5-11e5-811e-00155d3703b3'),
('57784d4d-2558-11e5-80c1-00155d3703e2', '93394f7a-159d-11e5-811a-00155d3703b3'),
('5b5007ea-2b93-11e5-80c2-00155d3703e1', '97eb85d8-2a2a-11e5-80c2-00155d3703e1'),
('5c5f91f2-2556-11e5-80c1-00155d3703e2', '97eb85d9-2a2a-11e5-80c2-00155d3703e1'),
('5c7670be-260f-11e5-80c1-00155d3703e2', 'a593a937-ff83-11e4-9228-005056be1f7a'),
('5d319232-03a8-11e5-bad4-005056be1f7a', 'a99df9d6-2a2a-11e5-80c2-00155d3703e1'),
('5ea91f14-1b38-11e5-80c1-00155d3703e2', 'fd79a8f1-03a8-11e5-bad4-005056be1f7a'),
('5ea91f15-1b38-11e5-80c1-00155d3703e2', 'fd79a8f1-03a8-11e5-bad4-005056be1f7a'),
('5f6cdc82-2558-11e5-80c1-00155d3703e2', '93394f7a-159d-11e5-811a-00155d3703b3'),
('5f83b1b2-260b-11e5-80c1-00155d3703e2', '2a4606c5-2ad5-11e5-811e-00155d3703b3'),
('5f83b1b4-260b-11e5-80c1-00155d3703e2', '2a4606c5-2ad5-11e5-811e-00155d3703b3'),
('5fc884ec-1b36-11e5-80c1-00155d3703e2', 'e057d072-03a8-11e5-bad4-005056be1f7a'),
('5fc884ed-1b36-11e5-80c1-00155d3703e2', 'e057d072-03a8-11e5-bad4-005056be1f7a'),
('620af767-0436-11e5-bad4-005056be1f7a', 'f9bc6209-0399-11e5-bad4-005056be1f7a'),
('620af768-0436-11e5-bad4-005056be1f7a', 'f9bc6209-0399-11e5-bad4-005056be1f7a'),
('62349219-2557-11e5-80c1-00155d3703e2', '93394f7a-159d-11e5-811a-00155d3703b3'),
('6234921d-2557-11e5-80c1-00155d3703e2', '93394f7a-159d-11e5-811a-00155d3703b3'),
('63760902-ff83-11e4-9228-005056be1f7a', '8e3fd2e1-2a2a-11e5-80c2-00155d3703e1'),
('64d1037e-03ac-11e5-bad4-005056be1f7a', 'c371b375-2ada-11e5-811e-00155d3703b3'),
('6601337b-03a8-11e5-bad4-005056be1f7a', 'a99df9d6-2a2a-11e5-80c2-00155d3703e1'),
('665b9dfb-1b38-11e5-80c1-00155d3703e2', 'fd79a8f1-03a8-11e5-bad4-005056be1f7a'),
('673bd31a-03a2-11e5-bad4-005056be1f7a', 'b89e40ef-2aca-11e5-811e-00155d3703b3'),
('6775c1a8-26cf-11e5-80c1-00155d3703e2', '7eada471-0438-11e5-bad4-005056be1f7a'),
('68036402-1b36-11e5-80c1-00155d3703e2', 'e057d072-03a8-11e5-bad4-005056be1f7a'),
('681bc395-2ad8-11e5-811e-00155d3703b3', 'f732b015-03a8-11e5-bad4-005056be1f7a'),
('681bc396-2ad8-11e5-811e-00155d3703b3', 'f732b015-03a8-11e5-bad4-005056be1f7a'),
('688ebe42-09e6-11e5-8d10-005056be1f7a', 'fde74c14-2ad9-11e5-811e-00155d3703b3'),
('69f60b03-2557-11e5-80c1-00155d3703e2', '93394f7a-159d-11e5-811a-00155d3703b3'),
('6aa6af7c-ff83-11e4-9228-005056be1f7a', '8e3fd2e1-2a2a-11e5-80c2-00155d3703e1'),
('6aa6af80-ff83-11e4-9228-005056be1f7a', '7ab9d88b-fe13-11e4-9228-005056be1f7a'),
('6beba4d5-03ad-11e5-bad4-005056be1f7a', 'dc30b997-2ae2-11e5-811e-00155d3703b3'),
('6beba4d6-03ad-11e5-bad4-005056be1f7a', 'dc30b997-2ae2-11e5-811e-00155d3703b3'),
('6c7775ed-1b3a-11e5-80c1-00155d3703e2', 'a99df9d6-2a2a-11e5-80c2-00155d3703e1'),
('6e6c342e-1b36-11e5-80c1-00155d3703e2', 'e057d072-03a8-11e5-bad4-005056be1f7a'),
('6e6c3430-1b36-11e5-80c1-00155d3703e2', 'e057d072-03a8-11e5-bad4-005056be1f7a'),
('6e712fd0-2558-11e5-80c1-00155d3703e2', '93394f7a-159d-11e5-811a-00155d3703b3'),
('6ecba52d-fe13-11e4-9228-005056be1f7a', '7ab9d88b-fe13-11e4-9228-005056be1f7a'),
('6ed4079d-03ac-11e5-bad4-005056be1f7a', 'c371b375-2ada-11e5-811e-00155d3703b3'),
('6ee06265-2ad8-11e5-811e-00155d3703b3', 'f732b015-03a8-11e5-bad4-005056be1f7a'),
('6ee06266-2ad8-11e5-811e-00155d3703b3', 'f732b015-03a8-11e5-bad4-005056be1f7a'),
('6f39f780-260e-11e5-80c1-00155d3703e2', '073345bc-1b0b-11e5-80c1-00155d3703e2'),
('6f79f632-2b93-11e5-80c2-00155d3703e1', '97eb85d8-2a2a-11e5-80c2-00155d3703e1'),
('6f79f633-2b93-11e5-80c2-00155d3703e1', '97eb85d8-2a2a-11e5-80c2-00155d3703e1'),
('7065c1e0-1f27-11e5-80c1-00155d3703e2', 'b69b7c64-03a9-11e5-bad4-005056be1f7a'),
('7065c1e1-1f27-11e5-80c1-00155d3703e2', 'b69b7c64-03a9-11e5-bad4-005056be1f7a'),
('70a2b25f-03a9-11e5-bad4-005056be1f7a', '836bdaea-2a2a-11e5-80c2-00155d3703e1'),
('70b2ccea-043e-11e5-bad4-005056be1f7a', '46de7104-039a-11e5-bad4-005056be1f7a'),
('70b2ccee-043e-11e5-bad4-005056be1f7a', '46de7104-039a-11e5-bad4-005056be1f7a'),
('712f0074-2557-11e5-80c1-00155d3703e2', '2a4606c5-2ad5-11e5-811e-00155d3703b3'),
('71c2a514-03aa-11e5-bad4-005056be1f7a', 'd90dabf3-2adb-11e5-811e-00155d3703b3'),
('72429776-ff83-11e4-9228-005056be1f7a', '836bdaeb-2a2a-11e5-80c2-00155d3703e1'),
('72429777-ff83-11e4-9228-005056be1f7a', '7878dd2a-ff83-11e4-9228-005056be1f7a'),
('7252346a-1b39-11e5-80c1-00155d3703e2', '2d9e2abc-03a9-11e5-bad4-005056be1f7a'),
('72d240fe-2607-11e5-80c1-00155d3703e2', '93394f7a-159d-11e5-811a-00155d3703b3'),
('738043e3-1b38-11e5-80c1-00155d3703e2', 'fd79a8f1-03a8-11e5-bad4-005056be1f7a'),
('73fef9ac-262f-11e5-80c1-00155d3703e2', 'b89e40ef-2aca-11e5-811e-00155d3703b3'),
('7413dcd3-2633-11e5-80c1-00155d3703e2', 'b89e40ef-2aca-11e5-811e-00155d3703b3'),
('74e183f7-159d-11e5-811a-00155d3703b3', '8e3fd2e1-2a2a-11e5-80c2-00155d3703e1'),
('75420508-2ad8-11e5-811e-00155d3703b3', 'f732b015-03a8-11e5-bad4-005056be1f7a'),
('75dcab8a-0441-11e5-bad4-005056be1f7a', 'b44b2b91-2a2a-11e5-80c2-00155d3703e1'),
('76eb725d-043e-11e5-bad4-005056be1f7a', '46de7104-039a-11e5-bad4-005056be1f7a'),
('76f0c641-2b93-11e5-80c2-00155d3703e1', '97eb85d8-2a2a-11e5-80c2-00155d3703e1'),
('77d469b2-1b36-11e5-80c1-00155d3703e2', 'e057d072-03a8-11e5-bad4-005056be1f7a'),
('7878dd29-ff83-11e4-9228-005056be1f7a', '7ab9d88b-fe13-11e4-9228-005056be1f7a'),
('7878dd2a-ff83-11e4-9228-005056be1f7a', '836bdaeb-2a2a-11e5-80c2-00155d3703e1'),
('79206b59-03ad-11e5-bad4-005056be1f7a', 'dc30b997-2ae2-11e5-811e-00155d3703b3'),
('7ab9d88b-fe13-11e4-9228-005056be1f7a', '8e3fd2e1-2a2a-11e5-80c2-00155d3703e1'),
('7cb5f7e2-1f26-11e5-80c1-00155d3703e2', 'b69b7c64-03a9-11e5-bad4-005056be1f7a'),
('7ce3d8d3-2557-11e5-80c1-00155d3703e2', '93394f7a-159d-11e5-811a-00155d3703b3'),
('7ce3d8d4-2557-11e5-80c1-00155d3703e2', '93394f7a-159d-11e5-811a-00155d3703b3'),
('7d588ba2-043e-11e5-bad4-005056be1f7a', '46de7104-039a-11e5-bad4-005056be1f7a'),
('7eada471-0438-11e5-bad4-005056be1f7a', '836bdaeb-2a2a-11e5-80c2-00155d3703e1'),
('7eed2035-ff83-11e4-9228-005056be1f7a', '8e3fd2e1-2a2a-11e5-80c2-00155d3703e1'),
('80fac221-1b38-11e5-80c1-00155d3703e2', '0c822838-03a9-11e5-bad4-005056be1f7a'),
('819bcac7-03a8-11e5-bad4-005056be1f7a', '8893d813-2af9-11e5-811e-00155d3703b3'),
('81b6e14a-2622-11e5-80c1-00155d3703e2', '346c415c-2623-11e5-80c1-00155d3703e2'),
('828d3720-03ad-11e5-bad4-005056be1f7a', 'a99df9d6-2a2a-11e5-80c2-00155d3703e1'),
('82a97a56-2633-11e5-80c1-00155d3703e2', 'b89e40ef-2aca-11e5-811e-00155d3703b3'),
('834ac095-0441-11e5-bad4-005056be1f7a', 'b44b2b91-2a2a-11e5-80c2-00155d3703e1'),
('834ac098-0441-11e5-bad4-005056be1f7a', 'b44b2b91-2a2a-11e5-80c2-00155d3703e1'),
('840866de-043e-11e5-bad4-005056be1f7a', '46de7104-039a-11e5-bad4-005056be1f7a'),
('8711984a-1b38-11e5-80c1-00155d3703e2', '0c822838-03a9-11e5-bad4-005056be1f7a'),
('8719a7c6-2557-11e5-80c1-00155d3703e2', '93394f7a-159d-11e5-811a-00155d3703b3'),
('87349786-1b37-11e5-80c1-00155d3703e2', 'f732b015-03a8-11e5-bad4-005056be1f7a'),
('87349788-1b37-11e5-80c1-00155d3703e2', 'f732b015-03a8-11e5-bad4-005056be1f7a'),
('87792617-2606-11e5-80c1-00155d3703e2', '93394f7a-159d-11e5-811a-00155d3703b3'),
('8893d813-2af9-11e5-811e-00155d3703b3', '8e3fd2e1-2a2a-11e5-80c2-00155d3703e1'),
('8918a524-03a8-11e5-bad4-005056be1f7a', '8893d813-2af9-11e5-811e-00155d3703b3'),
('8a0a1499-09e6-11e5-8d10-005056be1f7a', 'fde74c14-2ad9-11e5-811e-00155d3703b3'),
('8a8bd771-03ac-11e5-bad4-005056be1f7a', '9fa70d6e-2a2a-11e5-80c2-00155d3703e1'),
('8aec992e-03ad-11e5-bad4-005056be1f7a', '836bdaeb-2a2a-11e5-80c2-00155d3703e1'),
('8b296d8e-0441-11e5-bad4-005056be1f7a', 'b44b2b91-2a2a-11e5-80c2-00155d3703e1'),
('8b323509-26cf-11e5-80c1-00155d3703e2', 'a593a937-ff83-11e4-9228-005056be1f7a'),
('8c0d32ed-043e-11e5-bad4-005056be1f7a', '46de7104-039a-11e5-bad4-005056be1f7a'),
('8c1d670d-039a-11e5-bad4-005056be1f7a', '836bdaeb-2a2a-11e5-80c2-00155d3703e1'),
('8d3dcdc7-2608-11e5-80c1-00155d3703e2', '93394f7a-159d-11e5-811a-00155d3703b3'),
('8d875d7f-2b93-11e5-80c2-00155d3703e1', '1f0658ee-2b93-11e5-80c2-00155d3703e1'),
('8e679815-1b39-11e5-80c1-00155d3703e2', '45dc243e-03a9-11e5-bad4-005056be1f7a'),
('8e679817-1b39-11e5-80c1-00155d3703e2', '45dc243e-03a9-11e5-bad4-005056be1f7a'),
('8faaccb5-1b40-11e5-80c1-00155d3703e2', 'a99df9d7-2a2a-11e5-80c2-00155d3703e1'),
('90873691-03a8-11e5-bad4-005056be1f7a', '8893d813-2af9-11e5-811e-00155d3703b3'),
('90873696-03a8-11e5-bad4-005056be1f7a', '8893d813-2af9-11e5-811e-00155d3703b3'),
('928d5f0a-043e-11e5-bad4-005056be1f7a', '46de7104-039a-11e5-bad4-005056be1f7a'),
('928d5f0c-043e-11e5-bad4-005056be1f7a', '46de7104-039a-11e5-bad4-005056be1f7a'),
('92a2d625-09e6-11e5-8d10-005056be1f7a', 'fde74c14-2ad9-11e5-811e-00155d3703b3'),
('93394f7a-159d-11e5-811a-00155d3703b3', '836bdaea-2a2a-11e5-80c2-00155d3703e1'),
('93d76140-1b38-11e5-80c1-00155d3703e2', '0c822838-03a9-11e5-bad4-005056be1f7a'),
('951c6015-1b39-11e5-80c1-00155d3703e2', '45dc243e-03a9-11e5-bad4-005056be1f7a'),
('99e3997e-1b38-11e5-80c1-00155d3703e2', '0c822838-03a9-11e5-bad4-005056be1f7a'),
('9a77f745-043e-11e5-bad4-005056be1f7a', '46de7104-039a-11e5-bad4-005056be1f7a'),
('9b7a9d25-260b-11e5-80c1-00155d3703e2', '2a4606c5-2ad5-11e5-811e-00155d3703b3'),
('9bfb8b34-0436-11e5-bad4-005056be1f7a', 'f9bc6209-0399-11e5-bad4-005056be1f7a'),
('9ca831e7-1b39-11e5-80c1-00155d3703e2', '45dc243e-03a9-11e5-bad4-005056be1f7a'),
('9cfa50d0-1f26-11e5-80c1-00155d3703e2', 'b69b7c64-03a9-11e5-bad4-005056be1f7a'),
('9ed09d1a-0441-11e5-bad4-005056be1f7a', 'b44b2b91-2a2a-11e5-80c2-00155d3703e1'),
('9fbfb3b3-09e6-11e5-8d10-005056be1f7a', 'fde74c14-2ad9-11e5-811e-00155d3703b3'),
('a11feb9a-1b38-11e5-80c1-00155d3703e2', '0c822838-03a9-11e5-bad4-005056be1f7a'),
('a2520ad6-1b3c-11e5-80c1-00155d3703e2', '97eb85d9-2a2a-11e5-80c2-00155d3703e1'),
('a288b5e3-043e-11e5-bad4-005056be1f7a', '46de7104-039a-11e5-bad4-005056be1f7a'),
('a2a76fa2-2ada-11e5-811e-00155d3703b3', '836bdaeb-2a2a-11e5-80c2-00155d3703e1'),
('a40d4938-043f-11e5-bad4-005056be1f7a', '8c1d670d-039a-11e5-bad4-005056be1f7a'),
('a5139a27-2557-11e5-80c1-00155d3703e2', '93394f7a-159d-11e5-811a-00155d3703b3'),
('a5154dc4-03a2-11e5-bad4-005056be1f7a', 'b89e40ef-2aca-11e5-811e-00155d3703b3'),
('a51ea711-0435-11e5-bad4-005056be1f7a', 'f9bc6209-0399-11e5-bad4-005056be1f7a'),
('a5282d12-043b-11e5-bad4-005056be1f7a', '07dad57c-039a-11e5-bad4-005056be1f7a'),
('a593a937-ff83-11e4-9228-005056be1f7a', '836bdaeb-2a2a-11e5-80c2-00155d3703e1'),
('a5bd50e7-26d2-11e5-80c1-00155d3703e2', '9fa70d6e-2a2a-11e5-80c2-00155d3703e1'),
('a6dcc0b2-2a02-11e5-80c2-00155d3703e1', '07dad57c-039a-11e5-bad4-005056be1f7a'),
('aa1d7996-043e-11e5-bad4-005056be1f7a', '46de7104-039a-11e5-bad4-005056be1f7a'),
('aa47beb7-0441-11e5-bad4-005056be1f7a', 'b44b2b91-2a2a-11e5-80c2-00155d3703e1'),
('aa47beb9-0441-11e5-bad4-005056be1f7a', 'b44b2b91-2a2a-11e5-80c2-00155d3703e1'),
('aa6c0c5b-043f-11e5-bad4-005056be1f7a', '8c1d670d-039a-11e5-bad4-005056be1f7a'),
('aba134d6-043b-11e5-bad4-005056be1f7a', '07dad57c-039a-11e5-bad4-005056be1f7a'),
('ac8ae411-0435-11e5-bad4-005056be1f7a', 'f9bc6209-0399-11e5-bad4-005056be1f7a'),
('ad4a2a75-1f28-11e5-80c1-00155d3703e2', 'b69b7c64-03a9-11e5-bad4-005056be1f7a'),
('ae73d56b-ff83-11e4-9228-005056be1f7a', '9fa70d6a-2a2a-11e5-80c2-00155d3703e1'),
('af2b26f1-03a8-11e5-bad4-005056be1f7a', '8893d813-2af9-11e5-811e-00155d3703b3'),
('af50e83a-255a-11e5-80c1-00155d3703e2', '93394f7a-159d-11e5-811a-00155d3703b3'),
('b02db436-2a06-11e5-80c2-00155d3703e1', '07dad57c-039a-11e5-bad4-005056be1f7a'),
('b067512c-1f27-11e5-80c1-00155d3703e2', 'f732b015-03a8-11e5-bad4-005056be1f7a'),
('b12591dd-043e-11e5-bad4-005056be1f7a', 'b44b2b91-2a2a-11e5-80c2-00155d3703e1'),
('b26b7f27-0441-11e5-bad4-005056be1f7a', '346c415c-2623-11e5-80c1-00155d3703e2'),
('b3391594-043f-11e5-bad4-005056be1f7a', '8c1d670d-039a-11e5-bad4-005056be1f7a'),
('b466686a-26d4-11e5-80c1-00155d3703e2', '405e422b-039a-11e5-bad4-005056be1f7a'),
('b54d6afa-1b37-11e5-80c1-00155d3703e2', 'f732b015-03a8-11e5-bad4-005056be1f7a'),
('b55a8ca1-ff83-11e4-9228-005056be1f7a', '9fa70d6a-2a2a-11e5-80c2-00155d3703e1'),
('b69b7c64-03a9-11e5-bad4-005056be1f7a', '836bdaea-2a2a-11e5-80c2-00155d3703e1'),
('b81e73bd-1b3f-11e5-80c1-00155d3703e2', 'a99df9d7-2a2a-11e5-80c2-00155d3703e1'),
('b8305848-2a06-11e5-80c2-00155d3703e1', 'b02db436-2a06-11e5-80c2-00155d3703e1'),
('b84baf22-03a8-11e5-bad4-005056be1f7a', '8893d813-2af9-11e5-811e-00155d3703b3'),
('b89e40ef-2aca-11e5-811e-00155d3703b3', 'c11daf88-2a2a-11e5-80c2-00155d3703e1'),
('ba6e74b6-043f-11e5-bad4-005056be1f7a', '8c1d670d-039a-11e5-bad4-005056be1f7a'),
('bb11f694-1b3c-11e5-80c1-00155d3703e2', '97eb85d9-2a2a-11e5-80c2-00155d3703e1'),
('bb8be81e-1b38-11e5-80c1-00155d3703e2', '166411d5-03a9-11e5-bad4-005056be1f7a'),
('bb8e728d-ff83-11e4-9228-005056be1f7a', '9fa70d6a-2a2a-11e5-80c2-00155d3703e1'),
('bb8e7290-ff83-11e4-9228-005056be1f7a', '9fa70d6a-2a2a-11e5-80c2-00155d3703e1'),
('bcd9f4aa-26d2-11e5-80c1-00155d3703e2', '9fa70d6e-2a2a-11e5-80c2-00155d3703e1'),
('bda75778-043a-11e5-bad4-005056be1f7a', '836bdaeb-2a2a-11e5-80c2-00155d3703e1'),
('be9d3a6a-2b8c-11e5-80c2-00155d3703e1', '7ab9d88b-fe13-11e4-9228-005056be1f7a'),
('c1a4bf83-1b38-11e5-80c1-00155d3703e2', '166411d5-03a9-11e5-bad4-005056be1f7a'),
('c1a4bf8a-1b38-11e5-80c1-00155d3703e2', '166411d5-03a9-11e5-bad4-005056be1f7a'),
('c1bd86aa-1b3f-11e5-80c1-00155d3703e2', 'a99df9d7-2a2a-11e5-80c2-00155d3703e1'),
('c1c97f96-ff83-11e4-9228-005056be1f7a', '9fa70d6a-2a2a-11e5-80c2-00155d3703e1'),
('c1c97f97-ff83-11e4-9228-005056be1f7a', '9fa70d6a-2a2a-11e5-80c2-00155d3703e1'),
('c1cebe3e-043f-11e5-bad4-005056be1f7a', '8c1d670d-039a-11e5-bad4-005056be1f7a'),
('c2a0e4e2-2a06-11e5-80c2-00155d3703e1', 'b02db436-2a06-11e5-80c2-00155d3703e1'),
('c343f723-03a3-11e5-bad4-005056be1f7a', '12bcb99c-0399-11e5-bad4-005056be1f7a'),
('c371b375-2ada-11e5-811e-00155d3703b3', '836bdaeb-2a2a-11e5-80c2-00155d3703e1'),
('c38d2490-26d2-11e5-80c1-00155d3703e2', '9fa70d6e-2a2a-11e5-80c2-00155d3703e1'),
('c4863772-043b-11e5-bad4-005056be1f7a', '07dad57c-039a-11e5-bad4-005056be1f7a'),
('c4863773-043b-11e5-bad4-005056be1f7a', 'f0402da3-043b-11e5-bad4-005056be1f7a'),
('c4ec89f6-1f28-11e5-80c1-00155d3703e2', '97eb85d9-2a2a-11e5-80c2-00155d3703e1'),
('c6cd3a9b-1f26-11e5-80c1-00155d3703e2', '836bdaea-2a2a-11e5-80c2-00155d3703e1'),
('c8a4a1ce-2a06-11e5-80c2-00155d3703e1', 'b02db436-2a06-11e5-80c2-00155d3703e1'),
('c8a90fb0-ff83-11e4-9228-005056be1f7a', '9fa70d6a-2a2a-11e5-80c2-00155d3703e1'),
('c8a90fb1-ff83-11e4-9228-005056be1f7a', '9fa70d6a-2a2a-11e5-80c2-00155d3703e1'),
('c9cc47b8-043a-11e5-bad4-005056be1f7a', 'a2a76fa2-2ada-11e5-811e-00155d3703b3'),
('cab56d19-255a-11e5-80c1-00155d3703e2', '93394f7a-159d-11e5-811a-00155d3703b3'),
('cb6a93d2-0441-11e5-bad4-005056be1f7a', '836bdaea-2a2a-11e5-80c2-00155d3703e1'),
('cc0ea6a6-03a3-11e5-bad4-005056be1f7a', '12bcb99c-0399-11e5-bad4-005056be1f7a'),
('ccd27b93-2a03-11e5-80c2-00155d3703e1', 'f0402da3-043b-11e5-bad4-005056be1f7a'),
('cd21ee7e-043f-11e5-bad4-005056be1f7a', '8c1d670d-039a-11e5-bad4-005056be1f7a'),
('cefbf45b-ff83-11e4-9228-005056be1f7a', '9fa70d6a-2a2a-11e5-80c2-00155d3703e1'),
('cefbf45c-ff83-11e4-9228-005056be1f7a', '9fa70d6a-2a2a-11e5-80c2-00155d3703e1'),
('cefbf45d-ff83-11e4-9228-005056be1f7a', '9fa70d6a-2a2a-11e5-80c2-00155d3703e1'),
('cf5624a6-1b38-11e5-80c1-00155d3703e2', '166411d5-03a9-11e5-bad4-005056be1f7a'),
('d1037afa-1f26-11e5-80c1-00155d3703e2', 'b69b7c64-03a9-11e5-bad4-005056be1f7a'),
('d24345ca-1b0a-11e5-80c1-00155d3703e2', 'fde74c14-2ad9-11e5-811e-00155d3703b3'),
('d3bb3ec7-03a3-11e5-bad4-005056be1f7a', '12bcb99c-0399-11e5-bad4-005056be1f7a'),
('d4847a1e-043a-11e5-bad4-005056be1f7a', 'bda75778-043a-11e5-bad4-005056be1f7a'),
('d4bd740f-2a03-11e5-80c2-00155d3703e1', 'f0402da3-043b-11e5-bad4-005056be1f7a'),
('d4f70b75-043f-11e5-bad4-005056be1f7a', '8c1d670d-039a-11e5-bad4-005056be1f7a'),
('d7b136a3-ff83-11e4-9228-005056be1f7a', '9fa70d6a-2a2a-11e5-80c2-00155d3703e1'),
('d7b136a5-ff83-11e4-9228-005056be1f7a', '9fa70d6a-2a2a-11e5-80c2-00155d3703e1'),
('d84001a8-0441-11e5-bad4-005056be1f7a', 'b44b2b91-2a2a-11e5-80c2-00155d3703e1'),
('d87f8a4f-043d-11e5-bad4-005056be1f7a', '405e422b-039a-11e5-bad4-005056be1f7a'),
('d90dabf3-2adb-11e5-811e-00155d3703b3', '836bdaeb-2a2a-11e5-80c2-00155d3703e1'),
('d929955e-03a8-11e5-bad4-005056be1f7a', '836bdaea-2a2a-11e5-80c2-00155d3703e1'),
('d9effaa6-1f26-11e5-80c1-00155d3703e2', 'b69b7c64-03a9-11e5-bad4-005056be1f7a'),
('d9effaa7-1f26-11e5-80c1-00155d3703e2', 'b69b7c64-03a9-11e5-bad4-005056be1f7a'),
('da724cb4-2608-11e5-80c1-00155d3703e2', '2a4606c5-2ad5-11e5-811e-00155d3703b3'),
('dc09f758-03a3-11e5-bad4-005056be1f7a', '12bcb99c-0399-11e5-bad4-005056be1f7a'),
('dc30b997-2ae2-11e5-811e-00155d3703b3', '836bdaeb-2a2a-11e5-80c2-00155d3703e1'),
('de447de1-ff83-11e4-9228-005056be1f7a', '9fa70d6a-2a2a-11e5-80c2-00155d3703e1'),
('de447de3-ff83-11e4-9228-005056be1f7a', '9fa70d6a-2a2a-11e5-80c2-00155d3703e1'),
('dfd3f068-043e-11e5-bad4-005056be1f7a', '537d0fc7-039a-11e5-bad4-005056be1f7a'),
('e057d072-03a8-11e5-bad4-005056be1f7a', '93394f7a-159d-11e5-811a-00155d3703b3'),
('e2784c06-1f26-11e5-80c1-00155d3703e2', 'b69b7c64-03a9-11e5-bad4-005056be1f7a'),
('e2784c07-1f26-11e5-80c1-00155d3703e2', 'b69b7c64-03a9-11e5-bad4-005056be1f7a'),
('e2cc6837-0432-11e5-bad4-005056be1f7a', 'f9bc6209-0399-11e5-bad4-005056be1f7a'),
('e2cc6838-0432-11e5-bad4-005056be1f7a', 'f9bc6209-0399-11e5-bad4-005056be1f7a'),
('e41fe8a3-043b-11e5-bad4-005056be1f7a', '07dad57c-039a-11e5-bad4-005056be1f7a'),
('e4ce3ba3-ff83-11e4-9228-005056be1f7a', '9fa70d6a-2a2a-11e5-80c2-00155d3703e1'),
('e4ce3ba5-ff83-11e4-9228-005056be1f7a', '9fa70d6a-2a2a-11e5-80c2-00155d3703e1'),
('e4ce3ba9-ff83-11e4-9228-005056be1f7a', '9fa70d6a-2a2a-11e5-80c2-00155d3703e1'),
('e504229b-2557-11e5-80c1-00155d3703e2', '2a4606c5-2ad5-11e5-811e-00155d3703b3'),
('e600a4e5-043e-11e5-bad4-005056be1f7a', '537d0fc7-039a-11e5-bad4-005056be1f7a'),
('e63f75ec-0441-11e5-bad4-005056be1f7a', 'b44b2b91-2a2a-11e5-80c2-00155d3703e1'),
('e6ea5159-043d-11e5-bad4-005056be1f7a', '405e422b-039a-11e5-bad4-005056be1f7a'),
('e70e507a-1f27-11e5-80c1-00155d3703e2', 'b69b7c64-03a9-11e5-bad4-005056be1f7a'),
('e84cc2d6-03aa-11e5-bad4-005056be1f7a', '7878dd2a-ff83-11e4-9228-005056be1f7a'),
('e8675698-1b35-11e5-80c1-00155d3703e2', 'd929955e-03a8-11e5-bad4-005056be1f7a'),
('e86fb2bc-03a8-11e5-bad4-005056be1f7a', '836bdaea-2a2a-11e5-80c2-00155d3703e1'),
('ea59248d-255a-11e5-80c1-00155d3703e2', '93394f7a-159d-11e5-811a-00155d3703b3'),
('ea805b1d-0432-11e5-bad4-005056be1f7a', 'f9bc6209-0399-11e5-bad4-005056be1f7a'),
('eb6760f6-1b0a-11e5-80c1-00155d3703e2', 'fde74c14-2ad9-11e5-811e-00155d3703b3'),
('eba07a51-0433-11e5-bad4-005056be1f7a', 'f9bc6209-0399-11e5-bad4-005056be1f7a'),
('ec0fbf89-260b-11e5-80c1-00155d3703e2', '2a4606c5-2ad5-11e5-811e-00155d3703b3'),
('ee05c6a4-03a9-11e5-bad4-005056be1f7a', '836bdaea-2a2a-11e5-80c2-00155d3703e1'),
('f0402da3-043b-11e5-bad4-005056be1f7a', 'c11daf88-2a2a-11e5-80c2-00155d3703e1'),
('f0402da7-043b-11e5-bad4-005056be1f7a', 'c11daf88-2a2a-11e5-80c2-00155d3703e1'),
('f05763f5-2a02-11e5-80c2-00155d3703e1', '07dad57c-039a-11e5-bad4-005056be1f7a'),
('f1a53cb0-0432-11e5-bad4-005056be1f7a', 'f9bc6209-0399-11e5-bad4-005056be1f7a'),
('f1a53cb2-0432-11e5-bad4-005056be1f7a', 'f9bc6209-0399-11e5-bad4-005056be1f7a'),
('f1b67c1b-1b3e-11e5-80c1-00155d3703e2', 'a99df9d7-2a2a-11e5-80c2-00155d3703e1'),
('f1b67c1e-1b3e-11e5-80c1-00155d3703e2', 'a99df9d7-2a2a-11e5-80c2-00155d3703e1'),
('f1cbe028-255a-11e5-80c1-00155d3703e2', '2a4606c5-2ad5-11e5-811e-00155d3703b3'),
('f3357d57-03ac-11e5-bad4-005056be1f7a', 'c371b375-2ada-11e5-811e-00155d3703b3'),
('f4323b63-043d-11e5-bad4-005056be1f7a', '405e422b-039a-11e5-bad4-005056be1f7a'),
('f441d46a-1b38-11e5-80c1-00155d3703e2', '2d9e2abc-03a9-11e5-bad4-005056be1f7a'),
('f4f8a3bf-1f29-11e5-80c1-00155d3703e2', 'a99df9d6-2a2a-11e5-80c2-00155d3703e1'),
('f732b015-03a8-11e5-bad4-005056be1f7a', '836bdaea-2a2a-11e5-80c2-00155d3703e1'),
('f74b121a-1f27-11e5-80c1-00155d3703e2', '836bdaea-2a2a-11e5-80c2-00155d3703e1'),
('f7818a2c-043b-11e5-bad4-005056be1f7a', 'f0402da3-043b-11e5-bad4-005056be1f7a'),
('f82099f5-1b3e-11e5-80c1-00155d3703e2', 'a99df9d7-2a2a-11e5-80c2-00155d3703e1'),
('f9bc6209-0399-11e5-bad4-005056be1f7a', '8e3fd2e1-2a2a-11e5-80c2-00155d3703e1'),
('fa4db2b8-2a02-11e5-80c2-00155d3703e1', '07dad57c-039a-11e5-bad4-005056be1f7a'),
('fa733516-ff83-11e4-9228-005056be1f7a', 'a593a937-ff83-11e4-9228-005056be1f7a'),
('fa733518-ff83-11e4-9228-005056be1f7a', 'a593a937-ff83-11e4-9228-005056be1f7a'),
('fa860d03-1b38-11e5-80c1-00155d3703e2', '2d9e2abc-03a9-11e5-bad4-005056be1f7a'),
('fae21c3b-043d-11e5-bad4-005056be1f7a', '405e422b-039a-11e5-bad4-005056be1f7a'),
('fb5af916-26d0-11e5-80c1-00155d3703e2', 'a2a76fa2-2ada-11e5-811e-00155d3703b3'),
('fd79a8f1-03a8-11e5-bad4-005056be1f7a', '836bdaea-2a2a-11e5-80c2-00155d3703e1'),
('fde74c14-2ad9-11e5-811e-00155d3703b3', '836bdaeb-2a2a-11e5-80c2-00155d3703e1'),
('fe5439c3-03ac-11e5-bad4-005056be1f7a', '836bdaeb-2a2a-11e5-80c2-00155d3703e1'),
('fe5439c6-03ac-11e5-bad4-005056be1f7a', 'bda75778-043a-11e5-bad4-005056be1f7a'),
('feb257e0-043b-11e5-bad4-005056be1f7a', '07dad57c-039a-11e5-bad4-005056be1f7a'),
('feb257e2-043b-11e5-bad4-005056be1f7a', 'c11daf88-2a2a-11e5-80c2-00155d3703e1'),
('ff0e1054-043e-11e5-bad4-005056be1f7a', '537d0fc7-039a-11e5-bad4-005056be1f7a'),
('ff3c4a46-1b3e-11e5-80c1-00155d3703e2', 'a99df9d7-2a2a-11e5-80c2-00155d3703e1'),
('ff5ed528-26cf-11e5-80c1-00155d3703e2', 'bb11f694-1b3c-11e5-80c1-00155d3703e2'),
('ffb217d3-09e6-11e5-8d10-005056be1f7a', 'fde74c14-2ad9-11e5-811e-00155d3703b3');

-- --------------------------------------------------------

--
-- Структура таблицы `ShopImportLogs`
--

CREATE TABLE IF NOT EXISTS `ShopImportLogs` (
  `importDate` datetime NOT NULL,
  `exportDate` datetime NOT NULL,
  `fullExport` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `user` varchar(25) NOT NULL,
  `exportUser` varchar(200) DEFAULT NULL,
  `success` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `errors` int(10) unsigned NOT NULL DEFAULT '0',
  `warnings` int(10) unsigned NOT NULL DEFAULT '0',
  `xmlFile` varchar(200) DEFAULT NULL,
  `sqlFile` varchar(200) DEFAULT NULL,
  `logFileText` varchar(200) DEFAULT NULL,
  `logFileHtml` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ShopImportLogs`
--

INSERT INTO `ShopImportLogs` (`importDate`, `exportDate`, `fullExport`, `user`, `exportUser`, `success`, `errors`, `warnings`, `xmlFile`, `sqlFile`, `logFileText`, `logFileHtml`) VALUES
('2015-07-16 10:06:29', '2015-07-16 12:24:16', 1, 'raymefise', 'Гриненко Михаил (дизайнер)', 1, 0, 49, 'apelsin1c_2015.07.16_12.24.16.xml', 'apelsin1c_2015.07.16_10.06.29.sql', 'apelsin1c_2015.07.16_10.06.29.log', 'apelsin1c_2015.07.16_10.06.29.html');

-- --------------------------------------------------------

--
-- Структура таблицы `ShopItems`
--

CREATE TABLE IF NOT EXISTS `ShopItems` (
  `id` varchar(200) NOT NULL,
  `itemName` varchar(100) NOT NULL,
  `group` varchar(200) NOT NULL,
  `action` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `amount` float unsigned NOT NULL,
  `minAmount` float unsigned NOT NULL,
  `description` longtext,
  `shown` tinyint(1) unsigned NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ShopItems`
--

INSERT INTO `ShopItems` (`id`, `itemName`, `group`, `action`, `amount`, `minAmount`, `description`, `shown`) VALUES
('000b4673-f788-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 0,8кг Голубой', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 121, 61, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('030b5cff-f78e-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 1,9кг Бирюзовый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 90, 48, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('047805a5-fe8c-11e3-bbdb-005056be1f7b', 'Краска ВД акриловая д/стен и потолков (PROFESSIONAL) База С DALI 2,5л (Рогнеда)', 'be9d3a6a-2b8c-11e5-80c2-00155d3703e1', 0, 14, 9, 'КРАСКА ДАЛИ ДЛЯ СТЕН И ПОТОЛКОВ предназначена для декоративного и экологичного окрашивания стен и потолков внутри помещений с повышенной эксплуатационной нагрузкой. Применяется для окраски кирпичных, бетонных, оштукатуренных и других минеральных поверхностей.', 1),
('04834f06-93b0-11e3-82a4-005056be1f7b', 'Грунт-эмаль по ржавчине красный 2л  DALI', '569e2345-ff83-11e4-9228-005056be1f7a', 0, 60, 27, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('05caaed0-f790-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 20кг Охра', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 8, 0, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('05caaed2-f790-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 20кг серый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 6, 1, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('06e98e75-f78f-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 6кг Шоколадный', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 19, 12, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('07027c6c-7f47-11e3-af7c-005056be1f7b', 'Краска латексная PARADE R7 база А шелк-мат. 5л Россия', 'be9d3a6a-2b8c-11e5-80c2-00155d3703e1', 0, 35, 35, 'Шелковисто-матовая краска для стен и потолков любых типов помещений, в т.ч. с высокой эксплуатационной нагрузкой, требующих частой влажной уборки, а также фасадных элементов.\n', 1),
('076d2137-4380-11de-8f53-000e0c431b58', 'Грунт-эмаль по ржавчине черная 0,75л  DALI', '569e2345-ff83-11e4-9228-005056be1f7a', 0, 262, 80, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('076d2139-4380-11de-8f53-000e0c431b58', 'Грунт-эмаль по ржавчине черная 2л  DALI', '569e2345-ff83-11e4-9228-005056be1f7a', 0, 246, 65, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('076d213b-4380-11de-8f53-000e0c431b58', 'Грунт-эмаль по ржавчине белая 0,75л  DALI', '569e2345-ff83-11e4-9228-005056be1f7a', 0, 187, 55, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('076d213d-4380-11de-8f53-000e0c431b58', 'Грунт-эмаль по ржавчине белая 2л  DALI', '569e2345-ff83-11e4-9228-005056be1f7a', 0, 190, 46, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('076d213f-4380-11de-8f53-000e0c431b58', 'Грунт-эмаль по ржавчине коричневая 0,75л  DALI', '569e2345-ff83-11e4-9228-005056be1f7a', 0, 125, 50, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('076d2141-4380-11de-8f53-000e0c431b58', 'Грунт-эмаль по ржавчине коричневая 2л  DALI', '569e2345-ff83-11e4-9228-005056be1f7a', 0, 261, 50, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('076d2143-4380-11de-8f53-000e0c431b58', 'Грунт-эмаль по ржавчине красно-коричневая 0,75л  DALI', '569e2345-ff83-11e4-9228-005056be1f7a', 0, 149, 50, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('076d2145-4380-11de-8f53-000e0c431b58', 'Грунт-эмаль по ржавчине красно-коричневая 2л  DALI', '569e2345-ff83-11e4-9228-005056be1f7a', 0, 245, 45, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('076d2147-4380-11de-8f53-000e0c431b58', 'Грунт-эмаль по ржавчине серая 0,75л  DALI', '569e2345-ff83-11e4-9228-005056be1f7a', 0, 246, 60, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('076d2149-4380-11de-8f53-000e0c431b58', 'Грунт-эмаль по ржавчине серая 2л  DALI', '569e2345-ff83-11e4-9228-005056be1f7a', 0, 464, 54, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('076d214b-4380-11de-8f53-000e0c431b58', 'Грунт-эмаль по ржавчине зеленая 0,75л  DALI', '569e2345-ff83-11e4-9228-005056be1f7a', 0, 119, 49, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('076d214d-4380-11de-8f53-000e0c431b58', 'Грунт-эмаль по ржавчине зеленая 2л  DALI', '569e2345-ff83-11e4-9228-005056be1f7a', 0, 107, 51, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('079b44f8-f788-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 0,8кг Шоколадный', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 105, 59, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('0916172c-947c-11e3-8d88-005056be1f7b', 'Штукатурка структурная декоративная с эффектом "зернистости" размер "зерна" 2мм Белый 15кг', '6aa6af7c-ff83-11e4-9228-005056be1f7a', 0, 32, 18, 'Для декоративной отделки поверхностей внутри и снаружи помещений. Готовая к применению декоративная штукатурка повышенной белизны на основе водной акриловой дисперсии с равномерно зернистой структурой. Скрывает небольшие неровности основания. Легко наносится. Образуемый рельеф получается плавным и приятным на ощупь. Создает прочное влагостойкое, паропроницаемое покрытие, стойкое к атмосферным воздействиям и эксплуатационным нагрузкам. Обладает отличной адгезией к поверхностям из бетона, камня, гипса, цемента, кирпича, ДСП, ДВП. Не содержит растворителей, без запаха. Размер зерна ~ 1,5 мм. Допускает мытье окрашенной поверхности.', 1),
('09f4768d-f78e-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 1,9кг Зеленый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 141, 48, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('0d8fcbcd-99a8-11db-937f-000e0c431b59', 'Грунт акриловый "PARADE" G30  4л', '569e2345-ff83-11e4-9228-005056be1f7a', 0, 164, 29, 'Грунтовка акриловая глубокого проникновения. Высококачественная готовая к употреблению грунтовка с высокой проникающей способностью и отличными связующими свойствами.', 1),
('0d8fcbcf-99a8-11db-937f-000e0c431b59', 'Грунт акриловый "PARADE" G30 10л', '569e2345-ff83-11e4-9228-005056be1f7a', 0, 99, 25, 'Грунтовка акриловая глубокого проникновения. Высококачественная готовая к употреблению грунтовка с высокой проникающей способностью и отличными связующими свойствами.', 1),
('0d8fcbd1-99a8-11db-937f-000e0c431b59', 'Грунт под штукатурки "PARADE" Putzgrund G100 Белый 2,5л', '569e2345-ff83-11e4-9228-005056be1f7a', 0, 405, 46, 'Parade G100 Putzgrund — грунтовка для внутренних работ. Это основа любых отделочных работ. Грунтовки Парад для паркета предотвращают появления масел и воска, заполняют неровности и идеально подготавливают поверхность для нанесения лака. Они производятся на минеральной, акриловой, алкидной и других основах. Также улучшают структурные свойства гладких оснований. В зависимости от вида грунтовки перед применением разбавляются растворителем либо водой.', 1),
('0d8fcc0e-99a8-11db-937f-000e0c431b59', 'Краска акрил. "PARADE" W1 Бел. мат.  2,5л', 'be9d3a6a-2b8c-11e5-80c2-00155d3703e1', 0, 135, 57, 'Краска Parade W1 применяется для покраски потолков внутри помещений с небольшой эксплуатационной нагрузкой. Основания для покраски: оштукатуренные, цементные, кирпичные, бетонные, гипсовые и гипсокартонные, деревянные.', 1),
('0d8fcc10-99a8-11db-937f-000e0c431b59', 'Краска акрил. "PARADE" W1 Бел.мат. 10л', 'be9d3a6a-2b8c-11e5-80c2-00155d3703e1', 0, 110, 56, 'Краска Parade W1 применяется для покраски потолков внутри помещений с небольшой эксплуатационной нагрузкой. Основания для покраски: оштукатуренные, цементные, кирпичные, бетонные, гипсовые и гипсокартонные, деревянные.', 1),
('0d8fcc12-99a8-11db-937f-000e0c431b59', 'Краска акрил. "PARADE" W1 Бел. мат. 5л', 'be9d3a6a-2b8c-11e5-80c2-00155d3703e1', 0, 40, 47, 'Краска Parade W1 применяется для покраски потолков внутри помещений с небольшой эксплуатационной нагрузкой. Основания для покраски: оштукатуренные, цементные, кирпичные, бетонные, гипсовые и гипсокартонные, деревянные.', 1),
('0d8fcc1c-99a8-11db-937f-000e0c431b59', 'Краска акрил. "PARADE" W2 влагопрочная Бел. мат.  2,5л', 'be9d3a6a-2b8c-11e5-80c2-00155d3703e1', 0, 143, 67, 'Parade W2 — краска акриловая для стен и потолков. Допускается легкая влажная уборка, краска выдерживает 200 циклов мытья. Parade W2 применяется для внутренних работ (стены и потолки помещений, подвергающиеся нормальным эксплуатационным нагрузкам (жилые помещения) ).', 1),
('0d8fcc1e-99a8-11db-937f-000e0c431b59', 'Краска акрил. "PARADE" W2 влагопрочная Бел.мат. 10л', 'be9d3a6a-2b8c-11e5-80c2-00155d3703e1', 0, 256, 61, 'Parade W2 — краска акриловая для стен и потолков. Допускается легкая влажная уборка, краска выдерживает 200 циклов мытья. Parade W2 применяется для внутренних работ (стены и потолки помещений, подвергающиеся нормальным эксплуатационным нагрузкам (жилые помещения) ).', 1),
('0d8fcc20-99a8-11db-937f-000e0c431b59', 'Краска акрил. "PARADE" W2 влагопрочная Бел. мат.5л', 'be9d3a6a-2b8c-11e5-80c2-00155d3703e1', 0, 187, 49, 'Parade W2 — краска акриловая для стен и потолков. Допускается легкая влажная уборка, краска выдерживает 200 циклов мытья. Parade W2 применяется для внутренних работ (стены и потолки помещений, подвергающиеся нормальным эксплуатационным нагрузкам (жилые помещения) ).', 1),
('0d8fcc22-99a8-11db-937f-000e0c431b59', 'Краска акрил. "PARADE" W3 влагостойкая Бел. мат.  2,5л', 'be9d3a6a-2b8c-11e5-80c2-00155d3703e1', 0, 358, 68, 'Parade W3 — краска акриловая для внутренних работ. Допускается влажная уборка, выдерживает 1500 циклов мытья. Parade W3 применяется на стены и потолки помещений, подвергающиеся сильным эксплуатационным нагрузкам (коридоры, прихожие и т.п.), подходит для окраски обоев.', 1),
('0d8fcc24-99a8-11db-937f-000e0c431b59', 'Краска акрил. "PARADE" W3 влагостойкая Бел.мат. 10л', 'be9d3a6a-2b8c-11e5-80c2-00155d3703e1', 0, 707, 76, 'Parade W3 — краска акриловая для внутренних работ. Допускается влажная уборка, выдерживает 1500 циклов мытья. Parade W3 применяется на стены и потолки помещений, подвергающиеся сильным эксплуатационным нагрузкам (коридоры, прихожие и т.п.), подходит для окраски обоев.', 1),
('0d8fcc26-99a8-11db-937f-000e0c431b59', 'Краска акрил. "PARADE" W3 влагостойкая Бел. мат.5л', 'be9d3a6a-2b8c-11e5-80c2-00155d3703e1', 0, 250, 47, 'Parade W3 — краска акриловая для внутренних работ. Допускается влажная уборка, выдерживает 1500 циклов мытья. Parade W3 применяется на стены и потолки помещений, подвергающиеся сильным эксплуатационным нагрузкам (коридоры, прихожие и т.п.), подходит для окраски обоев.', 1),
('0ff22851-f78f-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 6кг Розово-бежевый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 6, 9, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('1004a95c-f787-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 0,8кг Белый матовый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 157, 71, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('10594008-ef13-11e4-8633-005056be1f7b', 'Двухсторонний скотч  50мм*25м (полипропилен)', '79206b59-03ad-11e5-bad4-005056be1f7a', 0, 114, 40, '', 1),
('11d9ec94-f788-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 0,8кг Розово-бежевый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 131, 61, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('129c7f4d-5273-11de-8f53-000e0c431b58', 'Краска ВД акриловая д/стен и потолков (PROFESSIONAL) DALI 9л (Рогнеда)', 'be9d3a6a-2b8c-11e5-80c2-00155d3703e1', 0, 257, 46, 'КРАСКА ДАЛИ ДЛЯ СТЕН И ПОТОЛКОВ предназначена для декоративного и экологичного окрашивания стен и потолков внутри помещений с повышенной эксплуатационной нагрузкой. Применяется для окраски кирпичных, бетонных, оштукатуренных и других минеральных поверхностей.', 1),
('138c38bb-f78e-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 1,9кг Светло-зеленый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 26, 46, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('13cd2b20-99a8-11db-937f-000e0c431b59', 'Краска интерьерная "PARADE" W5 база А Бел. мат. 2,7л', 'be9d3a6a-2b8c-11e5-80c2-00155d3703e1', 0, 54, 27, 'Parade W5 интерьерная краска на акриловой основе, матовая для внутренних работ образует прочное матовое декоративное покрытие, выдерживающее частую влажную уборку с применением моющих средств. Рекомендуется для любых типов помещений при окраске стен и потолков, а также обоев под покраску.', 1),
('13cd2b24-99a8-11db-937f-000e0c431b59', 'Краска интерьерная "PARADE" W6 база А Бел. мат. 2,7л', 'be9d3a6a-2b8c-11e5-80c2-00155d3703e1', 0, 48, 27, 'Parade W6 (база А) акриловая краска для внутренних и наружных работ образует суперстойкое матовое декоративное покрытие, выдерживающее частую влажную уборку с применением моющих средств, а также атмосферные воздействия.', 1),
('13cd2b26-99a8-11db-937f-000e0c431b59', 'Краска интерьерная "PARADE" W6 база А Бел. мат. 9л', 'be9d3a6a-2b8c-11e5-80c2-00155d3703e1', 0, 71, 20, 'Parade W6 (база А) акриловая краска для внутренних и наружных работ образует суперстойкое матовое декоративное покрытие, выдерживающее частую влажную уборку с применением моющих средств, а также атмосферные воздействия.', 1),
('13cd2b5d-99a8-11db-937f-000e0c431b59', 'Шпатлевка акрил. "PARADE" S40 выравнивающая 1,5кг', '7eed2035-ff83-11e4-9228-005056be1f7a', 0, 384, 58, 'Рекомендуется для финишной отделки поверхностей под покраску и оклеивания обоев. Используется для шпатлевания деревянных, бетонных, кирпичных поверхностей. Образует белое ровное покрытие, устраняет мелкие дефекты основания.', 1),
('13cd2b61-99a8-11db-937f-000e0c431b59', 'Шпатлевка акрил. "PARADE" S41 финишная Супербелая 1,5кг', '7eed2035-ff83-11e4-9228-005056be1f7a', 0, 246, 56, 'Рекомендуется использовать для шпатлевания деревянных, бетонных, кирпичных поверхностей. Образует супербелое ровное покрытие. Великолепно подходит для финишной отделки поверхностей под покраску и оклеивания обоев.', 1),
('13cd2b63-99a8-11db-937f-000e0c431b59', 'Шпатлевка по дереву "PARADE" S50 Белый 0,4кг', '7eed2035-ff83-11e4-9228-005056be1f7a', 0, 433, 50, 'Рекомендуется для коррекции дефектов изделий из дерева. Обладает хорошим сцеплением, легко наноситься и прекрасно шлифуется. Подходит для стен и полов, для окон и паркета. Имитирует цвет древесины, образует гладкое, ровное покрытие.', 1),
('13cd2b65-99a8-11db-937f-000e0c431b59', 'Шпатлевка по дереву "PARADE" S50 Береза 0,4кг', '7eed2035-ff83-11e4-9228-005056be1f7a', 0, 94, 43, 'Рекомендуется для коррекции дефектов изделий из дерева. Обладает хорошим сцеплением, легко наноситься и прекрасно шлифуется. Подходит для стен и полов, для окон и паркета. Имитирует цвет древесины, образует гладкое, ровное покрытие.', 1),
('13cd2b67-99a8-11db-937f-000e0c431b59', 'Шпатлевка по дереву "PARADE" S50 Бук 0,4кг', '7eed2035-ff83-11e4-9228-005056be1f7a', 0, 118, 43, 'Рекомендуется для коррекции дефектов изделий из дерева. Обладает хорошим сцеплением, легко наноситься и прекрасно шлифуется. Подходит для стен и полов, для окон и паркета. Имитирует цвет древесины, образует гладкое, ровное покрытие.', 1),
('13cd2b69-99a8-11db-937f-000e0c431b59', 'Шпатлевка по дереву "PARADE" S50 Дуб 0,4кг', '7eed2035-ff83-11e4-9228-005056be1f7a', 0, 222, 44, 'Рекомендуется для коррекции дефектов изделий из дерева. Обладает хорошим сцеплением, легко наноситься и прекрасно шлифуется. Подходит для стен и полов, для окон и паркета. Имитирует цвет древесины, образует гладкое, ровное покрытие.', 1),
('13cd2b6b-99a8-11db-937f-000e0c431b59', 'Шпатлевка по дереву "PARADE" S50 Махагон 0,4кг', '7eed2035-ff83-11e4-9228-005056be1f7a', 0, 191, 47, 'Рекомендуется для коррекции дефектов изделий из дерева. Обладает хорошим сцеплением, легко наноситься и прекрасно шлифуется. Подходит для стен и полов, для окон и паркета. Имитирует цвет древесины, образует гладкое, ровное покрытие.', 1),
('13cd2b6d-99a8-11db-937f-000e0c431b59', 'Шпатлевка по дереву "PARADE" S50 Орех 0,4кг', '7eed2035-ff83-11e4-9228-005056be1f7a', 0, 195, 44, 'Рекомендуется для коррекции дефектов изделий из дерева. Обладает хорошим сцеплением, легко наноситься и прекрасно шлифуется. Подходит для стен и полов, для окон и паркета. Имитирует цвет древесины, образует гладкое, ровное покрытие.', 1),
('13cd2b6f-99a8-11db-937f-000e0c431b59', 'Шпатлевка по дереву "PARADE" S50 Сосна 0,4кг', '7eed2035-ff83-11e4-9228-005056be1f7a', 0, 410, 47, 'Рекомендуется для коррекции дефектов изделий из дерева. Обладает хорошим сцеплением, легко наноситься и прекрасно шлифуется. Подходит для стен и полов, для окон и паркета. Имитирует цвет древесины, образует гладкое, ровное покрытие.', 1),
('13ce3df2-93b0-11e3-82a4-005056be1f7b', 'Грунт-эмаль по ржавчине синий 2л  DALI', '569e2345-ff83-11e4-9228-005056be1f7a', 0, 56, 30, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('159d7e07-f790-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 20кг светло-серый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 9, 0, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('17a83679-f78f-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 6кг охра', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 0, 9, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('1a0a8b4f-99a8-11db-937f-000e0c431b59', 'Шпаклевка по дереву Белая 0,6кг ("Лакра")', '7eed2035-ff83-11e4-9228-005056be1f7a', 0, 83, 55, 'Шпатлевка по дереву ЛАКРА дереву на основе акриловой дисперсии с повышенной водостойкостью. Благодаря мелкозернистой структуре легко наносится и прекрасно шлифуется. Обладает отличной заполняющей способностью.\nОбработанная шпатлевкой поверхность является идеально подходит для дальнейшей окраски при выполнении работ с высоким уровнем качества. Применяется для заполнения и выравнивания трещин, дефектов (сколы и т.п.), повреждений и неровностей на деревянных поверхностях (мебель, двери, пол, панельные стены, потолок).', 1),
('1a0a8b51-99a8-11db-937f-000e0c431b59', 'Шпаклевка по дереву Белая 1,5кг ("Лакра")', '7eed2035-ff83-11e4-9228-005056be1f7a', 0, 140, 46, 'Шпатлевка по дереву ЛАКРА дереву на основе акриловой дисперсии с повышенной водостойкостью. Благодаря мелкозернистой структуре легко наносится и прекрасно шлифуется. Обладает отличной заполняющей способностью.\nОбработанная шпатлевкой поверхность является идеально подходит для дальнейшей окраски при выполнении работ с высоким уровнем качества. Применяется для заполнения и выравнивания трещин, дефектов (сколы и т.п.), повреждений и неровностей на деревянных поверхностях (мебель, двери, пол, панельные стены, потолок).', 1),
('1a0a8b53-99a8-11db-937f-000e0c431b59', 'Шпаклевка по дереву Береза 0,6кг ("Лакра")', '7eed2035-ff83-11e4-9228-005056be1f7a', 0, 58, 50, 'Шпатлевка по дереву ЛАКРА дереву на основе акриловой дисперсии с повышенной водостойкостью. Благодаря мелкозернистой структуре легко наносится и прекрасно шлифуется. Обладает отличной заполняющей способностью.\nОбработанная шпатлевкой поверхность является идеально подходит для дальнейшей окраски при выполнении работ с высоким уровнем качества. Применяется для заполнения и выравнивания трещин, дефектов (сколы и т.п.), повреждений и неровностей на деревянных поверхностях (мебель, двери, пол, панельные стены, потолок).', 1),
('1a0a8b55-99a8-11db-937f-000e0c431b59', 'Шпаклевка по дереву Береза 1,5кг ("Лакра")', '7eed2035-ff83-11e4-9228-005056be1f7a', 0, 45, 40, 'Шпатлевка по дереву ЛАКРА дереву на основе акриловой дисперсии с повышенной водостойкостью. Благодаря мелкозернистой структуре легко наносится и прекрасно шлифуется. Обладает отличной заполняющей способностью.\nОбработанная шпатлевкой поверхность является идеально подходит для дальнейшей окраски при выполнении работ с высоким уровнем качества. Применяется для заполнения и выравнивания трещин, дефектов (сколы и т.п.), повреждений и неровностей на деревянных поверхностях (мебель, двери, пол, панельные стены, потолок).', 1),
('1a0a8b57-99a8-11db-937f-000e0c431b59', 'Шпаклевка по дереву Бук 0,6кг ("Лакра")', '7eed2035-ff83-11e4-9228-005056be1f7a', 0, 55, 50, 'Шпатлевка по дереву ЛАКРА дереву на основе акриловой дисперсии с повышенной водостойкостью. Благодаря мелкозернистой структуре легко наносится и прекрасно шлифуется. Обладает отличной заполняющей способностью.\nОбработанная шпатлевкой поверхность является идеально подходит для дальнейшей окраски при выполнении работ с высоким уровнем качества. Применяется для заполнения и выравнивания трещин, дефектов (сколы и т.п.), повреждений и неровностей на деревянных поверхностях (мебель, двери, пол, панельные стены, потолок).', 1),
('1a0a8b59-99a8-11db-937f-000e0c431b59', 'Шпаклевка по дереву Бук 1,5кг ("Лакра")', '7eed2035-ff83-11e4-9228-005056be1f7a', 0, 66, 40, 'Шпатлевка по дереву ЛАКРА дереву на основе акриловой дисперсии с повышенной водостойкостью. Благодаря мелкозернистой структуре легко наносится и прекрасно шлифуется. Обладает отличной заполняющей способностью.\nОбработанная шпатлевкой поверхность является идеально подходит для дальнейшей окраски при выполнении работ с высоким уровнем качества. Применяется для заполнения и выравнивания трещин, дефектов (сколы и т.п.), повреждений и неровностей на деревянных поверхностях (мебель, двери, пол, панельные стены, потолок).', 1),
('1a0a8b5b-99a8-11db-937f-000e0c431b59', 'Шпаклевка по дереву Дуб 0,6кг ("Лакра")', '7eed2035-ff83-11e4-9228-005056be1f7a', 0, 72, 51, 'Шпатлевка по дереву ЛАКРА дереву на основе акриловой дисперсии с повышенной водостойкостью. Благодаря мелкозернистой структуре легко наносится и прекрасно шлифуется. Обладает отличной заполняющей способностью.\nОбработанная шпатлевкой поверхность является идеально подходит для дальнейшей окраски при выполнении работ с высоким уровнем качества. Применяется для заполнения и выравнивания трещин, дефектов (сколы и т.п.), повреждений и неровностей на деревянных поверхностях (мебель, двери, пол, панельные стены, потолок).', 1),
('1a0a8b5d-99a8-11db-937f-000e0c431b59', 'Шпаклевка по дереву Дуб 1,5кг ("Лакра")', '7eed2035-ff83-11e4-9228-005056be1f7a', 0, 69, 40, 'Шпатлевка по дереву ЛАКРА дереву на основе акриловой дисперсии с повышенной водостойкостью. Благодаря мелкозернистой структуре легко наносится и прекрасно шлифуется. Обладает отличной заполняющей способностью.\nОбработанная шпатлевкой поверхность является идеально подходит для дальнейшей окраски при выполнении работ с высоким уровнем качества. Применяется для заполнения и выравнивания трещин, дефектов (сколы и т.п.), повреждений и неровностей на деревянных поверхностях (мебель, двери, пол, панельные стены, потолок).', 1),
('1a0a8b5f-99a8-11db-937f-000e0c431b59', 'Шпаклевка по дереву Махагон 0,6кг ("Лакра")', '7eed2035-ff83-11e4-9228-005056be1f7a', 0, 63, 46, 'Шпатлевка по дереву ЛАКРА дереву на основе акриловой дисперсии с повышенной водостойкостью. Благодаря мелкозернистой структуре легко наносится и прекрасно шлифуется. Обладает отличной заполняющей способностью.\nОбработанная шпатлевкой поверхность является идеально подходит для дальнейшей окраски при выполнении работ с высоким уровнем качества. Применяется для заполнения и выравнивания трещин, дефектов (сколы и т.п.), повреждений и неровностей на деревянных поверхностях (мебель, двери, пол, панельные стены, потолок).', 1),
('1a0a8b61-99a8-11db-937f-000e0c431b59', 'Шпаклевка по дереву Махагон 1,5кг ("Лакра")', '7eed2035-ff83-11e4-9228-005056be1f7a', 0, 38, 35, 'Шпатлевка по дереву ЛАКРА дереву на основе акриловой дисперсии с повышенной водостойкостью. Благодаря мелкозернистой структуре легко наносится и прекрасно шлифуется. Обладает отличной заполняющей способностью.\nОбработанная шпатлевкой поверхность является идеально подходит для дальнейшей окраски при выполнении работ с высоким уровнем качества. Применяется для заполнения и выравнивания трещин, дефектов (сколы и т.п.), повреждений и неровностей на деревянных поверхностях (мебель, двери, пол, панельные стены, потолок).', 1),
('1a0a8b63-99a8-11db-937f-000e0c431b59', 'Шпаклевка по дереву Орех 0,6кг ("Лакра")', '7eed2035-ff83-11e4-9228-005056be1f7a', 0, 65, 50, 'Шпатлевка по дереву ЛАКРА дереву на основе акриловой дисперсии с повышенной водостойкостью. Благодаря мелкозернистой структуре легко наносится и прекрасно шлифуется. Обладает отличной заполняющей способностью.\nОбработанная шпатлевкой поверхность является идеально подходит для дальнейшей окраски при выполнении работ с высоким уровнем качества. Применяется для заполнения и выравнивания трещин, дефектов (сколы и т.п.), повреждений и неровностей на деревянных поверхностях (мебель, двери, пол, панельные стены, потолок).', 1),
('1a0a8b65-99a8-11db-937f-000e0c431b59', 'Шпаклевка по дереву Орех 1,5кг ("Лакра")', '7eed2035-ff83-11e4-9228-005056be1f7a', 0, 55, 40, 'Шпатлевка по дереву ЛАКРА дереву на основе акриловой дисперсии с повышенной водостойкостью. Благодаря мелкозернистой структуре легко наносится и прекрасно шлифуется. Обладает отличной заполняющей способностью.\nОбработанная шпатлевкой поверхность является идеально подходит для дальнейшей окраски при выполнении работ с высоким уровнем качества. Применяется для заполнения и выравнивания трещин, дефектов (сколы и т.п.), повреждений и неровностей на деревянных поверхностях (мебель, двери, пол, панельные стены, потолок).', 1),
('1a0a8b67-99a8-11db-937f-000e0c431b59', 'Шпаклевка по дереву Сосна 0,6кг ("Лакра")', '7eed2035-ff83-11e4-9228-005056be1f7a', 0, 118, 51, 'Шпатлевка по дереву ЛАКРА дереву на основе акриловой дисперсии с повышенной водостойкостью. Благодаря мелкозернистой структуре легко наносится и прекрасно шлифуется. Обладает отличной заполняющей способностью.\nОбработанная шпатлевкой поверхность является идеально подходит для дальнейшей окраски при выполнении работ с высоким уровнем качества. Применяется для заполнения и выравнивания трещин, дефектов (сколы и т.п.), повреждений и неровностей на деревянных поверхностях (мебель, двери, пол, панельные стены, потолок).', 1),
('1a0a8b69-99a8-11db-937f-000e0c431b59', 'Шпаклевка по дереву Сосна 1,5кг ("Лакра")', '7eed2035-ff83-11e4-9228-005056be1f7a', 0, 89, 43, 'Шпатлевка по дереву ЛАКРА дереву на основе акриловой дисперсии с повышенной водостойкостью. Благодаря мелкозернистой структуре легко наносится и прекрасно шлифуется. Обладает отличной заполняющей способностью.\nОбработанная шпатлевкой поверхность является идеально подходит для дальнейшей окраски при выполнении работ с высоким уровнем качества. Применяется для заполнения и выравнивания трещин, дефектов (сколы и т.п.), повреждений и неровностей на деревянных поверхностях (мебель, двери, пол, панельные стены, потолок).', 1),
('1a0a8b6b-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Бежевая  1кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 91, 69, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('1a0a8b6d-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Бежевая  2кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 108, 63, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('1a0a8b6f-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Бежевая 20кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 10, 6, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('1a0a8b71-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Бел. глянц.  0,9кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 496, 145, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('1a0a8b73-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Бел. глянц.  1,9кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 434, 112, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('1a0a8b75-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Бел. глянц. 20кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 109, 28, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('1a0a8b7b-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Бел. мат. 20кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 48, 25, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('1a0a8b7d-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Бирюза  1кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 107, 60, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('1a0a8b7f-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Бирюза  2кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 172, 62, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('1a0a8b81-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Бирюза 20кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 20, 6, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('1a0a8b83-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Вишневая  2кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 113, 54, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('1a0a8b85-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Вишневая  1кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 127, 56, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('1a0a8b87-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Вишневая 20кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 3, 5, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('1a0a8b89-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Голубая  1кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 164, 65, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('1a0a8b8b-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Голубая  2кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 193, 62, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('1a0a8b8d-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Голубая 20кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 29, 8, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('1a0a8b8f-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Желтая  1кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 244, 63, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('1a1ab87b-f78e-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 1,9кг Синий', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 170, 51, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('1b75918d-9fb8-11e3-8705-005056be1f7b', 'Эмаль акрил. универсальная Бел. мат. 0,9кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 90, 52, 'Образует глубокоматовую поверхность высокой степени белизны. Создает прочное влагостойкое, паропроницаемое и светостойкое покрытие. Не желтеет со временем. Отличается высокими декоративными и защитными свойствами, стойкая к мытью. Готова к применению.', 1),
('1bd57597-93b0-11e3-82a4-005056be1f7b', 'Грунт-эмаль по ржавчине синий 0,75л  DALI', '569e2345-ff83-11e4-9228-005056be1f7a', 0, 30, 37, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('1d967145-f787-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 0,8кг серебро', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 50, 42, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('1f4ff69d-f78f-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 6кг серый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 12, 12, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('206ff829-f790-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 20кг черный', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 12, 1, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('20b7f87c-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Желтая  2кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 186, 62, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('20b7f87e-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Желтая 20кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 22, 5, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('20b7f880-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Зеленая  1кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 182, 67, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('20b7f882-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Зеленая  2кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 290, 71, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('20b7f884-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Зеленая 20кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 17, 6, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('20b7f886-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Коричневая  1кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 106, 61, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('20b7f888-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Коричневая  2кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 207, 58, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('20b7f88a-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Коричневая 20кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 15, 6, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('20b7f88c-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Красная  1кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 194, 62, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('20b7f88e-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Красная  2кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 155, 60, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('20b7f890-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Красная 20кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 11, 5, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('20b7f896-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Оранжевая  1кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 107, 60, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('20b7f898-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Оранжевая  2кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 145, 60, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('20b7f89a-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Охристо-желтая  1кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 0, 56, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('20b7f89e-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Св-голубая  1кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 91, 59, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('20b7f8a0-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Св-голубая  2 кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 83, 56, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('20b7f8a2-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Св-голубая  20кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 22, 6, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('20b7f8a4-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Серая  1кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 148, 70, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('20b7f8a6-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Серая  2кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 217, 68, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('20b7f8a8-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Серая 20кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 35, 6, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('20b7f8aa-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Синяя  1кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 167, 66, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('20b7f8ac-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Синяя  2кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 164, 68, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('20b7f8ae-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Синяя 20кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 37, 5, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('20b7f8b0-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Темно-зеленая  1кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 76, 59, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('20b7f8b2-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Темно-зеленая 2 кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 109, 56, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('20b7f8b4-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Темно-зеленая 20кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 14, 8, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('20b7f8b6-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Фисташковая  1кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 2, 59, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('20b7f8b8-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Фисташковая  2 кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 0, 56, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('20b7f8bc-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Черная  0,9кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 416, 102, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('20b7f8be-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Черная  1,9кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 194, 99, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('20b7f8c0-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Черная 20кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 22, 13, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('20b7f8c2-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Шоколадно-коричневая 1кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 228, 60, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('20b7f8c4-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Ярко-зел.  1кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 156, 69, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('20b7f8c6-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Ярко-зел.  2кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 291, 70, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('20b7f8c8-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Ярко-зел. 20кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 12, 7, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('20b7f8d0-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-266 (Лакра) Желто-кор.  1кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 139, 91, 'Рекомендуется для покрытия окрашенных и неокрашенных деревянных полов внутри помещения. Обладает хорошими декоративными свойствами, укрывистостью и прочным сцеплением с окрашиваемой поверхностью.', 1),
('20b7f8d2-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-266 (Лакра) Желто-кор.  2кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 266, 76, 'Рекомендуется для покрытия окрашенных и неокрашенных деревянных полов внутри помещения. Обладает хорошими декоративными свойствами, укрывистостью и прочным сцеплением с окрашиваемой поверхностью.', 1),
('20b7f8d4-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-266 (Лакра) Желто-кор. 20кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 8, 0, 'Рекомендуется для покрытия окрашенных и неокрашенных деревянных полов внутри помещения. Обладает хорошими декоративными свойствами, укрывистостью и прочным сцеплением с окрашиваемой поверхностью.', 1),
('20b7f8d6-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-266 (Лакра) Золотисто-кор.  1кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 161, 91, 'Рекомендуется для покрытия окрашенных и неокрашенных деревянных полов внутри помещения. Обладает хорошими декоративными свойствами, укрывистостью и прочным сцеплением с окрашиваемой поверхностью.', 1),
('20b7f8d8-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-266 (Лакра) Золотисто-кор. 20кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 0, 0, 'Рекомендуется для покрытия окрашенных и неокрашенных деревянных полов внутри помещения. Обладает хорошими декоративными свойствами, укрывистостью и прочным сцеплением с окрашиваемой поверхностью.', 1),
('20b7f8da-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-266 (Лакра) Золотисто-кор.  2кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 338, 76, 'Рекомендуется для покрытия окрашенных и неокрашенных деревянных полов внутри помещения. Обладает хорошими декоративными свойствами, укрывистостью и прочным сцеплением с окрашиваемой поверхностью.', 1),
('20b7f8dc-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-266 (Лакра) Красно-кор.  1кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 122, 83, 'Рекомендуется для покрытия окрашенных и неокрашенных деревянных полов внутри помещения. Обладает хорошими декоративными свойствами, укрывистостью и прочным сцеплением с окрашиваемой поверхностью.', 1),
('20b7f8de-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-266 (Лакра) Красно-кор.  2кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 227, 75, 'Рекомендуется для покрытия окрашенных и неокрашенных деревянных полов внутри помещения. Обладает хорошими декоративными свойствами, укрывистостью и прочным сцеплением с окрашиваемой поверхностью.', 1),
('211dadff-f788-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 0,8кг охра', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 102, 59, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('2133814d-f78e-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 1,9кг Голубой', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 122, 48, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('23b6c6e7-f789-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 1,9кг Белая', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 279, 61, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('2461ad51-9fb8-11e3-8705-005056be1f7b', 'Эмаль акрил. универсальная Бел. мат. 2,5кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 44, 34, 'Образует глубокоматовую поверхность высокой степени белизны. Создает прочное влагостойкое, паропроницаемое и светостойкое покрытие. Не желтеет со временем. Отличается высокими декоративными и защитными свойствами, стойкая к мытью. Готова к применению.', 1),
('25a027ef-9e45-11e1-9d3e-005056be3bd8', 'Эмаль ПФ-115 (Лакра) Кремовая  1кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 79, 60, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('25a027f1-9e45-11e1-9d3e-005056be3bd8', 'Эмаль ПФ-115 (Лакра) Кремовая  2кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 80, 57, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('277ee1ed-f788-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 0,8кг серый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 147, 55, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('28110f45-99a8-11db-937f-000e0c431b59', 'Биосепт антисептический состав  5л', '569e2343-ff83-11e4-9228-005056be1f7a', 0, 66, 53, 'Предназначен для предотвращения образования и распространения грибков, плесени, древесной синевы и других видов биоразрушителей на различных поверхностях, а также для предотвращения заражения дерева деревопоражающими насекомыми и древесной синевой.', 1),
('28110f47-99a8-11db-937f-000e0c431b59', 'Биосепт антисептический состав  10л', '569e2343-ff83-11e4-9228-005056be1f7a', 0, 82, 52, 'Предназначен для предотвращения образования и распространения грибков, плесени, древесной синевы и других видов биоразрушителей на различных поверхностях, а также для предотвращения заражения дерева деревопоражающими насекомыми и древесной синевой.', 1),
('28110f49-99a8-11db-937f-000e0c431b59', 'Биоцидный состав "Антижук"   5л', '569e2343-ff83-11e4-9228-005056be1f7a', 0, 84, 53, 'Предназначен как для наружных, так и для внутренних работ: для уничтожения деревопоражающих насекомых на всех стадиях их развития; для предотвращения заражения деревянных поверхностей деревопоражающими насекомыми; для антисептической обработки деревянных, кирпичных, бетонных и других поверхностей с целью уничтожения и предотвращения образования плесени, грибковых поражений, различных видов синевы и т. п.', 1),
('28110f4b-99a8-11db-937f-000e0c431b59', 'Биоцидный состав "Антижук"  10л', '569e2343-ff83-11e4-9228-005056be1f7a', 0, 101, 50, 'Предназначен как для наружных, так и для внутренних работ: для уничтожения деревопоражающих насекомых на всех стадиях их развития; для предотвращения заражения деревянных поверхностей деревопоражающими насекомыми; для антисептической обработки деревянных, кирпичных, бетонных и других поверхностей с целью уничтожения и предотвращения образования плесени, грибковых поражений, различных видов синевы и т. п.', 1),
('28110f4f-99a8-11db-937f-000e0c431b59', 'Огнебиозащитный состав "Фенилакс" (кан.  6кг)', '569e2343-ff83-11e4-9228-005056be1f7a', 0, 47, 46, 'Предназначен для обработки древесных конструкций жилых и промышленных зданий и сооружений как снаружи, так и внутри помещения, а также других деревянных построек с целью защиты от возгорания, плесени и гниения.', 1),
('28110f51-99a8-11db-937f-000e0c431b59', 'Огнебиозащитный состав "Фенилакс" (кан. 11кг)', '569e2343-ff83-11e4-9228-005056be1f7a', 0, 55, 43, 'Предназначен для обработки древесных конструкций жилых и промышленных зданий и сооружений как снаружи, так и внутри помещения, а также других деревянных построек с целью защиты от возгорания, плесени и гниения.', 1),
('28110f53-99a8-11db-937f-000e0c431b59', 'Огнебиозащитный состав КСД  (5 кг)', '569e2343-ff83-11e4-9228-005056be1f7a', 0, 63, 57, 'Предназначен для комплексной защиты древесины, а также текстильных материалов. Состав защищает древесину от возгорания, распространения пламени, гниения, синевы, плесени а также поражения любыми видами биологических разрушителей внутри помещений, на открытом воздухе (под навесом).', 1),
('28110f55-99a8-11db-937f-000e0c431b59', 'Огнебиозащитный состав КСД (10 кг)', '569e2343-ff83-11e4-9228-005056be1f7a', 0, 62, 44, 'Предназначен для комплексной защиты древесины, а также текстильных материалов. Состав защищает древесину от возгорания, распространения пламени, гниения, синевы, плесени а также поражения любыми видами биологических разрушителей внутри помещений, на открытом воздухе (под навесом).', 1),
('28110f57-99a8-11db-937f-000e0c431b59', 'Огнебиозащитный состав КСД (200л)', '569e2343-ff83-11e4-9228-005056be1f7a', 0, 0, 0, 'Предназначен для комплексной защиты древесины, а также текстильных материалов. Состав защищает древесину от возгорания, распространения пламени, гниения, синевы, плесени а также поражения любыми видами биологических разрушителей внутри помещений, на открытом воздухе (под навесом).', 1),
('28b335ed-f78f-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 6кг светло-серый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 15, 12, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('2997b29e-f78e-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 1,9кг Шоколадный', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 95, 46, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('299c6ffe-f790-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 20кг Красно-коричневый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 16, 0, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('2cbf73b5-f789-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 1,9кг Белый матовый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 183, 54, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('2ced73cf-59ef-11e0-894e-000e0c431b58', 'Растворитель Cosmofen-5 1л', '72429777-ff83-11e4-9228-005056be1f7a', 0, 0, 0, 'Cпециальный очиститель па основе растворителя с размягчением поверхности для очистки от сильных загрязнений с проникновением в поверхностные слои частиц масла, изношенной резины, остатков клея, свежих остатков размягченного ПВХ и других загрязнений. Применяют для очистки материалов плит из ПВХ, других твердых и вспененных пластиковых плит и профилей из ПВХ.', 1),
('2eadcbef-99a8-11db-937f-000e0c431b59', 'Керосин 1л', '72429777-ff83-11e4-9228-005056be1f7a', 0, 218, 124, 'Для растворения и разбавления масляных ЛКМ, для горения в осветительных и нагревательных бытовых приборах,для промывки двигателей.', 1),
('2eadcbf1-99a8-11db-937f-000e0c431b59', 'Керосин 5л', '72429777-ff83-11e4-9228-005056be1f7a', 0, 110, 45, 'Для растворения и разбавления масляных ЛКМ, для горения в осветительных и нагревательных бытовых приборах,для промывки двигателей.', 1),
('2eadcbf3-99a8-11db-937f-000e0c431b59', 'Керосин 0,5л', '72429777-ff83-11e4-9228-005056be1f7a', 0, 233, 174, 'Для растворения и разбавления масляных ЛКМ, для горения в осветительных и нагревательных бытовых приборах,для промывки двигателей.', 1),
('2eadcbfc-99a8-11db-937f-000e0c431b59', 'Растворитель 646 0,5л', '72429777-ff83-11e4-9228-005056be1f7a', 0, 474, 256, 'Растворитель предназначен для разбавления лакокрасочных материалов и шпатлевок на основе: нитратоцелюлозных, нитратоцелюлозно-глифталевых, эпоксидных, нитратцелюлозно-эпоксидных, мочевино (меламино) формальдегидных, кремнеорганических (НЦ, ЭП, КО, МЧ, МС) и других лакокрасочных материалов.', 1),
('2eadcbfe-99a8-11db-937f-000e0c431b59', 'Растворитель 646 1л', '72429777-ff83-11e4-9228-005056be1f7a', 0, 459, 235, 'Растворитель предназначен для разбавления лакокрасочных материалов и шпатлевок на основе: нитратоцелюлозных, нитратоцелюлозно-глифталевых, эпоксидных, нитратцелюлозно-эпоксидных, мочевино (меламино) формальдегидных, кремнеорганических (НЦ, ЭП, КО, МЧ, МС) и других лакокрасочных материалов.', 1),
('2eadcc00-99a8-11db-937f-000e0c431b59', 'Растворитель 646 5л', '72429777-ff83-11e4-9228-005056be1f7a', 0, 189, 109, 'Растворитель предназначен для разбавления лакокрасочных материалов и шпатлевок на основе: нитратоцелюлозных, нитратоцелюлозно-глифталевых, эпоксидных, нитратцелюлозно-эпоксидных, мочевино (меламино) формальдегидных, кремнеорганических (НЦ, ЭП, КО, МЧ, МС) и других лакокрасочных материалов.', 1),
('2eadcc10-99a8-11db-937f-000e0c431b59', 'Растворитель 650 0,5л', '72429777-ff83-11e4-9228-005056be1f7a', 0, 272, 198, 'Растворение и разбавление нитроцеллюлозных,алкидных эмалей. Представляет собой смеси летучих органических растворителей. Растворитель 650 предназначен для лакокрасочной и других отраслей промышленности для разбавления эмалей для легковых автомобилей.', 1),
('2eadcc2e-99a8-11db-937f-000e0c431b59', 'Уайт-спирит 0,5л', '72429777-ff83-11e4-9228-005056be1f7a', 0, 948, 364, 'Растворение и разбавление масляных ЛКМ,грунтовок,олифы,битума,резинобитумной автомобильной мастики.Смывка автоконсерванта и битумных пятен. Представляет собой высококипящую фракцию бензина, применяется в лакокрасочной промышленности, в производстве олиф и других отраслях промышленности.', 1),
('2eadcc30-99a8-11db-937f-000e0c431b59', 'Уайт-спирит 1л', '72429777-ff83-11e4-9228-005056be1f7a', 0, 854, 261, 'Растворение и разбавление масляных ЛКМ,грунтовок,олифы,битума,резинобитумной автомобильной мастики.Смывка автоконсерванта и битумных пятен. Представляет собой высококипящую фракцию бензина, применяется в лакокрасочной промышленности, в производстве олиф и других отраслях промышленности.', 1),
('2eadcc32-99a8-11db-937f-000e0c431b59', 'Уайт-спирит 5л', '72429777-ff83-11e4-9228-005056be1f7a', 0, 514, 114, 'Используется для растворение и разбавление масляных ЛКМ,грунтовок,олифы,битума,резинобитумной автомобильной мастики.Смывка автоконсерванта и битумных пятен. Представляет собой высококипящую фракцию бензина, применяется в лакокрасочной промышленности, в производстве олиф и других отраслях промышленности.', 1),
('30047f82-f788-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 0,8кг светло-серый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 118, 59, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('3114fa55-f78f-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 6кг черный', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 25, 12, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('3409410b-5b1f-11e2-8bea-005056be271d', 'Краска латексная PARADE R7 база А шелк-мат. 9л', 'be9d3a6a-2b8c-11e5-80c2-00155d3703e1', 0, 27, 43, 'Шелковисто-матовая краска для стен и потолков любых типов помещений, в т.ч. с высокой эксплуатационной нагрузкой, требующих частой влажной уборки, а также фасадных элементов.\n', 1),
('3442e089-0125-11e4-8695-005056be1f7b', 'Эмаль ПФ-115 Inter 2,2кг серебро', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 4, 33, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('3479e733-bce7-11e4-a1f3-005056be1f7b', 'Молотковая грунт-эмаль по ржавчине серебристая 2 л  DALI', '569e2345-ff83-11e4-9228-005056be1f7a', 0, 0, 0, 'Применяется по любым металлическим поверхностям: решетки, ограды, гаражи, различные металлоконструкции, автомобильные детали и др. внутри помещений и в условиях атмосферного воздействия.', 1),
('34fe3e79-99a8-11db-937f-000e0c431b59', 'Сетка д/штукатурных работ"Фасад"(5х5) 1х50пм', '6beba4d6-03ad-11e5-bad4-005056be1f7a', 0, 240, 76, '', 1),
('34fe3e7c-99a8-11db-937f-000e0c431b59', 'Сетка малярная 2х2 стандарт 100смх50п.м', '6beba4d6-03ad-11e5-bad4-005056be1f7a', 0, 182, 73, '', 1),
('34fe3e7e-99a8-11db-937f-000e0c431b59', 'Сетка малярная 2х2 стандарт 100смх20 п.м', '6beba4d6-03ad-11e5-bad4-005056be1f7a', 0, 197, 73, '', 1),
('34fe3e85-99a8-11db-937f-000e0c431b59', 'Сетка штукатурная яч.5х5 (1х20м)  интерьер', '6beba4d6-03ad-11e5-bad4-005056be1f7a', 0, 141, 70, '', 1),
('34fe3e88-99a8-11db-937f-000e0c431b59', 'Сетка штукатурная яч.5х5 (1х50м)  интерьерная', '6beba4d6-03ad-11e5-bad4-005056be1f7a', 0, 176, 70, '', 1),
('34fe3e94-99a8-11db-937f-000e0c431b59', 'Двухсторонний скотч 38мм х 25м (полипропилен)', '79206b59-03ad-11e5-bad4-005056be1f7a', 0, 515, 381, '', 1),
('34fe3eb2-99a8-11db-937f-000e0c431b59', 'Скотч 50мм х 50 прозр', '79206b59-03ad-11e5-bad4-005056be1f7a', 0, 5323, 1590, '', 1),
('34fe3ed3-99a8-11db-937f-000e0c431b59', 'Скотч алюминиевый 50ммх50м (металлизированный)', '79206b59-03ad-11e5-bad4-005056be1f7a', 0, 179, 165, '', 1),
('34fe3ed7-99a8-11db-937f-000e0c431b59', 'Скотч. 30мм*20м малярный', '79206b59-03ad-11e5-bad4-005056be1f7a', 0, 1429, 922, '', 1),
('34fe3eda-99a8-11db-937f-000e0c431b59', 'Скотч. 50мм*20м малярный', '79206b59-03ad-11e5-bad4-005056be1f7a', 0, 2789, 1650, '', 1),
('3526e5c9-f78e-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 1,9кг Розово-бежевый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 126, 48, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('36e5c1e5-bbba-11e3-b52a-005056be1f7b', 'Шпатлевка акрил. "PARADE" S41 финишная Супербелая 10л', '7eed2035-ff83-11e4-9228-005056be1f7a', 0, 30, 17, 'Рекомендуется использовать для шпатлевания деревянных, бетонных, кирпичных поверхностей. Образует супербелое ровное покрытие. Великолепно подходит для финишной отделки поверхностей под покраску и оклеивания обоев.', 1),
('380e3f79-f788-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 0,8кг черный', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 239, 71, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('3bfb5c69-9fb8-11e3-8705-005056be1f7b', 'Эмаль акрил. универсальная Бел. п/глянц. 0,9кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 83, 52, 'Образует глубокоматовую поверхность высокой степени белизны. Создает прочное влагостойкое, паропроницаемое и светостойкое покрытие. Не желтеет со временем. Отличается высокими декоративными и защитными свойствами, стойкая к мытью. Готова к применению.', 1),
('3d601a65-f78f-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 6кг Красно-коричневый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 13, 9, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('3d822ed4-f78e-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 1,9кг охра', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 88, 45, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('41f9a64a-f788-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 0,8кг Красно-коричневый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 89, 59, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('441a7da1-9fb8-11e3-8705-005056be1f7b', 'Эмаль акрил. универсальная Бел. п/глянц. 2,4кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 71, 34, 'Образует глубокоматовую поверхность высокой степени белизны. Создает прочное влагостойкое, паропроницаемое и светостойкое покрытие. Не желтеет со временем. Отличается высокими декоративными и защитными свойствами, стойкая к мытью. Готова к применению.', 1),
('45794d11-f78e-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 1,9кг серый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 130, 48, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('47de42e5-f789-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 6кг Белая', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 11, 14, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('4b89f23b-1f19-11e5-8104-00155d3a0124', 'Двухсторонний скотч  (зеркальный) на вспененной основе 19мм*10м', '79206b59-03ad-11e5-bad4-005056be1f7a', 0, 115, 80, '', 1),
('4dd1de14-f78e-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 1,9кг светло-серый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 102, 46, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('4ed5aaa1-f789-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 6кг Белый матовый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 21, 12, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('500c0ee4-4f2c-11de-8f53-000e0c431b58', 'Огнебиозащитный состав ББ-11  (5л) (I и II гр.)', '569e2343-ff83-11e4-9228-005056be1f7a', 0, 85, 57, 'Предназначен: для профилактики и уничтожения дереворазрушающих, плесневых, окрашивающих грибов; профилактики появления насекомых;защиты от возгорания. Препарат представляет собой водный раствор на основе соединений бора. Прозрачная, бесцветная жидкость, без запаха, не изменяет текстуру и внешний вид обрабатываемой поверхности, не окрашивает древесины, экологически безопасен, не выделяет в окружающую среду вредных веществ, не повышает гидроскопичности древесины.\n', 1),
('500c0ee6-4f2c-11de-8f53-000e0c431b58', 'Огнебиозащитный состав ББ-11  (10л) (I и II гр.)', '569e2343-ff83-11e4-9228-005056be1f7a', 0, 121, 71, 'Предназначен: для профилактики и уничтожения дереворазрушающих, плесневых, окрашивающих грибов; профилактики появления насекомых;защиты от возгорания. Препарат представляет собой водный раствор на основе соединений бора. Прозрачная, бесцветная жидкость, без запаха, не изменяет текстуру и внешний вид обрабатываемой поверхности, не окрашивает древесины, экологически безопасен, не выделяет в окружающую среду вредных веществ, не повышает гидроскопичности древесины.\n', 1),
('55c10657-f78e-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 1,9кг черный', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 85, 57, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('56a6f723-ea03-11de-860d-000e0c431b58', 'Краска ВД акриловая д/обоев DALI 9л (Рогнеда)', 'be9d3a6a-2b8c-11e5-80c2-00155d3703e1', 0, 55, 37, 'Краска DALI акриловая для обоев обладает отличной адгезией к бумажным, флизелиновым и стеклообоям. Благодаря специально разработанному составу, краска DALI обладает хорошей укрывистостью и без проблем наносится на обои под покраску, сохраняя фактуру. Так же краска DALI может быть нанесена на минеральные поверхности, такие как гипсокартон, штукатурки, шпатлевки и тому подобные покрытия. Единственным условием к поверхности - нормальная влажность и температура в помещении, в котором производятся работы. Краска Dali содержит в составе специальные антибактериальные добавки, препятствующие образованию и размножению био организмов и бактерий. Кроме того краска DALI устойчива к влажной уборке и применению моющих средств, что делает стены и потолок помещения долговечными. Существуют две разновидности краски DALI - база А, подходящая и для машинной и для ручной колеровки, и база С, подходящая только для машинной колеровки. Купить и заколеровать краску DALI, а так же другую продукцию компании Рогнеда Вы можете в интернет магазине СтройБери, а так же в сети розничных магазинов.', 1),
('56f519d0-4f2c-11de-8f53-000e0c431b58', 'Краска ВД акриловая фасадная особопрочная База А DALI 9л (Рогнеда)', 'be9d3a6a-2b8c-11e5-80c2-00155d3703e1', 0, 173, 39, 'Применяется внутри и снаружи помещений по минеральным поверхностям (бетон, кирпич, гипс, цемент, гипсокартон, шпатлевка, штукатурка и др.) ', 1),
('58970c19-5a2d-11de-a649-000e0c431b58', 'Герметик "KRASS" сил. Универс. Коричневый   300 мл', '18c0600b-03aa-11e5-bad4-005056be1f7a', 0, 103, 175, 'Обеспечивает отличное сцепление поверхностей из стекла, эмали, пластика, металла, керамике, дерева. Содержит противогрибковый компонент, препятствующий гниению, образованию плесени, грибков. Применяется в помещениях с повышенной влажностью.', 1),
('5ed5699a-f78e-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 1,9кг Красно-коричневый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 97, 46, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('5fde6d12-f789-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 6кг серебро', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 0, 0, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('612d8834-6137-11e1-96bd-005056be3bd8', 'Эмаль для радиаторов Лакра акриловая глянец. 0,9кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 78, 41, 'ЭМАЛЬ АКРИЛОВАЯ ДЛЯ РАДИАТОРОВ ОТОПЛЕНИЯ Высококачественная термостойкая водоразбавляемая эмаль на основе акриловой дисперсии. Для внутренних и наружных работ. Устойчива к высоким температурам (до 100°С), к пожелтению, к действию воды, атмосферных осадков и моющих средств. Быстро высыхает. Образует глянцевую поверхность высокой степени белизны. Обладает отличной укрывистостью и адгезией. Отличается высокими декоративными и защитными свойствами, стойкая к мытью. Готова к применению.', 1),
('61fa79ff-168f-11e1-8cc1-001cc494be80', 'Скотч противоскольжения 50ммх5м', '79206b59-03ad-11e5-bad4-005056be1f7a', 0, 25, 0, '', 1),
('6315f6f2-5855-11e1-830a-005056be3bd8', 'Двухсторонний скотч  (зеркальный) на вспененной основе 25мм*10м', '79206b59-03ad-11e5-bad4-005056be1f7a', 0, 90, 55, '', 1),
('67c85be4-6208-11de-9531-000e0c431b58', 'Огнебиозащитный состав ББ-11  (10л) (I и II гр.) с индикатором', '569e2343-ff83-11e4-9228-005056be1f7a', 0, 195, 73, 'Предназначен: для профилактики и уничтожения дереворазрушающих, плесневых, окрашивающих грибов; профилактики появления насекомых;защиты от возгорания. Препарат представляет собой водный раствор на основе соединений бора. Прозрачная, бесцветная жидкость, без запаха, не изменяет текстуру и внешний вид обрабатываемой поверхности, не окрашивает древесины, экологически безопасен, не выделяет в окружающую среду вредных веществ, не повышает гидроскопичности древесины.\n', 1),
('67c85be6-6208-11de-9531-000e0c431b58', 'Огнебиозащитный состав ББ-11  (5л) (I и II гр.) с индикатором', '569e2343-ff83-11e4-9228-005056be1f7a', 0, 120, 57, 'Предназначен: для профилактики и уничтожения дереворазрушающих, плесневых, окрашивающих грибов; профилактики появления насекомых;защиты от возгорания. Препарат представляет собой водный раствор на основе соединений бора. Прозрачная, бесцветная жидкость, без запаха, не изменяет текстуру и внешний вид обрабатываемой поверхности, не окрашивает древесины, экологически безопасен, не выделяет в окружающую среду вредных веществ, не повышает гидроскопичности древесины.\n', 1),
('680965ab-f789-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 20кг Белая', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 12, 8, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('727c8145-f789-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 20кг Белый матовый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 31, 7, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('747ef690-551c-11dc-beb4-000e0c431b58', 'Эмаль ПФ-115 (Лакра) Бел. мат.  2кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 263, 104, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('763735c0-2a2b-11e2-9366-005056be3bd8', 'Грунт глубокого проникновения Tiefgrund  5л', 'fa733516-ff83-11e4-9228-005056be1f7a', 0, 303, 221, 'Идеально подходит для предварительной обработки очень пористых оснований с целью улучшения адгезии и укрепления поверхности перед укладкой керамической плитки, нанесением штукатурок, шпатлевок, наливных полов и стяжек, а так же перед покраской. Благодаря уникальной рецептуре грунтовка глубокого проникания Альмира обладает исключительной  проникающей способности идеальна для сильно впитывающих оснований.', 1),
('77c5eb9b-4b14-11e1-bd83-001cc494be80', 'Герметик "KRASS" по дереву Parquet ВЕНГЕ 300мл', '18c0600b-03aa-11e5-bad4-005056be1f7a', 0, 134, 152, 'Заделка и уплотнение соединений, щелей, зазоров в паркете, плинтусах, деревянном полу, стенах и других конструкциях. Уплотнение оконных и дверных рам с внутренней стороны.', 1),
('78e43dfb-fbee-11e1-8f72-005056be3bd8', 'Биосепт-УЛЬТРА антисептический состав  20л', '569e2343-ff83-11e4-9228-005056be1f7a', 0, 30, 0, 'Предназначен для усиленной длительной защиты конструкций и изделий из древесины от поражения плесенью, деревоокрашивающими, дереворазрушающими грибками и насекомыми. Применяется в особо тяжелых условиях: при непосредственном контакте с влажным грунтом, при интенсивном воздействии гигроскопической, конденсационной, атмосферной и почвенной влаги и т.п. Применяется как снаружи, так и внутри помещений, в том числе в особо тяжелых условиях, включая контакт с влажным грунтом', 1),
('7a3c5db1-777c-11de-9531-000e0c431b58', 'Краска ВД акриловая д/стен и потолков (PROFESSIONAL) База С DALI 9л (Рогнеда)', 'be9d3a6a-2b8c-11e5-80c2-00155d3703e1', 1, 16, 9, 'КРАСКА ДАЛИ ДЛЯ СТЕН И ПОТОЛКОВ предназначена для декоративного и экологичного окрашивания стен и потолков внутри помещений с повышенной эксплуатационной нагрузкой. Применяется для окраски кирпичных, бетонных, оштукатуренных и других минеральных поверхностей.', 1),
('7a3c5db3-777c-11de-9531-000e0c431b58', 'Краска ВД акриловая д/стен и потолков (PROFESSIONAL) База С DALI 5л (Рогнеда)', 'be9d3a6a-2b8c-11e5-80c2-00155d3703e1', 0, 25, 24, 'КРАСКА ДАЛИ ДЛЯ СТЕН И ПОТОЛКОВ предназначена для декоративного и экологичного окрашивания стен и потолков внутри помещений с повышенной эксплуатационной нагрузкой. Применяется для окраски кирпичных, бетонных, оштукатуренных и других минеральных поверхностей.', 1),
('7a3c5db5-777c-11de-9531-000e0c431b58', 'Краска ВД акриловая фасадная особопрочная База С DALI 9л (Рогнеда)', 'be9d3a6a-2b8c-11e5-80c2-00155d3703e1', 0, 7, 11, 'Применяется внутри и снаружи помещений по минеральным поверхностям (бетон, кирпич, гипс, цемент, гипсокартон, шпатлевка, штукатурка и др.) ', 1),
('7a3c5db7-777c-11de-9531-000e0c431b58', 'Краска ВД акриловая фасадная особопрочная База С DALI 5л (Рогнеда)', 'be9d3a6a-2b8c-11e5-80c2-00155d3703e1', 0, 25, 18, 'Применяется внутри и снаружи помещений по минеральным поверхностям (бетон, кирпич, гипс, цемент, гипсокартон, шпатлевка, штукатурка и др.) ', 1),
('7ab6caa7-b1ee-11e0-aa21-000e0c431b58', 'Спецгрунт PARADE Reanimator G40  по ст. покрытиям 10л', '569e2345-ff83-11e4-9228-005056be1f7a', 0, 17, 12, 'Используется для грунтования различных видов поверхностей. Не требует механического удаления старых эмалевых покрытий. Обеспечивает прочное соединение основания и лакокрасочных материалов, выравнивает тон поверхности, улучшает впитывающие возможности поверхности, препятствует образованию коррозии. Образует полупрозрачное слегка шероховатое покрытие.', 1),
('7c1e70d5-5a9d-11dc-be42-000e0c431b58', 'Эмаль ПФ-115 (Лакра) Бел. мат.  1кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 182, 114, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('7e531df3-b5f5-11e1-83ba-005056be3bd8', 'Очиститель Cosmofen-20 1л прозр.', '72429777-ff83-11e4-9228-005056be1f7a', 0, 40, 30, 'Жидкое чистящее средство, не растворяющее поверхности. Применяется в качестве не размягчающего средства с антистатиком для очистки профилей из твердого ПХВ, профилей, кашированных пленкой из ренолита и профилей из полиуретана. Особенно пригоден для очистки от пыли, остатков клея с защитной пленки, жира, следов резины, свежей полиуретановой пены и свежих остатков размягченного ПВХ, а также следов шприцмашин для дегтя или битума. Применяемый антистатик эффективно предотвращает необходимость скорой повторной очистки от загрязнений поверхностей профиля и плит ПВХ.', 1),
('7ff8df4e-f789-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 20кг серебро', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 0, 0, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('82ebcce8-bce7-11e4-a1f3-005056be1f7b', 'Молотковая грунт-эмаль по ржавчине серебристая 10 л  DALI', '569e2345-ff83-11e4-9228-005056be1f7a', 0, 0, 0, 'Применяется по любым металлическим поверхностям: решетки, ограды, гаражи, различные металлоконструкции, автомобильные детали и др. внутри помещений и в условиях атмосферного воздействия.', 1),
('8522912f-f3fb-11e4-9746-005056be1f7b', 'Грунт-эмаль по ржавчине синяя 10л  DALI', '569e2345-ff83-11e4-9228-005056be1f7a', 0, 0, 0, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('897bb5a6-b0fa-11e3-b34d-005056be1f7b', 'Растворитель для эмалей и красок', '72429777-ff83-11e4-9228-005056be1f7a', 0, 2, 25, 'Рекомендуется для разбавления финишных покрытий Parade Z1, Parade F50, Parade F51.Также применяется для разбавления эмалей и красок на основе эпоксидных, виниловых, акриловых, кремнийорганических полимеров, нитроцеллюлозы, хлоркаучука, меламино- и мочевиноформальдегидных материалов, для очистки инструмента после их нанесения и обезжиривания поверхности. Тип растворителя: специальный растворитель.', 1),
('89cb1aab-b1c3-11e0-aa21-000e0c431b58', 'Спецгрунт PARADE Reanimator G40  по ст. покрытиям  2,5л', '569e2345-ff83-11e4-9228-005056be1f7a', 0, 25, 23, 'Используется для грунтования различных видов поверхностей. Не требует механического удаления старых эмалевых покрытий. Обеспечивает прочное соединение основания и лакокрасочных материалов, выравнивает тон поверхности, улучшает впитывающие возможности поверхности, препятствует образованию коррозии. Образует полупрозрачное слегка шероховатое покрытие.', 1),
('9291c63a-5ab3-11dc-be42-000e0c431b58', 'Эмаль универсальная белая глянцевая 520 мл.', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 133, 61, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \n', 1),
('9291c63c-5ab3-11dc-be42-000e0c431b58', 'Эмаль универсальная черная глянцевая 520 мл.', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 169, 61, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \n', 1),
('9291c63e-5ab3-11dc-be42-000e0c431b58', 'Эмаль универсальная красная 520 мл.', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 128, 53, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \n', 1),
('9291c640-5ab3-11dc-be42-000e0c431b58', 'Эмаль универсальная вишневая 520 мл.', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 63, 36, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \n', 1),
('95aabdce-0d99-11dc-bdd4-000e0c431b58', 'Клей ПВА Мастер универсальный  0,9кг  ("Лакра")', '3df545ee-03aa-11e5-bad4-005056be1f7a', 0, 93, 66, 'Рекомендуется для склеивания изделий из дерева, не подвергающихся механическим нагрузкам, кожи, картона, бумаги и т.п.', 1),
('963b6b0a-04a8-11e3-94de-005056be3574', 'Штукатурка роллерная декоративная с эффектом "короеда" Белый 15кг', '6aa6af7c-ff83-11e4-9228-005056be1f7a', 0, 38, 18, 'Штукатурка фактурная ЛАКРА с эффект "короеда", готовая к применению декоративная штукатурка повышенной белизны на основе водной акриловой дисперсии. Легко наносится валиком. Создает прочное влагостойкое, паропроницаемое покрытие, стойкое к атмосферным воздействиям и эксплуатационным нагрузкам. Обладает отличной адгезией к поверхностям из бетона, камня, гипса, цемента, кирпича, ДСП, ДВП. Не содержит растворителей, без запаха. Допускает мытье окрашенной поверхности. Колеруется в светлые оттенки.', 1),
('992163db-a731-11de-90d4-000e0c431b58', 'Краска ВД акриловая д/потолков DALI 9л (Рогнеда)', 'be9d3a6a-2b8c-11e5-80c2-00155d3703e1', 1, 62, 37, 'Предназначена для декоративного окрашивания потолков в сухих жилых и общественных помещениях с низкой эксплуатационной нагрузкой.', 1),
('992163dd-a731-11de-90d4-000e0c431b58', 'Краска ВД латексная д/кухни и ванной DALI 9л БАЗА А (Рогнеда)', 'be9d3a6a-2b8c-11e5-80c2-00155d3703e1', 0, 45, 36, 'Латексная акриловая краска для декоративного окрашивания стен и потолков в жилых и общественных помещениях с повышенной влажностью воздуха и эксплуатационной нагрузкой. Применяется внутри помещений по минеральным поверхностям (бетон, кирпич, гипс, цемент, гипсокартон, шпатлевка, штукатурка и др.).', 1),
('993a4aa8-6b1e-11dc-be42-000e0c431b58', 'Краска акрил. "PARADE" W4 БАЗА А  Бел. мат. 9л', 'be9d3a6a-2b8c-11e5-80c2-00155d3703e1', 0, 950, 122, 'Parade W4 — краска акриловая для внутренних работ. Допускается частая влажная уборка с применением моющих средств, выдерживает более 3000 циклов мытья. Parade W4 применяется на стены и потолки помещений, подвергающиеся максимальным эксплуатационным нагрузкам (любые офисные и жилые помещения), подходит для окраски обоев.', 1),
('993a4aaa-6b1e-11dc-be42-000e0c431b58', 'Краска акрил. "PARADE" W4 БАЗА А  Бел. мат. 5л', 'be9d3a6a-2b8c-11e5-80c2-00155d3703e1', 0, 347, 56, 'Parade W4 — краска акриловая для внутренних работ. Допускается частая влажная уборка с применением моющих средств, выдерживает более 3000 циклов мытья. Parade W4 применяется на стены и потолки помещений, подвергающиеся максимальным эксплуатационным нагрузкам (любые офисные и жилые помещения), подходит для окраски обоев.', 1),
('993a4aac-6b1e-11dc-be42-000e0c431b58', 'Краска акрил. "PARADE" W4 БАЗА А  Бел. мат.  2,5л', 'be9d3a6a-2b8c-11e5-80c2-00155d3703e1', 0, 355, 68, 'Parade W4 — краска акриловая для внутренних работ. Допускается частая влажная уборка с применением моющих средств, выдерживает более 3000 циклов мытья. Parade W4 применяется на стены и потолки помещений, подвергающиеся максимальным эксплуатационным нагрузкам (любые офисные и жилые помещения), подходит для окраски обоев.', 1),
('993a4aae-6b1e-11dc-be42-000e0c431b58', 'Краска фасадная "PARADE" F20 Бел.мат. База  А 9л', 'be9d3a6a-2b8c-11e5-80c2-00155d3703e1', 0, 1386, 111, 'Акриловая краска Parade F20 предназначена для фасадных работ по бетонным, кирпичным, оштукатуренным и другим поверхностям. Супербелая, матовая, колеруется пастами для водных красок. Разбавляется водой. Хранить в оригинальной упаковке при температуре выше 0°C в течение 12 месяцев. Выпускается расфасованной в ведра по 2,5 л, 5 л и 10 л.', 1),
('9bd479ef-b369-11e4-a26a-005056be1f7b', 'Грунт БЕТОН-КОНТАКТ 20кг', 'fa733516-ff83-11e4-9228-005056be1f7a', 0, 59, 38, 'Предназначена для обработки гладких минеральных, преимущественно бетонных, вертикальных оснований перед нанесением цементно-песчаных и гипсовых штукатурок и шпаклевок, а так же плиточных клеев, в т.ч. торговой марки Ceresit, при внутренних работах.', 1),
('a0f3c4de-cf2d-11e1-92a4-005056be3bd8', 'Краска интерьерная "PARADE" W5 база А Бел. мат. 9л', 'be9d3a6a-2b8c-11e5-80c2-00155d3703e1', 0, 41, 19, 'Parade W5 интерьерная краска на акриловой основе, матовая для внутренних работ образует прочное матовое декоративное покрытие, выдерживающее частую влажную уборку с применением моющих средств. Рекомендуется для любых типов помещений при окраске стен и потолков, а также обоев под покраску.', 1),
('a1a9b4a6-f787-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 0,8кг Оранжевый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 160, 61, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('a48048ba-ec8c-11e3-9eab-005056be1f7b', 'Ксилол 0,5л', '72429777-ff83-11e4-9228-005056be1f7a', 0, 86, 29, 'Используется для разбавления до рабочей вязкости при нанесении краскораспылителем различных автоэмалей, а также некоторых лаков,красок,эмалей и грунтовок на алкидной (ПФ, ГФ) ,эпоксидной (ЭП) и битумной (БТ) основах.', 1),
('a663cb7c-fadf-11e3-b5e8-005056be1f7b', 'Краска латексная PARADE R7 база С шелк-мат. 2,5л', 'be9d3a6a-2b8c-11e5-80c2-00155d3703e1', 0, 16, 18, 'Шелковисто-матовая краска для стен и потолков любых типов помещений, в т.ч. с высокой эксплуатационной нагрузкой, требующих частой влажной уборки, а также фасадных элементов.\n', 1),
('a6f80c96-516a-11dd-a89a-000e0c431b58', 'Краска ВД акриловая д/обоев DALI 2,5л (Рогнеда)', 'be9d3a6a-2b8c-11e5-80c2-00155d3703e1', 0, 113, 49, 'Краска DALI акриловая для обоев обладает отличной адгезией к бумажным, флизелиновым и стеклообоям. Благодаря специально разработанному составу, краска DALI обладает хорошей укрывистостью и без проблем наносится на обои под покраску, сохраняя фактуру. Так же краска DALI может быть нанесена на минеральные поверхности, такие как гипсокартон, штукатурки, шпатлевки и тому подобные покрытия. Единственным условием к поверхности - нормальная влажность и температура в помещении, в котором производятся работы. Краска Dali содержит в составе специальные антибактериальные добавки, препятствующие образованию и размножению био организмов и бактерий. Кроме того краска DALI устойчива к влажной уборке и применению моющих средств, что делает стены и потолок помещения долговечными. Существуют две разновидности краски DALI - база А, подходящая и для машинной и для ручной колеровки, и база С, подходящая только для машинной колеровки. Купить и заколеровать краску DALI, а так же другую продукцию компании Рогнеда Вы можете в интернет магазине СтройБери, а так же в сети розничных магазинов.', 1),
('a6f80c98-516a-11dd-a89a-000e0c431b58', 'Краска ВД акриловая д/обоев DALI 5л (Рогнеда)', 'be9d3a6a-2b8c-11e5-80c2-00155d3703e1', 0, 58, 46, 'Краска DALI акриловая для обоев обладает отличной адгезией к бумажным, флизелиновым и стеклообоям. Благодаря специально разработанному составу, краска DALI обладает хорошей укрывистостью и без проблем наносится на обои под покраску, сохраняя фактуру. Так же краска DALI может быть нанесена на минеральные поверхности, такие как гипсокартон, штукатурки, шпатлевки и тому подобные покрытия. Единственным условием к поверхности - нормальная влажность и температура в помещении, в котором производятся работы. Краска Dali содержит в составе специальные антибактериальные добавки, препятствующие образованию и размножению био организмов и бактерий. Кроме того краска DALI устойчива к влажной уборке и применению моющих средств, что делает стены и потолок помещения долговечными. Существуют две разновидности краски DALI - база А, подходящая и для машинной и для ручной колеровки, и база С, подходящая только для машинной колеровки. Купить и заколеровать краску DALI, а так же другую продукцию компании Рогнеда Вы можете в интернет магазине СтройБери, а так же в сети розничных магазинов.', 1),
('a6f80c9c-516a-11dd-a89a-000e0c431b58', 'Краска ВД акриловая д/потолков DALI 2,5л (Рогнеда)', 'be9d3a6a-2b8c-11e5-80c2-00155d3703e1', 0, 141, 49, 'КРАСКА ДАЛИ АКРИЛОВАЯ ДЛЯ ПОТОЛКОВ Предназначена для декоративного окрашивания потолков в сухих жилых и общественных помещениях с низкой эксплуатационной нагрузкой.', 1),
('a6f80c9e-516a-11dd-a89a-000e0c431b58', 'Краска ВД акриловая д/потолков DALI 5л (Рогнеда)', 'be9d3a6a-2b8c-11e5-80c2-00155d3703e1', 0, 113, 46, 'КРАСКА ДАЛИ АКРИЛОВАЯ ДЛЯ ПОТОЛКОВ Предназначена для декоративного окрашивания потолков в сухих жилых и общественных помещениях с низкой эксплуатационной нагрузкой.', 1),
('a6f80ca2-516a-11dd-a89a-000e0c431b58', 'Краска ВД акриловая д/стен и потолков (PROFESSIONAL) DALI 2,5л (Рогнеда)', 'be9d3a6a-2b8c-11e5-80c2-00155d3703e1', 0, 114, 53, 'КРАСКА ДАЛИ ДЛЯ СТЕН И ПОТОЛКОВ предназначена для декоративного и экологичного окрашивания стен и потолков внутри помещений с повышенной эксплуатационной нагрузкой. Применяется для окраски кирпичных, бетонных, оштукатуренных и других минеральных поверхностей.', 1),
('a6f80ca4-516a-11dd-a89a-000e0c431b58', 'Краска ВД акриловая д/стен и потолков (PROFESSIONAL) DALI 5л (Рогнеда)', 'be9d3a6a-2b8c-11e5-80c2-00155d3703e1', 0, 105, 50, 'КРАСКА ДАЛИ ДЛЯ СТЕН И ПОТОЛКОВ предназначена для декоративного и экологичного окрашивания стен и потолков внутри помещений с повышенной эксплуатационной нагрузкой. Применяется для окраски кирпичных, бетонных, оштукатуренных и других минеральных поверхностей.', 1),
('a6f80ca8-516a-11dd-a89a-000e0c431b58', 'Краска ВД акриловая фасадная особопрочная База А DALI 5л (Рогнеда)', 'be9d3a6a-2b8c-11e5-80c2-00155d3703e1', 0, 59, 40, 'Применяется внутри и снаружи помещений по минеральным поверхностям (бетон, кирпич, гипс, цемент, гипсокартон, шпатлевка, штукатурка и др.) ', 1),
('a6f80cac-516a-11dd-a89a-000e0c431b58', 'Краска ВД латексная д/кухни и ванной DALI 2,5л (Рогнеда)', 'be9d3a6a-2b8c-11e5-80c2-00155d3703e1', 0, 90, 49, 'Латексная акриловая краска для декоративного окрашивания стен и потолков в жилых и общественных помещениях с повышенной влажностью воздуха и эксплуатационной нагрузкой. Применяется внутри помещений по минеральным поверхностям (бетон, кирпич, гипс, цемент, гипсокартон, шпатлевка, штукатурка и др.).', 1),
('a6f80cae-516a-11dd-a89a-000e0c431b58', 'Краска ВД латексная д/кухни и ванной DALI 5л (Рогнеда)', 'be9d3a6a-2b8c-11e5-80c2-00155d3703e1', 0, 45, 42, 'Латексная акриловая краска для декоративного окрашивания стен и потолков в жилых и общественных помещениях с повышенной влажностью воздуха и эксплуатационной нагрузкой. Применяется внутри помещений по минеральным поверхностям (бетон, кирпич, гипс, цемент, гипсокартон, шпатлевка, штукатурка и др.).', 1),
('a6fd4151-ec8b-11e3-9eab-005056be1f7b', 'Краска латексная PARADE R3 база C Бесцветная 2,5л', 'be9d3a6a-2b8c-11e5-80c2-00155d3703e1', 0, 18, 15, 'Матовая краска для стен и потолков любых типов помещений, в т.ч. с высокой эксплуатационной нагрузкой, требующие частой влажной уборки, а также фасадных элементов.', 1),
('a7555009-7f46-11e3-af7c-005056be1f7b', 'Краска латексная PARADE R20 база А П/мат 2,5л Россия', 'be9d3a6a-2b8c-11e5-80c2-00155d3703e1', 0, 41, 51, 'Краска интерьерная латексная суперстойкая полуматовая. Высококачественная латексная интерьерная краска с исключительными показателями водостойкости, стойкости к мытью и мокрому истиранию.', 1),
('ab383e71-f78f-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 20кг Оранжевый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 10, 0, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('ad93144b-f787-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 0,8кг Желтый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 188, 61, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('ae39d1eb-cf86-11e3-a00d-005056be1f7b', 'Эмаль по металлу Parade Z1 гладкая  Золотой 2,5л', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 4, 17, '', 1),
('b08b1d7e-ec8c-11e3-9eab-005056be1f7b', 'Сольвент 0,5л', '72429777-ff83-11e4-9228-005056be1f7a', 0, 216, 58, 'Предназначен для растворения масляных, алкидных, алкидно-фенольных лаков, красок, эмалей, а также для разбавления масел, битумов, каучуков, меламиноалкидных ЛКМ.', 1),
('b182dc4f-f994-11e2-98ef-005056be3574', 'Молотковая грунт-эмаль по ржавчине черная 0,75л  DALI', '569e2345-ff83-11e4-9228-005056be1f7a', 0, 65, 34, 'Применяется по любым металлическим поверхностям: решетки, ограды, гаражи, различные металлоконструкции, автомобильные детали и др. внутри помещений и в условиях атмосферного воздействия.', 1),
('b182dc51-f994-11e2-98ef-005056be3574', 'Молотковая грунт-эмаль по ржавчине зеленая 0,75л  DALI', '569e2345-ff83-11e4-9228-005056be1f7a', 0, 45, 34, 'Применяется по любым металлическим поверхностям: решетки, ограды, гаражи, различные металлоконструкции, автомобильные детали и др. внутри помещений и в условиях атмосферного воздействия.', 1),
('b1a9595a-7f46-11e3-af7c-005056be1f7b', 'Краска латексная PARADE R20 база А П/мат 5л Россия', 'be9d3a6a-2b8c-11e5-80c2-00155d3703e1', 0, 29, 34, 'Краска интерьерная латексная суперстойкая полуматовая. Высококачественная латексная интерьерная краска с исключительными показателями водостойкости, стойкости к мытью и мокрому истиранию.', 1),
('b3740593-f78f-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 20кг Желтый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 15, 1, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('b54ba125-f78e-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 6кг Оранжевый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 14, 9, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('b5957aa3-f787-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 0,8кг Вишневый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 147, 61, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('b7e28649-21de-11df-860d-000e0c431b58', 'Краска фактурная Белый 9 кг ("Лакра")', 'be9d3a6a-2b8c-11e5-80c2-00155d3703e1', 0, 33, 27, 'Краска представляет собой белую вязкую однородную массу. Удобна в нанесении, легка в обработке, имеет высокую адгезию к основанию. После высыхания краска образует декоративное рельефное покрытие, скрывающие мелкие дефекты стен. Отличается высокой твердостью и атмосферостойкостью. Возможно последующее нанесение воднодисперсионной краски другого цвета на высохшее фактурное покрытие. Готова к применению.', 1),
('b7e2864b-21de-11df-860d-000e0c431b58', 'Краска фактурная Белый 18 кг ("Лакра")', 'be9d3a6a-2b8c-11e5-80c2-00155d3703e1', 0, 402, 27, 'Краска представляет собой белую вязкую однородную массу. Удобна в нанесении, легка в обработке, имеет высокую адгезию к основанию. После высыхания краска образует декоративное рельефное покрытие, скрывающие мелкие дефекты стен. Отличается высокой твердостью и атмосферостойкостью. Возможно последующее нанесение воднодисперсионной краски другого цвета на высохшее фактурное покрытие. Готова к применению.', 1),
('b8d52c0e-7f46-11e3-af7c-005056be1f7b', 'Краска латексная PARADE R20 база А П/мат 9л Россия', 'be9d3a6a-2b8c-11e5-80c2-00155d3703e1', 0, 47, 42, 'Краска интерьерная латексная суперстойкая полуматовая. Высококачественная латексная интерьерная краска с исключительными показателями водостойкости, стойкости к мытью и мокрому истиранию.', 1),
('b948502d-e1ad-11df-a0c5-000e0c431b58', 'Герметик "KRASS" битумный для крыш Черный 300мл', '18c0600b-03aa-11e5-bad4-005056be1f7a', 0, 541, 178, 'Заполнение зазоров в крышах и кровли, ремонт битумных покрытий и гонтов, соединение аркушей рубероида, уплотнение при мелких кровельных работах, уплотнение в желобах и в спускных трубах, монтаж и крепление изоляционных материалов. \n', 1),
('ba1232df-ec8c-11e3-9eab-005056be1f7b', 'Растворитель Р-4 0,5л', '72429777-ff83-11e4-9228-005056be1f7a', 0, 377, 29, 'Представляет собой смеси летучих органических жидкостей. Растворитель Р-4 предназначен для разбавления лакокрасочных материалов на основе поливинилхлоридных хлорированных смол ПСХ ЛС и ПСХ ЛН, сополимеров винилхлорида, эпоксидных смол и других пленкообразующих веществ.', 1),
('bb036923-a661-11e2-9827-005056be3574', 'Серебрянка 0,5л', 'be9d3a6a-2b8c-11e5-80c2-00155d3703e1', 0, 76, 23, 'Покрытие устойчивое к атмосферным воздействиям. Быстро сохнет. Обладает высокими декоративными свойствами.', 1),
('bc816f7f-f78f-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 20кг Вишневый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 5, 0, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('beb861cb-f787-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 0,8кг Красный', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 167, 61, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('bef8d7ea-f78e-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 6кг Желтый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 9, 12, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('bf4804e2-fc0e-11dd-bd91-000e0c431b58', 'Краска акрил. "PARADE" W4 База С Бесцветный 2,5 л', 'be9d3a6a-2b8c-11e5-80c2-00155d3703e1', 0, 169, 34, 'Parade W4 — краска акриловая для внутренних работ. Допускается частая влажная уборка с применением моющих средств, выдерживает более 3000 циклов мытья. Parade W4 применяется на стены и потолки помещений, подвергающиеся максимальным эксплуатационным нагрузкам (любые офисные и жилые помещения), подходит для окраски обоев.', 1),
('bf4804e4-fc0e-11dd-bd91-000e0c431b58', 'Краска фасадная "PARADE" F20  База  С Бесцветный 2,5 л', 'be9d3a6a-2b8c-11e5-80c2-00155d3703e1', 0, 174, 39, 'Акриловая краска Parade F20 предназначена для фасадных работ по бетонным, кирпичным, оштукатуренным и другим поверхностям. Супербелая, матовая, колеруется пастами для водных красок. Разбавляется водой. Хранить в оригинальной упаковке при температуре выше 0°C в течение 12 месяцев. Выпускается расфасованной в ведра по 2,5 л, 5 л и 10 л.', 1),
('c017590e-fbe7-11e0-b702-001cc494be80', 'Краска ВД-АК 2180 "Новые технологии" интерьерная супербел. 3кг', 'be9d3a6a-2b8c-11e5-80c2-00155d3703e1', 0, 141, 78, 'Краска акриловая для стен и потолков моющаяся предназначена для высококачественной окраски стен и потолков внутри бытовых и производственных помещений с повышенной эксплуатационной нагрузкой, требующих частой влажной уборки с применением моющих и дезинфицирующих средств.', 1),
('c0175910-fbe7-11e0-b702-001cc494be80', 'Краска ВД-АК 2180 "Новые технологии" интерьерная супербел. 6кг', 'be9d3a6a-2b8c-11e5-80c2-00155d3703e1', 0, 134, 59, 'Краска акриловая для стен и потолков моющаяся предназначена для высококачественной окраски стен и потолков внутри бытовых и производственных помещений с повышенной эксплуатационной нагрузкой, требующих частой влажной уборки с применением моющих и дезинфицирующих средств.', 1),
('c0175912-fbe7-11e0-b702-001cc494be80', 'Краска ВД-АК 2180 "Новые технологии" моющаяся супербел. 3кг', 'be9d3a6a-2b8c-11e5-80c2-00155d3703e1', 0, 101, 79, 'Краска акриловая для стен и потолков моющаяся предназначена для высококачественной окраски стен и потолков внутри бытовых и производственных помещений с повышенной эксплуатационной нагрузкой, требующих частой влажной уборки с применением моющих и дезинфицирующих средств.', 1),
('c0175914-fbe7-11e0-b702-001cc494be80', 'Краска ВД-АК 2180 "Новые технологии" интерьерная супербел. 14кг', 'be9d3a6a-2b8c-11e5-80c2-00155d3703e1', 0, 61, 66, 'Краска акриловая для стен и потолков моющаяся предназначена для высококачественной окраски стен и потолков внутри бытовых и производственных помещений с повышенной эксплуатационной нагрузкой, требующих частой влажной уборки с применением моющих и дезинфицирующих средств.', 1),
('c0175916-fbe7-11e0-b702-001cc494be80', 'Краска ВД-АК 2180 "Новые технологии" моющаяся супербел. 6кг', 'be9d3a6a-2b8c-11e5-80c2-00155d3703e1', 0, 101, 60, 'Краска акриловая для стен и потолков моющаяся предназначена для высококачественной окраски стен и потолков внутри бытовых и производственных помещений с повышенной эксплуатационной нагрузкой, требующих частой влажной уборки с применением моющих и дезинфицирующих средств.', 1),
('c0175918-fbe7-11e0-b702-001cc494be80', 'Краска ВД-АК 2180 "Новые технологии" моющаяся супербел. 14кг', 'be9d3a6a-2b8c-11e5-80c2-00155d3703e1', 0, 21, 70, 'Краска акриловая для стен и потолков моющаяся предназначена для высококачественной окраски стен и потолков внутри бытовых и производственных помещений с повышенной эксплуатационной нагрузкой, требующих частой влажной уборки с применением моющих и дезинфицирующих средств.', 1),
('c017591a-fbe7-11e0-b702-001cc494be80', 'Краска ВД-АК 1180 "Новые технологии" фасадная супербел. 3кг', 'be9d3a6a-2b8c-11e5-80c2-00155d3703e1', 0, 220, 83, 'Краска акриловая фасадная предназначена для высококачественной окраски фасадов зданий и сооружений, а также для окраски стен и потолков внутри помещений. Краска обладает повышенной износостойкостью, влагостойкостью и атмосферостойкостью. Краску можно наносить на бетонные, кирпичные, заштукатуренные, зашпатлеванные и прочие минеральные поверхности, а также на гипсокартон, дерево, двп, дсп и обои под покраску.\n', 1),
('c017591c-fbe7-11e0-b702-001cc494be80', 'Краска ВД-АК 1180 "Новые технологии" фасадная супербел. 6кг', 'be9d3a6a-2b8c-11e5-80c2-00155d3703e1', 0, 157, 62, 'Краска акриловая фасадная предназначена для высококачественной окраски фасадов зданий и сооружений, а также для окраски стен и потолков внутри помещений. Краска обладает повышенной износостойкостью, влагостойкостью и атмосферостойкостью. Краску можно наносить на бетонные, кирпичные, заштукатуренные, зашпатлеванные и прочие минеральные поверхности, а также на гипсокартон, дерево, двп, дсп и обои под покраску.\n', 1),
('c017591e-fbe7-11e0-b702-001cc494be80', 'Краска ВД-АК 1180 "Новые технологии" фасадная супербел. 14кг', 'be9d3a6a-2b8c-11e5-80c2-00155d3703e1', 0, 105, 77, 'Краска акриловая фасадная предназначена для высококачественной окраски фасадов зданий и сооружений, а также для окраски стен и потолков внутри помещений. Краска обладает повышенной износостойкостью, влагостойкостью и атмосферостойкостью. Краску можно наносить на бетонные, кирпичные, заштукатуренные, зашпатлеванные и прочие минеральные поверхности, а также на гипсокартон, дерево, двп, дсп и обои под покраску.\n', 1),
('c2d90e40-f78f-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 20кг Красный', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 6, 0, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('c4df9e0d-00c0-11e2-a554-005056be3bd8', 'Молотковая грунт-эмаль по ржавчине коричневая 0,75л  DALI', '569e2345-ff83-11e4-9228-005056be1f7a', 0, 79, 31, 'Применяется по любым металлическим поверхностям: решетки, ограды, гаражи, различные металлоконструкции, автомобильные детали и др. внутри помещений и в условиях атмосферного воздействия.', 1),
('c4df9e0f-00c0-11e2-a554-005056be3bd8', 'Молотковая грунт-эмаль по ржавчине медная 0,75л  DALI', '569e2345-ff83-11e4-9228-005056be1f7a', 0, 31, 31, 'Применяется по любым металлическим поверхностям: решетки, ограды, гаражи, различные металлоконструкции, автомобильные детали и др. внутри помещений и в условиях атмосферного воздействия.', 1),
('c4df9e11-00c0-11e2-a554-005056be3bd8', 'Молотковая грунт-эмаль по ржавчине серебристая 0,75л  DALI', '569e2345-ff83-11e4-9228-005056be1f7a', 0, 65, 31, 'Применяется по любым металлическим поверхностям: решетки, ограды, гаражи, различные металлоконструкции, автомобильные детали и др. внутри помещений и в условиях атмосферного воздействия.', 1),
('c4df9e13-00c0-11e2-a554-005056be3bd8', 'Молотковая грунт-эмаль по ржавчине серая 0,75л  DALI', '569e2345-ff83-11e4-9228-005056be1f7a', 0, 43, 31, 'Применяется по любым металлическим поверхностям: решетки, ограды, гаражи, различные металлоконструкции, автомобильные детали и др. внутри помещений и в условиях атмосферного воздействия.', 1),
('c6d784e3-f78e-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 6кг Вишневый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 13, 12, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('c9d25e2b-f787-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 0,8кг Бирюзовый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 151, 61, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('ca79b0fb-f78f-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 20кг Бирюзовый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 7, 0, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('cb22e29d-68ed-11dd-b117-000e0c431b58', 'Биосепт-УЛЬТРА антисептический состав  10л', '569e2343-ff83-11e4-9228-005056be1f7a', 0, 59, 52, 'Предназначен для усиленной длительной защиты конструкций и изделий из древесины от поражения плесенью, деревоокрашивающими, дереворазрушающими грибками и насекомыми. Применяется в особо тяжелых условиях: при непосредственном контакте с влажным грунтом, при интенсивном воздействии гигроскопической, конденсационной, атмосферной и почвенной влаги и т.п. Применяется как снаружи, так и внутри помещений, в том числе в особо тяжелых условиях, включая контакт с влажным грунтом', 1),
('cb22e29f-68ed-11dd-b117-000e0c431b58', 'Биосепт-УЛЬТРА антисептический состав  5л', '569e2343-ff83-11e4-9228-005056be1f7a', 0, 83, 53, 'Предназначен для усиленной длительной защиты конструкций и изделий из древесины от поражения плесенью, деревоокрашивающими, дереворазрушающими грибками и насекомыми. Применяется в особо тяжелых условиях: при непосредственном контакте с влажным грунтом, при интенсивном воздействии гигроскопической, конденсационной, атмосферной и почвенной влаги и т.п. Применяется как снаружи, так и внутри помещений, в том числе в особо тяжелых условиях, включая контакт с влажным грунтом', 1),
('cce4b552-7f46-11e3-af7c-005056be1f7b', 'Краска латексная PARADE R3 база А Бел. ма. 2,5л Россия', 'be9d3a6a-2b8c-11e5-80c2-00155d3703e1', 0, 27, 51, 'Матовая краска для стен и потолков любых типов помещений, в т.ч. с высокой эксплуатационной нагрузкой, требующие частой влажной уборки, а также фасадных элементов.', 1),
('cce7530f-27b6-11dd-942f-000e0c431b58', 'Огнебиозащитный состав КСД  (23кг)', '569e2343-ff83-11e4-9228-005056be1f7a', 0, 47, 23, 'Предназначен для комплексной защиты древесины, а также текстильных материалов. Состав защищает древесину от возгорания, распространения пламени, гниения, синевы, плесени а также поражения любыми видами биологических разрушителей внутри помещений, на открытом воздухе (под навесом).', 1),
('ce1ffcf9-f78e-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 6кг Красный', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 18, 12, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('ce813bcf-2257-11e1-ae36-001cc494be80', 'Краска ВД-АК 2180 "Новые технологии" интерьерная супербел. 1,3кг', 'be9d3a6a-2b8c-11e5-80c2-00155d3703e1', 0, 211, 89, 'Краска акриловая для стен и потолков моющаяся предназначена для высококачественной окраски стен и потолков внутри бытовых и производственных помещений с повышенной эксплуатационной нагрузкой, требующих частой влажной уборки с применением моющих и дезинфицирующих средств.', 1),
('ce813bd1-2257-11e1-ae36-001cc494be80', 'Краска ВД-АК 2180 "Новые технологии" моющаяся супербел. 1,3кг', 'be9d3a6a-2b8c-11e5-80c2-00155d3703e1', 0, 106, 82, 'Краска акриловая для стен и потолков моющаяся предназначена для высококачественной окраски стен и потолков внутри бытовых и производственных помещений с повышенной эксплуатационной нагрузкой, требующих частой влажной уборки с применением моющих и дезинфицирующих средств.', 1),
('ceef00fe-c7d1-11e4-85d3-005056be1f7b', 'Сетка д/фасадных работ (4х4) 1х50пм 165г/м2 ( Россия)', '6beba4d6-03ad-11e5-bad4-005056be1f7a', 0, 131, 12, '', 1),
('cf6aa526-48b8-11dd-9342-000e0c431b58', 'Эмаль универсальная бронза 520 мл.', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 81, 48, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \n', 1),
('d0659fe4-f787-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 0,8кг Зеленый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 246, 63, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('d1aa2ade-a3ef-11e1-ad4e-005056be3bd8', 'Очиститель Cosmofen-10 1л', '72429777-ff83-11e4-9228-005056be1f7a', 0, 27, 28, 'Очиститель нерастворяющий с антистатиком применяется для профессиональной чистки профелей из жесткого ПВХ, плат из вспененного твердого ПВХ, полиуретана и профелей кешированных ренолитной пленкой. Особенно хорош для очистки поверхности от пыли, остатков защитной пленки, жирных карандашей, следов резины, свежей полиуретановой пены и свежих остатков герметиков, таких как смола/битум. Оказывает хорошее действие на многие синтетические поверхности и в сочетании с антистатиком особенно хорош для выставочных и рекламных конструкций.', 1),
('d1eaa4c2-f78f-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 20кг Зеленый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 5, 0, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('d5823752-947b-11e3-8d88-005056be1f7b', 'Штукатурка фактурная декоративная с эффектом "шубы" Белый 15кг', '6aa6af7c-ff83-11e4-9228-005056be1f7a', 0, 7, 18, 'Готовая к применению декоративная штукатурка повышенной белизны на основе водной акриловой дисперсии. Образует на поверхности рельеф в виде «шубы». Скрывает небольшие неровности основания. Легко наносится валиком. Создает прочное влагостойкое, паропроницаемое покрытие, стойкое к атмосферным воздействиям и эксплуатационным нагрузкам. Обладает отличной адгезией к поверхностям из бетона, камня, гипса, цемента, кирпича, ДСП, ДВП. Не содержит растворителей, без запаха. Допускает мытье окрашенной поверхности.', 1),
('d63bb09c-055c-11dd-b9c0-000e0c431b58', 'Краска фасадная "PARADE" F20  База  С Бесцветный 9л', 'be9d3a6a-2b8c-11e5-80c2-00155d3703e1', 0, 345, 29, 'Акриловая краска Parade F20 предназначена для фасадных работ по бетонным, кирпичным, оштукатуренным и другим поверхностям. Супербелая, матовая, колеруется пастами для водных красок. Разбавляется водой. Хранить в оригинальной упаковке при температуре выше 0°C в течение 12 месяцев. Выпускается расфасованной в ведра по 2,5 л, 5 л и 10 л.', 1),
('d72ce04c-7f46-11e3-af7c-005056be1f7b', 'Краска латексная PARADE R3 база А Бел. ма. 5л Россия', 'be9d3a6a-2b8c-11e5-80c2-00155d3703e1', 0, 19, 36, 'Матовая краска для стен и потолков любых типов помещений, в т.ч. с высокой эксплуатационной нагрузкой, требующие частой влажной уборки, а также фасадных элементов.', 1),
('d76b7387-f78e-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 6кг Бирюзовый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 15, 12, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('d9eaaa65-f78f-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 20кг Светло-зеленый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 7, 1, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('da49edc1-58f9-11e0-894e-000e0c431b58', 'Грунт-эмаль по ржавчине белая 10л  DALI', '569e2345-ff83-11e4-9228-005056be1f7a', 0, 0, 0, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('da49edc3-58f9-11e0-894e-000e0c431b58', 'Грунт-эмаль по ржавчине зеленая 10л  DALI', '569e2345-ff83-11e4-9228-005056be1f7a', 0, 0, 0, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('da49edc5-58f9-11e0-894e-000e0c431b58', 'Грунт-эмаль по ржавчине коричневая 10л  DALI', '569e2345-ff83-11e4-9228-005056be1f7a', 0, 0, 0, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('da49edc7-58f9-11e0-894e-000e0c431b58', 'Грунт-эмаль по ржавчине красно-коричневая 10л  DALI', '569e2345-ff83-11e4-9228-005056be1f7a', 0, 11, 3, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('da49edc9-58f9-11e0-894e-000e0c431b58', 'Грунт-эмаль по ржавчине серая 10л  DALI', '569e2345-ff83-11e4-9228-005056be1f7a', 0, 37, 0, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('da49edcb-58f9-11e0-894e-000e0c431b58', 'Грунт-эмаль по ржавчине черная 10л  DALI', '569e2345-ff83-11e4-9228-005056be1f7a', 0, 15, 7, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('ddd32665-666b-11dc-be42-000e0c431b58', 'Краска акрил. "PARADE" W110 для обоев Бел.мат. БАЗА А 9л', 'be9d3a6a-2b8c-11e5-80c2-00155d3703e1', 0, 104, 56, 'Краска акриловая водно-дисперсионная для обоев Parade W110 предназначена для окраски всех видов обоев под покраску, структурно-волокнистых и стеклообоев, а также бетонных, кирпичных, оштукатуренных, деревянных, цементных, гипсовых и гипсокартонных поверхностей стен и потолков в помещениях с нормальной и повышенной влажностью, подвергающихся сильным эксплуатационным нагрузкам.', 1),
('ddd3266a-666b-11dc-be42-000e0c431b58', 'Краска фасадная "PARADE" F20 Бел. мат.База  А 2,5л', 'be9d3a6a-2b8c-11e5-80c2-00155d3703e1', 0, 351, 71, 'Акриловая краска Parade F20 предназначена для фасадных работ по бетонным, кирпичным, оштукатуренным и другим поверхностям. Супербелая, матовая, колеруется пастами для водных красок. Разбавляется водой. Хранить в оригинальной упаковке при температуре выше 0°C в течение 12 месяцев. Выпускается расфасованной в ведра по 2,5 л, 5 л и 10 л.', 1),
('ddd3266c-666b-11dc-be42-000e0c431b58', 'Краска фасадная "PARADE" F20 Бел. мат.База  А 5л', 'be9d3a6a-2b8c-11e5-80c2-00155d3703e1', 0, 286, 62, 'Акриловая краска Parade F20 предназначена для фасадных работ по бетонным, кирпичным, оштукатуренным и другим поверхностям. Супербелая, матовая, колеруется пастами для водных красок. Разбавляется водой. Хранить в оригинальной упаковке при температуре выше 0°C в течение 12 месяцев. Выпускается расфасованной в ведра по 2,5 л, 5 л и 10 л.', 1),
('ddd32674-666b-11dc-be42-000e0c431b58', 'Краска акрил. "PARADE" W110 для обоев Бел. мат. База  А 2,5л', 'be9d3a6a-2b8c-11e5-80c2-00155d3703e1', 0, 108, 49, 'Краска акриловая водно-дисперсионная для обоев Parade W110 предназначена для окраски всех видов обоев под покраску, структурно-волокнистых и стеклообоев, а также бетонных, кирпичных, оштукатуренных, деревянных, цементных, гипсовых и гипсокартонных поверхностей стен и потолков в помещениях с нормальной и повышенной влажностью, подвергающихся сильным эксплуатационным нагрузкам.', 1),
('ddd32676-666b-11dc-be42-000e0c431b58', 'Краска акрил. "PARADE" W110 для обоев Бел. мат.База  А  5л', 'be9d3a6a-2b8c-11e5-80c2-00155d3703e1', 0, 91, 46, 'Краска акриловая водно-дисперсионная для обоев Parade W110 предназначена для окраски всех видов обоев под покраску, структурно-волокнистых и стеклообоев, а также бетонных, кирпичных, оштукатуренных, деревянных, цементных, гипсовых и гипсокартонных поверхностей стен и потолков в помещениях с нормальной и повышенной влажностью, подвергающихся сильным эксплуатационным нагрузкам.', 1),
('de1409cf-f787-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 0,8кг Светло-зеленый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 147, 59, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('de9b7b14-7f46-11e3-af7c-005056be1f7b', 'Краска латексная PARADE R3 база А Бел. ма. 9л Россия', 'be9d3a6a-2b8c-11e5-80c2-00155d3703e1', 0, 25, 44, 'Матовая краска для стен и потолков любых типов помещений, в т.ч. с высокой эксплуатационной нагрузкой, требующие частой влажной уборки, а также фасадных элементов.', 1),
('df210450-93af-11e3-82a4-005056be1f7b', 'Грунт-эмаль по ржавчине жёлтый 0,75л  DALI', '569e2345-ff83-11e4-9228-005056be1f7a', 0, 63, 34, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('df2d81cd-f78e-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 6кг Зеленый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 21, 12, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('e017a0ce-f78d-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 1,9кг Оранжевый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 105, 47, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('e02ebd60-99a6-11db-937f-000e0c431b59', 'Клей ПВА "Люкс" мебельный 0,9кг ("Лакра")', '3df545ee-03aa-11e5-bad4-005056be1f7a', 0, 102, 69, 'Предназначен для профессионального применения в деревообрабатывающей и полиграфической промышленности, а также для ответственных видов работ в быту, в которых предъявляются высокие требования к прочности склейки. Рекомендуется для работ, где шов склеивания подвергается большим динамическим нагрузкам. Подходит для склеивания всех пород дерева, переплетных работ. Применяется при сборке и ремонте мебели, приклеивании шпона. ', 1),
('e02ebd64-99a6-11db-937f-000e0c431b59', 'Клей ПВА "Люкс" мебельный 2,3кг ("Лакра")', '3df545ee-03aa-11e5-bad4-005056be1f7a', 0, 116, 54, 'Предназначен для профессионального применения в деревообрабатывающей и полиграфической промышленности, а также для ответственных видов работ в быту, в которых предъявляются высокие требования к прочности склейки. Рекомендуется для работ, где шов склеивания подвергается большим динамическим нагрузкам. Подходит для склеивания всех пород дерева, переплетных работ. Применяется при сборке и ремонте мебели, приклеивании шпона. ', 1),
('e02ebd66-99a6-11db-937f-000e0c431b59', 'Клей ПВА "Люкс" мебельный 40кг ("Лакра")', '3df545ee-03aa-11e5-bad4-005056be1f7a', 0, 0, 0, 'Предназначен для профессионального применения в деревообрабатывающей и полиграфической промышленности, а также для ответственных видов работ в быту, в которых предъявляются высокие требования к прочности склейки. Рекомендуется для работ, где шов склеивания подвергается большим динамическим нагрузкам. Подходит для склеивания всех пород дерева, переплетных работ. Применяется при сборке и ремонте мебели, приклеивании шпона. ', 1),
('e02ebd6a-99a6-11db-937f-000e0c431b59', 'Клей ПВА М "Экстра"  0,9кг  ("Лакра")', '3df545ee-03aa-11e5-bad4-005056be1f7a', 0, 133, 76, 'Рекомендуется для столярных работ: склеивания деревянных конструкций, мебели, приклеивания линолеума (на тканой основе), прочной склейки изделий из кожи, прочного картона, бумаги и т.п.', 1),
('e02ebd6c-99a6-11db-937f-000e0c431b59', 'Клей ПВА М "Экстра"  2,3кг  ("Лакра")', '3df545ee-03aa-11e5-bad4-005056be1f7a', 0, 67, 56, 'Рекомендуется для столярных работ: склеивания деревянных конструкций, мебели, приклеивания линолеума (на тканой основе), прочной склейки изделий из кожи, прочного картона, бумаги и т.п.', 1),
('e02ebd6e-99a6-11db-937f-000e0c431b59', 'Клей ПВА М "Экстра"  4кг  ("Лакра")', '3df545ee-03aa-11e5-bad4-005056be1f7a', 0, 57, 35, 'Рекомендуется для столярных работ: склеивания деревянных конструкций, мебели, приклеивания линолеума (на тканой основе), прочной склейки изделий из кожи, прочного картона, бумаги и т.п.', 1),
('e02ebd70-99a6-11db-937f-000e0c431b59', 'Клей ПВА М "Экстра" 10кг  ("Лакра")', '3df545ee-03aa-11e5-bad4-005056be1f7a', 0, 145, 18, 'Рекомендуется для столярных работ: склеивания деревянных конструкций, мебели, приклеивания линолеума (на тканой основе), прочной склейки изделий из кожи, прочного картона, бумаги и т.п.', 1),
('e02ebd72-99a6-11db-937f-000e0c431b59', 'Клей ПВА М "Экстра" 40кг  ("Лакра")', '3df545ee-03aa-11e5-bad4-005056be1f7a', 0, 0, 0, '', 1),
('e02ebd74-99a6-11db-937f-000e0c431b59', 'Клей ПВА Мастер универсальный  2,3кг  ("Лакра")', '3df545ee-03aa-11e5-bad4-005056be1f7a', 0, 78, 57, 'Рекомендуется для склеивания изделий из дерева, не подвергающихся механическим нагрузкам, кожи, картона, бумаги и т.п.', 1),
('e02ebd76-99a6-11db-937f-000e0c431b59', 'Клей ПВА строительно-универсальный  0,9кг  ("Лакра")', '3df545ee-03aa-11e5-bad4-005056be1f7a', 0, 185, 82, 'Рекомендуется для следующих видов работ: приклеивания изделий из картона, бумаги, тканей, декоративной пленки (клеенки) на бумажной и полимерной основе, строительных элементов (серпянки и т.д.), подклейки бумажных обоев и т.п.', 1),
('e02ebd78-99a6-11db-937f-000e0c431b59', 'Клей ПВА строительно-универсальный  2,3кг  ("Лакра")', '3df545ee-03aa-11e5-bad4-005056be1f7a', 0, 134, 61, 'Рекомендуется для следующих видов работ: приклеивания изделий из картона, бумаги, тканей, декоративной пленки (клеенки) на бумажной и полимерной основе, строительных элементов (серпянки и т.д.), подклейки бумажных обоев и т.п.', 1),
('e02ebd7a-99a6-11db-937f-000e0c431b59', 'Клей ПВА строительно-универсальный  4кг  ("Лакра")', '3df545ee-03aa-11e5-bad4-005056be1f7a', 0, 119, 40, 'Рекомендуется для следующих видов работ: приклеивания изделий из картона, бумаги, тканей, декоративной пленки (клеенки) на бумажной и полимерной основе, строительных элементов (серпянки и т.д.), подклейки бумажных обоев и т.п.', 1),
('e02ebd7c-99a6-11db-937f-000e0c431b59', 'Клей ПВА строительно-универсальный 10кг  ("Лакра")', '3df545ee-03aa-11e5-bad4-005056be1f7a', 0, 63, 25, 'Рекомендуется для следующих видов работ: приклеивания изделий из картона, бумаги, тканей, декоративной пленки (клеенки) на бумажной и полимерной основе, строительных элементов (серпянки и т.д.), подклейки бумажных обоев и т.п.', 1),
('e02ebd7e-99a6-11db-937f-000e0c431b59', 'Клей ПВА строительно-универсальный 38кг  ("Лакра")', '3df545ee-03aa-11e5-bad4-005056be1f7a', 0, 0, 0, 'Рекомендуется для следующих видов работ: приклеивания изделий из картона, бумаги, тканей, декоративной пленки (клеенки) на бумажной и полимерной основе, строительных элементов (серпянки и т.д.), подклейки бумажных обоев и т.п.', 1),
('e02ebdc0-99a6-11db-937f-000e0c431b59', 'Герметик "KRASS" акриловый Белый  300 мл', '18c0600b-03aa-11e5-bad4-005056be1f7a', 0, 447, 354, 'Для внутренних работ. Заделка трещин в бетоне, штукатурке, кирпичной кладке и древесине. Герметизация оконных и дверных коробок, подоконников, лестниц. Выравнивание небольших оштукатуренных поверхностей перед их покраской.', 1),
('e02ebdc3-99a6-11db-937f-000e0c431b59', 'Герметик "KRASS" для бетона и натурального камня Бесцветный 300мл', '18c0600b-03aa-11e5-bad4-005056be1f7a', 0, 318, 156, 'Для внутренних и наружных строительных работ. Уплотнение трещин в бетоне , кирпиче, граните и других натуральных камнях и поверхностях при внутренних и наружных работах. Герметизация швов на фасаде зданий. Уплотнение стыков между стеной и подоконником. Облицовочные работы.', 1),
('e02ebdc6-99a6-11db-937f-000e0c431b59', 'Герметик "KRASS" для бетона и натурального камня Серый 300мл', '18c0600b-03aa-11e5-bad4-005056be1f7a', 0, 105, 156, 'Для внутренних и наружных строительных работ. Уплотнение трещин в бетоне , кирпиче, граните и других натуральных камнях и поверхностях при внутренних и наружных работах. Герметизация швов на фасаде зданий. Уплотнение стыков между стеной и подоконником. Облицовочные работы.', 1),
('e02ebdcc-99a6-11db-937f-000e0c431b59', 'Герметик "KRASS" для каминов и печей Черный 300мл', '18c0600b-03aa-11e5-bad4-005056be1f7a', 0, 291, 150, 'Герметизация швов, стыков в местах, подверженных действию высоких температур (до 1250°С). Уплотнение швов вокруг печей, дымоходов и каминов. Ремонт строительных элементов, подверженных действию огня. Стыки в вентиляционных каналах. ', 1),
('e12e57a9-f78f-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 20кг Синий', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 1, 1, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('e213c98a-ccbb-11e4-a1f9-005056be1f7b', 'Сольвент АЛТ 602/218 400 гр.', '72429777-ff83-11e4-9228-005056be1f7a', 0, 17, 48, 'Растворитель предназначен для разбавления лакокрасочных материалов и шпатлевок на основе: нитратоцелюлозных, нитратоцелюлозно-глифталевых, эпоксидных, нитратцелюлозно-эпоксидных, мочевино (меламино) формальдегидных, кремнеорганических (НЦ, ЭП, КО, МЧ, МС) и других лакокрасочных материалов.', 1),
('e242e97f-f29b-11dd-9439-000e0c431b58', 'Краска ВД акриловая фасадная всесезонная База А DALI 9л (Рогнеда)', 'be9d3a6a-2b8c-11e5-80c2-00155d3703e1', 0, 46, 21, 'КРАСКА ДАЛИ ФАСАДНАЯ ВСЕСЕЗОННАЯ DALI органорастворимая предназначена для высококачественной отделки фасадов при температуре воздуха до -20 С. Может применяться для ответственного окрашивания поверхностей на основе бетона, штукатурки, ДСП, ацеита, кирпича, пенобетона, дерева во всех климатических поясах, в том числе и в регионах со сложными атмосферными условиями. ', 1),
('e2e51024-e980-11e4-ab92-005056be1f7b', 'Краска латексная PARADE R20 база С П/мат 2,5л', 'be9d3a6a-2b8c-11e5-80c2-00155d3703e1', 0, 9, 0, 'Краска интерьерная латексная суперстойкая полуматовая. Высококачественная латексная интерьерная краска с исключительными показателями водостойкости, стойкости к мытью и мокрому истиранию.', 1),
('e39c5eb8-24d0-11e2-8158-005056be3bd8', 'Огнебиозащитный состав Корд 200кг', '569e2343-ff83-11e4-9228-005056be1f7a', 0, 0, 0, 'Предназначен для комплексной защиты древесины, а также текстильных материалов. Состав защищает древесину от возгорания, распространения пламени, гниения, синевы, плесени а также поражения любыми видами биологических разрушителей внутри помещений, на открытом воздухе (под навесом).', 1),
('e4020814-4598-11e1-8212-001cc494be80', 'Краска ВД латексная д/кухни и ванной DALI 9л БАЗА С (Рогнеда)', 'be9d3a6a-2b8c-11e5-80c2-00155d3703e1', 0, 0, 0, 'Латексная акриловая краска для декоративного окрашивания стен и потолков в жилых и общественных помещениях с повышенной влажностью воздуха и эксплуатационной нагрузкой. Применяется внутри помещений по минеральным поверхностям (бетон, кирпич, гипс, цемент, гипсокартон, шпатлевка, штукатурка и др.).', 1),
('e545e44e-298d-11e2-8829-005056be3bd8', 'Огнебиозащитный состав Корд 23кг', '569e2343-ff83-11e4-9228-005056be1f7a', 0, 0, 0, 'Состав для огнезащитной обработки древесины и защиты древесины, находящейся в нормальных условиях эксплуатации  от биопоражений. Применяется внутри помещений и снаружи «под навесом» по новым или старым деревянным поверхностям и материалам на основе древесины (ДВП, ДСП, фанера др.)', 1),
('e545e450-298d-11e2-8829-005056be3bd8', 'Огнебиозащитный состав Корд 10кг', '569e2343-ff83-11e4-9228-005056be1f7a', 0, 0, 0, 'Состав для огнезащитной обработки древесины и защиты древесины, находящейся в нормальных условиях эксплуатации  от биопоражений. Применяется внутри помещений и снаружи «под навесом» по новым или старым деревянным поверхностям и материалам на основе древесины (ДВП, ДСП, фанера др.)', 1),
('e63d2bae-f78d-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 1,9кг Желтый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 58, 48, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('e68fd7da-99a6-11db-937f-000e0c431b59', 'Герметик "KRASS" для металла Бесцветный 300мл', '18c0600b-03aa-11e5-bad4-005056be1f7a', 0, 708, 162, 'Отличная адгезия к алюминию, железу, стали и другим металлическим поверхностям. Не вызывает коррозии у металлов (железо, сталь, алюминий, цинк). Шов не темнеет со временем, устойчив к деформации и нагрузкам. Водонепроницаем. Устойчив к атмосферным воздействиям и UV лучам.', 1),
('e68fd7dc-99a6-11db-937f-000e0c431b59', 'Герметик "KRASS" для металла Серый 300мл', '18c0600b-03aa-11e5-bad4-005056be1f7a', 0, 778, 162, 'Отличная адгезия к алюминию, железу, стали и другим металлическим поверхностям. Не вызывает коррозии у металлов (железо, сталь, алюминий, цинк). Шов не темнеет со временем, устойчив к деформации и нагрузкам. Водонепроницаем. Устойчив к атмосферным воздействиям и UV лучам.', 1),
('e68fd7df-99a6-11db-937f-000e0c431b59', 'Герметик "KRASS" по дереву Parquet БУК 300мл', '18c0600b-03aa-11e5-bad4-005056be1f7a', 0, 162, 170, 'Заделка и уплотнение соединений, щелей, зазоров в паркете, плинтусах, деревянном полу, стенах и других конструкциях. Уплотнение оконных и дверных рам с внутренней стороны.', 1),
('e68fd7e2-99a6-11db-937f-000e0c431b59', 'Герметик "KRASS" по дереву Parquet ДУБ 300мл', '18c0600b-03aa-11e5-bad4-005056be1f7a', 0, 214, 170, 'Заделка и уплотнение соединений, щелей, зазоров в паркете, плинтусах, деревянном полу, стенах и других конструкциях. Уплотнение оконных и дверных рам с внутренней стороны.', 1),
('e68fd7e4-99a6-11db-937f-000e0c431b59', 'Герметик "KRASS" по дереву Parquet ДУБ темный 300мл', '18c0600b-03aa-11e5-bad4-005056be1f7a', 0, 240, 158, 'Заделка и уплотнение соединений, щелей, зазоров в паркете, плинтусах, деревянном полу, стенах и других конструкциях. Уплотнение оконных и дверных рам с внутренней стороны.', 1),
('e68fd7e6-99a6-11db-937f-000e0c431b59', 'Герметик "KRASS" по дереву Parquet СОСНА 300мл', '18c0600b-03aa-11e5-bad4-005056be1f7a', 0, 137, 170, 'Заделка и уплотнение соединений, щелей, зазоров в паркете, плинтусах, деревянном полу, стенах и других конструкциях. Уплотнение оконных и дверных рам с внутренней стороны.', 1),
('e68fd7e9-99a6-11db-937f-000e0c431b59', 'Герметик "KRASS" сил. Aqua-Silicon Бесцветный  300 мл', '18c0600b-03aa-11e5-bad4-005056be1f7a', 0, 311, 176, 'Предназначен для герметизации и уплотнения аквариумов, склеивания витрин, стеклянных шкафов. Высокая эластичность шва. Является однокомпонентным, быстротвердеющим высокомодульным герметиком, который в реакции с атмосферной влагой образует эластичный, безусадочный, выдерживающий большие нагрузки, шов.', 1),
('e68fd7ec-99a6-11db-937f-000e0c431b59', 'Герметик "KRASS" сил. Aqua-Silicon Черный  300 мл', '18c0600b-03aa-11e5-bad4-005056be1f7a', 0, 213, 170, 'Предназначен для герметизации и уплотнения аквариумов, склеивания витрин, стеклянных шкафов. Высокая эластичность шва. Является однокомпонентным, быстротвердеющим высокомодульным герметиком, который в реакции с атмосферной влагой образует эластичный, безусадочный, выдерживающий большие нагрузки, шов.', 1),
('e68fd7ee-99a6-11db-937f-000e0c431b59', 'Герметик "KRASS" сил. нейтрал. Белый   300 мл', '18c0600b-03aa-11e5-bad4-005056be1f7a', 0, 50, 221, 'Незаменим для склеивания строительных материалов с гладкой и пористой поверхностью, металлов, бетона. Дает минимальную усадку. Превосходно склеивает поверхности в помещениях с высокой влажностью. Не обесцвечивает окрашенные поверхности. Рекомендуется строителями профессионалами.', 1),
('e68fd7f1-99a6-11db-937f-000e0c431b59', 'Герметик "KRASS" сил. нейтрал. Бесцветный   300 мл', '18c0600b-03aa-11e5-bad4-005056be1f7a', 0, 12, 209, 'Незаменим для склеивания строительных материалов с гладкой и пористой поверхностью, металлов, бетона. Дает минимальную усадку. Герметик силиконовый KRASS превосходно склеивает поверхности в помещениях с высокой влажностью. Не обесцвечивает окрашенные поверхности. Рекомендуется строителями профессионалами.', 1),
('e68fd7f3-99a6-11db-937f-000e0c431b59', 'Герметик "KRASS" сил. САНИТАРНЫЙ Белый   300 мл', '18c0600b-03aa-11e5-bad4-005056be1f7a', 0, 149, 344, 'Изготовлен на основе силикона и обладает сильным противогрибковым действием, препятствует появлению плесени, гнили и разного рода микроорганизмов. Он используется в условиях повышенной влажности (ванные комнаты, бани и т.д.), в канализационных и водоподающих сетях. Подходит для остеклительных работ и обработки подвижных/неподвижных швов снаружи и внутри зданий.', 1),
('e68fd7f5-99a6-11db-937f-000e0c431b59', 'Герметик "KRASS" сил. САНИТАРНЫЙ Бесцветный  300 мл', '18c0600b-03aa-11e5-bad4-005056be1f7a', 0, 126, 344, 'Изготовлен на основе силикона и обладает сильным противогрибковым действием, препятствует появлению плесени, гнили и разного рода микроорганизмов. Он используется в условиях повышенной влажности (ванные комнаты, бани и т.д.), в канализационных и водоподающих сетях. Подходит для остеклительных работ и обработки подвижных/неподвижных швов снаружи и внутри зданий.', 1),
('e68fd7fa-99a6-11db-937f-000e0c431b59', 'Герметик "KRASS" сил. Универс. Белый   300 мл', '18c0600b-03aa-11e5-bad4-005056be1f7a', 0, 560, 372, 'Обеспечивает отличное сцепление поверхностей из стекла, эмали, пластика, металла, керамике, дерева. Содержит противогрибковый компонент, препятствующий гниению, образованию плесени, грибков. Применяется в помещениях с повышенной влажностью.', 1),
('e68fd7fc-99a6-11db-937f-000e0c431b59', 'Герметик "KRASS" сил. Универс. Бесцветный  300 мл', '18c0600b-03aa-11e5-bad4-005056be1f7a', 0, 1587, 384, 'Обеспечивает отличное сцепление поверхностей из стекла, эмали, пластика, металла, керамике, дерева. Содержит противогрибковый компонент, препятствующий гниению, образованию плесени, грибков. Применяется в помещениях с повышенной влажностью.', 1),
('e755f307-f787-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 0,8кг Синий', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 129, 63, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('e7f145bb-f78f-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 20кг Голубой', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 10, 1, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('e8976171-93af-11e3-82a4-005056be1f7b', 'Грунт-эмаль по ржавчине жёлтый 2л  DALI', '569e2345-ff83-11e4-9228-005056be1f7a', 0, 162, 30, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('e93b4d96-f3cd-11df-ab71-000e0c431b58', 'Скотч. 50мм*50м малярный', '79206b59-03ad-11e5-bad4-005056be1f7a', 0, 2447, 710, '', 1),
('e93b4d9a-f3cd-11df-ab71-000e0c431b58', 'Двухсторонний скотч  50мм*25м (ткань)', '79206b59-03ad-11e5-bad4-005056be1f7a', 0, 104, 45, '', 1),
('e93b4d9e-f3cd-11df-ab71-000e0c431b58', 'Скотч алюминиевый 50ммх50м', '79206b59-03ad-11e5-bad4-005056be1f7a', 0, 124, 55, '', 1),
('e9f3fc4e-47c0-11dc-8bad-000e0c431b58', 'Краска фасадная "PARADE" F50 база А  Бел. мат. 9л ', 'be9d3a6a-2b8c-11e5-80c2-00155d3703e1', 0, 105, 32, 'Краска на основе смол Pliolite Parade F50 предназначена для наружных работ по бетону, цементу, фиброцементу, шпатлевкам, минеральным штукатуркам, щелочным поверхностям, кирпичу, камню, гипсу, металлу (с антикоррозионным грунтом), сухому дереву и пр., а также по ранее окрашенным поверхностям.', 1),
('eb8ca588-9b09-11e4-a80c-005056be1f7b', 'Frap F70-1 Эксцентрик', '12bcb99c-0399-11e5-bad4-005056be1f7a', 0, 40, 50, '', 1),
('ebcc7a29-f78e-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 6кг Светло-зеленый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 24, 12, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('ece048eb-fbaf-11e0-b702-001cc494be80', 'Краска ВД-АК "Водоэмульсионка.рф" интерьер. супербел. 6кг', 'be9d3a6a-2b8c-11e5-80c2-00155d3703e1', 0, 0, 55, 'Краска акриловая потолочная предназначена для выполнения высококачественной окраски потолков внутри помещений с нормальной влажностью: Гостиные комнаты, спальни, детские комнаты, а также общественные и производственные помещения. Краска обладает идеальной белизной. Легко наносится на поверхность потолка без подтеков, брызг и разводов. Быстро сохнет. После нанесения образует ровную матовую поверхность. Скрывает микронеровности потолка. «Дышащее покрытие». Не желтеет. Не мелит. Без запаха. Гипоаллергенная. Устойчива к сухой уборке. Морозостойкая.', 1),
('ece048ee-fbaf-11e0-b702-001cc494be80', 'Краска ВД-АК "Водоэмульсионка.рф" интерьер. супербел. 13кг', 'be9d3a6a-2b8c-11e5-80c2-00155d3703e1', 0, 0, 63, 'Краска акриловая потолочная предназначена для выполнения высококачественной окраски потолков внутри помещений с нормальной влажностью: Гостиные комнаты, спальни, детские комнаты, а также общественные и производственные помещения. Краска обладает идеальной белизной. Легко наносится на поверхность потолка без подтеков, брызг и разводов. Быстро сохнет. После нанесения образует ровную матовую поверхность. Скрывает микронеровности потолка. «Дышащее покрытие». Не желтеет. Не мелит. Без запаха. Гипоаллергенная. Устойчива к сухой уборке. Морозостойкая.', 1),
('ece048f0-fbaf-11e0-b702-001cc494be80', 'Краска ВД-АК "Водоэмульсионка.рф" фасад. супербел. 6кг', 'be9d3a6a-2b8c-11e5-80c2-00155d3703e1', 0, 1, 66, 'Краска акриловая фасадная предназначена для высококачественной окраски фасадов зданий и сооружений, а также для окраски стен и потолков внутри помещений. Краска обладает повышенной износостойкостью, влагостойкостью и атмосферостойкостью. Краску можно наносить на бетонные, кирпичные, заштукатуренные, зашпатлеванные и прочие минеральные поверхности, а также на гипсокартон, дерево, двп, дсп и обои под покраску.\n', 1),
('ece048f2-fbaf-11e0-b702-001cc494be80', 'Краска ВД-АК "Водоэмульсионка.рф" фасад. супербел. 13кг', 'be9d3a6a-2b8c-11e5-80c2-00155d3703e1', 0, 0, 72, 'Краска акриловая фасадная предназначена для высококачественной окраски фасадов зданий и сооружений, а также для окраски стен и потолков внутри помещений. Краска обладает повышенной износостойкостью, влагостойкостью и атмосферостойкостью. Краску можно наносить на бетонные, кирпичные, заштукатуренные, зашпатлеванные и прочие минеральные поверхности, а также на гипсокартон, дерево, двп, дсп и обои под покраску.\n', 1),
('eda7fcbe-8407-11e3-8c2b-005056be1f7b', 'Сетка д/штукатурных работ"Фасад"(5х5) 1х20пм', '6beba4d6-03ad-11e5-bad4-005056be1f7a', 0, 176, 38, '', 1),
('efa9ef8e-f78d-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 1,9кг Вишневый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 86, 48, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('f0ad1dd1-1f91-11e4-9591-005056be1f7b', 'Грунт-эмаль по ржавчине жёлтый 10л  DALI', '569e2345-ff83-11e4-9228-005056be1f7a', 0, 0, 0, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('f1be6b3a-f081-11df-a0c5-000e0c431b58', 'Эмаль ПФ-115 (Лакра) Сиреневая  1кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 92, 56, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('f1be6b3c-f081-11df-a0c5-000e0c431b58', 'Эмаль ПФ-115 (Лакра) Сиреневая  2кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 68, 48, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('f31a0079-f78e-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 6кг Синий', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 21, 12, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('f33aec8f-f78f-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 20кг Шоколадный', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 0, 0, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('f5ec168e-f78d-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 1,9кг Красный', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 112, 47, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('f5f1fcd6-d1c2-11e3-8b7a-005056be1f7b', 'Штукатурка структурная декоративная с эффектом "зернистости" размер "зерна" 1,5мм Белый 15кг', '6aa6af7c-ff83-11e4-9228-005056be1f7a', 0, 47, 0, 'Для декоративной отделки поверхностей внутри и снаружи помещений. Готовая к применению декоративная штукатурка повышенной белизны на основе водной акриловой дисперсии с равномерно зернистой структурой. Скрывает небольшие неровности основания. Легко наносится. Образуемый рельеф получается плавным и приятным на ощупь. Создает прочное влагостойкое, паропроницаемое покрытие, стойкое к атмосферным воздействиям и эксплуатационным нагрузкам. Обладает отличной адгезией к поверхностям из бетона, камня, гипса, цемента, кирпича, ДСП, ДВП. Не содержит растворителей, без запаха. Размер зерна ~ 1,5 мм. Допускает мытье окрашенной поверхности.', 1),
('f63c664a-52ee-11dd-a89a-000e0c431b58', 'Краска акрил. "PARADE" W4 База С Бесцветный 9л', 'be9d3a6a-2b8c-11e5-80c2-00155d3703e1', 0, 124, 32, 'Parade W4 — краска акриловая для внутренних работ. Допускается частая влажная уборка с применением моющих средств, выдерживает более 3000 циклов мытья. Parade W4 применяется на стены и потолки помещений, подвергающиеся максимальным эксплуатационным нагрузкам (любые офисные и жилые помещения), подходит для окраски обоев.', 1),
('fa74499c-7f46-11e3-af7c-005056be1f7b', 'Краска латексная PARADE R7 база А шелк-мат. 2,5л Россия', 'be9d3a6a-2b8c-11e5-80c2-00155d3703e1', 0, 54, 51, 'Шелковисто-матовая краска для стен и потолков любых типов помещений, в т.ч. с высокой эксплуатационной нагрузкой, требующих частой влажной уборки, а также фасадных элементов.\n', 1),
('fbb89466-93af-11e3-82a4-005056be1f7b', 'Грунт-эмаль по ржавчине красный 0,75л  DALI', '569e2345-ff83-11e4-9228-005056be1f7a', 0, 39, 30, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('fc75df8c-f786-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 0,8кг Белая', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 346, 77, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('fd393098-f78f-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 20кг Розово-бежевый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 12, 0, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('fded4984-d1c2-11e3-8b7a-005056be1f7b', 'Штукатурка структурная декоративная с эффектом "зернистости" размер "зерна" 13мм Белый 15кг', '6aa6af7c-ff83-11e4-9228-005056be1f7a', 0, 13, 0, 'Для декоративной отделки поверхностей внутри и снаружи помещений. Готовая к применению декоративная штукатурка повышенной белизны на основе водной акриловой дисперсии с равномерно зернистой структурой. Скрывает небольшие неровности основания. Легко наносится. Образуемый рельеф получается плавным и приятным на ощупь. Создает прочное влагостойкое, паропроницаемое покрытие, стойкое к атмосферным воздействиям и эксплуатационным нагрузкам. Обладает отличной адгезией к поверхностям из бетона, камня, гипса, цемента, кирпича, ДСП, ДВП. Не содержит растворителей, без запаха. Размер зерна ~ 1,5 мм. Допускает мытье окрашенной поверхности.', 1),
('fdf8cbf6-f78e-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 6кг Голубой', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 24, 12, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('fe1a18f9-c501-11e1-abc0-005056be3bd8', 'Огнебиозащитный состав Пирекс Firebio PROF (1-2 гр ) 12 кг', '569e2343-ff83-11e4-9228-005056be1f7a', 0, 0, 0, 'Огнезащитная обработка древесины, защита древесины, находящейся в нормальных условиях эксплуатации (I-Х классы условий службы по ГОСТ 20022.2-80) от биопоражений (гниения, плесени, грибка, синевы)\n', 1),
('fea6c165-5ab6-11dc-be42-000e0c431b58', 'Эмаль универсальная хаки 520 мл.', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 31, 33, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \n', 1),
('fea6c167-5ab6-11dc-be42-000e0c431b58', 'Эмаль универсальная светло-зеленая 520 мл.', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 52, 33, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \n', 1),
('fea6c169-5ab6-11dc-be42-000e0c431b58', 'Эмаль универсальная темно-зеленая 520 мл.', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 73, 37, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \n', 1),
('fea6c16b-5ab6-11dc-be42-000e0c431b58', 'Эмаль универсальная фисташковая 520 мл.', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 39, 33, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \n', 1),
('fea6c16d-5ab6-11dc-be42-000e0c431b58', 'Эмаль универсальная бежевая 520 мл.', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 50, 37, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \n', 1),
('fea6c16f-5ab6-11dc-be42-000e0c431b58', 'Эмаль универсальная голубая 520 мл.', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 65, 39, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \n', 1),
('fea6c171-5ab6-11dc-be42-000e0c431b58', 'Эмаль универсальная синяя 520 мл.', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 83, 39, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \n', 1),
('fea6c173-5ab6-11dc-be42-000e0c431b58', 'Эмаль универсальная коричневая 520 мл.', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 109, 50, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \n', 1),
('fea6c175-5ab6-11dc-be42-000e0c431b58', 'Эмаль универсальная желтая 520 мл.', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 80, 40, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \n', 1),
('fea6c177-5ab6-11dc-be42-000e0c431b58', 'Эмаль универсальная светло-серая 520 мл.', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 55, 35, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \n', 1),
('fea6c179-5ab6-11dc-be42-000e0c431b58', 'Эмаль универсальная серая 520 мл.', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 83, 47, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \n', 1),
('fea6c17b-5ab6-11dc-be42-000e0c431b58', 'Эмаль универсальная оранжевая 520 мл.', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 83, 36, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \n', 1),
('fea6c17d-5ab6-11dc-be42-000e0c431b58', 'Эмаль универсальная бирюзовая 520 мл.', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 65, 34, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \n', 1),
('fea6c17f-5ab6-11dc-be42-000e0c431b58', 'Эмаль универсальная сиреневая 520 мл.', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 53, 34, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \n', 1),
('fea6c181-5ab6-11dc-be42-000e0c431b58', 'Эмаль универсальная охра 520 мл.', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 42, 32, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \n', 1),
('fea6c183-5ab6-11dc-be42-000e0c431b58', 'Эмаль универсальная какао 520 мл.', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 59, 35, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \n', 1),
('fea6c185-5ab6-11dc-be42-000e0c431b58', 'Эмаль универсальная красно-коричневая 520 мл.', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 43, 33, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \n', 1),
('fea6c187-5ab6-11dc-be42-000e0c431b58', 'Эмаль универсальная алюминий 520 мл.', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 71, 34, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \n', 1),
('fea6c189-5ab6-11dc-be42-000e0c431b58', 'Эмаль универсальная хром 520 мл.', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 108, 59, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \n', 1),
('fea6c18b-5ab6-11dc-be42-000e0c431b58', 'Эмаль универсальная золото 520 мл.', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 94, 60, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \n', 1),
('fea6c18d-5ab6-11dc-be42-000e0c431b58', 'Эмаль универсальная медь 520 мл.', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 57, 36, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \n', 1),
('fea6c18f-5ab6-11dc-be42-000e0c431b58', 'Эмаль универсальная белая матовая 520 мл.', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 105, 55, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \n', 1),
('fea6c191-5ab6-11dc-be42-000e0c431b58', 'Эмаль универсальная черная матовая 520 мл.', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 119, 61, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \n', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `ShopItemsPrices`
--

CREATE TABLE IF NOT EXISTS `ShopItemsPrices` (
  `item` varchar(200) NOT NULL,
  `price` varchar(200) NOT NULL,
  `value` float unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ShopItemsPrices`
--

INSERT INTO `ShopItemsPrices` (`item`, `price`, `value`) VALUES
('000b4673-f788-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 114),
('000b4673-f788-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 108.3),
('030b5cff-f78e-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 237),
('030b5cff-f78e-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 225.15),
('047805a5-fe8c-11e3-bbdb-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 419),
('047805a5-fe8c-11e3-bbdb-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 398.05),
('04834f06-93b0-11e3-82a4-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 929),
('04834f06-93b0-11e3-82a4-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 882.55),
('05caaed0-f790-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 2257),
('05caaed0-f790-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 2144.15),
('05caaed2-f790-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 2257),
('05caaed2-f790-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 2144.15),
('06e98e75-f78f-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 738),
('06e98e75-f78f-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 701.1),
('07027c6c-7f47-11e3-af7c-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 2063),
('07027c6c-7f47-11e3-af7c-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 1959.85),
('076d2137-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 369),
('076d2137-4380-11de-8f53-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 350.55),
('076d2139-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 929),
('076d2139-4380-11de-8f53-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 882.55),
('076d213b-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 369),
('076d213b-4380-11de-8f53-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 350.55),
('076d213d-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 929),
('076d213d-4380-11de-8f53-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 882.55),
('076d213f-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 369),
('076d213f-4380-11de-8f53-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 350.55),
('076d2141-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 929),
('076d2141-4380-11de-8f53-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 882.55),
('076d2143-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 369),
('076d2143-4380-11de-8f53-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 350.55),
('076d2145-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 929),
('076d2145-4380-11de-8f53-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 882.55),
('076d2147-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 369),
('076d2147-4380-11de-8f53-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 350.55),
('076d2149-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 929),
('076d2149-4380-11de-8f53-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 882.55),
('076d214b-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 369),
('076d214b-4380-11de-8f53-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 350.55),
('076d214d-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 929),
('076d214d-4380-11de-8f53-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 882.55),
('079b44f8-f788-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 114),
('079b44f8-f788-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 108.3),
('0916172c-947c-11e3-8d88-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 979),
('0916172c-947c-11e3-8d88-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 931),
('09f4768d-f78e-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 237),
('09f4768d-f78e-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 225.15),
('0d8fcbcd-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 569),
('0d8fcbcd-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 540.55),
('0d8fcbcf-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 1269),
('0d8fcbcf-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 1205.55),
('0d8fcbd1-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 722),
('0d8fcbd1-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 685.9),
('0d8fcc0e-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 332),
('0d8fcc0e-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 315.4),
('0d8fcc10-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 1039),
('0d8fcc10-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 987.05),
('0d8fcc12-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 639),
('0d8fcc12-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 607.05),
('0d8fcc1c-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 437),
('0d8fcc1c-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 415.15),
('0d8fcc1e-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 1311),
('0d8fcc1e-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 1245.45),
('0d8fcc20-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 702),
('0d8fcc20-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 666.9),
('0d8fcc22-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 481),
('0d8fcc22-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 456.95),
('0d8fcc24-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 1679),
('0d8fcc24-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 1594.1),
('0d8fcc26-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 834),
('0d8fcc26-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 792.3),
('0ff22851-f78f-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 738),
('0ff22851-f78f-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 701.1),
('1004a95c-f787-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 117),
('1004a95c-f787-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 111.15),
('10594008-ef13-11e4-8633-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 146),
('10594008-ef13-11e4-8633-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 138.9),
('11d9ec94-f788-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 114),
('11d9ec94-f788-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 108.3),
('129c7f4d-5273-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 1759),
('129c7f4d-5273-11de-8f53-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 1671.05),
('138c38bb-f78e-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 237),
('138c38bb-f78e-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 225.15),
('13cd2b20-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 1219),
('13cd2b20-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 1158.72),
('13cd2b24-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 1645),
('13cd2b24-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 1563.84),
('13cd2b26-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 4889),
('13cd2b26-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 4646.24),
('13cd2b5d-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 181),
('13cd2b5d-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 171.95),
('13cd2b61-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 167),
('13cd2b61-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 158.65),
('13cd2b63-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 98),
('13cd2b63-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 92.7),
('13cd2b65-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 98),
('13cd2b65-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 92.7),
('13cd2b67-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 98),
('13cd2b67-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 92.7),
('13cd2b69-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 98),
('13cd2b69-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 92.7),
('13cd2b6b-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 98),
('13cd2b6b-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 92.7),
('13cd2b6d-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 98),
('13cd2b6d-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 92.7),
('13cd2b6f-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 98),
('13cd2b6f-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 92.7),
('13ce3df2-93b0-11e3-82a4-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 929),
('13ce3df2-93b0-11e3-82a4-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 882.55),
('159d7e07-f790-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 2257),
('159d7e07-f790-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 2144.15),
('17a83679-f78f-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 738),
('17a83679-f78f-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 701.1),
('1a0a8b4f-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 65),
('1a0a8b4f-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 61.75),
('1a0a8b51-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 133),
('1a0a8b51-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 126.35),
('1a0a8b53-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 65),
('1a0a8b53-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 60.8),
('1a0a8b55-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 127),
('1a0a8b55-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 119.7),
('1a0a8b57-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 65),
('1a0a8b57-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 60.8),
('1a0a8b59-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 127),
('1a0a8b59-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 119.7),
('1a0a8b5b-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 65),
('1a0a8b5b-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 60.8),
('1a0a8b5d-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 127),
('1a0a8b5d-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 119.7),
('1a0a8b5f-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 75),
('1a0a8b5f-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 68.4),
('1a0a8b61-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 135),
('1a0a8b61-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 124.45),
('1a0a8b63-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 75),
('1a0a8b63-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 68.4),
('1a0a8b65-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 135),
('1a0a8b65-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 124.45),
('1a0a8b67-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 65),
('1a0a8b67-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 60.8),
('1a0a8b69-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 127),
('1a0a8b69-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 119.7),
('1a0a8b6b-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 175),
('1a0a8b6b-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 158),
('1a0a8b6d-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 329),
('1a0a8b6d-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 296),
('1a0a8b6f-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 2799),
('1a0a8b6f-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 2519),
('1a0a8b71-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 165),
('1a0a8b71-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 149),
('1a0a8b73-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 347),
('1a0a8b73-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 312),
('1a0a8b75-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 2999),
('1a0a8b75-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 2699),
('1a0a8b7b-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 2989),
('1a0a8b7b-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 2689),
('1a0a8b7d-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 184),
('1a0a8b7d-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 166),
('1a0a8b7f-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 339),
('1a0a8b7f-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 305),
('1a0a8b81-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 3039),
('1a0a8b81-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 2735),
('1a0a8b83-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 365),
('1a0a8b83-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 329),
('1a0a8b85-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 189),
('1a0a8b85-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 169),
('1a0a8b87-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 3139),
('1a0a8b87-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 2825),
('1a0a8b89-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 165),
('1a0a8b89-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 149),
('1a0a8b8b-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 315),
('1a0a8b8b-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 284),
('1a0a8b8d-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 2825),
('1a0a8b8d-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 2543),
('1a0a8b8f-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 205),
('1a0a8b8f-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 185),
('1a1ab87b-f78e-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 237),
('1a1ab87b-f78e-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 225.15),
('1b75918d-9fb8-11e3-8705-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 135),
('1b75918d-9fb8-11e3-8705-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 128.57),
('1bd57597-93b0-11e3-82a4-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 369),
('1bd57597-93b0-11e3-82a4-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 350.55),
('1d967145-f787-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 180),
('1d967145-f787-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 171),
('1f4ff69d-f78f-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 738),
('1f4ff69d-f78f-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 701.1),
('206ff829-f790-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 2257),
('206ff829-f790-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 2144.15),
('20b7f87c-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 395),
('20b7f87c-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 356),
('20b7f87e-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 3109),
('20b7f87e-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 2798),
('20b7f880-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 175),
('20b7f880-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 158),
('20b7f882-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 335),
('20b7f882-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 302),
('20b7f884-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 2937),
('20b7f884-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 2643),
('20b7f886-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 165),
('20b7f886-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 149),
('20b7f888-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 315),
('20b7f888-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 284),
('20b7f88a-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 2815),
('20b7f88a-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 2534),
('20b7f88c-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 205),
('20b7f88c-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 185),
('20b7f88e-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 395),
('20b7f88e-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 356),
('20b7f890-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 3655),
('20b7f890-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 3290),
('20b7f896-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 179),
('20b7f896-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 161),
('20b7f898-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 372),
('20b7f898-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 335),
('20b7f89a-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 185),
('20b7f89a-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 167),
('20b7f89e-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 165),
('20b7f89e-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 149),
('20b7f8a0-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 315),
('20b7f8a0-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 284),
('20b7f8a2-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 2867),
('20b7f8a2-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 2579),
('20b7f8a4-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 165),
('20b7f8a4-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 149),
('20b7f8a6-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 315),
('20b7f8a6-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 284),
('20b7f8a8-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 2845),
('20b7f8a8-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 2561),
('20b7f8aa-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 185),
('20b7f8aa-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 167),
('20b7f8ac-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 359),
('20b7f8ac-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 323),
('20b7f8ae-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 3212),
('20b7f8ae-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 2889),
('20b7f8b0-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 185),
('20b7f8b0-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 167),
('20b7f8b2-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 355),
('20b7f8b2-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 319),
('20b7f8b4-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 3135),
('20b7f8b4-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 2822),
('20b7f8b6-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 179),
('20b7f8b6-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 159),
('20b7f8b8-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 339),
('20b7f8b8-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 322.05),
('20b7f8bc-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 163),
('20b7f8bc-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 147),
('20b7f8be-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 305),
('20b7f8be-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 275),
('20b7f8c0-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 2845),
('20b7f8c0-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 2561),
('20b7f8c2-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 179),
('20b7f8c2-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 159),
('20b7f8c4-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 179),
('20b7f8c4-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 159),
('20b7f8c6-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 349),
('20b7f8c6-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 314),
('20b7f8c8-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 2959),
('20b7f8c8-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 2663),
('20b7f8d0-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 155),
('20b7f8d0-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 146.3),
('20b7f8d2-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 295),
('20b7f8d2-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 277.4),
('20b7f8d4-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 2402),
('20b7f8d4-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 2281.9),
('20b7f8d6-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 155),
('20b7f8d6-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 142.7),
('20b7f8d8-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 2572),
('20b7f8d8-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 2443.52),
('20b7f8da-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 289),
('20b7f8da-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 272.65),
('20b7f8dc-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 155),
('20b7f8dc-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 148.2),
('20b7f8de-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 298),
('20b7f8de-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 283.1),
('211dadff-f788-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 114),
('211dadff-f788-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 108.3),
('2133814d-f78e-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 237),
('2133814d-f78e-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 225.15),
('23b6c6e7-f789-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 256),
('23b6c6e7-f789-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 243.2),
('2461ad51-9fb8-11e3-8705-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 365),
('2461ad51-9fb8-11e3-8705-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 345.37),
('25a027ef-9e45-11e1-9d3e-005056be3bd8', '288427e0-9732-11db-bbb4-0017315894a1', 179),
('25a027ef-9e45-11e1-9d3e-005056be3bd8', '86157e22-e56b-11dc-8b6b-000e0c431b58', 161),
('25a027f1-9e45-11e1-9d3e-005056be3bd8', '288427e0-9732-11db-bbb4-0017315894a1', 335),
('25a027f1-9e45-11e1-9d3e-005056be3bd8', '86157e22-e56b-11dc-8b6b-000e0c431b58', 302),
('277ee1ed-f788-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 114),
('277ee1ed-f788-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 108.3),
('28110f45-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 269),
('28110f45-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 255.55),
('28110f47-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 489),
('28110f47-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 464.55),
('28110f49-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 275),
('28110f49-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 261.25),
('28110f4b-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 489),
('28110f4b-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 464.55),
('28110f4f-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 449),
('28110f4f-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 426.55),
('28110f51-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 662),
('28110f51-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 628.9),
('28110f53-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 379),
('28110f53-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 360.05),
('28110f55-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 649),
('28110f55-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 616.55),
('28110f57-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 10490),
('28110f57-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 9965.5),
('28b335ed-f78f-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 738),
('28b335ed-f78f-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 701.1),
('2997b29e-f78e-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 237),
('2997b29e-f78e-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 225.15),
('299c6ffe-f790-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 2257),
('299c6ffe-f790-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 2144.15),
('2cbf73b5-f789-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 256),
('2cbf73b5-f789-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 243.2),
('2ced73cf-59ef-11e0-894e-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 225),
('2ced73cf-59ef-11e0-894e-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 214),
('2eadcbef-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 102),
('2eadcbef-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 96.9),
('2eadcbf1-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 437),
('2eadcbf1-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 415.15),
('2eadcbf3-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 53),
('2eadcbf3-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 50.35),
('2eadcbfc-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 39),
('2eadcbfc-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 37.05),
('2eadcbfe-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 77),
('2eadcbfe-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 73.15),
('2eadcc00-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 328),
('2eadcc00-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 311.6),
('2eadcc10-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 55),
('2eadcc10-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 52.25),
('2eadcc2e-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 36),
('2eadcc2e-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 34.2),
('2eadcc30-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 84),
('2eadcc30-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 79.8),
('2eadcc32-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 303),
('2eadcc32-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 287.85),
('30047f82-f788-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 114),
('30047f82-f788-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 108.3),
('3114fa55-f78f-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 738),
('3114fa55-f78f-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 701.1),
('3409410b-5b1f-11e2-8bea-005056be271d', '288427e0-9732-11db-bbb4-0017315894a1', 3586),
('3409410b-5b1f-11e2-8bea-005056be271d', '86157e22-e56b-11dc-8b6b-000e0c431b58', 3406.7),
('3442e089-0125-11e4-8695-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 454),
('3442e089-0125-11e4-8695-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 431.3),
('3479e733-bce7-11e4-a1f3-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 1170),
('3479e733-bce7-11e4-a1f3-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 1111.5),
('34fe3e79-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 1875),
('34fe3e79-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 1780.87),
('34fe3e7c-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 854),
('34fe3e7c-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 777),
('34fe3e7e-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 422),
('34fe3e7e-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 384),
('34fe3e85-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 497),
('34fe3e85-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 479.6),
('34fe3e88-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 964),
('34fe3e88-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 950.65),
('34fe3e94-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 112),
('34fe3e94-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 106.86),
('34fe3eb2-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 28),
('34fe3eb2-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 24.92),
('34fe3ed3-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 223),
('34fe3ed3-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 212.07),
('34fe3ed7-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 42),
('34fe3ed7-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 38.24),
('34fe3eda-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 46),
('34fe3eda-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 43.28),
('3526e5c9-f78e-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 237),
('3526e5c9-f78e-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 225.15),
('36e5c1e5-bbba-11e3-b52a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 1541),
('36e5c1e5-bbba-11e3-b52a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 1463.95),
('380e3f79-f788-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 114),
('380e3f79-f788-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 108.3),
('3bfb5c69-9fb8-11e3-8705-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 179),
('3bfb5c69-9fb8-11e3-8705-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 170.61),
('3d601a65-f78f-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 738),
('3d601a65-f78f-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 701.1),
('3d822ed4-f78e-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 237),
('3d822ed4-f78e-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 225.15),
('41f9a64a-f788-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 114),
('41f9a64a-f788-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 108.3),
('441a7da1-9fb8-11e3-8705-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 469),
('441a7da1-9fb8-11e3-8705-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 446.96),
('45794d11-f78e-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 237),
('45794d11-f78e-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 225.15),
('47de42e5-f789-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 747),
('47de42e5-f789-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 709.65),
('4b89f23b-1f19-11e5-8104-00155d3a0124', '288427e0-9732-11db-bbb4-0017315894a1', 184),
('4b89f23b-1f19-11e5-8104-00155d3a0124', '86157e22-e56b-11dc-8b6b-000e0c431b58', 174.47),
('4dd1de14-f78e-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 237),
('4dd1de14-f78e-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 225.15),
('4ed5aaa1-f789-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 747),
('4ed5aaa1-f789-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 709.65),
('500c0ee4-4f2c-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 265),
('500c0ee4-4f2c-11de-8f53-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 250.8),
('500c0ee6-4f2c-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 495),
('500c0ee6-4f2c-11de-8f53-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 470.3),
('55c10657-f78e-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 237),
('55c10657-f78e-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 225.15),
('56a6f723-ea03-11de-860d-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 1719),
('56a6f723-ea03-11de-860d-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 1633.05),
('56f519d0-4f2c-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 1989),
('56f519d0-4f2c-11de-8f53-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 1889.55),
('58970c19-5a2d-11de-a649-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 149),
('58970c19-5a2d-11de-a649-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 141.55),
('5ed5699a-f78e-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 237),
('5ed5699a-f78e-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 225.15),
('5fde6d12-f789-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 1033),
('5fde6d12-f789-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 981.35),
('612d8834-6137-11e1-96bd-005056be3bd8', '288427e0-9732-11db-bbb4-0017315894a1', 233),
('612d8834-6137-11e1-96bd-005056be3bd8', '86157e22-e56b-11dc-8b6b-000e0c431b58', 220.5),
('61fa79ff-168f-11e1-8cc1-001cc494be80', '288427e0-9732-11db-bbb4-0017315894a1', 177),
('61fa79ff-168f-11e1-8cc1-001cc494be80', '86157e22-e56b-11dc-8b6b-000e0c431b58', 165.4),
('6315f6f2-5855-11e1-830a-005056be3bd8', '288427e0-9732-11db-bbb4-0017315894a1', 236),
('6315f6f2-5855-11e1-830a-005056be3bd8', '86157e22-e56b-11dc-8b6b-000e0c431b58', 220.81),
('67c85be4-6208-11de-9531-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 495),
('67c85be4-6208-11de-9531-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 470.3),
('67c85be6-6208-11de-9531-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 265),
('67c85be6-6208-11de-9531-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 250.8),
('680965ab-f789-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 2257),
('680965ab-f789-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 2144.15),
('727c8145-f789-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 2257),
('727c8145-f789-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 2144.15),
('747ef690-551c-11dc-beb4-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 335),
('747ef690-551c-11dc-beb4-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 302),
('763735c0-2a2b-11e2-9366-005056be3bd8', '288427e0-9732-11db-bbb4-0017315894a1', 275),
('763735c0-2a2b-11e2-9366-005056be3bd8', '86157e22-e56b-11dc-8b6b-000e0c431b58', 266),
('77c5eb9b-4b14-11e1-bd83-001cc494be80', '288427e0-9732-11db-bbb4-0017315894a1', 128),
('77c5eb9b-4b14-11e1-bd83-001cc494be80', '86157e22-e56b-11dc-8b6b-000e0c431b58', 121.6),
('78e43dfb-fbee-11e1-8f72-005056be3bd8', '288427e0-9732-11db-bbb4-0017315894a1', 1119),
('78e43dfb-fbee-11e1-8f72-005056be3bd8', '86157e22-e56b-11dc-8b6b-000e0c431b58', 1063.05),
('7a3c5db1-777c-11de-9531-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 1399),
('7a3c5db1-777c-11de-9531-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 1329.05),
('7a3c5db3-777c-11de-9531-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 789),
('7a3c5db3-777c-11de-9531-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 749.55),
('7a3c5db5-777c-11de-9531-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 1439),
('7a3c5db5-777c-11de-9531-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 1367.05),
('7a3c5db7-777c-11de-9531-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 859),
('7a3c5db7-777c-11de-9531-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 816.05),
('7ab6caa7-b1ee-11e0-aa21-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 1438),
('7ab6caa7-b1ee-11e0-aa21-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 1366.1),
('7c1e70d5-5a9d-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 174),
('7c1e70d5-5a9d-11dc-be42-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 157),
('7e531df3-b5f5-11e1-83ba-005056be3bd8', '288427e0-9732-11db-bbb4-0017315894a1', 375),
('7e531df3-b5f5-11e1-83ba-005056be3bd8', '86157e22-e56b-11dc-8b6b-000e0c431b58', 356.25),
('7ff8df4e-f789-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 3271),
('7ff8df4e-f789-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 3107.45),
('82ebcce8-bce7-11e4-a1f3-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 6061),
('82ebcce8-bce7-11e4-a1f3-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 5757.95),
('8522912f-f3fb-11e4-9746-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 4560),
('8522912f-f3fb-11e4-9746-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 4332),
('897bb5a6-b0fa-11e3-b34d-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 299),
('897bb5a6-b0fa-11e3-b34d-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 199),
('89cb1aab-b1c3-11e0-aa21-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 439),
('89cb1aab-b1c3-11e0-aa21-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 417.05),
('9291c63a-5ab3-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('9291c63a-5ab3-11dc-be42-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 145.35),
('9291c63c-5ab3-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('9291c63c-5ab3-11dc-be42-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 145.35),
('9291c63e-5ab3-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('9291c63e-5ab3-11dc-be42-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 145.35),
('9291c640-5ab3-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('9291c640-5ab3-11dc-be42-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 145.35),
('95aabdce-0d99-11dc-bdd4-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 92),
('95aabdce-0d99-11dc-bdd4-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 87.4),
('963b6b0a-04a8-11e3-94de-005056be3574', '288427e0-9732-11db-bbb4-0017315894a1', 1065),
('963b6b0a-04a8-11e3-94de-005056be3574', '86157e22-e56b-11dc-8b6b-000e0c431b58', 1007.95),
('992163db-a731-11de-90d4-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 989),
('992163db-a731-11de-90d4-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 939.55),
('992163dd-a731-11de-90d4-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 1849),
('992163dd-a731-11de-90d4-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 1756.55),
('993a4aa8-6b1e-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 2189),
('993a4aa8-6b1e-11dc-be42-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 2082.4),
('993a4aaa-6b1e-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 1456),
('993a4aaa-6b1e-11dc-be42-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 1383.2),
('993a4aac-6b1e-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 795),
('993a4aac-6b1e-11dc-be42-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 755.25),
('993a4aae-6b1e-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 1974),
('993a4aae-6b1e-11dc-be42-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 1875.52),
('9bd479ef-b369-11e4-a26a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 999),
('9bd479ef-b369-11e4-a26a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 994),
('a0f3c4de-cf2d-11e1-92a4-005056be3bd8', '288427e0-9732-11db-bbb4-0017315894a1', 3529),
('a0f3c4de-cf2d-11e1-92a4-005056be3bd8', '86157e22-e56b-11dc-8b6b-000e0c431b58', 3353.38),
('a1a9b4a6-f787-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 114),
('a1a9b4a6-f787-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 108.3),
('a48048ba-ec8c-11e3-9eab-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 108),
('a48048ba-ec8c-11e3-9eab-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 102.6),
('a663cb7c-fadf-11e3-b5e8-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 955),
('a663cb7c-fadf-11e3-b5e8-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 907.25),
('a6f80c96-516a-11dd-a89a-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 529),
('a6f80c96-516a-11dd-a89a-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 502.55),
('a6f80c98-516a-11dd-a89a-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 969),
('a6f80c98-516a-11dd-a89a-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 920.55),
('a6f80c9c-516a-11dd-a89a-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 299),
('a6f80c9c-516a-11dd-a89a-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 284.05),
('a6f80c9e-516a-11dd-a89a-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 559),
('a6f80c9e-516a-11dd-a89a-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 531.05),
('a6f80ca2-516a-11dd-a89a-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 539),
('a6f80ca2-516a-11dd-a89a-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 512.05),
('a6f80ca4-516a-11dd-a89a-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 1049),
('a6f80ca4-516a-11dd-a89a-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 996.55),
('a6f80ca8-516a-11dd-a89a-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 1119),
('a6f80ca8-516a-11dd-a89a-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 1063.05),
('a6f80cac-516a-11dd-a89a-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 559),
('a6f80cac-516a-11dd-a89a-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 531.05),
('a6f80cae-516a-11dd-a89a-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 1079),
('a6f80cae-516a-11dd-a89a-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 1025.05),
('a6fd4151-ec8b-11e3-9eab-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 832),
('a6fd4151-ec8b-11e3-9eab-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 790.4),
('a7555009-7f46-11e3-af7c-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 1235),
('a7555009-7f46-11e3-af7c-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 1173.25),
('ab383e71-f78f-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 2257),
('ab383e71-f78f-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 2144.15),
('ad93144b-f787-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 114),
('ad93144b-f787-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 108.3),
('ae39d1eb-cf86-11e3-a00d-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 1479),
('ae39d1eb-cf86-11e3-a00d-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 999),
('b08b1d7e-ec8c-11e3-9eab-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 48),
('b08b1d7e-ec8c-11e3-9eab-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 45.6),
('b182dc4f-f994-11e2-98ef-005056be3574', '288427e0-9732-11db-bbb4-0017315894a1', 539),
('b182dc4f-f994-11e2-98ef-005056be3574', '86157e22-e56b-11dc-8b6b-000e0c431b58', 512.05),
('b182dc51-f994-11e2-98ef-005056be3574', '288427e0-9732-11db-bbb4-0017315894a1', 539),
('b182dc51-f994-11e2-98ef-005056be3574', '86157e22-e56b-11dc-8b6b-000e0c431b58', 512.05),
('b1a9595a-7f46-11e3-af7c-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 2369),
('b1a9595a-7f46-11e3-af7c-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 2250.55),
('b3740593-f78f-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 2257),
('b3740593-f78f-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 2144.15),
('b54ba125-f78e-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 738),
('b54ba125-f78e-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 701.1),
('b5957aa3-f787-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 114),
('b5957aa3-f787-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 108.3),
('b7e28649-21de-11df-860d-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 855),
('b7e28649-21de-11df-860d-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 812.25),
('b7e2864b-21de-11df-860d-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 1659),
('b7e2864b-21de-11df-860d-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 1576.05),
('b8d52c0e-7f46-11e3-af7c-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 3952),
('b8d52c0e-7f46-11e3-af7c-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 3754.4),
('b948502d-e1ad-11df-a0c5-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 159),
('b948502d-e1ad-11df-a0c5-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 151.05),
('ba1232df-ec8c-11e3-9eab-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 71),
('ba1232df-ec8c-11e3-9eab-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 67.45),
('bb036923-a661-11e2-9827-005056be3574', '288427e0-9732-11db-bbb4-0017315894a1', 143),
('bb036923-a661-11e2-9827-005056be3574', '86157e22-e56b-11dc-8b6b-000e0c431b58', 135.85),
('bc816f7f-f78f-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 2257),
('bc816f7f-f78f-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 2144.15),
('beb861cb-f787-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 114),
('beb861cb-f787-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 108.3),
('bef8d7ea-f78e-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 738),
('bef8d7ea-f78e-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 701.1),
('bf4804e2-fc0e-11dd-bd91-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 685),
('bf4804e2-fc0e-11dd-bd91-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 650.75),
('bf4804e4-fc0e-11dd-bd91-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 604),
('bf4804e4-fc0e-11dd-bd91-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 573.8),
('c017590e-fbe7-11e0-b702-001cc494be80', '288427e0-9732-11db-bbb4-0017315894a1', 215),
('c017590e-fbe7-11e0-b702-001cc494be80', '86157e22-e56b-11dc-8b6b-000e0c431b58', 202.35),
('c0175910-fbe7-11e0-b702-001cc494be80', '288427e0-9732-11db-bbb4-0017315894a1', 379),
('c0175910-fbe7-11e0-b702-001cc494be80', '86157e22-e56b-11dc-8b6b-000e0c431b58', 362),
('c0175912-fbe7-11e0-b702-001cc494be80', '288427e0-9732-11db-bbb4-0017315894a1', 255),
('c0175912-fbe7-11e0-b702-001cc494be80', '86157e22-e56b-11dc-8b6b-000e0c431b58', 240.35),
('c0175914-fbe7-11e0-b702-001cc494be80', '288427e0-9732-11db-bbb4-0017315894a1', 955),
('c0175914-fbe7-11e0-b702-001cc494be80', '86157e22-e56b-11dc-8b6b-000e0c431b58', 907.25),
('c0175916-fbe7-11e0-b702-001cc494be80', '288427e0-9732-11db-bbb4-0017315894a1', 495),
('c0175916-fbe7-11e0-b702-001cc494be80', '86157e22-e56b-11dc-8b6b-000e0c431b58', 466.45),
('c0175918-fbe7-11e0-b702-001cc494be80', '288427e0-9732-11db-bbb4-0017315894a1', 995),
('c0175918-fbe7-11e0-b702-001cc494be80', '86157e22-e56b-11dc-8b6b-000e0c431b58', 941.45),
('c017591a-fbe7-11e0-b702-001cc494be80', '288427e0-9732-11db-bbb4-0017315894a1', 279),
('c017591a-fbe7-11e0-b702-001cc494be80', '86157e22-e56b-11dc-8b6b-000e0c431b58', 264.1),
('c017591c-fbe7-11e0-b702-001cc494be80', '288427e0-9732-11db-bbb4-0017315894a1', 565),
('c017591c-fbe7-11e0-b702-001cc494be80', '86157e22-e56b-11dc-8b6b-000e0c431b58', 535.8),
('c017591e-fbe7-11e0-b702-001cc494be80', '288427e0-9732-11db-bbb4-0017315894a1', 1219),
('c017591e-fbe7-11e0-b702-001cc494be80', '86157e22-e56b-11dc-8b6b-000e0c431b58', 1158.1),
('c2d90e40-f78f-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 2257),
('c2d90e40-f78f-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 2144.15),
('c4df9e0d-00c0-11e2-a554-005056be3bd8', '288427e0-9732-11db-bbb4-0017315894a1', 539),
('c4df9e0d-00c0-11e2-a554-005056be3bd8', '86157e22-e56b-11dc-8b6b-000e0c431b58', 512.05),
('c4df9e0f-00c0-11e2-a554-005056be3bd8', '288427e0-9732-11db-bbb4-0017315894a1', 539),
('c4df9e0f-00c0-11e2-a554-005056be3bd8', '86157e22-e56b-11dc-8b6b-000e0c431b58', 512.05),
('c4df9e11-00c0-11e2-a554-005056be3bd8', '288427e0-9732-11db-bbb4-0017315894a1', 539),
('c4df9e11-00c0-11e2-a554-005056be3bd8', '86157e22-e56b-11dc-8b6b-000e0c431b58', 512.05),
('c4df9e13-00c0-11e2-a554-005056be3bd8', '288427e0-9732-11db-bbb4-0017315894a1', 539),
('c4df9e13-00c0-11e2-a554-005056be3bd8', '86157e22-e56b-11dc-8b6b-000e0c431b58', 512.05),
('c6d784e3-f78e-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 738),
('c6d784e3-f78e-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 701.1),
('c9d25e2b-f787-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 114),
('c9d25e2b-f787-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 108.3),
('ca79b0fb-f78f-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 2257),
('ca79b0fb-f78f-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 2144.15),
('cb22e29d-68ed-11dd-b117-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 579),
('cb22e29d-68ed-11dd-b117-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 550.05),
('cb22e29f-68ed-11dd-b117-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 325),
('cb22e29f-68ed-11dd-b117-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 308.75),
('cce4b552-7f46-11e3-af7c-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 957),
('cce4b552-7f46-11e3-af7c-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 909.15),
('cce7530f-27b6-11dd-942f-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 1489),
('cce7530f-27b6-11dd-942f-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 1414.55),
('ce1ffcf9-f78e-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 738),
('ce1ffcf9-f78e-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 701.1),
('ce813bcf-2257-11e1-ae36-001cc494be80', '288427e0-9732-11db-bbb4-0017315894a1', 89),
('ce813bcf-2257-11e1-ae36-001cc494be80', '86157e22-e56b-11dc-8b6b-000e0c431b58', 84.6),
('ce813bd1-2257-11e1-ae36-001cc494be80', '288427e0-9732-11db-bbb4-0017315894a1', 105),
('ce813bd1-2257-11e1-ae36-001cc494be80', '86157e22-e56b-11dc-8b6b-000e0c431b58', 98.8),
('ceef00fe-c7d1-11e4-85d3-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 2101),
('ceef00fe-c7d1-11e4-85d3-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 1995.95),
('cf6aa526-48b8-11dd-9342-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 174),
('cf6aa526-48b8-11dd-9342-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 165.3),
('d0659fe4-f787-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 114),
('d0659fe4-f787-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 108.3),
('d1aa2ade-a3ef-11e1-ad4e-005056be3bd8', '288427e0-9732-11db-bbb4-0017315894a1', 375),
('d1aa2ade-a3ef-11e1-ad4e-005056be3bd8', '86157e22-e56b-11dc-8b6b-000e0c431b58', 356.25),
('d1eaa4c2-f78f-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 2257),
('d1eaa4c2-f78f-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 2144.15),
('d5823752-947b-11e3-8d88-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 975),
('d5823752-947b-11e3-8d88-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 926.25),
('d63bb09c-055c-11dd-b9c0-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 1931),
('d63bb09c-055c-11dd-b9c0-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 1834.45),
('d72ce04c-7f46-11e3-af7c-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 1805),
('d72ce04c-7f46-11e3-af7c-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 1714.75),
('d76b7387-f78e-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 738),
('d76b7387-f78e-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 701.1),
('d9eaaa65-f78f-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 2257),
('d9eaaa65-f78f-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 2144.15),
('da49edc1-58f9-11e0-894e-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 4560),
('da49edc1-58f9-11e0-894e-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 4332),
('da49edc3-58f9-11e0-894e-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 4560),
('da49edc3-58f9-11e0-894e-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 4332),
('da49edc5-58f9-11e0-894e-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 4560),
('da49edc5-58f9-11e0-894e-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 4332),
('da49edc7-58f9-11e0-894e-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 4560),
('da49edc7-58f9-11e0-894e-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 4332),
('da49edc9-58f9-11e0-894e-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 4560),
('da49edc9-58f9-11e0-894e-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 4332),
('da49edcb-58f9-11e0-894e-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 4560),
('da49edcb-58f9-11e0-894e-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 4332),
('ddd32665-666b-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 2337),
('ddd32665-666b-11dc-be42-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 2220.15),
('ddd3266a-666b-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 687),
('ddd3266a-666b-11dc-be42-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 652.65),
('ddd3266c-666b-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 1317),
('ddd3266c-666b-11dc-be42-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 1251.15),
('ddd32674-666b-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 738),
('ddd32674-666b-11dc-be42-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 701.1),
('ddd32676-666b-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 1459),
('ddd32676-666b-11dc-be42-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 1386.05),
('de1409cf-f787-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 114),
('de1409cf-f787-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 108.3),
('de9b7b14-7f46-11e3-af7c-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 3151),
('de9b7b14-7f46-11e3-af7c-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 2993.45),
('df210450-93af-11e3-82a4-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 369),
('df210450-93af-11e3-82a4-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 350.55),
('df2d81cd-f78e-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 738),
('df2d81cd-f78e-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 701.1),
('e017a0ce-f78d-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 237),
('e017a0ce-f78d-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 225.15),
('e02ebd60-99a6-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 143),
('e02ebd60-99a6-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 135.85),
('e02ebd64-99a6-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 324),
('e02ebd64-99a6-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 307.8),
('e02ebd66-99a6-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 5332),
('e02ebd66-99a6-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 5065.4),
('e02ebd6a-99a6-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 99),
('e02ebd6a-99a6-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 94.05),
('e02ebd6c-99a6-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 235),
('e02ebd6c-99a6-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 223.25),
('e02ebd6e-99a6-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 399),
('e02ebd6e-99a6-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 379.05),
('e02ebd70-99a6-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 899),
('e02ebd70-99a6-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 854.05),
('e02ebd72-99a6-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 3547),
('e02ebd72-99a6-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 3369.65),
('e02ebd74-99a6-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 215),
('e02ebd74-99a6-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 204.25),
('e02ebd76-99a6-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 65),
('e02ebd76-99a6-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 61.75),
('e02ebd78-99a6-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 152),
('e02ebd78-99a6-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 144.4),
('e02ebd7a-99a6-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 255),
('e02ebd7a-99a6-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 242.25),
('e02ebd7c-99a6-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 586),
('e02ebd7c-99a6-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 556.7),
('e02ebd7e-99a6-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 2215),
('e02ebd7e-99a6-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 2104.25),
('e02ebdc0-99a6-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 99),
('e02ebdc0-99a6-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 96),
('e02ebdc3-99a6-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 204),
('e02ebdc3-99a6-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 193.8),
('e02ebdc6-99a6-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 204),
('e02ebdc6-99a6-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 193.8),
('e02ebdcc-99a6-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 188),
('e02ebdcc-99a6-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 178.6),
('e12e57a9-f78f-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 2257),
('e12e57a9-f78f-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 2144.15),
('e213c98a-ccbb-11e4-a1f9-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 92),
('e213c98a-ccbb-11e4-a1f9-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 87.4),
('e242e97f-f29b-11dd-9439-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 3289),
('e242e97f-f29b-11dd-9439-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 3124.55),
('e2e51024-e980-11e4-ab92-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 1062),
('e2e51024-e980-11e4-ab92-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 1008.9),
('e39c5eb8-24d0-11e2-8158-005056be3bd8', '288427e0-9732-11db-bbb4-0017315894a1', 9290),
('e39c5eb8-24d0-11e2-8158-005056be3bd8', '86157e22-e56b-11dc-8b6b-000e0c431b58', 8825.5),
('e4020814-4598-11e1-8212-001cc494be80', '288427e0-9732-11db-bbb4-0017315894a1', 1449),
('e4020814-4598-11e1-8212-001cc494be80', '86157e22-e56b-11dc-8b6b-000e0c431b58', 1376.55),
('e545e44e-298d-11e2-8829-005056be3bd8', '288427e0-9732-11db-bbb4-0017315894a1', 1359),
('e545e44e-298d-11e2-8829-005056be3bd8', '86157e22-e56b-11dc-8b6b-000e0c431b58', 1291.05),
('e545e450-298d-11e2-8829-005056be3bd8', '288427e0-9732-11db-bbb4-0017315894a1', 589),
('e545e450-298d-11e2-8829-005056be3bd8', '86157e22-e56b-11dc-8b6b-000e0c431b58', 559.55),
('e63d2bae-f78d-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 237),
('e63d2bae-f78d-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 225.15),
('e68fd7da-99a6-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 197),
('e68fd7da-99a6-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 193.8),
('e68fd7dc-99a6-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 197),
('e68fd7dc-99a6-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 193.8),
('e68fd7df-99a6-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 128),
('e68fd7df-99a6-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 121.6),
('e68fd7e2-99a6-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 128),
('e68fd7e2-99a6-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 121.6),
('e68fd7e4-99a6-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 128),
('e68fd7e4-99a6-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 121.6),
('e68fd7e6-99a6-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 128),
('e68fd7e6-99a6-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 121.6),
('e68fd7e9-99a6-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 221),
('e68fd7e9-99a6-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 209.95),
('e68fd7ec-99a6-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 221),
('e68fd7ec-99a6-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 209.95),
('e68fd7ee-99a6-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 183),
('e68fd7ee-99a6-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 173.85),
('e68fd7f1-99a6-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 183),
('e68fd7f1-99a6-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 173.85),
('e68fd7f3-99a6-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 149),
('e68fd7f3-99a6-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 141.55),
('e68fd7f5-99a6-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 149),
('e68fd7f5-99a6-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 141.55),
('e68fd7fa-99a6-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 149),
('e68fd7fa-99a6-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 141.55),
('e68fd7fc-99a6-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 149),
('e68fd7fc-99a6-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 141.55),
('e755f307-f787-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 114),
('e755f307-f787-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 108.3),
('e7f145bb-f78f-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 2257),
('e7f145bb-f78f-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 2144.15),
('e8976171-93af-11e3-82a4-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 929),
('e8976171-93af-11e3-82a4-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 882.55),
('e93b4d96-f3cd-11df-ab71-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 92),
('e93b4d96-f3cd-11df-ab71-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 87.15),
('e93b4d9a-f3cd-11df-ab71-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 262),
('e93b4d9a-f3cd-11df-ab71-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 249.79),
('e93b4d9e-f3cd-11df-ab71-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 302),
('e93b4d9e-f3cd-11df-ab71-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 285.65),
('e9f3fc4e-47c0-11dc-8bad-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 4576),
('e9f3fc4e-47c0-11dc-8bad-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 4347.2),
('eb8ca588-9b09-11e4-a80c-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 73),
('eb8ca588-9b09-11e4-a80c-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 71.4),
('ebcc7a29-f78e-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 738),
('ebcc7a29-f78e-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 701.1),
('ece048eb-fbaf-11e0-b702-001cc494be80', '288427e0-9732-11db-bbb4-0017315894a1', 167),
('ece048eb-fbaf-11e0-b702-001cc494be80', '86157e22-e56b-11dc-8b6b-000e0c431b58', 139),
('ece048ee-fbaf-11e0-b702-001cc494be80', '288427e0-9732-11db-bbb4-0017315894a1', 363),
('ece048ee-fbaf-11e0-b702-001cc494be80', '86157e22-e56b-11dc-8b6b-000e0c431b58', 344.85),
('ece048f0-fbaf-11e0-b702-001cc494be80', '288427e0-9732-11db-bbb4-0017315894a1', 465),
('ece048f0-fbaf-11e0-b702-001cc494be80', '86157e22-e56b-11dc-8b6b-000e0c431b58', 442.7),
('ece048f2-fbaf-11e0-b702-001cc494be80', '288427e0-9732-11db-bbb4-0017315894a1', 955),
('ece048f2-fbaf-11e0-b702-001cc494be80', '86157e22-e56b-11dc-8b6b-000e0c431b58', 904.4),
('eda7fcbe-8407-11e3-8c2b-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 878),
('eda7fcbe-8407-11e3-8c2b-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 834.1),
('efa9ef8e-f78d-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 237),
('efa9ef8e-f78d-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 225.15),
('f0ad1dd1-1f91-11e4-9591-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 4560),
('f0ad1dd1-1f91-11e4-9591-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 4332),
('f1be6b3a-f081-11df-a0c5-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 184),
('f1be6b3a-f081-11df-a0c5-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 166),
('f1be6b3c-f081-11df-a0c5-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 329),
('f1be6b3c-f081-11df-a0c5-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 296),
('f31a0079-f78e-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 738),
('f31a0079-f78e-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 701.1),
('f33aec8f-f78f-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 2257),
('f33aec8f-f78f-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 2144.15),
('f5ec168e-f78d-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 237),
('f5ec168e-f78d-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 225.15),
('f5f1fcd6-d1c2-11e3-8b7a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 979),
('f5f1fcd6-d1c2-11e3-8b7a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 931),
('f63c664a-52ee-11dd-a89a-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 2129),
('f63c664a-52ee-11dd-a89a-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 2022.55),
('fa74499c-7f46-11e3-af7c-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 1096),
('fa74499c-7f46-11e3-af7c-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 1041.2),
('fbb89466-93af-11e3-82a4-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 369),
('fbb89466-93af-11e3-82a4-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 350.55),
('fc75df8c-f786-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 117),
('fc75df8c-f786-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 111.15),
('fd393098-f78f-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 2257),
('fd393098-f78f-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 2144.15),
('fded4984-d1c2-11e3-8b7a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 979),
('fded4984-d1c2-11e3-8b7a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 931),
('fdf8cbf6-f78e-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 738),
('fdf8cbf6-f78e-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 701.1),
('fe1a18f9-c501-11e1-abc0-005056be3bd8', '288427e0-9732-11db-bbb4-0017315894a1', 4249),
('fe1a18f9-c501-11e1-abc0-005056be3bd8', '86157e22-e56b-11dc-8b6b-000e0c431b58', 4036.55),
('fea6c165-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('fea6c165-5ab6-11dc-be42-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 145.35),
('fea6c167-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('fea6c167-5ab6-11dc-be42-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 145.35),
('fea6c169-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('fea6c169-5ab6-11dc-be42-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 145.35),
('fea6c16b-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('fea6c16b-5ab6-11dc-be42-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 145.35),
('fea6c16d-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('fea6c16d-5ab6-11dc-be42-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 145.35),
('fea6c16f-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('fea6c16f-5ab6-11dc-be42-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 145.35),
('fea6c171-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('fea6c171-5ab6-11dc-be42-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 145.35),
('fea6c173-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('fea6c173-5ab6-11dc-be42-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 145.35),
('fea6c175-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('fea6c175-5ab6-11dc-be42-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 145.35),
('fea6c177-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('fea6c177-5ab6-11dc-be42-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 145.35),
('fea6c179-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('fea6c179-5ab6-11dc-be42-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 145.35),
('fea6c17b-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('fea6c17b-5ab6-11dc-be42-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 145.35),
('fea6c17d-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('fea6c17d-5ab6-11dc-be42-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 145.35),
('fea6c17f-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('fea6c17f-5ab6-11dc-be42-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 145.35),
('fea6c181-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('fea6c181-5ab6-11dc-be42-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 145.35),
('fea6c183-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('fea6c183-5ab6-11dc-be42-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 145.35),
('fea6c185-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('fea6c185-5ab6-11dc-be42-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 145.35),
('fea6c187-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 174),
('fea6c187-5ab6-11dc-be42-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 165.3),
('fea6c189-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 174),
('fea6c189-5ab6-11dc-be42-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 165.3),
('fea6c18b-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 174),
('fea6c18b-5ab6-11dc-be42-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 165.3),
('fea6c18d-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 174),
('fea6c18d-5ab6-11dc-be42-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 165.3),
('fea6c18f-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('fea6c18f-5ab6-11dc-be42-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 145.35),
('fea6c191-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('fea6c191-5ab6-11dc-be42-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 145.35);

-- --------------------------------------------------------

--
-- Структура таблицы `ShopItemsPropertiesMeasure`
--

CREATE TABLE IF NOT EXISTS `ShopItemsPropertiesMeasure` (
  `measureF` varchar(50) NOT NULL,
  `measureS` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ShopItemsPropertiesMeasure`
--

INSERT INTO `ShopItemsPropertiesMeasure` (`measureF`, `measureS`) VALUES
('грамы', 'г'),
('литры', 'л'),
('метры', 'м');

-- --------------------------------------------------------

--
-- Структура таблицы `ShopItemsPropertiesMeasurePrefix`
--

CREATE TABLE IF NOT EXISTS `ShopItemsPropertiesMeasurePrefix` (
  `prefixF` varchar(50) NOT NULL,
  `prefixS` varchar(50) NOT NULL,
  `factor` float unsigned NOT NULL,
  `reverseFactor` float unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ShopItemsPropertiesMeasurePrefix`
--

INSERT INTO `ShopItemsPropertiesMeasurePrefix` (`prefixF`, `prefixS`, `factor`, `reverseFactor`) VALUES
('гига', 'Г', 1000000000, 0.000000001),
('кило', 'к', 1000, 0.001),
('мега', 'М', 1000000, 0.000001),
('микро', 'мк', 0.000001, 1000000),
('милли', 'м', 0.001, 1000),
('нано', 'н', 0.000000001, 1000000000),
('пико', 'п', 0.000000000001, 1000000000000),
('тера', 'Т', 1000000000000, 0.000000000001);

-- --------------------------------------------------------

--
-- Структура таблицы `ShopItemsPropertiesMeasureScaling`
--

CREATE TABLE IF NOT EXISTS `ShopItemsPropertiesMeasureScaling` (
  `measure` varchar(50) NOT NULL,
  `prefix` varchar(50) NOT NULL,
  `alias` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ShopItemsPropertiesMeasureScaling`
--

INSERT INTO `ShopItemsPropertiesMeasureScaling` (`measure`, `prefix`, `alias`) VALUES
('грамы', 'гига', ''),
('грамы', 'кило', ''),
('грамы', 'мега', 'т'),
('грамы', 'микро', ''),
('грамы', 'милли', ''),
('грамы', 'нано', ''),
('литры', 'милли', ''),
('метры', 'кило', ''),
('метры', 'микро', ''),
('метры', 'милли', '');

-- --------------------------------------------------------

--
-- Структура таблицы `ShopItemsPropertiesValues`
--

CREATE TABLE IF NOT EXISTS `ShopItemsPropertiesValues` (
  `id` varchar(200) NOT NULL,
  `item` varchar(200) NOT NULL,
  `property` varchar(200) NOT NULL,
  `value` varchar(200) DEFAULT NULL,
  `measure` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ShopItemsPropertiesValues`
--

INSERT INTO `ShopItemsPropertiesValues` (`id`, `item`, `property`, `value`, `measure`) VALUES
('000b4673-f788-11e3-8c8a-005056be1f7b-BBfq-F1mh-Ath6-HVSh-B0Iq-GPIb', '000b4673-f788-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('000b4673-f788-11e3-8c8a-005056be1f7b-BHdz-FpKp-Ap0p-HRPT-BmGG-GAwB', '000b4673-f788-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'голубой', ''),
('000b4673-f788-11e3-8c8a-005056be1f7b-Bhtz-FNAE-AgnL-Hnn8-Bo06-Gxzj', '000b4673-f788-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('000b4673-f788-11e3-8c8a-005056be1f7b-BJG2-FC0F-Avb4-HgC9-BNDd-G45F', '000b4673-f788-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '800', 'г'),
('000b4673-f788-11e3-8c8a-005056be1f7b-BkBJ-FQ7a-Ab9y-HG23-B6Ym-Guln', '000b4673-f788-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('000b4673-f788-11e3-8c8a-005056be1f7b-BW8I-Fznw-AMkq-H5RK-BCYo-G3Dz', '000b4673-f788-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('000b4673-f788-11e3-8c8a-005056be1f7b-BzIQ-FAv4-A8a4-H4Nt-Bcxu-GlEr', '000b4673-f788-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('030b5cff-f78e-11e3-8c8a-005056be1f7b-B0rI-FZBZ-AlRV-HTiE-BNGa-G6sT', '030b5cff-f78e-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('030b5cff-f78e-11e3-8c8a-005056be1f7b-BBAr-FGwG-Ar7J-HKg3-BAnL-GMw5', '030b5cff-f78e-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'бирюзовый', ''),
('030b5cff-f78e-11e3-8c8a-005056be1f7b-BG5P-FQEw-AIEZ-HURM-BP6s-GRt4', '030b5cff-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('030b5cff-f78e-11e3-8c8a-005056be1f7b-BiVs-Fm4w-AHM2-HoME-B8S9-GMiD', '030b5cff-f78e-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('030b5cff-f78e-11e3-8c8a-005056be1f7b-BngC-FyLQ-AlyD-HiEf-BSFg-G0MS', '030b5cff-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('030b5cff-f78e-11e3-8c8a-005056be1f7b-BNok-Fi9J-AnLP-HDG9-BXxy-G3XT', '030b5cff-f78e-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1900', 'г'),
('030b5cff-f78e-11e3-8c8a-005056be1f7b-Br1f-Fjer-AnbA-Hmoj-BpoR-GxDT', '030b5cff-f78e-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('047805a5-fe8c-11e3-bbdb-005056be1f7b-B9uJ-Fox3-AAms-HnCY-BwOf-GmPo', '047805a5-fe8c-11e3-bbdb-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('047805a5-fe8c-11e3-bbdb-005056be1f7b-Ba90-Foz5-A0yy-HE8W-B897-GdsJ', '047805a5-fe8c-11e3-bbdb-005056be1f7b', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для стен', ''),
('047805a5-fe8c-11e3-bbdb-005056be1f7b-BB1K-Fydw-A1w5-HzUF-BOvE-GNa4', '047805a5-fe8c-11e3-bbdb-005056be1f7b', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для водно-дисперсионных красок', ''),
('047805a5-fe8c-11e3-bbdb-005056be1f7b-BBjf-FtNi-AHAw-HnmC-BSI9-GiKY', '047805a5-fe8c-11e3-bbdb-005056be1f7b', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '2.5', 'л'),
('047805a5-fe8c-11e3-bbdb-005056be1f7b-Bf7Q-FCa3-AykN-H16V-B04F-GJi3', '047805a5-fe8c-11e3-bbdb-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('047805a5-fe8c-11e3-bbdb-005056be1f7b-BIas-F7fp-ATdo-HP7W-BZ8N-Gjvq', '047805a5-fe8c-11e3-bbdb-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('047805a5-fe8c-11e3-bbdb-005056be1f7b-BiFi-Fk5t-ACeA-H1c2-B4Da-Grpv', '047805a5-fe8c-11e3-bbdb-005056be1f7b', 'e765ba72-107d-11e3-8a5d-0050569a1080', 'база С', ''),
('047805a5-fe8c-11e3-bbdb-005056be1f7b-BIQl-Fygv-Abqy-HCEq-Bbnw-GAOq', '047805a5-fe8c-11e3-bbdb-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('047805a5-fe8c-11e3-bbdb-005056be1f7b-Bliy-FmUa-Al1q-HPJm-BKCk-GY2Z', '047805a5-fe8c-11e3-bbdb-005056be1f7b', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('047805a5-fe8c-11e3-bbdb-005056be1f7b-BMHz-FAJ4-Arlh-Hdlv-BKVC-GVHJ', '047805a5-fe8c-11e3-bbdb-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('047805a5-fe8c-11e3-bbdb-005056be1f7b-BuQK-FvHn-AnAq-HDsW-By1n-GapJ', '047805a5-fe8c-11e3-bbdb-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('04834f06-93b0-11e3-82a4-005056be1f7b-BaLY-FeVw-AcYR-H1HJ-BQwI-GFu1', '04834f06-93b0-11e3-82a4-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'грунт-эмаль', ''),
('04834f06-93b0-11e3-82a4-005056be1f7b-BgYR-FHeU-AYbG-H3Qj-BACv-GC33', '04834f06-93b0-11e3-82a4-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('04834f06-93b0-11e3-82a4-005056be1f7b-BHaq-FWC6-AHZU-Hsac-BH71-GYEU', '04834f06-93b0-11e3-82a4-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('04834f06-93b0-11e3-82a4-005056be1f7b-BJzo-Ftxf-AQ3k-HGDR-B7we-GycH', '04834f06-93b0-11e3-82a4-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('04834f06-93b0-11e3-82a4-005056be1f7b-Bo0z-F9sP-AazM-HROQ-Bl8s-GXwD', '04834f06-93b0-11e3-82a4-005056be1f7b', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для ржавчины', ''),
('04834f06-93b0-11e3-82a4-005056be1f7b-Bscw-FzUC-AYVE-HKX8-BCeX-Gt2a', '04834f06-93b0-11e3-82a4-005056be1f7b', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '2', 'л'),
('04834f06-93b0-11e3-82a4-005056be1f7b-BtN2-Fqn8-At5D-H5Cr-BqKE-Gcfu', '04834f06-93b0-11e3-82a4-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'красный', ''),
('04834f06-93b0-11e3-82a4-005056be1f7b-BwMC-FzHE-AhxP-HmPv-BWYk-GBHY', '04834f06-93b0-11e3-82a4-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('05caaed0-f790-11e3-8c8a-005056be1f7b-BAiA-F4My-AW9W-H41c-BJN5-GIMy', '05caaed0-f790-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '20000', 'г'),
('05caaed0-f790-11e3-8c8a-005056be1f7b-BlRs-FlH7-AKq4-Hoyd-Bvig-G2FQ', '05caaed0-f790-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('05caaed0-f790-11e3-8c8a-005056be1f7b-BrPm-Fi5x-AfXu-H8aO-B0Lc-GFjs', '05caaed0-f790-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'охра', ''),
('05caaed0-f790-11e3-8c8a-005056be1f7b-Bs5j-Fnol-Ad8x-HqZz-B0GF-Glp0', '05caaed0-f790-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('05caaed0-f790-11e3-8c8a-005056be1f7b-BtDF-Fhtf-AWsm-HcUR-Bbtc-Gy4k', '05caaed0-f790-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('05caaed0-f790-11e3-8c8a-005056be1f7b-BWc0-F05T-ARVC-HtJ6-BUvN-GDXU', '05caaed0-f790-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('05caaed0-f790-11e3-8c8a-005056be1f7b-BZKW-FJHx-AYH0-H1Nj-Bi7d-GIjH', '05caaed0-f790-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('05caaed2-f790-11e3-8c8a-005056be1f7b-B2HP-FwcA-AjlE-HMHh-BpbD-G9nq', '05caaed2-f790-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('05caaed2-f790-11e3-8c8a-005056be1f7b-BbCG-FIbL-Aq3A-HwHE-Bfwd-G32y', '05caaed2-f790-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('05caaed2-f790-11e3-8c8a-005056be1f7b-Bmfw-FDEe-Aav9-HXeO-BtWW-G9Iz', '05caaed2-f790-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '20000', 'г'),
('05caaed2-f790-11e3-8c8a-005056be1f7b-BoYW-FFVa-A9jH-H8an-BCED-GewX', '05caaed2-f790-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'серый', ''),
('05caaed2-f790-11e3-8c8a-005056be1f7b-BS1X-FZyx-AC13-HGVp-Bexr-Gk6I', '05caaed2-f790-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('05caaed2-f790-11e3-8c8a-005056be1f7b-BTgS-FMmo-A2Gb-HirW-Brd8-GtQV', '05caaed2-f790-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('05caaed2-f790-11e3-8c8a-005056be1f7b-BwlB-FwXI-A245-HUvw-BIDn-Ggdc', '05caaed2-f790-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('06e98e75-f78f-11e3-8c8a-005056be1f7b-B0pl-FFnt-AJlP-HgAC-B4Ur-GS6S', '06e98e75-f78f-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('06e98e75-f78f-11e3-8c8a-005056be1f7b-B2GA-FY8J-ADvG-H9HD-B9fX-GYxW', '06e98e75-f78f-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('06e98e75-f78f-11e3-8c8a-005056be1f7b-BIy7-F3YR-ApNf-HiCG-BYCv-GAIZ', '06e98e75-f78f-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('06e98e75-f78f-11e3-8c8a-005056be1f7b-BRqp-FwOs-A3nv-Hoo4-BDZL-GEZ0', '06e98e75-f78f-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '6000', 'г'),
('06e98e75-f78f-11e3-8c8a-005056be1f7b-BToZ-Flk1-A4ot-HjVw-ByN4-Gzl1', '06e98e75-f78f-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('06e98e75-f78f-11e3-8c8a-005056be1f7b-BuRA-FAyA-ADrU-Hu0Q-BCIE-G0Bc', '06e98e75-f78f-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('06e98e75-f78f-11e3-8c8a-005056be1f7b-BXTa-FR05-A2CR-H6bR-BD3q-GqDP', '06e98e75-f78f-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'шоколадный', ''),
('07027c6c-7f47-11e3-af7c-005056be1f7b-B5yp-FPIs-ARfQ-HSIu-BS8L-GL5s', '07027c6c-7f47-11e3-af7c-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('07027c6c-7f47-11e3-af7c-005056be1f7b-B8GY-Fy5c-ASXi-HzUh-BjDD-GlA3', '07027c6c-7f47-11e3-af7c-005056be1f7b', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'латексная', ''),
('07027c6c-7f47-11e3-af7c-005056be1f7b-BDcS-FkwX-ATKb-H88B-B66I-GTtD', '07027c6c-7f47-11e3-af7c-005056be1f7b', 'e765ba72-107d-11e3-8a5d-0050569a1080', 'база А', ''),
('07027c6c-7f47-11e3-af7c-005056be1f7b-Be0O-F68M-A84H-HFN2-BJ04-GkUv', '07027c6c-7f47-11e3-af7c-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('07027c6c-7f47-11e3-af7c-005056be1f7b-Be8i-FvQq-Afio-Hqti-BZAQ-GxWq', '07027c6c-7f47-11e3-af7c-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('07027c6c-7f47-11e3-af7c-005056be1f7b-BRrY-FWZp-Av2R-HXgF-BGa4-GvqC', '07027c6c-7f47-11e3-af7c-005056be1f7b', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '5', 'л'),
('07027c6c-7f47-11e3-af7c-005056be1f7b-BVMM-FLHO-AB7V-HTDB-BXhB-Gmd0', '07027c6c-7f47-11e3-af7c-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('07027c6c-7f47-11e3-af7c-005056be1f7b-BwCa-FU2v-A3bz-H6Cz-ByGS-GHqE', '07027c6c-7f47-11e3-af7c-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'шелковый матовый', ''),
('07027c6c-7f47-11e3-af7c-005056be1f7b-Bzb3-F7hF-AxqF-HrQZ-Bcml-Gpxt', '07027c6c-7f47-11e3-af7c-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'PARADE', ''),
('076d2137-4380-11de-8f53-000e0c431b58-B03S-FWvv-AJxZ-Hgve-Bx8B-GqZ7', '076d2137-4380-11de-8f53-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'черный', ''),
('076d2137-4380-11de-8f53-000e0c431b58-Ba2V-FzXG-ATLD-HV2d-BSpW-Gp7g', '076d2137-4380-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('076d2137-4380-11de-8f53-000e0c431b58-Bn8g-F3HJ-AEyb-H6YT-BgNp-GNlS', '076d2137-4380-11de-8f53-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для ржавчины', ''),
('076d2137-4380-11de-8f53-000e0c431b58-BoQs-FPES-A1ZH-HvcR-BUFO-G29W', '076d2137-4380-11de-8f53-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'грунт-эмаль', ''),
('076d2137-4380-11de-8f53-000e0c431b58-Bpp4-FkuO-AdFj-HQuR-BxKI-GJ0g', '076d2137-4380-11de-8f53-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('076d2137-4380-11de-8f53-000e0c431b58-BQTs-FTok-Ax8P-HKmL-BqR1-Gk3k', '076d2137-4380-11de-8f53-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('076d2137-4380-11de-8f53-000e0c431b58-Bx4W-FQJ0-AtW6-HEV4-BVUw-Gorh', '076d2137-4380-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('076d2137-4380-11de-8f53-000e0c431b58-ByWq-FXmb-Apal-Hyjl-BUz5-GDJj', '076d2137-4380-11de-8f53-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.75', 'л'),
('076d2139-4380-11de-8f53-000e0c431b58-B6Hn-Fb87-A7SY-Hghq-BDKx-Gky1', '076d2139-4380-11de-8f53-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для ржавчины', ''),
('076d2139-4380-11de-8f53-000e0c431b58-BGJP-FyWD-AgZ9-HOew-BirI-GvrV', '076d2139-4380-11de-8f53-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'черный', ''),
('076d2139-4380-11de-8f53-000e0c431b58-BKE5-Fz8Y-Ay0A-H8RZ-BbmV-GW8g', '076d2139-4380-11de-8f53-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('076d2139-4380-11de-8f53-000e0c431b58-BnGg-FnDy-ADfb-HZ2Y-B6mb-GKdu', '076d2139-4380-11de-8f53-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '2', 'л'),
('076d2139-4380-11de-8f53-000e0c431b58-BQXy-FOUv-AEYo-H4e0-BClI-GRZe', '076d2139-4380-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('076d2139-4380-11de-8f53-000e0c431b58-BuDP-F1Su-Ao4f-HzSf-BUcj-GORh', '076d2139-4380-11de-8f53-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('076d2139-4380-11de-8f53-000e0c431b58-BV75-FUKY-AGtG-HOex-BkvL-GZ0f', '076d2139-4380-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('076d2139-4380-11de-8f53-000e0c431b58-BZ2W-F1QO-AOM2-HpXU-BaSc-GDtZ', '076d2139-4380-11de-8f53-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'грунт-эмаль', ''),
('076d213b-4380-11de-8f53-000e0c431b58-B3Ll-Ftlr-AtOJ-HeEl-BYFj-G7Ko', '076d213b-4380-11de-8f53-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('076d213b-4380-11de-8f53-000e0c431b58-BA8i-FEEt-ANNw-HwH1-BSjr-GBQc', '076d213b-4380-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('076d213b-4380-11de-8f53-000e0c431b58-Bc2s-Fqu2-A6I2-HaG0-Bmbu-G1c4', '076d213b-4380-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('076d213b-4380-11de-8f53-000e0c431b58-BmJL-FLKp-AAnC-HAsJ-BnfA-GdcV', '076d213b-4380-11de-8f53-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для ржавчины', ''),
('076d213b-4380-11de-8f53-000e0c431b58-BqX2-FcK9-ATci-HBez-BdXA-GEGm', '076d213b-4380-11de-8f53-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('076d213b-4380-11de-8f53-000e0c431b58-BVuO-FAJJ-AfpE-HHKI-BIDi-G5Dg', '076d213b-4380-11de-8f53-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('076d213b-4380-11de-8f53-000e0c431b58-Bw11-F7V6-AitA-HHqK-BwWi-Gnzs', '076d213b-4380-11de-8f53-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.75', 'л'),
('076d213b-4380-11de-8f53-000e0c431b58-BZAF-FZIv-Ak5I-HIi9-B2KH-GCVR', '076d213b-4380-11de-8f53-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'грунт-эмаль', ''),
('076d213d-4380-11de-8f53-000e0c431b58-B2d9-FDSa-AotN-HBP5-BOCn-Gw3x', '076d213d-4380-11de-8f53-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('076d213d-4380-11de-8f53-000e0c431b58-BhWK-FI7W-A12M-Hybl-BbwW-GfrN', '076d213d-4380-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('076d213d-4380-11de-8f53-000e0c431b58-Bj00-FRL7-AGga-HRBE-BY3i-GX71', '076d213d-4380-11de-8f53-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '2', 'л'),
('076d213d-4380-11de-8f53-000e0c431b58-Bqxt-FKEw-APAl-HjMr-B619-GkYm', '076d213d-4380-11de-8f53-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('076d213d-4380-11de-8f53-000e0c431b58-BSkc-Ft3d-AxRW-HVpS-BMd4-Gxfg', '076d213d-4380-11de-8f53-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'грунт-эмаль', ''),
('076d213d-4380-11de-8f53-000e0c431b58-BUvE-F62R-ABTD-HaPR-BB6E-GvGJ', '076d213d-4380-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('076d213d-4380-11de-8f53-000e0c431b58-Bwsh-F1Jw-AHLs-HL7z-BUeL-GfnH', '076d213d-4380-11de-8f53-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('076d213d-4380-11de-8f53-000e0c431b58-Bylk-FBm1-A723-Hjnu-BXMu-GWe6', '076d213d-4380-11de-8f53-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для ржавчины', ''),
('076d213f-4380-11de-8f53-000e0c431b58-B54h-FlO6-A0tI-HXsN-BPZK-GNBP', '076d213f-4380-11de-8f53-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.75', 'л'),
('076d213f-4380-11de-8f53-000e0c431b58-B5c3-Fzxj-AOsr-HUXY-BfMY-G9F2', '076d213f-4380-11de-8f53-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('076d213f-4380-11de-8f53-000e0c431b58-Bbst-FiDJ-ATTE-HdP9-BmKR-GdDu', '076d213f-4380-11de-8f53-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'коричневый', ''),
('076d213f-4380-11de-8f53-000e0c431b58-Bi4B-FvJ0-Ai26-HUqY-B6HG-GpqK', '076d213f-4380-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('076d213f-4380-11de-8f53-000e0c431b58-Br78-FlFh-Aj0p-Ha5j-BbyB-GUoy', '076d213f-4380-11de-8f53-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('076d213f-4380-11de-8f53-000e0c431b58-BTSd-FbqL-Ao7l-HzJn-BF4N-GUTO', '076d213f-4380-11de-8f53-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'грунт-эмаль', ''),
('076d213f-4380-11de-8f53-000e0c431b58-BukO-FZBJ-A9c9-HAxm-Bzrf-GXTt', '076d213f-4380-11de-8f53-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для ржавчины', ''),
('076d213f-4380-11de-8f53-000e0c431b58-By0d-F3ds-A2F4-HIj8-B4I2-G64B', '076d213f-4380-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('076d2141-4380-11de-8f53-000e0c431b58-B7Oh-F3qY-AU36-Hdps-BTHb-GVne', '076d2141-4380-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('076d2141-4380-11de-8f53-000e0c431b58-BctC-FgDX-AL2V-HzIQ-B9O7-G9X1', '076d2141-4380-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('076d2141-4380-11de-8f53-000e0c431b58-Be0Y-FMQ9-ARZf-HmF4-BnKm-GhKz', '076d2141-4380-11de-8f53-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '2', 'л'),
('076d2141-4380-11de-8f53-000e0c431b58-BEt4-FAMj-Asfq-HJ2T-BokI-G0ow', '076d2141-4380-11de-8f53-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('076d2141-4380-11de-8f53-000e0c431b58-BFqA-FJ49-A2r7-Hb1b-BLhJ-Gwwz', '076d2141-4380-11de-8f53-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'коричневый', ''),
('076d2141-4380-11de-8f53-000e0c431b58-BG4V-FxDM-AGrw-HOrb-BALa-GYXr', '076d2141-4380-11de-8f53-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для ржавчины', ''),
('076d2141-4380-11de-8f53-000e0c431b58-BsyV-FEoe-AUms-HRkF-BIgU-GqYB', '076d2141-4380-11de-8f53-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('076d2141-4380-11de-8f53-000e0c431b58-BXpG-F3SM-Aw6X-HZdh-BOkb-GjXe', '076d2141-4380-11de-8f53-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'грунт-эмаль', ''),
('076d2143-4380-11de-8f53-000e0c431b58-B18U-FIk5-A9sA-HNp7-B48b-GajY', '076d2143-4380-11de-8f53-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'грунт-эмаль', ''),
('076d2143-4380-11de-8f53-000e0c431b58-B27c-Fs7L-AS6R-Hnkz-BIFP-G76q', '076d2143-4380-11de-8f53-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.75', 'л'),
('076d2143-4380-11de-8f53-000e0c431b58-BbKV-Fyjy-AWyY-HxYv-BSKP-Get9', '076d2143-4380-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('076d2143-4380-11de-8f53-000e0c431b58-Bfay-FzaV-Ai1T-HcmG-B6MQ-GMLN', '076d2143-4380-11de-8f53-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('076d2143-4380-11de-8f53-000e0c431b58-BkJR-F98p-AuP1-HAtk-B9GU-Gphf', '076d2143-4380-11de-8f53-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('076d2143-4380-11de-8f53-000e0c431b58-BReg-Fl7J-As2V-H0Eg-BM7c-GooZ', '076d2143-4380-11de-8f53-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для ржавчины', ''),
('076d2143-4380-11de-8f53-000e0c431b58-BwdL-Fjs3-AAtE-HaIb-BHfH-GOYZ', '076d2143-4380-11de-8f53-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'красно-коричневый', ''),
('076d2143-4380-11de-8f53-000e0c431b58-BWur-FbKz-A3SU-HAhs-Ba94-Gvwc', '076d2143-4380-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('076d2145-4380-11de-8f53-000e0c431b58-B2mW-FPZt-AfJC-HcvB-B0j7-G01q', '076d2145-4380-11de-8f53-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для ржавчины', ''),
('076d2145-4380-11de-8f53-000e0c431b58-B7q3-FpkL-A6cd-H1je-Bt7W-GLSa', '076d2145-4380-11de-8f53-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('076d2145-4380-11de-8f53-000e0c431b58-BAoO-Fs9Q-A2i0-HLtm-BGfc-G8xa', '076d2145-4380-11de-8f53-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'красно-коричневый', ''),
('076d2145-4380-11de-8f53-000e0c431b58-Biv6-FMrJ-Ax6t-H5SQ-B2S5-GGA4', '076d2145-4380-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('076d2145-4380-11de-8f53-000e0c431b58-BjlL-FEu1-A3S3-H8c9-BtTk-GGjA', '076d2145-4380-11de-8f53-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'грунт-эмаль', ''),
('076d2145-4380-11de-8f53-000e0c431b58-BW3b-FWDL-A9Kq-HbHe-B2pP-Gx37', '076d2145-4380-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('076d2145-4380-11de-8f53-000e0c431b58-BWQk-FDss-AhjX-HwWQ-BtT7-Gm9h', '076d2145-4380-11de-8f53-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('076d2145-4380-11de-8f53-000e0c431b58-Bx5A-FRuj-Avef-HIpx-BiCE-GJFw', '076d2145-4380-11de-8f53-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '2', 'л'),
('076d2147-4380-11de-8f53-000e0c431b58-BaS8-FwQ5-A9fk-HM8d-Bzq1-GEEH', '076d2147-4380-11de-8f53-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для ржавчины', ''),
('076d2147-4380-11de-8f53-000e0c431b58-BsCN-FNYQ-Adlp-H5fm-BzTY-GzAt', '076d2147-4380-11de-8f53-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('076d2147-4380-11de-8f53-000e0c431b58-BsWO-FYRu-AAHE-HZ7E-BIPb-Gy4A', '076d2147-4380-11de-8f53-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.75', 'л'),
('076d2147-4380-11de-8f53-000e0c431b58-BSWp-Foim-AY8W-H98L-BOpO-Gc4m', '076d2147-4380-11de-8f53-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('076d2147-4380-11de-8f53-000e0c431b58-BVLq-Fid5-AzF3-Hicp-Bl31-GAXM', '076d2147-4380-11de-8f53-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'серый', ''),
('076d2147-4380-11de-8f53-000e0c431b58-Bx1l-FEqs-AN8e-HWDP-BNYb-G485', '076d2147-4380-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('076d2147-4380-11de-8f53-000e0c431b58-ByFO-F3eL-A8na-HZbU-BZ2m-GWo4', '076d2147-4380-11de-8f53-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'грунт-эмаль', ''),
('076d2147-4380-11de-8f53-000e0c431b58-Byw0-FqUc-AV7V-HM7t-BYuj-G0yQ', '076d2147-4380-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('076d2149-4380-11de-8f53-000e0c431b58-B5Fo-F4hy-AxBL-HpEy-BaAB-GWhF', '076d2149-4380-11de-8f53-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('076d2149-4380-11de-8f53-000e0c431b58-B7M7-FhEH-AiSW-HGW0-BLdF-GPiU', '076d2149-4380-11de-8f53-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('076d2149-4380-11de-8f53-000e0c431b58-BA6x-FP2b-ADHA-H7Bd-BWuu-Gyoq', '076d2149-4380-11de-8f53-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'грунт-эмаль', ''),
('076d2149-4380-11de-8f53-000e0c431b58-BDgz-FXgC-AdA9-HIkb-BFT6-Gz6B', '076d2149-4380-11de-8f53-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'серый', ''),
('076d2149-4380-11de-8f53-000e0c431b58-BeGY-F1Nv-A1YP-H6ox-BPj3-G5ca', '076d2149-4380-11de-8f53-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '2', 'л'),
('076d2149-4380-11de-8f53-000e0c431b58-BGGE-FFOp-AgU9-HcJ5-BeX3-GCnu', '076d2149-4380-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('076d2149-4380-11de-8f53-000e0c431b58-BN8i-FQ34-AjLl-H2LB-BOOi-GEmE', '076d2149-4380-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('076d2149-4380-11de-8f53-000e0c431b58-BsQc-F57g-AsWh-HutE-B1OL-GPFY', '076d2149-4380-11de-8f53-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для ржавчины', ''),
('076d214b-4380-11de-8f53-000e0c431b58-B5rE-FTOi-AOX2-H50s-B0J9-GBPK', '076d214b-4380-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('076d214b-4380-11de-8f53-000e0c431b58-B5yt-FJZs-A4cl-HTky-B9QP-GByl', '076d214b-4380-11de-8f53-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('076d214b-4380-11de-8f53-000e0c431b58-BACR-FU0C-AFCr-Hoyh-BmTP-GDaS', '076d214b-4380-11de-8f53-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'грунт-эмаль', ''),
('076d214b-4380-11de-8f53-000e0c431b58-BDF6-FPUR-AruT-H8uu-BCpj-Gwz9', '076d214b-4380-11de-8f53-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.75', 'л'),
('076d214b-4380-11de-8f53-000e0c431b58-Bfsa-FHCB-A6BS-HLCH-BxFM-GtVh', '076d214b-4380-11de-8f53-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для ржавчины', ''),
('076d214b-4380-11de-8f53-000e0c431b58-BKPC-FGLn-Aibu-HAS8-B1UN-GTec', '076d214b-4380-11de-8f53-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'зеленый', ''),
('076d214b-4380-11de-8f53-000e0c431b58-Bpyl-FZy5-AXpP-Hk9t-BD4a-GIMp', '076d214b-4380-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('076d214b-4380-11de-8f53-000e0c431b58-BqbC-FiVB-AQUL-HPWb-BZBQ-GAbE', '076d214b-4380-11de-8f53-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('076d214d-4380-11de-8f53-000e0c431b58-B6T2-F3dE-A1QN-HP9x-Br6v-Gzdl', '076d214d-4380-11de-8f53-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'грунт-эмаль', ''),
('076d214d-4380-11de-8f53-000e0c431b58-B79H-Fi1m-AOIH-HVau-BP5K-G75I', '076d214d-4380-11de-8f53-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для ржавчины', ''),
('076d214d-4380-11de-8f53-000e0c431b58-B7b5-FaCP-AYpl-H2eq-BSfH-GSn4', '076d214d-4380-11de-8f53-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('076d214d-4380-11de-8f53-000e0c431b58-BBaA-FHwM-Awxf-HiRZ-Bu9v-GdAn', '076d214d-4380-11de-8f53-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('076d214d-4380-11de-8f53-000e0c431b58-BBgK-Ft7M-AVkG-HWMp-BATv-Ge4M', '076d214d-4380-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('076d214d-4380-11de-8f53-000e0c431b58-BeZr-F099-AZs8-HKM8-BxJZ-Grjb', '076d214d-4380-11de-8f53-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '2', 'л'),
('076d214d-4380-11de-8f53-000e0c431b58-BHGd-FkaL-AbgV-HgtZ-BZCI-GCcD', '076d214d-4380-11de-8f53-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'зеленый', ''),
('076d214d-4380-11de-8f53-000e0c431b58-BqVt-FC3c-AbRe-HkU8-BnWd-GyFa', '076d214d-4380-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('079b44f8-f788-11e3-8c8a-005056be1f7b-B7CF-FXSa-AHGd-H6nu-BQAN-GowR', '079b44f8-f788-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('079b44f8-f788-11e3-8c8a-005056be1f7b-BcjK-FBI3-AGjY-H3qO-BKnR-GPBj', '079b44f8-f788-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('079b44f8-f788-11e3-8c8a-005056be1f7b-BqIq-FKET-A5UT-HI0G-BZbq-Gjcy', '079b44f8-f788-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '800', 'г'),
('079b44f8-f788-11e3-8c8a-005056be1f7b-BrEt-FNg1-AMCY-HkaB-Bztv-Gzh3', '079b44f8-f788-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('079b44f8-f788-11e3-8c8a-005056be1f7b-BTu0-FxG0-AJye-HzI4-BRlC-GhTi', '079b44f8-f788-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'шоколадный', ''),
('079b44f8-f788-11e3-8c8a-005056be1f7b-BXdX-FwDy-Ax3i-HisF-Bagv-GHzR', '079b44f8-f788-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('079b44f8-f788-11e3-8c8a-005056be1f7b-Byqq-FTfz-AMxa-HPVt-BxDy-GhQU', '079b44f8-f788-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('0916172c-947c-11e3-8d88-005056be1f7b-B879-FpzA-Ae3e-HTw6-BNd3-GKDP', '0916172c-947c-11e3-8d88-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('0916172c-947c-11e3-8d88-005056be1f7b-BcA2-F7Ew-AgD4-Hac1-B7PP-G7O9', '0916172c-947c-11e3-8d88-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('0916172c-947c-11e3-8d88-005056be1f7b-BCzR-F78A-ApRs-H4By-BCez-G4a4', '0916172c-947c-11e3-8d88-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('0916172c-947c-11e3-8d88-005056be1f7b-Bhk4-Fqdp-AGEZ-Hdny-BpMs-GtQ7', '0916172c-947c-11e3-8d88-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '15000', 'г'),
('0916172c-947c-11e3-8d88-005056be1f7b-Bj5E-FEN2-A0bU-H2lY-BHL3-GraD', '0916172c-947c-11e3-8d88-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'штукатурка структурная', ''),
('0916172c-947c-11e3-8d88-005056be1f7b-Bjej-FPK1-AJzJ-H4wZ-BktW-GiZM', '0916172c-947c-11e3-8d88-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('0916172c-947c-11e3-8d88-005056be1f7b-BlPY-F7H0-AVPL-HO7m-BReM-GKLq', '0916172c-947c-11e3-8d88-005056be1f7b', '1ea6fcc4-d206-11e4-9be0-005056be1f7c', '0,002', 'мм'),
('0916172c-947c-11e3-8d88-005056be1f7b-Bq78-FkXZ-AaTp-HqQ5-BpTt-G7Qr', '0916172c-947c-11e3-8d88-005056be1f7b', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'декоративная с эффектом "зернистости"', ''),
('09f4768d-f78e-11e3-8c8a-005056be1f7b-B9sm-FXqJ-AE6z-Hbzn-BJ5F-GC9K', '09f4768d-f78e-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1900', 'г'),
('09f4768d-f78e-11e3-8c8a-005056be1f7b-BEc3-FDEk-Aqjx-HRmd-Bkt8-GKyr', '09f4768d-f78e-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('09f4768d-f78e-11e3-8c8a-005056be1f7b-Bf9i-FcsD-AyQ8-HPNz-BLlE-GmRP', '09f4768d-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('09f4768d-f78e-11e3-8c8a-005056be1f7b-BHek-FEtx-A45Z-H9hq-BOqX-G5xs', '09f4768d-f78e-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('09f4768d-f78e-11e3-8c8a-005056be1f7b-BJqp-FHVK-AoK9-Hmrm-BeNl-GDpT', '09f4768d-f78e-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('09f4768d-f78e-11e3-8c8a-005056be1f7b-BTar-Fz59-AUq7-HtfV-Bi4b-G736', '09f4768d-f78e-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'зеленый', ''),
('09f4768d-f78e-11e3-8c8a-005056be1f7b-BYPb-FpLg-AYZ8-Hoeh-Bzy8-Ghn3', '09f4768d-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('0d8fcbcd-99a8-11db-937f-000e0c431b59-B4cG-FgZf-AkUp-Hjgu-BfIP-G9GW', '0d8fcbcd-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'грунт', ''),
('0d8fcbcd-99a8-11db-937f-000e0c431b59-BCCX-FJ8W-AdTL-HCHe-Bj7M-GHH7', '0d8fcbcd-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('0d8fcbcd-99a8-11db-937f-000e0c431b59-BfD5-Fz95-Auki-HSP9-B0RB-GXb9', '0d8fcbcd-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('0d8fcbcd-99a8-11db-937f-000e0c431b59-Bmec-F8HH-AbrR-H8LQ-BdjA-GihD', '0d8fcbcd-99a8-11db-937f-000e0c431b59', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '4', 'л'),
('0d8fcbcd-99a8-11db-937f-000e0c431b59-BomD-FvJX-AnqG-H50T-BWyj-GyTg', '0d8fcbcd-99a8-11db-937f-000e0c431b59', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('0d8fcbcd-99a8-11db-937f-000e0c431b59-Bt5R-F68Z-AagV-Hmod-BjJg-Ge0f', '0d8fcbcd-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'PARADE', ''),
('0d8fcbcd-99a8-11db-937f-000e0c431b59-Byri-FKtY-A79T-H606-Bloh-GpZr', '0d8fcbcd-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('0d8fcbcd-99a8-11db-937f-000e0c431b59-BYuF-F8CU-A6Cm-H7ZE-B5J9-GME7', '0d8fcbcd-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('0d8fcbcf-99a8-11db-937f-000e0c431b59-Bd1k-FqzM-AAK5-H2j0-BONr-GkqD', '0d8fcbcf-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('0d8fcbcf-99a8-11db-937f-000e0c431b59-BefG-FyI6-AF0E-H6YM-B33D-Gdi3', '0d8fcbcf-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'PARADE', ''),
('0d8fcbcf-99a8-11db-937f-000e0c431b59-BFhD-FWfP-An9y-HnhV-Bqay-Gx8N', '0d8fcbcf-99a8-11db-937f-000e0c431b59', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('0d8fcbcf-99a8-11db-937f-000e0c431b59-BosV-FcV4-AyCU-HnzR-B2Iz-GYH8', '0d8fcbcf-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('0d8fcbcf-99a8-11db-937f-000e0c431b59-BPwp-FFE7-AlZr-Hm1Q-BxN6-G8pf', '0d8fcbcf-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'грунт', ''),
('0d8fcbcf-99a8-11db-937f-000e0c431b59-BqjC-Fkbm-Akpz-HRQg-BUuB-GbiK', '0d8fcbcf-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('0d8fcbcf-99a8-11db-937f-000e0c431b59-BTih-F9HE-AtnN-H9mT-BVr2-GZEX', '0d8fcbcf-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('0d8fcbcf-99a8-11db-937f-000e0c431b59-BWoK-Fbji-Aocb-Hr60-Bkmi-GnM0', '0d8fcbcf-99a8-11db-937f-000e0c431b59', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '10', 'л'),
('0d8fcbd1-99a8-11db-937f-000e0c431b59-B2Qk-FIqX-AlCo-HY6f-Bf5l-GfEB', '0d8fcbd1-99a8-11db-937f-000e0c431b59', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'с увеличенным выходом', ''),
('0d8fcbd1-99a8-11db-937f-000e0c431b59-B3aw-FA8h-AyMO-H4IO-BXAf-G9IL', '0d8fcbd1-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'грунт', ''),
('0d8fcbd1-99a8-11db-937f-000e0c431b59-B5Rr-FTZ6-ARGR-HZwd-BVRw-G41H', '0d8fcbd1-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('0d8fcbd1-99a8-11db-937f-000e0c431b59-B9G0-FJZW-AWuI-Hhvx-BOqF-G70e', '0d8fcbd1-99a8-11db-937f-000e0c431b59', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '2.5', 'л'),
('0d8fcbd1-99a8-11db-937f-000e0c431b59-BfTh-FiVF-AQ3K-HSWM-BVvL-GApq', '0d8fcbd1-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'PARADE', ''),
('0d8fcbd1-99a8-11db-937f-000e0c431b59-BgT8-F8B4-A8lf-HgOs-Bgef-GLjj', '0d8fcbd1-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('0d8fcbd1-99a8-11db-937f-000e0c431b59-BIK0-F1xz-AGlC-HCis-BhEB-GeBD', '0d8fcbd1-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('0d8fcbd1-99a8-11db-937f-000e0c431b59-BY0p-F5f5-AmBY-HHN8-BrVI-GqM7', '0d8fcbd1-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('0d8fcc0e-99a8-11db-937f-000e0c431b59-BcSL-FYsg-Aemc-Hb3I-BbYn-GKA0', '0d8fcc0e-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('0d8fcc0e-99a8-11db-937f-000e0c431b59-Bd0M-FplY-ACD0-HmcZ-Bq6s-G3Tb', '0d8fcc0e-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'PARADE', ''),
('0d8fcc0e-99a8-11db-937f-000e0c431b59-Bgfs-FlVT-A0NL-HlLW-Bclk-GZZE', '0d8fcc0e-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('0d8fcc0e-99a8-11db-937f-000e0c431b59-Bk2V-FtCR-A1sE-HzkY-B33m-G9L2', '0d8fcc0e-99a8-11db-937f-000e0c431b59', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('0d8fcc0e-99a8-11db-937f-000e0c431b59-BOD0-FNqc-AnWX-HVOr-Bwoe-G1fu', '0d8fcc0e-99a8-11db-937f-000e0c431b59', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '2.5', 'л'),
('0d8fcc0e-99a8-11db-937f-000e0c431b59-Bxgc-FIKU-Adxq-Hyns-Bu2v-GtFc', '0d8fcc0e-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('0d8fcc0e-99a8-11db-937f-000e0c431b59-BZO7-FydD-A3H6-HaVF-B568-GPpA', '0d8fcc0e-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый матовый', ''),
('0d8fcc0e-99a8-11db-937f-000e0c431b59-BZxE-F2P7-AArV-Ho3V-BnWU-GzB6', '0d8fcc0e-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('0d8fcc10-99a8-11db-937f-000e0c431b59-B5Ul-FmoV-AVqF-H1vR-BDOo-GRB0', '0d8fcc10-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('0d8fcc10-99a8-11db-937f-000e0c431b59-B6yh-FOxh-ASfT-HFmw-BIhH-GtJv', '0d8fcc10-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('0d8fcc10-99a8-11db-937f-000e0c431b59-BcXN-FxUn-AxiT-H9AE-Brww-GHcC', '0d8fcc10-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый матовый', ''),
('0d8fcc10-99a8-11db-937f-000e0c431b59-BFfb-FKVM-AbZa-HGqc-BFlR-Gn1E', '0d8fcc10-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'PARADE', ''),
('0d8fcc10-99a8-11db-937f-000e0c431b59-BKJk-FeOM-ARXu-HYG4-BJLZ-GlVu', '0d8fcc10-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('0d8fcc10-99a8-11db-937f-000e0c431b59-Bwsa-FqPw-A2is-HTus-BBtf-GFLN', '0d8fcc10-99a8-11db-937f-000e0c431b59', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('0d8fcc10-99a8-11db-937f-000e0c431b59-BxxJ-FO51-Aq0c-H8mS-BCxc-GmSr', '0d8fcc10-99a8-11db-937f-000e0c431b59', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '10', 'л'),
('0d8fcc10-99a8-11db-937f-000e0c431b59-BzjE-Fj8K-AdHV-H3sr-Bnff-GxuZ', '0d8fcc10-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('0d8fcc12-99a8-11db-937f-000e0c431b59-B9wD-FcsX-AMAU-H7aA-BNpL-Gcvs', '0d8fcc12-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('0d8fcc12-99a8-11db-937f-000e0c431b59-Bese-FrL5-A0Hg-H03r-BErJ-G0PX', '0d8fcc12-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('0d8fcc12-99a8-11db-937f-000e0c431b59-BiQ4-FEQw-AwUe-H6Ut-BS7u-GZqR', '0d8fcc12-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('0d8fcc12-99a8-11db-937f-000e0c431b59-BLsz-FjDE-AQ1s-HvrO-Bgeu-G9n5', '0d8fcc12-99a8-11db-937f-000e0c431b59', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('0d8fcc12-99a8-11db-937f-000e0c431b59-BmAH-Ftgz-Ae81-HWF2-BKjj-GoRv', '0d8fcc12-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'PARADE', ''),
('0d8fcc12-99a8-11db-937f-000e0c431b59-BPKO-FFhU-A8r5-HhWL-BS6b-GMAs', '0d8fcc12-99a8-11db-937f-000e0c431b59', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '5', 'л'),
('0d8fcc12-99a8-11db-937f-000e0c431b59-BSHs-F06V-ArqN-HdZS-B6lA-GvLE', '0d8fcc12-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый матовый', ''),
('0d8fcc12-99a8-11db-937f-000e0c431b59-Bzc6-FhNm-AvuH-Hfsu-BaB3-GIAx', '0d8fcc12-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('0d8fcc1c-99a8-11db-937f-000e0c431b59-BDB3-FtZm-AG3J-HTJb-B3aE-G45t', '0d8fcc1c-99a8-11db-937f-000e0c431b59', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'влагопрочная', ''),
('0d8fcc1c-99a8-11db-937f-000e0c431b59-BGTT-FYYp-AB9g-Hrh5-BGUs-GDrG', '0d8fcc1c-99a8-11db-937f-000e0c431b59', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('0d8fcc1c-99a8-11db-937f-000e0c431b59-BICZ-FSVi-AtN9-HxH4-BhZZ-GJh0', '0d8fcc1c-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('0d8fcc1c-99a8-11db-937f-000e0c431b59-BN4y-FtkV-Aoqp-HXuW-BdgM-GRRj', '0d8fcc1c-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('0d8fcc1c-99a8-11db-937f-000e0c431b59-BNXb-F6zl-ABdy-HJ0v-BqIy-GGaK', '0d8fcc1c-99a8-11db-937f-000e0c431b59', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '2.5', 'л'),
('0d8fcc1c-99a8-11db-937f-000e0c431b59-BoKY-Fn9f-Ahf5-H7pc-B64z-GXyp', '0d8fcc1c-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('0d8fcc1c-99a8-11db-937f-000e0c431b59-BQnB-FepX-Al41-HDbs-B3ol-GrXL', '0d8fcc1c-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('0d8fcc1c-99a8-11db-937f-000e0c431b59-BRgm-FIjD-A1cs-HbKG-BnNI-Gg7h', '0d8fcc1c-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'PARADE', ''),
('0d8fcc1c-99a8-11db-937f-000e0c431b59-Bwzy-FvW0-AVcN-HCWH-BOcb-Gh2z', '0d8fcc1c-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый матовый', ''),
('0d8fcc1e-99a8-11db-937f-000e0c431b59-B30S-FiQ4-AxCL-HFvB-BeUO-GQBK', '0d8fcc1e-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('0d8fcc1e-99a8-11db-937f-000e0c431b59-B9Vx-FJaj-AL65-HZL6-BkzF-GI4t', '0d8fcc1e-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'PARADE', ''),
('0d8fcc1e-99a8-11db-937f-000e0c431b59-BiMw-Fq7X-AIXb-Hef9-BuJM-GsRg', '0d8fcc1e-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('0d8fcc1e-99a8-11db-937f-000e0c431b59-BjXe-Fdxq-AZXf-HegZ-BNtW-GVKj', '0d8fcc1e-99a8-11db-937f-000e0c431b59', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '10', 'л'),
('0d8fcc1e-99a8-11db-937f-000e0c431b59-BkGi-Fzhl-Amtn-Hvuz-BVTN-G1xB', '0d8fcc1e-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('0d8fcc1e-99a8-11db-937f-000e0c431b59-BM8H-FaMP-A79P-HaDx-BMCI-GAMj', '0d8fcc1e-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('0d8fcc1e-99a8-11db-937f-000e0c431b59-BnJi-FEoD-ADYN-HPHf-Bw0e-GEiv', '0d8fcc1e-99a8-11db-937f-000e0c431b59', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'влагопрочная', ''),
('0d8fcc1e-99a8-11db-937f-000e0c431b59-BoN9-FHUJ-Arvp-HRkP-BvSR-Gt1Y', '0d8fcc1e-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый матовый', ''),
('0d8fcc1e-99a8-11db-937f-000e0c431b59-BrC8-FiHz-AWXI-Htlb-BbDW-GHhP', '0d8fcc1e-99a8-11db-937f-000e0c431b59', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('0d8fcc20-99a8-11db-937f-000e0c431b59-B01I-FyAH-AjrP-HYxq-Bic1-G7Fy', '0d8fcc20-99a8-11db-937f-000e0c431b59', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('0d8fcc20-99a8-11db-937f-000e0c431b59-Bc5p-Fd4g-Apsd-HHLj-Bbfj-Gyje', '0d8fcc20-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('0d8fcc20-99a8-11db-937f-000e0c431b59-BcmU-FXj0-Azf3-Ho4r-BU3h-Gcqi', '0d8fcc20-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый матовый', ''),
('0d8fcc20-99a8-11db-937f-000e0c431b59-BdM1-F0jA-Akvl-HxRk-BlwX-G4K1', '0d8fcc20-99a8-11db-937f-000e0c431b59', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'влагопрочная', ''),
('0d8fcc20-99a8-11db-937f-000e0c431b59-BFPn-FJ33-A4Ds-H5eZ-Bi9l-GZ8L', '0d8fcc20-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'PARADE', ''),
('0d8fcc20-99a8-11db-937f-000e0c431b59-BfxS-FXcL-AFwD-HmPu-BL1A-Gaqo', '0d8fcc20-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('0d8fcc20-99a8-11db-937f-000e0c431b59-BkQP-F1oD-AgMf-HXJk-BLlN-Gf9x', '0d8fcc20-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('0d8fcc20-99a8-11db-937f-000e0c431b59-BUAX-FD53-Acc1-HE3y-BQSW-GNTs', '0d8fcc20-99a8-11db-937f-000e0c431b59', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '5', 'л'),
('0d8fcc20-99a8-11db-937f-000e0c431b59-BZh8-FBVO-Al8B-H92L-Bz7b-GcGT', '0d8fcc20-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('0d8fcc22-99a8-11db-937f-000e0c431b59-B0KL-FTlO-AaB1-HsVr-BBzo-GqTm', '0d8fcc22-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'PARADE', ''),
('0d8fcc22-99a8-11db-937f-000e0c431b59-Be7o-Fd96-AIfs-HDRp-BCAm-GYCw', '0d8fcc22-99a8-11db-937f-000e0c431b59', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'влагостойкая', ''),
('0d8fcc22-99a8-11db-937f-000e0c431b59-BgMY-FBr6-Aa5p-HxP1-BWz8-G5oe', '0d8fcc22-99a8-11db-937f-000e0c431b59', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('0d8fcc22-99a8-11db-937f-000e0c431b59-BgRO-FKC9-AAXS-HNNF-BOuS-Gnv0', '0d8fcc22-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый матовый', ''),
('0d8fcc22-99a8-11db-937f-000e0c431b59-BjM5-FP0J-AFW0-HCQo-Bgw6-Gv89', '0d8fcc22-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('0d8fcc22-99a8-11db-937f-000e0c431b59-BLAQ-FllN-AF0J-HsjZ-B8XF-GODe', '0d8fcc22-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('0d8fcc22-99a8-11db-937f-000e0c431b59-BlbI-FTfZ-A9ha-Hl7d-BY7n-GkPP', '0d8fcc22-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('0d8fcc22-99a8-11db-937f-000e0c431b59-Bt8W-FCKk-AHZU-HaCG-BamS-GU2S', '0d8fcc22-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('0d8fcc22-99a8-11db-937f-000e0c431b59-BypQ-FpYm-AWac-HAGv-BnrN-GwBs', '0d8fcc22-99a8-11db-937f-000e0c431b59', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '2.5', 'л'),
('0d8fcc24-99a8-11db-937f-000e0c431b59-B4B5-FeH5-AxBk-HPbr-B69e-Gzj7', '0d8fcc24-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('0d8fcc24-99a8-11db-937f-000e0c431b59-BAMt-Fqby-AZLq-HoEN-BuJH-Gzrx', '0d8fcc24-99a8-11db-937f-000e0c431b59', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'влагостойкая', ''),
('0d8fcc24-99a8-11db-937f-000e0c431b59-BbsZ-Fc3k-Au2p-HPFs-Bt3P-G4hF', '0d8fcc24-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('0d8fcc24-99a8-11db-937f-000e0c431b59-BE4F-Fhpz-Actu-HDiP-BA09-Gab2', '0d8fcc24-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('0d8fcc24-99a8-11db-937f-000e0c431b59-BEvW-FuZb-A9Kl-HGAS-B4qc-GaGp', '0d8fcc24-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('0d8fcc24-99a8-11db-937f-000e0c431b59-Bgx4-Flbi-AI9N-H3Ni-BERT-GbCt', '0d8fcc24-99a8-11db-937f-000e0c431b59', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '10', 'л'),
('0d8fcc24-99a8-11db-937f-000e0c431b59-BLrw-FjVl-ANcA-HKLS-B0Fe-GNDd', '0d8fcc24-99a8-11db-937f-000e0c431b59', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('0d8fcc24-99a8-11db-937f-000e0c431b59-BpJg-FaNF-AqNF-Hooh-Bgpt-GPVL', '0d8fcc24-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'PARADE', ''),
('0d8fcc24-99a8-11db-937f-000e0c431b59-BwgK-Fp1L-AW0d-Hwu5-BD6l-Gze8', '0d8fcc24-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый матовый', ''),
('0d8fcc26-99a8-11db-937f-000e0c431b59-B1Z5-FTaA-AFEs-HS1t-BBCt-GSoU', '0d8fcc26-99a8-11db-937f-000e0c431b59', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('0d8fcc26-99a8-11db-937f-000e0c431b59-B5MO-F80j-Adq3-HUAr-BJRZ-GubR', '0d8fcc26-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('0d8fcc26-99a8-11db-937f-000e0c431b59-B9Vn-Fg97-A3w3-HJzG-Bn9Y-GUPc', '0d8fcc26-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'PARADE', ''),
('0d8fcc26-99a8-11db-937f-000e0c431b59-BgtT-Fqc3-AGaQ-HMoT-Bqft-GlyK', '0d8fcc26-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый матовый', ''),
('0d8fcc26-99a8-11db-937f-000e0c431b59-BIRr-FRDO-ADJS-HjjC-Bh33-G6b5', '0d8fcc26-99a8-11db-937f-000e0c431b59', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'влагостойкая', ''),
('0d8fcc26-99a8-11db-937f-000e0c431b59-BjSl-F33L-A5ZD-HwUf-BrT1-GUzz', '0d8fcc26-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('0d8fcc26-99a8-11db-937f-000e0c431b59-Bl4P-FTMF-ACOI-Hvhw-BGDf-GZt8', '0d8fcc26-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('0d8fcc26-99a8-11db-937f-000e0c431b59-BRsl-FJ2a-AQeY-Hozn-BGZ7-GsRy', '0d8fcc26-99a8-11db-937f-000e0c431b59', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '5', 'л'),
('0d8fcc26-99a8-11db-937f-000e0c431b59-BS1Y-FjCC-A4si-HnTW-Bx6Q-GDOd', '0d8fcc26-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('0ff22851-f78f-11e3-8c8a-005056be1f7b-BkL6-Fzz2-AO5N-HYGF-Bna2-GW9j', '0ff22851-f78f-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('0ff22851-f78f-11e3-8c8a-005056be1f7b-BpyY-F2sv-AhB7-HQr6-B8SH-G3I8', '0ff22851-f78f-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('0ff22851-f78f-11e3-8c8a-005056be1f7b-BSyb-FkRP-AkAB-H4gW-BQUc-GsJa', '0ff22851-f78f-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'розово-бежевый', ''),
('0ff22851-f78f-11e3-8c8a-005056be1f7b-BUvs-FisT-AzyM-H5Xp-BSKt-Gq0q', '0ff22851-f78f-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('0ff22851-f78f-11e3-8c8a-005056be1f7b-BuW2-F9v8-ADZY-H5vX-BeaL-G3S4', '0ff22851-f78f-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '6000', 'г'),
('0ff22851-f78f-11e3-8c8a-005056be1f7b-BxDX-Fy85-ALOP-Ho7Y-BEVK-GL2O', '0ff22851-f78f-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('0ff22851-f78f-11e3-8c8a-005056be1f7b-BZvH-FfEI-A5dN-H7kQ-BG4F-GidX', '0ff22851-f78f-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('1004a95c-f787-11e3-8c8a-005056be1f7b-BH1u-Fiyf-AtEZ-HQ7z-BDvD-GIHX', '1004a95c-f787-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('1004a95c-f787-11e3-8c8a-005056be1f7b-BIVm-FhQ8-AwSg-HH6h-BWT9-G6QN', '1004a95c-f787-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('1004a95c-f787-11e3-8c8a-005056be1f7b-BJAE-Fd3q-AD9q-HncQ-BwkG-GhI6', '1004a95c-f787-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '800', 'г'),
('1004a95c-f787-11e3-8c8a-005056be1f7b-BkBF-F6k0-AlUY-H6VP-BBiU-GnBP', '1004a95c-f787-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый матовый', ''),
('1004a95c-f787-11e3-8c8a-005056be1f7b-BXai-F8Pc-AtLM-HiNq-BDyr-GItR', '1004a95c-f787-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('1004a95c-f787-11e3-8c8a-005056be1f7b-BXAZ-Fkim-AQlb-H8uL-BP4g-G2ax', '1004a95c-f787-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('1004a95c-f787-11e3-8c8a-005056be1f7b-BzNF-FVUA-A4qT-H2mk-BF0k-GekI', '1004a95c-f787-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('10594008-ef13-11e4-8633-005056be1f7b-B1aU-F5oh-AlAM-HZal-BvTZ-Gfhv', '10594008-ef13-11e4-8633-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('10594008-ef13-11e4-8633-005056be1f7b-B328-Fkvh-AaVU-HbjZ-BmZz-G7Te', '10594008-ef13-11e4-8633-005056be1f7b', 'c2267174-970e-11e4-9be0-005056be1f7c', '25', 'м'),
('10594008-ef13-11e4-8633-005056be1f7b-B9fv-FT8U-Asjt-HigC-BDA8-GjqR', '10594008-ef13-11e4-8633-005056be1f7b', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для полипропилена', ''),
('10594008-ef13-11e4-8633-005056be1f7b-BcID-Ftge-AZYT-HinG-BzUk-GXJp', '10594008-ef13-11e4-8633-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('10594008-ef13-11e4-8633-005056be1f7b-Be5f-FqU6-ARGP-Hrlw-Bcen-GaEZ', '10594008-ef13-11e4-8633-005056be1f7b', '0e31c585-9718-11e4-9be0-005056be1f7c', '0.05', 'м'),
('10594008-ef13-11e4-8633-005056be1f7b-Bf9X-Fup0-AhId-HLji-BliD-GW2A', '10594008-ef13-11e4-8633-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'двухсторонний скотч', ''),
('10594008-ef13-11e4-8633-005056be1f7b-BMKn-FRIm-AWKE-HOMq-BVpy-GZYV', '10594008-ef13-11e4-8633-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('11d9ec94-f788-11e3-8c8a-005056be1f7b-B3Us-FdZw-Aw9R-HHeF-Bv9A-GR4n', '11d9ec94-f788-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('11d9ec94-f788-11e3-8c8a-005056be1f7b-B8dL-FTeo-APFB-HhZ2-BOfd-G53N', '11d9ec94-f788-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '800', 'г'),
('11d9ec94-f788-11e3-8c8a-005056be1f7b-Ba0h-F9FT-ASDV-HAd7-BkWR-GTzr', '11d9ec94-f788-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('11d9ec94-f788-11e3-8c8a-005056be1f7b-BbB8-FTT8-AG2a-HsoL-BQY0-G3v2', '11d9ec94-f788-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'розово-бежевый', ''),
('11d9ec94-f788-11e3-8c8a-005056be1f7b-Bd5f-F5nJ-AG4h-HGwT-B8Cs-Gakk', '11d9ec94-f788-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('11d9ec94-f788-11e3-8c8a-005056be1f7b-BGmp-FXtK-AceJ-HdwC-BGMB-GnLH', '11d9ec94-f788-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('11d9ec94-f788-11e3-8c8a-005056be1f7b-BPZc-Fi2c-AuIl-HEDS-BieU-Ggyo', '11d9ec94-f788-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('129c7f4d-5273-11de-8f53-000e0c431b58-B12V-FAc1-AMKh-HKsl-BkUR-GHwb', '129c7f4d-5273-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('129c7f4d-5273-11de-8f53-000e0c431b58-B48O-FzyK-AOJB-HyLb-BjRy-G81D', '129c7f4d-5273-11de-8f53-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('129c7f4d-5273-11de-8f53-000e0c431b58-B6Lr-FiLD-A7me-H3PH-BgXE-G29t', '129c7f4d-5273-11de-8f53-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '9', 'л'),
('129c7f4d-5273-11de-8f53-000e0c431b58-BEgL-FMrf-ATrc-HsaF-BXR7-GtSZ', '129c7f4d-5273-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('129c7f4d-5273-11de-8f53-000e0c431b58-BFWY-FjPn-ArvA-Hwm0-BfPn-GT75', '129c7f4d-5273-11de-8f53-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для водно-дисперсионных красок', ''),
('129c7f4d-5273-11de-8f53-000e0c431b58-BI7V-Fkpv-AqDD-HmwV-BCWz-Gmcd', '129c7f4d-5273-11de-8f53-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('129c7f4d-5273-11de-8f53-000e0c431b58-Bjek-FGoS-AsOm-H0VY-Bba6-Gmnn', '129c7f4d-5273-11de-8f53-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('129c7f4d-5273-11de-8f53-000e0c431b58-Bmph-FbJ8-AuuI-HLTG-B08Z-Gsmp', '129c7f4d-5273-11de-8f53-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('129c7f4d-5273-11de-8f53-000e0c431b58-BMwz-FWcE-AlHz-HdZS-BkKa-Gj8y', '129c7f4d-5273-11de-8f53-000e0c431b58', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('129c7f4d-5273-11de-8f53-000e0c431b58-Bnox-FqRj-ABT6-H17Y-BU2k-GCZv', '129c7f4d-5273-11de-8f53-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для стен', ''),
('138c38bb-f78e-11e3-8c8a-005056be1f7b-B48G-Fve7-AcBA-HUMY-BR3M-GvqO', '138c38bb-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('138c38bb-f78e-11e3-8c8a-005056be1f7b-BCfl-FUWL-AqHn-HA91-Byvg-Goig', '138c38bb-f78e-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('138c38bb-f78e-11e3-8c8a-005056be1f7b-BDej-FiOz-A1QS-H2jV-BucT-G1Ny', '138c38bb-f78e-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('138c38bb-f78e-11e3-8c8a-005056be1f7b-BMuQ-Fk3k-A5M3-Hh1r-BgD2-GLY7', '138c38bb-f78e-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'светло-зеленый', ''),
('138c38bb-f78e-11e3-8c8a-005056be1f7b-Bpxe-FyCR-AyUf-HtQR-BBcB-GSD4', '138c38bb-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('138c38bb-f78e-11e3-8c8a-005056be1f7b-Brvy-FnJ2-APx8-HWAm-BsCI-GUXe', '138c38bb-f78e-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1900', 'г'),
('138c38bb-f78e-11e3-8c8a-005056be1f7b-Bxpz-FxAC-AMR6-HYDm-BnGH-GMpV', '138c38bb-f78e-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('13cd2b20-99a8-11db-937f-000e0c431b59-B0RY-FpI8-A85h-H7dk-BUYa-GDHV', '13cd2b20-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый матовый', ''),
('13cd2b20-99a8-11db-937f-000e0c431b59-B51s-Fs50-Av73-HGFb-BLRg-G9eA', '13cd2b20-99a8-11db-937f-000e0c431b59', 'e765ba72-107d-11e3-8a5d-0050569a1080', 'база А', ''),
('13cd2b20-99a8-11db-937f-000e0c431b59-BACF-FW2L-AyBV-HJca-BcR4-G7uQ', '13cd2b20-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'PARADE', ''),
('13cd2b20-99a8-11db-937f-000e0c431b59-BD3R-F69W-AXKo-H5II-B5Ia-GSyj', '13cd2b20-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('13cd2b20-99a8-11db-937f-000e0c431b59-BEhv-FCty-Ao84-HTRT-Bzvi-GWl8', '13cd2b20-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('13cd2b20-99a8-11db-937f-000e0c431b59-BePg-FzY0-AQ2R-HJyC-BZWY-G7pw', '13cd2b20-99a8-11db-937f-000e0c431b59', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '2.7', 'л'),
('13cd2b20-99a8-11db-937f-000e0c431b59-BiWh-FTYH-A208-HMDm-BOEo-GTaf', '13cd2b20-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('13cd2b20-99a8-11db-937f-000e0c431b59-BQvd-Fxr7-AYCV-HyGc-BKJU-GbFT', '13cd2b20-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('13cd2b20-99a8-11db-937f-000e0c431b59-Bycd-FcWm-AlRu-HBki-Bk1U-GEoC', '13cd2b20-99a8-11db-937f-000e0c431b59', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'интерьерная', ''),
('13cd2b24-99a8-11db-937f-000e0c431b59-B4JK-FKGk-AqIy-Hdox-B5ag-GEuQ', '13cd2b24-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('13cd2b24-99a8-11db-937f-000e0c431b59-Bg7E-FVcU-As0Z-HvRI-BoLR-GzVY', '13cd2b24-99a8-11db-937f-000e0c431b59', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'интерьерная', ''),
('13cd2b24-99a8-11db-937f-000e0c431b59-BIyv-FW2E-A8Ux-HjTu-Brfs-GPUN', '13cd2b24-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('13cd2b24-99a8-11db-937f-000e0c431b59-BM8h-FyfB-AMTB-HgMX-BSab-GECR', '13cd2b24-99a8-11db-937f-000e0c431b59', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '2.7', 'л'),
('13cd2b24-99a8-11db-937f-000e0c431b59-BNEv-Fm1D-AveO-HDTk-Bcsm-G07H', '13cd2b24-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('13cd2b24-99a8-11db-937f-000e0c431b59-BvtJ-FTtb-AMyz-HfQW-BhED-GSt3', '13cd2b24-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('13cd2b24-99a8-11db-937f-000e0c431b59-Bxqu-Fpyl-AZSQ-H8Zg-BBOx-Gg9a', '13cd2b24-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый матовый', ''),
('13cd2b24-99a8-11db-937f-000e0c431b59-BZBh-FNfM-ABZm-HhdX-By0U-G3Vw', '13cd2b24-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'PARADE', ''),
('13cd2b24-99a8-11db-937f-000e0c431b59-BzQe-FunP-Auti-HAS3-BEXS-GcgC', '13cd2b24-99a8-11db-937f-000e0c431b59', 'e765ba72-107d-11e3-8a5d-0050569a1080', 'база А', ''),
('13cd2b26-99a8-11db-937f-000e0c431b59-B9lS-FIrr-AVFP-HXOJ-BQcB-Gdec', '13cd2b26-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('13cd2b26-99a8-11db-937f-000e0c431b59-BAQl-FDu0-Abcn-HVrk-BSqL-Gky4', '13cd2b26-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('13cd2b26-99a8-11db-937f-000e0c431b59-BO2N-FBbh-AvIC-HeXX-Bro5-GP77', '13cd2b26-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый матовый', ''),
('13cd2b26-99a8-11db-937f-000e0c431b59-BQce-FRFy-Ap45-H2Vc-BOHA-GD6v', '13cd2b26-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('13cd2b26-99a8-11db-937f-000e0c431b59-BQgh-FSCt-ApVK-HGZM-BXhB-GJ54', '13cd2b26-99a8-11db-937f-000e0c431b59', 'e765ba72-107d-11e3-8a5d-0050569a1080', 'база А', ''),
('13cd2b26-99a8-11db-937f-000e0c431b59-BSK0-FhiN-Aryq-HtSK-BMTb-GxXL', '13cd2b26-99a8-11db-937f-000e0c431b59', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'интерьерная', ''),
('13cd2b26-99a8-11db-937f-000e0c431b59-BTkX-FATq-ALfA-HmTY-ByGM-GbhW', '13cd2b26-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('13cd2b26-99a8-11db-937f-000e0c431b59-Bwiy-Fxv2-An2M-Hn8E-BMQo-GkR9', '13cd2b26-99a8-11db-937f-000e0c431b59', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '9', 'л'),
('13cd2b26-99a8-11db-937f-000e0c431b59-Bxyn-FaJU-AAcA-HMCz-BGUA-GF3i', '13cd2b26-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'PARADE', ''),
('13cd2b5d-99a8-11db-937f-000e0c431b59-B2ly-F2jw-A8Ie-HPbH-Bu05-G26n', '13cd2b5d-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'PARADE', ''),
('13cd2b5d-99a8-11db-937f-000e0c431b59-BC54-FTky-ASGk-H3ZN-BCfz-GVGq', '13cd2b5d-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'шпатлевка', ''),
('13cd2b5d-99a8-11db-937f-000e0c431b59-BDx3-FHm4-APyQ-Hq59-Bfwk-GTnK', '13cd2b5d-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('13cd2b5d-99a8-11db-937f-000e0c431b59-BEzS-Fycv-AdtS-H637-BA61-G5Pb', '13cd2b5d-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1500', 'г'),
('13cd2b5d-99a8-11db-937f-000e0c431b59-BGlS-Fl1t-Aslt-Hndo-BQgc-GJoF', '13cd2b5d-99a8-11db-937f-000e0c431b59', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для печей', ''),
('13cd2b5d-99a8-11db-937f-000e0c431b59-BhxG-F7sM-A2PD-HzBI-BLXa-GGrz', '13cd2b5d-99a8-11db-937f-000e0c431b59', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'выравнивающая', ''),
('13cd2b5d-99a8-11db-937f-000e0c431b59-BuKu-F5OO-AKlY-H5F6-Bg28-GvEW', '13cd2b5d-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('13cd2b5d-99a8-11db-937f-000e0c431b59-BvBP-FNZj-ANj9-HGzj-BkPD-G0Gk', '13cd2b5d-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('13cd2b5d-99a8-11db-937f-000e0c431b59-BVS6-FUYu-A50A-H89G-BisR-GTmf', '13cd2b5d-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('13cd2b5d-99a8-11db-937f-000e0c431b59-BZdY-F2hu-AEJK-HDeQ-BXJt-Gegm', '13cd2b5d-99a8-11db-937f-000e0c431b59', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('13cd2b61-99a8-11db-937f-000e0c431b59-B7NN-FhdO-A5by-HXNV-BIxf-Gx5e', '13cd2b61-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('13cd2b61-99a8-11db-937f-000e0c431b59-Ba87-FLgN-An9l-HQBW-B8jc-Gvgu', '13cd2b61-99a8-11db-937f-000e0c431b59', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'финишная', ''),
('13cd2b61-99a8-11db-937f-000e0c431b59-BGJl-FYFe-AUGZ-HLAp-BmsM-GKBm', '13cd2b61-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'супербелый', ''),
('13cd2b61-99a8-11db-937f-000e0c431b59-BhGx-F8Ry-Am5h-HzFi-BbMG-GhwA', '13cd2b61-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('13cd2b61-99a8-11db-937f-000e0c431b59-BHhF-Fk43-AK7v-HjRc-BbXm-GDvr', '13cd2b61-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('13cd2b61-99a8-11db-937f-000e0c431b59-Bik6-FfW4-APIR-H821-BLyE-GYWi', '13cd2b61-99a8-11db-937f-000e0c431b59', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для печей', ''),
('13cd2b61-99a8-11db-937f-000e0c431b59-Bk4C-F315-AsCs-HxaE-BWEV-GWg0', '13cd2b61-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1500', 'г'),
('13cd2b61-99a8-11db-937f-000e0c431b59-BkJp-FH0u-Apa8-Hv9u-BwYr-GsjO', '13cd2b61-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'PARADE', ''),
('13cd2b61-99a8-11db-937f-000e0c431b59-BnQA-FbnO-AxvB-HSj7-BwIh-Grn5', '13cd2b61-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'шпатлевка', ''),
('13cd2b61-99a8-11db-937f-000e0c431b59-Bshh-FSZ8-Agcd-HWxj-BC3Z-GUq3', '13cd2b61-99a8-11db-937f-000e0c431b59', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('13cd2b63-99a8-11db-937f-000e0c431b59-B35n-FkT3-AL7v-H60q-BykM-G70R', '13cd2b63-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('13cd2b63-99a8-11db-937f-000e0c431b59-B4Mw-FEmr-AIR3-HMrz-Bukt-GYKD', '13cd2b63-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('13cd2b63-99a8-11db-937f-000e0c431b59-Bh7A-FX7p-ANSA-HLS7-BepQ-G2Au', '13cd2b63-99a8-11db-937f-000e0c431b59', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для печей', ''),
('13cd2b63-99a8-11db-937f-000e0c431b59-BJf3-Frb6-APo1-H0o1-BWV8-GA6S', '13cd2b63-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'PARADE', ''),
('13cd2b63-99a8-11db-937f-000e0c431b59-BlgH-FYF8-ANeK-Ha6E-BoLE-Ga7i', '13cd2b63-99a8-11db-937f-000e0c431b59', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('13cd2b63-99a8-11db-937f-000e0c431b59-Bq6H-FrHZ-AnlF-H5dF-BoMi-GDh9', '13cd2b63-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '400', 'г'),
('13cd2b63-99a8-11db-937f-000e0c431b59-BQW0-FCR9-AsGi-H6Ch-BN6t-G00W', '13cd2b63-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('13cd2b63-99a8-11db-937f-000e0c431b59-BrHo-FjUW-AZF8-HIdI-BLue-GLww', '13cd2b63-99a8-11db-937f-000e0c431b59', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'финишная', ''),
('13cd2b63-99a8-11db-937f-000e0c431b59-BscZ-FUaP-AtKO-How7-BAT3-GAry', '13cd2b63-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'шпатлевка', ''),
('13cd2b63-99a8-11db-937f-000e0c431b59-BXUX-FUd2-Acpl-H81Y-Bt05-GmrW', '13cd2b63-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('13cd2b65-99a8-11db-937f-000e0c431b59-Bf0c-Fom8-AyP2-HtXm-BAuB-GR4v', '13cd2b65-99a8-11db-937f-000e0c431b59', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для печей', ''),
('13cd2b65-99a8-11db-937f-000e0c431b59-Bg46-FvQ2-Ascc-Hmvv-Bmes-GPTi', '13cd2b65-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('13cd2b65-99a8-11db-937f-000e0c431b59-BhuI-F0V3-A28I-HmfK-Bn45-GHvR', '13cd2b65-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'PARADE', ''),
('13cd2b65-99a8-11db-937f-000e0c431b59-Bt7m-Fy1G-A5eS-Hdiz-Bb2G-GkZA', '13cd2b65-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'береза', ''),
('13cd2b65-99a8-11db-937f-000e0c431b59-BTQI-Fh56-Ae5P-HX68-BMl4-GTSA', '13cd2b65-99a8-11db-937f-000e0c431b59', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('13cd2b65-99a8-11db-937f-000e0c431b59-BWOC-Forl-AeJc-Hlt2-BlQu-GhBB', '13cd2b65-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('13cd2b65-99a8-11db-937f-000e0c431b59-BXsI-FObf-A2cQ-H3uJ-BniP-GDe2', '13cd2b65-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '400', 'г'),
('13cd2b65-99a8-11db-937f-000e0c431b59-BXYQ-FIug-AMnH-HfkX-BeII-GnIe', '13cd2b65-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('13cd2b65-99a8-11db-937f-000e0c431b59-ByGZ-F6lA-ATGI-HctR-B7PQ-GZ43', '13cd2b65-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'шпатлевка', ''),
('13cd2b65-99a8-11db-937f-000e0c431b59-BYue-F2WP-An0u-HVPE-B4lS-G7Q0', '13cd2b65-99a8-11db-937f-000e0c431b59', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'финишная', ''),
('13cd2b67-99a8-11db-937f-000e0c431b59-BcXh-FZHJ-AQuJ-HzgW-B1xb-GTUZ', '13cd2b67-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('13cd2b67-99a8-11db-937f-000e0c431b59-BDx8-FMQr-AdM7-Hum1-Bn0j-GvNA', '13cd2b67-99a8-11db-937f-000e0c431b59', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('13cd2b67-99a8-11db-937f-000e0c431b59-BhCA-FU9o-AlxW-HpiR-BABo-Gibw', '13cd2b67-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('13cd2b67-99a8-11db-937f-000e0c431b59-BREd-Fh8O-Arlw-H7oQ-BysE-Gv5U', '13cd2b67-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'бук', ''),
('13cd2b67-99a8-11db-937f-000e0c431b59-Brrg-F2hC-ANX1-HprK-BEOM-GEjL', '13cd2b67-99a8-11db-937f-000e0c431b59', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'финишная', ''),
('13cd2b67-99a8-11db-937f-000e0c431b59-BtK9-FG1h-AX1j-HCYA-ByGs-GV8P', '13cd2b67-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'PARADE', ''),
('13cd2b67-99a8-11db-937f-000e0c431b59-BUO0-F5RY-A6Ff-Hnbc-B4zo-GgEf', '13cd2b67-99a8-11db-937f-000e0c431b59', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для печей', ''),
('13cd2b67-99a8-11db-937f-000e0c431b59-BV1o-F1dG-ATX7-H84A-Bdte-G5Hj', '13cd2b67-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '400', 'г'),
('13cd2b67-99a8-11db-937f-000e0c431b59-BYLm-FO2T-AZ6i-HmAH-BxuS-Gw1I', '13cd2b67-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('13cd2b67-99a8-11db-937f-000e0c431b59-Bzdb-FYFb-Ag4M-HzqC-B8BR-G86i', '13cd2b67-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'шпатлевка', ''),
('13cd2b69-99a8-11db-937f-000e0c431b59-B1wH-FApf-AGGP-HDN1-BdZt-GQil', '13cd2b69-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('13cd2b69-99a8-11db-937f-000e0c431b59-B8s7-FWVM-A5iy-HGP9-BwFv-G4Ga', '13cd2b69-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('13cd2b69-99a8-11db-937f-000e0c431b59-B9NV-FwUk-AvGp-Hg0v-B7Y9-GdDO', '13cd2b69-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'PARADE', ''),
('13cd2b69-99a8-11db-937f-000e0c431b59-BAzC-FSe6-AnXB-HgPf-BMFE-GezK', '13cd2b69-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '400', 'г'),
('13cd2b69-99a8-11db-937f-000e0c431b59-BM4x-FI2q-AJUZ-HnPh-BNmM-GqKp', '13cd2b69-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'дуб', ''),
('13cd2b69-99a8-11db-937f-000e0c431b59-BNh9-FXw8-AFm5-HgYO-BSXc-GnKw', '13cd2b69-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('13cd2b69-99a8-11db-937f-000e0c431b59-BO64-F4c4-ApZR-Ho3V-B4G4-G2dp', '13cd2b69-99a8-11db-937f-000e0c431b59', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для печей', ''),
('13cd2b69-99a8-11db-937f-000e0c431b59-BWod-FidJ-AlbK-H3YF-Bbu7-GGka', '13cd2b69-99a8-11db-937f-000e0c431b59', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('13cd2b69-99a8-11db-937f-000e0c431b59-BYNg-FoQt-AetJ-HO0s-B17a-GwTw', '13cd2b69-99a8-11db-937f-000e0c431b59', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'финишная', ''),
('13cd2b69-99a8-11db-937f-000e0c431b59-BzjS-FuFq-A9YE-HbCO-BNQK-GHJn', '13cd2b69-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'шпатлевка', ''),
('13cd2b6b-99a8-11db-937f-000e0c431b59-BARb-FEJN-A9KJ-HrvW-Bp8D-GHBZ', '13cd2b6b-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('13cd2b6b-99a8-11db-937f-000e0c431b59-BFIQ-FMBL-AUSR-HjnL-B4Ad-GimP', '13cd2b6b-99a8-11db-937f-000e0c431b59', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для печей', ''),
('13cd2b6b-99a8-11db-937f-000e0c431b59-BKHD-FzEB-AXWP-HdXu-BoYC-GGcL', '13cd2b6b-99a8-11db-937f-000e0c431b59', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'финишная', ''),
('13cd2b6b-99a8-11db-937f-000e0c431b59-BLyj-FPPl-Aed2-HokB-BSl2-GU4V', '13cd2b6b-99a8-11db-937f-000e0c431b59', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('13cd2b6b-99a8-11db-937f-000e0c431b59-Bm0q-FEYN-A90D-HT8W-BwDe-GDPf', '13cd2b6b-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'шпатлевка', ''),
('13cd2b6b-99a8-11db-937f-000e0c431b59-BMqc-FDVD-AFno-H79i-BSOG-GBfK', '13cd2b6b-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('13cd2b6b-99a8-11db-937f-000e0c431b59-BOky-FfJc-ArCc-HLlE-BbNE-GHRc', '13cd2b6b-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '400', 'г'),
('13cd2b6b-99a8-11db-937f-000e0c431b59-BPht-FRE9-AwQE-H2v4-BB7s-GkM9', '13cd2b6b-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'махагон', ''),
('13cd2b6b-99a8-11db-937f-000e0c431b59-BTaW-FdII-AzxG-H35I-BRFP-GU5T', '13cd2b6b-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'PARADE', ''),
('13cd2b6b-99a8-11db-937f-000e0c431b59-BWSp-FmvD-AWab-HZg5-Bl1V-G8Td', '13cd2b6b-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('13cd2b6d-99a8-11db-937f-000e0c431b59-B0Fz-FdUO-ANF4-HgoE-BAq7-GgLA', '13cd2b6d-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('13cd2b6d-99a8-11db-937f-000e0c431b59-B8R5-FPOr-AsLH-H7og-BiOh-Go4E', '13cd2b6d-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('13cd2b6d-99a8-11db-937f-000e0c431b59-BB3g-FeDH-AjeV-Hnmn-BG84-GiVc', '13cd2b6d-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'орех', ''),
('13cd2b6d-99a8-11db-937f-000e0c431b59-BCs6-F7Pk-AAPR-H7wc-B8aN-GcZl', '13cd2b6d-99a8-11db-937f-000e0c431b59', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'финишная', ''),
('13cd2b6d-99a8-11db-937f-000e0c431b59-BH8j-FWE7-A31S-Hqh4-Bt6N-G9ac', '13cd2b6d-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '400', 'г'),
('13cd2b6d-99a8-11db-937f-000e0c431b59-BkBG-FpgJ-AFfL-HkSr-BbVZ-GXRp', '13cd2b6d-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'PARADE', ''),
('13cd2b6d-99a8-11db-937f-000e0c431b59-Bnuf-F0YH-AmeE-HfDa-B9Cf-Gxf1', '13cd2b6d-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('13cd2b6d-99a8-11db-937f-000e0c431b59-BUQc-FXja-AuWe-HPZt-BuoT-GjKd', '13cd2b6d-99a8-11db-937f-000e0c431b59', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('13cd2b6d-99a8-11db-937f-000e0c431b59-By9k-F0j4-ArAO-HGXg-BwVy-GqlC', '13cd2b6d-99a8-11db-937f-000e0c431b59', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для печей', ''),
('13cd2b6d-99a8-11db-937f-000e0c431b59-BYTO-FfP4-ABxH-HjcA-BoQ9-GOQi', '13cd2b6d-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'шпатлевка', ''),
('13cd2b6f-99a8-11db-937f-000e0c431b59-B2cQ-F9Bt-A0p0-H85Q-BgBN-GFXS', '13cd2b6f-99a8-11db-937f-000e0c431b59', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('13cd2b6f-99a8-11db-937f-000e0c431b59-B5dM-F5bG-AK8I-HXCf-BpFv-Gyas', '13cd2b6f-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('13cd2b6f-99a8-11db-937f-000e0c431b59-B7Kn-F9Dr-AapR-Hhp8-Bwsw-GBTP', '13cd2b6f-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('13cd2b6f-99a8-11db-937f-000e0c431b59-BcL4-Fkj7-AGPC-H3Ec-BljH-GAqO', '13cd2b6f-99a8-11db-937f-000e0c431b59', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'финишная', ''),
('13cd2b6f-99a8-11db-937f-000e0c431b59-BCQI-FV7q-AOql-HboC-B5fe-GLeg', '13cd2b6f-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'сосна', ''),
('13cd2b6f-99a8-11db-937f-000e0c431b59-BCzP-Fldc-Annk-HJAm-BFdy-G0EX', '13cd2b6f-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'PARADE', ''),
('13cd2b6f-99a8-11db-937f-000e0c431b59-Be84-FEG4-ArLW-HfLb-B3Hm-GgFp', '13cd2b6f-99a8-11db-937f-000e0c431b59', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для печей', ''),
('13cd2b6f-99a8-11db-937f-000e0c431b59-BeoY-FGGC-AJBi-HoNC-BKHf-GWB7', '13cd2b6f-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('13cd2b6f-99a8-11db-937f-000e0c431b59-BOgU-FfEA-Ac1s-HO3B-BeW9-GYbE', '13cd2b6f-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'шпатлевка', ''),
('13cd2b6f-99a8-11db-937f-000e0c431b59-BRIQ-Fonc-AGgj-HsCp-BXRM-GswQ', '13cd2b6f-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '400', 'г'),
('13ce3df2-93b0-11e3-82a4-005056be1f7b-BIGW-FDKs-AJvR-HVTA-BrB5-GlvH', '13ce3df2-93b0-11e3-82a4-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('13ce3df2-93b0-11e3-82a4-005056be1f7b-BJws-FmIE-A41u-HDO2-BFW9-GcZJ', '13ce3df2-93b0-11e3-82a4-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('13ce3df2-93b0-11e3-82a4-005056be1f7b-BKj6-Fb5O-AcmQ-HXNB-BeWx-GN06', '13ce3df2-93b0-11e3-82a4-005056be1f7b', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '2', 'л'),
('13ce3df2-93b0-11e3-82a4-005056be1f7b-BMh4-Fc5G-AdZd-HQnc-BM6V-G99R', '13ce3df2-93b0-11e3-82a4-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'грунт-эмаль', ''),
('13ce3df2-93b0-11e3-82a4-005056be1f7b-BNF8-FKJJ-AKiC-HSnR-BY6V-GvwV', '13ce3df2-93b0-11e3-82a4-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'синий', ''),
('13ce3df2-93b0-11e3-82a4-005056be1f7b-Br55-FtMh-AAkd-HWWQ-BrqK-GXGB', '13ce3df2-93b0-11e3-82a4-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('13ce3df2-93b0-11e3-82a4-005056be1f7b-BS3w-FC7A-A5BX-H3dx-BCnW-G8FR', '13ce3df2-93b0-11e3-82a4-005056be1f7b', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для ржавчины', ''),
('13ce3df2-93b0-11e3-82a4-005056be1f7b-BT5q-Fa1u-AAV6-HDVG-BkjM-GhtV', '13ce3df2-93b0-11e3-82a4-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('159d7e07-f790-11e3-8c8a-005056be1f7b-B2wr-FpQm-ABm2-HvMC-Bjtm-Gx6S', '159d7e07-f790-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('159d7e07-f790-11e3-8c8a-005056be1f7b-BbUp-FlTe-AGuy-He5W-BVPt-GjKy', '159d7e07-f790-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('159d7e07-f790-11e3-8c8a-005056be1f7b-BdGE-F1kr-AKQw-Hymc-BvdO-GdJf', '159d7e07-f790-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('159d7e07-f790-11e3-8c8a-005056be1f7b-BFKH-F87U-A0fD-HmT9-B6xF-G0np', '159d7e07-f790-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '20000', 'г'),
('159d7e07-f790-11e3-8c8a-005056be1f7b-BhjN-FLqq-ALvW-HdnT-BqEo-GWq8', '159d7e07-f790-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('159d7e07-f790-11e3-8c8a-005056be1f7b-BNSx-FQ5j-AXcK-H9ze-BbTX-GKi2', '159d7e07-f790-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'светло-серый', ''),
('159d7e07-f790-11e3-8c8a-005056be1f7b-BUXO-F6E8-AYZo-HGc0-BEqS-G37N', '159d7e07-f790-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('17a83679-f78f-11e3-8c8a-005056be1f7b-B9Tx-FjDR-AtEA-H4Pw-BsZr-GUSF', '17a83679-f78f-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('17a83679-f78f-11e3-8c8a-005056be1f7b-BDns-F9HL-AvRR-Hdx0-BswT-GgVW', '17a83679-f78f-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('17a83679-f78f-11e3-8c8a-005056be1f7b-BEqj-Fsgy-AAq8-HnGA-BAIH-G6iS', '17a83679-f78f-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'охра', ''),
('17a83679-f78f-11e3-8c8a-005056be1f7b-BK5m-F3Xs-AVn5-Hecx-BJGr-GfrP', '17a83679-f78f-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('17a83679-f78f-11e3-8c8a-005056be1f7b-BO0I-FDpA-AIxs-HcGc-BPLJ-Gz4p', '17a83679-f78f-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('17a83679-f78f-11e3-8c8a-005056be1f7b-Bo4V-Flhc-Alil-HtdJ-BBsJ-GKwy', '17a83679-f78f-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('17a83679-f78f-11e3-8c8a-005056be1f7b-ByFb-Fy9q-AlqG-HTBY-BYFC-GHDK', '17a83679-f78f-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '6000', 'г'),
('1a0a8b4f-99a8-11db-937f-000e0c431b59-B1Tf-Flpb-ANEA-H7XK-BMhB-GjH7', '1a0a8b4f-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('1a0a8b4f-99a8-11db-937f-000e0c431b59-B91E-Fdh2-AoK0-HxAI-BZuF-GC97', '1a0a8b4f-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'шпатлевка', ''),
('1a0a8b4f-99a8-11db-937f-000e0c431b59-BdWO-FHqf-AQQn-Hhsx-BgiH-GBJw', '1a0a8b4f-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('1a0a8b4f-99a8-11db-937f-000e0c431b59-BdX1-FeTO-Aogv-HpF4-BliP-G1q7', '1a0a8b4f-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('1a0a8b4f-99a8-11db-937f-000e0c431b59-Bqye-F2pk-AA1d-Hy33-B71t-GATQ', '1a0a8b4f-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '600', 'г'),
('1a0a8b4f-99a8-11db-937f-000e0c431b59-Bu7m-FN2o-A1iK-H1GJ-BL3x-GBZI', '1a0a8b4f-99a8-11db-937f-000e0c431b59', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для печей', ''),
('1a0a8b4f-99a8-11db-937f-000e0c431b59-BV7M-F0e5-AxAc-H5Bm-BqfA-Gh0U', '1a0a8b4f-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('1a0a8b4f-99a8-11db-937f-000e0c431b59-Bvo1-FhU7-Aa7f-HqwL-BnII-GzIm', '1a0a8b4f-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('1a0a8b51-99a8-11db-937f-000e0c431b59-B0dR-FHKF-AACx-HZe6-BCiw-GQUZ', '1a0a8b51-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1500', 'г'),
('1a0a8b51-99a8-11db-937f-000e0c431b59-B29a-F2vb-AAKM-HGMK-BC40-Ghuo', '1a0a8b51-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('1a0a8b51-99a8-11db-937f-000e0c431b59-B3fl-FaNk-Asls-Hwdc-Batp-GlNH', '1a0a8b51-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('1a0a8b51-99a8-11db-937f-000e0c431b59-BD1N-Fwnr-AODb-H5pp-BBA5-GFgq', '1a0a8b51-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'шпатлевка', ''),
('1a0a8b51-99a8-11db-937f-000e0c431b59-BIvf-FlkX-AehN-HNih-Beaf-G6SQ', '1a0a8b51-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('1a0a8b51-99a8-11db-937f-000e0c431b59-BQNL-Febt-AB6J-Hh1b-BxNu-GOvJ', '1a0a8b51-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('1a0a8b51-99a8-11db-937f-000e0c431b59-BVPD-Ffw5-A7kH-Hry4-B2rY-GcIm', '1a0a8b51-99a8-11db-937f-000e0c431b59', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для печей', ''),
('1a0a8b51-99a8-11db-937f-000e0c431b59-BWSb-FiZn-Atbh-Hs0S-BXHD-G3to', '1a0a8b51-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('1a0a8b53-99a8-11db-937f-000e0c431b59-B9id-FZcI-AEeJ-H0jp-BqiI-G8qT', '1a0a8b53-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'береза', ''),
('1a0a8b53-99a8-11db-937f-000e0c431b59-BDLA-FcuZ-AMtx-HeKl-BPud-GedU', '1a0a8b53-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('1a0a8b53-99a8-11db-937f-000e0c431b59-BDqV-F1G1-AwJZ-HiZt-B9XS-Gbxu', '1a0a8b53-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('1a0a8b53-99a8-11db-937f-000e0c431b59-Bj3P-Ft2y-AZhX-HhfD-B2iu-GNZ1', '1a0a8b53-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('1a0a8b53-99a8-11db-937f-000e0c431b59-Bl7F-Fiki-A0jV-HTbz-BErD-GH3v', '1a0a8b53-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '600', 'г'),
('1a0a8b53-99a8-11db-937f-000e0c431b59-BPND-FLsi-AhEH-HEaJ-BXMX-GZvG', '1a0a8b53-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'шпатлевка', ''),
('1a0a8b53-99a8-11db-937f-000e0c431b59-BT43-FqaX-AuS7-HefV-BVjh-GVBS', '1a0a8b53-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('1a0a8b53-99a8-11db-937f-000e0c431b59-BvOB-FjtM-AK98-Hodb-B0wU-G2du', '1a0a8b53-99a8-11db-937f-000e0c431b59', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для печей', ''),
('1a0a8b55-99a8-11db-937f-000e0c431b59-B4UK-FZE0-AXH0-HvVp-B2CP-GIE6', '1a0a8b55-99a8-11db-937f-000e0c431b59', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для печей', ''),
('1a0a8b55-99a8-11db-937f-000e0c431b59-BDe3-Fix2-A74g-Hty9-BCAX-GOpG', '1a0a8b55-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('1a0a8b55-99a8-11db-937f-000e0c431b59-BFbW-Fbvy-AQ1f-HT9X-BFox-G6cS', '1a0a8b55-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('1a0a8b55-99a8-11db-937f-000e0c431b59-BG7d-F2DP-A1MF-HTOd-BlHy-Gvg3', '1a0a8b55-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'шпатлевка', ''),
('1a0a8b55-99a8-11db-937f-000e0c431b59-BMYL-Fptc-A5KW-HFry-B3wQ-GOOB', '1a0a8b55-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('1a0a8b55-99a8-11db-937f-000e0c431b59-Bqa1-FxeQ-A73d-HURO-Bb4L-Ggcw', '1a0a8b55-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'береза', ''),
('1a0a8b55-99a8-11db-937f-000e0c431b59-BqjR-FCp9-A2hu-HHw9-BJzd-GBYR', '1a0a8b55-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('1a0a8b55-99a8-11db-937f-000e0c431b59-Bu40-FupU-AagW-Hppb-BlwX-GEna', '1a0a8b55-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1500', 'г'),
('1a0a8b57-99a8-11db-937f-000e0c431b59-B5Hk-FQxP-AsYB-HFcp-BgwJ-GJM8', '1a0a8b57-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('1a0a8b57-99a8-11db-937f-000e0c431b59-BAGW-F9yi-AdYe-H29L-B53T-GfIG', '1a0a8b57-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('1a0a8b57-99a8-11db-937f-000e0c431b59-BCUf-Fw6I-Atev-HwaX-Bn4c-G33Y', '1a0a8b57-99a8-11db-937f-000e0c431b59', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для печей', ''),
('1a0a8b57-99a8-11db-937f-000e0c431b59-BdEP-F97N-AJ2F-HcWO-BjHF-GE4C', '1a0a8b57-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('1a0a8b57-99a8-11db-937f-000e0c431b59-BFCQ-FLem-AZEu-HfIn-BiL9-GD85', '1a0a8b57-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'шпатлевка', ''),
('1a0a8b57-99a8-11db-937f-000e0c431b59-BMrZ-F9dz-AVGt-Hy0l-BNEn-GdQI', '1a0a8b57-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '600', 'г'),
('1a0a8b57-99a8-11db-937f-000e0c431b59-BTem-FZy2-A4Z9-HrLe-Bk7Y-GjrD', '1a0a8b57-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'бук', ''),
('1a0a8b57-99a8-11db-937f-000e0c431b59-Bu2f-Fw78-Abdu-Hlm7-BinC-G6l1', '1a0a8b57-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('1a0a8b59-99a8-11db-937f-000e0c431b59-B4YS-FBuM-A7FW-HJHS-BFpf-GItK', '1a0a8b59-99a8-11db-937f-000e0c431b59', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для печей', ''),
('1a0a8b59-99a8-11db-937f-000e0c431b59-BepD-F2yK-AJ5z-HoCj-ByH3-Gwmj', '1a0a8b59-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1500', 'г'),
('1a0a8b59-99a8-11db-937f-000e0c431b59-BES8-Fero-AtF0-Hsxy-B0rN-GSt9', '1a0a8b59-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'шпатлевка', ''),
('1a0a8b59-99a8-11db-937f-000e0c431b59-BGqM-F1LV-Aetg-Hcxe-BWAL-Gw9p', '1a0a8b59-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'бук', ''),
('1a0a8b59-99a8-11db-937f-000e0c431b59-BiMD-FEp7-Ajxa-HYqO-BXV9-GsyR', '1a0a8b59-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('1a0a8b59-99a8-11db-937f-000e0c431b59-BlUv-FUJu-A6Wz-Hj1F-Br7w-G4x9', '1a0a8b59-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('1a0a8b59-99a8-11db-937f-000e0c431b59-BouV-FdTL-AjAH-HW56-BUJM-GC67', '1a0a8b59-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('1a0a8b59-99a8-11db-937f-000e0c431b59-BPRs-Fwtf-AQGg-Hc3e-BHez-G4y9', '1a0a8b59-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('1a0a8b5b-99a8-11db-937f-000e0c431b59-B3x3-F69q-Agtj-HUJR-BktP-G7mv', '1a0a8b5b-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '600', 'г'),
('1a0a8b5b-99a8-11db-937f-000e0c431b59-BaVp-FaDc-AODK-HbV4-BZ1j-GcrY', '1a0a8b5b-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'дуб', ''),
('1a0a8b5b-99a8-11db-937f-000e0c431b59-BFNn-FycK-AQFT-HiA6-BVQi-Gd9G', '1a0a8b5b-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('1a0a8b5b-99a8-11db-937f-000e0c431b59-Bj9V-F4gW-Ay2m-HXVl-BdDV-GliR', '1a0a8b5b-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'шпатлевка', ''),
('1a0a8b5b-99a8-11db-937f-000e0c431b59-BlMh-Fwn3-ApDt-HPgb-BnJS-G6lx', '1a0a8b5b-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('1a0a8b5b-99a8-11db-937f-000e0c431b59-Bn1S-FcfU-ABUb-H4GE-BdhZ-GI8d', '1a0a8b5b-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('1a0a8b5b-99a8-11db-937f-000e0c431b59-BPnH-FrhO-AvBw-HLJu-Bpv7-GMhk', '1a0a8b5b-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('1a0a8b5b-99a8-11db-937f-000e0c431b59-BsuH-Fe7R-AOlC-HLxk-Bv4x-GZrQ', '1a0a8b5b-99a8-11db-937f-000e0c431b59', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для печей', ''),
('1a0a8b5d-99a8-11db-937f-000e0c431b59-B9ge-F8Vk-Aj79-HmLS-BeYJ-Gop3', '1a0a8b5d-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('1a0a8b5d-99a8-11db-937f-000e0c431b59-BCwA-FWqG-Am6L-HYpN-Bf9z-GjRD', '1a0a8b5d-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'шпатлевка', ''),
('1a0a8b5d-99a8-11db-937f-000e0c431b59-BN1K-FQsD-A231-HP6i-Blnw-Gs7V', '1a0a8b5d-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('1a0a8b5d-99a8-11db-937f-000e0c431b59-BSbn-F6y0-AgSC-H34l-BJwY-GCsW', '1a0a8b5d-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'дуб', ''),
('1a0a8b5d-99a8-11db-937f-000e0c431b59-Bsgu-Fiwp-AHYT-H4GP-BPEw-GtCH', '1a0a8b5d-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('1a0a8b5d-99a8-11db-937f-000e0c431b59-BsOG-FSiP-AjJ0-HzFl-BlYD-GOT2', '1a0a8b5d-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('1a0a8b5d-99a8-11db-937f-000e0c431b59-BTlE-FSOP-Aksn-HtXT-BlGz-GWol', '1a0a8b5d-99a8-11db-937f-000e0c431b59', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для печей', ''),
('1a0a8b5d-99a8-11db-937f-000e0c431b59-By2w-FclK-AvNQ-Hlk6-BNmr-GN9X', '1a0a8b5d-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1500', 'г'),
('1a0a8b5f-99a8-11db-937f-000e0c431b59-B0zy-FpvL-A6EB-Hfpe-Byuq-GpuV', '1a0a8b5f-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'шпатлевка', ''),
('1a0a8b5f-99a8-11db-937f-000e0c431b59-BdTT-Fmtc-Ati7-Hbp5-BJul-GVv1', '1a0a8b5f-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('1a0a8b5f-99a8-11db-937f-000e0c431b59-BEM2-FAog-A6xQ-HhIC-BYvD-GFhZ', '1a0a8b5f-99a8-11db-937f-000e0c431b59', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для дерева', ''),
('1a0a8b5f-99a8-11db-937f-000e0c431b59-BErM-FBOQ-AP1K-HVNg-BCvn-G9jW', '1a0a8b5f-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('1a0a8b5f-99a8-11db-937f-000e0c431b59-BhH6-Fytf-At7I-HaJH-Byds-GH9r', '1a0a8b5f-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('1a0a8b5f-99a8-11db-937f-000e0c431b59-BmBq-FwW5-ASYq-H6WP-BS1j-GlcT', '1a0a8b5f-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('1a0a8b5f-99a8-11db-937f-000e0c431b59-BMqI-FdOR-AfmC-Hjrk-B0rZ-GxXK', '1a0a8b5f-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '600', 'г'),
('1a0a8b5f-99a8-11db-937f-000e0c431b59-BTkS-Ff08-Ase7-HhEN-Bl4F-GXWr', '1a0a8b5f-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'махагон', ''),
('1a0a8b61-99a8-11db-937f-000e0c431b59-B8d8-FACo-AkBV-HAys-BLxB-Gayz', '1a0a8b61-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('1a0a8b61-99a8-11db-937f-000e0c431b59-B9SO-FAx5-Afmo-HMRZ-BheG-Gq8U', '1a0a8b61-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'махагон', ''),
('1a0a8b61-99a8-11db-937f-000e0c431b59-BcTr-FyTg-AhfU-Hi6I-BYPc-G1P0', '1a0a8b61-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('1a0a8b61-99a8-11db-937f-000e0c431b59-BF5U-FnVv-Aawv-H4Ph-BhgR-GMSm', '1a0a8b61-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1500', 'г'),
('1a0a8b61-99a8-11db-937f-000e0c431b59-BfnX-FzMS-A9kh-Hbax-Ba0c-Gdwn', '1a0a8b61-99a8-11db-937f-000e0c431b59', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для печей', ''),
('1a0a8b61-99a8-11db-937f-000e0c431b59-BjpC-FwLx-A8Bf-HlzO-BRSh-G9G2', '1a0a8b61-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('1a0a8b61-99a8-11db-937f-000e0c431b59-BQup-FvVf-AAmx-Hik5-BaGh-Gx6t', '1a0a8b61-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'шпатлевка', ''),
('1a0a8b61-99a8-11db-937f-000e0c431b59-BUTb-F0gt-AZDN-HguK-B1sn-Gxsq', '1a0a8b61-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('1a0a8b63-99a8-11db-937f-000e0c431b59-B1sQ-FfHF-AdIn-HtZs-B1gN-GNiq', '1a0a8b63-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('1a0a8b63-99a8-11db-937f-000e0c431b59-BGeX-FCda-A5Lj-HqOV-BxCh-Grln', '1a0a8b63-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('1a0a8b63-99a8-11db-937f-000e0c431b59-BHdt-FvMJ-AdDp-HqQN-BW6q-GOJz', '1a0a8b63-99a8-11db-937f-000e0c431b59', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для печей', ''),
('1a0a8b63-99a8-11db-937f-000e0c431b59-BKBl-Fzr3-ADEy-HuT9-Bjor-GUIj', '1a0a8b63-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '600', 'г'),
('1a0a8b63-99a8-11db-937f-000e0c431b59-Boc2-FOIG-Aj7I-HHnu-Bvdd-GB0k', '1a0a8b63-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('1a0a8b63-99a8-11db-937f-000e0c431b59-BsSP-Fg1z-AaQ7-H9D2-BsIv-GCvH', '1a0a8b63-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'орех', ''),
('1a0a8b63-99a8-11db-937f-000e0c431b59-BUtv-Fd2Z-AOn3-Hrp3-BSwV-GBhi', '1a0a8b63-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'шпатлевка', ''),
('1a0a8b63-99a8-11db-937f-000e0c431b59-ByM4-FjFJ-AGmp-HYz8-BBiQ-GQEG', '1a0a8b63-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('1a0a8b65-99a8-11db-937f-000e0c431b59-B4cA-FrMU-Aqv9-HYGG-B81c-GKdg', '1a0a8b65-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('1a0a8b65-99a8-11db-937f-000e0c431b59-BC93-FrzQ-A5Py-HIQN-BEKp-GF32', '1a0a8b65-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('1a0a8b65-99a8-11db-937f-000e0c431b59-BiVz-FIT5-AMxC-HOK2-BGxl-GOQd', '1a0a8b65-99a8-11db-937f-000e0c431b59', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для печей', ''),
('1a0a8b65-99a8-11db-937f-000e0c431b59-Bm6a-FLQd-Amc6-HlRw-Bh1I-GX0b', '1a0a8b65-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'шпатлевка', ''),
('1a0a8b65-99a8-11db-937f-000e0c431b59-BntH-Fc3Y-Ap8i-HUCb-BMc0-Gz16', '1a0a8b65-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('1a0a8b65-99a8-11db-937f-000e0c431b59-BRLP-FTZa-ALgO-Hwue-BQXZ-Grip', '1a0a8b65-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1500', 'г'),
('1a0a8b65-99a8-11db-937f-000e0c431b59-BuWN-FmD3-AfVo-H2XM-BZiO-GBY7', '1a0a8b65-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'орех', ''),
('1a0a8b65-99a8-11db-937f-000e0c431b59-BZim-FY7t-Ae5j-H8ED-BeHC-GWz3', '1a0a8b65-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('1a0a8b67-99a8-11db-937f-000e0c431b59-B1lm-F1DR-AJVF-H80Q-BCtT-Gp9n', '1a0a8b67-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('1a0a8b67-99a8-11db-937f-000e0c431b59-B6ih-F0ci-ApBZ-H6OI-BQrA-G6Qz', '1a0a8b67-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '600', 'г'),
('1a0a8b67-99a8-11db-937f-000e0c431b59-Bd3p-Fizo-Az3Y-HJhW-BxFl-Gq5U', '1a0a8b67-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'шпатлевка', ''),
('1a0a8b67-99a8-11db-937f-000e0c431b59-BeaU-FvbB-AA6A-HboT-BRyx-GoLE', '1a0a8b67-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('1a0a8b67-99a8-11db-937f-000e0c431b59-BhO4-FzsO-AoME-H4Bp-Bj2Q-GMsU', '1a0a8b67-99a8-11db-937f-000e0c431b59', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для печей', ''),
('1a0a8b67-99a8-11db-937f-000e0c431b59-BJeW-FXRG-A2hd-HQPC-B7aN-GEgA', '1a0a8b67-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('1a0a8b67-99a8-11db-937f-000e0c431b59-BKLI-FGwZ-A4UQ-HBrP-Bd9a-GtS1', '1a0a8b67-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'сосна', ''),
('1a0a8b67-99a8-11db-937f-000e0c431b59-BuCm-FOT3-AQQS-HdUy-BezO-Gykq', '1a0a8b67-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('1a0a8b69-99a8-11db-937f-000e0c431b59-BBu7-FW4W-AWTI-HrCq-BTSK-Gbwi', '1a0a8b69-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('1a0a8b69-99a8-11db-937f-000e0c431b59-BD4G-FMlJ-A45b-HDWN-BmZ9-GUGU', '1a0a8b69-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'шпатлевка', ''),
('1a0a8b69-99a8-11db-937f-000e0c431b59-BDvs-FrVV-AWxr-HYJH-BuL3-Grhw', '1a0a8b69-99a8-11db-937f-000e0c431b59', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для печей', ''),
('1a0a8b69-99a8-11db-937f-000e0c431b59-BkGs-F9QQ-AVDV-H7uP-BRpy-GypQ', '1a0a8b69-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'сосна', ''),
('1a0a8b69-99a8-11db-937f-000e0c431b59-BpdH-FW3R-Aenc-HXU0-BKY4-GQke', '1a0a8b69-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1500', 'г'),
('1a0a8b69-99a8-11db-937f-000e0c431b59-BPdI-FdYl-A9Jo-Hkmp-BbWC-GWaV', '1a0a8b69-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('1a0a8b69-99a8-11db-937f-000e0c431b59-BtW5-FETo-AUkU-HJZA-BZwV-Gsil', '1a0a8b69-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('1a0a8b69-99a8-11db-937f-000e0c431b59-BWUS-FwQg-A5gO-H5ce-BuCl-GdB2', '1a0a8b69-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('1a0a8b6b-99a8-11db-937f-000e0c431b59-B750-FWzO-AKUK-HJbG-BRJi-GvXC', '1a0a8b6b-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1000', 'г'),
('1a0a8b6b-99a8-11db-937f-000e0c431b59-B8jY-FsRu-A1KZ-H6Oy-Bf79-GH7H', '1a0a8b6b-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('1a0a8b6b-99a8-11db-937f-000e0c431b59-B9Ex-FfBP-A3Bq-HlFG-BLEq-GOVJ', '1a0a8b6b-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'бежевый', ''),
('1a0a8b6b-99a8-11db-937f-000e0c431b59-BPVl-F67r-ABHv-HsWH-B3oF-GEZj', '1a0a8b6b-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('1a0a8b6b-99a8-11db-937f-000e0c431b59-Brbd-FNez-AMIb-HgY9-BxVh-GMEz', '1a0a8b6b-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('1a0a8b6b-99a8-11db-937f-000e0c431b59-BrKm-FAIk-AeWg-HDW9-BnlU-GPhQ', '1a0a8b6b-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('1a0a8b6b-99a8-11db-937f-000e0c431b59-BS9M-Fuen-AuCS-H99e-BN7i-GAck', '1a0a8b6b-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('1a0a8b6d-99a8-11db-937f-000e0c431b59-B9dB-Fxj1-ACZR-H2Th-Bavr-GB3U', '1a0a8b6d-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('1a0a8b6d-99a8-11db-937f-000e0c431b59-BbKl-FHnX-AKJv-HxzK-BhGm-GMSm', '1a0a8b6d-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('1a0a8b6d-99a8-11db-937f-000e0c431b59-BcZK-FuQd-ARrP-H9tH-BTIK-GxTB', '1a0a8b6d-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '2000', 'г'),
('1a0a8b6d-99a8-11db-937f-000e0c431b59-BkkL-FCHj-AB56-HjG0-BYD5-GYZu', '1a0a8b6d-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'бежевый', ''),
('1a0a8b6d-99a8-11db-937f-000e0c431b59-BnkE-Fxug-A5Bp-HcwD-BfXn-GqZu', '1a0a8b6d-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('1a0a8b6d-99a8-11db-937f-000e0c431b59-BQbo-FLAv-ALZz-HFyO-Bzbz-G5Pj', '1a0a8b6d-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('1a0a8b6d-99a8-11db-937f-000e0c431b59-BZDd-FK1T-AVYa-H8ls-BkjM-GmXv', '1a0a8b6d-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('1a0a8b6f-99a8-11db-937f-000e0c431b59-B2TV-FGSE-AOlN-HZZh-BagM-G1Ez', '1a0a8b6f-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('1a0a8b6f-99a8-11db-937f-000e0c431b59-B2UC-Fcw3-AbAJ-HyXM-BcPf-GyWx', '1a0a8b6f-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('1a0a8b6f-99a8-11db-937f-000e0c431b59-B4lY-FGAy-AoaU-H1QY-BpIs-Gslf', '1a0a8b6f-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('1a0a8b6f-99a8-11db-937f-000e0c431b59-Bcwi-Fwnz-ALT8-H5Bj-BZml-G6Wc', '1a0a8b6f-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('1a0a8b6f-99a8-11db-937f-000e0c431b59-BHpZ-FhmB-AQNl-Hcz9-BNRX-GXCo', '1a0a8b6f-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'бежевый', ''),
('1a0a8b6f-99a8-11db-937f-000e0c431b59-BkCf-Fu24-A7TJ-HbIg-BPBH-GoIH', '1a0a8b6f-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('1a0a8b6f-99a8-11db-937f-000e0c431b59-BySw-F9u5-Ae07-HmnE-BuG2-GS3e', '1a0a8b6f-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '20000', 'г'),
('1a0a8b71-99a8-11db-937f-000e0c431b59-B9xP-FkEg-AE14-HmaX-BJze-GDp2', '1a0a8b71-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('1a0a8b71-99a8-11db-937f-000e0c431b59-BHEx-FF9z-AoYb-HPTx-BsIG-GfG2', '1a0a8b71-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый глянцевый', ''),
('1a0a8b71-99a8-11db-937f-000e0c431b59-BPyp-FJaF-Agj5-HAnk-B355-G1i9', '1a0a8b71-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('1a0a8b71-99a8-11db-937f-000e0c431b59-BRT8-FnEi-AGqj-HKK7-BdJt-Gtty', '1a0a8b71-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('1a0a8b71-99a8-11db-937f-000e0c431b59-BYH5-F1XN-AoFW-Hulc-BmAE-GdWS', '1a0a8b71-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('1a0a8b71-99a8-11db-937f-000e0c431b59-BZl2-FVNf-Aa8l-HRQe-BwXi-Gjdg', '1a0a8b71-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('1a0a8b71-99a8-11db-937f-000e0c431b59-BZop-F0z1-A6S0-HpBt-BdQh-GJZ9', '1a0a8b71-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '900', 'г'),
('1a0a8b73-99a8-11db-937f-000e0c431b59-B7d5-FRvk-A7Ue-HzUW-BUCU-G40c', '1a0a8b73-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1900', 'г'),
('1a0a8b73-99a8-11db-937f-000e0c431b59-BdUI-FChJ-Ap4U-HRpp-Bj53-G02f', '1a0a8b73-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('1a0a8b73-99a8-11db-937f-000e0c431b59-BJ0a-FJpc-A3Is-HaRI-BZgE-G8qA', '1a0a8b73-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('1a0a8b73-99a8-11db-937f-000e0c431b59-BJaz-FPEe-A5si-HNBm-BVLm-GwUR', '1a0a8b73-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('1a0a8b73-99a8-11db-937f-000e0c431b59-BO6i-FJ7L-AuyG-Hopo-BnES-GTDI', '1a0a8b73-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый глянцевый', ''),
('1a0a8b73-99a8-11db-937f-000e0c431b59-BONa-F8ns-AFCP-HJA6-BKJV-G0Za', '1a0a8b73-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('1a0a8b73-99a8-11db-937f-000e0c431b59-Bs8i-F8Hi-A3Ss-HORI-Bovd-GwxA', '1a0a8b73-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('1a0a8b75-99a8-11db-937f-000e0c431b59-Bc3u-FLGB-AUux-Hxhk-ByeD-Gsvy', '1a0a8b75-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый глянцевый', ''),
('1a0a8b75-99a8-11db-937f-000e0c431b59-Bl5N-F3GR-A6Go-HrQz-BB4K-GNCA', '1a0a8b75-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('1a0a8b75-99a8-11db-937f-000e0c431b59-BLry-FXuU-A0Tk-HVHW-BNsR-GbkX', '1a0a8b75-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('1a0a8b75-99a8-11db-937f-000e0c431b59-BnVM-FJ19-ApxM-HDfl-BiPV-Gxw3', '1a0a8b75-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('1a0a8b75-99a8-11db-937f-000e0c431b59-BSsJ-Fxhd-AK3f-Hfvf-B8OY-GsZe', '1a0a8b75-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('1a0a8b75-99a8-11db-937f-000e0c431b59-Btge-FYOu-AOPn-HYcq-BZoX-GOCI', '1a0a8b75-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '20000', 'г'),
('1a0a8b75-99a8-11db-937f-000e0c431b59-BttP-Fhgx-AHVR-HLED-BAWv-GJKT', '1a0a8b75-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('1a0a8b7b-99a8-11db-937f-000e0c431b59-B0Jj-F9qm-A5US-HTuP-BmfX-GcHe', '1a0a8b7b-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('1a0a8b7b-99a8-11db-937f-000e0c431b59-B8im-FHbg-A3zc-HIDv-BN2p-Gtui', '1a0a8b7b-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '20000', 'г'),
('1a0a8b7b-99a8-11db-937f-000e0c431b59-BDfz-FVyk-AlbF-H94M-BdRm-G5zx', '1a0a8b7b-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('1a0a8b7b-99a8-11db-937f-000e0c431b59-BuIz-FlG6-AS7J-Huco-B5rY-GiDQ', '1a0a8b7b-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый матовый', ''),
('1a0a8b7b-99a8-11db-937f-000e0c431b59-Bx4g-F43Z-AGWr-HtRg-BgFh-GaeJ', '1a0a8b7b-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('1a0a8b7b-99a8-11db-937f-000e0c431b59-ByB4-FZlg-AEcJ-H44v-BY7Q-GNSE', '1a0a8b7b-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('1a0a8b7b-99a8-11db-937f-000e0c431b59-BYZb-FhK4-ALFl-Hkno-B2ny-Gale', '1a0a8b7b-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('1a0a8b7d-99a8-11db-937f-000e0c431b59-BJ25-F1kL-AXHQ-H6hv-BEeU-Grlw', '1a0a8b7d-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'бирюзовый', ''),
('1a0a8b7d-99a8-11db-937f-000e0c431b59-BK0E-FDHs-AiCj-HhjG-BIwF-GjgM', '1a0a8b7d-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('1a0a8b7d-99a8-11db-937f-000e0c431b59-Bki8-FTtT-Alnb-H2Zm-B9jl-GCnt', '1a0a8b7d-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('1a0a8b7d-99a8-11db-937f-000e0c431b59-BM9a-FtGA-ABvt-HKWS-B5IP-GvKH', '1a0a8b7d-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('1a0a8b7d-99a8-11db-937f-000e0c431b59-BNdm-Fqmp-Abzh-HHjR-BpsJ-Gkjt', '1a0a8b7d-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('1a0a8b7d-99a8-11db-937f-000e0c431b59-Bv72-FC3Y-Ay74-HIof-B529-Ghhl', '1a0a8b7d-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('1a0a8b7d-99a8-11db-937f-000e0c431b59-BvMv-FUtV-Ab3H-Hhbo-BtBM-GrV6', '1a0a8b7d-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1000', 'г'),
('1a0a8b7f-99a8-11db-937f-000e0c431b59-BA7j-Fcy0-AFwi-HrzM-BakY-GM6H', '1a0a8b7f-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'бирюзовый', ''),
('1a0a8b7f-99a8-11db-937f-000e0c431b59-BAJm-FxU1-Afmm-Hk5D-Bjpz-GL5H', '1a0a8b7f-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('1a0a8b7f-99a8-11db-937f-000e0c431b59-BB4X-FjlM-AwBx-HKOs-BSvF-GSb0', '1a0a8b7f-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('1a0a8b7f-99a8-11db-937f-000e0c431b59-BhU7-FJ61-ANfg-HCra-BJzY-GBPM', '1a0a8b7f-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '2000', 'г'),
('1a0a8b7f-99a8-11db-937f-000e0c431b59-BhWA-Fp4c-ATne-HgUz-BcVw-GCyk', '1a0a8b7f-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('1a0a8b7f-99a8-11db-937f-000e0c431b59-BI92-FZyo-AfOc-HeCz-BFC0-GrzT', '1a0a8b7f-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('1a0a8b7f-99a8-11db-937f-000e0c431b59-Buvm-FOS7-ADuR-H1wF-Bax0-GxXk', '1a0a8b7f-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('1a0a8b81-99a8-11db-937f-000e0c431b59-BD6H-Fk9y-AAHo-HZJ4-Bmyo-GD75', '1a0a8b81-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('1a0a8b81-99a8-11db-937f-000e0c431b59-BfFp-FhKS-Ahrh-HeyE-Bzou-GKBQ', '1a0a8b81-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '20000', 'г'),
('1a0a8b81-99a8-11db-937f-000e0c431b59-Bh4O-FD1Q-AYHz-HETh-BqXd-Gx8b', '1a0a8b81-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('1a0a8b81-99a8-11db-937f-000e0c431b59-Bm8j-FQXt-AK0h-HzDe-BtlY-G8oO', '1a0a8b81-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('1a0a8b81-99a8-11db-937f-000e0c431b59-BODV-FDIp-AlzC-HEn0-BgP8-GGgU', '1a0a8b81-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('1a0a8b81-99a8-11db-937f-000e0c431b59-Bpub-FHPd-A8Uf-H7BV-BQjq-GMsl', '1a0a8b81-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'бирюзовый', ''),
('1a0a8b81-99a8-11db-937f-000e0c431b59-BzqU-FXfX-A3P0-HQMn-Bear-G1e1', '1a0a8b81-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('1a0a8b83-99a8-11db-937f-000e0c431b59-B6pX-FN2v-AsUh-HTTx-BaPL-GCRK', '1a0a8b83-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('1a0a8b83-99a8-11db-937f-000e0c431b59-B6Ym-FC0D-Ax0k-HEtJ-B5qK-GXu2', '1a0a8b83-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('1a0a8b83-99a8-11db-937f-000e0c431b59-B7Bd-FErh-A6fS-HLXe-Bdwk-G0PH', '1a0a8b83-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('1a0a8b83-99a8-11db-937f-000e0c431b59-BBUM-Fjnf-AXDu-HiGC-BtMI-G53S', '1a0a8b83-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '2000', 'г'),
('1a0a8b83-99a8-11db-937f-000e0c431b59-BFFK-FqJ5-A1Ek-HBcV-B3XA-GQl2', '1a0a8b83-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('1a0a8b83-99a8-11db-937f-000e0c431b59-BGft-FCkM-AbmI-HpE2-ByuP-G2LR', '1a0a8b83-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'вишневый', ''),
('1a0a8b83-99a8-11db-937f-000e0c431b59-BZGg-Fdg7-AIfH-Hkav-BAhQ-Guj1', '1a0a8b83-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('1a0a8b85-99a8-11db-937f-000e0c431b59-BBB0-FFEj-ALXs-HLNX-BVvO-GJd8', '1a0a8b85-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('1a0a8b85-99a8-11db-937f-000e0c431b59-BdzZ-Fx5O-Ap4u-Hnfd-BMgf-GLlj', '1a0a8b85-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('1a0a8b85-99a8-11db-937f-000e0c431b59-Bh4f-FhJs-ALoJ-H3en-BsAt-GXi5', '1a0a8b85-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'вишневый', ''),
('1a0a8b85-99a8-11db-937f-000e0c431b59-Bi1y-FrtT-AVbT-HFz3-B0f9-Glti', '1a0a8b85-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('1a0a8b85-99a8-11db-937f-000e0c431b59-BqFl-FNkZ-ARaE-HCkG-BTI0-GzpJ', '1a0a8b85-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('1a0a8b85-99a8-11db-937f-000e0c431b59-BqYC-FaCh-A5OD-HZZp-B9Kc-G6oa', '1a0a8b85-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1000', 'г'),
('1a0a8b85-99a8-11db-937f-000e0c431b59-Bvw8-Fd8K-A1T6-HFcZ-BC7O-GbtI', '1a0a8b85-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('1a0a8b87-99a8-11db-937f-000e0c431b59-BGVq-FCSB-AdBs-Hvmf-BeJc-GX1q', '1a0a8b87-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('1a0a8b87-99a8-11db-937f-000e0c431b59-Bh74-FqO9-Aty4-HevN-B9hT-GGhK', '1a0a8b87-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('1a0a8b87-99a8-11db-937f-000e0c431b59-BouA-FWgm-A3Av-HUXm-BAuL-Gf0O', '1a0a8b87-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '20000', 'г'),
('1a0a8b87-99a8-11db-937f-000e0c431b59-BV21-FGa8-AJKJ-HRFC-Bk5u-G8Ue', '1a0a8b87-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('1a0a8b87-99a8-11db-937f-000e0c431b59-BwFH-F02A-Ayf6-H8Va-BtqS-Gkxs', '1a0a8b87-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('1a0a8b87-99a8-11db-937f-000e0c431b59-BWje-FPDQ-AcCy-HwIV-B8Pq-GnR9', '1a0a8b87-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('1a0a8b87-99a8-11db-937f-000e0c431b59-BzsW-Fatz-AvmN-Hv4y-Bn6J-Gzew', '1a0a8b87-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'вишневый', ''),
('1a0a8b89-99a8-11db-937f-000e0c431b59-BAWO-FVIy-ArJJ-HebF-BhI7-GveY', '1a0a8b89-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('1a0a8b89-99a8-11db-937f-000e0c431b59-BCZR-FM5s-ARb1-HOMV-BmBH-GDW3', '1a0a8b89-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('1a0a8b89-99a8-11db-937f-000e0c431b59-BFFz-F65L-Ah5h-HgHQ-BoKp-G6Wk', '1a0a8b89-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1000', 'г'),
('1a0a8b89-99a8-11db-937f-000e0c431b59-BMtN-F9Dl-AkEV-HvjV-BAVx-GR6C', '1a0a8b89-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('1a0a8b89-99a8-11db-937f-000e0c431b59-Br1O-FVcD-ARBg-H9lX-BLyG-GZwK', '1a0a8b89-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('1a0a8b89-99a8-11db-937f-000e0c431b59-BvcR-FjOZ-A6Lo-Hlz7-Bjdq-Gk1M', '1a0a8b89-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'голубой', ''),
('1a0a8b89-99a8-11db-937f-000e0c431b59-Bywa-FVvB-As71-HzVm-B0W0-GNsH', '1a0a8b89-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('1a0a8b8b-99a8-11db-937f-000e0c431b59-B1it-FMTa-AGpA-HGh9-BsCm-GlVm', '1a0a8b8b-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('1a0a8b8b-99a8-11db-937f-000e0c431b59-B2Ff-FZmn-ApRx-HVMJ-B62x-G8Wp', '1a0a8b8b-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('1a0a8b8b-99a8-11db-937f-000e0c431b59-Bfo4-FT0G-Ad68-HQ3T-B7Eg-GHfr', '1a0a8b8b-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('1a0a8b8b-99a8-11db-937f-000e0c431b59-BLMK-FbKs-ADBV-Hur5-BWj0-G29m', '1a0a8b8b-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('1a0a8b8b-99a8-11db-937f-000e0c431b59-BonB-Ff3O-A1eP-H9il-B1nr-Gqil', '1a0a8b8b-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'голубой', ''),
('1a0a8b8b-99a8-11db-937f-000e0c431b59-Bszh-FpGZ-A0Cd-HgK0-BOAi-G8N2', '1a0a8b8b-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('1a0a8b8b-99a8-11db-937f-000e0c431b59-BYTh-FYZE-AXHG-H0tc-BmbR-GJHX', '1a0a8b8b-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '2000', 'г'),
('1a0a8b8d-99a8-11db-937f-000e0c431b59-B4J9-Ffox-A3gG-HoYs-BvCm-Gfz4', '1a0a8b8d-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '20000', 'г'),
('1a0a8b8d-99a8-11db-937f-000e0c431b59-BdY0-FTUw-ARnI-HWXh-BFs9-GqoB', '1a0a8b8d-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('1a0a8b8d-99a8-11db-937f-000e0c431b59-BEBo-FLBY-Ann1-H6w8-BTVE-GtYs', '1a0a8b8d-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('1a0a8b8d-99a8-11db-937f-000e0c431b59-BIag-FzTC-AJtm-HfzX-B2Sw-G2mG', '1a0a8b8d-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('1a0a8b8d-99a8-11db-937f-000e0c431b59-BjHa-FDok-AC3l-Hl1y-BcOH-GAnh', '1a0a8b8d-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'голубой', ''),
('1a0a8b8d-99a8-11db-937f-000e0c431b59-Bo5u-FwQH-ATV1-HSCf-BTK6-G10O', '1a0a8b8d-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('1a0a8b8d-99a8-11db-937f-000e0c431b59-BUbl-F7Cb-Avfq-H4fU-BajV-GFuW', '1a0a8b8d-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('1a0a8b8f-99a8-11db-937f-000e0c431b59-B45w-FAiL-AsUN-HVzC-BPcM-Ge6n', '1a0a8b8f-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('1a0a8b8f-99a8-11db-937f-000e0c431b59-BEYL-FmpM-ALNI-HpiD-BrEr-GDys', '1a0a8b8f-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('1a0a8b8f-99a8-11db-937f-000e0c431b59-BgoW-FtAL-AwPo-H9tj-Bmed-GCsQ', '1a0a8b8f-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('1a0a8b8f-99a8-11db-937f-000e0c431b59-BjHN-Frwv-Avd1-Hdhp-BLwQ-GIq1', '1a0a8b8f-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1000', 'г'),
('1a0a8b8f-99a8-11db-937f-000e0c431b59-BmJO-FdbR-A9vc-H4mc-BIfl-GGBQ', '1a0a8b8f-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'желтый', ''),
('1a0a8b8f-99a8-11db-937f-000e0c431b59-BPl8-F4jq-AdML-H7O5-BMST-GX60', '1a0a8b8f-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('1a0a8b8f-99a8-11db-937f-000e0c431b59-Bv4Z-FNxC-Ap6i-HRBj-Bh6d-GU6C', '1a0a8b8f-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('1a1ab87b-f78e-11e3-8c8a-005056be1f7b-BgSb-FwKo-A0Ia-H5f2-B1Sx-GEIj', '1a1ab87b-f78e-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('1a1ab87b-f78e-11e3-8c8a-005056be1f7b-Bhgl-Fy2l-AMzQ-H3NN-B8v5-GWb7', '1a1ab87b-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('1a1ab87b-f78e-11e3-8c8a-005056be1f7b-BirY-FpBZ-AeSE-H1EX-BI7N-Gy93', '1a1ab87b-f78e-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'синий', ''),
('1a1ab87b-f78e-11e3-8c8a-005056be1f7b-BrBY-FLna-Av39-HnhS-Bq3m-G3n1', '1a1ab87b-f78e-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1900', 'г'),
('1a1ab87b-f78e-11e3-8c8a-005056be1f7b-BUUL-FvOr-AnE0-HaII-B0ge-GdJR', '1a1ab87b-f78e-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('1a1ab87b-f78e-11e3-8c8a-005056be1f7b-Bw6O-F1wS-AN5P-HbtN-BTRu-G5Fm', '1a1ab87b-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('1a1ab87b-f78e-11e3-8c8a-005056be1f7b-BXWe-FnxN-A2Ge-HmBk-BOh3-GpUD', '1a1ab87b-f78e-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('1b75918d-9fb8-11e3-8705-005056be1f7b-B256-F4rJ-Atig-HJxs-Bcg7-G9Nq', '1b75918d-9fb8-11e3-8705-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('1b75918d-9fb8-11e3-8705-005056be1f7b-B35p-Fffx-ArZi-HMJc-BHiN-G8Hw', '1b75918d-9fb8-11e3-8705-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('1b75918d-9fb8-11e3-8705-005056be1f7b-B40k-FUBa-AJtz-H2yq-Bhpk-GdiS', '1b75918d-9fb8-11e3-8705-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('1b75918d-9fb8-11e3-8705-005056be1f7b-BeQJ-FTH8-AApn-HlIM-B4ue-Gu56', '1b75918d-9fb8-11e3-8705-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('1b75918d-9fb8-11e3-8705-005056be1f7b-Bi4V-Fb8x-AEPB-HwNz-B1Xa-GPLT', '1b75918d-9fb8-11e3-8705-005056be1f7b', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('1b75918d-9fb8-11e3-8705-005056be1f7b-BmR1-FJbo-A25K-Hx3Y-BdwY-GDGZ', '1b75918d-9fb8-11e3-8705-005056be1f7b', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсальное', ''),
('1b75918d-9fb8-11e3-8705-005056be1f7b-BqGy-FLc5-AxOf-HpJZ-BpCT-GViz', '1b75918d-9fb8-11e3-8705-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '900', 'г'),
('1b75918d-9fb8-11e3-8705-005056be1f7b-BtOf-Fru6-Av4b-HB1y-BsZs-GE1p', '1b75918d-9fb8-11e3-8705-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый матовый', ''),
('1b75918d-9fb8-11e3-8705-005056be1f7b-BYv1-Fjis-A9Cf-HWGl-Bvk3-G650', '1b75918d-9fb8-11e3-8705-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('1bd57597-93b0-11e3-82a4-005056be1f7b-BaOS-FSPe-AmCX-HpZs-BcC8-Gr43', '1bd57597-93b0-11e3-82a4-005056be1f7b', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для ржавчины', ''),
('1bd57597-93b0-11e3-82a4-005056be1f7b-Bjz4-Fl8G-AsfT-Hu1w-BonT-Gobv', '1bd57597-93b0-11e3-82a4-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('1bd57597-93b0-11e3-82a4-005056be1f7b-BkIY-F54P-Arh3-HALT-Bw3C-GXVw', '1bd57597-93b0-11e3-82a4-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('1bd57597-93b0-11e3-82a4-005056be1f7b-BM1Z-Fgtb-AQfE-HIql-B4G1-GMZF', '1bd57597-93b0-11e3-82a4-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'грунт-эмаль', ''),
('1bd57597-93b0-11e3-82a4-005056be1f7b-BmOP-F16e-A8hT-H3Bt-Bwm3-GKhv', '1bd57597-93b0-11e3-82a4-005056be1f7b', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.75', 'л'),
('1bd57597-93b0-11e3-82a4-005056be1f7b-Bqsk-FcuO-A4cO-HqPG-Bly6-Gea4', '1bd57597-93b0-11e3-82a4-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('1bd57597-93b0-11e3-82a4-005056be1f7b-BVXD-F3Hx-A89B-HINH-BhNC-GVd4', '1bd57597-93b0-11e3-82a4-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'синий', ''),
('1bd57597-93b0-11e3-82a4-005056be1f7b-BwgA-FxcC-ARzw-HBna-Bs0x-Gw26', '1bd57597-93b0-11e3-82a4-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('1d967145-f787-11e3-8c8a-005056be1f7b-B150-F81D-A8dd-HHo7-BX3k-GTzU', '1d967145-f787-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('1d967145-f787-11e3-8c8a-005056be1f7b-B6Rn-F7tf-ADrU-HUoS-B8eM-G8bD', '1d967145-f787-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('1d967145-f787-11e3-8c8a-005056be1f7b-BBYg-FegL-Aa4D-HBN4-BVIL-G0E6', '1d967145-f787-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('1d967145-f787-11e3-8c8a-005056be1f7b-BDGe-Fza3-ADwR-HqpL-Bzuf-G241', '1d967145-f787-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '800', 'г'),
('1d967145-f787-11e3-8c8a-005056be1f7b-BeIm-FycR-AHaw-HTXN-BWZm-G44J', '1d967145-f787-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('1d967145-f787-11e3-8c8a-005056be1f7b-BEUC-FIVP-ACqY-HNqd-BJKl-Gw0E', '1d967145-f787-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('1d967145-f787-11e3-8c8a-005056be1f7b-BNo7-F8tm-AbTA-Hc2H-B8zR-G79n', '1d967145-f787-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'серебрянный', ''),
('1f4ff69d-f78f-11e3-8c8a-005056be1f7b-B0Og-FTFf-AUo5-HCm6-Bclp-GJ00', '1f4ff69d-f78f-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('1f4ff69d-f78f-11e3-8c8a-005056be1f7b-B9ur-FYTj-ACFy-HUrZ-BPzi-GFGO', '1f4ff69d-f78f-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'серый', ''),
('1f4ff69d-f78f-11e3-8c8a-005056be1f7b-Bbz4-FWG5-ARVo-HPp7-BjwL-Gfe7', '1f4ff69d-f78f-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('1f4ff69d-f78f-11e3-8c8a-005056be1f7b-BGP6-Fsvm-AafT-HYvU-Bahp-GIOD', '1f4ff69d-f78f-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('1f4ff69d-f78f-11e3-8c8a-005056be1f7b-BI5c-FbSN-Avtv-Ha20-BdTy-GXq5', '1f4ff69d-f78f-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '6000', 'г'),
('1f4ff69d-f78f-11e3-8c8a-005056be1f7b-BtCE-FiWw-A8ll-Hfqs-Buq8-GQAC', '1f4ff69d-f78f-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('1f4ff69d-f78f-11e3-8c8a-005056be1f7b-BwVr-FqXT-Al16-HQA5-BPt8-GUSU', '1f4ff69d-f78f-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('206ff829-f790-11e3-8c8a-005056be1f7b-BF5y-FRVM-AZBz-Hxbu-Bbiu-G0O8', '206ff829-f790-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('206ff829-f790-11e3-8c8a-005056be1f7b-BG0h-FqNS-AHip-HCSk-BL1N-GhMV', '206ff829-f790-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'черный', ''),
('206ff829-f790-11e3-8c8a-005056be1f7b-BH4I-F8rk-ArII-HbHX-BYZu-G5WI', '206ff829-f790-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('206ff829-f790-11e3-8c8a-005056be1f7b-Br6s-FWqz-AMyC-H9th-BF2b-GOyI', '206ff829-f790-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('206ff829-f790-11e3-8c8a-005056be1f7b-BRWf-F8Yx-Aijo-HvH1-BHNv-G6eH', '206ff829-f790-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('206ff829-f790-11e3-8c8a-005056be1f7b-Bvhk-FygU-AVlL-Hw10-B5of-GLld', '206ff829-f790-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '20000', 'г'),
('206ff829-f790-11e3-8c8a-005056be1f7b-ByfQ-F88Y-AUWx-HEQK-BN9F-G6Uw', '206ff829-f790-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f87c-99a8-11db-937f-000e0c431b59-BjPd-FvP9-AnFT-Hp9q-BwJ9-GL5h', '20b7f87c-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f87c-99a8-11db-937f-000e0c431b59-BKSY-FuiD-AQwR-H4OO-BRb7-GJfH', '20b7f87c-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f87c-99a8-11db-937f-000e0c431b59-BNr3-FELZ-AtWM-H0f3-B1UB-G4WH', '20b7f87c-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f87c-99a8-11db-937f-000e0c431b59-BOKU-FgDi-AuVA-Hqff-BxEv-GRzA', '20b7f87c-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f87c-99a8-11db-937f-000e0c431b59-Bols-FoSN-AKGS-H6XI-B6nl-GBMu', '20b7f87c-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '2000', 'г'),
('20b7f87c-99a8-11db-937f-000e0c431b59-BPdG-FjJE-AP6O-HOGI-BvVT-GF2X', '20b7f87c-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f87c-99a8-11db-937f-000e0c431b59-BzJC-FBFR-A7Rk-HPof-BOOm-Gb7Y', '20b7f87c-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'желтый', ''),
('20b7f87e-99a8-11db-937f-000e0c431b59-B010-Fk0s-ACDg-HgIu-B8kg-GRDa', '20b7f87e-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f87e-99a8-11db-937f-000e0c431b59-B4Ho-Fanw-ALlW-Hr3a-BHaM-GWPV', '20b7f87e-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '20000', 'г'),
('20b7f87e-99a8-11db-937f-000e0c431b59-BcvU-Fd5P-AryR-HYYp-Bvwg-GkTK', '20b7f87e-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f87e-99a8-11db-937f-000e0c431b59-BGBA-FZ8X-Ah4B-HJ6O-B4Cq-GkXX', '20b7f87e-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f87e-99a8-11db-937f-000e0c431b59-BGcq-FVqx-AdcI-HxiA-BKMm-G425', '20b7f87e-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'желтый', ''),
('20b7f87e-99a8-11db-937f-000e0c431b59-BhvO-FzJn-Ae5a-HAft-BLfk-GLFk', '20b7f87e-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f87e-99a8-11db-937f-000e0c431b59-BY2z-FgoY-Ahzk-HJsc-BDyd-GEOb', '20b7f87e-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f880-99a8-11db-937f-000e0c431b59-BAtQ-Fatw-AJ5R-HuGW-BU0e-G9ZI', '20b7f880-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'зеленый', ''),
('20b7f880-99a8-11db-937f-000e0c431b59-BIWp-FaHv-Axcu-HRbK-BaMv-GJTD', '20b7f880-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f880-99a8-11db-937f-000e0c431b59-BM3d-FBzv-AKzz-HKTq-BvDn-GEzp', '20b7f880-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1000', 'г'),
('20b7f880-99a8-11db-937f-000e0c431b59-BQaL-FBsm-AMIy-H8SI-BADA-Gd2l', '20b7f880-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f880-99a8-11db-937f-000e0c431b59-Bt7S-FwCV-AB3i-HoXL-BYom-GkqU', '20b7f880-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f880-99a8-11db-937f-000e0c431b59-Bv2d-FxlP-AFrC-HFDP-B1Mm-Gfnt', '20b7f880-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f880-99a8-11db-937f-000e0c431b59-Bvkt-FHSm-AhZC-HtwR-BFwA-GWMu', '20b7f880-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f882-99a8-11db-937f-000e0c431b59-Ba2i-F9g7-AK5k-HweQ-BGrI-Gkt9', '20b7f882-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'зеленый', ''),
('20b7f882-99a8-11db-937f-000e0c431b59-BjWD-Fu38-AwDT-Hpwm-BEcH-GYsX', '20b7f882-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f882-99a8-11db-937f-000e0c431b59-BNPu-Fs6s-A8jB-HGBg-BTk3-GXVu', '20b7f882-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f882-99a8-11db-937f-000e0c431b59-BOKh-FPQi-AvkJ-Ho8f-BZSn-GN7a', '20b7f882-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '2000', 'г'),
('20b7f882-99a8-11db-937f-000e0c431b59-BpeT-FQQy-AgXf-Hp8P-BnTI-GbeN', '20b7f882-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f882-99a8-11db-937f-000e0c431b59-BUHy-Fnxk-AQ2D-HXQw-BvdC-GgM8', '20b7f882-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f882-99a8-11db-937f-000e0c431b59-BV4y-FLEH-A21L-Hf5B-BLV4-GtTZ', '20b7f882-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f884-99a8-11db-937f-000e0c431b59-BFTJ-FmWj-AFyx-Hwi4-BE2m-GtMD', '20b7f884-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f884-99a8-11db-937f-000e0c431b59-BquL-FF4X-AY9o-HBNi-BBCh-GyoS', '20b7f884-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '20000', 'г'),
('20b7f884-99a8-11db-937f-000e0c431b59-BRuH-F7rX-A8TY-HILT-BFRn-GP40', '20b7f884-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f884-99a8-11db-937f-000e0c431b59-BStp-FUah-AiEo-H7QB-BlAK-G258', '20b7f884-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f884-99a8-11db-937f-000e0c431b59-BuIQ-F4xN-AZMg-HCZd-BcOq-GuFS', '20b7f884-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f884-99a8-11db-937f-000e0c431b59-By0x-FmvW-AfzO-HIja-BL1L-GTw3', '20b7f884-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f884-99a8-11db-937f-000e0c431b59-ByNR-F2li-AoWB-Hq3N-BoHY-GLWp', '20b7f884-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'зеленый', ''),
('20b7f886-99a8-11db-937f-000e0c431b59-Bbaq-Fpmg-AiGh-Hlt8-B7DN-Gw6d', '20b7f886-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f886-99a8-11db-937f-000e0c431b59-Bc98-FGAL-AoBO-HL13-BeBC-GmaV', '20b7f886-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f886-99a8-11db-937f-000e0c431b59-BLKI-FZSr-Azei-HAxV-B3eG-GEj0', '20b7f886-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'коричневый', ''),
('20b7f886-99a8-11db-937f-000e0c431b59-Btpa-FRQJ-APNN-HdAI-B7ZR-Gi6s', '20b7f886-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f886-99a8-11db-937f-000e0c431b59-BTPz-F3Pm-ANIG-HTNq-BSpo-GQwp', '20b7f886-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f886-99a8-11db-937f-000e0c431b59-BXHc-F20c-AIf4-HzsA-BJcq-Gku7', '20b7f886-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1000', 'г'),
('20b7f886-99a8-11db-937f-000e0c431b59-BZIl-Fgbz-AMte-H20Q-Bgbr-GNHT', '20b7f886-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f888-99a8-11db-937f-000e0c431b59-B4s6-FeG3-A0LN-HnuZ-BQvu-GZp6', '20b7f888-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f888-99a8-11db-937f-000e0c431b59-BAUI-F5K2-A6UT-Hl6D-BipD-Gtmg', '20b7f888-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f888-99a8-11db-937f-000e0c431b59-BC3e-FPfO-Aow0-HYLp-BUcQ-GkCd', '20b7f888-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f888-99a8-11db-937f-000e0c431b59-BQlP-FkML-Aov1-Hred-BOYM-GJ3S', '20b7f888-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f888-99a8-11db-937f-000e0c431b59-BRrK-FQGW-A7ay-HMA1-Bpvg-G5X5', '20b7f888-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '2000', 'г'),
('20b7f888-99a8-11db-937f-000e0c431b59-Bu0K-F8cK-AGZk-HX8f-BFUn-GiMm', '20b7f888-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'коричневый', ''),
('20b7f888-99a8-11db-937f-000e0c431b59-BvqO-FlXs-AEmH-HQv0-Bix2-GCCX', '20b7f888-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f88a-99a8-11db-937f-000e0c431b59-Bbs7-FgUR-ApV3-Hffu-BbCj-GxWk', '20b7f88a-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f88a-99a8-11db-937f-000e0c431b59-BGp3-FHfQ-Af8x-Hbon-BnOR-Gq5p', '20b7f88a-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '20000', 'г'),
('20b7f88a-99a8-11db-937f-000e0c431b59-BgyW-FUAW-ALqI-Hrkf-BmO8-GI9p', '20b7f88a-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f88a-99a8-11db-937f-000e0c431b59-BJiQ-FSP2-Ax2F-HuAE-Babx-GX9I', '20b7f88a-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f88a-99a8-11db-937f-000e0c431b59-BjnD-FpYE-Atyf-HgMe-Bo1I-GIXR', '20b7f88a-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f88a-99a8-11db-937f-000e0c431b59-Bnbg-FusS-AuRF-HmUI-BAlz-GK36', '20b7f88a-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'коричневый', ''),
('20b7f88a-99a8-11db-937f-000e0c431b59-Bood-FgJ9-ARkB-H1XX-Bbh6-GrzL', '20b7f88a-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f88c-99a8-11db-937f-000e0c431b59-B3Re-FZLc-AUXg-H4at-B0ub-GB3m', '20b7f88c-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f88c-99a8-11db-937f-000e0c431b59-BkMi-FHG9-A1Ft-HSHl-B51O-GTf5', '20b7f88c-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f88c-99a8-11db-937f-000e0c431b59-BOBS-FZA2-AGpU-HGxM-BRXZ-Gzef', '20b7f88c-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f88c-99a8-11db-937f-000e0c431b59-BtnZ-Fpp5-AfXK-H0jr-Boc0-GI3L', '20b7f88c-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f88c-99a8-11db-937f-000e0c431b59-BTsC-FHKr-Avx7-HCe1-BrPd-GMgo', '20b7f88c-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f88c-99a8-11db-937f-000e0c431b59-Bvne-FQKq-Avzh-H485-BLEj-GDMF', '20b7f88c-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'красный', ''),
('20b7f88c-99a8-11db-937f-000e0c431b59-ByVl-Fhns-AIhi-HX2E-BRGF-GjfG', '20b7f88c-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1000', 'г'),
('20b7f88e-99a8-11db-937f-000e0c431b59-Bbmv-Fwsj-A007-HYzb-B5nx-GfKa', '20b7f88e-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'красный', ''),
('20b7f88e-99a8-11db-937f-000e0c431b59-BjEN-Fgvj-AD1t-HASn-BVmt-GI1D', '20b7f88e-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '2000', 'г'),
('20b7f88e-99a8-11db-937f-000e0c431b59-BNT9-Fwqz-A296-H7hb-BD0D-Gzvw', '20b7f88e-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f88e-99a8-11db-937f-000e0c431b59-BUFw-FNTC-A3Ur-HQGq-Bydd-GZEz', '20b7f88e-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f88e-99a8-11db-937f-000e0c431b59-BXwl-FlWK-A0X7-HrWg-BFK8-Gb5V', '20b7f88e-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f88e-99a8-11db-937f-000e0c431b59-ByaW-FtX4-ALb3-HOQo-BAoY-Gw0h', '20b7f88e-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f88e-99a8-11db-937f-000e0c431b59-BYuv-FVIk-AwDN-HkiY-BAwr-G9jY', '20b7f88e-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f890-99a8-11db-937f-000e0c431b59-BhFe-FZ3x-AO4v-Hi8W-BbSl-Gusn', '20b7f890-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f890-99a8-11db-937f-000e0c431b59-BhhU-FfJZ-A083-HCqZ-BZNf-G4nX', '20b7f890-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '20000', 'г'),
('20b7f890-99a8-11db-937f-000e0c431b59-BLtX-F3Ad-Ajy8-HCOC-B3xG-GFU3', '20b7f890-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'красный', ''),
('20b7f890-99a8-11db-937f-000e0c431b59-BoXt-FXYB-ABuo-Hu3f-BxDO-GL7O', '20b7f890-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f890-99a8-11db-937f-000e0c431b59-BpfC-FmiR-ApaE-HwfZ-BoJw-GXhL', '20b7f890-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f890-99a8-11db-937f-000e0c431b59-BVPS-FZCx-Azq8-HmEe-BxdD-GtgW', '20b7f890-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f890-99a8-11db-937f-000e0c431b59-BZi6-FDTy-AiH3-HwSy-BB8U-GDk3', '20b7f890-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f896-99a8-11db-937f-000e0c431b59-B2zo-Fo8F-AM6a-HwXs-BVNr-G4hk', '20b7f896-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f896-99a8-11db-937f-000e0c431b59-B6Bd-F70X-Ar9e-H5Je-Byuw-G4th', '20b7f896-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'оранжевый', ''),
('20b7f896-99a8-11db-937f-000e0c431b59-Bgqm-F7c0-AoyN-HWsv-B8TH-GPWF', '20b7f896-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f896-99a8-11db-937f-000e0c431b59-BImL-F23J-Ato0-HcFd-BIlJ-Guhm', '20b7f896-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1000', 'г'),
('20b7f896-99a8-11db-937f-000e0c431b59-BlWS-FD84-APGs-HP93-Bwzs-Gadq', '20b7f896-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f896-99a8-11db-937f-000e0c431b59-BOys-FVfA-ApIw-HHai-B9Vj-GbRj', '20b7f896-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f896-99a8-11db-937f-000e0c431b59-Bz0h-FT4r-Ayrc-HlkL-BIzA-G2Kg', '20b7f896-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f898-99a8-11db-937f-000e0c431b59-BFSf-FiJS-AYEN-H1M0-BLdf-GJtd', '20b7f898-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f898-99a8-11db-937f-000e0c431b59-BhQO-FkwB-ANS5-HJTV-BOnM-GYK5', '20b7f898-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f898-99a8-11db-937f-000e0c431b59-BNck-F4Vb-AG1D-Hgxm-Bf36-GBbF', '20b7f898-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f898-99a8-11db-937f-000e0c431b59-BQf9-FQ9D-AtGp-H32N-Bfla-G7j0', '20b7f898-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f898-99a8-11db-937f-000e0c431b59-BT1K-FhrW-Ag3z-HBCi-BfQB-GFJX', '20b7f898-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f898-99a8-11db-937f-000e0c431b59-BuMb-F8jJ-Atgd-H1wz-B66c-GHwU', '20b7f898-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'оранжевый', ''),
('20b7f898-99a8-11db-937f-000e0c431b59-Buqx-Fksz-AIOG-HKUQ-Bh2g-GvcS', '20b7f898-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '2000', 'г'),
('20b7f89a-99a8-11db-937f-000e0c431b59-Be7j-FCMB-AvVO-HKTB-BTG8-Gp0D', '20b7f89a-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f89a-99a8-11db-937f-000e0c431b59-Butp-F959-AANF-H84E-BAQO-GrLE', '20b7f89a-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f89a-99a8-11db-937f-000e0c431b59-BWJq-F61G-A7zS-HmZL-BI5H-Gs8T', '20b7f89a-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f89a-99a8-11db-937f-000e0c431b59-Bwpk-Frz5-ADDi-HPcs-BJMZ-G8wI', '20b7f89a-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'охристо-желтый', ''),
('20b7f89a-99a8-11db-937f-000e0c431b59-Bx6W-F4Gq-AKni-HqZA-B0Mq-Gk4g', '20b7f89a-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f89a-99a8-11db-937f-000e0c431b59-BxH5-FFuU-AR4P-HZlM-BtW6-GZVz', '20b7f89a-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f89a-99a8-11db-937f-000e0c431b59-BYVD-FdS7-AiSM-Hw0Y-B2xf-Gw4P', '20b7f89a-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1000', 'г'),
('20b7f89e-99a8-11db-937f-000e0c431b59-B4gU-FG83-AMnh-Hcdh-BSEG-GaxJ', '20b7f89e-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f89e-99a8-11db-937f-000e0c431b59-BGKJ-FVjv-AiSH-Hesc-BUGx-GXjG', '20b7f89e-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'светло-голубой', ''),
('20b7f89e-99a8-11db-937f-000e0c431b59-BJuF-FqNj-ANfo-HT7b-BcNa-G9cY', '20b7f89e-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f89e-99a8-11db-937f-000e0c431b59-BliI-FsC1-ALX7-H0ug-BFEn-Geli', '20b7f89e-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f89e-99a8-11db-937f-000e0c431b59-BPNb-Fll0-Aiic-HCzA-Bd9v-Gjo9', '20b7f89e-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1000', 'г'),
('20b7f89e-99a8-11db-937f-000e0c431b59-BR9g-FO8Q-AuDV-HYi8-B7cd-GQib', '20b7f89e-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f89e-99a8-11db-937f-000e0c431b59-BUHZ-Fg5Z-A6wM-HaiF-BqoQ-GzAz', '20b7f89e-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f8a0-99a8-11db-937f-000e0c431b59-BeDd-F7GT-A8kS-HsJ8-BrRz-GMEC', '20b7f8a0-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f8a0-99a8-11db-937f-000e0c431b59-Bi3a-FfV6-Ah2C-H2Fa-BIpL-Gafm', '20b7f8a0-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f8a0-99a8-11db-937f-000e0c431b59-BI3e-FwMa-AOpo-HooG-BC5T-Gef6', '20b7f8a0-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'светло-голубой', ''),
('20b7f8a0-99a8-11db-937f-000e0c431b59-BjuR-F1av-AlCu-HbIp-BXhh-G4OI', '20b7f8a0-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f8a0-99a8-11db-937f-000e0c431b59-BLHo-F6jx-Al7U-HIzi-BQYa-Gr5w', '20b7f8a0-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '2000', 'г'),
('20b7f8a0-99a8-11db-937f-000e0c431b59-BmSr-FQ8W-AW0Q-Hqev-Bl9z-GF56', '20b7f8a0-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f8a0-99a8-11db-937f-000e0c431b59-BY3g-Fqkp-AnS8-HdeB-BgHU-GNXR', '20b7f8a0-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f8a2-99a8-11db-937f-000e0c431b59-B2G4-FQYv-AMTy-HP3y-B2PY-Ga7H', '20b7f8a2-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f8a2-99a8-11db-937f-000e0c431b59-BgHj-Flq5-AnWF-H2J2-B8u6-GYea', '20b7f8a2-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '20000', 'г'),
('20b7f8a2-99a8-11db-937f-000e0c431b59-Bgx8-FUCz-AJ5F-HiVB-BqKN-GxwG', '20b7f8a2-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f8a2-99a8-11db-937f-000e0c431b59-BlEb-Fte4-A1WN-HFHy-Btnl-Gq9o', '20b7f8a2-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f8a2-99a8-11db-937f-000e0c431b59-Bnbo-FqTu-AGbZ-HS36-B5DD-Gj0m', '20b7f8a2-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'светло-голубой', ''),
('20b7f8a2-99a8-11db-937f-000e0c431b59-BWki-FrsY-AP0w-Hqqq-BcTI-GHAb', '20b7f8a2-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f8a2-99a8-11db-937f-000e0c431b59-BzMH-Fl3x-ASVH-HacH-B2TO-Gukn', '20b7f8a2-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f8a4-99a8-11db-937f-000e0c431b59-Ba0a-FmuC-Axzt-Hiki-BvMY-GYaJ', '20b7f8a4-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f8a4-99a8-11db-937f-000e0c431b59-BAbQ-Ft02-ASvE-HqJe-B19N-GGTp', '20b7f8a4-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1000', 'г'),
('20b7f8a4-99a8-11db-937f-000e0c431b59-BC7A-Fk31-AGcM-HumK-BEqv-GvzN', '20b7f8a4-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f8a4-99a8-11db-937f-000e0c431b59-BEkq-FJc1-AAZl-H6xF-BVGa-GIm1', '20b7f8a4-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f8a4-99a8-11db-937f-000e0c431b59-Blzm-FNva-ASHg-HsPI-BjSF-Gj38', '20b7f8a4-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f8a4-99a8-11db-937f-000e0c431b59-BSUw-Ffa5-AUJh-H61g-BkWo-GJ8U', '20b7f8a4-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'серый', ''),
('20b7f8a4-99a8-11db-937f-000e0c431b59-BysQ-FVbg-AdBy-Hjkr-BhBr-G8ob', '20b7f8a4-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f8a6-99a8-11db-937f-000e0c431b59-B2wo-FKnf-AH7X-Hff0-B474-GCce', '20b7f8a6-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f8a6-99a8-11db-937f-000e0c431b59-Bb5J-FflT-AAbR-HOik-B4LY-Gknu', '20b7f8a6-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f8a6-99a8-11db-937f-000e0c431b59-BhUp-F5zL-A4sH-Hxvj-BRHC-GNuu', '20b7f8a6-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f8a6-99a8-11db-937f-000e0c431b59-Bnxq-FbWR-AJ4S-H127-BS2Y-GjlX', '20b7f8a6-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'серый', ''),
('20b7f8a6-99a8-11db-937f-000e0c431b59-Br0V-FWlg-Ap0k-HvBx-BeiI-GKd9', '20b7f8a6-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f8a6-99a8-11db-937f-000e0c431b59-BVc6-Fnrd-AOlp-HmLS-BXDF-GBNt', '20b7f8a6-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f8a6-99a8-11db-937f-000e0c431b59-BVXq-FdKc-ACck-HFqV-BzXU-GKu7', '20b7f8a6-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '2000', 'г'),
('20b7f8a8-99a8-11db-937f-000e0c431b59-BIka-FR3m-AFtJ-Hmkl-B8JU-G6vo', '20b7f8a8-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f8a8-99a8-11db-937f-000e0c431b59-Bit9-FmTw-Ab1S-HqTG-BFt0-GLpH', '20b7f8a8-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f8a8-99a8-11db-937f-000e0c431b59-BQrZ-FZTA-ABQJ-HWM6-BA4I-Gg4C', '20b7f8a8-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '20000', 'г'),
('20b7f8a8-99a8-11db-937f-000e0c431b59-BrNf-FA4y-AG0i-HGLN-BNTx-Golq', '20b7f8a8-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f8a8-99a8-11db-937f-000e0c431b59-BrZ6-FRL8-AFqf-HN10-BLMX-G3pi', '20b7f8a8-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'серый', ''),
('20b7f8a8-99a8-11db-937f-000e0c431b59-BVsA-F6xq-AQnE-Hkyy-BhgO-GcyZ', '20b7f8a8-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f8a8-99a8-11db-937f-000e0c431b59-BZ4F-F6H7-A6TI-HSLy-B1hg-G2cU', '20b7f8a8-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f8aa-99a8-11db-937f-000e0c431b59-B7b7-FDfY-Azs2-HQWf-BumQ-GQZQ', '20b7f8aa-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f8aa-99a8-11db-937f-000e0c431b59-BBpa-FLBm-AGCg-HPia-BR4a-GTxh', '20b7f8aa-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f8aa-99a8-11db-937f-000e0c431b59-Bh53-FEz2-ANaG-HDbv-BNdb-Gnod', '20b7f8aa-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f8aa-99a8-11db-937f-000e0c431b59-BoXO-Fgok-ACZM-HSpm-BjBO-GHWf', '20b7f8aa-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1000', 'г'),
('20b7f8aa-99a8-11db-937f-000e0c431b59-BQug-FwAF-ANR9-Holw-BMJq-GEOg', '20b7f8aa-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f8aa-99a8-11db-937f-000e0c431b59-BVAC-F4HN-AGUh-H59I-BlPz-GBoJ', '20b7f8aa-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'синий', ''),
('20b7f8aa-99a8-11db-937f-000e0c431b59-BVmi-FUQK-AHcT-Hxhh-BUe0-GQif', '20b7f8aa-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f8ac-99a8-11db-937f-000e0c431b59-BdFA-FqXp-AS8r-HhED-BCWg-GB9x', '20b7f8ac-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f8ac-99a8-11db-937f-000e0c431b59-BFdq-FTMI-AiP5-HFkr-BdRj-GusD', '20b7f8ac-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '2000', 'г'),
('20b7f8ac-99a8-11db-937f-000e0c431b59-BFGE-F5J5-AvxO-HsbO-BDvh-GVxX', '20b7f8ac-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f8ac-99a8-11db-937f-000e0c431b59-BhIZ-FhRR-AG7y-HD12-BoT7-GoAU', '20b7f8ac-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f8ac-99a8-11db-937f-000e0c431b59-Br3R-FadL-AI3n-H9rn-BGxt-GKr3', '20b7f8ac-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f8ac-99a8-11db-937f-000e0c431b59-BSd9-FlRg-AJlA-HJ3i-Bpg7-G4Dl', '20b7f8ac-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'синий', ''),
('20b7f8ac-99a8-11db-937f-000e0c431b59-BUSR-FB1W-AE4t-Hl5r-BZbz-Gy0H', '20b7f8ac-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f8ae-99a8-11db-937f-000e0c431b59-B6Ew-FleM-ALPG-H4T5-Bpwx-GUyY', '20b7f8ae-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f8ae-99a8-11db-937f-000e0c431b59-B727-Fjzn-AM6b-H7GJ-BzLn-Gffz', '20b7f8ae-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'синий', ''),
('20b7f8ae-99a8-11db-937f-000e0c431b59-Bc4o-FClC-AIHE-HStp-Bm0g-GjMM', '20b7f8ae-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f8ae-99a8-11db-937f-000e0c431b59-BdHS-F6DY-AE3k-HrYG-BgCJ-GlkT', '20b7f8ae-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f8ae-99a8-11db-937f-000e0c431b59-BnDE-FiJo-AQn7-HzYp-B4Ug-Gz5W', '20b7f8ae-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f8ae-99a8-11db-937f-000e0c431b59-BQ18-FNqV-A3kq-HZZk-Bv4s-GDyv', '20b7f8ae-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f8ae-99a8-11db-937f-000e0c431b59-BW8g-FbQP-AG4P-Hncb-BzXg-Gm9A', '20b7f8ae-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '20000', 'г'),
('20b7f8b0-99a8-11db-937f-000e0c431b59-BcNh-FNIv-APqi-Hfmz-BOs7-GMfh', '20b7f8b0-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f8b0-99a8-11db-937f-000e0c431b59-BGG9-Fxla-Aewt-HulP-BC8R-GIUE', '20b7f8b0-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f8b0-99a8-11db-937f-000e0c431b59-BiOW-FecK-AzPq-Hfcr-BLSP-GygR', '20b7f8b0-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f8b0-99a8-11db-937f-000e0c431b59-BnAU-FXv7-Amx4-H57O-B0Zc-Ggmk', '20b7f8b0-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1000', 'г'),
('20b7f8b0-99a8-11db-937f-000e0c431b59-BOgG-Fzlw-A8t7-HNxU-Bxfq-GMBp', '20b7f8b0-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'темно-зеленый', ''),
('20b7f8b0-99a8-11db-937f-000e0c431b59-BWCG-FXwT-A3cv-H5OB-BiwQ-G6Rs', '20b7f8b0-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f8b0-99a8-11db-937f-000e0c431b59-Bzim-FOBi-AfyA-HuNf-BpbB-GvQn', '20b7f8b0-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f8b2-99a8-11db-937f-000e0c431b59-B1tp-FpYs-AU7L-HbJA-B70Y-Gy2y', '20b7f8b2-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f8b2-99a8-11db-937f-000e0c431b59-B1Y2-F2av-AgC9-HC8B-B8vw-GeMI', '20b7f8b2-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f8b2-99a8-11db-937f-000e0c431b59-B4r2-FEJB-AEGB-Hd54-BReR-GIDs', '20b7f8b2-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '2000', 'г'),
('20b7f8b2-99a8-11db-937f-000e0c431b59-Bbcq-FUXm-AjWB-HB4o-BmMg-G5D5', '20b7f8b2-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f8b2-99a8-11db-937f-000e0c431b59-BkY2-Fiay-AkYk-HW3x-Bfsg-GKX6', '20b7f8b2-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f8b2-99a8-11db-937f-000e0c431b59-BS3R-F1Y4-Aqml-HmzH-BKcH-Gfz3', '20b7f8b2-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'темно-зеленый', ''),
('20b7f8b2-99a8-11db-937f-000e0c431b59-Byug-FaWW-Ahhy-HoCo-BhdH-GNye', '20b7f8b2-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f8b4-99a8-11db-937f-000e0c431b59-B8nG-FiA9-AVfr-H3qE-Byjw-Gpo7', '20b7f8b4-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'темно-зеленый', ''),
('20b7f8b4-99a8-11db-937f-000e0c431b59-Bhmc-Fd2U-AED4-HYSL-B6eF-G6I3', '20b7f8b4-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f8b4-99a8-11db-937f-000e0c431b59-BjTQ-FynW-AMIJ-HGST-BX16-GzTx', '20b7f8b4-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f8b4-99a8-11db-937f-000e0c431b59-BKY1-FDwI-APrm-HUnv-BMNF-GdBt', '20b7f8b4-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '20000', 'г'),
('20b7f8b4-99a8-11db-937f-000e0c431b59-BM4A-Foxn-AKYO-HUGY-Bew4-GKJQ', '20b7f8b4-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f8b4-99a8-11db-937f-000e0c431b59-Bqfp-FXXW-AcL7-HP2k-BLjU-GORg', '20b7f8b4-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f8b4-99a8-11db-937f-000e0c431b59-BrtC-FsM8-Alec-H4nf-BlkJ-GrJK', '20b7f8b4-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f8b6-99a8-11db-937f-000e0c431b59-B1O2-FAUK-ATrA-HOhU-BCrs-G3ve', '20b7f8b6-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'фисташковый', ''),
('20b7f8b6-99a8-11db-937f-000e0c431b59-B9Kj-FMb1-ATXY-HnpM-BY2m-GnqU', '20b7f8b6-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f8b6-99a8-11db-937f-000e0c431b59-BBAM-FoVz-AaiD-HfCE-BO3T-GF4o', '20b7f8b6-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f8b6-99a8-11db-937f-000e0c431b59-BMZO-Fysl-AMf9-Hkf0-BUUb-GnNY', '20b7f8b6-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f8b6-99a8-11db-937f-000e0c431b59-BO3z-FMdV-AMyp-Hnb4-BCaD-Glnf', '20b7f8b6-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1000', 'г'),
('20b7f8b6-99a8-11db-937f-000e0c431b59-BQMW-FQb5-Akdm-HSWX-BxXY-G0Bu', '20b7f8b6-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f8b6-99a8-11db-937f-000e0c431b59-BzbS-F37U-A8LN-HRRH-B6hT-GSyv', '20b7f8b6-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f8b8-99a8-11db-937f-000e0c431b59-Bc73-F2ki-AE9a-HqmG-BA19-G1Db', '20b7f8b8-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'фисташковый', ''),
('20b7f8b8-99a8-11db-937f-000e0c431b59-BcGz-FIei-AV38-HxKK-BT87-GMOB', '20b7f8b8-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '2000', 'г'),
('20b7f8b8-99a8-11db-937f-000e0c431b59-BLQP-F25r-Au7I-Hxiv-BTAs-GM3S', '20b7f8b8-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f8b8-99a8-11db-937f-000e0c431b59-BqP6-FyDd-AjXe-HRjW-BkTS-G2e6', '20b7f8b8-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f8b8-99a8-11db-937f-000e0c431b59-Bu7R-FKm4-ARnu-HQdy-BsoE-G9f0', '20b7f8b8-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f8b8-99a8-11db-937f-000e0c431b59-Buvi-FfCB-ATuq-HYsM-BXYc-GSNg', '20b7f8b8-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f8b8-99a8-11db-937f-000e0c431b59-Bww4-FQEc-Anow-H7gQ-B2RC-GawF', '20b7f8b8-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f8bc-99a8-11db-937f-000e0c431b59-BGg9-FNFv-AxXt-HiEV-BPO1-Gtal', '20b7f8bc-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f8bc-99a8-11db-937f-000e0c431b59-BKfd-FMu6-A61m-Hqod-BRVq-GA5K', '20b7f8bc-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f8bc-99a8-11db-937f-000e0c431b59-BLLY-Fn7d-A4wB-HPcs-BFqv-Gy2k', '20b7f8bc-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f8bc-99a8-11db-937f-000e0c431b59-BOCs-FLz4-AVJ1-HSVE-BTB6-G0ct', '20b7f8bc-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f8bc-99a8-11db-937f-000e0c431b59-Bp2p-FbxL-Aspc-HvFP-B1hV-Gpq1', '20b7f8bc-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'черный', ''),
('20b7f8bc-99a8-11db-937f-000e0c431b59-BpWb-FRCG-AuTb-HaUW-Bla3-Gjo9', '20b7f8bc-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '900', 'г'),
('20b7f8bc-99a8-11db-937f-000e0c431b59-BrMt-FieF-AmxH-Hiwj-BS8u-Gqlr', '20b7f8bc-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f8be-99a8-11db-937f-000e0c431b59-B3I5-FgZ4-AmSi-HEmd-BiDJ-GW6Q', '20b7f8be-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f8be-99a8-11db-937f-000e0c431b59-Baqx-F3GI-AOsi-HHRN-BFnp-Gcsp', '20b7f8be-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f8be-99a8-11db-937f-000e0c431b59-BCe3-FKFs-AN7C-Hava-B52D-Gv2n', '20b7f8be-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1900', 'г'),
('20b7f8be-99a8-11db-937f-000e0c431b59-BeJ9-FDRQ-AQX4-H6zl-Bkru-GfOJ', '20b7f8be-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f8be-99a8-11db-937f-000e0c431b59-BGn2-F0jq-AlKX-HWpm-BfFd-G8DY', '20b7f8be-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f8be-99a8-11db-937f-000e0c431b59-BVbW-FEAa-AaPo-HR0F-B3ob-GU6e', '20b7f8be-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'черный', ''),
('20b7f8be-99a8-11db-937f-000e0c431b59-BZ1c-F86E-AbdH-Hk1D-B2UM-GzXe', '20b7f8be-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f8c0-99a8-11db-937f-000e0c431b59-B4TX-FpvM-AT1d-Hatl-BXFL-GpBr', '20b7f8c0-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f8c0-99a8-11db-937f-000e0c431b59-B6lJ-FffL-ABtH-H2Vs-BdJm-G6c8', '20b7f8c0-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '20000', 'г'),
('20b7f8c0-99a8-11db-937f-000e0c431b59-B6sI-F8I5-AXDw-Hbyn-BFRH-G3H7', '20b7f8c0-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f8c0-99a8-11db-937f-000e0c431b59-Bcdx-F1zd-AcVj-H6Tm-BUVG-GMfL', '20b7f8c0-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'черный', ''),
('20b7f8c0-99a8-11db-937f-000e0c431b59-BRii-FONl-ArDj-H4Cg-BO61-Glkl', '20b7f8c0-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f8c0-99a8-11db-937f-000e0c431b59-BWkS-F6gl-Ah18-HoDd-B19L-G97U', '20b7f8c0-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f8c0-99a8-11db-937f-000e0c431b59-By5c-FSUL-A4sR-HEYS-Bwp2-GU5F', '20b7f8c0-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f8c2-99a8-11db-937f-000e0c431b59-B00d-FG2y-AzU9-HbQa-BZXw-GFwM', '20b7f8c2-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f8c2-99a8-11db-937f-000e0c431b59-BE5a-FP4x-AODU-Hqmt-BMGn-Ga9T', '20b7f8c2-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f8c2-99a8-11db-937f-000e0c431b59-Be5N-F2pt-AMKN-HhJz-Bt7P-GQsI', '20b7f8c2-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f8c2-99a8-11db-937f-000e0c431b59-BHVp-FYaD-ArMt-Hjgn-BocO-Gx8u', '20b7f8c2-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'шоколадно-коричневый', ''),
('20b7f8c2-99a8-11db-937f-000e0c431b59-BJeY-F3D6-AfrX-HufV-BfeU-G9lM', '20b7f8c2-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f8c2-99a8-11db-937f-000e0c431b59-BJKe-FXsn-AMbj-HcsR-BkwM-GBCF', '20b7f8c2-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1000', 'г'),
('20b7f8c2-99a8-11db-937f-000e0c431b59-Bxah-Fv3x-AMSL-H9X9-BKgc-GjYf', '20b7f8c2-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f8c4-99a8-11db-937f-000e0c431b59-B8RL-Fht4-AzUq-HBVs-BHK9-GQU6', '20b7f8c4-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f8c4-99a8-11db-937f-000e0c431b59-BCME-F6tn-AwjW-Hy4b-Bi2t-GuYd', '20b7f8c4-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f8c4-99a8-11db-937f-000e0c431b59-BnOy-FTQK-ACXV-HAop-B7q3-GAml', '20b7f8c4-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f8c4-99a8-11db-937f-000e0c431b59-BogN-F0g2-Apch-HhdJ-BJHi-GUIv', '20b7f8c4-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f8c4-99a8-11db-937f-000e0c431b59-BoYL-FANF-Acw7-HMgV-BqKj-Gedz', '20b7f8c4-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f8c4-99a8-11db-937f-000e0c431b59-BZki-FWxE-ArdO-HR8s-BHmO-GUmv', '20b7f8c4-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1000', 'г'),
('20b7f8c4-99a8-11db-937f-000e0c431b59-BzQJ-FJ7v-A3J3-Hgj2-B1sB-GUFu', '20b7f8c4-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'ярко-зеленый', ''),
('20b7f8c6-99a8-11db-937f-000e0c431b59-B3V1-F8yK-ApRb-Hw8D-BSUC-G9Gq', '20b7f8c6-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '2000', 'г'),
('20b7f8c6-99a8-11db-937f-000e0c431b59-B7YM-FVZr-AWKY-HoKy-Bv1G-G2W1', '20b7f8c6-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f8c6-99a8-11db-937f-000e0c431b59-BLRN-Ftyr-A39y-HbS7-BNsh-GvEV', '20b7f8c6-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'ярко-зеленый', ''),
('20b7f8c6-99a8-11db-937f-000e0c431b59-BOyy-FUyh-AfKF-HcUr-BdQG-Gpmf', '20b7f8c6-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f8c6-99a8-11db-937f-000e0c431b59-BqSF-FfuX-Ac8G-HAsK-BVi8-GKmB', '20b7f8c6-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f8c6-99a8-11db-937f-000e0c431b59-BX9q-Fvn1-AjZr-HqQD-Bhf3-GV1q', '20b7f8c6-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f8c6-99a8-11db-937f-000e0c431b59-Bzwy-FDDw-AwLY-HAfB-BvqS-G0ZH', '20b7f8c6-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f8c8-99a8-11db-937f-000e0c431b59-B4uf-FwNu-AfX2-HkX6-Bdiq-GoLN', '20b7f8c8-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f8c8-99a8-11db-937f-000e0c431b59-BAu0-F2UW-Axy6-HecH-BrQA-Gthm', '20b7f8c8-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f8c8-99a8-11db-937f-000e0c431b59-BBLz-F8pS-AFXi-HFGF-Bsqe-GXsA', '20b7f8c8-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '20000', 'г'),
('20b7f8c8-99a8-11db-937f-000e0c431b59-BjYp-FCfO-ApQr-HDg7-Bpgr-GoYB', '20b7f8c8-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f8c8-99a8-11db-937f-000e0c431b59-BLuL-FmgI-Aqyd-Htxk-BanQ-GgKm', '20b7f8c8-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f8c8-99a8-11db-937f-000e0c431b59-Bx3C-FRmz-A2Cd-HHjn-BucY-GPPl', '20b7f8c8-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f8c8-99a8-11db-937f-000e0c431b59-BzqG-FhWX-Ak43-HcOt-BJGE-GAE4', '20b7f8c8-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'ярко-зеленый', ''),
('20b7f8d0-99a8-11db-937f-000e0c431b59-B1K1-Fp7G-AgKn-HDE8-ByqK-GOFB', '20b7f8d0-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f8d0-99a8-11db-937f-000e0c431b59-BFcq-FaNq-AqQz-HvQ1-BOhg-G4Tv', '20b7f8d0-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'желто-коричневый', ''),
('20b7f8d0-99a8-11db-937f-000e0c431b59-Bfgw-FJj1-AHYh-HRmn-BT5A-GQp2', '20b7f8d0-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f8d0-99a8-11db-937f-000e0c431b59-BmMZ-FY2D-AS6d-Hd03-BcEV-GJej', '20b7f8d0-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f8d0-99a8-11db-937f-000e0c431b59-BMTK-FOSo-At29-HaQ9-BDwe-G16E', '20b7f8d0-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f8d0-99a8-11db-937f-000e0c431b59-BrCc-FOUF-A3nA-H34q-BtG0-G5US', '20b7f8d0-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1000', 'г'),
('20b7f8d0-99a8-11db-937f-000e0c431b59-BRX8-Fv17-AnTB-H0df-BiTq-GZ0m', '20b7f8d0-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f8d2-99a8-11db-937f-000e0c431b59-BhXg-FsoO-ANOf-Hy0S-B4Ll-Ggk3', '20b7f8d2-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f8d2-99a8-11db-937f-000e0c431b59-BiEK-Fgeb-AeiN-H0YJ-BDFM-GgUg', '20b7f8d2-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'желто-коричневый', ''),
('20b7f8d2-99a8-11db-937f-000e0c431b59-BiJN-Fp6E-AGNh-Htqm-BbN0-G86o', '20b7f8d2-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f8d2-99a8-11db-937f-000e0c431b59-BLJ4-Fr93-AA2D-HlYo-Be8y-Grmt', '20b7f8d2-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f8d2-99a8-11db-937f-000e0c431b59-BlMK-FmEE-ASyL-HRsf-BkQk-GuxF', '20b7f8d2-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f8d2-99a8-11db-937f-000e0c431b59-BLSn-FZRB-AjUG-Hv2a-BScn-GcEr', '20b7f8d2-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f8d2-99a8-11db-937f-000e0c431b59-Bws8-FTco-A742-H62x-BjD8-Gdu6', '20b7f8d2-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '2000', 'г'),
('20b7f8d4-99a8-11db-937f-000e0c431b59-Bf19-FBFb-AOao-H08U-BJRA-GeS8', '20b7f8d4-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '20000', 'г'),
('20b7f8d4-99a8-11db-937f-000e0c431b59-BMk2-FEgs-A3Gv-H1jf-Bv5Q-GjUm', '20b7f8d4-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f8d4-99a8-11db-937f-000e0c431b59-BsiM-FeYw-A0Kr-HQuB-B3gZ-GUbo', '20b7f8d4-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f8d4-99a8-11db-937f-000e0c431b59-BTqU-FA7F-ACzl-HbKC-BFfK-GlLe', '20b7f8d4-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f8d4-99a8-11db-937f-000e0c431b59-BVIf-FpU5-Aodg-HOdM-BUMv-GhqK', '20b7f8d4-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f8d4-99a8-11db-937f-000e0c431b59-BVux-FZVM-AD1J-H2hv-BlUe-Gio8', '20b7f8d4-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'желто-коричневый', ''),
('20b7f8d4-99a8-11db-937f-000e0c431b59-BvXc-F6PA-Ar1U-HLZ0-BJlj-GAqG', '20b7f8d4-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f8d6-99a8-11db-937f-000e0c431b59-B56y-Fykz-AszJ-HzFa-BJSB-Gzu5', '20b7f8d6-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f8d6-99a8-11db-937f-000e0c431b59-BB1e-FfO7-AJI5-HoA4-BPUG-GPRT', '20b7f8d6-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f8d6-99a8-11db-937f-000e0c431b59-BjUx-FLv8-AN2d-HYco-B48f-G20k', '20b7f8d6-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'золотисто-коричневый', ''),
('20b7f8d6-99a8-11db-937f-000e0c431b59-BNkq-Fc4h-A0K9-H2Ol-BdQb-G9vq', '20b7f8d6-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f8d6-99a8-11db-937f-000e0c431b59-Bsfs-F2Ux-ASdF-HTT1-BOrk-GUDM', '20b7f8d6-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1000', 'г'),
('20b7f8d6-99a8-11db-937f-000e0c431b59-BTNA-F8M8-ASWP-HT2h-BRb2-GEmm', '20b7f8d6-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f8d6-99a8-11db-937f-000e0c431b59-BXuF-FWlU-A8Fl-HYDX-BE8S-G4w4', '20b7f8d6-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f8d8-99a8-11db-937f-000e0c431b59-BFsO-FTsK-A5mY-HVnQ-BT9a-GQfr', '20b7f8d8-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '20000', 'г'),
('20b7f8d8-99a8-11db-937f-000e0c431b59-BJzC-FzYR-AeMU-HqOo-Bbzy-GsCC', '20b7f8d8-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f8d8-99a8-11db-937f-000e0c431b59-BlKQ-FMNF-AwG9-HaQy-Bvpa-GVl7', '20b7f8d8-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'золотисто-коричневый', ''),
('20b7f8d8-99a8-11db-937f-000e0c431b59-BS1G-FngU-AS9K-HGrN-BJfC-GSSS', '20b7f8d8-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f8d8-99a8-11db-937f-000e0c431b59-Bs5T-Fx7r-Ad5O-H06k-B5Ob-GA29', '20b7f8d8-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f8d8-99a8-11db-937f-000e0c431b59-BVJ7-FgQo-AtaK-Hvsd-BEbX-GYOT', '20b7f8d8-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f8d8-99a8-11db-937f-000e0c431b59-ByzJ-FxQZ-AlBE-HCXq-B9gg-GBW5', '20b7f8d8-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f8da-99a8-11db-937f-000e0c431b59-BEDQ-F7qO-AwPh-H4MS-Bl3U-GH9P', '20b7f8da-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f8da-99a8-11db-937f-000e0c431b59-BoAR-FPZU-AmeS-H6XF-ByGk-Gh95', '20b7f8da-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'золотисто-коричневый', ''),
('20b7f8da-99a8-11db-937f-000e0c431b59-BpCg-FF5q-Ai0d-HCVh-B6BN-GT0z', '20b7f8da-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f8da-99a8-11db-937f-000e0c431b59-BqqX-F9lv-ADa2-Hn91-BiTG-G8ur', '20b7f8da-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f8da-99a8-11db-937f-000e0c431b59-BVQY-Fbks-ARzZ-H3Jd-BExd-GVD4', '20b7f8da-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f8da-99a8-11db-937f-000e0c431b59-ByhO-FRjj-Azfk-HDyk-B44n-GJzU', '20b7f8da-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f8da-99a8-11db-937f-000e0c431b59-BYmk-F7fx-AOGq-HiOo-BxCL-GCUv', '20b7f8da-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '2000', 'г'),
('20b7f8dc-99a8-11db-937f-000e0c431b59-B5OI-FFA2-AiES-H6ch-BPiQ-Gd29', '20b7f8dc-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'красно-коричневый', ''),
('20b7f8dc-99a8-11db-937f-000e0c431b59-BaPC-FtLe-AQaC-Hh45-Bfgq-GFjx', '20b7f8dc-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f8dc-99a8-11db-937f-000e0c431b59-Bi17-FHJJ-APRq-HPot-B28B-Ghzf', '20b7f8dc-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1000', 'г'),
('20b7f8dc-99a8-11db-937f-000e0c431b59-Bnvk-FCHN-ASbM-Htrs-Bbm7-Gjr8', '20b7f8dc-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f8dc-99a8-11db-937f-000e0c431b59-BpEI-FslC-AnGj-HTMI-BHgA-GWDm', '20b7f8dc-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f8dc-99a8-11db-937f-000e0c431b59-BT3O-Fgl7-AODj-HLnQ-BJEg-GLxs', '20b7f8dc-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f8dc-99a8-11db-937f-000e0c431b59-BTSp-F3dS-AImW-HpyK-BXdO-GgM1', '20b7f8dc-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f8de-99a8-11db-937f-000e0c431b59-B347-FcmN-Awao-Hy2u-BgD1-GY9S', '20b7f8de-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '2000', 'г'),
('20b7f8de-99a8-11db-937f-000e0c431b59-B36G-Fg0E-AYqj-HtRT-BxaB-GbFr', '20b7f8de-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f8de-99a8-11db-937f-000e0c431b59-Bhc5-FOsi-A8kf-H0HV-Be8U-GmJ9', '20b7f8de-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f8de-99a8-11db-937f-000e0c431b59-BigA-F9Hi-Aljo-HE83-BqfU-GktD', '20b7f8de-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f8de-99a8-11db-937f-000e0c431b59-BJrn-Fpqv-AAKs-HVx3-BTVY-GTUg', '20b7f8de-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f8de-99a8-11db-937f-000e0c431b59-BMG3-F5bq-AwvB-HLFV-Bs8R-GyeQ', '20b7f8de-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f8de-99a8-11db-937f-000e0c431b59-Bz9I-FMo7-AWBa-Hlhm-BbGc-GYNm', '20b7f8de-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'красно-коричневый', ''),
('211dadff-f788-11e3-8c8a-005056be1f7b-B5Nj-F9rf-A38s-HeFV-Bwos-GFYU', '211dadff-f788-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('211dadff-f788-11e3-8c8a-005056be1f7b-BcJL-FjU8-A57x-HHuw-BHp0-Gqnq', '211dadff-f788-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('211dadff-f788-11e3-8c8a-005056be1f7b-BeyN-FR78-ADDn-HDuR-Bt7x-GY3z', '211dadff-f788-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('211dadff-f788-11e3-8c8a-005056be1f7b-BiWS-FtmX-Av1G-HKwV-BmzN-Gx00', '211dadff-f788-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'охра', ''),
('211dadff-f788-11e3-8c8a-005056be1f7b-BJJn-FhJg-AUd3-HR0w-Bidl-Gwui', '211dadff-f788-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('211dadff-f788-11e3-8c8a-005056be1f7b-BMgo-F6Bu-ARyY-H04w-BUV7-Gg5R', '211dadff-f788-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('211dadff-f788-11e3-8c8a-005056be1f7b-Buym-FX2W-AolT-Hc0L-BRJU-G5rd', '211dadff-f788-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '800', 'г'),
('2133814d-f78e-11e3-8c8a-005056be1f7b-B6Yk-FuDu-A7pT-Hd8j-B0iK-GToQ', '2133814d-f78e-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1900', 'г'),
('2133814d-f78e-11e3-8c8a-005056be1f7b-Ba5g-Fb4n-AfHt-HPBc-BTyn-GDY8', '2133814d-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('2133814d-f78e-11e3-8c8a-005056be1f7b-Bjih-FUAD-AWWB-H9GE-BOFt-G5tE', '2133814d-f78e-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'голубой', ''),
('2133814d-f78e-11e3-8c8a-005056be1f7b-BklU-FGGe-AJvF-HH9H-B9yp-G7Xc', '2133814d-f78e-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('2133814d-f78e-11e3-8c8a-005056be1f7b-BwKt-FkUU-A6rU-Honm-ByNK-GWhK', '2133814d-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('2133814d-f78e-11e3-8c8a-005056be1f7b-BXUp-Fs0S-AUyf-HfKD-Bpk8-GMC1', '2133814d-f78e-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('2133814d-f78e-11e3-8c8a-005056be1f7b-Bzh8-Fix0-ABHy-HoKM-Bmig-GRQf', '2133814d-f78e-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('23b6c6e7-f789-11e3-8c8a-005056be1f7b-B5LM-Fg9C-AL9L-H0xX-BTVV-GHJ0', '23b6c6e7-f789-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('23b6c6e7-f789-11e3-8c8a-005056be1f7b-B7oR-FQwQ-AWMs-HCvL-B2Nu-GPDM', '23b6c6e7-f789-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('23b6c6e7-f789-11e3-8c8a-005056be1f7b-BA8N-F7ZV-AKSm-HFyu-Bst6-G6P4', '23b6c6e7-f789-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1900', 'г'),
('23b6c6e7-f789-11e3-8c8a-005056be1f7b-BbjX-F1cE-AFms-HX3t-B7i3-Gnt7', '23b6c6e7-f789-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('23b6c6e7-f789-11e3-8c8a-005056be1f7b-Bh9x-Fxn4-AyO6-HcHO-B4Q5-GgIm', '23b6c6e7-f789-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('23b6c6e7-f789-11e3-8c8a-005056be1f7b-BJpm-F2sY-ACjl-Hxzp-BAJy-GzLU', '23b6c6e7-f789-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('23b6c6e7-f789-11e3-8c8a-005056be1f7b-BUIz-FCfr-AwcQ-HoGA-BlCo-G3Sa', '23b6c6e7-f789-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('2461ad51-9fb8-11e3-8705-005056be1f7b-B5O2-FZ4A-AzjD-HJ5l-B9D2-GMvT', '2461ad51-9fb8-11e3-8705-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый матовый', ''),
('2461ad51-9fb8-11e3-8705-005056be1f7b-B6wn-FGQn-AG02-HtfY-BJux-GUv9', '2461ad51-9fb8-11e3-8705-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('2461ad51-9fb8-11e3-8705-005056be1f7b-BdVM-FKZX-A8Q7-HZZj-BQUW-G4bn', '2461ad51-9fb8-11e3-8705-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('2461ad51-9fb8-11e3-8705-005056be1f7b-Bghm-FYQH-AwZ3-Hkto-BiN0-GvXZ', '2461ad51-9fb8-11e3-8705-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '2500', 'г'),
('2461ad51-9fb8-11e3-8705-005056be1f7b-BIPO-FrcX-AKj6-HYhD-BKOJ-G0am', '2461ad51-9fb8-11e3-8705-005056be1f7b', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('2461ad51-9fb8-11e3-8705-005056be1f7b-Bk64-FgTb-Akep-HueG-BWYU-GNyO', '2461ad51-9fb8-11e3-8705-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('2461ad51-9fb8-11e3-8705-005056be1f7b-BOnx-FRws-A4vw-Hu8i-BDid-G8Fx', '2461ad51-9fb8-11e3-8705-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('2461ad51-9fb8-11e3-8705-005056be1f7b-BPZL-FBKI-AjOr-HDLw-B1jb-GJn2', '2461ad51-9fb8-11e3-8705-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('2461ad51-9fb8-11e3-8705-005056be1f7b-BYpS-FDZw-AJwL-He00-BsOn-GggZ', '2461ad51-9fb8-11e3-8705-005056be1f7b', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсальное', ''),
('25a027ef-9e45-11e1-9d3e-005056be3bd8-B7MD-F1nx-AJc4-H9uJ-B6h8-G0gl', '25a027ef-9e45-11e1-9d3e-005056be3bd8', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1000', 'г'),
('25a027ef-9e45-11e1-9d3e-005056be3bd8-Bd0k-F0aM-ANeW-H05B-B5sq-GxZX', '25a027ef-9e45-11e1-9d3e-005056be3bd8', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('25a027ef-9e45-11e1-9d3e-005056be3bd8-Br2Q-FcaN-Ay3g-HamO-BEKv-GZp6', '25a027ef-9e45-11e1-9d3e-005056be3bd8', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'кремовый', ''),
('25a027ef-9e45-11e1-9d3e-005056be3bd8-BVCR-FsBL-Au74-HbtT-ByGz-GSP7', '25a027ef-9e45-11e1-9d3e-005056be3bd8', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('25a027ef-9e45-11e1-9d3e-005056be3bd8-BWgd-FJHe-AiGM-H1WW-BizW-GJyw', '25a027ef-9e45-11e1-9d3e-005056be3bd8', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('25a027ef-9e45-11e1-9d3e-005056be3bd8-BwyD-F0oZ-AWNP-HsWD-BesG-GvbH', '25a027ef-9e45-11e1-9d3e-005056be3bd8', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('25a027ef-9e45-11e1-9d3e-005056be3bd8-Byo3-Frri-AGGw-HlAZ-B9rR-GPKs', '25a027ef-9e45-11e1-9d3e-005056be3bd8', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('25a027f1-9e45-11e1-9d3e-005056be3bd8-BadD-FVR5-ArMs-HQMX-Bc0L-GGq8', '25a027f1-9e45-11e1-9d3e-005056be3bd8', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('25a027f1-9e45-11e1-9d3e-005056be3bd8-BeHp-F0Ym-APmB-H95v-B9GM-GLA5', '25a027f1-9e45-11e1-9d3e-005056be3bd8', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('25a027f1-9e45-11e1-9d3e-005056be3bd8-Bfgq-FbUY-A5te-HQ8P-BOYs-GRtA', '25a027f1-9e45-11e1-9d3e-005056be3bd8', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('25a027f1-9e45-11e1-9d3e-005056be3bd8-BkSE-F0uV-AELH-HqRU-Bmwc-GSv1', '25a027f1-9e45-11e1-9d3e-005056be3bd8', '1d08380b-ce34-11e4-a80e-005056be1f7a', '2000', 'г'),
('25a027f1-9e45-11e1-9d3e-005056be3bd8-BLbM-F5rZ-ARKY-HcQF-Bavl-GGN7', '25a027f1-9e45-11e1-9d3e-005056be3bd8', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('25a027f1-9e45-11e1-9d3e-005056be3bd8-Bxyo-FrwY-A1s7-Hxrd-BZGW-GOv8', '25a027f1-9e45-11e1-9d3e-005056be3bd8', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('25a027f1-9e45-11e1-9d3e-005056be3bd8-BZ3z-FolM-AsF5-Hy2W-B6yi-G0oM', '25a027f1-9e45-11e1-9d3e-005056be3bd8', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'кремовый', ''),
('277ee1ed-f788-11e3-8c8a-005056be1f7b-B3Rx-F0SM-AAJt-H7jv-BAMw-GXOY', '277ee1ed-f788-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('277ee1ed-f788-11e3-8c8a-005056be1f7b-BCBr-FTrW-AfhH-HAZA-B2g6-GZCE', '277ee1ed-f788-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('277ee1ed-f788-11e3-8c8a-005056be1f7b-BH6h-FfJN-A9SY-HkEX-BoIe-GJ85', '277ee1ed-f788-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'серый', ''),
('277ee1ed-f788-11e3-8c8a-005056be1f7b-BnBX-FBlb-AZQj-H4ah-Byci-GfwQ', '277ee1ed-f788-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('277ee1ed-f788-11e3-8c8a-005056be1f7b-BNPo-Fvuf-AFgP-HrG9-Bl3r-GpXX', '277ee1ed-f788-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '800', 'г'),
('277ee1ed-f788-11e3-8c8a-005056be1f7b-BvtE-Ffpn-AQq1-HDEF-Bc4t-GHSS', '277ee1ed-f788-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('277ee1ed-f788-11e3-8c8a-005056be1f7b-Bzop-FZiF-A7Wh-Hf2U-Bvtl-Gjt5', '277ee1ed-f788-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('28110f45-99a8-11db-937f-000e0c431b59-B2dm-FoHc-AQlN-HarZ-BTO6-GEFh', '28110f45-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'РОГНЕДА', ''),
('28110f45-99a8-11db-937f-000e0c431b59-BaKJ-FrZb-Aldw-Hn1l-BevJ-GGL4', '28110f45-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('28110f45-99a8-11db-937f-000e0c431b59-Bhgv-F1lq-Abu9-Hguj-BQLt-Ga3J', '28110f45-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('28110f45-99a8-11db-937f-000e0c431b59-BRgT-Ff7B-A6QP-H1VV-BYG2-Gr25', '28110f45-99a8-11db-937f-000e0c431b59', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '5', 'л'),
('28110f45-99a8-11db-937f-000e0c431b59-BuKO-F9N9-AEZk-HpO1-BXgX-GqBU', '28110f45-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'антисептический состав', ''),
('28110f45-99a8-11db-937f-000e0c431b59-BvgS-FuDC-ATTO-HCuG-BMmk-GyQr', '28110f45-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('28110f47-99a8-11db-937f-000e0c431b59-B5il-Fatb-AU2T-HF6k-BIRF-G0ku', '28110f47-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'антисептический состав', ''),
('28110f47-99a8-11db-937f-000e0c431b59-BCIT-Feyi-Asvf-HLz5-BI3v-GDRD', '28110f47-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('28110f47-99a8-11db-937f-000e0c431b59-BD16-FZRS-ANx7-HKkQ-Buzq-G3nx', '28110f47-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'РОГНЕДА', ''),
('28110f47-99a8-11db-937f-000e0c431b59-BOZH-FyHK-Aefb-HqOO-B78c-GDY7', '28110f47-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('28110f47-99a8-11db-937f-000e0c431b59-BsOG-Fbd0-Ac9W-HbWx-Bfo7-GwTk', '28110f47-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('28110f47-99a8-11db-937f-000e0c431b59-BWe1-FTob-AjZQ-HPR5-BDUC-GWz1', '28110f47-99a8-11db-937f-000e0c431b59', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '10', 'л'),
('28110f49-99a8-11db-937f-000e0c431b59-Ba8J-F02E-A64M-H1Jf-B2sM-GLO0', '28110f49-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'биоцидный состав', ''),
('28110f49-99a8-11db-937f-000e0c431b59-BAoz-F0Ce-AorO-H4e0-BKN8-GCWH', '28110f49-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('28110f49-99a8-11db-937f-000e0c431b59-BirU-Fgwd-A9Jm-HFWv-BOEj-GFAQ', '28110f49-99a8-11db-937f-000e0c431b59', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '5', 'л'),
('28110f49-99a8-11db-937f-000e0c431b59-BN0O-FKFS-AYT8-HFIc-BXJG-GMJJ', '28110f49-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'РОГНЕДА', ''),
('28110f49-99a8-11db-937f-000e0c431b59-Bry1-F7rV-A73i-H566-BBI6-GQTA', '28110f49-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('28110f49-99a8-11db-937f-000e0c431b59-Bt83-FJJK-AmG8-HFEN-BOor-GzfS', '28110f49-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('28110f4b-99a8-11db-937f-000e0c431b59-BG9S-FTyb-AyqK-HB2Y-BAgm-GJx5', '28110f4b-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('28110f4b-99a8-11db-937f-000e0c431b59-Bino-Ftog-AHpD-Hty1-Boer-GGuK', '28110f4b-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('28110f4b-99a8-11db-937f-000e0c431b59-BLkg-FT06-Afxb-Ho5Q-Bmd4-GRMi', '28110f4b-99a8-11db-937f-000e0c431b59', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '10', 'л'),
('28110f4b-99a8-11db-937f-000e0c431b59-BoNJ-FRSf-AChk-Hmmk-B4Di-GCCZ', '28110f4b-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('28110f4b-99a8-11db-937f-000e0c431b59-Bp1c-FPdE-A1WI-HYYL-ByfJ-GGy9', '28110f4b-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'РОГНЕДА', ''),
('28110f4b-99a8-11db-937f-000e0c431b59-BxUN-F1EC-Artg-HY1R-BjB2-GGV2', '28110f4b-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'биоцидный состав', ''),
('28110f4f-99a8-11db-937f-000e0c431b59-Ba7Z-FqCP-ASAH-Hvod-Bu2j-G1HS', '28110f4f-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('28110f4f-99a8-11db-937f-000e0c431b59-BauY-F8JO-AOtQ-HGzm-B83d-GnV9', '28110f4f-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('28110f4f-99a8-11db-937f-000e0c431b59-BC1p-Fdfj-AtHD-HnZQ-BLMk-GYDp', '28110f4f-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('28110f4f-99a8-11db-937f-000e0c431b59-BNFG-FQsf-Ah5s-HHSv-Bxtg-GLrq', '28110f4f-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'РОГНЕДА', ''),
('28110f4f-99a8-11db-937f-000e0c431b59-BtL7-F27k-AUrb-H5hj-BM4O-GY9B', '28110f4f-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '6000', 'г'),
('28110f4f-99a8-11db-937f-000e0c431b59-BWoM-FEwf-A1jO-HXv7-BDL3-Gd36', '28110f4f-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'огнебиозащитный состав', ''),
('28110f51-99a8-11db-937f-000e0c431b59-B4yl-FILX-AEPi-H8tb-B3cm-GzTj', '28110f51-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('28110f51-99a8-11db-937f-000e0c431b59-B8nZ-FpTi-AVBk-H1Vv-BhDA-GdTM', '28110f51-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('28110f51-99a8-11db-937f-000e0c431b59-BbSp-FCJA-AxqE-HyJX-BBSX-GSir', '28110f51-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '11000', 'г'),
('28110f51-99a8-11db-937f-000e0c431b59-BIAR-FQTL-AsMf-HyVq-BdST-G38n', '28110f51-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'огнебиозащитный состав', ''),
('28110f51-99a8-11db-937f-000e0c431b59-BrP7-FQMp-ArEH-HT4b-B3TG-GILo', '28110f51-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'РОГНЕДА', ''),
('28110f51-99a8-11db-937f-000e0c431b59-BZoQ-F2iy-Abur-HqJq-BsCe-GTKq', '28110f51-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('28110f53-99a8-11db-937f-000e0c431b59-Be6v-FS1M-AnEI-HPo1-BvTc-GgFP', '28110f53-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('28110f53-99a8-11db-937f-000e0c431b59-BFlv-FTgB-AS8v-HNKy-B9jd-GxHZ', '28110f53-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('28110f53-99a8-11db-937f-000e0c431b59-BkWH-FVkR-AJi2-HnW9-BDnf-GIs3', '28110f53-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '5000', 'г'),
('28110f53-99a8-11db-937f-000e0c431b59-BRgF-FFXS-A9d5-HnpA-Bxum-GiEJ', '28110f53-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'огнебиозащитный состав', ''),
('28110f53-99a8-11db-937f-000e0c431b59-BZpz-Fh6d-AYqx-H2M4-BGlp-GMGJ', '28110f53-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'РОГНЕДА', ''),
('28110f53-99a8-11db-937f-000e0c431b59-BZwG-Fed3-AfmO-H6P0-Bau5-GMCv', '28110f53-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('28110f55-99a8-11db-937f-000e0c431b59-B2cb-FMUD-AQFG-HBMg-BHVS-GTQD', '28110f55-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('28110f55-99a8-11db-937f-000e0c431b59-BbqV-FWUB-AWHw-H0q1-BIQN-GPmx', '28110f55-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('28110f55-99a8-11db-937f-000e0c431b59-BhwW-FYZs-AXcV-H3lE-BuDu-GGZF', '28110f55-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('28110f55-99a8-11db-937f-000e0c431b59-BIwM-F5v4-Av4K-H0Jw-Bxqi-GJF9', '28110f55-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'РОГНЕДА', ''),
('28110f55-99a8-11db-937f-000e0c431b59-BNB8-FXBH-AKyx-Ht83-BryV-GJAq', '28110f55-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'огнебиозащитный состав', ''),
('28110f55-99a8-11db-937f-000e0c431b59-BNRw-FUT9-A1aU-HIuk-BM8m-GKVn', '28110f55-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '10000', 'г'),
('28110f57-99a8-11db-937f-000e0c431b59-BcUo-FvJ7-AaD7-HY94-B9B9-GKhs', '28110f57-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'огнебиозащитный состав', ''),
('28110f57-99a8-11db-937f-000e0c431b59-BDFL-Ffti-AlNo-HL7y-BYom-GaUq', '28110f57-99a8-11db-937f-000e0c431b59', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '200', 'л'),
('28110f57-99a8-11db-937f-000e0c431b59-BRfb-FEPY-A88M-HSGN-B0Tf-Gvny', '28110f57-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('28110f57-99a8-11db-937f-000e0c431b59-BsTB-F6mI-AJlc-HoWF-BdGj-GsKM', '28110f57-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'РОГНЕДА', ''),
('28110f57-99a8-11db-937f-000e0c431b59-BsyC-FqEC-A08S-HzRo-B4A9-G67k', '28110f57-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('28110f57-99a8-11db-937f-000e0c431b59-BteP-FDm0-Aoz8-HQ0T-B4Qz-GUVE', '28110f57-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('28b335ed-f78f-11e3-8c8a-005056be1f7b-B9Xp-Frzv-AE7l-Hi1b-BL8s-G5Hw', '28b335ed-f78f-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('28b335ed-f78f-11e3-8c8a-005056be1f7b-BaqB-FWgx-AlLs-HbFW-BH1e-G41n', '28b335ed-f78f-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('28b335ed-f78f-11e3-8c8a-005056be1f7b-Bb8k-FCga-AesX-HNmf-BAKw-GNfp', '28b335ed-f78f-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('28b335ed-f78f-11e3-8c8a-005056be1f7b-BbFs-FFm7-AfmI-HTSC-B8uA-Ghxh', '28b335ed-f78f-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '6000', 'г'),
('28b335ed-f78f-11e3-8c8a-005056be1f7b-BHQs-FKEo-AJav-Hl0Q-BJa7-GLwd', '28b335ed-f78f-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('28b335ed-f78f-11e3-8c8a-005056be1f7b-BiRN-FU4N-AkCn-HgNa-BAMy-Gq4n', '28b335ed-f78f-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('28b335ed-f78f-11e3-8c8a-005056be1f7b-BuHw-FAIN-AaFD-Hx60-BWHb-Gieh', '28b335ed-f78f-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'светло-серый', ''),
('2997b29e-f78e-11e3-8c8a-005056be1f7b-B1Nz-FVV9-ATk3-HX9o-Bxej-GGM2', '2997b29e-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('2997b29e-f78e-11e3-8c8a-005056be1f7b-BA4s-F4Rq-AiEL-HHKX-B9AK-Gypc', '2997b29e-f78e-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('2997b29e-f78e-11e3-8c8a-005056be1f7b-Bdyz-Fo6A-AC5A-HMtp-BoCi-GBnn', '2997b29e-f78e-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('2997b29e-f78e-11e3-8c8a-005056be1f7b-Bg6T-FrRt-Aj9y-Hfoi-BmxA-GdR0', '2997b29e-f78e-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'шоколадный', ''),
('2997b29e-f78e-11e3-8c8a-005056be1f7b-BT3X-FlFv-AKSA-H7Vk-BEWd-GwPv', '2997b29e-f78e-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('2997b29e-f78e-11e3-8c8a-005056be1f7b-Bxx7-FxuR-AYzo-H3m4-BnFr-Gcun', '2997b29e-f78e-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1900', 'г'),
('2997b29e-f78e-11e3-8c8a-005056be1f7b-Bzw1-FoSe-AN6R-HNYj-BMOw-GCkH', '2997b29e-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('299c6ffe-f790-11e3-8c8a-005056be1f7b-B9kn-FFmu-A1tM-HXVW-BRsM-GEiX', '299c6ffe-f790-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('299c6ffe-f790-11e3-8c8a-005056be1f7b-Bjak-F4pA-ApOG-HCHu-BGch-GmJ5', '299c6ffe-f790-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('299c6ffe-f790-11e3-8c8a-005056be1f7b-Bnc2-FzKS-AIhT-H1fN-BPdx-G3ja', '299c6ffe-f790-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('299c6ffe-f790-11e3-8c8a-005056be1f7b-BnZJ-F1wf-AMEO-HYIw-BvwP-GmmZ', '299c6ffe-f790-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '20000', 'г'),
('299c6ffe-f790-11e3-8c8a-005056be1f7b-BVwf-FrWt-Aq3d-HUxF-BSmw-G9Gp', '299c6ffe-f790-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('299c6ffe-f790-11e3-8c8a-005056be1f7b-BW1w-FzLj-A5dM-HrbS-BXAs-G85Y', '299c6ffe-f790-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('299c6ffe-f790-11e3-8c8a-005056be1f7b-Bzqp-Fd4l-AT5T-HPZw-BiFW-G3oE', '299c6ffe-f790-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'красно-коричневый', ''),
('2cbf73b5-f789-11e3-8c8a-005056be1f7b-B8b3-FIbq-AfvB-H23K-B13H-GEyg', '2cbf73b5-f789-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый матовый', ''),
('2cbf73b5-f789-11e3-8c8a-005056be1f7b-BfUt-F4Cb-AhoG-HmI4-BJTN-GcfY', '2cbf73b5-f789-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('2cbf73b5-f789-11e3-8c8a-005056be1f7b-BGSM-FJta-AtHK-HpOx-Bnx8-GPbu', '2cbf73b5-f789-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1900', 'г'),
('2cbf73b5-f789-11e3-8c8a-005056be1f7b-BiKm-Foxv-Ai8F-HvZk-BKCd-Gktz', '2cbf73b5-f789-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('2cbf73b5-f789-11e3-8c8a-005056be1f7b-BKTS-FMLK-AWBD-HeG3-BBg2-G1i7', '2cbf73b5-f789-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('2cbf73b5-f789-11e3-8c8a-005056be1f7b-Bn3a-FqWg-AjXC-HbOk-BXt6-GHm9', '2cbf73b5-f789-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('2cbf73b5-f789-11e3-8c8a-005056be1f7b-BZ0z-FBEo-AwwY-Hsro-BloF-Gexh', '2cbf73b5-f789-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('2ced73cf-59ef-11e0-894e-000e0c431b58-B6WY-FwOZ-A12A-HtPL-BxCg-GaMQ', '2ced73cf-59ef-11e0-894e-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'растворитель', ''),
('2ced73cf-59ef-11e0-894e-000e0c431b58-Bkzv-FjKZ-ALjW-HYrE-BO9K-Gaho', '2ced73cf-59ef-11e0-894e-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'COSMOFEN', ''),
('2ced73cf-59ef-11e0-894e-000e0c431b58-BRAt-FvoG-A542-H3AD-Bml4-GXKD', '2ced73cf-59ef-11e0-894e-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('2ced73cf-59ef-11e0-894e-000e0c431b58-BRFM-Fie1-AdFd-HoWJ-BPv9-GHLt', '2ced73cf-59ef-11e0-894e-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('2ced73cf-59ef-11e0-894e-000e0c431b58-BxVn-FKuU-AP9T-HZZ1-BEq1-Gybe', '2ced73cf-59ef-11e0-894e-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '1', 'л'),
('2ced73cf-59ef-11e0-894e-000e0c431b58-BYy2-Favc-AnB0-HVol-BZ8N-GHs1', '2ced73cf-59ef-11e0-894e-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('2eadcbef-99a8-11db-937f-000e0c431b59-B7Bz-FLNc-Axn0-HdVI-BJnN-GvCQ', '2eadcbef-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('2eadcbef-99a8-11db-937f-000e0c431b59-Bpsh-FDWb-Aobk-HF7K-BH4L-G8EZ', '2eadcbef-99a8-11db-937f-000e0c431b59', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '1', 'л'),
('2eadcbef-99a8-11db-937f-000e0c431b59-BPza-Fakb-AcxO-HLnm-Bagq-GrJp', '2eadcbef-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('2eadcbef-99a8-11db-937f-000e0c431b59-BREm-FZC4-AqRX-Hn4l-BFJb-GfjB', '2eadcbef-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('2eadcbef-99a8-11db-937f-000e0c431b59-BZ3C-FZVX-AieA-HvQD-BC6v-Gj0H', '2eadcbef-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'керосин', ''),
('2eadcbf1-99a8-11db-937f-000e0c431b59-BBoj-Fmuf-Aw3Z-H8zd-BWPV-GZor', '2eadcbf1-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('2eadcbf1-99a8-11db-937f-000e0c431b59-BbOl-F12M-AOmz-HQ6D-BDvE-Gr0D', '2eadcbf1-99a8-11db-937f-000e0c431b59', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '5', 'л'),
('2eadcbf1-99a8-11db-937f-000e0c431b59-BLrY-F5wK-AThs-H5gG-Be8U-GGyM', '2eadcbf1-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'керосин', ''),
('2eadcbf1-99a8-11db-937f-000e0c431b59-BxNM-Fy0d-A2BY-HmlY-BumC-GTOw', '2eadcbf1-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('2eadcbf1-99a8-11db-937f-000e0c431b59-BzAo-FO9d-AsVt-HEvY-Bvil-G9Xk', '2eadcbf1-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('2eadcbf3-99a8-11db-937f-000e0c431b59-B4ER-Fm9k-A68H-H8RR-BPe8-GlNb', '2eadcbf3-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'керосин', ''),
('2eadcbf3-99a8-11db-937f-000e0c431b59-BMqW-Ftdn-Al9K-HvAC-BMxt-GzXO', '2eadcbf3-99a8-11db-937f-000e0c431b59', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.5', 'л'),
('2eadcbf3-99a8-11db-937f-000e0c431b59-BOsV-FmQ3-AgEg-HxQ2-BfhK-GC2a', '2eadcbf3-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('2eadcbf3-99a8-11db-937f-000e0c431b59-BQSg-FTQu-A1Mw-HxbH-BioN-GPkD', '2eadcbf3-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('2eadcbf3-99a8-11db-937f-000e0c431b59-Bxrn-FjfE-AqDs-H5ST-B9hB-GTJR', '2eadcbf3-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('2eadcbfc-99a8-11db-937f-000e0c431b59-BfAJ-FVc1-AwQ6-HaSE-B1cx-GWYD', '2eadcbfc-99a8-11db-937f-000e0c431b59', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.5', 'л'),
('2eadcbfc-99a8-11db-937f-000e0c431b59-BHLl-Fadg-ADJz-Hbrb-ByFn-GBIa', '2eadcbfc-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('2eadcbfc-99a8-11db-937f-000e0c431b59-BKsg-F7QA-Aer1-H3ZU-BXgg-G080', '2eadcbfc-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('2eadcbfc-99a8-11db-937f-000e0c431b59-BX3u-FNvK-AiJr-HEIo-BEnp-GN0I', '2eadcbfc-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'растворитель', ''),
('2eadcbfc-99a8-11db-937f-000e0c431b59-BXLM-FDwI-AjGw-Hheh-BbzY-Grdf', '2eadcbfc-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('2eadcbfe-99a8-11db-937f-000e0c431b59-B1iV-Fhmd-AMrH-H35G-BA03-GZ0E', '2eadcbfe-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('2eadcbfe-99a8-11db-937f-000e0c431b59-BEwZ-FAMr-AECJ-H2Yi-B5vb-Gp0M', '2eadcbfe-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('2eadcbfe-99a8-11db-937f-000e0c431b59-BFj3-FWyY-AnPv-HcCp-B4Sw-GDpv', '2eadcbfe-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'растворитель', ''),
('2eadcbfe-99a8-11db-937f-000e0c431b59-BGDH-FP6f-Ay1R-HPgQ-BbWy-Gw5b', '2eadcbfe-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('2eadcbfe-99a8-11db-937f-000e0c431b59-BQGJ-FX9E-Ae9D-HXYC-BbeG-GjuB', '2eadcbfe-99a8-11db-937f-000e0c431b59', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '1', 'л'),
('2eadcc00-99a8-11db-937f-000e0c431b59-Bdfr-FGyP-AeI3-HcV3-BN7f-GOTk', '2eadcc00-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('2eadcc00-99a8-11db-937f-000e0c431b59-BeLg-FWn3-AP2z-HuGI-BVYf-G5Cr', '2eadcc00-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'растворитель', ''),
('2eadcc00-99a8-11db-937f-000e0c431b59-BHKu-FKhI-AM0n-HSiY-BUn8-GM0v', '2eadcc00-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('2eadcc00-99a8-11db-937f-000e0c431b59-BlmB-FWED-AC9V-HzBB-BkJL-GUTs', '2eadcc00-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('2eadcc00-99a8-11db-937f-000e0c431b59-BSWj-FnLl-Aowu-HzHD-Bhkj-GOqY', '2eadcc00-99a8-11db-937f-000e0c431b59', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '5', 'л'),
('2eadcc10-99a8-11db-937f-000e0c431b59-B6eX-FGWp-A9nc-HBbm-BtHB-GSmL', '2eadcc10-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('2eadcc10-99a8-11db-937f-000e0c431b59-B9Qr-FCaG-AJQC-H7lN-BPgr-GmmE', '2eadcc10-99a8-11db-937f-000e0c431b59', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.5', 'л'),
('2eadcc10-99a8-11db-937f-000e0c431b59-Bfqd-FPgk-ATDL-H3S2-BQwD-GxJr', '2eadcc10-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('2eadcc10-99a8-11db-937f-000e0c431b59-BqZj-FfKp-AnfE-HJZG-B16x-GUKT', '2eadcc10-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('2eadcc10-99a8-11db-937f-000e0c431b59-BSls-FvmJ-AXWR-HYo5-BkmL-GRpl', '2eadcc10-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'растворитель', ''),
('2eadcc2e-99a8-11db-937f-000e0c431b59-Bk8G-F1fb-Aks3-HWez-BRva-GC4i', '2eadcc2e-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('2eadcc2e-99a8-11db-937f-000e0c431b59-BkC8-FkxW-AzDr-HqtN-BHUL-GNLq', '2eadcc2e-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('2eadcc2e-99a8-11db-937f-000e0c431b59-Bpdc-FXJM-AkRh-Hvfs-BcKe-G2sm', '2eadcc2e-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'уайт-спирит', ''),
('2eadcc2e-99a8-11db-937f-000e0c431b59-BpvZ-FiH4-AXZp-Hxcj-BVDl-GToY', '2eadcc2e-99a8-11db-937f-000e0c431b59', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.5', 'л'),
('2eadcc2e-99a8-11db-937f-000e0c431b59-BQlu-FIHh-AIZA-HuYO-BQV2-Gqfb', '2eadcc2e-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('2eadcc30-99a8-11db-937f-000e0c431b59-BFCg-FpCI-A42b-HTx8-BsVZ-GiqS', '2eadcc30-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'уайт-спирит', ''),
('2eadcc30-99a8-11db-937f-000e0c431b59-Bic1-FV3I-A16N-HcAt-B9kP-GtsX', '2eadcc30-99a8-11db-937f-000e0c431b59', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '1', 'л'),
('2eadcc30-99a8-11db-937f-000e0c431b59-Bjgv-FIIV-AUIk-H0mN-BzSa-G6gZ', '2eadcc30-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('2eadcc30-99a8-11db-937f-000e0c431b59-BqNG-FN9m-A7bw-HaSf-BCEl-GFff', '2eadcc30-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('2eadcc30-99a8-11db-937f-000e0c431b59-BvGC-Fb4e-AAPi-HmjM-BAPp-Gdmz', '2eadcc30-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('2eadcc32-99a8-11db-937f-000e0c431b59-B6Wd-FWqR-AUYn-Ht8U-BCo2-GQj3', '2eadcc32-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('2eadcc32-99a8-11db-937f-000e0c431b59-B8cN-FU4X-AM8c-Hae4-BUTo-GnvJ', '2eadcc32-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'уайт-спирит', ''),
('2eadcc32-99a8-11db-937f-000e0c431b59-BeN2-FTHj-A2XX-HbJ2-BDEO-Ghb5', '2eadcc32-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('2eadcc32-99a8-11db-937f-000e0c431b59-BrhN-F5AO-Ao9y-H4sh-BQxk-Gwdm', '2eadcc32-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('2eadcc32-99a8-11db-937f-000e0c431b59-ByvT-FbeQ-Avh6-Hnxf-BgRt-GXl1', '2eadcc32-99a8-11db-937f-000e0c431b59', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '5', 'л'),
('30047f82-f788-11e3-8c8a-005056be1f7b-B8J0-FJW4-A6WH-H7E0-BmZK-GLdQ', '30047f82-f788-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '800', 'г'),
('30047f82-f788-11e3-8c8a-005056be1f7b-BHCZ-FT0n-AWvw-H2Tu-ByPN-GBX9', '30047f82-f788-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'светло-серый', ''),
('30047f82-f788-11e3-8c8a-005056be1f7b-BOvZ-FBnt-Awb9-H0cV-B9vI-Galy', '30047f82-f788-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('30047f82-f788-11e3-8c8a-005056be1f7b-Bsg8-FrfZ-ADdL-HM4w-BANA-Gr3q', '30047f82-f788-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('30047f82-f788-11e3-8c8a-005056be1f7b-BTwc-Fzq4-Am2U-Hc8m-BMFo-GlYo', '30047f82-f788-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('30047f82-f788-11e3-8c8a-005056be1f7b-BUKi-FDGB-ALqu-HEpe-BkYA-GhGf', '30047f82-f788-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('30047f82-f788-11e3-8c8a-005056be1f7b-BUNq-Fopn-AR3s-H6dH-Bks3-G0tf', '30047f82-f788-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('3114fa55-f78f-11e3-8c8a-005056be1f7b-B3eU-FnDD-AXes-HKi3-BMVx-GXI8', '3114fa55-f78f-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('3114fa55-f78f-11e3-8c8a-005056be1f7b-B8Cl-FdQu-AvH0-HPQS-BZwu-G4Id', '3114fa55-f78f-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('3114fa55-f78f-11e3-8c8a-005056be1f7b-BbYm-FKiK-ADvg-H1Ip-By75-GW8A', '3114fa55-f78f-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '6000', 'г'),
('3114fa55-f78f-11e3-8c8a-005056be1f7b-Bfbe-FWte-AxOa-HJG0-B16u-Gv03', '3114fa55-f78f-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'черный', ''),
('3114fa55-f78f-11e3-8c8a-005056be1f7b-Bx5K-FxKa-AGjN-H1dV-BU2S-GDqY', '3114fa55-f78f-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('3114fa55-f78f-11e3-8c8a-005056be1f7b-BxOh-FAFB-AWa4-Hpdj-BDWE-GYAI', '3114fa55-f78f-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('3114fa55-f78f-11e3-8c8a-005056be1f7b-BY7s-FyFz-Ay7u-Hisu-Bbpw-GDJC', '3114fa55-f78f-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('3409410b-5b1f-11e2-8bea-005056be271d-B3Q5-F20J-AFcM-HaQj-Bkxb-GW68', '3409410b-5b1f-11e2-8bea-005056be271d', 'e8287600-ad96-11e3-b114-005056be1f7c', 'PARADE', ''),
('3409410b-5b1f-11e2-8bea-005056be271d-BAI8-Fpzr-AOOs-HfCF-BLfN-GtQt', '3409410b-5b1f-11e2-8bea-005056be271d', 'e765ba72-107d-11e3-8a5d-0050569a1080', 'база А', ''),
('3409410b-5b1f-11e2-8bea-005056be271d-BdIh-FufE-Azlf-HtXL-Bv3I-GTnZ', '3409410b-5b1f-11e2-8bea-005056be271d', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'латексная', ''),
('3409410b-5b1f-11e2-8bea-005056be271d-BDSh-FqDH-A5Ab-H8ZL-BVRb-GQIb', '3409410b-5b1f-11e2-8bea-005056be271d', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('3409410b-5b1f-11e2-8bea-005056be271d-Bh2v-FIgq-AXjm-HukN-B8TD-GYuY', '3409410b-5b1f-11e2-8bea-005056be271d', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('3409410b-5b1f-11e2-8bea-005056be271d-BORQ-FqPq-A3l9-HT2H-BvRW-Go4B', '3409410b-5b1f-11e2-8bea-005056be271d', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('3409410b-5b1f-11e2-8bea-005056be271d-Bszb-FaUd-Afg9-HtPO-BcDU-GyWK', '3409410b-5b1f-11e2-8bea-005056be271d', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('3409410b-5b1f-11e2-8bea-005056be271d-BxFV-FTzt-Afll-Ho6O-BD6X-GBlM', '3409410b-5b1f-11e2-8bea-005056be271d', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'шелковый матовый', ''),
('3409410b-5b1f-11e2-8bea-005056be271d-BZO4-FmpK-ALQ8-Hmn4-BjqM-GGXP', '3409410b-5b1f-11e2-8bea-005056be271d', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '9', 'л'),
('3442e089-0125-11e4-8695-005056be1f7b-BBwo-Ftd7-A9ug-H7Pt-BUmg-GcVo', '3442e089-0125-11e4-8695-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('3442e089-0125-11e4-8695-005056be1f7b-Bcwi-Fd9R-AJnT-Hrp8-BVcv-GRQg', '3442e089-0125-11e4-8695-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'серебрянный', ''),
('3442e089-0125-11e4-8695-005056be1f7b-BjoW-FNh9-AHKE-Hzmy-BdFl-GBik', '3442e089-0125-11e4-8695-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('3442e089-0125-11e4-8695-005056be1f7b-BM89-FQxl-AFQr-HqRP-BRk8-GeMX', '3442e089-0125-11e4-8695-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('3442e089-0125-11e4-8695-005056be1f7b-Bnqo-FaT2-ADvR-HoL9-BDNv-Gs7P', '3442e089-0125-11e4-8695-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '2200', 'г'),
('3442e089-0125-11e4-8695-005056be1f7b-BSrN-FmZ3-AjuV-HVCm-B2mR-GN1y', '3442e089-0125-11e4-8695-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('3442e089-0125-11e4-8695-005056be1f7b-BXwI-FsIK-AV0x-HmNn-Bbal-GaqY', '3442e089-0125-11e4-8695-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('3479e733-bce7-11e4-a1f3-005056be1f7b-B6L1-FafP-A2Cx-HNbD-BflZ-GHwP', '3479e733-bce7-11e4-a1f3-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('3479e733-bce7-11e4-a1f3-005056be1f7b-B8pS-FHsO-ADrQ-HnmN-BD6I-G1Ob', '3479e733-bce7-11e4-a1f3-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'молотковая эмаль-грунт', ''),
('3479e733-bce7-11e4-a1f3-005056be1f7b-BbvZ-FbDz-AoEK-HD67-B9Cj-G67a', '3479e733-bce7-11e4-a1f3-005056be1f7b', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '2', 'л'),
('3479e733-bce7-11e4-a1f3-005056be1f7b-BEl4-Fc8q-A8If-HUYa-BghW-GZQS', '3479e733-bce7-11e4-a1f3-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'серебристый', ''),
('3479e733-bce7-11e4-a1f3-005056be1f7b-BHn7-F52X-A9W0-HXew-Bn4Z-GMPO', '3479e733-bce7-11e4-a1f3-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('3479e733-bce7-11e4-a1f3-005056be1f7b-BKVl-FK1R-A1S8-HMqK-BVvv-GPNs', '3479e733-bce7-11e4-a1f3-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('3479e733-bce7-11e4-a1f3-005056be1f7b-BT6x-FSSR-AF6K-HeIZ-BtjL-GIAO', '3479e733-bce7-11e4-a1f3-005056be1f7b', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для ржавчины', ''),
('3479e733-bce7-11e4-a1f3-005056be1f7b-BYmi-FWzO-AgKA-HRZN-BAVY-G2v5', '3479e733-bce7-11e4-a1f3-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('34fe3e79-99a8-11db-937f-000e0c431b59-BbXi-F64U-A8yg-Hm9b-BBk4-GqYk', '34fe3e79-99a8-11db-937f-000e0c431b59', 'c2267174-970e-11e4-9be0-005056be1f7c', '50', 'м'),
('34fe3e79-99a8-11db-937f-000e0c431b59-Bezv-FXZi-ADjw-HZNT-BhrR-GfhY', '34fe3e79-99a8-11db-937f-000e0c431b59', '0569475c-1474-11e3-82b9-0050569a1080', '5x5', ''),
('34fe3e79-99a8-11db-937f-000e0c431b59-BIUi-F5tw-AORe-HgwB-B5Lo-GK6Y', '34fe3e79-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('34fe3e79-99a8-11db-937f-000e0c431b59-Blcp-FyrD-Aif7-HHFN-BGNh-GpIR', '34fe3e79-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('34fe3e79-99a8-11db-937f-000e0c431b59-BmMn-FIyl-AjzM-Hdfl-BEPi-GK8o', '34fe3e79-99a8-11db-937f-000e0c431b59', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для штукатурки', ''),
('34fe3e79-99a8-11db-937f-000e0c431b59-Bu8G-FrFM-A5MZ-Hc2i-BtS6-GROz', '34fe3e79-99a8-11db-937f-000e0c431b59', '0e31c585-9718-11e4-9be0-005056be1f7c', '1', 'м'),
('34fe3e79-99a8-11db-937f-000e0c431b59-BX21-FwUr-AUDA-HQVP-BF8b-GsGP', '34fe3e79-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'сетка', ''),
('34fe3e79-99a8-11db-937f-000e0c431b59-BYnP-Ftub-AgQM-HPYt-By4j-GjQ9', '34fe3e79-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('34fe3e7c-99a8-11db-937f-000e0c431b59-B2xh-FZZH-AbxE-HFzh-BO8o-G9OI', '34fe3e7c-99a8-11db-937f-000e0c431b59', 'c2267174-970e-11e4-9be0-005056be1f7c', '50', 'м'),
('34fe3e7c-99a8-11db-937f-000e0c431b59-BgJd-FKnA-AJ0O-HAD9-BC6w-GjUM', '34fe3e7c-99a8-11db-937f-000e0c431b59', '0e31c585-9718-11e4-9be0-005056be1f7c', '1', 'м'),
('34fe3e7c-99a8-11db-937f-000e0c431b59-BHGt-FQeh-A6Uo-Hdh9-BWO2-GDuB', '34fe3e7c-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('34fe3e7c-99a8-11db-937f-000e0c431b59-BnAu-FtNR-AJ4J-H3aH-BFDt-GOgc', '34fe3e7c-99a8-11db-937f-000e0c431b59', '0569475c-1474-11e3-82b9-0050569a1080', '5x5', ''),
('34fe3e7c-99a8-11db-937f-000e0c431b59-Bq4r-FfKy-ADfi-HmkB-BX8o-GCdJ', '34fe3e7c-99a8-11db-937f-000e0c431b59', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'стандарт', ''),
('34fe3e7c-99a8-11db-937f-000e0c431b59-BrwA-Fw2z-ATGw-H9EA-BHkK-Gkvy', '34fe3e7c-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'сетка малярная', ''),
('34fe3e7c-99a8-11db-937f-000e0c431b59-BS3X-FMUc-Ajzz-HRGh-BVti-GFdv', '34fe3e7c-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('34fe3e7c-99a8-11db-937f-000e0c431b59-BWmo-FgfF-AnkI-HXyp-B1Gh-GNT3', '34fe3e7c-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('34fe3e7e-99a8-11db-937f-000e0c431b59-B34C-F3JX-AHOV-Hi7c-ByRJ-G4xS', '34fe3e7e-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('34fe3e7e-99a8-11db-937f-000e0c431b59-B5L0-Fm9G-A3tE-HBi7-BTu6-G2Td', '34fe3e7e-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('34fe3e7e-99a8-11db-937f-000e0c431b59-Bd5g-FUl6-AH6r-HwGP-Bv9J-Gy2S', '34fe3e7e-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('34fe3e7e-99a8-11db-937f-000e0c431b59-BM0h-Fiid-AAWu-HJPi-Bctd-G0DE', '34fe3e7e-99a8-11db-937f-000e0c431b59', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'стандарт', ''),
('34fe3e7e-99a8-11db-937f-000e0c431b59-BmmI-FctE-AW55-HbFW-BeWr-GRsD', '34fe3e7e-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'сетка малярная', ''),
('34fe3e7e-99a8-11db-937f-000e0c431b59-BRUx-FVWV-ARqG-HNhZ-Bq3t-Gg8M', '34fe3e7e-99a8-11db-937f-000e0c431b59', '0e31c585-9718-11e4-9be0-005056be1f7c', '1', 'м'),
('34fe3e7e-99a8-11db-937f-000e0c431b59-BUqE-FgJk-AHN1-HqYx-BUvp-GKi0', '34fe3e7e-99a8-11db-937f-000e0c431b59', '0569475c-1474-11e3-82b9-0050569a1080', '5x5', ''),
('34fe3e7e-99a8-11db-937f-000e0c431b59-BUT1-FFdG-Ao7z-HH64-BL1F-GLcD', '34fe3e7e-99a8-11db-937f-000e0c431b59', 'c2267174-970e-11e4-9be0-005056be1f7c', '20', 'м'),
('34fe3e85-99a8-11db-937f-000e0c431b59-BISI-F65q-ADt6-H9i8-BuNS-Gmom', '34fe3e85-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('34fe3e85-99a8-11db-937f-000e0c431b59-BjHD-FHuF-AaMt-HocM-Bylf-G7ga', '34fe3e85-99a8-11db-937f-000e0c431b59', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'интерьерная', ''),
('34fe3e85-99a8-11db-937f-000e0c431b59-BkDo-FTrG-Aggr-HCcO-BdFy-GnnW', '34fe3e85-99a8-11db-937f-000e0c431b59', 'c2267174-970e-11e4-9be0-005056be1f7c', '20', 'м'),
('34fe3e85-99a8-11db-937f-000e0c431b59-Bl5y-F162-Az9x-HmiI-ByP5-GyBw', '34fe3e85-99a8-11db-937f-000e0c431b59', '0569475c-1474-11e3-82b9-0050569a1080', '5x5', ''),
('34fe3e85-99a8-11db-937f-000e0c431b59-BL9r-FRhj-AAjB-HwPy-BQCH-GRgc', '34fe3e85-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'сетка', ''),
('34fe3e85-99a8-11db-937f-000e0c431b59-BmkK-Fiis-AfS6-Hx6k-Bafr-Gemb', '34fe3e85-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('34fe3e85-99a8-11db-937f-000e0c431b59-BoV3-FbT8-Acbh-HnBT-BbnO-GQdJ', '34fe3e85-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('34fe3e85-99a8-11db-937f-000e0c431b59-BWJp-FR8k-A3XG-Hj3s-BBcw-Gpwe', '34fe3e85-99a8-11db-937f-000e0c431b59', '0e31c585-9718-11e4-9be0-005056be1f7c', '1', 'м'),
('34fe3e85-99a8-11db-937f-000e0c431b59-BwSA-FeVd-Atyi-HhbM-B5yW-GkFT', '34fe3e85-99a8-11db-937f-000e0c431b59', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для штукатурки', ''),
('34fe3e88-99a8-11db-937f-000e0c431b59-B3qS-FZjl-ACvE-Hnoz-BwGk-GfkI', '34fe3e88-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('34fe3e88-99a8-11db-937f-000e0c431b59-B5du-FxQC-A3nN-HnSx-B8iZ-GD4o', '34fe3e88-99a8-11db-937f-000e0c431b59', 'c2267174-970e-11e4-9be0-005056be1f7c', '20', 'м'),
('34fe3e88-99a8-11db-937f-000e0c431b59-Bcvs-Fdh9-ASyA-HZFg-B21w-GJKk', '34fe3e88-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('34fe3e88-99a8-11db-937f-000e0c431b59-Bd38-FdRC-AAJ4-HwSE-BWKv-GpjU', '34fe3e88-99a8-11db-937f-000e0c431b59', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'интерьерная', ''),
('34fe3e88-99a8-11db-937f-000e0c431b59-BQlF-FUPu-AKB1-Hvga-B5AS-G2dk', '34fe3e88-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('34fe3e88-99a8-11db-937f-000e0c431b59-BsWa-F7uB-Ansh-Hxb1-BPMB-GTL1', '34fe3e88-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'сетка', ''),
('34fe3e88-99a8-11db-937f-000e0c431b59-BuPR-FTxt-Agsh-H3Sm-BLdl-G3vJ', '34fe3e88-99a8-11db-937f-000e0c431b59', '0569475c-1474-11e3-82b9-0050569a1080', '5x5', ''),
('34fe3e88-99a8-11db-937f-000e0c431b59-BvLE-F9yW-Aww5-HL1x-Bzn2-GfSr', '34fe3e88-99a8-11db-937f-000e0c431b59', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для штукатурки', ''),
('34fe3e88-99a8-11db-937f-000e0c431b59-BxDq-FozN-AEtN-HXkq-B9fK-GsTb', '34fe3e88-99a8-11db-937f-000e0c431b59', '0e31c585-9718-11e4-9be0-005056be1f7c', '1', 'м'),
('34fe3e94-99a8-11db-937f-000e0c431b59-B8jc-F0Lc-Adva-HY1G-BaUb-G42W', '34fe3e94-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'двухсторонний скотч', ''),
('34fe3e94-99a8-11db-937f-000e0c431b59-B9af-FrHY-ApaC-HjIw-BuPU-GkNu', '34fe3e94-99a8-11db-937f-000e0c431b59', 'c2267174-970e-11e4-9be0-005056be1f7c', '25', 'м'),
('34fe3e94-99a8-11db-937f-000e0c431b59-BBtP-FRW2-A8gs-Hr48-BTo5-GruK', '34fe3e94-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('34fe3e94-99a8-11db-937f-000e0c431b59-BeVd-Fg5l-ATp1-HoPD-BZfj-GGlk', '34fe3e94-99a8-11db-937f-000e0c431b59', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для полипропилена', ''),
('34fe3e94-99a8-11db-937f-000e0c431b59-BGh1-F9ap-AR71-HfJ3-B2Km-GHc9', '34fe3e94-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('34fe3e94-99a8-11db-937f-000e0c431b59-BPfr-FFB1-A93B-Hl0e-Bk95-GFpC', '34fe3e94-99a8-11db-937f-000e0c431b59', '0e31c585-9718-11e4-9be0-005056be1f7c', '0.038', 'м'),
('34fe3e94-99a8-11db-937f-000e0c431b59-Bv7X-FFQZ-Axp2-H3zT-BgKN-GNCW', '34fe3e94-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('34fe3eb2-99a8-11db-937f-000e0c431b59-BBh5-FWCw-ABjx-HaWv-BhwG-G5Ix', '34fe3eb2-99a8-11db-937f-000e0c431b59', '0e31c585-9718-11e4-9be0-005056be1f7c', '0.05', 'м'),
('34fe3eb2-99a8-11db-937f-000e0c431b59-Bdw6-F5Lw-ABlH-Hdf0-Bz0K-G2UB', '34fe3eb2-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('34fe3eb2-99a8-11db-937f-000e0c431b59-BeLC-FU1S-AYPx-H8WZ-BiT0-GBTK', '34fe3eb2-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('34fe3eb2-99a8-11db-937f-000e0c431b59-Bit0-F8Xm-ABPe-Hw7q-Br8O-GmTQ', '34fe3eb2-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'скотч', ''),
('34fe3eb2-99a8-11db-937f-000e0c431b59-BJtQ-F8rm-AWP7-HVQP-BfuC-GbpN', '34fe3eb2-99a8-11db-937f-000e0c431b59', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'прозрачный', ''),
('34fe3eb2-99a8-11db-937f-000e0c431b59-BNqz-FVKU-AU0U-Hf2p-BgBZ-Gx9G', '34fe3eb2-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('34fe3eb2-99a8-11db-937f-000e0c431b59-BZUW-FWqn-AlMY-HnnE-B22v-GqM6', '34fe3eb2-99a8-11db-937f-000e0c431b59', 'c2267174-970e-11e4-9be0-005056be1f7c', '50', 'м'),
('34fe3ed3-99a8-11db-937f-000e0c431b59-B4zf-Fb9F-AEuq-HALQ-B0oT-GnNM', '34fe3ed3-99a8-11db-937f-000e0c431b59', 'c2267174-970e-11e4-9be0-005056be1f7c', '50', 'м'),
('34fe3ed3-99a8-11db-937f-000e0c431b59-B55P-FMhH-ABap-HjpJ-B0i0-GeA8', '34fe3ed3-99a8-11db-937f-000e0c431b59', '0e31c585-9718-11e4-9be0-005056be1f7c', '0.05', 'м'),
('34fe3ed3-99a8-11db-937f-000e0c431b59-BBTo-F8BB-AdqH-HzmH-BKB6-GzgQ', '34fe3ed3-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('34fe3ed3-99a8-11db-937f-000e0c431b59-BcDo-Fj3R-AqCS-Hm3y-B4hh-GOea', '34fe3ed3-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('34fe3ed3-99a8-11db-937f-000e0c431b59-BjEs-FQF4-AgEh-Hzsv-BCnq-GR1N', '34fe3ed3-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'скотч алюминиевый', ''),
('34fe3ed3-99a8-11db-937f-000e0c431b59-BptV-F83o-AUEi-HJjm-Bwl7-Gaj9', '34fe3ed3-99a8-11db-937f-000e0c431b59', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'металлизированный', ''),
('34fe3ed3-99a8-11db-937f-000e0c431b59-BYyp-FfU1-AMFR-HJTX-BM4y-GeEn', '34fe3ed3-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('34fe3ed7-99a8-11db-937f-000e0c431b59-B9rZ-F3Ld-A7Yg-Hxsg-BTIT-G9pz', '34fe3ed7-99a8-11db-937f-000e0c431b59', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'малярный', ''),
('34fe3ed7-99a8-11db-937f-000e0c431b59-B9XA-FRAD-AFL5-HdDD-BND2-GT0f', '34fe3ed7-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('34fe3ed7-99a8-11db-937f-000e0c431b59-BaD0-FeDD-AKSF-Hh7B-BGD3-GErh', '34fe3ed7-99a8-11db-937f-000e0c431b59', '0e31c585-9718-11e4-9be0-005056be1f7c', '0.03', 'м'),
('34fe3ed7-99a8-11db-937f-000e0c431b59-Bawp-FggX-Aehm-HCWz-B6UN-G6mN', '34fe3ed7-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('34fe3ed7-99a8-11db-937f-000e0c431b59-BH28-Fnop-AK9y-Hd7e-BTRo-GrP2', '34fe3ed7-99a8-11db-937f-000e0c431b59', 'c2267174-970e-11e4-9be0-005056be1f7c', '20', 'м'),
('34fe3ed7-99a8-11db-937f-000e0c431b59-Bu2f-FjVb-ADpt-HsW0-BjwC-GjRG', '34fe3ed7-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'скотч', ''),
('34fe3ed7-99a8-11db-937f-000e0c431b59-BVJX-F8Mt-AxID-HADp-BOCX-Gn6i', '34fe3ed7-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('34fe3eda-99a8-11db-937f-000e0c431b59-B60J-F8JC-AfkB-Hk02-B7si-GJhH', '34fe3eda-99a8-11db-937f-000e0c431b59', 'c2267174-970e-11e4-9be0-005056be1f7c', '20', 'м'),
('34fe3eda-99a8-11db-937f-000e0c431b59-BGi8-F1QT-A11G-H3ZX-B0Bz-GYtz', '34fe3eda-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('34fe3eda-99a8-11db-937f-000e0c431b59-BmbY-Fs0U-AtGY-HlLF-BJ67-GoeS', '34fe3eda-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('34fe3eda-99a8-11db-937f-000e0c431b59-BsqM-Fzjl-AMin-HC7X-B2q1-Gyx6', '34fe3eda-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('34fe3eda-99a8-11db-937f-000e0c431b59-Btc7-FHEH-AMNC-HJ3h-Bb0F-GZ1W', '34fe3eda-99a8-11db-937f-000e0c431b59', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'малярный', ''),
('34fe3eda-99a8-11db-937f-000e0c431b59-Bu21-Fvb1-AnYi-HMhG-BUS1-GArn', '34fe3eda-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'скотч', ''),
('34fe3eda-99a8-11db-937f-000e0c431b59-Bvuq-FYwn-AwoT-HncG-BiYG-GsWP', '34fe3eda-99a8-11db-937f-000e0c431b59', '0e31c585-9718-11e4-9be0-005056be1f7c', '0.05', 'м'),
('3526e5c9-f78e-11e3-8c8a-005056be1f7b-B9UT-FhWi-AUpI-H6zE-Bcoy-GQ2E', '3526e5c9-f78e-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('3526e5c9-f78e-11e3-8c8a-005056be1f7b-Ba6n-FgXQ-A99Y-HITT-BURn-Gnz0', '3526e5c9-f78e-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('3526e5c9-f78e-11e3-8c8a-005056be1f7b-Bgrt-FvDn-AZHj-HCPw-BSjk-GK6h', '3526e5c9-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('3526e5c9-f78e-11e3-8c8a-005056be1f7b-Biis-Faud-AVkP-HV4n-BD6m-GINQ', '3526e5c9-f78e-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'розово-бежевый', ''),
('3526e5c9-f78e-11e3-8c8a-005056be1f7b-BMKo-FVFe-AZhI-HOxA-BSO6-G7vS', '3526e5c9-f78e-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1900', 'г'),
('3526e5c9-f78e-11e3-8c8a-005056be1f7b-BTy2-FW7o-AzRX-HeW1-BU6Y-GCVJ', '3526e5c9-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('3526e5c9-f78e-11e3-8c8a-005056be1f7b-Bzuy-FMPK-ADjG-Hcmb-BlIJ-GU5M', '3526e5c9-f78e-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('36e5c1e5-bbba-11e3-b52a-005056be1f7b-B4Ma-FSTO-AOam-HdRn-BUeN-GjJ5', '36e5c1e5-bbba-11e3-b52a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('36e5c1e5-bbba-11e3-b52a-005056be1f7b-B67m-F9uY-AkZI-He9i-Bd3v-G4LF', '36e5c1e5-bbba-11e3-b52a-005056be1f7b', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'финишная', ''),
('36e5c1e5-bbba-11e3-b52a-005056be1f7b-B9R4-FqFU-AvbZ-HHx6-BGYO-G2A2', '36e5c1e5-bbba-11e3-b52a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'супербелый', ''),
('36e5c1e5-bbba-11e3-b52a-005056be1f7b-BhQh-Fpuf-AONX-HAHi-BFP8-GlA1', '36e5c1e5-bbba-11e3-b52a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('36e5c1e5-bbba-11e3-b52a-005056be1f7b-BIZf-Fu3x-AYMR-Hlva-BgrX-GJqH', '36e5c1e5-bbba-11e3-b52a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'PARADE', ''),
('36e5c1e5-bbba-11e3-b52a-005056be1f7b-BkTv-FmmU-AjYd-HGGH-BAqA-GDi2', '36e5c1e5-bbba-11e3-b52a-005056be1f7b', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('36e5c1e5-bbba-11e3-b52a-005056be1f7b-BMkP-FprV-AwrC-Hxvl-Bpt4-Gja0', '36e5c1e5-bbba-11e3-b52a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('36e5c1e5-bbba-11e3-b52a-005056be1f7b-BoIa-FCIi-AlOx-Hizy-BZNN-Gb4O', '36e5c1e5-bbba-11e3-b52a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'шпатлевка', ''),
('36e5c1e5-bbba-11e3-b52a-005056be1f7b-BP0v-Fvdc-A8Fr-HZOl-Bm3u-GC64', '36e5c1e5-bbba-11e3-b52a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '10000', 'г'),
('36e5c1e5-bbba-11e3-b52a-005056be1f7b-BYYC-FpAy-AGhf-HeqL-BlOc-GI5M', '36e5c1e5-bbba-11e3-b52a-005056be1f7b', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для печей', ''),
('380e3f79-f788-11e3-8c8a-005056be1f7b-B3r2-FY6O-Ap4y-H95I-BILA-GSXj', '380e3f79-f788-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'черный', ''),
('380e3f79-f788-11e3-8c8a-005056be1f7b-BcnS-FGXf-A6xl-HcDE-B4iO-GP3V', '380e3f79-f788-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('380e3f79-f788-11e3-8c8a-005056be1f7b-BcY2-FD26-AIue-HW0W-Bseq-GTZc', '380e3f79-f788-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('380e3f79-f788-11e3-8c8a-005056be1f7b-BdIQ-FrgJ-AvKf-HcG9-BgiX-GXmO', '380e3f79-f788-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '800', 'г'),
('380e3f79-f788-11e3-8c8a-005056be1f7b-BeTl-F6wJ-AsxO-HX4D-BoWq-G7cE', '380e3f79-f788-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('380e3f79-f788-11e3-8c8a-005056be1f7b-BfJV-FTHP-AbPa-Hcix-BBEo-GGyQ', '380e3f79-f788-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('380e3f79-f788-11e3-8c8a-005056be1f7b-Bg1E-FulW-AyBo-HuNz-BZFg-GQdb', '380e3f79-f788-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('3bfb5c69-9fb8-11e3-8705-005056be1f7b-B5MQ-FUcd-AeMu-HDad-BCEg-GFhO', '3bfb5c69-9fb8-11e3-8705-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('3bfb5c69-9fb8-11e3-8705-005056be1f7b-BDYe-FcZY-ASEz-HpVp-BTuR-GWCd', '3bfb5c69-9fb8-11e3-8705-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('3bfb5c69-9fb8-11e3-8705-005056be1f7b-BepQ-FnEn-Az9K-H0Gz-BCBC-GSVe', '3bfb5c69-9fb8-11e3-8705-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('3bfb5c69-9fb8-11e3-8705-005056be1f7b-BI8P-FI4v-AgNa-HQNK-BtQi-GOt9', '3bfb5c69-9fb8-11e3-8705-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('3bfb5c69-9fb8-11e3-8705-005056be1f7b-BIVp-FFuE-AoAY-HB5z-BobX-GRzn', '3bfb5c69-9fb8-11e3-8705-005056be1f7b', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('3bfb5c69-9fb8-11e3-8705-005056be1f7b-BnCD-FdsY-AIBJ-HZXL-B4gJ-GIpC', '3bfb5c69-9fb8-11e3-8705-005056be1f7b', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсальное', ''),
('3bfb5c69-9fb8-11e3-8705-005056be1f7b-Bo9c-Fz9i-ApAj-HrT6-BMEv-G4kp', '3bfb5c69-9fb8-11e3-8705-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '900', 'г'),
('3bfb5c69-9fb8-11e3-8705-005056be1f7b-Bv1r-Ff4I-A06M-HgBt-BufY-GAJd', '3bfb5c69-9fb8-11e3-8705-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('3bfb5c69-9fb8-11e3-8705-005056be1f7b-BZlC-FRMw-A6vA-H6gY-BUot-G0td', '3bfb5c69-9fb8-11e3-8705-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый глянцевый', ''),
('3d601a65-f78f-11e3-8c8a-005056be1f7b-BaNa-F0of-AmLx-HdVv-Bhb8-GoQK', '3d601a65-f78f-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('3d601a65-f78f-11e3-8c8a-005056be1f7b-BFMH-FzM9-AM1v-HpWt-BJo4-GrtS', '3d601a65-f78f-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('3d601a65-f78f-11e3-8c8a-005056be1f7b-BmdA-FXIW-AHSB-HA0u-BSZ9-GtZm', '3d601a65-f78f-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('3d601a65-f78f-11e3-8c8a-005056be1f7b-BNPn-FpL5-AOEt-H01X-Bnxc-Gf9e', '3d601a65-f78f-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'красно-коричневый', ''),
('3d601a65-f78f-11e3-8c8a-005056be1f7b-BPBx-FCfJ-AyCk-Hwq2-B7SV-G7qd', '3d601a65-f78f-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('3d601a65-f78f-11e3-8c8a-005056be1f7b-BSJh-FEZs-AdIj-HaEm-BgS2-GK8D', '3d601a65-f78f-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('3d601a65-f78f-11e3-8c8a-005056be1f7b-BSxw-FTxv-AEGL-HC1k-BoFm-GcIH', '3d601a65-f78f-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '6000', 'г'),
('3d822ed4-f78e-11e3-8c8a-005056be1f7b-B6Lu-FtLd-AF22-HMv6-BzwA-GTYr', '3d822ed4-f78e-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('3d822ed4-f78e-11e3-8c8a-005056be1f7b-BAFd-Fmrs-AkWP-HoGT-B81g-GMaM', '3d822ed4-f78e-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('3d822ed4-f78e-11e3-8c8a-005056be1f7b-BC9E-FRnL-AllC-HIxd-BUso-GFc1', '3d822ed4-f78e-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1900', 'г'),
('3d822ed4-f78e-11e3-8c8a-005056be1f7b-BlES-Fbae-AOhA-Hu4W-BUej-GYWD', '3d822ed4-f78e-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'охра', ''),
('3d822ed4-f78e-11e3-8c8a-005056be1f7b-BpvN-FpfH-AB1l-HlO9-BpgE-GtES', '3d822ed4-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('3d822ed4-f78e-11e3-8c8a-005056be1f7b-BRGE-FiOA-AI61-HceK-B3FP-GKhq', '3d822ed4-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('3d822ed4-f78e-11e3-8c8a-005056be1f7b-BuMO-Fkpt-Auhy-H0sV-BpYH-G4Dn', '3d822ed4-f78e-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('41f9a64a-f788-11e3-8c8a-005056be1f7b-B19c-FPx4-AUc2-Hc8N-Bjej-G4uN', '41f9a64a-f788-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('41f9a64a-f788-11e3-8c8a-005056be1f7b-BgWU-FQnd-A3FN-HopK-BiWK-GMg2', '41f9a64a-f788-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('41f9a64a-f788-11e3-8c8a-005056be1f7b-BIa0-FpNX-A9OI-H3je-BF2k-GHgl', '41f9a64a-f788-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '800', 'г'),
('41f9a64a-f788-11e3-8c8a-005056be1f7b-BIcF-FA5D-ANeh-HxYS-BAv5-GUVM', '41f9a64a-f788-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('41f9a64a-f788-11e3-8c8a-005056be1f7b-BrAn-FJqn-AbkZ-HzbE-Bp9H-GeVH', '41f9a64a-f788-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'красно-коричневый', ''),
('41f9a64a-f788-11e3-8c8a-005056be1f7b-BSGC-FoBF-Agy9-HVDH-B9Mk-GEMf', '41f9a64a-f788-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('41f9a64a-f788-11e3-8c8a-005056be1f7b-BXmT-FkR9-Au1V-H6D2-Bw4z-GPIm', '41f9a64a-f788-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('441a7da1-9fb8-11e3-8705-005056be1f7b-B2BP-Fbsi-AX6m-HJzN-By2x-GaG5', '441a7da1-9fb8-11e3-8705-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый глянцевый', ''),
('441a7da1-9fb8-11e3-8705-005056be1f7b-Bb0y-FUXf-ASrP-HVvL-B1di-GoWp', '441a7da1-9fb8-11e3-8705-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('441a7da1-9fb8-11e3-8705-005056be1f7b-BCkl-FOGm-A92I-HX3R-B1gQ-GTWO', '441a7da1-9fb8-11e3-8705-005056be1f7b', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('441a7da1-9fb8-11e3-8705-005056be1f7b-BCvt-F6s0-At8A-HzXY-BYyX-GMIv', '441a7da1-9fb8-11e3-8705-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('441a7da1-9fb8-11e3-8705-005056be1f7b-BDEv-FLbn-AcSK-Hslg-B8di-GM6Q', '441a7da1-9fb8-11e3-8705-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('441a7da1-9fb8-11e3-8705-005056be1f7b-BGAf-FGz4-AeNs-H2a2-BmJS-GFGG', '441a7da1-9fb8-11e3-8705-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '2400', 'г'),
('441a7da1-9fb8-11e3-8705-005056be1f7b-Bsbc-F8xN-AIor-HrSD-BXVz-GGQi', '441a7da1-9fb8-11e3-8705-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('441a7da1-9fb8-11e3-8705-005056be1f7b-BsXx-F3GY-AZD3-H8Qx-BOAG-GaYi', '441a7da1-9fb8-11e3-8705-005056be1f7b', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсальное', ''),
('441a7da1-9fb8-11e3-8705-005056be1f7b-BuSM-FXbB-AkQ3-HYq9-BTuD-GE6e', '441a7da1-9fb8-11e3-8705-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('45794d11-f78e-11e3-8c8a-005056be1f7b-B31p-FBpt-AisQ-HUAX-B8oq-GY7F', '45794d11-f78e-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1900', 'г'),
('45794d11-f78e-11e3-8c8a-005056be1f7b-BdNO-Fj2V-ALwp-HGub-B57j-Gqs7', '45794d11-f78e-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('45794d11-f78e-11e3-8c8a-005056be1f7b-BLIw-FwW7-AziA-HXm2-BcBS-GqZO', '45794d11-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('45794d11-f78e-11e3-8c8a-005056be1f7b-BMSC-Fc4O-AV8k-HOKD-BLEh-GE2E', '45794d11-f78e-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'серый', ''),
('45794d11-f78e-11e3-8c8a-005056be1f7b-Bnhe-Fo6G-AgXI-HyEh-BDhv-GSHn', '45794d11-f78e-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('45794d11-f78e-11e3-8c8a-005056be1f7b-BnSa-FSYK-AuTG-HUAy-BQoW-GvTR', '45794d11-f78e-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('45794d11-f78e-11e3-8c8a-005056be1f7b-BZaO-FX7w-Ay0G-HnGl-B6T5-G8wy', '45794d11-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('47de42e5-f789-11e3-8c8a-005056be1f7b-B6hP-FHgn-AsdI-HjzN-BeDG-Gt7E', '47de42e5-f789-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('47de42e5-f789-11e3-8c8a-005056be1f7b-BjvU-FPR1-AgQi-HV88-Bx3f-GCAC', '47de42e5-f789-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('47de42e5-f789-11e3-8c8a-005056be1f7b-BjwR-Fd55-AsZ6-Hzj6-BKW1-GhnM', '47de42e5-f789-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '6000', 'г'),
('47de42e5-f789-11e3-8c8a-005056be1f7b-Bqsf-FzRU-ADwX-HJfU-BOFG-GjVY', '47de42e5-f789-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('47de42e5-f789-11e3-8c8a-005056be1f7b-BSoR-Fqyx-AAD4-HHmO-BfBH-GK0V', '47de42e5-f789-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('47de42e5-f789-11e3-8c8a-005056be1f7b-Bw6W-FRWa-AwzL-H0xw-BeFa-GwvO', '47de42e5-f789-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('47de42e5-f789-11e3-8c8a-005056be1f7b-BZ3o-F8Om-A6Be-HaEf-BcuN-G9kf', '47de42e5-f789-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('4b89f23b-1f19-11e5-8104-00155d3a0124-BawN-F8kp-Axz2-HzIC-Bpy0-GSYH', '4b89f23b-1f19-11e5-8104-00155d3a0124', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('4b89f23b-1f19-11e5-8104-00155d3a0124-BcwY-FfBG-Ain4-H2kk-BbSH-GwlN', '4b89f23b-1f19-11e5-8104-00155d3a0124', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'двухсторонний скотч', ''),
('4b89f23b-1f19-11e5-8104-00155d3a0124-BGPW-F4Qv-A1wk-HjgX-B469-GCLY', '4b89f23b-1f19-11e5-8104-00155d3a0124', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('4b89f23b-1f19-11e5-8104-00155d3a0124-Bp8m-FkIc-AY9G-HQeY-B8Nv-GYJf', '4b89f23b-1f19-11e5-8104-00155d3a0124', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'вспененная', ''),
('4b89f23b-1f19-11e5-8104-00155d3a0124-BsgV-FSG2-Aq0w-HoB9-BDXb-GiyN', '4b89f23b-1f19-11e5-8104-00155d3a0124', '0e31c585-9718-11e4-9be0-005056be1f7c', '0.019', 'м'),
('4b89f23b-1f19-11e5-8104-00155d3a0124-BuwG-F2Dk-APAx-HAZ7-Bfzt-GtwT', '4b89f23b-1f19-11e5-8104-00155d3a0124', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('4b89f23b-1f19-11e5-8104-00155d3a0124-BVdf-Fbv4-A8LD-HPrD-BlxT-G8qj', '4b89f23b-1f19-11e5-8104-00155d3a0124', 'c2267174-970e-11e4-9be0-005056be1f7c', '10', 'м'),
('4b89f23b-1f19-11e5-8104-00155d3a0124-BYkJ-FQaS-ASGG-HRYf-BZJS-GfAV', '4b89f23b-1f19-11e5-8104-00155d3a0124', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'зеркальный', ''),
('4dd1de14-f78e-11e3-8c8a-005056be1f7b-B4e3-FwhV-AjJ9-Hgib-BDTz-GGfR', '4dd1de14-f78e-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1900', 'г'),
('4dd1de14-f78e-11e3-8c8a-005056be1f7b-BfEm-FIFk-A95V-Hej5-BBQp-Gz5z', '4dd1de14-f78e-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'светло-серый', ''),
('4dd1de14-f78e-11e3-8c8a-005056be1f7b-BHKI-Fcpr-AXq9-HDg3-B3NC-Gg3i', '4dd1de14-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('4dd1de14-f78e-11e3-8c8a-005056be1f7b-BJAJ-FHDq-AA74-HDcw-Blm7-GZdh', '4dd1de14-f78e-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('4dd1de14-f78e-11e3-8c8a-005056be1f7b-BJKx-F1kW-A5fa-HECm-BSJx-Gbmc', '4dd1de14-f78e-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('4dd1de14-f78e-11e3-8c8a-005056be1f7b-BrJn-Fogn-AROq-HaiE-B5DJ-GhMO', '4dd1de14-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('4dd1de14-f78e-11e3-8c8a-005056be1f7b-BvXD-FLcG-AxuP-HkM3-BDV4-GNd7', '4dd1de14-f78e-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('4ed5aaa1-f789-11e3-8c8a-005056be1f7b-B8ZB-FJZz-A655-HVqq-BkQd-G3tX', '4ed5aaa1-f789-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый матовый', ''),
('4ed5aaa1-f789-11e3-8c8a-005056be1f7b-BGFR-FItG-A4vs-HGkC-BjwA-Gerc', '4ed5aaa1-f789-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('4ed5aaa1-f789-11e3-8c8a-005056be1f7b-BiBF-FdWv-AK8C-Hnzv-BBlM-GzTd', '4ed5aaa1-f789-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('4ed5aaa1-f789-11e3-8c8a-005056be1f7b-BM85-F6c4-ARJz-HD46-BOb8-GU6U', '4ed5aaa1-f789-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('4ed5aaa1-f789-11e3-8c8a-005056be1f7b-Bwbx-FsQX-Anbt-He9W-Br7v-GtFL', '4ed5aaa1-f789-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('4ed5aaa1-f789-11e3-8c8a-005056be1f7b-BX0m-FNDf-AJR8-HGm3-Bas8-Gr1r', '4ed5aaa1-f789-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('4ed5aaa1-f789-11e3-8c8a-005056be1f7b-Byuc-Fg1C-AiZz-Hi4h-BBRg-Gnej', '4ed5aaa1-f789-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '6000', 'г'),
('500c0ee4-4f2c-11de-8f53-000e0c431b58-BbZs-Frn9-A82w-HzPy-BBty-GoMC', '500c0ee4-4f2c-11de-8f53-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'огнебиозащитный состав', ''),
('500c0ee4-4f2c-11de-8f53-000e0c431b58-Be0n-FcOU-AB6W-H9CW-BDQy-GerU', '500c0ee4-4f2c-11de-8f53-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '5', 'л'),
('500c0ee4-4f2c-11de-8f53-000e0c431b58-BilL-FNUF-A8b9-HPri-BqB8-GHAE', '500c0ee4-4f2c-11de-8f53-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'РОГНЕДА', ''),
('500c0ee4-4f2c-11de-8f53-000e0c431b58-BOcb-Fag7-ArXQ-HOQQ-BNy2-GYBL', '500c0ee4-4f2c-11de-8f53-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('500c0ee4-4f2c-11de-8f53-000e0c431b58-BUZa-F9HH-AcWM-HEfQ-B1Ug-G3A9', '500c0ee4-4f2c-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('500c0ee4-4f2c-11de-8f53-000e0c431b58-BzQC-Fqbp-AkMp-Hs5u-BH4R-GPjb', '500c0ee4-4f2c-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('500c0ee6-4f2c-11de-8f53-000e0c431b58-B80j-Fe9B-A0l5-Hx3z-BvKi-GYgG', '500c0ee6-4f2c-11de-8f53-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'РОГНЕДА', ''),
('500c0ee6-4f2c-11de-8f53-000e0c431b58-BaVw-FUJp-AK5z-HtTW-Bzen-GfvA', '500c0ee6-4f2c-11de-8f53-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '10', 'л'),
('500c0ee6-4f2c-11de-8f53-000e0c431b58-BCpL-F5eF-AHT7-HTsR-BfIn-GSdw', '500c0ee6-4f2c-11de-8f53-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'огнебиозащитный состав', ''),
('500c0ee6-4f2c-11de-8f53-000e0c431b58-BdR4-F9FP-Apih-H0bf-Bm4y-GR68', '500c0ee6-4f2c-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('500c0ee6-4f2c-11de-8f53-000e0c431b58-BLQp-FQXg-A5L3-Hz4M-Bz1M-GYVL', '500c0ee6-4f2c-11de-8f53-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('500c0ee6-4f2c-11de-8f53-000e0c431b58-BStn-FWhw-AtiF-HG2n-ByV5-GrUA', '500c0ee6-4f2c-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('55c10657-f78e-11e3-8c8a-005056be1f7b-BD59-FnHI-AXm0-HIgC-Bg11-GxIS', '55c10657-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('55c10657-f78e-11e3-8c8a-005056be1f7b-BJb1-Fd0W-A71f-HHI8-BP5D-GXvZ', '55c10657-f78e-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1900', 'г'),
('55c10657-f78e-11e3-8c8a-005056be1f7b-BkQ6-FkqD-Asqk-HMKt-Be2v-G4CY', '55c10657-f78e-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'черный', ''),
('55c10657-f78e-11e3-8c8a-005056be1f7b-Bmsb-FT7d-AoAF-HPAS-BhDN-GgqV', '55c10657-f78e-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('55c10657-f78e-11e3-8c8a-005056be1f7b-BpD8-FoLe-ArsU-Hhgc-B1IL-GScH', '55c10657-f78e-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('55c10657-f78e-11e3-8c8a-005056be1f7b-BTyQ-FScy-AkIr-HNBU-BEml-G0MS', '55c10657-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('55c10657-f78e-11e3-8c8a-005056be1f7b-BvGI-F2VI-AJ4L-HWa3-BrF6-GpuH', '55c10657-f78e-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('56a6f723-ea03-11de-860d-000e0c431b58-BAz6-F5E5-AStm-Hu68-BV00-Ga2U', '56a6f723-ea03-11de-860d-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('56a6f723-ea03-11de-860d-000e0c431b58-BdOw-FG9r-AETq-HEti-BYaQ-GHpU', '56a6f723-ea03-11de-860d-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для обоев', ''),
('56a6f723-ea03-11de-860d-000e0c431b58-BECF-F2UQ-A2Yi-HVCa-Bi2f-GZgd', '56a6f723-ea03-11de-860d-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('56a6f723-ea03-11de-860d-000e0c431b58-BFXc-FwbM-AU1m-Hk8S-B5zo-G2TK', '56a6f723-ea03-11de-860d-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('56a6f723-ea03-11de-860d-000e0c431b58-BHej-FitL-ANn1-H4un-BdS7-GheZ', '56a6f723-ea03-11de-860d-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('56a6f723-ea03-11de-860d-000e0c431b58-BihV-FRKa-ASyb-HOlo-B5pp-GGxk', '56a6f723-ea03-11de-860d-000e0c431b58', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('56a6f723-ea03-11de-860d-000e0c431b58-Bqss-FPDu-Apml-HKBI-BoB8-Gj6C', '56a6f723-ea03-11de-860d-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '9', 'л'),
('56a6f723-ea03-11de-860d-000e0c431b58-BtDg-FnJ3-Aqex-HSL0-BDSe-Gn2N', '56a6f723-ea03-11de-860d-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('56a6f723-ea03-11de-860d-000e0c431b58-ByE1-Fp9k-ATb4-HP0Y-Bpsb-GLVk', '56a6f723-ea03-11de-860d-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('56f519d0-4f2c-11de-8f53-000e0c431b58-B6ip-F3Wu-AZMf-HSO4-ByyV-GESj', '56f519d0-4f2c-11de-8f53-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'фасадная особопрочная', ''),
('56f519d0-4f2c-11de-8f53-000e0c431b58-BDQy-FZyz-AZKW-Ha5J-BUbo-G2H6', '56f519d0-4f2c-11de-8f53-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('56f519d0-4f2c-11de-8f53-000e0c431b58-BFX1-FscN-AZkt-H1Zd-BtVC-GYNY', '56f519d0-4f2c-11de-8f53-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('56f519d0-4f2c-11de-8f53-000e0c431b58-BgCY-FP4x-AsmI-HuAW-BJJ0-Gvy5', '56f519d0-4f2c-11de-8f53-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '9', 'л'),
('56f519d0-4f2c-11de-8f53-000e0c431b58-BIuq-FObH-Ayw7-HxFh-B1u4-GBYf', '56f519d0-4f2c-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('56f519d0-4f2c-11de-8f53-000e0c431b58-BJml-Fo6z-Ahto-H4y8-Bc5U-GSmx', '56f519d0-4f2c-11de-8f53-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('56f519d0-4f2c-11de-8f53-000e0c431b58-BkbP-FdOB-AEQm-HFXr-BIfb-Gyu3', '56f519d0-4f2c-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('56f519d0-4f2c-11de-8f53-000e0c431b58-BoWK-Fomj-ADt3-Hxvk-BBlA-GGED', '56f519d0-4f2c-11de-8f53-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('56f519d0-4f2c-11de-8f53-000e0c431b58-BYZ7-FvDW-AvI0-HQYY-BHTt-GBrO', '56f519d0-4f2c-11de-8f53-000e0c431b58', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('56f519d0-4f2c-11de-8f53-000e0c431b58-BzZF-FdCB-ApnG-Hqak-BVz0-GSkC', '56f519d0-4f2c-11de-8f53-000e0c431b58', 'e765ba72-107d-11e3-8a5d-0050569a1080', 'база А', ''),
('58970c19-5a2d-11de-a649-000e0c431b58-B5rs-FdXx-AVcA-HkMG-BiNO-GAms', '58970c19-5a2d-11de-a649-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'герметик', ''),
('58970c19-5a2d-11de-a649-000e0c431b58-BBIc-FYey-ApI3-HZ14-B6nk-GMVK', '58970c19-5a2d-11de-a649-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.3', 'л'),
('58970c19-5a2d-11de-a649-000e0c431b58-BdGE-FxB3-AjtN-HSDt-B9xO-GqwC', '58970c19-5a2d-11de-a649-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('58970c19-5a2d-11de-a649-000e0c431b58-BDoL-FXKH-AmmT-H5yw-BrUs-GUgq', '58970c19-5a2d-11de-a649-000e0c431b58', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'силиконовая', ''),
('58970c19-5a2d-11de-a649-000e0c431b58-BJXp-F2sR-ADfX-HVVQ-BoEu-GrAg', '58970c19-5a2d-11de-a649-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KRASS', ''),
('58970c19-5a2d-11de-a649-000e0c431b58-BtdC-F7vG-Apu4-H5bp-B71S-GgSY', '58970c19-5a2d-11de-a649-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсальный', ''),
('58970c19-5a2d-11de-a649-000e0c431b58-Bter-F0ys-A1hC-HdCm-BKFQ-GVdb', '58970c19-5a2d-11de-a649-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'коричневый', ''),
('58970c19-5a2d-11de-a649-000e0c431b58-BxqQ-Frks-AWhi-HpE2-BENP-GuF8', '58970c19-5a2d-11de-a649-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('58970c19-5a2d-11de-a649-000e0c431b58-BZnk-FcGm-AEQs-HVmL-BwFS-G14T', '58970c19-5a2d-11de-a649-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('5ed5699a-f78e-11e3-8c8a-005056be1f7b-BB7I-FYrd-AyvJ-HUD0-BZXo-GMqL', '5ed5699a-f78e-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('5ed5699a-f78e-11e3-8c8a-005056be1f7b-BJrA-FPjr-AJJW-HvUZ-BDpg-GR1F', '5ed5699a-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('5ed5699a-f78e-11e3-8c8a-005056be1f7b-Bmot-Fa6W-A5fF-H3q4-Bjpl-GLCS', '5ed5699a-f78e-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'красно-коричневый', ''),
('5ed5699a-f78e-11e3-8c8a-005056be1f7b-Bu5w-FosK-AWBs-HvVg-BvWd-G5vK', '5ed5699a-f78e-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('5ed5699a-f78e-11e3-8c8a-005056be1f7b-BUGN-FKiD-Axr8-H4u6-BDWj-Gxxf', '5ed5699a-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('5ed5699a-f78e-11e3-8c8a-005056be1f7b-BUox-FShh-AOl5-HxYr-BShZ-GTx0', '5ed5699a-f78e-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('5ed5699a-f78e-11e3-8c8a-005056be1f7b-BXj7-Fh50-AhUX-HLhD-BXR8-GJ6q', '5ed5699a-f78e-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1900', 'г'),
('5fde6d12-f789-11e3-8c8a-005056be1f7b-B8SP-FVf2-A1fC-Hmth-BSLn-GAQP', '5fde6d12-f789-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'серебрянный', ''),
('5fde6d12-f789-11e3-8c8a-005056be1f7b-B8v3-FFFL-AIC6-HJjt-BqhB-G63g', '5fde6d12-f789-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('5fde6d12-f789-11e3-8c8a-005056be1f7b-BIIz-FQq5-AIRU-H10A-BjYr-G9Aa', '5fde6d12-f789-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '6000', 'г'),
('5fde6d12-f789-11e3-8c8a-005056be1f7b-BV2G-FRAq-AAqO-HBlG-BiY1-GlOM', '5fde6d12-f789-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('5fde6d12-f789-11e3-8c8a-005056be1f7b-BXm1-FUng-Ai5I-HhE2-BlZs-Gsqs', '5fde6d12-f789-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('5fde6d12-f789-11e3-8c8a-005056be1f7b-BxtC-FzWw-AXo8-HBpN-BRm9-GJsE', '5fde6d12-f789-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('5fde6d12-f789-11e3-8c8a-005056be1f7b-BYqY-FmsA-AtQZ-Hj3o-BvPR-Gmk6', '5fde6d12-f789-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('612d8834-6137-11e1-96bd-005056be3bd8-B2Ju-FjBK-AaoT-Hsta-BzCq-GkCo', '612d8834-6137-11e1-96bd-005056be3bd8', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый глянцевый', ''),
('612d8834-6137-11e1-96bd-005056be3bd8-BbOI-FoYC-AO5H-HQ8A-BoWO-GKyi', '612d8834-6137-11e1-96bd-005056be3bd8', '1d08380b-ce34-11e4-a80e-005056be1f7a', '900', 'г'),
('612d8834-6137-11e1-96bd-005056be3bd8-Bdan-FurE-ADnJ-HekQ-B69H-GzXW', '612d8834-6137-11e1-96bd-005056be3bd8', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('612d8834-6137-11e1-96bd-005056be3bd8-BLcg-FyWW-AUGC-HGW2-B5zR-Gik0', '612d8834-6137-11e1-96bd-005056be3bd8', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('612d8834-6137-11e1-96bd-005056be3bd8-Bmon-FvIN-ACEM-HJ4j-BfEC-GC4Y', '612d8834-6137-11e1-96bd-005056be3bd8', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для радиаторов', ''),
('612d8834-6137-11e1-96bd-005056be3bd8-BnGA-FCAc-AsdA-HYbp-B6Sz-Gp21', '612d8834-6137-11e1-96bd-005056be3bd8', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('612d8834-6137-11e1-96bd-005056be3bd8-BSPu-FA8D-AEVY-H4cp-Bciq-G9og', '612d8834-6137-11e1-96bd-005056be3bd8', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('612d8834-6137-11e1-96bd-005056be3bd8-BY15-FZPV-AEKn-H4zf-Bupw-GPzx', '612d8834-6137-11e1-96bd-005056be3bd8', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсальное', ''),
('612d8834-6137-11e1-96bd-005056be3bd8-BZNf-FbU2-ATPr-HkxR-Bka6-GOME', '612d8834-6137-11e1-96bd-005056be3bd8', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('612d8834-6137-11e1-96bd-005056be3bd8-BzRe-FJAO-Ak1Q-HRaT-B7Ea-G7Hb', '612d8834-6137-11e1-96bd-005056be3bd8', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('61fa79ff-168f-11e1-8cc1-001cc494be80-B0xG-F7oG-AwJG-Hts8-BBOi-GyN3', '61fa79ff-168f-11e1-8cc1-001cc494be80', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'скотч противоскольжения', ''),
('61fa79ff-168f-11e1-8cc1-001cc494be80-B9HD-F2U9-Aueb-HsXL-BwJc-G6ei', '61fa79ff-168f-11e1-8cc1-001cc494be80', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('61fa79ff-168f-11e1-8cc1-001cc494be80-Bglw-F9UJ-AKHT-HmDx-BL1X-G3Jt', '61fa79ff-168f-11e1-8cc1-001cc494be80', '0e31c585-9718-11e4-9be0-005056be1f7c', '0.05', 'м'),
('61fa79ff-168f-11e1-8cc1-001cc494be80-BwQJ-FUG2-AFIf-HwaV-BAzN-Go4n', '61fa79ff-168f-11e1-8cc1-001cc494be80', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('61fa79ff-168f-11e1-8cc1-001cc494be80-Bxjr-FSWH-AoW7-H2A1-Be08-Gi1R', '61fa79ff-168f-11e1-8cc1-001cc494be80', 'c2267174-970e-11e4-9be0-005056be1f7c', '5', 'м'),
('61fa79ff-168f-11e1-8cc1-001cc494be80-BZ2o-FEaT-ANZ3-HM54-BKd9-G3tE', '61fa79ff-168f-11e1-8cc1-001cc494be80', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('6315f6f2-5855-11e1-830a-005056be3bd8-B9vF-FuFd-Aw9q-HcYV-Bq23-GeYd', '6315f6f2-5855-11e1-830a-005056be3bd8', 'c2267174-970e-11e4-9be0-005056be1f7c', '10', 'м'),
('6315f6f2-5855-11e1-830a-005056be3bd8-Bdgy-Fgk4-AE4j-HoEs-BJq5-G0DT', '6315f6f2-5855-11e1-830a-005056be3bd8', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('6315f6f2-5855-11e1-830a-005056be3bd8-BdwB-FKPZ-Ag6R-HYap-B2zJ-GOxR', '6315f6f2-5855-11e1-830a-005056be3bd8', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'двухсторонний скотч', ''),
('6315f6f2-5855-11e1-830a-005056be3bd8-BjC2-Fd5b-ADVu-HLIV-BYxm-GlPi', '6315f6f2-5855-11e1-830a-005056be3bd8', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('6315f6f2-5855-11e1-830a-005056be3bd8-BmM1-FWY9-Arww-HUXB-B3Nq-GZoN', '6315f6f2-5855-11e1-830a-005056be3bd8', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'зеркальный', ''),
('6315f6f2-5855-11e1-830a-005056be3bd8-BoRM-Fb6O-AZ9l-H2ha-BE0M-GdeO', '6315f6f2-5855-11e1-830a-005056be3bd8', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'вспененная', ''),
('6315f6f2-5855-11e1-830a-005056be3bd8-BYdX-F9Hb-AqRI-HlQL-B5P8-G0AC', '6315f6f2-5855-11e1-830a-005056be3bd8', '0e31c585-9718-11e4-9be0-005056be1f7c', '0.025', 'м'),
('6315f6f2-5855-11e1-830a-005056be3bd8-Bzog-FbgE-A2lD-HEFh-BSpk-GKIe', '6315f6f2-5855-11e1-830a-005056be3bd8', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('67c85be4-6208-11de-9531-000e0c431b58-B8nq-FwW0-AJMe-HwrP-Bxt5-G9oZ', '67c85be4-6208-11de-9531-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('67c85be4-6208-11de-9531-000e0c431b58-B9hI-FqJE-Az0o-Hrqd-BOFm-GJEw', '67c85be4-6208-11de-9531-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'огнебиозащитный состав', ''),
('67c85be4-6208-11de-9531-000e0c431b58-BEvt-FAFb-ASlk-H64E-Bs1r-GYnE', '67c85be4-6208-11de-9531-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('67c85be4-6208-11de-9531-000e0c431b58-Botz-FPpt-ATXj-HBvM-BGK0-GXEj', '67c85be4-6208-11de-9531-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'РОГНЕДА', ''),
('67c85be4-6208-11de-9531-000e0c431b58-BWM7-FFQR-Actr-Hl6I-B1k3-Gqzh', '67c85be4-6208-11de-9531-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('67c85be4-6208-11de-9531-000e0c431b58-BYwR-F4j0-AIWs-HDVX-BdaJ-GMaO', '67c85be4-6208-11de-9531-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'с индикатором', ''),
('67c85be4-6208-11de-9531-000e0c431b58-BZI5-F9Jq-ALQ1-HLn5-Bv0H-GrEY', '67c85be4-6208-11de-9531-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '10', 'л'),
('67c85be6-6208-11de-9531-000e0c431b58-B0N8-FVMA-ArQQ-Hfv9-B1MX-Gi4B', '67c85be6-6208-11de-9531-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('67c85be6-6208-11de-9531-000e0c431b58-B2lE-FhMU-AZBM-Hlwj-BEzf-GyiT', '67c85be6-6208-11de-9531-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'огнебиозащитный состав', ''),
('67c85be6-6208-11de-9531-000e0c431b58-B8Zw-FO6h-AMvu-HjUo-Bl3f-GdLN', '67c85be6-6208-11de-9531-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'с индикатором', ''),
('67c85be6-6208-11de-9531-000e0c431b58-BD7t-Fsy7-AGMH-H3Wg-BjDH-GDfS', '67c85be6-6208-11de-9531-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '5', 'л'),
('67c85be6-6208-11de-9531-000e0c431b58-Bh23-FTrI-AIs3-H7XF-B0WS-G8rf', '67c85be6-6208-11de-9531-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('67c85be6-6208-11de-9531-000e0c431b58-BmU6-FeQS-AjQp-H3NX-BXKw-GJYr', '67c85be6-6208-11de-9531-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'РОГНЕДА', ''),
('67c85be6-6208-11de-9531-000e0c431b58-Brld-FbLy-AFwq-HlP3-By3M-GuWc', '67c85be6-6208-11de-9531-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('680965ab-f789-11e3-8c8a-005056be1f7b-B8Tj-FPZx-AOsm-HABV-BMe7-G2VL', '680965ab-f789-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('680965ab-f789-11e3-8c8a-005056be1f7b-Bdlp-F2O2-AMHs-HcAu-BlIr-G8HF', '680965ab-f789-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('680965ab-f789-11e3-8c8a-005056be1f7b-BH8V-F0YA-AMdR-HFN0-BTzv-GSsL', '680965ab-f789-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('680965ab-f789-11e3-8c8a-005056be1f7b-Blv0-F4aK-A3dY-HnLU-B31Q-G3CI', '680965ab-f789-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('680965ab-f789-11e3-8c8a-005056be1f7b-Bo60-FL3O-A6M2-HboM-BFR4-GtsN', '680965ab-f789-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('680965ab-f789-11e3-8c8a-005056be1f7b-BtiT-FbAU-ALmc-H4jk-B0h5-GiwT', '680965ab-f789-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('680965ab-f789-11e3-8c8a-005056be1f7b-BWAC-F0BE-AUNi-HRF5-Bdyc-GxPd', '680965ab-f789-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '20000', 'г'),
('727c8145-f789-11e3-8c8a-005056be1f7b-Bcjl-FkBt-A979-Hx9x-B9qy-Gck6', '727c8145-f789-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('727c8145-f789-11e3-8c8a-005056be1f7b-BgjO-FF2T-A0UI-HcHX-B6Pz-GBzK', '727c8145-f789-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('727c8145-f789-11e3-8c8a-005056be1f7b-BHbG-FkUp-ALTM-HF30-BZP0-GcOB', '727c8145-f789-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый матовый', ''),
('727c8145-f789-11e3-8c8a-005056be1f7b-BpOa-Fk62-AE5u-HIdO-BNwp-GQD6', '727c8145-f789-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '20000', 'г'),
('727c8145-f789-11e3-8c8a-005056be1f7b-BrAe-F5GW-A4gl-H491-B5eZ-GIjQ', '727c8145-f789-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('727c8145-f789-11e3-8c8a-005056be1f7b-BSbC-FQPA-AEOq-H4qR-Byfv-GQ7I', '727c8145-f789-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('727c8145-f789-11e3-8c8a-005056be1f7b-Bzeb-FbXZ-ARR5-Hrae-B94D-GjdF', '727c8145-f789-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('747ef690-551c-11dc-beb4-000e0c431b58-B9z9-FSFh-A7xJ-H6E9-BwV3-GSoS', '747ef690-551c-11dc-beb4-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('747ef690-551c-11dc-beb4-000e0c431b58-BHvp-FRru-APeF-HHwu-Baia-Gu8H', '747ef690-551c-11dc-beb4-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('747ef690-551c-11dc-beb4-000e0c431b58-BI38-FlKD-Af1U-HQin-Bsm0-GRy2', '747ef690-551c-11dc-beb4-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый матовый', ''),
('747ef690-551c-11dc-beb4-000e0c431b58-Bncv-FP5U-AMg2-H9Gq-BzNc-GfeJ', '747ef690-551c-11dc-beb4-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('747ef690-551c-11dc-beb4-000e0c431b58-BPun-FV3a-AGS9-HgC7-BoqY-Ga7T', '747ef690-551c-11dc-beb4-000e0c431b58', '1d08380b-ce34-11e4-a80e-005056be1f7a', '2000', 'г'),
('747ef690-551c-11dc-beb4-000e0c431b58-BQ4g-FTac-ABBo-HBjF-B8s8-G5UI', '747ef690-551c-11dc-beb4-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('747ef690-551c-11dc-beb4-000e0c431b58-BvqT-FZr4-Aeom-Hci7-Blgv-Gkz2', '747ef690-551c-11dc-beb4-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('77c5eb9b-4b14-11e1-bd83-001cc494be80-B2R4-FiJA-AFgd-HHXz-BIzd-GLFx', '77c5eb9b-4b14-11e1-bd83-001cc494be80', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'герметик', ''),
('77c5eb9b-4b14-11e1-bd83-001cc494be80-B57d-FZXj-AHWb-H2km-BN8L-GMyf', '77c5eb9b-4b14-11e1-bd83-001cc494be80', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KRASS', ''),
('77c5eb9b-4b14-11e1-bd83-001cc494be80-BbnD-FQTb-Au3u-HJ6d-B7hS-GGl0', '77c5eb9b-4b14-11e1-bd83-001cc494be80', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для паркета', ''),
('77c5eb9b-4b14-11e1-bd83-001cc494be80-BKAR-FXdi-ASkf-HbGr-B93u-GNKW', '77c5eb9b-4b14-11e1-bd83-001cc494be80', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('77c5eb9b-4b14-11e1-bd83-001cc494be80-BmzJ-FDqu-Aq5r-H2Gg-BXdC-G2WA', '77c5eb9b-4b14-11e1-bd83-001cc494be80', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.3', 'л'),
('77c5eb9b-4b14-11e1-bd83-001cc494be80-BvCP-FSmI-AXmf-HvKz-BoWu-GG3m', '77c5eb9b-4b14-11e1-bd83-001cc494be80', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'венге', ''),
('77c5eb9b-4b14-11e1-bd83-001cc494be80-BWge-F39j-ARCz-HqYd-BjSZ-GCsx', '77c5eb9b-4b14-11e1-bd83-001cc494be80', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('77c5eb9b-4b14-11e1-bd83-001cc494be80-BWi9-F2UJ-Ar9g-HcFY-BEQY-GVn3', '77c5eb9b-4b14-11e1-bd83-001cc494be80', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('78e43dfb-fbee-11e1-8f72-005056be3bd8-B4Ov-FI0K-A5Y4-HCz5-BwnU-GoKp', '78e43dfb-fbee-11e1-8f72-005056be3bd8', 'e8287600-ad96-11e3-b114-005056be1f7c', 'РОГНЕДА', ''),
('78e43dfb-fbee-11e1-8f72-005056be3bd8-Bmr8-F0c2-AGiB-H4YP-BqSe-Gcbd', '78e43dfb-fbee-11e1-8f72-005056be3bd8', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('78e43dfb-fbee-11e1-8f72-005056be3bd8-BnW3-FgYr-AaLV-Hvzf-BacN-GXbp', '78e43dfb-fbee-11e1-8f72-005056be3bd8', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '20', 'л'),
('78e43dfb-fbee-11e1-8f72-005056be3bd8-BPhO-FQbn-AfI6-HAkX-BdNt-GVtH', '78e43dfb-fbee-11e1-8f72-005056be3bd8', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'антисептический состав', ''),
('78e43dfb-fbee-11e1-8f72-005056be3bd8-BPrt-FE0D-AA9P-HuZv-BZsH-GaBu', '78e43dfb-fbee-11e1-8f72-005056be3bd8', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('78e43dfb-fbee-11e1-8f72-005056be3bd8-Bya3-FgU8-AhRX-Hu5G-BGJx-G1Ow', '78e43dfb-fbee-11e1-8f72-005056be3bd8', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('7a3c5db1-777c-11de-9531-000e0c431b58-B7Km-FhSg-AvMw-HHrU-B5th-GTEX', '7a3c5db1-777c-11de-9531-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('7a3c5db1-777c-11de-9531-000e0c431b58-BBNY-FV1W-AUvz-H8Qq-BJGR-GspJ', '7a3c5db1-777c-11de-9531-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('7a3c5db1-777c-11de-9531-000e0c431b58-Beok-FYiU-AtWt-HSp6-BkVo-Gamw', '7a3c5db1-777c-11de-9531-000e0c431b58', 'e765ba72-107d-11e3-8a5d-0050569a1080', 'база С', ''),
('7a3c5db1-777c-11de-9531-000e0c431b58-BfxU-FyOJ-AMCo-H99o-BGV1-GuOh', '7a3c5db1-777c-11de-9531-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для водно-дисперсионных красок', ''),
('7a3c5db1-777c-11de-9531-000e0c431b58-BmS2-Fotb-AZzx-Hnvr-BdRf-GxGt', '7a3c5db1-777c-11de-9531-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('7a3c5db1-777c-11de-9531-000e0c431b58-BpYI-FfWZ-AMfg-HdNM-BnKW-GPso', '7a3c5db1-777c-11de-9531-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('7a3c5db1-777c-11de-9531-000e0c431b58-Bqt1-FQI6-Afy6-HS7X-BKw8-GWpS', '7a3c5db1-777c-11de-9531-000e0c431b58', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('7a3c5db1-777c-11de-9531-000e0c431b58-Bwd2-Filj-A4fS-HayX-Bxew-G7AI', '7a3c5db1-777c-11de-9531-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '9', 'л'),
('7a3c5db1-777c-11de-9531-000e0c431b58-BWIk-FRag-AplT-Hm99-B6dn-Gf2L', '7a3c5db1-777c-11de-9531-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('7a3c5db1-777c-11de-9531-000e0c431b58-BWMn-F3q2-AETC-Haju-BFWO-G75z', '7a3c5db1-777c-11de-9531-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для стен', ''),
('7a3c5db1-777c-11de-9531-000e0c431b58-Bzki-Fj3O-Aeck-HI4N-B5QW-Gfhx', '7a3c5db1-777c-11de-9531-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('7a3c5db3-777c-11de-9531-000e0c431b58-B1jL-F3UI-A0S4-H5tV-ByZj-GSLS', '7a3c5db3-777c-11de-9531-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('7a3c5db3-777c-11de-9531-000e0c431b58-B4ib-FdFt-AHTB-Hu7G-B8u5-Gbc5', '7a3c5db3-777c-11de-9531-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для стен', ''),
('7a3c5db3-777c-11de-9531-000e0c431b58-B5gw-Fd8o-AeRp-H5Um-BzC4-GOZa', '7a3c5db3-777c-11de-9531-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('7a3c5db3-777c-11de-9531-000e0c431b58-BA0Y-FwjL-AsQ4-HLuE-Bk3t-GSpT', '7a3c5db3-777c-11de-9531-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('7a3c5db3-777c-11de-9531-000e0c431b58-BHpr-FxjC-AaZF-HTne-BuNm-GHEr', '7a3c5db3-777c-11de-9531-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('7a3c5db3-777c-11de-9531-000e0c431b58-BjIW-F2E4-A5rw-Hkx6-Brrc-GdLZ', '7a3c5db3-777c-11de-9531-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('7a3c5db3-777c-11de-9531-000e0c431b58-BpNe-FvtX-Ahik-HZFO-Bq0w-GHc3', '7a3c5db3-777c-11de-9531-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для водно-дисперсионных красок', ''),
('7a3c5db3-777c-11de-9531-000e0c431b58-BsQY-FWgU-At7S-H7gD-Bm3p-GGJG', '7a3c5db3-777c-11de-9531-000e0c431b58', 'e765ba72-107d-11e3-8a5d-0050569a1080', 'база С', ''),
('7a3c5db3-777c-11de-9531-000e0c431b58-BUFs-FaZW-A5Kj-HhRn-BOSn-GmFN', '7a3c5db3-777c-11de-9531-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('7a3c5db3-777c-11de-9531-000e0c431b58-BWld-FRby-AWpj-Hb3A-BUAa-GC86', '7a3c5db3-777c-11de-9531-000e0c431b58', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('7a3c5db3-777c-11de-9531-000e0c431b58-Byye-Fr0O-AvkG-Hf3v-ByN2-GhnR', '7a3c5db3-777c-11de-9531-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '5', 'л'),
('7a3c5db5-777c-11de-9531-000e0c431b58-B8NQ-FC7C-AK5s-H0Xe-BsAo-G8G9', '7a3c5db5-777c-11de-9531-000e0c431b58', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('7a3c5db5-777c-11de-9531-000e0c431b58-BbAc-FSXj-ANrF-HSBB-BSCI-GKaW', '7a3c5db5-777c-11de-9531-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('7a3c5db5-777c-11de-9531-000e0c431b58-BBG2-FXO9-AbQU-HWHq-BJKf-Ggab', '7a3c5db5-777c-11de-9531-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'фасадная особопрочная', ''),
('7a3c5db5-777c-11de-9531-000e0c431b58-BBVC-FoDv-A6dm-HETs-BYkE-GKUx', '7a3c5db5-777c-11de-9531-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('7a3c5db5-777c-11de-9531-000e0c431b58-BDyW-FQ75-AjB2-HXG6-BTgE-GT70', '7a3c5db5-777c-11de-9531-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('7a3c5db5-777c-11de-9531-000e0c431b58-BI2m-FdOu-AJX5-Hp5V-BGVV-Gjos', '7a3c5db5-777c-11de-9531-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('7a3c5db5-777c-11de-9531-000e0c431b58-BI2Z-FOKa-APcd-HXn4-Buvu-GWO0', '7a3c5db5-777c-11de-9531-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '9', 'л'),
('7a3c5db5-777c-11de-9531-000e0c431b58-BQ3y-F92M-AdjM-HHhT-BF7x-GFE7', '7a3c5db5-777c-11de-9531-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('7a3c5db5-777c-11de-9531-000e0c431b58-BYeA-FHJT-AFDA-Hvru-B8o8-GNr4', '7a3c5db5-777c-11de-9531-000e0c431b58', 'e765ba72-107d-11e3-8a5d-0050569a1080', 'база С', ''),
('7a3c5db5-777c-11de-9531-000e0c431b58-BZJ0-FZ5r-AK3W-HIGD-BCW6-G1Vx', '7a3c5db5-777c-11de-9531-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('7a3c5db7-777c-11de-9531-000e0c431b58-B9OT-FFuD-AYsB-HSUj-BOd1-Gglh', '7a3c5db7-777c-11de-9531-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('7a3c5db7-777c-11de-9531-000e0c431b58-BC2g-FLYL-ACZB-HNCX-BLAl-GeFW', '7a3c5db7-777c-11de-9531-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'фасадная особопрочная', ''),
('7a3c5db7-777c-11de-9531-000e0c431b58-BF9i-F99G-Acep-Hyia-BiwO-GrCQ', '7a3c5db7-777c-11de-9531-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '5', 'л'),
('7a3c5db7-777c-11de-9531-000e0c431b58-BidE-FjwZ-AIA3-H0he-BgjV-GDvu', '7a3c5db7-777c-11de-9531-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('7a3c5db7-777c-11de-9531-000e0c431b58-BJRS-FIqg-AP0I-Hho2-BA1L-GnV8', '7a3c5db7-777c-11de-9531-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('7a3c5db7-777c-11de-9531-000e0c431b58-BLTm-FfwU-A3VH-HgtT-B985-Gli6', '7a3c5db7-777c-11de-9531-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('7a3c5db7-777c-11de-9531-000e0c431b58-BnJP-FFTb-AXCs-HoT8-B5qp-GotM', '7a3c5db7-777c-11de-9531-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('7a3c5db7-777c-11de-9531-000e0c431b58-BNln-FkBh-AtW0-HYNH-BTmR-Gosd', '7a3c5db7-777c-11de-9531-000e0c431b58', 'e765ba72-107d-11e3-8a5d-0050569a1080', 'база С', ''),
('7a3c5db7-777c-11de-9531-000e0c431b58-BOxJ-FPBL-AnNM-HOsS-BlQv-Gq1i', '7a3c5db7-777c-11de-9531-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('7a3c5db7-777c-11de-9531-000e0c431b58-BYKV-FFMg-AlIT-HcsW-Bjwn-GYMc', '7a3c5db7-777c-11de-9531-000e0c431b58', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('7ab6caa7-b1ee-11e0-aa21-000e0c431b58-B33L-FfDZ-A5DB-HAUu-B19M-GBpY', '7ab6caa7-b1ee-11e0-aa21-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '10', 'л'),
('7ab6caa7-b1ee-11e0-aa21-000e0c431b58-BBEJ-FKDy-A6on-HLOZ-B0lG-GRtz', '7ab6caa7-b1ee-11e0-aa21-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'PARADE', ''),
('7ab6caa7-b1ee-11e0-aa21-000e0c431b58-BKf9-F7hw-A6dv-HCDk-BlrA-GLDQ', '7ab6caa7-b1ee-11e0-aa21-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('7ab6caa7-b1ee-11e0-aa21-000e0c431b58-Bnak-FVPH-AgTp-HK2Q-B9rt-G6lm', '7ab6caa7-b1ee-11e0-aa21-000e0c431b58', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('7ab6caa7-b1ee-11e0-aa21-000e0c431b58-BncL-FqMs-AxLi-HdvY-B5xc-GE8g', '7ab6caa7-b1ee-11e0-aa21-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('7ab6caa7-b1ee-11e0-aa21-000e0c431b58-BRNG-FSOa-ADFZ-HPHE-Bn2h-GOKd', '7ab6caa7-b1ee-11e0-aa21-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'спецгрунт', ''),
('7ab6caa7-b1ee-11e0-aa21-000e0c431b58-BTjk-F0ub-APsJ-H9ou-BlzQ-Gjvy', '7ab6caa7-b1ee-11e0-aa21-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('7ab6caa7-b1ee-11e0-aa21-000e0c431b58-Buck-FT7W-Ar2J-HK6G-Bqx0-G2TC', '7ab6caa7-b1ee-11e0-aa21-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'не профессиональная (без пистолета)', ''),
('7ab6caa7-b1ee-11e0-aa21-000e0c431b58-BWrS-FItV-AsVD-HthG-B01q-Gjza', '7ab6caa7-b1ee-11e0-aa21-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('7c1e70d5-5a9d-11dc-be42-000e0c431b58-BEWj-FL30-AFoC-Hg7s-BkL0-Gib7', '7c1e70d5-5a9d-11dc-be42-000e0c431b58', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1000', 'г'),
('7c1e70d5-5a9d-11dc-be42-000e0c431b58-BiBb-FJXj-AglR-HxD2-BKwY-GpLm', '7c1e70d5-5a9d-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый матовый', ''),
('7c1e70d5-5a9d-11dc-be42-000e0c431b58-BK2C-FBqW-ADHG-Hfa5-BwDa-GRpE', '7c1e70d5-5a9d-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('7c1e70d5-5a9d-11dc-be42-000e0c431b58-Bngf-Fln9-Am40-HolL-BE33-GFbW', '7c1e70d5-5a9d-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('7c1e70d5-5a9d-11dc-be42-000e0c431b58-BPR9-FP7j-AaBc-HSG4-BpRv-GrSb', '7c1e70d5-5a9d-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('7c1e70d5-5a9d-11dc-be42-000e0c431b58-BRrB-FieE-Aap2-HyUC-Bbuc-GSxQ', '7c1e70d5-5a9d-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('7c1e70d5-5a9d-11dc-be42-000e0c431b58-BZZ2-FDyU-AtO9-HHcA-BPBC-GrLZ', '7c1e70d5-5a9d-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('7e531df3-b5f5-11e1-83ba-005056be3bd8-B3sN-F0rm-AnWZ-Hc29-BaWK-Gxur', '7e531df3-b5f5-11e1-83ba-005056be3bd8', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'прозрачный', ''),
('7e531df3-b5f5-11e1-83ba-005056be3bd8-BfMW-FXg8-AxJn-HOrF-BsVt-GcYp', '7e531df3-b5f5-11e1-83ba-005056be3bd8', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('7e531df3-b5f5-11e1-83ba-005056be3bd8-Bnou-FD6a-AUiG-H9Yn-Bpxz-Gej9', '7e531df3-b5f5-11e1-83ba-005056be3bd8', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('7e531df3-b5f5-11e1-83ba-005056be3bd8-BrcF-FH67-AFWS-HQJD-B95k-GzSX', '7e531df3-b5f5-11e1-83ba-005056be3bd8', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('7e531df3-b5f5-11e1-83ba-005056be3bd8-Buh2-FYwi-Ade4-HM8S-B21A-GFzs', '7e531df3-b5f5-11e1-83ba-005056be3bd8', 'e8287600-ad96-11e3-b114-005056be1f7c', 'COSMOFEN', ''),
('7e531df3-b5f5-11e1-83ba-005056be3bd8-BV1P-FoHZ-ArFT-HS6m-BpTY-GilW', '7e531df3-b5f5-11e1-83ba-005056be3bd8', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'очиститель', ''),
('7e531df3-b5f5-11e1-83ba-005056be3bd8-BYv3-FS9z-Ak1p-Hk6f-BTn9-GYu4', '7e531df3-b5f5-11e1-83ba-005056be3bd8', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '1', 'л'),
('7ff8df4e-f789-11e3-8c8a-005056be1f7b-BH5y-FLgH-AKb5-HPai-B5HW-Gzk9', '7ff8df4e-f789-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('7ff8df4e-f789-11e3-8c8a-005056be1f7b-BnFn-FyFw-A5YE-H4eg-BZtJ-GW2B', '7ff8df4e-f789-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('7ff8df4e-f789-11e3-8c8a-005056be1f7b-Boac-FsT8-APsq-HZFi-BayG-GODs', '7ff8df4e-f789-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '20000', 'г'),
('7ff8df4e-f789-11e3-8c8a-005056be1f7b-BOm8-FI2X-Aqwf-HDmF-BCAl-GZcR', '7ff8df4e-f789-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('7ff8df4e-f789-11e3-8c8a-005056be1f7b-Bqy6-Fdmi-A6YC-HK2L-Bp7W-Gx5S', '7ff8df4e-f789-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'серебрянный', ''),
('7ff8df4e-f789-11e3-8c8a-005056be1f7b-Btix-FPla-AUoa-H7D4-BNr9-G2gE', '7ff8df4e-f789-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('7ff8df4e-f789-11e3-8c8a-005056be1f7b-BYfX-FbqO-AnVL-H0JF-BSR0-GGcf', '7ff8df4e-f789-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('82ebcce8-bce7-11e4-a1f3-005056be1f7b-B0q5-Fgwr-AZvX-HVwe-BLzX-GQ6L', '82ebcce8-bce7-11e4-a1f3-005056be1f7b', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для ржавчины', ''),
('82ebcce8-bce7-11e4-a1f3-005056be1f7b-B3HR-FIWL-AOmE-Hfnk-BY4D-GzW4', '82ebcce8-bce7-11e4-a1f3-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('82ebcce8-bce7-11e4-a1f3-005056be1f7b-B4DC-Fb4B-AvPD-H6x4-B4pA-GKyX', '82ebcce8-bce7-11e4-a1f3-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('82ebcce8-bce7-11e4-a1f3-005056be1f7b-BB1L-FxwU-ASUQ-HO4F-BQ4R-GBg4', '82ebcce8-bce7-11e4-a1f3-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'серебристый', ''),
('82ebcce8-bce7-11e4-a1f3-005056be1f7b-BC3F-FGy4-A0ri-HA3X-BXOZ-GWp8', '82ebcce8-bce7-11e4-a1f3-005056be1f7b', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '10', 'л'),
('82ebcce8-bce7-11e4-a1f3-005056be1f7b-BJ63-Fs6v-AFTA-Heqp-BcqW-GXMI', '82ebcce8-bce7-11e4-a1f3-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'молотковая эмаль-грунт', ''),
('82ebcce8-bce7-11e4-a1f3-005056be1f7b-BPca-FczD-ArIi-Hz0T-BWBK-Ghz8', '82ebcce8-bce7-11e4-a1f3-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('82ebcce8-bce7-11e4-a1f3-005056be1f7b-BWC0-Fain-AB8g-HFw3-B9q7-GAHz', '82ebcce8-bce7-11e4-a1f3-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('8522912f-f3fb-11e4-9746-005056be1f7b-BAMz-FUN5-AETp-H1ie-BSUF-G5ra', '8522912f-f3fb-11e4-9746-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('8522912f-f3fb-11e4-9746-005056be1f7b-Be1i-Fi0O-AK3U-HAEt-BGvv-GOyc', '8522912f-f3fb-11e4-9746-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('8522912f-f3fb-11e4-9746-005056be1f7b-BHdf-F0dN-A6a7-HDMA-BZ3H-GEOG', '8522912f-f3fb-11e4-9746-005056be1f7b', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для ржавчины', ''),
('8522912f-f3fb-11e4-9746-005056be1f7b-BqBI-FDqi-AwJk-Ht2d-BmET-GCkD', '8522912f-f3fb-11e4-9746-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'синий', ''),
('8522912f-f3fb-11e4-9746-005056be1f7b-BqHp-FV9N-AzQi-H6LQ-BViz-Gtci', '8522912f-f3fb-11e4-9746-005056be1f7b', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '10', 'л'),
('8522912f-f3fb-11e4-9746-005056be1f7b-BSEW-F10i-AHUG-H7Dj-BeLD-G0Kh', '8522912f-f3fb-11e4-9746-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'грунт-эмаль', ''),
('8522912f-f3fb-11e4-9746-005056be1f7b-Bwll-FXVc-A18g-HKAH-BNe9-GvC8', '8522912f-f3fb-11e4-9746-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('8522912f-f3fb-11e4-9746-005056be1f7b-BXiX-F4tY-AB73-H0s6-B7sI-GwDV', '8522912f-f3fb-11e4-9746-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('897bb5a6-b0fa-11e3-b34d-005056be1f7b-B0j8-FJr7-A4Em-HQvY-BgaK-GR3H', '897bb5a6-b0fa-11e3-b34d-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '0,7', 'г'),
('897bb5a6-b0fa-11e3-b34d-005056be1f7b-B8AA-FSwu-AFCa-HOr3-BmvM-G21O', '897bb5a6-b0fa-11e3-b34d-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'PARADE', ''),
('897bb5a6-b0fa-11e3-b34d-005056be1f7b-BETP-FFCe-AQzh-HxQu-BEBM-GTGE', '897bb5a6-b0fa-11e3-b34d-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('897bb5a6-b0fa-11e3-b34d-005056be1f7b-Bpvu-Fb8H-ADX1-Hx3d-Bbsu-GE54', '897bb5a6-b0fa-11e3-b34d-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'растворитель', ''),
('897bb5a6-b0fa-11e3-b34d-005056be1f7b-BqoS-FG30-A0ev-HLWm-Bast-Geno', '897bb5a6-b0fa-11e3-b34d-005056be1f7b', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для эмали', ''),
('897bb5a6-b0fa-11e3-b34d-005056be1f7b-BvcP-FE2o-A57U-Hvuw-BQpI-GocX', '897bb5a6-b0fa-11e3-b34d-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('897bb5a6-b0fa-11e3-b34d-005056be1f7b-BWHE-F55U-Ao9W-H2Sc-B6Pd-G6iP', '897bb5a6-b0fa-11e3-b34d-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('897bb5a6-b0fa-11e3-b34d-005056be1f7b-BzRm-FMI5-AoDK-HI0t-BXpX-GqwP', '897bb5a6-b0fa-11e3-b34d-005056be1f7b', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для краски', ''),
('89cb1aab-b1c3-11e0-aa21-000e0c431b58-B1d8-F44O-A5Vw-HCy9-B60H-Gjzj', '89cb1aab-b1c3-11e0-aa21-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'спецгрунт', ''),
('89cb1aab-b1c3-11e0-aa21-000e0c431b58-B3pF-FOeJ-AJ8Y-HnsQ-B96Y-GqGO', '89cb1aab-b1c3-11e0-aa21-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('89cb1aab-b1c3-11e0-aa21-000e0c431b58-B9cc-FWrO-AyuW-HzD5-BcPe-Gu2U', '89cb1aab-b1c3-11e0-aa21-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('89cb1aab-b1c3-11e0-aa21-000e0c431b58-BBdc-FBJT-A3KC-HaRA-BchI-GcM4', '89cb1aab-b1c3-11e0-aa21-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '2.5', 'л'),
('89cb1aab-b1c3-11e0-aa21-000e0c431b58-BLIn-FzcE-AkAr-HzhK-BEio-Ghkx', '89cb1aab-b1c3-11e0-aa21-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'не профессиональная (без пистолета)', ''),
('89cb1aab-b1c3-11e0-aa21-000e0c431b58-BLjR-Fm1b-APW9-HszL-B4FM-Gwjm', '89cb1aab-b1c3-11e0-aa21-000e0c431b58', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('89cb1aab-b1c3-11e0-aa21-000e0c431b58-BMHr-FL1g-AWum-HigL-BLeo-Go2V', '89cb1aab-b1c3-11e0-aa21-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('89cb1aab-b1c3-11e0-aa21-000e0c431b58-BNc9-FzBf-AAM0-Hp22-BBth-GG8C', '89cb1aab-b1c3-11e0-aa21-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'PARADE', ''),
('89cb1aab-b1c3-11e0-aa21-000e0c431b58-BQHA-Fpvs-A6uo-HTav-BinO-GgcP', '89cb1aab-b1c3-11e0-aa21-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('9291c63a-5ab3-11dc-be42-000e0c431b58-B5Dr-FFF0-AgBk-HzNw-BEUU-GYm8', '9291c63a-5ab3-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('9291c63a-5ab3-11dc-be42-000e0c431b58-B6Iz-FVll-AS64-HA3L-BAT1-GSQ5', '9291c63a-5ab3-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('9291c63a-5ab3-11dc-be42-000e0c431b58-BboS-F7EA-AlWR-HDnv-BIPs-GVIk', '9291c63a-5ab3-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый глянцевый', ''),
('9291c63a-5ab3-11dc-be42-000e0c431b58-BG99-F091-AK0K-HBRb-B6kT-GMLP', '9291c63a-5ab3-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсальное', ''),
('9291c63a-5ab3-11dc-be42-000e0c431b58-BHiT-FRmt-AlSE-HCxv-BF4t-GD3s', '9291c63a-5ab3-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('9291c63a-5ab3-11dc-be42-000e0c431b58-BI7A-FsvN-Af1i-HzPL-BxXY-GDkp', '9291c63a-5ab3-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('9291c63a-5ab3-11dc-be42-000e0c431b58-BINP-FMQD-A9W7-HrZz-BaU4-GIZ9', '9291c63a-5ab3-11dc-be42-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.52', 'л'),
('9291c63a-5ab3-11dc-be42-000e0c431b58-BT3Q-Fl75-AWEK-HEZT-BpVb-GfqC', '9291c63a-5ab3-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('9291c63c-5ab3-11dc-be42-000e0c431b58-B16x-FqUu-Aii6-HWoR-BBkr-GNKM', '9291c63c-5ab3-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('9291c63c-5ab3-11dc-be42-000e0c431b58-B7aL-FjeA-AQ0E-HbN5-B5sb-GFap', '9291c63c-5ab3-11dc-be42-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.52', 'л'),
('9291c63c-5ab3-11dc-be42-000e0c431b58-BdG6-F85X-A4D8-H694-Box0-GTCb', '9291c63c-5ab3-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('9291c63c-5ab3-11dc-be42-000e0c431b58-BfgK-FrNv-AfHz-HZ83-BNKy-GFVp', '9291c63c-5ab3-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('9291c63c-5ab3-11dc-be42-000e0c431b58-BN73-FK21-AEfn-HDzq-BfDL-GN1d', '9291c63c-5ab3-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('9291c63c-5ab3-11dc-be42-000e0c431b58-BOfs-FwRR-AqrL-Hrkx-B4E5-GzCy', '9291c63c-5ab3-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсальное', ''),
('9291c63c-5ab3-11dc-be42-000e0c431b58-BUHe-FsLj-Aete-Hxb6-BJkB-G56t', '9291c63c-5ab3-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'черный глянцевый', ''),
('9291c63c-5ab3-11dc-be42-000e0c431b58-BzFo-FPb5-AcRi-Hwj4-BZ4A-G4lM', '9291c63c-5ab3-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('9291c63e-5ab3-11dc-be42-000e0c431b58-B0Il-FAcZ-ADVt-H1Mx-Bptz-Gsd3', '9291c63e-5ab3-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('9291c63e-5ab3-11dc-be42-000e0c431b58-B9vO-FDgi-A0qU-HKim-BTJ7-GfAi', '9291c63e-5ab3-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('9291c63e-5ab3-11dc-be42-000e0c431b58-BbzT-Fv03-AXSB-HUyC-B3Tx-G1Ey', '9291c63e-5ab3-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсальное', ''),
('9291c63e-5ab3-11dc-be42-000e0c431b58-Bev8-FuAq-A9OL-H0yU-BowG-G31m', '9291c63e-5ab3-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('9291c63e-5ab3-11dc-be42-000e0c431b58-BhCD-FtC2-ADqn-HKid-Bw0T-GGuS', '9291c63e-5ab3-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('9291c63e-5ab3-11dc-be42-000e0c431b58-Bjgi-FNqH-ArdG-HAk2-BTjA-G5kc', '9291c63e-5ab3-11dc-be42-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.52', 'л'),
('9291c63e-5ab3-11dc-be42-000e0c431b58-BkTL-F1m0-AvYQ-HPtN-BNfB-GjIo', '9291c63e-5ab3-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'красный', ''),
('9291c63e-5ab3-11dc-be42-000e0c431b58-BUny-FDeA-A1Ju-Hq2N-Biau-GGob', '9291c63e-5ab3-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('9291c640-5ab3-11dc-be42-000e0c431b58-B43j-FSbJ-AiZb-H55e-BBBj-Gczp', '9291c640-5ab3-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсальное', ''),
('9291c640-5ab3-11dc-be42-000e0c431b58-B5fL-FHWP-AJ4Q-Hne9-BZfX-G7Op', '9291c640-5ab3-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('9291c640-5ab3-11dc-be42-000e0c431b58-B8Jq-Ffht-AFzZ-HikQ-B9SV-GeDG', '9291c640-5ab3-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('9291c640-5ab3-11dc-be42-000e0c431b58-B9cE-FpRZ-Arus-H45g-BmxY-GLGz', '9291c640-5ab3-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('9291c640-5ab3-11dc-be42-000e0c431b58-BAZg-FtSb-AP6P-HoGV-BebA-GuOk', '9291c640-5ab3-11dc-be42-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.52', 'л'),
('9291c640-5ab3-11dc-be42-000e0c431b58-BHEa-FxFg-AmYr-HzVC-BcSL-GJxt', '9291c640-5ab3-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('9291c640-5ab3-11dc-be42-000e0c431b58-BrFf-Fvvm-ABTq-HBFy-BSKM-G7Vn', '9291c640-5ab3-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'вишневый', ''),
('9291c640-5ab3-11dc-be42-000e0c431b58-BVpP-FwjK-ARlM-H2DB-BgBe-Glrw', '9291c640-5ab3-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('95aabdce-0d99-11dc-bdd4-000e0c431b58-B7R1-Fo9h-AJOe-Hb9r-BGvw-GOLE', '95aabdce-0d99-11dc-bdd4-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсальный', ''),
('95aabdce-0d99-11dc-bdd4-000e0c431b58-B81x-FzlL-A7Qs-Hqre-BP7S-GuNo', '95aabdce-0d99-11dc-bdd4-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('95aabdce-0d99-11dc-bdd4-000e0c431b58-Bifi-Fjyh-AuLt-HS8L-BloA-GmyL', '95aabdce-0d99-11dc-bdd4-000e0c431b58', '1d08380b-ce34-11e4-a80e-005056be1f7a', '900', 'г'),
('95aabdce-0d99-11dc-bdd4-000e0c431b58-BNWY-FPu7-AXsb-HVcw-B6ZE-GvDC', '95aabdce-0d99-11dc-bdd4-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('95aabdce-0d99-11dc-bdd4-000e0c431b58-BrzA-FJKd-A7G4-HA37-BDMJ-GTAy', '95aabdce-0d99-11dc-bdd4-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'клей ПВА "Мастер"', ''),
('95aabdce-0d99-11dc-bdd4-000e0c431b58-BTNQ-FyoP-AfuA-HS9L-BXLi-GvbS', '95aabdce-0d99-11dc-bdd4-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('95aabdce-0d99-11dc-bdd4-000e0c431b58-BwFH-FZS0-ALTC-HYhH-B8f9-GuUj', '95aabdce-0d99-11dc-bdd4-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('963b6b0a-04a8-11e3-94de-005056be3574-B1Aa-FzrI-AVMW-Hqyg-BC68-Gu2b', '963b6b0a-04a8-11e3-94de-005056be3574', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'декоративная с эффектом "короеда"', ''),
('963b6b0a-04a8-11e3-94de-005056be3574-B468-FfAS-AX6e-HQQf-B1u2-Gmj4', '963b6b0a-04a8-11e3-94de-005056be3574', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'штукатурка роллерная', ''),
('963b6b0a-04a8-11e3-94de-005056be3574-BdWw-FzCk-AWEg-HUzX-BvNU-GjAA', '963b6b0a-04a8-11e3-94de-005056be3574', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('963b6b0a-04a8-11e3-94de-005056be3574-BHas-F6do-AFXX-HtfI-BQRJ-GYRz', '963b6b0a-04a8-11e3-94de-005056be3574', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('963b6b0a-04a8-11e3-94de-005056be3574-BM79-FtQx-AGBB-HalB-Bbf8-GZA8', '963b6b0a-04a8-11e3-94de-005056be3574', '1d08380b-ce34-11e4-a80e-005056be1f7a', '15000', 'г'),
('963b6b0a-04a8-11e3-94de-005056be3574-BsY4-FMoK-Are5-HiHe-BcUa-GaDr', '963b6b0a-04a8-11e3-94de-005056be3574', '1ea6fcc4-d206-11e4-9be0-005056be1f7c', '0', 'мм'),
('963b6b0a-04a8-11e3-94de-005056be3574-BvAH-FAqb-Atk0-Hqsf-BfNV-GlKV', '963b6b0a-04a8-11e3-94de-005056be3574', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('963b6b0a-04a8-11e3-94de-005056be3574-BY7y-FwqU-A67l-HFV3-B5L3-GUAj', '963b6b0a-04a8-11e3-94de-005056be3574', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('992163db-a731-11de-90d4-000e0c431b58-B4A5-FH4S-APCC-HuOh-BY7L-GrCY', '992163db-a731-11de-90d4-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('992163db-a731-11de-90d4-000e0c431b58-B95p-FuGY-A1kq-HBYF-BOuW-Gj6O', '992163db-a731-11de-90d4-000e0c431b58', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('992163db-a731-11de-90d4-000e0c431b58-BAjR-FQeh-AO2i-HuSB-B1MB-GvT6', '992163db-a731-11de-90d4-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('992163db-a731-11de-90d4-000e0c431b58-BD6G-FmqZ-Angm-HpS7-BkWf-Gidz', '992163db-a731-11de-90d4-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '9', 'л'),
('992163db-a731-11de-90d4-000e0c431b58-BEj8-FHUM-AosJ-H1aL-BObv-GgrP', '992163db-a731-11de-90d4-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('992163db-a731-11de-90d4-000e0c431b58-BGlt-Fgcd-ApjP-Htwo-Beaq-GwqY', '992163db-a731-11de-90d4-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('992163db-a731-11de-90d4-000e0c431b58-BsoT-FFMS-Ah4Q-H5P8-BXBg-GbcG', '992163db-a731-11de-90d4-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('992163db-a731-11de-90d4-000e0c431b58-BuIi-F490-AFNa-H2tI-BGwE-GNYu', '992163db-a731-11de-90d4-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для водно-дисперсионных красок', ''),
('992163db-a731-11de-90d4-000e0c431b58-BviE-Fbjc-AhyN-H4XI-BIuf-GMen', '992163db-a731-11de-90d4-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('992163dd-a731-11de-90d4-000e0c431b58-Bbuu-FkES-AiPh-HOgB-B5lk-GIm1', '992163dd-a731-11de-90d4-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('992163dd-a731-11de-90d4-000e0c431b58-BEiO-FBPc-Ab3O-HWKz-B2bN-G2qI', '992163dd-a731-11de-90d4-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('992163dd-a731-11de-90d4-000e0c431b58-BEuF-Fm0l-Ao4N-HPB1-BFm6-GxbX', '992163dd-a731-11de-90d4-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('992163dd-a731-11de-90d4-000e0c431b58-Bheq-Fzj8-Ayg9-Hfiy-BrkQ-G7z2', '992163dd-a731-11de-90d4-000e0c431b58', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'латексная', ''),
('992163dd-a731-11de-90d4-000e0c431b58-BkEs-Fzb4-AoSU-H3KB-BAlv-GvL1', '992163dd-a731-11de-90d4-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('992163dd-a731-11de-90d4-000e0c431b58-BP0b-FryM-AVeB-HuOc-BIli-GaL4', '992163dd-a731-11de-90d4-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для ванной', ''),
('992163dd-a731-11de-90d4-000e0c431b58-BqGp-FB91-AD9c-Hzun-BpyY-GubY', '992163dd-a731-11de-90d4-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '9', 'л'),
('992163dd-a731-11de-90d4-000e0c431b58-BQYA-FP5j-ADmJ-HTi9-BLPp-GRdp', '992163dd-a731-11de-90d4-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('992163dd-a731-11de-90d4-000e0c431b58-BrqG-FOAx-AEi7-HrOa-Bmv5-GSke', '992163dd-a731-11de-90d4-000e0c431b58', 'e765ba72-107d-11e3-8a5d-0050569a1080', 'база А', ''),
('992163dd-a731-11de-90d4-000e0c431b58-BumT-Fq9h-AFsb-HjHX-BCXX-GdFM', '992163dd-a731-11de-90d4-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('992163dd-a731-11de-90d4-000e0c431b58-BWFR-FkUT-Aaa7-HWNY-Bt5e-GZ7c', '992163dd-a731-11de-90d4-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для кухни', ''),
('993a4aa8-6b1e-11dc-be42-000e0c431b58-B2v7-F5mI-ASKZ-HJPa-BDxB-GIzf', '993a4aa8-6b1e-11dc-be42-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '9', 'л'),
('993a4aa8-6b1e-11dc-be42-000e0c431b58-B6Rn-F53D-AuyE-HhX3-BWqr-G4Vp', '993a4aa8-6b1e-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('993a4aa8-6b1e-11dc-be42-000e0c431b58-BC3e-FqNm-A9t7-HqOi-BUFU-GQA8', '993a4aa8-6b1e-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('993a4aa8-6b1e-11dc-be42-000e0c431b58-BFci-FtDb-AjLf-H3yA-BftS-GIoK', '993a4aa8-6b1e-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('993a4aa8-6b1e-11dc-be42-000e0c431b58-BhkF-FCd4-AC0n-HVIS-BfUr-Geln', '993a4aa8-6b1e-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('993a4aa8-6b1e-11dc-be42-000e0c431b58-BKcf-FbUR-Aw00-Hkaz-B7Bw-Gjxz', '993a4aa8-6b1e-11dc-be42-000e0c431b58', 'e765ba72-107d-11e3-8a5d-0050569a1080', 'база А', ''),
('993a4aa8-6b1e-11dc-be42-000e0c431b58-Bl8n-FvCt-ABrW-HIoc-B6dd-G0Lg', '993a4aa8-6b1e-11dc-be42-000e0c431b58', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('993a4aa8-6b1e-11dc-be42-000e0c431b58-BMZ0-FR7W-AJSD-H2MY-BhR1-GFA5', '993a4aa8-6b1e-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'PARADE', ''),
('993a4aa8-6b1e-11dc-be42-000e0c431b58-BSzh-Fo8L-AH4o-Hk31-BHDS-Gnfn', '993a4aa8-6b1e-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый матовый', ''),
('993a4aaa-6b1e-11dc-be42-000e0c431b58-B5FG-Fgva-A4GD-HtaU-BXYh-GRKZ', '993a4aaa-6b1e-11dc-be42-000e0c431b58', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('993a4aaa-6b1e-11dc-be42-000e0c431b58-B7cu-FHhK-AHRK-HFGP-BpmG-G7Gw', '993a4aaa-6b1e-11dc-be42-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '5', 'л'),
('993a4aaa-6b1e-11dc-be42-000e0c431b58-B9B2-F0MJ-AY8L-HEaA-Bu08-GyFj', '993a4aaa-6b1e-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'PARADE', ''),
('993a4aaa-6b1e-11dc-be42-000e0c431b58-BbqM-FnvJ-AW9A-HKRY-BvBq-Gczq', '993a4aaa-6b1e-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('993a4aaa-6b1e-11dc-be42-000e0c431b58-Bg1R-Fdp2-A5R4-HCGj-B6Fk-GwEx', '993a4aaa-6b1e-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('993a4aaa-6b1e-11dc-be42-000e0c431b58-BiXx-FRti-ALZM-HE7s-BN2y-GTYk', '993a4aaa-6b1e-11dc-be42-000e0c431b58', 'e765ba72-107d-11e3-8a5d-0050569a1080', 'база А', ''),
('993a4aaa-6b1e-11dc-be42-000e0c431b58-Bj7D-FFms-Avr7-Hzkb-BmBH-Gyp4', '993a4aaa-6b1e-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('993a4aaa-6b1e-11dc-be42-000e0c431b58-BtRr-FxAH-AHXf-Hpoq-BFND-G3ex', '993a4aaa-6b1e-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый матовый', ''),
('993a4aaa-6b1e-11dc-be42-000e0c431b58-ByAE-FsDL-AR9Q-H3vV-Bpsy-GazV', '993a4aaa-6b1e-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('993a4aac-6b1e-11dc-be42-000e0c431b58-B391-F3PX-Aj8m-HqUW-BUn1-GTQo', '993a4aac-6b1e-11dc-be42-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '2.5', 'л'),
('993a4aac-6b1e-11dc-be42-000e0c431b58-B9N5-Fw2R-AMYs-HWv5-Bqn4-GhgI', '993a4aac-6b1e-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('993a4aac-6b1e-11dc-be42-000e0c431b58-BbWn-FeL9-AG9r-HapA-BXde-G0sc', '993a4aac-6b1e-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('993a4aac-6b1e-11dc-be42-000e0c431b58-BDTm-FnjE-AVeC-HzUm-BwsU-GqT7', '993a4aac-6b1e-11dc-be42-000e0c431b58', 'e765ba72-107d-11e3-8a5d-0050569a1080', 'база А', ''),
('993a4aac-6b1e-11dc-be42-000e0c431b58-BEt1-FvKf-Awh0-HQgr-BsPG-GWto', '993a4aac-6b1e-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'PARADE', ''),
('993a4aac-6b1e-11dc-be42-000e0c431b58-BTd9-Fnxp-A8Qx-HnWa-BgbJ-GXMT', '993a4aac-6b1e-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('993a4aac-6b1e-11dc-be42-000e0c431b58-BtYn-Fdi8-AuTT-HUqU-BcIq-GGm3', '993a4aac-6b1e-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('993a4aac-6b1e-11dc-be42-000e0c431b58-BXs5-FllH-AJqZ-HdHc-BNBd-GIfl', '993a4aac-6b1e-11dc-be42-000e0c431b58', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('993a4aac-6b1e-11dc-be42-000e0c431b58-Bydm-FO8t-AqLu-HJTQ-BuWj-GXAI', '993a4aac-6b1e-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый матовый', ''),
('993a4aae-6b1e-11dc-be42-000e0c431b58-B6Vr-FZ45-ASml-He7l-BmKI-Gh0f', '993a4aae-6b1e-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'PARADE', ''),
('993a4aae-6b1e-11dc-be42-000e0c431b58-B8Cv-FMHP-ACro-HO9c-BTKj-GB8L', '993a4aae-6b1e-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('993a4aae-6b1e-11dc-be42-000e0c431b58-BeSl-FT63-Agxl-H1Sn-BtIR-Gl7U', '993a4aae-6b1e-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('993a4aae-6b1e-11dc-be42-000e0c431b58-BHvt-FoUb-A4bz-HnRM-B2sU-GfC3', '993a4aae-6b1e-11dc-be42-000e0c431b58', 'e765ba72-107d-11e3-8a5d-0050569a1080', 'база А', ''),
('993a4aae-6b1e-11dc-be42-000e0c431b58-BLHr-Fxlo-AZOy-Hhvy-BCfQ-Gond', '993a4aae-6b1e-11dc-be42-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '9', 'л'),
('993a4aae-6b1e-11dc-be42-000e0c431b58-BNg5-FzWN-AcFW-HurS-BF6o-GLlg', '993a4aae-6b1e-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'фасадная', ''),
('993a4aae-6b1e-11dc-be42-000e0c431b58-BOVG-Fp3t-AtKe-HiN4-BsrL-GUAH', '993a4aae-6b1e-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('993a4aae-6b1e-11dc-be42-000e0c431b58-Bucl-FHMT-AZSO-HEd1-BkYL-GRyF', '993a4aae-6b1e-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('993a4aae-6b1e-11dc-be42-000e0c431b58-Bzn3-FxDm-AYvb-HgnD-BSuz-GCZK', '993a4aae-6b1e-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый матовый', ''),
('a0f3c4de-cf2d-11e1-92a4-005056be3bd8-BaJ5-FTdL-AnS8-HLoi-BIAb-G8oc', 'a0f3c4de-cf2d-11e1-92a4-005056be3bd8', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый матовый', ''),
('a0f3c4de-cf2d-11e1-92a4-005056be3bd8-BdMM-FaY1-A0h2-Haef-B4Fy-GypM', 'a0f3c4de-cf2d-11e1-92a4-005056be3bd8', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('a0f3c4de-cf2d-11e1-92a4-005056be3bd8-BFZX-FJtV-AKr2-HH1u-Bdph-GGPD', 'a0f3c4de-cf2d-11e1-92a4-005056be3bd8', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('a0f3c4de-cf2d-11e1-92a4-005056be3bd8-Bg8K-FYXp-A4Rv-HsFb-B5MV-GTFs', 'a0f3c4de-cf2d-11e1-92a4-005056be3bd8', 'e8287600-ad96-11e3-b114-005056be1f7c', 'PARADE', ''),
('a0f3c4de-cf2d-11e1-92a4-005056be3bd8-BH5Z-F3WO-AJud-HkDD-BdgP-Gp8n', 'a0f3c4de-cf2d-11e1-92a4-005056be3bd8', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'интерьерная', ''),
('a0f3c4de-cf2d-11e1-92a4-005056be3bd8-BiPd-FBzg-AESD-HU9A-B9f8-GI4V', 'a0f3c4de-cf2d-11e1-92a4-005056be3bd8', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('a0f3c4de-cf2d-11e1-92a4-005056be3bd8-BkT5-FkXS-APNv-HbyQ-BYPa-GSj4', 'a0f3c4de-cf2d-11e1-92a4-005056be3bd8', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('a0f3c4de-cf2d-11e1-92a4-005056be3bd8-BV3y-FnBm-Apb0-HDYp-B1cM-Glf7', 'a0f3c4de-cf2d-11e1-92a4-005056be3bd8', 'e765ba72-107d-11e3-8a5d-0050569a1080', 'база А', ''),
('a0f3c4de-cf2d-11e1-92a4-005056be3bd8-Byxn-Fkfs-ABa6-HWuA-BFSP-GiUE', 'a0f3c4de-cf2d-11e1-92a4-005056be3bd8', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '9', 'л'),
('a1a9b4a6-f787-11e3-8c8a-005056be1f7b-B4IC-F5Qo-ABX5-HTzb-BNSH-GsQD', 'a1a9b4a6-f787-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'оранжевый', ''),
('a1a9b4a6-f787-11e3-8c8a-005056be1f7b-BAJh-F4i5-A2DJ-H9jT-BUuf-GE10', 'a1a9b4a6-f787-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('a1a9b4a6-f787-11e3-8c8a-005056be1f7b-BC3L-FJvH-AOkD-Hd75-BQMl-GHmR', 'a1a9b4a6-f787-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '800', 'г'),
('a1a9b4a6-f787-11e3-8c8a-005056be1f7b-BkHd-F8pz-AMm4-HZW8-BePG-GgKW', 'a1a9b4a6-f787-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('a1a9b4a6-f787-11e3-8c8a-005056be1f7b-BKLu-FFej-Ahr2-HoZH-BsAP-GL86', 'a1a9b4a6-f787-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('a1a9b4a6-f787-11e3-8c8a-005056be1f7b-BoXr-FfCG-AnuH-H46E-By7O-GW1x', 'a1a9b4a6-f787-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('a1a9b4a6-f787-11e3-8c8a-005056be1f7b-BQr1-Fapa-AtAL-HPFB-BOtZ-G6Ob', 'a1a9b4a6-f787-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('a48048ba-ec8c-11e3-9eab-005056be1f7b-B4eh-FmZD-As4B-HDA1-BPT4-GEcN', 'a48048ba-ec8c-11e3-9eab-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('a48048ba-ec8c-11e3-9eab-005056be1f7b-B6pi-F2vh-A92a-Hkf7-BkNK-Gf7b', 'a48048ba-ec8c-11e3-9eab-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'ксилол', ''),
('a48048ba-ec8c-11e3-9eab-005056be1f7b-BrN5-FtR6-AjgP-Hclr-BpbW-GQxR', 'a48048ba-ec8c-11e3-9eab-005056be1f7b', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.5', 'л'),
('a48048ba-ec8c-11e3-9eab-005056be1f7b-BTDy-FITu-AMXg-HREg-BUQN-GtLA', 'a48048ba-ec8c-11e3-9eab-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('a48048ba-ec8c-11e3-9eab-005056be1f7b-Bzok-FV6p-A2Q6-HF0H-BF4l-GnfA', 'a48048ba-ec8c-11e3-9eab-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('a663cb7c-fadf-11e3-b5e8-005056be1f7b-BDSA-FU0b-ASxj-Hdne-BkNx-GRBT', 'a663cb7c-fadf-11e3-b5e8-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('a663cb7c-fadf-11e3-b5e8-005056be1f7b-BELG-FCe8-AJQO-Hf6H-BhtM-Gzg5', 'a663cb7c-fadf-11e3-b5e8-005056be1f7b', 'e765ba72-107d-11e3-8a5d-0050569a1080', 'база С', ''),
('a663cb7c-fadf-11e3-b5e8-005056be1f7b-BK1a-FZVV-Ag4F-Htsl-Bndx-Gzz2', 'a663cb7c-fadf-11e3-b5e8-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('a663cb7c-fadf-11e3-b5e8-005056be1f7b-BkTr-FxfG-A2j5-HFqR-BHZs-GBY5', 'a663cb7c-fadf-11e3-b5e8-005056be1f7b', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '2.5', 'л'),
('a663cb7c-fadf-11e3-b5e8-005056be1f7b-BqMB-Fw7u-AYkN-HMZD-BExO-GGXB', 'a663cb7c-fadf-11e3-b5e8-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'PARADE', ''),
('a663cb7c-fadf-11e3-b5e8-005056be1f7b-Bsb5-F9LB-A5GR-Hqb8-ByIK-Gz5G', 'a663cb7c-fadf-11e3-b5e8-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('a663cb7c-fadf-11e3-b5e8-005056be1f7b-BuLL-FWDj-AVLL-Hlje-BGnp-GMqK', 'a663cb7c-fadf-11e3-b5e8-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'шелковый матовый', ''),
('a663cb7c-fadf-11e3-b5e8-005056be1f7b-ByES-Fwr6-ApRl-H2X9-BHmQ-GYSf', 'a663cb7c-fadf-11e3-b5e8-005056be1f7b', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'латексная', ''),
('a663cb7c-fadf-11e3-b5e8-005056be1f7b-BYLC-Fjwm-AE4P-HuG6-B5Qw-GVpH', 'a663cb7c-fadf-11e3-b5e8-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('a6f80c96-516a-11dd-a89a-000e0c431b58-Bgdd-Fxfn-AJRC-Hz9o-BQIH-Gih0', 'a6f80c96-516a-11dd-a89a-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для обоев', ''),
('a6f80c96-516a-11dd-a89a-000e0c431b58-Bgms-Ficr-ANsz-HURX-BU5H-GDCP', 'a6f80c96-516a-11dd-a89a-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('a6f80c96-516a-11dd-a89a-000e0c431b58-BJcS-FZ2E-ANtf-HWeq-BeD7-GgKn', 'a6f80c96-516a-11dd-a89a-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '2.5', 'л'),
('a6f80c96-516a-11dd-a89a-000e0c431b58-BjPC-FGq0-AS1R-HCJW-BvYq-Grma', 'a6f80c96-516a-11dd-a89a-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('a6f80c96-516a-11dd-a89a-000e0c431b58-BPT6-FNuc-Az2P-HYvx-B3bJ-GuLH', 'a6f80c96-516a-11dd-a89a-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('a6f80c96-516a-11dd-a89a-000e0c431b58-BPtG-Flf6-ATFe-H89D-BdTz-GjPT', 'a6f80c96-516a-11dd-a89a-000e0c431b58', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('a6f80c96-516a-11dd-a89a-000e0c431b58-BpV2-Ft9z-AE6g-Hb7L-BJRu-GTEs', 'a6f80c96-516a-11dd-a89a-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('a6f80c96-516a-11dd-a89a-000e0c431b58-BQ8w-Fu5v-AxYE-Hn8U-B7rX-GBos', 'a6f80c96-516a-11dd-a89a-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('a6f80c96-516a-11dd-a89a-000e0c431b58-BUiJ-Fx97-AOM9-Hahl-BHxi-G5hd', 'a6f80c96-516a-11dd-a89a-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('a6f80c98-516a-11dd-a89a-000e0c431b58-B64I-FMuR-AygE-H3PV-BjLr-Gotb', 'a6f80c98-516a-11dd-a89a-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для обоев', ''),
('a6f80c98-516a-11dd-a89a-000e0c431b58-B6hr-FApn-AICz-HIPk-BwaU-GcPB', 'a6f80c98-516a-11dd-a89a-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('a6f80c98-516a-11dd-a89a-000e0c431b58-B6VE-Fiu6-AbK2-Hfq7-BZZO-G9SB', 'a6f80c98-516a-11dd-a89a-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '5', 'л'),
('a6f80c98-516a-11dd-a89a-000e0c431b58-BEBM-FI5b-Aedn-HLIW-Bnsh-GPJO', 'a6f80c98-516a-11dd-a89a-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('a6f80c98-516a-11dd-a89a-000e0c431b58-BELE-FJzN-ANoJ-HeYr-BUTP-GBU6', 'a6f80c98-516a-11dd-a89a-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('a6f80c98-516a-11dd-a89a-000e0c431b58-BLuq-Fzqm-A6DE-HoIE-Bz6R-Gtiz', 'a6f80c98-516a-11dd-a89a-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('a6f80c98-516a-11dd-a89a-000e0c431b58-Bod8-FelM-AEYn-HZ14-Ba6E-GfE4', 'a6f80c98-516a-11dd-a89a-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('a6f80c98-516a-11dd-a89a-000e0c431b58-BQ21-Fin9-AACn-H66G-BWbs-GFAL', 'a6f80c98-516a-11dd-a89a-000e0c431b58', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('a6f80c98-516a-11dd-a89a-000e0c431b58-BtSi-F4w8-AkHR-H1Il-BvxE-GtRq', 'a6f80c98-516a-11dd-a89a-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('a6f80c9c-516a-11dd-a89a-000e0c431b58-B7JV-FXaX-AfdO-HFZN-BBs6-GVAT', 'a6f80c9c-516a-11dd-a89a-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('a6f80c9c-516a-11dd-a89a-000e0c431b58-B7Xg-Fb9E-Axgz-HfeC-BqS5-GUnX', 'a6f80c9c-516a-11dd-a89a-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('a6f80c9c-516a-11dd-a89a-000e0c431b58-Bd3f-FrPB-AEtf-HliV-Bivs-G9MK', 'a6f80c9c-516a-11dd-a89a-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для водно-дисперсионных красок', ''),
('a6f80c9c-516a-11dd-a89a-000e0c431b58-Bjlz-FXNt-AGIO-HXgX-Bddg-Gz17', 'a6f80c9c-516a-11dd-a89a-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('a6f80c9c-516a-11dd-a89a-000e0c431b58-Blhe-Foyi-AAPa-HRBI-BD2k-G696', 'a6f80c9c-516a-11dd-a89a-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('a6f80c9c-516a-11dd-a89a-000e0c431b58-BMWa-Fbcz-Apdh-Hkzh-B5YJ-GuvX', 'a6f80c9c-516a-11dd-a89a-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '2.5', 'л'),
('a6f80c9c-516a-11dd-a89a-000e0c431b58-BTrU-FRYN-Alfy-Hm4t-B5fR-GYJF', 'a6f80c9c-516a-11dd-a89a-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('a6f80c9c-516a-11dd-a89a-000e0c431b58-Bz6U-FyeE-AuGR-H5el-BCk9-GfWa', 'a6f80c9c-516a-11dd-a89a-000e0c431b58', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('a6f80c9c-516a-11dd-a89a-000e0c431b58-Bzb3-FHVX-AsY8-Hr4U-BHkA-GX5S', 'a6f80c9c-516a-11dd-a89a-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('a6f80c9e-516a-11dd-a89a-000e0c431b58-B3dO-Fv9b-A7k6-HM1g-BEQQ-GOHD', 'a6f80c9e-516a-11dd-a89a-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('a6f80c9e-516a-11dd-a89a-000e0c431b58-BADT-FNkv-AjSU-HYIc-BkB6-Gyx4', 'a6f80c9e-516a-11dd-a89a-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('a6f80c9e-516a-11dd-a89a-000e0c431b58-BFdI-FjWC-AVB3-HeNK-BmeQ-GQk2', 'a6f80c9e-516a-11dd-a89a-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('a6f80c9e-516a-11dd-a89a-000e0c431b58-BHCo-Fbbx-A5Cy-Hz2m-BtHV-GNUS', 'a6f80c9e-516a-11dd-a89a-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '5', 'л'),
('a6f80c9e-516a-11dd-a89a-000e0c431b58-BhDT-FIDi-A1Gy-HlcR-B8kT-GlCv', 'a6f80c9e-516a-11dd-a89a-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для водно-дисперсионных красок', ''),
('a6f80c9e-516a-11dd-a89a-000e0c431b58-BQtd-FM7U-AtBk-H0Pr-BDPv-GWdV', 'a6f80c9e-516a-11dd-a89a-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('a6f80c9e-516a-11dd-a89a-000e0c431b58-BWQU-FK3x-AbzX-Hvba-Bg1X-GTEJ', 'a6f80c9e-516a-11dd-a89a-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('a6f80c9e-516a-11dd-a89a-000e0c431b58-Bygv-Fri3-AV9d-H34v-Bp1J-GLSH', 'a6f80c9e-516a-11dd-a89a-000e0c431b58', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('a6f80c9e-516a-11dd-a89a-000e0c431b58-BZtJ-F2xw-A7PN-HhcV-Briz-G1IM', 'a6f80c9e-516a-11dd-a89a-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('a6f80ca2-516a-11dd-a89a-000e0c431b58-B4G5-Ftvv-AcxI-HJMR-BNhT-Grb3', 'a6f80ca2-516a-11dd-a89a-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '2.5', 'л'),
('a6f80ca2-516a-11dd-a89a-000e0c431b58-B9w2-FgX5-AQrM-HVNw-B7G3-G11o', 'a6f80ca2-516a-11dd-a89a-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для стен', ''),
('a6f80ca2-516a-11dd-a89a-000e0c431b58-BAHd-FNdr-AAZx-H3Pn-Bh37-G9nY', 'a6f80ca2-516a-11dd-a89a-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('a6f80ca2-516a-11dd-a89a-000e0c431b58-Bbzn-F7bK-AIdD-HLLO-BxcJ-Gh3V', 'a6f80ca2-516a-11dd-a89a-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('a6f80ca2-516a-11dd-a89a-000e0c431b58-Bf9W-FvV7-A4ai-Hgxb-BaPQ-GEMs', 'a6f80ca2-516a-11dd-a89a-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('a6f80ca2-516a-11dd-a89a-000e0c431b58-BmSb-Fvcn-ACpL-HVWm-BOUY-GF2w', 'a6f80ca2-516a-11dd-a89a-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для водно-дисперсионных красок', ''),
('a6f80ca2-516a-11dd-a89a-000e0c431b58-BOUL-FRfX-AgTz-Hp2s-BBWr-GYID', 'a6f80ca2-516a-11dd-a89a-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('a6f80ca2-516a-11dd-a89a-000e0c431b58-BQ5t-FaM8-AGBQ-HWjH-BFln-GX44', 'a6f80ca2-516a-11dd-a89a-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('a6f80ca2-516a-11dd-a89a-000e0c431b58-BVCd-F4iR-AV0h-HlDu-BTRE-Gfjk', 'a6f80ca2-516a-11dd-a89a-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('a6f80ca2-516a-11dd-a89a-000e0c431b58-BW3r-FSji-AtHJ-HRNp-ByTQ-Gi1s', 'a6f80ca2-516a-11dd-a89a-000e0c431b58', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('a6f80ca4-516a-11dd-a89a-000e0c431b58-B0yV-Ftnq-AVNC-HESl-BRDL-G4mn', 'a6f80ca4-516a-11dd-a89a-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('a6f80ca4-516a-11dd-a89a-000e0c431b58-B2B9-Fm6H-AM2X-H9Cv-B9v5-GgF0', 'a6f80ca4-516a-11dd-a89a-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '5', 'л'),
('a6f80ca4-516a-11dd-a89a-000e0c431b58-Bfmn-FsOc-Ao3C-HQFi-Bg7k-Gfjf', 'a6f80ca4-516a-11dd-a89a-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для стен', ''),
('a6f80ca4-516a-11dd-a89a-000e0c431b58-BGKP-FJPh-Auhl-H6bN-BiND-GLuC', 'a6f80ca4-516a-11dd-a89a-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('a6f80ca4-516a-11dd-a89a-000e0c431b58-BmpD-FxBZ-AaPu-HyVl-BkVt-GEjM', 'a6f80ca4-516a-11dd-a89a-000e0c431b58', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('a6f80ca4-516a-11dd-a89a-000e0c431b58-BmwW-F0uY-AvsJ-HpPP-Bpv3-GSdG', 'a6f80ca4-516a-11dd-a89a-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для водно-дисперсионных красок', ''),
('a6f80ca4-516a-11dd-a89a-000e0c431b58-BsJh-FUE0-AhnM-Hly7-Bokl-GMgP', 'a6f80ca4-516a-11dd-a89a-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('a6f80ca4-516a-11dd-a89a-000e0c431b58-BuH0-FxYE-AV5B-H6Zk-BbBW-GxBG', 'a6f80ca4-516a-11dd-a89a-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('a6f80ca4-516a-11dd-a89a-000e0c431b58-Bvpi-F7oo-Afsu-H4Ik-B6Pv-GLYA', 'a6f80ca4-516a-11dd-a89a-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('a6f80ca4-516a-11dd-a89a-000e0c431b58-Bwzm-Fg9k-A5gK-H9Gj-BEFY-GZzB', 'a6f80ca4-516a-11dd-a89a-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('a6f80ca8-516a-11dd-a89a-000e0c431b58-B5U5-FYex-Ar1n-Hn7M-BkEB-Gxeo', 'a6f80ca8-516a-11dd-a89a-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('a6f80ca8-516a-11dd-a89a-000e0c431b58-B8A3-F0RQ-A0me-Heo9-BCbC-Gslx', 'a6f80ca8-516a-11dd-a89a-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'фасадная особопрочная', ''),
('a6f80ca8-516a-11dd-a89a-000e0c431b58-B8EA-FQVF-AkYb-HZFG-ByyC-GV9E', 'a6f80ca8-516a-11dd-a89a-000e0c431b58', 'e765ba72-107d-11e3-8a5d-0050569a1080', 'база А', ''),
('a6f80ca8-516a-11dd-a89a-000e0c431b58-B8mu-FsBC-AQQR-HyXf-Bovt-GHnb', 'a6f80ca8-516a-11dd-a89a-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '5', 'л'),
('a6f80ca8-516a-11dd-a89a-000e0c431b58-BqxI-FINN-AOCC-HQYA-BVNf-GBeh', 'a6f80ca8-516a-11dd-a89a-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('a6f80ca8-516a-11dd-a89a-000e0c431b58-Bt7g-FJBd-Aglc-HhFR-BGlI-Gz74', 'a6f80ca8-516a-11dd-a89a-000e0c431b58', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('a6f80ca8-516a-11dd-a89a-000e0c431b58-BwDq-FKvo-AdWl-H38y-Blom-Gtwz', 'a6f80ca8-516a-11dd-a89a-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('a6f80ca8-516a-11dd-a89a-000e0c431b58-BXFJ-F98H-Axiv-HZSh-BPPi-GHOz', 'a6f80ca8-516a-11dd-a89a-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('a6f80ca8-516a-11dd-a89a-000e0c431b58-BXNc-F2sG-A1uh-H3cJ-Bq1O-GzzL', 'a6f80ca8-516a-11dd-a89a-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('a6f80ca8-516a-11dd-a89a-000e0c431b58-Bzeq-FRCv-AjJX-Hr9T-Bl7Y-GlNt', 'a6f80ca8-516a-11dd-a89a-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('a6f80cac-516a-11dd-a89a-000e0c431b58-B3Lj-Fatg-AFws-HCEN-BOHG-Gidv', 'a6f80cac-516a-11dd-a89a-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('a6f80cac-516a-11dd-a89a-000e0c431b58-B3So-Fztt-Ar0O-Hdp0-BOiK-Gx94', 'a6f80cac-516a-11dd-a89a-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('a6f80cac-516a-11dd-a89a-000e0c431b58-B5uf-FfpU-AEdd-Hs9p-BcNH-GiV6', 'a6f80cac-516a-11dd-a89a-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('a6f80cac-516a-11dd-a89a-000e0c431b58-Ba5a-FQ9M-Aazi-Hi7p-BCL7-GSfM', 'a6f80cac-516a-11dd-a89a-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('a6f80cac-516a-11dd-a89a-000e0c431b58-BD3T-FVoT-Az48-HbE3-BQew-Gqvu', 'a6f80cac-516a-11dd-a89a-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('a6f80cac-516a-11dd-a89a-000e0c431b58-BgTW-FuwC-AuBk-H5zj-ByJn-GeLu', 'a6f80cac-516a-11dd-a89a-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для кухни', ''),
('a6f80cac-516a-11dd-a89a-000e0c431b58-Bk9Q-FuWH-AKuE-H9fD-B1hZ-G3Mc', 'a6f80cac-516a-11dd-a89a-000e0c431b58', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'латексная', ''),
('a6f80cac-516a-11dd-a89a-000e0c431b58-BPbG-FHyA-Ad7w-HHtY-BfQr-G3Ae', 'a6f80cac-516a-11dd-a89a-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для ванной', ''),
('a6f80cac-516a-11dd-a89a-000e0c431b58-BPRP-FTQu-AXGR-Hw0d-BOnm-GK5y', 'a6f80cac-516a-11dd-a89a-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('a6f80cac-516a-11dd-a89a-000e0c431b58-BUEq-FCGu-AQV3-HW5V-BIwo-GxlX', 'a6f80cac-516a-11dd-a89a-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '2.5', 'л'),
('a6f80cae-516a-11dd-a89a-000e0c431b58-BBcO-FPku-A2Oh-HTrz-BiIm-Gpe6', 'a6f80cae-516a-11dd-a89a-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('a6f80cae-516a-11dd-a89a-000e0c431b58-BbwH-FVS2-AAvR-HFR0-B7Ar-GC1L', 'a6f80cae-516a-11dd-a89a-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для ванной', ''),
('a6f80cae-516a-11dd-a89a-000e0c431b58-BdNh-FWo2-APlG-H4Cz-BNzn-GAFK', 'a6f80cae-516a-11dd-a89a-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('a6f80cae-516a-11dd-a89a-000e0c431b58-Bjy3-FV7m-Aub3-HbT4-B7Oo-GbtT', 'a6f80cae-516a-11dd-a89a-000e0c431b58', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'латексная', ''),
('a6f80cae-516a-11dd-a89a-000e0c431b58-BpaE-FSuM-AAPG-Hv4w-BjOg-GcYf', 'a6f80cae-516a-11dd-a89a-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('a6f80cae-516a-11dd-a89a-000e0c431b58-BQ1y-Few0-Ae34-Hguo-BcZF-Ggr1', 'a6f80cae-516a-11dd-a89a-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '5', 'л'),
('a6f80cae-516a-11dd-a89a-000e0c431b58-BssG-Fzd0-AmDN-HIgm-Bowc-GcRO', 'a6f80cae-516a-11dd-a89a-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для кухни', ''),
('a6f80cae-516a-11dd-a89a-000e0c431b58-BtBu-F15x-AqHn-HUIs-Be5u-Gnpy', 'a6f80cae-516a-11dd-a89a-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('a6f80cae-516a-11dd-a89a-000e0c431b58-BVu3-FJ9y-AbSO-H7K0-BG5B-G2u7', 'a6f80cae-516a-11dd-a89a-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('a6f80cae-516a-11dd-a89a-000e0c431b58-BwBJ-FuEr-AFDy-HO6R-BUZe-G3vJ', 'a6f80cae-516a-11dd-a89a-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('a6fd4151-ec8b-11e3-9eab-005056be1f7b-B2MW-FPtw-AFTY-Hou4-BCAx-G9oI', 'a6fd4151-ec8b-11e3-9eab-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'PARADE', ''),
('a6fd4151-ec8b-11e3-9eab-005056be1f7b-B7Ra-FXY4-AVIL-H8Ol-BAdf-GkbE', 'a6fd4151-ec8b-11e3-9eab-005056be1f7b', 'e765ba72-107d-11e3-8a5d-0050569a1080', 'база С', ''),
('a6fd4151-ec8b-11e3-9eab-005056be1f7b-BFks-Fydv-As2o-Hymx-BoIC-GxE5', 'a6fd4151-ec8b-11e3-9eab-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('a6fd4151-ec8b-11e3-9eab-005056be1f7b-BGLX-FY27-AMGs-H3C5-BY4G-GuJz', 'a6fd4151-ec8b-11e3-9eab-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('a6fd4151-ec8b-11e3-9eab-005056be1f7b-BgOJ-F635-Ay65-Hl4j-BuAu-GIYl', 'a6fd4151-ec8b-11e3-9eab-005056be1f7b', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '2.5', 'л'),
('a6fd4151-ec8b-11e3-9eab-005056be1f7b-BMtz-F3yz-AYhY-HcM3-B4JJ-GTgi', 'a6fd4151-ec8b-11e3-9eab-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'бесцветный', ''),
('a6fd4151-ec8b-11e3-9eab-005056be1f7b-BN3q-FZz6-ABzY-Hgaz-Bkmj-GafY', 'a6fd4151-ec8b-11e3-9eab-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('a6fd4151-ec8b-11e3-9eab-005056be1f7b-BP46-FoVI-AgOR-Hqiy-BPwq-G7Lg', 'a6fd4151-ec8b-11e3-9eab-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('a6fd4151-ec8b-11e3-9eab-005056be1f7b-BP4k-F8im-ASvq-HF0f-BsjE-Goda', 'a6fd4151-ec8b-11e3-9eab-005056be1f7b', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'латексная', ''),
('a7555009-7f46-11e3-af7c-005056be1f7b-B5in-FGLk-ALY2-H19I-ByOl-GTfq', 'a7555009-7f46-11e3-af7c-005056be1f7b', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'латексная', ''),
('a7555009-7f46-11e3-af7c-005056be1f7b-B5JD-F165-AIaP-H9B6-BNqF-GoqU', 'a7555009-7f46-11e3-af7c-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'PARADE', ''),
('a7555009-7f46-11e3-af7c-005056be1f7b-BBWn-FQVp-ALiV-HRMC-Blyh-G7B2', 'a7555009-7f46-11e3-af7c-005056be1f7b', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '2.5', 'л'),
('a7555009-7f46-11e3-af7c-005056be1f7b-BehG-FVYE-AdNT-HEgz-BvnA-GUpD', 'a7555009-7f46-11e3-af7c-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый матовый', ''),
('a7555009-7f46-11e3-af7c-005056be1f7b-BHLj-FCC5-AeRC-HfU8-BQPg-G4Ws', 'a7555009-7f46-11e3-af7c-005056be1f7b', 'e765ba72-107d-11e3-8a5d-0050569a1080', 'база А', ''),
('a7555009-7f46-11e3-af7c-005056be1f7b-BlfU-FMUp-AeNQ-H6cJ-BDXS-GHNN', 'a7555009-7f46-11e3-af7c-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('a7555009-7f46-11e3-af7c-005056be1f7b-BmfF-F3bi-ABe6-HUlJ-Bhng-GL52', 'a7555009-7f46-11e3-af7c-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('a7555009-7f46-11e3-af7c-005056be1f7b-BpKb-F0P8-AyAl-HzVR-B4kb-GO3H', 'a7555009-7f46-11e3-af7c-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('a7555009-7f46-11e3-af7c-005056be1f7b-BPKV-FSpq-AQ76-Hw1S-BeU1-GlqO', 'a7555009-7f46-11e3-af7c-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('ab383e71-f78f-11e3-8c8a-005056be1f7b-BeAp-FdZ2-Aatx-HFIL-Bc5U-GdUg', 'ab383e71-f78f-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('ab383e71-f78f-11e3-8c8a-005056be1f7b-BKWI-FyFP-AOT2-HoL7-Bd7b-GCeC', 'ab383e71-f78f-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('ab383e71-f78f-11e3-8c8a-005056be1f7b-BPeN-FHM6-AOK9-HZM7-BU6p-GZXW', 'ab383e71-f78f-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'оранжевый', ''),
('ab383e71-f78f-11e3-8c8a-005056be1f7b-Bubl-FoL0-Abhn-HsHZ-BNmZ-G3Fz', 'ab383e71-f78f-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('ab383e71-f78f-11e3-8c8a-005056be1f7b-Bufj-Fils-AtDm-HDg8-BjRY-GL6k', 'ab383e71-f78f-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('ab383e71-f78f-11e3-8c8a-005056be1f7b-BvJB-FaMR-AGF4-HuYx-BWoR-Gjve', 'ab383e71-f78f-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('ab383e71-f78f-11e3-8c8a-005056be1f7b-BvNF-FXQm-AU15-HtB1-BTMN-GbBS', 'ab383e71-f78f-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '20000', 'г'),
('ad93144b-f787-11e3-8c8a-005056be1f7b-B2Ev-FHbg-AALS-HcQL-BD6X-G1fN', 'ad93144b-f787-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('ad93144b-f787-11e3-8c8a-005056be1f7b-Ba3K-FPN0-A0pP-HXu4-Btwb-GF3l', 'ad93144b-f787-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('ad93144b-f787-11e3-8c8a-005056be1f7b-BALt-F4rv-A26z-HVzt-BbQX-GFnW', 'ad93144b-f787-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('ad93144b-f787-11e3-8c8a-005056be1f7b-BBiV-FGJj-ATM7-HmGV-B6Gh-GoAO', 'ad93144b-f787-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('ad93144b-f787-11e3-8c8a-005056be1f7b-Bbnn-FX07-A59E-HlNN-BCXT-G5ZS', 'ad93144b-f787-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'желтый', ''),
('ad93144b-f787-11e3-8c8a-005056be1f7b-BoMx-Fkz4-A7uA-HdZA-Bsz3-G3FG', 'ad93144b-f787-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('ad93144b-f787-11e3-8c8a-005056be1f7b-Btc8-Ft6W-AunM-HmgR-BtXW-Gefy', 'ad93144b-f787-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '800', 'г'),
('ae39d1eb-cf86-11e3-a00d-005056be1f7b-B9kD-FRcE-AmCb-HgbA-BhoN-G6MO', 'ae39d1eb-cf86-11e3-a00d-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('ae39d1eb-cf86-11e3-a00d-005056be1f7b-B9VD-F915-AKdS-H2AV-BjX5-GYiA', 'ae39d1eb-cf86-11e3-a00d-005056be1f7b', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '2.5', 'л'),
('ae39d1eb-cf86-11e3-a00d-005056be1f7b-BBHx-Fssl-A0SB-H6gN-BA9c-GIm2', 'ae39d1eb-cf86-11e3-a00d-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'золото', ''),
('ae39d1eb-cf86-11e3-a00d-005056be1f7b-BepB-Fglh-Atlg-HMtJ-BD5A-GzMH', 'ae39d1eb-cf86-11e3-a00d-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('ae39d1eb-cf86-11e3-a00d-005056be1f7b-Bie4-FnB1-AhGx-HhAd-BQeJ-GRAu', 'ae39d1eb-cf86-11e3-a00d-005056be1f7b', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'гладкая', ''),
('ae39d1eb-cf86-11e3-a00d-005056be1f7b-BK1v-FRHs-ASwF-Hg74-BF8A-G4ps', 'ae39d1eb-cf86-11e3-a00d-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('ae39d1eb-cf86-11e3-a00d-005056be1f7b-BNNY-FhAC-A2ih-H8cX-BAbs-GEZj', 'ae39d1eb-cf86-11e3-a00d-005056be1f7b', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для металла', ''),
('ae39d1eb-cf86-11e3-a00d-005056be1f7b-BXjy-FKGy-AoXT-HxoU-BheF-G41C', 'ae39d1eb-cf86-11e3-a00d-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('ae39d1eb-cf86-11e3-a00d-005056be1f7b-BzuV-FV8F-AfB0-Hf1M-BmYq-GgCs', 'ae39d1eb-cf86-11e3-a00d-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'PARADE', ''),
('b08b1d7e-ec8c-11e3-9eab-005056be1f7b-B97l-FykP-AubR-Hv1b-BV8h-GBvj', 'b08b1d7e-ec8c-11e3-9eab-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'сольвент', ''),
('b08b1d7e-ec8c-11e3-9eab-005056be1f7b-BAHY-FE4k-Ab41-Hon6-B1BB-GZKk', 'b08b1d7e-ec8c-11e3-9eab-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('b08b1d7e-ec8c-11e3-9eab-005056be1f7b-BGFp-FyBa-A5sU-HPZr-B9ay-GXes', 'b08b1d7e-ec8c-11e3-9eab-005056be1f7b', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.5', 'л'),
('b08b1d7e-ec8c-11e3-9eab-005056be1f7b-BKOA-FcYT-AupE-HwMW-B0PN-GuFL', 'b08b1d7e-ec8c-11e3-9eab-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('b08b1d7e-ec8c-11e3-9eab-005056be1f7b-BXFj-FIjr-A5Fr-H7uG-Bq5U-GqWt', 'b08b1d7e-ec8c-11e3-9eab-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('b182dc4f-f994-11e2-98ef-005056be3574-B57f-Fzcc-AgcD-HDlk-BBiQ-GfNO', 'b182dc4f-f994-11e2-98ef-005056be3574', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('b182dc4f-f994-11e2-98ef-005056be3574-B7qe-Fo91-AmsU-H4zH-B9cl-GlJ0', 'b182dc4f-f994-11e2-98ef-005056be3574', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('b182dc4f-f994-11e2-98ef-005056be3574-BHTX-FSyf-AshE-H4pE-BHnu-Gavc', 'b182dc4f-f994-11e2-98ef-005056be3574', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'черный', ''),
('b182dc4f-f994-11e2-98ef-005056be3574-Bmem-FrXS-Awf6-Hg7r-B0lg-GJg9', 'b182dc4f-f994-11e2-98ef-005056be3574', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('b182dc4f-f994-11e2-98ef-005056be3574-BozK-F6cw-AJfs-HSW8-BteR-GHwF', 'b182dc4f-f994-11e2-98ef-005056be3574', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('b182dc4f-f994-11e2-98ef-005056be3574-BPA3-FeaL-A41Y-HOvb-BCIB-GTin', 'b182dc4f-f994-11e2-98ef-005056be3574', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'молотковая эмаль-грунт', ''),
('b182dc4f-f994-11e2-98ef-005056be3574-BWz8-Fqsw-AxrO-HZSY-BZMV-G6Cy', 'b182dc4f-f994-11e2-98ef-005056be3574', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.75', 'л'),
('b182dc4f-f994-11e2-98ef-005056be3574-BXjQ-Fam3-AAoa-HRKn-Bfgc-GdNL', 'b182dc4f-f994-11e2-98ef-005056be3574', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для ржавчины', ''),
('b182dc51-f994-11e2-98ef-005056be3574-B0qr-FYMO-AFQZ-H42N-BuQF-GGGW', 'b182dc51-f994-11e2-98ef-005056be3574', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'зеленый', ''),
('b182dc51-f994-11e2-98ef-005056be3574-B5xE-FIwi-AGKC-HtR6-Bjm5-GqWv', 'b182dc51-f994-11e2-98ef-005056be3574', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('b182dc51-f994-11e2-98ef-005056be3574-BJ9K-FLsb-AHSD-HB9a-Bxnv-GLfL', 'b182dc51-f994-11e2-98ef-005056be3574', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.75', 'л'),
('b182dc51-f994-11e2-98ef-005056be3574-BoVX-F3ZG-AMzK-H2za-BftN-Gk30', 'b182dc51-f994-11e2-98ef-005056be3574', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('b182dc51-f994-11e2-98ef-005056be3574-BRsB-Fcj1-A3Ej-HGoc-BGya-GR0J', 'b182dc51-f994-11e2-98ef-005056be3574', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для ржавчины', ''),
('b182dc51-f994-11e2-98ef-005056be3574-BtHb-FwIa-AN6D-H0Gi-BKYR-GL11', 'b182dc51-f994-11e2-98ef-005056be3574', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'молотковая эмаль-грунт', ''),
('b182dc51-f994-11e2-98ef-005056be3574-BV9G-Fu28-A9lN-HEsU-BaDo-G0Qo', 'b182dc51-f994-11e2-98ef-005056be3574', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('b182dc51-f994-11e2-98ef-005056be3574-BVUi-FMA6-AgaO-H0e8-BYdn-GG31', 'b182dc51-f994-11e2-98ef-005056be3574', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('b1a9595a-7f46-11e3-af7c-005056be1f7b-B1Ga-FMXn-AO0b-Hv6d-Bni0-Gtba', 'b1a9595a-7f46-11e3-af7c-005056be1f7b', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'латексная', ''),
('b1a9595a-7f46-11e3-af7c-005056be1f7b-B7IR-FcNw-AbB4-HS4y-B5Xm-GB1e', 'b1a9595a-7f46-11e3-af7c-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('b1a9595a-7f46-11e3-af7c-005056be1f7b-BdxG-Fc2x-ACeT-HbpF-BcTm-Gs02', 'b1a9595a-7f46-11e3-af7c-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'PARADE', ''),
('b1a9595a-7f46-11e3-af7c-005056be1f7b-Bm2E-Fxul-A3f0-HDqj-BmfZ-GKwA', 'b1a9595a-7f46-11e3-af7c-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('b1a9595a-7f46-11e3-af7c-005056be1f7b-BogP-FqPO-AIZf-HEe0-ByH1-G36l', 'b1a9595a-7f46-11e3-af7c-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('b1a9595a-7f46-11e3-af7c-005056be1f7b-BRd6-FNxh-AWVK-H4gF-BvXL-GLki', 'b1a9595a-7f46-11e3-af7c-005056be1f7b', 'e765ba72-107d-11e3-8a5d-0050569a1080', 'база А', ''),
('b1a9595a-7f46-11e3-af7c-005056be1f7b-BwWT-FppM-Aejk-HHka-BmZT-Glin', 'b1a9595a-7f46-11e3-af7c-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('b1a9595a-7f46-11e3-af7c-005056be1f7b-Byzh-FQld-AuPB-Ht9c-BJQ6-GFet', 'b1a9595a-7f46-11e3-af7c-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый матовый', ''),
('b1a9595a-7f46-11e3-af7c-005056be1f7b-Bz30-FIUo-AOw8-H1f7-BsbE-GA5R', 'b1a9595a-7f46-11e3-af7c-005056be1f7b', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '5', 'л'),
('b3740593-f78f-11e3-8c8a-005056be1f7b-BDgr-FHNb-ANZf-HjeP-BoPl-Gu8Q', 'b3740593-f78f-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('b3740593-f78f-11e3-8c8a-005056be1f7b-Bfhr-Ffp7-AfwZ-HH8L-BLAs-G4I6', 'b3740593-f78f-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('b3740593-f78f-11e3-8c8a-005056be1f7b-Bm2C-FC00-AOKA-H7EI-B2Zd-GMQY', 'b3740593-f78f-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '20000', 'г'),
('b3740593-f78f-11e3-8c8a-005056be1f7b-BNmD-FTc3-AtnE-HruF-BLDW-GFuE', 'b3740593-f78f-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('b3740593-f78f-11e3-8c8a-005056be1f7b-BTQ4-Fqsq-AmB6-HSo4-BwPg-Gy00', 'b3740593-f78f-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'желтый', ''),
('b3740593-f78f-11e3-8c8a-005056be1f7b-BVVU-F15z-AGjF-HsUC-B91k-GqWP', 'b3740593-f78f-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('b3740593-f78f-11e3-8c8a-005056be1f7b-BvWG-Frov-AkbA-HHP0-BHcm-GKwE', 'b3740593-f78f-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('b54ba125-f78e-11e3-8c8a-005056be1f7b-B1PJ-FCcw-A7wn-HzPS-BJIn-GaDX', 'b54ba125-f78e-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('b54ba125-f78e-11e3-8c8a-005056be1f7b-B39c-FV3S-APEk-HcOz-Bgou-GWEX', 'b54ba125-f78e-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'оранжевый', ''),
('b54ba125-f78e-11e3-8c8a-005056be1f7b-B3UR-F6uk-ADhY-HDZA-BqfO-GBPc', 'b54ba125-f78e-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('b54ba125-f78e-11e3-8c8a-005056be1f7b-BBG5-FaKT-Aa1y-Hp2E-BIrU-GSux', 'b54ba125-f78e-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '6000', 'г'),
('b54ba125-f78e-11e3-8c8a-005056be1f7b-Be3E-FxmO-Amso-H0eP-BcWN-G6sF', 'b54ba125-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('b54ba125-f78e-11e3-8c8a-005056be1f7b-BGOU-FuOz-A0rL-HNm5-BT13-GdpT', 'b54ba125-f78e-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('b54ba125-f78e-11e3-8c8a-005056be1f7b-BO9K-FzbY-Ao8D-HZTH-BxyA-G3lm', 'b54ba125-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('b5957aa3-f787-11e3-8c8a-005056be1f7b-B2xX-Fp6W-ALHd-HpnW-B75s-GreH', 'b5957aa3-f787-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '800', 'г'),
('b5957aa3-f787-11e3-8c8a-005056be1f7b-BBam-FhHM-AOPn-HzZq-Brjj-GKFQ', 'b5957aa3-f787-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('b5957aa3-f787-11e3-8c8a-005056be1f7b-BdSx-FTaD-AITc-HJKg-BSL8-G6sE', 'b5957aa3-f787-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('b5957aa3-f787-11e3-8c8a-005056be1f7b-BI8U-Fwwu-AdeT-HCoY-BTIr-GHcH', 'b5957aa3-f787-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('b5957aa3-f787-11e3-8c8a-005056be1f7b-BK3c-FfqT-ANhz-HHPy-B4ZA-G1DJ', 'b5957aa3-f787-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'вишневый', ''),
('b5957aa3-f787-11e3-8c8a-005056be1f7b-BKkb-Fntl-AKCx-HH9g-BLGe-Gg4Q', 'b5957aa3-f787-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('b5957aa3-f787-11e3-8c8a-005056be1f7b-BQWv-FkZZ-A0si-HqzA-ByAl-GPnV', 'b5957aa3-f787-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('b7e28649-21de-11df-860d-000e0c431b58-B3vR-FrOL-AkGD-H7l4-BD1O-GyMq', 'b7e28649-21de-11df-860d-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('b7e28649-21de-11df-860d-000e0c431b58-B7cn-F9ut-AeoG-HHGV-BKNg-Gi1h', 'b7e28649-21de-11df-860d-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('b7e28649-21de-11df-860d-000e0c431b58-BjSi-FmPK-AgSA-HuGM-BawF-GsgL', 'b7e28649-21de-11df-860d-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска фактурная', ''),
('b7e28649-21de-11df-860d-000e0c431b58-BMLA-FkxI-AC5J-HQR2-Bs1J-GRdZ', 'b7e28649-21de-11df-860d-000e0c431b58', '1d08380b-ce34-11e4-a80e-005056be1f7a', '9000', 'г'),
('b7e28649-21de-11df-860d-000e0c431b58-BOUu-FVc2-AqmE-HML6-Bu57-GSEe', 'b7e28649-21de-11df-860d-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('b7e28649-21de-11df-860d-000e0c431b58-Bp3S-FuFd-ApzX-HlHc-BGAO-GXrc', 'b7e28649-21de-11df-860d-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('b7e28649-21de-11df-860d-000e0c431b58-BtBi-FKik-Aqwy-Hc54-B32W-Gf1G', 'b7e28649-21de-11df-860d-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('b7e2864b-21de-11df-860d-000e0c431b58-BfxB-FyVJ-AKLq-HX6f-BkN5-G3dm', 'b7e2864b-21de-11df-860d-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('b7e2864b-21de-11df-860d-000e0c431b58-BHLY-FmAK-AKAa-HhCg-BONv-GIFZ', 'b7e2864b-21de-11df-860d-000e0c431b58', '1d08380b-ce34-11e4-a80e-005056be1f7a', '18000', 'г'),
('b7e2864b-21de-11df-860d-000e0c431b58-BLP4-F2ny-AXNB-HRFf-B5Xn-GbOC', 'b7e2864b-21de-11df-860d-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска фактурная', ''),
('b7e2864b-21de-11df-860d-000e0c431b58-Bpxc-FPRF-At2T-HhIV-B1gN-GtzM', 'b7e2864b-21de-11df-860d-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('b7e2864b-21de-11df-860d-000e0c431b58-BRHh-F2Zq-A7We-Hzvi-BAQW-GBFr', 'b7e2864b-21de-11df-860d-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('b7e2864b-21de-11df-860d-000e0c431b58-BSYR-FQrZ-An6j-HSIF-B7y4-GZDK', 'b7e2864b-21de-11df-860d-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('b7e2864b-21de-11df-860d-000e0c431b58-BY33-FS9j-AjF9-HSHW-BNKp-GNfo', 'b7e2864b-21de-11df-860d-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('b8d52c0e-7f46-11e3-af7c-005056be1f7b-BaMz-FWFN-AZ19-Hv1c-Bmb9-GhvJ', 'b8d52c0e-7f46-11e3-af7c-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'PARADE', ''),
('b8d52c0e-7f46-11e3-af7c-005056be1f7b-BCT3-Fmbd-ADD4-HWob-B05O-GaH3', 'b8d52c0e-7f46-11e3-af7c-005056be1f7b', 'e765ba72-107d-11e3-8a5d-0050569a1080', 'база А', ''),
('b8d52c0e-7f46-11e3-af7c-005056be1f7b-BIEV-FGzM-Ajcn-HhAZ-BrVD-GBZc', 'b8d52c0e-7f46-11e3-af7c-005056be1f7b', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '9', 'л'),
('b8d52c0e-7f46-11e3-af7c-005056be1f7b-Bkg5-FULx-A3Jt-HuAR-BDU4-GZh2', 'b8d52c0e-7f46-11e3-af7c-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('b8d52c0e-7f46-11e3-af7c-005056be1f7b-BPwa-FNn6-AJWX-HOWR-BgIn-GzyS', 'b8d52c0e-7f46-11e3-af7c-005056be1f7b', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'латексная', ''),
('b8d52c0e-7f46-11e3-af7c-005056be1f7b-BUlW-FN8B-Ao86-H4YD-BvuV-G0e2', 'b8d52c0e-7f46-11e3-af7c-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('b8d52c0e-7f46-11e3-af7c-005056be1f7b-BVoT-FEZU-AVcp-HP2N-BGSZ-G6of', 'b8d52c0e-7f46-11e3-af7c-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('b8d52c0e-7f46-11e3-af7c-005056be1f7b-BWRO-Ftgl-ABDt-Hp3i-B962-G1iS', 'b8d52c0e-7f46-11e3-af7c-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый матовый', ''),
('b8d52c0e-7f46-11e3-af7c-005056be1f7b-BWv6-FCAx-APGF-HpCu-BKKy-GfRo', 'b8d52c0e-7f46-11e3-af7c-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('b948502d-e1ad-11df-a0c5-000e0c431b58-B8fE-FRP8-AHuV-HO5q-BRu4-GLE8', 'b948502d-e1ad-11df-a0c5-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('b948502d-e1ad-11df-a0c5-000e0c431b58-BcPn-Fp3n-Aa5t-HzGP-BGY4-Ghfh', 'b948502d-e1ad-11df-a0c5-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для крыш', ''),
('b948502d-e1ad-11df-a0c5-000e0c431b58-BDCp-Fxy8-Ac3N-HmAu-BCFY-GMgR', 'b948502d-e1ad-11df-a0c5-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('b948502d-e1ad-11df-a0c5-000e0c431b58-BFoK-Fa3E-AHJz-HAV4-B9JI-GT8q', 'b948502d-e1ad-11df-a0c5-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KRASS', ''),
('b948502d-e1ad-11df-a0c5-000e0c431b58-Bka4-F6jn-AkxT-Hu31-BeYH-GKVC', 'b948502d-e1ad-11df-a0c5-000e0c431b58', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'битумная', ''),
('b948502d-e1ad-11df-a0c5-000e0c431b58-BRnb-FGow-AAm7-HI64-Bz06-Gewu', 'b948502d-e1ad-11df-a0c5-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.3', 'л'),
('b948502d-e1ad-11df-a0c5-000e0c431b58-BUfJ-FQoF-AJeF-HF03-BzbH-GcH0', 'b948502d-e1ad-11df-a0c5-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'герметик', ''),
('b948502d-e1ad-11df-a0c5-000e0c431b58-ByOU-Fxiu-AF9t-HwSp-BDPK-GHgZ', 'b948502d-e1ad-11df-a0c5-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('b948502d-e1ad-11df-a0c5-000e0c431b58-BzM4-FTEn-AKX9-HUZR-BZ0r-GT6Q', 'b948502d-e1ad-11df-a0c5-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'черный', ''),
('ba1232df-ec8c-11e3-9eab-005056be1f7b-B2RI-FZrf-AzPR-HKTS-BQuB-GgSN', 'ba1232df-ec8c-11e3-9eab-005056be1f7b', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.5', 'л'),
('ba1232df-ec8c-11e3-9eab-005056be1f7b-BbsQ-FhLg-Aiiv-HH2K-BYHd-GuAC', 'ba1232df-ec8c-11e3-9eab-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('ba1232df-ec8c-11e3-9eab-005056be1f7b-BD1v-Fz9n-AAXv-HdIv-Bg0C-GoZu', 'ba1232df-ec8c-11e3-9eab-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'растворитель', ''),
('ba1232df-ec8c-11e3-9eab-005056be1f7b-BQSV-F3jG-AQFh-HaXZ-BiwV-GDAF', 'ba1232df-ec8c-11e3-9eab-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('ba1232df-ec8c-11e3-9eab-005056be1f7b-BY6f-FOtX-AsLG-HcPA-BWPj-GTZQ', 'ba1232df-ec8c-11e3-9eab-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('bb036923-a661-11e2-9827-005056be3574-B5lr-FB3u-A0jC-Hyb4-Bsv2-GGaw', 'bb036923-a661-11e2-9827-005056be3574', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'серебрянный', ''),
('bb036923-a661-11e2-9827-005056be3574-B6Ts-FIeq-An5K-H68f-B93H-Gq40', 'bb036923-a661-11e2-9827-005056be3574', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('bb036923-a661-11e2-9827-005056be3574-Ba3i-FdrA-AWaw-HOgM-BAcg-GtkA', 'bb036923-a661-11e2-9827-005056be3574', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('bb036923-a661-11e2-9827-005056be3574-BaO6-FkK3-AGJv-HOzo-BNQh-GwtP', 'bb036923-a661-11e2-9827-005056be3574', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('bb036923-a661-11e2-9827-005056be3574-BGMw-F2am-Ago3-HDbm-BSOs-G8yD', 'bb036923-a661-11e2-9827-005056be3574', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.5', 'л'),
('bb036923-a661-11e2-9827-005056be3574-BJkY-Fx4d-ACL9-HgZD-BJgQ-G7Xr', 'bb036923-a661-11e2-9827-005056be3574', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('bb036923-a661-11e2-9827-005056be3574-BxGp-FjUL-AwVo-HSEO-BSed-GNFn', 'bb036923-a661-11e2-9827-005056be3574', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('bc816f7f-f78f-11e3-8c8a-005056be1f7b-BhIZ-FWbM-AAfv-HzEt-BlRD-G2O2', 'bc816f7f-f78f-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('bc816f7f-f78f-11e3-8c8a-005056be1f7b-Bjmg-F0nZ-A2xt-Haqj-BtFQ-Gp1u', 'bc816f7f-f78f-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('bc816f7f-f78f-11e3-8c8a-005056be1f7b-BnKb-FgsV-Aef9-HaUE-Bt2N-GIOp', 'bc816f7f-f78f-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '20000', 'г'),
('bc816f7f-f78f-11e3-8c8a-005056be1f7b-BNUP-F8xw-A7k3-Hi49-Bwm6-GyGS', 'bc816f7f-f78f-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('bc816f7f-f78f-11e3-8c8a-005056be1f7b-Bt8C-FdXs-ACGy-HTwo-BDjy-Gi8w', 'bc816f7f-f78f-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('bc816f7f-f78f-11e3-8c8a-005056be1f7b-BwJe-FY9o-AWdt-Hdg0-BwGl-GTFO', 'bc816f7f-f78f-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('bc816f7f-f78f-11e3-8c8a-005056be1f7b-BZr7-FueH-ATtl-HyK9-BeFG-GDPT', 'bc816f7f-f78f-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'вишневый', ''),
('beb861cb-f787-11e3-8c8a-005056be1f7b-Bdpf-F963-A2aX-HhVO-B8DM-GtEF', 'beb861cb-f787-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '800', 'г'),
('beb861cb-f787-11e3-8c8a-005056be1f7b-BfCi-FM6A-AGTl-Har3-B9dG-GvXO', 'beb861cb-f787-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('beb861cb-f787-11e3-8c8a-005056be1f7b-BIwb-FWvv-AGVT-H4WC-BF3E-GoF0', 'beb861cb-f787-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('beb861cb-f787-11e3-8c8a-005056be1f7b-BMCa-FLYe-ATXr-H4c4-BYkU-GYQi', 'beb861cb-f787-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'красный', ''),
('beb861cb-f787-11e3-8c8a-005056be1f7b-BpLT-FQmB-AIkf-HPW4-Befp-G62a', 'beb861cb-f787-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('beb861cb-f787-11e3-8c8a-005056be1f7b-Br9w-FB3J-AD8B-HHlG-BHQR-Gbh5', 'beb861cb-f787-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('beb861cb-f787-11e3-8c8a-005056be1f7b-BvOx-F5HW-AYMO-H9Uu-Bkhx-GBtL', 'beb861cb-f787-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('bef8d7ea-f78e-11e3-8c8a-005056be1f7b-B4cd-F9Bi-Acsz-HuBo-BaK9-GZuF', 'bef8d7ea-f78e-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '6000', 'г'),
('bef8d7ea-f78e-11e3-8c8a-005056be1f7b-BaW7-F9js-Akjt-HIa5-B3c4-G8ar', 'bef8d7ea-f78e-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'желтый', ''),
('bef8d7ea-f78e-11e3-8c8a-005056be1f7b-BBMr-FWS2-AIFF-HjFd-BqQR-GTyq', 'bef8d7ea-f78e-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('bef8d7ea-f78e-11e3-8c8a-005056be1f7b-BFoM-FKqL-AZgW-HkL7-B5mT-G1k3', 'bef8d7ea-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('bef8d7ea-f78e-11e3-8c8a-005056be1f7b-BiKc-FRT3-AMMV-HFJv-BxOa-GAYH', 'bef8d7ea-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('bef8d7ea-f78e-11e3-8c8a-005056be1f7b-BIT0-FjHJ-Aly3-Hy73-BU9F-GCUX', 'bef8d7ea-f78e-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('bef8d7ea-f78e-11e3-8c8a-005056be1f7b-BLyn-FiYy-AeTb-HxJB-BqsM-GIAf', 'bef8d7ea-f78e-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('bf4804e2-fc0e-11dd-bd91-000e0c431b58-B312-F8gC-AWRs-HbSp-BaEE-Go8Z', 'bf4804e2-fc0e-11dd-bd91-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '2.5', 'л'),
('bf4804e2-fc0e-11dd-bd91-000e0c431b58-B4V1-FzCE-AYWJ-HsnJ-BqDc-Gx36', 'bf4804e2-fc0e-11dd-bd91-000e0c431b58', 'e765ba72-107d-11e3-8a5d-0050569a1080', 'база С', ''),
('bf4804e2-fc0e-11dd-bd91-000e0c431b58-B8tS-FjxG-ADvF-HqLZ-BupE-GB89', 'bf4804e2-fc0e-11dd-bd91-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'PARADE', ''),
('bf4804e2-fc0e-11dd-bd91-000e0c431b58-BepQ-FR5u-AbPH-H7bV-Bes7-GZJR', 'bf4804e2-fc0e-11dd-bd91-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('bf4804e2-fc0e-11dd-bd91-000e0c431b58-BKIa-FVaF-AVNw-HOeJ-BVXf-GMNh', 'bf4804e2-fc0e-11dd-bd91-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'бесцветный', ''),
('bf4804e2-fc0e-11dd-bd91-000e0c431b58-BQl5-FaUi-AkAl-HDye-B99n-GZTD', 'bf4804e2-fc0e-11dd-bd91-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('bf4804e2-fc0e-11dd-bd91-000e0c431b58-BVMP-FuXe-AT1r-Hlld-BrdT-Gib1', 'bf4804e2-fc0e-11dd-bd91-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('bf4804e2-fc0e-11dd-bd91-000e0c431b58-BvYO-F4Vq-AOzZ-HLPi-BcMS-GvwF', 'bf4804e2-fc0e-11dd-bd91-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('bf4804e2-fc0e-11dd-bd91-000e0c431b58-BZSH-FzcX-AQfK-HRoA-Bwr4-GQXH', 'bf4804e2-fc0e-11dd-bd91-000e0c431b58', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('bf4804e4-fc0e-11dd-bd91-000e0c431b58-B5G0-F7D2-A2W5-HUMs-BHbY-GJMP', 'bf4804e4-fc0e-11dd-bd91-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'PARADE', ''),
('bf4804e4-fc0e-11dd-bd91-000e0c431b58-Bb0r-Fcty-ApKk-Hu4G-B6FS-G7pG', 'bf4804e4-fc0e-11dd-bd91-000e0c431b58', 'e765ba72-107d-11e3-8a5d-0050569a1080', 'база С', ''),
('bf4804e4-fc0e-11dd-bd91-000e0c431b58-BFsA-FO0S-AFsI-HP0m-Boal-GW4V', 'bf4804e4-fc0e-11dd-bd91-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'бесцветный', ''),
('bf4804e4-fc0e-11dd-bd91-000e0c431b58-BKig-FvTZ-A3Pf-HKLL-BRR4-GSf4', 'bf4804e4-fc0e-11dd-bd91-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('bf4804e4-fc0e-11dd-bd91-000e0c431b58-Bkll-Ft2k-AVfB-H835-BTCd-Gzyw', 'bf4804e4-fc0e-11dd-bd91-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('bf4804e4-fc0e-11dd-bd91-000e0c431b58-BPqB-Fu2N-A6Ie-HzbA-BsBl-GTvd', 'bf4804e4-fc0e-11dd-bd91-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'фасадная', ''),
('bf4804e4-fc0e-11dd-bd91-000e0c431b58-BQZu-FH3u-Auzo-Hcvf-BPiN-GZQQ', 'bf4804e4-fc0e-11dd-bd91-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('bf4804e4-fc0e-11dd-bd91-000e0c431b58-BWHY-F28z-A2p2-Hd0m-B75s-G61w', 'bf4804e4-fc0e-11dd-bd91-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('bf4804e4-fc0e-11dd-bd91-000e0c431b58-BxsJ-FrCV-AZKx-HxT0-BDqH-GbhE', 'bf4804e4-fc0e-11dd-bd91-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '2.5', 'л'),
('c017590e-fbe7-11e0-b702-001cc494be80-B5yy-F8wb-AEzQ-HqwU-BCcE-GlJQ', 'c017590e-fbe7-11e0-b702-001cc494be80', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('c017590e-fbe7-11e0-b702-001cc494be80-B8yS-FU4T-Ab1D-HNxa-BfRv-GMhy', 'c017590e-fbe7-11e0-b702-001cc494be80', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('c017590e-fbe7-11e0-b702-001cc494be80-Ba1i-FZJU-AwtD-H8mG-BCym-G8EV', 'c017590e-fbe7-11e0-b702-001cc494be80', 'e8287600-ad96-11e3-b114-005056be1f7c', 'НОВЫЕ ТЕХНОЛОГИИ', ''),
('c017590e-fbe7-11e0-b702-001cc494be80-BEKe-FEXp-APd0-HSvW-BktL-G4DE', 'c017590e-fbe7-11e0-b702-001cc494be80', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('c017590e-fbe7-11e0-b702-001cc494be80-BeVr-FPC3-AnqA-HMLK-BGTC-GSXR', 'c017590e-fbe7-11e0-b702-001cc494be80', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'супербелый', ''),
('c017590e-fbe7-11e0-b702-001cc494be80-BlXs-FGT6-AMVi-HI6l-BNzZ-GBxM', 'c017590e-fbe7-11e0-b702-001cc494be80', '1d08380b-ce34-11e4-a80e-005056be1f7a', '3000', 'г'),
('c017590e-fbe7-11e0-b702-001cc494be80-BMf6-FPss-ApOA-Hbah-BQfs-GukF', 'c017590e-fbe7-11e0-b702-001cc494be80', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'интерьерная', ''),
('c017590e-fbe7-11e0-b702-001cc494be80-Bquj-FqL0-AOcf-H7MF-BBm6-GjCF', 'c017590e-fbe7-11e0-b702-001cc494be80', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('c0175910-fbe7-11e0-b702-001cc494be80-BbW7-Fmtm-Adi0-HFaU-BkhF-GXrF', 'c0175910-fbe7-11e0-b702-001cc494be80', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('c0175910-fbe7-11e0-b702-001cc494be80-BCOn-FBUD-AV5k-HbRR-Bg3G-G9MG', 'c0175910-fbe7-11e0-b702-001cc494be80', '1d08380b-ce34-11e4-a80e-005056be1f7a', '6000', 'г'),
('c0175910-fbe7-11e0-b702-001cc494be80-Bd2B-Ftiy-ADlR-HIMb-BZxy-GI5I', 'c0175910-fbe7-11e0-b702-001cc494be80', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'супербелый', ''),
('c0175910-fbe7-11e0-b702-001cc494be80-BDGd-FmOY-ANbN-HndB-Bz84-G2qb', 'c0175910-fbe7-11e0-b702-001cc494be80', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('c0175910-fbe7-11e0-b702-001cc494be80-BHvx-FK0O-AHWs-HLM1-BdaK-GN4I', 'c0175910-fbe7-11e0-b702-001cc494be80', 'e8287600-ad96-11e3-b114-005056be1f7c', 'НОВЫЕ ТЕХНОЛОГИИ', ''),
('c0175910-fbe7-11e0-b702-001cc494be80-Blyb-FU0o-AKdE-HUq9-BdIV-GZuE', 'c0175910-fbe7-11e0-b702-001cc494be80', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('c0175910-fbe7-11e0-b702-001cc494be80-BOUu-Fc8O-AdxL-HWp2-ByWl-G2Ve', 'c0175910-fbe7-11e0-b702-001cc494be80', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'интерьерная', ''),
('c0175910-fbe7-11e0-b702-001cc494be80-BquC-F94P-AZSD-HOa8-BWeD-G1HS', 'c0175910-fbe7-11e0-b702-001cc494be80', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('c0175912-fbe7-11e0-b702-001cc494be80-B21E-FZ1N-A7QG-HBxU-BnYy-GtTS', 'c0175912-fbe7-11e0-b702-001cc494be80', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('c0175912-fbe7-11e0-b702-001cc494be80-BDFE-FJH2-AeuQ-HSdj-BltS-GxN5', 'c0175912-fbe7-11e0-b702-001cc494be80', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'моющаяся', ''),
('c0175912-fbe7-11e0-b702-001cc494be80-BleG-F6df-AY5O-H4sq-BMxO-GDXX', 'c0175912-fbe7-11e0-b702-001cc494be80', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'супербелый', ''),
('c0175912-fbe7-11e0-b702-001cc494be80-Bpll-FBKA-Aggc-HI9E-B1RL-GU1l', 'c0175912-fbe7-11e0-b702-001cc494be80', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('c0175912-fbe7-11e0-b702-001cc494be80-BPsM-Fdm6-AKzt-HY3H-Bwu8-G1Jy', 'c0175912-fbe7-11e0-b702-001cc494be80', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('c0175912-fbe7-11e0-b702-001cc494be80-BR9l-F9Za-A2u9-HIy0-BMdk-Gyfv', 'c0175912-fbe7-11e0-b702-001cc494be80', '1d08380b-ce34-11e4-a80e-005056be1f7a', '3000', 'г'),
('c0175912-fbe7-11e0-b702-001cc494be80-BSGd-FjZ8-AIAq-Hay4-BUiR-GEBD', 'c0175912-fbe7-11e0-b702-001cc494be80', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('c0175912-fbe7-11e0-b702-001cc494be80-BtXt-Fdwl-AkiV-HiYf-BWcl-Gbms', 'c0175912-fbe7-11e0-b702-001cc494be80', 'e8287600-ad96-11e3-b114-005056be1f7c', 'НОВЫЕ ТЕХНОЛОГИИ', ''),
('c0175914-fbe7-11e0-b702-001cc494be80-B7K2-FDUn-ArT6-HWbX-Bwsn-G0u3', 'c0175914-fbe7-11e0-b702-001cc494be80', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('c0175914-fbe7-11e0-b702-001cc494be80-BfBJ-FKuJ-Aywt-H9h3-B3I9-GZcA', 'c0175914-fbe7-11e0-b702-001cc494be80', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('c0175914-fbe7-11e0-b702-001cc494be80-BI2M-FDOo-AbBX-HEAH-B8uv-G8WR', 'c0175914-fbe7-11e0-b702-001cc494be80', '1d08380b-ce34-11e4-a80e-005056be1f7a', '14000', 'г'),
('c0175914-fbe7-11e0-b702-001cc494be80-BkGh-FTCQ-A52s-H2RI-Bq7m-G2gy', 'c0175914-fbe7-11e0-b702-001cc494be80', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('c0175914-fbe7-11e0-b702-001cc494be80-BodK-FkMo-AeUo-Ht0n-BBkK-GvI4', 'c0175914-fbe7-11e0-b702-001cc494be80', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'супербелый', ''),
('c0175914-fbe7-11e0-b702-001cc494be80-BqW3-FZOK-Ah6G-HJwn-B9Rp-GIba', 'c0175914-fbe7-11e0-b702-001cc494be80', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'интерьерная', ''),
('c0175914-fbe7-11e0-b702-001cc494be80-BRQM-FBPu-A4H4-H3hV-B4Ns-Gvn7', 'c0175914-fbe7-11e0-b702-001cc494be80', 'e8287600-ad96-11e3-b114-005056be1f7c', 'НОВЫЕ ТЕХНОЛОГИИ', ''),
('c0175914-fbe7-11e0-b702-001cc494be80-Btn0-Fmgh-A9Zu-HrLY-BnHi-GeK4', 'c0175914-fbe7-11e0-b702-001cc494be80', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('c0175916-fbe7-11e0-b702-001cc494be80-B0ry-FdZV-AxUy-HERC-BB3V-GIjF', 'c0175916-fbe7-11e0-b702-001cc494be80', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('c0175916-fbe7-11e0-b702-001cc494be80-B78B-Fuqo-AEKF-Hb7y-B894-Gghf', 'c0175916-fbe7-11e0-b702-001cc494be80', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'моющаяся', ''),
('c0175916-fbe7-11e0-b702-001cc494be80-BafR-F8zx-AF5e-HrgT-B5dR-G7O8', 'c0175916-fbe7-11e0-b702-001cc494be80', 'e8287600-ad96-11e3-b114-005056be1f7c', 'НОВЫЕ ТЕХНОЛОГИИ', ''),
('c0175916-fbe7-11e0-b702-001cc494be80-BCEi-Fjm4-A8vh-HTgI-BFql-GlzN', 'c0175916-fbe7-11e0-b702-001cc494be80', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('c0175916-fbe7-11e0-b702-001cc494be80-BKdg-FIlU-AHyy-HsmT-BdbW-Gvsg', 'c0175916-fbe7-11e0-b702-001cc494be80', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('c0175916-fbe7-11e0-b702-001cc494be80-BLEx-FNdB-AwXp-H2jR-Bvj0-GjCY', 'c0175916-fbe7-11e0-b702-001cc494be80', '1d08380b-ce34-11e4-a80e-005056be1f7a', '6000', 'г'),
('c0175916-fbe7-11e0-b702-001cc494be80-BlSH-FruD-AfrB-HYOj-B5oE-GLl4', 'c0175916-fbe7-11e0-b702-001cc494be80', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('c0175916-fbe7-11e0-b702-001cc494be80-ByCS-FRKQ-AWBh-HhVX-BInW-Gulv', 'c0175916-fbe7-11e0-b702-001cc494be80', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'супербелый', ''),
('c0175918-fbe7-11e0-b702-001cc494be80-B3Ec-FDnC-Ad4k-H4d8-BNB6-G866', 'c0175918-fbe7-11e0-b702-001cc494be80', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('c0175918-fbe7-11e0-b702-001cc494be80-BEh1-FkJy-Acqh-H0Ig-BZ4F-GhOl', 'c0175918-fbe7-11e0-b702-001cc494be80', '1d08380b-ce34-11e4-a80e-005056be1f7a', '14000', 'г'),
('c0175918-fbe7-11e0-b702-001cc494be80-Bh9u-F40X-AQww-HMmJ-BkK7-GZyj', 'c0175918-fbe7-11e0-b702-001cc494be80', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'супербелый', ''),
('c0175918-fbe7-11e0-b702-001cc494be80-BSy6-F4sZ-A26a-Hx4V-BsOh-GaX6', 'c0175918-fbe7-11e0-b702-001cc494be80', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'моющаяся', ''),
('c0175918-fbe7-11e0-b702-001cc494be80-BTBX-FtyQ-AEhf-Hm83-Bhth-Gb0a', 'c0175918-fbe7-11e0-b702-001cc494be80', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('c0175918-fbe7-11e0-b702-001cc494be80-BuiH-FUfE-APfU-H0Zd-Bbse-GycT', 'c0175918-fbe7-11e0-b702-001cc494be80', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('c0175918-fbe7-11e0-b702-001cc494be80-BVLs-FIYU-AR9e-HOYT-BxRX-GQUB', 'c0175918-fbe7-11e0-b702-001cc494be80', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('c0175918-fbe7-11e0-b702-001cc494be80-Bvo5-FP3S-Ajqk-H885-B0Pt-G5Jb', 'c0175918-fbe7-11e0-b702-001cc494be80', 'e8287600-ad96-11e3-b114-005056be1f7c', 'НОВЫЕ ТЕХНОЛОГИИ', ''),
('c017591a-fbe7-11e0-b702-001cc494be80-B0ms-Fu2P-AZrk-HpaD-BcDj-G9C0', 'c017591a-fbe7-11e0-b702-001cc494be80', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('c017591a-fbe7-11e0-b702-001cc494be80-B3OB-Fg9I-AqST-H606-BLb1-G0zx', 'c017591a-fbe7-11e0-b702-001cc494be80', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('c017591a-fbe7-11e0-b702-001cc494be80-Bb6y-FY7W-Ayhu-HVO8-BBC4-Gfvq', 'c017591a-fbe7-11e0-b702-001cc494be80', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'супербелый', ''),
('c017591a-fbe7-11e0-b702-001cc494be80-BlOz-FOLV-Am1u-HOgp-BzVQ-Gtcx', 'c017591a-fbe7-11e0-b702-001cc494be80', 'e8287600-ad96-11e3-b114-005056be1f7c', 'НОВЫЕ ТЕХНОЛОГИИ', ''),
('c017591a-fbe7-11e0-b702-001cc494be80-BMMH-FeMR-A7AD-HmoE-Bfnr-GNXi', 'c017591a-fbe7-11e0-b702-001cc494be80', '1d08380b-ce34-11e4-a80e-005056be1f7a', '3000', 'г'),
('c017591a-fbe7-11e0-b702-001cc494be80-Bngf-F9aN-AKHR-H0Kc-Bywq-GnA3', 'c017591a-fbe7-11e0-b702-001cc494be80', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('c017591a-fbe7-11e0-b702-001cc494be80-BVoU-FG0j-ADBm-H8gY-BoYm-Gq5l', 'c017591a-fbe7-11e0-b702-001cc494be80', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('c017591a-fbe7-11e0-b702-001cc494be80-Byk4-FHg4-ADsV-H5sL-BrEz-GCKy', 'c017591a-fbe7-11e0-b702-001cc494be80', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'фасадная', ''),
('c017591c-fbe7-11e0-b702-001cc494be80-B6By-FQO2-AAkQ-HSBx-BwbN-GH0g', 'c017591c-fbe7-11e0-b702-001cc494be80', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('c017591c-fbe7-11e0-b702-001cc494be80-BaaV-FhTA-AOZs-Hdrh-B32j-G8fd', 'c017591c-fbe7-11e0-b702-001cc494be80', 'e8287600-ad96-11e3-b114-005056be1f7c', 'НОВЫЕ ТЕХНОЛОГИИ', ''),
('c017591c-fbe7-11e0-b702-001cc494be80-BDhM-FHK2-ALpe-H343-BbWp-GqaJ', 'c017591c-fbe7-11e0-b702-001cc494be80', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('c017591c-fbe7-11e0-b702-001cc494be80-BdxP-FDdq-AG7u-Hp5w-BpG0-GwlM', 'c017591c-fbe7-11e0-b702-001cc494be80', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'супербелый', ''),
('c017591c-fbe7-11e0-b702-001cc494be80-BGu2-FWC3-AJyU-HX7T-B5Eg-G15O', 'c017591c-fbe7-11e0-b702-001cc494be80', '1d08380b-ce34-11e4-a80e-005056be1f7a', '6000', 'г'),
('c017591c-fbe7-11e0-b702-001cc494be80-BHN7-F1rn-AXke-H7iA-BZdC-GOtQ', 'c017591c-fbe7-11e0-b702-001cc494be80', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('c017591c-fbe7-11e0-b702-001cc494be80-BJBE-Fo58-AgVU-HMCu-BVZR-Gage', 'c017591c-fbe7-11e0-b702-001cc494be80', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'фасадная', ''),
('c017591c-fbe7-11e0-b702-001cc494be80-BWgF-FHM0-A42G-H4or-BFsO-GSzZ', 'c017591c-fbe7-11e0-b702-001cc494be80', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('c017591e-fbe7-11e0-b702-001cc494be80-B1GG-FyJH-Asw5-H24t-BhQS-Gwgj', 'c017591e-fbe7-11e0-b702-001cc494be80', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('c017591e-fbe7-11e0-b702-001cc494be80-BDAB-FWTO-AYxe-H0ZU-BpHa-Gd7j', 'c017591e-fbe7-11e0-b702-001cc494be80', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('c017591e-fbe7-11e0-b702-001cc494be80-BDFX-Fb0u-ASi7-HBha-BkYg-GrNq', 'c017591e-fbe7-11e0-b702-001cc494be80', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('c017591e-fbe7-11e0-b702-001cc494be80-BsFy-FyJS-AS6Q-HSvq-BBn0-Gebz', 'c017591e-fbe7-11e0-b702-001cc494be80', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'супербелый', ''),
('c017591e-fbe7-11e0-b702-001cc494be80-BWiO-FPQR-AjyY-H5X1-BiLs-G0dj', 'c017591e-fbe7-11e0-b702-001cc494be80', 'e8287600-ad96-11e3-b114-005056be1f7c', 'НОВЫЕ ТЕХНОЛОГИИ', ''),
('c017591e-fbe7-11e0-b702-001cc494be80-BwOe-FChP-Asi3-HsDT-BhGU-Gjco', 'c017591e-fbe7-11e0-b702-001cc494be80', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('c017591e-fbe7-11e0-b702-001cc494be80-By2b-FS11-Amg9-HDA5-BmwI-GHzp', 'c017591e-fbe7-11e0-b702-001cc494be80', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'фасадная', ''),
('c017591e-fbe7-11e0-b702-001cc494be80-By6d-FsxX-AcUn-HuGJ-BTKP-GrmP', 'c017591e-fbe7-11e0-b702-001cc494be80', '1d08380b-ce34-11e4-a80e-005056be1f7a', '14000', 'г'),
('c2d90e40-f78f-11e3-8c8a-005056be1f7b-B6u7-FPlb-Ad16-HQte-BqX4-G1Nq', 'c2d90e40-f78f-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'красный', ''),
('c2d90e40-f78f-11e3-8c8a-005056be1f7b-BB8k-Fqjx-A9j6-H0gS-Bm6I-GGPP', 'c2d90e40-f78f-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('c2d90e40-f78f-11e3-8c8a-005056be1f7b-BtsE-FbqW-Avpp-HCPp-B4mn-GT5m', 'c2d90e40-f78f-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '20000', 'г'),
('c2d90e40-f78f-11e3-8c8a-005056be1f7b-BUDD-F6vr-AuJs-H8RT-B0TR-GjA1', 'c2d90e40-f78f-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('c2d90e40-f78f-11e3-8c8a-005056be1f7b-BW9Z-FR97-Akl2-HssG-B9CK-GB96', 'c2d90e40-f78f-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('c2d90e40-f78f-11e3-8c8a-005056be1f7b-BWZu-Fkx4-AWjp-HlMR-BAHB-G8Xn', 'c2d90e40-f78f-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('c2d90e40-f78f-11e3-8c8a-005056be1f7b-BY1d-FTGN-Ayxk-Hroy-BXAN-GIlB', 'c2d90e40-f78f-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('c4df9e0d-00c0-11e2-a554-005056be3bd8-B5cb-F92v-A3HG-HhSC-BBCD-GcLj', 'c4df9e0d-00c0-11e2-a554-005056be3bd8', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('c4df9e0d-00c0-11e2-a554-005056be3bd8-BBt6-Fl1k-AE8Y-HeOX-Bo8f-GFun', 'c4df9e0d-00c0-11e2-a554-005056be3bd8', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'коричневый', ''),
('c4df9e0d-00c0-11e2-a554-005056be3bd8-BEZe-FL7x-AN8z-HRaB-B1ju-GjWe', 'c4df9e0d-00c0-11e2-a554-005056be3bd8', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.75', 'л'),
('c4df9e0d-00c0-11e2-a554-005056be3bd8-Bf9j-Fj8p-AIHE-HZT5-BPVo-GK7e', 'c4df9e0d-00c0-11e2-a554-005056be3bd8', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('c4df9e0d-00c0-11e2-a554-005056be3bd8-Bfu7-FVBX-AX37-HHbT-Bm01-GgQ6', 'c4df9e0d-00c0-11e2-a554-005056be3bd8', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'молотковая эмаль-грунт', ''),
('c4df9e0d-00c0-11e2-a554-005056be3bd8-Bhh4-FQFh-AU7G-H1Qm-BNVC-Gsg9', 'c4df9e0d-00c0-11e2-a554-005056be3bd8', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для ржавчины', ''),
('c4df9e0d-00c0-11e2-a554-005056be3bd8-BIss-Fwu9-ALZt-HhnD-B2if-GTgX', 'c4df9e0d-00c0-11e2-a554-005056be3bd8', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('c4df9e0d-00c0-11e2-a554-005056be3bd8-BuAb-FIfq-AgJn-HBPY-BpvW-GOUU', 'c4df9e0d-00c0-11e2-a554-005056be3bd8', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('c4df9e0f-00c0-11e2-a554-005056be3bd8-BbJl-Fppz-AClO-HSlT-BRFG-Gx6V', 'c4df9e0f-00c0-11e2-a554-005056be3bd8', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.75', 'л'),
('c4df9e0f-00c0-11e2-a554-005056be3bd8-BCyY-FJBR-AhLO-HfNW-B6ZQ-GAF0', 'c4df9e0f-00c0-11e2-a554-005056be3bd8', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('c4df9e0f-00c0-11e2-a554-005056be3bd8-Bdwf-F1Pw-AdfJ-Htak-BvdY-GJma', 'c4df9e0f-00c0-11e2-a554-005056be3bd8', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('c4df9e0f-00c0-11e2-a554-005056be3bd8-BEl3-FKbJ-Awpe-HyYB-Bx4v-GtPx', 'c4df9e0f-00c0-11e2-a554-005056be3bd8', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'медный', ''),
('c4df9e0f-00c0-11e2-a554-005056be3bd8-BGnp-FDvH-AXXG-HN4X-BJ89-GCHZ', 'c4df9e0f-00c0-11e2-a554-005056be3bd8', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('c4df9e0f-00c0-11e2-a554-005056be3bd8-BiNx-FwfY-AGxd-HMkZ-BhKz-GX49', 'c4df9e0f-00c0-11e2-a554-005056be3bd8', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'молотковая эмаль-грунт', ''),
('c4df9e0f-00c0-11e2-a554-005056be3bd8-BjZ1-FsJR-AT5u-HrEW-BIfg-GtLM', 'c4df9e0f-00c0-11e2-a554-005056be3bd8', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для ржавчины', ''),
('c4df9e0f-00c0-11e2-a554-005056be3bd8-BL5F-Fqtd-ArgX-HcQm-BPXQ-G6bB', 'c4df9e0f-00c0-11e2-a554-005056be3bd8', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('c4df9e11-00c0-11e2-a554-005056be3bd8-B0CS-FGuS-AtaF-HnYd-BoMC-Gtqg', 'c4df9e11-00c0-11e2-a554-005056be3bd8', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('c4df9e11-00c0-11e2-a554-005056be3bd8-B0Lv-FmlO-A7hM-HWmP-BTeH-G2vh', 'c4df9e11-00c0-11e2-a554-005056be3bd8', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'молотковая эмаль-грунт', ''),
('c4df9e11-00c0-11e2-a554-005056be3bd8-B33i-FRaK-AFnw-H6Ie-Bh77-GjzB', 'c4df9e11-00c0-11e2-a554-005056be3bd8', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для ржавчины', ''),
('c4df9e11-00c0-11e2-a554-005056be3bd8-B867-Fx79-AnnH-Hs0n-Bpx5-G8XA', 'c4df9e11-00c0-11e2-a554-005056be3bd8', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('c4df9e11-00c0-11e2-a554-005056be3bd8-BgGI-FDgx-AzlY-Himy-BNl1-Gfsl', 'c4df9e11-00c0-11e2-a554-005056be3bd8', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('c4df9e11-00c0-11e2-a554-005056be3bd8-BxbC-F4Fa-AWtm-HZcT-B79Z-GEC7', 'c4df9e11-00c0-11e2-a554-005056be3bd8', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.75', 'л'),
('c4df9e11-00c0-11e2-a554-005056be3bd8-BxjF-Feew-AZlh-Haow-BEls-GAZo', 'c4df9e11-00c0-11e2-a554-005056be3bd8', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('c4df9e11-00c0-11e2-a554-005056be3bd8-BxRS-FkG1-ALEq-H5r5-BHuB-GDPo', 'c4df9e11-00c0-11e2-a554-005056be3bd8', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'серебристый', ''),
('c4df9e13-00c0-11e2-a554-005056be3bd8-B9HF-FDWV-AO0R-HnwX-BcUD-GNyJ', 'c4df9e13-00c0-11e2-a554-005056be3bd8', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('c4df9e13-00c0-11e2-a554-005056be3bd8-BCG6-Fen4-AqR1-HAC1-BqIE-GWg8', 'c4df9e13-00c0-11e2-a554-005056be3bd8', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'молотковая эмаль-грунт', ''),
('c4df9e13-00c0-11e2-a554-005056be3bd8-BGOp-FX3b-AvUw-Hyhl-B91t-GmOM', 'c4df9e13-00c0-11e2-a554-005056be3bd8', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для ржавчины', ''),
('c4df9e13-00c0-11e2-a554-005056be3bd8-Biqu-FeFF-ATeF-HUwe-BQBo-GOuI', 'c4df9e13-00c0-11e2-a554-005056be3bd8', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('c4df9e13-00c0-11e2-a554-005056be3bd8-BPK9-Fsdu-AX8E-HOPL-Bm6Y-GxGy', 'c4df9e13-00c0-11e2-a554-005056be3bd8', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('c4df9e13-00c0-11e2-a554-005056be3bd8-BpM4-FZ58-AvCd-HSvo-BeU2-GRHX', 'c4df9e13-00c0-11e2-a554-005056be3bd8', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'серый', ''),
('c4df9e13-00c0-11e2-a554-005056be3bd8-BqNK-FKZv-Ak76-HZUy-BY0B-GRY6', 'c4df9e13-00c0-11e2-a554-005056be3bd8', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('c4df9e13-00c0-11e2-a554-005056be3bd8-BSIo-FXca-A2tb-Hg8M-Bo7T-Gu0q', 'c4df9e13-00c0-11e2-a554-005056be3bd8', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.75', 'л'),
('c6d784e3-f78e-11e3-8c8a-005056be1f7b-Bja7-FHae-AmSP-H8AC-Bjli-GCDT', 'c6d784e3-f78e-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('c6d784e3-f78e-11e3-8c8a-005056be1f7b-Blfd-FcvV-AwQg-Hpns-BM12-G2rj', 'c6d784e3-f78e-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('c6d784e3-f78e-11e3-8c8a-005056be1f7b-BMJo-F2rr-AsXi-H0he-B3uV-Grxl', 'c6d784e3-f78e-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('c6d784e3-f78e-11e3-8c8a-005056be1f7b-BN1y-FCQ4-Ar22-HP3U-BfK4-GWMg', 'c6d784e3-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('c6d784e3-f78e-11e3-8c8a-005056be1f7b-BSi2-FBn1-A7Io-HiC2-Bp1R-GK74', 'c6d784e3-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('c6d784e3-f78e-11e3-8c8a-005056be1f7b-BxZf-FFlC-A56z-HaFp-Bk8i-GAdP', 'c6d784e3-f78e-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'вишневый', ''),
('c6d784e3-f78e-11e3-8c8a-005056be1f7b-BXzj-F5fN-AnrD-Heju-BEIK-GAQk', 'c6d784e3-f78e-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '6000', 'г'),
('c9d25e2b-f787-11e3-8c8a-005056be1f7b-B23B-FmSA-AzjV-Hx2r-B2g5-Gs9v', 'c9d25e2b-f787-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('c9d25e2b-f787-11e3-8c8a-005056be1f7b-Bd0p-FJnH-AZZr-Hf81-BbAs-Gac1', 'c9d25e2b-f787-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('c9d25e2b-f787-11e3-8c8a-005056be1f7b-BD30-FcI6-ARLq-HUTx-Bscy-Gw6r', 'c9d25e2b-f787-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'бирюзовый', ''),
('c9d25e2b-f787-11e3-8c8a-005056be1f7b-BImw-F1Iu-Arju-HZ0N-BQU8-GSWD', 'c9d25e2b-f787-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('c9d25e2b-f787-11e3-8c8a-005056be1f7b-BJM8-FoJK-AWdf-Hqjr-BIbk-GJD3', 'c9d25e2b-f787-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '800', 'г'),
('c9d25e2b-f787-11e3-8c8a-005056be1f7b-BoM2-Fc1b-ANMf-H8Mr-BTVT-GGLc', 'c9d25e2b-f787-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('c9d25e2b-f787-11e3-8c8a-005056be1f7b-BVuC-FCFV-Azxy-Hoku-BVDt-GAMW', 'c9d25e2b-f787-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('ca79b0fb-f78f-11e3-8c8a-005056be1f7b-B5Hi-FJNg-AXMZ-HA42-BKUi-G4zT', 'ca79b0fb-f78f-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '20000', 'г'),
('ca79b0fb-f78f-11e3-8c8a-005056be1f7b-B6Zq-Figu-AOjE-HDwW-B3z5-GiOc', 'ca79b0fb-f78f-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('ca79b0fb-f78f-11e3-8c8a-005056be1f7b-Bart-Ffuf-A3mV-HwKj-BPef-GaWp', 'ca79b0fb-f78f-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('ca79b0fb-f78f-11e3-8c8a-005056be1f7b-BcaX-FNj1-Abxn-HHDq-BCUy-GMSz', 'ca79b0fb-f78f-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('ca79b0fb-f78f-11e3-8c8a-005056be1f7b-BChp-FYiv-Arsh-HOS4-BrvU-GE94', 'ca79b0fb-f78f-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('ca79b0fb-f78f-11e3-8c8a-005056be1f7b-BRHJ-F8B1-AP1V-HAGS-BJvh-GkWd', 'ca79b0fb-f78f-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'бирюзовый', ''),
('ca79b0fb-f78f-11e3-8c8a-005056be1f7b-BT6L-F2Ke-Av3P-HF8N-B04m-GqcJ', 'ca79b0fb-f78f-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('cb22e29d-68ed-11dd-b117-000e0c431b58-B3yb-FU62-AzVA-HQWG-BfTe-G8TD', 'cb22e29d-68ed-11dd-b117-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('cb22e29d-68ed-11dd-b117-000e0c431b58-B7Yb-F0iW-A3nA-H77n-BONU-G7Fr', 'cb22e29d-68ed-11dd-b117-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'РОГНЕДА', ''),
('cb22e29d-68ed-11dd-b117-000e0c431b58-Br7k-F8x6-ASMC-HK54-BEoE-GTmR', 'cb22e29d-68ed-11dd-b117-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('cb22e29d-68ed-11dd-b117-000e0c431b58-BRrr-F3W7-Astc-HGae-BaIb-GBFP', 'cb22e29d-68ed-11dd-b117-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('cb22e29d-68ed-11dd-b117-000e0c431b58-BSVA-FTmX-AZHr-H4FB-B7ZN-GmtW', 'cb22e29d-68ed-11dd-b117-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'антисептический состав', ''),
('cb22e29d-68ed-11dd-b117-000e0c431b58-BTMq-FUJm-A8Xz-HST6-B0Lu-Gagp', 'cb22e29d-68ed-11dd-b117-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '10', 'л'),
('cb22e29f-68ed-11dd-b117-000e0c431b58-BCKT-FY6I-A4Wl-HGuC-Bw0k-GAQC', 'cb22e29f-68ed-11dd-b117-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('cb22e29f-68ed-11dd-b117-000e0c431b58-Be0A-Fdpm-ANcQ-HHjS-B7yO-GIpR', 'cb22e29f-68ed-11dd-b117-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('cb22e29f-68ed-11dd-b117-000e0c431b58-BEjG-FAD7-ANka-HLSd-B7wd-G8QI', 'cb22e29f-68ed-11dd-b117-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '5', 'л'),
('cb22e29f-68ed-11dd-b117-000e0c431b58-Bkdl-F1kK-AJh0-HYpp-BpuO-GwuR', 'cb22e29f-68ed-11dd-b117-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'антисептический состав', ''),
('cb22e29f-68ed-11dd-b117-000e0c431b58-BnwL-Fjwv-A7P0-Hplt-Bxo4-GGCz', 'cb22e29f-68ed-11dd-b117-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('cb22e29f-68ed-11dd-b117-000e0c431b58-BP6L-F1C7-A4z7-HezM-Bgd9-GsDv', 'cb22e29f-68ed-11dd-b117-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'РОГНЕДА', ''),
('cce4b552-7f46-11e3-af7c-005056be1f7b-B1sZ-FDmg-A2vn-Hdaf-B39N-Gk5f', 'cce4b552-7f46-11e3-af7c-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'PARADE', ''),
('cce4b552-7f46-11e3-af7c-005056be1f7b-B6eh-F6sX-AQap-HcEP-BC68-Gb9j', 'cce4b552-7f46-11e3-af7c-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('cce4b552-7f46-11e3-af7c-005056be1f7b-B9zV-FmTv-AHLu-HUwo-BzsJ-GXn3', 'cce4b552-7f46-11e3-af7c-005056be1f7b', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '2.5', 'л'),
('cce4b552-7f46-11e3-af7c-005056be1f7b-BAyf-Ftv4-A2UX-Hjmo-Buoo-GxVd', 'cce4b552-7f46-11e3-af7c-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый матовый', ''),
('cce4b552-7f46-11e3-af7c-005056be1f7b-BC0C-Fryp-Afcy-HhQ3-Bb0u-GRmP', 'cce4b552-7f46-11e3-af7c-005056be1f7b', 'e765ba72-107d-11e3-8a5d-0050569a1080', 'база А', ''),
('cce4b552-7f46-11e3-af7c-005056be1f7b-Bc17-FQXM-AIzM-H4Gy-BJHm-Go2Y', 'cce4b552-7f46-11e3-af7c-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('cce4b552-7f46-11e3-af7c-005056be1f7b-Biss-F6RU-AkC0-HOzV-BrSM-Gnjj', 'cce4b552-7f46-11e3-af7c-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('cce4b552-7f46-11e3-af7c-005056be1f7b-Bs3z-Fmet-AMPt-H8YH-Bjds-GRRL', 'cce4b552-7f46-11e3-af7c-005056be1f7b', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'латексная', ''),
('cce4b552-7f46-11e3-af7c-005056be1f7b-Bu5S-FZWX-AoZT-Hm2R-BLzH-Ghbb', 'cce4b552-7f46-11e3-af7c-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('cce7530f-27b6-11dd-942f-000e0c431b58-BDF2-Fuan-AcD1-HrVv-BK8u-GJgS', 'cce7530f-27b6-11dd-942f-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'РОГНЕДА', ''),
('cce7530f-27b6-11dd-942f-000e0c431b58-BgRX-Fv4E-A4PG-HLI6-BELA-G67b', 'cce7530f-27b6-11dd-942f-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('cce7530f-27b6-11dd-942f-000e0c431b58-BiYf-FZF1-AKQy-H6aU-BN7m-Gkrf', 'cce7530f-27b6-11dd-942f-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'огнебиозащитный состав', ''),
('cce7530f-27b6-11dd-942f-000e0c431b58-Bl00-FjhW-AuFO-HlrI-BVBR-G4y3', 'cce7530f-27b6-11dd-942f-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('cce7530f-27b6-11dd-942f-000e0c431b58-Bplu-Fvw4-Aq2E-HrwB-BIVZ-Gnuf', 'cce7530f-27b6-11dd-942f-000e0c431b58', '1d08380b-ce34-11e4-a80e-005056be1f7a', '23000', 'г'),
('cce7530f-27b6-11dd-942f-000e0c431b58-BUJh-FwkJ-AQ9r-HVvr-BnNO-GR5d', 'cce7530f-27b6-11dd-942f-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('ce1ffcf9-f78e-11e3-8c8a-005056be1f7b-B3jW-FWYz-A0V5-HjaL-B3Wh-G2aS', 'ce1ffcf9-f78e-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('ce1ffcf9-f78e-11e3-8c8a-005056be1f7b-B6V9-FEvk-A4of-HgTt-B8uB-GeWW', 'ce1ffcf9-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('ce1ffcf9-f78e-11e3-8c8a-005056be1f7b-BaSh-FmVY-ANAe-Hzcm-B7Ej-GFRT', 'ce1ffcf9-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('ce1ffcf9-f78e-11e3-8c8a-005056be1f7b-BbT7-F71Q-AqxA-HrRX-BEK7-GbhV', 'ce1ffcf9-f78e-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('ce1ffcf9-f78e-11e3-8c8a-005056be1f7b-Bm8J-FMtz-AEpI-HZlz-B45m-GpOa', 'ce1ffcf9-f78e-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'красный', ''),
('ce1ffcf9-f78e-11e3-8c8a-005056be1f7b-BRgq-FLGG-AW0d-H514-BMSN-GJOD', 'ce1ffcf9-f78e-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('ce1ffcf9-f78e-11e3-8c8a-005056be1f7b-BZ51-FamI-AxrS-HuJz-BFaW-Gvld', 'ce1ffcf9-f78e-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '6000', 'г'),
('ce813bcf-2257-11e1-ae36-001cc494be80-BBgL-FV4H-AoxL-HLnG-BZHY-GPGm', 'ce813bcf-2257-11e1-ae36-001cc494be80', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('ce813bcf-2257-11e1-ae36-001cc494be80-BdRz-F9OX-A9o1-HB4k-BR0U-GIWW', 'ce813bcf-2257-11e1-ae36-001cc494be80', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'супербелый', ''),
('ce813bcf-2257-11e1-ae36-001cc494be80-BEhs-FQtV-AWJc-HuYi-BWAo-Gndu', 'ce813bcf-2257-11e1-ae36-001cc494be80', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'интерьерная', ''),
('ce813bcf-2257-11e1-ae36-001cc494be80-BfUh-F9E6-Ahb7-HLFa-B648-GE24', 'ce813bcf-2257-11e1-ae36-001cc494be80', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('ce813bcf-2257-11e1-ae36-001cc494be80-Blgt-Fhsz-A9os-H6sk-Bzc7-GaZz', 'ce813bcf-2257-11e1-ae36-001cc494be80', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1300', 'г'),
('ce813bcf-2257-11e1-ae36-001cc494be80-BmFR-FdGK-ADYJ-HYhg-BviC-G746', 'ce813bcf-2257-11e1-ae36-001cc494be80', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('ce813bcf-2257-11e1-ae36-001cc494be80-BtWk-F83O-AEU7-Hte5-BHAO-Gp0S', 'ce813bcf-2257-11e1-ae36-001cc494be80', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('ce813bcf-2257-11e1-ae36-001cc494be80-ByhI-F96p-AerN-HgnH-Bbrp-GK8Y', 'ce813bcf-2257-11e1-ae36-001cc494be80', 'e8287600-ad96-11e3-b114-005056be1f7c', 'НОВЫЕ ТЕХНОЛОГИИ', ''),
('ce813bd1-2257-11e1-ae36-001cc494be80-B90V-Fy47-AlbW-HAmW-BxZ6-GzWY', 'ce813bd1-2257-11e1-ae36-001cc494be80', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('ce813bd1-2257-11e1-ae36-001cc494be80-BDtc-FiVQ-Asp1-H5lx-BiZZ-GLAw', 'ce813bd1-2257-11e1-ae36-001cc494be80', 'e8287600-ad96-11e3-b114-005056be1f7c', 'НОВЫЕ ТЕХНОЛОГИИ', ''),
('ce813bd1-2257-11e1-ae36-001cc494be80-Bhwz-Fonc-AP3K-Hjka-BPiZ-GkWT', 'ce813bd1-2257-11e1-ae36-001cc494be80', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1300', 'г'),
('ce813bd1-2257-11e1-ae36-001cc494be80-BmXj-FrsQ-ApLY-HAlI-BFnX-Gtpr', 'ce813bd1-2257-11e1-ae36-001cc494be80', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'супербелый', ''),
('ce813bd1-2257-11e1-ae36-001cc494be80-Br8P-FF91-AOEe-HmxK-BUkL-G68n', 'ce813bd1-2257-11e1-ae36-001cc494be80', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('ce813bd1-2257-11e1-ae36-001cc494be80-BwBl-FXc3-Ao0v-Hv89-B2kV-GbRD', 'ce813bd1-2257-11e1-ae36-001cc494be80', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('ce813bd1-2257-11e1-ae36-001cc494be80-BwiB-F8cs-AaaG-H1nk-BPrU-GrQp', 'ce813bd1-2257-11e1-ae36-001cc494be80', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('ce813bd1-2257-11e1-ae36-001cc494be80-Byln-FkXk-AiPL-H5qc-B8Ya-GNeY', 'ce813bd1-2257-11e1-ae36-001cc494be80', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'моющаяся', ''),
('ceef00fe-c7d1-11e4-85d3-005056be1f7b-B4KR-F17U-AYuB-HN5B-BUd4-GRN6', 'ceef00fe-c7d1-11e4-85d3-005056be1f7b', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для фасада', ''),
('ceef00fe-c7d1-11e4-85d3-005056be1f7b-Bhdx-FjZP-AyMd-H8nQ-BZyY-GTlB', 'ceef00fe-c7d1-11e4-85d3-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('ceef00fe-c7d1-11e4-85d3-005056be1f7b-Bj37-FuBX-AHmV-H0A3-BRoO-Gvvi', 'ceef00fe-c7d1-11e4-85d3-005056be1f7b', '0e31c585-9718-11e4-9be0-005056be1f7c', '1', 'м'),
('ceef00fe-c7d1-11e4-85d3-005056be1f7b-BKH4-FxnU-ApUp-HACj-BjwQ-GkMb', 'ceef00fe-c7d1-11e4-85d3-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('ceef00fe-c7d1-11e4-85d3-005056be1f7b-BnRW-FTRY-A31K-HIaX-Bk82-GYhR', 'ceef00fe-c7d1-11e4-85d3-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('ceef00fe-c7d1-11e4-85d3-005056be1f7b-BnVe-FHTH-AYt7-HwCi-Byqz-GK0G', 'ceef00fe-c7d1-11e4-85d3-005056be1f7b', 'c2267174-970e-11e4-9be0-005056be1f7c', '50', 'м'),
('ceef00fe-c7d1-11e4-85d3-005056be1f7b-BoVh-FAVh-A4nM-HHZ9-BpTI-G8JE', 'ceef00fe-c7d1-11e4-85d3-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'сетка', ''),
('ceef00fe-c7d1-11e4-85d3-005056be1f7b-BtrB-FaL7-ARWC-H7bO-BwOJ-Gaxc', 'ceef00fe-c7d1-11e4-85d3-005056be1f7b', '0569475c-1474-11e3-82b9-0050569a1080', '4x4', ''),
('cf6aa526-48b8-11dd-9342-000e0c431b58-B9tO-FDSS-APVF-HCWn-Bnhk-G9C4', 'cf6aa526-48b8-11dd-9342-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('cf6aa526-48b8-11dd-9342-000e0c431b58-BCkv-F0e0-AdbE-HNNm-B7I7-GiD4', 'cf6aa526-48b8-11dd-9342-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'бронза', ''),
('cf6aa526-48b8-11dd-9342-000e0c431b58-BFXn-FKaA-AxDi-HYCk-BSpd-Gu2a', 'cf6aa526-48b8-11dd-9342-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('cf6aa526-48b8-11dd-9342-000e0c431b58-Bka3-FGZ8-AhWF-HiEM-BDww-GAik', 'cf6aa526-48b8-11dd-9342-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсальное', ''),
('cf6aa526-48b8-11dd-9342-000e0c431b58-Bl1r-Fj1n-A8zf-H9Ea-B7HA-GsHf', 'cf6aa526-48b8-11dd-9342-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('cf6aa526-48b8-11dd-9342-000e0c431b58-BL8V-FeSo-A1ii-HEfB-BHGc-GAM3', 'cf6aa526-48b8-11dd-9342-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('cf6aa526-48b8-11dd-9342-000e0c431b58-Bn4c-FL88-ANFD-HqGQ-BiE0-GwIR', 'cf6aa526-48b8-11dd-9342-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.52', 'л'),
('cf6aa526-48b8-11dd-9342-000e0c431b58-Brk7-FwxK-AYuT-HVSW-BP4N-G7dD', 'cf6aa526-48b8-11dd-9342-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('d0659fe4-f787-11e3-8c8a-005056be1f7b-BAf0-FT9Q-AeBM-H32s-BFlK-GCVG', 'd0659fe4-f787-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'зеленый', ''),
('d0659fe4-f787-11e3-8c8a-005056be1f7b-Bfos-FJ4o-AS7l-H8A2-BlUl-GP1O', 'd0659fe4-f787-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('d0659fe4-f787-11e3-8c8a-005056be1f7b-BhDy-FX0B-AAMu-HRJl-Bcuw-Gj75', 'd0659fe4-f787-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '800', 'г'),
('d0659fe4-f787-11e3-8c8a-005056be1f7b-BkKH-FMIH-AEtb-Hp0S-B5vX-G1p1', 'd0659fe4-f787-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('d0659fe4-f787-11e3-8c8a-005056be1f7b-BUuo-Fgmg-AOrH-HYud-BeKi-GOvR', 'd0659fe4-f787-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('d0659fe4-f787-11e3-8c8a-005056be1f7b-BwE7-F5dq-AX91-H7Nm-BNsR-G72K', 'd0659fe4-f787-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('d0659fe4-f787-11e3-8c8a-005056be1f7b-BZFu-FlsQ-A3bo-HP7J-BD7p-GDPn', 'd0659fe4-f787-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('d1aa2ade-a3ef-11e1-ad4e-005056be3bd8-Bag9-Fp0j-AXoB-Ht5z-BB1e-GjrQ', 'd1aa2ade-a3ef-11e1-ad4e-005056be3bd8', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('d1aa2ade-a3ef-11e1-ad4e-005056be3bd8-BAWM-F2Cj-AoIX-H8M1-BP2r-GMgS', 'd1aa2ade-a3ef-11e1-ad4e-005056be3bd8', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('d1aa2ade-a3ef-11e1-ad4e-005056be3bd8-BEB5-FwBG-AMRZ-HRpR-Bnqo-Gzhq', 'd1aa2ade-a3ef-11e1-ad4e-005056be3bd8', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '1', 'л'),
('d1aa2ade-a3ef-11e1-ad4e-005056be3bd8-BHpH-FiQn-Ae21-HpWw-BGxT-GEdS', 'd1aa2ade-a3ef-11e1-ad4e-005056be3bd8', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('d1aa2ade-a3ef-11e1-ad4e-005056be3bd8-Bo28-Fpk2-Afls-H0LZ-BPTF-GX2V', 'd1aa2ade-a3ef-11e1-ad4e-005056be3bd8', 'e8287600-ad96-11e3-b114-005056be1f7c', 'COSMOFEN', ''),
('d1aa2ade-a3ef-11e1-ad4e-005056be3bd8-BYLy-FwIB-AmY3-HUlZ-Bnpb-Ghcd', 'd1aa2ade-a3ef-11e1-ad4e-005056be3bd8', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'очиститель', ''),
('d1eaa4c2-f78f-11e3-8c8a-005056be1f7b-BAog-FAkk-AIcA-HmoQ-BBqn-G0xt', 'd1eaa4c2-f78f-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('d1eaa4c2-f78f-11e3-8c8a-005056be1f7b-BBX8-FHFS-AJEI-Htue-B0XW-GBZV', 'd1eaa4c2-f78f-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'зеленый', ''),
('d1eaa4c2-f78f-11e3-8c8a-005056be1f7b-BeoZ-F4T4-AEso-HM6z-BBs6-GfcT', 'd1eaa4c2-f78f-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('d1eaa4c2-f78f-11e3-8c8a-005056be1f7b-BpjT-Firc-AIbW-HkO0-Bfto-G6m8', 'd1eaa4c2-f78f-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '20000', 'г'),
('d1eaa4c2-f78f-11e3-8c8a-005056be1f7b-BR7y-FZqj-A5p8-HRqW-BmrB-GJsl', 'd1eaa4c2-f78f-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('d1eaa4c2-f78f-11e3-8c8a-005056be1f7b-Bt2D-Fudr-AAeY-HodL-BYvI-GNLy', 'd1eaa4c2-f78f-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('d1eaa4c2-f78f-11e3-8c8a-005056be1f7b-BxFd-FuXK-AHA3-HIJk-Bt4b-Gwn6', 'd1eaa4c2-f78f-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('d5823752-947b-11e3-8d88-005056be1f7b-BaDs-FDvO-AgSP-Hxkv-BCSp-GPsK', 'd5823752-947b-11e3-8d88-005056be1f7b', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'декоративная с эффектом "шубы"', ''),
('d5823752-947b-11e3-8d88-005056be1f7b-BaZw-FdKf-ACAp-Hqi4-BFVn-GxZM', 'd5823752-947b-11e3-8d88-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'штукатурка фактурная', ''),
('d5823752-947b-11e3-8d88-005056be1f7b-BFNx-Fqrn-AAXG-HhT2-BgtR-GTNb', 'd5823752-947b-11e3-8d88-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '15000', 'г'),
('d5823752-947b-11e3-8d88-005056be1f7b-BnNR-FRce-ApxC-Hutj-BzJn-GiNZ', 'd5823752-947b-11e3-8d88-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('d5823752-947b-11e3-8d88-005056be1f7b-Bs5M-FafY-AeGn-HPMY-BUiF-G7gE', 'd5823752-947b-11e3-8d88-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('d5823752-947b-11e3-8d88-005056be1f7b-BVrl-F90e-Agon-Hrgc-BhAR-GRfP', 'd5823752-947b-11e3-8d88-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('d5823752-947b-11e3-8d88-005056be1f7b-Bxus-FDiS-Aylk-He1T-Bpdg-G7u0', 'd5823752-947b-11e3-8d88-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('d5823752-947b-11e3-8d88-005056be1f7b-BzPb-Fe7A-AYCW-HCzv-BO69-GBmq', 'd5823752-947b-11e3-8d88-005056be1f7b', '1ea6fcc4-d206-11e4-9be0-005056be1f7c', '0', 'мм'),
('d63bb09c-055c-11dd-b9c0-000e0c431b58-BBou-Fkhw-AgrE-Hk6Q-BNC3-GqhI', 'd63bb09c-055c-11dd-b9c0-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'фасадная', ''),
('d63bb09c-055c-11dd-b9c0-000e0c431b58-BGHV-FhxU-Afhj-H3C7-BJRD-GOLn', 'd63bb09c-055c-11dd-b9c0-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('d63bb09c-055c-11dd-b9c0-000e0c431b58-BGmd-FfPs-ALKs-HhgS-BVma-GrJN', 'd63bb09c-055c-11dd-b9c0-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('d63bb09c-055c-11dd-b9c0-000e0c431b58-BH7n-Fjx9-AL2T-HbqQ-BQRu-Gv8y', 'd63bb09c-055c-11dd-b9c0-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '9', 'л'),
('d63bb09c-055c-11dd-b9c0-000e0c431b58-Bldf-FqEb-A7Rd-Hz9B-B9Xu-GRgB', 'd63bb09c-055c-11dd-b9c0-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('d63bb09c-055c-11dd-b9c0-000e0c431b58-BN5G-FquE-Arsc-Hc09-BeG6-GIqt', 'd63bb09c-055c-11dd-b9c0-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('d63bb09c-055c-11dd-b9c0-000e0c431b58-BPHF-F5k2-AazZ-HnPp-B5AV-GVjy', 'd63bb09c-055c-11dd-b9c0-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'бесцветный', ''),
('d63bb09c-055c-11dd-b9c0-000e0c431b58-Bvpb-Fidu-Aiga-Hp99-BuPX-GeXQ', 'd63bb09c-055c-11dd-b9c0-000e0c431b58', 'e765ba72-107d-11e3-8a5d-0050569a1080', 'база С', ''),
('d63bb09c-055c-11dd-b9c0-000e0c431b58-BZtT-FIQz-Aamc-H1Ul-BDVQ-Gy7y', 'd63bb09c-055c-11dd-b9c0-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'PARADE', ''),
('d72ce04c-7f46-11e3-af7c-005056be1f7b-B1EW-FnUW-Arov-Hsa5-BRhD-GkwV', 'd72ce04c-7f46-11e3-af7c-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('d72ce04c-7f46-11e3-af7c-005056be1f7b-BBEW-FBZB-AhJg-HGQo-BAse-Gi7C', 'd72ce04c-7f46-11e3-af7c-005056be1f7b', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '5', 'л'),
('d72ce04c-7f46-11e3-af7c-005056be1f7b-Bczi-FOi0-AIzg-HLZT-Bhj8-Gu6m', 'd72ce04c-7f46-11e3-af7c-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('d72ce04c-7f46-11e3-af7c-005056be1f7b-BGJT-FPRk-A12K-HBEy-BFsL-G5eZ', 'd72ce04c-7f46-11e3-af7c-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('d72ce04c-7f46-11e3-af7c-005056be1f7b-BhF2-FERQ-AXy1-HUiv-B7k1-GTmQ', 'd72ce04c-7f46-11e3-af7c-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('d72ce04c-7f46-11e3-af7c-005056be1f7b-BKnM-FVoR-AJuA-HVof-Buej-GGI4', 'd72ce04c-7f46-11e3-af7c-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'PARADE', ''),
('d72ce04c-7f46-11e3-af7c-005056be1f7b-BnWy-FwN6-Aj8x-HQ0E-BTZA-GwIi', 'd72ce04c-7f46-11e3-af7c-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый матовый', ''),
('d72ce04c-7f46-11e3-af7c-005056be1f7b-BTjn-FD5a-AsuI-H2Hw-Bt2q-GCRD', 'd72ce04c-7f46-11e3-af7c-005056be1f7b', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'латексная', ''),
('d72ce04c-7f46-11e3-af7c-005056be1f7b-BZ7c-FtiT-AAuJ-HIRl-BjkK-GNoE', 'd72ce04c-7f46-11e3-af7c-005056be1f7b', 'e765ba72-107d-11e3-8a5d-0050569a1080', 'база А', ''),
('d76b7387-f78e-11e3-8c8a-005056be1f7b-B23Z-FgrR-AFls-HE06-Beyl-G5MG', 'd76b7387-f78e-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '6000', 'г'),
('d76b7387-f78e-11e3-8c8a-005056be1f7b-B6LP-FHHH-AKux-H8z0-Bk8v-Gm6G', 'd76b7387-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('d76b7387-f78e-11e3-8c8a-005056be1f7b-BIn2-FFtd-A8KM-H62C-Bmqw-GFMm', 'd76b7387-f78e-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'бирюзовый', ''),
('d76b7387-f78e-11e3-8c8a-005056be1f7b-BIvC-F8U7-AeWN-HA0r-BkIV-GcNE', 'd76b7387-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('d76b7387-f78e-11e3-8c8a-005056be1f7b-BiZc-Fvab-AdAj-Hycx-B4Y0-GIgG', 'd76b7387-f78e-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('d76b7387-f78e-11e3-8c8a-005056be1f7b-BPr2-FCoq-ACPo-Hy2j-B5a0-GXMZ', 'd76b7387-f78e-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('d76b7387-f78e-11e3-8c8a-005056be1f7b-Byqa-FYe4-AMYR-HMhy-BTxf-GKzK', 'd76b7387-f78e-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('d9eaaa65-f78f-11e3-8c8a-005056be1f7b-B7vH-Fh3B-Atyv-H6hP-BlA6-Ga6E', 'd9eaaa65-f78f-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'светло-зеленый', ''),
('d9eaaa65-f78f-11e3-8c8a-005056be1f7b-B8Os-FoPK-A8zC-HlvG-Bhll-GWUc', 'd9eaaa65-f78f-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('d9eaaa65-f78f-11e3-8c8a-005056be1f7b-BAPc-Fbxl-AVDq-HBcS-Bj3o-G7D6', 'd9eaaa65-f78f-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('d9eaaa65-f78f-11e3-8c8a-005056be1f7b-BaVW-FLR4-Ab34-HWTz-BamB-GJ1T', 'd9eaaa65-f78f-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('d9eaaa65-f78f-11e3-8c8a-005056be1f7b-Be4t-FOdJ-AzXk-Hqtd-BVqs-GDV8', 'd9eaaa65-f78f-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '20000', 'г'),
('d9eaaa65-f78f-11e3-8c8a-005056be1f7b-BTMt-FOR2-AZJa-HhJ4-BQFp-GYmi', 'd9eaaa65-f78f-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('d9eaaa65-f78f-11e3-8c8a-005056be1f7b-Bzey-Ft1H-AiQu-Hkal-B4b2-GW3o', 'd9eaaa65-f78f-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('da49edc1-58f9-11e0-894e-000e0c431b58-Bbi8-F273-Aolf-HwM4-BRcM-Gw3a', 'da49edc1-58f9-11e0-894e-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('da49edc1-58f9-11e0-894e-000e0c431b58-BI3r-FRBP-AP3a-HX5w-BpnI-GlYf', 'da49edc1-58f9-11e0-894e-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('da49edc1-58f9-11e0-894e-000e0c431b58-BkTd-FaLu-AjIe-HRCF-B6yU-GLGV', 'da49edc1-58f9-11e0-894e-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для ржавчины', ''),
('da49edc1-58f9-11e0-894e-000e0c431b58-BnQo-Fiou-AWbl-HGMF-BcwZ-G6Nl', 'da49edc1-58f9-11e0-894e-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'грунт-эмаль', ''),
('da49edc1-58f9-11e0-894e-000e0c431b58-BPTf-FaO0-ADf3-Hq3K-BdBD-GLSE', 'da49edc1-58f9-11e0-894e-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('da49edc1-58f9-11e0-894e-000e0c431b58-BsV6-FvWo-A5AK-H6dm-BR4n-GWSw', 'da49edc1-58f9-11e0-894e-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('da49edc1-58f9-11e0-894e-000e0c431b58-Bv67-Fnmz-AyG1-H3RJ-B7tr-G5lo', 'da49edc1-58f9-11e0-894e-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('da49edc1-58f9-11e0-894e-000e0c431b58-BwPP-FRBc-AKS5-HXFx-Bx2t-GueW', 'da49edc1-58f9-11e0-894e-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '10', 'л'),
('da49edc3-58f9-11e0-894e-000e0c431b58-B3Y9-Fonf-Ahzd-HUs2-BGJE-GMD4', 'da49edc3-58f9-11e0-894e-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для ржавчины', ''),
('da49edc3-58f9-11e0-894e-000e0c431b58-Bb5s-FZ9i-AzUc-HlAu-B6Bg-GleA', 'da49edc3-58f9-11e0-894e-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('da49edc3-58f9-11e0-894e-000e0c431b58-BbNG-F5yG-ApuH-HLVm-BMsX-G56N', 'da49edc3-58f9-11e0-894e-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '10', 'л'),
('da49edc3-58f9-11e0-894e-000e0c431b58-BBwq-Fddu-AQs1-HFPQ-B5yv-GvG6', 'da49edc3-58f9-11e0-894e-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('da49edc3-58f9-11e0-894e-000e0c431b58-BEWT-FXiV-AeVb-HrEx-BPFz-Ghaz', 'da49edc3-58f9-11e0-894e-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'зеленый', ''),
('da49edc3-58f9-11e0-894e-000e0c431b58-Bjf2-FRJp-Ayw9-HEzZ-BW5v-GpRU', 'da49edc3-58f9-11e0-894e-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('da49edc3-58f9-11e0-894e-000e0c431b58-BStn-Fa60-ADHr-HaBm-Bn5A-Gmio', 'da49edc3-58f9-11e0-894e-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'грунт-эмаль', ''),
('da49edc3-58f9-11e0-894e-000e0c431b58-BWus-FM18-Advw-HPg3-BL9x-G4Xv', 'da49edc3-58f9-11e0-894e-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('da49edc5-58f9-11e0-894e-000e0c431b58-B06b-Fkvk-AN1d-HbKx-BpoF-GXFY', 'da49edc5-58f9-11e0-894e-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('da49edc5-58f9-11e0-894e-000e0c431b58-B3Jh-FEuE-AkE5-HY3L-B42H-GUb3', 'da49edc5-58f9-11e0-894e-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('da49edc5-58f9-11e0-894e-000e0c431b58-B6ps-FZG4-AMwh-HSKn-BqCx-GOHh', 'da49edc5-58f9-11e0-894e-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('da49edc5-58f9-11e0-894e-000e0c431b58-BA2W-FhJg-AL1j-H9Fq-BgYX-GIld', 'da49edc5-58f9-11e0-894e-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '10', 'л'),
('da49edc5-58f9-11e0-894e-000e0c431b58-BdSr-FbTe-AEJM-Hkgf-BUzy-GxQf', 'da49edc5-58f9-11e0-894e-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'коричневый', ''),
('da49edc5-58f9-11e0-894e-000e0c431b58-Bm0d-F8ex-Au2D-HN8s-Bx8k-GJft', 'da49edc5-58f9-11e0-894e-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для ржавчины', ''),
('da49edc5-58f9-11e0-894e-000e0c431b58-Bqrk-FPqp-A7MD-HUVp-By8o-GR6I', 'da49edc5-58f9-11e0-894e-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'грунт-эмаль', ''),
('da49edc5-58f9-11e0-894e-000e0c431b58-BSrm-FMFe-AY0V-HfUx-BXPc-GGoj', 'da49edc5-58f9-11e0-894e-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('da49edc7-58f9-11e0-894e-000e0c431b58-B7ka-FNei-AJxh-HBap-Be9w-GqhF', 'da49edc7-58f9-11e0-894e-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('da49edc7-58f9-11e0-894e-000e0c431b58-BiDT-FWB8-AuWL-HZ9U-BW65-GwJY', 'da49edc7-58f9-11e0-894e-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('da49edc7-58f9-11e0-894e-000e0c431b58-BiGL-FjT2-AfNy-H8oX-BVNp-GmI7', 'da49edc7-58f9-11e0-894e-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('da49edc7-58f9-11e0-894e-000e0c431b58-BjRQ-F5RU-AbdQ-H5I6-BT03-GnId', 'da49edc7-58f9-11e0-894e-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'красно-коричневый', ''),
('da49edc7-58f9-11e0-894e-000e0c431b58-BrKl-F4kk-AN7g-HHtp-BgD9-Gs7S', 'da49edc7-58f9-11e0-894e-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '10', 'л'),
('da49edc7-58f9-11e0-894e-000e0c431b58-BUSM-F3Um-Aizl-HUgJ-BaEN-GuaO', 'da49edc7-58f9-11e0-894e-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('da49edc7-58f9-11e0-894e-000e0c431b58-Bv12-FS9k-A8eo-H7Nl-BOjG-GWh8', 'da49edc7-58f9-11e0-894e-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'грунт-эмаль', ''),
('da49edc7-58f9-11e0-894e-000e0c431b58-BVfH-F81n-AHRs-HUBJ-BjtU-GLm5', 'da49edc7-58f9-11e0-894e-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для ржавчины', ''),
('da49edc9-58f9-11e0-894e-000e0c431b58-B0bY-Fngg-AqSX-HIYX-BVP3-Gvve', 'da49edc9-58f9-11e0-894e-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('da49edc9-58f9-11e0-894e-000e0c431b58-B2eZ-Ffm8-Axmx-HtAf-Bdvj-G3hz', 'da49edc9-58f9-11e0-894e-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('da49edc9-58f9-11e0-894e-000e0c431b58-BRmY-F3zV-AVoC-HMsG-BTgL-GiZq', 'da49edc9-58f9-11e0-894e-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'серый', ''),
('da49edc9-58f9-11e0-894e-000e0c431b58-Bset-FlFY-ACgC-H5VT-BTrR-G0aX', 'da49edc9-58f9-11e0-894e-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'грунт-эмаль', ''),
('da49edc9-58f9-11e0-894e-000e0c431b58-BtjG-FgSH-ABw4-Hloa-Ban3-GzRY', 'da49edc9-58f9-11e0-894e-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '10', 'л'),
('da49edc9-58f9-11e0-894e-000e0c431b58-BtXU-FJwv-AeLn-HHiS-BAz6-GYru', 'da49edc9-58f9-11e0-894e-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('da49edc9-58f9-11e0-894e-000e0c431b58-BuDY-FwQG-A4jn-HFHD-Bv1b-GFAN', 'da49edc9-58f9-11e0-894e-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('da49edc9-58f9-11e0-894e-000e0c431b58-BV9q-FsGE-AGbU-H0NF-Bd7o-Gkc8', 'da49edc9-58f9-11e0-894e-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для ржавчины', ''),
('da49edcb-58f9-11e0-894e-000e0c431b58-B80B-FbUB-AyFr-HNys-BD5r-GExU', 'da49edcb-58f9-11e0-894e-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для ржавчины', ''),
('da49edcb-58f9-11e0-894e-000e0c431b58-BACK-Fc8j-Avew-HbrX-BtVn-Gblr', 'da49edcb-58f9-11e0-894e-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'черный', ''),
('da49edcb-58f9-11e0-894e-000e0c431b58-BF0B-F3mJ-Ai4w-H2Rq-BPeQ-Gd2I', 'da49edcb-58f9-11e0-894e-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '10', 'л'),
('da49edcb-58f9-11e0-894e-000e0c431b58-BfnH-FRFy-ApyK-HSQv-BAAN-GH3a', 'da49edcb-58f9-11e0-894e-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('da49edcb-58f9-11e0-894e-000e0c431b58-BMjN-FW3d-AI3e-HV0W-BvqZ-GtBz', 'da49edcb-58f9-11e0-894e-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('da49edcb-58f9-11e0-894e-000e0c431b58-BNVN-F0Ne-Aqd9-H77z-BE4y-GFUJ', 'da49edcb-58f9-11e0-894e-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'грунт-эмаль', ''),
('da49edcb-58f9-11e0-894e-000e0c431b58-BqC8-FUaW-A8Lw-HnHp-BQmT-GY5Y', 'da49edcb-58f9-11e0-894e-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('da49edcb-58f9-11e0-894e-000e0c431b58-BtbG-F2Nj-AJho-HYZm-Bvap-G63n', 'da49edcb-58f9-11e0-894e-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('ddd32665-666b-11dc-be42-000e0c431b58-BCGx-FqfM-AZHS-HEVm-Bk1p-GiYZ', 'ddd32665-666b-11dc-be42-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для обоев', ''),
('ddd32665-666b-11dc-be42-000e0c431b58-BeD9-FitO-AZij-Hivw-BUQX-Gdlk', 'ddd32665-666b-11dc-be42-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '9', 'л'),
('ddd32665-666b-11dc-be42-000e0c431b58-BelI-FVNi-AeNo-HZYt-BmGp-GOUf', 'ddd32665-666b-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('ddd32665-666b-11dc-be42-000e0c431b58-BERY-F1mR-AZW1-HlaJ-BAF5-GLFN', 'ddd32665-666b-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('ddd32665-666b-11dc-be42-000e0c431b58-BHcK-FBLR-AdPw-HV4i-BtiM-GESY', 'ddd32665-666b-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый матовый', ''),
('ddd32665-666b-11dc-be42-000e0c431b58-BovL-FASf-A2Yg-H4pe-Bnw8-GxyI', 'ddd32665-666b-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('ddd32665-666b-11dc-be42-000e0c431b58-BpoU-FtLk-AcwV-HhU2-BFAC-GQ8t', 'ddd32665-666b-11dc-be42-000e0c431b58', 'e765ba72-107d-11e3-8a5d-0050569a1080', 'база А', ''),
('ddd32665-666b-11dc-be42-000e0c431b58-BqLL-F7q2-Aeb4-HtGc-BDe2-GnwY', 'ddd32665-666b-11dc-be42-000e0c431b58', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('ddd32665-666b-11dc-be42-000e0c431b58-Br7l-FOzQ-AscD-HqQ2-ByVJ-GNMw', 'ddd32665-666b-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'PARADE', ''),
('ddd32665-666b-11dc-be42-000e0c431b58-Bxy8-FWXs-AIs9-HgLk-BGNq-G45L', 'ddd32665-666b-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('ddd3266a-666b-11dc-be42-000e0c431b58-B0MU-FMpL-A0A5-HOGh-BuAs-GDxA', 'ddd3266a-666b-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('ddd3266a-666b-11dc-be42-000e0c431b58-B3cv-F3Qw-Ajx4-HG7b-B8Vp-GXTU', 'ddd3266a-666b-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('ddd3266a-666b-11dc-be42-000e0c431b58-B4LT-FxSP-AOPl-H4n6-BOwt-GdNd', 'ddd3266a-666b-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'PARADE', ''),
('ddd3266a-666b-11dc-be42-000e0c431b58-Ba74-F4Y4-A340-HxBq-BhHh-GIh1', 'ddd3266a-666b-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый матовый', ''),
('ddd3266a-666b-11dc-be42-000e0c431b58-BG2k-FaTR-Aqji-HbUg-BPha-GVOL', 'ddd3266a-666b-11dc-be42-000e0c431b58', 'e765ba72-107d-11e3-8a5d-0050569a1080', 'база А', ''),
('ddd3266a-666b-11dc-be42-000e0c431b58-Bi1w-FdF4-AAz4-Hs4q-BtMs-G0Go', 'ddd3266a-666b-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('ddd3266a-666b-11dc-be42-000e0c431b58-BIyP-Fbuf-A91M-Hc1x-BUtP-GGmf', 'ddd3266a-666b-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'фасадная', ''),
('ddd3266a-666b-11dc-be42-000e0c431b58-BTBQ-F564-AzKq-Hjo4-BCnG-GX1w', 'ddd3266a-666b-11dc-be42-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '2.5', 'л'),
('ddd3266a-666b-11dc-be42-000e0c431b58-BZOa-F9pv-Ae5S-H6Qh-BGqd-G0k3', 'ddd3266a-666b-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('ddd3266c-666b-11dc-be42-000e0c431b58-B47y-Fjfc-AdiG-Hk68-BWdx-GI83', 'ddd3266c-666b-11dc-be42-000e0c431b58', 'e765ba72-107d-11e3-8a5d-0050569a1080', 'база А', ''),
('ddd3266c-666b-11dc-be42-000e0c431b58-B9gR-F0eW-A31q-HHHX-BSPY-Gvti', 'ddd3266c-666b-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'PARADE', ''),
('ddd3266c-666b-11dc-be42-000e0c431b58-BB8s-F5pm-AlZy-HUY6-B9S3-Gx3X', 'ddd3266c-666b-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый матовый', ''),
('ddd3266c-666b-11dc-be42-000e0c431b58-BbHo-FTiT-AlA8-HZtl-BszH-G2lw', 'ddd3266c-666b-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('ddd3266c-666b-11dc-be42-000e0c431b58-BFgI-FwoQ-AK8g-HisP-BHXt-GzXO', 'ddd3266c-666b-11dc-be42-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '5', 'л'),
('ddd3266c-666b-11dc-be42-000e0c431b58-BIBc-FdJ4-AvKV-HA4s-B6Pr-GPaA', 'ddd3266c-666b-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'фасадная', ''),
('ddd3266c-666b-11dc-be42-000e0c431b58-Boes-FAem-Ata2-HbpR-Bbny-GtnS', 'ddd3266c-666b-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('ddd3266c-666b-11dc-be42-000e0c431b58-BPV6-FW62-AUSU-HHaR-BAcP-GtX5', 'ddd3266c-666b-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('ddd3266c-666b-11dc-be42-000e0c431b58-BV9U-FKSs-AGRB-H9E4-BVUO-GRrK', 'ddd3266c-666b-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('ddd32674-666b-11dc-be42-000e0c431b58-B5Un-F4Ee-A0F9-Hsyz-Bsxx-GOxB', 'ddd32674-666b-11dc-be42-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для обоев', ''),
('ddd32674-666b-11dc-be42-000e0c431b58-B98f-FAOQ-A16T-Hp4m-BTjj-GSPg', 'ddd32674-666b-11dc-be42-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '2.5', 'л'),
('ddd32674-666b-11dc-be42-000e0c431b58-Bfn8-FyS1-Abma-HA5q-BhzA-GKsE', 'ddd32674-666b-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('ddd32674-666b-11dc-be42-000e0c431b58-Bmmq-FWRP-AHfB-HQu1-BrDy-G8So', 'ddd32674-666b-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'PARADE', ''),
('ddd32674-666b-11dc-be42-000e0c431b58-BMZA-FCQD-AKz7-H2cZ-BfQV-GRZJ', 'ddd32674-666b-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый матовый', ''),
('ddd32674-666b-11dc-be42-000e0c431b58-BnaZ-FGYC-AZbz-H2DH-Bi3q-Gmco', 'ddd32674-666b-11dc-be42-000e0c431b58', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('ddd32674-666b-11dc-be42-000e0c431b58-Bq80-Fp8l-AEG9-Ht2G-BBes-Gs1A', 'ddd32674-666b-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('ddd32674-666b-11dc-be42-000e0c431b58-BS9Q-FPzt-AoV0-H0mY-BJXp-GvHS', 'ddd32674-666b-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('ddd32674-666b-11dc-be42-000e0c431b58-BuQl-Fum2-AeYu-Hpju-BOvJ-GOya', 'ddd32674-666b-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('ddd32674-666b-11dc-be42-000e0c431b58-Bx6v-FJyd-A2b0-HWPt-Bv4K-GK0j', 'ddd32674-666b-11dc-be42-000e0c431b58', 'e765ba72-107d-11e3-8a5d-0050569a1080', 'база А', ''),
('ddd32676-666b-11dc-be42-000e0c431b58-B845-FHaS-AbpK-HWxT-BLLR-GKrS', 'ddd32676-666b-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'PARADE', ''),
('ddd32676-666b-11dc-be42-000e0c431b58-Bdm3-FQ3P-AzLI-HDb1-Bji9-GrGI', 'ddd32676-666b-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый матовый', ''),
('ddd32676-666b-11dc-be42-000e0c431b58-BfV7-FudI-ApmQ-Hfqh-BuCP-GpjU', 'ddd32676-666b-11dc-be42-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для обоев', ''),
('ddd32676-666b-11dc-be42-000e0c431b58-BHII-FhJD-AOq3-HP1k-BTfS-GeIt', 'ddd32676-666b-11dc-be42-000e0c431b58', 'e765ba72-107d-11e3-8a5d-0050569a1080', 'база А', ''),
('ddd32676-666b-11dc-be42-000e0c431b58-BlD4-FlZL-Ar3P-HIL6-BIIz-GDQP', 'ddd32676-666b-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('ddd32676-666b-11dc-be42-000e0c431b58-BosK-Fna0-AdJw-HQXj-BS3N-GQrg', 'ddd32676-666b-11dc-be42-000e0c431b58', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('ddd32676-666b-11dc-be42-000e0c431b58-BuUy-Fmjp-AN4K-HgYT-BP36-GHIy', 'ddd32676-666b-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('ddd32676-666b-11dc-be42-000e0c431b58-BWr6-FgEs-A1Q4-HHbk-BZDo-GToE', 'ddd32676-666b-11dc-be42-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '5', 'л'),
('ddd32676-666b-11dc-be42-000e0c431b58-BX90-FgBa-AWk0-HVSF-BdDa-GSqA', 'ddd32676-666b-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('ddd32676-666b-11dc-be42-000e0c431b58-BXZk-FRgB-A37E-HhPs-BlvE-Gifi', 'ddd32676-666b-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('de1409cf-f787-11e3-8c8a-005056be1f7b-B0C4-F15C-AupL-H8OC-BvJf-Gi87', 'de1409cf-f787-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('de1409cf-f787-11e3-8c8a-005056be1f7b-B6cN-FHvR-AZdg-H4bw-BLbz-GFRu', 'de1409cf-f787-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '800', 'г'),
('de1409cf-f787-11e3-8c8a-005056be1f7b-B6cx-FxaX-AfQM-HSER-BrOe-G9QR', 'de1409cf-f787-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('de1409cf-f787-11e3-8c8a-005056be1f7b-BATy-FskW-Al03-H9jr-B1zw-GxFZ', 'de1409cf-f787-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('de1409cf-f787-11e3-8c8a-005056be1f7b-BEVs-FNye-AP5r-HRi4-BZfX-Gkz2', 'de1409cf-f787-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'светло-зеленый', ''),
('de1409cf-f787-11e3-8c8a-005056be1f7b-BKMQ-FBxB-Awl1-H2I5-BuJN-Gi2x', 'de1409cf-f787-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('de1409cf-f787-11e3-8c8a-005056be1f7b-BPF8-FQmW-AH12-Hkuu-ByzF-GgD4', 'de1409cf-f787-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('de9b7b14-7f46-11e3-af7c-005056be1f7b-BCG6-FcGt-AzIF-HRBf-BAMS-GhOb', 'de9b7b14-7f46-11e3-af7c-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый матовый', ''),
('de9b7b14-7f46-11e3-af7c-005056be1f7b-BF16-F4I0-A72r-HAHr-BtST-GCH7', 'de9b7b14-7f46-11e3-af7c-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('de9b7b14-7f46-11e3-af7c-005056be1f7b-BKlT-FznO-AFVM-Hb0m-B4X3-Gd2Y', 'de9b7b14-7f46-11e3-af7c-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'PARADE', ''),
('de9b7b14-7f46-11e3-af7c-005056be1f7b-BKxh-FBIF-AxFp-HoYR-B5ta-GVkq', 'de9b7b14-7f46-11e3-af7c-005056be1f7b', 'e765ba72-107d-11e3-8a5d-0050569a1080', 'база А', ''),
('de9b7b14-7f46-11e3-af7c-005056be1f7b-BnBg-FTp6-Akko-HB6P-Bs8V-Goab', 'de9b7b14-7f46-11e3-af7c-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('de9b7b14-7f46-11e3-af7c-005056be1f7b-BR7Y-F07f-Aqpx-HAs6-B80I-GPdw', 'de9b7b14-7f46-11e3-af7c-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('de9b7b14-7f46-11e3-af7c-005056be1f7b-BRNS-FdoS-AGhq-H9Ah-BXGY-GS0g', 'de9b7b14-7f46-11e3-af7c-005056be1f7b', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '9', 'л'),
('de9b7b14-7f46-11e3-af7c-005056be1f7b-BUJa-F2Pr-AfPZ-H0yW-BCVc-G4Zt', 'de9b7b14-7f46-11e3-af7c-005056be1f7b', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'латексная', ''),
('de9b7b14-7f46-11e3-af7c-005056be1f7b-BYPk-Fdgm-A0gy-HREC-BtrD-GPAt', 'de9b7b14-7f46-11e3-af7c-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('df210450-93af-11e3-82a4-005056be1f7b-B3ld-FP7I-AhJm-Hb8H-B8lj-GUHl', 'df210450-93af-11e3-82a4-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('df210450-93af-11e3-82a4-005056be1f7b-B4yw-Fj5k-AW3e-HjFU-BvVx-GrVH', 'df210450-93af-11e3-82a4-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'грунт-эмаль', ''),
('df210450-93af-11e3-82a4-005056be1f7b-BGZP-F80D-Alut-H20p-BDWI-GZWD', 'df210450-93af-11e3-82a4-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('df210450-93af-11e3-82a4-005056be1f7b-BobX-FgBB-ARZN-HBvr-B8ES-GZxL', 'df210450-93af-11e3-82a4-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'желтый', ''),
('df210450-93af-11e3-82a4-005056be1f7b-BQc7-F0T6-ApXS-Hxxo-B1gI-GvJT', 'df210450-93af-11e3-82a4-005056be1f7b', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для ржавчины', ''),
('df210450-93af-11e3-82a4-005056be1f7b-Bsd5-FnLH-Apdp-HGxx-B84M-GM1L', 'df210450-93af-11e3-82a4-005056be1f7b', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.75', 'л'),
('df210450-93af-11e3-82a4-005056be1f7b-BVYA-Fjaw-ARY1-Hkxo-BvqP-GO6M', 'df210450-93af-11e3-82a4-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('df210450-93af-11e3-82a4-005056be1f7b-BXdW-F05T-AH25-HrMB-BSia-GTH2', 'df210450-93af-11e3-82a4-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('df2d81cd-f78e-11e3-8c8a-005056be1f7b-B7F3-FLBw-ALDw-HQLY-Bs18-G7DF', 'df2d81cd-f78e-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '6000', 'г'),
('df2d81cd-f78e-11e3-8c8a-005056be1f7b-BEFG-FnXh-A6vh-HkD0-BZKu-GsH6', 'df2d81cd-f78e-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('df2d81cd-f78e-11e3-8c8a-005056be1f7b-BHvT-F7Lz-AF9P-HqPn-BUFe-GquF', 'df2d81cd-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('df2d81cd-f78e-11e3-8c8a-005056be1f7b-BiM5-Fy4J-AbNO-H750-BB0E-GHmc', 'df2d81cd-f78e-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('df2d81cd-f78e-11e3-8c8a-005056be1f7b-BjV4-FbK1-AUey-HZgI-BxZl-GQYn', 'df2d81cd-f78e-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'зеленый', ''),
('df2d81cd-f78e-11e3-8c8a-005056be1f7b-BpiO-FMIR-ALib-H7Qj-B3zv-Gwno', 'df2d81cd-f78e-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('df2d81cd-f78e-11e3-8c8a-005056be1f7b-Bz1W-FpkX-AUBi-HSbS-BXAo-GRby', 'df2d81cd-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('e017a0ce-f78d-11e3-8c8a-005056be1f7b-B4v2-FeEC-At41-HWMx-BGff-GVWk', 'e017a0ce-f78d-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('e017a0ce-f78d-11e3-8c8a-005056be1f7b-BDUq-FAnw-At0f-Hugn-BWgk-GedB', 'e017a0ce-f78d-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'оранжевый', ''),
('e017a0ce-f78d-11e3-8c8a-005056be1f7b-BEY8-Fe3L-AAHX-Hjjg-BKm2-G2ne', 'e017a0ce-f78d-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('e017a0ce-f78d-11e3-8c8a-005056be1f7b-BhjY-F6I9-AcTl-HTKP-Byym-GS7u', 'e017a0ce-f78d-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('e017a0ce-f78d-11e3-8c8a-005056be1f7b-BkND-F3d4-AtAQ-HI7j-BqzU-GiUZ', 'e017a0ce-f78d-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1900', 'г'),
('e017a0ce-f78d-11e3-8c8a-005056be1f7b-BnXe-FIIA-Aveh-HW0A-BYDY-GWiQ', 'e017a0ce-f78d-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('e017a0ce-f78d-11e3-8c8a-005056be1f7b-BTsP-F1EO-A2dS-HQz1-BgXZ-G6Si', 'e017a0ce-f78d-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('e02ebd60-99a6-11db-937f-000e0c431b59-B3iP-F4Jb-A0rp-HOsS-B8hk-GzPR', 'e02ebd60-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('e02ebd60-99a6-11db-937f-000e0c431b59-B3P7-FskC-A1Uk-HQIS-BLuc-Gkrn', 'e02ebd60-99a6-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '900', 'г'),
('e02ebd60-99a6-11db-937f-000e0c431b59-B8T6-FaSb-AHE1-HVFH-BtiZ-Gyr6', 'e02ebd60-99a6-11db-937f-000e0c431b59', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для мебели', ''),
('e02ebd60-99a6-11db-937f-000e0c431b59-BdRF-FJfx-AbdU-HCSk-BTzc-GOtf', 'e02ebd60-99a6-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('e02ebd60-99a6-11db-937f-000e0c431b59-Bh25-F4Dt-Akad-H0fq-BvYO-GBRX', 'e02ebd60-99a6-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('e02ebd60-99a6-11db-937f-000e0c431b59-BlJY-F7Lr-Ahfh-H0tQ-Berj-GaI3', 'e02ebd60-99a6-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'клей ПВА "Люкс"', ''),
('e02ebd60-99a6-11db-937f-000e0c431b59-BzR2-Fsrs-AlmV-HMzq-BWtY-GFNw', 'e02ebd60-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('e02ebd64-99a6-11db-937f-000e0c431b59-B4CP-Fl0v-AE1v-HXT1-BKkq-G0pN', 'e02ebd64-99a6-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'клей ПВА "Люкс"', ''),
('e02ebd64-99a6-11db-937f-000e0c431b59-BFgI-FzXw-AQ3s-H7fc-B1AS-GdEx', 'e02ebd64-99a6-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('e02ebd64-99a6-11db-937f-000e0c431b59-Bfm2-FG30-AZDu-H2ob-Be6q-Gnu4', 'e02ebd64-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('e02ebd64-99a6-11db-937f-000e0c431b59-Bfzm-FEew-AvBz-Hrfk-BOAM-GFHE', 'e02ebd64-99a6-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('e02ebd64-99a6-11db-937f-000e0c431b59-BQzz-FFhU-AqvV-H31c-B860-GGvX', 'e02ebd64-99a6-11db-937f-000e0c431b59', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для мебели', ''),
('e02ebd64-99a6-11db-937f-000e0c431b59-BROI-FyN2-AFsj-HoJr-BhC7-Gdvg', 'e02ebd64-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('e02ebd64-99a6-11db-937f-000e0c431b59-BTV9-FpOz-AHMu-HHSg-BeLi-Guxh', 'e02ebd64-99a6-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '2300', 'г'),
('e02ebd66-99a6-11db-937f-000e0c431b59-BEsS-FYbh-Asd9-HG81-BMwO-GNTB', 'e02ebd66-99a6-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '40000', 'г'),
('e02ebd66-99a6-11db-937f-000e0c431b59-Bf3X-FRPr-AHaR-HxZ8-BAtT-G0Yi', 'e02ebd66-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('e02ebd66-99a6-11db-937f-000e0c431b59-BL2V-F6r6-ADFU-HtOT-BCaX-Ge3G', 'e02ebd66-99a6-11db-937f-000e0c431b59', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для мебели', ''),
('e02ebd66-99a6-11db-937f-000e0c431b59-BMEb-FbsU-Ae5s-HZeX-BkvJ-GKVt', 'e02ebd66-99a6-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('e02ebd66-99a6-11db-937f-000e0c431b59-BRwk-FjkA-Aglt-H1kI-BYZp-GI9T', 'e02ebd66-99a6-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('e02ebd66-99a6-11db-937f-000e0c431b59-Bygu-FjnD-AFIP-Ho3C-BMX6-GjpK', 'e02ebd66-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('e02ebd66-99a6-11db-937f-000e0c431b59-ByXB-Fgxf-A4XR-HDin-Bxte-GIoM', 'e02ebd66-99a6-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'клей ПВА "Люкс"', ''),
('e02ebd6a-99a6-11db-937f-000e0c431b59-B0jN-FCRt-Avda-H3pR-BdxI-GuoP', 'e02ebd6a-99a6-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'клей ПВА-М "Экстра"', ''),
('e02ebd6a-99a6-11db-937f-000e0c431b59-B7il-Fwrm-ATVQ-HLjL-Bijv-GvmC', 'e02ebd6a-99a6-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '900', 'г'),
('e02ebd6a-99a6-11db-937f-000e0c431b59-BI2R-F2GL-A4W1-HIBg-Bon2-GN6W', 'e02ebd6a-99a6-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('e02ebd6a-99a6-11db-937f-000e0c431b59-BlVj-FSew-An1C-Hrfs-BMrG-GL2k', 'e02ebd6a-99a6-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('e02ebd6a-99a6-11db-937f-000e0c431b59-BLX9-FJe7-AAqt-HO5C-BQoP-Goqf', 'e02ebd6a-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('e02ebd6a-99a6-11db-937f-000e0c431b59-BtMY-FBQ8-AoDq-HJMV-BWQD-Gopf', 'e02ebd6a-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('e02ebd6c-99a6-11db-937f-000e0c431b59-B3JH-Ffb9-AkXp-HWqI-BJ2D-GjUk', 'e02ebd6c-99a6-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '2300', 'г'),
('e02ebd6c-99a6-11db-937f-000e0c431b59-BfYg-F6QL-AMt9-HVen-BlaL-GMN3', 'e02ebd6c-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('e02ebd6c-99a6-11db-937f-000e0c431b59-BhDB-F5HE-A5Om-HR2F-B6qv-GTdx', 'e02ebd6c-99a6-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('e02ebd6c-99a6-11db-937f-000e0c431b59-BK5a-FdhP-A9C6-HBwr-BwUv-GyP4', 'e02ebd6c-99a6-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'клей ПВА-М "Экстра"', ''),
('e02ebd6c-99a6-11db-937f-000e0c431b59-BypX-FxB2-AamS-Hmzf-BfpC-Gtvv', 'e02ebd6c-99a6-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('e02ebd6c-99a6-11db-937f-000e0c431b59-BzhO-FGsx-ASQX-HDC0-BGhX-Gndn', 'e02ebd6c-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('e02ebd6e-99a6-11db-937f-000e0c431b59-B6yQ-Fc5Q-AVkG-Hh5r-BDov-GrJE', 'e02ebd6e-99a6-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('e02ebd6e-99a6-11db-937f-000e0c431b59-BO50-F4Qp-ABah-HF03-BqzL-GTlg', 'e02ebd6e-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('e02ebd6e-99a6-11db-937f-000e0c431b59-BQof-FnSK-ATjE-H5y2-Buuq-GBNk', 'e02ebd6e-99a6-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'клей ПВА-М "Экстра"', ''),
('e02ebd6e-99a6-11db-937f-000e0c431b59-BSiL-FZFF-AGIt-H313-B8Gg-Gctz', 'e02ebd6e-99a6-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '4000', 'г'),
('e02ebd6e-99a6-11db-937f-000e0c431b59-BuEn-FeSi-AeaX-Hopq-BQ4k-GPw1', 'e02ebd6e-99a6-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('e02ebd6e-99a6-11db-937f-000e0c431b59-BzTn-FvUa-AdHu-HO6A-BHyJ-GPTl', 'e02ebd6e-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('e02ebd70-99a6-11db-937f-000e0c431b59-BaiL-FhIE-AGiE-HN65-BwGd-GtMQ', 'e02ebd70-99a6-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'клей ПВА-М "Экстра"', ''),
('e02ebd70-99a6-11db-937f-000e0c431b59-BGi8-F1bx-AsY5-HP2n-BEeq-GdMm', 'e02ebd70-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('e02ebd70-99a6-11db-937f-000e0c431b59-Bh5J-F1Te-AWUh-HorP-B8Hx-GJp7', 'e02ebd70-99a6-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '10000', 'г'),
('e02ebd70-99a6-11db-937f-000e0c431b59-BLi8-FFxy-As3T-HYVf-BBCR-GWrT', 'e02ebd70-99a6-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('e02ebd70-99a6-11db-937f-000e0c431b59-BnCY-Fr7N-Ajr9-HPtL-B1Ct-GBbz', 'e02ebd70-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('e02ebd70-99a6-11db-937f-000e0c431b59-BrwU-FpBE-A12G-Hk4i-BZ0H-GX1i', 'e02ebd70-99a6-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('e02ebd72-99a6-11db-937f-000e0c431b59-BCvS-Fjbx-ARZz-H6gt-B3H0-GJP5', 'e02ebd72-99a6-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('e02ebd72-99a6-11db-937f-000e0c431b59-BInw-FPyx-AB6C-Hjhk-BGkV-GYJx', 'e02ebd72-99a6-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('e02ebd72-99a6-11db-937f-000e0c431b59-BLaN-FBWt-AvO2-HuYH-Bpgu-Gbwi', 'e02ebd72-99a6-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'клей ПВА-М "Экстра"', ''),
('e02ebd72-99a6-11db-937f-000e0c431b59-BlQR-FI59-AX3G-HLBw-BHPh-Gmhg', 'e02ebd72-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('e02ebd72-99a6-11db-937f-000e0c431b59-BNve-FS0a-ANvg-Hqes-B8Cn-GG47', 'e02ebd72-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('e02ebd72-99a6-11db-937f-000e0c431b59-BOxe-FRWC-A2cm-HN2v-BBDM-GOFj', 'e02ebd72-99a6-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '40000', 'г'),
('e02ebd74-99a6-11db-937f-000e0c431b59-BBB3-FuUz-A77e-H7iT-BIpD-Gapz', 'e02ebd74-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('e02ebd74-99a6-11db-937f-000e0c431b59-BeMn-Fl9y-Am1m-Hbwj-BBU8-GgJ2', 'e02ebd74-99a6-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '2300', 'г'),
('e02ebd74-99a6-11db-937f-000e0c431b59-BGuS-F0vK-A7yW-HGIX-B5r4-GdQr', 'e02ebd74-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('e02ebd74-99a6-11db-937f-000e0c431b59-BhYe-Fz4y-AvOt-HUMm-Bk81-GeMR', 'e02ebd74-99a6-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'клей ПВА "Мастер"', ''),
('e02ebd74-99a6-11db-937f-000e0c431b59-Bkln-F8sw-AUmd-HNGu-B6Hw-Gx3G', 'e02ebd74-99a6-11db-937f-000e0c431b59', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсальный', ''),
('e02ebd74-99a6-11db-937f-000e0c431b59-BnyD-FIvl-Ab4R-HfU7-BU6i-G93Q', 'e02ebd74-99a6-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('e02ebd74-99a6-11db-937f-000e0c431b59-BuN4-FOb0-A0WH-HvKA-B3yz-G67k', 'e02ebd74-99a6-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('e02ebd76-99a6-11db-937f-000e0c431b59-Bj3r-FvGL-AJTD-HLE5-BSZe-Gwte', 'e02ebd76-99a6-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '900', 'г'),
('e02ebd76-99a6-11db-937f-000e0c431b59-BpLx-F5sJ-AXh0-HBAa-BoRe-GHL0', 'e02ebd76-99a6-11db-937f-000e0c431b59', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'строительно-универсальный', ''),
('e02ebd76-99a6-11db-937f-000e0c431b59-BRDd-F4fQ-Achk-HaDu-BRYq-GXd7', 'e02ebd76-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('e02ebd76-99a6-11db-937f-000e0c431b59-BTq4-FSs5-AtWM-HOeX-BN3C-Gu1H', 'e02ebd76-99a6-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('e02ebd76-99a6-11db-937f-000e0c431b59-BUjd-FT0N-AwWm-HZg7-Bvzn-GpIV', 'e02ebd76-99a6-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'клей ПВА', ''),
('e02ebd76-99a6-11db-937f-000e0c431b59-BV6F-FEQS-Ar2P-HhVc-Bzzo-Gcbm', 'e02ebd76-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('e02ebd76-99a6-11db-937f-000e0c431b59-BXog-F9Fk-AtW9-HZtc-BWYn-GKTW', 'e02ebd76-99a6-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('e02ebd78-99a6-11db-937f-000e0c431b59-B7uD-FLHV-AHxF-H6HT-BuJ8-G6Sf', 'e02ebd78-99a6-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('e02ebd78-99a6-11db-937f-000e0c431b59-BAf1-Fm5W-AjqM-HMVV-Bh6N-GPrT', 'e02ebd78-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('e02ebd78-99a6-11db-937f-000e0c431b59-Bb1n-FeCs-AZVH-H5H2-BYHW-GOuR', 'e02ebd78-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('e02ebd78-99a6-11db-937f-000e0c431b59-BBnK-FJhS-AA7a-HWLK-Bowe-GmkA', 'e02ebd78-99a6-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('e02ebd78-99a6-11db-937f-000e0c431b59-BlT9-FyfT-AJDP-HWS7-Bqtx-GTOz', 'e02ebd78-99a6-11db-937f-000e0c431b59', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'строительно-универсальный', ''),
('e02ebd78-99a6-11db-937f-000e0c431b59-BNSb-Fnpm-AyUZ-HT8A-BT4u-GXE3', 'e02ebd78-99a6-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'клей ПВА "Люкс"', ''),
('e02ebd78-99a6-11db-937f-000e0c431b59-BsMp-FxHx-AH37-HExO-BjBh-GBpN', 'e02ebd78-99a6-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '2300', 'г'),
('e02ebd7a-99a6-11db-937f-000e0c431b59-B2uZ-F3aI-Akmg-HTEF-B7l0-Gkm3', 'e02ebd7a-99a6-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '4000', 'г'),
('e02ebd7a-99a6-11db-937f-000e0c431b59-B8W9-FKDZ-AWhA-Hqsr-BLYt-Gcin', 'e02ebd7a-99a6-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('e02ebd7a-99a6-11db-937f-000e0c431b59-Bg4n-FB4S-AATG-HiQc-BdOy-GcY2', 'e02ebd7a-99a6-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'клей ПВА "Люкс"', ''),
('e02ebd7a-99a6-11db-937f-000e0c431b59-BJHq-FGLe-AUvf-H3wK-BGao-Goea', 'e02ebd7a-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('e02ebd7a-99a6-11db-937f-000e0c431b59-BJih-FhXA-AAEM-HqaM-BekT-GKqf', 'e02ebd7a-99a6-11db-937f-000e0c431b59', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'строительно-универсальный', ''),
('e02ebd7a-99a6-11db-937f-000e0c431b59-Bodi-FDwf-ADGY-Hydd-BqMp-GW0x', 'e02ebd7a-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('e02ebd7a-99a6-11db-937f-000e0c431b59-BpBR-FK5D-AVAe-H0o0-Baxh-G8V5', 'e02ebd7a-99a6-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('e02ebd7c-99a6-11db-937f-000e0c431b59-B2dX-FXhr-AWak-HGzm-B6D9-GARd', 'e02ebd7c-99a6-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '10000', 'г'),
('e02ebd7c-99a6-11db-937f-000e0c431b59-B4nL-F0Lc-Aboq-HQGF-BH91-Gh2Q', 'e02ebd7c-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('e02ebd7c-99a6-11db-937f-000e0c431b59-Bjvg-FIEy-AUPA-HJmL-BKbx-Gz8q', 'e02ebd7c-99a6-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('e02ebd7c-99a6-11db-937f-000e0c431b59-Blir-FXAQ-A0sf-HEU9-B34u-GZBy', 'e02ebd7c-99a6-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('e02ebd7c-99a6-11db-937f-000e0c431b59-BNVE-FOfq-AZpH-HNeF-B4Go-Gldo', 'e02ebd7c-99a6-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'клей ПВА "Люкс"', ''),
('e02ebd7c-99a6-11db-937f-000e0c431b59-Bqb4-FNu8-ATrj-HSSL-BKLz-GWLA', 'e02ebd7c-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('e02ebd7c-99a6-11db-937f-000e0c431b59-Bzmp-Fg3w-AlAv-Hbim-BsPE-Glcy', 'e02ebd7c-99a6-11db-937f-000e0c431b59', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'строительно-универсальный', ''),
('e02ebd7e-99a6-11db-937f-000e0c431b59-B4cC-FjOA-Axcr-Hd61-BLFo-GFM1', 'e02ebd7e-99a6-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'клей ПВА "Люкс"', ''),
('e02ebd7e-99a6-11db-937f-000e0c431b59-BJy5-FGLr-Atxw-HXFu-BJ3N-G0PJ', 'e02ebd7e-99a6-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('e02ebd7e-99a6-11db-937f-000e0c431b59-BqqI-Fy5n-A4yt-HhZN-BMRr-GkpP', 'e02ebd7e-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('e02ebd7e-99a6-11db-937f-000e0c431b59-BRBp-F3If-AfEj-HdE2-B7ui-GFic', 'e02ebd7e-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('e02ebd7e-99a6-11db-937f-000e0c431b59-BscQ-FcAp-ApN8-HXxm-BmFn-GR8w', 'e02ebd7e-99a6-11db-937f-000e0c431b59', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'строительно-универсальный', ''),
('e02ebd7e-99a6-11db-937f-000e0c431b59-Bw6o-FjSt-ATbm-Hga2-BqUU-Gs4j', 'e02ebd7e-99a6-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '38000', 'г'),
('e02ebd7e-99a6-11db-937f-000e0c431b59-Bxc1-FW75-AN4p-Hv9O-BNqq-GdIr', 'e02ebd7e-99a6-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('e02ebdc0-99a6-11db-937f-000e0c431b59-B1Sj-FMid-ACyi-HM6o-Bq74-Gz7O', 'e02ebdc0-99a6-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('e02ebdc0-99a6-11db-937f-000e0c431b59-B6f1-F2kb-At5a-Hp05-B5yB-G3WZ', 'e02ebdc0-99a6-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('e02ebdc0-99a6-11db-937f-000e0c431b59-B82D-FgE0-ALu7-HFk3-BT06-GFdP', 'e02ebdc0-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('e02ebdc0-99a6-11db-937f-000e0c431b59-BAPJ-F0Ui-AGgF-HR9I-BXAn-GDno', 'e02ebdc0-99a6-11db-937f-000e0c431b59', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('e02ebdc0-99a6-11db-937f-000e0c431b59-BgQp-F76p-A11d-H3t1-BSVJ-GCSF', 'e02ebdc0-99a6-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'герметик', ''),
('e02ebdc0-99a6-11db-937f-000e0c431b59-BlTt-F86i-AHyV-HIto-BOpK-GEgu', 'e02ebdc0-99a6-11db-937f-000e0c431b59', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.3', 'л'),
('e02ebdc0-99a6-11db-937f-000e0c431b59-BYDv-FeUt-Anrt-HQvX-B6mq-GeyP', 'e02ebdc0-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('e02ebdc0-99a6-11db-937f-000e0c431b59-ByH8-FiYt-A7TV-HmyK-B3wB-G6TF', 'e02ebdc0-99a6-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KRASS', ''),
('e02ebdc3-99a6-11db-937f-000e0c431b59-B3PJ-F9vE-AGUu-HWaj-BrDb-Gnjw', 'e02ebdc3-99a6-11db-937f-000e0c431b59', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.3', 'л'),
('e02ebdc3-99a6-11db-937f-000e0c431b59-BGh4-FzWA-AEdZ-H8A5-BeVa-GolE', 'e02ebdc3-99a6-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'бесцветный', ''),
('e02ebdc3-99a6-11db-937f-000e0c431b59-Bn26-FfVK-A04K-HOBA-BSri-GBZ7', 'e02ebdc3-99a6-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('e02ebdc3-99a6-11db-937f-000e0c431b59-Bpjo-FEHv-A5lv-H9Ot-Bx7x-G8ZN', 'e02ebdc3-99a6-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'герметик', ''),
('e02ebdc3-99a6-11db-937f-000e0c431b59-Bqit-FrX2-AzMF-Hg6I-BjpQ-GFyV', 'e02ebdc3-99a6-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KRASS', ''),
('e02ebdc3-99a6-11db-937f-000e0c431b59-BsEJ-Fcaj-ACIn-HdwM-BQkv-G8jj', 'e02ebdc3-99a6-11db-937f-000e0c431b59', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для натурального камня', ''),
('e02ebdc3-99a6-11db-937f-000e0c431b59-BtHg-FIFh-ADk3-HdPd-Bi0O-GHzE', 'e02ebdc3-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('e02ebdc3-99a6-11db-937f-000e0c431b59-Buuj-F1zi-AspA-HzHI-BzNq-GtDD', 'e02ebdc3-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('e02ebdc3-99a6-11db-937f-000e0c431b59-Byjq-F0xr-A0FZ-HhGz-Be0E-Gn8z', 'e02ebdc3-99a6-11db-937f-000e0c431b59', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для бетона', ''),
('e02ebdc6-99a6-11db-937f-000e0c431b59-B7N9-FNI4-ASNH-HtDJ-BwTw-GRwY', 'e02ebdc6-99a6-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'герметик', ''),
('e02ebdc6-99a6-11db-937f-000e0c431b59-BgW0-FLC2-AwCR-H65E-BENb-G1CC', 'e02ebdc6-99a6-11db-937f-000e0c431b59', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для бетона', ''),
('e02ebdc6-99a6-11db-937f-000e0c431b59-BhcW-FK7J-AXNt-HJKT-Bsz4-GX5A', 'e02ebdc6-99a6-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'серый', ''),
('e02ebdc6-99a6-11db-937f-000e0c431b59-BIyl-F4w1-Amkx-HahN-BoEp-GAPl', 'e02ebdc6-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('e02ebdc6-99a6-11db-937f-000e0c431b59-Bji4-FW0a-Ajnf-HOnv-B1xZ-GorM', 'e02ebdc6-99a6-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KRASS', ''),
('e02ebdc6-99a6-11db-937f-000e0c431b59-BJny-F4x9-ANgy-HG4s-BGCg-Gs7S', 'e02ebdc6-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('e02ebdc6-99a6-11db-937f-000e0c431b59-Bn5s-FbBm-AKIo-Hq2k-B0aJ-G3wI', 'e02ebdc6-99a6-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('e02ebdc6-99a6-11db-937f-000e0c431b59-BPme-Fdml-AXxV-HNsh-BEP4-GEa7', 'e02ebdc6-99a6-11db-937f-000e0c431b59', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для натурального камня', ''),
('e02ebdc6-99a6-11db-937f-000e0c431b59-BTWv-FylZ-AkbN-H0G5-BLuz-G5M2', 'e02ebdc6-99a6-11db-937f-000e0c431b59', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.3', 'л'),
('e02ebdcc-99a6-11db-937f-000e0c431b59-B3KM-FNX5-AvcK-Hohk-Bldy-Gjr7', 'e02ebdcc-99a6-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'черный', ''),
('e02ebdcc-99a6-11db-937f-000e0c431b59-B7RU-FeyI-Ayty-HS1s-BK3X-GfFr', 'e02ebdcc-99a6-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KRASS', ''),
('e02ebdcc-99a6-11db-937f-000e0c431b59-Bc4o-FgvZ-AIaG-HCZS-BuiR-GLej', 'e02ebdcc-99a6-11db-937f-000e0c431b59', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для каминов', ''),
('e02ebdcc-99a6-11db-937f-000e0c431b59-BcAK-FkuN-Atgh-HgxT-B6qe-GH43', 'e02ebdcc-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('e02ebdcc-99a6-11db-937f-000e0c431b59-BCoU-FMT3-Ax6W-HleD-Bi8D-Gshx', 'e02ebdcc-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('e02ebdcc-99a6-11db-937f-000e0c431b59-BdJB-FoL0-A55V-HDQb-BpsV-GUOG', 'e02ebdcc-99a6-11db-937f-000e0c431b59', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для печей', ''),
('e02ebdcc-99a6-11db-937f-000e0c431b59-BI0b-F7RR-AocK-HC8Q-BtWI-GVGm', 'e02ebdcc-99a6-11db-937f-000e0c431b59', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.3', 'л'),
('e02ebdcc-99a6-11db-937f-000e0c431b59-BtXh-F1a8-AIKf-HaW0-B01J-GBfU', 'e02ebdcc-99a6-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'герметик', ''),
('e02ebdcc-99a6-11db-937f-000e0c431b59-BY3m-FudG-AxCE-H2um-Bpr4-G0Ls', 'e02ebdcc-99a6-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('e12e57a9-f78f-11e3-8c8a-005056be1f7b-B8VN-F89v-AlS6-HvYJ-B90x-G9iz', 'e12e57a9-f78f-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('e12e57a9-f78f-11e3-8c8a-005056be1f7b-B9sa-FC6i-AkkA-Hnin-BTKJ-GGNN', 'e12e57a9-f78f-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'синий', ''),
('e12e57a9-f78f-11e3-8c8a-005056be1f7b-BcWk-FTgT-ASfC-HA6x-Bn4I-G12H', 'e12e57a9-f78f-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('e12e57a9-f78f-11e3-8c8a-005056be1f7b-BimW-FVHh-AscL-HaYI-BpnX-Ga5n', 'e12e57a9-f78f-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '20000', 'г'),
('e12e57a9-f78f-11e3-8c8a-005056be1f7b-Bko0-FjBe-Axv1-HKt0-B0sr-GZvn', 'e12e57a9-f78f-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('e12e57a9-f78f-11e3-8c8a-005056be1f7b-BmdZ-FhOy-ArNx-HfLW-BUns-G67P', 'e12e57a9-f78f-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('e12e57a9-f78f-11e3-8c8a-005056be1f7b-BPPu-FRQq-AE4j-HNub-BUX5-Gu5J', 'e12e57a9-f78f-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('e213c98a-ccbb-11e4-a1f9-005056be1f7b-B1yk-FHja-Aj5Y-HG6K-BpW1-G8Iw', 'e213c98a-ccbb-11e4-a1f9-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('e213c98a-ccbb-11e4-a1f9-005056be1f7b-B7mZ-FKj5-AcpQ-HhVt-BMbw-Gw76', 'e213c98a-ccbb-11e4-a1f9-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '400', 'г'),
('e213c98a-ccbb-11e4-a1f9-005056be1f7b-BbqR-Fv6r-Ad5H-HRRm-BAPi-GlEI', 'e213c98a-ccbb-11e4-a1f9-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('e213c98a-ccbb-11e4-a1f9-005056be1f7b-BGCj-FeJe-Apz2-HfxA-BScm-G9Of', 'e213c98a-ccbb-11e4-a1f9-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'сольвент', ''),
('e213c98a-ccbb-11e4-a1f9-005056be1f7b-Bplq-Fw49-AY4N-H7fR-BFVF-Gpdo', 'e213c98a-ccbb-11e4-a1f9-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('e242e97f-f29b-11dd-9439-000e0c431b58-B7zL-Ftc8-Ab6O-H7tV-Bqrn-GcS5', 'e242e97f-f29b-11dd-9439-000e0c431b58', 'e765ba72-107d-11e3-8a5d-0050569a1080', 'база А', ''),
('e242e97f-f29b-11dd-9439-000e0c431b58-B8Sv-FlQu-APXG-HGIU-Bnum-GfZW', 'e242e97f-f29b-11dd-9439-000e0c431b58', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('e242e97f-f29b-11dd-9439-000e0c431b58-B9xQ-FjsO-AqYx-H6IK-Bkv4-GQAa', 'e242e97f-f29b-11dd-9439-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('e242e97f-f29b-11dd-9439-000e0c431b58-BB5Y-FQ4Y-Aywl-H59G-BqjP-GuWo', 'e242e97f-f29b-11dd-9439-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'фасадная всесезонная', ''),
('e242e97f-f29b-11dd-9439-000e0c431b58-Bg1s-FUvI-AIGT-HQET-BDWz-GqoZ', 'e242e97f-f29b-11dd-9439-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('e242e97f-f29b-11dd-9439-000e0c431b58-BlIE-FwY3-AXBm-HxzF-Bpk0-Gdj2', 'e242e97f-f29b-11dd-9439-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('e242e97f-f29b-11dd-9439-000e0c431b58-Bmtp-FOge-AUME-HUqo-BLrj-Gj9d', 'e242e97f-f29b-11dd-9439-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('e242e97f-f29b-11dd-9439-000e0c431b58-BNiS-FTpa-AnSL-HPxk-BmuZ-Gxd3', 'e242e97f-f29b-11dd-9439-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('e242e97f-f29b-11dd-9439-000e0c431b58-Bv5y-F02h-AVhP-H90h-B4MG-GLfv', 'e242e97f-f29b-11dd-9439-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('e242e97f-f29b-11dd-9439-000e0c431b58-BvUm-FzoT-AezA-HEZ0-BhXw-Gy7f', 'e242e97f-f29b-11dd-9439-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '9', 'л'),
('e2e51024-e980-11e4-ab92-005056be1f7b-B0wt-FFbw-Azl7-HoHO-BSzF-GaKe', 'e2e51024-e980-11e4-ab92-005056be1f7b', 'e765ba72-107d-11e3-8a5d-0050569a1080', 'база С', ''),
('e2e51024-e980-11e4-ab92-005056be1f7b-BBbB-Fu2V-AtRU-HyV4-BmJS-Gdhm', 'e2e51024-e980-11e4-ab92-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('e2e51024-e980-11e4-ab92-005056be1f7b-Bh5l-F0su-A20P-HeLx-BHLj-G2QB', 'e2e51024-e980-11e4-ab92-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый матовый', ''),
('e2e51024-e980-11e4-ab92-005056be1f7b-Bji6-F5WR-Ay0b-HGd9-BtRm-GGaC', 'e2e51024-e980-11e4-ab92-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('e2e51024-e980-11e4-ab92-005056be1f7b-BnFm-Fktu-AzCj-H6ct-BaAo-GCAW', 'e2e51024-e980-11e4-ab92-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('e2e51024-e980-11e4-ab92-005056be1f7b-Br2H-FVZH-AuGc-HxI2-BQfm-GMhn', 'e2e51024-e980-11e4-ab92-005056be1f7b', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'латексная', ''),
('e2e51024-e980-11e4-ab92-005056be1f7b-Bw2W-FCVh-Azds-HZU9-Ba9E-GDjy', 'e2e51024-e980-11e4-ab92-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('e2e51024-e980-11e4-ab92-005056be1f7b-BxY2-FXTU-AHuU-HvwU-BIjL-Gemh', 'e2e51024-e980-11e4-ab92-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'PARADE', ''),
('e2e51024-e980-11e4-ab92-005056be1f7b-ByoW-FIZJ-Adhs-HpCU-BMEw-GNyn', 'e2e51024-e980-11e4-ab92-005056be1f7b', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '2.5', 'л'),
('e39c5eb8-24d0-11e2-8158-005056be3bd8-B1z8-F10k-AMJJ-HzOQ-BsbD-Gufh', 'e39c5eb8-24d0-11e2-8158-005056be3bd8', '1d08380b-ce34-11e4-a80e-005056be1f7a', '200000', 'г'),
('e39c5eb8-24d0-11e2-8158-005056be3bd8-B6R5-FiQH-ApI2-Hqjh-BGiq-GAQT', 'e39c5eb8-24d0-11e2-8158-005056be3bd8', 'e8287600-ad96-11e3-b114-005056be1f7c', 'РОГНЕДА', ''),
('e39c5eb8-24d0-11e2-8158-005056be3bd8-B9J5-FrmO-AuGR-HqY7-BGLr-GyWA', 'e39c5eb8-24d0-11e2-8158-005056be3bd8', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('e39c5eb8-24d0-11e2-8158-005056be3bd8-BMwB-FEdl-AljK-HSka-Blzb-GBWJ', 'e39c5eb8-24d0-11e2-8158-005056be3bd8', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'огнебиозащитный состав', ''),
('e39c5eb8-24d0-11e2-8158-005056be3bd8-BPBa-Fgry-Acy0-HKmW-BKin-GEH4', 'e39c5eb8-24d0-11e2-8158-005056be3bd8', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('e39c5eb8-24d0-11e2-8158-005056be3bd8-Bwvs-FLTG-A55m-H9NH-B3tB-GbpZ', 'e39c5eb8-24d0-11e2-8158-005056be3bd8', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('e4020814-4598-11e1-8212-001cc494be80-BbQD-F41K-AR3i-HpWn-B2CD-GitP', 'e4020814-4598-11e1-8212-001cc494be80', 'e765ba72-107d-11e3-8a5d-0050569a1080', 'база С', ''),
('e4020814-4598-11e1-8212-001cc494be80-BBqF-FITY-AaCP-HvHD-BGX6-GmJ5', 'e4020814-4598-11e1-8212-001cc494be80', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для кухни', ''),
('e4020814-4598-11e1-8212-001cc494be80-BduZ-Fsgg-Avm5-HrPD-BmT2-GP2S', 'e4020814-4598-11e1-8212-001cc494be80', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('e4020814-4598-11e1-8212-001cc494be80-Be4j-FClT-AvMy-HHG0-BciP-GgcG', 'e4020814-4598-11e1-8212-001cc494be80', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('e4020814-4598-11e1-8212-001cc494be80-BEHz-F3P7-A2se-HHO8-BN6q-GMKF', 'e4020814-4598-11e1-8212-001cc494be80', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('e4020814-4598-11e1-8212-001cc494be80-Beu8-F03L-A7GH-HnSR-Bs2U-GFxU', 'e4020814-4598-11e1-8212-001cc494be80', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('e4020814-4598-11e1-8212-001cc494be80-BExn-Fha4-A4Tn-HAJX-B0LD-GEUX', 'e4020814-4598-11e1-8212-001cc494be80', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для ванной', ''),
('e4020814-4598-11e1-8212-001cc494be80-BiDW-F70L-AELf-HG72-BtA0-Gi4P', 'e4020814-4598-11e1-8212-001cc494be80', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('e4020814-4598-11e1-8212-001cc494be80-BQ3g-Fw0c-Ansc-HnQW-B3uG-Gzt0', 'e4020814-4598-11e1-8212-001cc494be80', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '9', 'л'),
('e4020814-4598-11e1-8212-001cc494be80-Bqaq-FrL6-AJTh-Hrut-BleW-G5LU', 'e4020814-4598-11e1-8212-001cc494be80', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'латексная', ''),
('e4020814-4598-11e1-8212-001cc494be80-Brt9-FPYV-A3QY-H7zI-BLTB-GuWm', 'e4020814-4598-11e1-8212-001cc494be80', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('e545e44e-298d-11e2-8829-005056be3bd8-B6kZ-FdMo-AgWP-HroX-BRod-G2N0', 'e545e44e-298d-11e2-8829-005056be3bd8', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('e545e44e-298d-11e2-8829-005056be3bd8-BAGk-Fifn-AcFg-HMmP-B6uK-GyC7', 'e545e44e-298d-11e2-8829-005056be3bd8', 'e8287600-ad96-11e3-b114-005056be1f7c', 'РОГНЕДА', ''),
('e545e44e-298d-11e2-8829-005056be3bd8-Bbho-FrOT-AEf9-HiXL-Bh32-Gm4t', 'e545e44e-298d-11e2-8829-005056be3bd8', '1d08380b-ce34-11e4-a80e-005056be1f7a', '23000', 'г'),
('e545e44e-298d-11e2-8829-005056be3bd8-BepE-FA3r-AQyc-Hbme-BXhE-GxAR', 'e545e44e-298d-11e2-8829-005056be3bd8', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'огнебиозащитный состав', ''),
('e545e44e-298d-11e2-8829-005056be3bd8-BH63-FRvG-Aidi-HmOD-BKkK-GRIj', 'e545e44e-298d-11e2-8829-005056be3bd8', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('e545e44e-298d-11e2-8829-005056be3bd8-BWHH-FhZs-A8Ai-HZC5-Bj3t-Ghts', 'e545e44e-298d-11e2-8829-005056be3bd8', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('e545e450-298d-11e2-8829-005056be3bd8-Bf4i-F7Yh-Adet-HdUD-BdC6-GRpZ', 'e545e450-298d-11e2-8829-005056be3bd8', '1d08380b-ce34-11e4-a80e-005056be1f7a', '10000', 'г'),
('e545e450-298d-11e2-8829-005056be3bd8-BHUs-F0zM-AZoa-He0g-BGLA-GzTA', 'e545e450-298d-11e2-8829-005056be3bd8', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('e545e450-298d-11e2-8829-005056be3bd8-BMes-FI03-Aix5-Hkqd-Bz5c-GFUC', 'e545e450-298d-11e2-8829-005056be3bd8', 'e8287600-ad96-11e3-b114-005056be1f7c', 'РОГНЕДА', ''),
('e545e450-298d-11e2-8829-005056be3bd8-BN9P-FakC-A0p2-Hfda-ByOF-GUGm', 'e545e450-298d-11e2-8829-005056be3bd8', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('e545e450-298d-11e2-8829-005056be3bd8-Bs3x-Fmde-AFTY-HiYt-BkfE-GTe4', 'e545e450-298d-11e2-8829-005056be3bd8', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'огнебиозащитный состав', ''),
('e545e450-298d-11e2-8829-005056be3bd8-Buof-F2h2-AYG6-HfJa-ByBB-G3jO', 'e545e450-298d-11e2-8829-005056be3bd8', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('e63d2bae-f78d-11e3-8c8a-005056be1f7b-B37H-Frm8-A5wt-HfgP-BKAr-Geyn', 'e63d2bae-f78d-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('e63d2bae-f78d-11e3-8c8a-005056be1f7b-BecU-Fx6R-AX5z-HhNe-ByBS-G25N', 'e63d2bae-f78d-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('e63d2bae-f78d-11e3-8c8a-005056be1f7b-Br4D-FaZj-Aqjk-HYDY-BBzj-GjbS', 'e63d2bae-f78d-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('e63d2bae-f78d-11e3-8c8a-005056be1f7b-BVg1-FI5O-A1gg-HeQf-Bv9Y-GyZy', 'e63d2bae-f78d-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('e63d2bae-f78d-11e3-8c8a-005056be1f7b-BvLh-Fltv-AFhx-HYYs-BlRo-Gt0Q', 'e63d2bae-f78d-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('e63d2bae-f78d-11e3-8c8a-005056be1f7b-BxyC-F46B-AB4z-HqzM-BJvl-Gtfo', 'e63d2bae-f78d-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'желтый', ''),
('e63d2bae-f78d-11e3-8c8a-005056be1f7b-BYFY-F9eb-AWfR-H7Fs-BObP-GEjK', 'e63d2bae-f78d-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1900', 'г'),
('e68fd7da-99a6-11db-937f-000e0c431b59-BBZP-FXdf-AzJO-HLdc-BRN1-GzEQ', 'e68fd7da-99a6-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'бесцветный', ''),
('e68fd7da-99a6-11db-937f-000e0c431b59-Bg4L-FuEp-ANW4-HDL8-BT8L-GuOy', 'e68fd7da-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('e68fd7da-99a6-11db-937f-000e0c431b59-Bifc-FM6H-AVqy-H5r3-B8Ow-GJ92', 'e68fd7da-99a6-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KRASS', ''),
('e68fd7da-99a6-11db-937f-000e0c431b59-BjhF-FPRh-A52y-Hwqx-B44b-Gkd6', 'e68fd7da-99a6-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'герметик', ''),
('e68fd7da-99a6-11db-937f-000e0c431b59-BNnq-FkeB-AMJ4-HTR0-BXga-GHkw', 'e68fd7da-99a6-11db-937f-000e0c431b59', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для металла', ''),
('e68fd7da-99a6-11db-937f-000e0c431b59-BPbu-FEWb-A8Tq-Htcp-BkQ2-Gy9H', 'e68fd7da-99a6-11db-937f-000e0c431b59', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.3', 'л'),
('e68fd7da-99a6-11db-937f-000e0c431b59-BwNa-FRnx-AQno-HapJ-Buqj-GAEC', 'e68fd7da-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('e68fd7da-99a6-11db-937f-000e0c431b59-ByMN-FrPZ-ApjW-H1Ul-Bp3H-GHFD', 'e68fd7da-99a6-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('e68fd7dc-99a6-11db-937f-000e0c431b59-BDa8-FTv6-A1oN-Hvvo-BOfZ-Gqm4', 'e68fd7dc-99a6-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'герметик', ''),
('e68fd7dc-99a6-11db-937f-000e0c431b59-BeyU-FOLz-Ace6-HW3f-BQnk-GhQi', 'e68fd7dc-99a6-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KRASS', ''),
('e68fd7dc-99a6-11db-937f-000e0c431b59-BlpF-Fe0W-AdX4-H4ed-BqEB-GvUT', 'e68fd7dc-99a6-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'серый', ''),
('e68fd7dc-99a6-11db-937f-000e0c431b59-BTPK-FIB1-A65u-HXeO-BSF5-GYk4', 'e68fd7dc-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('e68fd7dc-99a6-11db-937f-000e0c431b59-Btuc-FHdF-AWmM-HaHh-BqaV-Gapg', 'e68fd7dc-99a6-11db-937f-000e0c431b59', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для металла', ''),
('e68fd7dc-99a6-11db-937f-000e0c431b59-BTxu-FOKm-AubQ-HU9h-B4R6-GGbc', 'e68fd7dc-99a6-11db-937f-000e0c431b59', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.3', 'л'),
('e68fd7dc-99a6-11db-937f-000e0c431b59-BTYN-FJhn-AT0X-HsmP-BJGD-GeVP', 'e68fd7dc-99a6-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('e68fd7dc-99a6-11db-937f-000e0c431b59-BuEQ-Fn9v-AHo1-HJaK-BctZ-Gn3a', 'e68fd7dc-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('e68fd7df-99a6-11db-937f-000e0c431b59-BaI3-FRqR-AuId-HMFo-BEpU-GCT3', 'e68fd7df-99a6-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KRASS', ''),
('e68fd7df-99a6-11db-937f-000e0c431b59-BdSi-F8en-AljT-H6mn-ByIV-Glsn', 'e68fd7df-99a6-11db-937f-000e0c431b59', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.3', 'л'),
('e68fd7df-99a6-11db-937f-000e0c431b59-Bgsx-FjRD-Afwk-HK1k-BTRt-GLia', 'e68fd7df-99a6-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('e68fd7df-99a6-11db-937f-000e0c431b59-Bkq8-Fohe-AY6D-HiQ6-Bego-GEAJ', 'e68fd7df-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('e68fd7df-99a6-11db-937f-000e0c431b59-BM6c-Ff2E-AIpM-HdR6-BG7J-GfMh', 'e68fd7df-99a6-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'герметик', ''),
('e68fd7df-99a6-11db-937f-000e0c431b59-BpNZ-FPYP-A1rh-Hj4F-BAWX-GiU3', 'e68fd7df-99a6-11db-937f-000e0c431b59', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для паркета', ''),
('e68fd7df-99a6-11db-937f-000e0c431b59-BQsk-FdeV-AIs1-HiZd-BbLc-G8K3', 'e68fd7df-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('e68fd7df-99a6-11db-937f-000e0c431b59-Bw0g-F9Zn-AgFE-H2gu-BXjK-GU36', 'e68fd7df-99a6-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'бук', ''),
('e68fd7e2-99a6-11db-937f-000e0c431b59-B4Rf-F4wc-A7HT-H5ON-B6L5-GK3a', 'e68fd7e2-99a6-11db-937f-000e0c431b59', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.3', 'л'),
('e68fd7e2-99a6-11db-937f-000e0c431b59-B55w-FDEz-AxNu-HyQO-B0Tx-Gqze', 'e68fd7e2-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('e68fd7e2-99a6-11db-937f-000e0c431b59-B7rP-Frgf-A7fy-HuMo-BO81-Gim2', 'e68fd7e2-99a6-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('e68fd7e2-99a6-11db-937f-000e0c431b59-BDjq-FgqE-AWz4-HzB0-Bmoz-GSDz', 'e68fd7e2-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('e68fd7e2-99a6-11db-937f-000e0c431b59-Bn1q-FY0l-A27I-HJDu-BJ5B-GCdK', 'e68fd7e2-99a6-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'дуб', ''),
('e68fd7e2-99a6-11db-937f-000e0c431b59-Bqz7-FejI-AIxG-H9Wt-B1QB-GWKx', 'e68fd7e2-99a6-11db-937f-000e0c431b59', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для паркета', ''),
('e68fd7e2-99a6-11db-937f-000e0c431b59-BvMU-FpBV-Aoo0-He7C-BU28-GH5B', 'e68fd7e2-99a6-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KRASS', ''),
('e68fd7e2-99a6-11db-937f-000e0c431b59-ByH5-FIBI-AW8T-HQIM-BryB-GoSk', 'e68fd7e2-99a6-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'герметик', ''),
('e68fd7e4-99a6-11db-937f-000e0c431b59-BaHB-FJcY-AdHQ-HsE8-BKaq-GhAc', 'e68fd7e4-99a6-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('e68fd7e4-99a6-11db-937f-000e0c431b59-BdH2-FvMU-AUpk-Hxyq-ByOy-G1YQ', 'e68fd7e4-99a6-11db-937f-000e0c431b59', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.3', 'л'),
('e68fd7e4-99a6-11db-937f-000e0c431b59-Bf6R-FyMZ-AB5N-HDjg-BnW9-GCQY', 'e68fd7e4-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('e68fd7e4-99a6-11db-937f-000e0c431b59-BO2Y-Fejc-Acu4-HJS5-BlvB-GdhO', 'e68fd7e4-99a6-11db-937f-000e0c431b59', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для паркета', ''),
('e68fd7e4-99a6-11db-937f-000e0c431b59-BWsW-Fkv6-AGZS-HEci-BdQc-GIFB', 'e68fd7e4-99a6-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KRASS', ''),
('e68fd7e4-99a6-11db-937f-000e0c431b59-Bx35-FYqs-AEe8-H3VV-BJjN-GiEx', 'e68fd7e4-99a6-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'герметик', ''),
('e68fd7e4-99a6-11db-937f-000e0c431b59-Bx4p-FziR-ABAt-HUWT-Bp3P-G7rc', 'e68fd7e4-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('e68fd7e4-99a6-11db-937f-000e0c431b59-BxbY-F4av-AnQB-HomM-BcbT-GWjU', 'e68fd7e4-99a6-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'дуб темный', ''),
('e68fd7e6-99a6-11db-937f-000e0c431b59-BAhh-F5q1-AyRl-H1uJ-BEiB-G07s', 'e68fd7e6-99a6-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'сосна', ''),
('e68fd7e6-99a6-11db-937f-000e0c431b59-Bo29-F2ke-AltZ-HrjV-B01c-GjIw', 'e68fd7e6-99a6-11db-937f-000e0c431b59', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.3', 'л'),
('e68fd7e6-99a6-11db-937f-000e0c431b59-Bqp8-Fy5j-AA6M-Htfu-BI6F-Gz7S', 'e68fd7e6-99a6-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KRASS', ''),
('e68fd7e6-99a6-11db-937f-000e0c431b59-BRHj-FRT1-APOy-HNXd-BHDI-GE2C', 'e68fd7e6-99a6-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('e68fd7e6-99a6-11db-937f-000e0c431b59-BsBN-Fp5i-ABEH-HOmM-BBmt-GjhZ', 'e68fd7e6-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('e68fd7e6-99a6-11db-937f-000e0c431b59-BV6f-FumE-AGm6-HiLD-BVkb-GXyC', 'e68fd7e6-99a6-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'герметик', ''),
('e68fd7e6-99a6-11db-937f-000e0c431b59-BZVq-FBMb-AKRA-HMQ8-B599-GIo4', 'e68fd7e6-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('e68fd7e6-99a6-11db-937f-000e0c431b59-BZXB-FNlY-Arsb-HzxT-B3cL-G2Tw', 'e68fd7e6-99a6-11db-937f-000e0c431b59', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для паркета', ''),
('e68fd7e9-99a6-11db-937f-000e0c431b59-B4FO-F6xT-AQSu-HhS6-BcXM-G9XD', 'e68fd7e9-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('e68fd7e9-99a6-11db-937f-000e0c431b59-BFRg-FA1s-AELT-HfiI-BiUo-GUiA', 'e68fd7e9-99a6-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'бесцветный', ''),
('e68fd7e9-99a6-11db-937f-000e0c431b59-Bi3d-FFGX-AAY0-HX6m-BsQY-Gjt8', 'e68fd7e9-99a6-11db-937f-000e0c431b59', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.3', 'л'),
('e68fd7e9-99a6-11db-937f-000e0c431b59-BrcO-FA9x-AJgI-Hx1q-Bxuw-GBpj', 'e68fd7e9-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('e68fd7e9-99a6-11db-937f-000e0c431b59-BS4U-Fu1t-A2We-H6uU-BcTM-G6YT', 'e68fd7e9-99a6-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'герметик', ''),
('e68fd7e9-99a6-11db-937f-000e0c431b59-BUv2-Fdjs-AKWc-H7YH-BguD-GY1h', 'e68fd7e9-99a6-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('e68fd7e9-99a6-11db-937f-000e0c431b59-BV63-FGdK-AB6h-HO55-BRlW-GgmU', 'e68fd7e9-99a6-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KRASS', ''),
('e68fd7e9-99a6-11db-937f-000e0c431b59-Bvfv-FNVj-AhOB-HsFV-BeaR-GAL5', 'e68fd7e9-99a6-11db-937f-000e0c431b59', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'силиконовая', ''),
('e68fd7ec-99a6-11db-937f-000e0c431b59-B9Dt-Fj4Z-AeC4-H310-BIn5-G70R', 'e68fd7ec-99a6-11db-937f-000e0c431b59', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.3', 'л'),
('e68fd7ec-99a6-11db-937f-000e0c431b59-BE24-F9L8-AmdT-HKGa-BicZ-GSST', 'e68fd7ec-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('e68fd7ec-99a6-11db-937f-000e0c431b59-BqoC-FAzI-AaXl-Hzq5-BIdY-GyFP', 'e68fd7ec-99a6-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KRASS', ''),
('e68fd7ec-99a6-11db-937f-000e0c431b59-BTZs-FTwo-A7e5-HUEo-BSWh-GmGX', 'e68fd7ec-99a6-11db-937f-000e0c431b59', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'силиконовая', ''),
('e68fd7ec-99a6-11db-937f-000e0c431b59-Bu2d-FlFZ-Ae3B-HBso-BYqr-GIQl', 'e68fd7ec-99a6-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'герметик', ''),
('e68fd7ec-99a6-11db-937f-000e0c431b59-Bw6y-FWWx-A2M1-HO63-Bxmh-GzmW', 'e68fd7ec-99a6-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('e68fd7ec-99a6-11db-937f-000e0c431b59-BW9u-F14f-AKWy-HXSN-Brlm-Ga6Y', 'e68fd7ec-99a6-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'черный', ''),
('e68fd7ec-99a6-11db-937f-000e0c431b59-Bxdp-Fm28-Azjj-Hb0f-B1DW-GtBi', 'e68fd7ec-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('e68fd7ee-99a6-11db-937f-000e0c431b59-Bfj8-Fhlq-AL0X-H4Hn-BfpZ-GIHC', 'e68fd7ee-99a6-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('e68fd7ee-99a6-11db-937f-000e0c431b59-Bhvn-Fbne-AbvH-HVsH-Bmd9-GGFE', 'e68fd7ee-99a6-11db-937f-000e0c431b59', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'силиконовая', ''),
('e68fd7ee-99a6-11db-937f-000e0c431b59-BIjo-FMkF-AXnK-HHfA-Bw5t-G9UU', 'e68fd7ee-99a6-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KRASS', ''),
('e68fd7ee-99a6-11db-937f-000e0c431b59-Bj8T-F5Al-ANaB-HGeo-Bknp-Gq8y', 'e68fd7ee-99a6-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'герметик', ''),
('e68fd7ee-99a6-11db-937f-000e0c431b59-BJAG-FTIl-AU6g-HD41-BYrs-GQew', 'e68fd7ee-99a6-11db-937f-000e0c431b59', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.3', 'л'),
('e68fd7ee-99a6-11db-937f-000e0c431b59-Bk4Q-F8wY-AlSE-HAbL-BDEt-G21o', 'e68fd7ee-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('e68fd7ee-99a6-11db-937f-000e0c431b59-Bniy-Fv5h-A3hB-H2nG-B7Jp-G5rR', 'e68fd7ee-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('e68fd7ee-99a6-11db-937f-000e0c431b59-Bx22-FxDT-AdhU-HCRT-BZa4-GDmd', 'e68fd7ee-99a6-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('e68fd7ee-99a6-11db-937f-000e0c431b59-BZtL-Fakz-Agh0-HMbq-BdBj-Gu9W', 'e68fd7ee-99a6-11db-937f-000e0c431b59', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'нейтральный', ''),
('e68fd7f1-99a6-11db-937f-000e0c431b59-B40y-FYEn-AYqB-H3W7-Bank-Ggp8', 'e68fd7f1-99a6-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'герметик', ''),
('e68fd7f1-99a6-11db-937f-000e0c431b59-B9XL-FWiq-Ay4f-HEzA-BlXe-Gp6h', 'e68fd7f1-99a6-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('e68fd7f1-99a6-11db-937f-000e0c431b59-BFqO-FHxs-AvXV-HbES-BQWk-G0K6', 'e68fd7f1-99a6-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'бесцветный', ''),
('e68fd7f1-99a6-11db-937f-000e0c431b59-BidE-FiDk-Asiv-Hss4-B7ix-GgmS', 'e68fd7f1-99a6-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KRASS', ''),
('e68fd7f1-99a6-11db-937f-000e0c431b59-Bnzp-F8Np-AwXO-Hj2r-BX7Y-GmDL', 'e68fd7f1-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('e68fd7f1-99a6-11db-937f-000e0c431b59-BQoF-FBWy-A5SW-Hsz9-BByW-GNL5', 'e68fd7f1-99a6-11db-937f-000e0c431b59', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.3', 'л'),
('e68fd7f1-99a6-11db-937f-000e0c431b59-BSRt-FyVn-AptU-HX0z-BJjw-Gddx', 'e68fd7f1-99a6-11db-937f-000e0c431b59', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'силиконовая', ''),
('e68fd7f1-99a6-11db-937f-000e0c431b59-BUzj-FqQn-A9g0-HjgK-BeKA-GKIN', 'e68fd7f1-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('e68fd7f1-99a6-11db-937f-000e0c431b59-Bz5k-FEeb-Av3Y-HKeb-BVzQ-G6fh', 'e68fd7f1-99a6-11db-937f-000e0c431b59', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'нейтральный', ''),
('e68fd7f3-99a6-11db-937f-000e0c431b59-B6b1-FrOR-A16d-HvDR-BZqN-GtNZ', 'e68fd7f3-99a6-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('e68fd7f3-99a6-11db-937f-000e0c431b59-B8sR-FW9j-AOvk-H42C-Bzxe-Gqes', 'e68fd7f3-99a6-11db-937f-000e0c431b59', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.3', 'л'),
('e68fd7f3-99a6-11db-937f-000e0c431b59-B9Vn-FbGr-AtgX-H7Qk-BWNS-GnkR', 'e68fd7f3-99a6-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'герметик', ''),
('e68fd7f3-99a6-11db-937f-000e0c431b59-Bn7U-FgMN-Af2Z-HPS2-BxAp-GGb6', 'e68fd7f3-99a6-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KRASS', ''),
('e68fd7f3-99a6-11db-937f-000e0c431b59-BsxS-FbQz-AA5v-HwbJ-BqL5-GHxo', 'e68fd7f3-99a6-11db-937f-000e0c431b59', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'санитарный', ''),
('e68fd7f3-99a6-11db-937f-000e0c431b59-BTvu-FPxS-AWut-Hcgi-Bo7w-GgX4', 'e68fd7f3-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('e68fd7f3-99a6-11db-937f-000e0c431b59-BUkQ-FrSG-ApU6-HChH-B8aG-GvzL', 'e68fd7f3-99a6-11db-937f-000e0c431b59', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'силиконовая', ''),
('e68fd7f3-99a6-11db-937f-000e0c431b59-Buvb-Fmtf-AIq4-HP49-BpMu-Gabh', 'e68fd7f3-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('e68fd7f3-99a6-11db-937f-000e0c431b59-BZO2-FaHO-AXh2-H9Dg-B7YG-GMFZ', 'e68fd7f3-99a6-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('e68fd7f5-99a6-11db-937f-000e0c431b59-B3jn-FhB5-ArVT-HBzo-BNvJ-GyTO', 'e68fd7f5-99a6-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'герметик', ''),
('e68fd7f5-99a6-11db-937f-000e0c431b59-B4MW-Fmgl-Azjy-HYPe-BEn3-GQXO', 'e68fd7f5-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('e68fd7f5-99a6-11db-937f-000e0c431b59-B6fl-FhF4-A9lq-HBnv-BHan-GTmL', 'e68fd7f5-99a6-11db-937f-000e0c431b59', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.3', 'л'),
('e68fd7f5-99a6-11db-937f-000e0c431b59-Bdnf-FSCv-AxGY-HpXv-B5Ge-Gze2', 'e68fd7f5-99a6-11db-937f-000e0c431b59', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'санитарный', ''),
('e68fd7f5-99a6-11db-937f-000e0c431b59-BGJK-F73b-AKZm-HjSa-BgwD-GCFF', 'e68fd7f5-99a6-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KRASS', ''),
('e68fd7f5-99a6-11db-937f-000e0c431b59-BNyD-Fxs6-Azis-HTPN-BCNi-Gqpp', 'e68fd7f5-99a6-11db-937f-000e0c431b59', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'силиконовая', ''),
('e68fd7f5-99a6-11db-937f-000e0c431b59-Bss6-FYWR-AoS1-HtRN-BgLZ-G3x7', 'e68fd7f5-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('e68fd7f5-99a6-11db-937f-000e0c431b59-Bx3M-FLhj-A8cp-HcRK-BTYT-GeVL', 'e68fd7f5-99a6-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('e68fd7f5-99a6-11db-937f-000e0c431b59-BXYM-FuVc-AVrp-HoVP-B6jE-G9Wx', 'e68fd7f5-99a6-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'бесцветный', ''),
('e68fd7fa-99a6-11db-937f-000e0c431b59-BCQA-Fyzt-Ad7J-HhsV-BnBq-God2', 'e68fd7fa-99a6-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('e68fd7fa-99a6-11db-937f-000e0c431b59-BDv1-FNTi-Ai7k-HOlE-BG6I-G5xG', 'e68fd7fa-99a6-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'герметик', ''),
('e68fd7fa-99a6-11db-937f-000e0c431b59-Bg1d-Fz2T-AeEE-Ho4X-B4lp-GtA8', 'e68fd7fa-99a6-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('e68fd7fa-99a6-11db-937f-000e0c431b59-BNJX-FI7G-Ap6s-Hvh2-B4Dr-GX4j', 'e68fd7fa-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('e68fd7fa-99a6-11db-937f-000e0c431b59-BRpL-F0bs-A1Vv-Hisp-BHZD-GvLF', 'e68fd7fa-99a6-11db-937f-000e0c431b59', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсальный', ''),
('e68fd7fa-99a6-11db-937f-000e0c431b59-BrYo-FvCh-AJ6I-HzoI-Bx3S-GKAP', 'e68fd7fa-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('e68fd7fa-99a6-11db-937f-000e0c431b59-BsR1-FYSe-AJZ5-Hxsg-B9lG-GlII', 'e68fd7fa-99a6-11db-937f-000e0c431b59', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'силиконовая', ''),
('e68fd7fa-99a6-11db-937f-000e0c431b59-BTVB-FbKp-Ak8h-H4Ii-BJaN-GUZp', 'e68fd7fa-99a6-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KRASS', ''),
('e68fd7fa-99a6-11db-937f-000e0c431b59-BUEy-F388-AaGX-Hoax-BTdE-GUR4', 'e68fd7fa-99a6-11db-937f-000e0c431b59', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.3', 'л'),
('e68fd7fc-99a6-11db-937f-000e0c431b59-B0lB-FJdy-AIyA-HbjN-BVWg-G6FD', 'e68fd7fc-99a6-11db-937f-000e0c431b59', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсальный', ''),
('e68fd7fc-99a6-11db-937f-000e0c431b59-B3ON-FQ3n-ADMH-HHgY-BAkK-G1xd', 'e68fd7fc-99a6-11db-937f-000e0c431b59', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'силиконовая', ''),
('e68fd7fc-99a6-11db-937f-000e0c431b59-Bf7n-FM8Y-A9BP-HTA2-BsUm-Gfjr', 'e68fd7fc-99a6-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'герметик', ''),
('e68fd7fc-99a6-11db-937f-000e0c431b59-BGj5-FuCU-AIX6-HTwz-Bavb-Gb66', 'e68fd7fc-99a6-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KRASS', ''),
('e68fd7fc-99a6-11db-937f-000e0c431b59-BLxD-FS5k-Ar6K-H2w9-BVMT-GvN4', 'e68fd7fc-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('e68fd7fc-99a6-11db-937f-000e0c431b59-BPDu-FQeT-Ae1q-HAvv-BE2V-G0lY', 'e68fd7fc-99a6-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('e68fd7fc-99a6-11db-937f-000e0c431b59-BTuw-FPEi-AEeT-Hg7P-BbLS-GLcw', 'e68fd7fc-99a6-11db-937f-000e0c431b59', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.3', 'л'),
('e68fd7fc-99a6-11db-937f-000e0c431b59-BwSj-FtgK-Ae2o-HdZY-BUlL-GY5G', 'e68fd7fc-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('e68fd7fc-99a6-11db-937f-000e0c431b59-BZVa-FAkB-AFq7-HOlu-BUd9-Ght2', 'e68fd7fc-99a6-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'бесцветный', ''),
('e755f307-f787-11e3-8c8a-005056be1f7b-B5Ct-F7BB-AQSh-HzOx-BKpJ-GBVN', 'e755f307-f787-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('e755f307-f787-11e3-8c8a-005056be1f7b-B9A3-FyXN-ABH2-H35o-Bbzr-GLvt', 'e755f307-f787-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('e755f307-f787-11e3-8c8a-005056be1f7b-BA2v-F2tq-AgLf-HOXR-B9kS-GAUJ', 'e755f307-f787-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('e755f307-f787-11e3-8c8a-005056be1f7b-BbW2-FqD8-Aopz-HWUM-Btn2-Gxxj', 'e755f307-f787-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('e755f307-f787-11e3-8c8a-005056be1f7b-BMBC-Fu1Q-AhB6-HrCR-B6BR-Gxzo', 'e755f307-f787-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('e755f307-f787-11e3-8c8a-005056be1f7b-BQ2K-FMjN-AdeO-HvRE-BZS6-GLKp', 'e755f307-f787-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '800', 'г'),
('e755f307-f787-11e3-8c8a-005056be1f7b-BToD-FJrH-APKB-H9ST-BQfj-G6QU', 'e755f307-f787-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'синий', ''),
('e7f145bb-f78f-11e3-8c8a-005056be1f7b-B4wh-FZqE-AKbP-HEo8-BsMJ-G1sw', 'e7f145bb-f78f-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('e7f145bb-f78f-11e3-8c8a-005056be1f7b-BctT-Fsy8-ApgJ-HzX3-BlqM-GuUU', 'e7f145bb-f78f-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('e7f145bb-f78f-11e3-8c8a-005056be1f7b-BiMI-Fgmc-AlVU-Hyei-Bdzx-Go72', 'e7f145bb-f78f-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('e7f145bb-f78f-11e3-8c8a-005056be1f7b-BknB-FucZ-AnEF-Hzya-BKL8-GHBe', 'e7f145bb-f78f-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '20000', 'г'),
('e7f145bb-f78f-11e3-8c8a-005056be1f7b-BTTI-FnIm-AMlc-HAQZ-B2JL-GYj3', 'e7f145bb-f78f-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('e7f145bb-f78f-11e3-8c8a-005056be1f7b-BVOL-FGDP-Azpg-H4hu-BvL5-GMrn', 'e7f145bb-f78f-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'голубой', ''),
('e7f145bb-f78f-11e3-8c8a-005056be1f7b-BXh7-FzhM-APYW-Hbw7-BTPp-Gm8e', 'e7f145bb-f78f-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('e8976171-93af-11e3-82a4-005056be1f7b-B1vd-FhYi-AY86-H7kc-BPGb-G2M1', 'e8976171-93af-11e3-82a4-005056be1f7b', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для ржавчины', ''),
('e8976171-93af-11e3-82a4-005056be1f7b-B3pp-Fq1K-Akbj-He0U-Bmrt-Gaph', 'e8976171-93af-11e3-82a4-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'желтый', ''),
('e8976171-93af-11e3-82a4-005056be1f7b-BBQd-FJPk-ANmZ-Hhd5-BITp-Gm1E', 'e8976171-93af-11e3-82a4-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'грунт-эмаль', ''),
('e8976171-93af-11e3-82a4-005056be1f7b-Bg0m-FFYK-ADmH-H9GE-BXzT-G2el', 'e8976171-93af-11e3-82a4-005056be1f7b', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '2', 'л'),
('e8976171-93af-11e3-82a4-005056be1f7b-BLvn-FdiF-AgI2-HCyS-Bjr8-GOXy', 'e8976171-93af-11e3-82a4-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('e8976171-93af-11e3-82a4-005056be1f7b-BsPd-FpS0-AQ2q-HnE2-BiXi-GngS', 'e8976171-93af-11e3-82a4-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('e8976171-93af-11e3-82a4-005056be1f7b-BSrE-FJu3-AcTj-HZh8-BO86-Gd7Y', 'e8976171-93af-11e3-82a4-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('e8976171-93af-11e3-82a4-005056be1f7b-BZ9P-F0cP-ATF7-HCfl-BjqW-GNK6', 'e8976171-93af-11e3-82a4-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('e93b4d96-f3cd-11df-ab71-000e0c431b58-BFOw-FH22-A1Hk-HDpQ-BY0B-GYc7', 'e93b4d96-f3cd-11df-ab71-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('e93b4d96-f3cd-11df-ab71-000e0c431b58-BGWY-FqaD-A8zD-H9Og-B6B8-GPVu', 'e93b4d96-f3cd-11df-ab71-000e0c431b58', '0e31c585-9718-11e4-9be0-005056be1f7c', '0.05', 'м'),
('e93b4d96-f3cd-11df-ab71-000e0c431b58-BHhM-Fqut-AwEB-HmEt-BQsN-GiqU', 'e93b4d96-f3cd-11df-ab71-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('e93b4d96-f3cd-11df-ab71-000e0c431b58-BMGr-F7z0-AHSX-Hhh4-ByoQ-GMUr', 'e93b4d96-f3cd-11df-ab71-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'скотч', ''),
('e93b4d96-f3cd-11df-ab71-000e0c431b58-BodS-F8Hv-AEqJ-HLYf-BaIW-GR5y', 'e93b4d96-f3cd-11df-ab71-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('e93b4d96-f3cd-11df-ab71-000e0c431b58-BTuA-Fd6Y-A9Wg-HVoa-BJv9-GWbs', 'e93b4d96-f3cd-11df-ab71-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'малярный', ''),
('e93b4d96-f3cd-11df-ab71-000e0c431b58-BxbT-FUw8-Au7t-HtSL-BcYZ-GPgQ', 'e93b4d96-f3cd-11df-ab71-000e0c431b58', 'c2267174-970e-11e4-9be0-005056be1f7c', '50', 'м'),
('e93b4d9a-f3cd-11df-ab71-000e0c431b58-B3Uh-F0uT-Awcl-Hiho-B0mO-GjLB', 'e93b4d9a-f3cd-11df-ab71-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'прозрачный', ''),
('e93b4d9a-f3cd-11df-ab71-000e0c431b58-BEkk-FiwJ-AHXr-HKuj-BLbK-Gw2U', 'e93b4d9a-f3cd-11df-ab71-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('e93b4d9a-f3cd-11df-ab71-000e0c431b58-BPCL-FX4Y-ArvU-HTBr-BZbF-GJcn', 'e93b4d9a-f3cd-11df-ab71-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для ткани', ''),
('e93b4d9a-f3cd-11df-ab71-000e0c431b58-Bqkk-FaJG-AcNG-Hawx-BrRv-GFCb', 'e93b4d9a-f3cd-11df-ab71-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('e93b4d9a-f3cd-11df-ab71-000e0c431b58-BtSY-FadJ-AApk-HLbb-BfUw-GCTg', 'e93b4d9a-f3cd-11df-ab71-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('e93b4d9a-f3cd-11df-ab71-000e0c431b58-BV5r-F2Ix-Ar4Q-Hmmq-BK2t-GWPm', 'e93b4d9a-f3cd-11df-ab71-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'двухсторонний скотч', ''),
('e93b4d9a-f3cd-11df-ab71-000e0c431b58-BWF9-F8ng-AmnI-H1MT-B26m-GQWF', 'e93b4d9a-f3cd-11df-ab71-000e0c431b58', 'c2267174-970e-11e4-9be0-005056be1f7c', '25', 'м'),
('e93b4d9a-f3cd-11df-ab71-000e0c431b58-BZXu-FAiM-AcDg-HOGz-Buc5-Gtai', 'e93b4d9a-f3cd-11df-ab71-000e0c431b58', '0e31c585-9718-11e4-9be0-005056be1f7c', '0.025', 'м'),
('e93b4d9e-f3cd-11df-ab71-000e0c431b58-Bcvd-F7ha-AnPX-H22r-BIQC-G9by', 'e93b4d9e-f3cd-11df-ab71-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('e93b4d9e-f3cd-11df-ab71-000e0c431b58-BjaS-FLyg-APB7-HsWf-BoFW-G70U', 'e93b4d9e-f3cd-11df-ab71-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'скотч алюминиевый', ''),
('e93b4d9e-f3cd-11df-ab71-000e0c431b58-BLZI-FJdX-AQUK-HHL6-BWoq-G1lO', 'e93b4d9e-f3cd-11df-ab71-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('e93b4d9e-f3cd-11df-ab71-000e0c431b58-BQOd-FoGV-AVPl-HXOD-BMZd-GVj7', 'e93b4d9e-f3cd-11df-ab71-000e0c431b58', 'c2267174-970e-11e4-9be0-005056be1f7c', '50', 'м'),
('e93b4d9e-f3cd-11df-ab71-000e0c431b58-Bs1R-F49c-AzUG-HfLr-Bub7-GOFD', 'e93b4d9e-f3cd-11df-ab71-000e0c431b58', '0e31c585-9718-11e4-9be0-005056be1f7c', '0.05', 'м'),
('e93b4d9e-f3cd-11df-ab71-000e0c431b58-BYV1-FLwM-A8U9-HEOG-B2x1-G1uO', 'e93b4d9e-f3cd-11df-ab71-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('e9f3fc4e-47c0-11dc-8bad-000e0c431b58-B5FD-F68c-AeWV-H8Pa-B4O0-GX2a', 'e9f3fc4e-47c0-11dc-8bad-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'PARADE', ''),
('e9f3fc4e-47c0-11dc-8bad-000e0c431b58-B9je-Fma2-AAvU-HMPf-BZ54-G92A', 'e9f3fc4e-47c0-11dc-8bad-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'фасадная', ''),
('e9f3fc4e-47c0-11dc-8bad-000e0c431b58-Bf4e-FLdF-Aehn-H2XY-BUcL-GeLN', 'e9f3fc4e-47c0-11dc-8bad-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('e9f3fc4e-47c0-11dc-8bad-000e0c431b58-BFxK-FtBJ-ALVT-HuXQ-B6Dn-GUjh', 'e9f3fc4e-47c0-11dc-8bad-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый матовый', ''),
('e9f3fc4e-47c0-11dc-8bad-000e0c431b58-Bfxm-F1u2-AQoG-HQC8-BqRz-G324', 'e9f3fc4e-47c0-11dc-8bad-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '9', 'л'),
('e9f3fc4e-47c0-11dc-8bad-000e0c431b58-BoXj-F8H7-AODA-H2Yj-BZ4c-G4E7', 'e9f3fc4e-47c0-11dc-8bad-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('e9f3fc4e-47c0-11dc-8bad-000e0c431b58-BP2L-FjEb-AFdV-H9cM-B0XS-GDSP', 'e9f3fc4e-47c0-11dc-8bad-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('e9f3fc4e-47c0-11dc-8bad-000e0c431b58-BqWZ-Ff5K-AT7q-HklT-BEiW-Gzud', 'e9f3fc4e-47c0-11dc-8bad-000e0c431b58', 'e765ba72-107d-11e3-8a5d-0050569a1080', 'база А', ''),
('e9f3fc4e-47c0-11dc-8bad-000e0c431b58-BT8X-Fp6z-A36M-HK9f-BaeS-GCUD', 'e9f3fc4e-47c0-11dc-8bad-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('ebcc7a29-f78e-11e3-8c8a-005056be1f7b-BKlO-Frz1-AeGQ-HBbZ-B7zX-G17j', 'ebcc7a29-f78e-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('ebcc7a29-f78e-11e3-8c8a-005056be1f7b-BLcM-FWF2-AMe7-H1vO-Bo61-G4nq', 'ebcc7a29-f78e-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '6000', 'г'),
('ebcc7a29-f78e-11e3-8c8a-005056be1f7b-Boz6-FkGn-AgD6-Hn7D-Bkra-GbpM', 'ebcc7a29-f78e-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'светло-зеленый', ''),
('ebcc7a29-f78e-11e3-8c8a-005056be1f7b-BX85-FHLV-AfmL-Hnpz-BYEo-GRSy', 'ebcc7a29-f78e-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('ebcc7a29-f78e-11e3-8c8a-005056be1f7b-ByuF-FtYC-Ax9t-HOaY-Ba1H-GCov', 'ebcc7a29-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('ebcc7a29-f78e-11e3-8c8a-005056be1f7b-BZsl-FxnX-AKHx-HVAF-BPo6-GLOB', 'ebcc7a29-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('ebcc7a29-f78e-11e3-8c8a-005056be1f7b-BZy3-FNK4-ATah-HOlw-BQZg-GVJ6', 'ebcc7a29-f78e-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('ece048eb-fbaf-11e0-b702-001cc494be80-B4uQ-FTem-AHlR-HBOW-BgaR-GfkJ', 'ece048eb-fbaf-11e0-b702-001cc494be80', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('ece048eb-fbaf-11e0-b702-001cc494be80-B6PP-FMQd-Ajx5-H1Se-BAim-GLcx', 'ece048eb-fbaf-11e0-b702-001cc494be80', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'интерьерная', ''),
('ece048eb-fbaf-11e0-b702-001cc494be80-BcTg-F1fa-APhO-HY1V-BCvk-GR82', 'ece048eb-fbaf-11e0-b702-001cc494be80', 'e8287600-ad96-11e3-b114-005056be1f7c', 'НОВЫЕ ТЕХНОЛОГИИ', ''),
('ece048eb-fbaf-11e0-b702-001cc494be80-BgHV-FvfL-AGh7-Hrz5-Bjla-GNQy', 'ece048eb-fbaf-11e0-b702-001cc494be80', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('ece048eb-fbaf-11e0-b702-001cc494be80-BLaL-FrMu-Apww-H93o-BwZv-GIKR', 'ece048eb-fbaf-11e0-b702-001cc494be80', '1d08380b-ce34-11e4-a80e-005056be1f7a', '6000', 'г'),
('ece048eb-fbaf-11e0-b702-001cc494be80-BM59-FJ2u-AiBn-HCG8-BiGU-GLA1', 'ece048eb-fbaf-11e0-b702-001cc494be80', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'супербелый', ''),
('ece048eb-fbaf-11e0-b702-001cc494be80-BQIK-F4KR-A2sY-HL5Y-BCxJ-GSHn', 'ece048eb-fbaf-11e0-b702-001cc494be80', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('ece048eb-fbaf-11e0-b702-001cc494be80-Bvgo-FpX8-AJXg-Hwi9-BjBS-GG3y', 'ece048eb-fbaf-11e0-b702-001cc494be80', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('ece048ee-fbaf-11e0-b702-001cc494be80-B0Xn-F4fr-AuZa-HtWy-BGo4-GmFf', 'ece048ee-fbaf-11e0-b702-001cc494be80', '1d08380b-ce34-11e4-a80e-005056be1f7a', '13000', 'г'),
('ece048ee-fbaf-11e0-b702-001cc494be80-BAc2-F7qr-ANRA-HNRC-Bvyz-G6OU', 'ece048ee-fbaf-11e0-b702-001cc494be80', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('ece048ee-fbaf-11e0-b702-001cc494be80-BGE6-FbC5-ADH5-HIE1-B4s0-G7XX', 'ece048ee-fbaf-11e0-b702-001cc494be80', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('ece048ee-fbaf-11e0-b702-001cc494be80-BgxK-FaeZ-AeHs-HVWk-BofV-GPSG', 'ece048ee-fbaf-11e0-b702-001cc494be80', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('ece048ee-fbaf-11e0-b702-001cc494be80-BIvl-Fwvv-AKv7-HN1Q-BlTA-GABh', 'ece048ee-fbaf-11e0-b702-001cc494be80', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'супербелый', ''),
('ece048ee-fbaf-11e0-b702-001cc494be80-BoJD-FpXU-ArIJ-HgDY-B2YH-GSbM', 'ece048ee-fbaf-11e0-b702-001cc494be80', 'e8287600-ad96-11e3-b114-005056be1f7c', 'НОВЫЕ ТЕХНОЛОГИИ', ''),
('ece048ee-fbaf-11e0-b702-001cc494be80-BRFf-Fbmj-Azd8-H7vY-BJ3d-GFTf', 'ece048ee-fbaf-11e0-b702-001cc494be80', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('ece048ee-fbaf-11e0-b702-001cc494be80-BUtb-FDFy-AntU-H99m-BE0E-G77v', 'ece048ee-fbaf-11e0-b702-001cc494be80', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'интерьерная', ''),
('ece048f0-fbaf-11e0-b702-001cc494be80-B2Sc-Fyzj-AjMS-HTNC-BdPk-Gl1q', 'ece048f0-fbaf-11e0-b702-001cc494be80', '1d08380b-ce34-11e4-a80e-005056be1f7a', '6000', 'г'),
('ece048f0-fbaf-11e0-b702-001cc494be80-B7NV-F5LQ-AKxW-HbYx-Bihu-G0Fc', 'ece048f0-fbaf-11e0-b702-001cc494be80', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('ece048f0-fbaf-11e0-b702-001cc494be80-BChI-FlGG-APHG-HDed-Bv9A-Gzas', 'ece048f0-fbaf-11e0-b702-001cc494be80', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('ece048f0-fbaf-11e0-b702-001cc494be80-BCKV-FW4H-AJV8-HM8a-BB5o-GWy1', 'ece048f0-fbaf-11e0-b702-001cc494be80', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'фасадная', ''),
('ece048f0-fbaf-11e0-b702-001cc494be80-BegE-FbsB-A3t7-HgGv-BWtu-GAtK', 'ece048f0-fbaf-11e0-b702-001cc494be80', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('ece048f0-fbaf-11e0-b702-001cc494be80-BEQJ-FmvU-Atg8-H96P-BlFR-GkbG', 'ece048f0-fbaf-11e0-b702-001cc494be80', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'супербелый', ''),
('ece048f0-fbaf-11e0-b702-001cc494be80-BJ7b-FisC-AF3U-Hsww-Bc1D-Gldz', 'ece048f0-fbaf-11e0-b702-001cc494be80', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('ece048f0-fbaf-11e0-b702-001cc494be80-Bn9n-FAaB-Ax9i-Hi8o-BBAy-GWXs', 'ece048f0-fbaf-11e0-b702-001cc494be80', 'e8287600-ad96-11e3-b114-005056be1f7c', 'НОВЫЕ ТЕХНОЛОГИИ', ''),
('ece048f2-fbaf-11e0-b702-001cc494be80-B7Ab-FKjp-AjaO-HQFD-B8ZE-GN0r', 'ece048f2-fbaf-11e0-b702-001cc494be80', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'фасадная', ''),
('ece048f2-fbaf-11e0-b702-001cc494be80-BbHp-FpYu-AtVK-HxjK-Bf1Q-GQIY', 'ece048f2-fbaf-11e0-b702-001cc494be80', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('ece048f2-fbaf-11e0-b702-001cc494be80-BKB9-FVzi-AfUY-Hvlh-BKRn-G4bt', 'ece048f2-fbaf-11e0-b702-001cc494be80', '1d08380b-ce34-11e4-a80e-005056be1f7a', '13000', 'г'),
('ece048f2-fbaf-11e0-b702-001cc494be80-BQFu-FRIa-A9Ud-H0bp-BUXp-GviP', 'ece048f2-fbaf-11e0-b702-001cc494be80', 'e8287600-ad96-11e3-b114-005056be1f7c', 'НОВЫЕ ТЕХНОЛОГИИ', ''),
('ece048f2-fbaf-11e0-b702-001cc494be80-BqGs-FJFK-Azai-HfLG-BumO-GZSm', 'ece048f2-fbaf-11e0-b702-001cc494be80', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('ece048f2-fbaf-11e0-b702-001cc494be80-BUAQ-FjmD-AGDB-HCpq-BLCB-GHMU', 'ece048f2-fbaf-11e0-b702-001cc494be80', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('ece048f2-fbaf-11e0-b702-001cc494be80-BURy-FQ0o-ALjP-Hmwg-Ba87-GmpJ', 'ece048f2-fbaf-11e0-b702-001cc494be80', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'супербелый', ''),
('ece048f2-fbaf-11e0-b702-001cc494be80-BXV6-FJTy-AxGO-HjOZ-B1ir-Gpzq', 'ece048f2-fbaf-11e0-b702-001cc494be80', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('eda7fcbe-8407-11e3-8c2b-005056be1f7b-Bbqe-FSwz-AazV-HK6Q-BucB-GTbZ', 'eda7fcbe-8407-11e3-8c2b-005056be1f7b', '0e31c585-9718-11e4-9be0-005056be1f7c', '1', 'м'),
('eda7fcbe-8407-11e3-8c2b-005056be1f7b-Bd88-FzH4-AF2V-HGLx-Bgvs-GHhi', 'eda7fcbe-8407-11e3-8c2b-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'сетка', ''),
('eda7fcbe-8407-11e3-8c2b-005056be1f7b-Bguj-F0YQ-AeLL-H5vg-BXgR-Gjwk', 'eda7fcbe-8407-11e3-8c2b-005056be1f7b', 'c2267174-970e-11e4-9be0-005056be1f7c', '20', 'м'),
('eda7fcbe-8407-11e3-8c2b-005056be1f7b-Bk6l-FvzW-ASN4-Hkwp-BKOW-GogI', 'eda7fcbe-8407-11e3-8c2b-005056be1f7b', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для штукатурки', ''),
('eda7fcbe-8407-11e3-8c2b-005056be1f7b-BKlD-FY1a-A10c-Hnqe-Bx5a-GjVd', 'eda7fcbe-8407-11e3-8c2b-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('eda7fcbe-8407-11e3-8c2b-005056be1f7b-BO6w-FaDL-AZse-Hhqo-Bl9L-GbR8', 'eda7fcbe-8407-11e3-8c2b-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('eda7fcbe-8407-11e3-8c2b-005056be1f7b-BRhz-FTvt-AUFN-HOXb-BJCx-GqCJ', 'eda7fcbe-8407-11e3-8c2b-005056be1f7b', '0569475c-1474-11e3-82b9-0050569a1080', '5x5', ''),
('eda7fcbe-8407-11e3-8c2b-005056be1f7b-BvuM-FPS3-A451-HFVH-BDgt-GG5k', 'eda7fcbe-8407-11e3-8c2b-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('efa9ef8e-f78d-11e3-8c8a-005056be1f7b-B0pq-FnU2-Abpx-HJlV-BW0s-G7SJ', 'efa9ef8e-f78d-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1900', 'г'),
('efa9ef8e-f78d-11e3-8c8a-005056be1f7b-BbjY-FFnP-Ambn-HpKx-BU7s-G6iM', 'efa9ef8e-f78d-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('efa9ef8e-f78d-11e3-8c8a-005056be1f7b-BFOM-FJrT-ARen-HD2g-ByXD-GtKo', 'efa9ef8e-f78d-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('efa9ef8e-f78d-11e3-8c8a-005056be1f7b-Bgg6-FwkC-Au81-Hj1N-B4bO-GoD3', 'efa9ef8e-f78d-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('efa9ef8e-f78d-11e3-8c8a-005056be1f7b-BkBv-Flna-ALTE-HdHH-BwUw-GX4u', 'efa9ef8e-f78d-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'вишневый', ''),
('efa9ef8e-f78d-11e3-8c8a-005056be1f7b-Bv5l-Flec-AzX5-HDC8-B7HM-GIR4', 'efa9ef8e-f78d-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('efa9ef8e-f78d-11e3-8c8a-005056be1f7b-BYXk-FSbm-APXu-HcgC-BV8m-GuDP', 'efa9ef8e-f78d-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('f0ad1dd1-1f91-11e4-9591-005056be1f7b-B408-FVOJ-AopQ-HZ8H-BShr-GUuw', 'f0ad1dd1-1f91-11e4-9591-005056be1f7b', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '10', 'л'),
('f0ad1dd1-1f91-11e4-9591-005056be1f7b-B6a1-FuIS-AsJm-Hf8g-BNVw-GyNm', 'f0ad1dd1-1f91-11e4-9591-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('f0ad1dd1-1f91-11e4-9591-005056be1f7b-BeaN-Ffag-A3ic-HPLT-BbHu-GR24', 'f0ad1dd1-1f91-11e4-9591-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('f0ad1dd1-1f91-11e4-9591-005056be1f7b-BkjC-FMF0-AtSU-HgHi-BJl9-GWGY', 'f0ad1dd1-1f91-11e4-9591-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('f0ad1dd1-1f91-11e4-9591-005056be1f7b-BnAf-F6yS-Ajpy-Hrb9-BAUx-Gx4s', 'f0ad1dd1-1f91-11e4-9591-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'желтый', ''),
('f0ad1dd1-1f91-11e4-9591-005056be1f7b-BrZx-F9yu-AFGS-HxbC-Bkwg-Gpbg', 'f0ad1dd1-1f91-11e4-9591-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'грунт-эмаль', ''),
('f0ad1dd1-1f91-11e4-9591-005056be1f7b-BUdF-Fp0M-ANIx-HLf5-BkY4-GiuI', 'f0ad1dd1-1f91-11e4-9591-005056be1f7b', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для ржавчины', ''),
('f0ad1dd1-1f91-11e4-9591-005056be1f7b-BXQk-F3zp-ANlB-HASW-BH6X-Gn2L', 'f0ad1dd1-1f91-11e4-9591-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('f1be6b3a-f081-11df-a0c5-000e0c431b58-B3qH-FOUL-AYXn-Hg8f-B6xf-GN3I', 'f1be6b3a-f081-11df-a0c5-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('f1be6b3a-f081-11df-a0c5-000e0c431b58-B8Yl-FFaq-AMcm-Hevc-B2nJ-G92e', 'f1be6b3a-f081-11df-a0c5-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('f1be6b3a-f081-11df-a0c5-000e0c431b58-BKP3-Fxw1-ATsn-Hz6f-B944-Gj9T', 'f1be6b3a-f081-11df-a0c5-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('f1be6b3a-f081-11df-a0c5-000e0c431b58-BQLw-F3qh-AViK-HehC-B9sS-G2fE', 'f1be6b3a-f081-11df-a0c5-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('f1be6b3a-f081-11df-a0c5-000e0c431b58-Brzx-FUps-A1nl-HuMk-BDdw-G1Vd', 'f1be6b3a-f081-11df-a0c5-000e0c431b58', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1000', 'г'),
('f1be6b3a-f081-11df-a0c5-000e0c431b58-Bz0R-FEmu-AfcI-HCFH-BC6R-GS1W', 'f1be6b3a-f081-11df-a0c5-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('f1be6b3a-f081-11df-a0c5-000e0c431b58-BzKQ-F6Ej-A1uV-HoEK-BDbI-Gj3Y', 'f1be6b3a-f081-11df-a0c5-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'сиреневый', ''),
('f1be6b3c-f081-11df-a0c5-000e0c431b58-Bd46-FFnH-Aprk-Hci7-B66n-G7ey', 'f1be6b3c-f081-11df-a0c5-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('f1be6b3c-f081-11df-a0c5-000e0c431b58-BeH8-FMUn-A9yx-HnOB-B8v7-G94T', 'f1be6b3c-f081-11df-a0c5-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('f1be6b3c-f081-11df-a0c5-000e0c431b58-BfE9-Fw80-Ak6s-HMqv-BeJp-GZOT', 'f1be6b3c-f081-11df-a0c5-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('f1be6b3c-f081-11df-a0c5-000e0c431b58-Bh5B-FIWj-AERe-HrO0-BguE-GehB', 'f1be6b3c-f081-11df-a0c5-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('f1be6b3c-f081-11df-a0c5-000e0c431b58-Bh8l-FCp1-ABLk-HFqI-BHKP-GEXk', 'f1be6b3c-f081-11df-a0c5-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('f1be6b3c-f081-11df-a0c5-000e0c431b58-BsVY-Ff0n-Ah8Y-Hd6R-BxcP-GYe5', 'f1be6b3c-f081-11df-a0c5-000e0c431b58', '1d08380b-ce34-11e4-a80e-005056be1f7a', '2000', 'г'),
('f1be6b3c-f081-11df-a0c5-000e0c431b58-BXqB-FiLj-AkKR-H3Bx-B8sm-GuDR', 'f1be6b3c-f081-11df-a0c5-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'сиреневый', ''),
('f31a0079-f78e-11e3-8c8a-005056be1f7b-B75W-FnV8-ALNO-HWQ0-BlUL-GYun', 'f31a0079-f78e-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('f31a0079-f78e-11e3-8c8a-005056be1f7b-BELw-Facs-Acn7-HcFF-BpdI-GpkO', 'f31a0079-f78e-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('f31a0079-f78e-11e3-8c8a-005056be1f7b-BHNR-FDpW-AJU1-HR0b-Bf7V-G2jr', 'f31a0079-f78e-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('f31a0079-f78e-11e3-8c8a-005056be1f7b-BqmK-FcDC-AbhV-HQ6C-BLNA-GbJN', 'f31a0079-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('f31a0079-f78e-11e3-8c8a-005056be1f7b-BS9Q-F7N7-A3ws-HERM-BBZH-Gd2a', 'f31a0079-f78e-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'синий', ''),
('f31a0079-f78e-11e3-8c8a-005056be1f7b-BYC0-FGGR-ATHq-Hbki-B3RL-GCuP', 'f31a0079-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('f31a0079-f78e-11e3-8c8a-005056be1f7b-Byu6-FDHL-ACtg-HNIR-B2Pe-GISJ', 'f31a0079-f78e-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '6000', 'г'),
('f33aec8f-f78f-11e3-8c8a-005056be1f7b-BGQZ-FjD3-AxTo-HGm6-BRzr-GPlc', 'f33aec8f-f78f-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('f33aec8f-f78f-11e3-8c8a-005056be1f7b-Bj7z-FWBF-AhOE-HmKY-BY66-G0ub', 'f33aec8f-f78f-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'шоколадный', ''),
('f33aec8f-f78f-11e3-8c8a-005056be1f7b-BMir-FrmP-AHyL-H0Yk-B7f2-GWE6', 'f33aec8f-f78f-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('f33aec8f-f78f-11e3-8c8a-005056be1f7b-BNv9-Fwv7-A7Of-HEha-BM73-GjZ7', 'f33aec8f-f78f-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('f33aec8f-f78f-11e3-8c8a-005056be1f7b-BO3O-F491-AyPp-HgfR-B9sz-GqZb', 'f33aec8f-f78f-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '20000', 'г'),
('f33aec8f-f78f-11e3-8c8a-005056be1f7b-BTFD-Fe35-Aexi-HA9K-BdiH-GS6I', 'f33aec8f-f78f-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('f33aec8f-f78f-11e3-8c8a-005056be1f7b-BYcX-FcEh-A2dd-HxcN-BPwS-GSQL', 'f33aec8f-f78f-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('f5ec168e-f78d-11e3-8c8a-005056be1f7b-B0CM-F7Bk-ALG8-HTFs-BVsB-GgIl', 'f5ec168e-f78d-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('f5ec168e-f78d-11e3-8c8a-005056be1f7b-B935-FX5o-AhIv-HRSa-B6cn-G5AB', 'f5ec168e-f78d-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('f5ec168e-f78d-11e3-8c8a-005056be1f7b-BA8I-F8bj-A56a-HeNg-BPMi-GcIk', 'f5ec168e-f78d-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1900', 'г'),
('f5ec168e-f78d-11e3-8c8a-005056be1f7b-Bamw-FNLr-A8b7-H9YP-BEWH-G0uC', 'f5ec168e-f78d-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('f5ec168e-f78d-11e3-8c8a-005056be1f7b-BKM9-FhYf-Alvx-Hj5t-BPPB-G7SF', 'f5ec168e-f78d-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('f5ec168e-f78d-11e3-8c8a-005056be1f7b-BnSK-FZkd-Azg7-Hda8-Be2j-GRFv', 'f5ec168e-f78d-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('f5ec168e-f78d-11e3-8c8a-005056be1f7b-BUSr-FDDC-AjzY-HCtK-BNHt-GKpo', 'f5ec168e-f78d-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'красный', ''),
('f5f1fcd6-d1c2-11e3-8b7a-005056be1f7b-B8fb-FZ6r-A4rd-HE6k-B0G5-GY7f', 'f5f1fcd6-d1c2-11e3-8b7a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '15000', 'г'),
('f5f1fcd6-d1c2-11e3-8b7a-005056be1f7b-Bfqb-FUu7-ANep-HQ9m-B5w1-GkaQ', 'f5f1fcd6-d1c2-11e3-8b7a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('f5f1fcd6-d1c2-11e3-8b7a-005056be1f7b-BKUZ-F1kY-AdfL-HTFm-Bjxh-GayL', 'f5f1fcd6-d1c2-11e3-8b7a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'штукатурка структурная', ''),
('f5f1fcd6-d1c2-11e3-8b7a-005056be1f7b-BNJs-FOkU-APCz-HMc1-BKKO-GEW4', 'f5f1fcd6-d1c2-11e3-8b7a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('f5f1fcd6-d1c2-11e3-8b7a-005056be1f7b-BOEX-FImf-AnEz-HDf3-BusC-Gd8n', 'f5f1fcd6-d1c2-11e3-8b7a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('f5f1fcd6-d1c2-11e3-8b7a-005056be1f7b-Bs62-FAog-AqQb-HaQe-BwvK-GOG5', 'f5f1fcd6-d1c2-11e3-8b7a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('f5f1fcd6-d1c2-11e3-8b7a-005056be1f7b-BxZA-F9sG-AkS4-HIts-BTrN-GuGJ', 'f5f1fcd6-d1c2-11e3-8b7a-005056be1f7b', '1ea6fcc4-d206-11e4-9be0-005056be1f7c', '0,0015', 'мм'),
('f5f1fcd6-d1c2-11e3-8b7a-005056be1f7b-ByNq-FnaI-AelS-Hspp-Bm5t-GADW', 'f5f1fcd6-d1c2-11e3-8b7a-005056be1f7b', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'декоративная с эффектом "зернистости"', ''),
('f63c664a-52ee-11dd-a89a-000e0c431b58-B6lO-FzQ5-AuTV-Hvys-Bjio-G4jg', 'f63c664a-52ee-11dd-a89a-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '9', 'л'),
('f63c664a-52ee-11dd-a89a-000e0c431b58-B9oK-FoTd-A4a4-Hpq6-BCaA-GeWx', 'f63c664a-52ee-11dd-a89a-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'PARADE', ''),
('f63c664a-52ee-11dd-a89a-000e0c431b58-BEUy-FCCc-Ablq-HoSO-BHaw-GQBX', 'f63c664a-52ee-11dd-a89a-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('f63c664a-52ee-11dd-a89a-000e0c431b58-BHhJ-Flle-ADEL-Hrxm-BtAX-Gk6u', 'f63c664a-52ee-11dd-a89a-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'бесцветный', ''),
('f63c664a-52ee-11dd-a89a-000e0c431b58-BlyH-FTPa-A0qe-HDVb-Bdqo-GsbB', 'f63c664a-52ee-11dd-a89a-000e0c431b58', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('f63c664a-52ee-11dd-a89a-000e0c431b58-BNu2-F5Wd-AYE8-HsnY-BjON-Gric', 'f63c664a-52ee-11dd-a89a-000e0c431b58', 'e765ba72-107d-11e3-8a5d-0050569a1080', 'база С', ''),
('f63c664a-52ee-11dd-a89a-000e0c431b58-Bu6T-FA3a-AMjm-HsF1-BRDf-Gcry', 'f63c664a-52ee-11dd-a89a-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('f63c664a-52ee-11dd-a89a-000e0c431b58-BuFc-F6wP-AifQ-H7GL-BrLg-GfNi', 'f63c664a-52ee-11dd-a89a-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('f63c664a-52ee-11dd-a89a-000e0c431b58-BUvF-F7eK-AwvN-HSN6-BGJg-GU9x', 'f63c664a-52ee-11dd-a89a-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('fa74499c-7f46-11e3-af7c-005056be1f7b-B07Z-FfTK-Aga2-HxDd-BcGg-G89u', 'fa74499c-7f46-11e3-af7c-005056be1f7b', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '2.5', 'л'),
('fa74499c-7f46-11e3-af7c-005056be1f7b-B38Q-FTHe-AuxA-HI2f-Bbbs-Gby5', 'fa74499c-7f46-11e3-af7c-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'шелковый матовый', ''),
('fa74499c-7f46-11e3-af7c-005056be1f7b-B5Pg-F6XY-Abz1-HJRo-BEbv-GJSS', 'fa74499c-7f46-11e3-af7c-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fa74499c-7f46-11e3-af7c-005056be1f7b-BCDe-F3Nv-AhRN-HSaf-BlE3-GoLD', 'fa74499c-7f46-11e3-af7c-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fa74499c-7f46-11e3-af7c-005056be1f7b-BikU-FOiV-Av6b-HJOa-BqgX-GEfT', 'fa74499c-7f46-11e3-af7c-005056be1f7b', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'латексная', ''),
('fa74499c-7f46-11e3-af7c-005056be1f7b-BJGE-F2he-ADuc-HzSo-BJKm-Gaet', 'fa74499c-7f46-11e3-af7c-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fa74499c-7f46-11e3-af7c-005056be1f7b-BjM0-FXMs-ASKs-HaZL-BN8v-GhLU', 'fa74499c-7f46-11e3-af7c-005056be1f7b', 'e765ba72-107d-11e3-8a5d-0050569a1080', 'база А', ''),
('fa74499c-7f46-11e3-af7c-005056be1f7b-BnWD-FGLV-AvVg-HXvB-BGqQ-Gnmo', 'fa74499c-7f46-11e3-af7c-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'PARADE', ''),
('fa74499c-7f46-11e3-af7c-005056be1f7b-BtgB-F7yc-Acah-HUEs-BXEo-Gwk9', 'fa74499c-7f46-11e3-af7c-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('fbb89466-93af-11e3-82a4-005056be1f7b-B0H1-Fjk0-AsAN-HT60-BN3n-G88H', 'fbb89466-93af-11e3-82a4-005056be1f7b', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.75', 'л'),
('fbb89466-93af-11e3-82a4-005056be1f7b-B68D-Fr95-AC0k-HcJI-BaNl-G6v5', 'fbb89466-93af-11e3-82a4-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('fbb89466-93af-11e3-82a4-005056be1f7b-B7ot-FEdR-AW9X-Hqc6-BBY4-GEF2', 'fbb89466-93af-11e3-82a4-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fbb89466-93af-11e3-82a4-005056be1f7b-BEcf-FiSB-A3zH-HyhR-BfGU-GehU', 'fbb89466-93af-11e3-82a4-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fbb89466-93af-11e3-82a4-005056be1f7b-BHWv-FVqr-AU4j-H81g-BEF1-GKq1', 'fbb89466-93af-11e3-82a4-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'грунт-эмаль', ''),
('fbb89466-93af-11e3-82a4-005056be1f7b-BiC0-Fb0b-AZtv-HA1U-BAqa-GJi8', 'fbb89466-93af-11e3-82a4-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fbb89466-93af-11e3-82a4-005056be1f7b-BOTF-FlAi-AgB8-HZGD-BRFL-GIov', 'fbb89466-93af-11e3-82a4-005056be1f7b', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для ржавчины', ''),
('fbb89466-93af-11e3-82a4-005056be1f7b-BzFJ-F3h5-A4hd-H1gU-BgF7-GsKq', 'fbb89466-93af-11e3-82a4-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'красный', ''),
('fc75df8c-f786-11e3-8c8a-005056be1f7b-B1CF-Fsqj-AikU-Hj5q-BtYT-GA2G', 'fc75df8c-f786-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('fc75df8c-f786-11e3-8c8a-005056be1f7b-BenR-FdwM-ANfO-HzI7-BYyZ-GlNH', 'fc75df8c-f786-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fc75df8c-f786-11e3-8c8a-005056be1f7b-BG26-Fp7C-Avos-HPBa-BPny-Gf7Q', 'fc75df8c-f786-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fc75df8c-f786-11e3-8c8a-005056be1f7b-BNFl-Fc5u-AZSj-Hy5w-B7uy-GBde', 'fc75df8c-f786-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '800', 'г'),
('fc75df8c-f786-11e3-8c8a-005056be1f7b-BpcN-FYsO-Az83-Hndz-B5vB-GTVK', 'fc75df8c-f786-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('fc75df8c-f786-11e3-8c8a-005056be1f7b-BRMY-FkIK-ARH9-HJ6u-BsCl-Gnri', 'fc75df8c-f786-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fd393098-f78f-11e3-8c8a-005056be1f7b-B8d7-FO09-ArTb-HnzZ-Bxox-Gfky', 'fd393098-f78f-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('fd393098-f78f-11e3-8c8a-005056be1f7b-Bb8H-F4k7-ASYl-HG5L-B6tM-Gtep', 'fd393098-f78f-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('fd393098-f78f-11e3-8c8a-005056be1f7b-BbdK-FeNU-AaiG-Hnld-B8lC-G8fO', 'fd393098-f78f-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'розово-бежевый', ''),
('fd393098-f78f-11e3-8c8a-005056be1f7b-Bdpz-F6I4-AQp5-HEIK-B3jI-G0ct', 'fd393098-f78f-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '20000', 'г'),
('fd393098-f78f-11e3-8c8a-005056be1f7b-Bw2N-FJuD-Al4Q-HfBc-BUd7-Gf8J', 'fd393098-f78f-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fd393098-f78f-11e3-8c8a-005056be1f7b-BzAx-Fuct-ALJc-HdDU-BgBy-GcQx', 'fd393098-f78f-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fd393098-f78f-11e3-8c8a-005056be1f7b-BzXs-F6BT-AZ96-Hc7a-BqsS-G53C', 'fd393098-f78f-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fded4984-d1c2-11e3-8b7a-005056be1f7b-B1Su-FPvX-ADak-HwK1-BtvG-GHsO', 'fded4984-d1c2-11e3-8b7a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('fded4984-d1c2-11e3-8b7a-005056be1f7b-B83k-Fhpu-AYZg-HehO-BtpS-GN9k', 'fded4984-d1c2-11e3-8b7a-005056be1f7b', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'декоративная с эффектом "зернистости"', ''),
('fded4984-d1c2-11e3-8b7a-005056be1f7b-BCqf-FfTP-A7gm-HR4i-BoIK-G2z1', 'fded4984-d1c2-11e3-8b7a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '15000', 'г'),
('fded4984-d1c2-11e3-8b7a-005056be1f7b-Beyt-Fe8b-AY8r-HlME-BkPu-GGuE', 'fded4984-d1c2-11e3-8b7a-005056be1f7b', '1ea6fcc4-d206-11e4-9be0-005056be1f7c', '0,003', 'мм'),
('fded4984-d1c2-11e3-8b7a-005056be1f7b-BHDd-FTRa-A6j6-HItG-ByjY-GjyJ', 'fded4984-d1c2-11e3-8b7a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fded4984-d1c2-11e3-8b7a-005056be1f7b-BiSP-FFxx-AUgc-Hntb-BNXV-GW7W', 'fded4984-d1c2-11e3-8b7a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fded4984-d1c2-11e3-8b7a-005056be1f7b-Bn4J-FjB3-Ap1c-HDZR-BNWK-Gy51', 'fded4984-d1c2-11e3-8b7a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('fded4984-d1c2-11e3-8b7a-005056be1f7b-BOlN-Frpm-A940-HJr5-B0QM-GPW0', 'fded4984-d1c2-11e3-8b7a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'штукатурка структурная', ''),
('fdf8cbf6-f78e-11e3-8c8a-005056be1f7b-B4ix-FM0t-AvBL-HN7Y-BdvZ-GJEx', 'fdf8cbf6-f78e-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('fdf8cbf6-f78e-11e3-8c8a-005056be1f7b-BB0E-F9yH-ANeF-HB9P-BzLL-GpjT', 'fdf8cbf6-f78e-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '6000', 'г'),
('fdf8cbf6-f78e-11e3-8c8a-005056be1f7b-BcWk-Fg2K-AQ6S-Hb7j-BBbb-G6NQ', 'fdf8cbf6-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fdf8cbf6-f78e-11e3-8c8a-005056be1f7b-Bf34-Fvz4-AyYe-HWai-BpyX-GPt4', 'fdf8cbf6-f78e-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'голубой', ''),
('fdf8cbf6-f78e-11e3-8c8a-005056be1f7b-BM6z-FYIv-Awmh-HMvm-BAAi-G2Lu', 'fdf8cbf6-f78e-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('fdf8cbf6-f78e-11e3-8c8a-005056be1f7b-BP72-FKLK-AyU7-HyDP-Bq8y-GdJx', 'fdf8cbf6-f78e-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fdf8cbf6-f78e-11e3-8c8a-005056be1f7b-ByBp-FTXG-A2D5-HPTo-BIwA-GtS2', 'fdf8cbf6-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fe1a18f9-c501-11e1-abc0-005056be3bd8-BakF-F8XN-Ay3x-HABJ-BVG6-GuHG', 'fe1a18f9-c501-11e1-abc0-005056be3bd8', 'e8287600-ad96-11e3-b114-005056be1f7c', 'РОГНЕДА', ''),
('fe1a18f9-c501-11e1-abc0-005056be3bd8-BBep-FnAx-Ao5V-HQ41-BPFK-GHFd', 'fe1a18f9-c501-11e1-abc0-005056be3bd8', '1d08380b-ce34-11e4-a80e-005056be1f7a', '12000', 'г'),
('fe1a18f9-c501-11e1-abc0-005056be3bd8-BEwY-FBKW-A6JY-H4T6-BmCE-GiZX', 'fe1a18f9-c501-11e1-abc0-005056be3bd8', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fe1a18f9-c501-11e1-abc0-005056be3bd8-BHCP-Fg7j-Abjm-HgHB-B4il-G9f0', 'fe1a18f9-c501-11e1-abc0-005056be3bd8', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fe1a18f9-c501-11e1-abc0-005056be3bd8-BMT2-F0T4-AJp0-HFZH-BMgK-GbCG', 'fe1a18f9-c501-11e1-abc0-005056be3bd8', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'огнебиозащитный состав', ''),
('fe1a18f9-c501-11e1-abc0-005056be3bd8-BsI7-FWT3-ALrg-HxH2-BekL-GIWV', 'fe1a18f9-c501-11e1-abc0-005056be3bd8', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fea6c165-5ab6-11dc-be42-000e0c431b58-B7t1-FhDj-AmWF-HGEK-BFOS-GopJ', 'fea6c165-5ab6-11dc-be42-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.52', 'л'),
('fea6c165-5ab6-11dc-be42-000e0c431b58-BIMg-Fvny-ArHU-HqOy-BwLi-Gnsl', 'fea6c165-5ab6-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('fea6c165-5ab6-11dc-be42-000e0c431b58-BjvV-Fu7y-A3Yw-HGEd-BGxr-GSzv', 'fea6c165-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fea6c165-5ab6-11dc-be42-000e0c431b58-BKHj-Fa2d-AgWn-HaS6-Bdf9-GHdF', 'fea6c165-5ab6-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fea6c165-5ab6-11dc-be42-000e0c431b58-BNDn-F9Hz-APuk-HTsF-BTgd-GrF9', 'fea6c165-5ab6-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('fea6c165-5ab6-11dc-be42-000e0c431b58-BQxa-FIJR-Auku-HDLR-BnvD-G9fA', 'fea6c165-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fea6c165-5ab6-11dc-be42-000e0c431b58-BsOM-FCE8-A8p3-HV1m-BbdT-Gkhj', 'fea6c165-5ab6-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'хаки', ''),
('fea6c165-5ab6-11dc-be42-000e0c431b58-BxYY-Fjed-AClQ-Ht4G-BfK4-G7SD', 'fea6c165-5ab6-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсальное', ''),
('fea6c167-5ab6-11dc-be42-000e0c431b58-B804-FULq-AUkQ-HKA5-BCi9-GJRb', 'fea6c167-5ab6-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('fea6c167-5ab6-11dc-be42-000e0c431b58-BF4a-FyHH-A98Z-HJu1-Bnsa-GumM', 'fea6c167-5ab6-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'светло-зеленый', ''),
('fea6c167-5ab6-11dc-be42-000e0c431b58-BfP4-F5Yo-AvCX-HMx0-BYjz-GZn3', 'fea6c167-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fea6c167-5ab6-11dc-be42-000e0c431b58-BhEH-Ftdd-Aoa6-HdxM-BZTb-GTN1', 'fea6c167-5ab6-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсальное', ''),
('fea6c167-5ab6-11dc-be42-000e0c431b58-Bn72-FjZp-Avy9-HNIM-BDFL-G7aX', 'fea6c167-5ab6-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fea6c167-5ab6-11dc-be42-000e0c431b58-Bnu8-F458-Ay8g-HwGx-BOuu-GGTJ', 'fea6c167-5ab6-11dc-be42-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.52', 'л'),
('fea6c167-5ab6-11dc-be42-000e0c431b58-BvF9-FuSG-A7WM-HITm-Bf7W-Gd1R', 'fea6c167-5ab6-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('fea6c167-5ab6-11dc-be42-000e0c431b58-BwzB-FDCH-AaPL-HYW6-B8by-GXQ7', 'fea6c167-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fea6c169-5ab6-11dc-be42-000e0c431b58-BAdf-F7I4-A432-Hnoy-BnJP-G9in', 'fea6c169-5ab6-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсальное', ''),
('fea6c169-5ab6-11dc-be42-000e0c431b58-BfaV-FYYg-A8If-HBJX-BUp9-GMOV', 'fea6c169-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fea6c169-5ab6-11dc-be42-000e0c431b58-Bffv-FBh6-AY3k-HXEy-BtFS-GOBb', 'fea6c169-5ab6-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('fea6c169-5ab6-11dc-be42-000e0c431b58-Bfl2-FjXy-APJ6-HpX7-Bt9u-Gv80', 'fea6c169-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fea6c169-5ab6-11dc-be42-000e0c431b58-BH5T-F0h8-AyKG-HDJo-BqpK-Gcqr', 'fea6c169-5ab6-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fea6c169-5ab6-11dc-be42-000e0c431b58-BkxC-F9Ot-AcW4-H8Ki-Bu0D-GB2T', 'fea6c169-5ab6-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'темно-зеленый', ''),
('fea6c169-5ab6-11dc-be42-000e0c431b58-BwXX-F4bh-AhHM-Hrk3-BZ89-G96b', 'fea6c169-5ab6-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('fea6c169-5ab6-11dc-be42-000e0c431b58-BXFj-F8do-AwMt-HEbu-Bgjo-GziM', 'fea6c169-5ab6-11dc-be42-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.52', 'л'),
('fea6c16b-5ab6-11dc-be42-000e0c431b58-B3VK-FEDu-A8cs-H7bn-BXEU-GBaH', 'fea6c16b-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fea6c16b-5ab6-11dc-be42-000e0c431b58-BeEP-FtwB-AhMU-H1u5-Bk5Y-GLuF', 'fea6c16b-5ab6-11dc-be42-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.52', 'л'),
('fea6c16b-5ab6-11dc-be42-000e0c431b58-BhfJ-FQbl-A4zp-HO2G-BW9n-Gwu6', 'fea6c16b-5ab6-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсальное', ''),
('fea6c16b-5ab6-11dc-be42-000e0c431b58-BHha-FwSi-A0Pd-HkkR-Bndn-Gxhq', 'fea6c16b-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fea6c16b-5ab6-11dc-be42-000e0c431b58-BJdk-Fzrb-A7Da-HjzL-BfK6-Gr9Q', 'fea6c16b-5ab6-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fea6c16b-5ab6-11dc-be42-000e0c431b58-Bmro-FWwF-AGSo-HvIN-B85l-GUyC', 'fea6c16b-5ab6-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'фисташковый', ''),
('fea6c16b-5ab6-11dc-be42-000e0c431b58-BnqJ-FDQ0-AOvK-HKdI-Bb8N-GqrA', 'fea6c16b-5ab6-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('fea6c16b-5ab6-11dc-be42-000e0c431b58-BUuL-FyVw-AF9P-Hsvx-BZTT-Giju', 'fea6c16b-5ab6-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('fea6c16d-5ab6-11dc-be42-000e0c431b58-BaXJ-FtYA-AMuc-Hh3W-BABC-GaJ3', 'fea6c16d-5ab6-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('fea6c16d-5ab6-11dc-be42-000e0c431b58-Bgum-F0Se-AWSf-HZso-BSRc-GRdE', 'fea6c16d-5ab6-11dc-be42-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.52', 'л'),
('fea6c16d-5ab6-11dc-be42-000e0c431b58-BIpa-FI1I-AoGn-HyUR-Bg8a-GPzc', 'fea6c16d-5ab6-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсальное', ''),
('fea6c16d-5ab6-11dc-be42-000e0c431b58-Bix0-FMlU-AeIR-H5XG-BWyd-Ggi2', 'fea6c16d-5ab6-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fea6c16d-5ab6-11dc-be42-000e0c431b58-Bl3w-FbHA-Aw80-HKsg-BQfJ-GNos', 'fea6c16d-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fea6c16d-5ab6-11dc-be42-000e0c431b58-Bl8M-F43k-A0OZ-Hcv8-BUSr-G7SA', 'fea6c16d-5ab6-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('fea6c16d-5ab6-11dc-be42-000e0c431b58-BmIt-F2CL-AirS-HB2d-BVcV-GH4c', 'fea6c16d-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fea6c16d-5ab6-11dc-be42-000e0c431b58-Bwn8-FIiZ-AeAP-H4cq-BoHc-GKKU', 'fea6c16d-5ab6-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'бежевый', ''),
('fea6c16f-5ab6-11dc-be42-000e0c431b58-B9hK-FPLo-ANkK-HkgZ-BQ54-G2gC', 'fea6c16f-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fea6c16f-5ab6-11dc-be42-000e0c431b58-BEEg-FAm6-AKHl-Hnj5-Bbug-GyXu', 'fea6c16f-5ab6-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('fea6c16f-5ab6-11dc-be42-000e0c431b58-BFMB-FPxi-AoEc-Hi60-Bked-GPN7', 'fea6c16f-5ab6-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсальное', ''),
('fea6c16f-5ab6-11dc-be42-000e0c431b58-Bjep-FscC-AGBT-H0us-BQtQ-Ga0b', 'fea6c16f-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fea6c16f-5ab6-11dc-be42-000e0c431b58-BKmX-FmNY-ADPe-HrTz-BI6z-GnAX', 'fea6c16f-5ab6-11dc-be42-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.52', 'л'),
('fea6c16f-5ab6-11dc-be42-000e0c431b58-Bm0f-FEia-AEI6-HiYJ-Beqd-GcSx', 'fea6c16f-5ab6-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fea6c16f-5ab6-11dc-be42-000e0c431b58-BRU8-FlTs-AUkb-HkAa-BCFn-GDVb', 'fea6c16f-5ab6-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('fea6c16f-5ab6-11dc-be42-000e0c431b58-BXek-FmIr-A8mJ-H9WX-BiR4-GtYQ', 'fea6c16f-5ab6-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'голубой', ''),
('fea6c171-5ab6-11dc-be42-000e0c431b58-B6OC-FX9e-ApxO-HI6G-B4p1-Gok2', 'fea6c171-5ab6-11dc-be42-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.52', 'л'),
('fea6c171-5ab6-11dc-be42-000e0c431b58-BBEZ-FJCj-AUQ1-HHQt-BtjY-GXFD', 'fea6c171-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fea6c171-5ab6-11dc-be42-000e0c431b58-BIET-FcNI-ANg9-HPp8-BSrB-Gs1E', 'fea6c171-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fea6c171-5ab6-11dc-be42-000e0c431b58-BRKU-FIRl-A2AK-HQYQ-BTgU-Gn0i', 'fea6c171-5ab6-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсальное', ''),
('fea6c171-5ab6-11dc-be42-000e0c431b58-BTpn-Ffov-A9QT-HJyu-BT1B-GI9D', 'fea6c171-5ab6-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'синий', ''),
('fea6c171-5ab6-11dc-be42-000e0c431b58-Btuv-F5AJ-ALUq-Hg9p-BEu2-GJfT', 'fea6c171-5ab6-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fea6c171-5ab6-11dc-be42-000e0c431b58-BwMF-Fvbv-Astc-HubS-Bytc-GI3u', 'fea6c171-5ab6-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('fea6c171-5ab6-11dc-be42-000e0c431b58-ByvL-FeRK-AJW5-HBga-BUbp-GXzn', 'fea6c171-5ab6-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('fea6c173-5ab6-11dc-be42-000e0c431b58-BaPr-Fg9t-ABCQ-HSx5-BwQe-GU89', 'fea6c173-5ab6-11dc-be42-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.52', 'л'),
('fea6c173-5ab6-11dc-be42-000e0c431b58-BbH7-FdFv-A3sI-HQOR-BngM-GHux', 'fea6c173-5ab6-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'коричневый', ''),
('fea6c173-5ab6-11dc-be42-000e0c431b58-Bdki-Fqda-A1X2-H1CA-B6qH-Gv1Z', 'fea6c173-5ab6-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fea6c173-5ab6-11dc-be42-000e0c431b58-Bfvq-FHNs-A7EM-H33J-B5b0-GoIF', 'fea6c173-5ab6-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсальное', ''),
('fea6c173-5ab6-11dc-be42-000e0c431b58-Bj1u-FrG0-A9tf-HL1P-B0aT-GuYV', 'fea6c173-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fea6c173-5ab6-11dc-be42-000e0c431b58-BjEu-F9Bv-AXVl-HbCz-B2d7-Gx8B', 'fea6c173-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fea6c173-5ab6-11dc-be42-000e0c431b58-BoHz-FJSp-AZRG-HtBe-BEhQ-Guod', 'fea6c173-5ab6-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('fea6c173-5ab6-11dc-be42-000e0c431b58-BvxV-FnnY-AnjF-HuU6-BKvK-G2SJ', 'fea6c173-5ab6-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('fea6c175-5ab6-11dc-be42-000e0c431b58-BEgP-FKPT-Azg8-Hv0u-BCfP-GlLO', 'fea6c175-5ab6-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('fea6c175-5ab6-11dc-be42-000e0c431b58-Bgfi-Fp92-ArBw-HU2t-Bvkc-GBdL', 'fea6c175-5ab6-11dc-be42-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.52', 'л'),
('fea6c175-5ab6-11dc-be42-000e0c431b58-BjRL-FIUE-AsRJ-HdSB-BC6m-G17b', 'fea6c175-5ab6-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('fea6c175-5ab6-11dc-be42-000e0c431b58-BLKC-Fxym-ArPX-HOEv-B9RN-G90W', 'fea6c175-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fea6c175-5ab6-11dc-be42-000e0c431b58-BNb0-FrJS-AgRO-HW6O-BuAS-GQA6', 'fea6c175-5ab6-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'желтый', ''),
('fea6c175-5ab6-11dc-be42-000e0c431b58-Bnky-FAz3-AwyK-H0wJ-BVDp-G0ii', 'fea6c175-5ab6-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсальное', ''),
('fea6c175-5ab6-11dc-be42-000e0c431b58-BQgo-Ff3j-Atmj-HC4j-B8Eu-GA3i', 'fea6c175-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fea6c175-5ab6-11dc-be42-000e0c431b58-BssP-F4sC-ACEG-HsEo-BRn7-GcwR', 'fea6c175-5ab6-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fea6c177-5ab6-11dc-be42-000e0c431b58-BA51-FaqJ-Awot-HnqC-B4JS-Guyb', 'fea6c177-5ab6-11dc-be42-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.52', 'л'),
('fea6c177-5ab6-11dc-be42-000e0c431b58-BBCG-FV2Y-A7eZ-HvSW-B8k1-GCSP', 'fea6c177-5ab6-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('fea6c177-5ab6-11dc-be42-000e0c431b58-BboO-F8bV-AvpG-Hfva-Bohf-GmRy', 'fea6c177-5ab6-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'светло-серый', ''),
('fea6c177-5ab6-11dc-be42-000e0c431b58-BcQ2-FpI4-AlWt-HDlb-Bfne-Gm9V', 'fea6c177-5ab6-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fea6c177-5ab6-11dc-be42-000e0c431b58-Boax-FXdZ-Az0C-HTlA-Bpm5-GfCl', 'fea6c177-5ab6-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('fea6c177-5ab6-11dc-be42-000e0c431b58-BReE-FrZZ-A8lM-H3C7-BNzb-GOsb', 'fea6c177-5ab6-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсальное', ''),
('fea6c177-5ab6-11dc-be42-000e0c431b58-BtOK-F6Wd-Ah3a-H5VQ-BMw5-GbuV', 'fea6c177-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fea6c177-5ab6-11dc-be42-000e0c431b58-BxfA-F4Aw-AToT-HzRl-BnBz-Gy7M', 'fea6c177-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fea6c179-5ab6-11dc-be42-000e0c431b58-Bar7-F3Ad-AzpG-HuC8-BVP4-GxDO', 'fea6c179-5ab6-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fea6c179-5ab6-11dc-be42-000e0c431b58-BBRz-FIB3-AFWH-H9KL-BNQw-GA4m', 'fea6c179-5ab6-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('fea6c179-5ab6-11dc-be42-000e0c431b58-BGlw-FmzT-AwBM-H0Hd-BliK-GibK', 'fea6c179-5ab6-11dc-be42-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.52', 'л'),
('fea6c179-5ab6-11dc-be42-000e0c431b58-BH7s-FMqz-AF2k-HZ1t-BMNq-G9n8', 'fea6c179-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fea6c179-5ab6-11dc-be42-000e0c431b58-BN7c-FyVS-Ahhg-HOgJ-BM4N-GFQm', 'fea6c179-5ab6-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('fea6c179-5ab6-11dc-be42-000e0c431b58-BpzP-FZd7-AbWF-HtH4-BKvT-G9Ix', 'fea6c179-5ab6-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'серый', ''),
('fea6c179-5ab6-11dc-be42-000e0c431b58-BWD4-FXYV-AaUb-HTg8-Bon5-GX1k', 'fea6c179-5ab6-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсальное', ''),
('fea6c179-5ab6-11dc-be42-000e0c431b58-BX8w-FZQY-Aa6A-HVbD-B7G3-GLfV', 'fea6c179-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fea6c17b-5ab6-11dc-be42-000e0c431b58-B7A1-FQBk-AHoB-HubE-B1jw-Gd8y', 'fea6c17b-5ab6-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсальное', ''),
('fea6c17b-5ab6-11dc-be42-000e0c431b58-B83t-Ft7c-Aq8H-HmyB-BkQD-GLt1', 'fea6c17b-5ab6-11dc-be42-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.52', 'л'),
('fea6c17b-5ab6-11dc-be42-000e0c431b58-BbCl-FcwD-Agnm-HTGk-BHdp-GpFL', 'fea6c17b-5ab6-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fea6c17b-5ab6-11dc-be42-000e0c431b58-BHsm-FYB4-AHuO-HauK-BDdS-GKJ7', 'fea6c17b-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fea6c17b-5ab6-11dc-be42-000e0c431b58-BPPd-F3jk-AdqE-HIVJ-BUTC-GDD9', 'fea6c17b-5ab6-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('fea6c17b-5ab6-11dc-be42-000e0c431b58-BpwL-FmdT-ApfR-HTRs-BsVT-G06m', 'fea6c17b-5ab6-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'оранжевый', ''),
('fea6c17b-5ab6-11dc-be42-000e0c431b58-BtHH-Fpow-A14T-HBu2-Bman-GxCG', 'fea6c17b-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fea6c17b-5ab6-11dc-be42-000e0c431b58-BXFi-FmfS-Awiw-HEs7-BAo7-G158', 'fea6c17b-5ab6-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('fea6c17d-5ab6-11dc-be42-000e0c431b58-B2Qz-Fd0I-Av2A-Hnb3-B16M-GIZ0', 'fea6c17d-5ab6-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fea6c17d-5ab6-11dc-be42-000e0c431b58-B5Tl-F68D-Axx9-H07X-B03B-GP68', 'fea6c17d-5ab6-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('fea6c17d-5ab6-11dc-be42-000e0c431b58-B6nQ-FC7x-Apx7-H5Nd-B7Fu-Gwit', 'fea6c17d-5ab6-11dc-be42-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.52', 'л'),
('fea6c17d-5ab6-11dc-be42-000e0c431b58-BdTR-Fexx-AOQH-HShm-B2JP-GZhC', 'fea6c17d-5ab6-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('fea6c17d-5ab6-11dc-be42-000e0c431b58-Bjkr-F0U4-AbEA-Hdft-BdTE-GQfi', 'fea6c17d-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fea6c17d-5ab6-11dc-be42-000e0c431b58-Bmmi-FYxb-Atxm-HsSR-B333-Gk3N', 'fea6c17d-5ab6-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсальное', ''),
('fea6c17d-5ab6-11dc-be42-000e0c431b58-BQpf-FfJE-A6ia-HuLb-BtHC-Gat0', 'fea6c17d-5ab6-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'бирюзовый', ''),
('fea6c17d-5ab6-11dc-be42-000e0c431b58-ByUx-FLdV-AH0w-HK4U-BAK0-GfpJ', 'fea6c17d-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fea6c17f-5ab6-11dc-be42-000e0c431b58-B3ea-FGnW-ANgC-HEKm-B60Y-GHdq', 'fea6c17f-5ab6-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'сиреневый', ''),
('fea6c17f-5ab6-11dc-be42-000e0c431b58-BeBq-FeRA-A1eD-HuM2-BSkC-GYlA', 'fea6c17f-5ab6-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fea6c17f-5ab6-11dc-be42-000e0c431b58-BEvY-FFDv-A69A-HPUV-BNC5-Gsxh', 'fea6c17f-5ab6-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсальное', ''),
('fea6c17f-5ab6-11dc-be42-000e0c431b58-BKub-F5oX-Aw9X-Haqd-BIKf-Gyow', 'fea6c17f-5ab6-11dc-be42-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.52', 'л'),
('fea6c17f-5ab6-11dc-be42-000e0c431b58-BRnC-FMoj-Am0A-HRWz-B6OU-GVV8', 'fea6c17f-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fea6c17f-5ab6-11dc-be42-000e0c431b58-Bsie-Funp-AXio-HwpH-Bc8u-GfJZ', 'fea6c17f-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fea6c17f-5ab6-11dc-be42-000e0c431b58-BXLG-FB8w-AJat-H473-BTAo-GsGr', 'fea6c17f-5ab6-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('fea6c17f-5ab6-11dc-be42-000e0c431b58-ByfR-F3Pe-AtiE-Hw7p-BwHZ-GNBE', 'fea6c17f-5ab6-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('fea6c181-5ab6-11dc-be42-000e0c431b58-B8jH-F5vB-AMyR-HMGW-BMD9-GHti', 'fea6c181-5ab6-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('fea6c181-5ab6-11dc-be42-000e0c431b58-B8l5-Fpk8-AJ3t-HOqJ-BzRL-Gxbe', 'fea6c181-5ab6-11dc-be42-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.52', 'л'),
('fea6c181-5ab6-11dc-be42-000e0c431b58-Bgt7-FnVu-Ap6A-HtHt-BjX0-GCQi', 'fea6c181-5ab6-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'охра', ''),
('fea6c181-5ab6-11dc-be42-000e0c431b58-BjE8-FkyE-AUXc-HUas-B4Db-GIuT', 'fea6c181-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fea6c181-5ab6-11dc-be42-000e0c431b58-BkB9-FJTK-AIm7-HL5S-BDQ0-GREA', 'fea6c181-5ab6-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fea6c181-5ab6-11dc-be42-000e0c431b58-BntP-Fr3k-A2M5-H4Q8-B3wq-GyZB', 'fea6c181-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fea6c181-5ab6-11dc-be42-000e0c431b58-Btlg-Fnfw-AlXi-HRM9-BTvD-GRW2', 'fea6c181-5ab6-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсальное', ''),
('fea6c181-5ab6-11dc-be42-000e0c431b58-BWqO-FyBp-Ag5s-H9Cd-BSwF-Gyak', 'fea6c181-5ab6-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('fea6c183-5ab6-11dc-be42-000e0c431b58-B2iH-FHlO-AkLP-HC59-BGK5-G3Iq', 'fea6c183-5ab6-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсальное', ''),
('fea6c183-5ab6-11dc-be42-000e0c431b58-B40H-Fsli-AMrr-H2Sa-BNDw-GGcD', 'fea6c183-5ab6-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'какао', ''),
('fea6c183-5ab6-11dc-be42-000e0c431b58-B7hq-FEtw-Ap9h-HpZg-BKQE-GSXp', 'fea6c183-5ab6-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('fea6c183-5ab6-11dc-be42-000e0c431b58-Bh82-FxAv-AvG7-Hp0F-BW6n-GDAX', 'fea6c183-5ab6-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fea6c183-5ab6-11dc-be42-000e0c431b58-BoZL-FOeb-AknP-HCGc-BkAc-GssE', 'fea6c183-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fea6c183-5ab6-11dc-be42-000e0c431b58-BQ6v-F9wE-AZ0I-HLGk-BPuA-Ga9e', 'fea6c183-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fea6c183-5ab6-11dc-be42-000e0c431b58-BR6d-FOkc-AT8Y-H8AY-BU1E-GqNZ', 'fea6c183-5ab6-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('fea6c183-5ab6-11dc-be42-000e0c431b58-BzpW-FXVv-A4gB-H9zZ-BnWX-GfJX', 'fea6c183-5ab6-11dc-be42-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.52', 'л'),
('fea6c185-5ab6-11dc-be42-000e0c431b58-B1YB-F1I5-Ax5d-HIt9-BGxQ-GTck', 'fea6c185-5ab6-11dc-be42-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.52', 'л'),
('fea6c185-5ab6-11dc-be42-000e0c431b58-BDSN-FoUD-A998-HL4C-Bfo8-GjJB', 'fea6c185-5ab6-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fea6c185-5ab6-11dc-be42-000e0c431b58-Bey7-FOex-AcCO-HMJ3-BoXO-Gjsl', 'fea6c185-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fea6c185-5ab6-11dc-be42-000e0c431b58-BF4Q-FKF1-Azuu-HJNs-B7sg-G37B', 'fea6c185-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fea6c185-5ab6-11dc-be42-000e0c431b58-BNV6-FUWf-ALpF-HLjp-Bo5T-Gd8x', 'fea6c185-5ab6-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'красно-коричневый', ''),
('fea6c185-5ab6-11dc-be42-000e0c431b58-BqZD-F5lN-AxQl-HCzT-Bn5N-G5ET', 'fea6c185-5ab6-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсальное', ''),
('fea6c185-5ab6-11dc-be42-000e0c431b58-Bv5D-FfDR-AOA0-Hu37-BvjV-Gze8', 'fea6c185-5ab6-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('fea6c185-5ab6-11dc-be42-000e0c431b58-BXaj-FUmc-AXHG-HVqQ-BXho-GZYx', 'fea6c185-5ab6-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('fea6c187-5ab6-11dc-be42-000e0c431b58-B70x-FDtQ-Aoun-HJrc-BQ3F-Gxsf', 'fea6c187-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fea6c187-5ab6-11dc-be42-000e0c431b58-Bc4O-FGD7-AiTz-HnHh-BJUz-Gl0h', 'fea6c187-5ab6-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('fea6c187-5ab6-11dc-be42-000e0c431b58-BFuE-FG7J-AcpG-Hudl-BAWe-G8zH', 'fea6c187-5ab6-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'алюминий', ''),
('fea6c187-5ab6-11dc-be42-000e0c431b58-BLmh-FzaY-Aj7c-HaVa-BtaL-GxhI', 'fea6c187-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fea6c187-5ab6-11dc-be42-000e0c431b58-BMRb-Fosw-AFbN-HQOu-BYLu-GLPd', 'fea6c187-5ab6-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсальное', ''),
('fea6c187-5ab6-11dc-be42-000e0c431b58-Bowf-FD2b-Arbz-HPOU-B19Y-GuhG', 'fea6c187-5ab6-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('fea6c187-5ab6-11dc-be42-000e0c431b58-BtD5-FirC-AG2W-H6cV-Bc1Z-Gbbv', 'fea6c187-5ab6-11dc-be42-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.52', 'л'),
('fea6c187-5ab6-11dc-be42-000e0c431b58-BXE9-FlVN-AVuY-HF7n-BjYh-Gxek', 'fea6c187-5ab6-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fea6c189-5ab6-11dc-be42-000e0c431b58-Bi2Y-Fymk-Avg6-H58C-BrN2-GlxX', 'fea6c189-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fea6c189-5ab6-11dc-be42-000e0c431b58-BIFu-FVs5-AK6a-HVPN-BzoU-GRUm', 'fea6c189-5ab6-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('fea6c189-5ab6-11dc-be42-000e0c431b58-BMV8-FRcB-AchQ-HuM7-B5UJ-GaGw', 'fea6c189-5ab6-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'хром', ''),
('fea6c189-5ab6-11dc-be42-000e0c431b58-BPy5-FkfI-AZSU-H86C-BiHY-GgZ1', 'fea6c189-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fea6c189-5ab6-11dc-be42-000e0c431b58-BuMp-FEKk-AHss-HfOH-BWw9-Gulk', 'fea6c189-5ab6-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсальное', ''),
('fea6c189-5ab6-11dc-be42-000e0c431b58-BVXH-FRRE-AU0R-HLkF-BiUS-GOZc', 'fea6c189-5ab6-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('fea6c189-5ab6-11dc-be42-000e0c431b58-BYGc-FqSC-Aw2X-HEFw-Bh5T-GsbV', 'fea6c189-5ab6-11dc-be42-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.52', 'л'),
('fea6c189-5ab6-11dc-be42-000e0c431b58-BygL-FgCa-AoZM-HmJy-BNfL-GUwd', 'fea6c189-5ab6-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fea6c18b-5ab6-11dc-be42-000e0c431b58-Bd4P-FQNH-A09r-HcAL-BnEs-G3O8', 'fea6c18b-5ab6-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'золото', ''),
('fea6c18b-5ab6-11dc-be42-000e0c431b58-BjGU-FYFa-Awjy-Hmae-BFJo-GksV', 'fea6c18b-5ab6-11dc-be42-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.52', 'л'),
('fea6c18b-5ab6-11dc-be42-000e0c431b58-BMDe-FKzd-A530-HKeL-BY8E-GoNR', 'fea6c18b-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fea6c18b-5ab6-11dc-be42-000e0c431b58-BScX-FSm3-AdBz-HhqD-BzbR-GG68', 'fea6c18b-5ab6-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсальное', ''),
('fea6c18b-5ab6-11dc-be42-000e0c431b58-BtJe-FjrL-Anhn-H5oi-B2CH-GHwE', 'fea6c18b-5ab6-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fea6c18b-5ab6-11dc-be42-000e0c431b58-BvNQ-FdpR-AoSV-HWLk-BUYo-Gyie', 'fea6c18b-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fea6c18b-5ab6-11dc-be42-000e0c431b58-BvV4-FYQh-A7Ij-HEPV-BIyc-GdNi', 'fea6c18b-5ab6-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('fea6c18b-5ab6-11dc-be42-000e0c431b58-BXjP-Ft7b-AUQz-H0FX-BdY1-G2qd', 'fea6c18b-5ab6-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('fea6c18d-5ab6-11dc-be42-000e0c431b58-B1ks-FcuS-AJ4g-Hscm-BLMT-GKOt', 'fea6c18d-5ab6-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fea6c18d-5ab6-11dc-be42-000e0c431b58-B3Bl-F0Zy-APk7-HrHD-BC9o-GvaY', 'fea6c18d-5ab6-11dc-be42-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.52', 'л'),
('fea6c18d-5ab6-11dc-be42-000e0c431b58-B4MV-F04T-AdXl-HJjr-BINi-GjGc', 'fea6c18d-5ab6-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсальное', ''),
('fea6c18d-5ab6-11dc-be42-000e0c431b58-BDkR-FkTt-AMe7-HgpK-BPhL-G1hk', 'fea6c18d-5ab6-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('fea6c18d-5ab6-11dc-be42-000e0c431b58-Bn2a-F34K-AkgS-Hstu-BcYl-GVJw', 'fea6c18d-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fea6c18d-5ab6-11dc-be42-000e0c431b58-Bo13-FvLi-ACiG-Hr8e-BeRp-GMF0', 'fea6c18d-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fea6c18d-5ab6-11dc-be42-000e0c431b58-BTLr-FxUb-AvaP-HCur-BmHI-GMcu', 'fea6c18d-5ab6-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'медь', ''),
('fea6c18d-5ab6-11dc-be42-000e0c431b58-Btq0-FCZs-Ax3G-HYNQ-BLHc-GhHV', 'fea6c18d-5ab6-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('fea6c18f-5ab6-11dc-be42-000e0c431b58-B2GY-FIxW-AGpO-HejZ-BZWz-GmB0', 'fea6c18f-5ab6-11dc-be42-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.52', 'л'),
('fea6c18f-5ab6-11dc-be42-000e0c431b58-B6ZB-FRg4-APS3-HuG4-BgVx-G0Vd', 'fea6c18f-5ab6-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсальное', ''),
('fea6c18f-5ab6-11dc-be42-000e0c431b58-B7kq-Fl8X-AlxX-HIi7-BfaC-G5iz', 'fea6c18f-5ab6-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('fea6c18f-5ab6-11dc-be42-000e0c431b58-B9Mt-FhB0-AszW-HG38-Bw9f-GxBw', 'fea6c18f-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fea6c18f-5ab6-11dc-be42-000e0c431b58-BGiB-FCQb-A3rv-HwzL-Bu8H-Guq4', 'fea6c18f-5ab6-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый матовый', ''),
('fea6c18f-5ab6-11dc-be42-000e0c431b58-BO4d-FApS-ALaQ-HSL8-BMKJ-G6rL', 'fea6c18f-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fea6c18f-5ab6-11dc-be42-000e0c431b58-BSg5-FjzG-AhBQ-Hq89-B33X-G4K5', 'fea6c18f-5ab6-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('fea6c18f-5ab6-11dc-be42-000e0c431b58-BxZN-FpKT-Ajrp-HWqA-B10h-GvjW', 'fea6c18f-5ab6-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fea6c191-5ab6-11dc-be42-000e0c431b58-B29W-FwUA-AEWl-Hwjv-B9xM-GJFF', 'fea6c191-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fea6c191-5ab6-11dc-be42-000e0c431b58-B3El-Fd1L-APz0-Hc0F-BhhX-GbNT', 'fea6c191-5ab6-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсальное', ''),
('fea6c191-5ab6-11dc-be42-000e0c431b58-B3I3-FBrY-AJgv-HW7m-BZis-GSKQ', 'fea6c191-5ab6-11dc-be42-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.52', 'л'),
('fea6c191-5ab6-11dc-be42-000e0c431b58-BiS4-Fq7w-ANPf-HrV6-BfN5-G20P', 'fea6c191-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fea6c191-5ab6-11dc-be42-000e0c431b58-BK1W-Fk54-AOSo-HUQI-BjIR-GcJ0', 'fea6c191-5ab6-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('fea6c191-5ab6-11dc-be42-000e0c431b58-BmG3-Fli3-AqGa-HEho-BXuF-G8dO', 'fea6c191-5ab6-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fea6c191-5ab6-11dc-be42-000e0c431b58-BNaL-FS3Y-AMxH-Hn3h-BTtd-GGZx', 'fea6c191-5ab6-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'черный матовый', ''),
('fea6c191-5ab6-11dc-be42-000e0c431b58-BNbj-FtI6-AonI-HjfI-ByXM-Ga1D', 'fea6c191-5ab6-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', '');

-- --------------------------------------------------------

--
-- Структура таблицы `ShopLogs`
--

CREATE TABLE IF NOT EXISTS `ShopLogs` (
  `id` varchar(200) NOT NULL,
  `user` varchar(25) NOT NULL,
  `actionType` varchar(100) NOT NULL,
  `time` datetime NOT NULL,
  `title` varchar(100) NOT NULL,
  `logtext` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ShopLogs`
--

INSERT INTO `ShopLogs` (`id`, `user`, `actionType`, `time`, `title`, `logtext`) VALUES
('B35M-Fftx-AQcO-HW0b', 'raymefise', 'fill_unload_file', '2015-07-16 10:02:02', 'Заливка файла выгрузки', 'Заливка файла выгрузки через панель администрирования'),
('BG9N-Fmhj-AFUF-HQ7W', 'raymefise', 'fill_unload_file', '2015-07-05 09:01:24', 'Заливка файла выгрузки', 'Заливка файла выгрузки через панель администрирования'),
('BH36-FVSB-ARZi-HpCW', 'raymefise', 'fill_unload_file', '2015-07-16 08:48:00', 'Заливка файла выгрузки', 'Заливка файла выгрузки через панель администрирования'),
('BOcR-FZw8-ARXy-HYFV', 'raymefise', 'fill_unload_file', '2015-07-05 09:02:52', 'Заливка файла выгрузки', 'Заливка файла выгрузки через панель администрирования'),
('BOO4-Fvx5-A1Ba-Hp1X', 'raymefise', 'fill_unload_file', '2015-07-05 09:14:28', 'Заливка файла выгрузки', 'Заливка файла выгрузки через панель администрирования'),
('BQWx-FC6K-A4tn-HIvg', 'raymefise', 'fill_unload_file', '2015-07-16 10:06:29', 'Заливка файла выгрузки', 'Заливка файла выгрузки через панель администрирования'),
('BUYF-FlWQ-A5aL-HiOL', 'raymefise', 'fill_unload_file', '2015-07-05 08:49:28', 'Заливка файла выгрузки', 'Заливка файла выгрузки через панель администрирования'),
('BzUb-FY9J-AzdS-Hzhm', 'raymefise', 'fill_unload_file', '2015-07-05 08:49:07', 'Заливка файла выгрузки', 'Заливка файла выгрузки через панель администрирования'),
('BZWJ-FLSO-A63Y-Hr5v', 'raymefise', 'fill_unload_file', '2015-07-16 08:51:59', 'Заливка файла выгрузки', 'Заливка файла выгрузки через панель администрирования');

-- --------------------------------------------------------

--
-- Структура таблицы `ShopLogsActionType`
--

CREATE TABLE IF NOT EXISTS `ShopLogsActionType` (
  `type` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ShopLogsActionType`
--

INSERT INTO `ShopLogsActionType` (`type`, `name`, `description`) VALUES
('add_prefix', 'Добавление префикса', 'Добавление префикса через панель администрирования'),
('add_scalar', 'Добавление скаляра', 'Добавление скаляра через панель администрирования'),
('change_group', 'Изменение группы', 'Изменение группы через панель администрирования'),
('change_product', 'Изменение товара', 'Изменение товара через панель администрирования'),
('delete_prefix', 'Удаление префикса', 'Удаление префикса через панель администрирования'),
('delete_scalar', 'Удаление скаляра', 'Удаление скаляра через панель администрирования'),
('edit_prefix', 'Редактирование префикса', 'Редактирование префикса через панель администрирования'),
('edit_scalar', 'Редактирование скаляра', 'Редактирование скаляра через панель администрирования'),
('fill_unload_file', 'Заливка файла выгрузки', 'Заливка файла выгрузки через панель администрирования'),
('full_icons_groups', 'Заливка иконок групп', 'Заливка иконок групп через панель администрирования'),
('full_images_items', 'Заливка изображений товаров', 'Заливка изображений товаров через панель администрирования'),
('removal_unloading', 'Удаление выгрузки', 'Удаление выгрузки через панель администрирования'),
('start_by_hand_importing', 'Запуск ручного импорта', 'Запуск повторного импорта выгрузки через панель администрирования');

-- --------------------------------------------------------

--
-- Структура таблицы `ShopPricesTypes`
--

CREATE TABLE IF NOT EXISTS `ShopPricesTypes` (
  `id` varchar(200) NOT NULL,
  `typeName` varchar(100) NOT NULL,
  `default` tinyint(1) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ShopPricesTypes`
--

INSERT INTO `ShopPricesTypes` (`id`, `typeName`, `default`) VALUES
('288427e0-9732-11db-bbb4-0017315894a1', 'Розничная', 1),
('86157e22-e56b-11dc-8b6b-000e0c431b58', 'М. оптовая', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `ShopProperties`
--

CREATE TABLE IF NOT EXISTS `ShopProperties` (
  `id` varchar(200) NOT NULL,
  `propertyName` varchar(100) NOT NULL,
  `filterType` varchar(100) NOT NULL,
  `valueType` varchar(100) NOT NULL,
  `oneOfAllValues` tinyint(1) unsigned NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ShopProperties`
--

INSERT INTO `ShopProperties` (`id`, `propertyName`, `filterType`, `valueType`, `oneOfAllValues`) VALUES
('0569475c-1474-11e3-82b9-0050569a1080', 'Размер ячейки', 'groupSelect', 'varchar', 0),
('0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'Цвет', 'groupSelect', 'varchar', 1),
('0beb7c10-76ad-11e3-8868-005056be1f7a', 'Износоустойчивость', 'groupSelect', 'varchar', 0),
('0e31c585-9718-11e4-9be0-005056be1f7c', 'Ширина', 'intRange', 'float', 0),
('1452d640-9718-11e4-9be0-005056be1f7c', 'Толщина', 'intRange', 'float', 0),
('1d08380b-ce34-11e4-a80e-005056be1f7a', 'Вес', 'intRange', 'int', 0),
('1ea6fcc4-d206-11e4-9be0-005056be1f7c', 'Размер зерна', 'intRange', 'int', 0),
('2069608f-0a9d-11e5-8d10-005056be1f7a', 'Количество в упаковке', 'intRange', 'int', 0),
('24cace4a-9718-11e4-9be0-005056be1f7c', 'Высота', 'intRange', 'float', 0),
('27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'Область применения', 'groupSelect', 'varchar', 0),
('42d0b52f-970f-11e4-9be0-005056be1f7c', 'Вид', 'groupSelect', 'varchar', 0),
('5ca72995-ad9a-11e3-b114-005056be1f7c', 'Диаметр', 'intRange', 'float', 0),
('618eeb90-3bc1-11e3-80e1-005056be1f7a', 'Особенность', 'groupSelect', 'varchar', 0),
('6cd386f1-3a4b-11e3-88c8-005056be1f7a', 'Объем', 'intRange', 'float', 0),
('6e62ed56-970e-11e4-9be0-005056be1f7c', 'Упаковка', 'groupSelect', 'varchar', 0),
('a34e94dc-9f77-11e3-9686-005056be1f7c', 'Морозостойкость', 'groupSelect', 'varchar', 0),
('bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'Назначение', 'groupSelect', 'varchar', 0),
('c17ab514-3bbc-11e3-80e1-005056be1f7a', 'Блеск', 'groupSelect', 'varchar', 0),
('c2267174-970e-11e4-9be0-005056be1f7c', 'Длина', 'intRange', 'float', 0),
('cce0ab91-6a67-11e4-8945-005056be1f7a', 'Страна-производитель', 'groupSelect', 'varchar', 0),
('d17cb785-d20b-11e4-9be0-005056be1f7c', '-', 'intRange', 'int', 0),
('d624040a-3bb6-11e3-80e1-005056be1f7a', 'Основа', 'groupSelect', 'varchar', 0),
('e2e87ce8-ad99-11e3-b114-005056be1f7c', 'Расход', 'intRange', 'float', 0),
('e765ba72-107d-11e3-8a5d-0050569a1080', 'База', 'groupSelect', 'varchar', 0),
('e765ba75-107d-11e3-8a5d-0050569a1080', '-', 'intRange', 'float', 0),
('e8287600-ad96-11e3-b114-005056be1f7c', 'Брэнд', 'groupSelect', 'varchar', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `ShopPropertiesFilterType`
--

CREATE TABLE IF NOT EXISTS `ShopPropertiesFilterType` (
  `type` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ShopPropertiesFilterType`
--

INSERT INTO `ShopPropertiesFilterType` (`type`, `name`, `description`) VALUES
('bool', 'да/нет', 'Представляет из себя переключатель с двумя позициями: Да или Нет'),
('groupSelect', 'Множественный выбор', 'Позволяет выбрать несколько значений из всех известных'),
('intRange', 'Целочисленный диапазон', 'Представляет из себя ползунок которым можно задать диапазон целых чисел'),
('none', 'Нет фильтра', 'По данному полю поиск производиться не будет.'),
('select', 'Выпадающий список', 'Позволяет выбрать одно значение из всех доступных'),
('text', 'Текстовое поле', 'Текстовое поля для ввода текста для поиска');

-- --------------------------------------------------------

--
-- Структура таблицы `ShopPropertiesInGroups`
--

CREATE TABLE IF NOT EXISTS `ShopPropertiesInGroups` (
  `group` varchar(200) NOT NULL,
  `property` varchar(200) NOT NULL,
  `sequence` int(3) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ShopPropertiesInGroups`
--

INSERT INTO `ShopPropertiesInGroups` (`group`, `property`, `sequence`) VALUES
('12bcb99c-0399-11e5-bad4-005056be1f7a', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 1),
('12bcb99c-0399-11e5-bad4-005056be1f7a', '0e31c585-9718-11e4-9be0-005056be1f7c', 3),
('12bcb99c-0399-11e5-bad4-005056be1f7a', '1452d640-9718-11e4-9be0-005056be1f7c', 4),
('12bcb99c-0399-11e5-bad4-005056be1f7a', '1d08380b-ce34-11e4-a80e-005056be1f7a', 6),
('12bcb99c-0399-11e5-bad4-005056be1f7a', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 5),
('12bcb99c-0399-11e5-bad4-005056be1f7a', 'c2267174-970e-11e4-9be0-005056be1f7c', 2),
('18c0600b-03aa-11e5-bad4-005056be1f7a', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 2),
('18c0600b-03aa-11e5-bad4-005056be1f7a', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 3),
('18c0600b-03aa-11e5-bad4-005056be1f7a', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', 4),
('18c0600b-03aa-11e5-bad4-005056be1f7a', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 1),
('3df545ee-03aa-11e5-bad4-005056be1f7a', '1d08380b-ce34-11e4-a80e-005056be1f7a', 2),
('3df545ee-03aa-11e5-bad4-005056be1f7a', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 1),
('569e2343-ff83-11e4-9228-005056be1f7a', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 2),
('569e2343-ff83-11e4-9228-005056be1f7a', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 1),
('569e2345-ff83-11e4-9228-005056be1f7a', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 2),
('569e2345-ff83-11e4-9228-005056be1f7a', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 1),
('6aa6af7c-ff83-11e4-9228-005056be1f7a', '1ea6fcc4-d206-11e4-9be0-005056be1f7c', 2),
('6aa6af7c-ff83-11e4-9228-005056be1f7a', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 1),
('6ecba52d-fe13-11e4-9228-005056be1f7a', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 2),
('6ecba52d-fe13-11e4-9228-005056be1f7a', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 1),
('72429777-ff83-11e4-9228-005056be1f7a', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 1),
('7ab9d88b-fe13-11e4-9228-005056be1f7a', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 3),
('7ab9d88b-fe13-11e4-9228-005056be1f7a', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 1),
('7ab9d88b-fe13-11e4-9228-005056be1f7a', 'e765ba72-107d-11e3-8a5d-0050569a1080', 2),
('7eed2035-ff83-11e4-9228-005056be1f7a', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 2),
('7eed2035-ff83-11e4-9228-005056be1f7a', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 1),
('836bdaeb-2a2a-11e5-80c2-00155d3703e1', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 1),
('836bdaeb-2a2a-11e5-80c2-00155d3703e1', '42d0b52f-970f-11e4-9be0-005056be1f7c', 4),
('836bdaeb-2a2a-11e5-80c2-00155d3703e1', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 3),
('836bdaeb-2a2a-11e5-80c2-00155d3703e1', 'e8287600-ad96-11e3-b114-005056be1f7c', 2),
('8c1d670d-039a-11e5-bad4-005056be1f7a', '1d08380b-ce34-11e4-a80e-005056be1f7a', 2),
('8c1d670d-039a-11e5-bad4-005056be1f7a', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 1),
('8e3fd2e1-2a2a-11e5-80c2-00155d3703e1', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 1),
('8e3fd2e1-2a2a-11e5-80c2-00155d3703e1', '42d0b52f-970f-11e4-9be0-005056be1f7c', 4),
('8e3fd2e1-2a2a-11e5-80c2-00155d3703e1', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 3),
('8e3fd2e1-2a2a-11e5-80c2-00155d3703e1', 'e8287600-ad96-11e3-b114-005056be1f7c', 2),
('92a2d625-09e6-11e5-8d10-005056be1f7a', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 1),
('a593a937-ff83-11e4-9228-005056be1f7a', '1d08380b-ce34-11e4-a80e-005056be1f7a', 5),
('a593a937-ff83-11e4-9228-005056be1f7a', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', 3),
('a593a937-ff83-11e4-9228-005056be1f7a', 'a34e94dc-9f77-11e3-9686-005056be1f7c', 1),
('a593a937-ff83-11e4-9228-005056be1f7a', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 4),
('a593a937-ff83-11e4-9228-005056be1f7a', 'e2e87ce8-ad99-11e3-b114-005056be1f7c', 2),
('ffb217d3-09e6-11e5-8d10-005056be1f7a', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 1),
('ffb217d3-09e6-11e5-8d10-005056be1f7a', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `ShopPropertiesValueType`
--

CREATE TABLE IF NOT EXISTS `ShopPropertiesValueType` (
  `type` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ShopPropertiesValueType`
--

INSERT INTO `ShopPropertiesValueType` (`type`, `name`, `description`) VALUES
('bool', 'Белевое значение', 'Белевое значение'),
('float', 'Десятичное число', 'Десятичное число'),
('int', 'Целое число', 'Целое число'),
('text', 'Текст', 'Большой объем текста с поддержкой HTML тегов'),
('varchar', 'Строка', 'Строка длинной до 200 символов');

-- --------------------------------------------------------

--
-- Структура таблицы `Sliders`
--

CREATE TABLE IF NOT EXISTS `Sliders` (
  `alias` varchar(100) NOT NULL,
  `theme` varchar(50) NOT NULL,
  `hideTools` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `show_randomly` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `controls` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `controls_position` varchar(50) NOT NULL,
  `focus` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `focus_position` varchar(50) NOT NULL,
  `numbers` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `numbers_align` varchar(50) NOT NULL,
  `progressbar` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `enable_navigation_keys` tinyint(4) NOT NULL DEFAULT '1',
  `label` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `labelAnimation` varchar(50) NOT NULL,
  `dots` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `thumbs` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `preview` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `animations` varchar(50) NOT NULL,
  `interval` int(10) unsigned NOT NULL DEFAULT '4000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `SlidersControlsPosition`
--

CREATE TABLE IF NOT EXISTS `SlidersControlsPosition` (
  `alias` varchar(50) NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `SlidersControlsPosition`
--

INSERT INTO `SlidersControlsPosition` (`alias`, `description`) VALUES
('center', 'Поцентру'),
('leftBottom', 'Левый нижний угол'),
('leftTop', 'Левый верхний угол'),
('rightBottom', 'Правый нижний угол'),
('rightTop', 'Правый верхний угол');

-- --------------------------------------------------------

--
-- Структура таблицы `SlidersFocusPosition`
--

CREATE TABLE IF NOT EXISTS `SlidersFocusPosition` (
  `alias` varchar(50) NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `SlidersFocusPosition`
--

INSERT INTO `SlidersFocusPosition` (`alias`, `description`) VALUES
('center', 'Поцентру'),
('leftBottom', 'Левый нижний угол'),
('leftTop', 'Левый верхний угол'),
('rightBottom', 'Правый нижний угол'),
('rightTop', 'Правый верхний угол');

-- --------------------------------------------------------

--
-- Структура таблицы `SlidersLabelAnimation`
--

CREATE TABLE IF NOT EXISTS `SlidersLabelAnimation` (
  `alias` varchar(50) NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `SlidersLabelAnimation`
--

INSERT INTO `SlidersLabelAnimation` (`alias`, `description`) VALUES
('fixed', 'фиксированно'),
('left', 'с левой стороны'),
('right', 'с правой стороны'),
('slideUp', 'снизу вверх');

-- --------------------------------------------------------

--
-- Структура таблицы `SlidersNumbersAlign`
--

CREATE TABLE IF NOT EXISTS `SlidersNumbersAlign` (
  `alias` varchar(50) NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `SlidersNumbersAlign`
--

INSERT INTO `SlidersNumbersAlign` (`alias`, `description`) VALUES
('center', 'по центру'),
('left', 'по левой стороне'),
('right', 'по правой стороне');

-- --------------------------------------------------------

--
-- Структура таблицы `SlidersThemes`
--

CREATE TABLE IF NOT EXISTS `SlidersThemes` (
  `alias` varchar(50) NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `SlidersThemes`
--

INSERT INTO `SlidersThemes` (`alias`, `description`) VALUES
('clean', 'Круглые кнопки переключения на слайдере'),
('default', 'Тема по умолчанию'),
('minimalist', 'Тема минимализма'),
('round', 'Полукруглые стрелки по бокам слайдера, словно окружают его'),
('square', 'Квадратные кнопки переключения на слайдере');

-- --------------------------------------------------------

--
-- Структура таблицы `Slides`
--

CREATE TABLE IF NOT EXISTS `Slides` (
  `fileName` varchar(50) NOT NULL,
  `slider` varchar(100) NOT NULL,
  `sequence` int(11) NOT NULL,
  `animation` varchar(50) NOT NULL,
  `url` text,
  `text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `SlidesAnimations`
--

CREATE TABLE IF NOT EXISTS `SlidesAnimations` (
  `alias` varchar(50) NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `SlidesAnimations`
--

INSERT INTO `SlidesAnimations` (`alias`, `description`) VALUES
('blind', ''),
('blindHeight', ''),
('blindWidth', ''),
('block', ''),
('circles', ''),
('circlesInside', ''),
('circlesRotate', ''),
('cube', ''),
('cubeHide', ''),
('cubeJelly', ''),
('cubeRandom', ''),
('cubeShow', ''),
('cubeSize', ''),
('cubeSpread', ''),
('cubeStop', ''),
('cubeStopRandom', ''),
('cut', ''),
('directionBottom', ''),
('directionLeft', ''),
('directionRight', ''),
('directionTop', ''),
('downBars', ''),
('fade', ''),
('fadeFour', ''),
('glassBlock', ''),
('glassCube', ''),
('hideBars', ''),
('horizontal', ''),
('paralell', ''),
('random', ''),
('randomSmart', ''),
('showBars', ''),
('showBarsRandom', ''),
('swapBars', ''),
('swapBarsBack', ''),
('swapBlocks', ''),
('tube', ''),
('upBars', '');

-- --------------------------------------------------------

--
-- Структура таблицы `TemplateBlocks`
--

CREATE TABLE IF NOT EXISTS `TemplateBlocks` (
`id` bigint(20) unsigned NOT NULL,
  `block` varchar(50) NOT NULL,
  `template` varchar(50) NOT NULL,
  `description` text
) ENGINE=InnoDB AUTO_INCREMENT=2001 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `TemplateBlocks`
--

INSERT INTO `TemplateBlocks` (`id`, `block`, `template`, `description`) VALUES
(101, 'LeftTopHeadBlock', 'apelsinShop', NULL),
(102, 'LeftBottomHeadBlock', 'apelsinShop', NULL),
(103, 'MenuBlock', 'apelsinShop', NULL),
(104, 'BeforeContentBlock', 'apelsinShop', NULL),
(105, 'ContentTopBlock', 'apelsinShop', NULL),
(106, 'ContentBottomBlock', 'apelsinShop', NULL),
(107, 'AfterContentBlock', 'apelsinShop', NULL),
(108, 'FutterLeftBlock', 'apelsinShop', NULL),
(109, 'FutterRightBlock', 'apelsinShop', NULL),
(1000, 'test', 'apelsinShopTest', NULL),
(2000, 'ShopNavigationPanel', 'apelsinShopTest', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `TemplateDependence`
--

CREATE TABLE IF NOT EXISTS `TemplateDependence` (
`id` bigint(20) unsigned NOT NULL,
  `template` varchar(50) NOT NULL,
  `depends` varchar(50) NOT NULL,
  `versionStart` varchar(100) DEFAULT NULL,
  `versionEnd` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Templates`
--

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
-- Дамп данных таблицы `Templates`
--

INSERT INTO `Templates` (`alias`, `name`, `author`, `version`, `description`, `default`, `main`, `mobile`, `print`) VALUES
('apelsinShop', 'Магазин Апельсин', 'Compu Project', '1.0', 'Шаблон для магазина', 0, 'index.php', 'mobile.php', 'print.php'),
('apelsinShopTest', 'Апельсин', 'Compu Project', '1.0', 'Основной шаблон сайта', 1, 'index.php', 'mobile.php', 'print.php');

-- --------------------------------------------------------

--
-- Структура таблицы `UrlTarget`
--

CREATE TABLE IF NOT EXISTS `UrlTarget` (
`id` int(10) unsigned NOT NULL,
  `target` varchar(30) NOT NULL COMMENT 'инструкция об отскрытии ссылки',
  `description` varchar(45) DEFAULT NULL COMMENT 'Описание'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='тип ссылки. как ее открывать';

--
-- Дамп данных таблицы `UrlTarget`
--

INSERT INTO `UrlTarget` (`id`, `target`, `description`) VALUES
(1, '_blank', 'Opens the linked document in a new window or '),
(2, '_self', 'Opens the linked document in the same frame a'),
(3, '_parent', 'Opens the linked document in the parent frame'),
(4, '_top', 'Opens the linked document in the full body of');

-- --------------------------------------------------------

--
-- Структура таблицы `Users`
--

CREATE TABLE IF NOT EXISTS `Users` (
  `login` varchar(25) NOT NULL,
  `nickname` varchar(25) DEFAULT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(200) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `ferstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `birthday` datetime NOT NULL,
  `sex` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '1 - мужской\n0 - женский',
  `city` varchar(200) NOT NULL,
  `group` varchar(50) NOT NULL,
  `registered` datetime NOT NULL,
  `lastVisit` datetime NOT NULL,
  `activated` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `activatedHash` varchar(200) NOT NULL,
  `disable` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `delete` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` varchar(150) DEFAULT NULL,
  `aboutYourself` text,
  `icq` varchar(9) DEFAULT NULL,
  `skype` varchar(25) DEFAULT NULL,
  `vk` varchar(25) DEFAULT NULL,
  `odnoklasniki` varchar(25) DEFAULT NULL,
  `google` varchar(25) DEFAULT NULL,
  `facebook` varchar(25) DEFAULT NULL,
  `twitter` varchar(25) DEFAULT NULL,
  `instagram` varchar(25) DEFAULT NULL,
  `youtube` varchar(25) DEFAULT NULL,
  `livejournal` varchar(25) DEFAULT NULL,
  `blogger` varchar(25) DEFAULT NULL,
  `siteName` varchar(25) DEFAULT NULL,
  `siteUrl` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Users`
--

INSERT INTO `Users` (`login`, `nickname`, `password`, `email`, `phone`, `ferstName`, `lastName`, `birthday`, `sex`, `city`, `group`, `registered`, `lastVisit`, `activated`, `activatedHash`, `disable`, `delete`, `status`, `aboutYourself`, `icq`, `skype`, `vk`, `odnoklasniki`, `google`, `facebook`, `twitter`, `instagram`, `youtube`, `livejournal`, `blogger`, `siteName`, `siteUrl`) VALUES
('grimih', 'Grimih', 'bbfd0bf8425e1c91e8807cbe99393407', 'grinenko@apelsin.ru', '+79308701701', 'Михаил', 'Гриненко', '1982-08-12 00:00:00', 1, 'Рязань', 'Administrator', '2014-09-19 04:39:51', '2014-09-19 04:39:51', 1, 'd2ccebe4505dddd2f4c33c36370f1c5e', 0, 0, NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
('m27', 'm27', 'd57e26d0e2f4d7356686cbb5979a4f82', 'pplheiter@gmail.com', '8-920-986-54-98', 'Данила', 'Андронов', '2014-01-17 00:00:00', 1, 'Рязань', 'Administrator', '2014-09-19 04:36:23', '2014-09-19 04:36:23', 1, 'c03f02a9510235b55d5e0ce8f1bc48af', 0, 0, NULL, 'Бла-бла-бла', '', '', '', '', '', '', '', '', '', '', '', '', ''),
('olga', 'Olga', '12836c0b33a98b189d3e7aa4e191a0a9', 'olga.rjabchicova@gmail.com', '89105675898', 'Ольга', 'Рябчикова', '1974-09-27 00:00:00', 0, 'Рязань', 'Administrator', '2014-09-19 00:00:00', '2014-09-19 00:00:00', 1, '12836c0b33a98b189d3e7aa4e191a0a9', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('raymefise', 'RayMefise', 'a48f3792917ce52e0b6e8d412f061bf4', 'zaytsev.max90@gmail.com', '89105665485', 'Максим', 'Зайцев', '1990-03-01 00:00:00', 1, 'Рязань', 'Administrator', '2013-11-06 12:08:42', '2013-11-06 12:08:42', 1, 'd4af759b9c284a163c6d3d6fe7575eb4', 0, 0, 'Уровень сарказма в моем ответе зависит от уровня тупости вашего вопроса.', 'Психология - это искусство иметь людей раньше чем они поимеют вас!\r\n\r\nЛучший изгиб на теле женщины - это ее улыбка. \r\n\r\nПеред сексом вы помогаете друг другу раздеться, после секса вы одеваете только себя.\r\nМораль: в жизни никто не поможет вам, когда вас поимеют.\r\n\r\nУстой традиций надо соблюдать,\r\nПускай не раз ответят вам отказом,\r\nКонечно дама может и не дать,\r\nНо предложить, ты ей, всегда обязан.', '430776', 'mefise_ray', 'raymefise', '', '113232610557507330855', 'ray.mefise', 'RayMefise', 'ray_mefise', 'RayMefise', '', '', 'Compu Project', 'compuproject.com');

-- --------------------------------------------------------

--
-- Структура таблицы `UsersAgreements`
--

CREATE TABLE IF NOT EXISTS `UsersAgreements` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(150) NOT NULL,
  `text` longtext NOT NULL,
  `dateOfChange` datetime NOT NULL,
`sequence` int(10) unsigned NOT NULL,
  `site` tinyint(4) NOT NULL DEFAULT '1',
  `admin` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `UsersAgreements`
--

INSERT INTO `UsersAgreements` (`id`, `name`, `text`, `dateOfChange`, `sequence`, `site`, `admin`) VALUES
(1, 'Пользовательское соглашение', '<b><u>Пользовательское соглашение</u></b>\r\n<ol>\r\n<li><b><u>Общее положения</u></b>\r\n<ol>\r\n<li>Администрация предлагает Пользователю использовать сервисы Интернет-сайта на условиях, изложенных в настоящем Пользовательском соглашении. Соглашение вступает в силу с момента выражения Пользователем согласия с его условиями в порядке, предусмотренном п. 1.3 Соглашения.</li>\r\n<li>Использование сервисов Интернет-сайта регулируется настоящим Соглашением. Соглашение может быть изменено Администрацией без какого-либо специального уведомления, новая редакция Соглашения вступает в силу с момента ее размещения в сети Интернет по указанному адресу в п. 1.5 Соглашения.</li>\r\n<li>Начиная использовать сервис Интернет-сайта, пройдя процедуру регистрации, Пользователь считается принявшим условия Соглашения в полном объеме, без всяких оговорок и исключений. </li>\r\n<li>В случае несогласия Пользователя с какими-либо из положений Соглашения, Пользователь не в праве использовать сервисы Интернет-сайта. В случае если Администрацией были внесены какие-либо изменения в Соглашение в порядке, предусмотренном пунктом 1.2 Соглашения, с которыми Пользователь не согласен, он обязан прекратить использование сервисов Интернет-сайта.</li>\r\n</ol>\r\n</li>\r\n<li><b><u>Правила пользования Сайтом</u></b>\r\n<ol>\r\n<li>Пользование Сайтом возможно только при условии согласия Пользователя с условиями Соглашения и присоединения к нему в порядке, предусмотренном Соглашением. Для возможности использования основного функционала Сайта Пользователь создает Аккаунт.</li>\r\n<li>При регистрации Аккаунта Пользователем указывается актуальная и соответствующая действительности информация, в том числе Ф.И.О., пол, дата рождения и прочая информация. В случае указания неверных данных Пользователю будет отказано в использовании сервисов Интернет-сайта, а так же в участие на фестивале. </li>\r\n<li>Для входа на Сайт Пользователем формируются уникальные учетные данные - логин и пароль, которые являются конфиденциальной информацией и не подлежат разглашению, за исключением случаев, предусмотренных действующим законодательством и/или Соглашением. Риск осуществления мошеннических и иных неправомерных действий с Аккаунтом Пользователя в связи с утратой пароля несет Пользователь.</li>\r\n<li>Персональные данные Пользователя, указанные им при регистрации, а именно фамилия, имя, дата рождения, город проживания и прочая информация, отражаемая в Аккаунте и Профиле Пользователя (далее по тексту - персональные данные), обрабатываются Администрацией для исполнения Соглашения, предоставления Сервисов, оказания услуг Пользователю посредством Сайта.</li>\r\n<li>Присоединяясь к Соглашению и размещая данные в Аккаунте, Пользователь выражает свое согласие на обработку персональных данных Администрацией и на отражение персональных данных в Профиле Пользователя.</li>\r\n<li>Пользователь соглашается с тем, что Администрация в процессе обработки персональных данных имеет право осуществлять с персональными данными следующие действия: сбор, систематизацию, накопление, хранение, использование, уничтожение и иные необходимые в целях исполнения Соглашения и реализации Сервисов действия.</li>\r\n<li>После регистрации Аккаунта Пользователь вправе осуществлять наполнение Аккаунта  Контентом, добавлять фотографии и иные материалы в соответствии с предоставленным функционалом, предоставленными Администрацией при условии соблюдения Соглашения.</li>\r\n<li>Пользователь осознает и соглашается, что размещаемая в Аккаунте Пользователя Информация доступна для ознакомления иным Пользователям через Персональную страницу (Профиль) Пользователя.</li>\r\n<li>Вход на Сайт Пользователем, ранее зарегистрировавшим Аккаунт, осуществляется каждый раз путем прохождения процедуры авторизации - введения логина и пароля Пользователя, перехода по гиперссылке, полученной по электронной почте.</li>\r\n<li>Лицо, авторизовавшееся на Сайте, считается надлежащим владельцем Аккаунта Пользователя, доступ к использованию и управлению которого были получены в результате такой авторизации.</li>\r\n<li>Способы восстановления доступа к Аккаунту, авторизации Пользователя могут быть изменены, отменены или дополнены Администрацией в одностороннем порядке.</li>\r\n<li>Администрация обеспечивает функционирование Сайта в круглосуточном режиме, однако не гарантирует отсутствие перерывов, связанных с техническими неисправностями или проведением профилактических работ. Администрация не гарантирует, что Сайт или любые Сервисы будут функционировать в любое конкретное время в будущем или что они не прекратят работу.</li>\r\n</ol>\r\n</li>\r\n<li><b><u>Права и обязанности Пользователя</u></b>\r\n<ol>\r\n<li>Пользователь вправе:\r\n<ol>\r\n<li>производить настройки Аккаунта и Профиля, менять пароль для доступа к Аккаунту;</li>\r\n<li>размещать в Аккаунте Пользователя информацию о себе, добавлять фотографии, статусы;</li>\r\n<li>осуществлять поиск иных Пользователей в сообществах Пользователей, а также по информации, известной Пользователю и соответствующей информации, размещаемой отыскиваемым Пользователем на Персональной странице;</li>\r\n<li>отправлять и получать Личные сообщения, добавлять сообщения в чат;</li>\r\n<li>осуществлять иные, не запрещенные законодательством Российской Федерации или Соглашением действия, связанные с использованием Сайта.</li>\r\n</ol>\r\n<li> Пользователь гарантирует, что обладает всеми необходимыми полномочиями, для заключения настоящего Соглашения.</li>\r\n<li>Пользователь обязуется:\r\n<ol>\r\n<li>в момент регистрации Аккаунта указывать соответствующие действительности сведения в том числе Ф.И.О., пол, дата рождения и прочая информация. В случае указания неверных данных Пользователю будет отказано в использовании сервисов Интернет-сайта, а так же в участие на фестивале;</li>\r\n<li>принимать необходимые меры для обеспечения конфиденциальности учетных данных (логин и пароль), используемых для доступа к Аккаунту, следить за тем, чтобы пароль не сохранялся в браузере при возможном использовании компьютера другими лицами;</li>\r\n<li>уведомлять Администрацию Сайта обо всех случаях совершения в отношении Пользователя действий, которые могут быть расценены как оскорбительные, унижающие, дискредитирующие и т.п.;</li>\r\n<li>не совершать указанные в разделе 4 Соглашения запрещенные действия.</li>\r\n</ol></li>\r\n</ol></li>\r\n<li><b><u>Пользователю запрещается</u></b>\r\n<ol>\r\n<li>Осуществлять сбор персональных данных других Пользователей;</li>\r\n<li>Использовать любые автоматические или автоматизированные средства для сбора информации, размещенной на Сайте;</li>\r\n<li>Осуществлять пропаганду или агитацию, возбуждающую социальную, расовую, национальную или религиозную ненависть и вражду, пропаганду войны, социального, расового, национального, религиозного или языкового превосходства;</li>\r\n<li>Размещать на Сайте или передавать посредством Личных сообщений информацию ограниченного доступа (конфиденциальную информацию) третьих лиц, если Пользователь не обладает достаточными правами в силу закона или договора на раскрытие данной информации;</li>\r\n<li>Размещать на Сайте в открытом доступе (в чате, в комментариях и/или статусах) или передавать посредством Личных сообщений текстовые сообщения, графические изображения или иные материалы, содержание которых является оскорбительным для других Пользователей или иных лиц или может быть расценено в качестве такового, а также сообщения, изображения и иные материалы, которые дискредитируют Пользователей или иных лиц, содержат угрозы, призывы к насилию, совершению противоправных деяний, антиобщественных, аморальных поступков, а также совершению любых иных действий, противоречащих основам правопорядка и нравственности;</li>\r\n<li>Размещать на Сайте сообщения, графические изображения или другие материалы (в том числе не соответствующие действительности), размещение которых наносит или может нанести ущерб чести, достоинству и деловой репутации гражданина или деловой репутации организации;</li>\r\n<li>Размещать на Сайте сообщения, содержащие нецензурные слова и выражения;</li>\r\n<li>Размещать на Сайте материалы порнографического или эротического характера, фотографии людей в нижнем белье, за исключением купальных костюмов, или гипертекстовые ссылки на Интернет-сайты, содержащие такие материалы;</li>\r\n<li>Размещать на Сайте материалы с изображением алкогольной или табачной продукции, а так же с имитацией процесса курения и употребления алкогольных напитков;</li>\r\n<li>Размещать на Сайте персональные данные, в том числе контактные данные, других Пользователей или иных лиц без их предварительного согласия;</li>\r\n<li>Указывать при регистрации Аккаунта или вводить впоследствии заведомо ложную или вымышленную информацию о себе, в частности чужие или вымышленные имя и фамилию;</li>\r\n<li>Размещать на Сайте в качестве собственной фотографии изображения других лиц или вымышленных персонажей, изображения животных, предметов, абстрактные изображения, а также любые иные графические изображения, не являющиеся изображениями Пользователя, размещающего данные изображения;</li>\r\n<li>Регистрировать Аккаунт Пользователя в целях использования группой лиц или организацией без предварительного явного согласия Администрации;</li>\r\n<li>Регистрировать более одного Аккаунта Пользователя одним и тем же лицом;</li>\r\n<li>Размещать на Сайте в открытом доступе без предварительного согласия Администрации Сайта, передавать посредством Личных сообщений без предварительного согласия Пользователя текстовые сообщения, графические изображения и иные материалы, которые содержат рекламу;</li>\r\n<li>Осуществлять действия, направленные на дестабилизацию функционирования Сайта, осуществлять попытки несанкционированного доступа к управлению Сайтом или его закрытым разделам (разделам, доступ к которым разрешен только Администрации), а также осуществлять любые иные аналогичные действия;</li>\r\n<li>Осуществлять несанкционированный доступ к Аккаунтам иных Пользователей путем подборки или введения пароля, а также предпринимать попытки такого доступа;</li>\r\n<li>Использовать Сайт в каких-либо коммерческих целях без предварительного разрешения Администрации Сайта, за исключением случаев, предусмотренных настоящим Соглашением;</li>\r\n<li>Осуществлять рассылку спама - массовую рассылку коммерческой, политической, рекламной и иной информации (в том числе гиперссылок, ведущих на интернет-сайты с такой информацией и/или на интернет-сайты, содержащие вредоносное программное обеспечение) в Личных сообщениях, комментариях, сообщениях в чате и т.п., если Пользователи-получатели не выражали своего согласия на получение такого рода информации;</li>\r\n<li>Использовать Сайт для целей поиска и подбора персонала, размещения резюме, поиска должников или иных подобных целей.</li>\r\n</ol></li>\r\n<li><b><u>Права и обязанности Администрации Сайта</u></b>\r\n<ol>\r\n<li>Администрация осуществляет текущее управление Сайтом, определяет его структуру, внешний вид, разрешает или ограничивает доступ Пользователей к Сайту, осуществляет иные принадлежащие ей права.</li>\r\n<li>В части предоставления возможности взаимодействия между Пользователями, в том числе предоставления Пользователям возможности самостоятельно совершать те или иные действия в рамках Сайта, Администрация является лицом, только организовавшим техническую возможность такого взаимодействия, и связанные с таким взаимодействием передача, хранение и обеспечение доступа посредством сети Интернет к предоставляемой Пользователями информации, графическим изображениям и иным материалам, осуществляются без изменения таких материалов или влияния на них со стороны Администрации.</li>\r\n<li>Администрация решает вопросы о порядке размещения на Сайте рекламы, участия в партнерских программах и т.д.</li>\r\n<li>Администрация не несет ответственности за размещенные Пользователями Материалы, и предупреждает об уголовной ответственности за нарушение законодательства Российской Федерации.</li>\r\n<li>Администрация имеет право:\r\n<ol>\r\n<li>в любое время изменять оформление Сайта, его содержание, список Сервисов, изменять или дополнять используемые скрипты, программное обеспечение, Контент Администрации и другие объекты, используемые или хранящиеся на Сайте, любые серверные приложения, с уведомлением Пользователя или без такового;</li>\r\n<li>по своему усмотрению удалять любую информацию, в том числе размещаемую Пользователем на Сайте в нарушение законодательства Российской Федерации или положений Соглашения;</li>\r\n<li>использовать Материалы Пользователя в целях рекламы Сайта на свое усмотрение без какой-либо компенсации;</li>\r\n<li>использовать Материалы Пользователя  и/или их отдельные части (фрагменты) любыми способами (в т.ч. без указаний имени автора, модели и т.п.), в любой форме в любых целях, в том числе, в рекламных, макетах, рекламных модулях и т.д., без какой-либо компенсации;</li>\r\n<li>приостанавливать, ограничивать или прекращать доступ Пользователя ко всем или к любому из разделов Сайта, сообществам, группам на Сайте, Сервисам Администрации и/или Сервисам Партнеров Администрации, удалять создаваемые Пользователями сообщества и группы, в любое время без объяснения причин, с предварительным уведомлением или без такового;</li>\r\n<li>удалить Аккаунт Пользователя по своему усмотрению, в том числе в случае совершения Пользователем действий, нарушающих законодательство Российской Федерации или положения Соглашения;</li>\r\n<li>осуществлять рассылку Пользователям сообщений (в том числе сообщений по электронной почте, sms-сообщений и т.п.), являющихся уведомлениями о введении в действие новых, либо отмене старых услуг, утверждении и опубликовании новой редакции Соглашения, о новых Личных сообщениях, комментариях к фотографиям и статусам в Профиле Пользователя и т.п., содержащих рекламную информацию о Сервисах Администрации.</li>\r\n</ol></li>\r\n<li> Администрация не занимается рассмотрением и разрешением споров и конфликтных ситуаций, возникающих между Пользователями, а также между Пользователем и Партнером Администрации при использовании Пользователем Сервиса Партнера Администрации, однако по своему усмотрению может содействовать в разрешении возникших конфликтов. Администрация вправе приостановить, ограничить или прекратить доступ Пользователя к Сайту, в случае получения от других Пользователей мотивированных жалоб на некорректное поведение данного Пользователя на Сайте.</li>\r\n</ol></li>\r\n<li><b><u>Использование пользовательских материалов</u></b>\r\n<ol>\r\n<li>Принимая условия настоящего Соглашения, Пользователь безвозмездно предоставляет Администрации право использования материалов, который Пользователь добавляет, размещает или транслирует на Сайт. </li>\r\n<li>Размещаемые на Сайте Материалы не должны содержать:\r\n<ol>\r\n<li>материалы, которые нарушают действующие нормативно-правовые акта Российской Федерации, являются вредоносными, угрожающими, оскорбляющими нравственность, честь и достоинство, права и охраняемые законом интересы третьих лиц, клеветническими, нарушающими авторские права, пропагандирующими ненависть и/или дискриминацию людей по расовому, этническому, половому, социальному признакам, способствующие разжиганию религиозной, расовой или межнациональной розни, содержащие сцены насилия, либо жестокого обращения с животными, и т.д.;</li>\r\n<li>ущемления прав меньшинств;</li>\r\n<li>выдачи себя за другого человека или представителя организации и/или сообщества без достаточных на то прав, а также введения в заблуждение относительно свойств и характеристик каких-либо субъектов или объектов;</li>\r\n<li>неразрешенной специальным образом рекламной информации, спама, схем «пирамид», «писем счастья»;</li>\r\n<li>материалы, содержащие компьютерные коды, предназначенные для нарушения, уничтожения либо ограничения функциональности любого компьютерного или телекоммуникационного оборудования или программ, для осуществления несанкционированного доступа, а также серийные номера к коммерческим программным продуктам, логины, пароли и прочие средства для получения несанкционированного доступа к платным ресурсам в Интернет;</li>\r\n<li>умышленного или случайного нарушения каких-либо применимых нормативно-правовых актов;</li>\r\n<li>сбора и хранения персональных данных других пользователей;</li>\r\n<li>несогласованной передачи записей рекламного, коммерческого или агитационного характера;</li>\r\n<li>рекламы наркотических средств, алкогольной или табачной продукции, а так же с имитацией процесса курения и употребления алкогольных напитков и наркотиков;</li>\r\n<li>записи в чей-либо адрес, содержащие грубые и оскорбительные выражения.</li>\r\n</ol></li>\r\n</ol></li>\r\n<li><b><u>Прочие условия</u></b>\r\n<ol>\r\n<li>Соглашение вступает в силу с момента принятия его условий Пользователем. Соглашение выражается путем проставления отметки в соответствующем поле во время регистрации Аккаунта Пользователя, а также совершения Пользователем любого из действий по пользованию Сайтом (например, авторизация, фактическое потребление оказываемых услуг, загрузка Контента, использование Сервиса и т.п.). В случае несогласия с условиями Соглашения, Пользователь обязан прекратить пользование Сайтом и удалить Аккаунт Пользователя.</li>\r\n<li>Удаление Аккаунта означает автоматическое удаление персональных данных, Контента, настроек Аккаунта и Профиля, имеющихся у Пользователя ОКов, а также иной имеющейся в Аккаунте Пользователя информации.</li>\r\n<li>Положения Соглашения могут быть дополнены, изменены или отменены Администрацией Сайта в одностороннем порядке без предварительного уведомления Пользователей. Администрация Сайта вправе известить Пользователя о внесенных в Соглашение изменениях или о вступлении в силу новой редакции Соглашения путем опубликования уведомления на Сайте, отправки Личных сообщений Пользователю или иным способом по выбору Администрации Сайта.</li>\r\n<li>К правам и обязанностям Сторон, возникшим на основании редакции Соглашения, утратившей свою силу, применяются положения действующей (актуальной) редакции Соглашения, если иное не вытекает из характера возникших между Сторонами отношений.</li>\r\n<li>Претензии Пользователя, направляемые Администрации, принимаются и рассматриваются при условии указания актуальных и достоверных данных Пользователя, указанных в Аккаунте. Принимая во внимание возможное наличие Аккаунтов со схожими учетными данными, Администрация вправе требовать предоставления дополнительных сведений и информации, в том числе в отношении Аккаунта Пользователя, позволяющих определить, в связи с каким Аккаунтом поступила претензия, или установить принадлежность Аккаунта лицу, обратившемуся с претензией.</li>\r\n</ol></li>\r\n</ol>', '2013-11-05 06:13:33', 1, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `UsersGroups`
--

CREATE TABLE IF NOT EXISTS `UsersGroups` (
  `group` varchar(50) NOT NULL,
  `adminDefault` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `siteDefault` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `loginInAdminPanel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `changeSettings` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `permissionUsersShow` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `permissionUsersCreate` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `permissionUsersEdit` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `permissionUsersDelete` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `permissionUsersGroupCreate` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `permissionUsersGroupEdit` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `permissionUsersGroupDelete` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `permissionPagesCreate` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `permissionPagesEdit` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `permissionPagesDelete` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `permissionModulesCreate` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `permissionModulesEdit` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `permissionModulesDelete` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `permissionPluginsEdit` tinyint(3) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `UsersGroups`
--

INSERT INTO `UsersGroups` (`group`, `adminDefault`, `siteDefault`, `loginInAdminPanel`, `changeSettings`, `permissionUsersShow`, `permissionUsersCreate`, `permissionUsersEdit`, `permissionUsersDelete`, `permissionUsersGroupCreate`, `permissionUsersGroupEdit`, `permissionUsersGroupDelete`, `permissionPagesCreate`, `permissionPagesEdit`, `permissionPagesDelete`, `permissionModulesCreate`, `permissionModulesEdit`, `permissionModulesDelete`, `permissionPluginsEdit`) VALUES
('Administrator', 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1),
('Moderator', 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0),
('SuperModerator', 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 0),
('User', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `UsersGroups_Lang`
--

CREATE TABLE IF NOT EXISTS `UsersGroups_Lang` (
  `group` varchar(50) NOT NULL,
  `lang` varchar(3) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `UsersGroups_Lang`
--

INSERT INTO `UsersGroups_Lang` (`group`, `lang`, `name`, `description`) VALUES
('Administrator', 'rus', 'Администратор', 'Администратор системы'),
('Moderator', 'rus', 'Модератор', 'Модератор сайта'),
('SuperModerator', 'rus', 'Главный модератор', 'Главный модератор сайта'),
('User', 'rus', 'Пользователь', 'Пользователь сайта');

-- --------------------------------------------------------

--
-- Структура таблицы `UsersMassage`
--

CREATE TABLE IF NOT EXISTS `UsersMassage` (
`id` bigint(20) unsigned NOT NULL,
  `title` varchar(150) DEFAULT NULL,
  `text` text NOT NULL,
  `date` datetime NOT NULL,
  `sender` varchar(25) NOT NULL,
  `addressee` varchar(25) NOT NULL,
  `sender_read` tinyint(4) NOT NULL DEFAULT '0',
  `addressee_read` tinyint(4) NOT NULL DEFAULT '0',
  `sender_delete` tinyint(4) NOT NULL DEFAULT '0',
  `addressee_delete` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `UsersNotifications`
--

CREATE TABLE IF NOT EXISTS `UsersNotifications` (
`id` bigint(20) unsigned NOT NULL,
  `user` varchar(25) NOT NULL,
  `date` datetime NOT NULL,
  `type` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `UsersNotifications`
--

INSERT INTO `UsersNotifications` (`id`, `user`, `date`, `type`) VALUES
(1, 'raymefise', '2013-11-16 00:00:00', 'notification'),
(2, 'raymefise', '2013-11-16 00:00:00', 'alert'),
(3, 'raymefise', '2013-11-16 00:00:00', 'alarm');

-- --------------------------------------------------------

--
-- Структура таблицы `UsersNotificationsType`
--

CREATE TABLE IF NOT EXISTS `UsersNotificationsType` (
  `type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `UsersNotificationsType`
--

INSERT INTO `UsersNotificationsType` (`type`) VALUES
('alarm'),
('alert'),
('notification');

-- --------------------------------------------------------

--
-- Структура таблицы `UsersNotifications_Lang`
--

CREATE TABLE IF NOT EXISTS `UsersNotifications_Lang` (
  `usersNotifications` bigint(20) unsigned NOT NULL,
  `lang` varchar(3) NOT NULL,
  `title` varchar(200) NOT NULL,
  `text` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `UsersNotifications_Lang`
--

INSERT INTO `UsersNotifications_Lang` (`usersNotifications`, `lang`, `title`, `text`) VALUES
(1, 'eng', 'Заполните информацию о себе', 'Уважаемый пользователь, вы не заполнили информацию о себе до конца.'),
(1, 'rus', 'Заполните информацию о себе', 'Уважаемый пользователь, вы не заполнили информацию о себе до конца.'),
(2, 'eng', 'Распространение ложной информации.', 'Есть подозрения о том что вы указали некорректрые данные. Пройтите првоерку или мы вас заблокируем.'),
(2, 'rus', 'Распространение ложной информации.', 'Есть подозрения о том что вы указали некорректрые данные. Пройтите првоерку или мы вас заблокируем.'),
(3, 'eng', 'Предупреждение от Администрации', 'Вас скоро забанят'),
(3, 'rus', 'Предупреждение от Администрации', 'Вас скоро забанят');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Components`
--
ALTER TABLE `Components`
 ADD PRIMARY KEY (`alias`), ADD UNIQUE KEY `name_UNIQUE` (`name`);

--
-- Индексы таблицы `ComponentsDepends`
--
ALTER TABLE `ComponentsDepends`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `id_UNIQUE` (`id`), ADD UNIQUE KEY `depends_UNIQUE` (`depends`,`component`,`elementType`), ADD KEY `fk_ComponentsDepends_1_idx` (`elementType`), ADD KEY `fk_ComponentsDepends_2_idx` (`component`);

--
-- Индексы таблицы `ComponentsDependsElementsType`
--
ALTER TABLE `ComponentsDependsElementsType`
 ADD PRIMARY KEY (`elementType`), ADD UNIQUE KEY `elementType_UNIQUE` (`elementType`);

--
-- Индексы таблицы `ComponentsElements`
--
ALTER TABLE `ComponentsElements`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `component_UNIQUE` (`component`,`alias`), ADD UNIQUE KEY `id_UNIQUE` (`id`), ADD UNIQUE KEY `alias_UNIQUE` (`alias`,`component`);

--
-- Индексы таблицы `CreatedModules`
--
ALTER TABLE `CreatedModules`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `id_UNIQUE` (`id`), ADD KEY `fk_CreatedModules_1_idx` (`module`);

--
-- Индексы таблицы `DBerrors`
--
ALTER TABLE `DBerrors`
 ADD PRIMARY KEY (`id`);

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
-- Индексы таблицы `JCropTypes`
--
ALTER TABLE `JCropTypes`
 ADD PRIMARY KEY (`type`), ADD UNIQUE KEY `boxId_UNIQUE` (`type`);

--
-- Индексы таблицы `Jquery`
--
ALTER TABLE `Jquery`
 ADD PRIMARY KEY (`fileName`), ADD UNIQUE KEY `version_UNIQUE` (`version`,`min`), ADD UNIQUE KEY `fileName_UNIQUE` (`fileName`);

--
-- Индексы таблицы `Lang`
--
ALTER TABLE `Lang`
 ADD PRIMARY KEY (`lang`), ADD UNIQUE KEY `lang_UNIQUE` (`lang`), ADD UNIQUE KEY `langName_UNIQUE` (`langName`);

--
-- Индексы таблицы `Materials`
--
ALTER TABLE `Materials`
 ADD PRIMARY KEY (`alias`), ADD UNIQUE KEY `alias_UNIQUE` (`alias`);

--
-- Индексы таблицы `MaterialsCategories`
--
ALTER TABLE `MaterialsCategories`
 ADD PRIMARY KEY (`alias`), ADD UNIQUE KEY `alias_UNIQUE` (`alias`);

--
-- Индексы таблицы `MaterialsCategoriesInList`
--
ALTER TABLE `MaterialsCategoriesInList`
 ADD PRIMARY KEY (`category`,`list`), ADD UNIQUE KEY `key_UNIQUE` (`sequence`,`list`), ADD KEY `fk_MaterialsCategories_has_CategoriesList_CategoriesList1_idx` (`list`), ADD KEY `fk_MaterialsCategories_has_CategoriesList_MaterialsCategori_idx` (`category`);

--
-- Индексы таблицы `MaterialsCategoriesList`
--
ALTER TABLE `MaterialsCategoriesList`
 ADD PRIMARY KEY (`name`), ADD UNIQUE KEY `name_UNIQUE` (`name`);

--
-- Индексы таблицы `MaterialsCategoriesList_Lang`
--
ALTER TABLE `MaterialsCategoriesList_Lang`
 ADD PRIMARY KEY (`list`,`lang`), ADD KEY `fk_MaterialsCategoriesList_Lang_MaterialsCategories_idx` (`list`), ADD KEY `fk_MaterialsCategoriesList_Lang_Lang_idx` (`lang`);

--
-- Индексы таблицы `MaterialsCategories_Lang`
--
ALTER TABLE `MaterialsCategories_Lang`
 ADD PRIMARY KEY (`category`,`lang`), ADD KEY `fk_MaterialsCategories_Lang_MaterialsCategories_idx` (`category`), ADD KEY `fk_MaterialsCategories_Lang_Lang_idx` (`lang`);

--
-- Индексы таблицы `MaterialsInCategories`
--
ALTER TABLE `MaterialsInCategories`
 ADD PRIMARY KEY (`material`,`category`), ADD KEY `fk_MaterialsInCategories_Materials_idx` (`material`), ADD KEY `fk_MaterialsInCategories_MaterialsCategories_idx` (`category`);

--
-- Индексы таблицы `Materials_Lang`
--
ALTER TABLE `Materials_Lang`
 ADD PRIMARY KEY (`material`,`lang`), ADD KEY `fk_Materials_Lang_Materials_idx` (`material`), ADD KEY `fk_Materials_Lang_Lang_idx` (`lang`);

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
-- Индексы таблицы `Modules`
--
ALTER TABLE `Modules`
 ADD PRIMARY KEY (`alias`), ADD UNIQUE KEY `name_UNIQUE` (`name`);

--
-- Индексы таблицы `ModulesDepends`
--
ALTER TABLE `ModulesDepends`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `id_UNIQUE` (`id`), ADD UNIQUE KEY `depends_UNIQUE` (`depends`,`module`,`elementType`), ADD KEY `fk_ModulesDepends_1_idx` (`elementType`), ADD KEY `fk_ModulesDepends_2` (`module`);

--
-- Индексы таблицы `ModulesDependsElementsType`
--
ALTER TABLE `ModulesDependsElementsType`
 ADD PRIMARY KEY (`elementType`), ADD UNIQUE KEY `tableName_UNIQUE` (`tableName`), ADD UNIQUE KEY `elementType_UNIQUE` (`elementType`);

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
-- Индексы таблицы `ModulesTitleIcon`
--
ALTER TABLE `ModulesTitleIcon`
 ADD PRIMARY KEY (`module`), ADD UNIQUE KEY `module_UNIQUE` (`module`), ADD KEY `fk_ModulesTitleIcon_1_idx` (`module`), ADD KEY `fk_ModulesTitleIcon_2_idx` (`style`);

--
-- Индексы таблицы `ModulesTitleIconStile`
--
ALTER TABLE `ModulesTitleIconStile`
 ADD PRIMARY KEY (`style`), ADD UNIQUE KEY `style_UNIQUE` (`style`);

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
-- Индексы таблицы `ParamInfo_ComponentsElements`
--
ALTER TABLE `ParamInfo_ComponentsElements`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `param_UNIQUE` (`param`,`componentElement`), ADD KEY `fk_ParamInfo_ComponentsElements_1_idx` (`componentElement`);

--
-- Индексы таблицы `PluginDefaultParam`
--
ALTER TABLE `PluginDefaultParam`
 ADD PRIMARY KEY (`plugin`,`param`);

--
-- Индексы таблицы `PluginDepends`
--
ALTER TABLE `PluginDepends`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `id_UNIQUE` (`id`), ADD UNIQUE KEY `depends_UNIQUE` (`depends`,`plugin`,`elementType`), ADD KEY `fk_PluginDepends_1_idx` (`elementType`), ADD KEY `fk_PluginDepends_2_idx` (`plugin`);

--
-- Индексы таблицы `PluginOnPage`
--
ALTER TABLE `PluginOnPage`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `plugin_UNIQUE` (`plugin`,`page`), ADD UNIQUE KEY `id_UNIQUE` (`id`), ADD KEY `fk_PluginOnPage_2_idx` (`page`), ADD KEY `fk_PluginOnPage_1_idx` (`plugin`);

--
-- Индексы таблицы `PluginParam`
--
ALTER TABLE `PluginParam`
 ADD PRIMARY KEY (`plugin`,`param`);

--
-- Индексы таблицы `Plugins`
--
ALTER TABLE `Plugins`
 ADD PRIMARY KEY (`alias`), ADD UNIQUE KEY `sequence_UNIQUE` (`sequence`);

--
-- Индексы таблицы `PluginsDependsElementsType`
--
ALTER TABLE `PluginsDependsElementsType`
 ADD PRIMARY KEY (`elementType`), ADD UNIQUE KEY `elementType_UNIQUE` (`elementType`), ADD UNIQUE KEY `tableName_UNIQUE` (`tableName`);

--
-- Индексы таблицы `ROOT_SETTINGS`
--
ALTER TABLE `ROOT_SETTINGS`
 ADD PRIMARY KEY (`settingsName`), ADD UNIQUE KEY `settingsName_UNIQUE` (`settingsName`);

--
-- Индексы таблицы `ShopGroups`
--
ALTER TABLE `ShopGroups`
 ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `ShopGroupsHierarchy`
--
ALTER TABLE `ShopGroupsHierarchy`
 ADD PRIMARY KEY (`group`,`parentGroup`), ADD UNIQUE KEY `UNIQUE_group` (`group`), ADD KEY `fk_ShopGroupsHierarchy_2_idx` (`parentGroup`);

--
-- Индексы таблицы `ShopImportLogs`
--
ALTER TABLE `ShopImportLogs`
 ADD PRIMARY KEY (`importDate`), ADD KEY `fk_ShopImportLogs_1_idx` (`user`);

--
-- Индексы таблицы `ShopItems`
--
ALTER TABLE `ShopItems`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_ShopItems_1_idx` (`group`);

--
-- Индексы таблицы `ShopItemsPrices`
--
ALTER TABLE `ShopItemsPrices`
 ADD PRIMARY KEY (`item`,`price`), ADD KEY `fk_ShopItemsPrices_2_idx` (`price`);

--
-- Индексы таблицы `ShopItemsPropertiesMeasure`
--
ALTER TABLE `ShopItemsPropertiesMeasure`
 ADD PRIMARY KEY (`measureF`);

--
-- Индексы таблицы `ShopItemsPropertiesMeasurePrefix`
--
ALTER TABLE `ShopItemsPropertiesMeasurePrefix`
 ADD PRIMARY KEY (`prefixF`), ADD UNIQUE KEY `factor_UNIQUE` (`factor`);

--
-- Индексы таблицы `ShopItemsPropertiesMeasureScaling`
--
ALTER TABLE `ShopItemsPropertiesMeasureScaling`
 ADD PRIMARY KEY (`measure`,`prefix`), ADD KEY `fk2_ShopItemsPropertiesMeasureScaling_idx` (`prefix`);

--
-- Индексы таблицы `ShopItemsPropertiesValues`
--
ALTER TABLE `ShopItemsPropertiesValues`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_ShopItemsPropertiesValues_1_idx` (`property`), ADD KEY `fk_ShopItemsPropertiesValues_2_idx` (`item`);

--
-- Индексы таблицы `ShopLogs`
--
ALTER TABLE `ShopLogs`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_ShopLogs_1_idx` (`user`), ADD KEY `fk_ShopLogs_2_idx` (`actionType`);

--
-- Индексы таблицы `ShopLogsActionType`
--
ALTER TABLE `ShopLogsActionType`
 ADD PRIMARY KEY (`type`);

--
-- Индексы таблицы `ShopPricesTypes`
--
ALTER TABLE `ShopPricesTypes`
 ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `ShopProperties`
--
ALTER TABLE `ShopProperties`
 ADD PRIMARY KEY (`id`), ADD KEY `fk_ShopProperties_1_idx` (`filterType`), ADD KEY `fk_ShopProperties_2_idx` (`valueType`);

--
-- Индексы таблицы `ShopPropertiesFilterType`
--
ALTER TABLE `ShopPropertiesFilterType`
 ADD PRIMARY KEY (`type`);

--
-- Индексы таблицы `ShopPropertiesInGroups`
--
ALTER TABLE `ShopPropertiesInGroups`
 ADD PRIMARY KEY (`group`,`property`), ADD KEY `fk_ShopPropertiesInGroups_2_idx` (`property`);

--
-- Индексы таблицы `ShopPropertiesValueType`
--
ALTER TABLE `ShopPropertiesValueType`
 ADD PRIMARY KEY (`type`);

--
-- Индексы таблицы `Sliders`
--
ALTER TABLE `Sliders`
 ADD PRIMARY KEY (`alias`), ADD UNIQUE KEY `alias_UNIQUE` (`alias`), ADD KEY `fk_Sliders_SlidersThemes_idx` (`theme`), ADD KEY `fk_Sliders_1_idx` (`controls_position`), ADD KEY `fk_Sliders_2_idx` (`focus_position`), ADD KEY `fk_Sliders_3_idx` (`numbers_align`), ADD KEY `fk_Sliders_4_idx` (`labelAnimation`), ADD KEY `fk_Sliders_5_idx` (`animations`);

--
-- Индексы таблицы `SlidersControlsPosition`
--
ALTER TABLE `SlidersControlsPosition`
 ADD PRIMARY KEY (`alias`), ADD UNIQUE KEY `alias_UNIQUE` (`alias`);

--
-- Индексы таблицы `SlidersFocusPosition`
--
ALTER TABLE `SlidersFocusPosition`
 ADD PRIMARY KEY (`alias`), ADD UNIQUE KEY `alias_UNIQUE` (`alias`);

--
-- Индексы таблицы `SlidersLabelAnimation`
--
ALTER TABLE `SlidersLabelAnimation`
 ADD PRIMARY KEY (`alias`), ADD UNIQUE KEY `alias_UNIQUE` (`alias`);

--
-- Индексы таблицы `SlidersNumbersAlign`
--
ALTER TABLE `SlidersNumbersAlign`
 ADD PRIMARY KEY (`alias`), ADD UNIQUE KEY `alias_UNIQUE` (`alias`);

--
-- Индексы таблицы `SlidersThemes`
--
ALTER TABLE `SlidersThemes`
 ADD PRIMARY KEY (`alias`), ADD UNIQUE KEY `alias_UNIQUE` (`alias`);

--
-- Индексы таблицы `Slides`
--
ALTER TABLE `Slides`
 ADD PRIMARY KEY (`fileName`,`slider`), ADD UNIQUE KEY `sequence_UNIQUE` (`sequence`,`slider`), ADD KEY `fk_Slides_Sliders_idx` (`slider`), ADD KEY `fk_Slides_SlidesAnimations_idx` (`animation`);

--
-- Индексы таблицы `SlidesAnimations`
--
ALTER TABLE `SlidesAnimations`
 ADD PRIMARY KEY (`alias`), ADD UNIQUE KEY `alias_UNIQUE` (`alias`);

--
-- Индексы таблицы `TemplateBlocks`
--
ALTER TABLE `TemplateBlocks`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `id_UNIQUE` (`id`), ADD UNIQUE KEY `block_UNIQUE` (`block`,`template`), ADD KEY `fk_TemplateBlocks_1_idx` (`template`);

--
-- Индексы таблицы `TemplateDependence`
--
ALTER TABLE `TemplateDependence`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `id_UNIQUE` (`id`), ADD UNIQUE KEY `template_UNIQUE` (`template`,`depends`);

--
-- Индексы таблицы `Templates`
--
ALTER TABLE `Templates`
 ADD PRIMARY KEY (`alias`);

--
-- Индексы таблицы `UrlTarget`
--
ALTER TABLE `UrlTarget`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `id_UNIQUE` (`id`), ADD UNIQUE KEY `target_UNIQUE` (`target`);

--
-- Индексы таблицы `Users`
--
ALTER TABLE `Users`
 ADD PRIMARY KEY (`login`), ADD UNIQUE KEY `login_UNIQUE` (`login`), ADD UNIQUE KEY `email_UNIQUE` (`email`), ADD UNIQUE KEY `phone_UNIQUE` (`phone`), ADD KEY `fk_Users_1_idx` (`group`);

--
-- Индексы таблицы `UsersAgreements`
--
ALTER TABLE `UsersAgreements`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `id_UNIQUE` (`id`), ADD UNIQUE KEY `sequence_UNIQUE` (`sequence`);

--
-- Индексы таблицы `UsersGroups`
--
ALTER TABLE `UsersGroups`
 ADD PRIMARY KEY (`group`), ADD UNIQUE KEY `group_UNIQUE` (`group`);

--
-- Индексы таблицы `UsersGroups_Lang`
--
ALTER TABLE `UsersGroups_Lang`
 ADD PRIMARY KEY (`group`,`lang`), ADD KEY `fk_UsersGroups_Lang_2_idx` (`lang`);

--
-- Индексы таблицы `UsersMassage`
--
ALTER TABLE `UsersMassage`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `id_UNIQUE` (`id`), ADD KEY `fk_UsersMassage_1_idx` (`sender`), ADD KEY `fk_UsersMassage_2_idx` (`addressee`);

--
-- Индексы таблицы `UsersNotifications`
--
ALTER TABLE `UsersNotifications`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `id_UNIQUE` (`id`), ADD KEY `fk_UsersNotifications_1_idx` (`type`), ADD KEY `fk_UsersNotifications_2_idx` (`user`);

--
-- Индексы таблицы `UsersNotificationsType`
--
ALTER TABLE `UsersNotificationsType`
 ADD PRIMARY KEY (`type`), ADD UNIQUE KEY `type_UNIQUE` (`type`);

--
-- Индексы таблицы `UsersNotifications_Lang`
--
ALTER TABLE `UsersNotifications_Lang`
 ADD PRIMARY KEY (`usersNotifications`,`lang`), ADD UNIQUE KEY `lang_UNIQUE` (`lang`,`usersNotifications`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `ComponentsDepends`
--
ALTER TABLE `ComponentsDepends`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `ComponentsElements`
--
ALTER TABLE `ComponentsElements`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=999902;
--
-- AUTO_INCREMENT для таблицы `DBerrors`
--
ALTER TABLE `DBerrors`
MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `MenuItems`
--
ALTER TABLE `MenuItems`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор элемента меню',AUTO_INCREMENT=107;
--
-- AUTO_INCREMENT для таблицы `ModulesDepends`
--
ALTER TABLE `ModulesDepends`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `ModulesInBlocks`
--
ALTER TABLE `ModulesInBlocks`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=903109;
--
-- AUTO_INCREMENT для таблицы `ParamInfo_ComponentsElements`
--
ALTER TABLE `ParamInfo_ComponentsElements`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT для таблицы `PluginDepends`
--
ALTER TABLE `PluginDepends`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `PluginOnPage`
--
ALTER TABLE `PluginOnPage`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `Plugins`
--
ALTER TABLE `Plugins`
MODIFY `sequence` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT для таблицы `TemplateBlocks`
--
ALTER TABLE `TemplateBlocks`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2001;
--
-- AUTO_INCREMENT для таблицы `TemplateDependence`
--
ALTER TABLE `TemplateDependence`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `UrlTarget`
--
ALTER TABLE `UrlTarget`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `UsersAgreements`
--
ALTER TABLE `UsersAgreements`
MODIFY `sequence` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `UsersMassage`
--
ALTER TABLE `UsersMassage`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `UsersNotifications`
--
ALTER TABLE `UsersNotifications`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `ComponentsDepends`
--
ALTER TABLE `ComponentsDepends`
ADD CONSTRAINT `fk_ComponentsDepends_1` FOREIGN KEY (`elementType`) REFERENCES `ComponentsDependsElementsType` (`elementType`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_ComponentsDepends_2` FOREIGN KEY (`component`) REFERENCES `Components` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `ComponentsElements`
--
ALTER TABLE `ComponentsElements`
ADD CONSTRAINT `fk_ComponentsElements_1` FOREIGN KEY (`component`) REFERENCES `Components` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE;

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
-- Ограничения внешнего ключа таблицы `MaterialsCategoriesInList`
--
ALTER TABLE `MaterialsCategoriesInList`
ADD CONSTRAINT `fk_MaterialsCategoriesInList_CategoriesList_CategoriesList` FOREIGN KEY (`list`) REFERENCES `MaterialsCategoriesList` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_MaterialsCategoriesInList_MaterialsCategories` FOREIGN KEY (`category`) REFERENCES `MaterialsCategories` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `MaterialsCategoriesList_Lang`
--
ALTER TABLE `MaterialsCategoriesList_Lang`
ADD CONSTRAINT `fk_MaterialsCategoriesList_Lang_Lang_Lang` FOREIGN KEY (`lang`) REFERENCES `Lang` (`lang`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_MaterialsCategoriesList_Lang_MaterialsCategories` FOREIGN KEY (`list`) REFERENCES `MaterialsCategoriesList` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `MaterialsCategories_Lang`
--
ALTER TABLE `MaterialsCategories_Lang`
ADD CONSTRAINT `fk_MaterialsCategories_Lang_Lang` FOREIGN KEY (`lang`) REFERENCES `Lang` (`lang`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_MaterialsCategories_Lang_MaterialsCategories` FOREIGN KEY (`category`) REFERENCES `MaterialsCategories` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `MaterialsInCategories`
--
ALTER TABLE `MaterialsInCategories`
ADD CONSTRAINT `fk_MaterialsInCategories_Materials` FOREIGN KEY (`material`) REFERENCES `Materials` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_MaterialsInCategories_MaterialsCategories` FOREIGN KEY (`category`) REFERENCES `MaterialsCategories` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `Materials_Lang`
--
ALTER TABLE `Materials_Lang`
ADD CONSTRAINT `fk_Materials_Lang_Lang` FOREIGN KEY (`lang`) REFERENCES `Lang` (`lang`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_Materials_Lang_Materials` FOREIGN KEY (`material`) REFERENCES `Materials` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE;

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
-- Ограничения внешнего ключа таблицы `ModulesDepends`
--
ALTER TABLE `ModulesDepends`
ADD CONSTRAINT `fk_ModulesDepends_1` FOREIGN KEY (`elementType`) REFERENCES `ModulesDependsElementsType` (`elementType`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_ModulesDepends_2` FOREIGN KEY (`module`) REFERENCES `Modules` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE;

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
-- Ограничения внешнего ключа таблицы `ModulesTitleIcon`
--
ALTER TABLE `ModulesTitleIcon`
ADD CONSTRAINT `fk_ModulesTitleIcon_1` FOREIGN KEY (`module`) REFERENCES `ModulesInBlocks` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_ModulesTitleIcon_2` FOREIGN KEY (`style`) REFERENCES `ModulesTitleIconStile` (`style`) ON DELETE CASCADE ON UPDATE CASCADE;

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
-- Ограничения внешнего ключа таблицы `ParamInfo_ComponentsElements`
--
ALTER TABLE `ParamInfo_ComponentsElements`
ADD CONSTRAINT `fk_ParamInfo_ComponentsElements_1` FOREIGN KEY (`componentElement`) REFERENCES `ComponentsElements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `PluginDefaultParam`
--
ALTER TABLE `PluginDefaultParam`
ADD CONSTRAINT `fk_PluginDefaultParam_1` FOREIGN KEY (`plugin`) REFERENCES `Plugins` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `PluginDepends`
--
ALTER TABLE `PluginDepends`
ADD CONSTRAINT `fk_PluginDepends_1` FOREIGN KEY (`elementType`) REFERENCES `PluginsDependsElementsType` (`elementType`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_PluginDepends_2` FOREIGN KEY (`plugin`) REFERENCES `Plugins` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `PluginOnPage`
--
ALTER TABLE `PluginOnPage`
ADD CONSTRAINT `fk_PluginOnPage_1` FOREIGN KEY (`plugin`) REFERENCES `Plugins` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_PluginOnPage_2` FOREIGN KEY (`page`) REFERENCES `Pages` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `PluginParam`
--
ALTER TABLE `PluginParam`
ADD CONSTRAINT `fk_PluginParam_1` FOREIGN KEY (`plugin`) REFERENCES `PluginOnPage` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `ShopGroupsHierarchy`
--
ALTER TABLE `ShopGroupsHierarchy`
ADD CONSTRAINT `fk_ShopGroupsHierarchy_1` FOREIGN KEY (`group`) REFERENCES `ShopGroups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_ShopGroupsHierarchy_2` FOREIGN KEY (`parentGroup`) REFERENCES `ShopGroups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `ShopImportLogs`
--
ALTER TABLE `ShopImportLogs`
ADD CONSTRAINT `fk_ShopImportLogs_1` FOREIGN KEY (`user`) REFERENCES `Users` (`login`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `ShopItems`
--
ALTER TABLE `ShopItems`
ADD CONSTRAINT `fk_ShopItems_1` FOREIGN KEY (`group`) REFERENCES `ShopGroups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `ShopItemsPrices`
--
ALTER TABLE `ShopItemsPrices`
ADD CONSTRAINT `fk_ShopItemsPrices_1` FOREIGN KEY (`item`) REFERENCES `ShopItems` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_ShopItemsPrices_2` FOREIGN KEY (`price`) REFERENCES `ShopPricesTypes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `ShopItemsPropertiesMeasureScaling`
--
ALTER TABLE `ShopItemsPropertiesMeasureScaling`
ADD CONSTRAINT `fk1_ShopItemsPropertiesMeasureScaling` FOREIGN KEY (`measure`) REFERENCES `ShopItemsPropertiesMeasure` (`measureF`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk2_ShopItemsPropertiesMeasureScaling` FOREIGN KEY (`prefix`) REFERENCES `ShopItemsPropertiesMeasurePrefix` (`prefixF`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `ShopItemsPropertiesValues`
--
ALTER TABLE `ShopItemsPropertiesValues`
ADD CONSTRAINT `fk_ShopItemsPropertiesValues_1` FOREIGN KEY (`item`) REFERENCES `ShopItems` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_ShopItemsPropertiesValues_2` FOREIGN KEY (`property`) REFERENCES `ShopProperties` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `ShopLogs`
--
ALTER TABLE `ShopLogs`
ADD CONSTRAINT `fk_ShopLogs_1` FOREIGN KEY (`user`) REFERENCES `Users` (`login`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_ShopLogs_2` FOREIGN KEY (`actionType`) REFERENCES `ShopLogsActionType` (`type`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `ShopProperties`
--
ALTER TABLE `ShopProperties`
ADD CONSTRAINT `fk_ShopProperties_1` FOREIGN KEY (`filterType`) REFERENCES `ShopPropertiesFilterType` (`type`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_ShopProperties_2` FOREIGN KEY (`valueType`) REFERENCES `ShopPropertiesValueType` (`type`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `ShopPropertiesInGroups`
--
ALTER TABLE `ShopPropertiesInGroups`
ADD CONSTRAINT `fk_ShopPropertiesInGroups_1` FOREIGN KEY (`group`) REFERENCES `ShopGroups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_ShopPropertiesInGroups_2` FOREIGN KEY (`property`) REFERENCES `ShopProperties` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `Sliders`
--
ALTER TABLE `Sliders`
ADD CONSTRAINT `fk_Sliders_1` FOREIGN KEY (`controls_position`) REFERENCES `SlidersControlsPosition` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_Sliders_2` FOREIGN KEY (`focus_position`) REFERENCES `SlidersFocusPosition` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_Sliders_3` FOREIGN KEY (`numbers_align`) REFERENCES `SlidersNumbersAlign` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_Sliders_4` FOREIGN KEY (`labelAnimation`) REFERENCES `SlidersLabelAnimation` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_Sliders_5` FOREIGN KEY (`animations`) REFERENCES `SlidesAnimations` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_Sliders_SlidersThemes` FOREIGN KEY (`theme`) REFERENCES `SlidersThemes` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `Slides`
--
ALTER TABLE `Slides`
ADD CONSTRAINT `fk_Slides_Sliders` FOREIGN KEY (`slider`) REFERENCES `Sliders` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_Slides_SlidesAnimations` FOREIGN KEY (`animation`) REFERENCES `SlidesAnimations` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `TemplateBlocks`
--
ALTER TABLE `TemplateBlocks`
ADD CONSTRAINT `fk_TemplateBlocks_1` FOREIGN KEY (`template`) REFERENCES `Templates` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `TemplateDependence`
--
ALTER TABLE `TemplateDependence`
ADD CONSTRAINT `fk_TemplateDependence_1` FOREIGN KEY (`template`) REFERENCES `Templates` (`alias`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `Users`
--
ALTER TABLE `Users`
ADD CONSTRAINT `fk_Users_1` FOREIGN KEY (`group`) REFERENCES `UsersGroups` (`group`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `UsersGroups_Lang`
--
ALTER TABLE `UsersGroups_Lang`
ADD CONSTRAINT `fk_UsersGroups_Lang_1` FOREIGN KEY (`group`) REFERENCES `UsersGroups` (`group`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_UsersGroups_Lang_2` FOREIGN KEY (`lang`) REFERENCES `Lang` (`lang`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `UsersMassage`
--
ALTER TABLE `UsersMassage`
ADD CONSTRAINT `fk_UsersMassage_1` FOREIGN KEY (`sender`) REFERENCES `Users` (`login`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_UsersMassage_2` FOREIGN KEY (`addressee`) REFERENCES `Users` (`login`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `UsersNotifications`
--
ALTER TABLE `UsersNotifications`
ADD CONSTRAINT `fk_UsersNotifications_1` FOREIGN KEY (`type`) REFERENCES `UsersNotificationsType` (`type`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_UsersNotifications_2` FOREIGN KEY (`user`) REFERENCES `Users` (`login`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `UsersNotifications_Lang`
--
ALTER TABLE `UsersNotifications_Lang`
ADD CONSTRAINT `fk_UsersNotifications_Lang_1` FOREIGN KEY (`usersNotifications`) REFERENCES `UsersNotifications` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `fk_UsersNotifications_Lang_2` FOREIGN KEY (`lang`) REFERENCES `Lang` (`lang`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
