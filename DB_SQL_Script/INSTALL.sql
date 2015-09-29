-- phpMyAdmin SQL Dump
-- version 4.2.13.1
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Сен 29 2015 г., 10:07
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
('ShopAdmin', 'Администрирование магазина', 'Compuproject', '1.0', NULL, 'admin', 'index.php'),
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
(301, 'ImportData', 'ShopAdmin', 'Импорт данных', NULL, 'index.php', 'index.php', 'index.php', 'head.php', 'bodyStart.php', 'bodyEnd.php', 'index.php'),
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
(101103, 101, 103, 3, 0, NULL, 1, 1),
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
('accounts', 1, NULL, 999801, 'apelsinShop', 0, 1, 1, 1, 0),
('account_settings', 1, NULL, 999802, 'apelsinShop', 0, 1, 1, 1, 0),
('adminpanel', 1, NULL, 999901, 'apelsinShop', 0, 0, 0, 0, 0),
('shop', 1, NULL, 201, 'apelsinShop', 1, 1, 1, 1, 0),
('shopadmin', 1, NULL, 301, 'apelsinShop', 0, 1, 1, 1, 0),
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
('26d261f0-2c4b-11e5-80c2-00155d3703e1', 'Декоративные штукатурки', 1, 1),
('26d261f2-2c4b-11e5-80c2-00155d3703e1', 'Декоративные шпатлевки', 1, 1),
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
('405e422b-039a-11e5-bad4-005056be1f7a', 'Керамическая плитка', 1, 1),
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
('7afde3c7-2c4b-11e5-80c2-00155d3703e1', 'Ковка', 1, 1),
('7cb5f7e2-1f26-11e5-80c1-00155d3703e2', 'Степлеры и скобозабиватели', 1, 1),
('7ce3d8d3-2557-11e5-80c1-00155d3703e2', 'Ножницы', 1, 1),
('7ce3d8d4-2557-11e5-80c1-00155d3703e2', 'Отбойные молотки', 1, 1),
('7d588ba2-043e-11e5-bad4-005056be1f7a', 'Линолеум', 1, 1),
('7eada471-0438-11e5-bad4-005056be1f7a', 'Железобетонные изделия, кирпичи и блоки', 1, 1),
('80fac221-1b38-11e5-80c1-00155d3703e2', 'Баллоны и тележки', 1, 1),
('819bcac7-03a8-11e5-bad4-005056be1f7a', 'Балки', 1, 1),
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
('88e775d2-2c4b-11e5-80c2-00155d3703e1', 'Фурнитура', 1, 1),
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
('8f7ea964-2c4b-11e5-80c2-00155d3703e1', 'Фурнитура оконная', 1, 1),
('8f7ea965-2c4b-11e5-80c2-00155d3703e1', 'Фурнитура дверная', 1, 1),
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
('a99df9d6-2a2a-11e5-80c2-00155d3703e1', 'Интерьер', 1, 1),
('a99df9d7-2a2a-11e5-80c2-00155d3703e1', 'Защита труда', 1, 1),
('aa1d7996-043e-11e5-bad4-005056be1f7a', 'Аксессуары и расходные материалы', 1, 1),
('aa47beb7-0441-11e5-bad4-005056be1f7a', 'Системы монтажа электропроводки', 1, 1),
('aa47beb9-0441-11e5-bad4-005056be1f7a', 'Кабель', 1, 1),
('aa6c0c5b-043f-11e5-bad4-005056be1f7a', 'Вспененный полиэтилен', 1, 1),
('aba134d6-043b-11e5-bad4-005056be1f7a', 'Водонагреватели', 1, 1),
('ac8ae411-0435-11e5-bad4-005056be1f7a', 'Стеклообои', 1, 1),
('ad4a2a75-1f28-11e5-80c1-00155d3703e2', 'Экстракторы', 1, 1),
('ad800502-2c57-11e5-80c2-00155d3703e1', 'Подоконники и откосы', 1, 1),
('ae73d56b-ff83-11e4-9228-005056be1f7a', 'Абажуры', 1, 1),
('af166af3-2c49-11e5-80c2-00155d3703e1', 'Хозяйственные товары', 1, 1),
('af2b26f1-03a8-11e5-bad4-005056be1f7a', 'Перфорированные панели', 1, 1),
('af50e83a-255a-11e5-80c1-00155d3703e2', 'Степлеры электрические', 1, 1),
('b02db436-2a06-11e5-80c2-00155d3703e1', 'Системы труб', 1, 1),
('b067512c-1f27-11e5-80c1-00155d3703e2', 'Напильники и надфили', 1, 1),
('b12591dd-043e-11e5-bad4-005056be1f7a', 'Системы обогрева пола', 1, 1),
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
('e6ea5159-043d-11e5-bad4-005056be1f7a', 'Декоративный камень', 1, 1),
('e70e507a-1f27-11e5-80c1-00155d3703e2', 'Рубанки', 1, 1),
('e84cc2d6-03aa-11e5-bad4-005056be1f7a', 'Смазка', 1, 1),
('e8675698-1b35-11e5-80c1-00155d3703e2', 'Валики, ролики', 1, 1),
('e86fb2bc-03a8-11e5-bad4-005056be1f7a', 'Инструменты штукатурные', 1, 1),
('e8b4430e-2c49-11e5-80c2-00155d3703e1', 'Люстры, торшеры и бра', 1, 1),
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
('22403192-1f29-11e5-80c1-00155d3703e2', 'af166af3-2c49-11e5-80c2-00155d3703e1'),
('235ae6b0-1b3c-11e5-80c1-00155d3703e2', '97eb85d9-2a2a-11e5-80c2-00155d3703e1'),
('23b8fbe7-03a2-11e5-bad4-005056be1f7a', 'b89e40ef-2aca-11e5-811e-00155d3703b3'),
('24b8f33a-03ac-11e5-bad4-005056be1f7a', 'c371b375-2ada-11e5-811e-00155d3703b3'),
('255a6617-1b39-11e5-80c1-00155d3703e2', '2d9e2abc-03a9-11e5-bad4-005056be1f7a'),
('25a5ec12-260a-11e5-80c1-00155d3703e2', '93394f7a-159d-11e5-811a-00155d3703b3'),
('25a5ec13-260a-11e5-80c1-00155d3703e2', '93394f7a-159d-11e5-811a-00155d3703b3'),
('26aadb27-043d-11e5-bad4-005056be1f7a', 'b02db436-2a06-11e5-80c2-00155d3703e1'),
('26aadb29-043d-11e5-bad4-005056be1f7a', '07dad57c-039a-11e5-bad4-005056be1f7a'),
('26aadb2b-043d-11e5-bad4-005056be1f7a', '07dad57c-039a-11e5-bad4-005056be1f7a'),
('26d261f0-2c4b-11e5-80c2-00155d3703e1', '6aa6af7c-ff83-11e4-9228-005056be1f7a'),
('26d261f2-2c4b-11e5-80c2-00155d3703e1', '6aa6af7c-ff83-11e4-9228-005056be1f7a'),
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
('33efa3aa-1f2a-11e5-80c1-00155d3703e2', 'af166af3-2c49-11e5-80c2-00155d3703e1'),
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
('3dce9525-1f2a-11e5-80c1-00155d3703e2', 'af166af3-2c49-11e5-80c2-00155d3703e1'),
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
('47e5c871-043d-11e5-bad4-005056be1f7a', '836bdaeb-2a2a-11e5-80c2-00155d3703e1'),
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
('52e7f1d7-043d-11e5-bad4-005056be1f7a', '836bdaeb-2a2a-11e5-80c2-00155d3703e1'),
('5316bc9e-1b36-11e5-80c1-00155d3703e2', 'd929955e-03a8-11e5-bad4-005056be1f7a'),
('537d0fc7-039a-11e5-bad4-005056be1f7a', '8e3fd2e1-2a2a-11e5-80c2-00155d3703e1'),
('54062a42-2609-11e5-80c1-00155d3703e2', '2a4606c5-2ad5-11e5-811e-00155d3703b3'),
('54683e6f-2a28-11e5-80c2-00155d3703e1', '836bdaea-2a2a-11e5-80c2-00155d3703e1'),
('550d3de3-2b93-11e5-80c2-00155d3703e1', '97eb85d8-2a2a-11e5-80c2-00155d3703e1'),
('553116e0-2556-11e5-80c1-00155d3703e2', 'af166af3-2c49-11e5-80c2-00155d3703e1'),
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
('63760902-ff83-11e4-9228-005056be1f7a', '7ab9d88b-fe13-11e4-9228-005056be1f7a'),
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
('6c7775ed-1b3a-11e5-80c1-00155d3703e2', 'af166af3-2c49-11e5-80c2-00155d3703e1'),
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
('76eb725d-043e-11e5-bad4-005056be1f7a', 'a99df9d6-2a2a-11e5-80c2-00155d3703e1'),
('76f0c641-2b93-11e5-80c2-00155d3703e1', '97eb85d8-2a2a-11e5-80c2-00155d3703e1'),
('77d469b2-1b36-11e5-80c1-00155d3703e2', 'e057d072-03a8-11e5-bad4-005056be1f7a'),
('7878dd29-ff83-11e4-9228-005056be1f7a', '7ab9d88b-fe13-11e4-9228-005056be1f7a'),
('7878dd2a-ff83-11e4-9228-005056be1f7a', '836bdaeb-2a2a-11e5-80c2-00155d3703e1'),
('79206b59-03ad-11e5-bad4-005056be1f7a', 'dc30b997-2ae2-11e5-811e-00155d3703b3'),
('7ab9d88b-fe13-11e4-9228-005056be1f7a', '8e3fd2e1-2a2a-11e5-80c2-00155d3703e1'),
('7afde3c7-2c4b-11e5-80c2-00155d3703e1', '073345bc-1b0b-11e5-80c1-00155d3703e2'),
('7cb5f7e2-1f26-11e5-80c1-00155d3703e2', 'b69b7c64-03a9-11e5-bad4-005056be1f7a'),
('7ce3d8d3-2557-11e5-80c1-00155d3703e2', '93394f7a-159d-11e5-811a-00155d3703b3'),
('7ce3d8d4-2557-11e5-80c1-00155d3703e2', '93394f7a-159d-11e5-811a-00155d3703b3'),
('7d588ba2-043e-11e5-bad4-005056be1f7a', '46de7104-039a-11e5-bad4-005056be1f7a'),
('7eada471-0438-11e5-bad4-005056be1f7a', '836bdaeb-2a2a-11e5-80c2-00155d3703e1'),
('80fac221-1b38-11e5-80c1-00155d3703e2', '0c822838-03a9-11e5-bad4-005056be1f7a'),
('819bcac7-03a8-11e5-bad4-005056be1f7a', '8893d813-2af9-11e5-811e-00155d3703b3'),
('828d3720-03ad-11e5-bad4-005056be1f7a', 'af166af3-2c49-11e5-80c2-00155d3703e1'),
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
('88e775d2-2c4b-11e5-80c2-00155d3703e1', '9fa70d6e-2a2a-11e5-80c2-00155d3703e1'),
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
('8f7ea964-2c4b-11e5-80c2-00155d3703e1', '88e775d2-2c4b-11e5-80c2-00155d3703e1'),
('8f7ea965-2c4b-11e5-80c2-00155d3703e1', '88e775d2-2c4b-11e5-80c2-00155d3703e1'),
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
('9fa70d6a-2a2a-11e5-80c2-00155d3703e1', '97eb85d9-2a2a-11e5-80c2-00155d3703e1'),
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
('a99df9d7-2a2a-11e5-80c2-00155d3703e1', '836bdaea-2a2a-11e5-80c2-00155d3703e1'),
('aa1d7996-043e-11e5-bad4-005056be1f7a', '46de7104-039a-11e5-bad4-005056be1f7a'),
('aa47beb7-0441-11e5-bad4-005056be1f7a', 'b44b2b91-2a2a-11e5-80c2-00155d3703e1'),
('aa47beb9-0441-11e5-bad4-005056be1f7a', 'b44b2b91-2a2a-11e5-80c2-00155d3703e1'),
('aa6c0c5b-043f-11e5-bad4-005056be1f7a', '8c1d670d-039a-11e5-bad4-005056be1f7a'),
('aba134d6-043b-11e5-bad4-005056be1f7a', '07dad57c-039a-11e5-bad4-005056be1f7a'),
('ac8ae411-0435-11e5-bad4-005056be1f7a', 'f9bc6209-0399-11e5-bad4-005056be1f7a'),
('ad4a2a75-1f28-11e5-80c1-00155d3703e2', 'b69b7c64-03a9-11e5-bad4-005056be1f7a'),
('ad800502-2c57-11e5-80c2-00155d3703e1', '9fa70d6e-2a2a-11e5-80c2-00155d3703e1'),
('ae73d56b-ff83-11e4-9228-005056be1f7a', '9fa70d6a-2a2a-11e5-80c2-00155d3703e1'),
('af2b26f1-03a8-11e5-bad4-005056be1f7a', '8893d813-2af9-11e5-811e-00155d3703b3'),
('af50e83a-255a-11e5-80c1-00155d3703e2', '93394f7a-159d-11e5-811a-00155d3703b3'),
('b02db436-2a06-11e5-80c2-00155d3703e1', '07dad57c-039a-11e5-bad4-005056be1f7a'),
('b067512c-1f27-11e5-80c1-00155d3703e2', 'f732b015-03a8-11e5-bad4-005056be1f7a'),
('b12591dd-043e-11e5-bad4-005056be1f7a', 'b44b2b91-2a2a-11e5-80c2-00155d3703e1'),
('b3391594-043f-11e5-bad4-005056be1f7a', '8c1d670d-039a-11e5-bad4-005056be1f7a'),
('b44b2b91-2a2a-11e5-80c2-00155d3703e1', 'c11daf88-2a2a-11e5-80c2-00155d3703e1'),
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
('e6ea5159-043d-11e5-bad4-005056be1f7a', '8e3fd2e1-2a2a-11e5-80c2-00155d3703e1'),
('e70e507a-1f27-11e5-80c1-00155d3703e2', 'b69b7c64-03a9-11e5-bad4-005056be1f7a'),
('e84cc2d6-03aa-11e5-bad4-005056be1f7a', '7878dd2a-ff83-11e4-9228-005056be1f7a'),
('e8675698-1b35-11e5-80c1-00155d3703e2', 'd929955e-03a8-11e5-bad4-005056be1f7a'),
('e86fb2bc-03a8-11e5-bad4-005056be1f7a', '836bdaea-2a2a-11e5-80c2-00155d3703e1'),
('e8b4430e-2c49-11e5-80c2-00155d3703e1', 'a99df9d6-2a2a-11e5-80c2-00155d3703e1'),
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
('f4f8a3bf-1f29-11e5-80c1-00155d3703e2', 'af166af3-2c49-11e5-80c2-00155d3703e1'),
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
('2015-07-21 07:34:50', '2015-07-21 09:37:15', 1, 'raymefise', 'Гриненко Михаил (дизайнер)', 1, 0, 19, 'apelsin1c_2015.07.21_09.37.15.xml', 'apelsin1c_2015.07.21_07.34.50.sql', 'apelsin1c_2015.07.21_07.34.50.log', 'apelsin1c_2015.07.21_07.34.50.html');

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
('000b4673-f788-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 0,8кг Голубой', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 117, 61, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('030b5cff-f78e-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 1,9кг Бирюзовый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 84, 48, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('04834f06-93b0-11e3-82a4-005056be1f7b', 'Грунт-эмаль по ржавчине красный 2л  DALI', '569e2345-ff83-11e4-9228-005056be1f7a', 0, 52, 27, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('05caaed0-f790-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 20кг Охра', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 8, 0, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('05caaed2-f790-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 20кг серый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 6, 1, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('06e98e75-f78f-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 6кг Шоколадный', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 19, 12, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('076d2137-4380-11de-8f53-000e0c431b58', 'Грунт-эмаль по ржавчине черная 0,75л  DALI', '569e2345-ff83-11e4-9228-005056be1f7a', 0, 219, 80, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('076d2139-4380-11de-8f53-000e0c431b58', 'Грунт-эмаль по ржавчине черная 2л  DALI', '569e2345-ff83-11e4-9228-005056be1f7a', 0, 232, 65, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('076d213b-4380-11de-8f53-000e0c431b58', 'Грунт-эмаль по ржавчине белая 0,75л  DALI', '569e2345-ff83-11e4-9228-005056be1f7a', 0, 166, 55, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('076d213d-4380-11de-8f53-000e0c431b58', 'Грунт-эмаль по ржавчине белая 2л  DALI', '569e2345-ff83-11e4-9228-005056be1f7a', 0, 149, 46, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('076d213f-4380-11de-8f53-000e0c431b58', 'Грунт-эмаль по ржавчине коричневая 0,75л  DALI', '569e2345-ff83-11e4-9228-005056be1f7a', 0, 109, 50, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('076d2141-4380-11de-8f53-000e0c431b58', 'Грунт-эмаль по ржавчине коричневая 2л  DALI', '569e2345-ff83-11e4-9228-005056be1f7a', 0, 229, 50, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('076d2143-4380-11de-8f53-000e0c431b58', 'Грунт-эмаль по ржавчине красно-коричневая 0,75л  DALI', '569e2345-ff83-11e4-9228-005056be1f7a', 0, 139, 50, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('076d2145-4380-11de-8f53-000e0c431b58', 'Грунт-эмаль по ржавчине красно-коричневая 2л  DALI', '569e2345-ff83-11e4-9228-005056be1f7a', 0, 220, 45, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('076d2147-4380-11de-8f53-000e0c431b58', 'Грунт-эмаль по ржавчине серая 0,75л  DALI', '569e2345-ff83-11e4-9228-005056be1f7a', 0, 206, 60, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('076d2149-4380-11de-8f53-000e0c431b58', 'Грунт-эмаль по ржавчине серая 2л  DALI', '569e2345-ff83-11e4-9228-005056be1f7a', 0, 419, 54, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('076d214b-4380-11de-8f53-000e0c431b58', 'Грунт-эмаль по ржавчине зеленая 0,75л  DALI', '569e2345-ff83-11e4-9228-005056be1f7a', 0, 103, 49, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('076d214d-4380-11de-8f53-000e0c431b58', 'Грунт-эмаль по ржавчине зеленая 2л  DALI', '569e2345-ff83-11e4-9228-005056be1f7a', 0, 94, 51, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('079b44f8-f788-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 0,8кг Шоколадный', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 99, 59, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('09f4768d-f78e-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 1,9кг Зеленый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 131, 48, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('0d8fcbcd-99a8-11db-937f-000e0c431b59', 'Грунт акриловый "PARADE" G30  4л', '569e2345-ff83-11e4-9228-005056be1f7a', 0, 162, 29, 'Грунтовка акриловая глубокого проникновения. Высококачественная готовая к употреблению грунтовка с высокой проникающей способностью и отличными связующими свойствами.', 1),
('0d8fcbcf-99a8-11db-937f-000e0c431b59', 'Грунт акриловый "PARADE" G30 10л', '569e2345-ff83-11e4-9228-005056be1f7a', 0, 95, 25, 'Грунтовка акриловая глубокого проникновения. Высококачественная готовая к употреблению грунтовка с высокой проникающей способностью и отличными связующими свойствами.', 1),
('0d8fcbd1-99a8-11db-937f-000e0c431b59', 'Грунт под штукатурки "PARADE" Putzgrund G100 Белый 2,5л', '569e2345-ff83-11e4-9228-005056be1f7a', 0, 393, 46, 'Parade G100 Putzgrund — грунтовка для внутренних работ. Это основа любых отделочных работ. Грунтовки Парад для паркета предотвращают появления масел и воска, заполняют неровности и идеально подготавливают поверхность для нанесения лака. Они производятся на минеральной, акриловой, алкидной и других основах. Также улучшают структурные свойства гладких оснований. В зависимости от вида грунтовки перед применением разбавляются растворителем либо водой.', 1),
('0ff22851-f78f-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 6кг Розово-бежевый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 6, 9, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('1004a95c-f787-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 0,8кг Белый матовый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 144, 71, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('11d9ec94-f788-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 0,8кг Розово-бежевый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 132, 61, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('138c38bb-f78e-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 1,9кг Светло-зеленый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 17, 46, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('13ce3df2-93b0-11e3-82a4-005056be1f7b', 'Грунт-эмаль по ржавчине синий 2л  DALI', '569e2345-ff83-11e4-9228-005056be1f7a', 0, 53, 30, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('159d698c-e90f-11e0-9e45-3c4a92ed9378', 'Антисептик СЕНЕЖ  5кг', '569e2343-ff83-11e4-9228-005056be1f7a', 0, 106, 33, 'Антисептик «СЕНЕЖ» предназначен для усиленной защиты древесины от гниения, плесени, синевы и насекомых-древоточцев внутри помещений и на открытом воздухе в особо тяжелых условиях эксплуатации при активном и продолжительном воздействии атмосферной или почвенной влаги, длительном контакте с грунтом, органическими отходами, в том числе, в условиях тропического и тропического влажного климата самостоятельно или в качестве биозащитной грунтовки под ЛКМ.', 1),
('159d698e-e90f-11e0-9e45-3c4a92ed9378', 'Антисептик СЕНЕЖ 10кг', '569e2343-ff83-11e4-9228-005056be1f7a', 0, 216, 29, 'Антисептик «СЕНЕЖ» предназначен для усиленной защиты древесины от гниения, плесени, синевы и насекомых-древоточцев внутри помещений и на открытом воздухе в особо тяжелых условиях эксплуатации при активном и продолжительном воздействии атмосферной или почвенной влаги, длительном контакте с грунтом, органическими отходами, в том числе, в условиях тропического и тропического влажного климата самостоятельно или в качестве биозащитной грунтовки под ЛКМ.', 1),
('159d6990-e90f-11e0-9e45-3c4a92ed9378', 'Антисептик СЕНЕЖ БИО  5кг', '569e2343-ff83-11e4-9228-005056be1f7a', 0, 80, 30, 'Антисептик «СЕНЕЖ БИО» предназначен для усиленной защиты древесины от гниения, плесени, синевы и асекомых-древоточцев при эксплуатации в непосредственном контакте с человеком и домашними животными внутри помещений и на открытом воздухе в особо тяжелых условиях увлажнения, длительном воздействии атмосферной или почвенной влаги, при контакте с грунтом, органическими отходами, в том числе, в условиях тропического и тропического влажного климата самостоятельно или в качестве биозащитной грунтовки под ЛКМ.', 1),
('159d6992-e90f-11e0-9e45-3c4a92ed9378', 'Антисептик СЕНЕЖ БИО 10кг', '569e2343-ff83-11e4-9228-005056be1f7a', 0, 157, 27, 'Антисептик «СЕНЕЖ БИО» предназначен для усиленной защиты древесины от гниения, плесени, синевы и асекомых-древоточцев при эксплуатации в непосредственном контакте с человеком и домашними животными внутри помещений и на открытом воздухе в особо тяжелых условиях увлажнения, длительном воздействии атмосферной или почвенной влаги, при контакте с грунтом, органическими отходами, в том числе, в условиях тропического и тропического влажного климата самостоятельно или в качестве биозащитной грунтовки под ЛКМ.', 1),
('159d6994-e90f-11e0-9e45-3c4a92ed9378', 'СЕНЕЖ ОГНЕБИО  5кг', '569e2343-ff83-11e4-9228-005056be1f7a', 0, 55, 30, 'Средство «СЕНЕЖ ОГНЕБИО» предназначено для комплексной огнезащиты и биозащиты древесины - защиты от возгорания, распространения пламени, гниения, плесени, синевы и насекомых-древоточцев внутри помещений и на открытом воздухе (под навесом) в условиях гигроскопического и конденсационного увлажнения без контакта с грунтом, воздействия атмосферных осадков, почвенной влаги. Допускается применять «СЕНЕЖ ОГНЕБИО» для защиты элементов наружной службы, подверженных атмосферным осадкам, при последующем покрытии\nвлагостойким лакокрасочным материалом.', 1),
('159d6996-e90f-11e0-9e45-3c4a92ed9378', 'СЕНЕЖ ОГНЕБИО 10кг', '569e2343-ff83-11e4-9228-005056be1f7a', 0, 178, 25, 'Средство «СЕНЕЖ ОГНЕБИО» предназначено для комплексной огнезащиты и биозащиты древесины - защиты от возгорания, распространения пламени, гниения, плесени, синевы и насекомых-древоточцев внутри помещений и на открытом воздухе (под навесом) в условиях гигроскопического и конденсационного увлажнения без контакта с грунтом, воздействия атмосферных осадков, почвенной влаги. Допускается применять «СЕНЕЖ ОГНЕБИО» для защиты элементов наружной службы, подверженных атмосферным осадкам, при последующем покрытии\nвлагостойким лакокрасочным материалом.', 1),
('159d6998-e90f-11e0-9e45-3c4a92ed9378', 'СЕНЕЖ ОГНЕБИО ПРОФ  6кг', '569e2343-ff83-11e4-9228-005056be1f7a', 0, 57, 28, 'Средство «СЕНЕЖ ОГНЕБИО ПРОФ» предназначено для комплексной защиты древесины от горения, воспламенения, распространения пламени, гниения, плесени, синевы и насекомых-древоточцев внутри помещений и на открытом воздухе (под навесом) в условиях гигроскопического и конденсационного увлажнения без контакта с грунтом, воздействия атмосферных осадков, почвенной влаги.', 1),
('159d7e07-f790-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 20кг светло-серый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 9, 0, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('17a83679-f78f-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 6кг охра', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 0, 9, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('1a0a8b6b-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Бежевая  1кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 121, 69, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('1a0a8b6d-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Бежевая  2кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 142, 63, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('1a0a8b6f-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Бежевая 20кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 10, 6, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('1a0a8b71-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Бел. глянц.  0,9кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 603, 145, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('1a0a8b73-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Бел. глянц.  1,9кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 584, 112, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('1a0a8b75-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Бел. глянц. 20кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 102, 28, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('1a0a8b7b-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Бел. мат. 20кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 139, 25, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('1a0a8b7d-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Бирюза  1кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 103, 60, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('1a0a8b7f-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Бирюза  2кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 168, 62, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('1a0a8b81-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Бирюза 20кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 19, 6, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('1a0a8b83-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Вишневая  2кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 151, 54, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('1a0a8b85-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Вишневая  1кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 122, 56, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('1a0a8b87-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Вишневая 20кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 3, 5, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('1a0a8b89-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Голубая  1кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 152, 65, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('1a0a8b8b-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Голубая  2кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 203, 62, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('1a0a8b8d-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Голубая 20кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 26, 8, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('1a0a8b8f-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Желтая  1кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 233, 63, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('1a1ab87b-f78e-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 1,9кг Синий', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 165, 51, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('1b75918d-9fb8-11e3-8705-005056be1f7b', 'Эмаль акрил. универсальная Бел. мат. 0,9кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 83, 52, 'Образует глубокоматовую поверхность высокой степени белизны. Создает прочное влагостойкое, паропроницаемое и светостойкое покрытие. Не желтеет со временем. Отличается высокими декоративными и защитными свойствами, стойкая к мытью. Готова к применению.', 1),
('1bd57597-93b0-11e3-82a4-005056be1f7b', 'Грунт-эмаль по ржавчине синий 0,75л  DALI', '569e2345-ff83-11e4-9228-005056be1f7a', 0, 24, 37, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('1d967145-f787-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 0,8кг серебро', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 51, 42, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('1f4ff69d-f78f-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 6кг серый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 14, 12, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('206ff829-f790-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 20кг черный', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 12, 1, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('20b7f87c-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Желтая  2кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 227, 62, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('20b7f87e-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Желтая 20кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 21, 5, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('20b7f880-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Зеленая  1кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 168, 67, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('20b7f882-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Зеленая  2кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 234, 71, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('20b7f884-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Зеленая 20кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 15, 6, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('20b7f886-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Коричневая  1кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 160, 61, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('20b7f888-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Коричневая  2кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 204, 58, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('20b7f88a-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Коричневая 20кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 11, 6, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('20b7f88c-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Красная  1кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 186, 62, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('20b7f88e-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Красная  2кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 147, 60, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('20b7f890-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Красная 20кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 10, 5, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('20b7f896-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Оранжевая  1кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 111, 60, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('20b7f898-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Оранжевая  2кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 136, 60, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('20b7f89a-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Охристо-желтая  1кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 0, 56, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('20b7f89e-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Св-голубая  1кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 110, 59, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('20b7f8a0-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Св-голубая  2 кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 105, 56, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('20b7f8a2-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Св-голубая  20кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 21, 6, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('20b7f8a4-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Серая  1кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 176, 70, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('20b7f8a6-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Серая  2кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 313, 68, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('20b7f8a8-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Серая 20кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 30, 6, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('20b7f8aa-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Синяя  1кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 154, 66, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('20b7f8ac-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Синяя  2кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 197, 68, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('20b7f8ae-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Синяя 20кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 36, 5, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('20b7f8b0-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Темно-зеленая  1кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 103, 59, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('20b7f8b2-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Темно-зеленая 2 кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 100, 56, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('20b7f8b4-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Темно-зеленая 20кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 14, 8, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('20b7f8b6-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Фисташковая  1кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 2, 59, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('20b7f8b8-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Фисташковая  2 кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 0, 56, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('20b7f8bc-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Черная  0,9кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 384, 102, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('20b7f8be-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Черная  1,9кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 210, 99, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('20b7f8c0-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Черная 20кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 26, 13, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('20b7f8c2-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Шоколадно-коричневая 1кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 229, 60, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('20b7f8c4-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Ярко-зел.  1кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 153, 69, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('20b7f8c6-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Ярко-зел.  2кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 274, 70, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('20b7f8c8-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-115 (Лакра) Ярко-зел. 20кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 9, 7, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('20b7f8d0-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-266 (Лакра) Желто-кор.  1кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 127, 91, 'Рекомендуется для покрытия окрашенных и неокрашенных деревянных полов внутри помещения. Обладает хорошими декоративными свойствами, укрывистостью и прочным сцеплением с окрашиваемой поверхностью.', 1),
('20b7f8d2-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-266 (Лакра) Желто-кор.  2кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 319, 76, 'Рекомендуется для покрытия окрашенных и неокрашенных деревянных полов внутри помещения. Обладает хорошими декоративными свойствами, укрывистостью и прочным сцеплением с окрашиваемой поверхностью.', 1),
('20b7f8d4-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-266 (Лакра) Желто-кор. 20кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 7, 0, 'Рекомендуется для покрытия окрашенных и неокрашенных деревянных полов внутри помещения. Обладает хорошими декоративными свойствами, укрывистостью и прочным сцеплением с окрашиваемой поверхностью.', 1),
('20b7f8d6-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-266 (Лакра) Золотисто-кор.  1кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 174, 91, 'Рекомендуется для покрытия окрашенных и неокрашенных деревянных полов внутри помещения. Обладает хорошими декоративными свойствами, укрывистостью и прочным сцеплением с окрашиваемой поверхностью.', 1),
('20b7f8d8-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-266 (Лакра) Золотисто-кор. 20кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 0, 0, 'Рекомендуется для покрытия окрашенных и неокрашенных деревянных полов внутри помещения. Обладает хорошими декоративными свойствами, укрывистостью и прочным сцеплением с окрашиваемой поверхностью.', 1),
('20b7f8da-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-266 (Лакра) Золотисто-кор.  2кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 307, 76, 'Рекомендуется для покрытия окрашенных и неокрашенных деревянных полов внутри помещения. Обладает хорошими декоративными свойствами, укрывистостью и прочным сцеплением с окрашиваемой поверхностью.', 1),
('20b7f8dc-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-266 (Лакра) Красно-кор.  1кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 114, 83, 'Рекомендуется для покрытия окрашенных и неокрашенных деревянных полов внутри помещения. Обладает хорошими декоративными свойствами, укрывистостью и прочным сцеплением с окрашиваемой поверхностью.', 1),
('20b7f8de-99a8-11db-937f-000e0c431b59', 'Эмаль ПФ-266 (Лакра) Красно-кор.  2кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 209, 75, 'Рекомендуется для покрытия окрашенных и неокрашенных деревянных полов внутри помещения. Обладает хорошими декоративными свойствами, укрывистостью и прочным сцеплением с окрашиваемой поверхностью.', 1),
('211dadff-f788-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 0,8кг охра', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 93, 59, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('2133814d-f78e-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 1,9кг Голубой', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 115, 48, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('23b6c6e7-f789-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 1,9кг Белая', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 254, 61, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('2461ad51-9fb8-11e3-8705-005056be1f7b', 'Эмаль акрил. универсальная Бел. мат. 2,5кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 41, 34, 'Образует глубокоматовую поверхность высокой степени белизны. Создает прочное влагостойкое, паропроницаемое и светостойкое покрытие. Не желтеет со временем. Отличается высокими декоративными и защитными свойствами, стойкая к мытью. Готова к применению.', 1),
('25a027ef-9e45-11e1-9d3e-005056be3bd8', 'Эмаль ПФ-115 (Лакра) Кремовая  1кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 112, 60, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('25a027f1-9e45-11e1-9d3e-005056be3bd8', 'Эмаль ПФ-115 (Лакра) Кремовая  2кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 96, 57, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('277ee1ed-f788-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 0,8кг серый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 141, 55, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('28b335ed-f78f-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 6кг светло-серый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 11, 12, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('2997b29e-f78e-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 1,9кг Шоколадный', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 83, 46, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('299c6ffe-f790-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 20кг Красно-коричневый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 14, 0, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('2cbf73b5-f789-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 1,9кг Белый матовый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 173, 54, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('2ced73cf-59ef-11e0-894e-000e0c431b58', 'Растворитель Cosmofen-5 1л', '72429777-ff83-11e4-9228-005056be1f7a', 0, 0, 0, 'Cпециальный очиститель па основе растворителя с размягчением поверхности для очистки от сильных загрязнений с проникновением в поверхностные слои частиц масла, изношенной резины, остатков клея, свежих остатков размягченного ПВХ и других загрязнений. Применяют для очистки материалов плит из ПВХ, других твердых и вспененных пластиковых плит и профилей из ПВХ.', 1),
('2eadcbef-99a8-11db-937f-000e0c431b59', 'Керосин 1л', '72429777-ff83-11e4-9228-005056be1f7a', 0, 209, 124, 'Для растворения и разбавления масляных ЛКМ, для горения в осветительных и нагревательных бытовых приборах,для промывки двигателей.', 1),
('2eadcbf1-99a8-11db-937f-000e0c431b59', 'Керосин 5л', '72429777-ff83-11e4-9228-005056be1f7a', 0, 107, 45, 'Для растворения и разбавления масляных ЛКМ, для горения в осветительных и нагревательных бытовых приборах,для промывки двигателей.', 1),
('2eadcbf3-99a8-11db-937f-000e0c431b59', 'Керосин 0,5л', '72429777-ff83-11e4-9228-005056be1f7a', 0, 224, 174, 'Для растворения и разбавления масляных ЛКМ, для горения в осветительных и нагревательных бытовых приборах,для промывки двигателей.', 1),
('2eadcbfc-99a8-11db-937f-000e0c431b59', 'Растворитель 646 0,5л', '72429777-ff83-11e4-9228-005056be1f7a', 0, 367, 256, 'Растворитель предназначен для разбавления лакокрасочных материалов и шпатлевок на основе: нитратоцелюлозных, нитратоцелюлозно-глифталевых, эпоксидных, нитратцелюлозно-эпоксидных, мочевино (меламино) формальдегидных, кремнеорганических (НЦ, ЭП, КО, МЧ, МС) и других лакокрасочных материалов.', 1),
('2eadcbfe-99a8-11db-937f-000e0c431b59', 'Растворитель 646 1л', '72429777-ff83-11e4-9228-005056be1f7a', 0, 353, 235, 'Растворитель предназначен для разбавления лакокрасочных материалов и шпатлевок на основе: нитратоцелюлозных, нитратоцелюлозно-глифталевых, эпоксидных, нитратцелюлозно-эпоксидных, мочевино (меламино) формальдегидных, кремнеорганических (НЦ, ЭП, КО, МЧ, МС) и других лакокрасочных материалов.', 1),
('2eadcc00-99a8-11db-937f-000e0c431b59', 'Растворитель 646 5л', '72429777-ff83-11e4-9228-005056be1f7a', 0, 164, 109, 'Растворитель предназначен для разбавления лакокрасочных материалов и шпатлевок на основе: нитратоцелюлозных, нитратоцелюлозно-глифталевых, эпоксидных, нитратцелюлозно-эпоксидных, мочевино (меламино) формальдегидных, кремнеорганических (НЦ, ЭП, КО, МЧ, МС) и других лакокрасочных материалов.', 1),
('2eadcc10-99a8-11db-937f-000e0c431b59', 'Растворитель 650 0,5л', '72429777-ff83-11e4-9228-005056be1f7a', 0, 236, 198, 'Растворение и разбавление нитроцеллюлозных,алкидных эмалей. Представляет собой смеси летучих органических растворителей. Растворитель 650 предназначен для лакокрасочной и других отраслей промышленности для разбавления эмалей для легковых автомобилей.', 1),
('2eadcc2e-99a8-11db-937f-000e0c431b59', 'Уайт-спирит 0,5л', '72429777-ff83-11e4-9228-005056be1f7a', 0, 746, 364, 'Растворение и разбавление масляных ЛКМ,грунтовок,олифы,битума,резинобитумной автомобильной мастики.Смывка автоконсерванта и битумных пятен. Представляет собой высококипящую фракцию бензина, применяется в лакокрасочной промышленности, в производстве олиф и других отраслях промышленности.', 1),
('2eadcc30-99a8-11db-937f-000e0c431b59', 'Уайт-спирит 1л', '72429777-ff83-11e4-9228-005056be1f7a', 0, 628, 261, 'Растворение и разбавление масляных ЛКМ,грунтовок,олифы,битума,резинобитумной автомобильной мастики.Смывка автоконсерванта и битумных пятен. Представляет собой высококипящую фракцию бензина, применяется в лакокрасочной промышленности, в производстве олиф и других отраслях промышленности.', 1),
('2eadcc32-99a8-11db-937f-000e0c431b59', 'Уайт-спирит 5л', '72429777-ff83-11e4-9228-005056be1f7a', 0, 407, 114, 'Используется для растворение и разбавление масляных ЛКМ,грунтовок,олифы,битума,резинобитумной автомобильной мастики.Смывка автоконсерванта и битумных пятен. Представляет собой высококипящую фракцию бензина, применяется в лакокрасочной промышленности, в производстве олиф и других отраслях промышленности.', 1),
('30047f82-f788-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 0,8кг светло-серый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 114, 59, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('3114fa55-f78f-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 6кг черный', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 25, 12, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('3442e089-0125-11e4-8695-005056be1f7b', 'Эмаль ПФ-115 Inter 2,2кг серебро', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 3, 33, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('3479e733-bce7-11e4-a1f3-005056be1f7b', 'Молотковая грунт-эмаль по ржавчине серебристая 2 л  DALI', '569e2345-ff83-11e4-9228-005056be1f7a', 0, 0, 0, 'Применяется по любым металлическим поверхностям: решетки, ограды, гаражи, различные металлоконструкции, автомобильные детали и др. внутри помещений и в условиях атмосферного воздействия.', 1),
('3526e5c9-f78e-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 1,9кг Розово-бежевый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 127, 48, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('354fea51-be93-11e0-b25c-000e0c431b58', 'Антисептик НЕВЫМЫВАЕМЫЙ Зелест Хортос  5кг', '569e2343-ff83-11e4-9228-005056be1f7a', 0, 39, 21, 'Для наружных и внутренних работ. Антисептик для профессиональной и долговременной защиты древесины от гниения, плесневых и окрашивающих грибов, древоточцев в условиях особо интенсивного и продолжительного увлажнения, в длительном контакте с грунтом и водой, при эксплуатации в контакте с растениями, человеком, домашними животными. ', 1),
('354fea53-be93-11e0-b25c-000e0c431b58', 'Антисептик НЕВЫМЫВАЕМЫЙ Зелест Хортос 10кг', '569e2343-ff83-11e4-9228-005056be1f7a', 0, 55, 19, 'Для наружных и внутренних работ. Антисептик для профессиональной и долговременной защиты древесины от гниения, плесневых и окрашивающих грибов, древоточцев в условиях особо интенсивного и продолжительного увлажнения, в длительном контакте с грунтом и водой, при эксплуатации в контакте с растениями, человеком, домашними животными. ', 1),
('354fea55-be93-11e0-b25c-000e0c431b58', 'Антисептик ДЛЯ ПОМЕЩЕНИЙ Зелест Форис   5кг', '569e2343-ff83-11e4-9228-005056be1f7a', 0, 31, 21, 'Для наружных и внутренних работ. Антисептик для надежной и экологичной защиты деревянных конструкций от гниения плесени, «синевы», насекомых древоточцев в условиях конденсационного и гигроскопического увлажнения без контакта с грунтом и атмосферными осадками внутри помещений и под навесом. ', 1),
('354fea57-be93-11e0-b25c-000e0c431b58', 'Антисептик ДЛЯ ПОМЕЩЕНИЙ Зелест Форис 10кг', '569e2343-ff83-11e4-9228-005056be1f7a', 0, 31, 19, 'Для наружных и внутренних работ. Антисептик для надежной и экологичной защиты деревянных конструкций от гниения плесени, «синевы», насекомых древоточцев в условиях конденсационного и гигроскопического увлажнения без контакта с грунтом и атмосферными осадками внутри помещений и под навесом. ', 1),
('380e3f79-f788-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 0,8кг черный', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 231, 71, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('3bfb5c69-9fb8-11e3-8705-005056be1f7b', 'Эмаль акрил. универсальная Бел. п/глянц. 0,9кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 81, 52, 'Образует глубокоматовую поверхность высокой степени белизны. Создает прочное влагостойкое, паропроницаемое и светостойкое покрытие. Не желтеет со временем. Отличается высокими декоративными и защитными свойствами, стойкая к мытью. Готова к применению.', 1),
('3d601a65-f78f-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 6кг Красно-коричневый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 13, 9, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('3d822ed4-f78e-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 1,9кг охра', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 80, 45, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('41f9a64a-f788-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 0,8кг Красно-коричневый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 86, 59, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('441a7da1-9fb8-11e3-8705-005056be1f7b', 'Эмаль акрил. универсальная Бел. п/глянц. 2,4кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 65, 34, 'Образует глубокоматовую поверхность высокой степени белизны. Создает прочное влагостойкое, паропроницаемое и светостойкое покрытие. Не желтеет со временем. Отличается высокими декоративными и защитными свойствами, стойкая к мытью. Готова к применению.', 1),
('45794d11-f78e-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 1,9кг серый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 125, 48, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('46582c85-c991-11e1-8a6e-005056be3bd8', 'Антисептик СЕНЕЖ ЭКОБИО 10кг', '569e2343-ff83-11e4-9228-005056be1f7a', 0, 0, 0, 'Антисептик «СЕНЕЖ ЭКОБИО» предназначен для защиты древесины от гниения, плесени, синевы и насекомых-древоточцев внутри помещений и на открытом воздухе (под навесом) в условиях гигроскопического и конденсационного увлажнения без контакта с грунтом, воздействия атмосферных осадков, почвенной влаги самостоятельно или в качестве биозащитной грунтовки под ЛКМ. Допускается применять «СЕНЕЖ ЭКОБИО» для защиты элементов наружной службы, подверженных атмосферным осадкам, при последующем покрытии влагостойким лакокрасочным материалом.', 1),
('46582c87-c991-11e1-8a6e-005056be3bd8', 'Антисептик СЕНЕЖ Аквадекор (орех) 9кг', '569e2343-ff83-11e4-9228-005056be1f7a', 0, 0, 0, 'Антисептик «СЕНЕЖ АКВАДЕКОР» предназначен для долговременной защиты древесины от атмосферных осадков, плесневых, деревоокрашивающих и дереворазрушающих грибов, водорослей  и насекомых-древоточцев, а также декоративной отделки под ценные породы. Впервые среди отечественных антисептиков «СЕНЕЖ АКВАДЕКОР» содержит композицию активных УФ фильтров, восков и натуральных масел для длительной защиты от атмосферных воздействий.', 1),
('46efb407-dea8-11e4-9d9b-005056be1f7b', 'СЕНЕЖ ОГНЕБИО ПРОФ 23кг', '569e2343-ff83-11e4-9228-005056be1f7a', 0, 149, 8, 'Средство «СЕНЕЖ ОГНЕБИО ПРОФ» предназначено для комплексной защиты древесины от горения, воспламенения, распространения пламени, гниения, плесени, синевы и насекомых-древоточцев внутри помещений и на открытом воздухе (под навесом) в условиях гигроскопического и конденсационного увлажнения без контакта с грунтом, воздействия атмосферных осадков, почвенной влаги.', 1),
('47de42e5-f789-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 6кг Белая', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 7, 14, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('4dd1de14-f78e-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 1,9кг светло-серый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 100, 46, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('4ed5aaa1-f789-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 6кг Белый матовый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 18, 12, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('55c10657-f78e-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 1,9кг черный', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 82, 57, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('5ed5699a-f78e-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 1,9кг Красно-коричневый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 97, 46, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('5fde6d12-f789-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 6кг серебро', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 0, 0, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('612d8834-6137-11e1-96bd-005056be3bd8', 'Эмаль для радиаторов Лакра акриловая глянец. 0,9кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 136, 41, 'ЭМАЛЬ АКРИЛОВАЯ ДЛЯ РАДИАТОРОВ ОТОПЛЕНИЯ Высококачественная термостойкая водоразбавляемая эмаль на основе акриловой дисперсии. Для внутренних и наружных работ. Устойчива к высоким температурам (до 100°С), к пожелтению, к действию воды, атмосферных осадков и моющих средств. Быстро высыхает. Образует глянцевую поверхность высокой степени белизны. Обладает отличной укрывистостью и адгезией. Отличается высокими декоративными и защитными свойствами, стойкая к мытью. Готова к применению.', 1),
('612d8856-6137-11e1-96bd-005056be3bd8', 'Огнебиозащита  Зелест Экопирол Форте (I и II гр.) 12 кг', '569e2343-ff83-11e4-9228-005056be1f7a', 0, 32, 22, 'От воспламенения, распространения пламени, а так же гниения, плесени, синевы, насекомых- древоточцев в условиях конденсационного и гигроскопического увлажнения без контакта с грунтом и атмосферными осадками. ', 1),
('612d8858-6137-11e1-96bd-005056be3bd8', 'Огнебиозащита  Зелест Экопирол Форте (I и II гр.) 25 кг', '569e2343-ff83-11e4-9228-005056be1f7a', 0, 53, 23, 'От воспламенения, распространения пламени, а так же гниения, плесени, синевы, насекомых- древоточцев в условиях конденсационного и гигроскопического увлажнения без контакта с грунтом и атмосферными осадками. ', 1),
('6260610c-29f2-11e4-816f-005056be1f7b', '"ЭКОДОМ огнебио проф"  23 кг', '569e2343-ff83-11e4-9228-005056be1f7a', 0, 39, 9, 'Состав предназначен для биозащиты деревянных и других аналогичных материалов, а также готовых конструкций и изделий из них, эксплуатируемых в условиях умеренного увлажнения, от образования плесени, гнили, синевы и от насекомых внутри помещений или снаружи (под навесом) - VIII класс службы по ГОСТ 20022.2, глубокая пропитка).', 1),
('680965ab-f789-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 20кг Белая', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 11, 8, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('727c8145-f789-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 20кг Белый матовый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 31, 7, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('747ef690-551c-11dc-beb4-000e0c431b58', 'Эмаль ПФ-115 (Лакра) Бел. мат.  2кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 285, 104, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('763735c0-2a2b-11e2-9366-005056be3bd8', 'Грунт глубокого проникновения Tiefgrund  5л', 'fa733516-ff83-11e4-9228-005056be1f7a', 0, 375, 221, 'Идеально подходит для предварительной обработки очень пористых оснований с целью улучшения адгезии и укрепления поверхности перед укладкой керамической плитки, нанесением штукатурок, шпатлевок, наливных полов и стяжек, а так же перед покраской. Благодаря уникальной рецептуре грунтовка глубокого проникания Альмира обладает исключительной  проникающей способности идеальна для сильно впитывающих оснований.', 1),
('7ab6caa7-b1ee-11e0-aa21-000e0c431b58', 'Спецгрунт PARADE Reanimator G40  по ст. покрытиям 10л', '569e2345-ff83-11e4-9228-005056be1f7a', 0, 17, 12, 'Используется для грунтования различных видов поверхностей. Не требует механического удаления старых эмалевых покрытий. Обеспечивает прочное соединение основания и лакокрасочных материалов, выравнивает тон поверхности, улучшает впитывающие возможности поверхности, препятствует образованию коррозии. Образует полупрозрачное слегка шероховатое покрытие.', 1),
('7c1e70d5-5a9d-11dc-be42-000e0c431b58', 'Эмаль ПФ-115 (Лакра) Бел. мат.  1кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 254, 114, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('7e531df3-b5f5-11e1-83ba-005056be3bd8', 'Очиститель Cosmofen-20 1л прозр.', '72429777-ff83-11e4-9228-005056be1f7a', 0, 38, 30, 'Жидкое чистящее средство, не растворяющее поверхности. Применяется в качестве не размягчающего средства с антистатиком для очистки профилей из твердого ПХВ, профилей, кашированных пленкой из ренолита и профилей из полиуретана. Особенно пригоден для очистки от пыли, остатков клея с защитной пленки, жира, следов резины, свежей полиуретановой пены и свежих остатков размягченного ПВХ, а также следов шприцмашин для дегтя или битума. Применяемый антистатик эффективно предотвращает необходимость скорой повторной очистки от загрязнений поверхностей профиля и плит ПВХ.', 1),
('7ff8df4e-f789-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 20кг серебро', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 0, 0, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('82ebcce8-bce7-11e4-a1f3-005056be1f7b', 'Молотковая грунт-эмаль по ржавчине серебристая 10 л  DALI', '569e2345-ff83-11e4-9228-005056be1f7a', 0, 0, 0, 'Применяется по любым металлическим поверхностям: решетки, ограды, гаражи, различные металлоконструкции, автомобильные детали и др. внутри помещений и в условиях атмосферного воздействия.', 1),
('8522912f-f3fb-11e4-9746-005056be1f7b', 'Грунт-эмаль по ржавчине синяя 10л  DALI', '569e2345-ff83-11e4-9228-005056be1f7a', 0, 0, 0, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('897bb5a6-b0fa-11e3-b34d-005056be1f7b', 'Растворитель для эмалей и красок', '72429777-ff83-11e4-9228-005056be1f7a', 0, 2, 25, 'Рекомендуется для разбавления финишных покрытий Parade Z1, Parade F50, Parade F51.Также применяется для разбавления эмалей и красок на основе эпоксидных, виниловых, акриловых, кремнийорганических полимеров, нитроцеллюлозы, хлоркаучука, меламино- и мочевиноформальдегидных материалов, для очистки инструмента после их нанесения и обезжиривания поверхности. Тип растворителя: специальный растворитель.', 1),
('89cb1aab-b1c3-11e0-aa21-000e0c431b58', 'Спецгрунт PARADE Reanimator G40  по ст. покрытиям  2,5л', '569e2345-ff83-11e4-9228-005056be1f7a', 0, 23, 23, 'Используется для грунтования различных видов поверхностей. Не требует механического удаления старых эмалевых покрытий. Обеспечивает прочное соединение основания и лакокрасочных материалов, выравнивает тон поверхности, улучшает впитывающие возможности поверхности, препятствует образованию коррозии. Образует полупрозрачное слегка шероховатое покрытие.', 1),
('9291c63a-5ab3-11dc-be42-000e0c431b58', 'Эмаль универсальная белая глянцевая 520 мл.', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 108, 61, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \n', 1),
('9291c63c-5ab3-11dc-be42-000e0c431b58', 'Эмаль универсальная черная глянцевая 520 мл.', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 132, 61, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \n', 1),
('9291c63e-5ab3-11dc-be42-000e0c431b58', 'Эмаль универсальная красная 520 мл.', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 119, 53, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \n', 1),
('9291c640-5ab3-11dc-be42-000e0c431b58', 'Эмаль универсальная вишневая 520 мл.', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 59, 36, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \n', 1),
('95aabdce-0d99-11dc-bdd4-000e0c431b58', 'Клей ПВА Мастер универсальный  0,9кг  ("Лакра")', '3df545ee-03aa-11e5-bad4-005056be1f7a', 0, 140, 66, 'Рекомендуется для склеивания изделий из дерева, не подвергающихся механическим нагрузкам, кожи, картона, бумаги и т.п.', 1),
('9bd479ef-b369-11e4-a26a-005056be1f7b', 'Грунт БЕТОН-КОНТАКТ 20кг', 'fa733516-ff83-11e4-9228-005056be1f7a', 0, 57, 38, 'Предназначена для обработки гладких минеральных, преимущественно бетонных, вертикальных оснований перед нанесением цементно-песчаных и гипсовых штукатурок и шпаклевок, а так же плиточных клеев, в т.ч. торговой марки Ceresit, при внутренних работах.', 1),
('a1a9b4a6-f787-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 0,8кг Оранжевый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 159, 61, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('a48048ba-ec8c-11e3-9eab-005056be1f7b', 'Ксилол 0,5л', '72429777-ff83-11e4-9228-005056be1f7a', 0, 80, 29, 'Используется для разбавления до рабочей вязкости при нанесении краскораспылителем различных автоэмалей, а также некоторых лаков,красок,эмалей и грунтовок на алкидной (ПФ, ГФ) ,эпоксидной (ЭП) и битумной (БТ) основах.', 1),
('ab383e71-f78f-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 20кг Оранжевый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 10, 0, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('ad93144b-f787-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 0,8кг Желтый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 179, 61, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('ae39d1eb-cf86-11e3-a00d-005056be1f7b', 'Эмаль по металлу Parade Z1 гладкая  Золотой 2,5л', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 4, 17, '', 1),
('b08b1d7e-ec8c-11e3-9eab-005056be1f7b', 'Сольвент 0,5л', '72429777-ff83-11e4-9228-005056be1f7a', 0, 94, 58, 'Предназначен для растворения масляных, алкидных, алкидно-фенольных лаков, красок, эмалей, а также для разбавления масел, битумов, каучуков, меламиноалкидных ЛКМ.', 1),
('b182dc4f-f994-11e2-98ef-005056be3574', 'Молотковая грунт-эмаль по ржавчине черная 0,75л  DALI', '569e2345-ff83-11e4-9228-005056be1f7a', 0, 59, 34, 'Применяется по любым металлическим поверхностям: решетки, ограды, гаражи, различные металлоконструкции, автомобильные детали и др. внутри помещений и в условиях атмосферного воздействия.', 1),
('b182dc51-f994-11e2-98ef-005056be3574', 'Молотковая грунт-эмаль по ржавчине зеленая 0,75л  DALI', '569e2345-ff83-11e4-9228-005056be1f7a', 0, 45, 34, 'Применяется по любым металлическим поверхностям: решетки, ограды, гаражи, различные металлоконструкции, автомобильные детали и др. внутри помещений и в условиях атмосферного воздействия.', 1),
('b3740593-f78f-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 20кг Желтый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 15, 1, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('b54ba125-f78e-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 6кг Оранжевый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 14, 9, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('b5957aa3-f787-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 0,8кг Вишневый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 145, 61, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('ba1232df-ec8c-11e3-9eab-005056be1f7b', 'Растворитель Р-4 0,5л', '72429777-ff83-11e4-9228-005056be1f7a', 0, 352, 29, 'Представляет собой смеси летучих органических жидкостей. Растворитель Р-4 предназначен для разбавления лакокрасочных материалов на основе поливинилхлоридных хлорированных смол ПСХ ЛС и ПСХ ЛН, сополимеров винилхлорида, эпоксидных смол и других пленкообразующих веществ.', 1),
('bc816f7f-f78f-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 20кг Вишневый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 5, 0, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('beb861cb-f787-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 0,8кг Красный', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 168, 61, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('bef8d7ea-f78e-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 6кг Желтый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 9, 12, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('c2d90e40-f78f-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 20кг Красный', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 6, 0, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('c4df9e0d-00c0-11e2-a554-005056be3bd8', 'Молотковая грунт-эмаль по ржавчине коричневая 0,75л  DALI', '569e2345-ff83-11e4-9228-005056be1f7a', 0, 77, 31, 'Применяется по любым металлическим поверхностям: решетки, ограды, гаражи, различные металлоконструкции, автомобильные детали и др. внутри помещений и в условиях атмосферного воздействия.', 1),
('c4df9e0f-00c0-11e2-a554-005056be3bd8', 'Молотковая грунт-эмаль по ржавчине медная 0,75л  DALI', '569e2345-ff83-11e4-9228-005056be1f7a', 0, 22, 31, 'Применяется по любым металлическим поверхностям: решетки, ограды, гаражи, различные металлоконструкции, автомобильные детали и др. внутри помещений и в условиях атмосферного воздействия.', 1),
('c4df9e11-00c0-11e2-a554-005056be3bd8', 'Молотковая грунт-эмаль по ржавчине серебристая 0,75л  DALI', '569e2345-ff83-11e4-9228-005056be1f7a', 0, 63, 31, 'Применяется по любым металлическим поверхностям: решетки, ограды, гаражи, различные металлоконструкции, автомобильные детали и др. внутри помещений и в условиях атмосферного воздействия.', 1),
('c4df9e13-00c0-11e2-a554-005056be3bd8', 'Молотковая грунт-эмаль по ржавчине серая 0,75л  DALI', '569e2345-ff83-11e4-9228-005056be1f7a', 0, 42, 31, 'Применяется по любым металлическим поверхностям: решетки, ограды, гаражи, различные металлоконструкции, автомобильные детали и др. внутри помещений и в условиях атмосферного воздействия.', 1),
('c6d784e3-f78e-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 6кг Вишневый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 13, 12, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('c9d25e2b-f787-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 0,8кг Бирюзовый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 147, 61, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('ca79b0fb-f78f-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 20кг Бирюзовый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 7, 0, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('ce1ffcf9-f78e-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 6кг Красный', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 18, 12, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('cf6aa526-48b8-11dd-9342-000e0c431b58', 'Эмаль универсальная бронза 520 мл.', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 78, 48, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \n', 1),
('d0659fe4-f787-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 0,8кг Зеленый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 229, 63, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('d1aa2ade-a3ef-11e1-ad4e-005056be3bd8', 'Очиститель Cosmofen-10 1л', '72429777-ff83-11e4-9228-005056be1f7a', 0, 26, 28, 'Очиститель нерастворяющий с антистатиком применяется для профессиональной чистки профелей из жесткого ПВХ, плат из вспененного твердого ПВХ, полиуретана и профелей кешированных ренолитной пленкой. Особенно хорош для очистки поверхности от пыли, остатков защитной пленки, жирных карандашей, следов резины, свежей полиуретановой пены и свежих остатков герметиков, таких как смола/битум. Оказывает хорошее действие на многие синтетические поверхности и в сочетании с антистатиком особенно хорош для выставочных и рекламных конструкций.', 1),
('d1eaa4c2-f78f-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 20кг Зеленый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 3, 0, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('d3f8665d-cce1-11e2-b7e6-005056be3574', '"ЭКОДОМ био" антисептический состав 5кг', '569e2343-ff83-11e4-9228-005056be1f7a', 0, 33, 23, 'Состав предназначен для биозащиты деревянных и других аналогичных материалов, а также готовых конструкций и изделий из них, эксплуатируемых в условиях умеренного увлажнения, от образования плесени, гнили, синевы и от насекомых внутри помещений или снаружи (под навесом) - VIII класс службы по ГОСТ 20022.2, глубокая пропитка).', 1),
('d3f8665f-cce1-11e2-b7e6-005056be3574', '"ЭКОДОМ био" антисептический состав 10кг', '569e2343-ff83-11e4-9228-005056be1f7a', 0, 50, 21, 'Состав предназначен для биозащиты деревянных и других аналогичных материалов, а также готовых конструкций и изделий из них, эксплуатируемых в условиях умеренного увлажнения, от образования плесени, гнили, синевы и от насекомых внутри помещений или снаружи (под навесом) - VIII класс службы по ГОСТ 20022.2, глубокая пропитка).', 1),
('d3f86661-cce1-11e2-b7e6-005056be3574', '"ЭКОДОМ био проф" антисептический состав 5кг', '569e2343-ff83-11e4-9228-005056be1f7a', 0, 36, 23, 'Состав предназначен для биозащиты деревянных и других аналогичных материалов, а также готовых конструкций и изделий из них, эксплуатируемых в условиях умеренного увлажнения, от образования плесени, гнили, синевы и от насекомых внутри помещений или снаружи (под навесом) - VIII класс службы по ГОСТ 20022.2, глубокая пропитка).', 1),
('d3f86663-cce1-11e2-b7e6-005056be3574', '"ЭКОДОМ био проф" антисептический состав 10кг', '569e2343-ff83-11e4-9228-005056be1f7a', 0, 47, 21, 'Состав предназначен для биозащиты деревянных и других аналогичных материалов, а также готовых конструкций и изделий из них, эксплуатируемых в условиях умеренного увлажнения, от образования плесени, гнили, синевы и от насекомых внутри помещений или снаружи (под навесом) - VIII класс службы по ГОСТ 20022.2, глубокая пропитка).', 1),
('d3f86665-cce1-11e2-b7e6-005056be3574', '"ЭКОДОМ огнебио"  5кг', '569e2343-ff83-11e4-9228-005056be1f7a', 0, 31, 24, 'Состав предназначен для биозащиты деревянных и других аналогичных материалов, а также готовых конструкций и изделий из них, эксплуатируемых в условиях умеренного увлажнения, от образования плесени, гнили, синевы и от насекомых внутри помещений или снаружи (под навесом) - VIII класс службы по ГОСТ 20022.2, глубокая пропитка).', 1),
('d3f86667-cce1-11e2-b7e6-005056be3574', '"ЭКОДОМ огнебио"  10кг', '569e2343-ff83-11e4-9228-005056be1f7a', 0, 52, 21, 'Состав предназначен для биозащиты деревянных и других аналогичных материалов, а также готовых конструкций и изделий из них, эксплуатируемых в условиях умеренного увлажнения, от образования плесени, гнили, синевы и от насекомых внутри помещений или снаружи (под навесом) - VIII класс службы по ГОСТ 20022.2, глубокая пропитка).', 1),
('d3f86669-cce1-11e2-b7e6-005056be3574', '"ЭКОДОМ огнебио проф"  5кг', '569e2343-ff83-11e4-9228-005056be1f7a', 0, 28, 24, 'Состав предназначен для биозащиты деревянных и других аналогичных материалов, а также готовых конструкций и изделий из них, эксплуатируемых в условиях умеренного увлажнения, от образования плесени, гнили, синевы и от насекомых внутри помещений или снаружи (под навесом) - VIII класс службы по ГОСТ 20022.2, глубокая пропитка).', 1),
('d3f8666b-cce1-11e2-b7e6-005056be3574', '"ЭКОДОМ огнебио проф"  11кг', '569e2343-ff83-11e4-9228-005056be1f7a', 0, 34, 21, 'Состав предназначен для биозащиты деревянных и других аналогичных материалов, а также готовых конструкций и изделий из них, эксплуатируемых в условиях умеренного увлажнения, от образования плесени, гнили, синевы и от насекомых внутри помещений или снаружи (под навесом) - VIII класс службы по ГОСТ 20022.2, глубокая пропитка).', 1),
('d76b7387-f78e-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 6кг Бирюзовый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 17, 12, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('d9eaaa65-f78f-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 20кг Светло-зеленый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 7, 1, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('da49edc1-58f9-11e0-894e-000e0c431b58', 'Грунт-эмаль по ржавчине белая 10л  DALI', '569e2345-ff83-11e4-9228-005056be1f7a', 0, 0, 0, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('da49edc3-58f9-11e0-894e-000e0c431b58', 'Грунт-эмаль по ржавчине зеленая 10л  DALI', '569e2345-ff83-11e4-9228-005056be1f7a', 0, 0, 0, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('da49edc5-58f9-11e0-894e-000e0c431b58', 'Грунт-эмаль по ржавчине коричневая 10л  DALI', '569e2345-ff83-11e4-9228-005056be1f7a', 0, 0, 0, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('da49edc7-58f9-11e0-894e-000e0c431b58', 'Грунт-эмаль по ржавчине красно-коричневая 10л  DALI', '569e2345-ff83-11e4-9228-005056be1f7a', 0, 11, 3, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('da49edc9-58f9-11e0-894e-000e0c431b58', 'Грунт-эмаль по ржавчине серая 10л  DALI', '569e2345-ff83-11e4-9228-005056be1f7a', 0, 34, 0, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('da49edcb-58f9-11e0-894e-000e0c431b58', 'Грунт-эмаль по ржавчине черная 10л  DALI', '569e2345-ff83-11e4-9228-005056be1f7a', 0, 11, 7, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('de1409cf-f787-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 0,8кг Светло-зеленый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 144, 59, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('df210450-93af-11e3-82a4-005056be1f7b', 'Грунт-эмаль по ржавчине жёлтый 0,75л  DALI', '569e2345-ff83-11e4-9228-005056be1f7a', 0, 58, 34, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('df2d81cd-f78e-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 6кг Зеленый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 19, 12, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('e017a0ce-f78d-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 1,9кг Оранжевый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 102, 47, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('e02ebd60-99a6-11db-937f-000e0c431b59', 'Клей ПВА "Люкс" мебельный 0,9кг ("Лакра")', '3df545ee-03aa-11e5-bad4-005056be1f7a', 0, 119, 69, 'Предназначен для профессионального применения в деревообрабатывающей и полиграфической промышленности, а также для ответственных видов работ в быту, в которых предъявляются высокие требования к прочности склейки. Рекомендуется для работ, где шов склеивания подвергается большим динамическим нагрузкам. Подходит для склеивания всех пород дерева, переплетных работ. Применяется при сборке и ремонте мебели, приклеивании шпона. ', 1),
('e02ebd64-99a6-11db-937f-000e0c431b59', 'Клей ПВА "Люкс" мебельный 2,3кг ("Лакра")', '3df545ee-03aa-11e5-bad4-005056be1f7a', 0, 113, 54, 'Предназначен для профессионального применения в деревообрабатывающей и полиграфической промышленности, а также для ответственных видов работ в быту, в которых предъявляются высокие требования к прочности склейки. Рекомендуется для работ, где шов склеивания подвергается большим динамическим нагрузкам. Подходит для склеивания всех пород дерева, переплетных работ. Применяется при сборке и ремонте мебели, приклеивании шпона. ', 1),
('e02ebd66-99a6-11db-937f-000e0c431b59', 'Клей ПВА "Люкс" мебельный 40кг ("Лакра")', '3df545ee-03aa-11e5-bad4-005056be1f7a', 0, 0, 0, 'Предназначен для профессионального применения в деревообрабатывающей и полиграфической промышленности, а также для ответственных видов работ в быту, в которых предъявляются высокие требования к прочности склейки. Рекомендуется для работ, где шов склеивания подвергается большим динамическим нагрузкам. Подходит для склеивания всех пород дерева, переплетных работ. Применяется при сборке и ремонте мебели, приклеивании шпона. ', 1),
('e02ebd6a-99a6-11db-937f-000e0c431b59', 'Клей ПВА М "Экстра"  0,9кг  ("Лакра")', '3df545ee-03aa-11e5-bad4-005056be1f7a', 0, 165, 76, 'Рекомендуется для столярных работ: склеивания деревянных конструкций, мебели, приклеивания линолеума (на тканой основе), прочной склейки изделий из кожи, прочного картона, бумаги и т.п.', 1),
('e02ebd6c-99a6-11db-937f-000e0c431b59', 'Клей ПВА М "Экстра"  2,3кг  ("Лакра")', '3df545ee-03aa-11e5-bad4-005056be1f7a', 0, 65, 56, 'Рекомендуется для столярных работ: склеивания деревянных конструкций, мебели, приклеивания линолеума (на тканой основе), прочной склейки изделий из кожи, прочного картона, бумаги и т.п.', 1),
('e02ebd6e-99a6-11db-937f-000e0c431b59', 'Клей ПВА М "Экстра"  4кг  ("Лакра")', '3df545ee-03aa-11e5-bad4-005056be1f7a', 0, 62, 35, 'Рекомендуется для столярных работ: склеивания деревянных конструкций, мебели, приклеивания линолеума (на тканой основе), прочной склейки изделий из кожи, прочного картона, бумаги и т.п.', 1),
('e02ebd70-99a6-11db-937f-000e0c431b59', 'Клей ПВА М "Экстра" 10кг  ("Лакра")', '3df545ee-03aa-11e5-bad4-005056be1f7a', 0, 144, 18, 'Рекомендуется для столярных работ: склеивания деревянных конструкций, мебели, приклеивания линолеума (на тканой основе), прочной склейки изделий из кожи, прочного картона, бумаги и т.п.', 1),
('e02ebd72-99a6-11db-937f-000e0c431b59', 'Клей ПВА М "Экстра" 40кг  ("Лакра")', '3df545ee-03aa-11e5-bad4-005056be1f7a', 0, 0, 0, '', 1),
('e02ebd74-99a6-11db-937f-000e0c431b59', 'Клей ПВА Мастер универсальный  2,3кг  ("Лакра")', '3df545ee-03aa-11e5-bad4-005056be1f7a', 0, 75, 57, 'Рекомендуется для склеивания изделий из дерева, не подвергающихся механическим нагрузкам, кожи, картона, бумаги и т.п.', 1),
('e02ebd76-99a6-11db-937f-000e0c431b59', 'Клей ПВА строительно-универсальный  0,9кг  ("Лакра")', '3df545ee-03aa-11e5-bad4-005056be1f7a', 0, 216, 82, 'Рекомендуется для следующих видов работ: приклеивания изделий из картона, бумаги, тканей, декоративной пленки (клеенки) на бумажной и полимерной основе, строительных элементов (серпянки и т.д.), подклейки бумажных обоев и т.п.', 1),
('e02ebd78-99a6-11db-937f-000e0c431b59', 'Клей ПВА строительно-универсальный  2,3кг  ("Лакра")', '3df545ee-03aa-11e5-bad4-005056be1f7a', 0, 161, 61, 'Рекомендуется для следующих видов работ: приклеивания изделий из картона, бумаги, тканей, декоративной пленки (клеенки) на бумажной и полимерной основе, строительных элементов (серпянки и т.д.), подклейки бумажных обоев и т.п.', 1),
('e02ebd7a-99a6-11db-937f-000e0c431b59', 'Клей ПВА строительно-универсальный  4кг  ("Лакра")', '3df545ee-03aa-11e5-bad4-005056be1f7a', 0, 110, 40, 'Рекомендуется для следующих видов работ: приклеивания изделий из картона, бумаги, тканей, декоративной пленки (клеенки) на бумажной и полимерной основе, строительных элементов (серпянки и т.д.), подклейки бумажных обоев и т.п.', 1),
('e02ebd7c-99a6-11db-937f-000e0c431b59', 'Клей ПВА строительно-универсальный 10кг  ("Лакра")', '3df545ee-03aa-11e5-bad4-005056be1f7a', 0, 55, 25, 'Рекомендуется для следующих видов работ: приклеивания изделий из картона, бумаги, тканей, декоративной пленки (клеенки) на бумажной и полимерной основе, строительных элементов (серпянки и т.д.), подклейки бумажных обоев и т.п.', 1),
('e02ebd7e-99a6-11db-937f-000e0c431b59', 'Клей ПВА строительно-универсальный 38кг  ("Лакра")', '3df545ee-03aa-11e5-bad4-005056be1f7a', 0, 0, 0, 'Рекомендуется для следующих видов работ: приклеивания изделий из картона, бумаги, тканей, декоративной пленки (клеенки) на бумажной и полимерной основе, строительных элементов (серпянки и т.д.), подклейки бумажных обоев и т.п.', 1),
('e12e57a9-f78f-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 20кг Синий', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 1, 1, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('e213c98a-ccbb-11e4-a1f9-005056be1f7b', 'Сольвент АЛТ 602/218 400 гр.', '72429777-ff83-11e4-9228-005056be1f7a', 0, 92, 48, 'Растворитель предназначен для разбавления лакокрасочных материалов и шпатлевок на основе: нитратоцелюлозных, нитратоцелюлозно-глифталевых, эпоксидных, нитратцелюлозно-эпоксидных, мочевино (меламино) формальдегидных, кремнеорганических (НЦ, ЭП, КО, МЧ, МС) и других лакокрасочных материалов.', 1),
('e63d2bae-f78d-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 1,9кг Желтый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 56, 48, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('e755f307-f787-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 0,8кг Синий', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 127, 63, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('e7f145bb-f78f-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 20кг Голубой', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 10, 1, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('e8976171-93af-11e3-82a4-005056be1f7b', 'Грунт-эмаль по ржавчине жёлтый 2л  DALI', '569e2345-ff83-11e4-9228-005056be1f7a', 0, 157, 30, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('ebcc7a29-f78e-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 6кг Светло-зеленый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 26, 12, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('efa9ef8e-f78d-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 1,9кг Вишневый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 76, 48, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('f0ad1dd1-1f91-11e4-9591-005056be1f7b', 'Грунт-эмаль по ржавчине жёлтый 10л  DALI', '569e2345-ff83-11e4-9228-005056be1f7a', 0, 0, 0, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('f1be6b3a-f081-11df-a0c5-000e0c431b58', 'Эмаль ПФ-115 (Лакра) Сиреневая  1кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 90, 56, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('f1be6b3c-f081-11df-a0c5-000e0c431b58', 'Эмаль ПФ-115 (Лакра) Сиреневая  2кг', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 80, 48, 'Обладает хорошими декоративными свойствами и прочным сцеплением с окрашиваемой поверхностью. Эмаль легко наносится, образуя однородное гладкое покрытие, устойчивое к действию воды, атмосферных осадков и растворов моющих средств.', 1),
('f31a0079-f78e-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 6кг Синий', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 21, 12, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('f33aec8f-f78f-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 20кг Шоколадный', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 0, 0, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('f5ec168e-f78d-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 1,9кг Красный', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 109, 47, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('fae440c6-c6f8-11e0-b25c-000e0c431b58', 'Антисептик ТРУДНОВЫМЫВАЕМЫЙ Zelest  5кг', '569e2343-ff83-11e4-9228-005056be1f7a', 0, 30, 21, 'Для наружных и внутренних работ. Антисептик для усиленной защиты древесины ответственных элементов конструкций от гниения, плесени, «синевы», насекомых древоточцев в труднодоступных влажных местах, в условиях воздействия атмосферных осадков, почвенной влаги, в контакте с грунтом, органическими отходами.', 1),
('fae440c8-c6f8-11e0-b25c-000e0c431b58', 'Антисептик ТРУДНОВЫМЫВАЕМЫЙ Zelest 10кг', '569e2343-ff83-11e4-9228-005056be1f7a', 0, 33, 19, 'Для наружных и внутренних работ. Антисептик для усиленной защиты древесины ответственных элементов конструкций от гниения, плесени, «синевы», насекомых древоточцев в труднодоступных влажных местах, в условиях воздействия атмосферных осадков, почвенной влаги, в контакте с грунтом, органическими отходами.', 1),
('fbb89466-93af-11e3-82a4-005056be1f7b', 'Грунт-эмаль по ржавчине красный 0,75л  DALI', '569e2345-ff83-11e4-9228-005056be1f7a', 0, 35, 30, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('fc75df8c-f786-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 0,8кг Белая', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 308, 77, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('fd393098-f78f-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 20кг Розово-бежевый', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 12, 0, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('fdf8cbf6-f78e-11e3-8c8a-005056be1f7b', 'Эмаль ПФ-115 Inter 6кг Голубой', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 24, 12, 'Высококачественная эмаль на основе алкидного лака предназначена для окраски деревянных и загрунтованных металлических поверхностей, подвергающихся атмосферным воздействиям, а также для внутренних отделочных работ. ', 1),
('fea6c165-5ab6-11dc-be42-000e0c431b58', 'Эмаль универсальная хаки 520 мл.', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 32, 33, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \n', 1),
('fea6c167-5ab6-11dc-be42-000e0c431b58', 'Эмаль универсальная светло-зеленая 520 мл.', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 52, 33, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \n', 1),
('fea6c169-5ab6-11dc-be42-000e0c431b58', 'Эмаль универсальная темно-зеленая 520 мл.', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 55, 37, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \n', 1),
('fea6c16b-5ab6-11dc-be42-000e0c431b58', 'Эмаль универсальная фисташковая 520 мл.', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 36, 33, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \n', 1),
('fea6c16d-5ab6-11dc-be42-000e0c431b58', 'Эмаль универсальная бежевая 520 мл.', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 45, 37, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \n', 1),
('fea6c16f-5ab6-11dc-be42-000e0c431b58', 'Эмаль универсальная голубая 520 мл.', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 58, 39, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \n', 1),
('fea6c171-5ab6-11dc-be42-000e0c431b58', 'Эмаль универсальная синяя 520 мл.', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 80, 39, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \n', 1),
('fea6c173-5ab6-11dc-be42-000e0c431b58', 'Эмаль универсальная коричневая 520 мл.', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 98, 50, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \n', 1),
('fea6c175-5ab6-11dc-be42-000e0c431b58', 'Эмаль универсальная желтая 520 мл.', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 73, 40, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \n', 1),
('fea6c177-5ab6-11dc-be42-000e0c431b58', 'Эмаль универсальная светло-серая 520 мл.', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 54, 35, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \n', 1),
('fea6c179-5ab6-11dc-be42-000e0c431b58', 'Эмаль универсальная серая 520 мл.', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 78, 47, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \n', 1),
('fea6c17b-5ab6-11dc-be42-000e0c431b58', 'Эмаль универсальная оранжевая 520 мл.', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 77, 36, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \n', 1),
('fea6c17d-5ab6-11dc-be42-000e0c431b58', 'Эмаль универсальная бирюзовая 520 мл.', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 62, 34, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \n', 1),
('fea6c17f-5ab6-11dc-be42-000e0c431b58', 'Эмаль универсальная сиреневая 520 мл.', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 51, 34, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \n', 1),
('fea6c181-5ab6-11dc-be42-000e0c431b58', 'Эмаль универсальная охра 520 мл.', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 41, 32, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \n', 1),
('fea6c183-5ab6-11dc-be42-000e0c431b58', 'Эмаль универсальная какао 520 мл.', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 58, 35, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \n', 1),
('fea6c185-5ab6-11dc-be42-000e0c431b58', 'Эмаль универсальная красно-коричневая 520 мл.', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 34, 33, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \n', 1),
('fea6c187-5ab6-11dc-be42-000e0c431b58', 'Эмаль универсальная алюминий 520 мл.', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 67, 34, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \n', 1),
('fea6c189-5ab6-11dc-be42-000e0c431b58', 'Эмаль универсальная хром 520 мл.', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 93, 59, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \n', 1),
('fea6c18b-5ab6-11dc-be42-000e0c431b58', 'Эмаль универсальная золото 520 мл.', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 86, 60, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \n', 1),
('fea6c18d-5ab6-11dc-be42-000e0c431b58', 'Эмаль универсальная медь 520 мл.', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 58, 36, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \n', 1),
('fea6c18f-5ab6-11dc-be42-000e0c431b58', 'Эмаль универсальная белая матовая 520 мл.', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 96, 55, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \n', 1),
('fea6c191-5ab6-11dc-be42-000e0c431b58', 'Эмаль универсальная черная матовая 520 мл.', '6ecba52d-fe13-11e4-9228-005056be1f7a', 0, 108, 61, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \n', 1),
('ff6f8cd3-db6e-11e3-b291-005056be1f7b', '"ЭКОДОМ огнебио"  20кг', '569e2343-ff83-11e4-9228-005056be1f7a', 0, 41, 16, 'Состав предназначен для биозащиты деревянных и других аналогичных материалов, а также готовых конструкций и изделий из них, эксплуатируемых в условиях умеренного увлажнения, от образования плесени, гнили, синевы и от насекомых внутри помещений или снаружи (под навесом) - VIII класс службы по ГОСТ 20022.2, глубокая пропитка).', 1);

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
('04834f06-93b0-11e3-82a4-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 929),
('04834f06-93b0-11e3-82a4-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 882.55),
('05caaed0-f790-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 2257),
('05caaed0-f790-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 2144.15),
('05caaed2-f790-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 2257),
('05caaed2-f790-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 2144.15),
('06e98e75-f78f-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 738),
('06e98e75-f78f-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 701.1),
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
('09f4768d-f78e-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 237),
('09f4768d-f78e-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 225.15),
('0d8fcbcd-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 569),
('0d8fcbcd-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 540.55),
('0d8fcbcf-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 1269),
('0d8fcbcf-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 1205.55),
('0d8fcbd1-99a8-11db-937f-000e0c431b59', '288427e0-9732-11db-bbb4-0017315894a1', 722),
('0d8fcbd1-99a8-11db-937f-000e0c431b59', '86157e22-e56b-11dc-8b6b-000e0c431b58', 685.9),
('0ff22851-f78f-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 738),
('0ff22851-f78f-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 701.1),
('1004a95c-f787-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 117),
('1004a95c-f787-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 111.15),
('11d9ec94-f788-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 114),
('11d9ec94-f788-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 108.3),
('138c38bb-f78e-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 237),
('138c38bb-f78e-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 225.15),
('13ce3df2-93b0-11e3-82a4-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 929),
('13ce3df2-93b0-11e3-82a4-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 882.55),
('159d698c-e90f-11e0-9e45-3c4a92ed9378', '288427e0-9732-11db-bbb4-0017315894a1', 329),
('159d698c-e90f-11e0-9e45-3c4a92ed9378', '86157e22-e56b-11dc-8b6b-000e0c431b58', 313.5),
('159d698e-e90f-11e0-9e45-3c4a92ed9378', '288427e0-9732-11db-bbb4-0017315894a1', 599),
('159d698e-e90f-11e0-9e45-3c4a92ed9378', '86157e22-e56b-11dc-8b6b-000e0c431b58', 570),
('159d6990-e90f-11e0-9e45-3c4a92ed9378', '288427e0-9732-11db-bbb4-0017315894a1', 386),
('159d6990-e90f-11e0-9e45-3c4a92ed9378', '86157e22-e56b-11dc-8b6b-000e0c431b58', 366.23),
('159d6992-e90f-11e0-9e45-3c4a92ed9378', '288427e0-9732-11db-bbb4-0017315894a1', 699),
('159d6992-e90f-11e0-9e45-3c4a92ed9378', '86157e22-e56b-11dc-8b6b-000e0c431b58', 664.05),
('159d6994-e90f-11e0-9e45-3c4a92ed9378', '288427e0-9732-11db-bbb4-0017315894a1', 339),
('159d6994-e90f-11e0-9e45-3c4a92ed9378', '86157e22-e56b-11dc-8b6b-000e0c431b58', 322.05),
('159d6996-e90f-11e0-9e45-3c4a92ed9378', '288427e0-9732-11db-bbb4-0017315894a1', 615),
('159d6996-e90f-11e0-9e45-3c4a92ed9378', '86157e22-e56b-11dc-8b6b-000e0c431b58', 584.25),
('159d6998-e90f-11e0-9e45-3c4a92ed9378', '288427e0-9732-11db-bbb4-0017315894a1', 455),
('159d6998-e90f-11e0-9e45-3c4a92ed9378', '86157e22-e56b-11dc-8b6b-000e0c431b58', 431.78),
('159d7e07-f790-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 2257),
('159d7e07-f790-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 2144.15),
('17a83679-f78f-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 738),
('17a83679-f78f-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 701.1),
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
('3442e089-0125-11e4-8695-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 454),
('3442e089-0125-11e4-8695-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 431.3),
('3479e733-bce7-11e4-a1f3-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 1170),
('3479e733-bce7-11e4-a1f3-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 1111.5),
('3526e5c9-f78e-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 237),
('3526e5c9-f78e-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 225.15),
('354fea51-be93-11e0-b25c-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 668),
('354fea51-be93-11e0-b25c-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 634.6),
('354fea53-be93-11e0-b25c-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 1125),
('354fea53-be93-11e0-b25c-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 1068.75),
('354fea55-be93-11e0-b25c-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 285),
('354fea55-be93-11e0-b25c-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 270.75),
('354fea57-be93-11e0-b25c-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 517),
('354fea57-be93-11e0-b25c-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 491.15),
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
('46582c85-c991-11e1-8a6e-005056be3bd8', '288427e0-9732-11db-bbb4-0017315894a1', 456),
('46582c85-c991-11e1-8a6e-005056be3bd8', '86157e22-e56b-11dc-8b6b-000e0c431b58', 433.2),
('46582c87-c991-11e1-8a6e-005056be3bd8', '288427e0-9732-11db-bbb4-0017315894a1', 2019),
('46582c87-c991-11e1-8a6e-005056be3bd8', '86157e22-e56b-11dc-8b6b-000e0c431b58', 1918.05),
('46efb407-dea8-11e4-9d9b-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 1545),
('46efb407-dea8-11e4-9d9b-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 1467.75),
('47de42e5-f789-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 747),
('47de42e5-f789-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 709.65),
('4dd1de14-f78e-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 237),
('4dd1de14-f78e-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 225.15),
('4ed5aaa1-f789-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 747),
('4ed5aaa1-f789-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 709.65),
('55c10657-f78e-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 237),
('55c10657-f78e-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 225.15),
('5ed5699a-f78e-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 237),
('5ed5699a-f78e-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 225.15),
('5fde6d12-f789-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 1033),
('5fde6d12-f789-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 981.35),
('612d8834-6137-11e1-96bd-005056be3bd8', '288427e0-9732-11db-bbb4-0017315894a1', 233),
('612d8834-6137-11e1-96bd-005056be3bd8', '86157e22-e56b-11dc-8b6b-000e0c431b58', 220.5),
('612d8856-6137-11e1-96bd-005056be3bd8', '288427e0-9732-11db-bbb4-0017315894a1', 878),
('612d8856-6137-11e1-96bd-005056be3bd8', '86157e22-e56b-11dc-8b6b-000e0c431b58', 834.1),
('612d8858-6137-11e1-96bd-005056be3bd8', '288427e0-9732-11db-bbb4-0017315894a1', 1762),
('612d8858-6137-11e1-96bd-005056be3bd8', '86157e22-e56b-11dc-8b6b-000e0c431b58', 1673.9),
('6260610c-29f2-11e4-816f-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 1155),
('6260610c-29f2-11e4-816f-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 1097.25),
('680965ab-f789-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 2257),
('680965ab-f789-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 2144.15),
('727c8145-f789-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 2257),
('727c8145-f789-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 2144.15),
('747ef690-551c-11dc-beb4-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 335),
('747ef690-551c-11dc-beb4-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 302),
('763735c0-2a2b-11e2-9366-005056be3bd8', '288427e0-9732-11db-bbb4-0017315894a1', 275),
('763735c0-2a2b-11e2-9366-005056be3bd8', '86157e22-e56b-11dc-8b6b-000e0c431b58', 266),
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
('9bd479ef-b369-11e4-a26a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 999),
('9bd479ef-b369-11e4-a26a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 994),
('a1a9b4a6-f787-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 114),
('a1a9b4a6-f787-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 108.3),
('a48048ba-ec8c-11e3-9eab-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 108),
('a48048ba-ec8c-11e3-9eab-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 102.6),
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
('b3740593-f78f-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 2257),
('b3740593-f78f-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 2144.15),
('b54ba125-f78e-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 738),
('b54ba125-f78e-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 701.1),
('b5957aa3-f787-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 114),
('b5957aa3-f787-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 108.3),
('ba1232df-ec8c-11e3-9eab-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 71),
('ba1232df-ec8c-11e3-9eab-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 67.45),
('bc816f7f-f78f-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 2257),
('bc816f7f-f78f-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 2144.15),
('beb861cb-f787-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 114),
('beb861cb-f787-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 108.3),
('bef8d7ea-f78e-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 738),
('bef8d7ea-f78e-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 701.1),
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
('ce1ffcf9-f78e-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 738),
('ce1ffcf9-f78e-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 701.1),
('cf6aa526-48b8-11dd-9342-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 174),
('cf6aa526-48b8-11dd-9342-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 165.3),
('d0659fe4-f787-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 114),
('d0659fe4-f787-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 108.3),
('d1aa2ade-a3ef-11e1-ad4e-005056be3bd8', '288427e0-9732-11db-bbb4-0017315894a1', 375),
('d1aa2ade-a3ef-11e1-ad4e-005056be3bd8', '86157e22-e56b-11dc-8b6b-000e0c431b58', 356.25),
('d1eaa4c2-f78f-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 2257),
('d1eaa4c2-f78f-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 2144.15),
('d3f8665d-cce1-11e2-b7e6-005056be3574', '288427e0-9732-11db-bbb4-0017315894a1', 189),
('d3f8665d-cce1-11e2-b7e6-005056be3574', '86157e22-e56b-11dc-8b6b-000e0c431b58', 179.55),
('d3f8665f-cce1-11e2-b7e6-005056be3574', '288427e0-9732-11db-bbb4-0017315894a1', 379),
('d3f8665f-cce1-11e2-b7e6-005056be3574', '86157e22-e56b-11dc-8b6b-000e0c431b58', 360.05),
('d3f86661-cce1-11e2-b7e6-005056be3574', '288427e0-9732-11db-bbb4-0017315894a1', 233),
('d3f86661-cce1-11e2-b7e6-005056be3574', '86157e22-e56b-11dc-8b6b-000e0c431b58', 221.35),
('d3f86663-cce1-11e2-b7e6-005056be3574', '288427e0-9732-11db-bbb4-0017315894a1', 437),
('d3f86663-cce1-11e2-b7e6-005056be3574', '86157e22-e56b-11dc-8b6b-000e0c431b58', 415.15),
('d3f86665-cce1-11e2-b7e6-005056be3574', '288427e0-9732-11db-bbb4-0017315894a1', 239),
('d3f86665-cce1-11e2-b7e6-005056be3574', '86157e22-e56b-11dc-8b6b-000e0c431b58', 227.05),
('d3f86667-cce1-11e2-b7e6-005056be3574', '288427e0-9732-11db-bbb4-0017315894a1', 409),
('d3f86667-cce1-11e2-b7e6-005056be3574', '86157e22-e56b-11dc-8b6b-000e0c431b58', 388.55),
('d3f86669-cce1-11e2-b7e6-005056be3574', '288427e0-9732-11db-bbb4-0017315894a1', 259),
('d3f86669-cce1-11e2-b7e6-005056be3574', '86157e22-e56b-11dc-8b6b-000e0c431b58', 246.05),
('d3f8666b-cce1-11e2-b7e6-005056be3574', '288427e0-9732-11db-bbb4-0017315894a1', 573),
('d3f8666b-cce1-11e2-b7e6-005056be3574', '86157e22-e56b-11dc-8b6b-000e0c431b58', 544.35),
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
('de1409cf-f787-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 114),
('de1409cf-f787-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 108.3),
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
('e12e57a9-f78f-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 2257),
('e12e57a9-f78f-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 2144.15),
('e213c98a-ccbb-11e4-a1f9-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 92),
('e213c98a-ccbb-11e4-a1f9-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 87.4),
('e63d2bae-f78d-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 237),
('e63d2bae-f78d-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 225.15),
('e755f307-f787-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 114),
('e755f307-f787-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 108.3),
('e7f145bb-f78f-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 2257),
('e7f145bb-f78f-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 2144.15),
('e8976171-93af-11e3-82a4-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 929),
('e8976171-93af-11e3-82a4-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 882.55),
('ebcc7a29-f78e-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 738),
('ebcc7a29-f78e-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 701.1),
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
('fae440c6-c6f8-11e0-b25c-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 371),
('fae440c6-c6f8-11e0-b25c-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 351.5),
('fae440c8-c6f8-11e0-b25c-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 678),
('fae440c8-c6f8-11e0-b25c-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 644.1),
('fbb89466-93af-11e3-82a4-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 369),
('fbb89466-93af-11e3-82a4-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 350.55),
('fc75df8c-f786-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 117),
('fc75df8c-f786-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 111.15),
('fd393098-f78f-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 2257),
('fd393098-f78f-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 2144.15),
('fdf8cbf6-f78e-11e3-8c8a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 738),
('fdf8cbf6-f78e-11e3-8c8a-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 701.1),
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
('fea6c191-5ab6-11dc-be42-000e0c431b58', '86157e22-e56b-11dc-8b6b-000e0c431b58', 145.35),
('ff6f8cd3-db6e-11e3-b291-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 809),
('ff6f8cd3-db6e-11e3-b291-005056be1f7b', '86157e22-e56b-11dc-8b6b-000e0c431b58', 768.55);

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
('000b4673-f788-11e3-8c8a-005056be1f7b-B9DY-Fhv9-Abd6-HWQK-CwUA-BZTF', '000b4673-f788-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('000b4673-f788-11e3-8c8a-005056be1f7b-B9QY-FCno-AZkK-Hfm3-Ct96-BzBU', '000b4673-f788-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '800', 'г'),
('000b4673-f788-11e3-8c8a-005056be1f7b-BE1n-F9FX-AyYU-HrtP-CrXG-BOKZ', '000b4673-f788-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'голубой', ''),
('000b4673-f788-11e3-8c8a-005056be1f7b-BKlg-FvFT-Ah9D-HWQW-C8gG-BBrN', '000b4673-f788-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('000b4673-f788-11e3-8c8a-005056be1f7b-BPtE-FLGU-AV3p-HWS0-CcFI-B7O9', '000b4673-f788-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('000b4673-f788-11e3-8c8a-005056be1f7b-BWCG-FCZY-AC2e-HKxs-CI8U-Bpta', '000b4673-f788-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('000b4673-f788-11e3-8c8a-005056be1f7b-BxIe-FI1N-AXil-Hdwv-C3uy-BRSk', '000b4673-f788-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('030b5cff-f78e-11e3-8c8a-005056be1f7b-Bado-FGWg-ALUY-HApm-CGvD-BfAG', '030b5cff-f78e-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'бирюзовый', ''),
('030b5cff-f78e-11e3-8c8a-005056be1f7b-BEHI-FQQd-Ace9-HPKC-C1zw-B1py', '030b5cff-f78e-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('030b5cff-f78e-11e3-8c8a-005056be1f7b-BEru-Fdsa-AFyL-HIUM-COew-BpDk', '030b5cff-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('030b5cff-f78e-11e3-8c8a-005056be1f7b-BJka-Fix0-ArZK-HR9j-C4ZD-Bifa', '030b5cff-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('030b5cff-f78e-11e3-8c8a-005056be1f7b-BpuA-FzC0-AZ7Y-Hde5-C4il-BoCU', '030b5cff-f78e-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('030b5cff-f78e-11e3-8c8a-005056be1f7b-Br6t-FpK4-ArAt-He2Y-CTqe-BE5D', '030b5cff-f78e-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1900', 'г'),
('030b5cff-f78e-11e3-8c8a-005056be1f7b-BzFv-FNjP-AIdy-HuH1-CEM9-BNcO', '030b5cff-f78e-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('04834f06-93b0-11e3-82a4-005056be1f7b-B27V-FwzG-Acm1-Hvz9-Cxio-B3s8', '04834f06-93b0-11e3-82a4-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('04834f06-93b0-11e3-82a4-005056be1f7b-B9mY-FXtg-AiCa-HlXA-C4gs-BsDR', '04834f06-93b0-11e3-82a4-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'красный', ''),
('04834f06-93b0-11e3-82a4-005056be1f7b-BLRV-FCDK-AA1t-Hptc-CmFV-BvaJ', '04834f06-93b0-11e3-82a4-005056be1f7b', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '2', 'л'),
('04834f06-93b0-11e3-82a4-005056be1f7b-BqwZ-FabI-A3DO-HOzo-CXpb-BfTL', '04834f06-93b0-11e3-82a4-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'грунт-эмаль', ''),
('04834f06-93b0-11e3-82a4-005056be1f7b-BtqF-FJSc-AKM0-H45C-CLti-BMIx', '04834f06-93b0-11e3-82a4-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('04834f06-93b0-11e3-82a4-005056be1f7b-BV4J-FUxD-AX0x-H6L7-CtD3-BFzs', '04834f06-93b0-11e3-82a4-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('04834f06-93b0-11e3-82a4-005056be1f7b-BzfB-FYPo-Axh5-H3uq-CxtS-BMHC', '04834f06-93b0-11e3-82a4-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('04834f06-93b0-11e3-82a4-005056be1f7b-BzxI-FntU-AjcX-HciN-CLtf-Bgvi', '04834f06-93b0-11e3-82a4-005056be1f7b', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для ржавчины', ''),
('05caaed0-f790-11e3-8c8a-005056be1f7b-B6Cy-F7e0-Anbz-HT8T-CXWK-B07T', '05caaed0-f790-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('05caaed0-f790-11e3-8c8a-005056be1f7b-BeK5-FNs0-A3kW-HpMU-CVhZ-BnYI', '05caaed0-f790-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('05caaed0-f790-11e3-8c8a-005056be1f7b-BPYZ-FFsW-AYFs-HiFp-C2Xw-Bl8q', '05caaed0-f790-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('05caaed0-f790-11e3-8c8a-005056be1f7b-BSGu-Fk4t-AGmf-Hp2b-Cbxd-BPu8', '05caaed0-f790-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('05caaed0-f790-11e3-8c8a-005056be1f7b-BUES-F1tK-ARL8-Hubs-CsqG-BHwy', '05caaed0-f790-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('05caaed0-f790-11e3-8c8a-005056be1f7b-BxpU-Fvav-AdJc-HjRO-CYvY-BS9H', '05caaed0-f790-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '20000', 'г'),
('05caaed0-f790-11e3-8c8a-005056be1f7b-BZ1m-FkJS-AJbR-Hx9g-Cswi-BP6w', '05caaed0-f790-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'охра', ''),
('05caaed2-f790-11e3-8c8a-005056be1f7b-B3a0-F4c8-AEhx-HrHE-C9fD-BTWf', '05caaed2-f790-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('05caaed2-f790-11e3-8c8a-005056be1f7b-B3be-Fany-ArEd-HdlE-CxDt-BawJ', '05caaed2-f790-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'серый', ''),
('05caaed2-f790-11e3-8c8a-005056be1f7b-BNOs-FdmU-ACVA-HC8L-CF1n-BjQQ', '05caaed2-f790-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('05caaed2-f790-11e3-8c8a-005056be1f7b-BQRv-FQ7c-ADvW-HFTu-CuLK-BtEn', '05caaed2-f790-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('05caaed2-f790-11e3-8c8a-005056be1f7b-BrJL-Ff2S-Akzy-HnJK-CJZc-B6qZ', '05caaed2-f790-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('05caaed2-f790-11e3-8c8a-005056be1f7b-BX9V-F1c7-A6QA-Hpqx-Cy5C-BhXo', '05caaed2-f790-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('05caaed2-f790-11e3-8c8a-005056be1f7b-BYtL-Fvze-Afjq-HqTv-CTA5-Begv', '05caaed2-f790-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '20000', 'г'),
('06e98e75-f78f-11e3-8c8a-005056be1f7b-BcYD-FsTN-AwK8-HYQ2-CuxG-BqAh', '06e98e75-f78f-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('06e98e75-f78f-11e3-8c8a-005056be1f7b-BhO6-FNbF-AzXj-Hduh-C4ch-BTPh', '06e98e75-f78f-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('06e98e75-f78f-11e3-8c8a-005056be1f7b-BiiN-FKtc-AUjq-HMJl-C7do-BX9Z', '06e98e75-f78f-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('06e98e75-f78f-11e3-8c8a-005056be1f7b-Bs0Z-FwAJ-AIfP-H6KE-C2tm-BF5V', '06e98e75-f78f-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('06e98e75-f78f-11e3-8c8a-005056be1f7b-BTDb-FeuU-ABAE-HAtW-CeGw-Bpy6', '06e98e75-f78f-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('06e98e75-f78f-11e3-8c8a-005056be1f7b-Bwz5-FVTp-A4NI-HagX-C99v-BBqF', '06e98e75-f78f-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '6000', 'г'),
('06e98e75-f78f-11e3-8c8a-005056be1f7b-BXaL-FrJ4-AuSm-HKOJ-C1N3-Bk6t', '06e98e75-f78f-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'шоколадный', ''),
('076d2137-4380-11de-8f53-000e0c431b58-BAXF-FyAh-Abpc-H8KV-CdV3-BzjM', '076d2137-4380-11de-8f53-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('076d2137-4380-11de-8f53-000e0c431b58-Bd42-F8Ao-Ao1E-HwXp-CY6j-B5iU', '076d2137-4380-11de-8f53-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'черный', ''),
('076d2137-4380-11de-8f53-000e0c431b58-Bid5-FO8i-Acv6-H8fY-Cvfv-B2Uv', '076d2137-4380-11de-8f53-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('076d2137-4380-11de-8f53-000e0c431b58-BKhW-FOUt-A5sp-HdnN-CyXf-Btcy', '076d2137-4380-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('076d2137-4380-11de-8f53-000e0c431b58-BqVw-Fnby-AKuY-HL9M-CJud-B4br', '076d2137-4380-11de-8f53-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'грунт-эмаль', ''),
('076d2137-4380-11de-8f53-000e0c431b58-BuR6-FETR-A5Ry-Hnbm-Co6f-Bf3g', '076d2137-4380-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('076d2137-4380-11de-8f53-000e0c431b58-BvQu-FrNP-AF0v-H22F-CnQ2-BEIk', '076d2137-4380-11de-8f53-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для ржавчины', ''),
('076d2137-4380-11de-8f53-000e0c431b58-BZvb-F3sl-ANM8-HFBg-CSkA-BNy9', '076d2137-4380-11de-8f53-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.75', 'л'),
('076d2139-4380-11de-8f53-000e0c431b58-B2MR-Fvwf-AGhN-Ho1M-CulM-BDqo', '076d2139-4380-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('076d2139-4380-11de-8f53-000e0c431b58-B3Nq-FMC9-AAJ3-HZEn-CEpb-Btgg', '076d2139-4380-11de-8f53-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для ржавчины', ''),
('076d2139-4380-11de-8f53-000e0c431b58-BcUf-FzUN-AR2F-HgJ0-CDBM-BuNP', '076d2139-4380-11de-8f53-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'грунт-эмаль', ''),
('076d2139-4380-11de-8f53-000e0c431b58-BkPw-FaVd-ArN1-Hh1S-C1sf-BHeR', '076d2139-4380-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('076d2139-4380-11de-8f53-000e0c431b58-Bkyp-F2Es-Ax0X-H0rc-Ch3O-BR4h', '076d2139-4380-11de-8f53-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '2', 'л'),
('076d2139-4380-11de-8f53-000e0c431b58-BLvu-FBTl-ATJT-HzRx-CG5Z-B6up', '076d2139-4380-11de-8f53-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('076d2139-4380-11de-8f53-000e0c431b58-Bmly-F1Pp-AD0Q-HQD7-C6oL-BrEh', '076d2139-4380-11de-8f53-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('076d2139-4380-11de-8f53-000e0c431b58-BuAT-FFbg-AiHz-HGrR-C2Wz-BncT', '076d2139-4380-11de-8f53-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'черный', ''),
('076d213b-4380-11de-8f53-000e0c431b58-BBSM-F8Ta-A3bG-HW82-Ce7f-BqJ4', '076d213b-4380-11de-8f53-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('076d213b-4380-11de-8f53-000e0c431b58-Bd9Y-FqKO-AcpG-HhW5-C7dm-Bvqq', '076d213b-4380-11de-8f53-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('076d213b-4380-11de-8f53-000e0c431b58-BdWR-FbSr-Ay1M-HM1w-Ce2E-BqyY', '076d213b-4380-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('076d213b-4380-11de-8f53-000e0c431b58-BHrz-FNEx-AEiu-HkP4-CesP-BwJi', '076d213b-4380-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('076d213b-4380-11de-8f53-000e0c431b58-BivO-FTWe-AM1M-HcnW-CAGU-BYwf', '076d213b-4380-11de-8f53-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('076d213b-4380-11de-8f53-000e0c431b58-BnPK-Ftxg-AotA-HQeq-C8Dc-BLWz', '076d213b-4380-11de-8f53-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.75', 'л'),
('076d213b-4380-11de-8f53-000e0c431b58-Bqjq-F3BT-APBZ-HkaM-CFDc-BQxP', '076d213b-4380-11de-8f53-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для ржавчины', ''),
('076d213b-4380-11de-8f53-000e0c431b58-Bxb0-Fxrd-Aeoh-H715-Cvge-BcZf', '076d213b-4380-11de-8f53-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'грунт-эмаль', ''),
('076d213d-4380-11de-8f53-000e0c431b58-B3ML-FeiP-Aj5X-Hl6S-CzkF-BiN5', '076d213d-4380-11de-8f53-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'грунт-эмаль', ''),
('076d213d-4380-11de-8f53-000e0c431b58-BALG-Fi0G-Admu-HPBE-CSSJ-BE0k', '076d213d-4380-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('076d213d-4380-11de-8f53-000e0c431b58-BD7n-FxMo-A2e8-HBj8-Clsu-BlFD', '076d213d-4380-11de-8f53-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('076d213d-4380-11de-8f53-000e0c431b58-BJwA-FWTv-AltG-Hk51-C15B-B7cB', '076d213d-4380-11de-8f53-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('076d213d-4380-11de-8f53-000e0c431b58-Bkvu-FYPz-Ab2i-Hx06-Cmov-BYTC', '076d213d-4380-11de-8f53-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('076d213d-4380-11de-8f53-000e0c431b58-Bpxs-FmyR-AkaA-HUCF-CXZv-BL3D', '076d213d-4380-11de-8f53-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для ржавчины', ''),
('076d213d-4380-11de-8f53-000e0c431b58-BRFw-FraE-AwaN-HgvO-CaV0-BKtP', '076d213d-4380-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('076d213d-4380-11de-8f53-000e0c431b58-BXqx-FdRr-ATHm-HVEF-CWHB-BA6O', '076d213d-4380-11de-8f53-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '2', 'л'),
('076d213f-4380-11de-8f53-000e0c431b58-B0Ip-FpsT-Aghm-HL2Z-CXDT-BkXL', '076d213f-4380-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('076d213f-4380-11de-8f53-000e0c431b58-B551-FBam-ACAv-H9XI-CYWQ-BEC9', '076d213f-4380-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('076d213f-4380-11de-8f53-000e0c431b58-Ba7b-F2qJ-Aplw-HYXb-ChxJ-Br8y', '076d213f-4380-11de-8f53-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.75', 'л'),
('076d213f-4380-11de-8f53-000e0c431b58-BhUT-FUtr-AwRe-H60b-CuOr-BnYe', '076d213f-4380-11de-8f53-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'грунт-эмаль', ''),
('076d213f-4380-11de-8f53-000e0c431b58-BL4N-FU3U-AgoH-HfwA-CkI7-BWXa', '076d213f-4380-11de-8f53-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'коричневый', ''),
('076d213f-4380-11de-8f53-000e0c431b58-BPP4-FJxB-AHUi-HoXE-C7xB-BXpr', '076d213f-4380-11de-8f53-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для ржавчины', ''),
('076d213f-4380-11de-8f53-000e0c431b58-BXjg-FAvX-AaIa-Htsy-C6ns-BwpJ', '076d213f-4380-11de-8f53-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('076d213f-4380-11de-8f53-000e0c431b58-BZrJ-FKph-ASE5-HiI8-Cggh-BCgS', '076d213f-4380-11de-8f53-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('076d2141-4380-11de-8f53-000e0c431b58-B5l3-FdmM-AoEq-HUF9-Crgt-BUbk', '076d2141-4380-11de-8f53-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '2', 'л'),
('076d2141-4380-11de-8f53-000e0c431b58-B93Q-FCCN-Apfu-Hq8z-CgrZ-BMla', '076d2141-4380-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('076d2141-4380-11de-8f53-000e0c431b58-BB44-Fvk2-AlHi-HBUK-Cbep-BBRX', '076d2141-4380-11de-8f53-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('076d2141-4380-11de-8f53-000e0c431b58-Bbvm-F611-AYYB-HuMQ-CINK-BC0u', '076d2141-4380-11de-8f53-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('076d2141-4380-11de-8f53-000e0c431b58-Bbzo-FIJt-AG1Q-H1Lr-CaWi-BZiJ', '076d2141-4380-11de-8f53-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'грунт-эмаль', ''),
('076d2141-4380-11de-8f53-000e0c431b58-BK19-FMlK-ActY-HmwX-CXr9-BPKk', '076d2141-4380-11de-8f53-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для ржавчины', ''),
('076d2141-4380-11de-8f53-000e0c431b58-BKfj-FwrZ-AdPe-HFNc-ChLV-ByOY', '076d2141-4380-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('076d2141-4380-11de-8f53-000e0c431b58-Btjp-F5B8-A4Im-HM1r-ChEl-B89b', '076d2141-4380-11de-8f53-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'коричневый', ''),
('076d2143-4380-11de-8f53-000e0c431b58-BDM9-FqzA-AIRG-H5Zd-C4mM-BdmT', '076d2143-4380-11de-8f53-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'грунт-эмаль', ''),
('076d2143-4380-11de-8f53-000e0c431b58-BETp-FQME-AVmx-HYYF-CSuo-BbBE', '076d2143-4380-11de-8f53-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('076d2143-4380-11de-8f53-000e0c431b58-BjkL-F75d-AfzM-H3ZE-CZsD-BwS4', '076d2143-4380-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('076d2143-4380-11de-8f53-000e0c431b58-BkB4-F9oq-AVBX-HURi-C5tX-Bj3g', '076d2143-4380-11de-8f53-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'красно-коричневый', ''),
('076d2143-4380-11de-8f53-000e0c431b58-BMsk-F0H0-AFZt-Hu2u-CyIg-BRfh', '076d2143-4380-11de-8f53-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для ржавчины', ''),
('076d2143-4380-11de-8f53-000e0c431b58-BRvd-FWBv-Aran-HmBb-CcGv-BHX9', '076d2143-4380-11de-8f53-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.75', 'л'),
('076d2143-4380-11de-8f53-000e0c431b58-BT0X-Fjzi-ARQ6-Hzqd-C0Qf-B4OJ', '076d2143-4380-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('076d2143-4380-11de-8f53-000e0c431b58-BVjJ-FQZz-AuZF-HPSU-CZ26-Blyz', '076d2143-4380-11de-8f53-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('076d2145-4380-11de-8f53-000e0c431b58-BAUo-FXGu-AmJ7-HQ7U-CaDb-Bhi6', '076d2145-4380-11de-8f53-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'грунт-эмаль', ''),
('076d2145-4380-11de-8f53-000e0c431b58-BbLs-F3lm-AMoi-HNS9-CI0c-BCnP', '076d2145-4380-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('076d2145-4380-11de-8f53-000e0c431b58-BGFC-FQWG-AeaG-HJle-CZCp-BH6R', '076d2145-4380-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('076d2145-4380-11de-8f53-000e0c431b58-BGXt-FMhU-Ar7X-HXDS-Coya-BjGv', '076d2145-4380-11de-8f53-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('076d2145-4380-11de-8f53-000e0c431b58-BHGG-FfdK-AxI0-HOsG-CAfd-BPek', '076d2145-4380-11de-8f53-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для ржавчины', ''),
('076d2145-4380-11de-8f53-000e0c431b58-Bre5-FowD-AcxK-HQDO-CE0o-BKYP', '076d2145-4380-11de-8f53-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'красно-коричневый', ''),
('076d2145-4380-11de-8f53-000e0c431b58-BuI6-FSVN-AQdM-Hsfz-C9m6-BA3S', '076d2145-4380-11de-8f53-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('076d2145-4380-11de-8f53-000e0c431b58-BxXP-F0Gu-AzEW-HvFP-CDLn-BwYK', '076d2145-4380-11de-8f53-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '2', 'л'),
('076d2147-4380-11de-8f53-000e0c431b58-B523-FR90-AfKo-HjbM-C0uN-BLBR', '076d2147-4380-11de-8f53-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'грунт-эмаль', ''),
('076d2147-4380-11de-8f53-000e0c431b58-BBC0-FPQz-A4oe-HVJy-Cg0r-BLMD', '076d2147-4380-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('076d2147-4380-11de-8f53-000e0c431b58-BFrq-Fu71-AmOX-HHHN-CLoE-BRiZ', '076d2147-4380-11de-8f53-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.75', 'л'),
('076d2147-4380-11de-8f53-000e0c431b58-Bg1G-F5VB-Acw8-HDLJ-C5aP-BaKr', '076d2147-4380-11de-8f53-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('076d2147-4380-11de-8f53-000e0c431b58-BOGf-Ftbp-Ah9o-HOJ2-CSgf-B31D', '076d2147-4380-11de-8f53-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('076d2147-4380-11de-8f53-000e0c431b58-BSAM-FQDY-Aa9y-HqY9-CYeq-BEOn', '076d2147-4380-11de-8f53-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для ржавчины', ''),
('076d2147-4380-11de-8f53-000e0c431b58-BXnk-FTin-AACX-He6i-Ca7k-BZM2', '076d2147-4380-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('076d2147-4380-11de-8f53-000e0c431b58-Bz4o-FNWM-Aah6-H6Dr-Cdue-B3K6', '076d2147-4380-11de-8f53-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'серый', ''),
('076d2149-4380-11de-8f53-000e0c431b58-Ba02-Fo7h-ADRi-Hj4L-Co73-Btjc', '076d2149-4380-11de-8f53-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('076d2149-4380-11de-8f53-000e0c431b58-BDqF-Fnj0-AiE1-HUZK-CDF5-B9Jv', '076d2149-4380-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('076d2149-4380-11de-8f53-000e0c431b58-Bgtm-FvKN-AkEh-Hhda-C8zD-B5MU', '076d2149-4380-11de-8f53-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'грунт-эмаль', ''),
('076d2149-4380-11de-8f53-000e0c431b58-Bqt5-FD2b-AzGO-H8pY-CUBg-BlnE', '076d2149-4380-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('076d2149-4380-11de-8f53-000e0c431b58-BtIg-Fjc6-AugB-HoeL-CZ5K-BRjH', '076d2149-4380-11de-8f53-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('076d2149-4380-11de-8f53-000e0c431b58-BVHQ-Fmib-ACAj-H446-Ce2v-BVUt', '076d2149-4380-11de-8f53-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'серый', ''),
('076d2149-4380-11de-8f53-000e0c431b58-BVn7-FWRb-AhqW-Hs96-Czwi-BOKv', '076d2149-4380-11de-8f53-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для ржавчины', ''),
('076d2149-4380-11de-8f53-000e0c431b58-BynY-FXMS-Aj1O-Hbky-C4T8-BZ4Z', '076d2149-4380-11de-8f53-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '2', 'л'),
('076d214b-4380-11de-8f53-000e0c431b58-B2Aj-FEDJ-AfC2-HrGe-Cf3t-BodD', '076d214b-4380-11de-8f53-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'зеленый', ''),
('076d214b-4380-11de-8f53-000e0c431b58-BB7C-FHw4-ArpN-Hn64-CVOV-BDxM', '076d214b-4380-11de-8f53-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('076d214b-4380-11de-8f53-000e0c431b58-BCVD-FP00-AJUO-HeXC-CrrZ-BxpZ', '076d214b-4380-11de-8f53-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для ржавчины', ''),
('076d214b-4380-11de-8f53-000e0c431b58-BcVW-FXwD-Au0P-HahA-CBZB-BleF', '076d214b-4380-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('076d214b-4380-11de-8f53-000e0c431b58-BTbs-Fj2P-Aj4p-HleJ-CqOJ-By11', '076d214b-4380-11de-8f53-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('076d214b-4380-11de-8f53-000e0c431b58-BTXG-F90k-AHqz-HQep-CGgm-BJoY', '076d214b-4380-11de-8f53-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.75', 'л'),
('076d214b-4380-11de-8f53-000e0c431b58-Bu0H-FlrN-AGMF-Hz2j-C4T6-BQqs', '076d214b-4380-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('076d214b-4380-11de-8f53-000e0c431b58-BYxF-FNDj-A4KF-HfTt-C4WF-B7mE', '076d214b-4380-11de-8f53-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'грунт-эмаль', ''),
('076d214d-4380-11de-8f53-000e0c431b58-B4Nj-Fu7k-AvhZ-HR38-Clof-BInM', '076d214d-4380-11de-8f53-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('076d214d-4380-11de-8f53-000e0c431b58-B9dV-FPwt-AYu2-HsBA-Clyg-BUhU', '076d214d-4380-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('076d214d-4380-11de-8f53-000e0c431b58-BNTo-FFaP-AoOy-HrYn-CfR2-BFCx', '076d214d-4380-11de-8f53-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('076d214d-4380-11de-8f53-000e0c431b58-Boyd-Fdf2-AHBJ-H9HL-Cwx0-BH3E', '076d214d-4380-11de-8f53-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для ржавчины', ''),
('076d214d-4380-11de-8f53-000e0c431b58-BqxV-FFFO-ACr4-Hi1g-CuEz-BZJP', '076d214d-4380-11de-8f53-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '2', 'л'),
('076d214d-4380-11de-8f53-000e0c431b58-BV6w-FOem-AuPq-Hko1-CzTp-BTwL', '076d214d-4380-11de-8f53-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'грунт-эмаль', ''),
('076d214d-4380-11de-8f53-000e0c431b58-Bwig-F9qF-Aqc2-HGlj-CyjC-BJyy', '076d214d-4380-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('076d214d-4380-11de-8f53-000e0c431b58-Bxft-Fsyb-AAML-HIir-Cvwa-BIrr', '076d214d-4380-11de-8f53-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'зеленый', ''),
('079b44f8-f788-11e3-8c8a-005056be1f7b-B7Yx-FOX5-AAml-HH4d-CQ7i-BH41', '079b44f8-f788-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '800', 'г'),
('079b44f8-f788-11e3-8c8a-005056be1f7b-BBNV-FHYB-AfBR-H0Hw-COqG-BR3I', '079b44f8-f788-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('079b44f8-f788-11e3-8c8a-005056be1f7b-BcAK-FFsd-AAyl-HS9c-Cykx-BTRb', '079b44f8-f788-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'шоколадный', ''),
('079b44f8-f788-11e3-8c8a-005056be1f7b-BCE2-F8Sa-AIOU-HjtJ-CiuW-B53v', '079b44f8-f788-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('079b44f8-f788-11e3-8c8a-005056be1f7b-BiUC-FMBu-AMs6-HNjK-C74b-Bey0', '079b44f8-f788-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('079b44f8-f788-11e3-8c8a-005056be1f7b-BkGc-FOvc-A1xn-HrrA-CqKA-B1Pt', '079b44f8-f788-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('079b44f8-f788-11e3-8c8a-005056be1f7b-BUQi-F6ig-AYWG-HLpX-CnQd-BGeP', '079b44f8-f788-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('09f4768d-f78e-11e3-8c8a-005056be1f7b-BgRu-FArw-AQHG-HHTp-C8eI-Bm3Y', '09f4768d-f78e-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'зеленый', ''),
('09f4768d-f78e-11e3-8c8a-005056be1f7b-Bik4-FE4q-Adln-H1KQ-C9dl-BfNl', '09f4768d-f78e-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('09f4768d-f78e-11e3-8c8a-005056be1f7b-BK92-Fqvt-ArYa-HpRl-C3y4-Bmyk', '09f4768d-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('09f4768d-f78e-11e3-8c8a-005056be1f7b-BMQY-FzHj-AFFC-HrkQ-CT5z-Bw1n', '09f4768d-f78e-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1900', 'г'),
('09f4768d-f78e-11e3-8c8a-005056be1f7b-BTid-F7x0-AXm4-H5KT-Cns4-Bgxx', '09f4768d-f78e-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('09f4768d-f78e-11e3-8c8a-005056be1f7b-BTUg-FtAy-AV3m-HOfb-Cz5g-BhZs', '09f4768d-f78e-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('09f4768d-f78e-11e3-8c8a-005056be1f7b-BZFr-FfMB-AKKg-HSwY-Cr8W-BjnI', '09f4768d-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('0d8fcbcd-99a8-11db-937f-000e0c431b59-B6T9-F7va-AxjK-HScs-Cv7B-BzNt', '0d8fcbcd-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'PARADE', ''),
('0d8fcbcd-99a8-11db-937f-000e0c431b59-BdTD-FQro-ANNi-HbjA-Cyom-B7dZ', '0d8fcbcd-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('0d8fcbcd-99a8-11db-937f-000e0c431b59-Bea7-FC2f-ADqK-Hqmn-CFi7-BEes', '0d8fcbcd-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('0d8fcbcd-99a8-11db-937f-000e0c431b59-BeSR-Fpku-AXVq-HZL4-CIpU-BEsM', '0d8fcbcd-99a8-11db-937f-000e0c431b59', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '4', 'л'),
('0d8fcbcd-99a8-11db-937f-000e0c431b59-BFmI-Fyx0-AzjA-Hcb2-Cxue-B4hd', '0d8fcbcd-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('0d8fcbcd-99a8-11db-937f-000e0c431b59-Bkw3-Fucf-AYiD-HVmi-CDH1-BVxb', '0d8fcbcd-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'грунт', ''),
('0d8fcbcd-99a8-11db-937f-000e0c431b59-BSR1-FiJt-AKus-HK2B-CwBn-B21V', '0d8fcbcd-99a8-11db-937f-000e0c431b59', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('0d8fcbcd-99a8-11db-937f-000e0c431b59-BTnG-Fx9j-Avkx-HYl7-Cf4N-BVbX', '0d8fcbcd-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('0d8fcbcf-99a8-11db-937f-000e0c431b59-BCqx-F8vE-ApRb-Hikk-CB3a-BMyR', '0d8fcbcf-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('0d8fcbcf-99a8-11db-937f-000e0c431b59-BFKw-Fwj9-Aqso-HAxX-CNXJ-BGIm', '0d8fcbcf-99a8-11db-937f-000e0c431b59', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('0d8fcbcf-99a8-11db-937f-000e0c431b59-BKIV-Fglf-AAqR-HA7t-C30Z-Bp8K', '0d8fcbcf-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'PARADE', ''),
('0d8fcbcf-99a8-11db-937f-000e0c431b59-BlgK-Fp2x-AO65-HFQr-CgW3-BTJc', '0d8fcbcf-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('0d8fcbcf-99a8-11db-937f-000e0c431b59-BRzL-F719-ATEV-HdKd-CFvA-BPb3', '0d8fcbcf-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('0d8fcbcf-99a8-11db-937f-000e0c431b59-BTFJ-FlGF-AU9F-HtoC-C5Yo-BWj1', '0d8fcbcf-99a8-11db-937f-000e0c431b59', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '10', 'л'),
('0d8fcbcf-99a8-11db-937f-000e0c431b59-Bumc-FLLC-AvM6-HMZt-Cdj3-ByFd', '0d8fcbcf-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('0d8fcbcf-99a8-11db-937f-000e0c431b59-BZVD-FUhc-AEAB-H7yH-CZIN-BjtT', '0d8fcbcf-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'грунт', ''),
('0d8fcbd1-99a8-11db-937f-000e0c431b59-B9oM-FMXw-ANY9-H7ZX-CifY-B0jS', '0d8fcbd1-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'грунт', ''),
('0d8fcbd1-99a8-11db-937f-000e0c431b59-BchY-FEnc-A4FN-HtjA-CALs-BBYl', '0d8fcbd1-99a8-11db-937f-000e0c431b59', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '2.5', 'л'),
('0d8fcbd1-99a8-11db-937f-000e0c431b59-BGAb-FD5B-As47-HBN6-CHqd-BguH', '0d8fcbd1-99a8-11db-937f-000e0c431b59', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'с увеличенным выходом', ''),
('0d8fcbd1-99a8-11db-937f-000e0c431b59-BmsA-FN3F-Amz8-H4jo-C05S-BU0G', '0d8fcbd1-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('0d8fcbd1-99a8-11db-937f-000e0c431b59-BpER-Fux6-AwrU-HbE4-CRdP-BVxw', '0d8fcbd1-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('0d8fcbd1-99a8-11db-937f-000e0c431b59-BrAD-FBbH-A6tl-HKEY-C73R-BtrG', '0d8fcbd1-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('0d8fcbd1-99a8-11db-937f-000e0c431b59-BVnU-FEyI-AiRl-HFDz-Cbvz-BewR', '0d8fcbd1-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'PARADE', ''),
('0d8fcbd1-99a8-11db-937f-000e0c431b59-Bx3w-Fzyl-A7Ot-HKxd-Cddh-BvNV', '0d8fcbd1-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('0ff22851-f78f-11e3-8c8a-005056be1f7b-BC0c-FZGK-AYWm-HyiH-CF1x-B0Hh', '0ff22851-f78f-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('0ff22851-f78f-11e3-8c8a-005056be1f7b-BCCR-Fp5w-AuC2-HU4Z-CJTC-B1lJ', '0ff22851-f78f-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('0ff22851-f78f-11e3-8c8a-005056be1f7b-BRq4-FRt1-Accy-Hpcc-CxQ2-B85k', '0ff22851-f78f-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('0ff22851-f78f-11e3-8c8a-005056be1f7b-Bta6-FD2F-ALn0-HD7L-Ct9N-BAoH', '0ff22851-f78f-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('0ff22851-f78f-11e3-8c8a-005056be1f7b-BxYK-FosE-AE2X-HGr0-CQbZ-BMfQ', '0ff22851-f78f-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('0ff22851-f78f-11e3-8c8a-005056be1f7b-Bzk0-FoQc-AGDt-H9Bn-CiDn-BAdt', '0ff22851-f78f-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '6000', 'г'),
('0ff22851-f78f-11e3-8c8a-005056be1f7b-BZmq-FSG4-AywT-HaJI-Cw52-BSLq', '0ff22851-f78f-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'розово-бежевый', ''),
('1004a95c-f787-11e3-8c8a-005056be1f7b-B0rn-F8u2-AWN7-H1D7-CtHK-BUKm', '1004a95c-f787-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('1004a95c-f787-11e3-8c8a-005056be1f7b-B1A4-F20X-AMYJ-HNbI-CvLR-Bjuv', '1004a95c-f787-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '800', 'г'),
('1004a95c-f787-11e3-8c8a-005056be1f7b-BCwT-FUSp-ASEB-H9eU-CZvA-BC0h', '1004a95c-f787-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('1004a95c-f787-11e3-8c8a-005056be1f7b-BDNl-FDbw-A9Vy-H1LN-CIKX-BNpQ', '1004a95c-f787-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый матовый', ''),
('1004a95c-f787-11e3-8c8a-005056be1f7b-BHJ8-F6AI-AIJS-HfW9-CvVp-BZTa', '1004a95c-f787-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('1004a95c-f787-11e3-8c8a-005056be1f7b-BRpn-FNgr-AKQy-HUk0-C7sJ-B4nJ', '1004a95c-f787-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('1004a95c-f787-11e3-8c8a-005056be1f7b-BuJx-FieY-AiaG-HrUu-C2Wg-BKrz', '1004a95c-f787-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('11d9ec94-f788-11e3-8c8a-005056be1f7b-B1Nv-FImm-Awno-Hcv8-CcdL-BwxK', '11d9ec94-f788-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('11d9ec94-f788-11e3-8c8a-005056be1f7b-B55E-FVVO-A0MS-HY1n-CBCp-BIT0', '11d9ec94-f788-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('11d9ec94-f788-11e3-8c8a-005056be1f7b-B9Kk-Fx4j-AGbc-HTDq-C345-BoCg', '11d9ec94-f788-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('11d9ec94-f788-11e3-8c8a-005056be1f7b-BLBH-FQTj-A5Um-Hv1B-CboX-Bicy', '11d9ec94-f788-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'розово-бежевый', ''),
('11d9ec94-f788-11e3-8c8a-005056be1f7b-BrNU-FU0L-AWaz-Ht9S-Ch3N-BmOi', '11d9ec94-f788-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('11d9ec94-f788-11e3-8c8a-005056be1f7b-BRyJ-F6R6-A4tZ-HEfM-CPdW-B1RQ', '11d9ec94-f788-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('11d9ec94-f788-11e3-8c8a-005056be1f7b-BZXr-F3ru-Aijo-HdNr-C0eg-BJax', '11d9ec94-f788-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '800', 'г'),
('138c38bb-f78e-11e3-8c8a-005056be1f7b-B3HG-F8jf-AKiD-HxEV-CPzb-Beu5', '138c38bb-f78e-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('138c38bb-f78e-11e3-8c8a-005056be1f7b-BEIv-FKfN-AzzE-HbYN-C9hn-BfSb', '138c38bb-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('138c38bb-f78e-11e3-8c8a-005056be1f7b-BfWI-FTEM-A79T-Hsnm-CAgt-BHdT', '138c38bb-f78e-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('138c38bb-f78e-11e3-8c8a-005056be1f7b-BJZg-FuyP-AxwJ-HYwq-CuwG-BzzK', '138c38bb-f78e-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'светло-зеленый', ''),
('138c38bb-f78e-11e3-8c8a-005056be1f7b-Bno2-Fqc7-ACsv-HdMg-CYs4-BhB8', '138c38bb-f78e-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('138c38bb-f78e-11e3-8c8a-005056be1f7b-Bu97-FDrj-ApsF-HZzj-CtcO-BlJq', '138c38bb-f78e-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1900', 'г'),
('138c38bb-f78e-11e3-8c8a-005056be1f7b-BvFO-F6dB-AlNx-HsDn-C4Hw-BpSR', '138c38bb-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('13ce3df2-93b0-11e3-82a4-005056be1f7b-BENZ-FCso-AN8k-HCUF-CcCj-BXB0', '13ce3df2-93b0-11e3-82a4-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('13ce3df2-93b0-11e3-82a4-005056be1f7b-Bi4g-Fmuz-AslU-HCV1-C8gs-BKyB', '13ce3df2-93b0-11e3-82a4-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'грунт-эмаль', ''),
('13ce3df2-93b0-11e3-82a4-005056be1f7b-BJrL-FBEO-AgS9-HeOK-CP6z-BWfZ', '13ce3df2-93b0-11e3-82a4-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('13ce3df2-93b0-11e3-82a4-005056be1f7b-BL3M-FRST-AF1d-HGxr-C1ZI-Bhll', '13ce3df2-93b0-11e3-82a4-005056be1f7b', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для ржавчины', ''),
('13ce3df2-93b0-11e3-82a4-005056be1f7b-Bmar-FMdB-AR6E-H2SF-C1fT-Buf6', '13ce3df2-93b0-11e3-82a4-005056be1f7b', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '2', 'л'),
('13ce3df2-93b0-11e3-82a4-005056be1f7b-BMN5-FAma-AWQG-HaGx-ChKB-B8Nt', '13ce3df2-93b0-11e3-82a4-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('13ce3df2-93b0-11e3-82a4-005056be1f7b-BqoH-FjkV-A9fQ-H74N-Ce0L-BlhQ', '13ce3df2-93b0-11e3-82a4-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'синий', ''),
('13ce3df2-93b0-11e3-82a4-005056be1f7b-Bsd6-F9az-AM6y-HYgW-CopD-BzrH', '13ce3df2-93b0-11e3-82a4-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('159d698c-e90f-11e0-9e45-3c4a92ed9378-B00B-Fefg-AYse-H8yi-CpvJ-BHHj', '159d698c-e90f-11e0-9e45-3c4a92ed9378', 'e8287600-ad96-11e3-b114-005056be1f7c', 'СЕНЕЖ', ''),
('159d698c-e90f-11e0-9e45-3c4a92ed9378-B7kb-FWZj-ALpk-HIZJ-Ckh4-Bglm', '159d698c-e90f-11e0-9e45-3c4a92ed9378', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'трудновымываемый', ''),
('159d698c-e90f-11e0-9e45-3c4a92ed9378-Bco5-FFJz-Ahta-HyHz-CQA7-Btjb', '159d698c-e90f-11e0-9e45-3c4a92ed9378', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('159d698c-e90f-11e0-9e45-3c4a92ed9378-BgaB-FBY1-AkDl-HtLt-CS3C-BhKe', '159d698c-e90f-11e0-9e45-3c4a92ed9378', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для дерева', ''),
('159d698c-e90f-11e0-9e45-3c4a92ed9378-BIt7-FDtc-AYYf-Hgf4-CM9i-BGDs', '159d698c-e90f-11e0-9e45-3c4a92ed9378', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('159d698c-e90f-11e0-9e45-3c4a92ed9378-BKDh-Fwxs-AfFl-Hinv-CC1Y-BiPV', '159d698c-e90f-11e0-9e45-3c4a92ed9378', '1d08380b-ce34-11e4-a80e-005056be1f7a', '5000', 'г'),
('159d698c-e90f-11e0-9e45-3c4a92ed9378-BMmf-FY8E-AM6m-H06o-CTbF-BUdd', '159d698c-e90f-11e0-9e45-3c4a92ed9378', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'антисептический состав', ''),
('159d698c-e90f-11e0-9e45-3c4a92ed9378-BnbR-FPbN-A4up-H0FI-CcPL-B0C9', '159d698c-e90f-11e0-9e45-3c4a92ed9378', 'd17cb785-d20b-11e4-9be0-005056be1f7c', 'защита от насекомых древоточцев', ''),
('159d698c-e90f-11e0-9e45-3c4a92ed9378-BrTP-FRbo-AbBM-HVix-C9hx-B0CT', '159d698c-e90f-11e0-9e45-3c4a92ed9378', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('159d698c-e90f-11e0-9e45-3c4a92ed9378-BsiE-FTGs-AFJj-Hdsy-CzVP-BHkq', '159d698c-e90f-11e0-9e45-3c4a92ed9378', 'd17cb785-d20b-11e4-9be0-005056be1f7c', 'защита от биопоражений', ''),
('159d698e-e90f-11e0-9e45-3c4a92ed9378-B3Wn-FEUP-AVoa-Hrrg-CEUu-ByLt', '159d698e-e90f-11e0-9e45-3c4a92ed9378', 'd17cb785-d20b-11e4-9be0-005056be1f7c', 'защита от биопоражений', ''),
('159d698e-e90f-11e0-9e45-3c4a92ed9378-BHEn-FqiV-AeXq-HufR-Cb1w-B41R', '159d698e-e90f-11e0-9e45-3c4a92ed9378', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('159d698e-e90f-11e0-9e45-3c4a92ed9378-BjFs-F5Aj-AIYP-Hunc-CeOe-BzCI', '159d698e-e90f-11e0-9e45-3c4a92ed9378', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'антисептический состав', ''),
('159d698e-e90f-11e0-9e45-3c4a92ed9378-BlBU-Fynx-A3fq-H7mv-CV63-BaFW', '159d698e-e90f-11e0-9e45-3c4a92ed9378', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для дерева', ''),
('159d698e-e90f-11e0-9e45-3c4a92ed9378-BmOu-F29X-AUdm-HzTp-C87k-BlQa', '159d698e-e90f-11e0-9e45-3c4a92ed9378', 'd17cb785-d20b-11e4-9be0-005056be1f7c', 'защита от насекомых древоточцев', ''),
('159d698e-e90f-11e0-9e45-3c4a92ed9378-Bn5n-FT1Q-AFMM-H9mR-CULW-BDFW', '159d698e-e90f-11e0-9e45-3c4a92ed9378', '1d08380b-ce34-11e4-a80e-005056be1f7a', '10000', 'г'),
('159d698e-e90f-11e0-9e45-3c4a92ed9378-BSGE-FJeJ-AAVV-H51O-CYql-BPNu', '159d698e-e90f-11e0-9e45-3c4a92ed9378', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('159d698e-e90f-11e0-9e45-3c4a92ed9378-BVeb-FAeg-AJ8w-HV8y-CUpW-BY0d', '159d698e-e90f-11e0-9e45-3c4a92ed9378', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('159d698e-e90f-11e0-9e45-3c4a92ed9378-BZAO-FMVL-ABp2-HYE1-C2M5-Be3d', '159d698e-e90f-11e0-9e45-3c4a92ed9378', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'трудновымываемый', ''),
('159d698e-e90f-11e0-9e45-3c4a92ed9378-BzX1-FgIW-AykM-HldD-C33D-BGFZ', '159d698e-e90f-11e0-9e45-3c4a92ed9378', 'e8287600-ad96-11e3-b114-005056be1f7c', 'СЕНЕЖ', ''),
('159d6990-e90f-11e0-9e45-3c4a92ed9378-B57m-FQpg-AaCJ-HOn9-C7Fc-BGTX', '159d6990-e90f-11e0-9e45-3c4a92ed9378', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'антисептический состав', ''),
('159d6990-e90f-11e0-9e45-3c4a92ed9378-BbeJ-FO6k-AMYU-Hp8i-CusA-BQM0', '159d6990-e90f-11e0-9e45-3c4a92ed9378', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для дерева', ''),
('159d6990-e90f-11e0-9e45-3c4a92ed9378-Bjqp-FFqZ-A1jf-HRmc-Cg7w-B0LB', '159d6990-e90f-11e0-9e45-3c4a92ed9378', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('159d6990-e90f-11e0-9e45-3c4a92ed9378-BOa7-FqCI-AVoP-H73n-CMnb-Behd', '159d6990-e90f-11e0-9e45-3c4a92ed9378', 'd17cb785-d20b-11e4-9be0-005056be1f7c', 'защита от биопоражений', ''),
('159d6990-e90f-11e0-9e45-3c4a92ed9378-Brfv-FCKt-Al6c-HlMo-ClHl-BNXQ', '159d6990-e90f-11e0-9e45-3c4a92ed9378', '1d08380b-ce34-11e4-a80e-005056be1f7a', '5000', 'г'),
('159d6990-e90f-11e0-9e45-3c4a92ed9378-BrnO-FM61-Aobw-Hba9-Ccud-BjNF', '159d6990-e90f-11e0-9e45-3c4a92ed9378', 'e8287600-ad96-11e3-b114-005056be1f7c', 'СЕНЕЖ', ''),
('159d6990-e90f-11e0-9e45-3c4a92ed9378-BTfH-FdmK-AOat-HhIQ-Cnr8-BSxo', '159d6990-e90f-11e0-9e45-3c4a92ed9378', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'трудновымываемый', ''),
('159d6990-e90f-11e0-9e45-3c4a92ed9378-BTUd-FPPT-ATFK-HHDu-CyjT-BrhF', '159d6990-e90f-11e0-9e45-3c4a92ed9378', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('159d6990-e90f-11e0-9e45-3c4a92ed9378-Bubf-Fd0o-AumV-Hs5J-CWmx-Blzs', '159d6990-e90f-11e0-9e45-3c4a92ed9378', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('159d6990-e90f-11e0-9e45-3c4a92ed9378-BuyS-F5C6-A39A-HVFU-Csxz-BezA', '159d6990-e90f-11e0-9e45-3c4a92ed9378', 'd17cb785-d20b-11e4-9be0-005056be1f7c', 'защита от насекомых древоточцев', ''),
('159d6992-e90f-11e0-9e45-3c4a92ed9378-B1gA-Fpi4-ADDN-H1A9-CYgf-BbYo', '159d6992-e90f-11e0-9e45-3c4a92ed9378', 'e8287600-ad96-11e3-b114-005056be1f7c', 'СЕНЕЖ', ''),
('159d6992-e90f-11e0-9e45-3c4a92ed9378-B5QR-FbyG-AfoN-HANX-CQjP-BMnC', '159d6992-e90f-11e0-9e45-3c4a92ed9378', 'd17cb785-d20b-11e4-9be0-005056be1f7c', 'защита от биопоражений', ''),
('159d6992-e90f-11e0-9e45-3c4a92ed9378-Baac-Fbvi-AveV-Hl0L-CmNm-Bi5p', '159d6992-e90f-11e0-9e45-3c4a92ed9378', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('159d6992-e90f-11e0-9e45-3c4a92ed9378-BdbZ-FtGs-A4at-HTFq-C66M-B7lu', '159d6992-e90f-11e0-9e45-3c4a92ed9378', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('159d6992-e90f-11e0-9e45-3c4a92ed9378-BghC-F2IB-ACuP-HpTK-CUAa-Bo7m', '159d6992-e90f-11e0-9e45-3c4a92ed9378', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'трудновымываемый', ''),
('159d6992-e90f-11e0-9e45-3c4a92ed9378-BrPT-F7LM-AjYz-HB4X-CfTx-B8vi', '159d6992-e90f-11e0-9e45-3c4a92ed9378', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('159d6992-e90f-11e0-9e45-3c4a92ed9378-BSfW-FnCr-AXNg-HiyD-C1Hf-BiJP', '159d6992-e90f-11e0-9e45-3c4a92ed9378', '1d08380b-ce34-11e4-a80e-005056be1f7a', '10000', 'г'),
('159d6992-e90f-11e0-9e45-3c4a92ed9378-BTbs-FCux-Asqs-H5mU-Cpb9-Bded', '159d6992-e90f-11e0-9e45-3c4a92ed9378', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'антисептический состав', ''),
('159d6992-e90f-11e0-9e45-3c4a92ed9378-BV27-FEwi-AYcA-HX7f-C1OB-BM3D', '159d6992-e90f-11e0-9e45-3c4a92ed9378', 'd17cb785-d20b-11e4-9be0-005056be1f7c', 'защита от насекомых древоточцев', ''),
('159d6992-e90f-11e0-9e45-3c4a92ed9378-Bzox-FCey-AB4V-HgVt-CLyL-BkhR', '159d6992-e90f-11e0-9e45-3c4a92ed9378', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для дерева', ''),
('159d6994-e90f-11e0-9e45-3c4a92ed9378-BFpH-Fd0U-AuHK-Hr3q-Cv0G-BrQx', '159d6994-e90f-11e0-9e45-3c4a92ed9378', 'd17cb785-d20b-11e4-9be0-005056be1f7c', 'защита от огня', ''),
('159d6994-e90f-11e0-9e45-3c4a92ed9378-BGZ7-FRqC-AFRr-HGhe-CApi-ByHd', '159d6994-e90f-11e0-9e45-3c4a92ed9378', 'd17cb785-d20b-11e4-9be0-005056be1f7c', 'защита от насекомых древоточцев', ''),
('159d6994-e90f-11e0-9e45-3c4a92ed9378-BHLd-Fz7U-AjUk-HpOI-CCaj-Bix4', '159d6994-e90f-11e0-9e45-3c4a92ed9378', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('159d6994-e90f-11e0-9e45-3c4a92ed9378-BIEy-Fb5R-AioX-HTMR-CHz7-BvgE', '159d6994-e90f-11e0-9e45-3c4a92ed9378', 'd17cb785-d20b-11e4-9be0-005056be1f7c', 'защита от биопоражений', ''),
('159d6994-e90f-11e0-9e45-3c4a92ed9378-BiNo-FI33-AR5T-H1dG-CtGu-Bh4y', '159d6994-e90f-11e0-9e45-3c4a92ed9378', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'антисептический состав', ''),
('159d6994-e90f-11e0-9e45-3c4a92ed9378-BMag-FWTE-A15K-HZR8-Cv8r-B2IR', '159d6994-e90f-11e0-9e45-3c4a92ed9378', 'e8287600-ad96-11e3-b114-005056be1f7c', 'СЕНЕЖ', ''),
('159d6994-e90f-11e0-9e45-3c4a92ed9378-Bnny-FxDF-AvzD-HcrM-CuyX-BOoU', '159d6994-e90f-11e0-9e45-3c4a92ed9378', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для дерева', ''),
('159d6994-e90f-11e0-9e45-3c4a92ed9378-Bnpn-FqHV-A33K-HQGy-CloB-BPw4', '159d6994-e90f-11e0-9e45-3c4a92ed9378', '1d08380b-ce34-11e4-a80e-005056be1f7a', '5000', 'г'),
('159d6994-e90f-11e0-9e45-3c4a92ed9378-BqtG-FLjP-ACMr-Hu1u-CXQF-B5iX', '159d6994-e90f-11e0-9e45-3c4a92ed9378', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('159d6994-e90f-11e0-9e45-3c4a92ed9378-BZVg-FSRS-A3IK-H3id-ClFj-BWxV', '159d6994-e90f-11e0-9e45-3c4a92ed9378', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('159d6996-e90f-11e0-9e45-3c4a92ed9378-B24m-FJY4-AiWP-HnbF-Cs2p-B5b8', '159d6996-e90f-11e0-9e45-3c4a92ed9378', 'e8287600-ad96-11e3-b114-005056be1f7c', 'СЕНЕЖ', ''),
('159d6996-e90f-11e0-9e45-3c4a92ed9378-B4EY-FYxz-AkUB-HjGJ-CJc1-BCqY', '159d6996-e90f-11e0-9e45-3c4a92ed9378', 'd17cb785-d20b-11e4-9be0-005056be1f7c', 'защита от огня', ''),
('159d6996-e90f-11e0-9e45-3c4a92ed9378-B9sA-FCFu-AXPQ-HFeN-CPWH-B2ff', '159d6996-e90f-11e0-9e45-3c4a92ed9378', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('159d6996-e90f-11e0-9e45-3c4a92ed9378-Beto-FuzJ-A9Eg-HF6B-ClqF-Bcry', '159d6996-e90f-11e0-9e45-3c4a92ed9378', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'антисептический состав', ''),
('159d6996-e90f-11e0-9e45-3c4a92ed9378-BFR2-FlWx-An9e-HtaL-ChM0-BvIj', '159d6996-e90f-11e0-9e45-3c4a92ed9378', 'd17cb785-d20b-11e4-9be0-005056be1f7c', 'защита от биопоражений', ''),
('159d6996-e90f-11e0-9e45-3c4a92ed9378-BuE2-FAsT-AGaK-HwUl-CtTT-BtVZ', '159d6996-e90f-11e0-9e45-3c4a92ed9378', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для дерева', ''),
('159d6996-e90f-11e0-9e45-3c4a92ed9378-BuWE-Fbcm-A7cR-HeQZ-C8WF-BFzE', '159d6996-e90f-11e0-9e45-3c4a92ed9378', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('159d6996-e90f-11e0-9e45-3c4a92ed9378-BVq3-FNh6-Acyd-Hauw-COzD-BGba', '159d6996-e90f-11e0-9e45-3c4a92ed9378', 'd17cb785-d20b-11e4-9be0-005056be1f7c', 'защита от насекомых древоточцев', ''),
('159d6996-e90f-11e0-9e45-3c4a92ed9378-BvxO-F7jj-AhT3-H2DO-CQh9-B6Sx', '159d6996-e90f-11e0-9e45-3c4a92ed9378', '1d08380b-ce34-11e4-a80e-005056be1f7a', '10000', 'г'),
('159d6996-e90f-11e0-9e45-3c4a92ed9378-BZkL-FjRE-AQCE-HXuV-CKfr-BP8J', '159d6996-e90f-11e0-9e45-3c4a92ed9378', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('159d6998-e90f-11e0-9e45-3c4a92ed9378-B2yF-FbA3-AVUR-HaTg-CY5J-BF7H', '159d6998-e90f-11e0-9e45-3c4a92ed9378', 'd17cb785-d20b-11e4-9be0-005056be1f7c', 'защита от огня', ''),
('159d6998-e90f-11e0-9e45-3c4a92ed9378-B5bn-F5aK-Akxq-HYXn-Cv5z-B7OU', '159d6998-e90f-11e0-9e45-3c4a92ed9378', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('159d6998-e90f-11e0-9e45-3c4a92ed9378-B8va-F9Vh-AIe0-H0hp-CXfy-Bj8X', '159d6998-e90f-11e0-9e45-3c4a92ed9378', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('159d6998-e90f-11e0-9e45-3c4a92ed9378-B9IM-Fcj8-AOxw-HS4N-CtxS-BILF', '159d6998-e90f-11e0-9e45-3c4a92ed9378', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('159d6998-e90f-11e0-9e45-3c4a92ed9378-BAwi-F2m5-A4iO-Hr6g-Czz8-BduY', '159d6998-e90f-11e0-9e45-3c4a92ed9378', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для дерева', ''),
('159d6998-e90f-11e0-9e45-3c4a92ed9378-BeIt-F97J-ArFk-HMw4-CTZF-B0P8', '159d6998-e90f-11e0-9e45-3c4a92ed9378', 'd17cb785-d20b-11e4-9be0-005056be1f7c', 'защита от биопоражений', ''),
('159d6998-e90f-11e0-9e45-3c4a92ed9378-BhMK-FTeD-AhO2-H1WC-C7Tx-BWSI', '159d6998-e90f-11e0-9e45-3c4a92ed9378', 'e8287600-ad96-11e3-b114-005056be1f7c', 'СЕНЕЖ', ''),
('159d6998-e90f-11e0-9e45-3c4a92ed9378-Bkmq-FC84-ANrt-Htm5-C9HD-BrGA', '159d6998-e90f-11e0-9e45-3c4a92ed9378', 'd17cb785-d20b-11e4-9be0-005056be1f7c', 'защита от насекомых древоточцев', ''),
('159d6998-e90f-11e0-9e45-3c4a92ed9378-BmLp-F13l-AXsb-HVML-Ct1f-B6KO', '159d6998-e90f-11e0-9e45-3c4a92ed9378', '1d08380b-ce34-11e4-a80e-005056be1f7a', '6000', 'г'),
('159d6998-e90f-11e0-9e45-3c4a92ed9378-BoUL-FUsj-A8ee-Hxas-CIbe-BrSH', '159d6998-e90f-11e0-9e45-3c4a92ed9378', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'антисептический состав', ''),
('159d7e07-f790-11e3-8c8a-005056be1f7b-B4PT-FCuY-AxAS-Hf6n-Cf0c-BbJs', '159d7e07-f790-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('159d7e07-f790-11e3-8c8a-005056be1f7b-BDz7-FKPp-AbuP-HTps-CM9e-BAnP', '159d7e07-f790-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('159d7e07-f790-11e3-8c8a-005056be1f7b-Bg2v-FyWq-Ac3p-H5Uz-Cnba-BGyU', '159d7e07-f790-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('159d7e07-f790-11e3-8c8a-005056be1f7b-BHlc-FX5I-AFGG-HjHu-CzBA-BIDu', '159d7e07-f790-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('159d7e07-f790-11e3-8c8a-005056be1f7b-BO5b-FVei-AFTj-HFcn-Cz9e-Blx2', '159d7e07-f790-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '20000', 'г'),
('159d7e07-f790-11e3-8c8a-005056be1f7b-BTvy-Fov3-AmDJ-HeEu-CQ5s-B5VA', '159d7e07-f790-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('159d7e07-f790-11e3-8c8a-005056be1f7b-Bz8n-FaSJ-Ae6G-HatQ-Cek2-B6c4', '159d7e07-f790-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'светло-серый', ''),
('17a83679-f78f-11e3-8c8a-005056be1f7b-Beqi-F3fq-AZbz-Hxeg-CMSr-BXn2', '17a83679-f78f-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('17a83679-f78f-11e3-8c8a-005056be1f7b-Bf2s-FRv2-AdfM-Hmpe-CcKL-BBCq', '17a83679-f78f-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('17a83679-f78f-11e3-8c8a-005056be1f7b-Bies-FePi-AD24-HeMf-CpZm-BXzV', '17a83679-f78f-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('17a83679-f78f-11e3-8c8a-005056be1f7b-BMGr-FZtX-A5Lh-HFMj-Cw5B-B6bQ', '17a83679-f78f-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('17a83679-f78f-11e3-8c8a-005056be1f7b-BrbI-FgPn-ADc6-Huzj-CmUa-BUmL', '17a83679-f78f-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('17a83679-f78f-11e3-8c8a-005056be1f7b-Butg-FRyt-A1kn-H2fE-CIEj-B2iz', '17a83679-f78f-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '6000', 'г'),
('17a83679-f78f-11e3-8c8a-005056be1f7b-BxKK-FVJI-AN2w-H5JL-CuVJ-BKRz', '17a83679-f78f-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'охра', ''),
('1a0a8b6b-99a8-11db-937f-000e0c431b59-BBCu-FqlH-AKRJ-HDnt-CcdV-BOq1', '1a0a8b6b-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'бежевый', ''),
('1a0a8b6b-99a8-11db-937f-000e0c431b59-BERH-FOUu-A8wO-HSB5-CJUN-BxsL', '1a0a8b6b-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('1a0a8b6b-99a8-11db-937f-000e0c431b59-BGE3-FTuV-AmP3-HN3p-CIPZ-B11d', '1a0a8b6b-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('1a0a8b6b-99a8-11db-937f-000e0c431b59-BjXp-FnHp-AaCB-HfWn-C4cr-Bvwb', '1a0a8b6b-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1000', 'г'),
('1a0a8b6b-99a8-11db-937f-000e0c431b59-BTSn-FY9i-AjM6-HAYL-CMZN-B8Gz', '1a0a8b6b-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('1a0a8b6b-99a8-11db-937f-000e0c431b59-BVSY-FQSw-AbfM-HpcT-Cfhk-Bmw6', '1a0a8b6b-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('1a0a8b6b-99a8-11db-937f-000e0c431b59-BXur-FlDt-AgME-Ht0x-C6VF-BTmX', '1a0a8b6b-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('1a0a8b6d-99a8-11db-937f-000e0c431b59-B4OM-F5ui-AhnB-HOZx-CqfM-BYez', '1a0a8b6d-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('1a0a8b6d-99a8-11db-937f-000e0c431b59-B8Jk-FwNL-AcvV-Hf9J-Cp3Y-B2wJ', '1a0a8b6d-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('1a0a8b6d-99a8-11db-937f-000e0c431b59-BaTx-FbiM-APPr-HbnM-CQkV-B1Xj', '1a0a8b6d-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('1a0a8b6d-99a8-11db-937f-000e0c431b59-BCzV-FXUU-Ah0M-H719-CGRR-B4s1', '1a0a8b6d-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('1a0a8b6d-99a8-11db-937f-000e0c431b59-BF8F-FxZs-AAqT-HWhq-C7jf-BR8z', '1a0a8b6d-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('1a0a8b6d-99a8-11db-937f-000e0c431b59-BGZr-F0mj-Aouy-HElp-ChKD-BNyK', '1a0a8b6d-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'бежевый', ''),
('1a0a8b6d-99a8-11db-937f-000e0c431b59-Blfy-Fxbp-Awi7-HDbp-C4hn-B0VC', '1a0a8b6d-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '2000', 'г'),
('1a0a8b6f-99a8-11db-937f-000e0c431b59-BgGS-FdKt-AJER-HwDn-Czv9-Biwr', '1a0a8b6f-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('1a0a8b6f-99a8-11db-937f-000e0c431b59-Bgud-Fxgh-AbVT-HZ4G-CGsk-BcWR', '1a0a8b6f-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('1a0a8b6f-99a8-11db-937f-000e0c431b59-BQbT-FAUH-AUnb-HaZj-CCuI-BAYH', '1a0a8b6f-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '20000', 'г'),
('1a0a8b6f-99a8-11db-937f-000e0c431b59-BrVt-FBsQ-Aroz-HM6x-CCgS-B2Uu', '1a0a8b6f-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'бежевый', ''),
('1a0a8b6f-99a8-11db-937f-000e0c431b59-BsxB-Fghm-AoBt-H4xU-CSUF-BwIm', '1a0a8b6f-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('1a0a8b6f-99a8-11db-937f-000e0c431b59-BUj8-Fn02-AuGj-HUi7-CmQu-BoxR', '1a0a8b6f-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('1a0a8b6f-99a8-11db-937f-000e0c431b59-ByeV-ForQ-Abtx-HtkI-CdHO-BwlZ', '1a0a8b6f-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('1a0a8b71-99a8-11db-937f-000e0c431b59-B1VO-FSwo-A2yZ-HAzx-CIr7-BWJZ', '1a0a8b71-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('1a0a8b71-99a8-11db-937f-000e0c431b59-B3IN-Fbdw-AYGC-HIuz-CaAR-BtAl', '1a0a8b71-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый глянцевый', ''),
('1a0a8b71-99a8-11db-937f-000e0c431b59-BC0T-Fw7n-AqSG-HHKt-COSX-BasT', '1a0a8b71-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('1a0a8b71-99a8-11db-937f-000e0c431b59-BcZK-FJuJ-Azf6-HUd6-Cpg6-B0T2', '1a0a8b71-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '900', 'г'),
('1a0a8b71-99a8-11db-937f-000e0c431b59-BIhf-FKpQ-AAFR-HSzR-C4pn-BI9Z', '1a0a8b71-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('1a0a8b71-99a8-11db-937f-000e0c431b59-BIoM-FZ7B-Ar1r-HU0p-Cuwf-B90V', '1a0a8b71-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('1a0a8b71-99a8-11db-937f-000e0c431b59-BxzO-FM1D-AA9u-H7U4-CWca-B3nG', '1a0a8b71-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('1a0a8b73-99a8-11db-937f-000e0c431b59-B3DD-FHNa-A7zb-HzNt-ClLq-Bb7D', '1a0a8b73-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('1a0a8b73-99a8-11db-937f-000e0c431b59-B871-FuWP-A7SH-HVQa-CStE-BdO0', '1a0a8b73-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('1a0a8b73-99a8-11db-937f-000e0c431b59-BdNB-FZif-AVNB-HQNU-CI1U-BTkb', '1a0a8b73-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('1a0a8b73-99a8-11db-937f-000e0c431b59-BdoL-Fe5Y-AzDP-HJWz-ClA3-BYSw', '1a0a8b73-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('1a0a8b73-99a8-11db-937f-000e0c431b59-Bn0K-FtHU-AcVn-H1wW-CKOv-BUYg', '1a0a8b73-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый глянцевый', ''),
('1a0a8b73-99a8-11db-937f-000e0c431b59-BoDx-FR4j-AoEx-HZYL-C73Y-B8S8', '1a0a8b73-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('1a0a8b73-99a8-11db-937f-000e0c431b59-Br4W-FzOm-APhW-HUAk-CT3o-BWA3', '1a0a8b73-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1900', 'г'),
('1a0a8b75-99a8-11db-937f-000e0c431b59-B1mv-F8Rm-ABAJ-H9Fg-CJxJ-B32F', '1a0a8b75-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('1a0a8b75-99a8-11db-937f-000e0c431b59-BcdL-F35J-A7s9-HnSu-Cmeh-Bl1T', '1a0a8b75-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('1a0a8b75-99a8-11db-937f-000e0c431b59-BlhW-FN20-A1DZ-Ha9E-Cxyr-Bjw9', '1a0a8b75-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('1a0a8b75-99a8-11db-937f-000e0c431b59-BLx0-FVvE-A362-HBxt-CHZQ-BdnH', '1a0a8b75-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('1a0a8b75-99a8-11db-937f-000e0c431b59-BqsO-FhuC-AR3b-HhVE-Cpyi-B1rd', '1a0a8b75-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '20000', 'г'),
('1a0a8b75-99a8-11db-937f-000e0c431b59-Brms-FE7t-ApQm-HUnm-CMak-B5oX', '1a0a8b75-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('1a0a8b75-99a8-11db-937f-000e0c431b59-Bx8r-FOw6-A9YH-Hp1D-Csh7-BEWL', '1a0a8b75-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый глянцевый', ''),
('1a0a8b7b-99a8-11db-937f-000e0c431b59-B0pw-FEfN-AYeo-HX7M-CTMt-Bj5P', '1a0a8b7b-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('1a0a8b7b-99a8-11db-937f-000e0c431b59-B6m2-FzBz-ACOF-H1aT-C9b0-Bbh6', '1a0a8b7b-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('1a0a8b7b-99a8-11db-937f-000e0c431b59-BApd-FF7y-AAUb-H8mn-CC3w-BUKK', '1a0a8b7b-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый матовый', ''),
('1a0a8b7b-99a8-11db-937f-000e0c431b59-BbPx-FMXq-AHpd-HpzG-CNyw-BA4S', '1a0a8b7b-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('1a0a8b7b-99a8-11db-937f-000e0c431b59-BiSI-FC88-AJLw-H6Mq-COZ8-BASn', '1a0a8b7b-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '20000', 'г'),
('1a0a8b7b-99a8-11db-937f-000e0c431b59-BNRw-F3ps-AE96-Hyhz-CE9E-B3Lc', '1a0a8b7b-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('1a0a8b7b-99a8-11db-937f-000e0c431b59-BQhP-Frf3-AViv-HH36-CSxh-BJni', '1a0a8b7b-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('1a0a8b7d-99a8-11db-937f-000e0c431b59-B5tT-FZxP-AknZ-HATL-CP4N-BbKj', '1a0a8b7d-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1000', 'г'),
('1a0a8b7d-99a8-11db-937f-000e0c431b59-B66e-FDen-AWfV-H9oE-Chv8-BSpw', '1a0a8b7d-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('1a0a8b7d-99a8-11db-937f-000e0c431b59-BH3u-F4y7-AkDW-HiEp-CLxC-BwcO', '1a0a8b7d-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('1a0a8b7d-99a8-11db-937f-000e0c431b59-BjCM-FQV9-Aa4q-Hf6b-CFlj-BKnq', '1a0a8b7d-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('1a0a8b7d-99a8-11db-937f-000e0c431b59-BOPz-Flx4-AQ9r-HTvJ-ChrF-BCvj', '1a0a8b7d-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('1a0a8b7d-99a8-11db-937f-000e0c431b59-BqIF-FBGt-AGnf-HD6K-C1Ka-BqvO', '1a0a8b7d-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('1a0a8b7d-99a8-11db-937f-000e0c431b59-BtXl-FoLJ-AdQH-HiIS-CArl-BJtj', '1a0a8b7d-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'бирюзовый', ''),
('1a0a8b7f-99a8-11db-937f-000e0c431b59-B3TB-F76I-ASY0-H7Nm-CDXL-BbQd', '1a0a8b7f-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '2000', 'г'),
('1a0a8b7f-99a8-11db-937f-000e0c431b59-Bakc-FGGY-AiLA-HIVn-CyPX-BHpK', '1a0a8b7f-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'бирюзовый', ''),
('1a0a8b7f-99a8-11db-937f-000e0c431b59-BDCb-Frqj-ABeE-HlHW-Cc2n-BzmH', '1a0a8b7f-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('1a0a8b7f-99a8-11db-937f-000e0c431b59-BKjX-F4R4-AH3B-HYgx-C1jz-BSRg', '1a0a8b7f-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('1a0a8b7f-99a8-11db-937f-000e0c431b59-BnDD-FnLY-AR0o-HoHU-Cyej-BmS1', '1a0a8b7f-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('1a0a8b7f-99a8-11db-937f-000e0c431b59-BuRW-FveU-A7Qs-HsfN-CkIR-Bovc', '1a0a8b7f-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('1a0a8b7f-99a8-11db-937f-000e0c431b59-BXPy-FxQH-A9fB-HM8L-CwYw-BOe3', '1a0a8b7f-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('1a0a8b81-99a8-11db-937f-000e0c431b59-Bg1j-FaCR-AfnL-H7Qu-Cs1q-BULE', '1a0a8b81-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('1a0a8b81-99a8-11db-937f-000e0c431b59-Bk7l-FVX9-A1xA-HXjs-C47r-BcQJ', '1a0a8b81-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('1a0a8b81-99a8-11db-937f-000e0c431b59-BLVB-FoU8-AY1u-HbWe-CZCh-Bwrg', '1a0a8b81-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('1a0a8b81-99a8-11db-937f-000e0c431b59-BpCW-Fp9k-ARC8-HdeO-C7zm-BTMY', '1a0a8b81-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('1a0a8b81-99a8-11db-937f-000e0c431b59-BTB2-FUZb-ACTX-Htwo-C4Se-Bcsh', '1a0a8b81-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '20000', 'г'),
('1a0a8b81-99a8-11db-937f-000e0c431b59-BVXW-FWw3-AJmc-H06t-CfxD-Bgt9', '1a0a8b81-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'бирюзовый', ''),
('1a0a8b81-99a8-11db-937f-000e0c431b59-BW0j-FUcD-AjZ4-HMsF-Cl5b-Bmiv', '1a0a8b81-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('1a0a8b83-99a8-11db-937f-000e0c431b59-BCkZ-Fjr2-AnKm-HvmI-CWpX-BfgD', '1a0a8b83-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('1a0a8b83-99a8-11db-937f-000e0c431b59-BCOJ-F2qm-AlNZ-H6yN-CXOK-BC9k', '1a0a8b83-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('1a0a8b83-99a8-11db-937f-000e0c431b59-BIIQ-FiDF-AwbT-H7eS-Cgh3-B7Gk', '1a0a8b83-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('1a0a8b83-99a8-11db-937f-000e0c431b59-BSD9-Fudl-Athy-Hbdt-ChxU-Blyc', '1a0a8b83-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'вишневый', ''),
('1a0a8b83-99a8-11db-937f-000e0c431b59-BV1M-Fpwq-A8TO-H1PU-CaDE-BLej', '1a0a8b83-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '2000', 'г'),
('1a0a8b83-99a8-11db-937f-000e0c431b59-Bxtu-FafX-Aj3C-H7Xi-C0gq-BQEu', '1a0a8b83-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('1a0a8b83-99a8-11db-937f-000e0c431b59-BZ7o-Fta0-Amyg-HGcE-CduI-Bbfl', '1a0a8b83-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('1a0a8b85-99a8-11db-937f-000e0c431b59-BbXU-Fsvi-ALNG-Hpg9-CjS3-Bwbg', '1a0a8b85-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('1a0a8b85-99a8-11db-937f-000e0c431b59-Bks2-FrYY-Ap9q-HhuH-CEfW-BIi4', '1a0a8b85-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('1a0a8b85-99a8-11db-937f-000e0c431b59-BMlQ-FA4n-Aglc-HZn0-CENr-B65G', '1a0a8b85-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('1a0a8b85-99a8-11db-937f-000e0c431b59-BUkE-FAIy-AIMU-HeU3-CXgd-BohX', '1a0a8b85-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1000', 'г'),
('1a0a8b85-99a8-11db-937f-000e0c431b59-BuOK-F7La-Aq4R-HXOc-Cbhe-BT24', '1a0a8b85-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'вишневый', ''),
('1a0a8b85-99a8-11db-937f-000e0c431b59-Bv5M-FJn9-AxhR-HSAA-CzuO-BAra', '1a0a8b85-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('1a0a8b85-99a8-11db-937f-000e0c431b59-BvOD-FChD-ACWy-HRXf-Cry4-BCho', '1a0a8b85-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('1a0a8b87-99a8-11db-937f-000e0c431b59-B8DQ-FT5h-AtfK-HATd-CDyt-Bbg1', '1a0a8b87-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('1a0a8b87-99a8-11db-937f-000e0c431b59-BdFe-FZwf-A3Ul-H6Qd-CpVT-Bx2X', '1a0a8b87-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '20000', 'г'),
('1a0a8b87-99a8-11db-937f-000e0c431b59-BEkY-FwrI-A9Xb-HOfU-CedY-BvwS', '1a0a8b87-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('1a0a8b87-99a8-11db-937f-000e0c431b59-BeQX-FsHn-ADhr-HHtL-CqSQ-BH4Q', '1a0a8b87-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('1a0a8b87-99a8-11db-937f-000e0c431b59-BEzI-FfDo-A1iH-HOU4-ChnZ-BVH6', '1a0a8b87-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('1a0a8b87-99a8-11db-937f-000e0c431b59-BiEb-FlAz-AJAV-H1Qa-ClmQ-BxSD', '1a0a8b87-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'вишневый', ''),
('1a0a8b87-99a8-11db-937f-000e0c431b59-BTfy-FefH-A8j6-HrBc-ChFC-B72u', '1a0a8b87-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('1a0a8b89-99a8-11db-937f-000e0c431b59-BayT-FaHh-ADQI-HLc9-CAos-BETy', '1a0a8b89-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1000', 'г'),
('1a0a8b89-99a8-11db-937f-000e0c431b59-Bbs6-Fj8Q-Ace4-H31B-CxTG-BRs4', '1a0a8b89-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'голубой', ''),
('1a0a8b89-99a8-11db-937f-000e0c431b59-BMuE-FoFz-AGwU-HAUf-CPjV-Bnz0', '1a0a8b89-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('1a0a8b89-99a8-11db-937f-000e0c431b59-BP1X-FPnx-A9TA-HTNm-CJlH-BLzy', '1a0a8b89-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('1a0a8b89-99a8-11db-937f-000e0c431b59-Bvc1-FoUr-AqIA-HwZt-CqNU-B4m1', '1a0a8b89-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('1a0a8b89-99a8-11db-937f-000e0c431b59-BxkN-FZge-A3Lz-HL0r-CjaZ-Be0W', '1a0a8b89-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('1a0a8b89-99a8-11db-937f-000e0c431b59-BYeB-FNqB-A6Pb-HUub-Crf5-BiKP', '1a0a8b89-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('1a0a8b8b-99a8-11db-937f-000e0c431b59-B1Dh-FUHc-A9bT-H2TO-CJKM-B2p6', '1a0a8b8b-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('1a0a8b8b-99a8-11db-937f-000e0c431b59-B28s-FftM-AdSk-H1dN-Cmij-BFJA', '1a0a8b8b-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('1a0a8b8b-99a8-11db-937f-000e0c431b59-B4Zk-FOZ6-Atpe-HFSU-CFtI-BYKQ', '1a0a8b8b-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'голубой', ''),
('1a0a8b8b-99a8-11db-937f-000e0c431b59-B6Oh-FEZ0-ACao-Hve8-CjYW-BKmw', '1a0a8b8b-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('1a0a8b8b-99a8-11db-937f-000e0c431b59-Bc1D-FwrW-AB1g-HNsL-CJwV-BYbU', '1a0a8b8b-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '2000', 'г'),
('1a0a8b8b-99a8-11db-937f-000e0c431b59-BEJO-Fp0r-A3mQ-HbrZ-Cchd-BA3l', '1a0a8b8b-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('1a0a8b8b-99a8-11db-937f-000e0c431b59-BFWc-Fkbu-A5ge-HD6o-CU13-B26S', '1a0a8b8b-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('1a0a8b8d-99a8-11db-937f-000e0c431b59-BGU7-FWvo-AwOL-HQOE-C2r5-B5dm', '1a0a8b8d-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'голубой', ''),
('1a0a8b8d-99a8-11db-937f-000e0c431b59-BIQZ-Fyq7-A9st-HmOS-C962-BMms', '1a0a8b8d-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('1a0a8b8d-99a8-11db-937f-000e0c431b59-BOeu-Fau0-Aemq-HZgJ-CCwo-BfjW', '1a0a8b8d-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('1a0a8b8d-99a8-11db-937f-000e0c431b59-BPDH-F9pV-ARnR-HI14-C2gm-BFBN', '1a0a8b8d-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '20000', 'г'),
('1a0a8b8d-99a8-11db-937f-000e0c431b59-BptO-FfkU-AC0p-HFIb-C3Qs-BSFY', '1a0a8b8d-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('1a0a8b8d-99a8-11db-937f-000e0c431b59-BQed-FwsL-A929-HTPa-CnVu-Bksg', '1a0a8b8d-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('1a0a8b8d-99a8-11db-937f-000e0c431b59-BriN-Fq2d-AGfz-H2Gh-CYVC-BJvx', '1a0a8b8d-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('1a0a8b8f-99a8-11db-937f-000e0c431b59-B8UK-FI6e-Ajf7-Hi38-CD09-BOLd', '1a0a8b8f-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1000', 'г'),
('1a0a8b8f-99a8-11db-937f-000e0c431b59-BaDM-FFJV-AhCl-HQUr-Cpku-BwiZ', '1a0a8b8f-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'желтый', ''),
('1a0a8b8f-99a8-11db-937f-000e0c431b59-BHAK-FMfN-Asn0-HNcF-C8SM-BltF', '1a0a8b8f-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('1a0a8b8f-99a8-11db-937f-000e0c431b59-BI1D-FZ94-ATzZ-H76b-CKVe-BXbn', '1a0a8b8f-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('1a0a8b8f-99a8-11db-937f-000e0c431b59-BIjy-Fift-A0pE-HeCg-CIvf-ByFu', '1a0a8b8f-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('1a0a8b8f-99a8-11db-937f-000e0c431b59-Bs9q-FUPB-AB5l-HvrJ-CLzA-BOP9', '1a0a8b8f-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('1a0a8b8f-99a8-11db-937f-000e0c431b59-BzHo-Fb4V-AkEL-HkTa-Cjc0-BXBf', '1a0a8b8f-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('1a1ab87b-f78e-11e3-8c8a-005056be1f7b-Bekb-FdVX-AMy9-HjAb-CkiR-BrTy', '1a1ab87b-f78e-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('1a1ab87b-f78e-11e3-8c8a-005056be1f7b-BfBT-FX6T-ATLo-Hwtn-CHKo-BYss', '1a1ab87b-f78e-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'синий', ''),
('1a1ab87b-f78e-11e3-8c8a-005056be1f7b-Bh1H-Fvhi-Arse-HpMz-CjAd-Bpd4', '1a1ab87b-f78e-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('1a1ab87b-f78e-11e3-8c8a-005056be1f7b-Boot-F3nU-AXGN-Hrb7-CK79-BeU5', '1a1ab87b-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('1a1ab87b-f78e-11e3-8c8a-005056be1f7b-BQBh-Fuqt-AjQu-HC6O-C7ay-BX4J', '1a1ab87b-f78e-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('1a1ab87b-f78e-11e3-8c8a-005056be1f7b-BvG9-Ftp0-AKPh-Hc72-CRM3-By8j', '1a1ab87b-f78e-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1900', 'г'),
('1a1ab87b-f78e-11e3-8c8a-005056be1f7b-BynF-Fcay-AGh0-Hv7s-CdkW-BMdA', '1a1ab87b-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('1b75918d-9fb8-11e3-8705-005056be1f7b-B3eO-Fpng-A8n6-H9F0-CBcb-Bklc', '1b75918d-9fb8-11e3-8705-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('1b75918d-9fb8-11e3-8705-005056be1f7b-B9BA-FtnF-AFBB-H7oo-CayN-Bi4v', '1b75918d-9fb8-11e3-8705-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('1b75918d-9fb8-11e3-8705-005056be1f7b-BHtc-FpB6-AXfv-HjZz-C2wR-Bb7T', '1b75918d-9fb8-11e3-8705-005056be1f7b', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('1b75918d-9fb8-11e3-8705-005056be1f7b-BijU-FSxo-AAWu-HlEW-CY71-Bnme', '1b75918d-9fb8-11e3-8705-005056be1f7b', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсальное', ''),
('1b75918d-9fb8-11e3-8705-005056be1f7b-BJjH-FFiN-AFjq-HgKR-C0s1-BUBo', '1b75918d-9fb8-11e3-8705-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('1b75918d-9fb8-11e3-8705-005056be1f7b-BUm6-FWik-AA0Y-HOhS-C0TQ-BVvw', '1b75918d-9fb8-11e3-8705-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '900', 'г'),
('1b75918d-9fb8-11e3-8705-005056be1f7b-Bv9V-Fbff-AtfO-HkzP-COyR-BPh5', '1b75918d-9fb8-11e3-8705-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('1b75918d-9fb8-11e3-8705-005056be1f7b-Bx4J-FeMK-A4bx-HJRR-C0ZB-BcEC', '1b75918d-9fb8-11e3-8705-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый матовый', ''),
('1b75918d-9fb8-11e3-8705-005056be1f7b-BXbi-FIB9-A83u-HOTr-CiGl-Bslx', '1b75918d-9fb8-11e3-8705-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('1bd57597-93b0-11e3-82a4-005056be1f7b-BcVI-F55Y-AJUc-Hwo2-CVXB-BxUB', '1bd57597-93b0-11e3-82a4-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('1bd57597-93b0-11e3-82a4-005056be1f7b-BEsK-FeQe-AvZ0-Hhda-CA7v-BI1p', '1bd57597-93b0-11e3-82a4-005056be1f7b', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.75', 'л'),
('1bd57597-93b0-11e3-82a4-005056be1f7b-Bg0A-F9vo-AzGC-H25X-C39F-BCcV', '1bd57597-93b0-11e3-82a4-005056be1f7b', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для ржавчины', ''),
('1bd57597-93b0-11e3-82a4-005056be1f7b-BhOv-FgvP-A7vL-Hs4B-CYZA-BYYv', '1bd57597-93b0-11e3-82a4-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'грунт-эмаль', ''),
('1bd57597-93b0-11e3-82a4-005056be1f7b-BKe4-F7rZ-A4pb-HjPP-CZDn-BUZj', '1bd57597-93b0-11e3-82a4-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('1bd57597-93b0-11e3-82a4-005056be1f7b-BtKc-F80Q-AXJZ-HhUR-CJev-BDbc', '1bd57597-93b0-11e3-82a4-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('1bd57597-93b0-11e3-82a4-005056be1f7b-BVtB-Frc0-AnRw-HMf7-C9Cp-Bkx1', '1bd57597-93b0-11e3-82a4-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'синий', ''),
('1bd57597-93b0-11e3-82a4-005056be1f7b-ByY5-FV6Y-Av4O-Hyxa-CJJK-BL2m', '1bd57597-93b0-11e3-82a4-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('1d967145-f787-11e3-8c8a-005056be1f7b-B1bY-Fgiu-AMfK-HADb-Cjxo-B6cf', '1d967145-f787-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '800', 'г'),
('1d967145-f787-11e3-8c8a-005056be1f7b-B2Bs-FGea-AIuw-HnlE-CBst-BxJh', '1d967145-f787-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('1d967145-f787-11e3-8c8a-005056be1f7b-BDHl-F1vM-A6w5-HokD-CMrI-BFwb', '1d967145-f787-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('1d967145-f787-11e3-8c8a-005056be1f7b-BHE4-FESE-AqTN-HUBV-C64W-Bn01', '1d967145-f787-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('1d967145-f787-11e3-8c8a-005056be1f7b-BHow-FbxT-A6W8-HNKl-CAJo-BsHl', '1d967145-f787-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'серебрянный', ''),
('1d967145-f787-11e3-8c8a-005056be1f7b-BKcu-FYxw-Atsq-HGWq-C8ax-BiRj', '1d967145-f787-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('1d967145-f787-11e3-8c8a-005056be1f7b-BuMV-Fo26-AsDn-H2JZ-CST3-BDsp', '1d967145-f787-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('1f4ff69d-f78f-11e3-8c8a-005056be1f7b-BDtf-FoFI-A2uj-H61C-CNHl-B7oy', '1f4ff69d-f78f-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '6000', 'г'),
('1f4ff69d-f78f-11e3-8c8a-005056be1f7b-BlbR-FfyF-AMGO-HauB-CJGk-BqKn', '1f4ff69d-f78f-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('1f4ff69d-f78f-11e3-8c8a-005056be1f7b-BLDA-FNp8-ADwg-H4gD-CbHf-BsnT', '1f4ff69d-f78f-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('1f4ff69d-f78f-11e3-8c8a-005056be1f7b-BQi7-Fwcc-A14k-HVmN-CpaD-BFdS', '1f4ff69d-f78f-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('1f4ff69d-f78f-11e3-8c8a-005056be1f7b-BQis-FhNy-A9gF-Hdzl-CnGJ-Bk3l', '1f4ff69d-f78f-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('1f4ff69d-f78f-11e3-8c8a-005056be1f7b-BVig-FDDf-A4XC-Hm7z-CGj1-Bthi', '1f4ff69d-f78f-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'серый', ''),
('1f4ff69d-f78f-11e3-8c8a-005056be1f7b-Byza-FCPK-AEZR-HpFb-CSRe-BTfK', '1f4ff69d-f78f-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('206ff829-f790-11e3-8c8a-005056be1f7b-B38q-F97l-AsYi-HNa9-CzzG-BitQ', '206ff829-f790-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('206ff829-f790-11e3-8c8a-005056be1f7b-BAmb-F8Da-AHFc-HUxM-CBIX-BFXH', '206ff829-f790-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'черный', ''),
('206ff829-f790-11e3-8c8a-005056be1f7b-BBvj-FdFW-AqHf-HDN3-CLkr-BAkR', '206ff829-f790-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('206ff829-f790-11e3-8c8a-005056be1f7b-Begm-FBC0-AIyo-HUSD-CqLB-BWJ8', '206ff829-f790-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '20000', 'г'),
('206ff829-f790-11e3-8c8a-005056be1f7b-BTEr-FuKY-AiUF-H96u-Cc7f-BBal', '206ff829-f790-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('206ff829-f790-11e3-8c8a-005056be1f7b-BWyy-FAjT-Adaa-HGqx-CJra-Blod', '206ff829-f790-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('206ff829-f790-11e3-8c8a-005056be1f7b-BYHt-F5K7-AxWg-HfWH-CwpL-BeZW', '206ff829-f790-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f87c-99a8-11db-937f-000e0c431b59-Bc5H-FbHk-AgE3-Htqm-Cyn7-B0w3', '20b7f87c-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'желтый', ''),
('20b7f87c-99a8-11db-937f-000e0c431b59-BdVX-FZ5Q-AX8Q-HVMc-CzoW-B8Gd', '20b7f87c-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f87c-99a8-11db-937f-000e0c431b59-BEYn-F1tX-Aq0n-H7Fp-C9Q6-BoKv', '20b7f87c-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '2000', 'г'),
('20b7f87c-99a8-11db-937f-000e0c431b59-Bfa2-FvwE-AOms-Hkjz-CDHb-Blix', '20b7f87c-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f87c-99a8-11db-937f-000e0c431b59-Bhmh-FaVO-ADK2-HAKo-C3n0-BPD4', '20b7f87c-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f87c-99a8-11db-937f-000e0c431b59-BKPp-F41P-As4X-HKf6-C9Uh-B7CJ', '20b7f87c-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f87c-99a8-11db-937f-000e0c431b59-Bzl9-FrlI-AVev-HVtz-CPPQ-BGBC', '20b7f87c-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f87e-99a8-11db-937f-000e0c431b59-B44o-FQDK-AMBe-Hu9h-C5C6-Bi4p', '20b7f87e-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'желтый', ''),
('20b7f87e-99a8-11db-937f-000e0c431b59-B5kh-Fvmt-A6vq-HlE5-Cif4-BpGl', '20b7f87e-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f87e-99a8-11db-937f-000e0c431b59-B7jo-Fjfu-APeA-HKJL-C7CE-BkTH', '20b7f87e-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f87e-99a8-11db-937f-000e0c431b59-Ba0H-Fkr1-ApFg-HSGv-Cc2Q-BHn6', '20b7f87e-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f87e-99a8-11db-937f-000e0c431b59-Bgvr-FDEx-Ayho-HEoS-CAj3-BhUf', '20b7f87e-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '20000', 'г'),
('20b7f87e-99a8-11db-937f-000e0c431b59-BugJ-FPQH-AwKK-HstE-CXpn-BBPJ', '20b7f87e-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f87e-99a8-11db-937f-000e0c431b59-Bveo-Fwpx-A8l1-HBMJ-CJ8q-BSN7', '20b7f87e-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f880-99a8-11db-937f-000e0c431b59-B3dU-Fgi9-Ayih-HrF2-CNWH-BdU9', '20b7f880-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f880-99a8-11db-937f-000e0c431b59-BbpU-F0Xa-A2kx-H9EI-C85U-BVkT', '20b7f880-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f880-99a8-11db-937f-000e0c431b59-BQPQ-F82V-A2Z1-HvF8-CXms-BEpw', '20b7f880-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'зеленый', ''),
('20b7f880-99a8-11db-937f-000e0c431b59-BuJE-FMBS-Ado9-Hbln-Cv0K-BqKq', '20b7f880-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1000', 'г'),
('20b7f880-99a8-11db-937f-000e0c431b59-BXg5-FLf0-ATd4-Hnye-C8ns-BngT', '20b7f880-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f880-99a8-11db-937f-000e0c431b59-ByOq-F4lH-Anub-H2OR-Cmq8-B8pU', '20b7f880-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f880-99a8-11db-937f-000e0c431b59-BzMX-Fq9d-AnWF-HWbu-CJTN-Bd1v', '20b7f880-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f882-99a8-11db-937f-000e0c431b59-B0D5-FgGR-AscG-HCvW-C7mr-BMAR', '20b7f882-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f882-99a8-11db-937f-000e0c431b59-B1UP-FYkR-AGf0-HQkQ-Cjnl-B6Rs', '20b7f882-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f882-99a8-11db-937f-000e0c431b59-BcI7-Faji-AEVh-HPBr-C6rK-BERS', '20b7f882-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f882-99a8-11db-937f-000e0c431b59-BdGx-FcXY-At7B-HU3T-CC3X-B8Ze', '20b7f882-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f882-99a8-11db-937f-000e0c431b59-BDUW-FoGE-AvMg-HDWL-CVzU-BSP4', '20b7f882-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f882-99a8-11db-937f-000e0c431b59-BPH7-FVKs-AsHU-HZTV-Cqxc-BePz', '20b7f882-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '2000', 'г'),
('20b7f882-99a8-11db-937f-000e0c431b59-BqdJ-FjH9-ADEl-HwrH-CFcR-BKoS', '20b7f882-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'зеленый', ''),
('20b7f884-99a8-11db-937f-000e0c431b59-B0If-FcAs-ALsx-H3Nw-C4W9-BQDw', '20b7f884-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f884-99a8-11db-937f-000e0c431b59-B39w-F4To-ANVh-HkT7-CEiE-BB5O', '20b7f884-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'зеленый', ''),
('20b7f884-99a8-11db-937f-000e0c431b59-B7qo-FKYi-ATUM-HEn5-C1nC-BWFD', '20b7f884-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f884-99a8-11db-937f-000e0c431b59-BEQv-F2J9-AnDV-HmTZ-CYPG-BDae', '20b7f884-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f884-99a8-11db-937f-000e0c431b59-BJMW-Fqxq-An3O-Hr4I-C7nu-BSsw', '20b7f884-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f884-99a8-11db-937f-000e0c431b59-Bltz-Fxyd-AsoG-HuBL-CyFc-Bj7m', '20b7f884-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '20000', 'г'),
('20b7f884-99a8-11db-937f-000e0c431b59-BtmW-FEBq-AZsd-H3Ms-CsFr-Be0A', '20b7f884-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f886-99a8-11db-937f-000e0c431b59-Best-FVTc-AZdz-HJf1-CiTc-BLWK', '20b7f886-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1000', 'г'),
('20b7f886-99a8-11db-937f-000e0c431b59-BGeR-FTG9-Aj82-HlsD-CJWu-BBBY', '20b7f886-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f886-99a8-11db-937f-000e0c431b59-Bikq-F4M0-ASkP-HZnq-C4Pa-BtDO', '20b7f886-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'коричневый', ''),
('20b7f886-99a8-11db-937f-000e0c431b59-BMv4-FSg5-AeU0-H857-Ckcg-BQWs', '20b7f886-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f886-99a8-11db-937f-000e0c431b59-Boq3-Foow-AkOO-HGek-CzvP-BJRT', '20b7f886-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f886-99a8-11db-937f-000e0c431b59-BQpT-FgE8-AM8N-HmqQ-C14B-BuLh', '20b7f886-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f886-99a8-11db-937f-000e0c431b59-Bylm-FDsH-Aoi4-H5rL-COyp-BfIw', '20b7f886-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f888-99a8-11db-937f-000e0c431b59-B2m5-Fiuq-AlDv-HpFC-Cojr-BvRY', '20b7f888-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f888-99a8-11db-937f-000e0c431b59-B8ob-FsUh-Av9G-HctX-C1Pv-BvpU', '20b7f888-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f888-99a8-11db-937f-000e0c431b59-BA43-FzCX-Aqkr-HIvD-CTEE-BCR9', '20b7f888-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f888-99a8-11db-937f-000e0c431b59-BdoH-Fsrv-AGg4-HLFX-CkFQ-Bd6T', '20b7f888-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f888-99a8-11db-937f-000e0c431b59-BgX5-FZj0-AxKF-HDnB-CXen-BRCY', '20b7f888-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f888-99a8-11db-937f-000e0c431b59-BSAt-FM5a-AXIP-HCoX-CyIF-BidZ', '20b7f888-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'коричневый', ''),
('20b7f888-99a8-11db-937f-000e0c431b59-Bvcf-F2gI-A44n-HgKq-C5HU-BW1o', '20b7f888-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '2000', 'г'),
('20b7f88a-99a8-11db-937f-000e0c431b59-B2de-F3ib-AN4g-HvXX-CCLr-B9ax', '20b7f88a-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f88a-99a8-11db-937f-000e0c431b59-B4ln-FAEW-AY5m-HJqR-Cect-B0TQ', '20b7f88a-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'коричневый', ''),
('20b7f88a-99a8-11db-937f-000e0c431b59-B69W-FxZA-AjyG-HoFP-CM8s-BrzR', '20b7f88a-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f88a-99a8-11db-937f-000e0c431b59-BbS3-FDcj-AU8B-HE7V-CUFh-Be2R', '20b7f88a-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f88a-99a8-11db-937f-000e0c431b59-BIMJ-FvtT-Acob-HxAS-Cc54-BF58', '20b7f88a-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f88a-99a8-11db-937f-000e0c431b59-BJDL-Fpzj-AD3u-Hu1L-CiwJ-B6jj', '20b7f88a-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '20000', 'г'),
('20b7f88a-99a8-11db-937f-000e0c431b59-BxT6-FPG7-Ahi2-Hbnw-CYFF-BRIh', '20b7f88a-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f88c-99a8-11db-937f-000e0c431b59-B4UT-FlL0-AALU-HGO9-CCJI-BgsN', '20b7f88c-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1000', 'г'),
('20b7f88c-99a8-11db-937f-000e0c431b59-B5Ke-FiEK-A0IZ-HfXq-CGdP-BERY', '20b7f88c-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f88c-99a8-11db-937f-000e0c431b59-B7IX-FCxd-AR0a-HArQ-CR1T-BdgJ', '20b7f88c-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'красный', ''),
('20b7f88c-99a8-11db-937f-000e0c431b59-BCjB-FxU3-A04o-HJzO-CsvW-BGxK', '20b7f88c-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f88c-99a8-11db-937f-000e0c431b59-BGi9-FyJy-AC5s-H1qZ-CAUF-BCn6', '20b7f88c-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f88c-99a8-11db-937f-000e0c431b59-BkEK-FBF2-ARXs-Hl1O-Cu4y-BvrJ', '20b7f88c-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f88c-99a8-11db-937f-000e0c431b59-BoqC-FS13-Ahin-H4pb-CEPg-BOQl', '20b7f88c-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f88e-99a8-11db-937f-000e0c431b59-BeMh-FqO7-ALqP-HAbJ-CBME-BORG', '20b7f88e-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f88e-99a8-11db-937f-000e0c431b59-BpVK-FQhv-Aj7C-Hkrb-CxLn-BV33', '20b7f88e-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f88e-99a8-11db-937f-000e0c431b59-BqrV-FGNt-AxTM-HCYe-CbSz-Bv5B', '20b7f88e-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'красный', ''),
('20b7f88e-99a8-11db-937f-000e0c431b59-BSDj-FhEA-ArGN-HvVe-C2B1-BCSX', '20b7f88e-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f88e-99a8-11db-937f-000e0c431b59-Bu6M-FFBb-ADDk-HMkS-CZRA-BuYN', '20b7f88e-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f88e-99a8-11db-937f-000e0c431b59-Bx2T-F1bB-ARPM-H6lF-Cy5J-BXbN', '20b7f88e-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f88e-99a8-11db-937f-000e0c431b59-BYIU-Fl5p-AGwr-H7y0-CUl1-BobS', '20b7f88e-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '2000', 'г'),
('20b7f890-99a8-11db-937f-000e0c431b59-B4XE-F9d6-AeyL-HJcC-CsxA-BEz5', '20b7f890-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f890-99a8-11db-937f-000e0c431b59-BDVS-Foe7-ApOd-HECA-C7wA-BnrJ', '20b7f890-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f890-99a8-11db-937f-000e0c431b59-BO2J-F0tC-AM5k-HIoA-CthY-Byg3', '20b7f890-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f890-99a8-11db-937f-000e0c431b59-Bpti-F3oK-A8dE-HG2g-CUPo-Bo2j', '20b7f890-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'красный', ''),
('20b7f890-99a8-11db-937f-000e0c431b59-BU8V-FC5J-ABOv-H33M-CLi7-Btal', '20b7f890-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f890-99a8-11db-937f-000e0c431b59-BuAq-F6JJ-A828-H87x-C3Ko-BBJX', '20b7f890-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f890-99a8-11db-937f-000e0c431b59-BwpB-Fum8-AheI-HLgR-Cjkn-B2OH', '20b7f890-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '20000', 'г'),
('20b7f896-99a8-11db-937f-000e0c431b59-BCse-FSaz-AyYj-Hfte-Cx12-B0Vc', '20b7f896-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f896-99a8-11db-937f-000e0c431b59-BHXM-Felu-Amh8-HcsR-CGdb-BwTE', '20b7f896-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f896-99a8-11db-937f-000e0c431b59-BpsO-FGxk-AzBE-Hdki-Cx0T-B6RQ', '20b7f896-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f896-99a8-11db-937f-000e0c431b59-Bu80-Fsar-A0hL-HbTf-CfWN-B0oo', '20b7f896-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1000', 'г'),
('20b7f896-99a8-11db-937f-000e0c431b59-BvJp-FzmQ-AYaP-HsVg-C9uq-BU5R', '20b7f896-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f896-99a8-11db-937f-000e0c431b59-BYKW-FKlw-Ac5X-HNhH-C7N1-BKTo', '20b7f896-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f896-99a8-11db-937f-000e0c431b59-BYuH-FR7d-A4Fv-HaaS-CTku-Bnus', '20b7f896-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'оранжевый', ''),
('20b7f898-99a8-11db-937f-000e0c431b59-B5O5-FFpN-AlKj-HzJO-Cd9r-BgWp', '20b7f898-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f898-99a8-11db-937f-000e0c431b59-BM97-F7zU-A5Dl-HGL0-C9h9-BAdw', '20b7f898-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f898-99a8-11db-937f-000e0c431b59-BMnD-FXe2-A5A9-Hq0C-CbLA-BXI1', '20b7f898-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f898-99a8-11db-937f-000e0c431b59-BsC4-FTJF-ATIn-HRIG-CEVt-BIsN', '20b7f898-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '2000', 'г'),
('20b7f898-99a8-11db-937f-000e0c431b59-BTPb-F79N-A5Lt-H2X9-CORM-BIX2', '20b7f898-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f898-99a8-11db-937f-000e0c431b59-BV9C-F6xL-AJRK-H2xh-CgHw-B9Dv', '20b7f898-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f898-99a8-11db-937f-000e0c431b59-BycD-FY9w-A3wn-Htw9-CMg7-BMOW', '20b7f898-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'оранжевый', ''),
('20b7f89a-99a8-11db-937f-000e0c431b59-B0nO-F9TO-AAvZ-HBJh-C22k-BuLt', '20b7f89a-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'охристо-желтый', ''),
('20b7f89a-99a8-11db-937f-000e0c431b59-B1e2-FdwA-Aj1W-HT0F-Ch9s-Bv8C', '20b7f89a-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f89a-99a8-11db-937f-000e0c431b59-B2za-F6Kh-A9io-H9uL-C84p-Bxzs', '20b7f89a-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f89a-99a8-11db-937f-000e0c431b59-BA9x-FZ07-A81y-Hil0-CRbd-BJ5P', '20b7f89a-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f89a-99a8-11db-937f-000e0c431b59-BIez-F7Ca-A6U3-HZex-CppR-BvMF', '20b7f89a-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f89a-99a8-11db-937f-000e0c431b59-BKeG-FhxF-AmVE-HVGC-CYGA-BLg0', '20b7f89a-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f89a-99a8-11db-937f-000e0c431b59-BOvD-FGKh-A5zM-HLlY-CRcN-BsYY', '20b7f89a-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1000', 'г'),
('20b7f89e-99a8-11db-937f-000e0c431b59-B9yr-Fjjy-ABDK-HOlm-Cmp0-Bz8i', '20b7f89e-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f89e-99a8-11db-937f-000e0c431b59-BB3B-FMQW-AVNW-HHhS-CZy2-Bi1G', '20b7f89e-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1000', 'г'),
('20b7f89e-99a8-11db-937f-000e0c431b59-BEWN-FRiy-Aq1R-H4iq-CSyD-BQsY', '20b7f89e-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f89e-99a8-11db-937f-000e0c431b59-Blp5-Fv4f-AYfL-HYVI-C70v-BU7S', '20b7f89e-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f89e-99a8-11db-937f-000e0c431b59-BonY-F7h7-Amzu-HqFc-CEEQ-Bwo1', '20b7f89e-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f89e-99a8-11db-937f-000e0c431b59-BPW8-F5Vs-AFTl-HvGb-CeVN-BhcX', '20b7f89e-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'светло-голубой', ''),
('20b7f89e-99a8-11db-937f-000e0c431b59-BRjI-FBPO-AeUS-HvG7-Clsl-Bfdf', '20b7f89e-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f8a0-99a8-11db-937f-000e0c431b59-Bf3f-Fn4Z-Az6t-HRT5-CB7S-BOcf', '20b7f8a0-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '2000', 'г'),
('20b7f8a0-99a8-11db-937f-000e0c431b59-BgwG-F35o-ALUd-HD3T-CKoo-Bltt', '20b7f8a0-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f8a0-99a8-11db-937f-000e0c431b59-BIub-FYXo-AIf4-HupU-CoLH-BuEB', '20b7f8a0-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f8a0-99a8-11db-937f-000e0c431b59-BmXN-FfNR-AIwe-HgxG-CRb1-Bi0V', '20b7f8a0-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f8a0-99a8-11db-937f-000e0c431b59-BouR-Fif7-A3JI-HA5M-CCTb-BYLu', '20b7f8a0-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f8a0-99a8-11db-937f-000e0c431b59-BwUa-FEFh-ABrP-HmNt-CIOm-BJb4', '20b7f8a0-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'светло-голубой', ''),
('20b7f8a0-99a8-11db-937f-000e0c431b59-BZPV-F3SO-ALc4-HzEm-CjNX-BAlv', '20b7f8a0-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f8a2-99a8-11db-937f-000e0c431b59-BCFC-FjC9-AFUa-HfIg-CyWb-BCTo', '20b7f8a2-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f8a2-99a8-11db-937f-000e0c431b59-BfkR-FAGE-AGXg-H77g-CScZ-BxFS', '20b7f8a2-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'светло-голубой', ''),
('20b7f8a2-99a8-11db-937f-000e0c431b59-BhxF-F2YD-AKnD-Hi6m-C0LR-Bu3c', '20b7f8a2-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f8a2-99a8-11db-937f-000e0c431b59-BlK3-FGVV-ADAT-Hl8T-CPAY-BRja', '20b7f8a2-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f8a2-99a8-11db-937f-000e0c431b59-BN6O-F7Mi-A2Of-HKc8-Cp9h-B80o', '20b7f8a2-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f8a2-99a8-11db-937f-000e0c431b59-BnGb-F4wd-AcGG-HMSz-CQzm-BWrB', '20b7f8a2-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '20000', 'г'),
('20b7f8a2-99a8-11db-937f-000e0c431b59-BQpv-FrK4-AN9P-HpBi-CTnt-BMtE', '20b7f8a2-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f8a4-99a8-11db-937f-000e0c431b59-B5z9-FqJ8-AKfW-HffO-CQFN-Bcbk', '20b7f8a4-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f8a4-99a8-11db-937f-000e0c431b59-BFRN-Fbwt-AqDz-H5fR-CeTt-BSQ9', '20b7f8a4-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f8a4-99a8-11db-937f-000e0c431b59-Bk9L-FWWV-AANJ-Hwf1-CUQA-B8IV', '20b7f8a4-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f8a4-99a8-11db-937f-000e0c431b59-BlDg-FM1D-A50e-HdHm-CMM4-BZoq', '20b7f8a4-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1000', 'г'),
('20b7f8a4-99a8-11db-937f-000e0c431b59-BvJn-F2V7-Armw-HU0d-CVYV-BA3v', '20b7f8a4-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f8a4-99a8-11db-937f-000e0c431b59-Bxcx-F7OT-Axik-Hxgs-CJbi-BHHs', '20b7f8a4-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f8a4-99a8-11db-937f-000e0c431b59-BZ2o-Fdak-AGZv-HYJo-C1xv-BSrh', '20b7f8a4-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'серый', ''),
('20b7f8a6-99a8-11db-937f-000e0c431b59-B469-F7ey-Anuy-Hpux-C7BB-B93P', '20b7f8a6-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f8a6-99a8-11db-937f-000e0c431b59-B89t-Fwne-Akkf-HljX-C2l7-BRWF', '20b7f8a6-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f8a6-99a8-11db-937f-000e0c431b59-BCia-FuIF-AScS-Hmfj-CKYe-BIV0', '20b7f8a6-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f8a6-99a8-11db-937f-000e0c431b59-Bivt-FCO1-ApaC-Hj1q-CP0C-BA9R', '20b7f8a6-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f8a6-99a8-11db-937f-000e0c431b59-BJVu-F9PQ-APuj-H0C1-C8o4-Be1t', '20b7f8a6-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'серый', ''),
('20b7f8a6-99a8-11db-937f-000e0c431b59-BQOB-F1NE-AqKs-Hjpi-CTNT-BDQh', '20b7f8a6-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f8a6-99a8-11db-937f-000e0c431b59-BWph-FpRC-AObb-Htkx-Csiv-BbUZ', '20b7f8a6-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '2000', 'г'),
('20b7f8a8-99a8-11db-937f-000e0c431b59-B0cD-F6xI-Ainp-HIYE-CYpJ-BCAq', '20b7f8a8-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f8a8-99a8-11db-937f-000e0c431b59-B75A-Fbgj-AzXL-Hwph-C2CM-BYrd', '20b7f8a8-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'серый', ''),
('20b7f8a8-99a8-11db-937f-000e0c431b59-Bb76-F3pf-ApYD-HbzY-C2vT-B2Nz', '20b7f8a8-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f8a8-99a8-11db-937f-000e0c431b59-BbDN-Fmz4-AJq6-HVFn-Czgk-BvZQ', '20b7f8a8-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f8a8-99a8-11db-937f-000e0c431b59-BgtF-FwwU-AQoB-HxvU-CKuw-BNpk', '20b7f8a8-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f8a8-99a8-11db-937f-000e0c431b59-BQFo-FUhe-AtYP-HCPd-C3qh-BGSW', '20b7f8a8-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f8a8-99a8-11db-937f-000e0c431b59-BWON-FBXm-AFwS-HPzS-C7WC-BBJy', '20b7f8a8-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '20000', 'г'),
('20b7f8aa-99a8-11db-937f-000e0c431b59-B6EC-FNT3-AgQO-HiRX-CWnw-BzBA', '20b7f8aa-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f8aa-99a8-11db-937f-000e0c431b59-BDS1-Fhc2-ABn6-HPKB-Cqry-BZJM', '20b7f8aa-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f8aa-99a8-11db-937f-000e0c431b59-BDsX-FCN9-AqS7-Hkl5-C2g9-B5uS', '20b7f8aa-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f8aa-99a8-11db-937f-000e0c431b59-Bgxt-FcXU-AXO1-HWIl-Co52-BN6p', '20b7f8aa-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f8aa-99a8-11db-937f-000e0c431b59-Bugb-Fl3j-AMhe-HDvZ-Csys-BjVL', '20b7f8aa-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1000', 'г'),
('20b7f8aa-99a8-11db-937f-000e0c431b59-BwQi-FAy1-AXKd-HKAe-CKEN-BhGb', '20b7f8aa-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f8aa-99a8-11db-937f-000e0c431b59-BWZc-FXNO-ArX9-Helo-CE84-BS9Q', '20b7f8aa-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'синий', ''),
('20b7f8ac-99a8-11db-937f-000e0c431b59-B16J-FbtT-AZRf-HJ2a-C1N6-B4xW', '20b7f8ac-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f8ac-99a8-11db-937f-000e0c431b59-BaXy-FVm0-AXTq-HLt1-CYdX-BzEQ', '20b7f8ac-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'синий', ''),
('20b7f8ac-99a8-11db-937f-000e0c431b59-BCvC-Fs8v-AjVO-H7LT-CNkj-BBf4', '20b7f8ac-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f8ac-99a8-11db-937f-000e0c431b59-BHrB-F6Lr-APi8-HZ2M-CbsH-BkJ2', '20b7f8ac-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '2000', 'г'),
('20b7f8ac-99a8-11db-937f-000e0c431b59-Bkz6-F93h-ArGk-HxJ9-ChMt-Bk6r', '20b7f8ac-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f8ac-99a8-11db-937f-000e0c431b59-BVeC-FkbN-A5oy-HdpU-CXQJ-BSOC', '20b7f8ac-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f8ac-99a8-11db-937f-000e0c431b59-BZQy-F5Tj-AUCX-HClt-COCG-BCYt', '20b7f8ac-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f8ae-99a8-11db-937f-000e0c431b59-B1uc-FyKU-AAlC-HIML-C0Gu-BJfd', '20b7f8ae-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f8ae-99a8-11db-937f-000e0c431b59-B2A3-FAtq-AJ5S-HULw-CpsS-BJon', '20b7f8ae-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '20000', 'г'),
('20b7f8ae-99a8-11db-937f-000e0c431b59-B4iJ-FZsA-AziN-HucB-CHjs-BIe5', '20b7f8ae-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'синий', ''),
('20b7f8ae-99a8-11db-937f-000e0c431b59-Bhge-F6Uw-AylO-HD6D-CXtP-B7ki', '20b7f8ae-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f8ae-99a8-11db-937f-000e0c431b59-BJVC-FWGe-AXND-HGWi-CBNS-BeBd', '20b7f8ae-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f8ae-99a8-11db-937f-000e0c431b59-BxMi-F2S6-AZTI-HsyJ-CLmL-BQdU', '20b7f8ae-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f8ae-99a8-11db-937f-000e0c431b59-ByBE-F2JR-ADJX-HxS4-CRbO-BTyU', '20b7f8ae-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f8b0-99a8-11db-937f-000e0c431b59-BECJ-FgsU-Aswk-HPBH-C2OV-Bofb', '20b7f8b0-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f8b0-99a8-11db-937f-000e0c431b59-BEVL-FQD9-AsLE-H24P-CdD4-BLZp', '20b7f8b0-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f8b0-99a8-11db-937f-000e0c431b59-BJns-FWvo-AQFY-HmdB-CsNa-BKuX', '20b7f8b0-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f8b0-99a8-11db-937f-000e0c431b59-BNOw-FRGq-Ahjt-HauJ-CFjz-B1xI', '20b7f8b0-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f8b0-99a8-11db-937f-000e0c431b59-BUDB-FEev-AOjV-HDaI-CLeL-BVA5', '20b7f8b0-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1000', 'г'),
('20b7f8b0-99a8-11db-937f-000e0c431b59-BuYc-Fh84-AkxM-Hswb-CHGI-BsLl', '20b7f8b0-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'темно-зеленый', ''),
('20b7f8b0-99a8-11db-937f-000e0c431b59-Bzqu-FNSO-APAb-HpLM-CDPh-BOgl', '20b7f8b0-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f8b2-99a8-11db-937f-000e0c431b59-B6BC-F2ug-AS6V-HxHO-CwFW-BUYh', '20b7f8b2-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f8b2-99a8-11db-937f-000e0c431b59-B8Hi-FTL9-AcXd-Hnse-CiYN-BOoM', '20b7f8b2-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f8b2-99a8-11db-937f-000e0c431b59-BLWb-Fxjt-AzUV-HqAu-CCUc-Bbqp', '20b7f8b2-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '2000', 'г'),
('20b7f8b2-99a8-11db-937f-000e0c431b59-Bpsq-FQ9r-AX16-Hteb-CKye-BL49', '20b7f8b2-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'темно-зеленый', ''),
('20b7f8b2-99a8-11db-937f-000e0c431b59-BQXZ-FlKh-A18m-HNSB-Cul2-BqZW', '20b7f8b2-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f8b2-99a8-11db-937f-000e0c431b59-BT16-Fxen-ARCC-HfQq-CrMs-BtEd', '20b7f8b2-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f8b2-99a8-11db-937f-000e0c431b59-BUrY-FWMp-AC53-Hvn7-CO5T-Bnfe', '20b7f8b2-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f8b4-99a8-11db-937f-000e0c431b59-B0tL-FNMi-AHVC-HwDf-C604-BxDh', '20b7f8b4-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f8b4-99a8-11db-937f-000e0c431b59-B5L3-FP33-AA6N-HdX5-CIdo-BscJ', '20b7f8b4-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f8b4-99a8-11db-937f-000e0c431b59-B6Y3-FDnQ-AqWy-HqhL-COcX-BGsP', '20b7f8b4-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f8b4-99a8-11db-937f-000e0c431b59-BbH4-Fe48-A0y8-H4mA-Capv-BUiL', '20b7f8b4-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f8b4-99a8-11db-937f-000e0c431b59-BDu4-F3ab-AEo5-Hbvm-CrvV-B30i', '20b7f8b4-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f8b4-99a8-11db-937f-000e0c431b59-BGtj-F9eN-A6tH-HPXn-Cti0-BKWi', '20b7f8b4-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'темно-зеленый', ''),
('20b7f8b4-99a8-11db-937f-000e0c431b59-Bwm1-FqEl-ASvX-HooW-CMGe-BGkX', '20b7f8b4-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '20000', 'г'),
('20b7f8b6-99a8-11db-937f-000e0c431b59-B9VO-FDk8-AyjI-HkCJ-CArV-BRlO', '20b7f8b6-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f8b6-99a8-11db-937f-000e0c431b59-BbAf-FzoK-AM2Q-Hq81-CDBb-BPD5', '20b7f8b6-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f8b6-99a8-11db-937f-000e0c431b59-BDGy-Fh5D-Aj4E-HOtv-C9Lv-BdAZ', '20b7f8b6-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f8b6-99a8-11db-937f-000e0c431b59-BEc3-FNC6-AXCm-HsUO-C81l-BImK', '20b7f8b6-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1000', 'г'),
('20b7f8b6-99a8-11db-937f-000e0c431b59-BEkL-FBdx-AC5d-HxOC-C0Ap-Bzrt', '20b7f8b6-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'фисташковый', ''),
('20b7f8b6-99a8-11db-937f-000e0c431b59-BgWL-FwjW-AHql-HhmX-C3lt-BHoT', '20b7f8b6-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f8b6-99a8-11db-937f-000e0c431b59-BoMR-F53O-Av7Q-HMLU-CHOa-B6vU', '20b7f8b6-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f8b8-99a8-11db-937f-000e0c431b59-Bfu1-FHRc-AfKD-HORr-CiWK-BbkN', '20b7f8b8-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'фисташковый', ''),
('20b7f8b8-99a8-11db-937f-000e0c431b59-BnUT-Ff4t-Awgc-HAYh-CYyq-BgGF', '20b7f8b8-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f8b8-99a8-11db-937f-000e0c431b59-BS6P-FWKg-AEt4-HOKd-Ccha-BshH', '20b7f8b8-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f8b8-99a8-11db-937f-000e0c431b59-BSvv-Fski-Avj2-HiZR-CnsN-B3FY', '20b7f8b8-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f8b8-99a8-11db-937f-000e0c431b59-BX8Q-F0qk-ANoa-HzwD-C0Sx-B1aE', '20b7f8b8-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f8b8-99a8-11db-937f-000e0c431b59-Bz36-FpFd-ADaU-HMf4-C7JO-BPoH', '20b7f8b8-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '2000', 'г'),
('20b7f8b8-99a8-11db-937f-000e0c431b59-BZJH-FSYS-Aw11-HNiX-CU1J-BFjt', '20b7f8b8-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f8bc-99a8-11db-937f-000e0c431b59-B0bo-FccC-A022-HqX8-CvM1-Br37', '20b7f8bc-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'черный', ''),
('20b7f8bc-99a8-11db-937f-000e0c431b59-Bcvc-FUb1-ARND-HI56-CFF1-Bcl9', '20b7f8bc-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f8bc-99a8-11db-937f-000e0c431b59-BDll-F6nO-AYnO-H3qm-CBGI-BmM4', '20b7f8bc-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '900', 'г'),
('20b7f8bc-99a8-11db-937f-000e0c431b59-BL6X-FfH4-AZDC-HoTr-CvTJ-BZvl', '20b7f8bc-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f8bc-99a8-11db-937f-000e0c431b59-BL73-FPEw-AKK2-HBnd-CA0e-BDYJ', '20b7f8bc-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f8bc-99a8-11db-937f-000e0c431b59-BVAC-FYpW-AGbq-HQ2b-C3TN-BVoo', '20b7f8bc-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f8bc-99a8-11db-937f-000e0c431b59-BZfk-FFvb-Ahov-Hu0Z-CZLV-BRaa', '20b7f8bc-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f8be-99a8-11db-937f-000e0c431b59-B1iB-FEbs-Arcy-HzFB-CtJu-BR9O', '20b7f8be-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f8be-99a8-11db-937f-000e0c431b59-BDti-Fzeh-AO4s-HkKI-CAOu-BlJX', '20b7f8be-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'черный', ''),
('20b7f8be-99a8-11db-937f-000e0c431b59-BiDI-FX4N-AYnX-HJ6V-CYuj-BgSW', '20b7f8be-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f8be-99a8-11db-937f-000e0c431b59-BSay-Fpjt-AB9e-Hkew-C8Tw-BIpM', '20b7f8be-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f8be-99a8-11db-937f-000e0c431b59-Btrc-Fm8i-A14M-HH9O-CSRo-BG8O', '20b7f8be-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1900', 'г'),
('20b7f8be-99a8-11db-937f-000e0c431b59-By0L-FVal-ABP3-HQFO-C7oR-BEBK', '20b7f8be-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f8be-99a8-11db-937f-000e0c431b59-BzNI-FhxS-Aqyg-Hbaq-CyQO-B1Vp', '20b7f8be-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f8c0-99a8-11db-937f-000e0c431b59-B19M-FUjr-AGgA-H3pp-CFZW-BiBU', '20b7f8c0-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'черный', ''),
('20b7f8c0-99a8-11db-937f-000e0c431b59-BG2O-FS0M-AgSe-HKYb-CZPa-Blj0', '20b7f8c0-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f8c0-99a8-11db-937f-000e0c431b59-BHHw-FlSL-ACra-HdT0-Cdlp-B06O', '20b7f8c0-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f8c0-99a8-11db-937f-000e0c431b59-BL54-FxPG-Aa7Z-H61A-CZ8I-BLia', '20b7f8c0-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f8c0-99a8-11db-937f-000e0c431b59-BSqg-FTiM-A9ol-HVMm-CqSe-B5le', '20b7f8c0-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f8c0-99a8-11db-937f-000e0c431b59-Bt8F-FI36-AIR4-HRdb-Cs2D-B2pH', '20b7f8c0-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '20000', 'г'),
('20b7f8c0-99a8-11db-937f-000e0c431b59-BXlI-FyEb-AyhD-Heh0-Cst4-BmgJ', '20b7f8c0-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f8c2-99a8-11db-937f-000e0c431b59-Bfz7-Fg69-AYBy-HaxX-C5jJ-BMXh', '20b7f8c2-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f8c2-99a8-11db-937f-000e0c431b59-BhsY-Fcgi-ACbB-HFC2-CFzC-Bwjd', '20b7f8c2-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f8c2-99a8-11db-937f-000e0c431b59-BTdp-FW8M-AVq7-HPSc-CYBZ-BdKS', '20b7f8c2-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'шоколадно-коричневый', ''),
('20b7f8c2-99a8-11db-937f-000e0c431b59-BwvS-FxYk-A9SR-HdxQ-CjU9-B8xf', '20b7f8c2-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f8c2-99a8-11db-937f-000e0c431b59-BwWz-FD1m-AUZ8-HSWv-Cx3l-BuZg', '20b7f8c2-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1000', 'г'),
('20b7f8c2-99a8-11db-937f-000e0c431b59-BxLq-Fta0-AMyB-HmSL-C5qe-Be9F', '20b7f8c2-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f8c2-99a8-11db-937f-000e0c431b59-BYTj-FSkD-AtS5-HxJj-C6cD-BkzA', '20b7f8c2-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f8c4-99a8-11db-937f-000e0c431b59-BA5y-FNpa-Am6G-HhGy-CRiS-BnLK', '20b7f8c4-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f8c4-99a8-11db-937f-000e0c431b59-BcdW-Fm2t-AMwz-HjPc-CLFA-B61m', '20b7f8c4-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f8c4-99a8-11db-937f-000e0c431b59-BDf5-FByR-AwmK-HYXj-C5GX-Bdnl', '20b7f8c4-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f8c4-99a8-11db-937f-000e0c431b59-Bh7n-Fodu-AcuT-HuYf-C6v4-B392', '20b7f8c4-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1000', 'г'),
('20b7f8c4-99a8-11db-937f-000e0c431b59-Bsxi-FhOW-A5I7-HDVT-CkHp-BaLf', '20b7f8c4-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'ярко-зеленый', ''),
('20b7f8c4-99a8-11db-937f-000e0c431b59-BXY8-FM9M-ApJR-HqEI-CSFD-BGTs', '20b7f8c4-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f8c4-99a8-11db-937f-000e0c431b59-Bzhu-FvlF-AEMN-HumY-CQq5-BKrt', '20b7f8c4-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f8c6-99a8-11db-937f-000e0c431b59-Bb8q-FJaw-ADj8-HocB-CQ8x-BIEs', '20b7f8c6-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '2000', 'г'),
('20b7f8c6-99a8-11db-937f-000e0c431b59-BEnA-FWTF-AelL-Hise-CQPa-B545', '20b7f8c6-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'ярко-зеленый', ''),
('20b7f8c6-99a8-11db-937f-000e0c431b59-BEps-F4Cm-ArPl-HIe8-C4yy-BQUN', '20b7f8c6-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f8c6-99a8-11db-937f-000e0c431b59-Bfw3-FG5W-AEyL-H3Ef-CGZz-B9Ek', '20b7f8c6-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f8c6-99a8-11db-937f-000e0c431b59-BoWp-F8GD-AcBz-HW5x-CN9b-BOVu', '20b7f8c6-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f8c6-99a8-11db-937f-000e0c431b59-BU1W-FfYE-A0pU-HakN-CVOj-BAMq', '20b7f8c6-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f8c6-99a8-11db-937f-000e0c431b59-BUU3-Fpuc-A3Fr-HcG5-CJKk-B3Em', '20b7f8c6-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f8c8-99a8-11db-937f-000e0c431b59-B0TE-FcK4-AAvN-Hq4N-CYma-BOXo', '20b7f8c8-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f8c8-99a8-11db-937f-000e0c431b59-B1kQ-FqaU-AwpX-HL04-CvMa-BHno', '20b7f8c8-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '20000', 'г'),
('20b7f8c8-99a8-11db-937f-000e0c431b59-BEvD-FCZg-ADqd-H2yh-CkTq-BHAr', '20b7f8c8-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f8c8-99a8-11db-937f-000e0c431b59-BfIh-FqBl-ALHB-HBGG-CmiD-BSre', '20b7f8c8-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'ярко-зеленый', ''),
('20b7f8c8-99a8-11db-937f-000e0c431b59-BKPe-FpKm-A3k1-H1DF-CPDZ-BTgk', '20b7f8c8-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f8c8-99a8-11db-937f-000e0c431b59-BNgV-FaNO-Aom2-HE2P-CsCe-BNrp', '20b7f8c8-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f8c8-99a8-11db-937f-000e0c431b59-BtMz-FvO7-A21e-H6IM-CZN9-BdPY', '20b7f8c8-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f8d0-99a8-11db-937f-000e0c431b59-B76u-FKIS-AlkR-HU5D-CfY6-B3HF', '20b7f8d0-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f8d0-99a8-11db-937f-000e0c431b59-BcR2-FwcK-AGLP-HRyq-CwHB-Beiv', '20b7f8d0-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f8d0-99a8-11db-937f-000e0c431b59-Bd3W-FtKL-Aa7T-Hba2-CNJN-BrFJ', '20b7f8d0-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f8d0-99a8-11db-937f-000e0c431b59-BEiC-FYAc-APOm-Hd7r-Cn3n-BYDv', '20b7f8d0-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1000', 'г'),
('20b7f8d0-99a8-11db-937f-000e0c431b59-BPcQ-FM2g-AEmT-HLTU-CsFK-Bnae', '20b7f8d0-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'желто-коричневый', ''),
('20b7f8d0-99a8-11db-937f-000e0c431b59-BSUr-FauO-AysN-Hju5-Cp0X-B6MO', '20b7f8d0-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f8d0-99a8-11db-937f-000e0c431b59-BsWe-F67O-A1lO-HNhb-Cc0s-BTvL', '20b7f8d0-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f8d2-99a8-11db-937f-000e0c431b59-B08N-Fgmg-A7nW-HdPW-CmXN-B95i', '20b7f8d2-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f8d2-99a8-11db-937f-000e0c431b59-B3Qo-FhMD-ATOh-HpSZ-CB1h-Bl0I', '20b7f8d2-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f8d2-99a8-11db-937f-000e0c431b59-B75K-FNCY-AuTf-HgPI-CgOG-Buvt', '20b7f8d2-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f8d2-99a8-11db-937f-000e0c431b59-BhHk-FJlg-A2OZ-Hemc-CQSI-BmPI', '20b7f8d2-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f8d2-99a8-11db-937f-000e0c431b59-BI2W-FhV9-AAlQ-HINg-CQGw-B6n0', '20b7f8d2-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f8d2-99a8-11db-937f-000e0c431b59-BqpW-F8AQ-AAgo-H7Zw-CBdV-BE3W', '20b7f8d2-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'желто-коричневый', ''),
('20b7f8d2-99a8-11db-937f-000e0c431b59-BQsW-FnLm-AAx0-HNw4-Cwty-B872', '20b7f8d2-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '2000', 'г'),
('20b7f8d4-99a8-11db-937f-000e0c431b59-B9iP-Fnot-AEef-HNq4-ChfT-BpT7', '20b7f8d4-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f8d4-99a8-11db-937f-000e0c431b59-BkAV-FNgs-Ay4a-HFbA-ClZi-B1CN', '20b7f8d4-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f8d4-99a8-11db-937f-000e0c431b59-BkHs-FFUZ-A025-HShN-COHO-BkVu', '20b7f8d4-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f8d4-99a8-11db-937f-000e0c431b59-BnW2-FipY-Av4g-HAe3-CuwC-BZgS', '20b7f8d4-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '20000', 'г'),
('20b7f8d4-99a8-11db-937f-000e0c431b59-BSKo-FtPF-At2f-HSrh-CgRp-BOX0', '20b7f8d4-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f8d4-99a8-11db-937f-000e0c431b59-BVqK-F1Na-A0up-HGea-CzvI-BMYU', '20b7f8d4-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'желто-коричневый', ''),
('20b7f8d4-99a8-11db-937f-000e0c431b59-ByZI-Fxm5-ArZn-HfWk-CWsR-Bhjf', '20b7f8d4-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f8d6-99a8-11db-937f-000e0c431b59-B1HU-FyZA-Atw4-HHUJ-CMXS-BK2N', '20b7f8d6-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f8d6-99a8-11db-937f-000e0c431b59-BbRc-F9R7-A2Ct-H4bQ-CM7g-BW7F', '20b7f8d6-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f8d6-99a8-11db-937f-000e0c431b59-BCI8-Fe65-AcRS-HsFo-CP13-BzWA', '20b7f8d6-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f8d6-99a8-11db-937f-000e0c431b59-BeQJ-F0i2-AhFJ-HMTg-CM84-BDfi', '20b7f8d6-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'золотисто-коричневый', ''),
('20b7f8d6-99a8-11db-937f-000e0c431b59-BEUf-FWCk-ABRb-H5Gx-C585-BPwU', '20b7f8d6-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1000', 'г'),
('20b7f8d6-99a8-11db-937f-000e0c431b59-BNdK-FWqe-A43c-Hw78-CVYP-ByWh', '20b7f8d6-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f8d6-99a8-11db-937f-000e0c431b59-BvNj-FfHB-AvT9-HRq5-CX4Y-BhPF', '20b7f8d6-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f8d8-99a8-11db-937f-000e0c431b59-B2d4-Fzik-A1Sa-HOue-CFFj-BOvs', '20b7f8d8-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f8d8-99a8-11db-937f-000e0c431b59-B5gj-FYp6-Aeg9-HFqA-Ct1X-BbD2', '20b7f8d8-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f8d8-99a8-11db-937f-000e0c431b59-BiX4-FR5i-AcRI-HKNH-ChEl-Ba5K', '20b7f8d8-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '20000', 'г'),
('20b7f8d8-99a8-11db-937f-000e0c431b59-BJWr-FNd4-ABRU-HCL7-CCY6-Becy', '20b7f8d8-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f8d8-99a8-11db-937f-000e0c431b59-BN0c-FD4Z-AEue-HIWF-C2Cl-BJCo', '20b7f8d8-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f8d8-99a8-11db-937f-000e0c431b59-BqfS-F0CA-AUDD-HGMx-CxaB-B4m0', '20b7f8d8-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'золотисто-коричневый', ''),
('20b7f8d8-99a8-11db-937f-000e0c431b59-BVFI-FpIU-AmKs-HhpL-CWkr-B69W', '20b7f8d8-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f8da-99a8-11db-937f-000e0c431b59-B4fU-FVZb-AIUZ-HDjL-CYyr-Bf8V', '20b7f8da-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f8da-99a8-11db-937f-000e0c431b59-B7PM-Fv1N-AboU-Hb8x-Ce2S-BzNr', '20b7f8da-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f8da-99a8-11db-937f-000e0c431b59-BGDv-FgnE-A5jT-HhrU-CADw-BItq', '20b7f8da-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f8da-99a8-11db-937f-000e0c431b59-BONF-FL9U-AWcz-H58B-C2EE-Bmls', '20b7f8da-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '2000', 'г'),
('20b7f8da-99a8-11db-937f-000e0c431b59-BPgG-FInb-AS1y-HkBq-CyGA-BTdC', '20b7f8da-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'золотисто-коричневый', ''),
('20b7f8da-99a8-11db-937f-000e0c431b59-BQWC-FqZl-A3xZ-HkTX-C6Pn-BIAd', '20b7f8da-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f8da-99a8-11db-937f-000e0c431b59-BVcH-Fq5F-AdY8-HvOK-Cdfh-BfL8', '20b7f8da-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f8dc-99a8-11db-937f-000e0c431b59-BARr-F7xb-AwdM-HXmX-C99e-BnnF', '20b7f8dc-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f8dc-99a8-11db-937f-000e0c431b59-BAvc-Fa0M-A6ES-HeTD-CM2b-BFJW', '20b7f8dc-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'красно-коричневый', ''),
('20b7f8dc-99a8-11db-937f-000e0c431b59-BecX-F1ih-AiDs-HiOy-CV3r-Blr8', '20b7f8dc-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1000', 'г'),
('20b7f8dc-99a8-11db-937f-000e0c431b59-BmV4-Fdfx-AdAW-HFKs-CeK0-BLGw', '20b7f8dc-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('20b7f8dc-99a8-11db-937f-000e0c431b59-Bn3Q-FzQ4-AMO3-Hr3f-Cwf2-Bq0W', '20b7f8dc-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f8dc-99a8-11db-937f-000e0c431b59-Boln-Fxw1-A6T6-Hgt1-Cqul-BJLk', '20b7f8dc-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f8dc-99a8-11db-937f-000e0c431b59-BVGp-Fol9-Asy1-HJ4A-Cfim-BJVY', '20b7f8dc-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f8de-99a8-11db-937f-000e0c431b59-B4Ex-FpWR-AJmQ-HgEm-Cgm3-B4t4', '20b7f8de-99a8-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('20b7f8de-99a8-11db-937f-000e0c431b59-BD9o-Fvg4-Ak2v-HSdd-CP9X-BcW0', '20b7f8de-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('20b7f8de-99a8-11db-937f-000e0c431b59-Bf5M-FXlF-A4Yk-HvEj-CHjC-BfZl', '20b7f8de-99a8-11db-937f-000e0c431b59', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'красно-коричневый', ''),
('20b7f8de-99a8-11db-937f-000e0c431b59-BhPX-FHBc-ArIB-Htob-CVsZ-BAe7', '20b7f8de-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('20b7f8de-99a8-11db-937f-000e0c431b59-Bnuh-FC9E-A7Ie-H5Gl-CPW1-BN2n', '20b7f8de-99a8-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '2000', 'г'),
('20b7f8de-99a8-11db-937f-000e0c431b59-BPP8-FfwC-AISo-HAMY-C4iz-B76A', '20b7f8de-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('20b7f8de-99a8-11db-937f-000e0c431b59-BVbC-FXLr-AygZ-HOg4-CKa9-B9GV', '20b7f8de-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('211dadff-f788-11e3-8c8a-005056be1f7b-B1VE-FGbA-AjWX-HcvY-CQil-B8hs', '211dadff-f788-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('211dadff-f788-11e3-8c8a-005056be1f7b-B5vw-FRNh-AqeF-HSbn-CAD2-BfZp', '211dadff-f788-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('211dadff-f788-11e3-8c8a-005056be1f7b-B7iI-F4kE-AtUP-HF7d-C6W3-BYAy', '211dadff-f788-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('211dadff-f788-11e3-8c8a-005056be1f7b-BaZd-Fn6Y-AM3M-H48q-CpF4-BA1E', '211dadff-f788-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'охра', ''),
('211dadff-f788-11e3-8c8a-005056be1f7b-BlNf-FVxR-A7bA-HFOn-CzF0-B4Ma', '211dadff-f788-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('211dadff-f788-11e3-8c8a-005056be1f7b-BwNq-F0Ho-Aqwt-Hjwk-CotJ-Bwmt', '211dadff-f788-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('211dadff-f788-11e3-8c8a-005056be1f7b-BxVH-FybV-AbQb-HbJn-C2DZ-BnVm', '211dadff-f788-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '800', 'г'),
('2133814d-f78e-11e3-8c8a-005056be1f7b-Bg0W-FkTS-AbTO-HAE1-CGdq-BNeH', '2133814d-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('2133814d-f78e-11e3-8c8a-005056be1f7b-Bi1J-FAbR-AURD-HT72-C07i-BvmG', '2133814d-f78e-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'голубой', ''),
('2133814d-f78e-11e3-8c8a-005056be1f7b-BOAt-FdAy-ATGR-HAUv-CIr2-B1x8', '2133814d-f78e-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('2133814d-f78e-11e3-8c8a-005056be1f7b-BpqK-FJMm-ARwk-HZsJ-C18J-BkaK', '2133814d-f78e-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('2133814d-f78e-11e3-8c8a-005056be1f7b-BWFs-FGGy-A3Md-HfbI-Ck9H-B7ia', '2133814d-f78e-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('2133814d-f78e-11e3-8c8a-005056be1f7b-BYuR-Fqvl-Ab4T-HStG-CQYx-Bbi0', '2133814d-f78e-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1900', 'г'),
('2133814d-f78e-11e3-8c8a-005056be1f7b-BZ1H-FAaI-Aklt-HBGw-CFom-BPoE', '2133814d-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('23b6c6e7-f789-11e3-8c8a-005056be1f7b-B3Q2-FdYv-A7or-Hfvl-CWTn-BbMP', '23b6c6e7-f789-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('23b6c6e7-f789-11e3-8c8a-005056be1f7b-BDDH-Fvj4-AW6N-HAXa-CQop-BrgT', '23b6c6e7-f789-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('23b6c6e7-f789-11e3-8c8a-005056be1f7b-BiCF-F3lz-ACKk-HYFd-CKB2-B8QO', '23b6c6e7-f789-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('23b6c6e7-f789-11e3-8c8a-005056be1f7b-BL9M-FY0j-AyPN-He8u-CyLk-B78n', '23b6c6e7-f789-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('23b6c6e7-f789-11e3-8c8a-005056be1f7b-BN1H-FwC4-Akeh-Hqwo-CK1r-BRlR', '23b6c6e7-f789-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('23b6c6e7-f789-11e3-8c8a-005056be1f7b-BRPa-F2og-AUyi-HMvy-CbnF-BSGd', '23b6c6e7-f789-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('23b6c6e7-f789-11e3-8c8a-005056be1f7b-BziI-FWP5-AAZu-HsrW-C03U-BMRT', '23b6c6e7-f789-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1900', 'г'),
('2461ad51-9fb8-11e3-8705-005056be1f7b-B2fR-FFFH-AVT6-Hnjc-Ch5F-BdQo', '2461ad51-9fb8-11e3-8705-005056be1f7b', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('2461ad51-9fb8-11e3-8705-005056be1f7b-Bd04-FIrr-ADDi-HQC4-C0M8-BN3E', '2461ad51-9fb8-11e3-8705-005056be1f7b', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсальное', ''),
('2461ad51-9fb8-11e3-8705-005056be1f7b-BDRn-FcfL-Aufe-HB2Q-Cysv-BGy1', '2461ad51-9fb8-11e3-8705-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый матовый', ''),
('2461ad51-9fb8-11e3-8705-005056be1f7b-BJI2-FXoo-A0u6-HluU-C5bx-BQqg', '2461ad51-9fb8-11e3-8705-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('2461ad51-9fb8-11e3-8705-005056be1f7b-BKEO-FpGF-A65y-HrAm-CiOw-BtXj', '2461ad51-9fb8-11e3-8705-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('2461ad51-9fb8-11e3-8705-005056be1f7b-BNJK-FJwu-AmUo-Hrx6-CV2N-B0Us', '2461ad51-9fb8-11e3-8705-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('2461ad51-9fb8-11e3-8705-005056be1f7b-BpzO-FQ7L-AuHa-HCRy-C1b7-Brzl', '2461ad51-9fb8-11e3-8705-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '2500', 'г'),
('2461ad51-9fb8-11e3-8705-005056be1f7b-BqcW-FPtY-AIsl-HG7d-CLPR-BKXx', '2461ad51-9fb8-11e3-8705-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('2461ad51-9fb8-11e3-8705-005056be1f7b-BTy9-FHf0-AuEO-Hgxl-CFQl-B0ZT', '2461ad51-9fb8-11e3-8705-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('25a027ef-9e45-11e1-9d3e-005056be3bd8-B9tp-FuO6-Au19-HqyT-CjK7-BYs1', '25a027ef-9e45-11e1-9d3e-005056be3bd8', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('25a027ef-9e45-11e1-9d3e-005056be3bd8-BArJ-FWcJ-AkfG-HiNy-Cu1R-BwdZ', '25a027ef-9e45-11e1-9d3e-005056be3bd8', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1000', 'г'),
('25a027ef-9e45-11e1-9d3e-005056be3bd8-Bbnp-FjzL-A2Yv-HePA-CmD6-B9U4', '25a027ef-9e45-11e1-9d3e-005056be3bd8', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('25a027ef-9e45-11e1-9d3e-005056be3bd8-BncC-FmI1-A7sB-H3Hu-Ct32-B7X8', '25a027ef-9e45-11e1-9d3e-005056be3bd8', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('25a027ef-9e45-11e1-9d3e-005056be3bd8-BvHN-FeFD-ATMW-Hv0O-CC88-BsrL', '25a027ef-9e45-11e1-9d3e-005056be3bd8', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('25a027ef-9e45-11e1-9d3e-005056be3bd8-BWmy-Fh5X-AZWs-H81y-CHSb-Bw3R', '25a027ef-9e45-11e1-9d3e-005056be3bd8', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('25a027ef-9e45-11e1-9d3e-005056be3bd8-Bx5V-FR9Y-AR6K-HSi3-CbVh-BdFK', '25a027ef-9e45-11e1-9d3e-005056be3bd8', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'кремовый', ''),
('25a027f1-9e45-11e1-9d3e-005056be3bd8-B66L-FPVy-A6b0-Hfsy-CiXG-BzSI', '25a027f1-9e45-11e1-9d3e-005056be3bd8', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('25a027f1-9e45-11e1-9d3e-005056be3bd8-BG6V-FBpz-APy3-HMWl-CJRh-BUh3', '25a027f1-9e45-11e1-9d3e-005056be3bd8', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('25a027f1-9e45-11e1-9d3e-005056be3bd8-Bh6L-FodY-AcNP-HuAs-CKnH-BSTY', '25a027f1-9e45-11e1-9d3e-005056be3bd8', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('25a027f1-9e45-11e1-9d3e-005056be3bd8-BhsZ-FqAW-AMOU-HZnp-CFKk-BRzD', '25a027f1-9e45-11e1-9d3e-005056be3bd8', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('25a027f1-9e45-11e1-9d3e-005056be3bd8-BJcU-FJ8C-A9ga-HFWt-CNdo-BieT', '25a027f1-9e45-11e1-9d3e-005056be3bd8', '1d08380b-ce34-11e4-a80e-005056be1f7a', '2000', 'г'),
('25a027f1-9e45-11e1-9d3e-005056be3bd8-BnZI-FpRP-AZAI-HR8g-CO8N-BYUq', '25a027f1-9e45-11e1-9d3e-005056be3bd8', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'кремовый', ''),
('25a027f1-9e45-11e1-9d3e-005056be3bd8-BpRR-F5CR-AmM5-HteN-CIC7-Bit7', '25a027f1-9e45-11e1-9d3e-005056be3bd8', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('277ee1ed-f788-11e3-8c8a-005056be1f7b-B2Ki-FeCs-A5VC-HxYu-CdOM-B2vu', '277ee1ed-f788-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'серый', ''),
('277ee1ed-f788-11e3-8c8a-005056be1f7b-B541-FdXM-AWUg-HwT5-Cpz4-BXOO', '277ee1ed-f788-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '800', 'г'),
('277ee1ed-f788-11e3-8c8a-005056be1f7b-B8iC-FDbg-Am13-HVxu-CHdg-BOLF', '277ee1ed-f788-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('277ee1ed-f788-11e3-8c8a-005056be1f7b-Bf0s-FYVg-AIc0-HoqL-CuZz-B34I', '277ee1ed-f788-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('277ee1ed-f788-11e3-8c8a-005056be1f7b-Bm9P-Fw9S-AOiG-H4ei-CYWt-B82v', '277ee1ed-f788-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('277ee1ed-f788-11e3-8c8a-005056be1f7b-BpwG-Fsjf-AcCu-Ho5f-CZge-BoTd', '277ee1ed-f788-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('277ee1ed-f788-11e3-8c8a-005056be1f7b-BtoI-FdSC-A0ri-HeW3-C8Ta-B0X3', '277ee1ed-f788-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('28b335ed-f78f-11e3-8c8a-005056be1f7b-B1aA-F4ZH-AQPy-HV5m-C2TB-BfDB', '28b335ed-f78f-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '6000', 'г'),
('28b335ed-f78f-11e3-8c8a-005056be1f7b-BECF-FFGl-AZ0g-Hs5d-Cpl0-Bh0S', '28b335ed-f78f-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('28b335ed-f78f-11e3-8c8a-005056be1f7b-BElG-FNTy-AuZs-HgJs-C4Nu-B9S1', '28b335ed-f78f-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('28b335ed-f78f-11e3-8c8a-005056be1f7b-Bksz-FHbt-AlGV-HkoV-C3t7-B08Q', '28b335ed-f78f-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('28b335ed-f78f-11e3-8c8a-005056be1f7b-Brf3-FXTh-AmyI-Hrrg-CG4w-Bt0X', '28b335ed-f78f-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'светло-серый', ''),
('28b335ed-f78f-11e3-8c8a-005056be1f7b-Bxrq-FgN1-AOHD-H9GW-CzrF-Boyg', '28b335ed-f78f-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('28b335ed-f78f-11e3-8c8a-005056be1f7b-BYZn-Fu0R-AF3B-HC29-CTpp-B0M4', '28b335ed-f78f-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('2997b29e-f78e-11e3-8c8a-005056be1f7b-BAyy-FIto-AiEP-HRSC-CHx0-Bnlu', '2997b29e-f78e-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('2997b29e-f78e-11e3-8c8a-005056be1f7b-Be8f-Fxvs-APVR-HtHU-Cl2O-Biwj', '2997b29e-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('2997b29e-f78e-11e3-8c8a-005056be1f7b-Bmbz-Fsoj-AlaV-HRAO-CsPq-BNua', '2997b29e-f78e-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1900', 'г'),
('2997b29e-f78e-11e3-8c8a-005056be1f7b-BPcf-Fetx-Ah1l-HgeM-CR1D-BYdn', '2997b29e-f78e-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('2997b29e-f78e-11e3-8c8a-005056be1f7b-Bt58-F6Ub-ABOH-H61a-CUks-BOx1', '2997b29e-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('2997b29e-f78e-11e3-8c8a-005056be1f7b-BtR4-FMIQ-AJpT-HyMb-Ckje-BvC2', '2997b29e-f78e-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'шоколадный', ''),
('2997b29e-f78e-11e3-8c8a-005056be1f7b-BV1G-FnkO-A8LF-HMu3-Cwvq-Bk4a', '2997b29e-f78e-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('299c6ffe-f790-11e3-8c8a-005056be1f7b-B4nw-FrDL-AJ7O-H4T1-Cgwk-Baud', '299c6ffe-f790-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '20000', 'г'),
('299c6ffe-f790-11e3-8c8a-005056be1f7b-B8YH-FgXK-AT4x-HaYc-C4Dt-BWln', '299c6ffe-f790-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('299c6ffe-f790-11e3-8c8a-005056be1f7b-Bdu5-F831-AqxZ-HMzG-Clwf-BsT3', '299c6ffe-f790-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('299c6ffe-f790-11e3-8c8a-005056be1f7b-BiU0-FCVJ-AkA3-Hnok-CWXA-BpOv', '299c6ffe-f790-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('299c6ffe-f790-11e3-8c8a-005056be1f7b-BmwG-FI56-Arrj-H9Dw-CgmH-Bfpc', '299c6ffe-f790-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('299c6ffe-f790-11e3-8c8a-005056be1f7b-BpQd-Fh5H-AIQe-HI6s-C5if-BBrZ', '299c6ffe-f790-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('299c6ffe-f790-11e3-8c8a-005056be1f7b-BtZS-F2v8-AhUf-HIzi-CwnR-BWNh', '299c6ffe-f790-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'красно-коричневый', ''),
('2cbf73b5-f789-11e3-8c8a-005056be1f7b-B48z-FmSK-ASQU-HhX2-CCYZ-B6Kp', '2cbf73b5-f789-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('2cbf73b5-f789-11e3-8c8a-005056be1f7b-BAtW-FVRu-AMTJ-HmOU-CRun-BNtZ', '2cbf73b5-f789-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('2cbf73b5-f789-11e3-8c8a-005056be1f7b-BBh4-FvQk-AIQc-Hccu-CwO1-BWNb', '2cbf73b5-f789-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('2cbf73b5-f789-11e3-8c8a-005056be1f7b-BFaZ-FPCo-AjUY-HNiI-CmKk-BjZm', '2cbf73b5-f789-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1900', 'г'),
('2cbf73b5-f789-11e3-8c8a-005056be1f7b-BfS6-F9vY-Asim-Hj51-CAxx-B1aF', '2cbf73b5-f789-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('2cbf73b5-f789-11e3-8c8a-005056be1f7b-Bmc8-FOB2-AEBp-H32F-C93y-BVNF', '2cbf73b5-f789-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('2cbf73b5-f789-11e3-8c8a-005056be1f7b-BvGj-F0kh-AtYs-HUUq-C9KP-BGge', '2cbf73b5-f789-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый матовый', ''),
('2ced73cf-59ef-11e0-894e-000e0c431b58-B8AV-Fa9Q-Ax2m-HdpM-CWTk-BEOe', '2ced73cf-59ef-11e0-894e-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'растворитель', ''),
('2ced73cf-59ef-11e0-894e-000e0c431b58-BbS5-FMN1-AyyQ-HgMl-Cm2L-BAt5', '2ced73cf-59ef-11e0-894e-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'COSMOFEN', ''),
('2ced73cf-59ef-11e0-894e-000e0c431b58-BhK8-F2AS-AY9v-H67l-Ckas-BYUG', '2ced73cf-59ef-11e0-894e-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('2ced73cf-59ef-11e0-894e-000e0c431b58-BJf5-FRja-ACvc-H86W-C4Wp-Bxj4', '2ced73cf-59ef-11e0-894e-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('2ced73cf-59ef-11e0-894e-000e0c431b58-BokX-F3sJ-AwAI-HDfu-CMC6-BJ46', '2ced73cf-59ef-11e0-894e-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('2ced73cf-59ef-11e0-894e-000e0c431b58-BoXr-F655-Aggv-Hshe-CnqA-Bh9j', '2ced73cf-59ef-11e0-894e-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '1', 'л'),
('2eadcbef-99a8-11db-937f-000e0c431b59-B0gZ-FXLz-AQeI-HmF5-Cyhd-BNtw', '2eadcbef-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('2eadcbef-99a8-11db-937f-000e0c431b59-B8VN-F1TO-AdD5-HU4l-CIjv-Boe2', '2eadcbef-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'керосин', ''),
('2eadcbef-99a8-11db-937f-000e0c431b59-BaWQ-Fj0V-Aex4-H8Am-Ctq2-B1qy', '2eadcbef-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('2eadcbef-99a8-11db-937f-000e0c431b59-BpKg-F6FP-A0Q9-Hj2E-CVSb-Bl2a', '2eadcbef-99a8-11db-937f-000e0c431b59', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '1', 'л'),
('2eadcbef-99a8-11db-937f-000e0c431b59-BpOG-F07z-AerP-H5tD-CLtk-BkGv', '2eadcbef-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('2eadcbf1-99a8-11db-937f-000e0c431b59-B5dI-F3D0-A8YS-HY0J-Cy8f-BCxz', '2eadcbf1-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('2eadcbf1-99a8-11db-937f-000e0c431b59-BBlH-FXJg-AOjy-HiG0-C7oH-Bseo', '2eadcbf1-99a8-11db-937f-000e0c431b59', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '5', 'л'),
('2eadcbf1-99a8-11db-937f-000e0c431b59-Bdd0-FM0W-AsUA-Heiz-C3ja-B08k', '2eadcbf1-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'керосин', ''),
('2eadcbf1-99a8-11db-937f-000e0c431b59-BhIv-Fzgv-A0Us-HfXf-CUnw-BOzX', '2eadcbf1-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('2eadcbf1-99a8-11db-937f-000e0c431b59-BQQ4-FLlx-AwtW-HiY1-CZSU-BhLX', '2eadcbf1-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('2eadcbf3-99a8-11db-937f-000e0c431b59-B3dT-Fdzz-AwNv-HtDS-CB2M-BYKD', '2eadcbf3-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('2eadcbf3-99a8-11db-937f-000e0c431b59-BbiY-FMSc-AeUU-Hrse-Cvaa-BByQ', '2eadcbf3-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'керосин', ''),
('2eadcbf3-99a8-11db-937f-000e0c431b59-Bqm7-FFql-A9pk-HVgT-CX68-B1hR', '2eadcbf3-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('2eadcbf3-99a8-11db-937f-000e0c431b59-Bs6P-FXz9-AsJX-Hpa3-CSSW-BlwL', '2eadcbf3-99a8-11db-937f-000e0c431b59', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.5', 'л'),
('2eadcbf3-99a8-11db-937f-000e0c431b59-By5W-FS1T-AvMp-H4sU-CTZ7-BQen', '2eadcbf3-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('2eadcbfc-99a8-11db-937f-000e0c431b59-B3ln-FZPr-APRf-HWFh-C9CP-BDIy', '2eadcbfc-99a8-11db-937f-000e0c431b59', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.5', 'л'),
('2eadcbfc-99a8-11db-937f-000e0c431b59-B8sE-FFid-A5CB-Hfjl-CHSj-Be4M', '2eadcbfc-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('2eadcbfc-99a8-11db-937f-000e0c431b59-BgC2-Fiha-AKpt-HtKn-C7CO-Bkce', '2eadcbfc-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'растворитель', ''),
('2eadcbfc-99a8-11db-937f-000e0c431b59-Bt8W-FknY-Arag-HnDz-CCyH-BxBm', '2eadcbfc-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('2eadcbfc-99a8-11db-937f-000e0c431b59-BuRu-FMeJ-ArcH-H1Yy-Ceil-Bgjm', '2eadcbfc-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('2eadcbfe-99a8-11db-937f-000e0c431b59-BbEv-FVo3-AXEf-HcVr-CECE-BWeK', '2eadcbfe-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('2eadcbfe-99a8-11db-937f-000e0c431b59-BRrv-FxE2-AUC5-HkGC-CZnE-BQMm', '2eadcbfe-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('2eadcbfe-99a8-11db-937f-000e0c431b59-BrWS-FbGc-AFDf-HUn8-Cy6o-Bkts', '2eadcbfe-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('2eadcbfe-99a8-11db-937f-000e0c431b59-BScU-Fy6p-Ag0s-HlWN-CvLw-BAfq', '2eadcbfe-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'растворитель', ''),
('2eadcbfe-99a8-11db-937f-000e0c431b59-ByjO-FT43-ARrx-H6Rh-Cotl-BaEQ', '2eadcbfe-99a8-11db-937f-000e0c431b59', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '1', 'л'),
('2eadcc00-99a8-11db-937f-000e0c431b59-B3wY-Fqsq-ANWZ-Hyxe-CEG8-BZ63', '2eadcc00-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('2eadcc00-99a8-11db-937f-000e0c431b59-Bcy6-F4nu-AyIb-HgCz-C7mZ-Btnz', '2eadcc00-99a8-11db-937f-000e0c431b59', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '5', 'л'),
('2eadcc00-99a8-11db-937f-000e0c431b59-BFb3-FyCO-ABya-Hyy6-Cfrr-B4Xa', '2eadcc00-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('2eadcc00-99a8-11db-937f-000e0c431b59-Bkkx-FAZk-Afer-Hc4m-CV0D-BNxG', '2eadcc00-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('2eadcc00-99a8-11db-937f-000e0c431b59-BUIT-FBlM-An8L-HrL0-Cynx-Btgb', '2eadcc00-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'растворитель', ''),
('2eadcc10-99a8-11db-937f-000e0c431b59-BdVj-F63m-AuyP-HKi3-C04B-BT5m', '2eadcc10-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('2eadcc10-99a8-11db-937f-000e0c431b59-BeGy-F5XQ-APRO-HIv4-CR0Q-BfmI', '2eadcc10-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'растворитель', ''),
('2eadcc10-99a8-11db-937f-000e0c431b59-Bfij-FrQu-ArEY-Hfy6-C7SR-BgNJ', '2eadcc10-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('2eadcc10-99a8-11db-937f-000e0c431b59-BI99-FXJh-AQIa-HRbU-C484-BdpJ', '2eadcc10-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('2eadcc10-99a8-11db-937f-000e0c431b59-BOXN-Fm3B-AiyT-HzUh-C9cg-B81p', '2eadcc10-99a8-11db-937f-000e0c431b59', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.5', 'л'),
('2eadcc2e-99a8-11db-937f-000e0c431b59-Bprd-FoaF-A2Qx-HSSK-CQ9S-BwD2', '2eadcc2e-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('2eadcc2e-99a8-11db-937f-000e0c431b59-BqHf-FEif-A531-HLzs-C3Je-BQta', '2eadcc2e-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('2eadcc2e-99a8-11db-937f-000e0c431b59-BR8t-FIIj-A1Bs-HVSc-Cv8J-BPlj', '2eadcc2e-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('2eadcc2e-99a8-11db-937f-000e0c431b59-BuET-FdZl-A6Lj-HFbK-Cpwn-Bg6Z', '2eadcc2e-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'уайт-спирит', ''),
('2eadcc2e-99a8-11db-937f-000e0c431b59-BVc1-FIvI-ATBH-HlxL-CcFJ-BLNS', '2eadcc2e-99a8-11db-937f-000e0c431b59', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.5', 'л'),
('2eadcc30-99a8-11db-937f-000e0c431b59-B8ng-Fb2E-AnH8-Hekt-CFtj-BFSH', '2eadcc30-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'уайт-спирит', ''),
('2eadcc30-99a8-11db-937f-000e0c431b59-BI1A-Fjh7-A7og-HhL4-C07O-BtBq', '2eadcc30-99a8-11db-937f-000e0c431b59', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '1', 'л'),
('2eadcc30-99a8-11db-937f-000e0c431b59-BoOa-Fw1N-A8ST-HGeh-CYOm-BssB', '2eadcc30-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('2eadcc30-99a8-11db-937f-000e0c431b59-BUoN-F4uo-AEZb-Hr6W-CGkl-BhXb', '2eadcc30-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('2eadcc30-99a8-11db-937f-000e0c431b59-BvUu-FEbO-Al1d-HNiM-CP31-Bdwk', '2eadcc30-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('2eadcc32-99a8-11db-937f-000e0c431b59-B8lm-F9H4-A5EJ-HajU-C9OL-BpwR', '2eadcc32-99a8-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'уайт-спирит', ''),
('2eadcc32-99a8-11db-937f-000e0c431b59-B9ii-F7CJ-ApI3-HONL-CWPb-BHyO', '2eadcc32-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('2eadcc32-99a8-11db-937f-000e0c431b59-BCPv-Fix8-Acw5-Hrg7-CXej-B46b', '2eadcc32-99a8-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('2eadcc32-99a8-11db-937f-000e0c431b59-BFRB-F00h-A7WB-HfQ7-C7Pf-BfLi', '2eadcc32-99a8-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('2eadcc32-99a8-11db-937f-000e0c431b59-Bp1q-FhF5-AtcJ-HKk9-CYpQ-BZpP', '2eadcc32-99a8-11db-937f-000e0c431b59', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '5', 'л'),
('30047f82-f788-11e3-8c8a-005056be1f7b-B4GF-FJuI-AnLC-Hom0-CgNr-B4MI', '30047f82-f788-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('30047f82-f788-11e3-8c8a-005056be1f7b-B9Cr-F88J-A5HO-HcsB-CQWf-B1RX', '30047f82-f788-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '800', 'г'),
('30047f82-f788-11e3-8c8a-005056be1f7b-BGyP-F0eK-AY69-H5b7-CJFh-Blwx', '30047f82-f788-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('30047f82-f788-11e3-8c8a-005056be1f7b-BlsW-F9be-AGbt-HUXg-CL5B-BFfv', '30047f82-f788-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'светло-серый', ''),
('30047f82-f788-11e3-8c8a-005056be1f7b-Bodk-F52Q-AXZT-HIhe-CinS-Bynw', '30047f82-f788-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('30047f82-f788-11e3-8c8a-005056be1f7b-Bolb-FrPD-AqwQ-HYpc-ChDv-BIKZ', '30047f82-f788-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('30047f82-f788-11e3-8c8a-005056be1f7b-BXTk-FHo9-Anz4-Hp6Z-Cbyf-Bg9P', '30047f82-f788-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('3114fa55-f78f-11e3-8c8a-005056be1f7b-B0tt-Fr2t-AHrL-Hr4g-CPt0-BtRd', '3114fa55-f78f-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '6000', 'г'),
('3114fa55-f78f-11e3-8c8a-005056be1f7b-BBXx-FxPD-AMCs-HIAZ-C1ck-BMUh', '3114fa55-f78f-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('3114fa55-f78f-11e3-8c8a-005056be1f7b-BcKV-F38n-AI7t-HAKj-CNpk-BAsa', '3114fa55-f78f-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('3114fa55-f78f-11e3-8c8a-005056be1f7b-BfAx-FC1A-ApWw-H3QY-Cwp6-B8rs', '3114fa55-f78f-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('3114fa55-f78f-11e3-8c8a-005056be1f7b-BymO-FvUR-AJkh-HzNm-CgvN-B4l5', '3114fa55-f78f-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'черный', ''),
('3114fa55-f78f-11e3-8c8a-005056be1f7b-Bzdd-Fieo-AIrU-HsrC-CJta-B7gq', '3114fa55-f78f-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('3114fa55-f78f-11e3-8c8a-005056be1f7b-BZhK-FBwe-Adna-HwRP-C0F3-BO1M', '3114fa55-f78f-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('3442e089-0125-11e4-8695-005056be1f7b-B6bm-FQsm-Aeb3-HLon-Clp5-B4St', '3442e089-0125-11e4-8695-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('3442e089-0125-11e4-8695-005056be1f7b-B7I2-FoOA-AYwc-HoNH-CnLm-B8W3', '3442e089-0125-11e4-8695-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '2200', 'г'),
('3442e089-0125-11e4-8695-005056be1f7b-B8eT-FKPg-AptY-HRCh-C3qB-B0vZ', '3442e089-0125-11e4-8695-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('3442e089-0125-11e4-8695-005056be1f7b-BBRR-Fmyv-AzGl-H3eF-CfHh-BV1L', '3442e089-0125-11e4-8695-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'серебрянный', ''),
('3442e089-0125-11e4-8695-005056be1f7b-BneG-FFX7-AXcs-HGIt-ChcQ-Bap9', '3442e089-0125-11e4-8695-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('3442e089-0125-11e4-8695-005056be1f7b-BoHz-FQ0U-AVfb-H41R-CEvt-BqBb', '3442e089-0125-11e4-8695-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('3442e089-0125-11e4-8695-005056be1f7b-BTg3-FMsh-AzUM-HuNe-Cd3l-BTIl', '3442e089-0125-11e4-8695-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('3479e733-bce7-11e4-a1f3-005056be1f7b-BAAx-FgCt-AjoX-HMxE-CjDo-BU6l', '3479e733-bce7-11e4-a1f3-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('3479e733-bce7-11e4-a1f3-005056be1f7b-Bb22-FZa7-AimC-Hsno-C5Yz-BugM', '3479e733-bce7-11e4-a1f3-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'молотковая эмаль-грунт', ''),
('3479e733-bce7-11e4-a1f3-005056be1f7b-Bhll-F4dY-AJJ8-HiFJ-CMFJ-BAlM', '3479e733-bce7-11e4-a1f3-005056be1f7b', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '2', 'л'),
('3479e733-bce7-11e4-a1f3-005056be1f7b-BQkv-F28M-Aq0W-H2wQ-CqjY-B6Lo', '3479e733-bce7-11e4-a1f3-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('3479e733-bce7-11e4-a1f3-005056be1f7b-Brjh-FDtH-A4Yk-HXby-CBJK-Bx5y', '3479e733-bce7-11e4-a1f3-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('3479e733-bce7-11e4-a1f3-005056be1f7b-BsWv-Fuo9-ANaz-HIyM-C3bO-Bwhj', '3479e733-bce7-11e4-a1f3-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'серебристый', ''),
('3479e733-bce7-11e4-a1f3-005056be1f7b-BuL1-FHXn-AL7r-H1Rn-CcyP-BDrs', '3479e733-bce7-11e4-a1f3-005056be1f7b', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для ржавчины', ''),
('3479e733-bce7-11e4-a1f3-005056be1f7b-BwHP-FmQE-AyJg-HC6D-Clnn-BJqW', '3479e733-bce7-11e4-a1f3-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('3526e5c9-f78e-11e3-8c8a-005056be1f7b-B0aF-FDEO-ATkG-HWcp-CU1l-BjIh', '3526e5c9-f78e-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1900', 'г'),
('3526e5c9-f78e-11e3-8c8a-005056be1f7b-BFcZ-FIKT-Alb9-HGLp-CXVl-BDHF', '3526e5c9-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('3526e5c9-f78e-11e3-8c8a-005056be1f7b-BJ6p-Fven-A0iu-HVyq-C00E-Bgzx', '3526e5c9-f78e-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'розово-бежевый', ''),
('3526e5c9-f78e-11e3-8c8a-005056be1f7b-BLiB-FmuA-A4tD-HnIP-Cg2D-B2j8', '3526e5c9-f78e-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('3526e5c9-f78e-11e3-8c8a-005056be1f7b-BqGo-Facc-AHcb-HL9R-C0Dt-BZL4', '3526e5c9-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('3526e5c9-f78e-11e3-8c8a-005056be1f7b-BsxU-Fr5g-AXR3-H9UA-CEBH-Bsbj', '3526e5c9-f78e-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('3526e5c9-f78e-11e3-8c8a-005056be1f7b-BY7P-FR6j-AR0l-HYsC-C94l-B0gV', '3526e5c9-f78e-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('354fea51-be93-11e0-b25c-000e0c431b58-B63k-F4HB-APOo-HUN4-C3JM-BGju', '354fea51-be93-11e0-b25c-000e0c431b58', 'd17cb785-d20b-11e4-9be0-005056be1f7c', 'защита от насекомых древоточцев', ''),
('354fea51-be93-11e0-b25c-000e0c431b58-B6TN-Fai1-AJnb-Hc1F-CWP5-BD1B', '354fea51-be93-11e0-b25c-000e0c431b58', 'd17cb785-d20b-11e4-9be0-005056be1f7c', 'защита от биопоражений', ''),
('354fea51-be93-11e0-b25c-000e0c431b58-B7vY-FRpV-AV0Z-HsEc-CMiL-B9O1', '354fea51-be93-11e0-b25c-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('354fea51-be93-11e0-b25c-000e0c431b58-B95L-FMFi-AhNU-H48E-CTDX-BFDd', '354fea51-be93-11e0-b25c-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'невымываемый', ''),
('354fea51-be93-11e0-b25c-000e0c431b58-B9jH-FBkL-AMwM-HRKb-CcGN-B2X3', '354fea51-be93-11e0-b25c-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для дерева', ''),
('354fea51-be93-11e0-b25c-000e0c431b58-Besv-FpoA-AURC-HBDK-CMBF-BXOL', '354fea51-be93-11e0-b25c-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ZELEST', ''),
('354fea51-be93-11e0-b25c-000e0c431b58-BGTv-F0GZ-ApSL-H6Oo-CmCr-BvIK', '354fea51-be93-11e0-b25c-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('354fea51-be93-11e0-b25c-000e0c431b58-BMt2-Flc7-AEpe-HPnt-CFlT-BNn4', '354fea51-be93-11e0-b25c-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'антисептический состав', ''),
('354fea51-be93-11e0-b25c-000e0c431b58-BxCI-FFdM-AwBN-HLXV-CHvV-Btta', '354fea51-be93-11e0-b25c-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('354fea51-be93-11e0-b25c-000e0c431b58-BYzq-FkG2-ACj9-HPaW-CHnF-B0Oi', '354fea51-be93-11e0-b25c-000e0c431b58', '1d08380b-ce34-11e4-a80e-005056be1f7a', '5000', 'г'),
('354fea53-be93-11e0-b25c-000e0c431b58-B3Hc-FjfY-AKe6-H0fU-CpCH-BGYq', '354fea53-be93-11e0-b25c-000e0c431b58', 'd17cb785-d20b-11e4-9be0-005056be1f7c', 'защита от насекомых древоточцев', ''),
('354fea53-be93-11e0-b25c-000e0c431b58-B7tY-FYMP-Adje-HXmU-CYhM-B0bT', '354fea53-be93-11e0-b25c-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('354fea53-be93-11e0-b25c-000e0c431b58-BAqi-FpBw-Ai56-HuAe-Cf7O-B5Ua', '354fea53-be93-11e0-b25c-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('354fea53-be93-11e0-b25c-000e0c431b58-Bgxb-FWiV-AQOn-Hf5b-CjkR-BYYc', '354fea53-be93-11e0-b25c-000e0c431b58', 'd17cb785-d20b-11e4-9be0-005056be1f7c', 'защита от биопоражений', ''),
('354fea53-be93-11e0-b25c-000e0c431b58-BhuF-Fs6p-ATaQ-Hldh-C6TV-BIE6', '354fea53-be93-11e0-b25c-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('354fea53-be93-11e0-b25c-000e0c431b58-BJy0-FnLm-A9kK-HKkl-CelS-BDQT', '354fea53-be93-11e0-b25c-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'невымываемый', ''),
('354fea53-be93-11e0-b25c-000e0c431b58-BkOB-F21f-AYvz-Hu55-CqRP-BqyE', '354fea53-be93-11e0-b25c-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'антисептический состав', ''),
('354fea53-be93-11e0-b25c-000e0c431b58-Bp1y-FyKe-AsAq-HY6l-C0gz-BBYp', '354fea53-be93-11e0-b25c-000e0c431b58', '1d08380b-ce34-11e4-a80e-005056be1f7a', '10000', 'г'),
('354fea53-be93-11e0-b25c-000e0c431b58-BWVA-Fgz0-ABuI-HUp5-CzMp-B65l', '354fea53-be93-11e0-b25c-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для дерева', ''),
('354fea53-be93-11e0-b25c-000e0c431b58-BzyN-FvjN-AQFK-He0e-C5IT-B5we', '354fea53-be93-11e0-b25c-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ZELEST', ''),
('354fea55-be93-11e0-b25c-000e0c431b58-Bcu5-FQvo-AlGI-HW8Q-CNwg-B2WF', '354fea55-be93-11e0-b25c-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'антисептический состав', ''),
('354fea55-be93-11e0-b25c-000e0c431b58-BDzF-FNpE-Af6f-HiFN-CW5g-BQ2L', '354fea55-be93-11e0-b25c-000e0c431b58', 'd17cb785-d20b-11e4-9be0-005056be1f7c', 'защита от биопоражений', ''),
('354fea55-be93-11e0-b25c-000e0c431b58-Be2r-F7XT-Alfy-HAtU-CVdv-B2H1', '354fea55-be93-11e0-b25c-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('354fea55-be93-11e0-b25c-000e0c431b58-BjxQ-Fpa8-Az1J-H10S-CPbC-BKrx', '354fea55-be93-11e0-b25c-000e0c431b58', '1d08380b-ce34-11e4-a80e-005056be1f7a', '5000', 'г'),
('354fea55-be93-11e0-b25c-000e0c431b58-Buag-FoF8-AIxu-HRD2-CnYL-BfCy', '354fea55-be93-11e0-b25c-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ZELEST', ''),
('354fea55-be93-11e0-b25c-000e0c431b58-BVU2-Fom0-Ay4c-Hfmp-CIeZ-BNfU', '354fea55-be93-11e0-b25c-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('354fea55-be93-11e0-b25c-000e0c431b58-ByS5-F8p2-AN3o-HuuA-CzTy-BG0O', '354fea55-be93-11e0-b25c-000e0c431b58', 'd17cb785-d20b-11e4-9be0-005056be1f7c', 'защита от насекомых древоточцев', ''),
('354fea55-be93-11e0-b25c-000e0c431b58-BzQo-Fjir-AaLG-HmrJ-CaLB-BIIY', '354fea55-be93-11e0-b25c-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для дерева', ''),
('354fea57-be93-11e0-b25c-000e0c431b58-B0hi-FfFn-Atci-HPsZ-Cb1e-BgmS', '354fea57-be93-11e0-b25c-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ZELEST', ''),
('354fea57-be93-11e0-b25c-000e0c431b58-B7sy-FGhB-A3pj-HEul-CQgN-BTwY', '354fea57-be93-11e0-b25c-000e0c431b58', '1d08380b-ce34-11e4-a80e-005056be1f7a', '10000', 'г'),
('354fea57-be93-11e0-b25c-000e0c431b58-BHEE-Fwyy-AxnI-HltI-Czx8-B6Bm', '354fea57-be93-11e0-b25c-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('354fea57-be93-11e0-b25c-000e0c431b58-BHju-Fra1-AjbS-HaEq-ChAY-BWH7', '354fea57-be93-11e0-b25c-000e0c431b58', 'd17cb785-d20b-11e4-9be0-005056be1f7c', 'защита от биопоражений', ''),
('354fea57-be93-11e0-b25c-000e0c431b58-BUZ7-FdAq-Al1e-Hivg-CLvD-BtRJ', '354fea57-be93-11e0-b25c-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('354fea57-be93-11e0-b25c-000e0c431b58-BvmC-FQKy-AwWk-H1F2-CAc2-BmXH', '354fea57-be93-11e0-b25c-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'антисептический состав', ''),
('354fea57-be93-11e0-b25c-000e0c431b58-BXAl-F6PU-AUrK-HzNw-CIiL-BEBM', '354fea57-be93-11e0-b25c-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для дерева', ''),
('354fea57-be93-11e0-b25c-000e0c431b58-BYAm-F9EW-AjV4-Hxoq-CLvQ-B7dr', '354fea57-be93-11e0-b25c-000e0c431b58', 'd17cb785-d20b-11e4-9be0-005056be1f7c', 'защита от насекомых древоточцев', ''),
('380e3f79-f788-11e3-8c8a-005056be1f7b-Bkrm-FlhN-APf0-H5pc-CBFE-BIRY', '380e3f79-f788-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('380e3f79-f788-11e3-8c8a-005056be1f7b-BLAM-FrcO-AI9w-Hsk5-CTMv-Bv14', '380e3f79-f788-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'черный', ''),
('380e3f79-f788-11e3-8c8a-005056be1f7b-BlUf-FqoQ-AzAn-Hp0m-CCL1-B5W0', '380e3f79-f788-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '800', 'г'),
('380e3f79-f788-11e3-8c8a-005056be1f7b-BMO3-FLIh-AnKn-HsS5-CGIR-BJ2g', '380e3f79-f788-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('380e3f79-f788-11e3-8c8a-005056be1f7b-BNHC-FaKx-AokB-Hzkn-C9vo-BKdH', '380e3f79-f788-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('380e3f79-f788-11e3-8c8a-005056be1f7b-BZlG-FLUr-AFo4-H2Zt-Cum2-BxDB', '380e3f79-f788-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('380e3f79-f788-11e3-8c8a-005056be1f7b-BzXC-FtOc-Ad9F-HUvI-CWWz-B99W', '380e3f79-f788-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('3bfb5c69-9fb8-11e3-8705-005056be1f7b-B9dW-FGBD-AJuz-Htzf-CYIx-BT3L', '3bfb5c69-9fb8-11e3-8705-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('3bfb5c69-9fb8-11e3-8705-005056be1f7b-BBmk-FJgN-A3K4-HpGq-C9EJ-BVLK', '3bfb5c69-9fb8-11e3-8705-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('3bfb5c69-9fb8-11e3-8705-005056be1f7b-BCCS-FGhB-AqDI-HirC-Ctvj-BEqp', '3bfb5c69-9fb8-11e3-8705-005056be1f7b', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсальное', ''),
('3bfb5c69-9fb8-11e3-8705-005056be1f7b-BEgV-F6FN-AlPc-HGw0-CAaJ-BOlu', '3bfb5c69-9fb8-11e3-8705-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('3bfb5c69-9fb8-11e3-8705-005056be1f7b-BnKO-FLky-AahD-Hetk-CfG2-Bo5L', '3bfb5c69-9fb8-11e3-8705-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('3bfb5c69-9fb8-11e3-8705-005056be1f7b-BSS5-FuYr-AtYH-H4nt-Coqw-B7wT', '3bfb5c69-9fb8-11e3-8705-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('3bfb5c69-9fb8-11e3-8705-005056be1f7b-BWRI-FxTZ-AmK2-Hi2q-CKOe-Bgh5', '3bfb5c69-9fb8-11e3-8705-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый глянцевый', ''),
('3bfb5c69-9fb8-11e3-8705-005056be1f7b-BWyW-FSZG-AnTh-HakO-C7PE-BLgA', '3bfb5c69-9fb8-11e3-8705-005056be1f7b', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('3bfb5c69-9fb8-11e3-8705-005056be1f7b-BYV6-FNFv-Ate4-Hhxw-CtyZ-BT96', '3bfb5c69-9fb8-11e3-8705-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '900', 'г'),
('3d601a65-f78f-11e3-8c8a-005056be1f7b-B4bm-Fs8T-Ahuz-HNPQ-CbgO-B3MM', '3d601a65-f78f-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'красно-коричневый', ''),
('3d601a65-f78f-11e3-8c8a-005056be1f7b-B4St-Ffcr-AqBx-H0iQ-Cucs-BXLp', '3d601a65-f78f-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('3d601a65-f78f-11e3-8c8a-005056be1f7b-BdZN-Fozq-AA61-HEbf-CFm8-Bd0a', '3d601a65-f78f-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('3d601a65-f78f-11e3-8c8a-005056be1f7b-BGuG-F4Ms-AVw0-HHgr-CPAG-Bdo7', '3d601a65-f78f-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '6000', 'г'),
('3d601a65-f78f-11e3-8c8a-005056be1f7b-BKbX-FXcn-Avpw-Hbmb-CkQw-BurH', '3d601a65-f78f-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('3d601a65-f78f-11e3-8c8a-005056be1f7b-BnVK-FbVs-ArFK-HadW-CFJE-BfpA', '3d601a65-f78f-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('3d601a65-f78f-11e3-8c8a-005056be1f7b-Bqsa-Ff6p-AwWM-HAPY-CNJq-B7oI', '3d601a65-f78f-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('3d822ed4-f78e-11e3-8c8a-005056be1f7b-B0Ti-FWlU-AN5c-HKBp-CYyI-BD65', '3d822ed4-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('3d822ed4-f78e-11e3-8c8a-005056be1f7b-BdTa-F6ec-Al4R-Ht7M-CoMU-Bhle', '3d822ed4-f78e-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('3d822ed4-f78e-11e3-8c8a-005056be1f7b-BJIL-FzS6-Ab3p-HVBv-C2eF-BSaj', '3d822ed4-f78e-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('3d822ed4-f78e-11e3-8c8a-005056be1f7b-BLXg-F1ti-AmlD-Hr5d-CRpf-BurQ', '3d822ed4-f78e-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1900', 'г'),
('3d822ed4-f78e-11e3-8c8a-005056be1f7b-BPI4-FYJl-Ahqq-HJul-Ckt5-BIGg', '3d822ed4-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('3d822ed4-f78e-11e3-8c8a-005056be1f7b-BuBc-FBvZ-AOZl-Hj8N-CDGW-BP7o', '3d822ed4-f78e-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('3d822ed4-f78e-11e3-8c8a-005056be1f7b-Bxdo-FGwM-AN9J-HBrI-ChFm-BD5b', '3d822ed4-f78e-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'охра', ''),
('41f9a64a-f788-11e3-8c8a-005056be1f7b-B1rf-FWVd-A6AV-HdbP-ChQi-B5Qy', '41f9a64a-f788-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'красно-коричневый', ''),
('41f9a64a-f788-11e3-8c8a-005056be1f7b-B5eE-FMpk-AFSg-HFuE-CXkv-B48H', '41f9a64a-f788-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('41f9a64a-f788-11e3-8c8a-005056be1f7b-B5tN-FyFl-AqiW-HbLz-CjYP-BlcL', '41f9a64a-f788-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('41f9a64a-f788-11e3-8c8a-005056be1f7b-B9Bi-FfHS-Ake4-HVY2-Cduv-BmcH', '41f9a64a-f788-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('41f9a64a-f788-11e3-8c8a-005056be1f7b-Bdnc-FFaH-Aodv-HOF5-C8An-BKzt', '41f9a64a-f788-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '800', 'г'),
('41f9a64a-f788-11e3-8c8a-005056be1f7b-BNaC-FE72-ALQl-Hwpi-CDnk-BlJs', '41f9a64a-f788-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('41f9a64a-f788-11e3-8c8a-005056be1f7b-BW4I-FrWk-A852-HfzH-CUul-BY7Q', '41f9a64a-f788-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('441a7da1-9fb8-11e3-8705-005056be1f7b-B4O2-Fvnm-AZY1-H8By-CqVA-BFlO', '441a7da1-9fb8-11e3-8705-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('441a7da1-9fb8-11e3-8705-005056be1f7b-B7a0-FwXB-AlEX-HlK9-CzqN-BQ2r', '441a7da1-9fb8-11e3-8705-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('441a7da1-9fb8-11e3-8705-005056be1f7b-Bc42-FuLr-ANo6-HCDY-C8Nk-BVQT', '441a7da1-9fb8-11e3-8705-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('441a7da1-9fb8-11e3-8705-005056be1f7b-BgPa-FLd9-AGBE-HHWt-CdP8-BUBk', '441a7da1-9fb8-11e3-8705-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('441a7da1-9fb8-11e3-8705-005056be1f7b-Bh2F-FbgM-AIeR-HRzd-CcOz-BYc5', '441a7da1-9fb8-11e3-8705-005056be1f7b', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('441a7da1-9fb8-11e3-8705-005056be1f7b-BiGw-FjUi-Aif3-HZvo-CvNh-Bm9t', '441a7da1-9fb8-11e3-8705-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('441a7da1-9fb8-11e3-8705-005056be1f7b-BJMY-FDtM-AzcB-HOw0-CKT1-BQvW', '441a7da1-9fb8-11e3-8705-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый глянцевый', ''),
('441a7da1-9fb8-11e3-8705-005056be1f7b-BO8s-FSEF-AChU-H03V-Ckyw-BklK', '441a7da1-9fb8-11e3-8705-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '2400', 'г'),
('441a7da1-9fb8-11e3-8705-005056be1f7b-BTLY-FPOb-AnLo-HOh5-CiFB-BUpV', '441a7da1-9fb8-11e3-8705-005056be1f7b', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсальное', ''),
('45794d11-f78e-11e3-8c8a-005056be1f7b-BaGc-FUuL-Ad7S-HVlW-CEMC-BBS5', '45794d11-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('45794d11-f78e-11e3-8c8a-005056be1f7b-BbAR-FhDP-A6BO-H0le-Cc3U-BUsd', '45794d11-f78e-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1900', 'г'),
('45794d11-f78e-11e3-8c8a-005056be1f7b-BBpn-FPZq-AkYi-HTSd-Cqsk-BJCV', '45794d11-f78e-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('45794d11-f78e-11e3-8c8a-005056be1f7b-Bkp7-FG2A-AWtO-HuDU-C02t-B46W', '45794d11-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('45794d11-f78e-11e3-8c8a-005056be1f7b-BRz3-FzJK-AT13-H506-CPVc-Bh0U', '45794d11-f78e-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('45794d11-f78e-11e3-8c8a-005056be1f7b-BVgS-Fo34-AB7F-HD8Y-C80D-BkPd', '45794d11-f78e-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('45794d11-f78e-11e3-8c8a-005056be1f7b-ByY5-FDnh-ALG4-HnsJ-CMH2-BoDs', '45794d11-f78e-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'серый', ''),
('46582c85-c991-11e1-8a6e-005056be3bd8-B7JA-FkCg-A9oH-Ham2-Cjrc-BBep', '46582c85-c991-11e1-8a6e-005056be3bd8', '1d08380b-ce34-11e4-a80e-005056be1f7a', '10000', 'г'),
('46582c85-c991-11e1-8a6e-005056be3bd8-B8Tq-F5x4-AI4O-Hc66-Ce3F-BedH', '46582c85-c991-11e1-8a6e-005056be3bd8', 'd17cb785-d20b-11e4-9be0-005056be1f7c', 'защита от насекомых древоточцев', ''),
('46582c85-c991-11e1-8a6e-005056be3bd8-BBbw-FI2Y-A0aG-Hcck-CHZ4-BxTr', '46582c85-c991-11e1-8a6e-005056be3bd8', 'd17cb785-d20b-11e4-9be0-005056be1f7c', 'защита от биопоражений', ''),
('46582c85-c991-11e1-8a6e-005056be3bd8-BEFU-FIqI-A2Uq-HmcC-CxBp-BNRl', '46582c85-c991-11e1-8a6e-005056be3bd8', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('46582c85-c991-11e1-8a6e-005056be3bd8-BFkc-FwN6-AyA8-HeNO-CGUT-BBrB', '46582c85-c991-11e1-8a6e-005056be3bd8', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'антисептический состав', ''),
('46582c85-c991-11e1-8a6e-005056be3bd8-BGF6-FXs5-Ac9o-H3gX-Cmkc-B8tI', '46582c85-c991-11e1-8a6e-005056be3bd8', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для дерева', ''),
('46582c85-c991-11e1-8a6e-005056be3bd8-Bjna-FP74-AxTQ-Hm9F-CQtZ-Bisu', '46582c85-c991-11e1-8a6e-005056be3bd8', 'e8287600-ad96-11e3-b114-005056be1f7c', 'СЕНЕЖ', ''),
('46582c85-c991-11e1-8a6e-005056be3bd8-BvCe-FwZb-ARPp-HTci-CXXy-Bpyn', '46582c85-c991-11e1-8a6e-005056be3bd8', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('46582c85-c991-11e1-8a6e-005056be3bd8-BvUS-F9Uf-AWkE-Hlxs-Cniv-BIVK', '46582c85-c991-11e1-8a6e-005056be3bd8', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('46582c87-c991-11e1-8a6e-005056be3bd8-BAtH-Ft4h-A9Lc-HN9L-Cxo1-BKN4', '46582c87-c991-11e1-8a6e-005056be3bd8', 'd17cb785-d20b-11e4-9be0-005056be1f7c', 'защита от осадков', ''),
('46582c87-c991-11e1-8a6e-005056be3bd8-Bdwp-Fvmn-A749-HYNG-CxTj-BOgH', '46582c87-c991-11e1-8a6e-005056be3bd8', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('46582c87-c991-11e1-8a6e-005056be3bd8-BeAe-FxT5-A7y3-HYy4-CMSp-B3DS', '46582c87-c991-11e1-8a6e-005056be3bd8', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для дерева', ''),
('46582c87-c991-11e1-8a6e-005056be3bd8-Bf0L-FeYY-AlLs-HKaO-CR6P-Bwsj', '46582c87-c991-11e1-8a6e-005056be3bd8', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'антисептический состав', ''),
('46582c87-c991-11e1-8a6e-005056be3bd8-Bfi4-F9w2-AJjg-H0tu-C4Ga-BC7P', '46582c87-c991-11e1-8a6e-005056be3bd8', 'd17cb785-d20b-11e4-9be0-005056be1f7c', 'защита от насекомых древоточцев', ''),
('46582c87-c991-11e1-8a6e-005056be3bd8-BGca-FMhQ-AeXS-HTZI-Ce9c-BAAy', '46582c87-c991-11e1-8a6e-005056be3bd8', 'e8287600-ad96-11e3-b114-005056be1f7c', 'СЕНЕЖ', ''),
('46582c87-c991-11e1-8a6e-005056be3bd8-BjTg-FCWc-Av1R-H19L-CQUb-BUIZ', '46582c87-c991-11e1-8a6e-005056be3bd8', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'влагостойкий', ''),
('46582c87-c991-11e1-8a6e-005056be3bd8-BLgN-FyWg-AdUc-HD7t-CezF-BH4Z', '46582c87-c991-11e1-8a6e-005056be3bd8', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('46582c87-c991-11e1-8a6e-005056be3bd8-BqoX-FjDM-AcPe-HHIh-Caoh-BlI6', '46582c87-c991-11e1-8a6e-005056be3bd8', '1d08380b-ce34-11e4-a80e-005056be1f7a', '9000', 'г'),
('46582c87-c991-11e1-8a6e-005056be3bd8-BWPE-Fx8v-AUBF-HFzR-CzBy-BC1L', '46582c87-c991-11e1-8a6e-005056be3bd8', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('46582c87-c991-11e1-8a6e-005056be3bd8-BWqJ-F1yR-AXO6-H51E-C11x-B8kr', '46582c87-c991-11e1-8a6e-005056be3bd8', 'd17cb785-d20b-11e4-9be0-005056be1f7c', 'защита от биопоражений', ''),
('46efb407-dea8-11e4-9d9b-005056be1f7b-B5Mg-F2c6-AmxS-HwDM-CE1S-BHjE', '46efb407-dea8-11e4-9d9b-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'антисептический состав', ''),
('46efb407-dea8-11e4-9d9b-005056be1f7b-B9a7-FgGf-AMw7-Hpiz-CJLD-B8Hr', '46efb407-dea8-11e4-9d9b-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'СЕНЕЖ', ''),
('46efb407-dea8-11e4-9d9b-005056be1f7b-B9Ky-Fs5b-Am3i-Hqjp-Cqad-Bv3d', '46efb407-dea8-11e4-9d9b-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('46efb407-dea8-11e4-9d9b-005056be1f7b-BBgZ-FTSc-AgXT-Hze3-C5OA-B5wu', '46efb407-dea8-11e4-9d9b-005056be1f7b', 'd17cb785-d20b-11e4-9be0-005056be1f7c', 'защита от биопоражений', ''),
('46efb407-dea8-11e4-9d9b-005056be1f7b-BFit-FHJ2-AG37-HQZu-CUXK-BQ5R', '46efb407-dea8-11e4-9d9b-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('46efb407-dea8-11e4-9d9b-005056be1f7b-BnNy-F6oH-AbCC-HlH0-CsFJ-BgxD', '46efb407-dea8-11e4-9d9b-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('46efb407-dea8-11e4-9d9b-005056be1f7b-BNtE-Fgjj-AYdy-HZXk-CKKz-B0yB', '46efb407-dea8-11e4-9d9b-005056be1f7b', 'd17cb785-d20b-11e4-9be0-005056be1f7c', 'защита от огня', ''),
('46efb407-dea8-11e4-9d9b-005056be1f7b-BtIA-Fhu3-AcD1-H7H7-CkCI-BG4l', '46efb407-dea8-11e4-9d9b-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '23000', 'г'),
('46efb407-dea8-11e4-9d9b-005056be1f7b-BwGD-Ftvl-Ai6x-Hm35-CT8d-BDFn', '46efb407-dea8-11e4-9d9b-005056be1f7b', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для дерева', ''),
('46efb407-dea8-11e4-9d9b-005056be1f7b-BxPy-FoL7-Akv9-Ht33-CV4Y-BuNr', '46efb407-dea8-11e4-9d9b-005056be1f7b', 'd17cb785-d20b-11e4-9be0-005056be1f7c', 'защита от насекомых древоточцев', ''),
('47de42e5-f789-11e3-8c8a-005056be1f7b-BfRM-FjbG-ASzG-H0f5-C2BO-BCa5', '47de42e5-f789-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('47de42e5-f789-11e3-8c8a-005056be1f7b-BHKp-Fr8R-AspQ-HqnC-CmUI-BtWy', '47de42e5-f789-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('47de42e5-f789-11e3-8c8a-005056be1f7b-BirD-Fori-Aijj-HxmA-Cr08-B8v7', '47de42e5-f789-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('47de42e5-f789-11e3-8c8a-005056be1f7b-Bjye-FzeH-A3Hb-HA1y-CzAq-Bkb2', '47de42e5-f789-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '6000', 'г'),
('47de42e5-f789-11e3-8c8a-005056be1f7b-BK3u-FbLI-AIrF-HgQr-CmX2-BRFz', '47de42e5-f789-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('47de42e5-f789-11e3-8c8a-005056be1f7b-BrGG-FBqa-Ag6R-HSYq-Cf7Y-BjlF', '47de42e5-f789-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('47de42e5-f789-11e3-8c8a-005056be1f7b-BX7Q-Fv9t-AUKU-HjUe-CP1v-BcZN', '47de42e5-f789-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('4dd1de14-f78e-11e3-8c8a-005056be1f7b-BH8d-FKCU-AWzs-Hu0Z-Cyw7-B83N', '4dd1de14-f78e-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('4dd1de14-f78e-11e3-8c8a-005056be1f7b-BhMY-FTql-AzFT-HtmV-CrWU-BnaB', '4dd1de14-f78e-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'светло-серый', ''),
('4dd1de14-f78e-11e3-8c8a-005056be1f7b-BKGd-F32d-ASpP-HPnH-CcWc-BmPi', '4dd1de14-f78e-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('4dd1de14-f78e-11e3-8c8a-005056be1f7b-BMGu-FSgj-A2PC-HF2L-CwYY-BKrE', '4dd1de14-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('4dd1de14-f78e-11e3-8c8a-005056be1f7b-BtUK-F3Gv-Ac5i-HJco-CWkl-Bzuo', '4dd1de14-f78e-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('4dd1de14-f78e-11e3-8c8a-005056be1f7b-BwhJ-FGQw-Ab8I-Hwkj-Cyxq-BiFN', '4dd1de14-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('4dd1de14-f78e-11e3-8c8a-005056be1f7b-BYsc-F726-AlNf-HMDQ-C2NX-BUGO', '4dd1de14-f78e-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1900', 'г'),
('4ed5aaa1-f789-11e3-8c8a-005056be1f7b-BAxb-FNLc-AgXC-HnEc-CO3u-B8ID', '4ed5aaa1-f789-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('4ed5aaa1-f789-11e3-8c8a-005056be1f7b-BgMM-FF87-AHkY-Htvq-Ccwd-B4Ao', '4ed5aaa1-f789-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('4ed5aaa1-f789-11e3-8c8a-005056be1f7b-BLwh-FMY3-AVEt-Hr8r-CBww-B6Al', '4ed5aaa1-f789-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '6000', 'г'),
('4ed5aaa1-f789-11e3-8c8a-005056be1f7b-Btki-FyGz-AgtM-HXAS-CMjG-BqZl', '4ed5aaa1-f789-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый матовый', ''),
('4ed5aaa1-f789-11e3-8c8a-005056be1f7b-BWgC-FYJH-A2YA-HlVJ-Cp2W-B38T', '4ed5aaa1-f789-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('4ed5aaa1-f789-11e3-8c8a-005056be1f7b-BySs-FPTj-ADIj-HutB-Cmcl-BLRs', '4ed5aaa1-f789-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('4ed5aaa1-f789-11e3-8c8a-005056be1f7b-BzF5-FNyq-A4Qc-HXKc-CBg0-BE6J', '4ed5aaa1-f789-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('55c10657-f78e-11e3-8c8a-005056be1f7b-B7d2-FIzw-AOUb-Hayz-CRRY-BXRY', '55c10657-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('55c10657-f78e-11e3-8c8a-005056be1f7b-BaKq-Fq5w-A5Oa-HpZX-CAV1-B3dq', '55c10657-f78e-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('55c10657-f78e-11e3-8c8a-005056be1f7b-BciG-FAAD-A3RP-HuFN-CUnv-BK7V', '55c10657-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('55c10657-f78e-11e3-8c8a-005056be1f7b-Bih1-FSkv-AhgM-HV5F-CfpL-BdY2', '55c10657-f78e-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'черный', ''),
('55c10657-f78e-11e3-8c8a-005056be1f7b-BLys-FmeH-A0ed-H1X7-CgCo-BhIw', '55c10657-f78e-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('55c10657-f78e-11e3-8c8a-005056be1f7b-BorA-FFHz-A6ZG-HTwY-CsNi-BZ5d', '55c10657-f78e-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('55c10657-f78e-11e3-8c8a-005056be1f7b-BWDL-FdX9-A2FL-HaeF-C4q5-BmSY', '55c10657-f78e-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1900', 'г'),
('5ed5699a-f78e-11e3-8c8a-005056be1f7b-BFm7-FOeO-ALKt-HZOC-Cu2c-BKhk', '5ed5699a-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('5ed5699a-f78e-11e3-8c8a-005056be1f7b-BLdA-FGPN-A3oM-H4T2-CDZd-BAn9', '5ed5699a-f78e-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('5ed5699a-f78e-11e3-8c8a-005056be1f7b-BnZa-FpHA-A7a6-HvNw-CZ0B-BooK', '5ed5699a-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('5ed5699a-f78e-11e3-8c8a-005056be1f7b-BOyJ-F8NX-AA8P-HdHw-CDTQ-BEZg', '5ed5699a-f78e-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('5ed5699a-f78e-11e3-8c8a-005056be1f7b-BRSL-FeMf-AVQ5-HzQh-CyfV-B8dj', '5ed5699a-f78e-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('5ed5699a-f78e-11e3-8c8a-005056be1f7b-BVeg-Fk8o-AWB8-HnFX-CJXq-BU33', '5ed5699a-f78e-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1900', 'г'),
('5ed5699a-f78e-11e3-8c8a-005056be1f7b-BwOP-FpJa-A9wJ-H3S7-CpeN-BETV', '5ed5699a-f78e-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'красно-коричневый', ''),
('5fde6d12-f789-11e3-8c8a-005056be1f7b-Befu-FS2o-A6s8-H8NB-C9AK-B4zW', '5fde6d12-f789-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('5fde6d12-f789-11e3-8c8a-005056be1f7b-Bh4P-FQvD-ANIV-HrP7-CBBc-BEw6', '5fde6d12-f789-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('5fde6d12-f789-11e3-8c8a-005056be1f7b-BmAm-F9r3-A5t5-HWxq-CRJO-Boxt', '5fde6d12-f789-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '6000', 'г'),
('5fde6d12-f789-11e3-8c8a-005056be1f7b-Bpm2-FHEX-Awas-H2x8-CWSd-BHkU', '5fde6d12-f789-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('5fde6d12-f789-11e3-8c8a-005056be1f7b-BViW-Fner-Avxr-Hf9z-CTgt-Bjxe', '5fde6d12-f789-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('5fde6d12-f789-11e3-8c8a-005056be1f7b-BwfD-FucR-AvbS-H7UH-CTAt-BKHy', '5fde6d12-f789-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('5fde6d12-f789-11e3-8c8a-005056be1f7b-BwJ5-FyLw-Awfc-Hcfo-CWVF-BWPf', '5fde6d12-f789-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'серебрянный', ''),
('612d8834-6137-11e1-96bd-005056be3bd8-B6GJ-FdEC-AdCm-H8kN-C5iL-B7vS', '612d8834-6137-11e1-96bd-005056be3bd8', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсальное', ''),
('612d8834-6137-11e1-96bd-005056be3bd8-B98B-FNHq-AEb8-HHAO-C00c-BfD3', '612d8834-6137-11e1-96bd-005056be3bd8', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('612d8834-6137-11e1-96bd-005056be3bd8-B9Of-FEZZ-ACRi-H93A-C9jd-Bhk8', '612d8834-6137-11e1-96bd-005056be3bd8', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('612d8834-6137-11e1-96bd-005056be3bd8-BiBF-FDoI-AbQh-HJ48-CKHk-Badk', '612d8834-6137-11e1-96bd-005056be3bd8', '1d08380b-ce34-11e4-a80e-005056be1f7a', '900', 'г'),
('612d8834-6137-11e1-96bd-005056be3bd8-BmMP-F0yZ-A8nG-HL58-C3I6-BlbA', '612d8834-6137-11e1-96bd-005056be3bd8', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('612d8834-6137-11e1-96bd-005056be3bd8-BMOp-F7hI-Atrf-HnCX-ClZs-BmZB', '612d8834-6137-11e1-96bd-005056be3bd8', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для радиаторов', ''),
('612d8834-6137-11e1-96bd-005056be3bd8-BNmP-FWAZ-ARrN-HBIm-CuU2-BZRY', '612d8834-6137-11e1-96bd-005056be3bd8', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('612d8834-6137-11e1-96bd-005056be3bd8-Bnzu-Fl8u-Az8u-HScx-CKX4-BU29', '612d8834-6137-11e1-96bd-005056be3bd8', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('612d8834-6137-11e1-96bd-005056be3bd8-Bqdi-FBda-AXEP-HJp1-CTRD-BjQ2', '612d8834-6137-11e1-96bd-005056be3bd8', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый глянцевый', ''),
('612d8834-6137-11e1-96bd-005056be3bd8-BXVA-F0Sk-ANNJ-HYK5-Cqxu-BbYs', '612d8834-6137-11e1-96bd-005056be3bd8', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('612d8856-6137-11e1-96bd-005056be3bd8-B6ZR-Fa3i-AuYS-Hmav-Cv4c-BKa2', '612d8856-6137-11e1-96bd-005056be3bd8', 'd17cb785-d20b-11e4-9be0-005056be1f7c', 'защита от биопоражений', ''),
('612d8856-6137-11e1-96bd-005056be3bd8-Bbgf-FtRb-ANQD-Hrkw-Ckrf-BEyO', '612d8856-6137-11e1-96bd-005056be3bd8', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'антисептический состав', ''),
('612d8856-6137-11e1-96bd-005056be3bd8-BdCG-FnkC-ArcR-Hu6e-C9ld-BUs4', '612d8856-6137-11e1-96bd-005056be3bd8', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('612d8856-6137-11e1-96bd-005056be3bd8-BdrZ-FgY0-AT9q-HyDf-CD2z-BnaY', '612d8856-6137-11e1-96bd-005056be3bd8', 'd17cb785-d20b-11e4-9be0-005056be1f7c', 'защита от биопоражений', ''),
('612d8856-6137-11e1-96bd-005056be3bd8-BHte-FHst-AfUv-HPsa-CTMc-BZzD', '612d8856-6137-11e1-96bd-005056be3bd8', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для дерева', ''),
('612d8856-6137-11e1-96bd-005056be3bd8-BJt1-Fzi4-AVlu-HKPL-CjLl-B1ld', '612d8856-6137-11e1-96bd-005056be3bd8', 'd17cb785-d20b-11e4-9be0-005056be1f7c', 'защита от насекомых древоточцев', ''),
('612d8856-6137-11e1-96bd-005056be3bd8-Bq0V-FGZw-AAkA-H0PX-ClCt-BXoD', '612d8856-6137-11e1-96bd-005056be3bd8', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ZELEST', ''),
('612d8856-6137-11e1-96bd-005056be3bd8-BSAm-F8KM-AwIa-Haa4-CLN9-BoXm', '612d8856-6137-11e1-96bd-005056be3bd8', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('612d8856-6137-11e1-96bd-005056be3bd8-BxUj-FjjS-A03e-HcRU-Cgt2-BBdI', '612d8856-6137-11e1-96bd-005056be3bd8', '1d08380b-ce34-11e4-a80e-005056be1f7a', '12000', 'г'),
('612d8856-6137-11e1-96bd-005056be3bd8-BxWv-FmTF-AXCK-Hi7D-C2PD-BdMN', '612d8856-6137-11e1-96bd-005056be3bd8', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('612d8858-6137-11e1-96bd-005056be3bd8-BBQG-F8W6-Af6L-HZXI-CTGk-B7A0', '612d8858-6137-11e1-96bd-005056be3bd8', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('612d8858-6137-11e1-96bd-005056be3bd8-BdhN-FDYG-AhJh-HPaT-CWbj-BdY6', '612d8858-6137-11e1-96bd-005056be3bd8', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для дерева', ''),
('612d8858-6137-11e1-96bd-005056be3bd8-BGZi-FbtH-AxCJ-HqiP-C8L4-BZWw', '612d8858-6137-11e1-96bd-005056be3bd8', 'd17cb785-d20b-11e4-9be0-005056be1f7c', 'защита от биопоражений', ''),
('612d8858-6137-11e1-96bd-005056be3bd8-BhGv-FrwT-A7uf-HzJ2-Cmbs-BoCm', '612d8858-6137-11e1-96bd-005056be3bd8', 'd17cb785-d20b-11e4-9be0-005056be1f7c', 'защита от насекомых древоточцев', ''),
('612d8858-6137-11e1-96bd-005056be3bd8-BiOf-FTZu-Ae97-HGzh-CjP5-Bb84', '612d8858-6137-11e1-96bd-005056be3bd8', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('612d8858-6137-11e1-96bd-005056be3bd8-Bmnb-FK42-AeQT-HDts-C0Hm-B2r6', '612d8858-6137-11e1-96bd-005056be3bd8', '1d08380b-ce34-11e4-a80e-005056be1f7a', '25000', 'г'),
('612d8858-6137-11e1-96bd-005056be3bd8-BR1C-Fl5v-AT53-H6vk-C220-BZTs', '612d8858-6137-11e1-96bd-005056be3bd8', 'd17cb785-d20b-11e4-9be0-005056be1f7c', 'защита от биопоражений', ''),
('612d8858-6137-11e1-96bd-005056be3bd8-Btbn-F5Zh-AgNk-H23d-Cvbs-BQvH', '612d8858-6137-11e1-96bd-005056be3bd8', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ZELEST', ''),
('612d8858-6137-11e1-96bd-005056be3bd8-BY42-FjTO-AsmU-HTiV-CTC4-BgFR', '612d8858-6137-11e1-96bd-005056be3bd8', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'антисептический состав', ''),
('612d8858-6137-11e1-96bd-005056be3bd8-BZW2-Fs9R-AetL-H84l-CyDV-Bp44', '612d8858-6137-11e1-96bd-005056be3bd8', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('6260610c-29f2-11e4-816f-005056be1f7b-B1S9-Fgre-AwEn-HR3y-CAJv-BAhW', '6260610c-29f2-11e4-816f-005056be1f7b', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для дерева', ''),
('6260610c-29f2-11e4-816f-005056be1f7b-B3dy-Fkj8-A6l7-Hjnb-C4Jt-BSTT', '6260610c-29f2-11e4-816f-005056be1f7b', 'd17cb785-d20b-11e4-9be0-005056be1f7c', 'защита от биопоражений', ''),
('6260610c-29f2-11e4-816f-005056be1f7b-BARu-F71X-AYuh-HID1-CbmH-BVnJ', '6260610c-29f2-11e4-816f-005056be1f7b', 'd17cb785-d20b-11e4-9be0-005056be1f7c', 'защита от огня', ''),
('6260610c-29f2-11e4-816f-005056be1f7b-BgSY-FJjQ-A9ka-Htk9-CFPd-BvXw', '6260610c-29f2-11e4-816f-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '23000', 'г'),
('6260610c-29f2-11e4-816f-005056be1f7b-BjR4-FABe-A9Ht-Hc4G-COvj-BDWI', '6260610c-29f2-11e4-816f-005056be1f7b', 'd17cb785-d20b-11e4-9be0-005056be1f7c', 'защита от насекомых древоточцев', ''),
('6260610c-29f2-11e4-816f-005056be1f7b-BKBX-FB8t-ApCq-HYfP-CXIf-BxLt', '6260610c-29f2-11e4-816f-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЭКОДОМ', ''),
('6260610c-29f2-11e4-816f-005056be1f7b-BKPX-FoFD-Ahc1-H6Wo-CF7s-Bdj9', '6260610c-29f2-11e4-816f-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('6260610c-29f2-11e4-816f-005056be1f7b-BmPa-FCOe-AuPF-Hook-Cszz-BGe6', '6260610c-29f2-11e4-816f-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('6260610c-29f2-11e4-816f-005056be1f7b-Bofp-FISG-AGBs-HFIU-CC9n-BBfU', '6260610c-29f2-11e4-816f-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'антисептический состав', ''),
('6260610c-29f2-11e4-816f-005056be1f7b-BR70-FXko-A8Td-Hxa9-Ctl0-BGm7', '6260610c-29f2-11e4-816f-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('680965ab-f789-11e3-8c8a-005056be1f7b-B5WG-FkQg-AlDa-HpbM-CCdY-Bm1C', '680965ab-f789-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('680965ab-f789-11e3-8c8a-005056be1f7b-BBtV-FbYx-AobR-HDDI-CFab-Blqc', '680965ab-f789-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('680965ab-f789-11e3-8c8a-005056be1f7b-BCLj-FWnv-Acd3-HrLo-CK4y-BaEn', '680965ab-f789-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('680965ab-f789-11e3-8c8a-005056be1f7b-BdBl-F3To-AZMU-HbLF-C1HO-Brvd', '680965ab-f789-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('680965ab-f789-11e3-8c8a-005056be1f7b-BrKQ-FKzd-AScp-H5aB-Cw4D-BYwX', '680965ab-f789-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('680965ab-f789-11e3-8c8a-005056be1f7b-BTlo-F5UR-Ajry-HlL7-C4Mp-BPoE', '680965ab-f789-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '20000', 'г'),
('680965ab-f789-11e3-8c8a-005056be1f7b-BXTf-FPAr-A5Ll-Htmp-CXhB-BeHS', '680965ab-f789-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('727c8145-f789-11e3-8c8a-005056be1f7b-B4cu-FNgA-AjpK-HZTN-Cpi1-BsvU', '727c8145-f789-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('727c8145-f789-11e3-8c8a-005056be1f7b-B4eg-F4Zk-Ajx9-H2zQ-CdJJ-BwRm', '727c8145-f789-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('727c8145-f789-11e3-8c8a-005056be1f7b-BDTf-FUWj-Adc0-H6Eq-CXXR-BCSl', '727c8145-f789-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый матовый', ''),
('727c8145-f789-11e3-8c8a-005056be1f7b-BlQR-Fn4B-A9JE-HpZI-CdSk-BNgH', '727c8145-f789-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '20000', 'г'),
('727c8145-f789-11e3-8c8a-005056be1f7b-BOmD-FNe3-Ae8C-HnuU-CPCr-BQDy', '727c8145-f789-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('727c8145-f789-11e3-8c8a-005056be1f7b-BSWA-FBHn-AY6U-HEQV-CIJ1-BoDP', '727c8145-f789-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('727c8145-f789-11e3-8c8a-005056be1f7b-BT3T-FIdf-AEXs-HunX-Cyqq-BUBD', '727c8145-f789-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('747ef690-551c-11dc-beb4-000e0c431b58-B90A-FIq5-Aj87-HHBV-CTpa-BnxQ', '747ef690-551c-11dc-beb4-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('747ef690-551c-11dc-beb4-000e0c431b58-BAu0-F83A-ATLq-Htyd-CARz-B0zG', '747ef690-551c-11dc-beb4-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('747ef690-551c-11dc-beb4-000e0c431b58-BcW0-FiQS-ANyS-HEDV-CFCU-BFKB', '747ef690-551c-11dc-beb4-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('747ef690-551c-11dc-beb4-000e0c431b58-BnEU-FH1z-AjsF-H4Sp-ChA2-BPDB', '747ef690-551c-11dc-beb4-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый матовый', ''),
('747ef690-551c-11dc-beb4-000e0c431b58-BQIR-FRYk-Acq5-HY9M-CMQx-BMOI', '747ef690-551c-11dc-beb4-000e0c431b58', '1d08380b-ce34-11e4-a80e-005056be1f7a', '2000', 'г'),
('747ef690-551c-11dc-beb4-000e0c431b58-BRC5-FjH9-A6NA-HQTL-CSU7-BRRy', '747ef690-551c-11dc-beb4-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('747ef690-551c-11dc-beb4-000e0c431b58-BSk0-F9Uy-AbVF-HRU5-CXm8-BSME', '747ef690-551c-11dc-beb4-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('7ab6caa7-b1ee-11e0-aa21-000e0c431b58-Bi74-FAQX-ArqZ-HB13-CFnf-B8E7', '7ab6caa7-b1ee-11e0-aa21-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('7ab6caa7-b1ee-11e0-aa21-000e0c431b58-Binx-F5Lh-ASL1-HmEK-CMUL-Bd0O', '7ab6caa7-b1ee-11e0-aa21-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'PARADE', ''),
('7ab6caa7-b1ee-11e0-aa21-000e0c431b58-BkiW-FVmc-AKnP-HtrX-CCQB-BzKN', '7ab6caa7-b1ee-11e0-aa21-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('7ab6caa7-b1ee-11e0-aa21-000e0c431b58-Bm2k-F2kR-APmh-HRcs-CezL-B4DR', '7ab6caa7-b1ee-11e0-aa21-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'не профессиональная (без пистолета)', ''),
('7ab6caa7-b1ee-11e0-aa21-000e0c431b58-BQBQ-FpCG-AiIu-HDFz-CAxj-BEIT', '7ab6caa7-b1ee-11e0-aa21-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('7ab6caa7-b1ee-11e0-aa21-000e0c431b58-BrtD-FVte-AfeW-HhuX-C0ST-B3Tk', '7ab6caa7-b1ee-11e0-aa21-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('7ab6caa7-b1ee-11e0-aa21-000e0c431b58-BWck-FKCV-A81r-HSAY-CPmP-Bze1', '7ab6caa7-b1ee-11e0-aa21-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'спецгрунт', ''),
('7ab6caa7-b1ee-11e0-aa21-000e0c431b58-BXdZ-FOFd-AYSx-Hjvw-CyVV-BKq8', '7ab6caa7-b1ee-11e0-aa21-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '10', 'л'),
('7ab6caa7-b1ee-11e0-aa21-000e0c431b58-Bxm3-Fabt-ApGo-HAbJ-Cu2C-BQBb', '7ab6caa7-b1ee-11e0-aa21-000e0c431b58', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('7c1e70d5-5a9d-11dc-be42-000e0c431b58-B1AK-FRig-AWNV-H6EC-CYEq-BkD8', '7c1e70d5-5a9d-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('7c1e70d5-5a9d-11dc-be42-000e0c431b58-BAnM-F9Re-As49-HQfz-CjLi-BxtS', '7c1e70d5-5a9d-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый матовый', ''),
('7c1e70d5-5a9d-11dc-be42-000e0c431b58-Bc4G-FxyL-A1MP-HgxT-Ce4F-BW9G', '7c1e70d5-5a9d-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('7c1e70d5-5a9d-11dc-be42-000e0c431b58-BFv2-FEBX-A4lj-HbYT-CuOT-B6g3', '7c1e70d5-5a9d-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('7c1e70d5-5a9d-11dc-be42-000e0c431b58-BGGw-FWnk-AqId-Hvfb-C3PT-Bkjn', '7c1e70d5-5a9d-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('7c1e70d5-5a9d-11dc-be42-000e0c431b58-BrMs-FDJs-A69K-Hr5a-CRBh-BDYL', '7c1e70d5-5a9d-11dc-be42-000e0c431b58', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1000', 'г'),
('7c1e70d5-5a9d-11dc-be42-000e0c431b58-Bu2s-FTTG-AmEV-H7A3-Czcv-B6Qj', '7c1e70d5-5a9d-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('7e531df3-b5f5-11e1-83ba-005056be3bd8-B9Bq-FePe-Ar3p-HEV2-CqpR-BELA', '7e531df3-b5f5-11e1-83ba-005056be3bd8', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('7e531df3-b5f5-11e1-83ba-005056be3bd8-Bd4i-Fk1z-AksD-HmRx-C4UO-BDDv', '7e531df3-b5f5-11e1-83ba-005056be3bd8', 'e8287600-ad96-11e3-b114-005056be1f7c', 'COSMOFEN', ''),
('7e531df3-b5f5-11e1-83ba-005056be3bd8-BDbJ-Fsgf-AkMK-H3QV-C3nJ-Bwfe', '7e531df3-b5f5-11e1-83ba-005056be3bd8', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'прозрачный', ''),
('7e531df3-b5f5-11e1-83ba-005056be3bd8-BG11-FKcH-A9Vb-HNZe-C98I-B6ro', '7e531df3-b5f5-11e1-83ba-005056be3bd8', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '1', 'л'),
('7e531df3-b5f5-11e1-83ba-005056be3bd8-Bin8-FtfO-AFY2-HOKX-CsoR-BRPH', '7e531df3-b5f5-11e1-83ba-005056be3bd8', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('7e531df3-b5f5-11e1-83ba-005056be3bd8-BJwC-FBBN-AYu2-HpBG-CxI7-BnTY', '7e531df3-b5f5-11e1-83ba-005056be3bd8', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'очиститель', ''),
('7e531df3-b5f5-11e1-83ba-005056be3bd8-BWx4-F3Ur-AXEG-H7QA-C3OB-BitR', '7e531df3-b5f5-11e1-83ba-005056be3bd8', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('7ff8df4e-f789-11e3-8c8a-005056be1f7b-B5Ig-FbUb-Aw2l-HCzG-CwVr-BzcX', '7ff8df4e-f789-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('7ff8df4e-f789-11e3-8c8a-005056be1f7b-Bcpn-Ftaw-AcjQ-HXlj-Ctq0-BmKD', '7ff8df4e-f789-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '20000', 'г'),
('7ff8df4e-f789-11e3-8c8a-005056be1f7b-BEZ4-FeEQ-ARai-HLTQ-Caow-BhlT', '7ff8df4e-f789-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('7ff8df4e-f789-11e3-8c8a-005056be1f7b-BgkD-FGqf-Auge-HOHR-CGZh-B1Ws', '7ff8df4e-f789-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('7ff8df4e-f789-11e3-8c8a-005056be1f7b-BRPu-F8KE-Awyg-HM6V-CgJP-B8ft', '7ff8df4e-f789-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'серебрянный', ''),
('7ff8df4e-f789-11e3-8c8a-005056be1f7b-BUfG-F7h6-ADTQ-HvJs-CId6-BCTW', '7ff8df4e-f789-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('7ff8df4e-f789-11e3-8c8a-005056be1f7b-BUM4-FzaB-AGha-HoXw-CWR5-B4sP', '7ff8df4e-f789-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('82ebcce8-bce7-11e4-a1f3-005056be1f7b-B2Ns-FCvI-AIem-HOBa-C6Hi-BrcT', '82ebcce8-bce7-11e4-a1f3-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'серебристый', ''),
('82ebcce8-bce7-11e4-a1f3-005056be1f7b-B4oY-FuKo-AIHC-HRMc-Cw26-BYWt', '82ebcce8-bce7-11e4-a1f3-005056be1f7b', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для ржавчины', ''),
('82ebcce8-bce7-11e4-a1f3-005056be1f7b-BIvI-FBUi-AEH1-HUlK-CVOn-B2eU', '82ebcce8-bce7-11e4-a1f3-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('82ebcce8-bce7-11e4-a1f3-005056be1f7b-BmB4-FFU6-AC9V-HJjz-Code-BDNo', '82ebcce8-bce7-11e4-a1f3-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'молотковая эмаль-грунт', ''),
('82ebcce8-bce7-11e4-a1f3-005056be1f7b-Bmcf-FPrh-Apno-HNUG-ChiV-BVgb', '82ebcce8-bce7-11e4-a1f3-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('82ebcce8-bce7-11e4-a1f3-005056be1f7b-Bodm-FeyO-ApJc-HTB8-CnaH-Blee', '82ebcce8-bce7-11e4-a1f3-005056be1f7b', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '10', 'л'),
('82ebcce8-bce7-11e4-a1f3-005056be1f7b-BOOy-F9Fw-AOq4-HjaD-CwRQ-BeUB', '82ebcce8-bce7-11e4-a1f3-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('82ebcce8-bce7-11e4-a1f3-005056be1f7b-BYJ8-FDXS-AK51-HfPX-C8YJ-BFZe', '82ebcce8-bce7-11e4-a1f3-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('8522912f-f3fb-11e4-9746-005056be1f7b-B1nS-FTni-Az1t-HVCB-CiHc-B3fA', '8522912f-f3fb-11e4-9746-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('8522912f-f3fb-11e4-9746-005056be1f7b-B600-FGr3-AHGS-HIeq-C4h5-Bwn0', '8522912f-f3fb-11e4-9746-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('8522912f-f3fb-11e4-9746-005056be1f7b-BCN3-FFEw-Ac8v-Hi0N-C5gc-BqCN', '8522912f-f3fb-11e4-9746-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'синий', ''),
('8522912f-f3fb-11e4-9746-005056be1f7b-BF9G-FiEi-AJ52-HXDf-COu8-B7Lv', '8522912f-f3fb-11e4-9746-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'грунт-эмаль', ''),
('8522912f-f3fb-11e4-9746-005056be1f7b-BFaT-FXiy-AEcV-H0O9-C9wE-B5Gt', '8522912f-f3fb-11e4-9746-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('8522912f-f3fb-11e4-9746-005056be1f7b-BiF7-FTo7-Ahjc-H0Pf-CNLf-BMSN', '8522912f-f3fb-11e4-9746-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('8522912f-f3fb-11e4-9746-005056be1f7b-Bqkc-FCjq-ABhd-HGck-CzTN-BIn2', '8522912f-f3fb-11e4-9746-005056be1f7b', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '10', 'л'),
('8522912f-f3fb-11e4-9746-005056be1f7b-Brcr-Fbxu-AdW3-H6OY-C659-BY8i', '8522912f-f3fb-11e4-9746-005056be1f7b', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для ржавчины', ''),
('897bb5a6-b0fa-11e3-b34d-005056be1f7b-B5tp-FK9V-AXx9-Hl8C-CyX5-B4aO', '897bb5a6-b0fa-11e3-b34d-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'PARADE', ''),
('897bb5a6-b0fa-11e3-b34d-005056be1f7b-B9vB-Ftei-AOHP-HPpN-CynO-BJEM', '897bb5a6-b0fa-11e3-b34d-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('897bb5a6-b0fa-11e3-b34d-005056be1f7b-Ba2E-FCUu-APrD-HzvS-CUuD-BWei', '897bb5a6-b0fa-11e3-b34d-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('897bb5a6-b0fa-11e3-b34d-005056be1f7b-BaUL-F4XX-A10d-HgRu-CL5Y-Bmfo', '897bb5a6-b0fa-11e3-b34d-005056be1f7b', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для краски', ''),
('897bb5a6-b0fa-11e3-b34d-005056be1f7b-BBJt-Fwrr-A9dT-HzMn-CMn9-BYhV', '897bb5a6-b0fa-11e3-b34d-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'растворитель', ''),
('897bb5a6-b0fa-11e3-b34d-005056be1f7b-Bmob-FlPY-AnEv-Hh9L-Cwm2-BsUW', '897bb5a6-b0fa-11e3-b34d-005056be1f7b', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для эмали', ''),
('897bb5a6-b0fa-11e3-b34d-005056be1f7b-Bnp7-Frfs-AAzc-HDL8-CmGq-BRQo', '897bb5a6-b0fa-11e3-b34d-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('897bb5a6-b0fa-11e3-b34d-005056be1f7b-BvXV-FP5n-A0Fi-HYsD-CCtN-Bvg5', '897bb5a6-b0fa-11e3-b34d-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '0,7', 'г'),
('89cb1aab-b1c3-11e0-aa21-000e0c431b58-B5bU-FZMx-AKDi-HKAz-Csg2-BfQB', '89cb1aab-b1c3-11e0-aa21-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('89cb1aab-b1c3-11e0-aa21-000e0c431b58-BDFr-FkZD-AYvu-Hfwu-CCJZ-BCPG', '89cb1aab-b1c3-11e0-aa21-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '2.5', 'л'),
('89cb1aab-b1c3-11e0-aa21-000e0c431b58-BE90-FnJA-Ac2h-HUWx-CVqH-BB0h', '89cb1aab-b1c3-11e0-aa21-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'PARADE', ''),
('89cb1aab-b1c3-11e0-aa21-000e0c431b58-BgBw-FtJy-ADo9-HFpW-CDXX-BBj4', '89cb1aab-b1c3-11e0-aa21-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('89cb1aab-b1c3-11e0-aa21-000e0c431b58-Bhmt-Fbun-AIym-Hz2P-Co5U-BVfu', '89cb1aab-b1c3-11e0-aa21-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'не профессиональная (без пистолета)', ''),
('89cb1aab-b1c3-11e0-aa21-000e0c431b58-BsA8-FLg3-A3ae-Hudv-C1v0-B8Qh', '89cb1aab-b1c3-11e0-aa21-000e0c431b58', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('89cb1aab-b1c3-11e0-aa21-000e0c431b58-BUUp-FSZV-Apdt-HCeS-C7Yt-BQx7', '89cb1aab-b1c3-11e0-aa21-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('89cb1aab-b1c3-11e0-aa21-000e0c431b58-BWoA-FFre-AXn4-HH5r-CD9q-BDmz', '89cb1aab-b1c3-11e0-aa21-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('89cb1aab-b1c3-11e0-aa21-000e0c431b58-BZ4f-FKYS-A5bb-HTer-CaCT-BJdE', '89cb1aab-b1c3-11e0-aa21-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'спецгрунт', ''),
('9291c63a-5ab3-11dc-be42-000e0c431b58-B955-FhK4-AXG0-HHWA-Ccml-BHCc', '9291c63a-5ab3-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('9291c63a-5ab3-11dc-be42-000e0c431b58-BA50-FACW-AAe9-HmmB-CEtf-B7m9', '9291c63a-5ab3-11dc-be42-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.52', 'л'),
('9291c63a-5ab3-11dc-be42-000e0c431b58-BbUC-F0Bq-AHqj-HP0z-C6Gu-BQAV', '9291c63a-5ab3-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('9291c63a-5ab3-11dc-be42-000e0c431b58-BefY-FRuf-APui-HroH-Co3I-BTQq', '9291c63a-5ab3-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый глянцевый', ''),
('9291c63a-5ab3-11dc-be42-000e0c431b58-BG5U-F5k0-AkUK-HQTB-Cixg-B7FR', '9291c63a-5ab3-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('9291c63a-5ab3-11dc-be42-000e0c431b58-BGe2-F4cN-AvsA-H8Bx-CL0s-BGh3', '9291c63a-5ab3-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('9291c63a-5ab3-11dc-be42-000e0c431b58-BJXr-FJUs-A8gs-HpnP-ChnK-BhnN', '9291c63a-5ab3-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('9291c63a-5ab3-11dc-be42-000e0c431b58-BPkp-Fa29-AbZw-H9V2-CPxM-BSxO', '9291c63a-5ab3-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсальное', ''),
('9291c63c-5ab3-11dc-be42-000e0c431b58-B0OQ-FCOt-ATFm-HEjj-C6hI-BVQh', '9291c63c-5ab3-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'черный глянцевый', ''),
('9291c63c-5ab3-11dc-be42-000e0c431b58-B4L1-FQuO-A31C-Hl7G-CVLJ-BzQF', '9291c63c-5ab3-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('9291c63c-5ab3-11dc-be42-000e0c431b58-BBCP-F4s6-Afi1-HKnm-C8hy-Bxxj', '9291c63c-5ab3-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('9291c63c-5ab3-11dc-be42-000e0c431b58-BCqZ-FERV-ALnh-HUdy-Cae1-BqYj', '9291c63c-5ab3-11dc-be42-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.52', 'л'),
('9291c63c-5ab3-11dc-be42-000e0c431b58-Bl5H-FcEv-AECT-H41G-Cc3w-B38E', '9291c63c-5ab3-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('9291c63c-5ab3-11dc-be42-000e0c431b58-BPDe-FF6L-AvK3-Hqpl-C15p-BFvw', '9291c63c-5ab3-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсальное', ''),
('9291c63c-5ab3-11dc-be42-000e0c431b58-BPDP-F2Hy-AaDW-HiYm-CFxt-BFDt', '9291c63c-5ab3-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('9291c63c-5ab3-11dc-be42-000e0c431b58-BYH0-FQ0K-A0vz-H3rq-COq6-BftJ', '9291c63c-5ab3-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('9291c63e-5ab3-11dc-be42-000e0c431b58-B3F6-FoUM-AHEb-HC6Z-CPWm-BAut', '9291c63e-5ab3-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'красный', ''),
('9291c63e-5ab3-11dc-be42-000e0c431b58-BgHH-FG0e-ARir-H5qs-Cpiy-BlMI', '9291c63e-5ab3-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('9291c63e-5ab3-11dc-be42-000e0c431b58-Bng5-FUak-ADGI-H2rV-C0fp-BMvB', '9291c63e-5ab3-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсальное', ''),
('9291c63e-5ab3-11dc-be42-000e0c431b58-BP5s-FYwa-Atw7-HZ9r-CaRI-BEF1', '9291c63e-5ab3-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('9291c63e-5ab3-11dc-be42-000e0c431b58-BSUT-FPtS-A8Kk-HFOp-C6ix-BfRU', '9291c63e-5ab3-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('9291c63e-5ab3-11dc-be42-000e0c431b58-BTan-FxrP-ACtY-HY3o-CugL-Bo2l', '9291c63e-5ab3-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('9291c63e-5ab3-11dc-be42-000e0c431b58-BUIj-Fsgc-AXR9-Hi71-CKLu-B3kh', '9291c63e-5ab3-11dc-be42-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.52', 'л'),
('9291c63e-5ab3-11dc-be42-000e0c431b58-ByTM-FPWH-Aole-HRmO-CBJW-BJPV', '9291c63e-5ab3-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('9291c640-5ab3-11dc-be42-000e0c431b58-B60I-Fuyx-AYTq-Hzxr-CivS-BsNh', '9291c640-5ab3-11dc-be42-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.52', 'л'),
('9291c640-5ab3-11dc-be42-000e0c431b58-B8lJ-FcPz-AXxw-HgTb-C9Ac-BCNz', '9291c640-5ab3-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('9291c640-5ab3-11dc-be42-000e0c431b58-BGda-F5n1-A8T6-Hgdc-CGCC-BQZ5', '9291c640-5ab3-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('9291c640-5ab3-11dc-be42-000e0c431b58-BilV-FUIo-AwGp-HOJ3-CDF3-BM1q', '9291c640-5ab3-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('9291c640-5ab3-11dc-be42-000e0c431b58-BjkJ-FW3B-AyDa-HELn-CUWB-BMCj', '9291c640-5ab3-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'вишневый', ''),
('9291c640-5ab3-11dc-be42-000e0c431b58-BMw0-FITc-AkZf-Hnq6-Ci8J-Bgob', '9291c640-5ab3-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсальное', ''),
('9291c640-5ab3-11dc-be42-000e0c431b58-BqAE-FMX4-AwSy-Hypo-Ce3a-BeAt', '9291c640-5ab3-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('9291c640-5ab3-11dc-be42-000e0c431b58-BRN9-FrSJ-AVmg-HWyj-C66C-BWzp', '9291c640-5ab3-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('95aabdce-0d99-11dc-bdd4-000e0c431b58-B9Ew-F5zL-Azis-HjhQ-C0Ro-BnOZ', '95aabdce-0d99-11dc-bdd4-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('95aabdce-0d99-11dc-bdd4-000e0c431b58-BLjY-FWjJ-AQUR-H3xp-Cuwu-Bhqj', '95aabdce-0d99-11dc-bdd4-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсальный', ''),
('95aabdce-0d99-11dc-bdd4-000e0c431b58-BsgI-FaGq-ArG9-HWtM-Cv6v-BKSU', '95aabdce-0d99-11dc-bdd4-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('95aabdce-0d99-11dc-bdd4-000e0c431b58-BTio-Fkac-AQLP-HAs7-Ckad-Bs2j', '95aabdce-0d99-11dc-bdd4-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('95aabdce-0d99-11dc-bdd4-000e0c431b58-BtXn-F7vh-AU0L-HAu4-CuIl-BdY3', '95aabdce-0d99-11dc-bdd4-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('95aabdce-0d99-11dc-bdd4-000e0c431b58-ByDy-FDEg-A0o8-HcXz-CCxZ-BsKU', '95aabdce-0d99-11dc-bdd4-000e0c431b58', '1d08380b-ce34-11e4-a80e-005056be1f7a', '900', 'г'),
('95aabdce-0d99-11dc-bdd4-000e0c431b58-BZjq-FX6Z-AkrV-HV3n-CqML-BVxm', '95aabdce-0d99-11dc-bdd4-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'клей ПВА "Мастер"', ''),
('a1a9b4a6-f787-11e3-8c8a-005056be1f7b-B2lD-FD5p-Au1c-H8j3-CmFG-BIVm', 'a1a9b4a6-f787-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'оранжевый', ''),
('a1a9b4a6-f787-11e3-8c8a-005056be1f7b-B5JJ-FoDB-Auko-H7l7-C50T-B14s', 'a1a9b4a6-f787-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('a1a9b4a6-f787-11e3-8c8a-005056be1f7b-BdJE-F6Go-Aytt-H53F-CgmM-BBR8', 'a1a9b4a6-f787-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('a1a9b4a6-f787-11e3-8c8a-005056be1f7b-BHNV-FvK7-ArE7-HB6z-CuLW-BmNz', 'a1a9b4a6-f787-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '800', 'г'),
('a1a9b4a6-f787-11e3-8c8a-005056be1f7b-BQg2-FBdy-AMoN-Hg5i-C7yr-BFdv', 'a1a9b4a6-f787-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('a1a9b4a6-f787-11e3-8c8a-005056be1f7b-BuHe-FpuW-AF9g-HBes-CuVU-BxYO', 'a1a9b4a6-f787-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('a1a9b4a6-f787-11e3-8c8a-005056be1f7b-BYX6-F5Za-AmJv-H77K-CLZT-BQUa', 'a1a9b4a6-f787-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('a48048ba-ec8c-11e3-9eab-005056be1f7b-BbxN-FcRv-ARKV-HrJS-CRpd-Bb0N', 'a48048ba-ec8c-11e3-9eab-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('a48048ba-ec8c-11e3-9eab-005056be1f7b-BfLJ-FUuQ-AUq5-HbYZ-CG34-BFE3', 'a48048ba-ec8c-11e3-9eab-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('a48048ba-ec8c-11e3-9eab-005056be1f7b-BrT5-FmvS-AB2L-H58P-CxZC-BA2U', 'a48048ba-ec8c-11e3-9eab-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('a48048ba-ec8c-11e3-9eab-005056be1f7b-BT5P-FfzN-Aumm-Hxmd-CIXm-Bmec', 'a48048ba-ec8c-11e3-9eab-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'ксилол', ''),
('a48048ba-ec8c-11e3-9eab-005056be1f7b-BvIe-FG1o-AZIT-H3jS-CGQm-BB4X', 'a48048ba-ec8c-11e3-9eab-005056be1f7b', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.5', 'л'),
('ab383e71-f78f-11e3-8c8a-005056be1f7b-B8L6-FFFL-AqP8-HNAg-CUEZ-Bgnl', 'ab383e71-f78f-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('ab383e71-f78f-11e3-8c8a-005056be1f7b-BD4L-FiLq-AuuI-HvI8-C5gF-BQtw', 'ab383e71-f78f-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('ab383e71-f78f-11e3-8c8a-005056be1f7b-BMXV-FUJe-ASDA-HYUt-CLS5-BHX0', 'ab383e71-f78f-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('ab383e71-f78f-11e3-8c8a-005056be1f7b-Bn9i-FoX4-AXjL-HSqj-CS9n-BhO6', 'ab383e71-f78f-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('ab383e71-f78f-11e3-8c8a-005056be1f7b-BSEP-FPRQ-AwmU-HMI9-CxVV-BJpe', 'ab383e71-f78f-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('ab383e71-f78f-11e3-8c8a-005056be1f7b-BxBh-FIOq-AGCB-HcLr-C8zp-BfdD', 'ab383e71-f78f-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '20000', 'г'),
('ab383e71-f78f-11e3-8c8a-005056be1f7b-BXIW-FMrq-AcII-H4Pk-CKvg-BvjH', 'ab383e71-f78f-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'оранжевый', ''),
('ad93144b-f787-11e3-8c8a-005056be1f7b-B2Uk-FmiG-AZF2-HPyT-CShM-BrM2', 'ad93144b-f787-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('ad93144b-f787-11e3-8c8a-005056be1f7b-Bftv-FW9j-AqQH-H48U-CuE4-Bbmv', 'ad93144b-f787-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('ad93144b-f787-11e3-8c8a-005056be1f7b-BHiq-Fh3F-AAvt-H61w-CyrH-BYTp', 'ad93144b-f787-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('ad93144b-f787-11e3-8c8a-005056be1f7b-Bhmh-FQiX-ADXE-HKvY-C1RH-BlnF', 'ad93144b-f787-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '800', 'г'),
('ad93144b-f787-11e3-8c8a-005056be1f7b-BNDL-FsN0-AaV8-HvBq-CLA8-BjCk', 'ad93144b-f787-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'желтый', ''),
('ad93144b-f787-11e3-8c8a-005056be1f7b-BOcK-FZ8w-ARrv-HNgw-Chuz-BtcD', 'ad93144b-f787-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('ad93144b-f787-11e3-8c8a-005056be1f7b-Bs4Y-Fpoa-AVza-HTZc-C4n6-BED3', 'ad93144b-f787-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('ae39d1eb-cf86-11e3-a00d-005056be1f7b-B1uS-FDwb-Aqgw-Hh7D-C6eE-BBit', 'ae39d1eb-cf86-11e3-a00d-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'золото', ''),
('ae39d1eb-cf86-11e3-a00d-005056be1f7b-B92C-F0V2-Aij1-HIwg-C251-B5BZ', 'ae39d1eb-cf86-11e3-a00d-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'PARADE', ''),
('ae39d1eb-cf86-11e3-a00d-005056be1f7b-BbP8-F4wz-Axhp-HiWe-CpC3-BWjY', 'ae39d1eb-cf86-11e3-a00d-005056be1f7b', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для металла', ''),
('ae39d1eb-cf86-11e3-a00d-005056be1f7b-BHUD-FHjx-AmYY-H2gC-C4GX-BccP', 'ae39d1eb-cf86-11e3-a00d-005056be1f7b', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'гладкая', ''),
('ae39d1eb-cf86-11e3-a00d-005056be1f7b-BJ0A-FrJ4-AoUA-HOue-CzkP-BIoC', 'ae39d1eb-cf86-11e3-a00d-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('ae39d1eb-cf86-11e3-a00d-005056be1f7b-BjUj-FV2f-AZxA-Hdyj-CN9j-BNps', 'ae39d1eb-cf86-11e3-a00d-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('ae39d1eb-cf86-11e3-a00d-005056be1f7b-BqYq-Fggd-ACXX-H4RZ-CSAD-BGGi', 'ae39d1eb-cf86-11e3-a00d-005056be1f7b', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '2.5', 'л'),
('ae39d1eb-cf86-11e3-a00d-005056be1f7b-Bsoy-FGfV-AJYb-Hg24-Cvzv-ByzH', 'ae39d1eb-cf86-11e3-a00d-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('ae39d1eb-cf86-11e3-a00d-005056be1f7b-Bzlw-FMfE-AmxE-Hp5L-COWa-BMPM', 'ae39d1eb-cf86-11e3-a00d-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('b08b1d7e-ec8c-11e3-9eab-005056be1f7b-B49v-FkYw-A0qe-HmdR-CkS0-B6LQ', 'b08b1d7e-ec8c-11e3-9eab-005056be1f7b', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.5', 'л'),
('b08b1d7e-ec8c-11e3-9eab-005056be1f7b-Bh3t-Fg1U-AqGq-HaAZ-CRrn-Bxx8', 'b08b1d7e-ec8c-11e3-9eab-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('b08b1d7e-ec8c-11e3-9eab-005056be1f7b-BL3D-FQqR-AMgD-HAFV-Cp0T-Bbjs', 'b08b1d7e-ec8c-11e3-9eab-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'сольвент', ''),
('b08b1d7e-ec8c-11e3-9eab-005056be1f7b-BqNf-FFUB-A5XD-Hj5y-CfzF-Bb1C', 'b08b1d7e-ec8c-11e3-9eab-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('b08b1d7e-ec8c-11e3-9eab-005056be1f7b-ByrV-F3RP-ArwF-HxO7-C1vy-BjRp', 'b08b1d7e-ec8c-11e3-9eab-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('b182dc4f-f994-11e2-98ef-005056be3574-Bfd3-FhLg-ALF6-HB1b-COOJ-BYUq', 'b182dc4f-f994-11e2-98ef-005056be3574', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('b182dc4f-f994-11e2-98ef-005056be3574-BHsg-FO7r-Am0c-Hf6r-C5l2-BCQG', 'b182dc4f-f994-11e2-98ef-005056be3574', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для ржавчины', ''),
('b182dc4f-f994-11e2-98ef-005056be3574-Bje4-Feft-A6t9-HEHS-Cv8W-BcCX', 'b182dc4f-f994-11e2-98ef-005056be3574', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('b182dc4f-f994-11e2-98ef-005056be3574-BMGF-FbAV-AlJG-HOLY-CCu3-B7OY', 'b182dc4f-f994-11e2-98ef-005056be3574', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('b182dc4f-f994-11e2-98ef-005056be3574-BqKI-FoOP-A8AN-HTcQ-CroW-BwGW', 'b182dc4f-f994-11e2-98ef-005056be3574', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.75', 'л'),
('b182dc4f-f994-11e2-98ef-005056be3574-BSOG-Ffhi-AvPN-HHBT-CeJB-BAX9', 'b182dc4f-f994-11e2-98ef-005056be3574', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'молотковая эмаль-грунт', ''),
('b182dc4f-f994-11e2-98ef-005056be3574-BYrJ-FFhb-At0Q-H9D9-Cqfz-Bi5P', 'b182dc4f-f994-11e2-98ef-005056be3574', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'черный', ''),
('b182dc4f-f994-11e2-98ef-005056be3574-BzDq-FFBu-ADrP-H4PJ-CJum-BCSy', 'b182dc4f-f994-11e2-98ef-005056be3574', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('b182dc51-f994-11e2-98ef-005056be3574-B0E9-F6U5-AbX0-Hixo-Cc6d-Bp1T', 'b182dc51-f994-11e2-98ef-005056be3574', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для ржавчины', ''),
('b182dc51-f994-11e2-98ef-005056be3574-B7AN-FChW-ABkY-HOVm-CdE1-B3pd', 'b182dc51-f994-11e2-98ef-005056be3574', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('b182dc51-f994-11e2-98ef-005056be3574-BDMn-F07n-ABp5-HVO8-CMNC-BLJX', 'b182dc51-f994-11e2-98ef-005056be3574', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'молотковая эмаль-грунт', ''),
('b182dc51-f994-11e2-98ef-005056be3574-BIzM-F51X-AWU7-Ht0B-CtQU-BjD2', 'b182dc51-f994-11e2-98ef-005056be3574', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.75', 'л'),
('b182dc51-f994-11e2-98ef-005056be3574-BKkX-Fiys-AKSw-HALc-CeiX-BpF0', 'b182dc51-f994-11e2-98ef-005056be3574', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('b182dc51-f994-11e2-98ef-005056be3574-BRSz-FwhZ-AAH7-HQ6f-CCFG-BZo5', 'b182dc51-f994-11e2-98ef-005056be3574', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('b182dc51-f994-11e2-98ef-005056be3574-BsNZ-Flne-APrJ-Hrbq-CN4B-BttV', 'b182dc51-f994-11e2-98ef-005056be3574', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'зеленый', ''),
('b182dc51-f994-11e2-98ef-005056be3574-BX6L-Fgmm-AN1f-HOkO-CkgP-Bxjw', 'b182dc51-f994-11e2-98ef-005056be3574', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('b3740593-f78f-11e3-8c8a-005056be1f7b-B5mJ-FXS9-AlHW-H117-CfeA-BIQe', 'b3740593-f78f-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('b3740593-f78f-11e3-8c8a-005056be1f7b-B5nD-FqTm-ALcn-HLXx-Cfx0-B4vI', 'b3740593-f78f-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('b3740593-f78f-11e3-8c8a-005056be1f7b-BiA5-FLa5-Ae8H-Hac2-CkXe-BoDy', 'b3740593-f78f-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('b3740593-f78f-11e3-8c8a-005056be1f7b-BN4k-FqBT-AN9T-H0NO-CMI1-BVfI', 'b3740593-f78f-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '20000', 'г'),
('b3740593-f78f-11e3-8c8a-005056be1f7b-BnDm-FveF-AnFc-HItg-C8Av-BO5M', 'b3740593-f78f-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('b3740593-f78f-11e3-8c8a-005056be1f7b-BQPR-F5ap-Ar7c-HqzO-CyXO-Btjp', 'b3740593-f78f-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('b3740593-f78f-11e3-8c8a-005056be1f7b-BZLX-F8Ip-APwn-HZAS-ChN7-BetK', 'b3740593-f78f-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'желтый', ''),
('b54ba125-f78e-11e3-8c8a-005056be1f7b-BA2G-FjAu-Advh-H983-Croq-BSZ1', 'b54ba125-f78e-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('b54ba125-f78e-11e3-8c8a-005056be1f7b-BhY4-FzK1-AR94-HrSo-CU6Z-BoVn', 'b54ba125-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('b54ba125-f78e-11e3-8c8a-005056be1f7b-BIla-FjMe-Ac3F-HVTw-Ca2K-BTrV', 'b54ba125-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('b54ba125-f78e-11e3-8c8a-005056be1f7b-BK9U-FEpm-AsAi-HIo5-Cvwf-BMVs', 'b54ba125-f78e-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('b54ba125-f78e-11e3-8c8a-005056be1f7b-BL8a-F7pT-AYtY-HzHg-C7IY-BCrY', 'b54ba125-f78e-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '6000', 'г'),
('b54ba125-f78e-11e3-8c8a-005056be1f7b-BnvT-FZNd-APxb-HlD4-Cpk3-BarE', 'b54ba125-f78e-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'оранжевый', ''),
('b54ba125-f78e-11e3-8c8a-005056be1f7b-Bqyk-FvJ4-Ahju-Hs4b-CDEa-BXIG', 'b54ba125-f78e-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('b5957aa3-f787-11e3-8c8a-005056be1f7b-BlgS-FEt5-Azo2-HY5P-C6Hs-BKYT', 'b5957aa3-f787-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('b5957aa3-f787-11e3-8c8a-005056be1f7b-BMDC-F8GR-A7gJ-HcNF-Cqz1-BjT0', 'b5957aa3-f787-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('b5957aa3-f787-11e3-8c8a-005056be1f7b-BMdP-FRkN-A5b7-HH7y-CgD6-BSOV', 'b5957aa3-f787-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'вишневый', ''),
('b5957aa3-f787-11e3-8c8a-005056be1f7b-Bmu4-FdJx-AsE5-HbOT-Culn-Bf6E', 'b5957aa3-f787-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('b5957aa3-f787-11e3-8c8a-005056be1f7b-Bn1g-FxSt-A30j-Hsj4-Cs76-BwPZ', 'b5957aa3-f787-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '800', 'г'),
('b5957aa3-f787-11e3-8c8a-005056be1f7b-BXCD-FSdS-AlO5-HOuz-CT84-BV5A', 'b5957aa3-f787-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('b5957aa3-f787-11e3-8c8a-005056be1f7b-BXTu-FTbr-AH8u-HDP9-CZ2f-Br6O', 'b5957aa3-f787-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('ba1232df-ec8c-11e3-9eab-005056be1f7b-B6R7-FA7F-ABq9-H9kK-CPWt-B5t2', 'ba1232df-ec8c-11e3-9eab-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'растворитель', ''),
('ba1232df-ec8c-11e3-9eab-005056be1f7b-BdeY-FxUl-AbgO-HZ5w-CvqJ-BH7E', 'ba1232df-ec8c-11e3-9eab-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('ba1232df-ec8c-11e3-9eab-005056be1f7b-Be1d-FtQY-AfBF-HpIB-Ct48-B4LR', 'ba1232df-ec8c-11e3-9eab-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('ba1232df-ec8c-11e3-9eab-005056be1f7b-Bu6J-FSU2-AWWl-HkIH-Cemm-B4Z7', 'ba1232df-ec8c-11e3-9eab-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('ba1232df-ec8c-11e3-9eab-005056be1f7b-Bvio-FWIw-AenY-HGgy-CDBp-Bgv6', 'ba1232df-ec8c-11e3-9eab-005056be1f7b', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.5', 'л'),
('bc816f7f-f78f-11e3-8c8a-005056be1f7b-Bfyy-F3kS-A1fr-HEXb-Cg8O-BJOZ', 'bc816f7f-f78f-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('bc816f7f-f78f-11e3-8c8a-005056be1f7b-BHWx-FybK-AQ9I-HfHW-C6SC-BuzX', 'bc816f7f-f78f-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('bc816f7f-f78f-11e3-8c8a-005056be1f7b-BjWS-FvYZ-AnYD-HUNj-CmV6-BZKX', 'bc816f7f-f78f-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('bc816f7f-f78f-11e3-8c8a-005056be1f7b-BkaV-Fs6d-AE1v-HGll-CeK8-Bw7V', 'bc816f7f-f78f-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '20000', 'г'),
('bc816f7f-f78f-11e3-8c8a-005056be1f7b-BKpz-FgVz-Ah5L-HBH3-CAnq-BzgR', 'bc816f7f-f78f-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('bc816f7f-f78f-11e3-8c8a-005056be1f7b-Bkxm-FQLB-AbZV-HqAA-CiVe-BNq9', 'bc816f7f-f78f-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('bc816f7f-f78f-11e3-8c8a-005056be1f7b-BVdo-FUeS-AI1X-Hvd8-C6YO-B2ub', 'bc816f7f-f78f-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'вишневый', ''),
('beb861cb-f787-11e3-8c8a-005056be1f7b-B9U3-Fuj9-Aog9-HSrx-CBcS-BTkP', 'beb861cb-f787-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('beb861cb-f787-11e3-8c8a-005056be1f7b-BfNf-FQfl-Av35-Hn2a-CNJ6-BfMs', 'beb861cb-f787-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '800', 'г'),
('beb861cb-f787-11e3-8c8a-005056be1f7b-BKfw-Fndw-Ax1v-HSFe-CXT3-B9fj', 'beb861cb-f787-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('beb861cb-f787-11e3-8c8a-005056be1f7b-BNYl-FMrS-A0sv-HSCW-Ch14-BSfn', 'beb861cb-f787-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('beb861cb-f787-11e3-8c8a-005056be1f7b-BRfS-FDxV-AZUL-HSmr-C7wM-Bsap', 'beb861cb-f787-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('beb861cb-f787-11e3-8c8a-005056be1f7b-BvfS-FH7d-A8f2-HMHU-CYl9-B2qY', 'beb861cb-f787-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'красный', ''),
('beb861cb-f787-11e3-8c8a-005056be1f7b-Bxhu-Fpu3-A0Id-H90J-CW9e-BPtE', 'beb861cb-f787-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('bef8d7ea-f78e-11e3-8c8a-005056be1f7b-Bbz5-F8Un-A3Ci-HVJo-CysF-BVvc', 'bef8d7ea-f78e-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('bef8d7ea-f78e-11e3-8c8a-005056be1f7b-BcgD-FaJw-AXp9-HKFH-CRJI-Bbve', 'bef8d7ea-f78e-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '6000', 'г'),
('bef8d7ea-f78e-11e3-8c8a-005056be1f7b-BDBJ-FmWT-ARKC-HWfx-CzUN-BWyz', 'bef8d7ea-f78e-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('bef8d7ea-f78e-11e3-8c8a-005056be1f7b-Biag-FCXd-AoEp-HLiN-Cl36-Bg03', 'bef8d7ea-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('bef8d7ea-f78e-11e3-8c8a-005056be1f7b-BLhY-FKAc-AUDd-H77m-CqMg-Beha', 'bef8d7ea-f78e-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'желтый', ''),
('bef8d7ea-f78e-11e3-8c8a-005056be1f7b-BUr5-FG86-AzBf-Hft6-Cs6c-BGFd', 'bef8d7ea-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('bef8d7ea-f78e-11e3-8c8a-005056be1f7b-Byah-FelF-ArN9-Hnt8-CfLw-BaIH', 'bef8d7ea-f78e-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('c2d90e40-f78f-11e3-8c8a-005056be1f7b-B9zz-FWI0-ASNz-HjUP-Cbbb-BGcQ', 'c2d90e40-f78f-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('c2d90e40-f78f-11e3-8c8a-005056be1f7b-Bg6l-FxkS-ATDf-HSeL-CicB-BYzJ', 'c2d90e40-f78f-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '20000', 'г'),
('c2d90e40-f78f-11e3-8c8a-005056be1f7b-Bgc8-FcRh-AJjY-HSJ7-CE1Q-BHZ3', 'c2d90e40-f78f-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('c2d90e40-f78f-11e3-8c8a-005056be1f7b-BHMp-FAyZ-AdUR-Horg-CdN9-BapQ', 'c2d90e40-f78f-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('c2d90e40-f78f-11e3-8c8a-005056be1f7b-BIt1-FXmJ-ANJ7-Hykr-CS2I-Bjhw', 'c2d90e40-f78f-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('c2d90e40-f78f-11e3-8c8a-005056be1f7b-BqUC-FjmA-Aww4-Hmtc-Cf2L-BWOy', 'c2d90e40-f78f-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('c2d90e40-f78f-11e3-8c8a-005056be1f7b-BRbR-FqnG-AwP4-HS9M-CK3z-B7j4', 'c2d90e40-f78f-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'красный', ''),
('c4df9e0d-00c0-11e2-a554-005056be3bd8-BFlu-FFJh-Atmd-HMRT-CgUg-BJUc', 'c4df9e0d-00c0-11e2-a554-005056be3bd8', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'коричневый', ''),
('c4df9e0d-00c0-11e2-a554-005056be3bd8-BmBA-FMsF-A6wR-HQki-Cv8i-B3xw', 'c4df9e0d-00c0-11e2-a554-005056be3bd8', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('c4df9e0d-00c0-11e2-a554-005056be3bd8-Bou7-F6Bh-Adxf-HCpS-Cy6P-BU63', 'c4df9e0d-00c0-11e2-a554-005056be3bd8', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.75', 'л'),
('c4df9e0d-00c0-11e2-a554-005056be3bd8-BQ8f-F0mY-ADuE-HcAb-Cimc-BiyK', 'c4df9e0d-00c0-11e2-a554-005056be3bd8', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('c4df9e0d-00c0-11e2-a554-005056be3bd8-Bt9n-Fxao-AP0R-HsiG-C4M1-B1I3', 'c4df9e0d-00c0-11e2-a554-005056be3bd8', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для ржавчины', ''),
('c4df9e0d-00c0-11e2-a554-005056be3bd8-BWAG-F1NY-AJtt-Hp4D-CIpZ-BPWG', 'c4df9e0d-00c0-11e2-a554-005056be3bd8', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('c4df9e0d-00c0-11e2-a554-005056be3bd8-BwVH-FqrW-Ao4k-HqFt-CELV-ByQe', 'c4df9e0d-00c0-11e2-a554-005056be3bd8', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('c4df9e0d-00c0-11e2-a554-005056be3bd8-BXlp-F3nU-ALcQ-HbwL-CTfJ-B8Tk', 'c4df9e0d-00c0-11e2-a554-005056be3bd8', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'молотковая эмаль-грунт', ''),
('c4df9e0f-00c0-11e2-a554-005056be3bd8-B9J9-F3qP-ADBz-HsYJ-CK9A-BWiq', 'c4df9e0f-00c0-11e2-a554-005056be3bd8', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для ржавчины', ''),
('c4df9e0f-00c0-11e2-a554-005056be3bd8-BAOA-FKsk-Am54-HgRL-CUjo-BWUc', 'c4df9e0f-00c0-11e2-a554-005056be3bd8', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('c4df9e0f-00c0-11e2-a554-005056be3bd8-Bj1L-FjqZ-APIR-HjWF-CXWU-BXhD', 'c4df9e0f-00c0-11e2-a554-005056be3bd8', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.75', 'л'),
('c4df9e0f-00c0-11e2-a554-005056be3bd8-Blij-F3RH-A9KU-HzAc-CsYE-BXRr', 'c4df9e0f-00c0-11e2-a554-005056be3bd8', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'медный', ''),
('c4df9e0f-00c0-11e2-a554-005056be3bd8-Bmov-F8ew-AZMK-Hekb-CMS5-BWSy', 'c4df9e0f-00c0-11e2-a554-005056be3bd8', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('c4df9e0f-00c0-11e2-a554-005056be3bd8-BscK-F047-AKNb-HULv-C6wU-Bfpl', 'c4df9e0f-00c0-11e2-a554-005056be3bd8', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('c4df9e0f-00c0-11e2-a554-005056be3bd8-BSdB-FuxN-Aft0-H1Op-Cb2T-BNyy', 'c4df9e0f-00c0-11e2-a554-005056be3bd8', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('c4df9e0f-00c0-11e2-a554-005056be3bd8-Bwxz-FDXM-AJui-HdIG-ChGP-Bf07', 'c4df9e0f-00c0-11e2-a554-005056be3bd8', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'молотковая эмаль-грунт', ''),
('c4df9e11-00c0-11e2-a554-005056be3bd8-B4SN-Fhvv-Aaq1-HB3O-CuSS-BjCv', 'c4df9e11-00c0-11e2-a554-005056be3bd8', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('c4df9e11-00c0-11e2-a554-005056be3bd8-BaEy-Fudg-Adiv-HKxP-C6He-BKv4', 'c4df9e11-00c0-11e2-a554-005056be3bd8', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('c4df9e11-00c0-11e2-a554-005056be3bd8-Bcnv-FSon-AhZ7-Hz99-ClDf-B65L', 'c4df9e11-00c0-11e2-a554-005056be3bd8', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('c4df9e11-00c0-11e2-a554-005056be3bd8-BDAx-FTkj-AUEO-Hnvb-CsNE-Begt', 'c4df9e11-00c0-11e2-a554-005056be3bd8', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.75', 'л'),
('c4df9e11-00c0-11e2-a554-005056be3bd8-BFgU-F1qH-AGlP-HkvA-CdpT-BqMF', 'c4df9e11-00c0-11e2-a554-005056be3bd8', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('c4df9e11-00c0-11e2-a554-005056be3bd8-BFHv-FUvg-Aweu-H29Q-CkGU-BtKN', 'c4df9e11-00c0-11e2-a554-005056be3bd8', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'молотковая эмаль-грунт', ''),
('c4df9e11-00c0-11e2-a554-005056be3bd8-BHDI-FD4H-ACeL-HiaF-CteG-Bgxr', 'c4df9e11-00c0-11e2-a554-005056be3bd8', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для ржавчины', ''),
('c4df9e11-00c0-11e2-a554-005056be3bd8-BUOO-FnZt-AhTn-Hdi4-C5El-BMYs', 'c4df9e11-00c0-11e2-a554-005056be3bd8', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'серебристый', ''),
('c4df9e13-00c0-11e2-a554-005056be3bd8-BcRx-FBv7-AHSD-HXxC-CUiE-BRIz', 'c4df9e13-00c0-11e2-a554-005056be3bd8', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('c4df9e13-00c0-11e2-a554-005056be3bd8-BfrR-FUHN-ApGU-HZrt-CEOq-BPev', 'c4df9e13-00c0-11e2-a554-005056be3bd8', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'молотковая эмаль-грунт', ''),
('c4df9e13-00c0-11e2-a554-005056be3bd8-Bh8K-FPEE-AudS-HKe5-C446-BPQb', 'c4df9e13-00c0-11e2-a554-005056be3bd8', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для ржавчины', ''),
('c4df9e13-00c0-11e2-a554-005056be3bd8-BKYm-FS66-Aifr-HG4f-CZOa-BAls', 'c4df9e13-00c0-11e2-a554-005056be3bd8', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('c4df9e13-00c0-11e2-a554-005056be3bd8-Bo3v-F9mD-A2CI-HhTQ-Ckwh-BYxS', 'c4df9e13-00c0-11e2-a554-005056be3bd8', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('c4df9e13-00c0-11e2-a554-005056be3bd8-BU6l-FXSY-AZm8-He5F-CUi8-BGhj', 'c4df9e13-00c0-11e2-a554-005056be3bd8', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('c4df9e13-00c0-11e2-a554-005056be3bd8-BuC8-FkvW-At6U-HtS3-CaEq-BQID', 'c4df9e13-00c0-11e2-a554-005056be3bd8', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'серый', ''),
('c4df9e13-00c0-11e2-a554-005056be3bd8-BZBV-FWfQ-Ab1y-HZ7V-C9Gt-BlYp', 'c4df9e13-00c0-11e2-a554-005056be3bd8', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.75', 'л'),
('c6d784e3-f78e-11e3-8c8a-005056be1f7b-BbTD-FcOd-ABqD-HGuU-Cp93-BY2J', 'c6d784e3-f78e-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('c6d784e3-f78e-11e3-8c8a-005056be1f7b-Bdhv-Fgnf-A1Te-HtrV-C3YH-Bhj1', 'c6d784e3-f78e-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('c6d784e3-f78e-11e3-8c8a-005056be1f7b-BJem-FrfK-AQIn-HtjB-COME-Bjgq', 'c6d784e3-f78e-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'вишневый', ''),
('c6d784e3-f78e-11e3-8c8a-005056be1f7b-BOhs-F3RS-A4ff-H9FB-Cob2-BNV2', 'c6d784e3-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('c6d784e3-f78e-11e3-8c8a-005056be1f7b-Bqvo-FLtt-ANYL-HEmh-C7D2-B0fF', 'c6d784e3-f78e-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('c6d784e3-f78e-11e3-8c8a-005056be1f7b-BQxP-Fc22-AAy6-H2xa-C7R9-Bsym', 'c6d784e3-f78e-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '6000', 'г'),
('c6d784e3-f78e-11e3-8c8a-005056be1f7b-BWzi-F4AO-A9LA-H5aj-CbjE-BEQj', 'c6d784e3-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('c9d25e2b-f787-11e3-8c8a-005056be1f7b-B8SM-FE0g-Az24-HWBk-CL2l-BEtk', 'c9d25e2b-f787-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'бирюзовый', ''),
('c9d25e2b-f787-11e3-8c8a-005056be1f7b-Bc79-FlKZ-At6k-HBeU-Cxcn-B0hm', 'c9d25e2b-f787-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('c9d25e2b-f787-11e3-8c8a-005056be1f7b-BgWe-Fasf-AA4X-Hm9G-CMbD-BKDN', 'c9d25e2b-f787-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('c9d25e2b-f787-11e3-8c8a-005056be1f7b-BHHv-FLaT-AS7c-HMmv-C67j-BQXg', 'c9d25e2b-f787-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '800', 'г'),
('c9d25e2b-f787-11e3-8c8a-005056be1f7b-BkxJ-FKyo-AflH-HIlo-CvIB-BPit', 'c9d25e2b-f787-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('c9d25e2b-f787-11e3-8c8a-005056be1f7b-BUyU-Fb87-AFsE-HH9n-C1tM-Be2Y', 'c9d25e2b-f787-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('c9d25e2b-f787-11e3-8c8a-005056be1f7b-Bvjn-FILm-APXD-HSiH-CgI5-BpSs', 'c9d25e2b-f787-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('ca79b0fb-f78f-11e3-8c8a-005056be1f7b-B5rs-FjJk-AA7D-HqAL-CRHQ-BASB', 'ca79b0fb-f78f-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('ca79b0fb-f78f-11e3-8c8a-005056be1f7b-B6DX-FUnt-Ayw0-HAny-CVEn-BnkJ', 'ca79b0fb-f78f-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('ca79b0fb-f78f-11e3-8c8a-005056be1f7b-B6Q7-FVNt-ADLp-HXYL-CNUO-Blo3', 'ca79b0fb-f78f-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '20000', 'г'),
('ca79b0fb-f78f-11e3-8c8a-005056be1f7b-BbzR-FffS-AqwZ-H7xs-C86U-BNf1', 'ca79b0fb-f78f-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('ca79b0fb-f78f-11e3-8c8a-005056be1f7b-BGFt-FLuI-ATOb-H4c8-CBqD-ByFi', 'ca79b0fb-f78f-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('ca79b0fb-f78f-11e3-8c8a-005056be1f7b-BImP-Fjgs-AhhZ-HkVe-CIPL-B1zV', 'ca79b0fb-f78f-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('ca79b0fb-f78f-11e3-8c8a-005056be1f7b-BOFw-FYeG-AlKo-Hc3a-Cwdq-BEHk', 'ca79b0fb-f78f-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'бирюзовый', ''),
('ce1ffcf9-f78e-11e3-8c8a-005056be1f7b-BF8f-FsNT-A0qw-HcKz-Cj8W-BQcD', 'ce1ffcf9-f78e-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('ce1ffcf9-f78e-11e3-8c8a-005056be1f7b-Bg0v-FGLH-ArzS-Hv7b-CyCZ-BTvn', 'ce1ffcf9-f78e-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '6000', 'г'),
('ce1ffcf9-f78e-11e3-8c8a-005056be1f7b-BJo3-FAtT-Agy6-HdS5-C5Zp-BAS2', 'ce1ffcf9-f78e-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'красный', ''),
('ce1ffcf9-f78e-11e3-8c8a-005056be1f7b-BoKB-FjoT-Aejs-HJjB-CATp-BoCb', 'ce1ffcf9-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('ce1ffcf9-f78e-11e3-8c8a-005056be1f7b-Bton-FswK-AaBK-Hgey-Cdoc-BVoM', 'ce1ffcf9-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('ce1ffcf9-f78e-11e3-8c8a-005056be1f7b-Bwhq-FfqQ-Agrj-HMWl-CnKD-BHJC', 'ce1ffcf9-f78e-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('ce1ffcf9-f78e-11e3-8c8a-005056be1f7b-Bycd-F009-Axcm-HQyR-Cccc-BdCH', 'ce1ffcf9-f78e-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('cf6aa526-48b8-11dd-9342-000e0c431b58-B2AN-FVwH-AR8v-He7m-ChWO-BTo4', 'cf6aa526-48b8-11dd-9342-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('cf6aa526-48b8-11dd-9342-000e0c431b58-Bamw-FRpN-AKCQ-HKGX-Cmc9-BZOK', 'cf6aa526-48b8-11dd-9342-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсальное', ''),
('cf6aa526-48b8-11dd-9342-000e0c431b58-Bhy7-Fx0D-AKmf-HJBt-CU4u-BiPg', 'cf6aa526-48b8-11dd-9342-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('cf6aa526-48b8-11dd-9342-000e0c431b58-BkIq-FEbS-AeUa-Hkp0-C2BA-B1bZ', 'cf6aa526-48b8-11dd-9342-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'бронза', ''),
('cf6aa526-48b8-11dd-9342-000e0c431b58-BLX3-Fqh5-Aa2x-HKZC-CqFj-BJgk', 'cf6aa526-48b8-11dd-9342-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('cf6aa526-48b8-11dd-9342-000e0c431b58-Bpgd-FbBa-ADix-HR3b-CLZQ-BINP', 'cf6aa526-48b8-11dd-9342-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.52', 'л'),
('cf6aa526-48b8-11dd-9342-000e0c431b58-BuRy-FLza-Avs2-HDb3-CXCA-BDHc', 'cf6aa526-48b8-11dd-9342-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('cf6aa526-48b8-11dd-9342-000e0c431b58-BVlw-FwMc-AvDe-Hv46-CLoN-B01D', 'cf6aa526-48b8-11dd-9342-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('d0659fe4-f787-11e3-8c8a-005056be1f7b-B59w-FChX-AXSK-H9mO-C0S8-BQkb', 'd0659fe4-f787-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('d0659fe4-f787-11e3-8c8a-005056be1f7b-Bh9w-F6eL-A6wH-HjlU-Cvxk-BUDB', 'd0659fe4-f787-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('d0659fe4-f787-11e3-8c8a-005056be1f7b-BLUV-FSNT-Am9Y-HgZA-CR7n-ByMM', 'd0659fe4-f787-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'зеленый', ''),
('d0659fe4-f787-11e3-8c8a-005056be1f7b-BMPj-FQaV-AoQm-Hw2Q-C2Ck-BNVy', 'd0659fe4-f787-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('d0659fe4-f787-11e3-8c8a-005056be1f7b-BpsR-FReJ-AiWL-HIkh-C7Hf-BtCA', 'd0659fe4-f787-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('d0659fe4-f787-11e3-8c8a-005056be1f7b-BySX-F0Q0-AOPS-HLg3-Cn7A-BbiR', 'd0659fe4-f787-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '800', 'г'),
('d0659fe4-f787-11e3-8c8a-005056be1f7b-BZIy-FlRY-AJOg-Ho8i-Co3h-Bb5E', 'd0659fe4-f787-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('d1aa2ade-a3ef-11e1-ad4e-005056be3bd8-BkDa-FeXx-AHuf-HOyN-CnKW-BcMl', 'd1aa2ade-a3ef-11e1-ad4e-005056be3bd8', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '1', 'л'),
('d1aa2ade-a3ef-11e1-ad4e-005056be3bd8-BR4l-FkwK-A44b-Hf5U-C4OO-BJtD', 'd1aa2ade-a3ef-11e1-ad4e-005056be3bd8', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('d1aa2ade-a3ef-11e1-ad4e-005056be3bd8-BTxv-FuTp-AEN4-HTWm-CXsH-BDrY', 'd1aa2ade-a3ef-11e1-ad4e-005056be3bd8', 'e8287600-ad96-11e3-b114-005056be1f7c', 'COSMOFEN', ''),
('d1aa2ade-a3ef-11e1-ad4e-005056be3bd8-BUaX-FfsS-Am3g-Hgyf-CuZi-BL46', 'd1aa2ade-a3ef-11e1-ad4e-005056be3bd8', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'очиститель', ''),
('d1aa2ade-a3ef-11e1-ad4e-005056be3bd8-BVJy-FCO2-ANwL-HS5G-CKO5-B69N', 'd1aa2ade-a3ef-11e1-ad4e-005056be3bd8', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('d1aa2ade-a3ef-11e1-ad4e-005056be3bd8-BWeq-F9RS-Acaq-HECL-ChUF-BI52', 'd1aa2ade-a3ef-11e1-ad4e-005056be3bd8', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('d1eaa4c2-f78f-11e3-8c8a-005056be1f7b-B355-FfCU-Ao7v-Himh-CKR4-BtEo', 'd1eaa4c2-f78f-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('d1eaa4c2-f78f-11e3-8c8a-005056be1f7b-B56L-Ffjx-AWrm-HHZJ-C5b4-Bpwm', 'd1eaa4c2-f78f-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('d1eaa4c2-f78f-11e3-8c8a-005056be1f7b-BBtv-FVt0-Aj6H-HZQn-Cilu-BySs', 'd1eaa4c2-f78f-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('d1eaa4c2-f78f-11e3-8c8a-005056be1f7b-Bie9-F9qF-ArjI-HVpq-Cjhl-BeDn', 'd1eaa4c2-f78f-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('d1eaa4c2-f78f-11e3-8c8a-005056be1f7b-BpVi-Fwvz-AaTa-HLHs-C4Co-BFiN', 'd1eaa4c2-f78f-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('d1eaa4c2-f78f-11e3-8c8a-005056be1f7b-BUHQ-Fr8G-Andk-Hnl2-CIzu-Bsgw', 'd1eaa4c2-f78f-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'зеленый', ''),
('d1eaa4c2-f78f-11e3-8c8a-005056be1f7b-Bysk-FjQM-AHbd-HAKi-CptC-Bnrs', 'd1eaa4c2-f78f-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '20000', 'г'),
('d3f8665d-cce1-11e2-b7e6-005056be3574-B4pY-FnAW-AtyY-HA93-CkeL-BeS6', 'd3f8665d-cce1-11e2-b7e6-005056be3574', 'd17cb785-d20b-11e4-9be0-005056be1f7c', 'защита от насекомых древоточцев', ''),
('d3f8665d-cce1-11e2-b7e6-005056be3574-B6NX-Fp7Q-AlSO-HVKY-Cpmj-Betu', 'd3f8665d-cce1-11e2-b7e6-005056be3574', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЭКОДОМ', ''),
('d3f8665d-cce1-11e2-b7e6-005056be3574-BaGT-FM9I-Az4Y-HIAX-CA6k-BYlh', 'd3f8665d-cce1-11e2-b7e6-005056be3574', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('d3f8665d-cce1-11e2-b7e6-005056be3574-BbLy-FGK7-AWjv-H3yn-C6QT-BG93', 'd3f8665d-cce1-11e2-b7e6-005056be3574', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('d3f8665d-cce1-11e2-b7e6-005056be3574-BcqL-Frjy-APfu-Hs36-CV8u-B3JT', 'd3f8665d-cce1-11e2-b7e6-005056be3574', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('d3f8665d-cce1-11e2-b7e6-005056be3574-BDKW-FcTW-AzUR-Hat4-C8YF-BySn', 'd3f8665d-cce1-11e2-b7e6-005056be3574', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'антисептический состав', ''),
('d3f8665d-cce1-11e2-b7e6-005056be3574-BgT5-Fytn-ArrC-HwfU-CaU5-BSyV', 'd3f8665d-cce1-11e2-b7e6-005056be3574', 'd17cb785-d20b-11e4-9be0-005056be1f7c', 'защита от биопоражений', ''),
('d3f8665d-cce1-11e2-b7e6-005056be3574-BpM1-F4iB-AROo-H2sX-ClJd-B6Vc', 'd3f8665d-cce1-11e2-b7e6-005056be3574', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для дерева', ''),
('d3f8665d-cce1-11e2-b7e6-005056be3574-Bzj2-Fdbk-A2Cu-HV9F-CxBQ-BJek', 'd3f8665d-cce1-11e2-b7e6-005056be3574', '1d08380b-ce34-11e4-a80e-005056be1f7a', '5000', 'г'),
('d3f8665f-cce1-11e2-b7e6-005056be3574-B1e0-FMqq-A1jm-Hq6W-CYHl-B5cf', 'd3f8665f-cce1-11e2-b7e6-005056be3574', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЭКОДОМ', ''),
('d3f8665f-cce1-11e2-b7e6-005056be3574-BCIq-FfbF-AoaU-HRXw-ClBE-BeSD', 'd3f8665f-cce1-11e2-b7e6-005056be3574', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'антисептический состав', ''),
('d3f8665f-cce1-11e2-b7e6-005056be3574-BFzg-FMij-ABep-H0HQ-CYzf-BO2C', 'd3f8665f-cce1-11e2-b7e6-005056be3574', 'd17cb785-d20b-11e4-9be0-005056be1f7c', 'защита от насекомых древоточцев', ''),
('d3f8665f-cce1-11e2-b7e6-005056be3574-BHpa-FTH3-Aadd-HSZI-C9Pn-B8bT', 'd3f8665f-cce1-11e2-b7e6-005056be3574', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('d3f8665f-cce1-11e2-b7e6-005056be3574-BJwi-FEx5-AyTW-HLro-C47z-BWur', 'd3f8665f-cce1-11e2-b7e6-005056be3574', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('d3f8665f-cce1-11e2-b7e6-005056be3574-BMOf-FV5N-AM6M-HbbG-CWl3-B6pp', 'd3f8665f-cce1-11e2-b7e6-005056be3574', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('d3f8665f-cce1-11e2-b7e6-005056be3574-BoS3-FQ0y-AnX7-HORZ-CtYE-BKsM', 'd3f8665f-cce1-11e2-b7e6-005056be3574', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для дерева', ''),
('d3f8665f-cce1-11e2-b7e6-005056be3574-BrPz-FChN-AyIP-H3nh-C76d-BXKn', 'd3f8665f-cce1-11e2-b7e6-005056be3574', 'd17cb785-d20b-11e4-9be0-005056be1f7c', 'защита от биопоражений', ''),
('d3f8665f-cce1-11e2-b7e6-005056be3574-BS6a-FPJs-Ao4G-HtDz-C7F9-BmlZ', 'd3f8665f-cce1-11e2-b7e6-005056be3574', '1d08380b-ce34-11e4-a80e-005056be1f7a', '10000', 'г'),
('d3f86661-cce1-11e2-b7e6-005056be3574-B1Ro-FsH4-Ajfa-HrVl-C7Ge-Bm4s', 'd3f86661-cce1-11e2-b7e6-005056be3574', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('d3f86661-cce1-11e2-b7e6-005056be3574-B8f6-FZJZ-AoLm-HRG0-C9SH-Brzf', 'd3f86661-cce1-11e2-b7e6-005056be3574', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'антисептический состав', ''),
('d3f86661-cce1-11e2-b7e6-005056be3574-BEm2-F2U1-A3wj-HqWq-C8TL-B3sU', 'd3f86661-cce1-11e2-b7e6-005056be3574', '1d08380b-ce34-11e4-a80e-005056be1f7a', '5000', 'г'),
('d3f86661-cce1-11e2-b7e6-005056be3574-BLIs-FhYX-AwWw-Hs9A-Cbsx-BjHQ', 'd3f86661-cce1-11e2-b7e6-005056be3574', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для дерева', ''),
('d3f86661-cce1-11e2-b7e6-005056be3574-BOLd-Fx2z-AeyI-Hpr2-CA0P-Bg45', 'd3f86661-cce1-11e2-b7e6-005056be3574', 'd17cb785-d20b-11e4-9be0-005056be1f7c', 'защита от насекомых древоточцев', ''),
('d3f86661-cce1-11e2-b7e6-005056be3574-BSXf-F5pm-A4o5-HAWu-CgbW-BYSr', 'd3f86661-cce1-11e2-b7e6-005056be3574', 'd17cb785-d20b-11e4-9be0-005056be1f7c', 'защита от биопоражений', ''),
('d3f86661-cce1-11e2-b7e6-005056be3574-BtwI-FZdX-AXoc-HodP-CBMm-B6Wr', 'd3f86661-cce1-11e2-b7e6-005056be3574', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('d3f86661-cce1-11e2-b7e6-005056be3574-BtX4-FKEP-AvBW-HPoP-C9Z6-BmOt', 'd3f86661-cce1-11e2-b7e6-005056be3574', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЭКОДОМ', ''),
('d3f86661-cce1-11e2-b7e6-005056be3574-Bvqo-FyxG-AiZp-HqO9-CLFQ-BzxX', 'd3f86661-cce1-11e2-b7e6-005056be3574', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('d3f86663-cce1-11e2-b7e6-005056be3574-BbSw-FvLk-Assn-H9xO-Cw11-BG0j', 'd3f86663-cce1-11e2-b7e6-005056be3574', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'антисептический состав', ''),
('d3f86663-cce1-11e2-b7e6-005056be3574-BClU-FJtL-AQ2V-H2dF-CTHl-BC9Y', 'd3f86663-cce1-11e2-b7e6-005056be3574', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для дерева', ''),
('d3f86663-cce1-11e2-b7e6-005056be3574-BGYN-FuWB-A0J2-HzP2-CYhH-B1KP', 'd3f86663-cce1-11e2-b7e6-005056be3574', 'd17cb785-d20b-11e4-9be0-005056be1f7c', 'защита от биопоражений', ''),
('d3f86663-cce1-11e2-b7e6-005056be3574-BNEx-FuFy-An6U-HQXa-C8JI-BVA0', 'd3f86663-cce1-11e2-b7e6-005056be3574', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('d3f86663-cce1-11e2-b7e6-005056be3574-Bogt-F1wZ-AUYT-H3y8-CgCP-BFly', 'd3f86663-cce1-11e2-b7e6-005056be3574', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('d3f86663-cce1-11e2-b7e6-005056be3574-BORj-Fii7-A0fG-HI2H-CIKk-Bltb', 'd3f86663-cce1-11e2-b7e6-005056be3574', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЭКОДОМ', ''),
('d3f86663-cce1-11e2-b7e6-005056be3574-BRQb-FnH5-AsaC-HUcA-Cs5T-Bfpf', 'd3f86663-cce1-11e2-b7e6-005056be3574', '1d08380b-ce34-11e4-a80e-005056be1f7a', '10000', 'г'),
('d3f86663-cce1-11e2-b7e6-005056be3574-BTdd-Fj2C-AwRM-HPpd-Cl4i-BZon', 'd3f86663-cce1-11e2-b7e6-005056be3574', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('d3f86663-cce1-11e2-b7e6-005056be3574-Bu4p-FwNI-Ax7D-HGct-CmiI-BzSe', 'd3f86663-cce1-11e2-b7e6-005056be3574', 'd17cb785-d20b-11e4-9be0-005056be1f7c', 'защита от насекомых древоточцев', ''),
('d3f86665-cce1-11e2-b7e6-005056be3574-B3tF-FB6g-A5L5-Hobe-CrwI-BPGW', 'd3f86665-cce1-11e2-b7e6-005056be3574', 'd17cb785-d20b-11e4-9be0-005056be1f7c', 'защита от огня', ''),
('d3f86665-cce1-11e2-b7e6-005056be3574-B8z0-FMTF-ACe9-Hkh6-CRND-Bl30', 'd3f86665-cce1-11e2-b7e6-005056be3574', '1d08380b-ce34-11e4-a80e-005056be1f7a', '5000', 'г'),
('d3f86665-cce1-11e2-b7e6-005056be3574-BjiR-FnBd-AvHf-HmLr-C2jH-BVt4', 'd3f86665-cce1-11e2-b7e6-005056be3574', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('d3f86665-cce1-11e2-b7e6-005056be3574-BoHs-FUTl-AIIR-HawG-CeVo-Bv0p', 'd3f86665-cce1-11e2-b7e6-005056be3574', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('d3f86665-cce1-11e2-b7e6-005056be3574-BOvw-FuY9-AcPh-HjlR-CdPZ-BLks', 'd3f86665-cce1-11e2-b7e6-005056be3574', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЭКОДОМ', ''),
('d3f86665-cce1-11e2-b7e6-005056be3574-BP2Y-FxaA-AE5P-HdFz-CL3h-BC8q', 'd3f86665-cce1-11e2-b7e6-005056be3574', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для дерева', ''),
('d3f86665-cce1-11e2-b7e6-005056be3574-BpHU-Fp7t-AobY-HYsx-Ci9o-B8vF', 'd3f86665-cce1-11e2-b7e6-005056be3574', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'антисептический состав', ''),
('d3f86665-cce1-11e2-b7e6-005056be3574-BVgb-Ft6K-AhdI-HLa4-CQXt-BPkD', 'd3f86665-cce1-11e2-b7e6-005056be3574', 'd17cb785-d20b-11e4-9be0-005056be1f7c', 'защита от биопоражений', ''),
('d3f86665-cce1-11e2-b7e6-005056be3574-BVni-FTOF-AOfS-HRHK-CRdr-BsMm', 'd3f86665-cce1-11e2-b7e6-005056be3574', 'd17cb785-d20b-11e4-9be0-005056be1f7c', 'защита от насекомых древоточцев', ''),
('d3f86665-cce1-11e2-b7e6-005056be3574-Bws1-FEJn-AKn0-HzZ0-Ceou-BRYJ', 'd3f86665-cce1-11e2-b7e6-005056be3574', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('d3f86667-cce1-11e2-b7e6-005056be3574-B5AE-FO1w-AYCH-HZJ9-CnC7-BtnB', 'd3f86667-cce1-11e2-b7e6-005056be3574', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('d3f86667-cce1-11e2-b7e6-005056be3574-B8NU-FBzC-AuJ8-HraK-CZmZ-Barp', 'd3f86667-cce1-11e2-b7e6-005056be3574', 'd17cb785-d20b-11e4-9be0-005056be1f7c', 'защита от биопоражений', ''),
('d3f86667-cce1-11e2-b7e6-005056be3574-B8QF-FoJg-AQrQ-HXo0-Cmj0-Bry1', 'd3f86667-cce1-11e2-b7e6-005056be3574', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('d3f86667-cce1-11e2-b7e6-005056be3574-BdSg-FbA8-Amak-HB1R-CqMg-Bxlp', 'd3f86667-cce1-11e2-b7e6-005056be3574', 'd17cb785-d20b-11e4-9be0-005056be1f7c', 'защита от огня', ''),
('d3f86667-cce1-11e2-b7e6-005056be3574-BeM4-FllD-AkPF-Hg9t-Ci7A-BnlJ', 'd3f86667-cce1-11e2-b7e6-005056be3574', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЭКОДОМ', ''),
('d3f86667-cce1-11e2-b7e6-005056be3574-Bi5c-FnTB-AgjE-Hmss-CU58-BQMr', 'd3f86667-cce1-11e2-b7e6-005056be3574', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'антисептический состав', ''),
('d3f86667-cce1-11e2-b7e6-005056be3574-BJ31-FaPf-AZ2F-HZi4-CPCF-BJor', 'd3f86667-cce1-11e2-b7e6-005056be3574', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('d3f86667-cce1-11e2-b7e6-005056be3574-BMO7-FRu6-ABS3-HB6d-CLEV-BCfk', 'd3f86667-cce1-11e2-b7e6-005056be3574', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для дерева', ''),
('d3f86667-cce1-11e2-b7e6-005056be3574-BMOA-FEQ7-AhbB-H4eg-CdCa-B7qu', 'd3f86667-cce1-11e2-b7e6-005056be3574', '1d08380b-ce34-11e4-a80e-005056be1f7a', '10000', 'г'),
('d3f86667-cce1-11e2-b7e6-005056be3574-BWPH-FYIl-A5mo-HViU-CGgh-BaiX', 'd3f86667-cce1-11e2-b7e6-005056be3574', 'd17cb785-d20b-11e4-9be0-005056be1f7c', 'защита от насекомых древоточцев', ''),
('d3f86669-cce1-11e2-b7e6-005056be3574-B2ML-Faxu-ACj5-HWzj-Cn8B-BQTz', 'd3f86669-cce1-11e2-b7e6-005056be3574', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'антисептический состав', ''),
('d3f86669-cce1-11e2-b7e6-005056be3574-B38G-FlFN-AnDr-H3am-ChuG-B8sP', 'd3f86669-cce1-11e2-b7e6-005056be3574', 'd17cb785-d20b-11e4-9be0-005056be1f7c', 'защита от огня', ''),
('d3f86669-cce1-11e2-b7e6-005056be3574-BgsK-FD2N-A4S1-HBoe-CKdG-BaCK', 'd3f86669-cce1-11e2-b7e6-005056be3574', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('d3f86669-cce1-11e2-b7e6-005056be3574-BHcm-FVyF-A5kF-HMgI-CUqE-BwrC', 'd3f86669-cce1-11e2-b7e6-005056be3574', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для дерева', ''),
('d3f86669-cce1-11e2-b7e6-005056be3574-BK7b-FA8F-AeIj-Hljl-CvJU-BQpR', 'd3f86669-cce1-11e2-b7e6-005056be3574', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('d3f86669-cce1-11e2-b7e6-005056be3574-Bkse-Ff82-AwVO-HVdi-Cv0R-B7CI', 'd3f86669-cce1-11e2-b7e6-005056be3574', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЭКОДОМ', ''),
('d3f86669-cce1-11e2-b7e6-005056be3574-Bm26-FgNv-AG2s-HHHB-C8dP-BX5p', 'd3f86669-cce1-11e2-b7e6-005056be3574', 'd17cb785-d20b-11e4-9be0-005056be1f7c', 'защита от биопоражений', ''),
('d3f86669-cce1-11e2-b7e6-005056be3574-BUeZ-F8I7-ASzU-H1rJ-CLUA-BH2O', 'd3f86669-cce1-11e2-b7e6-005056be3574', 'd17cb785-d20b-11e4-9be0-005056be1f7c', 'защита от насекомых древоточцев', ''),
('d3f86669-cce1-11e2-b7e6-005056be3574-BVNZ-FbZ7-Ajun-HogV-CrYh-B3yV', 'd3f86669-cce1-11e2-b7e6-005056be3574', '1d08380b-ce34-11e4-a80e-005056be1f7a', '5000', 'г'),
('d3f86669-cce1-11e2-b7e6-005056be3574-BzmQ-FiEJ-ApT6-HPWR-CXXj-BIUZ', 'd3f86669-cce1-11e2-b7e6-005056be3574', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('d3f8666b-cce1-11e2-b7e6-005056be3574-B3Kb-FHIT-AqBS-HOhd-CjLI-BISM', 'd3f8666b-cce1-11e2-b7e6-005056be3574', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('d3f8666b-cce1-11e2-b7e6-005056be3574-Bfww-F4wu-AwWP-H82i-C40i-BfKV', 'd3f8666b-cce1-11e2-b7e6-005056be3574', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('d3f8666b-cce1-11e2-b7e6-005056be3574-BGfh-FBvq-APPC-HLuD-CMQS-BlRC', 'd3f8666b-cce1-11e2-b7e6-005056be3574', 'd17cb785-d20b-11e4-9be0-005056be1f7c', 'защита от биопоражений', ''),
('d3f8666b-cce1-11e2-b7e6-005056be3574-BgOZ-FBu7-A5VV-H8X3-CJtF-BWXg', 'd3f8666b-cce1-11e2-b7e6-005056be3574', '1d08380b-ce34-11e4-a80e-005056be1f7a', '11000', 'г'),
('d3f8666b-cce1-11e2-b7e6-005056be3574-BhMX-F4Kv-AvTe-H1q3-CWwX-B5yJ', 'd3f8666b-cce1-11e2-b7e6-005056be3574', 'd17cb785-d20b-11e4-9be0-005056be1f7c', 'защита от насекомых древоточцев', ''),
('d3f8666b-cce1-11e2-b7e6-005056be3574-BIAm-FKwI-AeNd-HZfR-CuZ8-BJC9', 'd3f8666b-cce1-11e2-b7e6-005056be3574', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('d3f8666b-cce1-11e2-b7e6-005056be3574-BkEY-FmPJ-AqbZ-H9Dr-CBl5-BZeE', 'd3f8666b-cce1-11e2-b7e6-005056be3574', 'd17cb785-d20b-11e4-9be0-005056be1f7c', 'защита от огня', ''),
('d3f8666b-cce1-11e2-b7e6-005056be3574-BMrC-FqEA-AMZf-Hfg4-CkYD-BCgL', 'd3f8666b-cce1-11e2-b7e6-005056be3574', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для дерева', ''),
('d3f8666b-cce1-11e2-b7e6-005056be3574-Bopi-FHEE-AZzd-HW9g-CUeS-BHYF', 'd3f8666b-cce1-11e2-b7e6-005056be3574', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЭКОДОМ', ''),
('d3f8666b-cce1-11e2-b7e6-005056be3574-BVNM-Fobu-AHA6-HQJO-CdV6-BfBA', 'd3f8666b-cce1-11e2-b7e6-005056be3574', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'антисептический состав', ''),
('d76b7387-f78e-11e3-8c8a-005056be1f7b-B54x-F5CM-Ap2q-HibA-CQt1-BxhA', 'd76b7387-f78e-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('d76b7387-f78e-11e3-8c8a-005056be1f7b-BFHu-Fzys-Ag1f-HTvf-C5Xa-Bwbs', 'd76b7387-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('d76b7387-f78e-11e3-8c8a-005056be1f7b-BG2E-Fxl5-A5Ei-HBij-Cndc-BaXe', 'd76b7387-f78e-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('d76b7387-f78e-11e3-8c8a-005056be1f7b-Bl52-FERC-AhTi-HgYe-CpjR-BNvq', 'd76b7387-f78e-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'бирюзовый', ''),
('d76b7387-f78e-11e3-8c8a-005056be1f7b-BnDV-FTlx-AT3g-HKpE-CKw7-BPjh', 'd76b7387-f78e-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '6000', 'г'),
('d76b7387-f78e-11e3-8c8a-005056be1f7b-BS1h-FxJT-ATDq-HuzH-CcoG-BeBm', 'd76b7387-f78e-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('d76b7387-f78e-11e3-8c8a-005056be1f7b-By9B-FXfa-A2L0-HJYv-Cze3-BkTr', 'd76b7387-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('d9eaaa65-f78f-11e3-8c8a-005056be1f7b-B0QP-FomC-ASaJ-H0F0-C8x0-BncS', 'd9eaaa65-f78f-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('d9eaaa65-f78f-11e3-8c8a-005056be1f7b-B1ka-F3BY-AS6V-H0E8-CSQ2-BBlw', 'd9eaaa65-f78f-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '20000', 'г'),
('d9eaaa65-f78f-11e3-8c8a-005056be1f7b-Bb3K-FNHD-AaXB-Ha8a-C48q-BJmS', 'd9eaaa65-f78f-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('d9eaaa65-f78f-11e3-8c8a-005056be1f7b-BFwU-FadZ-A2wo-HVwn-CyHr-Bp18', 'd9eaaa65-f78f-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('d9eaaa65-f78f-11e3-8c8a-005056be1f7b-BL5s-FV5y-AV2l-HUfD-Cn87-BxKD', 'd9eaaa65-f78f-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('d9eaaa65-f78f-11e3-8c8a-005056be1f7b-Bs0q-FoTx-Aa2v-HP4N-CP90-BkYd', 'd9eaaa65-f78f-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('d9eaaa65-f78f-11e3-8c8a-005056be1f7b-BUD1-FtQD-AIs7-HUGv-Ch9z-BBcA', 'd9eaaa65-f78f-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'светло-зеленый', ''),
('da49edc1-58f9-11e0-894e-000e0c431b58-B1oV-F3KP-Au1y-HeFD-ClsW-BIXz', 'da49edc1-58f9-11e0-894e-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для ржавчины', ''),
('da49edc1-58f9-11e0-894e-000e0c431b58-BbcG-FHFR-A9qB-Hg43-Cqjt-BOOH', 'da49edc1-58f9-11e0-894e-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('da49edc1-58f9-11e0-894e-000e0c431b58-BhKp-FiAR-AXGp-HnL2-Ckth-BM1J', 'da49edc1-58f9-11e0-894e-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('da49edc1-58f9-11e0-894e-000e0c431b58-Bipm-FGmc-ABY0-Hf1Z-CBlE-BjxU', 'da49edc1-58f9-11e0-894e-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('da49edc1-58f9-11e0-894e-000e0c431b58-BnTg-Focf-Ac7B-HbGG-Cbhi-Bipo', 'da49edc1-58f9-11e0-894e-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '10', 'л'),
('da49edc1-58f9-11e0-894e-000e0c431b58-Bozv-FpR3-Awta-HUSF-C0It-BVA4', 'da49edc1-58f9-11e0-894e-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'грунт-эмаль', ''),
('da49edc1-58f9-11e0-894e-000e0c431b58-Bp2i-FpXY-AEZA-HJ9y-Cef0-BJEA', 'da49edc1-58f9-11e0-894e-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('da49edc1-58f9-11e0-894e-000e0c431b58-Bvph-FLP8-AXVB-H1ly-CFYP-BEL8', 'da49edc1-58f9-11e0-894e-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('da49edc3-58f9-11e0-894e-000e0c431b58-B0qW-FbI0-ARlR-HYPV-CSX6-B2WG', 'da49edc3-58f9-11e0-894e-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('da49edc3-58f9-11e0-894e-000e0c431b58-B34e-FWfR-Afgb-Hcm1-CdSH-BnE4', 'da49edc3-58f9-11e0-894e-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('da49edc3-58f9-11e0-894e-000e0c431b58-B6wZ-FJQx-AL9e-HlwJ-CAK7-BGYA', 'da49edc3-58f9-11e0-894e-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'зеленый', ''),
('da49edc3-58f9-11e0-894e-000e0c431b58-BCz8-Fvg3-AMtq-Hhc1-CXbh-Bu3p', 'da49edc3-58f9-11e0-894e-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '10', 'л'),
('da49edc3-58f9-11e0-894e-000e0c431b58-BIjj-F0KL-Ac1t-Hr6b-CNxU-BsK1', 'da49edc3-58f9-11e0-894e-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('da49edc3-58f9-11e0-894e-000e0c431b58-BOsX-F5Qz-AvoQ-HSYJ-C9HT-BQI3', 'da49edc3-58f9-11e0-894e-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'грунт-эмаль', ''),
('da49edc3-58f9-11e0-894e-000e0c431b58-BpRK-Fvwe-Afp1-Hlmd-CpiP-BFrg', 'da49edc3-58f9-11e0-894e-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('da49edc3-58f9-11e0-894e-000e0c431b58-BtKR-FBih-AW16-HSsS-CYuH-BVgn', 'da49edc3-58f9-11e0-894e-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для ржавчины', ''),
('da49edc5-58f9-11e0-894e-000e0c431b58-BDJB-FiEA-AAzP-Hrdo-CMIK-BBWV', 'da49edc5-58f9-11e0-894e-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('da49edc5-58f9-11e0-894e-000e0c431b58-BdNG-FdEe-A2p7-HYR7-CB58-Bcxp', 'da49edc5-58f9-11e0-894e-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('da49edc5-58f9-11e0-894e-000e0c431b58-BlZ0-FhyQ-AezL-HbR9-CHoT-BrEV', 'da49edc5-58f9-11e0-894e-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для ржавчины', ''),
('da49edc5-58f9-11e0-894e-000e0c431b58-BmAb-F3s5-Ah5D-Hr6Z-CCJF-BfVE', 'da49edc5-58f9-11e0-894e-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('da49edc5-58f9-11e0-894e-000e0c431b58-BNpc-FM08-A2BA-H2XX-Ckbh-BmAm', 'da49edc5-58f9-11e0-894e-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('da49edc5-58f9-11e0-894e-000e0c431b58-BO5a-F4zA-A5zE-HJ7m-CdhB-BcF1', 'da49edc5-58f9-11e0-894e-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'грунт-эмаль', ''),
('da49edc5-58f9-11e0-894e-000e0c431b58-Bpgy-FNKL-ASH0-HUfo-CCC0-BWXt', 'da49edc5-58f9-11e0-894e-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'коричневый', ''),
('da49edc5-58f9-11e0-894e-000e0c431b58-BWUk-FZCg-AzFp-H6kB-C0DO-BGhT', 'da49edc5-58f9-11e0-894e-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '10', 'л'),
('da49edc7-58f9-11e0-894e-000e0c431b58-B0Pl-Ft0h-Av8e-HPcj-CE4O-BJ2r', 'da49edc7-58f9-11e0-894e-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('da49edc7-58f9-11e0-894e-000e0c431b58-B6aG-FYlQ-Awca-Ha5U-CC6A-Bna5', 'da49edc7-58f9-11e0-894e-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'грунт-эмаль', ''),
('da49edc7-58f9-11e0-894e-000e0c431b58-B80Q-F80p-AWSc-HKKY-C2Kn-Bc4m', 'da49edc7-58f9-11e0-894e-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '10', 'л'),
('da49edc7-58f9-11e0-894e-000e0c431b58-BapE-F9cx-AIj0-H0YZ-CSxx-B36q', 'da49edc7-58f9-11e0-894e-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('da49edc7-58f9-11e0-894e-000e0c431b58-BApk-Fe5D-AE07-HSJy-CAGy-BQDx', 'da49edc7-58f9-11e0-894e-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для ржавчины', ''),
('da49edc7-58f9-11e0-894e-000e0c431b58-BBbg-FHV6-AlPh-HxsJ-CGM2-BzZT', 'da49edc7-58f9-11e0-894e-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('da49edc7-58f9-11e0-894e-000e0c431b58-Bdrs-FNbj-A9Qs-HeiN-CClZ-BASO', 'da49edc7-58f9-11e0-894e-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'красно-коричневый', ''),
('da49edc7-58f9-11e0-894e-000e0c431b58-BZXj-FH3H-AU6t-Ht6C-C98d-BeEz', 'da49edc7-58f9-11e0-894e-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('da49edc9-58f9-11e0-894e-000e0c431b58-B7Zb-FNuD-AeQf-HIe7-CMCs-BXYG', 'da49edc9-58f9-11e0-894e-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '10', 'л'),
('da49edc9-58f9-11e0-894e-000e0c431b58-B811-Fd9V-AZKX-HHhv-COwI-BjJX', 'da49edc9-58f9-11e0-894e-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'грунт-эмаль', ''),
('da49edc9-58f9-11e0-894e-000e0c431b58-BD4m-Fogp-AQbQ-HUmQ-Cgbn-BOaD', 'da49edc9-58f9-11e0-894e-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('da49edc9-58f9-11e0-894e-000e0c431b58-BhwL-FWY2-A9NH-H3bk-Cofd-BRJA', 'da49edc9-58f9-11e0-894e-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('da49edc9-58f9-11e0-894e-000e0c431b58-BjbP-FYIo-AWgI-HDkX-CqfP-BjxO', 'da49edc9-58f9-11e0-894e-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'серый', ''),
('da49edc9-58f9-11e0-894e-000e0c431b58-BjSY-FN21-AZ1k-HnCl-C5lD-BK0L', 'da49edc9-58f9-11e0-894e-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('da49edc9-58f9-11e0-894e-000e0c431b58-BPWU-FWOv-A84R-HbLa-CbH1-B4Vk', 'da49edc9-58f9-11e0-894e-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для ржавчины', ''),
('da49edc9-58f9-11e0-894e-000e0c431b58-BzWs-F9aT-AWHy-Hlql-CzP5-BNdw', 'da49edc9-58f9-11e0-894e-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('da49edcb-58f9-11e0-894e-000e0c431b58-BApR-FPyG-A6oE-HJM7-CwTy-BbPi', 'da49edcb-58f9-11e0-894e-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('da49edcb-58f9-11e0-894e-000e0c431b58-BEkg-Fcwe-Ap6O-HJzq-C18O-Bh3m', 'da49edcb-58f9-11e0-894e-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('da49edcb-58f9-11e0-894e-000e0c431b58-BeMi-FQhb-ABOU-HbNd-CpSh-Bjcv', 'da49edcb-58f9-11e0-894e-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для ржавчины', ''),
('da49edcb-58f9-11e0-894e-000e0c431b58-BFE4-FJNG-AGAZ-H6cp-Cepy-BQbL', 'da49edcb-58f9-11e0-894e-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '10', 'л'),
('da49edcb-58f9-11e0-894e-000e0c431b58-BG3p-F6uv-A4Ni-HNc0-C0gj-Bg0W', 'da49edcb-58f9-11e0-894e-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('da49edcb-58f9-11e0-894e-000e0c431b58-BIhr-F5Yi-AACz-H2G8-CcwT-BPav', 'da49edcb-58f9-11e0-894e-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'черный', ''),
('da49edcb-58f9-11e0-894e-000e0c431b58-BNJv-FvXO-AvWv-HU3v-Cq4a-B9IO', 'da49edcb-58f9-11e0-894e-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('da49edcb-58f9-11e0-894e-000e0c431b58-Bpiv-FFdO-Au84-HjNV-Cush-BT9F', 'da49edcb-58f9-11e0-894e-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'грунт-эмаль', ''),
('de1409cf-f787-11e3-8c8a-005056be1f7b-B2i0-FC1K-AveX-HtHI-CAPO-B6w1', 'de1409cf-f787-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('de1409cf-f787-11e3-8c8a-005056be1f7b-BBP0-FhTe-AVnY-HgqL-CZdg-B36V', 'de1409cf-f787-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('de1409cf-f787-11e3-8c8a-005056be1f7b-BFUg-FeZC-Arog-HEex-CU5L-BCw3', 'de1409cf-f787-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'светло-зеленый', ''),
('de1409cf-f787-11e3-8c8a-005056be1f7b-Bge4-Fltx-AkTQ-HoDd-Cb5B-Ba73', 'de1409cf-f787-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '800', 'г'),
('de1409cf-f787-11e3-8c8a-005056be1f7b-BiEJ-FttH-AVML-HSLs-CnM9-BnuR', 'de1409cf-f787-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('de1409cf-f787-11e3-8c8a-005056be1f7b-BIF6-Fgml-AsCE-HO50-CjcD-BtMx', 'de1409cf-f787-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('de1409cf-f787-11e3-8c8a-005056be1f7b-BxVc-Fbyq-AJyL-Hp9m-CcD7-B0hV', 'de1409cf-f787-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('df210450-93af-11e3-82a4-005056be1f7b-B6Yu-FC58-AdZr-HMbt-C3sr-BQxd', 'df210450-93af-11e3-82a4-005056be1f7b', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.75', 'л'),
('df210450-93af-11e3-82a4-005056be1f7b-BgQg-FS8O-A7sy-Hwo4-CLzi-BeYz', 'df210450-93af-11e3-82a4-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('df210450-93af-11e3-82a4-005056be1f7b-BLpT-FiQO-A1Gz-H7pD-C1f2-BKVA', 'df210450-93af-11e3-82a4-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('df210450-93af-11e3-82a4-005056be1f7b-BQ9Y-FFvD-A973-HhbQ-CXLg-BTvr', 'df210450-93af-11e3-82a4-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('df210450-93af-11e3-82a4-005056be1f7b-BtP7-FjLl-AnCG-HfNb-Cfts-BCCq', 'df210450-93af-11e3-82a4-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('df210450-93af-11e3-82a4-005056be1f7b-BTwa-FMT2-AdqD-H0Ay-Cr6N-Bb8H', 'df210450-93af-11e3-82a4-005056be1f7b', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для ржавчины', ''),
('df210450-93af-11e3-82a4-005056be1f7b-BYbg-FFn9-Azfr-Hgwe-CAGR-BaTk', 'df210450-93af-11e3-82a4-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'грунт-эмаль', ''),
('df210450-93af-11e3-82a4-005056be1f7b-BzyU-FzIW-A6gv-Hrrn-Cuk1-B6FY', 'df210450-93af-11e3-82a4-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'желтый', ''),
('df2d81cd-f78e-11e3-8c8a-005056be1f7b-BC7Y-FhuA-A2YF-HrGk-Cqkd-BUDh', 'df2d81cd-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('df2d81cd-f78e-11e3-8c8a-005056be1f7b-BDn4-F7Vq-AkiP-HSZk-Cach-By0S', 'df2d81cd-f78e-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('df2d81cd-f78e-11e3-8c8a-005056be1f7b-Be4o-FcDt-AjV3-Hsxo-CMir-B2VI', 'df2d81cd-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('df2d81cd-f78e-11e3-8c8a-005056be1f7b-BII8-FXbW-A92z-Hfqy-Cxgp-BebN', 'df2d81cd-f78e-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('df2d81cd-f78e-11e3-8c8a-005056be1f7b-BR8b-Fp9A-AGgm-HK8K-CjGT-Bgdu', 'df2d81cd-f78e-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '6000', 'г'),
('df2d81cd-f78e-11e3-8c8a-005056be1f7b-BvDo-FxaK-AkQf-HymT-CoEz-Brf0', 'df2d81cd-f78e-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'зеленый', ''),
('df2d81cd-f78e-11e3-8c8a-005056be1f7b-Bz1q-F6ix-AgOX-HAia-CimD-BbiZ', 'df2d81cd-f78e-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('e017a0ce-f78d-11e3-8c8a-005056be1f7b-BBUX-FCGr-Anwq-HK4N-CJlC-BGy3', 'e017a0ce-f78d-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('e017a0ce-f78d-11e3-8c8a-005056be1f7b-Bo5b-Fhcj-AR8g-HCWo-CxSJ-Bb1R', 'e017a0ce-f78d-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'оранжевый', ''),
('e017a0ce-f78d-11e3-8c8a-005056be1f7b-Bry8-FN1T-A3om-HBGc-CSy2-BZG6', 'e017a0ce-f78d-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('e017a0ce-f78d-11e3-8c8a-005056be1f7b-BsYG-FREm-ANbA-HwUl-Cp0g-BHg0', 'e017a0ce-f78d-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('e017a0ce-f78d-11e3-8c8a-005056be1f7b-BWGx-FDRr-ARaS-HThH-CM8x-Bt0f', 'e017a0ce-f78d-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('e017a0ce-f78d-11e3-8c8a-005056be1f7b-BXdg-Fzz7-AYGX-HSv1-CTI8-BGMO', 'e017a0ce-f78d-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1900', 'г'),
('e017a0ce-f78d-11e3-8c8a-005056be1f7b-BZqh-FCsn-AeAc-HVZj-CRb4-BpdA', 'e017a0ce-f78d-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('e02ebd60-99a6-11db-937f-000e0c431b59-B6Zx-F5Ip-Awdi-HLNw-C3bg-B88F', 'e02ebd60-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('e02ebd60-99a6-11db-937f-000e0c431b59-BgWi-FUv7-A67H-Hv66-Cw2V-Bkvd', 'e02ebd60-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('e02ebd60-99a6-11db-937f-000e0c431b59-BPh8-FytL-Aklm-HHjj-CMF7-Bvar', 'e02ebd60-99a6-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('e02ebd60-99a6-11db-937f-000e0c431b59-BrVo-FzGj-Av4b-HGdM-Cktu-Bhid', 'e02ebd60-99a6-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('e02ebd60-99a6-11db-937f-000e0c431b59-BsJF-FVQo-A5cu-H1OK-Ci7g-BNvn', 'e02ebd60-99a6-11db-937f-000e0c431b59', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для мебели', ''),
('e02ebd60-99a6-11db-937f-000e0c431b59-Bxgg-FOmA-AaMu-HKuS-Cocb-Btyr', 'e02ebd60-99a6-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'клей ПВА "Люкс"', ''),
('e02ebd60-99a6-11db-937f-000e0c431b59-BYtK-FIkZ-ASJV-HzWG-CcJm-B0XP', 'e02ebd60-99a6-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '900', 'г'),
('e02ebd64-99a6-11db-937f-000e0c431b59-BAxc-Fu9M-ADnp-HeWd-CMvM-BX4w', 'e02ebd64-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('e02ebd64-99a6-11db-937f-000e0c431b59-BdMF-F1Ub-AFPj-HhG1-CBPV-B91s', 'e02ebd64-99a6-11db-937f-000e0c431b59', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для мебели', ''),
('e02ebd64-99a6-11db-937f-000e0c431b59-BJf7-FkWZ-AZe3-HCDF-CozW-B3RH', 'e02ebd64-99a6-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('e02ebd64-99a6-11db-937f-000e0c431b59-BwM7-FIBS-AOdb-H2cy-CHcm-BjNl', 'e02ebd64-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('e02ebd64-99a6-11db-937f-000e0c431b59-BwQO-Fbvl-A68W-HHVP-C5Ib-B1Qd', 'e02ebd64-99a6-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('e02ebd64-99a6-11db-937f-000e0c431b59-BXPJ-F8xP-Axyf-HIwV-C1Kl-BCa4', 'e02ebd64-99a6-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '2300', 'г'),
('e02ebd64-99a6-11db-937f-000e0c431b59-BXPM-FQSQ-AW7F-HszX-C1Tj-B7J5', 'e02ebd64-99a6-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'клей ПВА "Люкс"', ''),
('e02ebd66-99a6-11db-937f-000e0c431b59-BBOH-F9Uj-AXUT-HjLc-CRrX-BWNn', 'e02ebd66-99a6-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('e02ebd66-99a6-11db-937f-000e0c431b59-BEvR-FYUc-A1lK-HO9X-C3sP-BChJ', 'e02ebd66-99a6-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'клей ПВА "Люкс"', ''),
('e02ebd66-99a6-11db-937f-000e0c431b59-Bg5F-FfQY-AogE-HC6s-COjI-BOtr', 'e02ebd66-99a6-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('e02ebd66-99a6-11db-937f-000e0c431b59-BHFS-Fwvp-ALKE-Hxpc-CuuO-BCIi', 'e02ebd66-99a6-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '40000', 'г'),
('e02ebd66-99a6-11db-937f-000e0c431b59-BoaA-FJiw-AeZ8-HGbY-CAuL-B1Js', 'e02ebd66-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('e02ebd66-99a6-11db-937f-000e0c431b59-BSx1-FYgp-AvW0-HVTI-CPqY-BZnL', 'e02ebd66-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('e02ebd66-99a6-11db-937f-000e0c431b59-Bu2K-Fz5F-AhIo-HqXY-CYZm-BfX8', 'e02ebd66-99a6-11db-937f-000e0c431b59', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для мебели', ''),
('e02ebd6a-99a6-11db-937f-000e0c431b59-BaOa-FfCG-A9w1-HNz0-CwU9-B7AM', 'e02ebd6a-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('e02ebd6a-99a6-11db-937f-000e0c431b59-Bd2Q-FMu1-A032-H0cY-CCH5-B3om', 'e02ebd6a-99a6-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'клей ПВА-М "Экстра"', ''),
('e02ebd6a-99a6-11db-937f-000e0c431b59-Bf0K-FpOI-ADG2-HSIZ-CcQe-BuDQ', 'e02ebd6a-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('e02ebd6a-99a6-11db-937f-000e0c431b59-BFET-F8Wc-AXzt-H3kw-CIAA-BjgC', 'e02ebd6a-99a6-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('e02ebd6a-99a6-11db-937f-000e0c431b59-BhKH-Fhpj-AiWG-HmYl-CE2d-BVEN', 'e02ebd6a-99a6-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '900', 'г'),
('e02ebd6a-99a6-11db-937f-000e0c431b59-Bpfz-Fgsp-AfeA-HebA-CrhE-BBeb', 'e02ebd6a-99a6-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('e02ebd6c-99a6-11db-937f-000e0c431b59-B4qs-FqjW-AhpM-Hb3F-CZnb-BdEJ', 'e02ebd6c-99a6-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('e02ebd6c-99a6-11db-937f-000e0c431b59-Bf11-FCIo-AnjJ-Hzib-CPbI-B8Hs', 'e02ebd6c-99a6-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'клей ПВА-М "Экстра"', ''),
('e02ebd6c-99a6-11db-937f-000e0c431b59-BLDG-FDDi-AcFq-HW9U-C0ff-BHDK', 'e02ebd6c-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('e02ebd6c-99a6-11db-937f-000e0c431b59-Bqlg-FxO6-AYSw-H3n2-CGz5-BM48', 'e02ebd6c-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('e02ebd6c-99a6-11db-937f-000e0c431b59-BUpX-FgHP-Amg3-HDA8-CMfy-BDi7', 'e02ebd6c-99a6-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '2300', 'г'),
('e02ebd6c-99a6-11db-937f-000e0c431b59-BuVD-FbrB-Awrh-HRyk-CbeL-B9Sa', 'e02ebd6c-99a6-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('e02ebd6e-99a6-11db-937f-000e0c431b59-B83c-FdUq-AGeO-HZCT-Cz1B-Bvgw', 'e02ebd6e-99a6-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('e02ebd6e-99a6-11db-937f-000e0c431b59-Bgd8-F9z3-AAXu-H6XF-CLEh-B6BY', 'e02ebd6e-99a6-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '4000', 'г'),
('e02ebd6e-99a6-11db-937f-000e0c431b59-Brbu-F72w-APqm-HRbJ-CDJU-BwT8', 'e02ebd6e-99a6-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'клей ПВА-М "Экстра"', ''),
('e02ebd6e-99a6-11db-937f-000e0c431b59-BrLf-F2AD-ATQf-HbNn-CJiS-BhFZ', 'e02ebd6e-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('e02ebd6e-99a6-11db-937f-000e0c431b59-BsKt-FJmt-AJAc-HV5B-Ci35-BAVP', 'e02ebd6e-99a6-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('e02ebd6e-99a6-11db-937f-000e0c431b59-Bxr7-Fqu7-An8b-HbAA-CYsL-B4jM', 'e02ebd6e-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('e02ebd70-99a6-11db-937f-000e0c431b59-B9dk-FoR9-AoC4-HHwx-CaXs-BFti', 'e02ebd70-99a6-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('e02ebd70-99a6-11db-937f-000e0c431b59-Bdwv-Fpnw-A1du-He4Y-CaSq-BYkF', 'e02ebd70-99a6-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '10000', 'г'),
('e02ebd70-99a6-11db-937f-000e0c431b59-BJLk-FRKh-AaiL-H2AL-Cz9o-Ban6', 'e02ebd70-99a6-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('e02ebd70-99a6-11db-937f-000e0c431b59-Bl5p-FW1D-AbBI-H07J-CXoa-Bc09', 'e02ebd70-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('e02ebd70-99a6-11db-937f-000e0c431b59-BrRE-FUig-Adlq-HyY0-Cv5d-Bt4S', 'e02ebd70-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('e02ebd70-99a6-11db-937f-000e0c431b59-BYR9-FRZu-AFzI-Hx62-CWED-B7VN', 'e02ebd70-99a6-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'клей ПВА-М "Экстра"', ''),
('e02ebd72-99a6-11db-937f-000e0c431b59-B8vJ-FsQC-AHrU-HxG5-C3Pk-BygD', 'e02ebd72-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('e02ebd72-99a6-11db-937f-000e0c431b59-BIyQ-FBqu-AyNM-HY5X-CNnp-Busu', 'e02ebd72-99a6-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'клей ПВА-М "Экстра"', ''),
('e02ebd72-99a6-11db-937f-000e0c431b59-BJp6-FRc1-AJy5-HMvQ-CaPC-BL5p', 'e02ebd72-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('e02ebd72-99a6-11db-937f-000e0c431b59-Boq3-Fi3n-AzS3-H2ex-Chcj-BqKz', 'e02ebd72-99a6-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('e02ebd72-99a6-11db-937f-000e0c431b59-BtRg-FEFn-A093-HjwZ-CmaF-Be08', 'e02ebd72-99a6-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('e02ebd72-99a6-11db-937f-000e0c431b59-BXrs-FQRf-Ap46-HvY6-Cthu-B0ia', 'e02ebd72-99a6-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '40000', 'г'),
('e02ebd74-99a6-11db-937f-000e0c431b59-BIuC-FdG5-AGxH-HSJ5-C689-BtBC', 'e02ebd74-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('e02ebd74-99a6-11db-937f-000e0c431b59-Bje4-Fc7I-Aeug-HSjY-CMUX-B5Mo', 'e02ebd74-99a6-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('e02ebd74-99a6-11db-937f-000e0c431b59-Bpgp-FMzP-AlBj-H96w-Cnqv-BfQe', 'e02ebd74-99a6-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'клей ПВА "Мастер"', ''),
('e02ebd74-99a6-11db-937f-000e0c431b59-BQBr-FNeF-ADh3-HcPC-CxYx-Bz25', 'e02ebd74-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('e02ebd74-99a6-11db-937f-000e0c431b59-Bu9r-F2R1-AwNy-Hu71-CwN2-BebW', 'e02ebd74-99a6-11db-937f-000e0c431b59', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсальный', ''),
('e02ebd74-99a6-11db-937f-000e0c431b59-BUq0-FW9A-A1mj-HyJl-CtzI-BYC8', 'e02ebd74-99a6-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '2300', 'г'),
('e02ebd74-99a6-11db-937f-000e0c431b59-Bv92-Fjsy-AZfC-HRAd-Cnj9-BhB6', 'e02ebd74-99a6-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('e02ebd76-99a6-11db-937f-000e0c431b59-BcGq-FE3b-A8Hf-HgX8-CEnO-BOcU', 'e02ebd76-99a6-11db-937f-000e0c431b59', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'строительно-универсальный', ''),
('e02ebd76-99a6-11db-937f-000e0c431b59-Bi5J-FreY-A3BQ-HriW-CIAd-ByFV', 'e02ebd76-99a6-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('e02ebd76-99a6-11db-937f-000e0c431b59-BmXQ-FHUI-AEmj-H7Dq-CS4r-Bp0Y', 'e02ebd76-99a6-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '900', 'г'),
('e02ebd76-99a6-11db-937f-000e0c431b59-Bon0-FNm6-AAPm-Hvu3-CPEj-BPbh', 'e02ebd76-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('e02ebd76-99a6-11db-937f-000e0c431b59-BPCd-Fvi2-Asne-H838-CRa2-BbHV', 'e02ebd76-99a6-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('e02ebd76-99a6-11db-937f-000e0c431b59-BPRK-FzFT-AbzI-HjOL-Ch3y-BgGa', 'e02ebd76-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('e02ebd76-99a6-11db-937f-000e0c431b59-BzAX-FFr6-Acz7-H7nB-CR4D-Bvom', 'e02ebd76-99a6-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'клей ПВА', ''),
('e02ebd78-99a6-11db-937f-000e0c431b59-B6Ws-Fipz-AfdE-HVcN-CtDq-B6SQ', 'e02ebd78-99a6-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'клей ПВА "Люкс"', ''),
('e02ebd78-99a6-11db-937f-000e0c431b59-BcVH-FBb0-A2wp-H412-CuvN-BcU4', 'e02ebd78-99a6-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '2300', 'г'),
('e02ebd78-99a6-11db-937f-000e0c431b59-BI4K-F4hl-AUyo-HHVy-CQBD-BAQO', 'e02ebd78-99a6-11db-937f-000e0c431b59', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'строительно-универсальный', ''),
('e02ebd78-99a6-11db-937f-000e0c431b59-BkcM-FOkh-AD1i-HG2z-CVqB-BDL2', 'e02ebd78-99a6-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('e02ebd78-99a6-11db-937f-000e0c431b59-BlbO-FiX3-Ajpv-Hnaa-CQDx-BhKI', 'e02ebd78-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('e02ebd78-99a6-11db-937f-000e0c431b59-BpOu-FPLx-A6dq-HnJp-CBvH-BPTf', 'e02ebd78-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('e02ebd78-99a6-11db-937f-000e0c431b59-ByMs-Ffz2-AL2n-HSH7-CyP1-B0IX', 'e02ebd78-99a6-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('e02ebd7a-99a6-11db-937f-000e0c431b59-B4M3-FoW6-Avdn-HEWq-Cc26-Brsj', 'e02ebd7a-99a6-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('e02ebd7a-99a6-11db-937f-000e0c431b59-Bc47-FG9T-AxbK-HsI4-CRWJ-Bxsg', 'e02ebd7a-99a6-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '4000', 'г'),
('e02ebd7a-99a6-11db-937f-000e0c431b59-BeOO-F2ng-Ai7I-HFnG-CxKp-Bakf', 'e02ebd7a-99a6-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('e02ebd7a-99a6-11db-937f-000e0c431b59-Bgjm-Fazc-AmXv-HJDG-CHsS-B3CY', 'e02ebd7a-99a6-11db-937f-000e0c431b59', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'строительно-универсальный', ''),
('e02ebd7a-99a6-11db-937f-000e0c431b59-BNQf-FWWJ-AcJT-HIj4-CncG-BgHc', 'e02ebd7a-99a6-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'клей ПВА "Люкс"', ''),
('e02ebd7a-99a6-11db-937f-000e0c431b59-BpMv-FUFl-ALzW-HZSr-CSlg-Bq9s', 'e02ebd7a-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('e02ebd7a-99a6-11db-937f-000e0c431b59-BSzX-FXL1-Ak54-HQ1L-ChSg-BpU9', 'e02ebd7a-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('e02ebd7c-99a6-11db-937f-000e0c431b59-B1dl-FZDo-AvcV-HEnX-CjEm-B0pw', 'e02ebd7c-99a6-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'клей ПВА "Люкс"', ''),
('e02ebd7c-99a6-11db-937f-000e0c431b59-B7Kp-FPSP-AJ7s-HPd1-Cs6t-BpCs', 'e02ebd7c-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('e02ebd7c-99a6-11db-937f-000e0c431b59-B9el-FgVO-Aww6-HwmU-Ctcy-BU22', 'e02ebd7c-99a6-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '10000', 'г'),
('e02ebd7c-99a6-11db-937f-000e0c431b59-B9zJ-FJhR-ACyn-HMlV-Csig-BXxz', 'e02ebd7c-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('e02ebd7c-99a6-11db-937f-000e0c431b59-BaOZ-FlK0-Ayyh-H1mP-CarA-BzZ7', 'e02ebd7c-99a6-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('e02ebd7c-99a6-11db-937f-000e0c431b59-BEuY-Fs7A-ADpi-HkDW-CZqS-BLCf', 'e02ebd7c-99a6-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('e02ebd7c-99a6-11db-937f-000e0c431b59-Bn7v-FVMP-AM5K-H7jN-CoiC-Bxrj', 'e02ebd7c-99a6-11db-937f-000e0c431b59', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'строительно-универсальный', ''),
('e02ebd7e-99a6-11db-937f-000e0c431b59-B0nU-FVs9-AtRC-HVQs-CIPN-Buvi', 'e02ebd7e-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('e02ebd7e-99a6-11db-937f-000e0c431b59-B9iU-F4U7-AODZ-HDYQ-C5Y5-BPtm', 'e02ebd7e-99a6-11db-937f-000e0c431b59', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('e02ebd7e-99a6-11db-937f-000e0c431b59-BBxH-Fa1g-Arv5-HmAo-CONG-BIe6', 'e02ebd7e-99a6-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('e02ebd7e-99a6-11db-937f-000e0c431b59-BNc5-FQyK-A07a-HMqM-Cuou-BFiE', 'e02ebd7e-99a6-11db-937f-000e0c431b59', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'строительно-универсальный', ''),
('e02ebd7e-99a6-11db-937f-000e0c431b59-BTd2-Ftpi-A6aM-Hqfv-Cugi-B38Z', 'e02ebd7e-99a6-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('e02ebd7e-99a6-11db-937f-000e0c431b59-BYoc-FlU8-AXEe-H78c-CVVI-Bgoa', 'e02ebd7e-99a6-11db-937f-000e0c431b59', '1d08380b-ce34-11e4-a80e-005056be1f7a', '38000', 'г'),
('e02ebd7e-99a6-11db-937f-000e0c431b59-BYpK-FTRK-A8gY-HEp4-C09W-B1sC', 'e02ebd7e-99a6-11db-937f-000e0c431b59', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'клей ПВА "Люкс"', ''),
('e12e57a9-f78f-11e3-8c8a-005056be1f7b-BCDq-Ftem-AZW4-HkMM-C7WS-BxzG', 'e12e57a9-f78f-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('e12e57a9-f78f-11e3-8c8a-005056be1f7b-BJG1-Fdxz-ATRm-HQWA-C9ML-BkMl', 'e12e57a9-f78f-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('e12e57a9-f78f-11e3-8c8a-005056be1f7b-BnJY-FPau-APY8-Ha9J-CBBM-Bsur', 'e12e57a9-f78f-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('e12e57a9-f78f-11e3-8c8a-005056be1f7b-BUKD-FOuQ-Abrn-Hued-C2Hm-BPXD', 'e12e57a9-f78f-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '20000', 'г'),
('e12e57a9-f78f-11e3-8c8a-005056be1f7b-BVf0-FBLS-AxeT-Hr91-Cdw8-BEYr', 'e12e57a9-f78f-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('e12e57a9-f78f-11e3-8c8a-005056be1f7b-BxGl-Fluu-Aw5K-HP11-CpOk-B10Z', 'e12e57a9-f78f-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'синий', ''),
('e12e57a9-f78f-11e3-8c8a-005056be1f7b-BzKm-FAac-A1Fq-Hb6q-C2RL-B1TW', 'e12e57a9-f78f-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('e213c98a-ccbb-11e4-a1f9-005056be1f7b-BGNK-Fogp-AviY-Hb0z-CTUQ-B82r', 'e213c98a-ccbb-11e4-a1f9-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'сольвент', ''),
('e213c98a-ccbb-11e4-a1f9-005056be1f7b-BkWc-FnWi-A0Ch-HTeG-CBsq-Bbb3', 'e213c98a-ccbb-11e4-a1f9-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('e213c98a-ccbb-11e4-a1f9-005056be1f7b-BOjZ-FsM4-AAwM-H0rX-CQ3Q-BTJ7', 'e213c98a-ccbb-11e4-a1f9-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('e213c98a-ccbb-11e4-a1f9-005056be1f7b-BUbo-FgaW-A5qP-HKAY-CGku-BiOH', 'e213c98a-ccbb-11e4-a1f9-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('e213c98a-ccbb-11e4-a1f9-005056be1f7b-BUwY-Fj7Y-A9C9-HslN-C1sa-BBW8', 'e213c98a-ccbb-11e4-a1f9-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '400', 'г'),
('e63d2bae-f78d-11e3-8c8a-005056be1f7b-BANR-FTfA-AawZ-HNN8-CNQx-B05D', 'e63d2bae-f78d-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('e63d2bae-f78d-11e3-8c8a-005056be1f7b-BdsJ-F6pz-Axx6-HaMq-CxN4-BFgZ', 'e63d2bae-f78d-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('e63d2bae-f78d-11e3-8c8a-005056be1f7b-BDzv-FnPe-AxGb-H8q3-CHFm-BYvX', 'e63d2bae-f78d-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'желтый', ''),
('e63d2bae-f78d-11e3-8c8a-005056be1f7b-BF8L-FfLZ-AdYq-HQXl-CT2T-Bdw0', 'e63d2bae-f78d-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('e63d2bae-f78d-11e3-8c8a-005056be1f7b-BLco-FXQh-AGdg-Hw3A-Cnq9-B4LM', 'e63d2bae-f78d-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1900', 'г'),
('e63d2bae-f78d-11e3-8c8a-005056be1f7b-BTjw-FOA0-A5yM-Hx4s-CM9q-BYe2', 'e63d2bae-f78d-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('e63d2bae-f78d-11e3-8c8a-005056be1f7b-By8P-FeOn-AGie-HaBQ-CZU1-BMi1', 'e63d2bae-f78d-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('e755f307-f787-11e3-8c8a-005056be1f7b-B4Xr-F4BX-AEwx-H5or-CCjl-B3D9', 'e755f307-f787-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'синий', ''),
('e755f307-f787-11e3-8c8a-005056be1f7b-Bb8k-FZ8L-AYDg-HcCa-Cfhk-BlHl', 'e755f307-f787-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('e755f307-f787-11e3-8c8a-005056be1f7b-BeJF-FkAA-At1B-HR0n-CBvw-BmAV', 'e755f307-f787-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('e755f307-f787-11e3-8c8a-005056be1f7b-BFZT-FmMn-Ag2c-HaOr-CpHE-BWBF', 'e755f307-f787-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('e755f307-f787-11e3-8c8a-005056be1f7b-Bm2b-FnIb-ARJN-HDvO-CZNL-B0mI', 'e755f307-f787-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '800', 'г'),
('e755f307-f787-11e3-8c8a-005056be1f7b-BuF3-Fi0g-AQCF-H25I-CzAh-BImt', 'e755f307-f787-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('e755f307-f787-11e3-8c8a-005056be1f7b-BwJl-FPjz-A7O8-HAk9-CGVE-B94D', 'e755f307-f787-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('e7f145bb-f78f-11e3-8c8a-005056be1f7b-B4YB-FWqu-AwTr-Hxr4-CtD5-BOtq', 'e7f145bb-f78f-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('e7f145bb-f78f-11e3-8c8a-005056be1f7b-B8Vr-FtcS-AU7d-HRta-Cn7A-BXM7', 'e7f145bb-f78f-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('e7f145bb-f78f-11e3-8c8a-005056be1f7b-Bbfw-FITe-ACDi-H7RR-Cn9K-BOpH', 'e7f145bb-f78f-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('e7f145bb-f78f-11e3-8c8a-005056be1f7b-BMku-FP69-AyiT-Hu8d-CIi5-BdQ1', 'e7f145bb-f78f-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'голубой', ''),
('e7f145bb-f78f-11e3-8c8a-005056be1f7b-BMn8-FgNZ-A54v-Hqje-CIAA-B6JT', 'e7f145bb-f78f-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '20000', 'г'),
('e7f145bb-f78f-11e3-8c8a-005056be1f7b-Bq3k-Fr79-A91T-HkcX-CpVw-Bqsc', 'e7f145bb-f78f-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('e7f145bb-f78f-11e3-8c8a-005056be1f7b-BWBe-Fpvc-AJ5A-HDXR-C5Vm-BlEE', 'e7f145bb-f78f-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('e8976171-93af-11e3-82a4-005056be1f7b-B3Gg-FUJh-AiIy-Hzoo-CtGe-BTa3', 'e8976171-93af-11e3-82a4-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('e8976171-93af-11e3-82a4-005056be1f7b-BbSZ-FVNH-A2hD-HkAq-CE3w-BkN7', 'e8976171-93af-11e3-82a4-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('e8976171-93af-11e3-82a4-005056be1f7b-Bczk-FUXI-A2g4-H5sf-CU6t-Bcnd', 'e8976171-93af-11e3-82a4-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('e8976171-93af-11e3-82a4-005056be1f7b-BfTU-Fi5U-AP9M-HCja-C0rM-BDny', 'e8976171-93af-11e3-82a4-005056be1f7b', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для ржавчины', ''),
('e8976171-93af-11e3-82a4-005056be1f7b-BIwE-F7ls-AkVz-HFoQ-C9Gj-BXcw', 'e8976171-93af-11e3-82a4-005056be1f7b', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '2', 'л'),
('e8976171-93af-11e3-82a4-005056be1f7b-BNNH-Frta-AcDc-HDAN-C9QR-Bg14', 'e8976171-93af-11e3-82a4-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('e8976171-93af-11e3-82a4-005056be1f7b-BQDh-Fjm7-A0r2-Hihh-CIvC-BLma', 'e8976171-93af-11e3-82a4-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'желтый', ''),
('e8976171-93af-11e3-82a4-005056be1f7b-BwOJ-FlUx-A2S5-HaqW-CNMq-Bhvk', 'e8976171-93af-11e3-82a4-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'грунт-эмаль', ''),
('ebcc7a29-f78e-11e3-8c8a-005056be1f7b-B0Fq-Flxk-AqNo-Hntf-CS5P-Btjr', 'ebcc7a29-f78e-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('ebcc7a29-f78e-11e3-8c8a-005056be1f7b-B7zX-FwTS-A3P5-HUr7-CHqB-BySy', 'ebcc7a29-f78e-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('ebcc7a29-f78e-11e3-8c8a-005056be1f7b-BK3F-Fwro-A4we-Hrwm-COmM-BOQc', 'ebcc7a29-f78e-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'светло-зеленый', ''),
('ebcc7a29-f78e-11e3-8c8a-005056be1f7b-BKub-FobN-AQqz-Hd5F-C6lc-BbBx', 'ebcc7a29-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('ebcc7a29-f78e-11e3-8c8a-005056be1f7b-BLPn-FGkU-ACsB-HEgU-C35T-B687', 'ebcc7a29-f78e-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '6000', 'г'),
('ebcc7a29-f78e-11e3-8c8a-005056be1f7b-BrWg-FaUh-AE4l-Hr4E-CaE8-Bg1o', 'ebcc7a29-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('ebcc7a29-f78e-11e3-8c8a-005056be1f7b-BY0C-FCnw-Ah6q-HxoP-CflF-B4XY', 'ebcc7a29-f78e-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('efa9ef8e-f78d-11e3-8c8a-005056be1f7b-BAqv-Fpio-ANAl-HkBk-CLka-BfCD', 'efa9ef8e-f78d-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1900', 'г'),
('efa9ef8e-f78d-11e3-8c8a-005056be1f7b-BEyh-FBOi-A3s3-HwtV-CdYy-BB3N', 'efa9ef8e-f78d-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('efa9ef8e-f78d-11e3-8c8a-005056be1f7b-Bj1T-FbnD-AxGb-HlHU-Czv0-Boyq', 'efa9ef8e-f78d-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('efa9ef8e-f78d-11e3-8c8a-005056be1f7b-Boci-FeZm-AxlY-HAgz-CYU9-Bx2l', 'efa9ef8e-f78d-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('efa9ef8e-f78d-11e3-8c8a-005056be1f7b-Bopz-FCqV-A3Fp-H24h-Cc8W-BA9l', 'efa9ef8e-f78d-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('efa9ef8e-f78d-11e3-8c8a-005056be1f7b-BTCg-FIwn-A021-H8ES-CLvN-B5bY', 'efa9ef8e-f78d-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'вишневый', ''),
('efa9ef8e-f78d-11e3-8c8a-005056be1f7b-ByIZ-FhnQ-A777-HaA2-CeU4-BAdq', 'efa9ef8e-f78d-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('f0ad1dd1-1f91-11e4-9591-005056be1f7b-B0Ox-Frvk-ALwr-HcMA-CDex-BV1j', 'f0ad1dd1-1f91-11e4-9591-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('f0ad1dd1-1f91-11e4-9591-005056be1f7b-BeKR-Fy3I-Ah20-Hgoh-CQBS-BxFf', 'f0ad1dd1-1f91-11e4-9591-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('f0ad1dd1-1f91-11e4-9591-005056be1f7b-BgJv-FuBX-Aycn-H39u-CTc5-BlRx', 'f0ad1dd1-1f91-11e4-9591-005056be1f7b', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '10', 'л'),
('f0ad1dd1-1f91-11e4-9591-005056be1f7b-Bn0D-F2W0-AD1T-Hr2t-C029-Bwiu', 'f0ad1dd1-1f91-11e4-9591-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('f0ad1dd1-1f91-11e4-9591-005056be1f7b-BNeD-F2XB-Alre-HgSv-CTCk-B8v6', 'f0ad1dd1-1f91-11e4-9591-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'грунт-эмаль', ''),
('f0ad1dd1-1f91-11e4-9591-005056be1f7b-BSwR-FVwS-AJeO-HW6M-CdUn-BAZR', 'f0ad1dd1-1f91-11e4-9591-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'желтый', ''),
('f0ad1dd1-1f91-11e4-9591-005056be1f7b-Btyo-FtVS-ARlT-HjZZ-CE6i-B1pk', 'f0ad1dd1-1f91-11e4-9591-005056be1f7b', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для ржавчины', ''),
('f0ad1dd1-1f91-11e4-9591-005056be1f7b-BXug-FENt-AEQO-H2lE-CbPE-BfHa', 'f0ad1dd1-1f91-11e4-9591-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('f1be6b3a-f081-11df-a0c5-000e0c431b58-B7cP-FLfK-AO45-Hdzf-CBrf-B4rO', 'f1be6b3a-f081-11df-a0c5-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'сиреневый', ''),
('f1be6b3a-f081-11df-a0c5-000e0c431b58-B9by-FFSB-AbB4-Hqff-Cywh-BaxJ', 'f1be6b3a-f081-11df-a0c5-000e0c431b58', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1000', 'г'),
('f1be6b3a-f081-11df-a0c5-000e0c431b58-BBWj-F61Z-Ab3G-H7vy-CLWq-BVO3', 'f1be6b3a-f081-11df-a0c5-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('f1be6b3a-f081-11df-a0c5-000e0c431b58-Bk2J-F3MU-Ap2D-H9Br-Cl8J-B1Ip', 'f1be6b3a-f081-11df-a0c5-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('f1be6b3a-f081-11df-a0c5-000e0c431b58-BOs9-FVpu-AK2G-H1MV-Ct3P-BelH', 'f1be6b3a-f081-11df-a0c5-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('f1be6b3a-f081-11df-a0c5-000e0c431b58-Bp5u-Ft3w-Aadu-HkU3-CQVP-BzRG', 'f1be6b3a-f081-11df-a0c5-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('f1be6b3a-f081-11df-a0c5-000e0c431b58-BQCl-FAm6-A43R-HJrj-CP7R-BOR8', 'f1be6b3a-f081-11df-a0c5-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('f1be6b3c-f081-11df-a0c5-000e0c431b58-B2EK-F7RT-AbMv-Hv1X-Cnup-BzrL', 'f1be6b3c-f081-11df-a0c5-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('f1be6b3c-f081-11df-a0c5-000e0c431b58-B5SM-F7f9-Av3F-HRR1-Cmby-BEQQ', 'f1be6b3c-f081-11df-a0c5-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('f1be6b3c-f081-11df-a0c5-000e0c431b58-BJ8b-Fzbw-Ax4F-HNJe-C5bU-Bom2', 'f1be6b3c-f081-11df-a0c5-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('f1be6b3c-f081-11df-a0c5-000e0c431b58-BRzt-FKgP-AqVC-HNvz-CWHf-BZvV', 'f1be6b3c-f081-11df-a0c5-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('f1be6b3c-f081-11df-a0c5-000e0c431b58-BTrk-FEdb-AcGM-HI64-CTtW-BXnF', 'f1be6b3c-f081-11df-a0c5-000e0c431b58', '1d08380b-ce34-11e4-a80e-005056be1f7a', '2000', 'г'),
('f1be6b3c-f081-11df-a0c5-000e0c431b58-BVqC-Fn1u-AMGq-HeU8-CbTZ-BQYr', 'f1be6b3c-f081-11df-a0c5-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'сиреневый', ''),
('f1be6b3c-f081-11df-a0c5-000e0c431b58-BxcE-F4tW-AuWx-HjbD-CzSH-B0PY', 'f1be6b3c-f081-11df-a0c5-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('f31a0079-f78e-11e3-8c8a-005056be1f7b-B16t-FZ1j-AcEq-HDAV-C3v0-BNlG', 'f31a0079-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('f31a0079-f78e-11e3-8c8a-005056be1f7b-BAOg-FqSg-ACKS-HCX4-CIw6-BAbh', 'f31a0079-f78e-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('f31a0079-f78e-11e3-8c8a-005056be1f7b-BhkX-F1rf-A6Pm-HPUb-C26S-BnzM', 'f31a0079-f78e-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '6000', 'г'),
('f31a0079-f78e-11e3-8c8a-005056be1f7b-Bl2w-F44K-AwC7-HsCY-CQPq-BnFq', 'f31a0079-f78e-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('f31a0079-f78e-11e3-8c8a-005056be1f7b-BNRX-FzA5-AfrS-HGHF-CiHT-BEym', 'f31a0079-f78e-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('f31a0079-f78e-11e3-8c8a-005056be1f7b-BunV-FzHK-AauR-HkVK-CMZ4-BsD9', 'f31a0079-f78e-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'синий', ''),
('f31a0079-f78e-11e3-8c8a-005056be1f7b-BYC2-FpmN-Azzm-Hshp-CrXl-Bawb', 'f31a0079-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('f33aec8f-f78f-11e3-8c8a-005056be1f7b-B4Zc-FHn9-Afzd-HuXf-CGrD-BWpO', 'f33aec8f-f78f-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('f33aec8f-f78f-11e3-8c8a-005056be1f7b-B92W-FhFx-Ag6m-HmdW-C394-Bf06', 'f33aec8f-f78f-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'шоколадный', ''),
('f33aec8f-f78f-11e3-8c8a-005056be1f7b-BeIt-FJcC-AMJN-HOgX-CLeP-BhCV', 'f33aec8f-f78f-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('f33aec8f-f78f-11e3-8c8a-005056be1f7b-BfUK-FZqU-AfVY-HBdj-CLkP-BKKp', 'f33aec8f-f78f-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '20000', 'г'),
('f33aec8f-f78f-11e3-8c8a-005056be1f7b-BG9R-FyL1-AfS4-HWJG-CpDf-BHKJ', 'f33aec8f-f78f-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('f33aec8f-f78f-11e3-8c8a-005056be1f7b-BGq9-FkaV-AGgD-HK4s-CY0r-Bpy3', 'f33aec8f-f78f-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('f33aec8f-f78f-11e3-8c8a-005056be1f7b-BUiQ-F8Kt-ATDr-HMir-CHD1-B2MT', 'f33aec8f-f78f-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('f5ec168e-f78d-11e3-8c8a-005056be1f7b-B1GX-FutN-AI6Y-HBpJ-C2DS-BtYD', 'f5ec168e-f78d-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('f5ec168e-f78d-11e3-8c8a-005056be1f7b-B4mf-FMUw-ATi3-HhIu-Cf7u-BYIv', 'f5ec168e-f78d-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('f5ec168e-f78d-11e3-8c8a-005056be1f7b-B7eo-FhIQ-Ahzj-Hqf6-CWYi-B3k4', 'f5ec168e-f78d-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '1900', 'г'),
('f5ec168e-f78d-11e3-8c8a-005056be1f7b-BrI9-FChN-AQzS-HsQH-CNGN-Bk28', 'f5ec168e-f78d-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('f5ec168e-f78d-11e3-8c8a-005056be1f7b-BxA4-FMBi-AV3l-HnmA-CrTI-BpWq', 'f5ec168e-f78d-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('f5ec168e-f78d-11e3-8c8a-005056be1f7b-BXI3-FVv8-At5V-HZPN-CRFb-Bayf', 'f5ec168e-f78d-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('f5ec168e-f78d-11e3-8c8a-005056be1f7b-BzNI-FtDZ-AR35-HnzY-CML3-Btv1', 'f5ec168e-f78d-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'красный', ''),
('fae440c6-c6f8-11e0-b25c-000e0c431b58-B9IJ-FxUE-A6jD-HSfj-Cuja-Bv51', 'fae440c6-c6f8-11e0-b25c-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'антисептический состав', ''),
('fae440c6-c6f8-11e0-b25c-000e0c431b58-BdmB-Fgkg-A7qz-Hp2T-C41b-BDnw', 'fae440c6-c6f8-11e0-b25c-000e0c431b58', '1d08380b-ce34-11e4-a80e-005056be1f7a', '5000', 'г'),
('fae440c6-c6f8-11e0-b25c-000e0c431b58-BDPr-FhDI-AUjR-HkqV-CuUQ-BTXI', 'fae440c6-c6f8-11e0-b25c-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ZELEST', ''),
('fae440c6-c6f8-11e0-b25c-000e0c431b58-BE1B-FVas-ArLC-H9fa-CGSs-BKeO', 'fae440c6-c6f8-11e0-b25c-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для дерева', ''),
('fae440c6-c6f8-11e0-b25c-000e0c431b58-BHiV-FK21-AulZ-HKXU-CA17-BCXh', 'fae440c6-c6f8-11e0-b25c-000e0c431b58', 'd17cb785-d20b-11e4-9be0-005056be1f7c', 'защита от насекомых древоточцев', ''),
('fae440c6-c6f8-11e0-b25c-000e0c431b58-BjTN-FZ9F-As36-HK6i-C7DH-BRO9', 'fae440c6-c6f8-11e0-b25c-000e0c431b58', 'd17cb785-d20b-11e4-9be0-005056be1f7c', 'защита от биопоражений', ''),
('fae440c6-c6f8-11e0-b25c-000e0c431b58-Bn6j-FC2d-A56Y-HNvc-CY0g-BAUD', 'fae440c6-c6f8-11e0-b25c-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'трудновымываемый', ''),
('fae440c6-c6f8-11e0-b25c-000e0c431b58-BOEl-FUgD-A6nd-Hybx-CgIP-BHEK', 'fae440c6-c6f8-11e0-b25c-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fae440c6-c6f8-11e0-b25c-000e0c431b58-Brcl-F65g-A1ZY-H743-CD6T-BzEK', 'fae440c6-c6f8-11e0-b25c-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fae440c6-c6f8-11e0-b25c-000e0c431b58-BxSD-FLgy-Ao5y-HL5I-CO9X-B6gb', 'fae440c6-c6f8-11e0-b25c-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fae440c8-c6f8-11e0-b25c-000e0c431b58-B9Ip-FRvl-AdbB-HrLT-CNRC-BPKy', 'fae440c8-c6f8-11e0-b25c-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'антисептический состав', ''),
('fae440c8-c6f8-11e0-b25c-000e0c431b58-BeBD-F1RW-Acgx-HBWv-CuKn-BnxT', 'fae440c8-c6f8-11e0-b25c-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ZELEST', ''),
('fae440c8-c6f8-11e0-b25c-000e0c431b58-BFtC-F3vZ-Aogj-HRJW-Cl39-B9d5', 'fae440c8-c6f8-11e0-b25c-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для дерева', ''),
('fae440c8-c6f8-11e0-b25c-000e0c431b58-BI9k-FhI9-A3Jy-HzML-CWwf-BkLe', 'fae440c8-c6f8-11e0-b25c-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fae440c8-c6f8-11e0-b25c-000e0c431b58-BoyU-FOGe-AlsW-Hkqz-Cep9-BK7u', 'fae440c8-c6f8-11e0-b25c-000e0c431b58', '1d08380b-ce34-11e4-a80e-005056be1f7a', '10000', 'г'),
('fae440c8-c6f8-11e0-b25c-000e0c431b58-Bp5W-FkES-AIAW-HPSl-COaj-Bz9s', 'fae440c8-c6f8-11e0-b25c-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fae440c8-c6f8-11e0-b25c-000e0c431b58-BslW-Fl7A-ApuS-Hn7L-CqaN-BtRf', 'fae440c8-c6f8-11e0-b25c-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fae440c8-c6f8-11e0-b25c-000e0c431b58-BvZM-FxHX-AHUp-HJjz-C9On-BSdu', 'fae440c8-c6f8-11e0-b25c-000e0c431b58', 'd17cb785-d20b-11e4-9be0-005056be1f7c', 'защита от насекомых древоточцев', ''),
('fae440c8-c6f8-11e0-b25c-000e0c431b58-BwEc-FJoJ-A0Jy-H8Tv-CsFL-B53S', 'fae440c8-c6f8-11e0-b25c-000e0c431b58', 'd17cb785-d20b-11e4-9be0-005056be1f7c', 'защита от биопоражений', ''),
('fae440c8-c6f8-11e0-b25c-000e0c431b58-Bx23-FmqF-AyD3-HUnE-CyS9-BL4C', 'fae440c8-c6f8-11e0-b25c-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'трудновымываемый', ''),
('fbb89466-93af-11e3-82a4-005056be1f7b-BJry-FgjH-Actj-HunZ-CSPE-BNv6', 'fbb89466-93af-11e3-82a4-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'грунт-эмаль', ''),
('fbb89466-93af-11e3-82a4-005056be1f7b-BJWu-FXQr-A1X5-HK1U-CnnQ-BowL', 'fbb89466-93af-11e3-82a4-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fbb89466-93af-11e3-82a4-005056be1f7b-Blp6-Fg1v-A1dY-HHIL-CT4C-BUkR', 'fbb89466-93af-11e3-82a4-005056be1f7b', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для ржавчины', ''),
('fbb89466-93af-11e3-82a4-005056be1f7b-BQ2W-FMHT-AhiW-H9G6-C5yS-B9f4', 'fbb89466-93af-11e3-82a4-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fbb89466-93af-11e3-82a4-005056be1f7b-BsWD-Frlv-AxlR-HR2w-C22G-BgOM', 'fbb89466-93af-11e3-82a4-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'красный', ''),
('fbb89466-93af-11e3-82a4-005056be1f7b-BuSf-FBjW-AxbO-H58c-CGNU-BdZc', 'fbb89466-93af-11e3-82a4-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fbb89466-93af-11e3-82a4-005056be1f7b-Bv2B-FqPz-AHgW-H2S6-CKcR-B5zi', 'fbb89466-93af-11e3-82a4-005056be1f7b', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.75', 'л'),
('fbb89466-93af-11e3-82a4-005056be1f7b-Bw7B-FJ6H-AFz6-HXxa-CRht-BwiT', 'fbb89466-93af-11e3-82a4-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('fc75df8c-f786-11e3-8c8a-005056be1f7b-B178-FXZI-Auwg-Hsrg-CeLA-BzbZ', 'fc75df8c-f786-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fc75df8c-f786-11e3-8c8a-005056be1f7b-B2EY-F5YM-ANt0-HOK6-C4B3-B1ZR', 'fc75df8c-f786-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('fc75df8c-f786-11e3-8c8a-005056be1f7b-B9JE-Ff3w-ACX9-HCNZ-CcFe-B1A3', 'fc75df8c-f786-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '800', 'г'),
('fc75df8c-f786-11e3-8c8a-005056be1f7b-B9rG-FIoY-AARh-HdLW-CWY9-B60v', 'fc75df8c-f786-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fc75df8c-f786-11e3-8c8a-005056be1f7b-BeeV-FPZB-An9D-HTyS-CVwA-Bb6p', 'fc75df8c-f786-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('fc75df8c-f786-11e3-8c8a-005056be1f7b-BNlj-Fkxi-Aejv-H6qY-CjCp-B1PB', 'fc75df8c-f786-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fd393098-f78f-11e3-8c8a-005056be1f7b-B2Dd-FdLD-ATUU-HrEb-CTPe-BA9c', 'fd393098-f78f-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '20000', 'г'),
('fd393098-f78f-11e3-8c8a-005056be1f7b-BcvX-F5J4-AvpN-HQgT-CNJ3-BTNC', 'fd393098-f78f-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fd393098-f78f-11e3-8c8a-005056be1f7b-BKDq-Ft9T-AFYZ-HMMZ-Cc4L-BYyN', 'fd393098-f78f-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('fd393098-f78f-11e3-8c8a-005056be1f7b-BmjG-FEJX-AThI-Hr1H-CzI9-Biwf', 'fd393098-f78f-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fd393098-f78f-11e3-8c8a-005056be1f7b-Bqhk-FzOa-A7Ei-H6mV-CaFH-BxAQ', 'fd393098-f78f-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('fd393098-f78f-11e3-8c8a-005056be1f7b-BR2s-Fog5-A93c-HXg1-CgUf-B2F7', 'fd393098-f78f-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'розово-бежевый', ''),
('fd393098-f78f-11e3-8c8a-005056be1f7b-Brv7-F6Cc-AOQm-HHj1-CJQX-BtGm', 'fd393098-f78f-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fdf8cbf6-f78e-11e3-8c8a-005056be1f7b-B3P7-FBtA-A0zS-Hl1R-CmeV-B4Kj', 'fdf8cbf6-f78e-11e3-8c8a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ИМПУЛЬС', ''),
('fdf8cbf6-f78e-11e3-8c8a-005056be1f7b-B8cz-FGHX-AwDE-H0Dz-Ck6F-Bh8y', 'fdf8cbf6-f78e-11e3-8c8a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fdf8cbf6-f78e-11e3-8c8a-005056be1f7b-Bi7n-F1ie-AHK9-HdDJ-CCBm-B3It', 'fdf8cbf6-f78e-11e3-8c8a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('fdf8cbf6-f78e-11e3-8c8a-005056be1f7b-BIhE-FEY3-AeVJ-HdD8-CFRm-BB0A', 'fdf8cbf6-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fdf8cbf6-f78e-11e3-8c8a-005056be1f7b-BNo6-FsXn-ADQB-HKxl-CBEY-BRgQ', 'fdf8cbf6-f78e-11e3-8c8a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'голубой', ''),
('fdf8cbf6-f78e-11e3-8c8a-005056be1f7b-BoDQ-FpOE-ARQI-Hphp-C6qM-B0ul', 'fdf8cbf6-f78e-11e3-8c8a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fdf8cbf6-f78e-11e3-8c8a-005056be1f7b-BQ5x-FU41-AKev-HPBt-CEjp-BrZN', 'fdf8cbf6-f78e-11e3-8c8a-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '6000', 'г'),
('fea6c165-5ab6-11dc-be42-000e0c431b58-B1ze-F6Yg-AtVO-Hus9-Ctwu-Bmbr', 'fea6c165-5ab6-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fea6c165-5ab6-11dc-be42-000e0c431b58-BDw3-Fp7r-AP02-HBwV-CLYi-Bx3L', 'fea6c165-5ab6-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('fea6c165-5ab6-11dc-be42-000e0c431b58-BlMm-FenC-A7SE-HjCy-C7rA-BXu0', 'fea6c165-5ab6-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсальное', ''),
('fea6c165-5ab6-11dc-be42-000e0c431b58-BmKE-Fru5-AcDY-HvP0-C66I-B693', 'fea6c165-5ab6-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'хаки', ''),
('fea6c165-5ab6-11dc-be42-000e0c431b58-BoMa-FD9q-AC4l-HKyk-CDJw-BwdJ', 'fea6c165-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fea6c165-5ab6-11dc-be42-000e0c431b58-BSNV-Fg8D-Aerz-HPUR-C8o8-Bp1p', 'fea6c165-5ab6-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('fea6c165-5ab6-11dc-be42-000e0c431b58-BUqr-FLse-Ah43-HFrv-CQik-Bvd0', 'fea6c165-5ab6-11dc-be42-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.52', 'л'),
('fea6c165-5ab6-11dc-be42-000e0c431b58-BVLt-FTXz-Atd3-HaZc-CpBm-ButX', 'fea6c165-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fea6c167-5ab6-11dc-be42-000e0c431b58-B9CR-F7TA-Ahmz-Hb5X-CCpW-ByXY', 'fea6c167-5ab6-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('fea6c167-5ab6-11dc-be42-000e0c431b58-BES0-Ftqd-AbL7-HCAQ-CmLX-Bi9q', 'fea6c167-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fea6c167-5ab6-11dc-be42-000e0c431b58-BGW9-FTH8-Abo6-Hnc1-CJRS-BR6M', 'fea6c167-5ab6-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('fea6c167-5ab6-11dc-be42-000e0c431b58-BkWD-FhtP-AdwM-Hu0I-Ch9L-By5f', 'fea6c167-5ab6-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fea6c167-5ab6-11dc-be42-000e0c431b58-BLH6-FwTL-AXbP-HInG-CAKK-BOnB', 'fea6c167-5ab6-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'светло-зеленый', ''),
('fea6c167-5ab6-11dc-be42-000e0c431b58-BtWI-F0ew-AGe8-HRtl-CSy5-BRik', 'fea6c167-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fea6c167-5ab6-11dc-be42-000e0c431b58-Bv0v-FsBv-A9o8-HWM6-CD7R-BM7w', 'fea6c167-5ab6-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсальное', ''),
('fea6c167-5ab6-11dc-be42-000e0c431b58-BycH-Fo4C-AB7r-HYvF-CxVc-B13L', 'fea6c167-5ab6-11dc-be42-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.52', 'л'),
('fea6c169-5ab6-11dc-be42-000e0c431b58-B173-Fceu-A5Zk-HCV0-CYK0-BP81', 'fea6c169-5ab6-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсальное', ''),
('fea6c169-5ab6-11dc-be42-000e0c431b58-B9q0-FiN4-Ale8-H1MG-CWIY-Buab', 'fea6c169-5ab6-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'темно-зеленый', ''),
('fea6c169-5ab6-11dc-be42-000e0c431b58-BAi0-FFUt-AyOT-HcBW-CljT-BKqT', 'fea6c169-5ab6-11dc-be42-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.52', 'л'),
('fea6c169-5ab6-11dc-be42-000e0c431b58-BEys-FJ6X-AM4V-HG4x-CK5V-BK0q', 'fea6c169-5ab6-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('fea6c169-5ab6-11dc-be42-000e0c431b58-Bh8i-FHA5-AHZE-HHoC-C885-BAcE', 'fea6c169-5ab6-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fea6c169-5ab6-11dc-be42-000e0c431b58-BICE-FieB-ASsl-Hi2c-C61I-B6YW', 'fea6c169-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fea6c169-5ab6-11dc-be42-000e0c431b58-BS2C-FeK0-AG5E-Hvts-C5ko-BxCI', 'fea6c169-5ab6-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('fea6c169-5ab6-11dc-be42-000e0c431b58-BzA1-Fw1C-A4ML-HS7m-CuFo-BynJ', 'fea6c169-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fea6c16b-5ab6-11dc-be42-000e0c431b58-B4x6-FMQ8-Aj2g-H3CM-CLGB-B5Q7', 'fea6c16b-5ab6-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'фисташковый', ''),
('fea6c16b-5ab6-11dc-be42-000e0c431b58-B8R1-Fgip-AkzF-Hkzv-CSeS-BMkJ', 'fea6c16b-5ab6-11dc-be42-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.52', 'л'),
('fea6c16b-5ab6-11dc-be42-000e0c431b58-BJzJ-F25s-A17j-HRyE-CQa0-BAps', 'fea6c16b-5ab6-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('fea6c16b-5ab6-11dc-be42-000e0c431b58-Bl6t-FPsn-A3Lb-HTjc-C05C-Bive', 'fea6c16b-5ab6-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсальное', ''),
('fea6c16b-5ab6-11dc-be42-000e0c431b58-Boh4-FG1d-Ai1X-HlZJ-CGj0-BPa4', 'fea6c16b-5ab6-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fea6c16b-5ab6-11dc-be42-000e0c431b58-BpJA-FDuZ-AM19-HLFZ-CFDq-B7jP', 'fea6c16b-5ab6-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('fea6c16b-5ab6-11dc-be42-000e0c431b58-BScz-Fnit-Aatn-Hw5n-Ccxa-BXAq', 'fea6c16b-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fea6c16b-5ab6-11dc-be42-000e0c431b58-BUji-F2cl-AEos-HFi9-CB2a-B2e0', 'fea6c16b-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fea6c16d-5ab6-11dc-be42-000e0c431b58-B1u5-F3Bf-AIMJ-HlP9-CeRl-BBLu', 'fea6c16d-5ab6-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('fea6c16d-5ab6-11dc-be42-000e0c431b58-B6e4-FgeU-AbrK-HgIQ-CG0B-BA3D', 'fea6c16d-5ab6-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fea6c16d-5ab6-11dc-be42-000e0c431b58-BBmh-F5J5-ASIl-HAa5-CN1F-BaGj', 'fea6c16d-5ab6-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсальное', ''),
('fea6c16d-5ab6-11dc-be42-000e0c431b58-BCN3-FLY9-Axp3-HgWY-C0rr-BRSM', 'fea6c16d-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fea6c16d-5ab6-11dc-be42-000e0c431b58-BgAP-Fpmf-AoGw-HPH8-CACc-B4j7', 'fea6c16d-5ab6-11dc-be42-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.52', 'л'),
('fea6c16d-5ab6-11dc-be42-000e0c431b58-BNAo-FXhx-Aoox-Hpop-CtLp-B02S', 'fea6c16d-5ab6-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('fea6c16d-5ab6-11dc-be42-000e0c431b58-BUTR-FleI-A3B1-HSMX-C1ln-BQO4', 'fea6c16d-5ab6-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'бежевый', ''),
('fea6c16d-5ab6-11dc-be42-000e0c431b58-BZLN-FQda-AnUB-HRlP-CKnd-BDz3', 'fea6c16d-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fea6c16f-5ab6-11dc-be42-000e0c431b58-B0OA-FqDy-AXmj-HpUw-CN3Y-BiNg', 'fea6c16f-5ab6-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'голубой', ''),
('fea6c16f-5ab6-11dc-be42-000e0c431b58-B13L-FK9H-AlY5-H7ca-CxoY-Bgfx', 'fea6c16f-5ab6-11dc-be42-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.52', 'л'),
('fea6c16f-5ab6-11dc-be42-000e0c431b58-B14n-FtgI-Ac2o-HZLz-CbVY-BEDm', 'fea6c16f-5ab6-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсальное', ''),
('fea6c16f-5ab6-11dc-be42-000e0c431b58-BaMn-FqQh-A08f-H1tY-CKkR-BVuP', 'fea6c16f-5ab6-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('fea6c16f-5ab6-11dc-be42-000e0c431b58-BDiE-F5cF-A03T-HF6b-CawU-BDg2', 'fea6c16f-5ab6-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('fea6c16f-5ab6-11dc-be42-000e0c431b58-BJin-FsO9-Afb2-H4AF-CaOF-BDHU', 'fea6c16f-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fea6c16f-5ab6-11dc-be42-000e0c431b58-BM9s-F1Y5-AqzP-HE5S-Cr92-Bv3T', 'fea6c16f-5ab6-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fea6c16f-5ab6-11dc-be42-000e0c431b58-BNAn-F4Px-AvT3-Hnfs-CUf8-BULB', 'fea6c16f-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fea6c171-5ab6-11dc-be42-000e0c431b58-B0cG-FUqE-AUko-H3AO-CsNS-B5YO', 'fea6c171-5ab6-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('fea6c171-5ab6-11dc-be42-000e0c431b58-B4se-FUAa-Almq-HJeF-CUeh-BayN', 'fea6c171-5ab6-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fea6c171-5ab6-11dc-be42-000e0c431b58-BeIy-FJBy-AXtC-Hqna-C5hJ-BY3J', 'fea6c171-5ab6-11dc-be42-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.52', 'л'),
('fea6c171-5ab6-11dc-be42-000e0c431b58-Bmie-F9Ry-AeW8-H2xJ-CUb9-Bp1T', 'fea6c171-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fea6c171-5ab6-11dc-be42-000e0c431b58-BNEM-FK60-ATQa-HS7R-ClPi-B3YK', 'fea6c171-5ab6-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсальное', ''),
('fea6c171-5ab6-11dc-be42-000e0c431b58-BnzU-FZUo-Aa7y-HV16-CTOK-BCnq', 'fea6c171-5ab6-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'синий', ''),
('fea6c171-5ab6-11dc-be42-000e0c431b58-BTQQ-FImH-AD6V-HO90-C5ki-BZjz', 'fea6c171-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fea6c171-5ab6-11dc-be42-000e0c431b58-Bzdw-FgnR-Al9v-HIYk-CW4t-BLCu', 'fea6c171-5ab6-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('fea6c173-5ab6-11dc-be42-000e0c431b58-B1E8-FrvG-AeUN-HnKU-CqE1-BVUS', 'fea6c173-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fea6c173-5ab6-11dc-be42-000e0c431b58-B2bh-FxJv-AEJw-HORc-CuO6-B18N', 'fea6c173-5ab6-11dc-be42-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.52', 'л'),
('fea6c173-5ab6-11dc-be42-000e0c431b58-B4fp-FQcc-Ajz2-HbpG-CQ8D-B3va', 'fea6c173-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fea6c173-5ab6-11dc-be42-000e0c431b58-B7cG-FsSk-AQh6-H4u9-CQEf-B9kq', 'fea6c173-5ab6-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fea6c173-5ab6-11dc-be42-000e0c431b58-BbNv-FXHf-AWXj-H3WK-CjNm-BHBv', 'fea6c173-5ab6-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('fea6c173-5ab6-11dc-be42-000e0c431b58-BS7m-FxW8-ATh1-HqJx-CjGI-B1HC', 'fea6c173-5ab6-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'коричневый', ''),
('fea6c173-5ab6-11dc-be42-000e0c431b58-BThr-FgK3-A127-HrNQ-CABK-BIqf', 'fea6c173-5ab6-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('fea6c173-5ab6-11dc-be42-000e0c431b58-By4I-FpUy-Awlw-Hzeh-CPVm-BMCX', 'fea6c173-5ab6-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсальное', ''),
('fea6c175-5ab6-11dc-be42-000e0c431b58-B7tY-FMm0-AMPv-H7kO-CQXw-BUMq', 'fea6c175-5ab6-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('fea6c175-5ab6-11dc-be42-000e0c431b58-B9FX-FMg1-AuXQ-HCm3-C73q-BF3a', 'fea6c175-5ab6-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('fea6c175-5ab6-11dc-be42-000e0c431b58-BdWo-FXSG-AxGv-HMnQ-CAEd-Bnuu', 'fea6c175-5ab6-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'желтый', ''),
('fea6c175-5ab6-11dc-be42-000e0c431b58-BfxO-FQhC-A8tN-Hadi-C2ZR-BPl4', 'fea6c175-5ab6-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fea6c175-5ab6-11dc-be42-000e0c431b58-BKts-Fqkb-AFuB-HWGw-CmjI-BQ8b', 'fea6c175-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fea6c175-5ab6-11dc-be42-000e0c431b58-BPyJ-FAut-AOAH-HBVT-Cr2G-B7Ho', 'fea6c175-5ab6-11dc-be42-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.52', 'л'),
('fea6c175-5ab6-11dc-be42-000e0c431b58-BwhE-Fy5K-Alhu-Htyr-CLLc-BuUa', 'fea6c175-5ab6-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсальное', ''),
('fea6c175-5ab6-11dc-be42-000e0c431b58-BXvi-FI8L-AZ8P-H3lA-Cnwt-BVcU', 'fea6c175-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fea6c177-5ab6-11dc-be42-000e0c431b58-B0xV-Fbqx-ASJ8-HC2u-CQRB-BJpF', 'fea6c177-5ab6-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('fea6c177-5ab6-11dc-be42-000e0c431b58-B97G-FBEP-AVYY-HCDy-CpDm-BBfS', 'fea6c177-5ab6-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fea6c177-5ab6-11dc-be42-000e0c431b58-BAmr-FZou-ANUy-H1VT-CILH-Bk98', 'fea6c177-5ab6-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('fea6c177-5ab6-11dc-be42-000e0c431b58-BBXU-FQ7U-AYsb-H3c2-CdJt-BsxO', 'fea6c177-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fea6c177-5ab6-11dc-be42-000e0c431b58-Br2P-Fnfr-Ado9-Hw64-C9O1-BHQL', 'fea6c177-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fea6c177-5ab6-11dc-be42-000e0c431b58-BT7I-FBV4-AHJP-Hj0H-CvGe-BtZl', 'fea6c177-5ab6-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'светло-серый', ''),
('fea6c177-5ab6-11dc-be42-000e0c431b58-BZR4-FXDy-ARBD-HIIT-CTJq-BoZn', 'fea6c177-5ab6-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсальное', ''),
('fea6c177-5ab6-11dc-be42-000e0c431b58-Bzxb-Fx1T-AhGk-HjQQ-CpPN-BvRS', 'fea6c177-5ab6-11dc-be42-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.52', 'л'),
('fea6c179-5ab6-11dc-be42-000e0c431b58-B24R-F6Cd-AIvB-HQ1f-CSwx-BeJW', 'fea6c179-5ab6-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fea6c179-5ab6-11dc-be42-000e0c431b58-B5gE-FfGV-Avvk-H9g2-CQhd-B87I', 'fea6c179-5ab6-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'серый', ''),
('fea6c179-5ab6-11dc-be42-000e0c431b58-B7RM-FWjU-As9M-HO2l-Cvi2-BbPG', 'fea6c179-5ab6-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('fea6c179-5ab6-11dc-be42-000e0c431b58-BrQq-FqOZ-AoLD-HILN-CthI-BEeB', 'fea6c179-5ab6-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсальное', ''),
('fea6c179-5ab6-11dc-be42-000e0c431b58-BsKc-FhAy-A2J0-H9t8-C7oe-BAJk', 'fea6c179-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fea6c179-5ab6-11dc-be42-000e0c431b58-BV5V-F743-AxKZ-HRIW-CZ2g-B3Zg', 'fea6c179-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fea6c179-5ab6-11dc-be42-000e0c431b58-BXPt-FZfj-A6yW-HsTf-CFJX-BaLd', 'fea6c179-5ab6-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('fea6c179-5ab6-11dc-be42-000e0c431b58-Bz2V-FCGN-An2v-HfTB-CmK5-B4G8', 'fea6c179-5ab6-11dc-be42-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.52', 'л'),
('fea6c17b-5ab6-11dc-be42-000e0c431b58-B6Qq-FtEe-AHQv-HhsF-CZ9O-BVsf', 'fea6c17b-5ab6-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('fea6c17b-5ab6-11dc-be42-000e0c431b58-BcAP-FDdy-AzDe-HIfJ-C5rK-BHoZ', 'fea6c17b-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fea6c17b-5ab6-11dc-be42-000e0c431b58-BH9w-FlXL-A6Cf-HfXj-CKMu-BGxd', 'fea6c17b-5ab6-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('fea6c17b-5ab6-11dc-be42-000e0c431b58-BL1v-FUlq-Acax-HxyY-CMQZ-BbT3', 'fea6c17b-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fea6c17b-5ab6-11dc-be42-000e0c431b58-BLAN-F7PD-AMWI-Hu6H-CzGV-BYlY', 'fea6c17b-5ab6-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'оранжевый', ''),
('fea6c17b-5ab6-11dc-be42-000e0c431b58-BPJ6-FuRb-A5LJ-HESx-Cdeo-BOyP', 'fea6c17b-5ab6-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсальное', ''),
('fea6c17b-5ab6-11dc-be42-000e0c431b58-Bxmr-F7qA-AuJe-HZYT-CoUk-BUDo', 'fea6c17b-5ab6-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fea6c17b-5ab6-11dc-be42-000e0c431b58-BzL6-Fksn-AqIm-H5eU-CaR7-BHOn', 'fea6c17b-5ab6-11dc-be42-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.52', 'л'),
('fea6c17d-5ab6-11dc-be42-000e0c431b58-Bd3o-FUrZ-A6jA-HUa7-C3Hv-Bhw9', 'fea6c17d-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fea6c17d-5ab6-11dc-be42-000e0c431b58-Bgqc-FaKA-AcsD-HX6a-CAgs-BMIU', 'fea6c17d-5ab6-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fea6c17d-5ab6-11dc-be42-000e0c431b58-Bjp7-FUXP-Au34-HdiC-CiC6-BMWm', 'fea6c17d-5ab6-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсальное', ''),
('fea6c17d-5ab6-11dc-be42-000e0c431b58-BlSM-Fmmn-Aieu-HUCh-CTlM-BQ6j', 'fea6c17d-5ab6-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('fea6c17d-5ab6-11dc-be42-000e0c431b58-Bqzo-FpMC-A39u-HsTa-Cfns-BpIE', 'fea6c17d-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fea6c17d-5ab6-11dc-be42-000e0c431b58-BUSK-FeWy-Auj1-Hyuk-C3lY-B17i', 'fea6c17d-5ab6-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'бирюзовый', ''),
('fea6c17d-5ab6-11dc-be42-000e0c431b58-BWB0-FZY5-AzZb-Hilj-C4bR-BsBU', 'fea6c17d-5ab6-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('fea6c17d-5ab6-11dc-be42-000e0c431b58-Bzrz-FjC2-AHVd-HTmZ-C3IG-BViQ', 'fea6c17d-5ab6-11dc-be42-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.52', 'л'),
('fea6c17f-5ab6-11dc-be42-000e0c431b58-B0ad-FCGH-AcBp-Hmah-CvPB-Biwp', 'fea6c17f-5ab6-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'сиреневый', ''),
('fea6c17f-5ab6-11dc-be42-000e0c431b58-B7RY-FRDX-Amma-Hb8t-COkP-BJ1X', 'fea6c17f-5ab6-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('fea6c17f-5ab6-11dc-be42-000e0c431b58-BDdv-FP9R-AOHn-Hk5j-Cetr-BRdt', 'fea6c17f-5ab6-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('fea6c17f-5ab6-11dc-be42-000e0c431b58-BJLa-FFRP-AI3U-Hv0V-CjCy-BVSw', 'fea6c17f-5ab6-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fea6c17f-5ab6-11dc-be42-000e0c431b58-Bmg5-FQHz-Azmj-Hh5D-CRDO-BrJf', 'fea6c17f-5ab6-11dc-be42-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.52', 'л'),
('fea6c17f-5ab6-11dc-be42-000e0c431b58-BQjg-F6L7-Ac8M-Hef9-CJVW-Bx74', 'fea6c17f-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fea6c17f-5ab6-11dc-be42-000e0c431b58-ByHx-FtB2-Arq7-HFzC-ClFm-BHAy', 'fea6c17f-5ab6-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсальное', ''),
('fea6c17f-5ab6-11dc-be42-000e0c431b58-BzYn-FkgB-AL45-H5E8-CoEY-BIGf', 'fea6c17f-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fea6c181-5ab6-11dc-be42-000e0c431b58-B04U-F19W-AxVl-HMQl-CIEu-BL13', 'fea6c181-5ab6-11dc-be42-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.52', 'л'),
('fea6c181-5ab6-11dc-be42-000e0c431b58-BhEO-Fd1z-Ao9p-HXdr-Cedl-ByTj', 'fea6c181-5ab6-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('fea6c181-5ab6-11dc-be42-000e0c431b58-BMbh-Fvh4-AIG9-H0Sa-CNkj-BPPV', 'fea6c181-5ab6-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсальное', ''),
('fea6c181-5ab6-11dc-be42-000e0c431b58-BNgX-FNYe-A2N1-HEC8-CXOY-B5A7', 'fea6c181-5ab6-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('fea6c181-5ab6-11dc-be42-000e0c431b58-BPjA-FvEX-AUPj-HFVX-CjF1-BLbO', 'fea6c181-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fea6c181-5ab6-11dc-be42-000e0c431b58-BRIC-Fpv8-ARC0-H2Go-CzVN-BzHS', 'fea6c181-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fea6c181-5ab6-11dc-be42-000e0c431b58-Budm-FWXG-AqxX-Hn6l-CQCk-BDo8', 'fea6c181-5ab6-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'охра', ''),
('fea6c181-5ab6-11dc-be42-000e0c431b58-BxID-FwIV-ANV6-HwlL-CHzs-BfCH', 'fea6c181-5ab6-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fea6c183-5ab6-11dc-be42-000e0c431b58-B8VR-FA5C-AYmW-H7wT-CXZ2-BzPz', 'fea6c183-5ab6-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('fea6c183-5ab6-11dc-be42-000e0c431b58-BC2s-F8A0-A1rf-Ho4V-C3sJ-BXUK', 'fea6c183-5ab6-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсальное', ''),
('fea6c183-5ab6-11dc-be42-000e0c431b58-Bh2b-FDfV-AZYD-HivX-CsTh-BJ8a', 'fea6c183-5ab6-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fea6c183-5ab6-11dc-be42-000e0c431b58-BiKa-Fn3d-AkCN-HaA2-CzCt-BiAt', 'fea6c183-5ab6-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('fea6c183-5ab6-11dc-be42-000e0c431b58-Bnhc-F19c-Arxf-HaVf-CK3W-Bm73', 'fea6c183-5ab6-11dc-be42-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.52', 'л'),
('fea6c183-5ab6-11dc-be42-000e0c431b58-BP5d-FTao-A9Qw-HMqO-CP53-Bw2b', 'fea6c183-5ab6-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'какао', ''),
('fea6c183-5ab6-11dc-be42-000e0c431b58-Bq4y-F5hE-ANU6-HIQ3-Crgx-BLzO', 'fea6c183-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fea6c183-5ab6-11dc-be42-000e0c431b58-Bzxe-FlAL-AzQF-HsC7-CJt1-B8oY', 'fea6c183-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fea6c185-5ab6-11dc-be42-000e0c431b58-B84k-FU4C-A3Yv-HXud-CYOg-B9Yj', 'fea6c185-5ab6-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fea6c185-5ab6-11dc-be42-000e0c431b58-B8om-F7Ni-AwXu-HhPU-CFio-BZxY', 'fea6c185-5ab6-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'красно-коричневый', ''),
('fea6c185-5ab6-11dc-be42-000e0c431b58-BdDk-FJCj-AnaQ-H4XO-C9GJ-BzLz', 'fea6c185-5ab6-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('fea6c185-5ab6-11dc-be42-000e0c431b58-BiCA-Fy6X-AD4e-HMtp-CBrj-BmBd', 'fea6c185-5ab6-11dc-be42-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.52', 'л'),
('fea6c185-5ab6-11dc-be42-000e0c431b58-Bp52-FaSl-A5qz-HboN-CANP-BBCL', 'fea6c185-5ab6-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('fea6c185-5ab6-11dc-be42-000e0c431b58-BP82-FAfH-AUkq-H00e-CXqP-B79F', 'fea6c185-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fea6c185-5ab6-11dc-be42-000e0c431b58-Brvi-FR1x-A8vV-HuQm-CFOR-BrLe', 'fea6c185-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fea6c185-5ab6-11dc-be42-000e0c431b58-Bt62-FFpI-AsvW-H0ch-Cesf-BWsA', 'fea6c185-5ab6-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсальное', ''),
('fea6c187-5ab6-11dc-be42-000e0c431b58-B3Jn-FxHO-At3O-H0VV-CtXL-BGcG', 'fea6c187-5ab6-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fea6c187-5ab6-11dc-be42-000e0c431b58-BaUs-FGdi-AsnC-HFUi-CZGB-B3WX', 'fea6c187-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fea6c187-5ab6-11dc-be42-000e0c431b58-BbO0-FW7z-AJS6-H8k7-CvAQ-BdHt', 'fea6c187-5ab6-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсальное', ''),
('fea6c187-5ab6-11dc-be42-000e0c431b58-BCzX-FE5r-AnUx-HoMK-CCnY-BCAV', 'fea6c187-5ab6-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('fea6c187-5ab6-11dc-be42-000e0c431b58-BQA6-F5AI-AT5q-HJ1m-CJdW-BrgU', 'fea6c187-5ab6-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'алюминий', ''),
('fea6c187-5ab6-11dc-be42-000e0c431b58-Bvcc-FQWj-A2m6-Hszx-CVFx-BRAx', 'fea6c187-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fea6c187-5ab6-11dc-be42-000e0c431b58-ByGa-Fmvn-AwxQ-HL1Q-Cgsa-BKgh', 'fea6c187-5ab6-11dc-be42-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.52', 'л'),
('fea6c187-5ab6-11dc-be42-000e0c431b58-BYPa-FnPv-A00J-HKFm-CQ5s-Brgd', 'fea6c187-5ab6-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('fea6c189-5ab6-11dc-be42-000e0c431b58-B9ja-FsYD-A2c2-H3Kt-Cvp3-B61W', 'fea6c189-5ab6-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('fea6c189-5ab6-11dc-be42-000e0c431b58-BeJK-FLdD-AY5C-H0dR-C13u-Bd81', 'fea6c189-5ab6-11dc-be42-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.52', 'л'),
('fea6c189-5ab6-11dc-be42-000e0c431b58-BFYI-FPPz-APwp-Hm2h-CdOM-BEZO', 'fea6c189-5ab6-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсальное', ''),
('fea6c189-5ab6-11dc-be42-000e0c431b58-BJXj-FBdQ-Awuy-HXfR-CXxf-BsTc', 'fea6c189-5ab6-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'хром', ''),
('fea6c189-5ab6-11dc-be42-000e0c431b58-BK3o-FE1w-ARRq-HT4M-Ca0l-BjO2', 'fea6c189-5ab6-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('fea6c189-5ab6-11dc-be42-000e0c431b58-BWok-FLCG-AdZ4-H9IN-Ca5C-BlgG', 'fea6c189-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fea6c189-5ab6-11dc-be42-000e0c431b58-BwyK-FlEe-A3BJ-H1r0-Cg1X-BF21', 'fea6c189-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fea6c189-5ab6-11dc-be42-000e0c431b58-BYdn-FEGe-Amjt-HynI-CDxB-Bs23', 'fea6c189-5ab6-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fea6c18b-5ab6-11dc-be42-000e0c431b58-B7gF-Fuiq-Ag0g-HBK1-CRui-BOkU', 'fea6c18b-5ab6-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('fea6c18b-5ab6-11dc-be42-000e0c431b58-B9jk-FTyx-AMdt-H5XF-CxUl-B4EJ', 'fea6c18b-5ab6-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fea6c18b-5ab6-11dc-be42-000e0c431b58-Bjr8-F1vt-A9QV-HPM4-Co7r-B5V4', 'fea6c18b-5ab6-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсальное', ''),
('fea6c18b-5ab6-11dc-be42-000e0c431b58-BklI-FGnT-A86E-HfKo-CzIO-BabD', 'fea6c18b-5ab6-11dc-be42-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.52', 'л'),
('fea6c18b-5ab6-11dc-be42-000e0c431b58-BNog-F8i5-ACWO-HnQT-Cx15-B68i', 'fea6c18b-5ab6-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('fea6c18b-5ab6-11dc-be42-000e0c431b58-BOsv-FfuY-AXrQ-HDwI-CelQ-B7iZ', 'fea6c18b-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fea6c18b-5ab6-11dc-be42-000e0c431b58-BtyP-FYLC-AKMy-HCkw-Caze-BLUP', 'fea6c18b-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fea6c18b-5ab6-11dc-be42-000e0c431b58-BzHb-F7Ix-AQ1o-HXww-CBv2-BY9X', 'fea6c18b-5ab6-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'золото', ''),
('fea6c18d-5ab6-11dc-be42-000e0c431b58-BBH6-FoEX-AUu4-H81U-C9B5-BYe3', 'fea6c18d-5ab6-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('fea6c18d-5ab6-11dc-be42-000e0c431b58-BcOD-F8WA-Af9m-H7bp-Cqgm-BGbB', 'fea6c18d-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fea6c18d-5ab6-11dc-be42-000e0c431b58-BE8Z-F5YE-AIZS-HYaU-Cjya-Boqt', 'fea6c18d-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fea6c18d-5ab6-11dc-be42-000e0c431b58-BGg3-F0dt-AUbu-HO1P-CHFi-Bi9E', 'fea6c18d-5ab6-11dc-be42-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.52', 'л'),
('fea6c18d-5ab6-11dc-be42-000e0c431b58-BKja-Fd91-Axio-HOMV-C8pk-BBm8', 'fea6c18d-5ab6-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсальное', ''),
('fea6c18d-5ab6-11dc-be42-000e0c431b58-BLNi-FeDD-AZ1k-Hcjw-CkpS-Bcpv', 'fea6c18d-5ab6-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('fea6c18d-5ab6-11dc-be42-000e0c431b58-BOSa-F4gn-APeS-Hzf6-CxgD-BsLH', 'fea6c18d-5ab6-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fea6c18d-5ab6-11dc-be42-000e0c431b58-BYFE-F3Sy-AiUf-HI7h-Clmb-BcCt', 'fea6c18d-5ab6-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'медь', ''),
('fea6c18f-5ab6-11dc-be42-000e0c431b58-B1y9-FUJz-A3G0-HXXM-Cvs1-BVpx', 'fea6c18f-5ab6-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('fea6c18f-5ab6-11dc-be42-000e0c431b58-B4or-F2QU-A4VD-HYRp-CWaC-BEkX', 'fea6c18f-5ab6-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый матовый', ''),
('fea6c18f-5ab6-11dc-be42-000e0c431b58-BK6D-FNUU-A4rv-H6vW-CTh4-BNCG', 'fea6c18f-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fea6c18f-5ab6-11dc-be42-000e0c431b58-BS7T-FD3E-AaMm-HTZo-CZKb-BQFJ', 'fea6c18f-5ab6-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('fea6c18f-5ab6-11dc-be42-000e0c431b58-Buw1-F6rI-AtzT-HLpV-C4zR-B8Dl', 'fea6c18f-5ab6-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсальное', ''),
('fea6c18f-5ab6-11dc-be42-000e0c431b58-BVnj-F880-AmXJ-HDnP-CMCE-BLuE', 'fea6c18f-5ab6-11dc-be42-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.52', 'л'),
('fea6c18f-5ab6-11dc-be42-000e0c431b58-Bwh5-FeMh-AuuK-H6Ry-CIKc-BzCs', 'fea6c18f-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fea6c18f-5ab6-11dc-be42-000e0c431b58-BYy9-FrAo-AD4e-HV2h-C8Je-BQNX', 'fea6c18f-5ab6-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fea6c191-5ab6-11dc-be42-000e0c431b58-B1f0-Fom6-AZxF-HSrB-Covh-B4fe', 'fea6c191-5ab6-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсальное', ''),
('fea6c191-5ab6-11dc-be42-000e0c431b58-B4sF-FMl6-ATDx-HG6u-CLJ4-B46V', 'fea6c191-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fea6c191-5ab6-11dc-be42-000e0c431b58-BEfO-Fu8x-Ay89-HwFm-Cz9U-B5L7', 'fea6c191-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fea6c191-5ab6-11dc-be42-000e0c431b58-Beum-FkDT-AlrF-HIkl-CnR6-BE8C', 'fea6c191-5ab6-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fea6c191-5ab6-11dc-be42-000e0c431b58-BlP9-FG3z-Aybg-HAA3-Czfn-BcGq', 'fea6c191-5ab6-11dc-be42-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0.52', 'л'),
('fea6c191-5ab6-11dc-be42-000e0c431b58-BNIs-FvcL-Ak3p-HbjE-CAK9-BHnD', 'fea6c191-5ab6-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'черный матовый', ''),
('fea6c191-5ab6-11dc-be42-000e0c431b58-BrUb-FpGg-AS7f-Hm2r-CjrM-BjVy', 'fea6c191-5ab6-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('fea6c191-5ab6-11dc-be42-000e0c431b58-BvrX-F219-AceP-HXiN-CaKd-BYQV', 'fea6c191-5ab6-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('ff6f8cd3-db6e-11e3-b291-005056be1f7b-B0Pn-FWLB-ARe4-HfUL-CuIG-BYfC', 'ff6f8cd3-db6e-11e3-b291-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЭКОДОМ', ''),
('ff6f8cd3-db6e-11e3-b291-005056be1f7b-B1s8-FJYU-ANPw-HVyN-CDXx-BDHo', 'ff6f8cd3-db6e-11e3-b291-005056be1f7b', 'd17cb785-d20b-11e4-9be0-005056be1f7c', 'защита от биопоражений', ''),
('ff6f8cd3-db6e-11e3-b291-005056be1f7b-B5Lo-FmXE-A6P3-HtZu-CZZA-BDvM', 'ff6f8cd3-db6e-11e3-b291-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('ff6f8cd3-db6e-11e3-b291-005056be1f7b-BBJe-F544-ApTS-HpXE-C2cH-Biar', 'ff6f8cd3-db6e-11e3-b291-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'антисептический состав', ''),
('ff6f8cd3-db6e-11e3-b291-005056be1f7b-BFDq-F9jB-AJTJ-HQsp-CSm1-B8OO', 'ff6f8cd3-db6e-11e3-b291-005056be1f7b', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для дерева', ''),
('ff6f8cd3-db6e-11e3-b291-005056be1f7b-BjkA-Ft1t-AYJV-HPHk-CdJt-B8Dn', 'ff6f8cd3-db6e-11e3-b291-005056be1f7b', '1d08380b-ce34-11e4-a80e-005056be1f7a', '20000', 'г'),
('ff6f8cd3-db6e-11e3-b291-005056be1f7b-Bx5o-FX6f-Apms-HMZT-C2yy-BJ2q', 'ff6f8cd3-db6e-11e3-b291-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('ff6f8cd3-db6e-11e3-b291-005056be1f7b-Bxfy-FIu6-AtNE-HcLI-CGC1-BDMO', 'ff6f8cd3-db6e-11e3-b291-005056be1f7b', 'd17cb785-d20b-11e4-9be0-005056be1f7c', 'защита от насекомых древоточцев', ''),
('ff6f8cd3-db6e-11e3-b291-005056be1f7b-BYfR-FD21-AY8W-H6Y6-CT2N-BzSO', 'ff6f8cd3-db6e-11e3-b291-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('ff6f8cd3-db6e-11e3-b291-005056be1f7b-BYZe-FKvS-AXyq-HL3x-CzqS-BnyD', 'ff6f8cd3-db6e-11e3-b291-005056be1f7b', 'd17cb785-d20b-11e4-9be0-005056be1f7c', 'защита от огня', '');

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
('B99n-FCz9-Ai5f-HKoI', 'raymefise', 'fill_unload_file', '2015-07-21 05:43:58', 'Заливка файла выгрузки', 'Заливка файла выгрузки через панель администрирования'),
('BG9N-Fmhj-AFUF-HQ7W', 'raymefise', 'fill_unload_file', '2015-07-05 09:01:24', 'Заливка файла выгрузки', 'Заливка файла выгрузки через панель администрирования'),
('BH36-FVSB-ARZi-HpCW', 'raymefise', 'fill_unload_file', '2015-07-16 08:48:00', 'Заливка файла выгрузки', 'Заливка файла выгрузки через панель администрирования'),
('BOcR-FZw8-ARXy-HYFV', 'raymefise', 'fill_unload_file', '2015-07-05 09:02:52', 'Заливка файла выгрузки', 'Заливка файла выгрузки через панель администрирования'),
('BOO4-Fvx5-A1Ba-Hp1X', 'raymefise', 'fill_unload_file', '2015-07-05 09:14:28', 'Заливка файла выгрузки', 'Заливка файла выгрузки через панель администрирования'),
('BQWx-FC6K-A4tn-HIvg', 'raymefise', 'fill_unload_file', '2015-07-16 10:06:29', 'Заливка файла выгрузки', 'Заливка файла выгрузки через панель администрирования'),
('BUYF-FlWQ-A5aL-HiOL', 'raymefise', 'fill_unload_file', '2015-07-05 08:49:28', 'Заливка файла выгрузки', 'Заливка файла выгрузки через панель администрирования'),
('Bxve-FVd9-AlNm-HBJH', 'raymefise', 'fill_unload_file', '2015-07-21 07:34:50', 'Заливка файла выгрузки', 'Заливка файла выгрузки через панель администрирования'),
('Byo8-FYP0-AsoJ-H98U', 'raymefise', 'fill_unload_file', '2015-07-21 07:32:28', 'Заливка файла выгрузки', 'Заливка файла выгрузки через панель администрирования'),
('BYvW-FOeg-AjaK-HMF2', 'raymefise', 'fill_unload_file', '2015-07-21 06:42:13', 'Заливка файла выгрузки', 'Заливка файла выгрузки через панель администрирования'),
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
('bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'Применение', 'groupSelect', 'varchar', 0),
('c17ab514-3bbc-11e3-80e1-005056be1f7a', 'Блеск', 'groupSelect', 'varchar', 0),
('c2267174-970e-11e4-9be0-005056be1f7c', 'Длина', 'intRange', 'float', 0),
('cce0ab91-6a67-11e4-8945-005056be1f7a', 'Страна-производитель', 'groupSelect', 'varchar', 0),
('d17cb785-d20b-11e4-9be0-005056be1f7c', 'Назначение', 'groupSelect', 'varchar', 0),
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
('12bcb99c-0399-11e5-bad4-005056be1f7a', '1d08380b-ce34-11e4-a80e-005056be1f7a', 6),
('18c0600b-03aa-11e5-bad4-005056be1f7a', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 2),
('18c0600b-03aa-11e5-bad4-005056be1f7a', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 3),
('18c0600b-03aa-11e5-bad4-005056be1f7a', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', 4),
('18c0600b-03aa-11e5-bad4-005056be1f7a', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 1),
('3df545ee-03aa-11e5-bad4-005056be1f7a', '1d08380b-ce34-11e4-a80e-005056be1f7a', 2),
('3df545ee-03aa-11e5-bad4-005056be1f7a', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 1),
('8c1d670d-039a-11e5-bad4-005056be1f7a', '1d08380b-ce34-11e4-a80e-005056be1f7a', 2),
('8c1d670d-039a-11e5-bad4-005056be1f7a', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 1);

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
