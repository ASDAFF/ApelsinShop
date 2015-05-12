-- phpMyAdmin SQL Dump
-- version 4.2.13.1
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Май 12 2015 г., 16:23
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
(1, 'Панель авторизации', 'authorizationUserPanel'),
(2, 'ShopNavigationPanel', 'ShopNavigationPanel');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `MenuItemsPage`
--

CREATE TABLE IF NOT EXISTS `MenuItemsPage` (
  `menuItem` bigint(20) unsigned NOT NULL,
  `page` varchar(50) NOT NULL,
  `postfix` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `MenuItems_Lang`
--

CREATE TABLE IF NOT EXISTS `MenuItems_Lang` (
  `menuItem` bigint(20) unsigned NOT NULL,
  `lang` varchar(3) NOT NULL,
  `title` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
('ShopNavigationPanel', 'Shop Navigation Panel', 'CompuProject', '1.0', NULL, 'index.php', 'head.php', 'bodyStart.php', 'bodyEnd.php', NULL, 1, 1, 1),
('slider', 'Слайдер', 'Compu Project', '1.0', 'Модуль для вывода слайдеров', 'index.php', 'head.php', 'bodyStart.php', 'bodyEnd.php', 'admin/index.php', 1, 1, 1),
('socialPanel', 'social panel', 'CompuProject', '1.0', 'социальные сети', 'index.php', 'head.php', 'bodyStart.php', 'bodyEnd.php', 'admin/index.php', 1, 1, 1);

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
  `showTitle` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `cssClasses` varchar(200) DEFAULT NULL,
  `display` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `onAllPages` tinyint(3) unsigned NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ModulesInBlocks`
--

INSERT INTO `ModulesInBlocks` (`id`, `module`, `block`, `sequence`, `showTitle`, `cssClasses`, `display`, `onAllPages`) VALUES
(1, 1, 1, 1, 0, NULL, 1, 1),
(2, 2, 2, 1, 0, NULL, 1, 1);

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
('test', 1, NULL, 201, 'apelsinShop', 1, 1, 1, 1, 0);

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
('jquery', 'version', '2.0.3');

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Plugins`
--

INSERT INTO `Plugins` (`alias`, `name`, `author`, `version`, `description`, `main`, `head`, `bodyEnd`, `admin`, `onAllPages`, `sequence`) VALUES
('appearingBox', 'Всплывающий блок', 'Compu Project', '1.0', 'Всплывающий блок дял размещение изображений, страниц, видео и т.д.', 'index.php', 'head.php', '', './admin/index.php', 1, 5),
('AudioPlayer', 'AudioPlayer', 'Compu Project', '1.0', 'AudioPlayer', 'index.php', 'head.php', 'bodyEnd.php', 'admin/index.php', 1, 4),
('captcha', 'Captcha', 'Compu Project', '1.0', 'Генератор проверочного кода', 'index.php', 'head.php', '', './admin/index.php', 1, 2),
('ContentToColumns', 'Content To Columns', 'Compu Project', '1.0', 'Распределяет равномерно контент по колонкам', 'index.php', 'head.php', NULL, 'admin/index.php', 1, 7),
('JCrop', 'Обрезка изображений', 'Compu Project', '1.0', 'Обрезка изображения', 'index.php', 'head.php', '', './admin/index.php', 1, 3),
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
('01f691f1-87cd-11de-8f0e-000e0c431b58', 'Грунт-эмали', 1, 1),
('01f691f2-87cd-11de-8f0e-000e0c431b58', 'Грунт-эмали "DALI"', 1, 1),
('076d216a-4380-11de-8f53-000e0c431b58', 'Колер', 1, 1),
('27566c6a-9ed8-11e3-96ad-005056be1f7b', 'Декоративные покрытия(для внутренних и наружных работ)', 1, 1),
('75d66d1b-99a5-11db-937f-000e0c431b59', 'ЛАКОКРАСОЧНАЯ ПРОДУКЦИЯ', 1, 1),
('75d66d49-99a5-11db-937f-000e0c431b59', 'Краски "ЛАКРА"', 1, 1),
('9291c606-5ab3-11dc-be42-000e0c431b58', 'Аэрозольные эмали "KUDO"', 1, 1),
('9291c607-5ab3-11dc-be42-000e0c431b58', 'Эмаль универсальная', 1, 1),
('a6f80c91-516a-11dd-a89a-000e0c431b58', 'Краска ВД "DALI"', 1, 1),
('f8e15f34-b217-11dd-8051-000e0c431b58', 'Краски "DALI"', 1, 1);

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
('01f691f1-87cd-11de-8f0e-000e0c431b58', '75d66d1b-99a5-11db-937f-000e0c431b59'),
('01f691f2-87cd-11de-8f0e-000e0c431b58', '01f691f1-87cd-11de-8f0e-000e0c431b58'),
('076d216a-4380-11de-8f53-000e0c431b58', '75d66d49-99a5-11db-937f-000e0c431b59'),
('27566c6a-9ed8-11e3-96ad-005056be1f7b', '75d66d49-99a5-11db-937f-000e0c431b59'),
('75d66d49-99a5-11db-937f-000e0c431b59', '75d66d1b-99a5-11db-937f-000e0c431b59'),
('9291c606-5ab3-11dc-be42-000e0c431b58', '75d66d1b-99a5-11db-937f-000e0c431b59'),
('9291c607-5ab3-11dc-be42-000e0c431b58', '9291c606-5ab3-11dc-be42-000e0c431b58'),
('a6f80c91-516a-11dd-a89a-000e0c431b58', 'f8e15f34-b217-11dd-8051-000e0c431b58'),
('f8e15f34-b217-11dd-8051-000e0c431b58', '75d66d1b-99a5-11db-937f-000e0c431b59');

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
('copy1-047805a5-fe8c-11e3-bbdb-005056be1f7b', 'Копия1 Краска ВД акриловая д/стен и потолков (PROFESSIONAL) База С DALI 2,5л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 14, 7, 'КРАСКА ДАЛИ ДЛЯ СТЕН И ПОТОЛКОВ предназначена для декоративного и экологичного окрашивания стен и потолков внутри помещений с повышенной эксплуатационной нагрузкой. Применяется для окраски кирпичных, бетонных, оштукатуренных и других минеральных поверхностей.', 1),
('copy1-04834f06-93b0-11e3-82a4-005056be1f7b', 'Копия1 Грунт-эмаль по ржавчине красный 2л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 14, 19, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy1-076d2137-4380-11de-8f53-000e0c431b58', 'Копия1 Грунт-эмаль по ржавчине черная 0,75л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 391, 75, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy1-076d2139-4380-11de-8f53-000e0c431b58', 'Копия1 Грунт-эмаль по ржавчине черная 2л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 327, 53, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy1-076d213b-4380-11de-8f53-000e0c431b58', 'Копия1 Грунт-эмаль по ржавчине белая 0,75л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 242, 45, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy1-076d213d-4380-11de-8f53-000e0c431b58', 'Копия1 Грунт-эмаль по ржавчине белая 2л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 202, 36, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy1-076d213f-4380-11de-8f53-000e0c431b58', 'Копия1 Грунт-эмаль по ржавчине коричневая 0,75л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 291, 42, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy1-076d2141-4380-11de-8f53-000e0c431b58', 'Копия1 Грунт-эмаль по ржавчине коричневая 2л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 339, 42, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy1-076d2143-4380-11de-8f53-000e0c431b58', 'Копия1 Грунт-эмаль по ржавчине красно-коричневая 0,75л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 184, 42, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy1-076d2145-4380-11de-8f53-000e0c431b58', 'Копия1 Грунт-эмаль по ржавчине красно-коричневая 2л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 245, 37, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy1-076d2147-4380-11de-8f53-000e0c431b58', 'Копия1 Грунт-эмаль по ржавчине серая 0,75л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 502, 52, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy1-076d2149-4380-11de-8f53-000e0c431b58', 'Копия1 Грунт-эмаль по ржавчине серая 2л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 602, 46, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy1-076d214b-4380-11de-8f53-000e0c431b58', 'Копия1 Грунт-эмаль по ржавчине зеленая 0,75л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 130, 36, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy1-076d214d-4380-11de-8f53-000e0c431b58', 'Копия1 Грунт-эмаль по ржавчине зеленая 2л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 147, 40, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy1-076d216b-4380-11de-8f53-000e0c431b58', 'Копия1 Колер Лакра №  1  Темно-корич. 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 136, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy1-076d216d-4380-11de-8f53-000e0c431b58', 'Копия1 Колер Лакра № 10  Ярко-желтый 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 194, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy1-076d216f-4380-11de-8f53-000e0c431b58', 'Копия1 Колер Лакра № 11  Желто-кор. 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 157, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy1-076d2173-4380-11de-8f53-000e0c431b58', 'Копия1 Колер Лакра № 12  Фиалка 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 122, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy1-0916172c-947c-11e3-8d88-005056be1f7b', 'Копия1 Штукатурка структурная декоративная с эффектом "зернистости" размер "зерна" 2мм Белый 15кг', '27566c6a-9ed8-11e3-96ad-005056be1f7b', 0, 46, 14, 'Для декоративной отделки поверхностей внутри и снаружи помещений. Готовая к применению декоративная штукатурка повышенной белизны на основе водной акриловой дисперсии с равномерно зернистой структурой. Скрывает небольшие неровности основания. Легко наносится. Образуемый рельеф получается плавным и приятным на ощупь. Создает прочное влагостойкое, паропроницаемое покрытие, стойкое к атмосферным воздействиям и эксплуатационным нагрузкам. Обладает отличной адгезией к поверхностям из бетона, камня, гипса, цемента, кирпича, ДСП, ДВП. Не содержит растворителей, без запаха. Размер зерна ~ 1,5 мм. Допускает мытье окрашенной поверхности.', 1),
('copy1-129c7f4d-5273-11de-8f53-000e0c431b58', 'Копия1 Краска ВД акриловая д/стен и потолков (PROFESSIONAL) DALI 9л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 262, 32, 'КРАСКА ДАЛИ ДЛЯ СТЕН И ПОТОЛКОВ предназначена для декоративного и экологичного окрашивания стен и потолков внутри помещений с повышенной эксплуатационной нагрузкой. Применяется для окраски кирпичных, бетонных, оштукатуренных и других минеральных поверхностей.', 1),
('copy1-13ce3df2-93b0-11e3-82a4-005056be1f7b', 'Копия1 Грунт-эмаль по ржавчине синий 2л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 44, 19, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy1-1bd57597-93b0-11e3-82a4-005056be1f7b', 'Копия1 Грунт-эмаль по ржавчине синий 0,75л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 39, 25, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy1-3479e733-bce7-11e4-a1f3-005056be1f7b', 'Копия1 Молотковая грунт-эмаль по ржавчине серебристая 2 л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 0, 0, 'Применяется по любым металлическим поверхностям: решетки, ограды, гаражи, различные металлоконструкции, автомобильные детали и др. внутри помещений и в условиях атмосферного воздействия.', 1),
('copy1-35c08325-4386-11de-8f53-000e0c431b58', 'Копия1 Колер Лакра № 13  Салатовый 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 112, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy1-35c08327-4386-11de-8f53-000e0c431b58', 'Копия1 Колер Лакра № 14  Фисташковый 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 200, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy1-35c08329-4386-11de-8f53-000e0c431b58', 'Копия1 Колер Лакра № 15  Морская волна 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 82, 83, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy1-35c0832b-4386-11de-8f53-000e0c431b58', 'Копия1 Колер Лакра № 16  Изумрудный 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 70, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy1-35c0832d-4386-11de-8f53-000e0c431b58', 'Копия1 Колер Лакра № 17  Синий 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 92, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy1-35c0832f-4386-11de-8f53-000e0c431b58', 'Копия1 Колер Лакра № 18  Черный 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 291, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy1-35c08331-4386-11de-8f53-000e0c431b58', 'Копия1 Колер Лакра № 19  Розовый 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 102, 83, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy1-35c08333-4386-11de-8f53-000e0c431b58', 'Копия1 Колер Лакра №  2  Зол-желт. 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 166, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy1-35c08335-4386-11de-8f53-000e0c431b58', 'Копия1 Колер Лакра № 20  Сиреневый 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 94, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy1-35c08337-4386-11de-8f53-000e0c431b58', 'Копия1 Колер Лакра №  3  Бежевый 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 42, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy1-35c08339-4386-11de-8f53-000e0c431b58', 'Копия1 Колер Лакра №  4  Кофейный 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 122, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy1-35c0833b-4386-11de-8f53-000e0c431b58', 'Копия1 Колер Лакра №  5  Коралл 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 104, 83, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy1-35c0833d-4386-11de-8f53-000e0c431b58', 'Копия1 Колер Лакра №  6  Апельсиновый 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 89, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy1-35c0833f-4386-11de-8f53-000e0c431b58', 'Копия1 Колер Лакра №  7  Красный 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 153, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy1-35c08341-4386-11de-8f53-000e0c431b58', 'Копия1 Колер Лакра №  8  Красно-кор. 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 112, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy1-35c08343-4386-11de-8f53-000e0c431b58', 'Копия1 Колер Лакра №  9  Св-корич. 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 108, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy1-56a6f723-ea03-11de-860d-000e0c431b58', 'Копия1 Краска ВД акриловая д/обоев DALI 9л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 134, 29, 'Краска DALI акриловая для обоев обладает отличной адгезией к бумажным, флизелиновым и стеклообоям. Благодаря специально разработанному составу, краска DALI обладает хорошей укрывистостью и без проблем наносится на обои под покраску, сохраняя фактуру. Так же краска DALI может быть нанесена на минеральные поверхности, такие как гипсокартон, штукатурки, шпатлевки и тому подобные покрытия. Единственным условием к поверхности - нормальная влажность и температура в помещении, в котором производятся работы. Краска Dali содержит в составе специальные антибактериальные добавки, препятствующие образованию и размножению био организмов и бактерий. Кроме того краска DALI устойчива к влажной уборке и применению моющих средств, что делает стены и потолок помещения долговечными. Существуют две разновидности краски DALI - база А, подходящая и для машинной и для ручной колеровки, и база С, подходящая только для машинной колеровки. Купить и заколеровать краску DALI, а так же другую продукцию компании Рогнеда Вы можете в интернет магазине СтройБери, а так же в сети розничных магазинов.', 1),
('copy1-56f519d0-4f2c-11de-8f53-000e0c431b58', 'Копия1 Краска ВД акриловая фасадная особопрочная База А DALI 9л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 372, 31, 'Применяется внутри и снаружи помещений по минеральным поверхностям (бетон, кирпич, гипс, цемент, гипсокартон, шпатлевка, штукатурка и др.) ', 1),
('copy1-7a3c5db1-777c-11de-9531-000e0c431b58', 'Копия1 Краска ВД акриловая д/стен и потолков (PROFESSIONAL) База С DALI 9л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 1, 10, 7, 'КРАСКА ДАЛИ ДЛЯ СТЕН И ПОТОЛКОВ предназначена для декоративного и экологичного окрашивания стен и потолков внутри помещений с повышенной эксплуатационной нагрузкой. Применяется для окраски кирпичных, бетонных, оштукатуренных и других минеральных поверхностей.', 1),
('copy1-7a3c5db3-777c-11de-9531-000e0c431b58', 'Копия1 Краска ВД акриловая д/стен и потолков (PROFESSIONAL) База С DALI 5л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 16, 14, 'КРАСКА ДАЛИ ДЛЯ СТЕН И ПОТОЛКОВ предназначена для декоративного и экологичного окрашивания стен и потолков внутри помещений с повышенной эксплуатационной нагрузкой. Применяется для окраски кирпичных, бетонных, оштукатуренных и других минеральных поверхностей.', 1),
('copy1-7a3c5db5-777c-11de-9531-000e0c431b58', 'Копия1 Краска ВД акриловая фасадная особопрочная База С DALI 9л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 33, 9, 'Применяется внутри и снаружи помещений по минеральным поверхностям (бетон, кирпич, гипс, цемент, гипсокартон, шпатлевка, штукатурка и др.) ', 1),
('copy1-7a3c5db7-777c-11de-9531-000e0c431b58', 'Копия1 Краска ВД акриловая фасадная особопрочная База С DALI 5л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 27, 14, 'Применяется внутри и снаружи помещений по минеральным поверхностям (бетон, кирпич, гипс, цемент, гипсокартон, шпатлевка, штукатурка и др.) ', 1),
('copy1-82ebcce8-bce7-11e4-a1f3-005056be1f7b', 'Копия1 Молотковая грунт-эмаль по ржавчине серебристая 10 л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 0, 0, 'Применяется по любым металлическим поверхностям: решетки, ограды, гаражи, различные металлоконструкции, автомобильные детали и др. внутри помещений и в условиях атмосферного воздействия.', 1),
('copy1-9291c63a-5ab3-11dc-be42-000e0c431b58', 'Копия1 Эмаль универсальная белая глянцевая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 97, 48, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy1-9291c63c-5ab3-11dc-be42-000e0c431b58', 'Копия1 Эмаль универсальная черная глянцевая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 91, 51, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy1-9291c63e-5ab3-11dc-be42-000e0c431b58', 'Копия1 Эмаль универсальная красная 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 88, 40, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy1-9291c640-5ab3-11dc-be42-000e0c431b58', 'Копия1 Эмаль универсальная вишневая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 32, 27, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy1-963b6b0a-04a8-11e3-94de-005056be3574', 'Копия1 Штукатурка роллерная декоративная с эффектом "короеда" Белый 15кг', '27566c6a-9ed8-11e3-96ad-005056be1f7b', 0, 68, 14, 'Штукатурка фактурная ЛАКРА с эффект "короеда", готовая к применению декоративная штукатурка повышенной белизны на основе водной акриловой дисперсии. Легко наносится валиком. Создает прочное влагостойкое, паропроницаемое покрытие, стойкое к атмосферным воздействиям и эксплуатационным нагрузкам. Обладает отличной адгезией к поверхностям из бетона, камня, гипса, цемента, кирпича, ДСП, ДВП. Не содержит растворителей, без запаха. Допускает мытье окрашенной поверхности. Колеруется в светлые оттенки.', 1),
('copy1-992163db-a731-11de-90d4-000e0c431b58', 'Копия1 Краска ВД акриловая д/потолков DALI 9л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 1, 196, 30, 'КРАСКА ДАЛИ АКРИЛОВАЯ ДЛЯ ПОТОЛКОВ Предназначена для декоративного окрашивания потолков в сухих жилых и общественных помещениях с низкой эксплуатационной нагрузкой.', 1),
('copy1-992163dd-a731-11de-90d4-000e0c431b58', 'Копия1 Краска ВД латексная д/кухни и ванной DALI 9л БАЗА А (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 96, 26, 'Латексная акриловая краска для декоративного окрашивания стен и потолков в жилых и общественных помещениях с повышенной влажностью воздуха и эксплуатационной нагрузкой. Применяется внутри помещений по минеральным поверхностям (бетон, кирпич, гипс, цемент, гипсокартон, шпатлевка, штукатурка и др.).', 1),
('copy1-a6f80c96-516a-11dd-a89a-000e0c431b58', 'Копия1 Краска ВД акриловая д/обоев DALI 2,5л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 197, 35, 'Краска DALI акриловая для обоев обладает отличной адгезией к бумажным, флизелиновым и стеклообоям. Благодаря специально разработанному составу, краска DALI обладает хорошей укрывистостью и без проблем наносится на обои под покраску, сохраняя фактуру. Так же краска DALI может быть нанесена на минеральные поверхности, такие как гипсокартон, штукатурки, шпатлевки и тому подобные покрытия. Единственным условием к поверхности - нормальная влажность и температура в помещении, в котором производятся работы. Краска Dali содержит в составе специальные антибактериальные добавки, препятствующие образованию и размножению био организмов и бактерий. Кроме того краска DALI устойчива к влажной уборке и применению моющих средств, что делает стены и потолок помещения долговечными. Существуют две разновидности краски DALI - база А, подходящая и для машинной и для ручной колеровки, и база С, подходящая только для машинной колеровки. Купить и заколеровать краску DALI, а так же другую продукцию компании Рогнеда Вы можете в интернет магазине СтройБери, а так же в сети розничных магазинов.', 1),
('copy1-a6f80c98-516a-11dd-a89a-000e0c431b58', 'Копия1 Краска ВД акриловая д/обоев DALI 5л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 136, 30, 'Краска DALI акриловая для обоев обладает отличной адгезией к бумажным, флизелиновым и стеклообоям. Благодаря специально разработанному составу, краска DALI обладает хорошей укрывистостью и без проблем наносится на обои под покраску, сохраняя фактуру. Так же краска DALI может быть нанесена на минеральные поверхности, такие как гипсокартон, штукатурки, шпатлевки и тому подобные покрытия. Единственным условием к поверхности - нормальная влажность и температура в помещении, в котором производятся работы. Краска Dali содержит в составе специальные антибактериальные добавки, препятствующие образованию и размножению био организмов и бактерий. Кроме того краска DALI устойчива к влажной уборке и применению моющих средств, что делает стены и потолок помещения долговечными. Существуют две разновидности краски DALI - база А, подходящая и для машинной и для ручной колеровки, и база С, подходящая только для машинной колеровки. Купить и заколеровать краску DALI, а так же другую продукцию компании Рогнеда Вы можете в интернет магазине СтройБери, а так же в сети розничных магазинов.', 1),
('copy1-a6f80c9c-516a-11dd-a89a-000e0c431b58', 'Копия1 Краска ВД акриловая д/потолков DALI 2,5л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 273, 35, 'КРАСКА ДАЛИ АКРИЛОВАЯ ДЛЯ ПОТОЛКОВ Предназначена для декоративного окрашивания потолков в сухих жилых и общественных помещениях с низкой эксплуатационной нагрузкой.', 1),
('copy1-a6f80c9e-516a-11dd-a89a-000e0c431b58', 'Копия1 Краска ВД акриловая д/потолков DALI 5л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 261, 38, 'КРАСКА ДАЛИ АКРИЛОВАЯ ДЛЯ ПОТОЛКОВ Предназначена для декоративного окрашивания потолков в сухих жилых и общественных помещениях с низкой эксплуатационной нагрузкой.', 1),
('copy1-a6f80ca2-516a-11dd-a89a-000e0c431b58', 'Копия1 Краска ВД акриловая д/стен и потолков (PROFESSIONAL) DALI 2,5л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 354, 39, 'КРАСКА ДАЛИ ДЛЯ СТЕН И ПОТОЛКОВ предназначена для декоративного и экологичного окрашивания стен и потолков внутри помещений с повышенной эксплуатационной нагрузкой. Применяется для окраски кирпичных, бетонных, оштукатуренных и других минеральных поверхностей.', 1),
('copy1-a6f80ca4-516a-11dd-a89a-000e0c431b58', 'Копия1 Краска ВД акриловая д/стен и потолков (PROFESSIONAL) DALI 5л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 310, 34, 'КРАСКА ДАЛИ ДЛЯ СТЕН И ПОТОЛКОВ предназначена для декоративного и экологичного окрашивания стен и потолков внутри помещений с повышенной эксплуатационной нагрузкой. Применяется для окраски кирпичных, бетонных, оштукатуренных и других минеральных поверхностей.', 1),
('copy1-a6f80ca8-516a-11dd-a89a-000e0c431b58', 'Копия1 Краска ВД акриловая фасадная особопрочная База А DALI 5л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 169, 34, 'Применяется внутри и снаружи помещений по минеральным поверхностям (бетон, кирпич, гипс, цемент, гипсокартон, шпатлевка, штукатурка и др.) ', 1),
('copy1-a6f80cac-516a-11dd-a89a-000e0c431b58', 'Копия1 Краска ВД латексная д/кухни и ванной DALI 2,5л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 197, 35, 'Латексная акриловая краска для декоративного окрашивания стен и потолков в жилых и общественных помещениях с повышенной влажностью воздуха и эксплуатационной нагрузкой. Применяется внутри помещений по минеральным поверхностям (бетон, кирпич, гипс, цемент, гипсокартон, шпатлевка, штукатурка и др.).', 1),
('copy1-a6f80cae-516a-11dd-a89a-000e0c431b58', 'Копия1 Краска ВД латексная д/кухни и ванной DALI 5л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 145, 26, 'Латексная акриловая краска для декоративного окрашивания стен и потолков в жилых и общественных помещениях с повышенной влажностью воздуха и эксплуатационной нагрузкой. Применяется внутри помещений по минеральным поверхностям (бетон, кирпич, гипс, цемент, гипсокартон, шпатлевка, штукатурка и др.).', 1),
('copy1-b182dc4f-f994-11e2-98ef-005056be3574', 'Копия1 Молотковая грунт-эмаль по ржавчине черная 0,75л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 91, 26, 'Применяется по любым металлическим поверхностям: решетки, ограды, гаражи, различные металлоконструкции, автомобильные детали и др. внутри помещений и в условиях атмосферного воздействия.', 1),
('copy1-b182dc51-f994-11e2-98ef-005056be3574', 'Копия1 Молотковая грунт-эмаль по ржавчине зеленая 0,75л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 42, 26, 'Применяется по любым металлическим поверхностям: решетки, ограды, гаражи, различные металлоконструкции, автомобильные детали и др. внутри помещений и в условиях атмосферного воздействия.', 1),
('copy1-b7e28649-21de-11df-860d-000e0c431b58', 'Копия1 Краска фактурная Белый 9 кг ("Лакра")', '27566c6a-9ed8-11e3-96ad-005056be1f7b', 0, 11, 21, 'Краска представляет собой белую вязкую однородную массу. Удобна в нанесении, легка в обработке, имеет высокую адгезию к основанию. После высыхания краска образует декоративное рельефное покрытие, скрывающие мелкие дефекты стен. Отличается высокой твердостью и атмосферостойкостью. Возможно последующее нанесение воднодисперсионной краски другого цвета на высохшее фактурное покрытие. Готова к применению.', 1),
('copy1-b7e2864b-21de-11df-860d-000e0c431b58', 'Копия1 Краска фактурная Белый 18 кг ("Лакра")', '27566c6a-9ed8-11e3-96ad-005056be1f7b', 0, 507, 21, 'Краска представляет собой белую вязкую однородную массу. Удобна в нанесении, легка в обработке, имеет высокую адгезию к основанию. После высыхания краска образует декоративное рельефное покрытие, скрывающие мелкие дефекты стен. Отличается высокой твердостью и атмосферостойкостью. Возможно последующее нанесение воднодисперсионной краски другого цвета на высохшее фактурное покрытие. Готова к применению.', 1),
('copy1-c4df9e0d-00c0-11e2-a554-005056be3bd8', 'Копия1 Молотковая грунт-эмаль по ржавчине коричневая 0,75л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 167, 23, 'Применяется по любым металлическим поверхностям: решетки, ограды, гаражи, различные металлоконструкции, автомобильные детали и др. внутри помещений и в условиях атмосферного воздействия.', 1),
('copy1-c4df9e0f-00c0-11e2-a554-005056be3bd8', 'Копия1 Молотковая грунт-эмаль по ржавчине медная 0,75л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 79, 23, 'Применяется по любым металлическим поверхностям: решетки, ограды, гаражи, различные металлоконструкции, автомобильные детали и др. внутри помещений и в условиях атмосферного воздействия.', 1),
('copy1-c4df9e11-00c0-11e2-a554-005056be3bd8', 'Копия1 Молотковая грунт-эмаль по ржавчине серебристая 0,75л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 139, 23, 'Применяется по любым металлическим поверхностям: решетки, ограды, гаражи, различные металлоконструкции, автомобильные детали и др. внутри помещений и в условиях атмосферного воздействия.', 1),
('copy1-c4df9e13-00c0-11e2-a554-005056be3bd8', 'Копия1 Молотковая грунт-эмаль по ржавчине серая 0,75л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 85, 23, 'Применяется по любым металлическим поверхностям: решетки, ограды, гаражи, различные металлоконструкции, автомобильные детали и др. внутри помещений и в условиях атмосферного воздействия.', 1),
('copy1-cf6aa526-48b8-11dd-9342-000e0c431b58', 'Копия1 Эмаль универсальная бронза 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 84, 38, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy1-d5823752-947b-11e3-8d88-005056be1f7b', 'Копия1 Штукатурка фактурная декоративная с эффектом "шубы" Белый 15кг', '27566c6a-9ed8-11e3-96ad-005056be1f7b', 0, 44, 14, 'Готовая к применению декоративная штукатурка повышенной белизны на основе водной акриловой дисперсии. Образует на поверхности рельеф в виде «шубы». Скрывает небольшие неровности основания. Легко наносится валиком. Создает прочное влагостойкое, паропроницаемое покрытие, стойкое к атмосферным воздействиям и эксплуатационным нагрузкам. Обладает отличной адгезией к поверхностям из бетона, камня, гипса, цемента, кирпича, ДСП, ДВП. Не содержит растворителей, без запаха. Допускает мытье окрашенной поверхности.', 1),
('copy1-da49edc1-58f9-11e0-894e-000e0c431b58', 'Копия1 Грунт-эмаль по ржавчине белая 10л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 0, 0, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy1-da49edc3-58f9-11e0-894e-000e0c431b58', 'Копия1 Грунт-эмаль по ржавчине зеленая 10л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 0, 0, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy1-da49edc5-58f9-11e0-894e-000e0c431b58', 'Копия1 Грунт-эмаль по ржавчине коричневая 10л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 2, 0, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy1-da49edc7-58f9-11e0-894e-000e0c431b58', 'Копия1 Грунт-эмаль по ржавчине красно-коричневая 10л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 23, 3, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy1-da49edc9-58f9-11e0-894e-000e0c431b58', 'Копия1 Грунт-эмаль по ржавчине серая 10л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 42, 0, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy1-da49edcb-58f9-11e0-894e-000e0c431b58', 'Копия1 Грунт-эмаль по ржавчине черная 10л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 0, 5, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy1-df210450-93af-11e3-82a4-005056be1f7b', 'Копия1 Грунт-эмаль по ржавчине жёлтый 0,75л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 62, 25, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy1-e242e97f-f29b-11dd-9439-000e0c431b58', 'Копия1 Краска ВД акриловая фасадная всесезонная База А DALI 9л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 71, 17, 'КРАСКА ДАЛИ ФАСАДНАЯ ВСЕСЕЗОННАЯ DALI органорастворимая предназначена для высококачественной отделки фасадов при температуре воздуха до -20 С. Может применяться для ответственного окрашивания поверхностей на основе бетона, штукатурки, ДСП, ацеита, кирпича, пенобетона, дерева во всех климатических поясах, в том числе и в регионах со сложными атмосферными условиями. ', 1),
('copy1-e4020814-4598-11e1-8212-001cc494be80', 'Копия1 Краска ВД латексная д/кухни и ванной DALI 9л БАЗА С (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 0, 0, 'Латексная акриловая краска для декоративного окрашивания стен и потолков в жилых и общественных помещениях с повышенной влажностью воздуха и эксплуатационной нагрузкой. Применяется внутри помещений по минеральным поверхностям (бетон, кирпич, гипс, цемент, гипсокартон, шпатлевка, штукатурка и др.).', 1),
('copy1-e8976171-93af-11e3-82a4-005056be1f7b', 'Копия1 Грунт-эмаль по ржавчине жёлтый 2л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 59, 22, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy1-f0ad1dd1-1f91-11e4-9591-005056be1f7b', 'Копия1 Грунт-эмаль по ржавчине жёлтый 10л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 1, 0, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy1-f5f1fcd6-d1c2-11e3-8b7a-005056be1f7b', 'Копия1 Штукатурка структурная декоративная с эффектом "зернистости" размер "зерна" 1,5мм Белый 15кг', '27566c6a-9ed8-11e3-96ad-005056be1f7b', 0, 39, 0, 'Для декоративной отделки поверхностей внутри и снаружи помещений. Готовая к применению декоративная штукатурка повышенной белизны на основе водной акриловой дисперсии с равномерно зернистой структурой. Скрывает небольшие неровности основания. Легко наносится. Образуемый рельеф получается плавным и приятным на ощупь. Создает прочное влагостойкое, паропроницаемое покрытие, стойкое к атмосферным воздействиям и эксплуатационным нагрузкам. Обладает отличной адгезией к поверхностям из бетона, камня, гипса, цемента, кирпича, ДСП, ДВП. Не содержит растворителей, без запаха. Размер зерна ~ 1,5 мм. Допускает мытье окрашенной поверхности.', 1),
('copy1-fbb89466-93af-11e3-82a4-005056be1f7b', 'Копия1 Грунт-эмаль по ржавчине красный 0,75л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 23, 21, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy1-fded4984-d1c2-11e3-8b7a-005056be1f7b', 'Копия1 Штукатурка структурная декоративная с эффектом "зернистости" размер "зерна" 13мм Белый 15кг', '27566c6a-9ed8-11e3-96ad-005056be1f7b', 0, 19, 0, 'Для декоративной отделки поверхностей внутри и снаружи помещений. Готовая к применению декоративная штукатурка повышенной белизны на основе водной акриловой дисперсии с равномерно зернистой структурой. Скрывает небольшие неровности основания. Легко наносится. Образуемый рельеф получается плавным и приятным на ощупь. Создает прочное влагостойкое, паропроницаемое покрытие, стойкое к атмосферным воздействиям и эксплуатационным нагрузкам. Обладает отличной адгезией к поверхностям из бетона, камня, гипса, цемента, кирпича, ДСП, ДВП. Не содержит растворителей, без запаха. Размер зерна ~ 1,5 мм. Допускает мытье окрашенной поверхности.', 1),
('copy1-fea6c165-5ab6-11dc-be42-000e0c431b58', 'Копия1 Эмаль универсальная хаки 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 52, 27, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy1-fea6c167-5ab6-11dc-be42-000e0c431b58', 'Копия1 Эмаль универсальная светло-зеленая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 35, 27, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy1-fea6c169-5ab6-11dc-be42-000e0c431b58', 'Копия1 Эмаль универсальная темно-зеленая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 38, 29, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy1-fea6c16b-5ab6-11dc-be42-000e0c431b58', 'Копия1 Эмаль универсальная фисташковая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 39, 27, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy1-fea6c16d-5ab6-11dc-be42-000e0c431b58', 'Копия1 Эмаль универсальная бежевая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 42, 31, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy1-fea6c16f-5ab6-11dc-be42-000e0c431b58', 'Копия1 Эмаль универсальная голубая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 38, 31, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy1-fea6c171-5ab6-11dc-be42-000e0c431b58', 'Копия1 Эмаль универсальная синяя 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 51, 30, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy1-fea6c173-5ab6-11dc-be42-000e0c431b58', 'Копия1 Эмаль универсальная коричневая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 64, 38, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy1-fea6c175-5ab6-11dc-be42-000e0c431b58', 'Копия1 Эмаль универсальная желтая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 48, 31, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy1-fea6c177-5ab6-11dc-be42-000e0c431b58', 'Копия1 Эмаль универсальная светло-серая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 41, 29, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy1-fea6c179-5ab6-11dc-be42-000e0c431b58', 'Копия1 Эмаль универсальная серая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 71, 34, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy1-fea6c17b-5ab6-11dc-be42-000e0c431b58', 'Копия1 Эмаль универсальная оранжевая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 47, 28, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy1-fea6c17d-5ab6-11dc-be42-000e0c431b58', 'Копия1 Эмаль универсальная бирюзовая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 37, 28, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy1-fea6c17f-5ab6-11dc-be42-000e0c431b58', 'Копия1 Эмаль универсальная сиреневая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 36, 28, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy1-fea6c181-5ab6-11dc-be42-000e0c431b58', 'Копия1 Эмаль универсальная охра 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 34, 26, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy1-fea6c183-5ab6-11dc-be42-000e0c431b58', 'Копия1 Эмаль универсальная какао 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 37, 29, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy1-fea6c185-5ab6-11dc-be42-000e0c431b58', 'Копия1 Эмаль универсальная красно-коричневая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 39, 27, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy1-fea6c187-5ab6-11dc-be42-000e0c431b58', 'Копия1 Эмаль универсальная алюминий 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 159, 28, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy1-fea6c189-5ab6-11dc-be42-000e0c431b58', 'Копия1 Эмаль универсальная хром 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 62, 44, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy1-fea6c18b-5ab6-11dc-be42-000e0c431b58', 'Копия1 Эмаль универсальная золото 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 65, 45, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy1-fea6c18d-5ab6-11dc-be42-000e0c431b58', 'Копия1 Эмаль универсальная медь 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 42, 28, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy1-fea6c18f-5ab6-11dc-be42-000e0c431b58', 'Копия1 Эмаль универсальная белая матовая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 92, 45, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy1-fea6c191-5ab6-11dc-be42-000e0c431b58', 'Копия1 Эмаль универсальная черная матовая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 99, 51, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy2-047805a5-fe8c-11e3-bbdb-005056be1f7b', 'Копия2 Краска ВД акриловая д/стен и потолков (PROFESSIONAL) База С DALI 2,5л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 14, 7, 'КРАСКА ДАЛИ ДЛЯ СТЕН И ПОТОЛКОВ предназначена для декоративного и экологичного окрашивания стен и потолков внутри помещений с повышенной эксплуатационной нагрузкой. Применяется для окраски кирпичных, бетонных, оштукатуренных и других минеральных поверхностей.', 1),
('copy2-04834f06-93b0-11e3-82a4-005056be1f7b', 'Копия2 Грунт-эмаль по ржавчине красный 2л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 14, 19, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy2-076d2137-4380-11de-8f53-000e0c431b58', 'Копия2 Грунт-эмаль по ржавчине черная 0,75л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 391, 75, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy2-076d2139-4380-11de-8f53-000e0c431b58', 'Копия2 Грунт-эмаль по ржавчине черная 2л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 327, 53, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy2-076d213b-4380-11de-8f53-000e0c431b58', 'Копия2 Грунт-эмаль по ржавчине белая 0,75л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 242, 45, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy2-076d213d-4380-11de-8f53-000e0c431b58', 'Копия2 Грунт-эмаль по ржавчине белая 2л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 202, 36, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy2-076d213f-4380-11de-8f53-000e0c431b58', 'Копия2 Грунт-эмаль по ржавчине коричневая 0,75л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 291, 42, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy2-076d2141-4380-11de-8f53-000e0c431b58', 'Копия2 Грунт-эмаль по ржавчине коричневая 2л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 339, 42, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy2-076d2143-4380-11de-8f53-000e0c431b58', 'Копия2 Грунт-эмаль по ржавчине красно-коричневая 0,75л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 184, 42, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy2-076d2145-4380-11de-8f53-000e0c431b58', 'Копия2 Грунт-эмаль по ржавчине красно-коричневая 2л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 245, 37, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy2-076d2147-4380-11de-8f53-000e0c431b58', 'Копия2 Грунт-эмаль по ржавчине серая 0,75л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 502, 52, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy2-076d2149-4380-11de-8f53-000e0c431b58', 'Копия2 Грунт-эмаль по ржавчине серая 2л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 602, 46, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy2-076d214b-4380-11de-8f53-000e0c431b58', 'Копия2 Грунт-эмаль по ржавчине зеленая 0,75л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 130, 36, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy2-076d214d-4380-11de-8f53-000e0c431b58', 'Копия2 Грунт-эмаль по ржавчине зеленая 2л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 147, 40, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy2-076d216b-4380-11de-8f53-000e0c431b58', 'Копия2 Колер Лакра №  1  Темно-корич. 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 136, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy2-076d216d-4380-11de-8f53-000e0c431b58', 'Копия2 Колер Лакра № 10  Ярко-желтый 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 194, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy2-076d216f-4380-11de-8f53-000e0c431b58', 'Копия2 Колер Лакра № 11  Желто-кор. 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 157, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy2-076d2173-4380-11de-8f53-000e0c431b58', 'Копия2 Колер Лакра № 12  Фиалка 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 122, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy2-0916172c-947c-11e3-8d88-005056be1f7b', 'Копия2 Штукатурка структурная декоративная с эффектом "зернистости" размер "зерна" 2мм Белый 15кг', '27566c6a-9ed8-11e3-96ad-005056be1f7b', 0, 46, 14, 'Для декоративной отделки поверхностей внутри и снаружи помещений. Готовая к применению декоративная штукатурка повышенной белизны на основе водной акриловой дисперсии с равномерно зернистой структурой. Скрывает небольшие неровности основания. Легко наносится. Образуемый рельеф получается плавным и приятным на ощупь. Создает прочное влагостойкое, паропроницаемое покрытие, стойкое к атмосферным воздействиям и эксплуатационным нагрузкам. Обладает отличной адгезией к поверхностям из бетона, камня, гипса, цемента, кирпича, ДСП, ДВП. Не содержит растворителей, без запаха. Размер зерна ~ 1,5 мм. Допускает мытье окрашенной поверхности.', 1),
('copy2-129c7f4d-5273-11de-8f53-000e0c431b58', 'Копия2 Краска ВД акриловая д/стен и потолков (PROFESSIONAL) DALI 9л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 262, 32, 'КРАСКА ДАЛИ ДЛЯ СТЕН И ПОТОЛКОВ предназначена для декоративного и экологичного окрашивания стен и потолков внутри помещений с повышенной эксплуатационной нагрузкой. Применяется для окраски кирпичных, бетонных, оштукатуренных и других минеральных поверхностей.', 1),
('copy2-13ce3df2-93b0-11e3-82a4-005056be1f7b', 'Копия2 Грунт-эмаль по ржавчине синий 2л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 44, 19, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy2-1bd57597-93b0-11e3-82a4-005056be1f7b', 'Копия2 Грунт-эмаль по ржавчине синий 0,75л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 39, 25, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy2-3479e733-bce7-11e4-a1f3-005056be1f7b', 'Копия2 Молотковая грунт-эмаль по ржавчине серебристая 2 л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 0, 0, 'Применяется по любым металлическим поверхностям: решетки, ограды, гаражи, различные металлоконструкции, автомобильные детали и др. внутри помещений и в условиях атмосферного воздействия.', 1),
('copy2-35c08325-4386-11de-8f53-000e0c431b58', 'Копия2 Колер Лакра № 13  Салатовый 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 112, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy2-35c08327-4386-11de-8f53-000e0c431b58', 'Копия2 Колер Лакра № 14  Фисташковый 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 200, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy2-35c08329-4386-11de-8f53-000e0c431b58', 'Копия2 Колер Лакра № 15  Морская волна 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 82, 83, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy2-35c0832b-4386-11de-8f53-000e0c431b58', 'Копия2 Колер Лакра № 16  Изумрудный 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 70, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy2-35c0832d-4386-11de-8f53-000e0c431b58', 'Копия2 Колер Лакра № 17  Синий 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 92, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy2-35c0832f-4386-11de-8f53-000e0c431b58', 'Копия2 Колер Лакра № 18  Черный 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 291, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy2-35c08331-4386-11de-8f53-000e0c431b58', 'Копия2 Колер Лакра № 19  Розовый 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 102, 83, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy2-35c08333-4386-11de-8f53-000e0c431b58', 'Копия2 Колер Лакра №  2  Зол-желт. 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 166, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy2-35c08335-4386-11de-8f53-000e0c431b58', 'Копия2 Колер Лакра № 20  Сиреневый 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 94, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy2-35c08337-4386-11de-8f53-000e0c431b58', 'Копия2 Колер Лакра №  3  Бежевый 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 42, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy2-35c08339-4386-11de-8f53-000e0c431b58', 'Копия2 Колер Лакра №  4  Кофейный 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 122, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy2-35c0833b-4386-11de-8f53-000e0c431b58', 'Копия2 Колер Лакра №  5  Коралл 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 104, 83, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy2-35c0833d-4386-11de-8f53-000e0c431b58', 'Копия2 Колер Лакра №  6  Апельсиновый 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 89, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy2-35c0833f-4386-11de-8f53-000e0c431b58', 'Копия2 Колер Лакра №  7  Красный 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 153, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy2-35c08341-4386-11de-8f53-000e0c431b58', 'Копия2 Колер Лакра №  8  Красно-кор. 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 112, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy2-35c08343-4386-11de-8f53-000e0c431b58', 'Копия2 Колер Лакра №  9  Св-корич. 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 108, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy2-56a6f723-ea03-11de-860d-000e0c431b58', 'Копия2 Краска ВД акриловая д/обоев DALI 9л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 134, 29, 'Краска DALI акриловая для обоев обладает отличной адгезией к бумажным, флизелиновым и стеклообоям. Благодаря специально разработанному составу, краска DALI обладает хорошей укрывистостью и без проблем наносится на обои под покраску, сохраняя фактуру. Так же краска DALI может быть нанесена на минеральные поверхности, такие как гипсокартон, штукатурки, шпатлевки и тому подобные покрытия. Единственным условием к поверхности - нормальная влажность и температура в помещении, в котором производятся работы. Краска Dali содержит в составе специальные антибактериальные добавки, препятствующие образованию и размножению био организмов и бактерий. Кроме того краска DALI устойчива к влажной уборке и применению моющих средств, что делает стены и потолок помещения долговечными. Существуют две разновидности краски DALI - база А, подходящая и для машинной и для ручной колеровки, и база С, подходящая только для машинной колеровки. Купить и заколеровать краску DALI, а так же другую продукцию компании Рогнеда Вы можете в интернет магазине СтройБери, а так же в сети розничных магазинов.', 1),
('copy2-56f519d0-4f2c-11de-8f53-000e0c431b58', 'Копия2 Краска ВД акриловая фасадная особопрочная База А DALI 9л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 372, 31, 'Применяется внутри и снаружи помещений по минеральным поверхностям (бетон, кирпич, гипс, цемент, гипсокартон, шпатлевка, штукатурка и др.) ', 1),
('copy2-7a3c5db1-777c-11de-9531-000e0c431b58', 'Копия2 Краска ВД акриловая д/стен и потолков (PROFESSIONAL) База С DALI 9л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 1, 10, 7, 'КРАСКА ДАЛИ ДЛЯ СТЕН И ПОТОЛКОВ предназначена для декоративного и экологичного окрашивания стен и потолков внутри помещений с повышенной эксплуатационной нагрузкой. Применяется для окраски кирпичных, бетонных, оштукатуренных и других минеральных поверхностей.', 1),
('copy2-7a3c5db3-777c-11de-9531-000e0c431b58', 'Копия2 Краска ВД акриловая д/стен и потолков (PROFESSIONAL) База С DALI 5л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 16, 14, 'КРАСКА ДАЛИ ДЛЯ СТЕН И ПОТОЛКОВ предназначена для декоративного и экологичного окрашивания стен и потолков внутри помещений с повышенной эксплуатационной нагрузкой. Применяется для окраски кирпичных, бетонных, оштукатуренных и других минеральных поверхностей.', 1),
('copy2-7a3c5db5-777c-11de-9531-000e0c431b58', 'Копия2 Краска ВД акриловая фасадная особопрочная База С DALI 9л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 33, 9, 'Применяется внутри и снаружи помещений по минеральным поверхностям (бетон, кирпич, гипс, цемент, гипсокартон, шпатлевка, штукатурка и др.) ', 1),
('copy2-7a3c5db7-777c-11de-9531-000e0c431b58', 'Копия2 Краска ВД акриловая фасадная особопрочная База С DALI 5л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 27, 14, 'Применяется внутри и снаружи помещений по минеральным поверхностям (бетон, кирпич, гипс, цемент, гипсокартон, шпатлевка, штукатурка и др.) ', 1),
('copy2-82ebcce8-bce7-11e4-a1f3-005056be1f7b', 'Копия2 Молотковая грунт-эмаль по ржавчине серебристая 10 л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 0, 0, 'Применяется по любым металлическим поверхностям: решетки, ограды, гаражи, различные металлоконструкции, автомобильные детали и др. внутри помещений и в условиях атмосферного воздействия.', 1),
('copy2-9291c63a-5ab3-11dc-be42-000e0c431b58', 'Копия2 Эмаль универсальная белая глянцевая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 97, 48, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy2-9291c63c-5ab3-11dc-be42-000e0c431b58', 'Копия2 Эмаль универсальная черная глянцевая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 91, 51, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy2-9291c63e-5ab3-11dc-be42-000e0c431b58', 'Копия2 Эмаль универсальная красная 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 88, 40, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy2-9291c640-5ab3-11dc-be42-000e0c431b58', 'Копия2 Эмаль универсальная вишневая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 32, 27, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy2-963b6b0a-04a8-11e3-94de-005056be3574', 'Копия2 Штукатурка роллерная декоративная с эффектом "короеда" Белый 15кг', '27566c6a-9ed8-11e3-96ad-005056be1f7b', 0, 68, 14, 'Штукатурка фактурная ЛАКРА с эффект "короеда", готовая к применению декоративная штукатурка повышенной белизны на основе водной акриловой дисперсии. Легко наносится валиком. Создает прочное влагостойкое, паропроницаемое покрытие, стойкое к атмосферным воздействиям и эксплуатационным нагрузкам. Обладает отличной адгезией к поверхностям из бетона, камня, гипса, цемента, кирпича, ДСП, ДВП. Не содержит растворителей, без запаха. Допускает мытье окрашенной поверхности. Колеруется в светлые оттенки.', 1),
('copy2-992163db-a731-11de-90d4-000e0c431b58', 'Копия2 Краска ВД акриловая д/потолков DALI 9л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 1, 196, 30, 'КРАСКА ДАЛИ АКРИЛОВАЯ ДЛЯ ПОТОЛКОВ Предназначена для декоративного окрашивания потолков в сухих жилых и общественных помещениях с низкой эксплуатационной нагрузкой.', 1),
('copy2-992163dd-a731-11de-90d4-000e0c431b58', 'Копия2 Краска ВД латексная д/кухни и ванной DALI 9л БАЗА А (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 96, 26, 'Латексная акриловая краска для декоративного окрашивания стен и потолков в жилых и общественных помещениях с повышенной влажностью воздуха и эксплуатационной нагрузкой. Применяется внутри помещений по минеральным поверхностям (бетон, кирпич, гипс, цемент, гипсокартон, шпатлевка, штукатурка и др.).', 1),
('copy2-a6f80c96-516a-11dd-a89a-000e0c431b58', 'Копия2 Краска ВД акриловая д/обоев DALI 2,5л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 197, 35, 'Краска DALI акриловая для обоев обладает отличной адгезией к бумажным, флизелиновым и стеклообоям. Благодаря специально разработанному составу, краска DALI обладает хорошей укрывистостью и без проблем наносится на обои под покраску, сохраняя фактуру. Так же краска DALI может быть нанесена на минеральные поверхности, такие как гипсокартон, штукатурки, шпатлевки и тому подобные покрытия. Единственным условием к поверхности - нормальная влажность и температура в помещении, в котором производятся работы. Краска Dali содержит в составе специальные антибактериальные добавки, препятствующие образованию и размножению био организмов и бактерий. Кроме того краска DALI устойчива к влажной уборке и применению моющих средств, что делает стены и потолок помещения долговечными. Существуют две разновидности краски DALI - база А, подходящая и для машинной и для ручной колеровки, и база С, подходящая только для машинной колеровки. Купить и заколеровать краску DALI, а так же другую продукцию компании Рогнеда Вы можете в интернет магазине СтройБери, а так же в сети розничных магазинов.', 1),
('copy2-a6f80c98-516a-11dd-a89a-000e0c431b58', 'Копия2 Краска ВД акриловая д/обоев DALI 5л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 136, 30, 'Краска DALI акриловая для обоев обладает отличной адгезией к бумажным, флизелиновым и стеклообоям. Благодаря специально разработанному составу, краска DALI обладает хорошей укрывистостью и без проблем наносится на обои под покраску, сохраняя фактуру. Так же краска DALI может быть нанесена на минеральные поверхности, такие как гипсокартон, штукатурки, шпатлевки и тому подобные покрытия. Единственным условием к поверхности - нормальная влажность и температура в помещении, в котором производятся работы. Краска Dali содержит в составе специальные антибактериальные добавки, препятствующие образованию и размножению био организмов и бактерий. Кроме того краска DALI устойчива к влажной уборке и применению моющих средств, что делает стены и потолок помещения долговечными. Существуют две разновидности краски DALI - база А, подходящая и для машинной и для ручной колеровки, и база С, подходящая только для машинной колеровки. Купить и заколеровать краску DALI, а так же другую продукцию компании Рогнеда Вы можете в интернет магазине СтройБери, а так же в сети розничных магазинов.', 1),
('copy2-a6f80c9c-516a-11dd-a89a-000e0c431b58', 'Копия2 Краска ВД акриловая д/потолков DALI 2,5л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 273, 35, 'КРАСКА ДАЛИ АКРИЛОВАЯ ДЛЯ ПОТОЛКОВ Предназначена для декоративного окрашивания потолков в сухих жилых и общественных помещениях с низкой эксплуатационной нагрузкой.', 1),
('copy2-a6f80c9e-516a-11dd-a89a-000e0c431b58', 'Копия2 Краска ВД акриловая д/потолков DALI 5л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 261, 38, 'КРАСКА ДАЛИ АКРИЛОВАЯ ДЛЯ ПОТОЛКОВ Предназначена для декоративного окрашивания потолков в сухих жилых и общественных помещениях с низкой эксплуатационной нагрузкой.', 1),
('copy2-a6f80ca2-516a-11dd-a89a-000e0c431b58', 'Копия2 Краска ВД акриловая д/стен и потолков (PROFESSIONAL) DALI 2,5л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 354, 39, 'КРАСКА ДАЛИ ДЛЯ СТЕН И ПОТОЛКОВ предназначена для декоративного и экологичного окрашивания стен и потолков внутри помещений с повышенной эксплуатационной нагрузкой. Применяется для окраски кирпичных, бетонных, оштукатуренных и других минеральных поверхностей.', 1),
('copy2-a6f80ca4-516a-11dd-a89a-000e0c431b58', 'Копия2 Краска ВД акриловая д/стен и потолков (PROFESSIONAL) DALI 5л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 310, 34, 'КРАСКА ДАЛИ ДЛЯ СТЕН И ПОТОЛКОВ предназначена для декоративного и экологичного окрашивания стен и потолков внутри помещений с повышенной эксплуатационной нагрузкой. Применяется для окраски кирпичных, бетонных, оштукатуренных и других минеральных поверхностей.', 1),
('copy2-a6f80ca8-516a-11dd-a89a-000e0c431b58', 'Копия2 Краска ВД акриловая фасадная особопрочная База А DALI 5л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 169, 34, 'Применяется внутри и снаружи помещений по минеральным поверхностям (бетон, кирпич, гипс, цемент, гипсокартон, шпатлевка, штукатурка и др.) ', 1),
('copy2-a6f80cac-516a-11dd-a89a-000e0c431b58', 'Копия2 Краска ВД латексная д/кухни и ванной DALI 2,5л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 197, 35, 'Латексная акриловая краска для декоративного окрашивания стен и потолков в жилых и общественных помещениях с повышенной влажностью воздуха и эксплуатационной нагрузкой. Применяется внутри помещений по минеральным поверхностям (бетон, кирпич, гипс, цемент, гипсокартон, шпатлевка, штукатурка и др.).', 1),
('copy2-a6f80cae-516a-11dd-a89a-000e0c431b58', 'Копия2 Краска ВД латексная д/кухни и ванной DALI 5л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 145, 26, 'Латексная акриловая краска для декоративного окрашивания стен и потолков в жилых и общественных помещениях с повышенной влажностью воздуха и эксплуатационной нагрузкой. Применяется внутри помещений по минеральным поверхностям (бетон, кирпич, гипс, цемент, гипсокартон, шпатлевка, штукатурка и др.).', 1),
('copy2-b182dc4f-f994-11e2-98ef-005056be3574', 'Копия2 Молотковая грунт-эмаль по ржавчине черная 0,75л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 91, 26, 'Применяется по любым металлическим поверхностям: решетки, ограды, гаражи, различные металлоконструкции, автомобильные детали и др. внутри помещений и в условиях атмосферного воздействия.', 1),
('copy2-b182dc51-f994-11e2-98ef-005056be3574', 'Копия2 Молотковая грунт-эмаль по ржавчине зеленая 0,75л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 42, 26, 'Применяется по любым металлическим поверхностям: решетки, ограды, гаражи, различные металлоконструкции, автомобильные детали и др. внутри помещений и в условиях атмосферного воздействия.', 1),
('copy2-b7e28649-21de-11df-860d-000e0c431b58', 'Копия2 Краска фактурная Белый 9 кг ("Лакра")', '27566c6a-9ed8-11e3-96ad-005056be1f7b', 0, 11, 21, 'Краска представляет собой белую вязкую однородную массу. Удобна в нанесении, легка в обработке, имеет высокую адгезию к основанию. После высыхания краска образует декоративное рельефное покрытие, скрывающие мелкие дефекты стен. Отличается высокой твердостью и атмосферостойкостью. Возможно последующее нанесение воднодисперсионной краски другого цвета на высохшее фактурное покрытие. Готова к применению.', 1),
('copy2-b7e2864b-21de-11df-860d-000e0c431b58', 'Копия2 Краска фактурная Белый 18 кг ("Лакра")', '27566c6a-9ed8-11e3-96ad-005056be1f7b', 0, 507, 21, 'Краска представляет собой белую вязкую однородную массу. Удобна в нанесении, легка в обработке, имеет высокую адгезию к основанию. После высыхания краска образует декоративное рельефное покрытие, скрывающие мелкие дефекты стен. Отличается высокой твердостью и атмосферостойкостью. Возможно последующее нанесение воднодисперсионной краски другого цвета на высохшее фактурное покрытие. Готова к применению.', 1),
('copy2-c4df9e0d-00c0-11e2-a554-005056be3bd8', 'Копия2 Молотковая грунт-эмаль по ржавчине коричневая 0,75л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 167, 23, 'Применяется по любым металлическим поверхностям: решетки, ограды, гаражи, различные металлоконструкции, автомобильные детали и др. внутри помещений и в условиях атмосферного воздействия.', 1),
('copy2-c4df9e0f-00c0-11e2-a554-005056be3bd8', 'Копия2 Молотковая грунт-эмаль по ржавчине медная 0,75л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 79, 23, 'Применяется по любым металлическим поверхностям: решетки, ограды, гаражи, различные металлоконструкции, автомобильные детали и др. внутри помещений и в условиях атмосферного воздействия.', 1),
('copy2-c4df9e11-00c0-11e2-a554-005056be3bd8', 'Копия2 Молотковая грунт-эмаль по ржавчине серебристая 0,75л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 139, 23, 'Применяется по любым металлическим поверхностям: решетки, ограды, гаражи, различные металлоконструкции, автомобильные детали и др. внутри помещений и в условиях атмосферного воздействия.', 1),
('copy2-c4df9e13-00c0-11e2-a554-005056be3bd8', 'Копия2 Молотковая грунт-эмаль по ржавчине серая 0,75л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 85, 23, 'Применяется по любым металлическим поверхностям: решетки, ограды, гаражи, различные металлоконструкции, автомобильные детали и др. внутри помещений и в условиях атмосферного воздействия.', 1),
('copy2-cf6aa526-48b8-11dd-9342-000e0c431b58', 'Копия2 Эмаль универсальная бронза 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 84, 38, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy2-d5823752-947b-11e3-8d88-005056be1f7b', 'Копия2 Штукатурка фактурная декоративная с эффектом "шубы" Белый 15кг', '27566c6a-9ed8-11e3-96ad-005056be1f7b', 0, 44, 14, 'Готовая к применению декоративная штукатурка повышенной белизны на основе водной акриловой дисперсии. Образует на поверхности рельеф в виде «шубы». Скрывает небольшие неровности основания. Легко наносится валиком. Создает прочное влагостойкое, паропроницаемое покрытие, стойкое к атмосферным воздействиям и эксплуатационным нагрузкам. Обладает отличной адгезией к поверхностям из бетона, камня, гипса, цемента, кирпича, ДСП, ДВП. Не содержит растворителей, без запаха. Допускает мытье окрашенной поверхности.', 1),
('copy2-da49edc1-58f9-11e0-894e-000e0c431b58', 'Копия2 Грунт-эмаль по ржавчине белая 10л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 0, 0, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy2-da49edc3-58f9-11e0-894e-000e0c431b58', 'Копия2 Грунт-эмаль по ржавчине зеленая 10л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 0, 0, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy2-da49edc5-58f9-11e0-894e-000e0c431b58', 'Копия2 Грунт-эмаль по ржавчине коричневая 10л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 2, 0, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy2-da49edc7-58f9-11e0-894e-000e0c431b58', 'Копия2 Грунт-эмаль по ржавчине красно-коричневая 10л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 23, 3, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy2-da49edc9-58f9-11e0-894e-000e0c431b58', 'Копия2 Грунт-эмаль по ржавчине серая 10л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 42, 0, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy2-da49edcb-58f9-11e0-894e-000e0c431b58', 'Копия2 Грунт-эмаль по ржавчине черная 10л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 0, 5, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy2-df210450-93af-11e3-82a4-005056be1f7b', 'Копия2 Грунт-эмаль по ржавчине жёлтый 0,75л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 62, 25, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy2-e242e97f-f29b-11dd-9439-000e0c431b58', 'Копия2 Краска ВД акриловая фасадная всесезонная База А DALI 9л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 71, 17, 'КРАСКА ДАЛИ ФАСАДНАЯ ВСЕСЕЗОННАЯ DALI органорастворимая предназначена для высококачественной отделки фасадов при температуре воздуха до -20 С. Может применяться для ответственного окрашивания поверхностей на основе бетона, штукатурки, ДСП, ацеита, кирпича, пенобетона, дерева во всех климатических поясах, в том числе и в регионах со сложными атмосферными условиями. ', 1),
('copy2-e4020814-4598-11e1-8212-001cc494be80', 'Копия2 Краска ВД латексная д/кухни и ванной DALI 9л БАЗА С (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 0, 0, 'Латексная акриловая краска для декоративного окрашивания стен и потолков в жилых и общественных помещениях с повышенной влажностью воздуха и эксплуатационной нагрузкой. Применяется внутри помещений по минеральным поверхностям (бетон, кирпич, гипс, цемент, гипсокартон, шпатлевка, штукатурка и др.).', 1),
('copy2-e8976171-93af-11e3-82a4-005056be1f7b', 'Копия2 Грунт-эмаль по ржавчине жёлтый 2л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 59, 22, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy2-f0ad1dd1-1f91-11e4-9591-005056be1f7b', 'Копия2 Грунт-эмаль по ржавчине жёлтый 10л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 1, 0, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy2-f5f1fcd6-d1c2-11e3-8b7a-005056be1f7b', 'Копия2 Штукатурка структурная декоративная с эффектом "зернистости" размер "зерна" 1,5мм Белый 15кг', '27566c6a-9ed8-11e3-96ad-005056be1f7b', 0, 39, 0, 'Для декоративной отделки поверхностей внутри и снаружи помещений. Готовая к применению декоративная штукатурка повышенной белизны на основе водной акриловой дисперсии с равномерно зернистой структурой. Скрывает небольшие неровности основания. Легко наносится. Образуемый рельеф получается плавным и приятным на ощупь. Создает прочное влагостойкое, паропроницаемое покрытие, стойкое к атмосферным воздействиям и эксплуатационным нагрузкам. Обладает отличной адгезией к поверхностям из бетона, камня, гипса, цемента, кирпича, ДСП, ДВП. Не содержит растворителей, без запаха. Размер зерна ~ 1,5 мм. Допускает мытье окрашенной поверхности.', 1),
('copy2-fbb89466-93af-11e3-82a4-005056be1f7b', 'Копия2 Грунт-эмаль по ржавчине красный 0,75л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 23, 21, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy2-fded4984-d1c2-11e3-8b7a-005056be1f7b', 'Копия2 Штукатурка структурная декоративная с эффектом "зернистости" размер "зерна" 13мм Белый 15кг', '27566c6a-9ed8-11e3-96ad-005056be1f7b', 0, 19, 0, 'Для декоративной отделки поверхностей внутри и снаружи помещений. Готовая к применению декоративная штукатурка повышенной белизны на основе водной акриловой дисперсии с равномерно зернистой структурой. Скрывает небольшие неровности основания. Легко наносится. Образуемый рельеф получается плавным и приятным на ощупь. Создает прочное влагостойкое, паропроницаемое покрытие, стойкое к атмосферным воздействиям и эксплуатационным нагрузкам. Обладает отличной адгезией к поверхностям из бетона, камня, гипса, цемента, кирпича, ДСП, ДВП. Не содержит растворителей, без запаха. Размер зерна ~ 1,5 мм. Допускает мытье окрашенной поверхности.', 1),
('copy2-fea6c165-5ab6-11dc-be42-000e0c431b58', 'Копия2 Эмаль универсальная хаки 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 52, 27, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy2-fea6c167-5ab6-11dc-be42-000e0c431b58', 'Копия2 Эмаль универсальная светло-зеленая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 35, 27, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy2-fea6c169-5ab6-11dc-be42-000e0c431b58', 'Копия2 Эмаль универсальная темно-зеленая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 38, 29, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy2-fea6c16b-5ab6-11dc-be42-000e0c431b58', 'Копия2 Эмаль универсальная фисташковая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 39, 27, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy2-fea6c16d-5ab6-11dc-be42-000e0c431b58', 'Копия2 Эмаль универсальная бежевая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 42, 31, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy2-fea6c16f-5ab6-11dc-be42-000e0c431b58', 'Копия2 Эмаль универсальная голубая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 38, 31, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy2-fea6c171-5ab6-11dc-be42-000e0c431b58', 'Копия2 Эмаль универсальная синяя 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 51, 30, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy2-fea6c173-5ab6-11dc-be42-000e0c431b58', 'Копия2 Эмаль универсальная коричневая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 64, 38, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy2-fea6c175-5ab6-11dc-be42-000e0c431b58', 'Копия2 Эмаль универсальная желтая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 48, 31, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy2-fea6c177-5ab6-11dc-be42-000e0c431b58', 'Копия2 Эмаль универсальная светло-серая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 41, 29, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy2-fea6c179-5ab6-11dc-be42-000e0c431b58', 'Копия2 Эмаль универсальная серая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 71, 34, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy2-fea6c17b-5ab6-11dc-be42-000e0c431b58', 'Копия2 Эмаль универсальная оранжевая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 47, 28, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy2-fea6c17d-5ab6-11dc-be42-000e0c431b58', 'Копия2 Эмаль универсальная бирюзовая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 37, 28, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy2-fea6c17f-5ab6-11dc-be42-000e0c431b58', 'Копия2 Эмаль универсальная сиреневая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 36, 28, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy2-fea6c181-5ab6-11dc-be42-000e0c431b58', 'Копия2 Эмаль универсальная охра 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 34, 26, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy2-fea6c183-5ab6-11dc-be42-000e0c431b58', 'Копия2 Эмаль универсальная какао 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 37, 29, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy2-fea6c185-5ab6-11dc-be42-000e0c431b58', 'Копия2 Эмаль универсальная красно-коричневая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 39, 27, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy2-fea6c187-5ab6-11dc-be42-000e0c431b58', 'Копия2 Эмаль универсальная алюминий 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 159, 28, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy2-fea6c189-5ab6-11dc-be42-000e0c431b58', 'Копия2 Эмаль универсальная хром 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 62, 44, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy2-fea6c18b-5ab6-11dc-be42-000e0c431b58', 'Копия2 Эмаль универсальная золото 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 65, 45, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy2-fea6c18d-5ab6-11dc-be42-000e0c431b58', 'Копия2 Эмаль универсальная медь 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 42, 28, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy2-fea6c18f-5ab6-11dc-be42-000e0c431b58', 'Копия2 Эмаль универсальная белая матовая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 92, 45, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy2-fea6c191-5ab6-11dc-be42-000e0c431b58', 'Копия2 Эмаль универсальная черная матовая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 99, 51, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy3-047805a5-fe8c-11e3-bbdb-005056be1f7b', 'Копия3 Краска ВД акриловая д/стен и потолков (PROFESSIONAL) База С DALI 2,5л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 14, 7, 'КРАСКА ДАЛИ ДЛЯ СТЕН И ПОТОЛКОВ предназначена для декоративного и экологичного окрашивания стен и потолков внутри помещений с повышенной эксплуатационной нагрузкой. Применяется для окраски кирпичных, бетонных, оштукатуренных и других минеральных поверхностей.', 1),
('copy3-04834f06-93b0-11e3-82a4-005056be1f7b', 'Копия3 Грунт-эмаль по ржавчине красный 2л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 14, 19, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy3-076d2137-4380-11de-8f53-000e0c431b58', 'Копия3 Грунт-эмаль по ржавчине черная 0,75л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 391, 75, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy3-076d2139-4380-11de-8f53-000e0c431b58', 'Копия3 Грунт-эмаль по ржавчине черная 2л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 327, 53, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy3-076d213b-4380-11de-8f53-000e0c431b58', 'Копия3 Грунт-эмаль по ржавчине белая 0,75л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 242, 45, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy3-076d213d-4380-11de-8f53-000e0c431b58', 'Копия3 Грунт-эмаль по ржавчине белая 2л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 202, 36, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy3-076d213f-4380-11de-8f53-000e0c431b58', 'Копия3 Грунт-эмаль по ржавчине коричневая 0,75л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 291, 42, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy3-076d2141-4380-11de-8f53-000e0c431b58', 'Копия3 Грунт-эмаль по ржавчине коричневая 2л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 339, 42, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy3-076d2143-4380-11de-8f53-000e0c431b58', 'Копия3 Грунт-эмаль по ржавчине красно-коричневая 0,75л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 184, 42, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy3-076d2145-4380-11de-8f53-000e0c431b58', 'Копия3 Грунт-эмаль по ржавчине красно-коричневая 2л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 245, 37, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy3-076d2147-4380-11de-8f53-000e0c431b58', 'Копия3 Грунт-эмаль по ржавчине серая 0,75л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 502, 52, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy3-076d2149-4380-11de-8f53-000e0c431b58', 'Копия3 Грунт-эмаль по ржавчине серая 2л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 602, 46, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy3-076d214b-4380-11de-8f53-000e0c431b58', 'Копия3 Грунт-эмаль по ржавчине зеленая 0,75л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 130, 36, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy3-076d214d-4380-11de-8f53-000e0c431b58', 'Копия3 Грунт-эмаль по ржавчине зеленая 2л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 147, 40, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy3-076d216b-4380-11de-8f53-000e0c431b58', 'Копия3 Колер Лакра №  1  Темно-корич. 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 136, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy3-076d216d-4380-11de-8f53-000e0c431b58', 'Копия3 Колер Лакра № 10  Ярко-желтый 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 194, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy3-076d216f-4380-11de-8f53-000e0c431b58', 'Копия3 Колер Лакра № 11  Желто-кор. 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 157, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy3-076d2173-4380-11de-8f53-000e0c431b58', 'Копия3 Колер Лакра № 12  Фиалка 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 122, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy3-0916172c-947c-11e3-8d88-005056be1f7b', 'Копия3 Штукатурка структурная декоративная с эффектом "зернистости" размер "зерна" 2мм Белый 15кг', '27566c6a-9ed8-11e3-96ad-005056be1f7b', 0, 46, 14, 'Для декоративной отделки поверхностей внутри и снаружи помещений. Готовая к применению декоративная штукатурка повышенной белизны на основе водной акриловой дисперсии с равномерно зернистой структурой. Скрывает небольшие неровности основания. Легко наносится. Образуемый рельеф получается плавным и приятным на ощупь. Создает прочное влагостойкое, паропроницаемое покрытие, стойкое к атмосферным воздействиям и эксплуатационным нагрузкам. Обладает отличной адгезией к поверхностям из бетона, камня, гипса, цемента, кирпича, ДСП, ДВП. Не содержит растворителей, без запаха. Размер зерна ~ 1,5 мм. Допускает мытье окрашенной поверхности.', 1),
('copy3-129c7f4d-5273-11de-8f53-000e0c431b58', 'Копия3 Краска ВД акриловая д/стен и потолков (PROFESSIONAL) DALI 9л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 262, 32, 'КРАСКА ДАЛИ ДЛЯ СТЕН И ПОТОЛКОВ предназначена для декоративного и экологичного окрашивания стен и потолков внутри помещений с повышенной эксплуатационной нагрузкой. Применяется для окраски кирпичных, бетонных, оштукатуренных и других минеральных поверхностей.', 1),
('copy3-13ce3df2-93b0-11e3-82a4-005056be1f7b', 'Копия3 Грунт-эмаль по ржавчине синий 2л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 44, 19, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy3-1bd57597-93b0-11e3-82a4-005056be1f7b', 'Копия3 Грунт-эмаль по ржавчине синий 0,75л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 39, 25, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy3-3479e733-bce7-11e4-a1f3-005056be1f7b', 'Копия3 Молотковая грунт-эмаль по ржавчине серебристая 2 л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 0, 0, 'Применяется по любым металлическим поверхностям: решетки, ограды, гаражи, различные металлоконструкции, автомобильные детали и др. внутри помещений и в условиях атмосферного воздействия.', 1),
('copy3-35c08325-4386-11de-8f53-000e0c431b58', 'Копия3 Колер Лакра № 13  Салатовый 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 112, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy3-35c08327-4386-11de-8f53-000e0c431b58', 'Копия3 Колер Лакра № 14  Фисташковый 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 200, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy3-35c08329-4386-11de-8f53-000e0c431b58', 'Копия3 Колер Лакра № 15  Морская волна 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 82, 83, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy3-35c0832b-4386-11de-8f53-000e0c431b58', 'Копия3 Колер Лакра № 16  Изумрудный 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 70, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy3-35c0832d-4386-11de-8f53-000e0c431b58', 'Копия3 Колер Лакра № 17  Синий 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 92, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy3-35c0832f-4386-11de-8f53-000e0c431b58', 'Копия3 Колер Лакра № 18  Черный 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 291, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy3-35c08331-4386-11de-8f53-000e0c431b58', 'Копия3 Колер Лакра № 19  Розовый 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 102, 83, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy3-35c08333-4386-11de-8f53-000e0c431b58', 'Копия3 Колер Лакра №  2  Зол-желт. 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 166, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy3-35c08335-4386-11de-8f53-000e0c431b58', 'Копия3 Колер Лакра № 20  Сиреневый 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 94, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy3-35c08337-4386-11de-8f53-000e0c431b58', 'Копия3 Колер Лакра №  3  Бежевый 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 42, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy3-35c08339-4386-11de-8f53-000e0c431b58', 'Копия3 Колер Лакра №  4  Кофейный 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 122, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy3-35c0833b-4386-11de-8f53-000e0c431b58', 'Копия3 Колер Лакра №  5  Коралл 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 104, 83, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy3-35c0833d-4386-11de-8f53-000e0c431b58', 'Копия3 Колер Лакра №  6  Апельсиновый 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 89, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy3-35c0833f-4386-11de-8f53-000e0c431b58', 'Копия3 Колер Лакра №  7  Красный 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 153, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy3-35c08341-4386-11de-8f53-000e0c431b58', 'Копия3 Колер Лакра №  8  Красно-кор. 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 112, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy3-35c08343-4386-11de-8f53-000e0c431b58', 'Копия3 Колер Лакра №  9  Св-корич. 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 108, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy3-56a6f723-ea03-11de-860d-000e0c431b58', 'Копия3 Краска ВД акриловая д/обоев DALI 9л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 134, 29, 'Краска DALI акриловая для обоев обладает отличной адгезией к бумажным, флизелиновым и стеклообоям. Благодаря специально разработанному составу, краска DALI обладает хорошей укрывистостью и без проблем наносится на обои под покраску, сохраняя фактуру. Так же краска DALI может быть нанесена на минеральные поверхности, такие как гипсокартон, штукатурки, шпатлевки и тому подобные покрытия. Единственным условием к поверхности - нормальная влажность и температура в помещении, в котором производятся работы. Краска Dali содержит в составе специальные антибактериальные добавки, препятствующие образованию и размножению био организмов и бактерий. Кроме того краска DALI устойчива к влажной уборке и применению моющих средств, что делает стены и потолок помещения долговечными. Существуют две разновидности краски DALI - база А, подходящая и для машинной и для ручной колеровки, и база С, подходящая только для машинной колеровки. Купить и заколеровать краску DALI, а так же другую продукцию компании Рогнеда Вы можете в интернет магазине СтройБери, а так же в сети розничных магазинов.', 1),
('copy3-56f519d0-4f2c-11de-8f53-000e0c431b58', 'Копия3 Краска ВД акриловая фасадная особопрочная База А DALI 9л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 372, 31, 'Применяется внутри и снаружи помещений по минеральным поверхностям (бетон, кирпич, гипс, цемент, гипсокартон, шпатлевка, штукатурка и др.) ', 1),
('copy3-7a3c5db1-777c-11de-9531-000e0c431b58', 'Копия3 Краска ВД акриловая д/стен и потолков (PROFESSIONAL) База С DALI 9л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 1, 10, 7, 'КРАСКА ДАЛИ ДЛЯ СТЕН И ПОТОЛКОВ предназначена для декоративного и экологичного окрашивания стен и потолков внутри помещений с повышенной эксплуатационной нагрузкой. Применяется для окраски кирпичных, бетонных, оштукатуренных и других минеральных поверхностей.', 1),
('copy3-7a3c5db3-777c-11de-9531-000e0c431b58', 'Копия3 Краска ВД акриловая д/стен и потолков (PROFESSIONAL) База С DALI 5л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 16, 14, 'КРАСКА ДАЛИ ДЛЯ СТЕН И ПОТОЛКОВ предназначена для декоративного и экологичного окрашивания стен и потолков внутри помещений с повышенной эксплуатационной нагрузкой. Применяется для окраски кирпичных, бетонных, оштукатуренных и других минеральных поверхностей.', 1),
('copy3-7a3c5db5-777c-11de-9531-000e0c431b58', 'Копия3 Краска ВД акриловая фасадная особопрочная База С DALI 9л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 33, 9, 'Применяется внутри и снаружи помещений по минеральным поверхностям (бетон, кирпич, гипс, цемент, гипсокартон, шпатлевка, штукатурка и др.) ', 1),
('copy3-7a3c5db7-777c-11de-9531-000e0c431b58', 'Копия3 Краска ВД акриловая фасадная особопрочная База С DALI 5л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 27, 14, 'Применяется внутри и снаружи помещений по минеральным поверхностям (бетон, кирпич, гипс, цемент, гипсокартон, шпатлевка, штукатурка и др.) ', 1),
('copy3-82ebcce8-bce7-11e4-a1f3-005056be1f7b', 'Копия3 Молотковая грунт-эмаль по ржавчине серебристая 10 л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 0, 0, 'Применяется по любым металлическим поверхностям: решетки, ограды, гаражи, различные металлоконструкции, автомобильные детали и др. внутри помещений и в условиях атмосферного воздействия.', 1),
('copy3-9291c63a-5ab3-11dc-be42-000e0c431b58', 'Копия3 Эмаль универсальная белая глянцевая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 97, 48, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy3-9291c63c-5ab3-11dc-be42-000e0c431b58', 'Копия3 Эмаль универсальная черная глянцевая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 91, 51, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy3-9291c63e-5ab3-11dc-be42-000e0c431b58', 'Копия3 Эмаль универсальная красная 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 88, 40, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy3-9291c640-5ab3-11dc-be42-000e0c431b58', 'Копия3 Эмаль универсальная вишневая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 32, 27, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy3-963b6b0a-04a8-11e3-94de-005056be3574', 'Копия3 Штукатурка роллерная декоративная с эффектом "короеда" Белый 15кг', '27566c6a-9ed8-11e3-96ad-005056be1f7b', 0, 68, 14, 'Штукатурка фактурная ЛАКРА с эффект "короеда", готовая к применению декоративная штукатурка повышенной белизны на основе водной акриловой дисперсии. Легко наносится валиком. Создает прочное влагостойкое, паропроницаемое покрытие, стойкое к атмосферным воздействиям и эксплуатационным нагрузкам. Обладает отличной адгезией к поверхностям из бетона, камня, гипса, цемента, кирпича, ДСП, ДВП. Не содержит растворителей, без запаха. Допускает мытье окрашенной поверхности. Колеруется в светлые оттенки.', 1),
('copy3-992163db-a731-11de-90d4-000e0c431b58', 'Копия3 Краска ВД акриловая д/потолков DALI 9л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 1, 196, 30, 'КРАСКА ДАЛИ АКРИЛОВАЯ ДЛЯ ПОТОЛКОВ Предназначена для декоративного окрашивания потолков в сухих жилых и общественных помещениях с низкой эксплуатационной нагрузкой.', 1),
('copy3-992163dd-a731-11de-90d4-000e0c431b58', 'Копия3 Краска ВД латексная д/кухни и ванной DALI 9л БАЗА А (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 96, 26, 'Латексная акриловая краска для декоративного окрашивания стен и потолков в жилых и общественных помещениях с повышенной влажностью воздуха и эксплуатационной нагрузкой. Применяется внутри помещений по минеральным поверхностям (бетон, кирпич, гипс, цемент, гипсокартон, шпатлевка, штукатурка и др.).', 1),
('copy3-a6f80c96-516a-11dd-a89a-000e0c431b58', 'Копия3 Краска ВД акриловая д/обоев DALI 2,5л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 197, 35, 'Краска DALI акриловая для обоев обладает отличной адгезией к бумажным, флизелиновым и стеклообоям. Благодаря специально разработанному составу, краска DALI обладает хорошей укрывистостью и без проблем наносится на обои под покраску, сохраняя фактуру. Так же краска DALI может быть нанесена на минеральные поверхности, такие как гипсокартон, штукатурки, шпатлевки и тому подобные покрытия. Единственным условием к поверхности - нормальная влажность и температура в помещении, в котором производятся работы. Краска Dali содержит в составе специальные антибактериальные добавки, препятствующие образованию и размножению био организмов и бактерий. Кроме того краска DALI устойчива к влажной уборке и применению моющих средств, что делает стены и потолок помещения долговечными. Существуют две разновидности краски DALI - база А, подходящая и для машинной и для ручной колеровки, и база С, подходящая только для машинной колеровки. Купить и заколеровать краску DALI, а так же другую продукцию компании Рогнеда Вы можете в интернет магазине СтройБери, а так же в сети розничных магазинов.', 1),
('copy3-a6f80c98-516a-11dd-a89a-000e0c431b58', 'Копия3 Краска ВД акриловая д/обоев DALI 5л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 136, 30, 'Краска DALI акриловая для обоев обладает отличной адгезией к бумажным, флизелиновым и стеклообоям. Благодаря специально разработанному составу, краска DALI обладает хорошей укрывистостью и без проблем наносится на обои под покраску, сохраняя фактуру. Так же краска DALI может быть нанесена на минеральные поверхности, такие как гипсокартон, штукатурки, шпатлевки и тому подобные покрытия. Единственным условием к поверхности - нормальная влажность и температура в помещении, в котором производятся работы. Краска Dali содержит в составе специальные антибактериальные добавки, препятствующие образованию и размножению био организмов и бактерий. Кроме того краска DALI устойчива к влажной уборке и применению моющих средств, что делает стены и потолок помещения долговечными. Существуют две разновидности краски DALI - база А, подходящая и для машинной и для ручной колеровки, и база С, подходящая только для машинной колеровки. Купить и заколеровать краску DALI, а так же другую продукцию компании Рогнеда Вы можете в интернет магазине СтройБери, а так же в сети розничных магазинов.', 1),
('copy3-a6f80c9c-516a-11dd-a89a-000e0c431b58', 'Копия3 Краска ВД акриловая д/потолков DALI 2,5л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 273, 35, 'КРАСКА ДАЛИ АКРИЛОВАЯ ДЛЯ ПОТОЛКОВ Предназначена для декоративного окрашивания потолков в сухих жилых и общественных помещениях с низкой эксплуатационной нагрузкой.', 1),
('copy3-a6f80c9e-516a-11dd-a89a-000e0c431b58', 'Копия3 Краска ВД акриловая д/потолков DALI 5л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 261, 38, 'КРАСКА ДАЛИ АКРИЛОВАЯ ДЛЯ ПОТОЛКОВ Предназначена для декоративного окрашивания потолков в сухих жилых и общественных помещениях с низкой эксплуатационной нагрузкой.', 1),
('copy3-a6f80ca2-516a-11dd-a89a-000e0c431b58', 'Копия3 Краска ВД акриловая д/стен и потолков (PROFESSIONAL) DALI 2,5л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 354, 39, 'КРАСКА ДАЛИ ДЛЯ СТЕН И ПОТОЛКОВ предназначена для декоративного и экологичного окрашивания стен и потолков внутри помещений с повышенной эксплуатационной нагрузкой. Применяется для окраски кирпичных, бетонных, оштукатуренных и других минеральных поверхностей.', 1),
('copy3-a6f80ca4-516a-11dd-a89a-000e0c431b58', 'Копия3 Краска ВД акриловая д/стен и потолков (PROFESSIONAL) DALI 5л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 310, 34, 'КРАСКА ДАЛИ ДЛЯ СТЕН И ПОТОЛКОВ предназначена для декоративного и экологичного окрашивания стен и потолков внутри помещений с повышенной эксплуатационной нагрузкой. Применяется для окраски кирпичных, бетонных, оштукатуренных и других минеральных поверхностей.', 1),
('copy3-a6f80ca8-516a-11dd-a89a-000e0c431b58', 'Копия3 Краска ВД акриловая фасадная особопрочная База А DALI 5л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 169, 34, 'Применяется внутри и снаружи помещений по минеральным поверхностям (бетон, кирпич, гипс, цемент, гипсокартон, шпатлевка, штукатурка и др.) ', 1),
('copy3-a6f80cac-516a-11dd-a89a-000e0c431b58', 'Копия3 Краска ВД латексная д/кухни и ванной DALI 2,5л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 197, 35, 'Латексная акриловая краска для декоративного окрашивания стен и потолков в жилых и общественных помещениях с повышенной влажностью воздуха и эксплуатационной нагрузкой. Применяется внутри помещений по минеральным поверхностям (бетон, кирпич, гипс, цемент, гипсокартон, шпатлевка, штукатурка и др.).', 1),
('copy3-a6f80cae-516a-11dd-a89a-000e0c431b58', 'Копия3 Краска ВД латексная д/кухни и ванной DALI 5л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 145, 26, 'Латексная акриловая краска для декоративного окрашивания стен и потолков в жилых и общественных помещениях с повышенной влажностью воздуха и эксплуатационной нагрузкой. Применяется внутри помещений по минеральным поверхностям (бетон, кирпич, гипс, цемент, гипсокартон, шпатлевка, штукатурка и др.).', 1),
('copy3-b182dc4f-f994-11e2-98ef-005056be3574', 'Копия3 Молотковая грунт-эмаль по ржавчине черная 0,75л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 91, 26, 'Применяется по любым металлическим поверхностям: решетки, ограды, гаражи, различные металлоконструкции, автомобильные детали и др. внутри помещений и в условиях атмосферного воздействия.', 1),
('copy3-b182dc51-f994-11e2-98ef-005056be3574', 'Копия3 Молотковая грунт-эмаль по ржавчине зеленая 0,75л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 42, 26, 'Применяется по любым металлическим поверхностям: решетки, ограды, гаражи, различные металлоконструкции, автомобильные детали и др. внутри помещений и в условиях атмосферного воздействия.', 1),
('copy3-b7e28649-21de-11df-860d-000e0c431b58', 'Копия3 Краска фактурная Белый 9 кг ("Лакра")', '27566c6a-9ed8-11e3-96ad-005056be1f7b', 0, 11, 21, 'Краска представляет собой белую вязкую однородную массу. Удобна в нанесении, легка в обработке, имеет высокую адгезию к основанию. После высыхания краска образует декоративное рельефное покрытие, скрывающие мелкие дефекты стен. Отличается высокой твердостью и атмосферостойкостью. Возможно последующее нанесение воднодисперсионной краски другого цвета на высохшее фактурное покрытие. Готова к применению.', 1),
('copy3-b7e2864b-21de-11df-860d-000e0c431b58', 'Копия3 Краска фактурная Белый 18 кг ("Лакра")', '27566c6a-9ed8-11e3-96ad-005056be1f7b', 0, 507, 21, 'Краска представляет собой белую вязкую однородную массу. Удобна в нанесении, легка в обработке, имеет высокую адгезию к основанию. После высыхания краска образует декоративное рельефное покрытие, скрывающие мелкие дефекты стен. Отличается высокой твердостью и атмосферостойкостью. Возможно последующее нанесение воднодисперсионной краски другого цвета на высохшее фактурное покрытие. Готова к применению.', 1),
('copy3-c4df9e0d-00c0-11e2-a554-005056be3bd8', 'Копия3 Молотковая грунт-эмаль по ржавчине коричневая 0,75л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 167, 23, 'Применяется по любым металлическим поверхностям: решетки, ограды, гаражи, различные металлоконструкции, автомобильные детали и др. внутри помещений и в условиях атмосферного воздействия.', 1),
('copy3-c4df9e0f-00c0-11e2-a554-005056be3bd8', 'Копия3 Молотковая грунт-эмаль по ржавчине медная 0,75л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 79, 23, 'Применяется по любым металлическим поверхностям: решетки, ограды, гаражи, различные металлоконструкции, автомобильные детали и др. внутри помещений и в условиях атмосферного воздействия.', 1),
('copy3-c4df9e11-00c0-11e2-a554-005056be3bd8', 'Копия3 Молотковая грунт-эмаль по ржавчине серебристая 0,75л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 139, 23, 'Применяется по любым металлическим поверхностям: решетки, ограды, гаражи, различные металлоконструкции, автомобильные детали и др. внутри помещений и в условиях атмосферного воздействия.', 1),
('copy3-c4df9e13-00c0-11e2-a554-005056be3bd8', 'Копия3 Молотковая грунт-эмаль по ржавчине серая 0,75л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 85, 23, 'Применяется по любым металлическим поверхностям: решетки, ограды, гаражи, различные металлоконструкции, автомобильные детали и др. внутри помещений и в условиях атмосферного воздействия.', 1),
('copy3-cf6aa526-48b8-11dd-9342-000e0c431b58', 'Копия3 Эмаль универсальная бронза 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 84, 38, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy3-d5823752-947b-11e3-8d88-005056be1f7b', 'Копия3 Штукатурка фактурная декоративная с эффектом "шубы" Белый 15кг', '27566c6a-9ed8-11e3-96ad-005056be1f7b', 0, 44, 14, 'Готовая к применению декоративная штукатурка повышенной белизны на основе водной акриловой дисперсии. Образует на поверхности рельеф в виде «шубы». Скрывает небольшие неровности основания. Легко наносится валиком. Создает прочное влагостойкое, паропроницаемое покрытие, стойкое к атмосферным воздействиям и эксплуатационным нагрузкам. Обладает отличной адгезией к поверхностям из бетона, камня, гипса, цемента, кирпича, ДСП, ДВП. Не содержит растворителей, без запаха. Допускает мытье окрашенной поверхности.', 1),
('copy3-da49edc1-58f9-11e0-894e-000e0c431b58', 'Копия3 Грунт-эмаль по ржавчине белая 10л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 0, 0, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy3-da49edc3-58f9-11e0-894e-000e0c431b58', 'Копия3 Грунт-эмаль по ржавчине зеленая 10л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 0, 0, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy3-da49edc5-58f9-11e0-894e-000e0c431b58', 'Копия3 Грунт-эмаль по ржавчине коричневая 10л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 2, 0, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy3-da49edc7-58f9-11e0-894e-000e0c431b58', 'Копия3 Грунт-эмаль по ржавчине красно-коричневая 10л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 23, 3, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy3-da49edc9-58f9-11e0-894e-000e0c431b58', 'Копия3 Грунт-эмаль по ржавчине серая 10л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 42, 0, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy3-da49edcb-58f9-11e0-894e-000e0c431b58', 'Копия3 Грунт-эмаль по ржавчине черная 10л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 0, 5, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy3-df210450-93af-11e3-82a4-005056be1f7b', 'Копия3 Грунт-эмаль по ржавчине жёлтый 0,75л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 62, 25, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy3-e242e97f-f29b-11dd-9439-000e0c431b58', 'Копия3 Краска ВД акриловая фасадная всесезонная База А DALI 9л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 71, 17, 'КРАСКА ДАЛИ ФАСАДНАЯ ВСЕСЕЗОННАЯ DALI органорастворимая предназначена для высококачественной отделки фасадов при температуре воздуха до -20 С. Может применяться для ответственного окрашивания поверхностей на основе бетона, штукатурки, ДСП, ацеита, кирпича, пенобетона, дерева во всех климатических поясах, в том числе и в регионах со сложными атмосферными условиями. ', 1),
('copy3-e4020814-4598-11e1-8212-001cc494be80', 'Копия3 Краска ВД латексная д/кухни и ванной DALI 9л БАЗА С (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 0, 0, 'Латексная акриловая краска для декоративного окрашивания стен и потолков в жилых и общественных помещениях с повышенной влажностью воздуха и эксплуатационной нагрузкой. Применяется внутри помещений по минеральным поверхностям (бетон, кирпич, гипс, цемент, гипсокартон, шпатлевка, штукатурка и др.).', 1),
('copy3-e8976171-93af-11e3-82a4-005056be1f7b', 'Копия3 Грунт-эмаль по ржавчине жёлтый 2л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 59, 22, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy3-f0ad1dd1-1f91-11e4-9591-005056be1f7b', 'Копия3 Грунт-эмаль по ржавчине жёлтый 10л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 1, 0, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy3-f5f1fcd6-d1c2-11e3-8b7a-005056be1f7b', 'Копия3 Штукатурка структурная декоративная с эффектом "зернистости" размер "зерна" 1,5мм Белый 15кг', '27566c6a-9ed8-11e3-96ad-005056be1f7b', 0, 39, 0, 'Для декоративной отделки поверхностей внутри и снаружи помещений. Готовая к применению декоративная штукатурка повышенной белизны на основе водной акриловой дисперсии с равномерно зернистой структурой. Скрывает небольшие неровности основания. Легко наносится. Образуемый рельеф получается плавным и приятным на ощупь. Создает прочное влагостойкое, паропроницаемое покрытие, стойкое к атмосферным воздействиям и эксплуатационным нагрузкам. Обладает отличной адгезией к поверхностям из бетона, камня, гипса, цемента, кирпича, ДСП, ДВП. Не содержит растворителей, без запаха. Размер зерна ~ 1,5 мм. Допускает мытье окрашенной поверхности.', 1),
('copy3-fbb89466-93af-11e3-82a4-005056be1f7b', 'Копия3 Грунт-эмаль по ржавчине красный 0,75л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 23, 21, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy3-fded4984-d1c2-11e3-8b7a-005056be1f7b', 'Копия3 Штукатурка структурная декоративная с эффектом "зернистости" размер "зерна" 13мм Белый 15кг', '27566c6a-9ed8-11e3-96ad-005056be1f7b', 0, 19, 0, 'Для декоративной отделки поверхностей внутри и снаружи помещений. Готовая к применению декоративная штукатурка повышенной белизны на основе водной акриловой дисперсии с равномерно зернистой структурой. Скрывает небольшие неровности основания. Легко наносится. Образуемый рельеф получается плавным и приятным на ощупь. Создает прочное влагостойкое, паропроницаемое покрытие, стойкое к атмосферным воздействиям и эксплуатационным нагрузкам. Обладает отличной адгезией к поверхностям из бетона, камня, гипса, цемента, кирпича, ДСП, ДВП. Не содержит растворителей, без запаха. Размер зерна ~ 1,5 мм. Допускает мытье окрашенной поверхности.', 1),
('copy3-fea6c165-5ab6-11dc-be42-000e0c431b58', 'Копия3 Эмаль универсальная хаки 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 52, 27, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy3-fea6c167-5ab6-11dc-be42-000e0c431b58', 'Копия3 Эмаль универсальная светло-зеленая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 35, 27, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy3-fea6c169-5ab6-11dc-be42-000e0c431b58', 'Копия3 Эмаль универсальная темно-зеленая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 38, 29, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy3-fea6c16b-5ab6-11dc-be42-000e0c431b58', 'Копия3 Эмаль универсальная фисташковая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 39, 27, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy3-fea6c16d-5ab6-11dc-be42-000e0c431b58', 'Копия3 Эмаль универсальная бежевая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 42, 31, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy3-fea6c16f-5ab6-11dc-be42-000e0c431b58', 'Копия3 Эмаль универсальная голубая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 38, 31, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy3-fea6c171-5ab6-11dc-be42-000e0c431b58', 'Копия3 Эмаль универсальная синяя 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 51, 30, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy3-fea6c173-5ab6-11dc-be42-000e0c431b58', 'Копия3 Эмаль универсальная коричневая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 64, 38, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy3-fea6c175-5ab6-11dc-be42-000e0c431b58', 'Копия3 Эмаль универсальная желтая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 48, 31, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy3-fea6c177-5ab6-11dc-be42-000e0c431b58', 'Копия3 Эмаль универсальная светло-серая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 41, 29, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy3-fea6c179-5ab6-11dc-be42-000e0c431b58', 'Копия3 Эмаль универсальная серая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 71, 34, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy3-fea6c17b-5ab6-11dc-be42-000e0c431b58', 'Копия3 Эмаль универсальная оранжевая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 47, 28, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy3-fea6c17d-5ab6-11dc-be42-000e0c431b58', 'Копия3 Эмаль универсальная бирюзовая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 37, 28, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy3-fea6c17f-5ab6-11dc-be42-000e0c431b58', 'Копия3 Эмаль универсальная сиреневая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 36, 28, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy3-fea6c181-5ab6-11dc-be42-000e0c431b58', 'Копия3 Эмаль универсальная охра 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 34, 26, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy3-fea6c183-5ab6-11dc-be42-000e0c431b58', 'Копия3 Эмаль универсальная какао 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 37, 29, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy3-fea6c185-5ab6-11dc-be42-000e0c431b58', 'Копия3 Эмаль универсальная красно-коричневая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 39, 27, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy3-fea6c187-5ab6-11dc-be42-000e0c431b58', 'Копия3 Эмаль универсальная алюминий 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 159, 28, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy3-fea6c189-5ab6-11dc-be42-000e0c431b58', 'Копия3 Эмаль универсальная хром 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 62, 44, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy3-fea6c18b-5ab6-11dc-be42-000e0c431b58', 'Копия3 Эмаль универсальная золото 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 65, 45, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy3-fea6c18d-5ab6-11dc-be42-000e0c431b58', 'Копия3 Эмаль универсальная медь 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 42, 28, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy3-fea6c18f-5ab6-11dc-be42-000e0c431b58', 'Копия3 Эмаль универсальная белая матовая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 92, 45, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy3-fea6c191-5ab6-11dc-be42-000e0c431b58', 'Копия3 Эмаль универсальная черная матовая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 99, 51, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy4-047805a5-fe8c-11e3-bbdb-005056be1f7b', 'Копия4 Краска ВД акриловая д/стен и потолков (PROFESSIONAL) База С DALI 2,5л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 14, 7, 'КРАСКА ДАЛИ ДЛЯ СТЕН И ПОТОЛКОВ предназначена для декоративного и экологичного окрашивания стен и потолков внутри помещений с повышенной эксплуатационной нагрузкой. Применяется для окраски кирпичных, бетонных, оштукатуренных и других минеральных поверхностей.', 1),
('copy4-04834f06-93b0-11e3-82a4-005056be1f7b', 'Копия4 Грунт-эмаль по ржавчине красный 2л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 14, 19, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy4-076d2137-4380-11de-8f53-000e0c431b58', 'Копия4 Грунт-эмаль по ржавчине черная 0,75л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 391, 75, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy4-076d2139-4380-11de-8f53-000e0c431b58', 'Копия4 Грунт-эмаль по ржавчине черная 2л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 327, 53, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy4-076d213b-4380-11de-8f53-000e0c431b58', 'Копия4 Грунт-эмаль по ржавчине белая 0,75л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 242, 45, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy4-076d213d-4380-11de-8f53-000e0c431b58', 'Копия4 Грунт-эмаль по ржавчине белая 2л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 202, 36, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy4-076d213f-4380-11de-8f53-000e0c431b58', 'Копия4 Грунт-эмаль по ржавчине коричневая 0,75л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 291, 42, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy4-076d2141-4380-11de-8f53-000e0c431b58', 'Копия4 Грунт-эмаль по ржавчине коричневая 2л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 339, 42, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy4-076d2143-4380-11de-8f53-000e0c431b58', 'Копия4 Грунт-эмаль по ржавчине красно-коричневая 0,75л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 184, 42, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy4-076d2145-4380-11de-8f53-000e0c431b58', 'Копия4 Грунт-эмаль по ржавчине красно-коричневая 2л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 245, 37, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy4-076d2147-4380-11de-8f53-000e0c431b58', 'Копия4 Грунт-эмаль по ржавчине серая 0,75л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 502, 52, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy4-076d2149-4380-11de-8f53-000e0c431b58', 'Копия4 Грунт-эмаль по ржавчине серая 2л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 602, 46, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy4-076d214b-4380-11de-8f53-000e0c431b58', 'Копия4 Грунт-эмаль по ржавчине зеленая 0,75л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 130, 36, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy4-076d214d-4380-11de-8f53-000e0c431b58', 'Копия4 Грунт-эмаль по ржавчине зеленая 2л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 147, 40, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy4-076d216b-4380-11de-8f53-000e0c431b58', 'Копия4 Колер Лакра №  1  Темно-корич. 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 136, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy4-076d216d-4380-11de-8f53-000e0c431b58', 'Копия4 Колер Лакра № 10  Ярко-желтый 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 194, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy4-076d216f-4380-11de-8f53-000e0c431b58', 'Копия4 Колер Лакра № 11  Желто-кор. 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 157, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy4-076d2173-4380-11de-8f53-000e0c431b58', 'Копия4 Колер Лакра № 12  Фиалка 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 122, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy4-0916172c-947c-11e3-8d88-005056be1f7b', 'Копия4 Штукатурка структурная декоративная с эффектом "зернистости" размер "зерна" 2мм Белый 15кг', '27566c6a-9ed8-11e3-96ad-005056be1f7b', 0, 46, 14, 'Для декоративной отделки поверхностей внутри и снаружи помещений. Готовая к применению декоративная штукатурка повышенной белизны на основе водной акриловой дисперсии с равномерно зернистой структурой. Скрывает небольшие неровности основания. Легко наносится. Образуемый рельеф получается плавным и приятным на ощупь. Создает прочное влагостойкое, паропроницаемое покрытие, стойкое к атмосферным воздействиям и эксплуатационным нагрузкам. Обладает отличной адгезией к поверхностям из бетона, камня, гипса, цемента, кирпича, ДСП, ДВП. Не содержит растворителей, без запаха. Размер зерна ~ 1,5 мм. Допускает мытье окрашенной поверхности.', 1),
('copy4-129c7f4d-5273-11de-8f53-000e0c431b58', 'Копия4 Краска ВД акриловая д/стен и потолков (PROFESSIONAL) DALI 9л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 262, 32, 'КРАСКА ДАЛИ ДЛЯ СТЕН И ПОТОЛКОВ предназначена для декоративного и экологичного окрашивания стен и потолков внутри помещений с повышенной эксплуатационной нагрузкой. Применяется для окраски кирпичных, бетонных, оштукатуренных и других минеральных поверхностей.', 1),
('copy4-13ce3df2-93b0-11e3-82a4-005056be1f7b', 'Копия4 Грунт-эмаль по ржавчине синий 2л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 44, 19, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy4-1bd57597-93b0-11e3-82a4-005056be1f7b', 'Копия4 Грунт-эмаль по ржавчине синий 0,75л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 39, 25, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy4-3479e733-bce7-11e4-a1f3-005056be1f7b', 'Копия4 Молотковая грунт-эмаль по ржавчине серебристая 2 л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 0, 0, 'Применяется по любым металлическим поверхностям: решетки, ограды, гаражи, различные металлоконструкции, автомобильные детали и др. внутри помещений и в условиях атмосферного воздействия.', 1),
('copy4-35c08325-4386-11de-8f53-000e0c431b58', 'Копия4 Колер Лакра № 13  Салатовый 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 112, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy4-35c08327-4386-11de-8f53-000e0c431b58', 'Копия4 Колер Лакра № 14  Фисташковый 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 200, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy4-35c08329-4386-11de-8f53-000e0c431b58', 'Копия4 Колер Лакра № 15  Морская волна 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 82, 83, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy4-35c0832b-4386-11de-8f53-000e0c431b58', 'Копия4 Колер Лакра № 16  Изумрудный 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 70, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy4-35c0832d-4386-11de-8f53-000e0c431b58', 'Копия4 Колер Лакра № 17  Синий 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 92, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy4-35c0832f-4386-11de-8f53-000e0c431b58', 'Копия4 Колер Лакра № 18  Черный 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 291, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy4-35c08331-4386-11de-8f53-000e0c431b58', 'Копия4 Колер Лакра № 19  Розовый 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 102, 83, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy4-35c08333-4386-11de-8f53-000e0c431b58', 'Копия4 Колер Лакра №  2  Зол-желт. 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 166, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy4-35c08335-4386-11de-8f53-000e0c431b58', 'Копия4 Колер Лакра № 20  Сиреневый 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 94, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy4-35c08337-4386-11de-8f53-000e0c431b58', 'Копия4 Колер Лакра №  3  Бежевый 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 42, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy4-35c08339-4386-11de-8f53-000e0c431b58', 'Копия4 Колер Лакра №  4  Кофейный 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 122, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy4-35c0833b-4386-11de-8f53-000e0c431b58', 'Копия4 Колер Лакра №  5  Коралл 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 104, 83, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy4-35c0833d-4386-11de-8f53-000e0c431b58', 'Копия4 Колер Лакра №  6  Апельсиновый 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 89, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy4-35c0833f-4386-11de-8f53-000e0c431b58', 'Копия4 Колер Лакра №  7  Красный 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 153, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy4-35c08341-4386-11de-8f53-000e0c431b58', 'Копия4 Колер Лакра №  8  Красно-кор. 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 112, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy4-35c08343-4386-11de-8f53-000e0c431b58', 'Копия4 Колер Лакра №  9  Св-корич. 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 108, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy4-56a6f723-ea03-11de-860d-000e0c431b58', 'Копия4 Краска ВД акриловая д/обоев DALI 9л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 134, 29, 'Краска DALI акриловая для обоев обладает отличной адгезией к бумажным, флизелиновым и стеклообоям. Благодаря специально разработанному составу, краска DALI обладает хорошей укрывистостью и без проблем наносится на обои под покраску, сохраняя фактуру. Так же краска DALI может быть нанесена на минеральные поверхности, такие как гипсокартон, штукатурки, шпатлевки и тому подобные покрытия. Единственным условием к поверхности - нормальная влажность и температура в помещении, в котором производятся работы. Краска Dali содержит в составе специальные антибактериальные добавки, препятствующие образованию и размножению био организмов и бактерий. Кроме того краска DALI устойчива к влажной уборке и применению моющих средств, что делает стены и потолок помещения долговечными. Существуют две разновидности краски DALI - база А, подходящая и для машинной и для ручной колеровки, и база С, подходящая только для машинной колеровки. Купить и заколеровать краску DALI, а так же другую продукцию компании Рогнеда Вы можете в интернет магазине СтройБери, а так же в сети розничных магазинов.', 1),
('copy4-56f519d0-4f2c-11de-8f53-000e0c431b58', 'Копия4 Краска ВД акриловая фасадная особопрочная База А DALI 9л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 372, 31, 'Применяется внутри и снаружи помещений по минеральным поверхностям (бетон, кирпич, гипс, цемент, гипсокартон, шпатлевка, штукатурка и др.) ', 1),
('copy4-7a3c5db1-777c-11de-9531-000e0c431b58', 'Копия4 Краска ВД акриловая д/стен и потолков (PROFESSIONAL) База С DALI 9л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 1, 10, 7, 'КРАСКА ДАЛИ ДЛЯ СТЕН И ПОТОЛКОВ предназначена для декоративного и экологичного окрашивания стен и потолков внутри помещений с повышенной эксплуатационной нагрузкой. Применяется для окраски кирпичных, бетонных, оштукатуренных и других минеральных поверхностей.', 1),
('copy4-7a3c5db3-777c-11de-9531-000e0c431b58', 'Копия4 Краска ВД акриловая д/стен и потолков (PROFESSIONAL) База С DALI 5л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 16, 14, 'КРАСКА ДАЛИ ДЛЯ СТЕН И ПОТОЛКОВ предназначена для декоративного и экологичного окрашивания стен и потолков внутри помещений с повышенной эксплуатационной нагрузкой. Применяется для окраски кирпичных, бетонных, оштукатуренных и других минеральных поверхностей.', 1),
('copy4-7a3c5db5-777c-11de-9531-000e0c431b58', 'Копия4 Краска ВД акриловая фасадная особопрочная База С DALI 9л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 33, 9, 'Применяется внутри и снаружи помещений по минеральным поверхностям (бетон, кирпич, гипс, цемент, гипсокартон, шпатлевка, штукатурка и др.) ', 1),
('copy4-7a3c5db7-777c-11de-9531-000e0c431b58', 'Копия4 Краска ВД акриловая фасадная особопрочная База С DALI 5л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 27, 14, 'Применяется внутри и снаружи помещений по минеральным поверхностям (бетон, кирпич, гипс, цемент, гипсокартон, шпатлевка, штукатурка и др.) ', 1),
('copy4-82ebcce8-bce7-11e4-a1f3-005056be1f7b', 'Копия4 Молотковая грунт-эмаль по ржавчине серебристая 10 л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 0, 0, 'Применяется по любым металлическим поверхностям: решетки, ограды, гаражи, различные металлоконструкции, автомобильные детали и др. внутри помещений и в условиях атмосферного воздействия.', 1),
('copy4-9291c63a-5ab3-11dc-be42-000e0c431b58', 'Копия4 Эмаль универсальная белая глянцевая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 97, 48, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy4-9291c63c-5ab3-11dc-be42-000e0c431b58', 'Копия4 Эмаль универсальная черная глянцевая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 91, 51, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy4-9291c63e-5ab3-11dc-be42-000e0c431b58', 'Копия4 Эмаль универсальная красная 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 88, 40, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy4-9291c640-5ab3-11dc-be42-000e0c431b58', 'Копия4 Эмаль универсальная вишневая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 32, 27, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy4-963b6b0a-04a8-11e3-94de-005056be3574', 'Копия4 Штукатурка роллерная декоративная с эффектом "короеда" Белый 15кг', '27566c6a-9ed8-11e3-96ad-005056be1f7b', 0, 68, 14, 'Штукатурка фактурная ЛАКРА с эффект "короеда", готовая к применению декоративная штукатурка повышенной белизны на основе водной акриловой дисперсии. Легко наносится валиком. Создает прочное влагостойкое, паропроницаемое покрытие, стойкое к атмосферным воздействиям и эксплуатационным нагрузкам. Обладает отличной адгезией к поверхностям из бетона, камня, гипса, цемента, кирпича, ДСП, ДВП. Не содержит растворителей, без запаха. Допускает мытье окрашенной поверхности. Колеруется в светлые оттенки.', 1),
('copy4-992163db-a731-11de-90d4-000e0c431b58', 'Копия4 Краска ВД акриловая д/потолков DALI 9л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 1, 196, 30, 'КРАСКА ДАЛИ АКРИЛОВАЯ ДЛЯ ПОТОЛКОВ Предназначена для декоративного окрашивания потолков в сухих жилых и общественных помещениях с низкой эксплуатационной нагрузкой.', 1),
('copy4-992163dd-a731-11de-90d4-000e0c431b58', 'Копия4 Краска ВД латексная д/кухни и ванной DALI 9л БАЗА А (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 96, 26, 'Латексная акриловая краска для декоративного окрашивания стен и потолков в жилых и общественных помещениях с повышенной влажностью воздуха и эксплуатационной нагрузкой. Применяется внутри помещений по минеральным поверхностям (бетон, кирпич, гипс, цемент, гипсокартон, шпатлевка, штукатурка и др.).', 1),
('copy4-a6f80c96-516a-11dd-a89a-000e0c431b58', 'Копия4 Краска ВД акриловая д/обоев DALI 2,5л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 197, 35, 'Краска DALI акриловая для обоев обладает отличной адгезией к бумажным, флизелиновым и стеклообоям. Благодаря специально разработанному составу, краска DALI обладает хорошей укрывистостью и без проблем наносится на обои под покраску, сохраняя фактуру. Так же краска DALI может быть нанесена на минеральные поверхности, такие как гипсокартон, штукатурки, шпатлевки и тому подобные покрытия. Единственным условием к поверхности - нормальная влажность и температура в помещении, в котором производятся работы. Краска Dali содержит в составе специальные антибактериальные добавки, препятствующие образованию и размножению био организмов и бактерий. Кроме того краска DALI устойчива к влажной уборке и применению моющих средств, что делает стены и потолок помещения долговечными. Существуют две разновидности краски DALI - база А, подходящая и для машинной и для ручной колеровки, и база С, подходящая только для машинной колеровки. Купить и заколеровать краску DALI, а так же другую продукцию компании Рогнеда Вы можете в интернет магазине СтройБери, а так же в сети розничных магазинов.', 1),
('copy4-a6f80c98-516a-11dd-a89a-000e0c431b58', 'Копия4 Краска ВД акриловая д/обоев DALI 5л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 136, 30, 'Краска DALI акриловая для обоев обладает отличной адгезией к бумажным, флизелиновым и стеклообоям. Благодаря специально разработанному составу, краска DALI обладает хорошей укрывистостью и без проблем наносится на обои под покраску, сохраняя фактуру. Так же краска DALI может быть нанесена на минеральные поверхности, такие как гипсокартон, штукатурки, шпатлевки и тому подобные покрытия. Единственным условием к поверхности - нормальная влажность и температура в помещении, в котором производятся работы. Краска Dali содержит в составе специальные антибактериальные добавки, препятствующие образованию и размножению био организмов и бактерий. Кроме того краска DALI устойчива к влажной уборке и применению моющих средств, что делает стены и потолок помещения долговечными. Существуют две разновидности краски DALI - база А, подходящая и для машинной и для ручной колеровки, и база С, подходящая только для машинной колеровки. Купить и заколеровать краску DALI, а так же другую продукцию компании Рогнеда Вы можете в интернет магазине СтройБери, а так же в сети розничных магазинов.', 1),
('copy4-a6f80c9c-516a-11dd-a89a-000e0c431b58', 'Копия4 Краска ВД акриловая д/потолков DALI 2,5л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 273, 35, 'КРАСКА ДАЛИ АКРИЛОВАЯ ДЛЯ ПОТОЛКОВ Предназначена для декоративного окрашивания потолков в сухих жилых и общественных помещениях с низкой эксплуатационной нагрузкой.', 1),
('copy4-a6f80c9e-516a-11dd-a89a-000e0c431b58', 'Копия4 Краска ВД акриловая д/потолков DALI 5л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 261, 38, 'КРАСКА ДАЛИ АКРИЛОВАЯ ДЛЯ ПОТОЛКОВ Предназначена для декоративного окрашивания потолков в сухих жилых и общественных помещениях с низкой эксплуатационной нагрузкой.', 1),
('copy4-a6f80ca2-516a-11dd-a89a-000e0c431b58', 'Копия4 Краска ВД акриловая д/стен и потолков (PROFESSIONAL) DALI 2,5л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 354, 39, 'КРАСКА ДАЛИ ДЛЯ СТЕН И ПОТОЛКОВ предназначена для декоративного и экологичного окрашивания стен и потолков внутри помещений с повышенной эксплуатационной нагрузкой. Применяется для окраски кирпичных, бетонных, оштукатуренных и других минеральных поверхностей.', 1),
('copy4-a6f80ca4-516a-11dd-a89a-000e0c431b58', 'Копия4 Краска ВД акриловая д/стен и потолков (PROFESSIONAL) DALI 5л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 310, 34, 'КРАСКА ДАЛИ ДЛЯ СТЕН И ПОТОЛКОВ предназначена для декоративного и экологичного окрашивания стен и потолков внутри помещений с повышенной эксплуатационной нагрузкой. Применяется для окраски кирпичных, бетонных, оштукатуренных и других минеральных поверхностей.', 1),
('copy4-a6f80ca8-516a-11dd-a89a-000e0c431b58', 'Копия4 Краска ВД акриловая фасадная особопрочная База А DALI 5л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 169, 34, 'Применяется внутри и снаружи помещений по минеральным поверхностям (бетон, кирпич, гипс, цемент, гипсокартон, шпатлевка, штукатурка и др.) ', 1),
('copy4-a6f80cac-516a-11dd-a89a-000e0c431b58', 'Копия4 Краска ВД латексная д/кухни и ванной DALI 2,5л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 197, 35, 'Латексная акриловая краска для декоративного окрашивания стен и потолков в жилых и общественных помещениях с повышенной влажностью воздуха и эксплуатационной нагрузкой. Применяется внутри помещений по минеральным поверхностям (бетон, кирпич, гипс, цемент, гипсокартон, шпатлевка, штукатурка и др.).', 1),
('copy4-a6f80cae-516a-11dd-a89a-000e0c431b58', 'Копия4 Краска ВД латексная д/кухни и ванной DALI 5л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 145, 26, 'Латексная акриловая краска для декоративного окрашивания стен и потолков в жилых и общественных помещениях с повышенной влажностью воздуха и эксплуатационной нагрузкой. Применяется внутри помещений по минеральным поверхностям (бетон, кирпич, гипс, цемент, гипсокартон, шпатлевка, штукатурка и др.).', 1),
('copy4-b182dc4f-f994-11e2-98ef-005056be3574', 'Копия4 Молотковая грунт-эмаль по ржавчине черная 0,75л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 91, 26, 'Применяется по любым металлическим поверхностям: решетки, ограды, гаражи, различные металлоконструкции, автомобильные детали и др. внутри помещений и в условиях атмосферного воздействия.', 1),
('copy4-b182dc51-f994-11e2-98ef-005056be3574', 'Копия4 Молотковая грунт-эмаль по ржавчине зеленая 0,75л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 42, 26, 'Применяется по любым металлическим поверхностям: решетки, ограды, гаражи, различные металлоконструкции, автомобильные детали и др. внутри помещений и в условиях атмосферного воздействия.', 1),
('copy4-b7e28649-21de-11df-860d-000e0c431b58', 'Копия4 Краска фактурная Белый 9 кг ("Лакра")', '27566c6a-9ed8-11e3-96ad-005056be1f7b', 0, 11, 21, 'Краска представляет собой белую вязкую однородную массу. Удобна в нанесении, легка в обработке, имеет высокую адгезию к основанию. После высыхания краска образует декоративное рельефное покрытие, скрывающие мелкие дефекты стен. Отличается высокой твердостью и атмосферостойкостью. Возможно последующее нанесение воднодисперсионной краски другого цвета на высохшее фактурное покрытие. Готова к применению.', 1),
('copy4-b7e2864b-21de-11df-860d-000e0c431b58', 'Копия4 Краска фактурная Белый 18 кг ("Лакра")', '27566c6a-9ed8-11e3-96ad-005056be1f7b', 0, 507, 21, 'Краска представляет собой белую вязкую однородную массу. Удобна в нанесении, легка в обработке, имеет высокую адгезию к основанию. После высыхания краска образует декоративное рельефное покрытие, скрывающие мелкие дефекты стен. Отличается высокой твердостью и атмосферостойкостью. Возможно последующее нанесение воднодисперсионной краски другого цвета на высохшее фактурное покрытие. Готова к применению.', 1),
('copy4-c4df9e0d-00c0-11e2-a554-005056be3bd8', 'Копия4 Молотковая грунт-эмаль по ржавчине коричневая 0,75л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 167, 23, 'Применяется по любым металлическим поверхностям: решетки, ограды, гаражи, различные металлоконструкции, автомобильные детали и др. внутри помещений и в условиях атмосферного воздействия.', 1),
('copy4-c4df9e0f-00c0-11e2-a554-005056be3bd8', 'Копия4 Молотковая грунт-эмаль по ржавчине медная 0,75л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 79, 23, 'Применяется по любым металлическим поверхностям: решетки, ограды, гаражи, различные металлоконструкции, автомобильные детали и др. внутри помещений и в условиях атмосферного воздействия.', 1),
('copy4-c4df9e11-00c0-11e2-a554-005056be3bd8', 'Копия4 Молотковая грунт-эмаль по ржавчине серебристая 0,75л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 139, 23, 'Применяется по любым металлическим поверхностям: решетки, ограды, гаражи, различные металлоконструкции, автомобильные детали и др. внутри помещений и в условиях атмосферного воздействия.', 1),
('copy4-c4df9e13-00c0-11e2-a554-005056be3bd8', 'Копия4 Молотковая грунт-эмаль по ржавчине серая 0,75л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 85, 23, 'Применяется по любым металлическим поверхностям: решетки, ограды, гаражи, различные металлоконструкции, автомобильные детали и др. внутри помещений и в условиях атмосферного воздействия.', 1),
('copy4-cf6aa526-48b8-11dd-9342-000e0c431b58', 'Копия4 Эмаль универсальная бронза 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 84, 38, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy4-d5823752-947b-11e3-8d88-005056be1f7b', 'Копия4 Штукатурка фактурная декоративная с эффектом "шубы" Белый 15кг', '27566c6a-9ed8-11e3-96ad-005056be1f7b', 0, 44, 14, 'Готовая к применению декоративная штукатурка повышенной белизны на основе водной акриловой дисперсии. Образует на поверхности рельеф в виде «шубы». Скрывает небольшие неровности основания. Легко наносится валиком. Создает прочное влагостойкое, паропроницаемое покрытие, стойкое к атмосферным воздействиям и эксплуатационным нагрузкам. Обладает отличной адгезией к поверхностям из бетона, камня, гипса, цемента, кирпича, ДСП, ДВП. Не содержит растворителей, без запаха. Допускает мытье окрашенной поверхности.', 1),
('copy4-da49edc1-58f9-11e0-894e-000e0c431b58', 'Копия4 Грунт-эмаль по ржавчине белая 10л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 0, 0, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy4-da49edc3-58f9-11e0-894e-000e0c431b58', 'Копия4 Грунт-эмаль по ржавчине зеленая 10л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 0, 0, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy4-da49edc5-58f9-11e0-894e-000e0c431b58', 'Копия4 Грунт-эмаль по ржавчине коричневая 10л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 2, 0, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy4-da49edc7-58f9-11e0-894e-000e0c431b58', 'Копия4 Грунт-эмаль по ржавчине красно-коричневая 10л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 23, 3, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy4-da49edc9-58f9-11e0-894e-000e0c431b58', 'Копия4 Грунт-эмаль по ржавчине серая 10л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 42, 0, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy4-da49edcb-58f9-11e0-894e-000e0c431b58', 'Копия4 Грунт-эмаль по ржавчине черная 10л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 0, 5, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy4-df210450-93af-11e3-82a4-005056be1f7b', 'Копия4 Грунт-эмаль по ржавчине жёлтый 0,75л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 62, 25, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy4-e242e97f-f29b-11dd-9439-000e0c431b58', 'Копия4 Краска ВД акриловая фасадная всесезонная База А DALI 9л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 71, 17, 'КРАСКА ДАЛИ ФАСАДНАЯ ВСЕСЕЗОННАЯ DALI органорастворимая предназначена для высококачественной отделки фасадов при температуре воздуха до -20 С. Может применяться для ответственного окрашивания поверхностей на основе бетона, штукатурки, ДСП, ацеита, кирпича, пенобетона, дерева во всех климатических поясах, в том числе и в регионах со сложными атмосферными условиями. ', 1),
('copy4-e4020814-4598-11e1-8212-001cc494be80', 'Копия4 Краска ВД латексная д/кухни и ванной DALI 9л БАЗА С (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 0, 0, 'Латексная акриловая краска для декоративного окрашивания стен и потолков в жилых и общественных помещениях с повышенной влажностью воздуха и эксплуатационной нагрузкой. Применяется внутри помещений по минеральным поверхностям (бетон, кирпич, гипс, цемент, гипсокартон, шпатлевка, штукатурка и др.).', 1),
('copy4-e8976171-93af-11e3-82a4-005056be1f7b', 'Копия4 Грунт-эмаль по ржавчине жёлтый 2л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 59, 22, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy4-f0ad1dd1-1f91-11e4-9591-005056be1f7b', 'Копия4 Грунт-эмаль по ржавчине жёлтый 10л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 1, 0, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy4-f5f1fcd6-d1c2-11e3-8b7a-005056be1f7b', 'Копия4 Штукатурка структурная декоративная с эффектом "зернистости" размер "зерна" 1,5мм Белый 15кг', '27566c6a-9ed8-11e3-96ad-005056be1f7b', 0, 39, 0, 'Для декоративной отделки поверхностей внутри и снаружи помещений. Готовая к применению декоративная штукатурка повышенной белизны на основе водной акриловой дисперсии с равномерно зернистой структурой. Скрывает небольшие неровности основания. Легко наносится. Образуемый рельеф получается плавным и приятным на ощупь. Создает прочное влагостойкое, паропроницаемое покрытие, стойкое к атмосферным воздействиям и эксплуатационным нагрузкам. Обладает отличной адгезией к поверхностям из бетона, камня, гипса, цемента, кирпича, ДСП, ДВП. Не содержит растворителей, без запаха. Размер зерна ~ 1,5 мм. Допускает мытье окрашенной поверхности.', 1),
('copy4-fbb89466-93af-11e3-82a4-005056be1f7b', 'Копия4 Грунт-эмаль по ржавчине красный 0,75л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 23, 21, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy4-fded4984-d1c2-11e3-8b7a-005056be1f7b', 'Копия4 Штукатурка структурная декоративная с эффектом "зернистости" размер "зерна" 13мм Белый 15кг', '27566c6a-9ed8-11e3-96ad-005056be1f7b', 0, 19, 0, 'Для декоративной отделки поверхностей внутри и снаружи помещений. Готовая к применению декоративная штукатурка повышенной белизны на основе водной акриловой дисперсии с равномерно зернистой структурой. Скрывает небольшие неровности основания. Легко наносится. Образуемый рельеф получается плавным и приятным на ощупь. Создает прочное влагостойкое, паропроницаемое покрытие, стойкое к атмосферным воздействиям и эксплуатационным нагрузкам. Обладает отличной адгезией к поверхностям из бетона, камня, гипса, цемента, кирпича, ДСП, ДВП. Не содержит растворителей, без запаха. Размер зерна ~ 1,5 мм. Допускает мытье окрашенной поверхности.', 1),
('copy4-fea6c165-5ab6-11dc-be42-000e0c431b58', 'Копия4 Эмаль универсальная хаки 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 52, 27, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy4-fea6c167-5ab6-11dc-be42-000e0c431b58', 'Копия4 Эмаль универсальная светло-зеленая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 35, 27, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy4-fea6c169-5ab6-11dc-be42-000e0c431b58', 'Копия4 Эмаль универсальная темно-зеленая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 38, 29, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy4-fea6c16b-5ab6-11dc-be42-000e0c431b58', 'Копия4 Эмаль универсальная фисташковая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 39, 27, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy4-fea6c16d-5ab6-11dc-be42-000e0c431b58', 'Копия4 Эмаль универсальная бежевая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 42, 31, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy4-fea6c16f-5ab6-11dc-be42-000e0c431b58', 'Копия4 Эмаль универсальная голубая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 38, 31, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy4-fea6c171-5ab6-11dc-be42-000e0c431b58', 'Копия4 Эмаль универсальная синяя 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 51, 30, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy4-fea6c173-5ab6-11dc-be42-000e0c431b58', 'Копия4 Эмаль универсальная коричневая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 64, 38, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy4-fea6c175-5ab6-11dc-be42-000e0c431b58', 'Копия4 Эмаль универсальная желтая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 48, 31, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy4-fea6c177-5ab6-11dc-be42-000e0c431b58', 'Копия4 Эмаль универсальная светло-серая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 41, 29, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy4-fea6c179-5ab6-11dc-be42-000e0c431b58', 'Копия4 Эмаль универсальная серая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 71, 34, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy4-fea6c17b-5ab6-11dc-be42-000e0c431b58', 'Копия4 Эмаль универсальная оранжевая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 47, 28, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy4-fea6c17d-5ab6-11dc-be42-000e0c431b58', 'Копия4 Эмаль универсальная бирюзовая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 37, 28, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy4-fea6c17f-5ab6-11dc-be42-000e0c431b58', 'Копия4 Эмаль универсальная сиреневая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 36, 28, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy4-fea6c181-5ab6-11dc-be42-000e0c431b58', 'Копия4 Эмаль универсальная охра 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 34, 26, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy4-fea6c183-5ab6-11dc-be42-000e0c431b58', 'Копия4 Эмаль универсальная какао 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 37, 29, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy4-fea6c185-5ab6-11dc-be42-000e0c431b58', 'Копия4 Эмаль универсальная красно-коричневая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 39, 27, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy4-fea6c187-5ab6-11dc-be42-000e0c431b58', 'Копия4 Эмаль универсальная алюминий 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 159, 28, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy4-fea6c189-5ab6-11dc-be42-000e0c431b58', 'Копия4 Эмаль универсальная хром 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 62, 44, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy4-fea6c18b-5ab6-11dc-be42-000e0c431b58', 'Копия4 Эмаль универсальная золото 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 65, 45, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy4-fea6c18d-5ab6-11dc-be42-000e0c431b58', 'Копия4 Эмаль универсальная медь 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 42, 28, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy4-fea6c18f-5ab6-11dc-be42-000e0c431b58', 'Копия4 Эмаль универсальная белая матовая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 92, 45, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy4-fea6c191-5ab6-11dc-be42-000e0c431b58', 'Копия4 Эмаль универсальная черная матовая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 99, 51, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy5-047805a5-fe8c-11e3-bbdb-005056be1f7b', 'Копия5 Краска ВД акриловая д/стен и потолков (PROFESSIONAL) База С DALI 2,5л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 14, 7, 'КРАСКА ДАЛИ ДЛЯ СТЕН И ПОТОЛКОВ предназначена для декоративного и экологичного окрашивания стен и потолков внутри помещений с повышенной эксплуатационной нагрузкой. Применяется для окраски кирпичных, бетонных, оштукатуренных и других минеральных поверхностей.', 1),
('copy5-04834f06-93b0-11e3-82a4-005056be1f7b', 'Копия5 Грунт-эмаль по ржавчине красный 2л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 14, 19, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy5-076d2137-4380-11de-8f53-000e0c431b58', 'Копия5 Грунт-эмаль по ржавчине черная 0,75л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 391, 75, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy5-076d2139-4380-11de-8f53-000e0c431b58', 'Копия5 Грунт-эмаль по ржавчине черная 2л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 327, 53, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy5-076d213b-4380-11de-8f53-000e0c431b58', 'Копия5 Грунт-эмаль по ржавчине белая 0,75л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 242, 45, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy5-076d213d-4380-11de-8f53-000e0c431b58', 'Копия5 Грунт-эмаль по ржавчине белая 2л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 202, 36, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy5-076d213f-4380-11de-8f53-000e0c431b58', 'Копия5 Грунт-эмаль по ржавчине коричневая 0,75л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 291, 42, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy5-076d2141-4380-11de-8f53-000e0c431b58', 'Копия5 Грунт-эмаль по ржавчине коричневая 2л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 339, 42, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy5-076d2143-4380-11de-8f53-000e0c431b58', 'Копия5 Грунт-эмаль по ржавчине красно-коричневая 0,75л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 184, 42, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy5-076d2145-4380-11de-8f53-000e0c431b58', 'Копия5 Грунт-эмаль по ржавчине красно-коричневая 2л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 245, 37, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy5-076d2147-4380-11de-8f53-000e0c431b58', 'Копия5 Грунт-эмаль по ржавчине серая 0,75л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 502, 52, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy5-076d2149-4380-11de-8f53-000e0c431b58', 'Копия5 Грунт-эмаль по ржавчине серая 2л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 602, 46, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy5-076d214b-4380-11de-8f53-000e0c431b58', 'Копия5 Грунт-эмаль по ржавчине зеленая 0,75л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 130, 36, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy5-076d214d-4380-11de-8f53-000e0c431b58', 'Копия5 Грунт-эмаль по ржавчине зеленая 2л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 147, 40, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy5-076d216b-4380-11de-8f53-000e0c431b58', 'Копия5 Колер Лакра №  1  Темно-корич. 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 136, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy5-076d216d-4380-11de-8f53-000e0c431b58', 'Копия5 Колер Лакра № 10  Ярко-желтый 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 194, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy5-076d216f-4380-11de-8f53-000e0c431b58', 'Копия5 Колер Лакра № 11  Желто-кор. 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 157, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy5-076d2173-4380-11de-8f53-000e0c431b58', 'Копия5 Колер Лакра № 12  Фиалка 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 122, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy5-0916172c-947c-11e3-8d88-005056be1f7b', 'Копия5 Штукатурка структурная декоративная с эффектом "зернистости" размер "зерна" 2мм Белый 15кг', '27566c6a-9ed8-11e3-96ad-005056be1f7b', 0, 46, 14, 'Для декоративной отделки поверхностей внутри и снаружи помещений. Готовая к применению декоративная штукатурка повышенной белизны на основе водной акриловой дисперсии с равномерно зернистой структурой. Скрывает небольшие неровности основания. Легко наносится. Образуемый рельеф получается плавным и приятным на ощупь. Создает прочное влагостойкое, паропроницаемое покрытие, стойкое к атмосферным воздействиям и эксплуатационным нагрузкам. Обладает отличной адгезией к поверхностям из бетона, камня, гипса, цемента, кирпича, ДСП, ДВП. Не содержит растворителей, без запаха. Размер зерна ~ 1,5 мм. Допускает мытье окрашенной поверхности.', 1),
('copy5-129c7f4d-5273-11de-8f53-000e0c431b58', 'Копия5 Краска ВД акриловая д/стен и потолков (PROFESSIONAL) DALI 9л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 262, 32, 'КРАСКА ДАЛИ ДЛЯ СТЕН И ПОТОЛКОВ предназначена для декоративного и экологичного окрашивания стен и потолков внутри помещений с повышенной эксплуатационной нагрузкой. Применяется для окраски кирпичных, бетонных, оштукатуренных и других минеральных поверхностей.', 1),
('copy5-13ce3df2-93b0-11e3-82a4-005056be1f7b', 'Копия5 Грунт-эмаль по ржавчине синий 2л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 44, 19, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy5-1bd57597-93b0-11e3-82a4-005056be1f7b', 'Копия5 Грунт-эмаль по ржавчине синий 0,75л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 39, 25, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy5-3479e733-bce7-11e4-a1f3-005056be1f7b', 'Копия5 Молотковая грунт-эмаль по ржавчине серебристая 2 л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 0, 0, 'Применяется по любым металлическим поверхностям: решетки, ограды, гаражи, различные металлоконструкции, автомобильные детали и др. внутри помещений и в условиях атмосферного воздействия.', 1),
('copy5-35c08325-4386-11de-8f53-000e0c431b58', 'Копия5 Колер Лакра № 13  Салатовый 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 112, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy5-35c08327-4386-11de-8f53-000e0c431b58', 'Копия5 Колер Лакра № 14  Фисташковый 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 200, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy5-35c08329-4386-11de-8f53-000e0c431b58', 'Копия5 Колер Лакра № 15  Морская волна 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 82, 83, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy5-35c0832b-4386-11de-8f53-000e0c431b58', 'Копия5 Колер Лакра № 16  Изумрудный 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 70, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy5-35c0832d-4386-11de-8f53-000e0c431b58', 'Копия5 Колер Лакра № 17  Синий 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 92, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy5-35c0832f-4386-11de-8f53-000e0c431b58', 'Копия5 Колер Лакра № 18  Черный 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 291, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy5-35c08331-4386-11de-8f53-000e0c431b58', 'Копия5 Колер Лакра № 19  Розовый 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 102, 83, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy5-35c08333-4386-11de-8f53-000e0c431b58', 'Копия5 Колер Лакра №  2  Зол-желт. 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 166, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy5-35c08335-4386-11de-8f53-000e0c431b58', 'Копия5 Колер Лакра № 20  Сиреневый 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 94, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy5-35c08337-4386-11de-8f53-000e0c431b58', 'Копия5 Колер Лакра №  3  Бежевый 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 42, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy5-35c08339-4386-11de-8f53-000e0c431b58', 'Копия5 Колер Лакра №  4  Кофейный 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 122, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy5-35c0833b-4386-11de-8f53-000e0c431b58', 'Копия5 Колер Лакра №  5  Коралл 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 104, 83, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy5-35c0833d-4386-11de-8f53-000e0c431b58', 'Копия5 Колер Лакра №  6  Апельсиновый 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 89, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy5-35c0833f-4386-11de-8f53-000e0c431b58', 'Копия5 Колер Лакра №  7  Красный 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 153, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy5-35c08341-4386-11de-8f53-000e0c431b58', 'Копия5 Колер Лакра №  8  Красно-кор. 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 112, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy5-35c08343-4386-11de-8f53-000e0c431b58', 'Копия5 Колер Лакра №  9  Св-корич. 100 мл', '076d216a-4380-11de-8f53-000e0c431b58', 0, 108, 90, 'Колер позволяет получать светлые оттенки, не оказывая влияния на глянец лакокрасочного покрытия. Предназначен для тонирования красок, штукатурок и шпатлевок на водной основе. Для декорирования фасадных поверхностей возможно использовать в концентрированном виде.', 1),
('copy5-56a6f723-ea03-11de-860d-000e0c431b58', 'Копия5 Краска ВД акриловая д/обоев DALI 9л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 134, 29, 'Краска DALI акриловая для обоев обладает отличной адгезией к бумажным, флизелиновым и стеклообоям. Благодаря специально разработанному составу, краска DALI обладает хорошей укрывистостью и без проблем наносится на обои под покраску, сохраняя фактуру. Так же краска DALI может быть нанесена на минеральные поверхности, такие как гипсокартон, штукатурки, шпатлевки и тому подобные покрытия. Единственным условием к поверхности - нормальная влажность и температура в помещении, в котором производятся работы. Краска Dali содержит в составе специальные антибактериальные добавки, препятствующие образованию и размножению био организмов и бактерий. Кроме того краска DALI устойчива к влажной уборке и применению моющих средств, что делает стены и потолок помещения долговечными. Существуют две разновидности краски DALI - база А, подходящая и для машинной и для ручной колеровки, и база С, подходящая только для машинной колеровки. Купить и заколеровать краску DALI, а так же другую продукцию компании Рогнеда Вы можете в интернет магазине СтройБери, а так же в сети розничных магазинов.', 1),
('copy5-56f519d0-4f2c-11de-8f53-000e0c431b58', 'Копия5 Краска ВД акриловая фасадная особопрочная База А DALI 9л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 372, 31, 'Применяется внутри и снаружи помещений по минеральным поверхностям (бетон, кирпич, гипс, цемент, гипсокартон, шпатлевка, штукатурка и др.) ', 1),
('copy5-7a3c5db1-777c-11de-9531-000e0c431b58', 'Копия5 Краска ВД акриловая д/стен и потолков (PROFESSIONAL) База С DALI 9л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 1, 10, 7, 'КРАСКА ДАЛИ ДЛЯ СТЕН И ПОТОЛКОВ предназначена для декоративного и экологичного окрашивания стен и потолков внутри помещений с повышенной эксплуатационной нагрузкой. Применяется для окраски кирпичных, бетонных, оштукатуренных и других минеральных поверхностей.', 1),
('copy5-7a3c5db3-777c-11de-9531-000e0c431b58', 'Копия5 Краска ВД акриловая д/стен и потолков (PROFESSIONAL) База С DALI 5л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 16, 14, 'КРАСКА ДАЛИ ДЛЯ СТЕН И ПОТОЛКОВ предназначена для декоративного и экологичного окрашивания стен и потолков внутри помещений с повышенной эксплуатационной нагрузкой. Применяется для окраски кирпичных, бетонных, оштукатуренных и других минеральных поверхностей.', 1),
('copy5-7a3c5db5-777c-11de-9531-000e0c431b58', 'Копия5 Краска ВД акриловая фасадная особопрочная База С DALI 9л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 33, 9, 'Применяется внутри и снаружи помещений по минеральным поверхностям (бетон, кирпич, гипс, цемент, гипсокартон, шпатлевка, штукатурка и др.) ', 1),
('copy5-7a3c5db7-777c-11de-9531-000e0c431b58', 'Копия5 Краска ВД акриловая фасадная особопрочная База С DALI 5л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 27, 14, 'Применяется внутри и снаружи помещений по минеральным поверхностям (бетон, кирпич, гипс, цемент, гипсокартон, шпатлевка, штукатурка и др.) ', 1),
('copy5-82ebcce8-bce7-11e4-a1f3-005056be1f7b', 'Копия5 Молотковая грунт-эмаль по ржавчине серебристая 10 л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 0, 0, 'Применяется по любым металлическим поверхностям: решетки, ограды, гаражи, различные металлоконструкции, автомобильные детали и др. внутри помещений и в условиях атмосферного воздействия.', 1),
('copy5-9291c63a-5ab3-11dc-be42-000e0c431b58', 'Копия5 Эмаль универсальная белая глянцевая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 97, 48, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy5-9291c63c-5ab3-11dc-be42-000e0c431b58', 'Копия5 Эмаль универсальная черная глянцевая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 91, 51, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy5-9291c63e-5ab3-11dc-be42-000e0c431b58', 'Копия5 Эмаль универсальная красная 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 88, 40, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy5-9291c640-5ab3-11dc-be42-000e0c431b58', 'Копия5 Эмаль универсальная вишневая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 32, 27, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy5-963b6b0a-04a8-11e3-94de-005056be3574', 'Копия5 Штукатурка роллерная декоративная с эффектом "короеда" Белый 15кг', '27566c6a-9ed8-11e3-96ad-005056be1f7b', 0, 68, 14, 'Штукатурка фактурная ЛАКРА с эффект "короеда", готовая к применению декоративная штукатурка повышенной белизны на основе водной акриловой дисперсии. Легко наносится валиком. Создает прочное влагостойкое, паропроницаемое покрытие, стойкое к атмосферным воздействиям и эксплуатационным нагрузкам. Обладает отличной адгезией к поверхностям из бетона, камня, гипса, цемента, кирпича, ДСП, ДВП. Не содержит растворителей, без запаха. Допускает мытье окрашенной поверхности. Колеруется в светлые оттенки.', 1),
('copy5-992163db-a731-11de-90d4-000e0c431b58', 'Копия5 Краска ВД акриловая д/потолков DALI 9л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 1, 196, 30, 'КРАСКА ДАЛИ АКРИЛОВАЯ ДЛЯ ПОТОЛКОВ Предназначена для декоративного окрашивания потолков в сухих жилых и общественных помещениях с низкой эксплуатационной нагрузкой.', 1),
('copy5-992163dd-a731-11de-90d4-000e0c431b58', 'Копия5 Краска ВД латексная д/кухни и ванной DALI 9л БАЗА А (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 96, 26, 'Латексная акриловая краска для декоративного окрашивания стен и потолков в жилых и общественных помещениях с повышенной влажностью воздуха и эксплуатационной нагрузкой. Применяется внутри помещений по минеральным поверхностям (бетон, кирпич, гипс, цемент, гипсокартон, шпатлевка, штукатурка и др.).', 1),
('copy5-a6f80c96-516a-11dd-a89a-000e0c431b58', 'Копия5 Краска ВД акриловая д/обоев DALI 2,5л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 197, 35, 'Краска DALI акриловая для обоев обладает отличной адгезией к бумажным, флизелиновым и стеклообоям. Благодаря специально разработанному составу, краска DALI обладает хорошей укрывистостью и без проблем наносится на обои под покраску, сохраняя фактуру. Так же краска DALI может быть нанесена на минеральные поверхности, такие как гипсокартон, штукатурки, шпатлевки и тому подобные покрытия. Единственным условием к поверхности - нормальная влажность и температура в помещении, в котором производятся работы. Краска Dali содержит в составе специальные антибактериальные добавки, препятствующие образованию и размножению био организмов и бактерий. Кроме того краска DALI устойчива к влажной уборке и применению моющих средств, что делает стены и потолок помещения долговечными. Существуют две разновидности краски DALI - база А, подходящая и для машинной и для ручной колеровки, и база С, подходящая только для машинной колеровки. Купить и заколеровать краску DALI, а так же другую продукцию компании Рогнеда Вы можете в интернет магазине СтройБери, а так же в сети розничных магазинов.', 1),
('copy5-a6f80c98-516a-11dd-a89a-000e0c431b58', 'Копия5 Краска ВД акриловая д/обоев DALI 5л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 136, 30, 'Краска DALI акриловая для обоев обладает отличной адгезией к бумажным, флизелиновым и стеклообоям. Благодаря специально разработанному составу, краска DALI обладает хорошей укрывистостью и без проблем наносится на обои под покраску, сохраняя фактуру. Так же краска DALI может быть нанесена на минеральные поверхности, такие как гипсокартон, штукатурки, шпатлевки и тому подобные покрытия. Единственным условием к поверхности - нормальная влажность и температура в помещении, в котором производятся работы. Краска Dali содержит в составе специальные антибактериальные добавки, препятствующие образованию и размножению био организмов и бактерий. Кроме того краска DALI устойчива к влажной уборке и применению моющих средств, что делает стены и потолок помещения долговечными. Существуют две разновидности краски DALI - база А, подходящая и для машинной и для ручной колеровки, и база С, подходящая только для машинной колеровки. Купить и заколеровать краску DALI, а так же другую продукцию компании Рогнеда Вы можете в интернет магазине СтройБери, а так же в сети розничных магазинов.', 1),
('copy5-a6f80c9c-516a-11dd-a89a-000e0c431b58', 'Копия5 Краска ВД акриловая д/потолков DALI 2,5л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 273, 35, 'КРАСКА ДАЛИ АКРИЛОВАЯ ДЛЯ ПОТОЛКОВ Предназначена для декоративного окрашивания потолков в сухих жилых и общественных помещениях с низкой эксплуатационной нагрузкой.', 1),
('copy5-a6f80c9e-516a-11dd-a89a-000e0c431b58', 'Копия5 Краска ВД акриловая д/потолков DALI 5л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 261, 38, 'КРАСКА ДАЛИ АКРИЛОВАЯ ДЛЯ ПОТОЛКОВ Предназначена для декоративного окрашивания потолков в сухих жилых и общественных помещениях с низкой эксплуатационной нагрузкой.', 1),
('copy5-a6f80ca2-516a-11dd-a89a-000e0c431b58', 'Копия5 Краска ВД акриловая д/стен и потолков (PROFESSIONAL) DALI 2,5л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 354, 39, 'КРАСКА ДАЛИ ДЛЯ СТЕН И ПОТОЛКОВ предназначена для декоративного и экологичного окрашивания стен и потолков внутри помещений с повышенной эксплуатационной нагрузкой. Применяется для окраски кирпичных, бетонных, оштукатуренных и других минеральных поверхностей.', 1),
('copy5-a6f80ca4-516a-11dd-a89a-000e0c431b58', 'Копия5 Краска ВД акриловая д/стен и потолков (PROFESSIONAL) DALI 5л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 310, 34, 'КРАСКА ДАЛИ ДЛЯ СТЕН И ПОТОЛКОВ предназначена для декоративного и экологичного окрашивания стен и потолков внутри помещений с повышенной эксплуатационной нагрузкой. Применяется для окраски кирпичных, бетонных, оштукатуренных и других минеральных поверхностей.', 1),
('copy5-a6f80ca8-516a-11dd-a89a-000e0c431b58', 'Копия5 Краска ВД акриловая фасадная особопрочная База А DALI 5л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 169, 34, 'Применяется внутри и снаружи помещений по минеральным поверхностям (бетон, кирпич, гипс, цемент, гипсокартон, шпатлевка, штукатурка и др.) ', 1),
('copy5-a6f80cac-516a-11dd-a89a-000e0c431b58', 'Копия5 Краска ВД латексная д/кухни и ванной DALI 2,5л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 197, 35, 'Латексная акриловая краска для декоративного окрашивания стен и потолков в жилых и общественных помещениях с повышенной влажностью воздуха и эксплуатационной нагрузкой. Применяется внутри помещений по минеральным поверхностям (бетон, кирпич, гипс, цемент, гипсокартон, шпатлевка, штукатурка и др.).', 1),
('copy5-a6f80cae-516a-11dd-a89a-000e0c431b58', 'Копия5 Краска ВД латексная д/кухни и ванной DALI 5л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 145, 26, 'Латексная акриловая краска для декоративного окрашивания стен и потолков в жилых и общественных помещениях с повышенной влажностью воздуха и эксплуатационной нагрузкой. Применяется внутри помещений по минеральным поверхностям (бетон, кирпич, гипс, цемент, гипсокартон, шпатлевка, штукатурка и др.).', 1),
('copy5-b182dc4f-f994-11e2-98ef-005056be3574', 'Копия5 Молотковая грунт-эмаль по ржавчине черная 0,75л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 91, 26, 'Применяется по любым металлическим поверхностям: решетки, ограды, гаражи, различные металлоконструкции, автомобильные детали и др. внутри помещений и в условиях атмосферного воздействия.', 1),
('copy5-b182dc51-f994-11e2-98ef-005056be3574', 'Копия5 Молотковая грунт-эмаль по ржавчине зеленая 0,75л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 42, 26, 'Применяется по любым металлическим поверхностям: решетки, ограды, гаражи, различные металлоконструкции, автомобильные детали и др. внутри помещений и в условиях атмосферного воздействия.', 1),
('copy5-b7e28649-21de-11df-860d-000e0c431b58', 'Копия5 Краска фактурная Белый 9 кг ("Лакра")', '27566c6a-9ed8-11e3-96ad-005056be1f7b', 0, 11, 21, 'Краска представляет собой белую вязкую однородную массу. Удобна в нанесении, легка в обработке, имеет высокую адгезию к основанию. После высыхания краска образует декоративное рельефное покрытие, скрывающие мелкие дефекты стен. Отличается высокой твердостью и атмосферостойкостью. Возможно последующее нанесение воднодисперсионной краски другого цвета на высохшее фактурное покрытие. Готова к применению.', 1),
('copy5-b7e2864b-21de-11df-860d-000e0c431b58', 'Копия5 Краска фактурная Белый 18 кг ("Лакра")', '27566c6a-9ed8-11e3-96ad-005056be1f7b', 0, 507, 21, 'Краска представляет собой белую вязкую однородную массу. Удобна в нанесении, легка в обработке, имеет высокую адгезию к основанию. После высыхания краска образует декоративное рельефное покрытие, скрывающие мелкие дефекты стен. Отличается высокой твердостью и атмосферостойкостью. Возможно последующее нанесение воднодисперсионной краски другого цвета на высохшее фактурное покрытие. Готова к применению.', 1),
('copy5-c4df9e0d-00c0-11e2-a554-005056be3bd8', 'Копия5 Молотковая грунт-эмаль по ржавчине коричневая 0,75л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 167, 23, 'Применяется по любым металлическим поверхностям: решетки, ограды, гаражи, различные металлоконструкции, автомобильные детали и др. внутри помещений и в условиях атмосферного воздействия.', 1),
('copy5-c4df9e0f-00c0-11e2-a554-005056be3bd8', 'Копия5 Молотковая грунт-эмаль по ржавчине медная 0,75л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 79, 23, 'Применяется по любым металлическим поверхностям: решетки, ограды, гаражи, различные металлоконструкции, автомобильные детали и др. внутри помещений и в условиях атмосферного воздействия.', 1),
('copy5-c4df9e11-00c0-11e2-a554-005056be3bd8', 'Копия5 Молотковая грунт-эмаль по ржавчине серебристая 0,75л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 139, 23, 'Применяется по любым металлическим поверхностям: решетки, ограды, гаражи, различные металлоконструкции, автомобильные детали и др. внутри помещений и в условиях атмосферного воздействия.', 1),
('copy5-c4df9e13-00c0-11e2-a554-005056be3bd8', 'Копия5 Молотковая грунт-эмаль по ржавчине серая 0,75л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 85, 23, 'Применяется по любым металлическим поверхностям: решетки, ограды, гаражи, различные металлоконструкции, автомобильные детали и др. внутри помещений и в условиях атмосферного воздействия.', 1),
('copy5-cf6aa526-48b8-11dd-9342-000e0c431b58', 'Копия5 Эмаль универсальная бронза 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 84, 38, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy5-d5823752-947b-11e3-8d88-005056be1f7b', 'Копия5 Штукатурка фактурная декоративная с эффектом "шубы" Белый 15кг', '27566c6a-9ed8-11e3-96ad-005056be1f7b', 0, 44, 14, 'Готовая к применению декоративная штукатурка повышенной белизны на основе водной акриловой дисперсии. Образует на поверхности рельеф в виде «шубы». Скрывает небольшие неровности основания. Легко наносится валиком. Создает прочное влагостойкое, паропроницаемое покрытие, стойкое к атмосферным воздействиям и эксплуатационным нагрузкам. Обладает отличной адгезией к поверхностям из бетона, камня, гипса, цемента, кирпича, ДСП, ДВП. Не содержит растворителей, без запаха. Допускает мытье окрашенной поверхности.', 1),
('copy5-da49edc1-58f9-11e0-894e-000e0c431b58', 'Копия5 Грунт-эмаль по ржавчине белая 10л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 0, 0, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy5-da49edc3-58f9-11e0-894e-000e0c431b58', 'Копия5 Грунт-эмаль по ржавчине зеленая 10л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 0, 0, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy5-da49edc5-58f9-11e0-894e-000e0c431b58', 'Копия5 Грунт-эмаль по ржавчине коричневая 10л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 2, 0, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy5-da49edc7-58f9-11e0-894e-000e0c431b58', 'Копия5 Грунт-эмаль по ржавчине красно-коричневая 10л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 23, 3, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy5-da49edc9-58f9-11e0-894e-000e0c431b58', 'Копия5 Грунт-эмаль по ржавчине серая 10л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 42, 0, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy5-da49edcb-58f9-11e0-894e-000e0c431b58', 'Копия5 Грунт-эмаль по ржавчине черная 10л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 0, 5, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy5-df210450-93af-11e3-82a4-005056be1f7b', 'Копия5 Грунт-эмаль по ржавчине жёлтый 0,75л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 62, 25, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy5-e242e97f-f29b-11dd-9439-000e0c431b58', 'Копия5 Краска ВД акриловая фасадная всесезонная База А DALI 9л (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 71, 17, 'КРАСКА ДАЛИ ФАСАДНАЯ ВСЕСЕЗОННАЯ DALI органорастворимая предназначена для высококачественной отделки фасадов при температуре воздуха до -20 С. Может применяться для ответственного окрашивания поверхностей на основе бетона, штукатурки, ДСП, ацеита, кирпича, пенобетона, дерева во всех климатических поясах, в том числе и в регионах со сложными атмосферными условиями. ', 1),
('copy5-e4020814-4598-11e1-8212-001cc494be80', 'Копия5 Краска ВД латексная д/кухни и ванной DALI 9л БАЗА С (Рогнеда)', 'a6f80c91-516a-11dd-a89a-000e0c431b58', 0, 0, 0, 'Латексная акриловая краска для декоративного окрашивания стен и потолков в жилых и общественных помещениях с повышенной влажностью воздуха и эксплуатационной нагрузкой. Применяется внутри помещений по минеральным поверхностям (бетон, кирпич, гипс, цемент, гипсокартон, шпатлевка, штукатурка и др.).', 1),
('copy5-e8976171-93af-11e3-82a4-005056be1f7b', 'Копия5 Грунт-эмаль по ржавчине жёлтый 2л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 59, 22, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy5-f0ad1dd1-1f91-11e4-9591-005056be1f7b', 'Копия5 Грунт-эмаль по ржавчине жёлтый 10л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 1, 0, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy5-f5f1fcd6-d1c2-11e3-8b7a-005056be1f7b', 'Копия5 Штукатурка структурная декоративная с эффектом "зернистости" размер "зерна" 1,5мм Белый 15кг', '27566c6a-9ed8-11e3-96ad-005056be1f7b', 0, 39, 0, 'Для декоративной отделки поверхностей внутри и снаружи помещений. Готовая к применению декоративная штукатурка повышенной белизны на основе водной акриловой дисперсии с равномерно зернистой структурой. Скрывает небольшие неровности основания. Легко наносится. Образуемый рельеф получается плавным и приятным на ощупь. Создает прочное влагостойкое, паропроницаемое покрытие, стойкое к атмосферным воздействиям и эксплуатационным нагрузкам. Обладает отличной адгезией к поверхностям из бетона, камня, гипса, цемента, кирпича, ДСП, ДВП. Не содержит растворителей, без запаха. Размер зерна ~ 1,5 мм. Допускает мытье окрашенной поверхности.', 1),
('copy5-fbb89466-93af-11e3-82a4-005056be1f7b', 'Копия5 Грунт-эмаль по ржавчине красный 0,75л  DALI', '01f691f2-87cd-11de-8f0e-000e0c431b58', 0, 23, 21, 'Применяется для наружных и внутренних работ для окрашивания цветных металлов, оцинкованного металла и нержавеющей стали. Металлическую поверхность, обработанную грунт-эмалью, эффективно защищает от образования коррозии и создает атмосферостойкое, водостойкое покрытие.', 1),
('copy5-fded4984-d1c2-11e3-8b7a-005056be1f7b', 'Копия5 Штукатурка структурная декоративная с эффектом "зернистости" размер "зерна" 13мм Белый 15кг', '27566c6a-9ed8-11e3-96ad-005056be1f7b', 0, 19, 0, 'Для декоративной отделки поверхностей внутри и снаружи помещений. Готовая к применению декоративная штукатурка повышенной белизны на основе водной акриловой дисперсии с равномерно зернистой структурой. Скрывает небольшие неровности основания. Легко наносится. Образуемый рельеф получается плавным и приятным на ощупь. Создает прочное влагостойкое, паропроницаемое покрытие, стойкое к атмосферным воздействиям и эксплуатационным нагрузкам. Обладает отличной адгезией к поверхностям из бетона, камня, гипса, цемента, кирпича, ДСП, ДВП. Не содержит растворителей, без запаха. Размер зерна ~ 1,5 мм. Допускает мытье окрашенной поверхности.', 1),
('copy5-fea6c165-5ab6-11dc-be42-000e0c431b58', 'Копия5 Эмаль универсальная хаки 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 52, 27, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy5-fea6c167-5ab6-11dc-be42-000e0c431b58', 'Копия5 Эмаль универсальная светло-зеленая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 35, 27, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy5-fea6c169-5ab6-11dc-be42-000e0c431b58', 'Копия5 Эмаль универсальная темно-зеленая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 38, 29, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy5-fea6c16b-5ab6-11dc-be42-000e0c431b58', 'Копия5 Эмаль универсальная фисташковая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 39, 27, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy5-fea6c16d-5ab6-11dc-be42-000e0c431b58', 'Копия5 Эмаль универсальная бежевая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 42, 31, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy5-fea6c16f-5ab6-11dc-be42-000e0c431b58', 'Копия5 Эмаль универсальная голубая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 38, 31, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy5-fea6c171-5ab6-11dc-be42-000e0c431b58', 'Копия5 Эмаль универсальная синяя 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 51, 30, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy5-fea6c173-5ab6-11dc-be42-000e0c431b58', 'Копия5 Эмаль универсальная коричневая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 64, 38, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy5-fea6c175-5ab6-11dc-be42-000e0c431b58', 'Копия5 Эмаль универсальная желтая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 48, 31, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy5-fea6c177-5ab6-11dc-be42-000e0c431b58', 'Копия5 Эмаль универсальная светло-серая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 41, 29, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy5-fea6c179-5ab6-11dc-be42-000e0c431b58', 'Копия5 Эмаль универсальная серая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 71, 34, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy5-fea6c17b-5ab6-11dc-be42-000e0c431b58', 'Копия5 Эмаль универсальная оранжевая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 47, 28, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy5-fea6c17d-5ab6-11dc-be42-000e0c431b58', 'Копия5 Эмаль универсальная бирюзовая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 37, 28, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy5-fea6c17f-5ab6-11dc-be42-000e0c431b58', 'Копия5 Эмаль универсальная сиреневая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 36, 28, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy5-fea6c181-5ab6-11dc-be42-000e0c431b58', 'Копия5 Эмаль универсальная охра 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 34, 26, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy5-fea6c183-5ab6-11dc-be42-000e0c431b58', 'Копия5 Эмаль универсальная какао 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 37, 29, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy5-fea6c185-5ab6-11dc-be42-000e0c431b58', 'Копия5 Эмаль универсальная красно-коричневая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 39, 27, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy5-fea6c187-5ab6-11dc-be42-000e0c431b58', 'Копия5 Эмаль универсальная алюминий 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 159, 28, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy5-fea6c189-5ab6-11dc-be42-000e0c431b58', 'Копия5 Эмаль универсальная хром 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 62, 44, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy5-fea6c18b-5ab6-11dc-be42-000e0c431b58', 'Копия5 Эмаль универсальная золото 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 65, 45, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy5-fea6c18d-5ab6-11dc-be42-000e0c431b58', 'Копия5 Эмаль универсальная медь 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 42, 28, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy5-fea6c18f-5ab6-11dc-be42-000e0c431b58', 'Копия5 Эмаль универсальная белая матовая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 92, 45, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1),
('copy5-fea6c191-5ab6-11dc-be42-000e0c431b58', 'Копия5 Эмаль универсальная черная матовая 520 мл.', '9291c607-5ab3-11dc-be42-000e0c431b58', 0, 99, 51, 'Высококачественная алкидная эмаль предназначена для окраски предварительно загрунтованных металлических и деревянных поверхностей. Применяется для наружных и внутренних работ. Легко наносится на труднодоступные места, имеет хорошую укрывистость и атмосферостойкость, превосходную адгезию к окрашиваемой поверхности. \r\n', 1);

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
('copy1-047805a5-fe8c-11e3-bbdb-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 419),
('copy1-047805a5-fe8c-11e3-bbdb-005056be1f7b', '4dc0750a-691d-11e0-adb9-001cc494be80', 356.15),
('copy1-047805a5-fe8c-11e3-bbdb-005056be1f7b', 'feff0694-99ab-11db-937f-000e0c431b59', 385.48),
('copy1-04834f06-93b0-11e3-82a4-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 929),
('copy1-04834f06-93b0-11e3-82a4-005056be1f7b', '4dc0750a-691d-11e0-adb9-001cc494be80', 789.65),
('copy1-04834f06-93b0-11e3-82a4-005056be1f7b', 'feff0694-99ab-11db-937f-000e0c431b59', 854.68),
('copy1-076d2137-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 369),
('copy1-076d2137-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 313.65),
('copy1-076d2137-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 339.48),
('copy1-076d2139-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 929),
('copy1-076d2139-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 789.65),
('copy1-076d2139-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 854.68),
('copy1-076d213b-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 369),
('copy1-076d213b-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 313.65),
('copy1-076d213b-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 339.48),
('copy1-076d213d-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 929),
('copy1-076d213d-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 789.65),
('copy1-076d213d-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 854.68),
('copy1-076d213f-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 369),
('copy1-076d213f-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 313.65),
('copy1-076d213f-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 339.48),
('copy1-076d2141-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 929),
('copy1-076d2141-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 789.65),
('copy1-076d2141-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 854.68),
('copy1-076d2143-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 369),
('copy1-076d2143-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 313.65),
('copy1-076d2143-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 339.48),
('copy1-076d2145-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 929),
('copy1-076d2145-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 789.65),
('copy1-076d2145-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 854.68),
('copy1-076d2147-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 369),
('copy1-076d2147-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 313.65),
('copy1-076d2147-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 339.48),
('copy1-076d2149-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 929),
('copy1-076d2149-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 789.65),
('copy1-076d2149-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 854.68),
('copy1-076d214b-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 369),
('copy1-076d214b-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 313.65),
('copy1-076d214b-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 339.48),
('copy1-076d214d-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 929),
('copy1-076d214d-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 789.65),
('copy1-076d214d-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 854.68),
('copy1-076d216b-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy1-076d216b-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy1-076d216b-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b33', 666999),
('copy1-076d216b-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy1-076d216d-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy1-076d216d-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy1-076d216d-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy1-076d216f-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy1-076d216f-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy1-076d216f-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy1-076d2173-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy1-076d2173-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy1-076d2173-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy1-0916172c-947c-11e3-8d88-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 979),
('copy1-0916172c-947c-11e3-8d88-005056be1f7b', '4dc0750a-691d-11e0-adb9-001cc494be80', 833),
('copy1-0916172c-947c-11e3-8d88-005056be1f7b', 'feff0694-99ab-11db-937f-000e0c431b59', 901.6),
('copy1-129c7f4d-5273-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 1759),
('copy1-129c7f4d-5273-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 1495.15),
('copy1-129c7f4d-5273-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 1618.28),
('copy1-13ce3df2-93b0-11e3-82a4-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 929),
('copy1-13ce3df2-93b0-11e3-82a4-005056be1f7b', '4dc0750a-691d-11e0-adb9-001cc494be80', 789.65),
('copy1-13ce3df2-93b0-11e3-82a4-005056be1f7b', 'feff0694-99ab-11db-937f-000e0c431b59', 854.68),
('copy1-1bd57597-93b0-11e3-82a4-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 369),
('copy1-1bd57597-93b0-11e3-82a4-005056be1f7b', '4dc0750a-691d-11e0-adb9-001cc494be80', 313.65),
('copy1-1bd57597-93b0-11e3-82a4-005056be1f7b', 'feff0694-99ab-11db-937f-000e0c431b59', 339.48),
('copy1-3479e733-bce7-11e4-a1f3-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 1170),
('copy1-3479e733-bce7-11e4-a1f3-005056be1f7b', '4dc0750a-691d-11e0-adb9-001cc494be80', 994.5),
('copy1-3479e733-bce7-11e4-a1f3-005056be1f7b', 'feff0694-99ab-11db-937f-000e0c431b59', 1076.4),
('copy1-35c08325-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy1-35c08325-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy1-35c08325-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy1-35c08327-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy1-35c08327-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy1-35c08327-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy1-35c08329-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy1-35c08329-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy1-35c08329-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy1-35c0832b-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy1-35c0832b-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy1-35c0832b-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy1-35c0832d-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy1-35c0832d-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy1-35c0832d-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy1-35c0832f-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy1-35c0832f-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy1-35c0832f-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy1-35c08331-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy1-35c08331-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy1-35c08331-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy1-35c08333-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy1-35c08333-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy1-35c08333-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy1-35c08335-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy1-35c08335-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy1-35c08335-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy1-35c08337-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy1-35c08337-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy1-35c08337-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy1-35c08339-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy1-35c08339-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy1-35c08339-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy1-35c0833b-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy1-35c0833b-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy1-35c0833b-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy1-35c0833d-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy1-35c0833d-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy1-35c0833d-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy1-35c0833f-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy1-35c0833f-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy1-35c0833f-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy1-35c08341-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy1-35c08341-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy1-35c08341-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy1-35c08343-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy1-35c08343-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy1-35c08343-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy1-56a6f723-ea03-11de-860d-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 1719),
('copy1-56a6f723-ea03-11de-860d-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 1461.15),
('copy1-56a6f723-ea03-11de-860d-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 1581.48),
('copy1-56f519d0-4f2c-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 1989),
('copy1-56f519d0-4f2c-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 1690.65),
('copy1-56f519d0-4f2c-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 1829.88),
('copy1-7a3c5db1-777c-11de-9531-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 1399),
('copy1-7a3c5db1-777c-11de-9531-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 1189.15),
('copy1-7a3c5db1-777c-11de-9531-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b33', 999),
('copy1-7a3c5db1-777c-11de-9531-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 1287.08),
('copy1-7a3c5db3-777c-11de-9531-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 789),
('copy1-7a3c5db3-777c-11de-9531-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 670.65),
('copy1-7a3c5db3-777c-11de-9531-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 725.88),
('copy1-7a3c5db5-777c-11de-9531-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 1439),
('copy1-7a3c5db5-777c-11de-9531-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 1223.15),
('copy1-7a3c5db5-777c-11de-9531-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 1323.88),
('copy1-7a3c5db7-777c-11de-9531-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 859),
('copy1-7a3c5db7-777c-11de-9531-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 730.15),
('copy1-7a3c5db7-777c-11de-9531-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 790.28),
('copy1-82ebcce8-bce7-11e4-a1f3-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 5650),
('copy1-82ebcce8-bce7-11e4-a1f3-005056be1f7b', '4dc0750a-691d-11e0-adb9-001cc494be80', 4802.5),
('copy1-82ebcce8-bce7-11e4-a1f3-005056be1f7b', 'feff0694-99ab-11db-937f-000e0c431b59', 5198),
('copy1-9291c63a-5ab3-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy1-9291c63a-5ab3-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy1-9291c63a-5ab3-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy1-9291c63c-5ab3-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy1-9291c63c-5ab3-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy1-9291c63c-5ab3-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy1-9291c63e-5ab3-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy1-9291c63e-5ab3-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy1-9291c63e-5ab3-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy1-9291c640-5ab3-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy1-9291c640-5ab3-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy1-9291c640-5ab3-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy1-963b6b0a-04a8-11e3-94de-005056be3574', '288427e0-9732-11db-bbb4-0017315894a1', 1065),
('copy1-963b6b0a-04a8-11e3-94de-005056be3574', '4dc0750a-691d-11e0-adb9-001cc494be80', 901.85),
('copy1-963b6b0a-04a8-11e3-94de-005056be3574', 'feff0694-99ab-11db-937f-000e0c431b59', 976.12),
('copy1-992163db-a731-11de-90d4-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 989),
('copy1-992163db-a731-11de-90d4-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 840.65),
('copy1-992163db-a731-11de-90d4-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 909.88),
('copy1-992163dd-a731-11de-90d4-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 1849),
('copy1-992163dd-a731-11de-90d4-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 1571.65),
('copy1-992163dd-a731-11de-90d4-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 1701.08),
('copy1-a6f80c96-516a-11dd-a89a-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 529),
('copy1-a6f80c96-516a-11dd-a89a-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 449.65),
('copy1-a6f80c96-516a-11dd-a89a-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 486.68),
('copy1-a6f80c98-516a-11dd-a89a-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 969),
('copy1-a6f80c98-516a-11dd-a89a-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 823.65),
('copy1-a6f80c98-516a-11dd-a89a-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 891.48),
('copy1-a6f80c9c-516a-11dd-a89a-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 299),
('copy1-a6f80c9c-516a-11dd-a89a-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 254.15),
('copy1-a6f80c9c-516a-11dd-a89a-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 275.08),
('copy1-a6f80c9e-516a-11dd-a89a-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 559),
('copy1-a6f80c9e-516a-11dd-a89a-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 475.15),
('copy1-a6f80c9e-516a-11dd-a89a-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 514.28),
('copy1-a6f80ca2-516a-11dd-a89a-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 539),
('copy1-a6f80ca2-516a-11dd-a89a-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 458.15),
('copy1-a6f80ca2-516a-11dd-a89a-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 495.88),
('copy1-a6f80ca4-516a-11dd-a89a-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 1049),
('copy1-a6f80ca4-516a-11dd-a89a-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 891.65),
('copy1-a6f80ca4-516a-11dd-a89a-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 965.08),
('copy1-a6f80ca8-516a-11dd-a89a-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 1119),
('copy1-a6f80ca8-516a-11dd-a89a-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 951.15),
('copy1-a6f80ca8-516a-11dd-a89a-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 1029.48),
('copy1-a6f80cac-516a-11dd-a89a-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 559),
('copy1-a6f80cac-516a-11dd-a89a-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 475.15),
('copy1-a6f80cac-516a-11dd-a89a-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 514.28),
('copy1-a6f80cae-516a-11dd-a89a-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 1079),
('copy1-a6f80cae-516a-11dd-a89a-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 917.15),
('copy1-a6f80cae-516a-11dd-a89a-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 992.68),
('copy1-b182dc4f-f994-11e2-98ef-005056be3574', '288427e0-9732-11db-bbb4-0017315894a1', 539),
('copy1-b182dc4f-f994-11e2-98ef-005056be3574', '4dc0750a-691d-11e0-adb9-001cc494be80', 458.15),
('copy1-b182dc4f-f994-11e2-98ef-005056be3574', 'feff0694-99ab-11db-937f-000e0c431b59', 495.88),
('copy1-b182dc51-f994-11e2-98ef-005056be3574', '288427e0-9732-11db-bbb4-0017315894a1', 539),
('copy1-b182dc51-f994-11e2-98ef-005056be3574', '4dc0750a-691d-11e0-adb9-001cc494be80', 458.15),
('copy1-b182dc51-f994-11e2-98ef-005056be3574', 'feff0694-99ab-11db-937f-000e0c431b59', 495.88),
('copy1-b7e28649-21de-11df-860d-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 855),
('copy1-b7e28649-21de-11df-860d-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 726.75),
('copy1-b7e28649-21de-11df-860d-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 786.6),
('copy1-b7e2864b-21de-11df-860d-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 1659),
('copy1-b7e2864b-21de-11df-860d-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 1410.15),
('copy1-b7e2864b-21de-11df-860d-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 1526.28),
('copy1-c4df9e0d-00c0-11e2-a554-005056be3bd8', '288427e0-9732-11db-bbb4-0017315894a1', 539),
('copy1-c4df9e0d-00c0-11e2-a554-005056be3bd8', '4dc0750a-691d-11e0-adb9-001cc494be80', 458.15),
('copy1-c4df9e0d-00c0-11e2-a554-005056be3bd8', 'feff0694-99ab-11db-937f-000e0c431b59', 495.88),
('copy1-c4df9e0f-00c0-11e2-a554-005056be3bd8', '288427e0-9732-11db-bbb4-0017315894a1', 539),
('copy1-c4df9e0f-00c0-11e2-a554-005056be3bd8', '4dc0750a-691d-11e0-adb9-001cc494be80', 458.15),
('copy1-c4df9e0f-00c0-11e2-a554-005056be3bd8', 'feff0694-99ab-11db-937f-000e0c431b59', 495.88),
('copy1-c4df9e11-00c0-11e2-a554-005056be3bd8', '288427e0-9732-11db-bbb4-0017315894a1', 539),
('copy1-c4df9e11-00c0-11e2-a554-005056be3bd8', '4dc0750a-691d-11e0-adb9-001cc494be80', 458.15),
('copy1-c4df9e11-00c0-11e2-a554-005056be3bd8', 'feff0694-99ab-11db-937f-000e0c431b59', 495.88),
('copy1-c4df9e13-00c0-11e2-a554-005056be3bd8', '288427e0-9732-11db-bbb4-0017315894a1', 539),
('copy1-c4df9e13-00c0-11e2-a554-005056be3bd8', '4dc0750a-691d-11e0-adb9-001cc494be80', 458.15),
('copy1-c4df9e13-00c0-11e2-a554-005056be3bd8', 'feff0694-99ab-11db-937f-000e0c431b59', 495.88),
('copy1-cf6aa526-48b8-11dd-9342-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 174),
('copy1-cf6aa526-48b8-11dd-9342-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 147.9),
('copy1-cf6aa526-48b8-11dd-9342-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 160.08),
('copy1-d5823752-947b-11e3-8d88-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 975),
('copy1-d5823752-947b-11e3-8d88-005056be1f7b', '4dc0750a-691d-11e0-adb9-001cc494be80', 828.75),
('copy1-d5823752-947b-11e3-8d88-005056be1f7b', 'feff0694-99ab-11db-937f-000e0c431b59', 897),
('copy1-da49edc1-58f9-11e0-894e-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 4399),
('copy1-da49edc1-58f9-11e0-894e-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 3739.15),
('copy1-da49edc1-58f9-11e0-894e-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 4047.08),
('copy1-da49edc3-58f9-11e0-894e-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 4399),
('copy1-da49edc3-58f9-11e0-894e-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 3739.15),
('copy1-da49edc3-58f9-11e0-894e-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 4047.08),
('copy1-da49edc5-58f9-11e0-894e-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 4399),
('copy1-da49edc5-58f9-11e0-894e-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 3739.15),
('copy1-da49edc5-58f9-11e0-894e-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 4047.08),
('copy1-da49edc7-58f9-11e0-894e-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 4399),
('copy1-da49edc7-58f9-11e0-894e-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 3739.15),
('copy1-da49edc7-58f9-11e0-894e-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 4047.08),
('copy1-da49edc9-58f9-11e0-894e-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 4399),
('copy1-da49edc9-58f9-11e0-894e-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 3739.15),
('copy1-da49edc9-58f9-11e0-894e-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 4047.08),
('copy1-da49edcb-58f9-11e0-894e-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 4399),
('copy1-da49edcb-58f9-11e0-894e-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 3739.15),
('copy1-da49edcb-58f9-11e0-894e-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 4047.08),
('copy1-df210450-93af-11e3-82a4-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 369),
('copy1-df210450-93af-11e3-82a4-005056be1f7b', '4dc0750a-691d-11e0-adb9-001cc494be80', 313.65),
('copy1-df210450-93af-11e3-82a4-005056be1f7b', 'feff0694-99ab-11db-937f-000e0c431b59', 339.48),
('copy1-e242e97f-f29b-11dd-9439-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 3289),
('copy1-e242e97f-f29b-11dd-9439-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 2795.65),
('copy1-e242e97f-f29b-11dd-9439-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 3025.88),
('copy1-e4020814-4598-11e1-8212-001cc494be80', '288427e0-9732-11db-bbb4-0017315894a1', 1449),
('copy1-e4020814-4598-11e1-8212-001cc494be80', '4dc0750a-691d-11e0-adb9-001cc494be80', 1231.65),
('copy1-e4020814-4598-11e1-8212-001cc494be80', 'feff0694-99ab-11db-937f-000e0c431b59', 1333.08),
('copy1-e8976171-93af-11e3-82a4-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 929),
('copy1-e8976171-93af-11e3-82a4-005056be1f7b', '4dc0750a-691d-11e0-adb9-001cc494be80', 789.65),
('copy1-e8976171-93af-11e3-82a4-005056be1f7b', 'feff0694-99ab-11db-937f-000e0c431b59', 854.68),
('copy1-f0ad1dd1-1f91-11e4-9591-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 4399),
('copy1-f0ad1dd1-1f91-11e4-9591-005056be1f7b', '4dc0750a-691d-11e0-adb9-001cc494be80', 3739.15),
('copy1-f0ad1dd1-1f91-11e4-9591-005056be1f7b', 'feff0694-99ab-11db-937f-000e0c431b59', 4047.08),
('copy1-f5f1fcd6-d1c2-11e3-8b7a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 979),
('copy1-f5f1fcd6-d1c2-11e3-8b7a-005056be1f7b', '4dc0750a-691d-11e0-adb9-001cc494be80', 833),
('copy1-f5f1fcd6-d1c2-11e3-8b7a-005056be1f7b', 'feff0694-99ab-11db-937f-000e0c431b59', 901.6),
('copy1-fbb89466-93af-11e3-82a4-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 369),
('copy1-fbb89466-93af-11e3-82a4-005056be1f7b', '4dc0750a-691d-11e0-adb9-001cc494be80', 313.65),
('copy1-fbb89466-93af-11e3-82a4-005056be1f7b', 'feff0694-99ab-11db-937f-000e0c431b59', 339.48),
('copy1-fded4984-d1c2-11e3-8b7a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 979),
('copy1-fded4984-d1c2-11e3-8b7a-005056be1f7b', '4dc0750a-691d-11e0-adb9-001cc494be80', 833),
('copy1-fded4984-d1c2-11e3-8b7a-005056be1f7b', 'feff0694-99ab-11db-937f-000e0c431b59', 901.6),
('copy1-fea6c165-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy1-fea6c165-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy1-fea6c165-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy1-fea6c167-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy1-fea6c167-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy1-fea6c167-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy1-fea6c169-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy1-fea6c169-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy1-fea6c169-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy1-fea6c16b-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy1-fea6c16b-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy1-fea6c16b-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy1-fea6c16d-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy1-fea6c16d-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy1-fea6c16d-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy1-fea6c16f-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy1-fea6c16f-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy1-fea6c16f-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy1-fea6c171-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy1-fea6c171-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy1-fea6c171-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy1-fea6c173-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy1-fea6c173-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy1-fea6c173-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy1-fea6c175-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy1-fea6c175-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy1-fea6c175-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy1-fea6c177-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy1-fea6c177-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy1-fea6c177-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy1-fea6c179-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy1-fea6c179-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy1-fea6c179-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy1-fea6c17b-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy1-fea6c17b-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy1-fea6c17b-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy1-fea6c17d-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy1-fea6c17d-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy1-fea6c17d-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy1-fea6c17f-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy1-fea6c17f-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy1-fea6c17f-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy1-fea6c181-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy1-fea6c181-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy1-fea6c181-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy1-fea6c183-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy1-fea6c183-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy1-fea6c183-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy1-fea6c185-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy1-fea6c185-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy1-fea6c185-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy1-fea6c187-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 174),
('copy1-fea6c187-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 147.9),
('copy1-fea6c187-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 160.08),
('copy1-fea6c189-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 174),
('copy1-fea6c189-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 147.9),
('copy1-fea6c189-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 160.08),
('copy1-fea6c18b-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 174),
('copy1-fea6c18b-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 147.9),
('copy1-fea6c18b-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 160.08),
('copy1-fea6c18d-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 174),
('copy1-fea6c18d-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 147.9),
('copy1-fea6c18d-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 160.08),
('copy1-fea6c18f-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy1-fea6c18f-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy1-fea6c18f-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy1-fea6c191-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy1-fea6c191-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy1-fea6c191-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy2-047805a5-fe8c-11e3-bbdb-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 419),
('copy2-047805a5-fe8c-11e3-bbdb-005056be1f7b', '4dc0750a-691d-11e0-adb9-001cc494be80', 356.15),
('copy2-047805a5-fe8c-11e3-bbdb-005056be1f7b', 'feff0694-99ab-11db-937f-000e0c431b59', 385.48),
('copy2-04834f06-93b0-11e3-82a4-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 929),
('copy2-04834f06-93b0-11e3-82a4-005056be1f7b', '4dc0750a-691d-11e0-adb9-001cc494be80', 789.65),
('copy2-04834f06-93b0-11e3-82a4-005056be1f7b', 'feff0694-99ab-11db-937f-000e0c431b59', 854.68),
('copy2-076d2137-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 369),
('copy2-076d2137-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 313.65),
('copy2-076d2137-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 339.48),
('copy2-076d2139-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 929),
('copy2-076d2139-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 789.65),
('copy2-076d2139-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 854.68),
('copy2-076d213b-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 369),
('copy2-076d213b-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 313.65),
('copy2-076d213b-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 339.48),
('copy2-076d213d-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 929),
('copy2-076d213d-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 789.65),
('copy2-076d213d-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 854.68),
('copy2-076d213f-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 369),
('copy2-076d213f-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 313.65),
('copy2-076d213f-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 339.48),
('copy2-076d2141-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 929),
('copy2-076d2141-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 789.65),
('copy2-076d2141-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 854.68),
('copy2-076d2143-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 369),
('copy2-076d2143-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 313.65),
('copy2-076d2143-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 339.48),
('copy2-076d2145-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 929),
('copy2-076d2145-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 789.65),
('copy2-076d2145-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 854.68),
('copy2-076d2147-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 369),
('copy2-076d2147-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 313.65),
('copy2-076d2147-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 339.48),
('copy2-076d2149-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 929),
('copy2-076d2149-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 789.65),
('copy2-076d2149-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 854.68),
('copy2-076d214b-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 369),
('copy2-076d214b-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 313.65),
('copy2-076d214b-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 339.48),
('copy2-076d214d-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 929),
('copy2-076d214d-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 789.65),
('copy2-076d214d-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 854.68),
('copy2-076d216b-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy2-076d216b-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy2-076d216b-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b33', 666999),
('copy2-076d216b-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy2-076d216d-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy2-076d216d-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy2-076d216d-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy2-076d216f-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy2-076d216f-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy2-076d216f-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy2-076d2173-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy2-076d2173-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy2-076d2173-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy2-0916172c-947c-11e3-8d88-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 979),
('copy2-0916172c-947c-11e3-8d88-005056be1f7b', '4dc0750a-691d-11e0-adb9-001cc494be80', 833),
('copy2-0916172c-947c-11e3-8d88-005056be1f7b', 'feff0694-99ab-11db-937f-000e0c431b59', 901.6),
('copy2-129c7f4d-5273-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 1759),
('copy2-129c7f4d-5273-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 1495.15),
('copy2-129c7f4d-5273-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 1618.28),
('copy2-13ce3df2-93b0-11e3-82a4-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 929),
('copy2-13ce3df2-93b0-11e3-82a4-005056be1f7b', '4dc0750a-691d-11e0-adb9-001cc494be80', 789.65),
('copy2-13ce3df2-93b0-11e3-82a4-005056be1f7b', 'feff0694-99ab-11db-937f-000e0c431b59', 854.68),
('copy2-1bd57597-93b0-11e3-82a4-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 369),
('copy2-1bd57597-93b0-11e3-82a4-005056be1f7b', '4dc0750a-691d-11e0-adb9-001cc494be80', 313.65),
('copy2-1bd57597-93b0-11e3-82a4-005056be1f7b', 'feff0694-99ab-11db-937f-000e0c431b59', 339.48),
('copy2-3479e733-bce7-11e4-a1f3-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 1170),
('copy2-3479e733-bce7-11e4-a1f3-005056be1f7b', '4dc0750a-691d-11e0-adb9-001cc494be80', 994.5),
('copy2-3479e733-bce7-11e4-a1f3-005056be1f7b', 'feff0694-99ab-11db-937f-000e0c431b59', 1076.4),
('copy2-35c08325-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy2-35c08325-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy2-35c08325-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy2-35c08327-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy2-35c08327-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy2-35c08327-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy2-35c08329-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy2-35c08329-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy2-35c08329-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy2-35c0832b-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy2-35c0832b-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy2-35c0832b-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy2-35c0832d-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy2-35c0832d-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy2-35c0832d-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy2-35c0832f-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy2-35c0832f-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy2-35c0832f-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy2-35c08331-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy2-35c08331-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy2-35c08331-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy2-35c08333-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy2-35c08333-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy2-35c08333-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy2-35c08335-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy2-35c08335-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy2-35c08335-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy2-35c08337-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy2-35c08337-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy2-35c08337-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy2-35c08339-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy2-35c08339-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy2-35c08339-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy2-35c0833b-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy2-35c0833b-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy2-35c0833b-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy2-35c0833d-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy2-35c0833d-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy2-35c0833d-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy2-35c0833f-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy2-35c0833f-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy2-35c0833f-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy2-35c08341-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy2-35c08341-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy2-35c08341-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy2-35c08343-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy2-35c08343-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy2-35c08343-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy2-56a6f723-ea03-11de-860d-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 1719),
('copy2-56a6f723-ea03-11de-860d-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 1461.15),
('copy2-56a6f723-ea03-11de-860d-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 1581.48),
('copy2-56f519d0-4f2c-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 1989),
('copy2-56f519d0-4f2c-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 1690.65),
('copy2-56f519d0-4f2c-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 1829.88),
('copy2-7a3c5db1-777c-11de-9531-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 1399),
('copy2-7a3c5db1-777c-11de-9531-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 1189.15),
('copy2-7a3c5db1-777c-11de-9531-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b33', 999),
('copy2-7a3c5db1-777c-11de-9531-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 1287.08),
('copy2-7a3c5db3-777c-11de-9531-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 789),
('copy2-7a3c5db3-777c-11de-9531-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 670.65),
('copy2-7a3c5db3-777c-11de-9531-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 725.88),
('copy2-7a3c5db5-777c-11de-9531-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 1439),
('copy2-7a3c5db5-777c-11de-9531-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 1223.15),
('copy2-7a3c5db5-777c-11de-9531-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 1323.88),
('copy2-7a3c5db7-777c-11de-9531-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 859),
('copy2-7a3c5db7-777c-11de-9531-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 730.15),
('copy2-7a3c5db7-777c-11de-9531-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 790.28),
('copy2-82ebcce8-bce7-11e4-a1f3-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 5650),
('copy2-82ebcce8-bce7-11e4-a1f3-005056be1f7b', '4dc0750a-691d-11e0-adb9-001cc494be80', 4802.5),
('copy2-82ebcce8-bce7-11e4-a1f3-005056be1f7b', 'feff0694-99ab-11db-937f-000e0c431b59', 5198),
('copy2-9291c63a-5ab3-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy2-9291c63a-5ab3-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy2-9291c63a-5ab3-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy2-9291c63c-5ab3-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy2-9291c63c-5ab3-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy2-9291c63c-5ab3-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy2-9291c63e-5ab3-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy2-9291c63e-5ab3-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy2-9291c63e-5ab3-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy2-9291c640-5ab3-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy2-9291c640-5ab3-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy2-9291c640-5ab3-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy2-963b6b0a-04a8-11e3-94de-005056be3574', '288427e0-9732-11db-bbb4-0017315894a1', 1065),
('copy2-963b6b0a-04a8-11e3-94de-005056be3574', '4dc0750a-691d-11e0-adb9-001cc494be80', 901.85),
('copy2-963b6b0a-04a8-11e3-94de-005056be3574', 'feff0694-99ab-11db-937f-000e0c431b59', 976.12),
('copy2-992163db-a731-11de-90d4-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 989),
('copy2-992163db-a731-11de-90d4-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 840.65),
('copy2-992163db-a731-11de-90d4-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 909.88),
('copy2-992163dd-a731-11de-90d4-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 1849),
('copy2-992163dd-a731-11de-90d4-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 1571.65),
('copy2-992163dd-a731-11de-90d4-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 1701.08),
('copy2-a6f80c96-516a-11dd-a89a-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 529),
('copy2-a6f80c96-516a-11dd-a89a-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 449.65),
('copy2-a6f80c96-516a-11dd-a89a-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 486.68),
('copy2-a6f80c98-516a-11dd-a89a-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 969),
('copy2-a6f80c98-516a-11dd-a89a-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 823.65),
('copy2-a6f80c98-516a-11dd-a89a-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 891.48),
('copy2-a6f80c9c-516a-11dd-a89a-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 299),
('copy2-a6f80c9c-516a-11dd-a89a-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 254.15),
('copy2-a6f80c9c-516a-11dd-a89a-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 275.08),
('copy2-a6f80c9e-516a-11dd-a89a-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 559),
('copy2-a6f80c9e-516a-11dd-a89a-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 475.15),
('copy2-a6f80c9e-516a-11dd-a89a-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 514.28),
('copy2-a6f80ca2-516a-11dd-a89a-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 539),
('copy2-a6f80ca2-516a-11dd-a89a-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 458.15),
('copy2-a6f80ca2-516a-11dd-a89a-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 495.88),
('copy2-a6f80ca4-516a-11dd-a89a-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 1049),
('copy2-a6f80ca4-516a-11dd-a89a-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 891.65),
('copy2-a6f80ca4-516a-11dd-a89a-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 965.08),
('copy2-a6f80ca8-516a-11dd-a89a-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 1119),
('copy2-a6f80ca8-516a-11dd-a89a-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 951.15),
('copy2-a6f80ca8-516a-11dd-a89a-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 1029.48),
('copy2-a6f80cac-516a-11dd-a89a-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 559),
('copy2-a6f80cac-516a-11dd-a89a-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 475.15),
('copy2-a6f80cac-516a-11dd-a89a-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 514.28),
('copy2-a6f80cae-516a-11dd-a89a-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 1079),
('copy2-a6f80cae-516a-11dd-a89a-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 917.15),
('copy2-a6f80cae-516a-11dd-a89a-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 992.68),
('copy2-b182dc4f-f994-11e2-98ef-005056be3574', '288427e0-9732-11db-bbb4-0017315894a1', 539),
('copy2-b182dc4f-f994-11e2-98ef-005056be3574', '4dc0750a-691d-11e0-adb9-001cc494be80', 458.15),
('copy2-b182dc4f-f994-11e2-98ef-005056be3574', 'feff0694-99ab-11db-937f-000e0c431b59', 495.88),
('copy2-b182dc51-f994-11e2-98ef-005056be3574', '288427e0-9732-11db-bbb4-0017315894a1', 539),
('copy2-b182dc51-f994-11e2-98ef-005056be3574', '4dc0750a-691d-11e0-adb9-001cc494be80', 458.15),
('copy2-b182dc51-f994-11e2-98ef-005056be3574', 'feff0694-99ab-11db-937f-000e0c431b59', 495.88),
('copy2-b7e28649-21de-11df-860d-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 855),
('copy2-b7e28649-21de-11df-860d-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 726.75),
('copy2-b7e28649-21de-11df-860d-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 786.6),
('copy2-b7e2864b-21de-11df-860d-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 1659),
('copy2-b7e2864b-21de-11df-860d-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 1410.15),
('copy2-b7e2864b-21de-11df-860d-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 1526.28),
('copy2-c4df9e0d-00c0-11e2-a554-005056be3bd8', '288427e0-9732-11db-bbb4-0017315894a1', 539),
('copy2-c4df9e0d-00c0-11e2-a554-005056be3bd8', '4dc0750a-691d-11e0-adb9-001cc494be80', 458.15),
('copy2-c4df9e0d-00c0-11e2-a554-005056be3bd8', 'feff0694-99ab-11db-937f-000e0c431b59', 495.88),
('copy2-c4df9e0f-00c0-11e2-a554-005056be3bd8', '288427e0-9732-11db-bbb4-0017315894a1', 539),
('copy2-c4df9e0f-00c0-11e2-a554-005056be3bd8', '4dc0750a-691d-11e0-adb9-001cc494be80', 458.15),
('copy2-c4df9e0f-00c0-11e2-a554-005056be3bd8', 'feff0694-99ab-11db-937f-000e0c431b59', 495.88),
('copy2-c4df9e11-00c0-11e2-a554-005056be3bd8', '288427e0-9732-11db-bbb4-0017315894a1', 539),
('copy2-c4df9e11-00c0-11e2-a554-005056be3bd8', '4dc0750a-691d-11e0-adb9-001cc494be80', 458.15),
('copy2-c4df9e11-00c0-11e2-a554-005056be3bd8', 'feff0694-99ab-11db-937f-000e0c431b59', 495.88),
('copy2-c4df9e13-00c0-11e2-a554-005056be3bd8', '288427e0-9732-11db-bbb4-0017315894a1', 539),
('copy2-c4df9e13-00c0-11e2-a554-005056be3bd8', '4dc0750a-691d-11e0-adb9-001cc494be80', 458.15),
('copy2-c4df9e13-00c0-11e2-a554-005056be3bd8', 'feff0694-99ab-11db-937f-000e0c431b59', 495.88),
('copy2-cf6aa526-48b8-11dd-9342-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 174),
('copy2-cf6aa526-48b8-11dd-9342-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 147.9),
('copy2-cf6aa526-48b8-11dd-9342-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 160.08),
('copy2-d5823752-947b-11e3-8d88-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 975),
('copy2-d5823752-947b-11e3-8d88-005056be1f7b', '4dc0750a-691d-11e0-adb9-001cc494be80', 828.75),
('copy2-d5823752-947b-11e3-8d88-005056be1f7b', 'feff0694-99ab-11db-937f-000e0c431b59', 897),
('copy2-da49edc1-58f9-11e0-894e-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 4399),
('copy2-da49edc1-58f9-11e0-894e-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 3739.15),
('copy2-da49edc1-58f9-11e0-894e-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 4047.08),
('copy2-da49edc3-58f9-11e0-894e-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 4399),
('copy2-da49edc3-58f9-11e0-894e-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 3739.15),
('copy2-da49edc3-58f9-11e0-894e-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 4047.08),
('copy2-da49edc5-58f9-11e0-894e-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 4399),
('copy2-da49edc5-58f9-11e0-894e-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 3739.15),
('copy2-da49edc5-58f9-11e0-894e-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 4047.08),
('copy2-da49edc7-58f9-11e0-894e-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 4399),
('copy2-da49edc7-58f9-11e0-894e-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 3739.15),
('copy2-da49edc7-58f9-11e0-894e-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 4047.08),
('copy2-da49edc9-58f9-11e0-894e-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 4399),
('copy2-da49edc9-58f9-11e0-894e-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 3739.15),
('copy2-da49edc9-58f9-11e0-894e-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 4047.08),
('copy2-da49edcb-58f9-11e0-894e-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 4399),
('copy2-da49edcb-58f9-11e0-894e-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 3739.15),
('copy2-da49edcb-58f9-11e0-894e-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 4047.08),
('copy2-df210450-93af-11e3-82a4-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 369),
('copy2-df210450-93af-11e3-82a4-005056be1f7b', '4dc0750a-691d-11e0-adb9-001cc494be80', 313.65),
('copy2-df210450-93af-11e3-82a4-005056be1f7b', 'feff0694-99ab-11db-937f-000e0c431b59', 339.48),
('copy2-e242e97f-f29b-11dd-9439-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 3289),
('copy2-e242e97f-f29b-11dd-9439-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 2795.65),
('copy2-e242e97f-f29b-11dd-9439-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 3025.88),
('copy2-e4020814-4598-11e1-8212-001cc494be80', '288427e0-9732-11db-bbb4-0017315894a1', 1449),
('copy2-e4020814-4598-11e1-8212-001cc494be80', '4dc0750a-691d-11e0-adb9-001cc494be80', 1231.65),
('copy2-e4020814-4598-11e1-8212-001cc494be80', 'feff0694-99ab-11db-937f-000e0c431b59', 1333.08),
('copy2-e8976171-93af-11e3-82a4-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 929),
('copy2-e8976171-93af-11e3-82a4-005056be1f7b', '4dc0750a-691d-11e0-adb9-001cc494be80', 789.65),
('copy2-e8976171-93af-11e3-82a4-005056be1f7b', 'feff0694-99ab-11db-937f-000e0c431b59', 854.68),
('copy2-f0ad1dd1-1f91-11e4-9591-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 4399),
('copy2-f0ad1dd1-1f91-11e4-9591-005056be1f7b', '4dc0750a-691d-11e0-adb9-001cc494be80', 3739.15),
('copy2-f0ad1dd1-1f91-11e4-9591-005056be1f7b', 'feff0694-99ab-11db-937f-000e0c431b59', 4047.08),
('copy2-f5f1fcd6-d1c2-11e3-8b7a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 979),
('copy2-f5f1fcd6-d1c2-11e3-8b7a-005056be1f7b', '4dc0750a-691d-11e0-adb9-001cc494be80', 833),
('copy2-f5f1fcd6-d1c2-11e3-8b7a-005056be1f7b', 'feff0694-99ab-11db-937f-000e0c431b59', 901.6),
('copy2-fbb89466-93af-11e3-82a4-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 369),
('copy2-fbb89466-93af-11e3-82a4-005056be1f7b', '4dc0750a-691d-11e0-adb9-001cc494be80', 313.65),
('copy2-fbb89466-93af-11e3-82a4-005056be1f7b', 'feff0694-99ab-11db-937f-000e0c431b59', 339.48),
('copy2-fded4984-d1c2-11e3-8b7a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 979),
('copy2-fded4984-d1c2-11e3-8b7a-005056be1f7b', '4dc0750a-691d-11e0-adb9-001cc494be80', 833),
('copy2-fded4984-d1c2-11e3-8b7a-005056be1f7b', 'feff0694-99ab-11db-937f-000e0c431b59', 901.6),
('copy2-fea6c165-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy2-fea6c165-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy2-fea6c165-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy2-fea6c167-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy2-fea6c167-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy2-fea6c167-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy2-fea6c169-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy2-fea6c169-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy2-fea6c169-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy2-fea6c16b-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy2-fea6c16b-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy2-fea6c16b-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy2-fea6c16d-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy2-fea6c16d-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy2-fea6c16d-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy2-fea6c16f-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy2-fea6c16f-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy2-fea6c16f-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy2-fea6c171-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy2-fea6c171-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy2-fea6c171-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy2-fea6c173-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy2-fea6c173-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy2-fea6c173-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy2-fea6c175-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy2-fea6c175-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy2-fea6c175-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy2-fea6c177-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy2-fea6c177-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy2-fea6c177-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy2-fea6c179-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy2-fea6c179-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy2-fea6c179-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy2-fea6c17b-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy2-fea6c17b-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy2-fea6c17b-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy2-fea6c17d-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy2-fea6c17d-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy2-fea6c17d-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy2-fea6c17f-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy2-fea6c17f-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy2-fea6c17f-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy2-fea6c181-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy2-fea6c181-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy2-fea6c181-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy2-fea6c183-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy2-fea6c183-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy2-fea6c183-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy2-fea6c185-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy2-fea6c185-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy2-fea6c185-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy2-fea6c187-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 174),
('copy2-fea6c187-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 147.9),
('copy2-fea6c187-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 160.08),
('copy2-fea6c189-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 174),
('copy2-fea6c189-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 147.9),
('copy2-fea6c189-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 160.08),
('copy2-fea6c18b-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 174),
('copy2-fea6c18b-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 147.9),
('copy2-fea6c18b-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 160.08),
('copy2-fea6c18d-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 174),
('copy2-fea6c18d-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 147.9),
('copy2-fea6c18d-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 160.08),
('copy2-fea6c18f-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy2-fea6c18f-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy2-fea6c18f-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy2-fea6c191-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy2-fea6c191-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy2-fea6c191-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy3-047805a5-fe8c-11e3-bbdb-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 419),
('copy3-047805a5-fe8c-11e3-bbdb-005056be1f7b', '4dc0750a-691d-11e0-adb9-001cc494be80', 356.15),
('copy3-047805a5-fe8c-11e3-bbdb-005056be1f7b', 'feff0694-99ab-11db-937f-000e0c431b59', 385.48),
('copy3-04834f06-93b0-11e3-82a4-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 929),
('copy3-04834f06-93b0-11e3-82a4-005056be1f7b', '4dc0750a-691d-11e0-adb9-001cc494be80', 789.65),
('copy3-04834f06-93b0-11e3-82a4-005056be1f7b', 'feff0694-99ab-11db-937f-000e0c431b59', 854.68),
('copy3-076d2137-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 369),
('copy3-076d2137-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 313.65),
('copy3-076d2137-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 339.48),
('copy3-076d2139-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 929),
('copy3-076d2139-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 789.65),
('copy3-076d2139-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 854.68),
('copy3-076d213b-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 369),
('copy3-076d213b-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 313.65),
('copy3-076d213b-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 339.48),
('copy3-076d213d-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 929),
('copy3-076d213d-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 789.65),
('copy3-076d213d-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 854.68),
('copy3-076d213f-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 369),
('copy3-076d213f-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 313.65),
('copy3-076d213f-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 339.48),
('copy3-076d2141-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 929),
('copy3-076d2141-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 789.65),
('copy3-076d2141-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 854.68),
('copy3-076d2143-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 369),
('copy3-076d2143-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 313.65),
('copy3-076d2143-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 339.48),
('copy3-076d2145-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 929),
('copy3-076d2145-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 789.65),
('copy3-076d2145-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 854.68),
('copy3-076d2147-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 369),
('copy3-076d2147-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 313.65),
('copy3-076d2147-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 339.48),
('copy3-076d2149-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 929),
('copy3-076d2149-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 789.65),
('copy3-076d2149-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 854.68),
('copy3-076d214b-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 369),
('copy3-076d214b-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 313.65),
('copy3-076d214b-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 339.48),
('copy3-076d214d-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 929),
('copy3-076d214d-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 789.65),
('copy3-076d214d-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 854.68),
('copy3-076d216b-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy3-076d216b-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy3-076d216b-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b33', 666999),
('copy3-076d216b-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy3-076d216d-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy3-076d216d-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy3-076d216d-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy3-076d216f-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy3-076d216f-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy3-076d216f-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy3-076d2173-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy3-076d2173-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy3-076d2173-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy3-0916172c-947c-11e3-8d88-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 979),
('copy3-0916172c-947c-11e3-8d88-005056be1f7b', '4dc0750a-691d-11e0-adb9-001cc494be80', 833),
('copy3-0916172c-947c-11e3-8d88-005056be1f7b', 'feff0694-99ab-11db-937f-000e0c431b59', 901.6),
('copy3-129c7f4d-5273-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 1759),
('copy3-129c7f4d-5273-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 1495.15),
('copy3-129c7f4d-5273-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 1618.28),
('copy3-13ce3df2-93b0-11e3-82a4-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 929),
('copy3-13ce3df2-93b0-11e3-82a4-005056be1f7b', '4dc0750a-691d-11e0-adb9-001cc494be80', 789.65),
('copy3-13ce3df2-93b0-11e3-82a4-005056be1f7b', 'feff0694-99ab-11db-937f-000e0c431b59', 854.68),
('copy3-1bd57597-93b0-11e3-82a4-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 369),
('copy3-1bd57597-93b0-11e3-82a4-005056be1f7b', '4dc0750a-691d-11e0-adb9-001cc494be80', 313.65),
('copy3-1bd57597-93b0-11e3-82a4-005056be1f7b', 'feff0694-99ab-11db-937f-000e0c431b59', 339.48),
('copy3-3479e733-bce7-11e4-a1f3-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 1170),
('copy3-3479e733-bce7-11e4-a1f3-005056be1f7b', '4dc0750a-691d-11e0-adb9-001cc494be80', 994.5),
('copy3-3479e733-bce7-11e4-a1f3-005056be1f7b', 'feff0694-99ab-11db-937f-000e0c431b59', 1076.4),
('copy3-35c08325-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy3-35c08325-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy3-35c08325-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy3-35c08327-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy3-35c08327-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy3-35c08327-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy3-35c08329-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy3-35c08329-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy3-35c08329-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy3-35c0832b-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy3-35c0832b-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy3-35c0832b-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy3-35c0832d-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy3-35c0832d-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy3-35c0832d-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy3-35c0832f-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy3-35c0832f-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy3-35c0832f-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy3-35c08331-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy3-35c08331-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy3-35c08331-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy3-35c08333-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy3-35c08333-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy3-35c08333-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy3-35c08335-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy3-35c08335-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy3-35c08335-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy3-35c08337-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy3-35c08337-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy3-35c08337-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy3-35c08339-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy3-35c08339-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy3-35c08339-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy3-35c0833b-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy3-35c0833b-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy3-35c0833b-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy3-35c0833d-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy3-35c0833d-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy3-35c0833d-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy3-35c0833f-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy3-35c0833f-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy3-35c0833f-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy3-35c08341-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy3-35c08341-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy3-35c08341-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy3-35c08343-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy3-35c08343-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy3-35c08343-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy3-56a6f723-ea03-11de-860d-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 1719),
('copy3-56a6f723-ea03-11de-860d-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 1461.15),
('copy3-56a6f723-ea03-11de-860d-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 1581.48),
('copy3-56f519d0-4f2c-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 1989),
('copy3-56f519d0-4f2c-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 1690.65),
('copy3-56f519d0-4f2c-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 1829.88),
('copy3-7a3c5db1-777c-11de-9531-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 1399),
('copy3-7a3c5db1-777c-11de-9531-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 1189.15),
('copy3-7a3c5db1-777c-11de-9531-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b33', 999),
('copy3-7a3c5db1-777c-11de-9531-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 1287.08),
('copy3-7a3c5db3-777c-11de-9531-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 789),
('copy3-7a3c5db3-777c-11de-9531-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 670.65),
('copy3-7a3c5db3-777c-11de-9531-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 725.88),
('copy3-7a3c5db5-777c-11de-9531-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 1439),
('copy3-7a3c5db5-777c-11de-9531-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 1223.15),
('copy3-7a3c5db5-777c-11de-9531-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 1323.88),
('copy3-7a3c5db7-777c-11de-9531-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 859),
('copy3-7a3c5db7-777c-11de-9531-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 730.15),
('copy3-7a3c5db7-777c-11de-9531-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 790.28),
('copy3-82ebcce8-bce7-11e4-a1f3-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 5650),
('copy3-82ebcce8-bce7-11e4-a1f3-005056be1f7b', '4dc0750a-691d-11e0-adb9-001cc494be80', 4802.5),
('copy3-82ebcce8-bce7-11e4-a1f3-005056be1f7b', 'feff0694-99ab-11db-937f-000e0c431b59', 5198),
('copy3-9291c63a-5ab3-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy3-9291c63a-5ab3-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy3-9291c63a-5ab3-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy3-9291c63c-5ab3-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy3-9291c63c-5ab3-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy3-9291c63c-5ab3-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy3-9291c63e-5ab3-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy3-9291c63e-5ab3-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy3-9291c63e-5ab3-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy3-9291c640-5ab3-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy3-9291c640-5ab3-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy3-9291c640-5ab3-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy3-963b6b0a-04a8-11e3-94de-005056be3574', '288427e0-9732-11db-bbb4-0017315894a1', 1065),
('copy3-963b6b0a-04a8-11e3-94de-005056be3574', '4dc0750a-691d-11e0-adb9-001cc494be80', 901.85),
('copy3-963b6b0a-04a8-11e3-94de-005056be3574', 'feff0694-99ab-11db-937f-000e0c431b59', 976.12),
('copy3-992163db-a731-11de-90d4-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 989),
('copy3-992163db-a731-11de-90d4-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 840.65),
('copy3-992163db-a731-11de-90d4-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 909.88),
('copy3-992163dd-a731-11de-90d4-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 1849),
('copy3-992163dd-a731-11de-90d4-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 1571.65),
('copy3-992163dd-a731-11de-90d4-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 1701.08),
('copy3-a6f80c96-516a-11dd-a89a-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 529),
('copy3-a6f80c96-516a-11dd-a89a-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 449.65),
('copy3-a6f80c96-516a-11dd-a89a-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 486.68),
('copy3-a6f80c98-516a-11dd-a89a-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 969),
('copy3-a6f80c98-516a-11dd-a89a-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 823.65),
('copy3-a6f80c98-516a-11dd-a89a-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 891.48),
('copy3-a6f80c9c-516a-11dd-a89a-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 299),
('copy3-a6f80c9c-516a-11dd-a89a-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 254.15),
('copy3-a6f80c9c-516a-11dd-a89a-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 275.08),
('copy3-a6f80c9e-516a-11dd-a89a-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 559),
('copy3-a6f80c9e-516a-11dd-a89a-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 475.15),
('copy3-a6f80c9e-516a-11dd-a89a-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 514.28),
('copy3-a6f80ca2-516a-11dd-a89a-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 539),
('copy3-a6f80ca2-516a-11dd-a89a-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 458.15),
('copy3-a6f80ca2-516a-11dd-a89a-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 495.88),
('copy3-a6f80ca4-516a-11dd-a89a-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 1049),
('copy3-a6f80ca4-516a-11dd-a89a-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 891.65),
('copy3-a6f80ca4-516a-11dd-a89a-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 965.08),
('copy3-a6f80ca8-516a-11dd-a89a-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 1119),
('copy3-a6f80ca8-516a-11dd-a89a-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 951.15),
('copy3-a6f80ca8-516a-11dd-a89a-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 1029.48),
('copy3-a6f80cac-516a-11dd-a89a-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 559),
('copy3-a6f80cac-516a-11dd-a89a-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 475.15),
('copy3-a6f80cac-516a-11dd-a89a-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 514.28),
('copy3-a6f80cae-516a-11dd-a89a-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 1079),
('copy3-a6f80cae-516a-11dd-a89a-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 917.15),
('copy3-a6f80cae-516a-11dd-a89a-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 992.68),
('copy3-b182dc4f-f994-11e2-98ef-005056be3574', '288427e0-9732-11db-bbb4-0017315894a1', 539),
('copy3-b182dc4f-f994-11e2-98ef-005056be3574', '4dc0750a-691d-11e0-adb9-001cc494be80', 458.15),
('copy3-b182dc4f-f994-11e2-98ef-005056be3574', 'feff0694-99ab-11db-937f-000e0c431b59', 495.88),
('copy3-b182dc51-f994-11e2-98ef-005056be3574', '288427e0-9732-11db-bbb4-0017315894a1', 539),
('copy3-b182dc51-f994-11e2-98ef-005056be3574', '4dc0750a-691d-11e0-adb9-001cc494be80', 458.15),
('copy3-b182dc51-f994-11e2-98ef-005056be3574', 'feff0694-99ab-11db-937f-000e0c431b59', 495.88),
('copy3-b7e28649-21de-11df-860d-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 855),
('copy3-b7e28649-21de-11df-860d-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 726.75),
('copy3-b7e28649-21de-11df-860d-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 786.6),
('copy3-b7e2864b-21de-11df-860d-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 1659),
('copy3-b7e2864b-21de-11df-860d-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 1410.15),
('copy3-b7e2864b-21de-11df-860d-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 1526.28),
('copy3-c4df9e0d-00c0-11e2-a554-005056be3bd8', '288427e0-9732-11db-bbb4-0017315894a1', 539),
('copy3-c4df9e0d-00c0-11e2-a554-005056be3bd8', '4dc0750a-691d-11e0-adb9-001cc494be80', 458.15),
('copy3-c4df9e0d-00c0-11e2-a554-005056be3bd8', 'feff0694-99ab-11db-937f-000e0c431b59', 495.88),
('copy3-c4df9e0f-00c0-11e2-a554-005056be3bd8', '288427e0-9732-11db-bbb4-0017315894a1', 539),
('copy3-c4df9e0f-00c0-11e2-a554-005056be3bd8', '4dc0750a-691d-11e0-adb9-001cc494be80', 458.15),
('copy3-c4df9e0f-00c0-11e2-a554-005056be3bd8', 'feff0694-99ab-11db-937f-000e0c431b59', 495.88),
('copy3-c4df9e11-00c0-11e2-a554-005056be3bd8', '288427e0-9732-11db-bbb4-0017315894a1', 539),
('copy3-c4df9e11-00c0-11e2-a554-005056be3bd8', '4dc0750a-691d-11e0-adb9-001cc494be80', 458.15),
('copy3-c4df9e11-00c0-11e2-a554-005056be3bd8', 'feff0694-99ab-11db-937f-000e0c431b59', 495.88),
('copy3-c4df9e13-00c0-11e2-a554-005056be3bd8', '288427e0-9732-11db-bbb4-0017315894a1', 539),
('copy3-c4df9e13-00c0-11e2-a554-005056be3bd8', '4dc0750a-691d-11e0-adb9-001cc494be80', 458.15),
('copy3-c4df9e13-00c0-11e2-a554-005056be3bd8', 'feff0694-99ab-11db-937f-000e0c431b59', 495.88),
('copy3-cf6aa526-48b8-11dd-9342-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 174),
('copy3-cf6aa526-48b8-11dd-9342-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 147.9),
('copy3-cf6aa526-48b8-11dd-9342-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 160.08),
('copy3-d5823752-947b-11e3-8d88-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 975),
('copy3-d5823752-947b-11e3-8d88-005056be1f7b', '4dc0750a-691d-11e0-adb9-001cc494be80', 828.75),
('copy3-d5823752-947b-11e3-8d88-005056be1f7b', 'feff0694-99ab-11db-937f-000e0c431b59', 897),
('copy3-da49edc1-58f9-11e0-894e-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 4399),
('copy3-da49edc1-58f9-11e0-894e-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 3739.15),
('copy3-da49edc1-58f9-11e0-894e-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 4047.08),
('copy3-da49edc3-58f9-11e0-894e-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 4399),
('copy3-da49edc3-58f9-11e0-894e-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 3739.15),
('copy3-da49edc3-58f9-11e0-894e-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 4047.08),
('copy3-da49edc5-58f9-11e0-894e-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 4399),
('copy3-da49edc5-58f9-11e0-894e-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 3739.15),
('copy3-da49edc5-58f9-11e0-894e-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 4047.08),
('copy3-da49edc7-58f9-11e0-894e-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 4399),
('copy3-da49edc7-58f9-11e0-894e-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 3739.15),
('copy3-da49edc7-58f9-11e0-894e-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 4047.08),
('copy3-da49edc9-58f9-11e0-894e-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 4399),
('copy3-da49edc9-58f9-11e0-894e-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 3739.15),
('copy3-da49edc9-58f9-11e0-894e-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 4047.08),
('copy3-da49edcb-58f9-11e0-894e-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 4399),
('copy3-da49edcb-58f9-11e0-894e-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 3739.15),
('copy3-da49edcb-58f9-11e0-894e-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 4047.08),
('copy3-df210450-93af-11e3-82a4-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 369),
('copy3-df210450-93af-11e3-82a4-005056be1f7b', '4dc0750a-691d-11e0-adb9-001cc494be80', 313.65),
('copy3-df210450-93af-11e3-82a4-005056be1f7b', 'feff0694-99ab-11db-937f-000e0c431b59', 339.48),
('copy3-e242e97f-f29b-11dd-9439-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 3289),
('copy3-e242e97f-f29b-11dd-9439-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 2795.65),
('copy3-e242e97f-f29b-11dd-9439-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 3025.88),
('copy3-e4020814-4598-11e1-8212-001cc494be80', '288427e0-9732-11db-bbb4-0017315894a1', 1449),
('copy3-e4020814-4598-11e1-8212-001cc494be80', '4dc0750a-691d-11e0-adb9-001cc494be80', 1231.65),
('copy3-e4020814-4598-11e1-8212-001cc494be80', 'feff0694-99ab-11db-937f-000e0c431b59', 1333.08),
('copy3-e8976171-93af-11e3-82a4-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 929),
('copy3-e8976171-93af-11e3-82a4-005056be1f7b', '4dc0750a-691d-11e0-adb9-001cc494be80', 789.65),
('copy3-e8976171-93af-11e3-82a4-005056be1f7b', 'feff0694-99ab-11db-937f-000e0c431b59', 854.68),
('copy3-f0ad1dd1-1f91-11e4-9591-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 4399),
('copy3-f0ad1dd1-1f91-11e4-9591-005056be1f7b', '4dc0750a-691d-11e0-adb9-001cc494be80', 3739.15),
('copy3-f0ad1dd1-1f91-11e4-9591-005056be1f7b', 'feff0694-99ab-11db-937f-000e0c431b59', 4047.08),
('copy3-f5f1fcd6-d1c2-11e3-8b7a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 979),
('copy3-f5f1fcd6-d1c2-11e3-8b7a-005056be1f7b', '4dc0750a-691d-11e0-adb9-001cc494be80', 833),
('copy3-f5f1fcd6-d1c2-11e3-8b7a-005056be1f7b', 'feff0694-99ab-11db-937f-000e0c431b59', 901.6),
('copy3-fbb89466-93af-11e3-82a4-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 369),
('copy3-fbb89466-93af-11e3-82a4-005056be1f7b', '4dc0750a-691d-11e0-adb9-001cc494be80', 313.65),
('copy3-fbb89466-93af-11e3-82a4-005056be1f7b', 'feff0694-99ab-11db-937f-000e0c431b59', 339.48),
('copy3-fded4984-d1c2-11e3-8b7a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 979),
('copy3-fded4984-d1c2-11e3-8b7a-005056be1f7b', '4dc0750a-691d-11e0-adb9-001cc494be80', 833),
('copy3-fded4984-d1c2-11e3-8b7a-005056be1f7b', 'feff0694-99ab-11db-937f-000e0c431b59', 901.6),
('copy3-fea6c165-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy3-fea6c165-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy3-fea6c165-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy3-fea6c167-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy3-fea6c167-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy3-fea6c167-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy3-fea6c169-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy3-fea6c169-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy3-fea6c169-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy3-fea6c16b-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy3-fea6c16b-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy3-fea6c16b-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy3-fea6c16d-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy3-fea6c16d-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy3-fea6c16d-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy3-fea6c16f-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy3-fea6c16f-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy3-fea6c16f-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy3-fea6c171-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy3-fea6c171-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy3-fea6c171-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy3-fea6c173-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy3-fea6c173-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy3-fea6c173-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy3-fea6c175-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy3-fea6c175-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy3-fea6c175-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy3-fea6c177-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy3-fea6c177-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy3-fea6c177-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy3-fea6c179-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy3-fea6c179-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy3-fea6c179-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy3-fea6c17b-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy3-fea6c17b-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy3-fea6c17b-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy3-fea6c17d-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy3-fea6c17d-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy3-fea6c17d-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy3-fea6c17f-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy3-fea6c17f-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy3-fea6c17f-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy3-fea6c181-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy3-fea6c181-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy3-fea6c181-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy3-fea6c183-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy3-fea6c183-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy3-fea6c183-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy3-fea6c185-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy3-fea6c185-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy3-fea6c185-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy3-fea6c187-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 174),
('copy3-fea6c187-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 147.9),
('copy3-fea6c187-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 160.08),
('copy3-fea6c189-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 174),
('copy3-fea6c189-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 147.9),
('copy3-fea6c189-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 160.08),
('copy3-fea6c18b-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 174),
('copy3-fea6c18b-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 147.9),
('copy3-fea6c18b-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 160.08),
('copy3-fea6c18d-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 174),
('copy3-fea6c18d-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 147.9),
('copy3-fea6c18d-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 160.08),
('copy3-fea6c18f-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy3-fea6c18f-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy3-fea6c18f-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy3-fea6c191-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy3-fea6c191-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy3-fea6c191-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy4-047805a5-fe8c-11e3-bbdb-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 419),
('copy4-047805a5-fe8c-11e3-bbdb-005056be1f7b', '4dc0750a-691d-11e0-adb9-001cc494be80', 356.15),
('copy4-047805a5-fe8c-11e3-bbdb-005056be1f7b', 'feff0694-99ab-11db-937f-000e0c431b59', 385.48),
('copy4-04834f06-93b0-11e3-82a4-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 929),
('copy4-04834f06-93b0-11e3-82a4-005056be1f7b', '4dc0750a-691d-11e0-adb9-001cc494be80', 789.65),
('copy4-04834f06-93b0-11e3-82a4-005056be1f7b', 'feff0694-99ab-11db-937f-000e0c431b59', 854.68),
('copy4-076d2137-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 369),
('copy4-076d2137-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 313.65),
('copy4-076d2137-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 339.48),
('copy4-076d2139-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 929),
('copy4-076d2139-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 789.65),
('copy4-076d2139-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 854.68),
('copy4-076d213b-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 369),
('copy4-076d213b-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 313.65),
('copy4-076d213b-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 339.48),
('copy4-076d213d-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 929),
('copy4-076d213d-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 789.65),
('copy4-076d213d-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 854.68),
('copy4-076d213f-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 369),
('copy4-076d213f-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 313.65),
('copy4-076d213f-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 339.48),
('copy4-076d2141-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 929),
('copy4-076d2141-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 789.65),
('copy4-076d2141-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 854.68),
('copy4-076d2143-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 369),
('copy4-076d2143-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 313.65),
('copy4-076d2143-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 339.48),
('copy4-076d2145-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 929),
('copy4-076d2145-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 789.65),
('copy4-076d2145-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 854.68),
('copy4-076d2147-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 369),
('copy4-076d2147-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 313.65),
('copy4-076d2147-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 339.48),
('copy4-076d2149-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 929),
('copy4-076d2149-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 789.65),
('copy4-076d2149-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 854.68),
('copy4-076d214b-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 369),
('copy4-076d214b-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 313.65),
('copy4-076d214b-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 339.48),
('copy4-076d214d-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 929),
('copy4-076d214d-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 789.65),
('copy4-076d214d-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 854.68),
('copy4-076d216b-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy4-076d216b-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy4-076d216b-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b33', 666999),
('copy4-076d216b-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy4-076d216d-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy4-076d216d-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy4-076d216d-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy4-076d216f-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy4-076d216f-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy4-076d216f-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy4-076d2173-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy4-076d2173-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy4-076d2173-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy4-0916172c-947c-11e3-8d88-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 979),
('copy4-0916172c-947c-11e3-8d88-005056be1f7b', '4dc0750a-691d-11e0-adb9-001cc494be80', 833),
('copy4-0916172c-947c-11e3-8d88-005056be1f7b', 'feff0694-99ab-11db-937f-000e0c431b59', 901.6),
('copy4-129c7f4d-5273-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 1759),
('copy4-129c7f4d-5273-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 1495.15),
('copy4-129c7f4d-5273-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 1618.28),
('copy4-13ce3df2-93b0-11e3-82a4-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 929),
('copy4-13ce3df2-93b0-11e3-82a4-005056be1f7b', '4dc0750a-691d-11e0-adb9-001cc494be80', 789.65),
('copy4-13ce3df2-93b0-11e3-82a4-005056be1f7b', 'feff0694-99ab-11db-937f-000e0c431b59', 854.68),
('copy4-1bd57597-93b0-11e3-82a4-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 369),
('copy4-1bd57597-93b0-11e3-82a4-005056be1f7b', '4dc0750a-691d-11e0-adb9-001cc494be80', 313.65),
('copy4-1bd57597-93b0-11e3-82a4-005056be1f7b', 'feff0694-99ab-11db-937f-000e0c431b59', 339.48),
('copy4-3479e733-bce7-11e4-a1f3-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 1170),
('copy4-3479e733-bce7-11e4-a1f3-005056be1f7b', '4dc0750a-691d-11e0-adb9-001cc494be80', 994.5),
('copy4-3479e733-bce7-11e4-a1f3-005056be1f7b', 'feff0694-99ab-11db-937f-000e0c431b59', 1076.4),
('copy4-35c08325-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy4-35c08325-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy4-35c08325-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy4-35c08327-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy4-35c08327-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy4-35c08327-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy4-35c08329-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy4-35c08329-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy4-35c08329-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy4-35c0832b-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy4-35c0832b-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy4-35c0832b-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy4-35c0832d-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy4-35c0832d-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy4-35c0832d-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy4-35c0832f-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy4-35c0832f-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy4-35c0832f-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy4-35c08331-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy4-35c08331-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy4-35c08331-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy4-35c08333-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy4-35c08333-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy4-35c08333-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy4-35c08335-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy4-35c08335-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy4-35c08335-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy4-35c08337-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy4-35c08337-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy4-35c08337-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy4-35c08339-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy4-35c08339-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy4-35c08339-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy4-35c0833b-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy4-35c0833b-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy4-35c0833b-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy4-35c0833d-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy4-35c0833d-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy4-35c0833d-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy4-35c0833f-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy4-35c0833f-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy4-35c0833f-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy4-35c08341-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy4-35c08341-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy4-35c08341-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy4-35c08343-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy4-35c08343-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy4-35c08343-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy4-56a6f723-ea03-11de-860d-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 1719),
('copy4-56a6f723-ea03-11de-860d-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 1461.15),
('copy4-56a6f723-ea03-11de-860d-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 1581.48),
('copy4-56f519d0-4f2c-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 1989),
('copy4-56f519d0-4f2c-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 1690.65),
('copy4-56f519d0-4f2c-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 1829.88),
('copy4-7a3c5db1-777c-11de-9531-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 1399),
('copy4-7a3c5db1-777c-11de-9531-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 1189.15),
('copy4-7a3c5db1-777c-11de-9531-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b33', 999),
('copy4-7a3c5db1-777c-11de-9531-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 1287.08),
('copy4-7a3c5db3-777c-11de-9531-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 789),
('copy4-7a3c5db3-777c-11de-9531-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 670.65),
('copy4-7a3c5db3-777c-11de-9531-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 725.88),
('copy4-7a3c5db5-777c-11de-9531-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 1439),
('copy4-7a3c5db5-777c-11de-9531-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 1223.15),
('copy4-7a3c5db5-777c-11de-9531-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 1323.88),
('copy4-7a3c5db7-777c-11de-9531-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 859),
('copy4-7a3c5db7-777c-11de-9531-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 730.15),
('copy4-7a3c5db7-777c-11de-9531-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 790.28),
('copy4-82ebcce8-bce7-11e4-a1f3-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 5650),
('copy4-82ebcce8-bce7-11e4-a1f3-005056be1f7b', '4dc0750a-691d-11e0-adb9-001cc494be80', 4802.5),
('copy4-82ebcce8-bce7-11e4-a1f3-005056be1f7b', 'feff0694-99ab-11db-937f-000e0c431b59', 5198),
('copy4-9291c63a-5ab3-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy4-9291c63a-5ab3-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy4-9291c63a-5ab3-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy4-9291c63c-5ab3-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy4-9291c63c-5ab3-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy4-9291c63c-5ab3-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy4-9291c63e-5ab3-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy4-9291c63e-5ab3-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy4-9291c63e-5ab3-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy4-9291c640-5ab3-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy4-9291c640-5ab3-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy4-9291c640-5ab3-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy4-963b6b0a-04a8-11e3-94de-005056be3574', '288427e0-9732-11db-bbb4-0017315894a1', 1065),
('copy4-963b6b0a-04a8-11e3-94de-005056be3574', '4dc0750a-691d-11e0-adb9-001cc494be80', 901.85),
('copy4-963b6b0a-04a8-11e3-94de-005056be3574', 'feff0694-99ab-11db-937f-000e0c431b59', 976.12),
('copy4-992163db-a731-11de-90d4-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 989),
('copy4-992163db-a731-11de-90d4-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 840.65),
('copy4-992163db-a731-11de-90d4-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 909.88),
('copy4-992163dd-a731-11de-90d4-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 1849),
('copy4-992163dd-a731-11de-90d4-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 1571.65),
('copy4-992163dd-a731-11de-90d4-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 1701.08),
('copy4-a6f80c96-516a-11dd-a89a-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 529),
('copy4-a6f80c96-516a-11dd-a89a-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 449.65),
('copy4-a6f80c96-516a-11dd-a89a-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 486.68),
('copy4-a6f80c98-516a-11dd-a89a-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 969),
('copy4-a6f80c98-516a-11dd-a89a-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 823.65),
('copy4-a6f80c98-516a-11dd-a89a-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 891.48),
('copy4-a6f80c9c-516a-11dd-a89a-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 299),
('copy4-a6f80c9c-516a-11dd-a89a-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 254.15),
('copy4-a6f80c9c-516a-11dd-a89a-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 275.08),
('copy4-a6f80c9e-516a-11dd-a89a-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 559),
('copy4-a6f80c9e-516a-11dd-a89a-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 475.15),
('copy4-a6f80c9e-516a-11dd-a89a-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 514.28),
('copy4-a6f80ca2-516a-11dd-a89a-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 539),
('copy4-a6f80ca2-516a-11dd-a89a-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 458.15),
('copy4-a6f80ca2-516a-11dd-a89a-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 495.88),
('copy4-a6f80ca4-516a-11dd-a89a-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 1049),
('copy4-a6f80ca4-516a-11dd-a89a-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 891.65),
('copy4-a6f80ca4-516a-11dd-a89a-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 965.08),
('copy4-a6f80ca8-516a-11dd-a89a-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 1119),
('copy4-a6f80ca8-516a-11dd-a89a-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 951.15),
('copy4-a6f80ca8-516a-11dd-a89a-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 1029.48),
('copy4-a6f80cac-516a-11dd-a89a-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 559),
('copy4-a6f80cac-516a-11dd-a89a-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 475.15),
('copy4-a6f80cac-516a-11dd-a89a-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 514.28),
('copy4-a6f80cae-516a-11dd-a89a-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 1079),
('copy4-a6f80cae-516a-11dd-a89a-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 917.15),
('copy4-a6f80cae-516a-11dd-a89a-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 992.68),
('copy4-b182dc4f-f994-11e2-98ef-005056be3574', '288427e0-9732-11db-bbb4-0017315894a1', 539),
('copy4-b182dc4f-f994-11e2-98ef-005056be3574', '4dc0750a-691d-11e0-adb9-001cc494be80', 458.15),
('copy4-b182dc4f-f994-11e2-98ef-005056be3574', 'feff0694-99ab-11db-937f-000e0c431b59', 495.88),
('copy4-b182dc51-f994-11e2-98ef-005056be3574', '288427e0-9732-11db-bbb4-0017315894a1', 539),
('copy4-b182dc51-f994-11e2-98ef-005056be3574', '4dc0750a-691d-11e0-adb9-001cc494be80', 458.15),
('copy4-b182dc51-f994-11e2-98ef-005056be3574', 'feff0694-99ab-11db-937f-000e0c431b59', 495.88),
('copy4-b7e28649-21de-11df-860d-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 855),
('copy4-b7e28649-21de-11df-860d-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 726.75),
('copy4-b7e28649-21de-11df-860d-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 786.6),
('copy4-b7e2864b-21de-11df-860d-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 1659),
('copy4-b7e2864b-21de-11df-860d-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 1410.15),
('copy4-b7e2864b-21de-11df-860d-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 1526.28),
('copy4-c4df9e0d-00c0-11e2-a554-005056be3bd8', '288427e0-9732-11db-bbb4-0017315894a1', 539),
('copy4-c4df9e0d-00c0-11e2-a554-005056be3bd8', '4dc0750a-691d-11e0-adb9-001cc494be80', 458.15),
('copy4-c4df9e0d-00c0-11e2-a554-005056be3bd8', 'feff0694-99ab-11db-937f-000e0c431b59', 495.88),
('copy4-c4df9e0f-00c0-11e2-a554-005056be3bd8', '288427e0-9732-11db-bbb4-0017315894a1', 539),
('copy4-c4df9e0f-00c0-11e2-a554-005056be3bd8', '4dc0750a-691d-11e0-adb9-001cc494be80', 458.15),
('copy4-c4df9e0f-00c0-11e2-a554-005056be3bd8', 'feff0694-99ab-11db-937f-000e0c431b59', 495.88),
('copy4-c4df9e11-00c0-11e2-a554-005056be3bd8', '288427e0-9732-11db-bbb4-0017315894a1', 539),
('copy4-c4df9e11-00c0-11e2-a554-005056be3bd8', '4dc0750a-691d-11e0-adb9-001cc494be80', 458.15),
('copy4-c4df9e11-00c0-11e2-a554-005056be3bd8', 'feff0694-99ab-11db-937f-000e0c431b59', 495.88),
('copy4-c4df9e13-00c0-11e2-a554-005056be3bd8', '288427e0-9732-11db-bbb4-0017315894a1', 539),
('copy4-c4df9e13-00c0-11e2-a554-005056be3bd8', '4dc0750a-691d-11e0-adb9-001cc494be80', 458.15),
('copy4-c4df9e13-00c0-11e2-a554-005056be3bd8', 'feff0694-99ab-11db-937f-000e0c431b59', 495.88),
('copy4-cf6aa526-48b8-11dd-9342-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 174),
('copy4-cf6aa526-48b8-11dd-9342-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 147.9),
('copy4-cf6aa526-48b8-11dd-9342-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 160.08),
('copy4-d5823752-947b-11e3-8d88-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 975),
('copy4-d5823752-947b-11e3-8d88-005056be1f7b', '4dc0750a-691d-11e0-adb9-001cc494be80', 828.75),
('copy4-d5823752-947b-11e3-8d88-005056be1f7b', 'feff0694-99ab-11db-937f-000e0c431b59', 897),
('copy4-da49edc1-58f9-11e0-894e-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 4399),
('copy4-da49edc1-58f9-11e0-894e-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 3739.15),
('copy4-da49edc1-58f9-11e0-894e-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 4047.08),
('copy4-da49edc3-58f9-11e0-894e-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 4399),
('copy4-da49edc3-58f9-11e0-894e-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 3739.15),
('copy4-da49edc3-58f9-11e0-894e-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 4047.08),
('copy4-da49edc5-58f9-11e0-894e-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 4399),
('copy4-da49edc5-58f9-11e0-894e-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 3739.15),
('copy4-da49edc5-58f9-11e0-894e-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 4047.08),
('copy4-da49edc7-58f9-11e0-894e-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 4399),
('copy4-da49edc7-58f9-11e0-894e-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 3739.15),
('copy4-da49edc7-58f9-11e0-894e-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 4047.08),
('copy4-da49edc9-58f9-11e0-894e-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 4399),
('copy4-da49edc9-58f9-11e0-894e-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 3739.15),
('copy4-da49edc9-58f9-11e0-894e-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 4047.08),
('copy4-da49edcb-58f9-11e0-894e-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 4399),
('copy4-da49edcb-58f9-11e0-894e-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 3739.15),
('copy4-da49edcb-58f9-11e0-894e-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 4047.08),
('copy4-df210450-93af-11e3-82a4-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 369),
('copy4-df210450-93af-11e3-82a4-005056be1f7b', '4dc0750a-691d-11e0-adb9-001cc494be80', 313.65),
('copy4-df210450-93af-11e3-82a4-005056be1f7b', 'feff0694-99ab-11db-937f-000e0c431b59', 339.48),
('copy4-e242e97f-f29b-11dd-9439-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 3289),
('copy4-e242e97f-f29b-11dd-9439-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 2795.65),
('copy4-e242e97f-f29b-11dd-9439-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 3025.88),
('copy4-e4020814-4598-11e1-8212-001cc494be80', '288427e0-9732-11db-bbb4-0017315894a1', 1449),
('copy4-e4020814-4598-11e1-8212-001cc494be80', '4dc0750a-691d-11e0-adb9-001cc494be80', 1231.65),
('copy4-e4020814-4598-11e1-8212-001cc494be80', 'feff0694-99ab-11db-937f-000e0c431b59', 1333.08),
('copy4-e8976171-93af-11e3-82a4-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 929),
('copy4-e8976171-93af-11e3-82a4-005056be1f7b', '4dc0750a-691d-11e0-adb9-001cc494be80', 789.65),
('copy4-e8976171-93af-11e3-82a4-005056be1f7b', 'feff0694-99ab-11db-937f-000e0c431b59', 854.68),
('copy4-f0ad1dd1-1f91-11e4-9591-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 4399),
('copy4-f0ad1dd1-1f91-11e4-9591-005056be1f7b', '4dc0750a-691d-11e0-adb9-001cc494be80', 3739.15),
('copy4-f0ad1dd1-1f91-11e4-9591-005056be1f7b', 'feff0694-99ab-11db-937f-000e0c431b59', 4047.08),
('copy4-f5f1fcd6-d1c2-11e3-8b7a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 979),
('copy4-f5f1fcd6-d1c2-11e3-8b7a-005056be1f7b', '4dc0750a-691d-11e0-adb9-001cc494be80', 833),
('copy4-f5f1fcd6-d1c2-11e3-8b7a-005056be1f7b', 'feff0694-99ab-11db-937f-000e0c431b59', 901.6),
('copy4-fbb89466-93af-11e3-82a4-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 369),
('copy4-fbb89466-93af-11e3-82a4-005056be1f7b', '4dc0750a-691d-11e0-adb9-001cc494be80', 313.65),
('copy4-fbb89466-93af-11e3-82a4-005056be1f7b', 'feff0694-99ab-11db-937f-000e0c431b59', 339.48),
('copy4-fded4984-d1c2-11e3-8b7a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 979),
('copy4-fded4984-d1c2-11e3-8b7a-005056be1f7b', '4dc0750a-691d-11e0-adb9-001cc494be80', 833),
('copy4-fded4984-d1c2-11e3-8b7a-005056be1f7b', 'feff0694-99ab-11db-937f-000e0c431b59', 901.6),
('copy4-fea6c165-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy4-fea6c165-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy4-fea6c165-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy4-fea6c167-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy4-fea6c167-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy4-fea6c167-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy4-fea6c169-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy4-fea6c169-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy4-fea6c169-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy4-fea6c16b-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy4-fea6c16b-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy4-fea6c16b-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy4-fea6c16d-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy4-fea6c16d-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy4-fea6c16d-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy4-fea6c16f-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy4-fea6c16f-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy4-fea6c16f-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy4-fea6c171-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy4-fea6c171-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy4-fea6c171-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy4-fea6c173-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy4-fea6c173-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy4-fea6c173-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy4-fea6c175-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy4-fea6c175-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy4-fea6c175-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy4-fea6c177-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy4-fea6c177-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy4-fea6c177-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy4-fea6c179-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy4-fea6c179-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy4-fea6c179-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy4-fea6c17b-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy4-fea6c17b-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy4-fea6c17b-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy4-fea6c17d-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy4-fea6c17d-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy4-fea6c17d-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy4-fea6c17f-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy4-fea6c17f-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy4-fea6c17f-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy4-fea6c181-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy4-fea6c181-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy4-fea6c181-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy4-fea6c183-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy4-fea6c183-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy4-fea6c183-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy4-fea6c185-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy4-fea6c185-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy4-fea6c185-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy4-fea6c187-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 174),
('copy4-fea6c187-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 147.9),
('copy4-fea6c187-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 160.08),
('copy4-fea6c189-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 174),
('copy4-fea6c189-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 147.9),
('copy4-fea6c189-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 160.08),
('copy4-fea6c18b-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 174),
('copy4-fea6c18b-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 147.9),
('copy4-fea6c18b-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 160.08),
('copy4-fea6c18d-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 174),
('copy4-fea6c18d-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 147.9),
('copy4-fea6c18d-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 160.08),
('copy4-fea6c18f-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy4-fea6c18f-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy4-fea6c18f-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy4-fea6c191-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy4-fea6c191-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy4-fea6c191-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy5-047805a5-fe8c-11e3-bbdb-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 419),
('copy5-047805a5-fe8c-11e3-bbdb-005056be1f7b', '4dc0750a-691d-11e0-adb9-001cc494be80', 356.15),
('copy5-047805a5-fe8c-11e3-bbdb-005056be1f7b', 'feff0694-99ab-11db-937f-000e0c431b59', 385.48),
('copy5-04834f06-93b0-11e3-82a4-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 929),
('copy5-04834f06-93b0-11e3-82a4-005056be1f7b', '4dc0750a-691d-11e0-adb9-001cc494be80', 789.65),
('copy5-04834f06-93b0-11e3-82a4-005056be1f7b', 'feff0694-99ab-11db-937f-000e0c431b59', 854.68),
('copy5-076d2137-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 369),
('copy5-076d2137-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 313.65),
('copy5-076d2137-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 339.48),
('copy5-076d2139-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 929),
('copy5-076d2139-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 789.65),
('copy5-076d2139-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 854.68),
('copy5-076d213b-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 369),
('copy5-076d213b-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 313.65),
('copy5-076d213b-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 339.48),
('copy5-076d213d-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 929),
('copy5-076d213d-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 789.65),
('copy5-076d213d-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 854.68),
('copy5-076d213f-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 369),
('copy5-076d213f-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 313.65),
('copy5-076d213f-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 339.48),
('copy5-076d2141-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 929),
('copy5-076d2141-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 789.65),
('copy5-076d2141-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 854.68),
('copy5-076d2143-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 369),
('copy5-076d2143-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 313.65),
('copy5-076d2143-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 339.48),
('copy5-076d2145-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 929),
('copy5-076d2145-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 789.65),
('copy5-076d2145-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 854.68),
('copy5-076d2147-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 369),
('copy5-076d2147-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 313.65),
('copy5-076d2147-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 339.48),
('copy5-076d2149-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 929),
('copy5-076d2149-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 789.65),
('copy5-076d2149-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 854.68),
('copy5-076d214b-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 369),
('copy5-076d214b-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 313.65),
('copy5-076d214b-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 339.48),
('copy5-076d214d-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 929),
('copy5-076d214d-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 789.65),
('copy5-076d214d-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 854.68),
('copy5-076d216b-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy5-076d216b-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy5-076d216b-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b33', 666999),
('copy5-076d216b-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy5-076d216d-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy5-076d216d-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy5-076d216d-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy5-076d216f-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy5-076d216f-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy5-076d216f-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy5-076d2173-4380-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy5-076d2173-4380-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy5-076d2173-4380-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy5-0916172c-947c-11e3-8d88-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 979),
('copy5-0916172c-947c-11e3-8d88-005056be1f7b', '4dc0750a-691d-11e0-adb9-001cc494be80', 833),
('copy5-0916172c-947c-11e3-8d88-005056be1f7b', 'feff0694-99ab-11db-937f-000e0c431b59', 901.6),
('copy5-129c7f4d-5273-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 1759),
('copy5-129c7f4d-5273-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 1495.15),
('copy5-129c7f4d-5273-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 1618.28),
('copy5-13ce3df2-93b0-11e3-82a4-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 929),
('copy5-13ce3df2-93b0-11e3-82a4-005056be1f7b', '4dc0750a-691d-11e0-adb9-001cc494be80', 789.65),
('copy5-13ce3df2-93b0-11e3-82a4-005056be1f7b', 'feff0694-99ab-11db-937f-000e0c431b59', 854.68),
('copy5-1bd57597-93b0-11e3-82a4-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 369),
('copy5-1bd57597-93b0-11e3-82a4-005056be1f7b', '4dc0750a-691d-11e0-adb9-001cc494be80', 313.65),
('copy5-1bd57597-93b0-11e3-82a4-005056be1f7b', 'feff0694-99ab-11db-937f-000e0c431b59', 339.48),
('copy5-3479e733-bce7-11e4-a1f3-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 1170),
('copy5-3479e733-bce7-11e4-a1f3-005056be1f7b', '4dc0750a-691d-11e0-adb9-001cc494be80', 994.5),
('copy5-3479e733-bce7-11e4-a1f3-005056be1f7b', 'feff0694-99ab-11db-937f-000e0c431b59', 1076.4),
('copy5-35c08325-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy5-35c08325-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy5-35c08325-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy5-35c08327-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy5-35c08327-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy5-35c08327-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy5-35c08329-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy5-35c08329-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy5-35c08329-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy5-35c0832b-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy5-35c0832b-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy5-35c0832b-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy5-35c0832d-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy5-35c0832d-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy5-35c0832d-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy5-35c0832f-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy5-35c0832f-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy5-35c0832f-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy5-35c08331-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy5-35c08331-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy5-35c08331-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy5-35c08333-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy5-35c08333-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy5-35c08333-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy5-35c08335-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy5-35c08335-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy5-35c08335-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy5-35c08337-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy5-35c08337-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy5-35c08337-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy5-35c08339-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy5-35c08339-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy5-35c08339-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy5-35c0833b-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy5-35c0833b-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy5-35c0833b-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy5-35c0833d-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy5-35c0833d-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy5-35c0833d-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy5-35c0833f-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy5-35c0833f-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy5-35c0833f-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy5-35c08341-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy5-35c08341-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy5-35c08341-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy5-35c08343-4386-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 45),
('copy5-35c08343-4386-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 38.25),
('copy5-35c08343-4386-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 41.4),
('copy5-56a6f723-ea03-11de-860d-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 1719),
('copy5-56a6f723-ea03-11de-860d-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 1461.15),
('copy5-56a6f723-ea03-11de-860d-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 1581.48),
('copy5-56f519d0-4f2c-11de-8f53-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 1989),
('copy5-56f519d0-4f2c-11de-8f53-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 1690.65),
('copy5-56f519d0-4f2c-11de-8f53-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 1829.88),
('copy5-7a3c5db1-777c-11de-9531-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 1399),
('copy5-7a3c5db1-777c-11de-9531-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 1189.15),
('copy5-7a3c5db1-777c-11de-9531-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b33', 999),
('copy5-7a3c5db1-777c-11de-9531-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 1287.08),
('copy5-7a3c5db3-777c-11de-9531-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 789),
('copy5-7a3c5db3-777c-11de-9531-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 670.65),
('copy5-7a3c5db3-777c-11de-9531-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 725.88),
('copy5-7a3c5db5-777c-11de-9531-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 1439),
('copy5-7a3c5db5-777c-11de-9531-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 1223.15),
('copy5-7a3c5db5-777c-11de-9531-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 1323.88),
('copy5-7a3c5db7-777c-11de-9531-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 859),
('copy5-7a3c5db7-777c-11de-9531-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 730.15),
('copy5-7a3c5db7-777c-11de-9531-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 790.28),
('copy5-82ebcce8-bce7-11e4-a1f3-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 5650),
('copy5-82ebcce8-bce7-11e4-a1f3-005056be1f7b', '4dc0750a-691d-11e0-adb9-001cc494be80', 4802.5),
('copy5-82ebcce8-bce7-11e4-a1f3-005056be1f7b', 'feff0694-99ab-11db-937f-000e0c431b59', 5198),
('copy5-9291c63a-5ab3-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy5-9291c63a-5ab3-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy5-9291c63a-5ab3-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy5-9291c63c-5ab3-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy5-9291c63c-5ab3-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy5-9291c63c-5ab3-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy5-9291c63e-5ab3-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy5-9291c63e-5ab3-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy5-9291c63e-5ab3-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy5-9291c640-5ab3-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy5-9291c640-5ab3-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy5-9291c640-5ab3-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy5-963b6b0a-04a8-11e3-94de-005056be3574', '288427e0-9732-11db-bbb4-0017315894a1', 1065),
('copy5-963b6b0a-04a8-11e3-94de-005056be3574', '4dc0750a-691d-11e0-adb9-001cc494be80', 901.85),
('copy5-963b6b0a-04a8-11e3-94de-005056be3574', 'feff0694-99ab-11db-937f-000e0c431b59', 976.12),
('copy5-992163db-a731-11de-90d4-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 989),
('copy5-992163db-a731-11de-90d4-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 840.65),
('copy5-992163db-a731-11de-90d4-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 909.88),
('copy5-992163dd-a731-11de-90d4-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 1849),
('copy5-992163dd-a731-11de-90d4-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 1571.65),
('copy5-992163dd-a731-11de-90d4-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 1701.08),
('copy5-a6f80c96-516a-11dd-a89a-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 529),
('copy5-a6f80c96-516a-11dd-a89a-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 449.65),
('copy5-a6f80c96-516a-11dd-a89a-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 486.68),
('copy5-a6f80c98-516a-11dd-a89a-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 969),
('copy5-a6f80c98-516a-11dd-a89a-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 823.65),
('copy5-a6f80c98-516a-11dd-a89a-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 891.48),
('copy5-a6f80c9c-516a-11dd-a89a-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 299),
('copy5-a6f80c9c-516a-11dd-a89a-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 254.15),
('copy5-a6f80c9c-516a-11dd-a89a-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 275.08),
('copy5-a6f80c9e-516a-11dd-a89a-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 559),
('copy5-a6f80c9e-516a-11dd-a89a-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 475.15),
('copy5-a6f80c9e-516a-11dd-a89a-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 514.28),
('copy5-a6f80ca2-516a-11dd-a89a-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 539),
('copy5-a6f80ca2-516a-11dd-a89a-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 458.15),
('copy5-a6f80ca2-516a-11dd-a89a-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 495.88),
('copy5-a6f80ca4-516a-11dd-a89a-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 1049),
('copy5-a6f80ca4-516a-11dd-a89a-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 891.65),
('copy5-a6f80ca4-516a-11dd-a89a-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 965.08),
('copy5-a6f80ca8-516a-11dd-a89a-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 1119),
('copy5-a6f80ca8-516a-11dd-a89a-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 951.15),
('copy5-a6f80ca8-516a-11dd-a89a-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 1029.48),
('copy5-a6f80cac-516a-11dd-a89a-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 559),
('copy5-a6f80cac-516a-11dd-a89a-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 475.15),
('copy5-a6f80cac-516a-11dd-a89a-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 514.28),
('copy5-a6f80cae-516a-11dd-a89a-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 1079),
('copy5-a6f80cae-516a-11dd-a89a-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 917.15),
('copy5-a6f80cae-516a-11dd-a89a-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 992.68),
('copy5-b182dc4f-f994-11e2-98ef-005056be3574', '288427e0-9732-11db-bbb4-0017315894a1', 539),
('copy5-b182dc4f-f994-11e2-98ef-005056be3574', '4dc0750a-691d-11e0-adb9-001cc494be80', 458.15),
('copy5-b182dc4f-f994-11e2-98ef-005056be3574', 'feff0694-99ab-11db-937f-000e0c431b59', 495.88),
('copy5-b182dc51-f994-11e2-98ef-005056be3574', '288427e0-9732-11db-bbb4-0017315894a1', 539),
('copy5-b182dc51-f994-11e2-98ef-005056be3574', '4dc0750a-691d-11e0-adb9-001cc494be80', 458.15),
('copy5-b182dc51-f994-11e2-98ef-005056be3574', 'feff0694-99ab-11db-937f-000e0c431b59', 495.88),
('copy5-b7e28649-21de-11df-860d-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 855),
('copy5-b7e28649-21de-11df-860d-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 726.75),
('copy5-b7e28649-21de-11df-860d-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 786.6),
('copy5-b7e2864b-21de-11df-860d-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 1659),
('copy5-b7e2864b-21de-11df-860d-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 1410.15),
('copy5-b7e2864b-21de-11df-860d-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 1526.28),
('copy5-c4df9e0d-00c0-11e2-a554-005056be3bd8', '288427e0-9732-11db-bbb4-0017315894a1', 539),
('copy5-c4df9e0d-00c0-11e2-a554-005056be3bd8', '4dc0750a-691d-11e0-adb9-001cc494be80', 458.15),
('copy5-c4df9e0d-00c0-11e2-a554-005056be3bd8', 'feff0694-99ab-11db-937f-000e0c431b59', 495.88),
('copy5-c4df9e0f-00c0-11e2-a554-005056be3bd8', '288427e0-9732-11db-bbb4-0017315894a1', 539),
('copy5-c4df9e0f-00c0-11e2-a554-005056be3bd8', '4dc0750a-691d-11e0-adb9-001cc494be80', 458.15),
('copy5-c4df9e0f-00c0-11e2-a554-005056be3bd8', 'feff0694-99ab-11db-937f-000e0c431b59', 495.88),
('copy5-c4df9e11-00c0-11e2-a554-005056be3bd8', '288427e0-9732-11db-bbb4-0017315894a1', 539),
('copy5-c4df9e11-00c0-11e2-a554-005056be3bd8', '4dc0750a-691d-11e0-adb9-001cc494be80', 458.15),
('copy5-c4df9e11-00c0-11e2-a554-005056be3bd8', 'feff0694-99ab-11db-937f-000e0c431b59', 495.88),
('copy5-c4df9e13-00c0-11e2-a554-005056be3bd8', '288427e0-9732-11db-bbb4-0017315894a1', 539),
('copy5-c4df9e13-00c0-11e2-a554-005056be3bd8', '4dc0750a-691d-11e0-adb9-001cc494be80', 458.15),
('copy5-c4df9e13-00c0-11e2-a554-005056be3bd8', 'feff0694-99ab-11db-937f-000e0c431b59', 495.88),
('copy5-cf6aa526-48b8-11dd-9342-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 174),
('copy5-cf6aa526-48b8-11dd-9342-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 147.9),
('copy5-cf6aa526-48b8-11dd-9342-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 160.08),
('copy5-d5823752-947b-11e3-8d88-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 975),
('copy5-d5823752-947b-11e3-8d88-005056be1f7b', '4dc0750a-691d-11e0-adb9-001cc494be80', 828.75),
('copy5-d5823752-947b-11e3-8d88-005056be1f7b', 'feff0694-99ab-11db-937f-000e0c431b59', 897),
('copy5-da49edc1-58f9-11e0-894e-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 4399),
('copy5-da49edc1-58f9-11e0-894e-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 3739.15),
('copy5-da49edc1-58f9-11e0-894e-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 4047.08),
('copy5-da49edc3-58f9-11e0-894e-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 4399),
('copy5-da49edc3-58f9-11e0-894e-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 3739.15),
('copy5-da49edc3-58f9-11e0-894e-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 4047.08),
('copy5-da49edc5-58f9-11e0-894e-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 4399),
('copy5-da49edc5-58f9-11e0-894e-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 3739.15),
('copy5-da49edc5-58f9-11e0-894e-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 4047.08),
('copy5-da49edc7-58f9-11e0-894e-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 4399),
('copy5-da49edc7-58f9-11e0-894e-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 3739.15),
('copy5-da49edc7-58f9-11e0-894e-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 4047.08),
('copy5-da49edc9-58f9-11e0-894e-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 4399),
('copy5-da49edc9-58f9-11e0-894e-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 3739.15),
('copy5-da49edc9-58f9-11e0-894e-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 4047.08),
('copy5-da49edcb-58f9-11e0-894e-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 4399),
('copy5-da49edcb-58f9-11e0-894e-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 3739.15),
('copy5-da49edcb-58f9-11e0-894e-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 4047.08),
('copy5-df210450-93af-11e3-82a4-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 369),
('copy5-df210450-93af-11e3-82a4-005056be1f7b', '4dc0750a-691d-11e0-adb9-001cc494be80', 313.65),
('copy5-df210450-93af-11e3-82a4-005056be1f7b', 'feff0694-99ab-11db-937f-000e0c431b59', 339.48),
('copy5-e242e97f-f29b-11dd-9439-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 3289),
('copy5-e242e97f-f29b-11dd-9439-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 2795.65),
('copy5-e242e97f-f29b-11dd-9439-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 3025.88),
('copy5-e4020814-4598-11e1-8212-001cc494be80', '288427e0-9732-11db-bbb4-0017315894a1', 1449),
('copy5-e4020814-4598-11e1-8212-001cc494be80', '4dc0750a-691d-11e0-adb9-001cc494be80', 1231.65),
('copy5-e4020814-4598-11e1-8212-001cc494be80', 'feff0694-99ab-11db-937f-000e0c431b59', 1333.08),
('copy5-e8976171-93af-11e3-82a4-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 929),
('copy5-e8976171-93af-11e3-82a4-005056be1f7b', '4dc0750a-691d-11e0-adb9-001cc494be80', 789.65),
('copy5-e8976171-93af-11e3-82a4-005056be1f7b', 'feff0694-99ab-11db-937f-000e0c431b59', 854.68),
('copy5-f0ad1dd1-1f91-11e4-9591-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 4399),
('copy5-f0ad1dd1-1f91-11e4-9591-005056be1f7b', '4dc0750a-691d-11e0-adb9-001cc494be80', 3739.15),
('copy5-f0ad1dd1-1f91-11e4-9591-005056be1f7b', 'feff0694-99ab-11db-937f-000e0c431b59', 4047.08),
('copy5-f5f1fcd6-d1c2-11e3-8b7a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 979),
('copy5-f5f1fcd6-d1c2-11e3-8b7a-005056be1f7b', '4dc0750a-691d-11e0-adb9-001cc494be80', 833),
('copy5-f5f1fcd6-d1c2-11e3-8b7a-005056be1f7b', 'feff0694-99ab-11db-937f-000e0c431b59', 901.6),
('copy5-fbb89466-93af-11e3-82a4-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 369),
('copy5-fbb89466-93af-11e3-82a4-005056be1f7b', '4dc0750a-691d-11e0-adb9-001cc494be80', 313.65),
('copy5-fbb89466-93af-11e3-82a4-005056be1f7b', 'feff0694-99ab-11db-937f-000e0c431b59', 339.48),
('copy5-fded4984-d1c2-11e3-8b7a-005056be1f7b', '288427e0-9732-11db-bbb4-0017315894a1', 979),
('copy5-fded4984-d1c2-11e3-8b7a-005056be1f7b', '4dc0750a-691d-11e0-adb9-001cc494be80', 833),
('copy5-fded4984-d1c2-11e3-8b7a-005056be1f7b', 'feff0694-99ab-11db-937f-000e0c431b59', 901.6),
('copy5-fea6c165-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy5-fea6c165-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy5-fea6c165-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy5-fea6c167-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy5-fea6c167-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy5-fea6c167-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy5-fea6c169-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy5-fea6c169-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy5-fea6c169-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy5-fea6c16b-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy5-fea6c16b-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy5-fea6c16b-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy5-fea6c16d-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy5-fea6c16d-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy5-fea6c16d-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy5-fea6c16f-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy5-fea6c16f-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy5-fea6c16f-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy5-fea6c171-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy5-fea6c171-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy5-fea6c171-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy5-fea6c173-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy5-fea6c173-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy5-fea6c173-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy5-fea6c175-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy5-fea6c175-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy5-fea6c175-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy5-fea6c177-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy5-fea6c177-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy5-fea6c177-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy5-fea6c179-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy5-fea6c179-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy5-fea6c179-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy5-fea6c17b-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy5-fea6c17b-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy5-fea6c17b-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy5-fea6c17d-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy5-fea6c17d-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy5-fea6c17d-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy5-fea6c17f-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy5-fea6c17f-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy5-fea6c17f-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy5-fea6c181-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy5-fea6c181-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy5-fea6c181-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy5-fea6c183-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy5-fea6c183-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy5-fea6c183-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy5-fea6c185-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy5-fea6c185-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy5-fea6c185-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy5-fea6c187-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 174),
('copy5-fea6c187-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 147.9),
('copy5-fea6c187-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 160.08),
('copy5-fea6c189-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 174),
('copy5-fea6c189-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 147.9),
('copy5-fea6c189-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 160.08),
('copy5-fea6c18b-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 174),
('copy5-fea6c18b-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 147.9),
('copy5-fea6c18b-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 160.08),
('copy5-fea6c18d-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 174),
('copy5-fea6c18d-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 147.9),
('copy5-fea6c18d-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 160.08),
('copy5-fea6c18f-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy5-fea6c18f-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy5-fea6c18f-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76),
('copy5-fea6c191-5ab6-11dc-be42-000e0c431b58', '288427e0-9732-11db-bbb4-0017315894a1', 153),
('copy5-fea6c191-5ab6-11dc-be42-000e0c431b58', '4dc0750a-691d-11e0-adb9-001cc494be80', 130.05),
('copy5-fea6c191-5ab6-11dc-be42-000e0c431b58', 'feff0694-99ab-11db-937f-000e0c431b59', 140.76);

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
('047805a5-fe8c-11e3-bbdb-005056be1f7b-B3iD-Fut7-AphA-Dv4M-CajT-JukV', 'copy1-047805a5-fe8c-11e3-bbdb-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('047805a5-fe8c-11e3-bbdb-005056be1f7b-BA0a-FpRH-ArsJ-DIPB-CWU2-JbQK', 'copy1-047805a5-fe8c-11e3-bbdb-005056be1f7b', 'e765ba72-107d-11e3-8a5d-0050569a1080', 'база С', ''),
('047805a5-fe8c-11e3-bbdb-005056be1f7b-Be2f-FHKN-A2e3-D95J-Cm6J-JCla', 'copy1-047805a5-fe8c-11e3-bbdb-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('047805a5-fe8c-11e3-bbdb-005056be1f7b-BFzE-F6SD-AlVn-DTru-CUoG-JZRn', 'copy1-047805a5-fe8c-11e3-bbdb-005056be1f7b', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('047805a5-fe8c-11e3-bbdb-005056be1f7b-BgS5-FPV0-AvG2-DL35-CyEG-JVLp', 'copy1-047805a5-fe8c-11e3-bbdb-005056be1f7b', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для потолков', ''),
('047805a5-fe8c-11e3-bbdb-005056be1f7b-BGsg-F0ra-AIUW-DRW8-CshP-J22r', 'copy1-047805a5-fe8c-11e3-bbdb-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('047805a5-fe8c-11e3-bbdb-005056be1f7b-BKSI-FUbY-AVxt-DNO0-CXs1-J41B', 'copy1-047805a5-fe8c-11e3-bbdb-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('047805a5-fe8c-11e3-bbdb-005056be1f7b-BLLh-FHjT-A5oV-D6NX-CWgX-JlQN', 'copy1-047805a5-fe8c-11e3-bbdb-005056be1f7b', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '2,5', 'л'),
('047805a5-fe8c-11e3-bbdb-005056be1f7b-BpGT-FBCh-AYYD-DvAT-C0hm-J4x8', 'copy1-047805a5-fe8c-11e3-bbdb-005056be1f7b', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для стен', ''),
('047805a5-fe8c-11e3-bbdb-005056be1f7b-BSAO-Fu16-ACrs-DCEf-Cu3a-JwDm', 'copy1-047805a5-fe8c-11e3-bbdb-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('047805a5-fe8c-11e3-bbdb-005056be1f7b-By5B-FKMY-AI57-DXwx-CFBA-JjBb', 'copy1-047805a5-fe8c-11e3-bbdb-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('04834f06-93b0-11e3-82a4-005056be1f7b-B93g-F1LK-AP79-DHZ4-CJAP-JnIr', 'copy1-04834f06-93b0-11e3-82a4-005056be1f7b', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'по ржавчине', ''),
('04834f06-93b0-11e3-82a4-005056be1f7b-BAAU-FjqZ-AEac-DbrW-C0If-Jeiw', 'copy1-04834f06-93b0-11e3-82a4-005056be1f7b', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '2', 'л'),
('04834f06-93b0-11e3-82a4-005056be1f7b-BbJe-FZQ5-ATa6-DjDD-CRqM-JzU4', 'copy1-04834f06-93b0-11e3-82a4-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('04834f06-93b0-11e3-82a4-005056be1f7b-BKcr-FGJI-Abcf-DFg4-CYAh-JwCL', 'copy1-04834f06-93b0-11e3-82a4-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'красный', ''),
('04834f06-93b0-11e3-82a4-005056be1f7b-BlWd-FHbA-AA1A-DinD-CtY9-Jo6E', 'copy1-04834f06-93b0-11e3-82a4-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('04834f06-93b0-11e3-82a4-005056be1f7b-BnJi-FnrL-Aqaj-DpFe-CuDX-JQ4i', 'copy1-04834f06-93b0-11e3-82a4-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('04834f06-93b0-11e3-82a4-005056be1f7b-Bu65-FhFT-A7c3-DSnZ-Cvy2-Jd5B', 'copy1-04834f06-93b0-11e3-82a4-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('04834f06-93b0-11e3-82a4-005056be1f7b-BuLy-FquW-A8M5-DO0C-CMKO-Jly2', 'copy1-04834f06-93b0-11e3-82a4-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль-грунт', ''),
('076d2137-4380-11de-8f53-000e0c431b58-B9yg-FsEr-AGWw-DURp-C37w-JoOV', 'copy1-076d2137-4380-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('076d2137-4380-11de-8f53-000e0c431b58-Bans-Fqon-AaCV-DKcb-CKPu-JEOa', 'copy1-076d2137-4380-11de-8f53-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль-грунт', ''),
('076d2137-4380-11de-8f53-000e0c431b58-BCcW-Fyxn-Aepk-DRUy-CmyK-JEzq', 'copy1-076d2137-4380-11de-8f53-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('076d2137-4380-11de-8f53-000e0c431b58-BeVb-FAfj-AYuF-DNpH-Czn7-JVWA', 'copy1-076d2137-4380-11de-8f53-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'по ржавчине', ''),
('076d2137-4380-11de-8f53-000e0c431b58-BnNa-FtbG-A1Qt-DwmG-Cwpj-JJeW', 'copy1-076d2137-4380-11de-8f53-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('076d2137-4380-11de-8f53-000e0c431b58-BpGv-FRj1-AHFf-DJHX-COfz-J6Cl', 'copy1-076d2137-4380-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('076d2137-4380-11de-8f53-000e0c431b58-Bx0C-FXQW-AM4L-DX8B-CElO-JfUp', 'copy1-076d2137-4380-11de-8f53-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0,75', 'л'),
('076d2137-4380-11de-8f53-000e0c431b58-BYcr-FgwD-Aw5u-DPKX-CSEO-J54h', 'copy1-076d2137-4380-11de-8f53-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'черный', ''),
('076d2139-4380-11de-8f53-000e0c431b58-B4cY-FTYR-AZcj-Dm9u-C1J5-JV4S', 'copy1-076d2139-4380-11de-8f53-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('076d2139-4380-11de-8f53-000e0c431b58-B7D6-FcMI-AsMh-DFAh-Ce8g-JGqI', 'copy1-076d2139-4380-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('076d2139-4380-11de-8f53-000e0c431b58-B7n7-FjZx-Aqa9-DA4C-Cmxe-JBG4', 'copy1-076d2139-4380-11de-8f53-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '2', 'л'),
('076d2139-4380-11de-8f53-000e0c431b58-B80m-FslS-AaTe-D5NG-CR4N-JwaD', 'copy1-076d2139-4380-11de-8f53-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'черный', ''),
('076d2139-4380-11de-8f53-000e0c431b58-BLKf-FuXk-Atom-Dw1G-CBLU-JcDm', 'copy1-076d2139-4380-11de-8f53-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('076d2139-4380-11de-8f53-000e0c431b58-BpBS-FIkn-Afb6-DePw-C41U-JtZ3', 'copy1-076d2139-4380-11de-8f53-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль-грунт', ''),
('076d2139-4380-11de-8f53-000e0c431b58-BUNa-F3Sb-AZwZ-D64G-CDRM-JfKN', 'copy1-076d2139-4380-11de-8f53-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'по ржавчине', ''),
('076d2139-4380-11de-8f53-000e0c431b58-BYGb-F4Ap-A0Sj-DNF0-CQBC-JMeO', 'copy1-076d2139-4380-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('076d213b-4380-11de-8f53-000e0c431b58-B5ld-FIBy-Aswa-Dv7a-CJHX-JhNA', 'copy1-076d213b-4380-11de-8f53-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('076d213b-4380-11de-8f53-000e0c431b58-B8Sb-Fmae-ACxA-D11b-CauC-J54D', 'copy1-076d213b-4380-11de-8f53-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0,75', 'л'),
('076d213b-4380-11de-8f53-000e0c431b58-BDSk-F8Pn-AENn-DemP-CTf5-J7ZZ', 'copy1-076d213b-4380-11de-8f53-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль-грунт', ''),
('076d213b-4380-11de-8f53-000e0c431b58-BdWp-F6w2-AK4O-DZUj-CumD-JK0X', 'copy1-076d213b-4380-11de-8f53-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'по ржавчине', ''),
('076d213b-4380-11de-8f53-000e0c431b58-BK8Y-FGmZ-AFao-DICa-CXfx-JCbk', 'copy1-076d213b-4380-11de-8f53-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('076d213b-4380-11de-8f53-000e0c431b58-BM0U-F7G1-AJEF-D1ik-Cp8r-JBCI', 'copy1-076d213b-4380-11de-8f53-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('076d213b-4380-11de-8f53-000e0c431b58-BMDy-FhM2-Akab-DZLP-CGXO-JbUV', 'copy1-076d213b-4380-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('076d213b-4380-11de-8f53-000e0c431b58-BRea-FXU0-A8A7-DpB9-CxOC-JlvP', 'copy1-076d213b-4380-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('076d213d-4380-11de-8f53-000e0c431b58-B84B-FkZY-AmG9-DTS6-Cvuz-JYSo', 'copy1-076d213d-4380-11de-8f53-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('076d213d-4380-11de-8f53-000e0c431b58-Bb5m-FiyR-AtxI-Dp0J-CEgs-JkZV', 'copy1-076d213d-4380-11de-8f53-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'по ржавчине', ''),
('076d213d-4380-11de-8f53-000e0c431b58-Bcgv-Fa1D-AWmy-DMBG-C1rI-JSh1', 'copy1-076d213d-4380-11de-8f53-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '2', 'л'),
('076d213d-4380-11de-8f53-000e0c431b58-Bgjf-F4mW-Adqn-DgXB-Cqjr-JM8b', 'copy1-076d213d-4380-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('076d213d-4380-11de-8f53-000e0c431b58-BLqf-FYuP-A7LH-D5oK-C027-JLAZ', 'copy1-076d213d-4380-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('076d213d-4380-11de-8f53-000e0c431b58-BMvM-FJcU-AjGW-DD1k-CDQC-JqYK', 'copy1-076d213d-4380-11de-8f53-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('076d213d-4380-11de-8f53-000e0c431b58-BqBb-Fzrb-A9w8-DqXW-CCUP-JD5o', 'copy1-076d213d-4380-11de-8f53-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('076d213d-4380-11de-8f53-000e0c431b58-BSVa-Fnos-A2ld-DnTp-CPFN-Jdq8', 'copy1-076d213d-4380-11de-8f53-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль-грунт', ''),
('076d213f-4380-11de-8f53-000e0c431b58-B11E-F4ZV-AclI-Dlyd-CKta-JtvI', 'copy1-076d213f-4380-11de-8f53-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль-грунт', ''),
('076d213f-4380-11de-8f53-000e0c431b58-BCKh-FumC-ADOg-DYOU-CsZx-JMyh', 'copy1-076d213f-4380-11de-8f53-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'коричневый', ''),
('076d213f-4380-11de-8f53-000e0c431b58-BFfS-Fodp-AhZw-DxhL-CyGM-JTgn', 'copy1-076d213f-4380-11de-8f53-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('076d213f-4380-11de-8f53-000e0c431b58-BfkA-Fiar-Ak0H-DwE0-CaJf-Jty9', 'copy1-076d213f-4380-11de-8f53-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0,75', 'л'),
('076d213f-4380-11de-8f53-000e0c431b58-BjBf-FZaL-ADXD-D1rC-CjZL-JE3o', 'copy1-076d213f-4380-11de-8f53-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('076d213f-4380-11de-8f53-000e0c431b58-BLHW-FG8Z-AKut-DUgK-CKiV-JsT8', 'copy1-076d213f-4380-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('076d213f-4380-11de-8f53-000e0c431b58-BsJe-FcdA-Anoj-D9W3-C6HP-JIYB', 'copy1-076d213f-4380-11de-8f53-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'по ржавчине', ''),
('076d213f-4380-11de-8f53-000e0c431b58-BuXM-FRva-Amdz-DZqo-C72w-JT9t', 'copy1-076d213f-4380-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('076d2141-4380-11de-8f53-000e0c431b58-B0HN-F2PU-Aaci-DXxU-CjaV-Jda2', 'copy1-076d2141-4380-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('076d2141-4380-11de-8f53-000e0c431b58-BGax-FEcB-Axjy-D9r1-ComF-JcLO', 'copy1-076d2141-4380-11de-8f53-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль-грунт', ''),
('076d2141-4380-11de-8f53-000e0c431b58-BGrE-FpF2-A0oR-DUIr-CMRK-JIFn', 'copy1-076d2141-4380-11de-8f53-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'по ржавчине', ''),
('076d2141-4380-11de-8f53-000e0c431b58-BGs3-FdaS-Ar9r-DCu9-Cn1p-Jrgv', 'copy1-076d2141-4380-11de-8f53-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('076d2141-4380-11de-8f53-000e0c431b58-BhbC-FPew-ANIn-D41J-Cpao-JFRe', 'copy1-076d2141-4380-11de-8f53-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '2', 'л'),
('076d2141-4380-11de-8f53-000e0c431b58-BIc7-Fyd9-AnOX-DraN-CiZV-JvQl', 'copy1-076d2141-4380-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('076d2141-4380-11de-8f53-000e0c431b58-Bjfa-F21i-AjCz-DtK6-CXQn-JPuD', 'copy1-076d2141-4380-11de-8f53-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('076d2141-4380-11de-8f53-000e0c431b58-BmB5-F0go-ACEp-DBCz-CuZE-JM11', 'copy1-076d2141-4380-11de-8f53-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'коричневый', ''),
('076d2143-4380-11de-8f53-000e0c431b58-B6gM-FwyX-AUe8-DXHw-C5Yp-Jj8s', 'copy1-076d2143-4380-11de-8f53-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('076d2143-4380-11de-8f53-000e0c431b58-Bf0J-FCBf-AV5n-DsJf-Cj32-JwcX', 'copy1-076d2143-4380-11de-8f53-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль-грунт', ''),
('076d2143-4380-11de-8f53-000e0c431b58-BG4C-FLP7-AiHd-Dvfe-Ckm6-JXrX', 'copy1-076d2143-4380-11de-8f53-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'красно-коричневый', ''),
('076d2143-4380-11de-8f53-000e0c431b58-BR4o-FiDO-ABc6-DX4x-C9SO-JrJa', 'copy1-076d2143-4380-11de-8f53-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'по ржавчине', ''),
('076d2143-4380-11de-8f53-000e0c431b58-BvFW-Ftcd-AfX3-DK7z-C3uy-JCdL', 'copy1-076d2143-4380-11de-8f53-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0,75', 'л'),
('076d2143-4380-11de-8f53-000e0c431b58-Bx0K-FtWE-AhVW-DvCg-CL9C-JYu2', 'copy1-076d2143-4380-11de-8f53-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('076d2143-4380-11de-8f53-000e0c431b58-BYas-F2MO-AWw1-DSKh-CpkD-Jmyg', 'copy1-076d2143-4380-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('076d2143-4380-11de-8f53-000e0c431b58-BZf7-FOdo-AEHR-DKkc-CYqV-Jb3l', 'copy1-076d2143-4380-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('076d2145-4380-11de-8f53-000e0c431b58-BaJS-F84X-A5rA-DZAV-C8JO-JnrX', 'copy1-076d2145-4380-11de-8f53-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль-грунт', ''),
('076d2145-4380-11de-8f53-000e0c431b58-BaN8-FUMQ-AO51-DIAr-CuLB-J9Al', 'copy1-076d2145-4380-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('076d2145-4380-11de-8f53-000e0c431b58-BfX9-F6a2-AGZK-DeWz-CGir-Jlms', 'copy1-076d2145-4380-11de-8f53-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('076d2145-4380-11de-8f53-000e0c431b58-Bhhe-FsC1-AhIY-DPtA-C92X-Jcqf', 'copy1-076d2145-4380-11de-8f53-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '2', 'л'),
('076d2145-4380-11de-8f53-000e0c431b58-BHWe-FzHN-AheI-DcAQ-Crgo-JqbE', 'copy1-076d2145-4380-11de-8f53-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('076d2145-4380-11de-8f53-000e0c431b58-BLMJ-FOT0-AOtZ-DC3K-C0TY-J7ol', 'copy1-076d2145-4380-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('076d2145-4380-11de-8f53-000e0c431b58-BLUN-FyjN-AMiD-DH1A-CaZx-JJv7', 'copy1-076d2145-4380-11de-8f53-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'красно-коричневый', ''),
('076d2145-4380-11de-8f53-000e0c431b58-BM3f-FDAf-Auvr-Dvts-CW55-JfIO', 'copy1-076d2145-4380-11de-8f53-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'по ржавчине', ''),
('076d2147-4380-11de-8f53-000e0c431b58-B15z-F9T7-A6yw-DDHT-C8yy-JDZh', 'copy1-076d2147-4380-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('076d2147-4380-11de-8f53-000e0c431b58-B2n0-F66v-Aode-Dd8l-CrI2-JI1K', 'copy1-076d2147-4380-11de-8f53-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль-грунт', ''),
('076d2147-4380-11de-8f53-000e0c431b58-B8H7-FWYp-AKMi-DBdz-Czuk-JSQs', 'copy1-076d2147-4380-11de-8f53-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0,75', 'л'),
('076d2147-4380-11de-8f53-000e0c431b58-BJDc-FZ60-AdpO-DW5a-CkvU-Jato', 'copy1-076d2147-4380-11de-8f53-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'по ржавчине', ''),
('076d2147-4380-11de-8f53-000e0c431b58-BqeG-FlsF-An6Q-D3hE-CuO4-JOLN', 'copy1-076d2147-4380-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('076d2147-4380-11de-8f53-000e0c431b58-BQvd-FfIX-A6sJ-DQI4-C6ei-JXoQ', 'copy1-076d2147-4380-11de-8f53-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('076d2147-4380-11de-8f53-000e0c431b58-Brye-F7Ul-AtmH-DYG7-Ce1I-JTh4', 'copy1-076d2147-4380-11de-8f53-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'серый', ''),
('076d2147-4380-11de-8f53-000e0c431b58-BWoc-FJsk-AdpY-DRty-Cy32-JRRx', 'copy1-076d2147-4380-11de-8f53-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('076d2149-4380-11de-8f53-000e0c431b58-BDv3-Fi3m-Ae2C-DziT-C3Po-JU2Q', 'copy1-076d2149-4380-11de-8f53-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('076d2149-4380-11de-8f53-000e0c431b58-BjtS-FQP7-ATAT-Dlv3-CHgI-JTb3', 'copy1-076d2149-4380-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('076d2149-4380-11de-8f53-000e0c431b58-BpZs-F2r0-ADY5-DRhL-CgG6-JyXL', 'copy1-076d2149-4380-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('076d2149-4380-11de-8f53-000e0c431b58-BrUb-Flm9-AxIE-Dt8c-C5sJ-JGxc', 'copy1-076d2149-4380-11de-8f53-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('076d2149-4380-11de-8f53-000e0c431b58-BTpY-FXYV-A1SE-D0Z2-Cbdn-JUBf', 'copy1-076d2149-4380-11de-8f53-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '2', 'л'),
('076d2149-4380-11de-8f53-000e0c431b58-BUEX-FfA6-AiMx-DQwC-CWsI-JvsN', 'copy1-076d2149-4380-11de-8f53-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль-грунт', ''),
('076d2149-4380-11de-8f53-000e0c431b58-BuPL-F6uW-A9zL-DRRL-Cr5O-JIQO', 'copy1-076d2149-4380-11de-8f53-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'серый', ''),
('076d2149-4380-11de-8f53-000e0c431b58-BvrL-FFS8-A9ae-DGt6-C9ZV-JrRD', 'copy1-076d2149-4380-11de-8f53-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'по ржавчине', ''),
('076d214b-4380-11de-8f53-000e0c431b58-B2MY-FPxH-AbKT-DCPU-C2XW-JzBt', 'copy1-076d214b-4380-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('076d214b-4380-11de-8f53-000e0c431b58-B8Rl-FRU2-AlLP-D9BR-Cryv-Jacv', 'copy1-076d214b-4380-11de-8f53-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'по ржавчине', ''),
('076d214b-4380-11de-8f53-000e0c431b58-BAIx-FGAH-ADXP-Df2Z-Cw2m-JmwO', 'copy1-076d214b-4380-11de-8f53-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль-грунт', ''),
('076d214b-4380-11de-8f53-000e0c431b58-BHB8-FoW9-Ac01-DgFG-CIKL-Jjce', 'copy1-076d214b-4380-11de-8f53-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'зеленый', ''),
('076d214b-4380-11de-8f53-000e0c431b58-BNRz-FdP2-Au8p-DfYI-CRnV-JL1f', 'copy1-076d214b-4380-11de-8f53-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('076d214b-4380-11de-8f53-000e0c431b58-BON5-FNKn-AokM-DSaC-CtYT-JVpo', 'copy1-076d214b-4380-11de-8f53-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('076d214b-4380-11de-8f53-000e0c431b58-Bxds-FoAy-AuI0-D7sb-Cajn-Jzzb', 'copy1-076d214b-4380-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('076d214b-4380-11de-8f53-000e0c431b58-ByfG-FByg-ADi5-DX5j-CBH2-J2lG', 'copy1-076d214b-4380-11de-8f53-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0,75', 'л'),
('076d214d-4380-11de-8f53-000e0c431b58-BbpG-FMYF-A9Ay-DkTm-CAbt-JykJ', 'copy1-076d214d-4380-11de-8f53-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '2', 'л'),
('076d214d-4380-11de-8f53-000e0c431b58-BDuZ-FFf1-A6S8-Df2j-CKrf-JEDO', 'copy1-076d214d-4380-11de-8f53-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'зеленый', ''),
('076d214d-4380-11de-8f53-000e0c431b58-BHHx-FIaK-AbNV-D8yT-CLDn-JUoy', 'copy1-076d214d-4380-11de-8f53-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('076d214d-4380-11de-8f53-000e0c431b58-BKce-FZt0-ASz6-D1CD-CxUJ-Jvb1', 'copy1-076d214d-4380-11de-8f53-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль-грунт', ''),
('076d214d-4380-11de-8f53-000e0c431b58-BOTI-FlLG-ABRv-Dt0w-Clsl-JSxa', 'copy1-076d214d-4380-11de-8f53-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('076d214d-4380-11de-8f53-000e0c431b58-BqSl-FWJB-AyyV-D9IP-CiL0-J9Re', 'copy1-076d214d-4380-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('076d214d-4380-11de-8f53-000e0c431b58-Btzq-FEyz-ATXB-DSWS-CxLf-Jk9O', 'copy1-076d214d-4380-11de-8f53-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'по ржавчине', ''),
('076d214d-4380-11de-8f53-000e0c431b58-BzNx-Fwto-AV4W-D29a-CGos-JrA3', 'copy1-076d214d-4380-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('076d216b-4380-11de-8f53-000e0c431b58-BLsT-FvDv-Alm7-DLJV-C5V1-JCC9', 'copy1-076d216b-4380-11de-8f53-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('076d216b-4380-11de-8f53-000e0c431b58-BMeH-FqIr-AqzI-DRLA-CypP-JXYJ', 'copy1-076d216b-4380-11de-8f53-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'темно-коричневый', ''),
('076d216b-4380-11de-8f53-000e0c431b58-BNVg-F2cs-A5sF-DpSO-Cen9-J765', 'copy1-076d216b-4380-11de-8f53-000e0c431b58', 'd17cb785-d20b-11e4-9be0-005056be1f7c', '100', 'мл'),
('076d216b-4380-11de-8f53-000e0c431b58-Btsx-F2A9-A2yn-DGMC-CQXv-JjIz', 'copy1-076d216b-4380-11de-8f53-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('076d216b-4380-11de-8f53-000e0c431b58-BVub-FR7l-An17-Dd40-Cbmr-JPer', 'copy1-076d216b-4380-11de-8f53-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'колер', ''),
('076d216d-4380-11de-8f53-000e0c431b58-B0at-FUJk-Auss-DLdS-CXJ4-J1s9', 'copy1-076d216d-4380-11de-8f53-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'ярко-желтый', ''),
('076d216d-4380-11de-8f53-000e0c431b58-BA3d-FQlb-A2vY-D2qr-CBLt-J5Z8', 'copy1-076d216d-4380-11de-8f53-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'колер', ''),
('076d216d-4380-11de-8f53-000e0c431b58-BfC3-FNNW-Afkf-DYbO-CXqn-JpY9', 'copy1-076d216d-4380-11de-8f53-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('076d216d-4380-11de-8f53-000e0c431b58-BPZR-FrVU-AeeQ-Ds8k-CK8A-J5SJ', 'copy1-076d216d-4380-11de-8f53-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('076d216d-4380-11de-8f53-000e0c431b58-BR5i-FxT0-ABqq-DoWE-CnW8-JHnj', 'copy1-076d216d-4380-11de-8f53-000e0c431b58', 'd17cb785-d20b-11e4-9be0-005056be1f7c', '100', 'мл'),
('076d216f-4380-11de-8f53-000e0c431b58-B6Zh-FlE4-AqsP-Dnz4-CMYX-JhWu', 'copy1-076d216f-4380-11de-8f53-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('076d216f-4380-11de-8f53-000e0c431b58-BCDd-FE9L-Aetz-DUBE-COM0-J1nj', 'copy1-076d216f-4380-11de-8f53-000e0c431b58', 'd17cb785-d20b-11e4-9be0-005056be1f7c', '100', 'мл'),
('076d216f-4380-11de-8f53-000e0c431b58-BjBI-Fwab-AYxC-D5sa-Cunz-JRP5', 'copy1-076d216f-4380-11de-8f53-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('076d216f-4380-11de-8f53-000e0c431b58-BjeV-F8WB-AoYM-DYTl-CWkg-J6Y1', 'copy1-076d216f-4380-11de-8f53-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'желто-коричневый', ''),
('076d216f-4380-11de-8f53-000e0c431b58-BL6m-Fbjc-AUw2-DrUN-Cc4P-Jkpq', 'copy1-076d216f-4380-11de-8f53-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'колер', ''),
('076d2173-4380-11de-8f53-000e0c431b58-B20y-FF3h-A9Tj-DyGw-CVjX-J0kl', 'copy1-076d2173-4380-11de-8f53-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'колер', ''),
('076d2173-4380-11de-8f53-000e0c431b58-B9TA-FxoB-A33O-D3t3-CbC1-JwMg', 'copy1-076d2173-4380-11de-8f53-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('076d2173-4380-11de-8f53-000e0c431b58-Bcko-FBOX-APiH-DiV8-CyTR-JzH6', 'copy1-076d2173-4380-11de-8f53-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('076d2173-4380-11de-8f53-000e0c431b58-BS9V-FKpp-AYIi-DnsO-CTuS-JwzQ', 'copy1-076d2173-4380-11de-8f53-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'фиалка', ''),
('076d2173-4380-11de-8f53-000e0c431b58-BW1J-FeYe-AbMx-DtC6-Co46-Jc0x', 'copy1-076d2173-4380-11de-8f53-000e0c431b58', 'd17cb785-d20b-11e4-9be0-005056be1f7c', '100', 'мл'),
('0916172c-947c-11e3-8d88-005056be1f7b-B9N4-FF5L-Aeu0-DWIo-CWUM-JFOV', 'copy1-0916172c-947c-11e3-8d88-005056be1f7b', '1ea6fcc4-d206-11e4-9be0-005056be1f7c', '2', 'мм'),
('0916172c-947c-11e3-8d88-005056be1f7b-BBlM-FjWi-AMKD-DtUB-CepV-J4QJ', 'copy1-0916172c-947c-11e3-8d88-005056be1f7b', 'e765ba75-107d-11e3-8a5d-0050569a1080', '15', 'кг'),
('0916172c-947c-11e3-8d88-005056be1f7b-BJ5X-FcOJ-AXmQ-DcPm-Clob-J3u7', 'copy1-0916172c-947c-11e3-8d88-005056be1f7b', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'декоративная с эффектом "зернистости"', ''),
('0916172c-947c-11e3-8d88-005056be1f7b-BlnC-FYMX-AUTi-DvVm-Cxfg-JK8v', 'copy1-0916172c-947c-11e3-8d88-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('0916172c-947c-11e3-8d88-005056be1f7b-BMit-F4IG-A3me-DcTb-CZjl-Jg3f', 'copy1-0916172c-947c-11e3-8d88-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'штукатурка структурная', ''),
('0916172c-947c-11e3-8d88-005056be1f7b-BULP-FODw-AdIq-Dqcw-CjDp-JPIi', 'copy1-0916172c-947c-11e3-8d88-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('0916172c-947c-11e3-8d88-005056be1f7b-BUUY-Flxn-ANYS-DoRD-Cl3r-JnR4', 'copy1-0916172c-947c-11e3-8d88-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('0916172c-947c-11e3-8d88-005056be1f7b-Bzf6-F3kG-A2VT-DUw5-CXGF-JmVI', 'copy1-0916172c-947c-11e3-8d88-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('0916172c-947c-11e3-8d88-005056be1f7b-BZzR-FFft-A3Fw-DiV6-CGLb-JCDB', 'copy1-0916172c-947c-11e3-8d88-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('129c7f4d-5273-11de-8f53-000e0c431b58-B2XD-FhDe-AMt4-DQRv-CwE4-JZbF', 'copy1-129c7f4d-5273-11de-8f53-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('129c7f4d-5273-11de-8f53-000e0c431b58-B7Z2-FddP-AQFk-DEhm-CXjJ-JKBL', 'copy1-129c7f4d-5273-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('129c7f4d-5273-11de-8f53-000e0c431b58-B8WF-Fmgk-Aswp-DRrB-CaCb-Jh2N', 'copy1-129c7f4d-5273-11de-8f53-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('129c7f4d-5273-11de-8f53-000e0c431b58-BBhx-FcBL-Ag7L-DzPO-C8S6-JG9A', 'copy1-129c7f4d-5273-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('129c7f4d-5273-11de-8f53-000e0c431b58-BCqJ-FqE1-Aa2h-DDXw-CmVx-JbCT', 'copy1-129c7f4d-5273-11de-8f53-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('129c7f4d-5273-11de-8f53-000e0c431b58-Bjbp-FSlZ-AD7f-DWaH-CESf-JH1j', 'copy1-129c7f4d-5273-11de-8f53-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '9', 'л'),
('129c7f4d-5273-11de-8f53-000e0c431b58-BkOY-FDzu-AnBn-DYrt-Cwrn-JgPi', 'copy1-129c7f4d-5273-11de-8f53-000e0c431b58', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('129c7f4d-5273-11de-8f53-000e0c431b58-BmCT-FfSk-AQFp-DJeG-CPEi-J6WJ', 'copy1-129c7f4d-5273-11de-8f53-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для потолков', ''),
('129c7f4d-5273-11de-8f53-000e0c431b58-BUZG-Fzwh-A811-Dd9q-CCks-JWGA', 'copy1-129c7f4d-5273-11de-8f53-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для стен', ''),
('129c7f4d-5273-11de-8f53-000e0c431b58-BwIm-FXMJ-AAjs-DJtu-CVFT-Jdmr', 'copy1-129c7f4d-5273-11de-8f53-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('13ce3df2-93b0-11e3-82a4-005056be1f7b-B2SI-FkOu-AH9x-Dwzs-Ca2I-JFSf', 'copy1-13ce3df2-93b0-11e3-82a4-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('13ce3df2-93b0-11e3-82a4-005056be1f7b-B42m-FyTu-AMNm-DcEz-CgpC-JC2E', 'copy1-13ce3df2-93b0-11e3-82a4-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль-грунт', ''),
('13ce3df2-93b0-11e3-82a4-005056be1f7b-B7VI-FVFl-AETk-DXfT-C0RM-Jjdd', 'copy1-13ce3df2-93b0-11e3-82a4-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('13ce3df2-93b0-11e3-82a4-005056be1f7b-BCap-FbXZ-ARbP-DsnY-CoyM-Jnxz', 'copy1-13ce3df2-93b0-11e3-82a4-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'синий', ''),
('13ce3df2-93b0-11e3-82a4-005056be1f7b-Bfk7-FvTk-AK8Z-DWkN-CMbf-JUCt', 'copy1-13ce3df2-93b0-11e3-82a4-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('13ce3df2-93b0-11e3-82a4-005056be1f7b-BFKs-F37i-AkXZ-Dtcs-CO9S-JLtm', 'copy1-13ce3df2-93b0-11e3-82a4-005056be1f7b', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'по ржавчине', ''),
('13ce3df2-93b0-11e3-82a4-005056be1f7b-Bt36-FVxt-AAcm-Dy1X-Ckwt-JtIy', 'copy1-13ce3df2-93b0-11e3-82a4-005056be1f7b', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '2', 'л'),
('13ce3df2-93b0-11e3-82a4-005056be1f7b-Bw4j-FLQK-AZcm-D6xo-Cp3y-JXvv', 'copy1-13ce3df2-93b0-11e3-82a4-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('1bd57597-93b0-11e3-82a4-005056be1f7b-B04i-FZ2F-Al97-D3dT-CJ4O-JmGa', 'copy1-1bd57597-93b0-11e3-82a4-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('1bd57597-93b0-11e3-82a4-005056be1f7b-B3X8-F3vQ-AkYJ-D4w3-CTvw-J2Lo', 'copy1-1bd57597-93b0-11e3-82a4-005056be1f7b', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'по ржавчине', ''),
('1bd57597-93b0-11e3-82a4-005056be1f7b-B7xm-F4pF-ANz0-DcbF-C3Uc-JzMO', 'copy1-1bd57597-93b0-11e3-82a4-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('1bd57597-93b0-11e3-82a4-005056be1f7b-Ba6d-FNLQ-AQh0-DYSs-Cm3T-JXtZ', 'copy1-1bd57597-93b0-11e3-82a4-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('1bd57597-93b0-11e3-82a4-005056be1f7b-BGxn-FPqZ-AIAL-D52W-CiyK-JLsz', 'copy1-1bd57597-93b0-11e3-82a4-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('1bd57597-93b0-11e3-82a4-005056be1f7b-Bjku-F2Gm-AJIZ-D8hM-CH2Q-JeWQ', 'copy1-1bd57597-93b0-11e3-82a4-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'синий', ''),
('1bd57597-93b0-11e3-82a4-005056be1f7b-BLx9-F9nN-AeSt-D6mg-CuCp-J15n', 'copy1-1bd57597-93b0-11e3-82a4-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль-грунт', ''),
('1bd57597-93b0-11e3-82a4-005056be1f7b-BR6o-FQXG-AWQb-DzGn-CEMb-JrcH', 'copy1-1bd57597-93b0-11e3-82a4-005056be1f7b', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0,75', 'л'),
('3479e733-bce7-11e4-a1f3-005056be1f7b-B5cZ-F91q-AcZw-DV0Z-CRfO-Jp04', 'copy1-3479e733-bce7-11e4-a1f3-005056be1f7b', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '2', 'л'),
('3479e733-bce7-11e4-a1f3-005056be1f7b-BFCE-FrZp-Afr7-D4uj-CIPP-JA1Z', 'copy1-3479e733-bce7-11e4-a1f3-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'серебристый', ''),
('3479e733-bce7-11e4-a1f3-005056be1f7b-BgyY-FdpU-AJmb-DDXn-CFpf-JWuS', 'copy1-3479e733-bce7-11e4-a1f3-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('3479e733-bce7-11e4-a1f3-005056be1f7b-BJNx-FGHh-ApPw-D5Qn-CUfp-JJZL', 'copy1-3479e733-bce7-11e4-a1f3-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('3479e733-bce7-11e4-a1f3-005056be1f7b-BOCy-F5fp-A0zr-Dm6n-CZBq-JdsF', 'copy1-3479e733-bce7-11e4-a1f3-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('3479e733-bce7-11e4-a1f3-005056be1f7b-Bs1J-FRbx-AjTW-DUl5-C7k5-J8WQ', 'copy1-3479e733-bce7-11e4-a1f3-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'молотковая эмаль-грунт', ''),
('3479e733-bce7-11e4-a1f3-005056be1f7b-BS2R-FEwi-AsHD-DXQd-CjG4-Jkn6', 'copy1-3479e733-bce7-11e4-a1f3-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('3479e733-bce7-11e4-a1f3-005056be1f7b-BzZA-FhC7-AKc8-D27p-C8G4-JuMB', 'copy1-3479e733-bce7-11e4-a1f3-005056be1f7b', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'по ржавчине', ''),
('35c08325-4386-11de-8f53-000e0c431b58-B9ay-FwJ1-Arxu-DnQt-CbQr-Ji1d', 'copy1-35c08325-4386-11de-8f53-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('35c08325-4386-11de-8f53-000e0c431b58-BA8H-FkwN-AWHx-DtGX-CUdN-Je9l', 'copy1-35c08325-4386-11de-8f53-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'салатовый', ''),
('35c08325-4386-11de-8f53-000e0c431b58-BaOg-FK2w-A5SD-Dl24-CEnG-JpMC', 'copy1-35c08325-4386-11de-8f53-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'колер', ''),
('35c08325-4386-11de-8f53-000e0c431b58-BWJU-FiTF-ArFz-DRoV-C0Fj-JgQb', 'copy1-35c08325-4386-11de-8f53-000e0c431b58', 'd17cb785-d20b-11e4-9be0-005056be1f7c', '100', 'мл'),
('35c08325-4386-11de-8f53-000e0c431b58-BwMk-Fj7r-A7RL-DKvJ-Cvtj-Jjgs', 'copy1-35c08325-4386-11de-8f53-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('35c08327-4386-11de-8f53-000e0c431b58-B0C2-FImM-ArHV-DYlJ-Cet8-J0lT', 'copy1-35c08327-4386-11de-8f53-000e0c431b58', 'd17cb785-d20b-11e4-9be0-005056be1f7c', '100', 'мл'),
('35c08327-4386-11de-8f53-000e0c431b58-BIxe-F2WZ-A2Xn-DBHN-C8cD-JsBQ', 'copy1-35c08327-4386-11de-8f53-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'колер', ''),
('35c08327-4386-11de-8f53-000e0c431b58-BSKt-FWvk-AP1O-DWfb-CZ3k-Jta5', 'copy1-35c08327-4386-11de-8f53-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'фисташковый', ''),
('35c08327-4386-11de-8f53-000e0c431b58-BVzv-FjMQ-AAlI-DkUj-CeJr-JexG', 'copy1-35c08327-4386-11de-8f53-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('35c08327-4386-11de-8f53-000e0c431b58-ByH0-FoYo-A0Yt-Dj60-CANK-Juk6', 'copy1-35c08327-4386-11de-8f53-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('35c08329-4386-11de-8f53-000e0c431b58-B8oc-FO0m-Agkx-D2DF-CysG-J5tf', 'copy1-35c08329-4386-11de-8f53-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('35c08329-4386-11de-8f53-000e0c431b58-Bl5Z-FBCT-AEem-Dkn0-Ckkn-JCzn', 'copy1-35c08329-4386-11de-8f53-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'колер', ''),
('35c08329-4386-11de-8f53-000e0c431b58-BoAF-FAZq-AK5a-DH4C-CbTf-JJWA', 'copy1-35c08329-4386-11de-8f53-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('35c08329-4386-11de-8f53-000e0c431b58-BpWO-FcNR-AiCA-Do7t-CJho-Jijq', 'copy1-35c08329-4386-11de-8f53-000e0c431b58', 'd17cb785-d20b-11e4-9be0-005056be1f7c', '100', 'мл'),
('35c08329-4386-11de-8f53-000e0c431b58-BZdr-FDey-ARbQ-DVKS-ClKU-JcS8', 'copy1-35c08329-4386-11de-8f53-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'морская волна', ''),
('35c0832b-4386-11de-8f53-000e0c431b58-B3nK-FeNx-AeyY-DH2N-Cvgj-J00x', 'copy1-35c0832b-4386-11de-8f53-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'изумрудный', ''),
('35c0832b-4386-11de-8f53-000e0c431b58-B6OE-FP40-AIPw-DpvE-CbF2-JAyv', 'copy1-35c0832b-4386-11de-8f53-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'колер', ''),
('35c0832b-4386-11de-8f53-000e0c431b58-Bbua-FZPF-AWiB-D3rO-Ckmc-Jo2W', 'copy1-35c0832b-4386-11de-8f53-000e0c431b58', 'd17cb785-d20b-11e4-9be0-005056be1f7c', '100', 'мл'),
('35c0832b-4386-11de-8f53-000e0c431b58-BQiz-FRMw-ABWU-Dp64-CVxh-JgSv', 'copy1-35c0832b-4386-11de-8f53-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('35c0832b-4386-11de-8f53-000e0c431b58-BUwj-Fs5a-A7p8-Dfo8-CS6f-JINs', 'copy1-35c0832b-4386-11de-8f53-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('35c0832d-4386-11de-8f53-000e0c431b58-BIR3-FSnU-ATWa-DUq8-CBY0-J1iX', 'copy1-35c0832d-4386-11de-8f53-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'колер', ''),
('35c0832d-4386-11de-8f53-000e0c431b58-Bn0l-FapX-AfHd-DWIR-CHjB-Ji9R', 'copy1-35c0832d-4386-11de-8f53-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'синий', ''),
('35c0832d-4386-11de-8f53-000e0c431b58-BoV1-FpNh-A4xJ-DWcB-CsGB-JUgr', 'copy1-35c0832d-4386-11de-8f53-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('35c0832d-4386-11de-8f53-000e0c431b58-BrBy-FKY7-Acfg-DdEf-Cvs1-JlXE', 'copy1-35c0832d-4386-11de-8f53-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('35c0832d-4386-11de-8f53-000e0c431b58-BwB4-FSe8-AyPq-Do2E-Ct0V-JlS0', 'copy1-35c0832d-4386-11de-8f53-000e0c431b58', 'd17cb785-d20b-11e4-9be0-005056be1f7c', '100', 'мл'),
('35c0832f-4386-11de-8f53-000e0c431b58-B0Wb-FZpQ-AYW3-DY7x-C4dg-Jor5', 'copy1-35c0832f-4386-11de-8f53-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('35c0832f-4386-11de-8f53-000e0c431b58-B7mV-FX7B-AU9a-DTz0-CqlA-Jj5e', 'copy1-35c0832f-4386-11de-8f53-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'черный', ''),
('35c0832f-4386-11de-8f53-000e0c431b58-Bd0y-FWYu-AJSO-Dq76-CkM5-JlEg', 'copy1-35c0832f-4386-11de-8f53-000e0c431b58', 'd17cb785-d20b-11e4-9be0-005056be1f7c', '100', 'мл'),
('35c0832f-4386-11de-8f53-000e0c431b58-Bhsu-FNXl-ARGl-Dns4-Cmog-J8Bc', 'copy1-35c0832f-4386-11de-8f53-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('35c0832f-4386-11de-8f53-000e0c431b58-BQ9B-F2lt-AvOY-DRLa-CuLw-JMlc', 'copy1-35c0832f-4386-11de-8f53-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'колер', ''),
('35c08331-4386-11de-8f53-000e0c431b58-B2tR-F8gB-A8at-DCto-C2Xs-JBjz', 'copy1-35c08331-4386-11de-8f53-000e0c431b58', 'd17cb785-d20b-11e4-9be0-005056be1f7c', '100', 'мл'),
('35c08331-4386-11de-8f53-000e0c431b58-B9EY-FMuV-AIVh-DD7m-CjSc-JTBk', 'copy1-35c08331-4386-11de-8f53-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('35c08331-4386-11de-8f53-000e0c431b58-BoDK-FLHH-AyqZ-DQAb-C1Qm-JTnu', 'copy1-35c08331-4386-11de-8f53-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'колер', ''),
('35c08331-4386-11de-8f53-000e0c431b58-BPLc-FXHh-AFgF-DxtA-C5sE-JS6z', 'copy1-35c08331-4386-11de-8f53-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('35c08331-4386-11de-8f53-000e0c431b58-BV1u-FtH7-AJ3H-D7Es-CYis-JN5G', 'copy1-35c08331-4386-11de-8f53-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'розовый', ''),
('35c08333-4386-11de-8f53-000e0c431b58-Bdnv-FtDl-A6Z9-Dqg2-CdSN-JuWv', 'copy1-35c08333-4386-11de-8f53-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'колер', ''),
('35c08333-4386-11de-8f53-000e0c431b58-Bhjv-FeCp-AdeR-DLtw-C47H-JZyk', 'copy1-35c08333-4386-11de-8f53-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'золото-желтый', ''),
('35c08333-4386-11de-8f53-000e0c431b58-BHsT-FNYm-Ab4P-DazL-CVXu-JH3x', 'copy1-35c08333-4386-11de-8f53-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('35c08333-4386-11de-8f53-000e0c431b58-BuNN-FrLE-AcuC-D7lO-CyF2-Jkz6', 'copy1-35c08333-4386-11de-8f53-000e0c431b58', 'd17cb785-d20b-11e4-9be0-005056be1f7c', '100', 'мл'),
('35c08333-4386-11de-8f53-000e0c431b58-BwWR-FEhA-A1b7-D92v-Ci9d-J2L3', 'copy1-35c08333-4386-11de-8f53-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('35c08335-4386-11de-8f53-000e0c431b58-Bbr3-FSwv-AxiU-D2cT-CjNV-JuOL', 'copy1-35c08335-4386-11de-8f53-000e0c431b58', 'd17cb785-d20b-11e4-9be0-005056be1f7c', '100', 'мл'),
('35c08335-4386-11de-8f53-000e0c431b58-BJXg-Fioh-AAfx-Dmyb-CXpK-Jonq', 'copy1-35c08335-4386-11de-8f53-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'сиреневый', ''),
('35c08335-4386-11de-8f53-000e0c431b58-BpkH-FZm2-AEdP-Dwfy-CmoM-JJN2', 'copy1-35c08335-4386-11de-8f53-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('35c08335-4386-11de-8f53-000e0c431b58-BqNW-Fe1L-A6O2-DF4e-CwjE-J49r', 'copy1-35c08335-4386-11de-8f53-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('35c08335-4386-11de-8f53-000e0c431b58-BvCL-FAzq-AzcV-DClj-C4Rw-JQwn', 'copy1-35c08335-4386-11de-8f53-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'колер', ''),
('35c08337-4386-11de-8f53-000e0c431b58-B1C2-FOew-Aa33-DYlJ-CxLb-JG50', 'copy1-35c08337-4386-11de-8f53-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'колер', ''),
('35c08337-4386-11de-8f53-000e0c431b58-BEJi-FaIW-A3Dc-D5n5-Cbe7-JTsb', 'copy1-35c08337-4386-11de-8f53-000e0c431b58', 'd17cb785-d20b-11e4-9be0-005056be1f7c', '100', 'мл'),
('35c08337-4386-11de-8f53-000e0c431b58-BjST-Fth8-APjW-D0xc-C5GB-Jjch', 'copy1-35c08337-4386-11de-8f53-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('35c08337-4386-11de-8f53-000e0c431b58-BLvU-FKb1-AB5J-DPog-CBYt-JOG6', 'copy1-35c08337-4386-11de-8f53-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'бежевый', ''),
('35c08337-4386-11de-8f53-000e0c431b58-BSip-FVfR-AkUX-Dc5M-CYG8-JsQY', 'copy1-35c08337-4386-11de-8f53-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('35c08339-4386-11de-8f53-000e0c431b58-Bc1X-F5uA-AzMe-DwfN-COkW-Jii5', 'copy1-35c08339-4386-11de-8f53-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('35c08339-4386-11de-8f53-000e0c431b58-BeaT-FtQL-A7af-D99v-Cwhz-Jvlq', 'copy1-35c08339-4386-11de-8f53-000e0c431b58', 'd17cb785-d20b-11e4-9be0-005056be1f7c', '100', 'мл'),
('35c08339-4386-11de-8f53-000e0c431b58-BFJU-F8h7-AHVH-DicB-ChgL-JG8U', 'copy1-35c08339-4386-11de-8f53-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'кофейный', ''),
('35c08339-4386-11de-8f53-000e0c431b58-BfpP-FmOs-AovP-Dz3M-CKUC-JiPx', 'copy1-35c08339-4386-11de-8f53-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('35c08339-4386-11de-8f53-000e0c431b58-BiE0-FD1e-AQFF-Dmnn-CgJT-Jwvh', 'copy1-35c08339-4386-11de-8f53-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'колер', ''),
('35c0833b-4386-11de-8f53-000e0c431b58-BQ2v-FVeZ-A0Bi-DSxU-CzSu-JICB', 'copy1-35c0833b-4386-11de-8f53-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'коралл', ''),
('35c0833b-4386-11de-8f53-000e0c431b58-BSF7-F1Yu-ALOC-D6XF-C8rD-JYhA', 'copy1-35c0833b-4386-11de-8f53-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('35c0833b-4386-11de-8f53-000e0c431b58-BU9b-Fz8a-Akt8-Daei-CHva-J3G6', 'copy1-35c0833b-4386-11de-8f53-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('35c0833b-4386-11de-8f53-000e0c431b58-BX3y-FZyL-Aev3-DiJZ-Ci9h-JSuG', 'copy1-35c0833b-4386-11de-8f53-000e0c431b58', 'd17cb785-d20b-11e4-9be0-005056be1f7c', '100', 'мл'),
('35c0833b-4386-11de-8f53-000e0c431b58-ByIt-FwiO-AUp0-DviF-Cq1L-Jmrj', 'copy1-35c0833b-4386-11de-8f53-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'колер', ''),
('35c0833d-4386-11de-8f53-000e0c431b58-BeCB-F7Q1-AVEB-DMMb-CEzf-Jg7t', 'copy1-35c0833d-4386-11de-8f53-000e0c431b58', 'd17cb785-d20b-11e4-9be0-005056be1f7c', '100', 'мл'),
('35c0833d-4386-11de-8f53-000e0c431b58-BgFw-Ff2U-AlhL-DwK3-CWhv-JK8j', 'copy1-35c0833d-4386-11de-8f53-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'апельсиновый', ''),
('35c0833d-4386-11de-8f53-000e0c431b58-BnDb-FGOS-AVgq-Dpkk-C20E-JkjW', 'copy1-35c0833d-4386-11de-8f53-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'колер', ''),
('35c0833d-4386-11de-8f53-000e0c431b58-BVcU-FOAe-Anjd-DL2O-CRXU-JE4L', 'copy1-35c0833d-4386-11de-8f53-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('35c0833d-4386-11de-8f53-000e0c431b58-BYet-FkR4-Acob-DNzZ-CxL2-JIZ3', 'copy1-35c0833d-4386-11de-8f53-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('35c0833f-4386-11de-8f53-000e0c431b58-BbTn-FmUY-AoEj-D4oM-ChNr-Jool', 'copy1-35c0833f-4386-11de-8f53-000e0c431b58', 'd17cb785-d20b-11e4-9be0-005056be1f7c', '100', 'мл'),
('35c0833f-4386-11de-8f53-000e0c431b58-BjfH-Fa5I-ANC9-DRaU-CTqx-JKwb', 'copy1-35c0833f-4386-11de-8f53-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'колер', ''),
('35c0833f-4386-11de-8f53-000e0c431b58-BPc1-FGoQ-AhML-DAvC-CuKO-Jjmn', 'copy1-35c0833f-4386-11de-8f53-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('35c0833f-4386-11de-8f53-000e0c431b58-BZMy-FbZA-A4e1-DYAw-CI1E-JYWB', 'copy1-35c0833f-4386-11de-8f53-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('35c0833f-4386-11de-8f53-000e0c431b58-BzRQ-Fg82-AGy1-DLZa-Ch5d-Jj1u', 'copy1-35c0833f-4386-11de-8f53-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'красный', ''),
('35c08341-4386-11de-8f53-000e0c431b58-BLGQ-F7A4-AeV8-DWUo-Chr0-JypO', 'copy1-35c08341-4386-11de-8f53-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('35c08341-4386-11de-8f53-000e0c431b58-BQ4I-FOPc-A3xK-D3mz-CHVo-JHOT', 'copy1-35c08341-4386-11de-8f53-000e0c431b58', 'd17cb785-d20b-11e4-9be0-005056be1f7c', '100', 'мл'),
('35c08341-4386-11de-8f53-000e0c431b58-BtyA-F3pc-ApIq-DTQq-CHbw-JXYw', 'copy1-35c08341-4386-11de-8f53-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'колер', ''),
('35c08341-4386-11de-8f53-000e0c431b58-Bx2o-FvJE-AGcv-D4nh-CVE2-J9qL', 'copy1-35c08341-4386-11de-8f53-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'красно-коричневый', ''),
('35c08341-4386-11de-8f53-000e0c431b58-BXVQ-F8P5-AJwI-D2bx-CdOo-JH0x', 'copy1-35c08341-4386-11de-8f53-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('35c08343-4386-11de-8f53-000e0c431b58-B3bT-FXNh-AGSV-Dt1Z-CjHa-JujL', 'copy1-35c08343-4386-11de-8f53-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'колер', ''),
('35c08343-4386-11de-8f53-000e0c431b58-BHGg-FR9I-AHFe-DvNs-CFxm-JiE1', 'copy1-35c08343-4386-11de-8f53-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('35c08343-4386-11de-8f53-000e0c431b58-Bk4c-FQNs-A7VK-Dtsj-Cg0d-JoOs', 'copy1-35c08343-4386-11de-8f53-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'светло-коричневый', ''),
('35c08343-4386-11de-8f53-000e0c431b58-Bpld-FjFZ-ArTc-D6Dw-CJ6O-JcTb', 'copy1-35c08343-4386-11de-8f53-000e0c431b58', 'd17cb785-d20b-11e4-9be0-005056be1f7c', '100', 'мл'),
('35c08343-4386-11de-8f53-000e0c431b58-BRBL-Fbu5-ABR5-De6I-CNDO-JtUN', 'copy1-35c08343-4386-11de-8f53-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('56a6f723-ea03-11de-860d-000e0c431b58-B28w-FJCX-AKF5-DRZ0-Crow-JXv1', 'copy1-56a6f723-ea03-11de-860d-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('56a6f723-ea03-11de-860d-000e0c431b58-B7FQ-FhS5-AsQ3-DQhT-CNCU-JQ4D', 'copy1-56a6f723-ea03-11de-860d-000e0c431b58', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('56a6f723-ea03-11de-860d-000e0c431b58-BCwD-FGTV-AtV5-DA3T-CBii-J19L', 'copy1-56a6f723-ea03-11de-860d-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('56a6f723-ea03-11de-860d-000e0c431b58-BkMG-F19o-AAxx-DxYB-CyQ9-JlZA', 'copy1-56a6f723-ea03-11de-860d-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('56a6f723-ea03-11de-860d-000e0c431b58-BOxp-FHDN-AbQP-DvhJ-CyJx-JlNB', 'copy1-56a6f723-ea03-11de-860d-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('56a6f723-ea03-11de-860d-000e0c431b58-BQof-F1tI-Azyu-DZ0Q-C1rp-J3iu', 'copy1-56a6f723-ea03-11de-860d-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '9', 'л'),
('56a6f723-ea03-11de-860d-000e0c431b58-BQY5-FEMT-AFBj-DEn0-CFmj-JLgb', 'copy1-56a6f723-ea03-11de-860d-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('56a6f723-ea03-11de-860d-000e0c431b58-BrZB-F2E8-Axkf-D6N4-CCeS-J8je', 'copy1-56a6f723-ea03-11de-860d-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('56a6f723-ea03-11de-860d-000e0c431b58-BzVV-FVRj-AOUD-DhSm-CBiR-JhZA', 'copy1-56a6f723-ea03-11de-860d-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для обоев', ''),
('56f519d0-4f2c-11de-8f53-000e0c431b58-B0Jw-FWz2-AMPU-DJGt-ChaN-JVyB', 'copy1-56f519d0-4f2c-11de-8f53-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('56f519d0-4f2c-11de-8f53-000e0c431b58-BAoc-FpV5-APME-DRgA-C130-Jw3V', 'copy1-56f519d0-4f2c-11de-8f53-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('56f519d0-4f2c-11de-8f53-000e0c431b58-BDR0-FGZi-ArYp-Drbj-C2KC-JT6i', 'copy1-56f519d0-4f2c-11de-8f53-000e0c431b58', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('56f519d0-4f2c-11de-8f53-000e0c431b58-BEf6-F8gC-Aact-DqgF-CDOF-JWdu', 'copy1-56f519d0-4f2c-11de-8f53-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('56f519d0-4f2c-11de-8f53-000e0c431b58-BgFG-FfO0-Aab4-DAHc-C7rQ-JEVW', 'copy1-56f519d0-4f2c-11de-8f53-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'особопрочная', ''),
('56f519d0-4f2c-11de-8f53-000e0c431b58-BsAT-FOpB-Anph-DTCJ-C9jP-JFEd', 'copy1-56f519d0-4f2c-11de-8f53-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('56f519d0-4f2c-11de-8f53-000e0c431b58-Bv9l-FeoH-AjsW-DpEz-Cad8-J1YY', 'copy1-56f519d0-4f2c-11de-8f53-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для фасада', ''),
('56f519d0-4f2c-11de-8f53-000e0c431b58-BW07-FAVA-AZBS-DrwX-Cczp-Jb7E', 'copy1-56f519d0-4f2c-11de-8f53-000e0c431b58', 'e765ba72-107d-11e3-8a5d-0050569a1080', 'база А', ''),
('56f519d0-4f2c-11de-8f53-000e0c431b58-BxRW-FG9J-Adb0-DI46-CN4j-Jpj6', 'copy1-56f519d0-4f2c-11de-8f53-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('56f519d0-4f2c-11de-8f53-000e0c431b58-BYHa-F6bd-AFaC-DUfH-Cxkm-JsiJ', 'copy1-56f519d0-4f2c-11de-8f53-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '9', 'л'),
('7a3c5db1-777c-11de-9531-000e0c431b58-B0EY-FFiJ-AjAN-Drx3-CzGu-JUHS', 'copy1-7a3c5db1-777c-11de-9531-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('7a3c5db1-777c-11de-9531-000e0c431b58-B1Uf-F6vR-AkAl-DkPe-Cy7N-JIX8', 'copy1-7a3c5db1-777c-11de-9531-000e0c431b58', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('7a3c5db1-777c-11de-9531-000e0c431b58-BAcn-FecI-Aq5b-DKzu-CpC8-J9nz', 'copy1-7a3c5db1-777c-11de-9531-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для потолков', ''),
('7a3c5db1-777c-11de-9531-000e0c431b58-Bcum-FxSj-AxPs-D7YG-CtYj-JX3B', 'copy1-7a3c5db1-777c-11de-9531-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для стен', ''),
('7a3c5db1-777c-11de-9531-000e0c431b58-Bfj6-F8uv-ArZy-DpYc-Ce1M-JHnf', 'copy1-7a3c5db1-777c-11de-9531-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('7a3c5db1-777c-11de-9531-000e0c431b58-BLO6-FwyK-ARmG-Deve-CbDI-JxoH', 'copy1-7a3c5db1-777c-11de-9531-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('7a3c5db1-777c-11de-9531-000e0c431b58-BMKM-FOm1-AE2d-D0fM-CcSe-J6Te', 'copy1-7a3c5db1-777c-11de-9531-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('7a3c5db1-777c-11de-9531-000e0c431b58-BNNT-Fk2d-AGxV-Di70-C7JJ-JJYw', 'copy1-7a3c5db1-777c-11de-9531-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '9', 'л'),
('7a3c5db1-777c-11de-9531-000e0c431b58-BS2f-FBhW-Az6F-D9ys-C4A8-Jyxv', 'copy1-7a3c5db1-777c-11de-9531-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('7a3c5db1-777c-11de-9531-000e0c431b58-BSoV-Fk0f-AMXs-Dq2y-CXsJ-J4n5', 'copy1-7a3c5db1-777c-11de-9531-000e0c431b58', 'e765ba72-107d-11e3-8a5d-0050569a1080', 'база С', ''),
('7a3c5db1-777c-11de-9531-000e0c431b58-BxRd-FB0R-A4zX-DnKf-C72c-JJoX', 'copy1-7a3c5db1-777c-11de-9531-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('7a3c5db3-777c-11de-9531-000e0c431b58-B161-Fuah-ANd5-DsMV-CBfy-JShP', 'copy1-7a3c5db3-777c-11de-9531-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('7a3c5db3-777c-11de-9531-000e0c431b58-BE2E-F3NX-AOyE-Dbvp-COTA-JO3N', 'copy1-7a3c5db3-777c-11de-9531-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для стен', ''),
('7a3c5db3-777c-11de-9531-000e0c431b58-BhUA-FjNc-AzGu-DB1y-CoHE-JuTD', 'copy1-7a3c5db3-777c-11de-9531-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для потолков', ''),
('7a3c5db3-777c-11de-9531-000e0c431b58-BmKb-F4cE-A8rl-DkB3-C8Rz-J2ih', 'copy1-7a3c5db3-777c-11de-9531-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('7a3c5db3-777c-11de-9531-000e0c431b58-BMRl-Fx3m-Aqz4-Dfrc-CCXe-JsaT', 'copy1-7a3c5db3-777c-11de-9531-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('7a3c5db3-777c-11de-9531-000e0c431b58-BpCq-FDyj-AB7u-D9yQ-Cqaa-JHU4', 'copy1-7a3c5db3-777c-11de-9531-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('7a3c5db3-777c-11de-9531-000e0c431b58-BQ75-FRsy-AdIX-Dw49-CHK7-J2fr', 'copy1-7a3c5db3-777c-11de-9531-000e0c431b58', 'e765ba72-107d-11e3-8a5d-0050569a1080', 'база С', ''),
('7a3c5db3-777c-11de-9531-000e0c431b58-BR9t-FVuu-AotR-DRnE-CPgm-JTRW', 'copy1-7a3c5db3-777c-11de-9531-000e0c431b58', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('7a3c5db3-777c-11de-9531-000e0c431b58-BRQG-FM9T-AhAy-DWTW-ClqM-J8kx', 'copy1-7a3c5db3-777c-11de-9531-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '5', 'л'),
('7a3c5db3-777c-11de-9531-000e0c431b58-BrsU-FbuK-AQYS-DVJl-CYNd-JdFr', 'copy1-7a3c5db3-777c-11de-9531-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('7a3c5db3-777c-11de-9531-000e0c431b58-BX1W-F4kk-AuNB-D3bQ-C4SL-JtDm', 'copy1-7a3c5db3-777c-11de-9531-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('7a3c5db5-777c-11de-9531-000e0c431b58-B1X0-Fe9u-ABaU-DzNX-CdrS-JbdS', 'copy1-7a3c5db5-777c-11de-9531-000e0c431b58', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('7a3c5db5-777c-11de-9531-000e0c431b58-BfvW-F3uD-AfSZ-Da1w-Ccng-JGU6', 'copy1-7a3c5db5-777c-11de-9531-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'особопрочная', ''),
('7a3c5db5-777c-11de-9531-000e0c431b58-BIJf-FijW-AUC0-D1IT-Cv5t-JEK2', 'copy1-7a3c5db5-777c-11de-9531-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('7a3c5db5-777c-11de-9531-000e0c431b58-BMmN-Fhwd-APeP-Dsj5-C7rD-JbPn', 'copy1-7a3c5db5-777c-11de-9531-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '9', 'л'),
('7a3c5db5-777c-11de-9531-000e0c431b58-BpRA-F0HN-AXl5-DpCY-C8ym-Jbqf', 'copy1-7a3c5db5-777c-11de-9531-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('7a3c5db5-777c-11de-9531-000e0c431b58-BuHf-Fb9w-AUsQ-DyoR-CGFi-J2wh', 'copy1-7a3c5db5-777c-11de-9531-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('7a3c5db5-777c-11de-9531-000e0c431b58-BvZS-FQHH-AcVU-DJQs-Csvd-JEoN', 'copy1-7a3c5db5-777c-11de-9531-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('7a3c5db5-777c-11de-9531-000e0c431b58-BwOd-F247-AzKw-DV5N-C5vk-J5Qj', 'copy1-7a3c5db5-777c-11de-9531-000e0c431b58', 'e765ba72-107d-11e3-8a5d-0050569a1080', 'база С', ''),
('7a3c5db5-777c-11de-9531-000e0c431b58-BXfq-FK2l-AXwW-D9rm-CiW5-JiWC', 'copy1-7a3c5db5-777c-11de-9531-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('7a3c5db5-777c-11de-9531-000e0c431b58-Bykp-Fxax-AHMr-D2Q3-Ctde-J7BR', 'copy1-7a3c5db5-777c-11de-9531-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для фасада', ''),
('7a3c5db7-777c-11de-9531-000e0c431b58-B2Z5-FP1E-AbS3-D7YP-C2am-JefZ', 'copy1-7a3c5db7-777c-11de-9531-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('7a3c5db7-777c-11de-9531-000e0c431b58-B3V7-FWMc-AXcq-DkYW-CcjO-JEqG', 'copy1-7a3c5db7-777c-11de-9531-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('7a3c5db7-777c-11de-9531-000e0c431b58-BCWm-FEwM-ArRv-Dcir-CErz-J5LG', 'copy1-7a3c5db7-777c-11de-9531-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('7a3c5db7-777c-11de-9531-000e0c431b58-Be58-Fv0V-AuLF-Dpc8-CR1g-Jtbj', 'copy1-7a3c5db7-777c-11de-9531-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('7a3c5db7-777c-11de-9531-000e0c431b58-BGNp-F0JD-AOBe-D1gA-CQNM-J7q3', 'copy1-7a3c5db7-777c-11de-9531-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'особопрочная', ''),
('7a3c5db7-777c-11de-9531-000e0c431b58-BJH1-FdR7-ANyX-DbJL-Ccye-JFW6', 'copy1-7a3c5db7-777c-11de-9531-000e0c431b58', 'e765ba72-107d-11e3-8a5d-0050569a1080', 'база С', ''),
('7a3c5db7-777c-11de-9531-000e0c431b58-BL2m-FH2Q-AP0w-DvBi-CIHv-JyG6', 'copy1-7a3c5db7-777c-11de-9531-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('7a3c5db7-777c-11de-9531-000e0c431b58-BoSm-Fia8-AArC-DZjm-Cejv-JR6l', 'copy1-7a3c5db7-777c-11de-9531-000e0c431b58', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('7a3c5db7-777c-11de-9531-000e0c431b58-BV6F-FIrG-Ar1N-DcoU-CYgp-JU42', 'copy1-7a3c5db7-777c-11de-9531-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '5', 'л'),
('7a3c5db7-777c-11de-9531-000e0c431b58-BxQT-Fe1s-A2TR-DFY9-CLt5-JR3m', 'copy1-7a3c5db7-777c-11de-9531-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для фасада', ''),
('82ebcce8-bce7-11e4-a1f3-005056be1f7b-B0Kw-FzAh-AAP7-DrRF-CrCB-JYnl', 'copy1-82ebcce8-bce7-11e4-a1f3-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('82ebcce8-bce7-11e4-a1f3-005056be1f7b-B9v5-FyRY-AOe2-DydK-CZAd-JQef', 'copy1-82ebcce8-bce7-11e4-a1f3-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('82ebcce8-bce7-11e4-a1f3-005056be1f7b-Bep3-FlKN-ALYp-Dd2F-CTCn-JF6x', 'copy1-82ebcce8-bce7-11e4-a1f3-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'молотковая эмаль-грунт', ''),
('82ebcce8-bce7-11e4-a1f3-005056be1f7b-BGsO-F8hs-AI7s-DmNM-CHmQ-JUL5', 'copy1-82ebcce8-bce7-11e4-a1f3-005056be1f7b', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '10', 'л'),
('82ebcce8-bce7-11e4-a1f3-005056be1f7b-BgT1-FdBI-AjsL-DkGy-CMW2-Jz0h', 'copy1-82ebcce8-bce7-11e4-a1f3-005056be1f7b', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'по ржавчине', ''),
('82ebcce8-bce7-11e4-a1f3-005056be1f7b-BQCm-FmqJ-AvXz-DgdZ-CMdk-J0Sk', 'copy1-82ebcce8-bce7-11e4-a1f3-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('82ebcce8-bce7-11e4-a1f3-005056be1f7b-Bu6r-Flj2-AYBW-DnhJ-Crqv-JGjp', 'copy1-82ebcce8-bce7-11e4-a1f3-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'серебристый', ''),
('82ebcce8-bce7-11e4-a1f3-005056be1f7b-BYDN-FjoU-AY1r-DPqq-Cxob-Jrdt', 'copy1-82ebcce8-bce7-11e4-a1f3-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('9291c63a-5ab3-11dc-be42-000e0c431b58-B0Om-FyLt-ATTP-DSmM-Cf9d-JcEw', 'copy1-9291c63a-5ab3-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('9291c63a-5ab3-11dc-be42-000e0c431b58-BbTO-F2x6-AYEy-D8He-CHf9-JS7N', 'copy1-9291c63a-5ab3-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый глянцевый', ''),
('9291c63a-5ab3-11dc-be42-000e0c431b58-Bf8X-FQhr-AOu1-D9xq-CiUH-JyKd', 'copy1-9291c63a-5ab3-11dc-be42-000e0c431b58', 'd17cb785-d20b-11e4-9be0-005056be1f7c', '520', 'мл'),
('9291c63a-5ab3-11dc-be42-000e0c431b58-BhbP-FzW9-A89c-DXeY-CUKU-JjSA', 'copy1-9291c63a-5ab3-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('9291c63a-5ab3-11dc-be42-000e0c431b58-BIYM-FBXs-AdMq-DNQg-CvQu-JYF7', 'copy1-9291c63a-5ab3-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсал.', ''),
('9291c63a-5ab3-11dc-be42-000e0c431b58-BIYQ-FXr3-AjM1-DDo6-C1xT-JCzr', 'copy1-9291c63a-5ab3-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('9291c63a-5ab3-11dc-be42-000e0c431b58-BVR7-FGTq-ATZ3-D0gb-Cz8u-JEzi', 'copy1-9291c63a-5ab3-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('9291c63a-5ab3-11dc-be42-000e0c431b58-BvS4-FcgK-A0Sb-Duqg-Cqz6-J8Mm', 'copy1-9291c63a-5ab3-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('9291c63c-5ab3-11dc-be42-000e0c431b58-B6QC-FkzC-AcrG-DS46-CeiO-JZSl', 'copy1-9291c63c-5ab3-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('9291c63c-5ab3-11dc-be42-000e0c431b58-BbTO-FRLw-AVhU-DUAs-Cl69-Jogy', 'copy1-9291c63c-5ab3-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('9291c63c-5ab3-11dc-be42-000e0c431b58-BkPT-F5kT-AmMP-Dk2v-CYhu-J5VC', 'copy1-9291c63c-5ab3-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('9291c63c-5ab3-11dc-be42-000e0c431b58-BoT5-FuXC-ABmz-D2hD-CWi0-JcXQ', 'copy1-9291c63c-5ab3-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'черный глянцевый', ''),
('9291c63c-5ab3-11dc-be42-000e0c431b58-Bq0f-FxRZ-Asw8-D8LQ-Cjnk-Jx5v', 'copy1-9291c63c-5ab3-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсал.', ''),
('9291c63c-5ab3-11dc-be42-000e0c431b58-BTEz-FRCA-Ahlo-DHZj-C30z-JM5a', 'copy1-9291c63c-5ab3-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('9291c63c-5ab3-11dc-be42-000e0c431b58-Bttl-FO8X-Aolo-Dk4r-CooQ-JPbI', 'copy1-9291c63c-5ab3-11dc-be42-000e0c431b58', 'd17cb785-d20b-11e4-9be0-005056be1f7c', '520', 'мл'),
('9291c63c-5ab3-11dc-be42-000e0c431b58-Bvjk-Fx2B-ALLv-DnVx-CHfV-JNUC', 'copy1-9291c63c-5ab3-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('9291c63e-5ab3-11dc-be42-000e0c431b58-BIRs-FZk9-Atrb-DTnQ-CNso-Jvks', 'copy1-9291c63e-5ab3-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('9291c63e-5ab3-11dc-be42-000e0c431b58-BkPl-FXhr-AKBI-DDSK-CVpI-Jn3N', 'copy1-9291c63e-5ab3-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсал.', ''),
('9291c63e-5ab3-11dc-be42-000e0c431b58-BmJp-Fd22-Ac9C-DoiR-Coqi-JWFJ', 'copy1-9291c63e-5ab3-11dc-be42-000e0c431b58', 'd17cb785-d20b-11e4-9be0-005056be1f7c', '520', 'мл'),
('9291c63e-5ab3-11dc-be42-000e0c431b58-BNPz-FWTI-Ahox-DqSp-C50K-JNIY', 'copy1-9291c63e-5ab3-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('9291c63e-5ab3-11dc-be42-000e0c431b58-BqeT-FJNw-AEEC-DkGA-C6qQ-JgEx', 'copy1-9291c63e-5ab3-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('9291c63e-5ab3-11dc-be42-000e0c431b58-BW8R-FNFC-AmFc-Dtd5-C1Qg-JB8U', 'copy1-9291c63e-5ab3-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('9291c63e-5ab3-11dc-be42-000e0c431b58-BWGx-FkYE-A6A1-DHuZ-CAaH-JXbH', 'copy1-9291c63e-5ab3-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'красный', ''),
('9291c63e-5ab3-11dc-be42-000e0c431b58-BxmK-Frxj-ASRx-DRFw-Ceb4-JRBR', 'copy1-9291c63e-5ab3-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('9291c640-5ab3-11dc-be42-000e0c431b58-B3nR-FBWy-Av0l-DCPp-CCIh-JZjf', 'copy1-9291c640-5ab3-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('9291c640-5ab3-11dc-be42-000e0c431b58-B4vS-FVPq-AhFx-DSzc-CpeZ-Jak4', 'copy1-9291c640-5ab3-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('9291c640-5ab3-11dc-be42-000e0c431b58-B7xU-FPo5-AkVb-DeXM-CzHu-JtoX', 'copy1-9291c640-5ab3-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('9291c640-5ab3-11dc-be42-000e0c431b58-BIth-FHX7-AqwY-DYAs-Ci4W-Jz6t', 'copy1-9291c640-5ab3-11dc-be42-000e0c431b58', 'd17cb785-d20b-11e4-9be0-005056be1f7c', '520', 'мл'),
('9291c640-5ab3-11dc-be42-000e0c431b58-BIXA-FQOq-AT2T-D1jV-Crh5-JCuV', 'copy1-9291c640-5ab3-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'вишневый', ''),
('9291c640-5ab3-11dc-be42-000e0c431b58-Bp8u-FGez-A7tC-DL0f-Co6T-J0K8', 'copy1-9291c640-5ab3-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсал.', ''),
('9291c640-5ab3-11dc-be42-000e0c431b58-BPhn-FRsm-AxWi-DGWt-CEPe-JWku', 'copy1-9291c640-5ab3-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('9291c640-5ab3-11dc-be42-000e0c431b58-Bti5-Fgm6-ATXb-DgE1-CPNO-JPdd', 'copy1-9291c640-5ab3-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('963b6b0a-04a8-11e3-94de-005056be3574-Ba6g-FO5K-Ad4j-D4CP-Cvxm-JH3C', 'copy1-963b6b0a-04a8-11e3-94de-005056be3574', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('963b6b0a-04a8-11e3-94de-005056be3574-Bdlv-FDey-ATQm-D6Xe-C9Ga-JcYH', 'copy1-963b6b0a-04a8-11e3-94de-005056be3574', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'декоративная с эффектом "короеда"', ''),
('963b6b0a-04a8-11e3-94de-005056be3574-BfbG-F6RC-Ad0d-Dnc8-CRuv-JMoe', 'copy1-963b6b0a-04a8-11e3-94de-005056be3574', 'e765ba75-107d-11e3-8a5d-0050569a1080', '15', 'кг'),
('963b6b0a-04a8-11e3-94de-005056be3574-BgyC-F21g-A4na-D17i-CraJ-Jdeo', 'copy1-963b6b0a-04a8-11e3-94de-005056be3574', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('963b6b0a-04a8-11e3-94de-005056be3574-BK75-FNQt-AyDD-D16T-CJ2D-JbQb', 'copy1-963b6b0a-04a8-11e3-94de-005056be3574', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'штукатурка роллерная', ''),
('963b6b0a-04a8-11e3-94de-005056be3574-BLnF-Frv7-A2YR-DENg-CKXd-JFlu', 'copy1-963b6b0a-04a8-11e3-94de-005056be3574', '1ea6fcc4-d206-11e4-9be0-005056be1f7c', '0', 'мм'),
('963b6b0a-04a8-11e3-94de-005056be3574-BSx5-F5tS-AYrZ-DyKx-C7qm-J0hc', 'copy1-963b6b0a-04a8-11e3-94de-005056be3574', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('963b6b0a-04a8-11e3-94de-005056be3574-Bt6e-FRrD-AZ6U-DCdB-Cx48-JTI2', 'copy1-963b6b0a-04a8-11e3-94de-005056be3574', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('963b6b0a-04a8-11e3-94de-005056be3574-BuWV-FEZl-ADci-DviH-CORm-Jhru', 'copy1-963b6b0a-04a8-11e3-94de-005056be3574', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('992163db-a731-11de-90d4-000e0c431b58-B84h-FUz0-AdbF-DE7M-CQJk-JblV', 'copy1-992163db-a731-11de-90d4-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('992163db-a731-11de-90d4-000e0c431b58-Bmzc-Fqy0-AqnE-D2pZ-C58h-JkNh', 'copy1-992163db-a731-11de-90d4-000e0c431b58', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('992163db-a731-11de-90d4-000e0c431b58-BNvp-FRrK-A68T-DYpH-CrXn-JnK0', 'copy1-992163db-a731-11de-90d4-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('992163db-a731-11de-90d4-000e0c431b58-Bob4-FAlq-AR9P-DWd4-Cqxt-J6VZ', 'copy1-992163db-a731-11de-90d4-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '9', 'л'),
('992163db-a731-11de-90d4-000e0c431b58-BOMU-F6Rt-ApMW-DKxQ-CWjF-JfnT', 'copy1-992163db-a731-11de-90d4-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('992163db-a731-11de-90d4-000e0c431b58-BPXR-FyII-Akaq-DEZt-C6me-Jk4L', 'copy1-992163db-a731-11de-90d4-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('992163db-a731-11de-90d4-000e0c431b58-Bsf7-FxWl-AMRj-Du2w-CSid-J9C1', 'copy1-992163db-a731-11de-90d4-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('992163db-a731-11de-90d4-000e0c431b58-BsQ5-FT7g-AggW-D6bJ-CmGk-JfGM', 'copy1-992163db-a731-11de-90d4-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для потолков', ''),
('992163db-a731-11de-90d4-000e0c431b58-BU1O-Fhpx-A5fk-DqlM-Ck1Z-J5wq', 'copy1-992163db-a731-11de-90d4-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('992163dd-a731-11de-90d4-000e0c431b58-B2z9-FIM6-AToS-DBK2-C0NJ-JIvf', 'copy1-992163dd-a731-11de-90d4-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '9', 'л'),
('992163dd-a731-11de-90d4-000e0c431b58-Bawc-FlC6-AylX-Dfqf-CQ5q-JxnS', 'copy1-992163dd-a731-11de-90d4-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('992163dd-a731-11de-90d4-000e0c431b58-BDSJ-FhWu-Ajxp-D9NT-CNSL-Jk89', 'copy1-992163dd-a731-11de-90d4-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('992163dd-a731-11de-90d4-000e0c431b58-BE3W-FpwR-A30Q-DW8K-CcXs-Jfi8', 'copy1-992163dd-a731-11de-90d4-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('992163dd-a731-11de-90d4-000e0c431b58-BEQu-F5mc-Ao7v-Drfi-C77U-JZhW', 'copy1-992163dd-a731-11de-90d4-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('992163dd-a731-11de-90d4-000e0c431b58-BkTO-FeL3-A0OK-DQcM-Cibq-JFHv', 'copy1-992163dd-a731-11de-90d4-000e0c431b58', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'латексная', ''),
('992163dd-a731-11de-90d4-000e0c431b58-Bl4w-Fa84-AMA2-DyB0-Cm9Z-JFN2', 'copy1-992163dd-a731-11de-90d4-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('992163dd-a731-11de-90d4-000e0c431b58-BNLg-FslR-Ancz-DVst-CUSD-JiwO', 'copy1-992163dd-a731-11de-90d4-000e0c431b58', 'e765ba72-107d-11e3-8a5d-0050569a1080', 'база А', ''),
('992163dd-a731-11de-90d4-000e0c431b58-BUW9-Fs2p-ANHk-D55N-CM0d-J84G', 'copy1-992163dd-a731-11de-90d4-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('a6f80c96-516a-11dd-a89a-000e0c431b58-B4FJ-Fq7z-AgZI-DeBQ-Cw8h-JfvU', 'copy1-a6f80c96-516a-11dd-a89a-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для обоев', ''),
('a6f80c96-516a-11dd-a89a-000e0c431b58-B6Rs-FxwS-AFN0-DVrw-Cah3-Jjko', 'copy1-a6f80c96-516a-11dd-a89a-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '2,5', 'л'),
('a6f80c96-516a-11dd-a89a-000e0c431b58-BFS1-FNw3-Aej1-DBFl-CW4c-J6qo', 'copy1-a6f80c96-516a-11dd-a89a-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('a6f80c96-516a-11dd-a89a-000e0c431b58-BIgo-FMJY-A9dx-DbSS-CxEp-JfS8', 'copy1-a6f80c96-516a-11dd-a89a-000e0c431b58', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('a6f80c96-516a-11dd-a89a-000e0c431b58-BjM3-FWnL-ApbP-DV7h-CSyF-JmF4', 'copy1-a6f80c96-516a-11dd-a89a-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('a6f80c96-516a-11dd-a89a-000e0c431b58-BlIJ-FzUT-AJa3-DfjR-CbrQ-JexF', 'copy1-a6f80c96-516a-11dd-a89a-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('a6f80c96-516a-11dd-a89a-000e0c431b58-BS5d-FiPZ-AGhO-DMKT-CFiV-JJY6', 'copy1-a6f80c96-516a-11dd-a89a-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('a6f80c96-516a-11dd-a89a-000e0c431b58-BYCE-F1k8-AjH9-DzSM-CO2Y-JHOC', 'copy1-a6f80c96-516a-11dd-a89a-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('a6f80c96-516a-11dd-a89a-000e0c431b58-BzFI-FCwT-Afex-D2qz-CcS9-JlIS', 'copy1-a6f80c96-516a-11dd-a89a-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('a6f80c98-516a-11dd-a89a-000e0c431b58-B7gw-Fwb4-AByE-DLKH-CQmp-JnDI', 'copy1-a6f80c98-516a-11dd-a89a-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('a6f80c98-516a-11dd-a89a-000e0c431b58-BchX-Fadk-AGE0-DD7X-CuSK-JSOy', 'copy1-a6f80c98-516a-11dd-a89a-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('a6f80c98-516a-11dd-a89a-000e0c431b58-BeAD-F2sV-Autc-Dkdp-CgCV-Jzt9', 'copy1-a6f80c98-516a-11dd-a89a-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('a6f80c98-516a-11dd-a89a-000e0c431b58-BLRR-F0te-AX1j-D3GV-CTLo-JKZa', 'copy1-a6f80c98-516a-11dd-a89a-000e0c431b58', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('a6f80c98-516a-11dd-a89a-000e0c431b58-BnJq-FG77-AxhJ-DB4H-CrKH-JLfS', 'copy1-a6f80c98-516a-11dd-a89a-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('a6f80c98-516a-11dd-a89a-000e0c431b58-BQ0d-FUKo-AcbR-DHEV-CQTf-Jdhs', 'copy1-a6f80c98-516a-11dd-a89a-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('a6f80c98-516a-11dd-a89a-000e0c431b58-BTXS-FcZM-AkGX-DrR3-CAG1-JuN7', 'copy1-a6f80c98-516a-11dd-a89a-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для обоев', ''),
('a6f80c98-516a-11dd-a89a-000e0c431b58-BWwh-F6on-AR8z-D6HP-CWKJ-JWDF', 'copy1-a6f80c98-516a-11dd-a89a-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('a6f80c98-516a-11dd-a89a-000e0c431b58-Bz8t-FGFy-AbVI-D7zp-Cpdz-JWjv', 'copy1-a6f80c98-516a-11dd-a89a-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '5', 'л'),
('a6f80c9c-516a-11dd-a89a-000e0c431b58-B4JG-Flb8-AN8c-DyhD-CQJa-JlhF', 'copy1-a6f80c9c-516a-11dd-a89a-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('a6f80c9c-516a-11dd-a89a-000e0c431b58-Bfgh-FuNL-Ain4-DHGr-CB6O-JQnw', 'copy1-a6f80c9c-516a-11dd-a89a-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('a6f80c9c-516a-11dd-a89a-000e0c431b58-BISe-FBal-Ascg-D8tK-CtH1-JELG', 'copy1-a6f80c9c-516a-11dd-a89a-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('a6f80c9c-516a-11dd-a89a-000e0c431b58-Bo9E-FG2A-Au3w-DSDO-Cw2c-JlUG', 'copy1-a6f80c9c-516a-11dd-a89a-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '2,5', 'л'),
('a6f80c9c-516a-11dd-a89a-000e0c431b58-Bppq-FLCC-AQKP-Drox-CZrj-Jdx4', 'copy1-a6f80c9c-516a-11dd-a89a-000e0c431b58', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('a6f80c9c-516a-11dd-a89a-000e0c431b58-BsMA-FOwq-AKgr-DR1m-Cffk-Jklc', 'copy1-a6f80c9c-516a-11dd-a89a-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для потолков', ''),
('a6f80c9c-516a-11dd-a89a-000e0c431b58-BWJl-F3HU-AD1c-D46n-CAvh-JKbe', 'copy1-a6f80c9c-516a-11dd-a89a-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('a6f80c9c-516a-11dd-a89a-000e0c431b58-ByOz-FcnG-A35f-Dkp7-CtBG-JU5O', 'copy1-a6f80c9c-516a-11dd-a89a-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('a6f80c9c-516a-11dd-a89a-000e0c431b58-BYqV-FEQu-AsCz-DCeG-CYAn-J7u2', 'copy1-a6f80c9c-516a-11dd-a89a-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('a6f80c9e-516a-11dd-a89a-000e0c431b58-B4De-FNk9-AsBw-DoVV-CzEt-JeVW', 'copy1-a6f80c9e-516a-11dd-a89a-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('a6f80c9e-516a-11dd-a89a-000e0c431b58-BAKg-FQQj-A2dU-DorT-CPld-JWM5', 'copy1-a6f80c9e-516a-11dd-a89a-000e0c431b58', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('a6f80c9e-516a-11dd-a89a-000e0c431b58-BaOA-Fu3s-ADIT-Dgef-Cbx6-JTiK', 'copy1-a6f80c9e-516a-11dd-a89a-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('a6f80c9e-516a-11dd-a89a-000e0c431b58-BhKM-FP3P-Axm0-D2bM-CIqN-Jaav', 'copy1-a6f80c9e-516a-11dd-a89a-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для потолков', ''),
('a6f80c9e-516a-11dd-a89a-000e0c431b58-BPBS-Ftix-Ajci-DHrc-CAHt-Ja72', 'copy1-a6f80c9e-516a-11dd-a89a-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '5', 'л'),
('a6f80c9e-516a-11dd-a89a-000e0c431b58-BqhE-FdMa-AyBe-Dhfz-C5vh-JP44', 'copy1-a6f80c9e-516a-11dd-a89a-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('a6f80c9e-516a-11dd-a89a-000e0c431b58-BRIp-FQ0G-AcIx-DqjN-CbxN-JqkU', 'copy1-a6f80c9e-516a-11dd-a89a-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('a6f80c9e-516a-11dd-a89a-000e0c431b58-BsXp-FRnv-AW93-DnzP-CKPd-JL0W', 'copy1-a6f80c9e-516a-11dd-a89a-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('a6f80c9e-516a-11dd-a89a-000e0c431b58-BZRZ-FzIH-AOVs-DrDh-CutE-JzMQ', 'copy1-a6f80c9e-516a-11dd-a89a-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('a6f80ca2-516a-11dd-a89a-000e0c431b58-B5D9-FPS7-ACcM-Dinl-CmYo-JdWv', 'copy1-a6f80ca2-516a-11dd-a89a-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('a6f80ca2-516a-11dd-a89a-000e0c431b58-BExc-FjOy-ASt5-DMsz-Cun3-Js4K', 'copy1-a6f80ca2-516a-11dd-a89a-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('a6f80ca2-516a-11dd-a89a-000e0c431b58-BG8w-FjDI-AWjN-DaAl-Cb8f-J9RU', 'copy1-a6f80ca2-516a-11dd-a89a-000e0c431b58', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('a6f80ca2-516a-11dd-a89a-000e0c431b58-BIkF-FVAF-A7cD-DcaU-CwYG-Jic6', 'copy1-a6f80ca2-516a-11dd-a89a-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('a6f80ca2-516a-11dd-a89a-000e0c431b58-BJfw-FEsf-A4cI-DvKB-C718-Jisa', 'copy1-a6f80ca2-516a-11dd-a89a-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для потолков', ''),
('a6f80ca2-516a-11dd-a89a-000e0c431b58-Bmqq-Fvc2-AxYr-Du7Z-CLvm-JsN7', 'copy1-a6f80ca2-516a-11dd-a89a-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('a6f80ca2-516a-11dd-a89a-000e0c431b58-Bp6m-F3dP-AeGo-DIjB-C4oy-JVND', 'copy1-a6f80ca2-516a-11dd-a89a-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '2,5', 'л'),
('a6f80ca2-516a-11dd-a89a-000e0c431b58-BRsB-FJjj-AnvN-DEub-Ck3B-JpOC', 'copy1-a6f80ca2-516a-11dd-a89a-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('a6f80ca2-516a-11dd-a89a-000e0c431b58-BuLe-Fxn6-AIaU-DO9w-CKPf-JLZE', 'copy1-a6f80ca2-516a-11dd-a89a-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('a6f80ca2-516a-11dd-a89a-000e0c431b58-ByMh-FcUH-AdOv-DSj0-CVsf-JHxN', 'copy1-a6f80ca2-516a-11dd-a89a-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для стен', ''),
('a6f80ca4-516a-11dd-a89a-000e0c431b58-BA4u-Fh6a-AwQu-Ddvx-C91A-J5nZ', 'copy1-a6f80ca4-516a-11dd-a89a-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('a6f80ca4-516a-11dd-a89a-000e0c431b58-BCKy-FTlK-AD4o-Ddzl-CsNN-JUqT', 'copy1-a6f80ca4-516a-11dd-a89a-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('a6f80ca4-516a-11dd-a89a-000e0c431b58-BcVv-F7cO-AMwU-DJxL-Cho1-JUNP', 'copy1-a6f80ca4-516a-11dd-a89a-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('a6f80ca4-516a-11dd-a89a-000e0c431b58-BEMz-FixI-ARVR-DrEC-CIhY-J4d2', 'copy1-a6f80ca4-516a-11dd-a89a-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('a6f80ca4-516a-11dd-a89a-000e0c431b58-BFM6-FwZq-Al9d-DkVj-CL4u-JpFY', 'copy1-a6f80ca4-516a-11dd-a89a-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для стен', ''),
('a6f80ca4-516a-11dd-a89a-000e0c431b58-BhKe-FMnU-AxWh-DBqO-CVTr-JfDe', 'copy1-a6f80ca4-516a-11dd-a89a-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для потолков', ''),
('a6f80ca4-516a-11dd-a89a-000e0c431b58-BIpn-Fczb-AoXF-DerT-Ctwg-JjUU', 'copy1-a6f80ca4-516a-11dd-a89a-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('a6f80ca4-516a-11dd-a89a-000e0c431b58-BndK-Ftxj-AJar-DMuz-Cjx0-JXGk', 'copy1-a6f80ca4-516a-11dd-a89a-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '5', 'л'),
('a6f80ca4-516a-11dd-a89a-000e0c431b58-BXll-FdGT-Ax1F-DTZa-CnHC-JTHW', 'copy1-a6f80ca4-516a-11dd-a89a-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('a6f80ca4-516a-11dd-a89a-000e0c431b58-BzrK-FlAu-AlVd-DGcQ-CUF7-JA2Y', 'copy1-a6f80ca4-516a-11dd-a89a-000e0c431b58', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('a6f80ca8-516a-11dd-a89a-000e0c431b58-BBBz-FJ0g-AIxj-DjMZ-Cvu6-JUh1', 'copy1-a6f80ca8-516a-11dd-a89a-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '5', 'л'),
('a6f80ca8-516a-11dd-a89a-000e0c431b58-Bdzp-FxLI-A7J0-DtV6-CMrJ-J4wS', 'copy1-a6f80ca8-516a-11dd-a89a-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('a6f80ca8-516a-11dd-a89a-000e0c431b58-BhZE-FyJp-AhSC-DDkR-C2lT-JruS', 'copy1-a6f80ca8-516a-11dd-a89a-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для фасада', ''),
('a6f80ca8-516a-11dd-a89a-000e0c431b58-Bifi-Fw5N-A2OQ-Dukt-CJWg-JRPx', 'copy1-a6f80ca8-516a-11dd-a89a-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('a6f80ca8-516a-11dd-a89a-000e0c431b58-Btcc-FvgC-ADXo-DWEY-CpRS-JvEv', 'copy1-a6f80ca8-516a-11dd-a89a-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('a6f80ca8-516a-11dd-a89a-000e0c431b58-BVNr-FFI3-Aejs-DX2H-CDqs-J2dT', 'copy1-a6f80ca8-516a-11dd-a89a-000e0c431b58', 'e765ba72-107d-11e3-8a5d-0050569a1080', 'база А', ''),
('a6f80ca8-516a-11dd-a89a-000e0c431b58-BvR3-Fdpt-AksZ-DSk4-CmDt-JR25', 'copy1-a6f80ca8-516a-11dd-a89a-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('a6f80ca8-516a-11dd-a89a-000e0c431b58-BvxI-F3Qu-AwCH-D8q0-CyDb-JY1M', 'copy1-a6f80ca8-516a-11dd-a89a-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('a6f80ca8-516a-11dd-a89a-000e0c431b58-BXcj-FwuK-ApWN-DYoF-CTD3-JWcZ', 'copy1-a6f80ca8-516a-11dd-a89a-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'особопрочная', ''),
('a6f80ca8-516a-11dd-a89a-000e0c431b58-Bzlx-Fxlm-AWVU-DVdI-C92x-JM6c', 'copy1-a6f80ca8-516a-11dd-a89a-000e0c431b58', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('a6f80cac-516a-11dd-a89a-000e0c431b58-B98N-F61t-Aaru-DNhX-Cxkt-JZIl', 'copy1-a6f80cac-516a-11dd-a89a-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '2,5', 'л'),
('a6f80cac-516a-11dd-a89a-000e0c431b58-BDlE-FFEU-AH1T-DRHu-CZLg-JPgG', 'copy1-a6f80cac-516a-11dd-a89a-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('a6f80cac-516a-11dd-a89a-000e0c431b58-BDWm-Fh20-AZMC-DvLD-C58y-JNrz', 'copy1-a6f80cac-516a-11dd-a89a-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('a6f80cac-516a-11dd-a89a-000e0c431b58-BNXd-FQB1-AjSC-DcPC-Cv0J-JRbI', 'copy1-a6f80cac-516a-11dd-a89a-000e0c431b58', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'латексная', ''),
('a6f80cac-516a-11dd-a89a-000e0c431b58-Bpep-F9vw-AtL9-DPbf-CWMn-JJi8', 'copy1-a6f80cac-516a-11dd-a89a-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('a6f80cac-516a-11dd-a89a-000e0c431b58-BvIw-FWTV-AtBG-DeOJ-CQRu-JUWz', 'copy1-a6f80cac-516a-11dd-a89a-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('a6f80cac-516a-11dd-a89a-000e0c431b58-BvvT-FuAu-APX7-D4gf-C1Bx-Jzmj', 'copy1-a6f80cac-516a-11dd-a89a-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('a6f80cac-516a-11dd-a89a-000e0c431b58-BWhe-FT17-A80W-DiVs-CAbe-JJRe', 'copy1-a6f80cac-516a-11dd-a89a-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('a6f80cae-516a-11dd-a89a-000e0c431b58-B0eg-FpEI-ADve-Dau5-C1is-JQ59', 'copy1-a6f80cae-516a-11dd-a89a-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('a6f80cae-516a-11dd-a89a-000e0c431b58-B9Lm-FEmB-ANTy-D3e4-CZm6-J5Gh', 'copy1-a6f80cae-516a-11dd-a89a-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('a6f80cae-516a-11dd-a89a-000e0c431b58-BA8S-Fy1w-ArPZ-DnKf-CL7y-JUCy', 'copy1-a6f80cae-516a-11dd-a89a-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('a6f80cae-516a-11dd-a89a-000e0c431b58-BoZZ-FCsP-AK0F-DPju-CM6G-JYrH', 'copy1-a6f80cae-516a-11dd-a89a-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('a6f80cae-516a-11dd-a89a-000e0c431b58-Bu9S-FDEy-AY9i-Db6C-C0jc-JYlL', 'copy1-a6f80cae-516a-11dd-a89a-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '5', 'л'),
('a6f80cae-516a-11dd-a89a-000e0c431b58-BwTJ-FFA5-AqMf-DwqL-CWpW-J9u9', 'copy1-a6f80cae-516a-11dd-a89a-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('a6f80cae-516a-11dd-a89a-000e0c431b58-BWWL-FvAW-ARLT-DFfV-C5uD-J7ei', 'copy1-a6f80cae-516a-11dd-a89a-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('a6f80cae-516a-11dd-a89a-000e0c431b58-BzfS-FFde-AeCF-DaZI-Crwp-JLFg', 'copy1-a6f80cae-516a-11dd-a89a-000e0c431b58', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'латексная', ''),
('b182dc4f-f994-11e2-98ef-005056be3574-B8h4-Fe8M-AAQg-DpFR-ChyI-JqFk', 'copy1-b182dc4f-f994-11e2-98ef-005056be3574', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'черный', ''),
('b182dc4f-f994-11e2-98ef-005056be3574-B9Wx-FECq-Ag9h-Dgx3-CdzO-JrXQ', 'copy1-b182dc4f-f994-11e2-98ef-005056be3574', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'по ржавчине', ''),
('b182dc4f-f994-11e2-98ef-005056be3574-BANz-FHMF-AUuz-DMNa-CELx-J2Pz', 'copy1-b182dc4f-f994-11e2-98ef-005056be3574', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('b182dc4f-f994-11e2-98ef-005056be3574-BBWN-FiBT-A1jH-D9QM-Ciu2-Jcl2', 'copy1-b182dc4f-f994-11e2-98ef-005056be3574', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('b182dc4f-f994-11e2-98ef-005056be3574-Bep4-F10f-Av6G-Dp3c-C710-JzV8', 'copy1-b182dc4f-f994-11e2-98ef-005056be3574', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('b182dc4f-f994-11e2-98ef-005056be3574-Biwx-FFSk-A8wa-DMdx-CcdA-JSlM', 'copy1-b182dc4f-f994-11e2-98ef-005056be3574', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('b182dc4f-f994-11e2-98ef-005056be3574-BwXs-FNRW-AQXZ-DPbp-CXql-JsR0', 'copy1-b182dc4f-f994-11e2-98ef-005056be3574', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'молотковая эмаль-грунт', ''),
('b182dc4f-f994-11e2-98ef-005056be3574-BY78-FOIL-AoNW-DcFm-CRnY-JEsr', 'copy1-b182dc4f-f994-11e2-98ef-005056be3574', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0,75', 'л'),
('b182dc51-f994-11e2-98ef-005056be3574-BBwM-F8Rb-AuKR-DE5r-C8Xs-JAWz', 'copy1-b182dc51-f994-11e2-98ef-005056be3574', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('b182dc51-f994-11e2-98ef-005056be3574-BcBD-F0HP-AmHu-DwcI-CGIK-JYRu', 'copy1-b182dc51-f994-11e2-98ef-005056be3574', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'зеленый', ''),
('b182dc51-f994-11e2-98ef-005056be3574-BFdR-FDJb-AStU-DhYO-C3D2-JQF6', 'copy1-b182dc51-f994-11e2-98ef-005056be3574', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0,75', 'л'),
('b182dc51-f994-11e2-98ef-005056be3574-BodY-FNxp-AD39-DpKO-Cj4P-Jp5V', 'copy1-b182dc51-f994-11e2-98ef-005056be3574', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('b182dc51-f994-11e2-98ef-005056be3574-BomY-FBDc-AvUw-DfjG-CBNk-JZaY', 'copy1-b182dc51-f994-11e2-98ef-005056be3574', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('b182dc51-f994-11e2-98ef-005056be3574-BQ08-FAwa-AJ3i-DUQ1-CESm-JRQ5', 'copy1-b182dc51-f994-11e2-98ef-005056be3574', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('b182dc51-f994-11e2-98ef-005056be3574-BsAF-FAF0-AsDX-DbDt-CRTt-JOUf', 'copy1-b182dc51-f994-11e2-98ef-005056be3574', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'по ржавчине', ''),
('b182dc51-f994-11e2-98ef-005056be3574-Btu9-Fw7v-AQhn-DNZi-CUsv-JLWh', 'copy1-b182dc51-f994-11e2-98ef-005056be3574', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'молотковая эмаль-грунт', ''),
('b7e28649-21de-11df-860d-000e0c431b58-B0nY-FxOy-AXQX-DO0s-Cedy-JdSK', 'copy1-b7e28649-21de-11df-860d-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('b7e28649-21de-11df-860d-000e0c431b58-B61C-FTEC-ACjf-D1Cy-CBdZ-JTHr', 'copy1-b7e28649-21de-11df-860d-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('b7e28649-21de-11df-860d-000e0c431b58-B6Ws-Fa26-A1px-Dkak-CBj1-JtUP', 'copy1-b7e28649-21de-11df-860d-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('b7e28649-21de-11df-860d-000e0c431b58-BalS-FnRu-AImH-DAq5-Ctpi-JHcw', 'copy1-b7e28649-21de-11df-860d-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'фактурная', ''),
('b7e28649-21de-11df-860d-000e0c431b58-BdF0-FyW8-ATHN-Dpbe-CVX2-JDxt', 'copy1-b7e28649-21de-11df-860d-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('b7e28649-21de-11df-860d-000e0c431b58-BEQT-FLQA-AG0p-DoHH-CbD9-JdXD', 'copy1-b7e28649-21de-11df-860d-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('b7e28649-21de-11df-860d-000e0c431b58-BgZm-FCQp-A1RI-DQlP-C8pf-JQ2v', 'copy1-b7e28649-21de-11df-860d-000e0c431b58', 'e765ba75-107d-11e3-8a5d-0050569a1080', '9', 'кг'),
('b7e28649-21de-11df-860d-000e0c431b58-BuLK-FRbl-AqdU-DCQ9-CC7r-JGjd', 'copy1-b7e28649-21de-11df-860d-000e0c431b58', '1ea6fcc4-d206-11e4-9be0-005056be1f7c', '0', 'мм'),
('b7e2864b-21de-11df-860d-000e0c431b58-BdNP-FLaC-ALJN-DLFR-CZOh-JENP', 'copy1-b7e2864b-21de-11df-860d-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'фактурная', ''),
('b7e2864b-21de-11df-860d-000e0c431b58-Becz-Fro6-A0DJ-DgHX-Cws0-JvUL', 'copy1-b7e2864b-21de-11df-860d-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('b7e2864b-21de-11df-860d-000e0c431b58-BIPp-F0sf-AYsC-DkEK-CyRm-Jmsx', 'copy1-b7e2864b-21de-11df-860d-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('b7e2864b-21de-11df-860d-000e0c431b58-Bkm9-FmMC-AwAU-DZnC-CMGP-JbRq', 'copy1-b7e2864b-21de-11df-860d-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('b7e2864b-21de-11df-860d-000e0c431b58-BNcy-FaK1-Afcs-DMxA-CtLA-J6DN', 'copy1-b7e2864b-21de-11df-860d-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('b7e2864b-21de-11df-860d-000e0c431b58-BpT8-F5rX-AdQm-DIB0-CUmg-JOIe', 'copy1-b7e2864b-21de-11df-860d-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска фактурная', ''),
('b7e2864b-21de-11df-860d-000e0c431b58-BS3j-FASk-AFDe-DfMa-Cx3u-Jvwb', 'copy1-b7e2864b-21de-11df-860d-000e0c431b58', '1ea6fcc4-d206-11e4-9be0-005056be1f7c', '0', 'мм'),
('b7e2864b-21de-11df-860d-000e0c431b58-BY0M-F3NN-AMb1-Dc1Y-CAgL-JVIN', 'copy1-b7e2864b-21de-11df-860d-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('b7e2864b-21de-11df-860d-000e0c431b58-ByGM-FIfz-AKs6-DaKN-CHoq-J7WU', 'copy1-b7e2864b-21de-11df-860d-000e0c431b58', 'e765ba75-107d-11e3-8a5d-0050569a1080', '18', 'кг'),
('c4df9e0d-00c0-11e2-a554-005056be3bd8-BbPL-Fv9G-AJnu-DZi4-CASn-J0Fk', 'copy1-c4df9e0d-00c0-11e2-a554-005056be3bd8', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'коричневый', ''),
('c4df9e0d-00c0-11e2-a554-005056be3bd8-BE5P-FUmV-A824-DzRM-Cqxp-JKDh', 'copy1-c4df9e0d-00c0-11e2-a554-005056be3bd8', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'по ржавчине', ''),
('c4df9e0d-00c0-11e2-a554-005056be3bd8-Bgce-FQ2D-AJ3V-Dx2b-CYlw-Jg0V', 'copy1-c4df9e0d-00c0-11e2-a554-005056be3bd8', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('c4df9e0d-00c0-11e2-a554-005056be3bd8-BOMa-Fj0R-AAY4-Dx54-CJ9x-JZTa', 'copy1-c4df9e0d-00c0-11e2-a554-005056be3bd8', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('c4df9e0d-00c0-11e2-a554-005056be3bd8-BuVI-FXjh-A65Q-DrFm-COh2-JZT1', 'copy1-c4df9e0d-00c0-11e2-a554-005056be3bd8', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('c4df9e0d-00c0-11e2-a554-005056be3bd8-BvQR-FoGi-A2wV-Dg8Z-CELl-Jeul', 'copy1-c4df9e0d-00c0-11e2-a554-005056be3bd8', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('c4df9e0d-00c0-11e2-a554-005056be3bd8-BVxQ-Fzyv-AFaD-DGBA-Crhh-JB8a', 'copy1-c4df9e0d-00c0-11e2-a554-005056be3bd8', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'молотковая эмаль-грунт', ''),
('c4df9e0d-00c0-11e2-a554-005056be3bd8-Bwv0-Fpj5-Ais4-DWIM-Cx4d-JFij', 'copy1-c4df9e0d-00c0-11e2-a554-005056be3bd8', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0,75', 'л'),
('c4df9e0f-00c0-11e2-a554-005056be3bd8-B6cR-Fk2J-AL8j-DFIy-CO1I-J60U', 'copy1-c4df9e0f-00c0-11e2-a554-005056be3bd8', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0,75', 'л'),
('c4df9e0f-00c0-11e2-a554-005056be3bd8-BdjG-Fyo3-AsUR-DBVq-CQqe-JhgS', 'copy1-c4df9e0f-00c0-11e2-a554-005056be3bd8', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'медный', ''),
('c4df9e0f-00c0-11e2-a554-005056be3bd8-BhTF-FzNg-AEib-D3AK-CUUm-JH6F', 'copy1-c4df9e0f-00c0-11e2-a554-005056be3bd8', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'по ржавчине', ''),
('c4df9e0f-00c0-11e2-a554-005056be3bd8-Bn9g-FEwn-Afxq-DZET-CLfH-J5fB', 'copy1-c4df9e0f-00c0-11e2-a554-005056be3bd8', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'молотковая эмаль-грунт', ''),
('c4df9e0f-00c0-11e2-a554-005056be3bd8-BQNy-FFAF-AbFo-DZ3k-CFZ5-JLPI', 'copy1-c4df9e0f-00c0-11e2-a554-005056be3bd8', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('c4df9e0f-00c0-11e2-a554-005056be3bd8-BrTr-FJMr-ATgC-D7o8-CB5L-J1AM', 'copy1-c4df9e0f-00c0-11e2-a554-005056be3bd8', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('c4df9e0f-00c0-11e2-a554-005056be3bd8-BSls-FWsu-AXZR-D5bO-CU5x-Jbtc', 'copy1-c4df9e0f-00c0-11e2-a554-005056be3bd8', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('c4df9e0f-00c0-11e2-a554-005056be3bd8-BTbw-FlcI-AStz-DwQW-CEj8-Jx7p', 'copy1-c4df9e0f-00c0-11e2-a554-005056be3bd8', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('c4df9e11-00c0-11e2-a554-005056be3bd8-B7Ls-FLlq-ACwL-DJOH-CZCL-JWAQ', 'copy1-c4df9e11-00c0-11e2-a554-005056be3bd8', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('c4df9e11-00c0-11e2-a554-005056be3bd8-Bcid-FZK0-AKWG-Dw7B-CZH2-Jc8x', 'copy1-c4df9e11-00c0-11e2-a554-005056be3bd8', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0,75', 'л'),
('c4df9e11-00c0-11e2-a554-005056be3bd8-Bj0m-FyXT-Amk7-Dlgv-CMHm-Jj6m', 'copy1-c4df9e11-00c0-11e2-a554-005056be3bd8', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('c4df9e11-00c0-11e2-a554-005056be3bd8-BJlZ-F454-AkGz-DzvL-CPYr-JBJ0', 'copy1-c4df9e11-00c0-11e2-a554-005056be3bd8', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'молотковая эмаль-грунт', ''),
('c4df9e11-00c0-11e2-a554-005056be3bd8-Bl2W-FxAl-A5ao-DFxo-CWI5-JQgH', 'copy1-c4df9e11-00c0-11e2-a554-005056be3bd8', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'по ржавчине', ''),
('c4df9e11-00c0-11e2-a554-005056be3bd8-BLzD-Fz61-AdR0-DYif-CgHe-JI73', 'copy1-c4df9e11-00c0-11e2-a554-005056be3bd8', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('c4df9e11-00c0-11e2-a554-005056be3bd8-BUQ5-FYNS-AceO-DYry-CNn0-J6yk', 'copy1-c4df9e11-00c0-11e2-a554-005056be3bd8', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('c4df9e11-00c0-11e2-a554-005056be3bd8-BxE8-F9F8-APoD-D8YE-CR76-JMjz', 'copy1-c4df9e11-00c0-11e2-a554-005056be3bd8', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'серебристый', ''),
('c4df9e13-00c0-11e2-a554-005056be3bd8-BDs6-FaYS-ASHb-Df0E-C9F2-J0Ey', 'copy1-c4df9e13-00c0-11e2-a554-005056be3bd8', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'по ржавчине', ''),
('c4df9e13-00c0-11e2-a554-005056be3bd8-BFxA-F08p-AOX8-DaTT-Ca4L-JMJc', 'copy1-c4df9e13-00c0-11e2-a554-005056be3bd8', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('c4df9e13-00c0-11e2-a554-005056be3bd8-Bh16-Fn4t-Al4P-Da92-CKfG-Jc6Q', 'copy1-c4df9e13-00c0-11e2-a554-005056be3bd8', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'молотковая эмаль-грунт', ''),
('c4df9e13-00c0-11e2-a554-005056be3bd8-Bj2w-FPR2-AjcW-DqX3-CsJM-J3md', 'copy1-c4df9e13-00c0-11e2-a554-005056be3bd8', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('c4df9e13-00c0-11e2-a554-005056be3bd8-BoSM-Fmtf-A6JY-DHWh-CkaP-Jf1o', 'copy1-c4df9e13-00c0-11e2-a554-005056be3bd8', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('c4df9e13-00c0-11e2-a554-005056be3bd8-BrzF-FG7c-Ang3-D4Ct-Ch13-JTGh', 'copy1-c4df9e13-00c0-11e2-a554-005056be3bd8', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0,75', 'л'),
('c4df9e13-00c0-11e2-a554-005056be3bd8-BwUJ-FdQN-AKh4-DKoO-CZSM-J7W0', 'copy1-c4df9e13-00c0-11e2-a554-005056be3bd8', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'серый', ''),
('c4df9e13-00c0-11e2-a554-005056be3bd8-ByJv-FPov-ATn1-DLm5-CARN-JM47', 'copy1-c4df9e13-00c0-11e2-a554-005056be3bd8', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('cf6aa526-48b8-11dd-9342-000e0c431b58-B5Wb-FOnG-AqXf-D1i6-CB07-J2ZR', 'copy1-cf6aa526-48b8-11dd-9342-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('cf6aa526-48b8-11dd-9342-000e0c431b58-B8iV-FNbq-Axjx-DDBw-CufM-JrZt', 'copy1-cf6aa526-48b8-11dd-9342-000e0c431b58', 'd17cb785-d20b-11e4-9be0-005056be1f7c', '520', 'мл'),
('cf6aa526-48b8-11dd-9342-000e0c431b58-BbBz-FZVM-AZMo-DWc1-CEgI-JBic', 'copy1-cf6aa526-48b8-11dd-9342-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'бронза', ''),
('cf6aa526-48b8-11dd-9342-000e0c431b58-BDye-FsL8-AiPd-DrRC-CJLZ-JlaC', 'copy1-cf6aa526-48b8-11dd-9342-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('cf6aa526-48b8-11dd-9342-000e0c431b58-BdZ7-F5ga-A9QI-D1qC-Cnmh-JrB1', 'copy1-cf6aa526-48b8-11dd-9342-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('cf6aa526-48b8-11dd-9342-000e0c431b58-BNxo-FM5g-AkSd-DxKH-CMAV-J1TP', 'copy1-cf6aa526-48b8-11dd-9342-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('cf6aa526-48b8-11dd-9342-000e0c431b58-BsHa-FO90-AJA9-DG3Y-CY7N-J3oY', 'copy1-cf6aa526-48b8-11dd-9342-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсал.', ''),
('cf6aa526-48b8-11dd-9342-000e0c431b58-BzNo-FT56-AWEH-Dvqi-CyZp-JOno', 'copy1-cf6aa526-48b8-11dd-9342-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('d5823752-947b-11e3-8d88-005056be1f7b-B2mp-Fa5H-AXDP-DpNk-CPwB-JSQN', 'copy1-d5823752-947b-11e3-8d88-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'штукатурка фактурная', ''),
('d5823752-947b-11e3-8d88-005056be1f7b-Be1M-Flhp-AviP-D9Cg-Cgw8-JJQO', 'copy1-d5823752-947b-11e3-8d88-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('d5823752-947b-11e3-8d88-005056be1f7b-BFXv-F0mP-AxsH-DqcJ-CBkM-JeRh', 'copy1-d5823752-947b-11e3-8d88-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('d5823752-947b-11e3-8d88-005056be1f7b-BMrv-Fcpx-A9Lk-D7V1-CKir-J6Bx', 'copy1-d5823752-947b-11e3-8d88-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('d5823752-947b-11e3-8d88-005056be1f7b-Bn0X-FYzM-ANKg-D3rc-CF5K-J1W1', 'copy1-d5823752-947b-11e3-8d88-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('d5823752-947b-11e3-8d88-005056be1f7b-BN2u-FdFr-A8jv-Dzzy-CUUp-Jh7M', 'copy1-d5823752-947b-11e3-8d88-005056be1f7b', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'декоративная с эффектом "шубы"', ''),
('d5823752-947b-11e3-8d88-005056be1f7b-BoVC-FOSX-AEd7-DvY9-CiB8-J6ax', 'copy1-d5823752-947b-11e3-8d88-005056be1f7b', 'e765ba75-107d-11e3-8a5d-0050569a1080', '15', 'кг'),
('d5823752-947b-11e3-8d88-005056be1f7b-Btbn-FdQD-AlgQ-DO8e-CeD2-JPDe', 'copy1-d5823752-947b-11e3-8d88-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('d5823752-947b-11e3-8d88-005056be1f7b-Btt9-FMJp-AGXe-Dnj0-Cqal-JW2g', 'copy1-d5823752-947b-11e3-8d88-005056be1f7b', '1ea6fcc4-d206-11e4-9be0-005056be1f7c', '0', 'мм'),
('da49edc1-58f9-11e0-894e-000e0c431b58-Babn-FIIf-ARUM-DEti-Ca28-JdDE', 'copy1-da49edc1-58f9-11e0-894e-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль-грунт', ''),
('da49edc1-58f9-11e0-894e-000e0c431b58-BcdG-FZCk-AMpz-D7iZ-CFTm-J0dU', 'copy1-da49edc1-58f9-11e0-894e-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('da49edc1-58f9-11e0-894e-000e0c431b58-BebN-FR3D-AwY7-Djex-CmOt-J3kJ', 'copy1-da49edc1-58f9-11e0-894e-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('da49edc1-58f9-11e0-894e-000e0c431b58-Bjb9-FO94-AlJT-DajA-CICd-JObg', 'copy1-da49edc1-58f9-11e0-894e-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('da49edc1-58f9-11e0-894e-000e0c431b58-Bt7Q-FWa3-AltY-Dfqy-C6Fi-JRsp', 'copy1-da49edc1-58f9-11e0-894e-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('da49edc1-58f9-11e0-894e-000e0c431b58-BvM4-FKsj-A9np-Dg6X-CLZy-JZqr', 'copy1-da49edc1-58f9-11e0-894e-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'по ржавчине', ''),
('da49edc1-58f9-11e0-894e-000e0c431b58-BznL-Fokt-AEpD-Dqpg-CBO9-J0c7', 'copy1-da49edc1-58f9-11e0-894e-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '10', 'л'),
('da49edc1-58f9-11e0-894e-000e0c431b58-BZtW-FmHN-Atiw-Dbzf-Cf4x-JG2C', 'copy1-da49edc1-58f9-11e0-894e-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('da49edc3-58f9-11e0-894e-000e0c431b58-B174-FWtm-AOWq-D2ac-CoUK-JU4k', 'copy1-da49edc3-58f9-11e0-894e-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль-грунт', ''),
('da49edc3-58f9-11e0-894e-000e0c431b58-BDxq-FTSi-AsFZ-DVsM-CjDd-JaQH', 'copy1-da49edc3-58f9-11e0-894e-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('da49edc3-58f9-11e0-894e-000e0c431b58-BpkV-FJaz-AXjX-DZZN-Ctyw-JJmr', 'copy1-da49edc3-58f9-11e0-894e-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('da49edc3-58f9-11e0-894e-000e0c431b58-BRnL-FdHG-A7sx-DVh1-CJNa-JfW2', 'copy1-da49edc3-58f9-11e0-894e-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('da49edc3-58f9-11e0-894e-000e0c431b58-BUua-FsJ1-A64o-DsCR-CZU5-JkxC', 'copy1-da49edc3-58f9-11e0-894e-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '10', 'л'),
('da49edc3-58f9-11e0-894e-000e0c431b58-BVR2-FMnV-ApGj-DdnL-CInT-J7tT', 'copy1-da49edc3-58f9-11e0-894e-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'зеленый', ''),
('da49edc3-58f9-11e0-894e-000e0c431b58-Bw6N-FVZ1-Aghe-D1dO-CJhB-J11U', 'copy1-da49edc3-58f9-11e0-894e-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('da49edc3-58f9-11e0-894e-000e0c431b58-BYia-Fy5I-AAeM-De5c-ClrY-JyDy', 'copy1-da49edc3-58f9-11e0-894e-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'по ржавчине', ''),
('da49edc5-58f9-11e0-894e-000e0c431b58-B6ih-FjxO-AQU3-DyB8-C9na-JmxF', 'copy1-da49edc5-58f9-11e0-894e-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('da49edc5-58f9-11e0-894e-000e0c431b58-B81J-Fam6-AYfh-DLcD-CYvB-JMMk', 'copy1-da49edc5-58f9-11e0-894e-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('da49edc5-58f9-11e0-894e-000e0c431b58-Bldo-FJoH-ANC3-DOPE-CyEL-JHPm', 'copy1-da49edc5-58f9-11e0-894e-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('da49edc5-58f9-11e0-894e-000e0c431b58-BS8y-Fbjm-A5tW-DUdH-Cd27-JvCR', 'copy1-da49edc5-58f9-11e0-894e-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('da49edc5-58f9-11e0-894e-000e0c431b58-BtAH-FlOX-AqCb-D2Kr-CeFP-JBpD', 'copy1-da49edc5-58f9-11e0-894e-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '10', 'л'),
('da49edc5-58f9-11e0-894e-000e0c431b58-BXPb-Favx-ARX3-DIGj-CNN7-JUvL', 'copy1-da49edc5-58f9-11e0-894e-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль-грунт', ''),
('da49edc5-58f9-11e0-894e-000e0c431b58-BXyS-FLVL-Ax2d-Dvw8-C3mx-J8fM', 'copy1-da49edc5-58f9-11e0-894e-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'коричневый', ''),
('da49edc5-58f9-11e0-894e-000e0c431b58-BzGT-FLbx-AT6o-DPqr-Cgnh-JqEJ', 'copy1-da49edc5-58f9-11e0-894e-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'по ржавчине', ''),
('da49edc7-58f9-11e0-894e-000e0c431b58-B1et-FmHO-AY5O-DJ2R-C7Tp-JnZv', 'copy1-da49edc7-58f9-11e0-894e-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('da49edc7-58f9-11e0-894e-000e0c431b58-B3if-FM9c-AwkR-D17r-CCgg-JIUf', 'copy1-da49edc7-58f9-11e0-894e-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('da49edc7-58f9-11e0-894e-000e0c431b58-B74w-F1HN-AOiv-Dmew-Cx0v-J7Cw', 'copy1-da49edc7-58f9-11e0-894e-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'красно-коричневый', ''),
('da49edc7-58f9-11e0-894e-000e0c431b58-BcXq-FGG1-Alps-DccK-C1ZD-JnQL', 'copy1-da49edc7-58f9-11e0-894e-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('da49edc7-58f9-11e0-894e-000e0c431b58-BdAb-FLd5-AWUT-DZ8k-ClyE-JVaL', 'copy1-da49edc7-58f9-11e0-894e-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'по ржавчине', ''),
('da49edc7-58f9-11e0-894e-000e0c431b58-BFaa-FVK9-ABrA-DspM-C3iv-JXut', 'copy1-da49edc7-58f9-11e0-894e-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '10', 'л'),
('da49edc7-58f9-11e0-894e-000e0c431b58-Bjxt-FVJR-AcA5-D0S4-Crj4-JG1m', 'copy1-da49edc7-58f9-11e0-894e-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль-грунт', ''),
('da49edc7-58f9-11e0-894e-000e0c431b58-BkyF-Fy97-AF6Q-Duip-CgBq-J9MK', 'copy1-da49edc7-58f9-11e0-894e-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('da49edc9-58f9-11e0-894e-000e0c431b58-BCYR-Fsgr-AnXw-Dvpr-CWgV-JWcR', 'copy1-da49edc9-58f9-11e0-894e-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'серый', ''),
('da49edc9-58f9-11e0-894e-000e0c431b58-BHGu-Fmjr-ANR1-DFZq-CPcF-JgKm', 'copy1-da49edc9-58f9-11e0-894e-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('da49edc9-58f9-11e0-894e-000e0c431b58-BnCb-FVAa-AdDr-DfoC-CuWR-Jvjg', 'copy1-da49edc9-58f9-11e0-894e-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль-грунт', ''),
('da49edc9-58f9-11e0-894e-000e0c431b58-BNUC-FruK-AWxf-D1z2-C6g6-J8ZE', 'copy1-da49edc9-58f9-11e0-894e-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('da49edc9-58f9-11e0-894e-000e0c431b58-BNy0-FAkp-As8L-DETn-CVat-JFDT', 'copy1-da49edc9-58f9-11e0-894e-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('da49edc9-58f9-11e0-894e-000e0c431b58-BrEB-F3IV-Agdw-DQjz-CkWG-JLAb', 'copy1-da49edc9-58f9-11e0-894e-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('da49edc9-58f9-11e0-894e-000e0c431b58-BS6i-FELH-A4wd-D09e-CbLy-Je3j', 'copy1-da49edc9-58f9-11e0-894e-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '10', 'л'),
('da49edc9-58f9-11e0-894e-000e0c431b58-BxQl-FnVB-AUke-DaHp-CCVe-JCVE', 'copy1-da49edc9-58f9-11e0-894e-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'по ржавчине', ''),
('da49edcb-58f9-11e0-894e-000e0c431b58-B7lv-Fdn6-AOFB-DNtg-CpzP-JdNK', 'copy1-da49edcb-58f9-11e0-894e-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'по ржавчине', ''),
('da49edcb-58f9-11e0-894e-000e0c431b58-B7NL-FZcb-ANWS-DMNe-CJoI-J3Ux', 'copy1-da49edcb-58f9-11e0-894e-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'черный', ''),
('da49edcb-58f9-11e0-894e-000e0c431b58-BeGP-FKHM-AK7p-D6k9-Clgk-JX0N', 'copy1-da49edcb-58f9-11e0-894e-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('da49edcb-58f9-11e0-894e-000e0c431b58-BFsx-FY6B-A3Ep-DB8A-Cycu-JoTp', 'copy1-da49edcb-58f9-11e0-894e-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('da49edcb-58f9-11e0-894e-000e0c431b58-Bfuz-F15R-ARFh-DBJv-CcG0-Jofb', 'copy1-da49edcb-58f9-11e0-894e-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('da49edcb-58f9-11e0-894e-000e0c431b58-BqHf-FgzJ-Am3g-DIMQ-CAYW-Jy0Z', 'copy1-da49edcb-58f9-11e0-894e-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль-грунт', ''),
('da49edcb-58f9-11e0-894e-000e0c431b58-BSOT-FTbD-A1H3-DFkG-CQEM-JfPU', 'copy1-da49edcb-58f9-11e0-894e-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('da49edcb-58f9-11e0-894e-000e0c431b58-BsZR-FXV2-AW8Y-D7UY-CJmn-Jd7F', 'copy1-da49edcb-58f9-11e0-894e-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '10', 'л'),
('df210450-93af-11e3-82a4-005056be1f7b-BcxG-FvML-AwQD-Dp2w-CiMs-Jvwk', 'copy1-df210450-93af-11e3-82a4-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('df210450-93af-11e3-82a4-005056be1f7b-BdA8-F7nR-Am3X-DzVD-CxDa-JVso', 'copy1-df210450-93af-11e3-82a4-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('df210450-93af-11e3-82a4-005056be1f7b-BDcj-FRVM-ARx4-DA0e-CyST-JApw', 'copy1-df210450-93af-11e3-82a4-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль-грунт', ''),
('df210450-93af-11e3-82a4-005056be1f7b-BDtt-F4EH-AOZD-Don4-CBFr-JH15', 'copy1-df210450-93af-11e3-82a4-005056be1f7b', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '75', 'л'),
('df210450-93af-11e3-82a4-005056be1f7b-BgG3-F57O-A8tS-DYFB-CD34-Jlt4', 'copy1-df210450-93af-11e3-82a4-005056be1f7b', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'по ржавчине', ''),
('df210450-93af-11e3-82a4-005056be1f7b-BsXi-FpNb-AI4D-DIMW-CUfs-JuIW', 'copy1-df210450-93af-11e3-82a4-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'желтый', ''),
('df210450-93af-11e3-82a4-005056be1f7b-BV7N-Fk2S-A8Jz-DUYU-CV6a-JOzW', 'copy1-df210450-93af-11e3-82a4-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('df210450-93af-11e3-82a4-005056be1f7b-Bx2h-F1Au-ANUP-D6EX-CRhX-JPeA', 'copy1-df210450-93af-11e3-82a4-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('e242e97f-f29b-11dd-9439-000e0c431b58-B4ZX-FGnQ-A1lp-DA5O-Cjkm-J6pf', 'copy1-e242e97f-f29b-11dd-9439-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'для фасада', ''),
('e242e97f-f29b-11dd-9439-000e0c431b58-B9BO-FVPL-AX9y-D1cz-CqDV-JnM6', 'copy1-e242e97f-f29b-11dd-9439-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('e242e97f-f29b-11dd-9439-000e0c431b58-BfaV-FKZX-AywY-DfXu-CbJd-JWuD', 'copy1-e242e97f-f29b-11dd-9439-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('e242e97f-f29b-11dd-9439-000e0c431b58-Blf8-FIjb-Aiob-DioY-CRaD-Ja0Y', 'copy1-e242e97f-f29b-11dd-9439-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('e242e97f-f29b-11dd-9439-000e0c431b58-Bqbu-FYXI-AeGh-DDdZ-CE00-JA8t', 'copy1-e242e97f-f29b-11dd-9439-000e0c431b58', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'акриловая', ''),
('e242e97f-f29b-11dd-9439-000e0c431b58-BqXV-FE4t-AyU4-DSrn-CWay-Jplu', 'copy1-e242e97f-f29b-11dd-9439-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '9', 'л'),
('e242e97f-f29b-11dd-9439-000e0c431b58-BtKT-FK7N-AymN-DO4t-C8YK-JSjj', 'copy1-e242e97f-f29b-11dd-9439-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('e242e97f-f29b-11dd-9439-000e0c431b58-BvpJ-FjUh-ABzX-DO7B-Ctnc-JdB1', 'copy1-e242e97f-f29b-11dd-9439-000e0c431b58', 'e765ba72-107d-11e3-8a5d-0050569a1080', 'база А', ''),
('e242e97f-f29b-11dd-9439-000e0c431b58-Bwt5-FkjX-AaQb-Dv5o-Cq0Z-JQft', 'copy1-e242e97f-f29b-11dd-9439-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'всесезонная', ''),
('e242e97f-f29b-11dd-9439-000e0c431b58-BYoO-FDoJ-ASOt-D6KZ-Ca14-JRYp', 'copy1-e242e97f-f29b-11dd-9439-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('e4020814-4598-11e1-8212-001cc494be80-BaOc-FafT-AFIQ-DXIV-Cdn0-JvxT', 'copy1-e4020814-4598-11e1-8212-001cc494be80', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('e4020814-4598-11e1-8212-001cc494be80-BBoM-F4cO-A3FN-DRKa-CI3t-JaaR', 'copy1-e4020814-4598-11e1-8212-001cc494be80', 'e765ba72-107d-11e3-8a5d-0050569a1080', 'база С', ''),
('e4020814-4598-11e1-8212-001cc494be80-BfoR-FKUD-A3jp-DeeS-CUNY-Jepq', 'copy1-e4020814-4598-11e1-8212-001cc494be80', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('e4020814-4598-11e1-8212-001cc494be80-BGmW-FHyf-AjLp-Dqwr-CPlm-J5nz', 'copy1-e4020814-4598-11e1-8212-001cc494be80', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('e4020814-4598-11e1-8212-001cc494be80-BqxU-FlB2-AUkN-DsCE-CR2r-JUSg', 'copy1-e4020814-4598-11e1-8212-001cc494be80', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'краска', ''),
('e4020814-4598-11e1-8212-001cc494be80-BrTR-Fhi2-AJTU-DFYU-CVAO-JHbM', 'copy1-e4020814-4598-11e1-8212-001cc494be80', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 'латексная', ''),
('e4020814-4598-11e1-8212-001cc494be80-BSjl-FmpA-A8AB-DLIc-CXJG-JkCj', 'copy1-e4020814-4598-11e1-8212-001cc494be80', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('e4020814-4598-11e1-8212-001cc494be80-Bz6o-FCMz-AcUr-DLvH-CdDr-JFpW', 'copy1-e4020814-4598-11e1-8212-001cc494be80', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('e4020814-4598-11e1-8212-001cc494be80-Bzp4-FeKX-Awel-DL0Q-C2af-JT1B', 'copy1-e4020814-4598-11e1-8212-001cc494be80', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '9', 'л'),
('e8976171-93af-11e3-82a4-005056be1f7b-BFFb-FRSR-Au5Y-DlsM-CWLl-JFBy', 'copy1-e8976171-93af-11e3-82a4-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль-грунт', ''),
('e8976171-93af-11e3-82a4-005056be1f7b-BLK6-Fx8A-A9Lf-DRgb-CRLX-JARZ', 'copy1-e8976171-93af-11e3-82a4-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('e8976171-93af-11e3-82a4-005056be1f7b-Bmc0-FTDg-A2x1-DhgR-C7wa-JQjb', 'copy1-e8976171-93af-11e3-82a4-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('e8976171-93af-11e3-82a4-005056be1f7b-BOUS-FF3z-AWym-DxFL-COeT-JU6A', 'copy1-e8976171-93af-11e3-82a4-005056be1f7b', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'по ржавчине', ''),
('e8976171-93af-11e3-82a4-005056be1f7b-Bp7s-FGCQ-AFva-Dhd4-CCsO-JVxG', 'copy1-e8976171-93af-11e3-82a4-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('e8976171-93af-11e3-82a4-005056be1f7b-BQJT-FwBJ-AioB-DjPj-CBEF-Jyjn', 'copy1-e8976171-93af-11e3-82a4-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'желтый', ''),
('e8976171-93af-11e3-82a4-005056be1f7b-BQXL-Fr5o-Ak8X-DyTK-C6eU-J2RR', 'copy1-e8976171-93af-11e3-82a4-005056be1f7b', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '2', 'л'),
('e8976171-93af-11e3-82a4-005056be1f7b-BZHF-FaqV-AAsa-DFh0-CtJc-Jsdf', 'copy1-e8976171-93af-11e3-82a4-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('f0ad1dd1-1f91-11e4-9591-005056be1f7b-B17S-Fw56-Aiw3-D9yL-Cq3o-JQJ0', 'copy1-f0ad1dd1-1f91-11e4-9591-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'желтый', ''),
('f0ad1dd1-1f91-11e4-9591-005056be1f7b-B4QW-F8dm-APyU-Dmik-CL0K-J5Pu', 'copy1-f0ad1dd1-1f91-11e4-9591-005056be1f7b', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '10', 'л'),
('f0ad1dd1-1f91-11e4-9591-005056be1f7b-Bajt-FPkH-A0Np-DNOQ-C3cE-Jquw', 'copy1-f0ad1dd1-1f91-11e4-9591-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('f0ad1dd1-1f91-11e4-9591-005056be1f7b-Bcbx-FWcw-A1QF-DJRv-C7Ir-JO5l', 'copy1-f0ad1dd1-1f91-11e4-9591-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('f0ad1dd1-1f91-11e4-9591-005056be1f7b-BcDZ-FhNq-ATJz-DBYt-CmiN-JAkp', 'copy1-f0ad1dd1-1f91-11e4-9591-005056be1f7b', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'по ржавчине', ''),
('f0ad1dd1-1f91-11e4-9591-005056be1f7b-BKdX-FCbM-AOIE-D3YO-C32p-JpNI', 'copy1-f0ad1dd1-1f91-11e4-9591-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('f0ad1dd1-1f91-11e4-9591-005056be1f7b-BNyx-FSrM-AgjE-DMPS-CVsW-JuQj', 'copy1-f0ad1dd1-1f91-11e4-9591-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('f0ad1dd1-1f91-11e4-9591-005056be1f7b-Byfw-Fehx-A4Wr-Dkgi-CuTp-JsbY', 'copy1-f0ad1dd1-1f91-11e4-9591-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль-грунт', ''),
('f5f1fcd6-d1c2-11e3-8b7a-005056be1f7b-B3Hl-FtXI-AT5Y-DdHp-CTNd-J9kT', 'copy1-f5f1fcd6-d1c2-11e3-8b7a-005056be1f7b', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'декоративная с эффектом "зернистости"', ''),
('f5f1fcd6-d1c2-11e3-8b7a-005056be1f7b-BBeo-FYk5-AjL4-D3hP-CF5N-JTG3', 'copy1-f5f1fcd6-d1c2-11e3-8b7a-005056be1f7b', '1ea6fcc4-d206-11e4-9be0-005056be1f7c', '1,5', 'мм'),
('f5f1fcd6-d1c2-11e3-8b7a-005056be1f7b-BGyp-FWzk-APlV-DhK8-CGcw-JEW1', 'copy1-f5f1fcd6-d1c2-11e3-8b7a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('f5f1fcd6-d1c2-11e3-8b7a-005056be1f7b-BHn6-FpSd-Ajx5-Dk5E-C9Jh-JRxe', 'copy1-f5f1fcd6-d1c2-11e3-8b7a-005056be1f7b', 'e765ba75-107d-11e3-8a5d-0050569a1080', '15', 'кг'),
('f5f1fcd6-d1c2-11e3-8b7a-005056be1f7b-Bjz5-F6XF-A3dh-Dph5-CfaB-JGJY', 'copy1-f5f1fcd6-d1c2-11e3-8b7a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('f5f1fcd6-d1c2-11e3-8b7a-005056be1f7b-BPdT-Fn7a-ATQo-DxPP-CHzE-JBuc', 'copy1-f5f1fcd6-d1c2-11e3-8b7a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('f5f1fcd6-d1c2-11e3-8b7a-005056be1f7b-Bskp-FAp3-AhzQ-DB63-CvuS-Jjmi', 'copy1-f5f1fcd6-d1c2-11e3-8b7a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('f5f1fcd6-d1c2-11e3-8b7a-005056be1f7b-BSy8-F4Ey-Auu1-DQhj-ChQK-JNQz', 'copy1-f5f1fcd6-d1c2-11e3-8b7a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('f5f1fcd6-d1c2-11e3-8b7a-005056be1f7b-BW9O-FMpS-Awyc-D04S-Cecr-Jx7q', 'copy1-f5f1fcd6-d1c2-11e3-8b7a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'штукатурка структурная', ''),
('fbb89466-93af-11e3-82a4-005056be1f7b-BdnY-FCo9-A4tw-DJZZ-CWiV-JLhc', 'copy1-fbb89466-93af-11e3-82a4-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль-грунт', ''),
('fbb89466-93af-11e3-82a4-005056be1f7b-BDPe-FULD-ASmT-DfDX-CZeg-JsbZ', 'copy1-fbb89466-93af-11e3-82a4-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'красный', ''),
('fbb89466-93af-11e3-82a4-005056be1f7b-BdX3-FuEP-AtIp-D8qa-CXSe-JaMD', 'copy1-fbb89466-93af-11e3-82a4-005056be1f7b', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'по ржавчине', ''),
('fbb89466-93af-11e3-82a4-005056be1f7b-BGVH-FGvI-ActR-DqW9-CEaO-Jiua', 'copy1-fbb89466-93af-11e3-82a4-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fbb89466-93af-11e3-82a4-005056be1f7b-BheD-FHTv-AIhj-Dg3e-CpV3-JhG7', 'copy1-fbb89466-93af-11e3-82a4-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'DALI', ''),
('fbb89466-93af-11e3-82a4-005056be1f7b-BlDC-F5jG-AR0k-DysB-CNyX-JV6J', 'copy1-fbb89466-93af-11e3-82a4-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fbb89466-93af-11e3-82a4-005056be1f7b-BOal-Fy7d-ATlz-DLJ7-CH8w-JLZk', 'copy1-fbb89466-93af-11e3-82a4-005056be1f7b', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', '0,75', 'л'),
('fbb89466-93af-11e3-82a4-005056be1f7b-Bx1E-Fcxu-A3LD-DWmP-CaJu-JdRD', 'copy1-fbb89466-93af-11e3-82a4-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fded4984-d1c2-11e3-8b7a-005056be1f7b-B0t8-F0G9-AjWT-DOP9-CT4l-JLmZ', 'copy1-fded4984-d1c2-11e3-8b7a-005056be1f7b', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'декоративная с эффектом "зернистости"', ''),
('fded4984-d1c2-11e3-8b7a-005056be1f7b-B6pu-FuIl-AUnP-DwGi-C3GS-J1FY', 'copy1-fded4984-d1c2-11e3-8b7a-005056be1f7b', 'e8287600-ad96-11e3-b114-005056be1f7c', 'ЛАКРА', ''),
('fded4984-d1c2-11e3-8b7a-005056be1f7b-BdZ8-FsME-ARFK-Dj6Q-C9u6-Jt3z', 'copy1-fded4984-d1c2-11e3-8b7a-005056be1f7b', 'e765ba75-107d-11e3-8a5d-0050569a1080', '15', 'кг'),
('fded4984-d1c2-11e3-8b7a-005056be1f7b-Bnm2-Ftyu-ACVy-Dd1j-Ceoc-JdTF', 'copy1-fded4984-d1c2-11e3-8b7a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fded4984-d1c2-11e3-8b7a-005056be1f7b-BTEm-FTau-A9wF-DL3T-CgEa-JfuA', 'copy1-fded4984-d1c2-11e3-8b7a-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый', ''),
('fded4984-d1c2-11e3-8b7a-005056be1f7b-Bx30-Fpmf-AZ30-DXBk-CPUo-J3oF', 'copy1-fded4984-d1c2-11e3-8b7a-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fded4984-d1c2-11e3-8b7a-005056be1f7b-BxgK-FBlo-AIg4-DPdx-CF33-JuCU', 'copy1-fded4984-d1c2-11e3-8b7a-005056be1f7b', '1ea6fcc4-d206-11e4-9be0-005056be1f7c', '3', 'мм'),
('fded4984-d1c2-11e3-8b7a-005056be1f7b-BYFp-FKbX-AAIi-DRwd-Cvep-JTXa', 'copy1-fded4984-d1c2-11e3-8b7a-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'штукатурка структурная', ''),
('fded4984-d1c2-11e3-8b7a-005056be1f7b-Bypv-FI4A-AHN5-DsYg-CHUL-J3FU', 'copy1-fded4984-d1c2-11e3-8b7a-005056be1f7b', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fea6c165-5ab6-11dc-be42-000e0c431b58-B2LB-FA9X-AS0r-D8dD-CW3U-JuZz', 'copy1-fea6c165-5ab6-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсал.', ''),
('fea6c165-5ab6-11dc-be42-000e0c431b58-B9Vc-FBv6-A68H-DNEE-Cp48-JXba', 'copy1-fea6c165-5ab6-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'хаки', ''),
('fea6c165-5ab6-11dc-be42-000e0c431b58-Bjqr-FoIK-AaZJ-DxWS-CBUo-JdVZ', 'copy1-fea6c165-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fea6c165-5ab6-11dc-be42-000e0c431b58-BMA0-Fhjg-AUim-DxPW-CZGh-JaHg', 'copy1-fea6c165-5ab6-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('fea6c165-5ab6-11dc-be42-000e0c431b58-BRyl-FDlz-A852-DRtY-C9if-JaRg', 'copy1-fea6c165-5ab6-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('fea6c165-5ab6-11dc-be42-000e0c431b58-BWRR-F0lu-A3wd-DUXD-CJp2-Jvtd', 'copy1-fea6c165-5ab6-11dc-be42-000e0c431b58', 'd17cb785-d20b-11e4-9be0-005056be1f7c', '520', 'мл'),
('fea6c165-5ab6-11dc-be42-000e0c431b58-Byag-FfX0-Aju3-D5eS-CtrS-JsP2', 'copy1-fea6c165-5ab6-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fea6c165-5ab6-11dc-be42-000e0c431b58-BZQX-Fgec-AlJV-Dihw-C0Gd-Jqul', 'copy1-fea6c165-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fea6c167-5ab6-11dc-be42-000e0c431b58-Ba8k-Fy8a-Ag86-DzdR-Ce4h-J8tC', 'copy1-fea6c167-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fea6c167-5ab6-11dc-be42-000e0c431b58-BAUV-FoWZ-AyHV-DMW2-Cv80-JhXh', 'copy1-fea6c167-5ab6-11dc-be42-000e0c431b58', 'd17cb785-d20b-11e4-9be0-005056be1f7c', '520', 'мл'),
('fea6c167-5ab6-11dc-be42-000e0c431b58-BeeL-FdKO-Asts-D54B-CEc1-JL8e', 'copy1-fea6c167-5ab6-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('fea6c167-5ab6-11dc-be42-000e0c431b58-BjzH-Ffol-AwJe-DUHN-CWSh-JGAY', 'copy1-fea6c167-5ab6-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсал.', ''),
('fea6c167-5ab6-11dc-be42-000e0c431b58-BlHw-FaiM-ANfZ-DuF4-CWc3-JZ24', 'copy1-fea6c167-5ab6-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('fea6c167-5ab6-11dc-be42-000e0c431b58-BLUu-Fs1X-Aex0-DqDO-CidM-JJSJ', 'copy1-fea6c167-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fea6c167-5ab6-11dc-be42-000e0c431b58-Bwuo-FREv-AebD-DCiD-CaCi-Jmgt', 'copy1-fea6c167-5ab6-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fea6c167-5ab6-11dc-be42-000e0c431b58-BZQd-FzfN-Akrh-Dgmw-C7mL-JPO3', 'copy1-fea6c167-5ab6-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'светло-зеленый', ''),
('fea6c169-5ab6-11dc-be42-000e0c431b58-B4oa-FVUl-AjZA-DJKd-CiZ2-J9VA', 'copy1-fea6c169-5ab6-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('fea6c169-5ab6-11dc-be42-000e0c431b58-B6DR-FCAP-AgRc-DpLO-CFYj-JvdY', 'copy1-fea6c169-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fea6c169-5ab6-11dc-be42-000e0c431b58-BcpF-FTE2-AdgG-D88e-CQNJ-J5wZ', 'copy1-fea6c169-5ab6-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'темно-зеленый', ''),
('fea6c169-5ab6-11dc-be42-000e0c431b58-BjcJ-FG5j-A9WM-DI7i-CMyr-JgEx', 'copy1-fea6c169-5ab6-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('fea6c169-5ab6-11dc-be42-000e0c431b58-BNRH-Fs4S-AxQY-D65h-CExM-JeIg', 'copy1-fea6c169-5ab6-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fea6c169-5ab6-11dc-be42-000e0c431b58-BNVq-FEyd-A6Cq-DuyA-C9Qp-JEju', 'copy1-fea6c169-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fea6c169-5ab6-11dc-be42-000e0c431b58-BOYa-F6IO-A7Gf-DlKE-CWGH-JoII', 'copy1-fea6c169-5ab6-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсал.', ''),
('fea6c169-5ab6-11dc-be42-000e0c431b58-Bu48-Fv4m-A5aX-Dw4P-Cgdr-Jpjl', 'copy1-fea6c169-5ab6-11dc-be42-000e0c431b58', 'd17cb785-d20b-11e4-9be0-005056be1f7c', '520', 'мл'),
('fea6c16b-5ab6-11dc-be42-000e0c431b58-B2eG-FkLh-AXqs-DDIo-CoMf-JooI', 'copy1-fea6c16b-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fea6c16b-5ab6-11dc-be42-000e0c431b58-BE2A-Fbn4-AqJW-DXz7-C0Ef-J8fM', 'copy1-fea6c16b-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fea6c16b-5ab6-11dc-be42-000e0c431b58-Bekp-FL1C-AMOC-DZc4-CMLS-JG8b', 'copy1-fea6c16b-5ab6-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('fea6c16b-5ab6-11dc-be42-000e0c431b58-BiUS-F6sH-A2sM-DWpr-CjhM-JpHY', 'copy1-fea6c16b-5ab6-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсал.', ''),
('fea6c16b-5ab6-11dc-be42-000e0c431b58-BNeE-F6iM-AjMZ-DF2D-COZY-JgUH', 'copy1-fea6c16b-5ab6-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('fea6c16b-5ab6-11dc-be42-000e0c431b58-BoMz-F1if-AhIC-DuyJ-CIBo-JM7N', 'copy1-fea6c16b-5ab6-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fea6c16b-5ab6-11dc-be42-000e0c431b58-BPi8-Fbr5-A05s-Drax-CeKq-Jb7k', 'copy1-fea6c16b-5ab6-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'фисташковый', ''),
('fea6c16b-5ab6-11dc-be42-000e0c431b58-By4s-FidL-AOQE-Dcdw-CR9W-J7JN', 'copy1-fea6c16b-5ab6-11dc-be42-000e0c431b58', 'd17cb785-d20b-11e4-9be0-005056be1f7c', '520', 'мл'),
('fea6c16d-5ab6-11dc-be42-000e0c431b58-B1nm-FvUk-AZe9-D8l2-C73i-JJZC', 'copy1-fea6c16d-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fea6c16d-5ab6-11dc-be42-000e0c431b58-BcdA-FWKU-AuYa-Derg-CQ4j-JCpJ', 'copy1-fea6c16d-5ab6-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('fea6c16d-5ab6-11dc-be42-000e0c431b58-BhXx-FC3X-AzfP-Ds17-C7qj-Jjc5', 'copy1-fea6c16d-5ab6-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсал.', ''),
('fea6c16d-5ab6-11dc-be42-000e0c431b58-BJ2Y-FHzA-A0v4-Dh6S-Ckcp-JXeh', 'copy1-fea6c16d-5ab6-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('fea6c16d-5ab6-11dc-be42-000e0c431b58-BQEq-FzWg-A7X5-Dq8n-CKYi-JG49', 'copy1-fea6c16d-5ab6-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'бежевый', ''),
('fea6c16d-5ab6-11dc-be42-000e0c431b58-BRqN-FgeY-A9ue-Dfkx-Cn23-JUrO', 'copy1-fea6c16d-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fea6c16d-5ab6-11dc-be42-000e0c431b58-BvUD-FAC4-A80k-DhiC-Cbs5-J1zu', 'copy1-fea6c16d-5ab6-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fea6c16d-5ab6-11dc-be42-000e0c431b58-BYeL-FbOC-AUtv-DCuM-CGMp-JGiz', 'copy1-fea6c16d-5ab6-11dc-be42-000e0c431b58', 'd17cb785-d20b-11e4-9be0-005056be1f7c', '520', 'мл'),
('fea6c16f-5ab6-11dc-be42-000e0c431b58-B6w9-FGXt-Auw7-DfuC-CyTs-JNXW', 'copy1-fea6c16f-5ab6-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('fea6c16f-5ab6-11dc-be42-000e0c431b58-B93j-FGp2-Amyq-D8n5-Cu3R-JYnR', 'copy1-fea6c16f-5ab6-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('fea6c16f-5ab6-11dc-be42-000e0c431b58-BAfo-FfTW-AAYJ-DPi9-Cug2-JUng', 'copy1-fea6c16f-5ab6-11dc-be42-000e0c431b58', 'd17cb785-d20b-11e4-9be0-005056be1f7c', '520', 'мл'),
('fea6c16f-5ab6-11dc-be42-000e0c431b58-BcIj-F2hk-AkFe-D86Z-CqjH-JZz2', 'copy1-fea6c16f-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fea6c16f-5ab6-11dc-be42-000e0c431b58-Bg1q-FZaZ-AI3g-Dn8H-CX45-JV0S', 'copy1-fea6c16f-5ab6-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fea6c16f-5ab6-11dc-be42-000e0c431b58-BjqY-FDnT-AdT4-Dkts-CbGe-JFlu', 'copy1-fea6c16f-5ab6-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсал.', ''),
('fea6c16f-5ab6-11dc-be42-000e0c431b58-Bors-FQu9-A7wG-DdMq-C9UZ-Jgbx', 'copy1-fea6c16f-5ab6-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'голубой', ''),
('fea6c16f-5ab6-11dc-be42-000e0c431b58-BXvn-FeP1-ALOL-Dkun-CYNv-J9FS', 'copy1-fea6c16f-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fea6c171-5ab6-11dc-be42-000e0c431b58-BdwN-F9TY-AHuR-D3Sy-CNgp-JDEQ', 'copy1-fea6c171-5ab6-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('fea6c171-5ab6-11dc-be42-000e0c431b58-BJyk-F1Ah-Amdz-DAo7-Crkl-JTu4', 'copy1-fea6c171-5ab6-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('fea6c171-5ab6-11dc-be42-000e0c431b58-BK6A-Fs6J-A8Cs-D0BA-CqKz-JRBz', 'copy1-fea6c171-5ab6-11dc-be42-000e0c431b58', 'd17cb785-d20b-11e4-9be0-005056be1f7c', '520', 'мл'),
('fea6c171-5ab6-11dc-be42-000e0c431b58-BO2z-FhkS-Ahbd-DqDt-CmbE-JSyL', 'copy1-fea6c171-5ab6-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсал.', ''),
('fea6c171-5ab6-11dc-be42-000e0c431b58-BrIv-FFwv-AEu9-Dwel-C5Tj-JJp4', 'copy1-fea6c171-5ab6-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'синий', ''),
('fea6c171-5ab6-11dc-be42-000e0c431b58-BrlH-Fnkp-AUeT-DtdA-C1KI-JmQ6', 'copy1-fea6c171-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fea6c171-5ab6-11dc-be42-000e0c431b58-BVmr-FyTv-Ai6N-DmOB-Cyrx-JCpH', 'copy1-fea6c171-5ab6-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fea6c171-5ab6-11dc-be42-000e0c431b58-BXUq-FWHL-A8Be-DhKJ-Ca3u-JigV', 'copy1-fea6c171-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fea6c173-5ab6-11dc-be42-000e0c431b58-B06K-Fksw-Ar4o-DzFt-C63V-JorV', 'copy1-fea6c173-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fea6c173-5ab6-11dc-be42-000e0c431b58-Bc3T-FcGx-Ar1S-D3uW-CvbJ-Jjxu', 'copy1-fea6c173-5ab6-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fea6c173-5ab6-11dc-be42-000e0c431b58-BprW-FBAZ-AKD5-DLYl-CdN9-Jy0M', 'copy1-fea6c173-5ab6-11dc-be42-000e0c431b58', 'd17cb785-d20b-11e4-9be0-005056be1f7c', '520', 'мл'),
('fea6c173-5ab6-11dc-be42-000e0c431b58-BQrY-F6XS-Aev0-DOeP-CueK-J5E4', 'copy1-fea6c173-5ab6-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсал.', ''),
('fea6c173-5ab6-11dc-be42-000e0c431b58-Bqwx-FVl3-AEhv-DaMc-CvcJ-JKXh', 'copy1-fea6c173-5ab6-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('fea6c173-5ab6-11dc-be42-000e0c431b58-Bwms-Fz0l-A0Dp-Dq4j-CXrt-JtPf', 'copy1-fea6c173-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fea6c173-5ab6-11dc-be42-000e0c431b58-BxKV-FhvQ-Apok-DxmG-CK2I-JLEG', 'copy1-fea6c173-5ab6-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'коричневый', ''),
('fea6c173-5ab6-11dc-be42-000e0c431b58-BzXU-FwNh-AGkN-DSRV-ClvL-Jui4', 'copy1-fea6c173-5ab6-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('fea6c175-5ab6-11dc-be42-000e0c431b58-B26R-FoSf-AEL7-DsZQ-CknX-JYsj', 'copy1-fea6c175-5ab6-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсал.', ''),
('fea6c175-5ab6-11dc-be42-000e0c431b58-B79Y-F4ry-AJRc-DgqK-CFQd-JMVW', 'copy1-fea6c175-5ab6-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fea6c175-5ab6-11dc-be42-000e0c431b58-B7rI-FuDS-AdnZ-DKlZ-CkYj-JSnP', 'copy1-fea6c175-5ab6-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('fea6c175-5ab6-11dc-be42-000e0c431b58-BjSH-FF3o-Adwj-DuY0-CJQ6-Ja5N', 'copy1-fea6c175-5ab6-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('fea6c175-5ab6-11dc-be42-000e0c431b58-BMPV-F4M0-Ax82-DEVe-CVWA-J02T', 'copy1-fea6c175-5ab6-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'желтый', ''),
('fea6c175-5ab6-11dc-be42-000e0c431b58-BNHy-FFLK-Ajhg-DkhY-C45Q-JlaY', 'copy1-fea6c175-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fea6c175-5ab6-11dc-be42-000e0c431b58-BqDA-FU70-AUL1-DKkH-Ckgz-JsQ4', 'copy1-fea6c175-5ab6-11dc-be42-000e0c431b58', 'd17cb785-d20b-11e4-9be0-005056be1f7c', '520', 'мл'),
('fea6c175-5ab6-11dc-be42-000e0c431b58-BW3s-FgIQ-Af4w-DWNZ-C4ao-JOT2', 'copy1-fea6c175-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fea6c177-5ab6-11dc-be42-000e0c431b58-B8IO-FygM-AaFv-Dl5Q-CjYk-JEdr', 'copy1-fea6c177-5ab6-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('fea6c177-5ab6-11dc-be42-000e0c431b58-BdTe-FEHk-AEcZ-Do2Z-CkYc-JNha', 'copy1-fea6c177-5ab6-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсал.', ''),
('fea6c177-5ab6-11dc-be42-000e0c431b58-BhCn-FI9t-Alx1-DY9m-CiiL-Jzf8', 'copy1-fea6c177-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fea6c177-5ab6-11dc-be42-000e0c431b58-BkjR-F7wn-Ayhl-DxF0-CVzk-JY06', 'copy1-fea6c177-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fea6c177-5ab6-11dc-be42-000e0c431b58-BohK-FELB-Adva-D608-CW7F-Jkum', 'copy1-fea6c177-5ab6-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fea6c177-5ab6-11dc-be42-000e0c431b58-Brp9-FrEZ-ALKf-DLbp-CYsS-JWa2', 'copy1-fea6c177-5ab6-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('fea6c177-5ab6-11dc-be42-000e0c431b58-BTFx-FNzT-A2Nm-DqSd-CT0J-JRrN', 'copy1-fea6c177-5ab6-11dc-be42-000e0c431b58', 'd17cb785-d20b-11e4-9be0-005056be1f7c', '520', 'мл'),
('fea6c177-5ab6-11dc-be42-000e0c431b58-BulD-FJVI-ADrl-D6Gc-CzHx-JKvJ', 'copy1-fea6c177-5ab6-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'светло-серый', ''),
('fea6c179-5ab6-11dc-be42-000e0c431b58-B1Se-FYcT-AXfb-DbUx-CVdA-JcP5', 'copy1-fea6c179-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fea6c179-5ab6-11dc-be42-000e0c431b58-B2dH-FP2m-AVdz-DTdP-CVTh-J1sA', 'copy1-fea6c179-5ab6-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсал.', ''),
('fea6c179-5ab6-11dc-be42-000e0c431b58-BExY-F4G3-AJcM-DqS5-CrcA-JMDi', 'copy1-fea6c179-5ab6-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fea6c179-5ab6-11dc-be42-000e0c431b58-BFrF-FCss-AboY-Do09-C8Mr-JtnH', 'copy1-fea6c179-5ab6-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('fea6c179-5ab6-11dc-be42-000e0c431b58-BJFf-Flh1-AY3U-DZUj-CTMD-Jbb6', 'copy1-fea6c179-5ab6-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('fea6c179-5ab6-11dc-be42-000e0c431b58-BJNH-Fv4Z-AONY-DXfF-ClM8-JAZC', 'copy1-fea6c179-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fea6c179-5ab6-11dc-be42-000e0c431b58-Br3Y-FNEz-A3ci-DKy9-CCID-JzV4', 'copy1-fea6c179-5ab6-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'серый', ''),
('fea6c179-5ab6-11dc-be42-000e0c431b58-By9O-FVTi-A7N6-D0iq-C4nY-J0qH', 'copy1-fea6c179-5ab6-11dc-be42-000e0c431b58', 'd17cb785-d20b-11e4-9be0-005056be1f7c', '520', 'мл'),
('fea6c17b-5ab6-11dc-be42-000e0c431b58-B3IW-FBP0-AH73-DlVA-CFgB-JbG7', 'copy1-fea6c17b-5ab6-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('fea6c17b-5ab6-11dc-be42-000e0c431b58-B89C-FxWy-AXEz-D3Bc-Cy4k-JL61', 'copy1-fea6c17b-5ab6-11dc-be42-000e0c431b58', 'd17cb785-d20b-11e4-9be0-005056be1f7c', '520', 'мл'),
('fea6c17b-5ab6-11dc-be42-000e0c431b58-BCdw-FwAj-ArNu-D2aB-C7aS-J6be', 'copy1-fea6c17b-5ab6-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'оранжевый', ''),
('fea6c17b-5ab6-11dc-be42-000e0c431b58-BgXa-FRP2-ASMS-DlHt-CGvV-Jufc', 'copy1-fea6c17b-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fea6c17b-5ab6-11dc-be42-000e0c431b58-BiuN-Fr7E-AaH8-DnFn-C2mB-JR4R', 'copy1-fea6c17b-5ab6-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсал.', ''),
('fea6c17b-5ab6-11dc-be42-000e0c431b58-BJMd-Fbyk-AK5W-Dgp3-C9Om-JM7j', 'copy1-fea6c17b-5ab6-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('fea6c17b-5ab6-11dc-be42-000e0c431b58-Bomo-FtGx-APvI-DL1t-CK4N-J8pN', 'copy1-fea6c17b-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fea6c17b-5ab6-11dc-be42-000e0c431b58-BQXr-FOAw-A33Y-D5KS-CLTf-JouU', 'copy1-fea6c17b-5ab6-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fea6c17d-5ab6-11dc-be42-000e0c431b58-B4GD-FSzY-A71n-DyZW-CbK7-Jswm', 'copy1-fea6c17d-5ab6-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fea6c17d-5ab6-11dc-be42-000e0c431b58-B4Oh-FfuM-Azn2-DHeS-CrbW-Jqrr', 'copy1-fea6c17d-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fea6c17d-5ab6-11dc-be42-000e0c431b58-B7D0-FPUb-AGKC-D1Ll-CDU8-JnQT', 'copy1-fea6c17d-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fea6c17d-5ab6-11dc-be42-000e0c431b58-BDS7-FCU4-Ax0U-DQob-CtZK-JLZK', 'copy1-fea6c17d-5ab6-11dc-be42-000e0c431b58', 'd17cb785-d20b-11e4-9be0-005056be1f7c', '520', 'мл'),
('fea6c17d-5ab6-11dc-be42-000e0c431b58-BHx2-FKnD-AvrY-DsVo-CBO3-Jitn', 'copy1-fea6c17d-5ab6-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсал.', ''),
('fea6c17d-5ab6-11dc-be42-000e0c431b58-BIWj-F6VQ-A9Ol-DgoU-C4pS-J1bj', 'copy1-fea6c17d-5ab6-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'бирюзовый', ''),
('fea6c17d-5ab6-11dc-be42-000e0c431b58-BujQ-Fmqv-A6XM-DRE4-C9Lr-J1VV', 'copy1-fea6c17d-5ab6-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('fea6c17d-5ab6-11dc-be42-000e0c431b58-Busb-FAAP-Alo9-DUW0-C2c7-JPLs', 'copy1-fea6c17d-5ab6-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('fea6c17f-5ab6-11dc-be42-000e0c431b58-B2dB-FZor-Aqsh-D5wG-CDAm-JO7H', 'copy1-fea6c17f-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fea6c17f-5ab6-11dc-be42-000e0c431b58-Ba4S-Fxqv-ALRC-DOM7-C5Ea-J7dE', 'copy1-fea6c17f-5ab6-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсал.', ''),
('fea6c17f-5ab6-11dc-be42-000e0c431b58-Ba9i-FFXq-AW32-DZvJ-CcPe-JaXS', 'copy1-fea6c17f-5ab6-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('fea6c17f-5ab6-11dc-be42-000e0c431b58-BEwX-FGAk-AD5p-Dd2I-CheT-JTpY', 'copy1-fea6c17f-5ab6-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fea6c17f-5ab6-11dc-be42-000e0c431b58-BNgL-F7fM-A8LX-DwcY-ClQC-J55q', 'copy1-fea6c17f-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fea6c17f-5ab6-11dc-be42-000e0c431b58-BnKw-FKFj-AQIj-D3Wg-C0wa-JSkG', 'copy1-fea6c17f-5ab6-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('fea6c17f-5ab6-11dc-be42-000e0c431b58-BPpn-FjQS-AiQ1-Ddx1-CNNz-JwTN', 'copy1-fea6c17f-5ab6-11dc-be42-000e0c431b58', 'd17cb785-d20b-11e4-9be0-005056be1f7c', '520', 'мл'),
('fea6c17f-5ab6-11dc-be42-000e0c431b58-BynT-Fno8-AjVh-DKpR-CEzN-JEiI', 'copy1-fea6c17f-5ab6-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'сиреневый', ''),
('fea6c181-5ab6-11dc-be42-000e0c431b58-B0ZS-FlrL-AtrX-D0zs-CAfS-JgVo', 'copy1-fea6c181-5ab6-11dc-be42-000e0c431b58', 'd17cb785-d20b-11e4-9be0-005056be1f7c', '520', 'мл'),
('fea6c181-5ab6-11dc-be42-000e0c431b58-B3SL-FrKM-AK0G-DuKB-ClVE-JYYs', 'copy1-fea6c181-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fea6c181-5ab6-11dc-be42-000e0c431b58-Bhcc-FMim-A9ku-Dspq-Czh9-JAPI', 'copy1-fea6c181-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fea6c181-5ab6-11dc-be42-000e0c431b58-BKDx-FDoI-AEtp-DFKv-CBIu-JE6G', 'copy1-fea6c181-5ab6-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'охра', ''),
('fea6c181-5ab6-11dc-be42-000e0c431b58-BKPd-Fxnn-AzvV-DUVP-CXhH-JAfs', 'copy1-fea6c181-5ab6-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fea6c181-5ab6-11dc-be42-000e0c431b58-BM3n-F8kS-AnZ1-DlZG-Cumg-J35r', 'copy1-fea6c181-5ab6-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('fea6c181-5ab6-11dc-be42-000e0c431b58-BMaH-FSLS-AUwn-DYKC-CHre-Jj5D', 'copy1-fea6c181-5ab6-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсал.', ''),
('fea6c181-5ab6-11dc-be42-000e0c431b58-Bpkg-FzV4-A5ya-DOuv-CMT6-J6Oa', 'copy1-fea6c181-5ab6-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('fea6c183-5ab6-11dc-be42-000e0c431b58-BcVD-F0HX-AKaD-DCi0-C1mo-JYgH', 'copy1-fea6c183-5ab6-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсал.', ''),
('fea6c183-5ab6-11dc-be42-000e0c431b58-BdJk-FrP2-AE52-DcSs-CHuD-JLuL', 'copy1-fea6c183-5ab6-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('fea6c183-5ab6-11dc-be42-000e0c431b58-BEoh-F5cE-AmdO-DGRW-Cp0X-JY1p', 'copy1-fea6c183-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fea6c183-5ab6-11dc-be42-000e0c431b58-Bi5l-Fm7J-Alxw-DQMT-CXpc-J8Xr', 'copy1-fea6c183-5ab6-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fea6c183-5ab6-11dc-be42-000e0c431b58-BKgu-F1A9-AQou-Dl5H-C3UH-J8gX', 'copy1-fea6c183-5ab6-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('fea6c183-5ab6-11dc-be42-000e0c431b58-BPBA-FM9l-AimC-DW3K-CEDr-Jz5r', 'copy1-fea6c183-5ab6-11dc-be42-000e0c431b58', 'd17cb785-d20b-11e4-9be0-005056be1f7c', '520', 'мл'),
('fea6c183-5ab6-11dc-be42-000e0c431b58-BrBs-F2RD-AeYh-DvTL-CSq2-JH6y', 'copy1-fea6c183-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fea6c183-5ab6-11dc-be42-000e0c431b58-BXqz-FO87-Atsz-Dyhr-CAJd-JyIj', 'copy1-fea6c183-5ab6-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'какао', ''),
('fea6c185-5ab6-11dc-be42-000e0c431b58-B7qx-F0VV-AQ0C-DzWH-C0r8-J1dH', 'copy1-fea6c185-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fea6c185-5ab6-11dc-be42-000e0c431b58-BdDt-FUTw-A9xB-DzOI-CSMR-J4lI', 'copy1-fea6c185-5ab6-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('fea6c185-5ab6-11dc-be42-000e0c431b58-BLN8-F3lg-ABHb-DsH5-Clut-JIu3', 'copy1-fea6c185-5ab6-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fea6c185-5ab6-11dc-be42-000e0c431b58-Bm6l-FE9M-AR5L-D3Aa-Cuee-Jezx', 'copy1-fea6c185-5ab6-11dc-be42-000e0c431b58', 'd17cb785-d20b-11e4-9be0-005056be1f7c', '520', 'мл'),
('fea6c185-5ab6-11dc-be42-000e0c431b58-Bmzg-FAIO-AmR4-D6Nh-Cidc-JMwN', 'copy1-fea6c185-5ab6-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('fea6c185-5ab6-11dc-be42-000e0c431b58-BQ6n-FSu0-Aatq-DYjJ-Cf5q-J0c4', 'copy1-fea6c185-5ab6-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсал.', ''),
('fea6c185-5ab6-11dc-be42-000e0c431b58-BUge-FiNm-AWmX-DTsm-CIoS-J6on', 'copy1-fea6c185-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fea6c185-5ab6-11dc-be42-000e0c431b58-BUz1-FwJe-ACWN-DrIy-CZv8-JFOy', 'copy1-fea6c185-5ab6-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'красно-коричневый', ''),
('fea6c187-5ab6-11dc-be42-000e0c431b58-B0dE-F89B-AhyT-Do3t-CvQn-JpTb', 'copy1-fea6c187-5ab6-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('fea6c187-5ab6-11dc-be42-000e0c431b58-B6Fl-FMla-Avii-DSzG-CAYu-Jktd', 'copy1-fea6c187-5ab6-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('fea6c187-5ab6-11dc-be42-000e0c431b58-Ba56-FfaK-AwOP-DyKb-CPGh-J1SI', 'copy1-fea6c187-5ab6-11dc-be42-000e0c431b58', 'd17cb785-d20b-11e4-9be0-005056be1f7c', '520', 'мл'),
('fea6c187-5ab6-11dc-be42-000e0c431b58-BfQt-Flpk-AYb9-Df8k-CzRG-JEaG', 'copy1-fea6c187-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fea6c187-5ab6-11dc-be42-000e0c431b58-Bs0C-FIyZ-AoTF-DZ2x-CvYG-JglU', 'copy1-fea6c187-5ab6-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'алюминий', ''),
('fea6c187-5ab6-11dc-be42-000e0c431b58-BS7T-FZMR-AG2v-DEP1-CsPU-JxMT', 'copy1-fea6c187-5ab6-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fea6c187-5ab6-11dc-be42-000e0c431b58-BUgP-FIAT-Acwo-D5tl-CEcl-JGlZ', 'copy1-fea6c187-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fea6c187-5ab6-11dc-be42-000e0c431b58-BX44-FCyn-An3G-DP9r-Cpd8-JYEn', 'copy1-fea6c187-5ab6-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсал.', ''),
('fea6c189-5ab6-11dc-be42-000e0c431b58-B6mm-FY8A-AbGp-DT3Z-CwdF-JK6E', 'copy1-fea6c189-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fea6c189-5ab6-11dc-be42-000e0c431b58-BA7F-FzQc-A3wo-Dj03-C2Ez-JMyL', 'copy1-fea6c189-5ab6-11dc-be42-000e0c431b58', 'd17cb785-d20b-11e4-9be0-005056be1f7c', '520', 'мл'),
('fea6c189-5ab6-11dc-be42-000e0c431b58-BF8V-FtWb-AesG-DDHQ-CPw1-J6Of', 'copy1-fea6c189-5ab6-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('fea6c189-5ab6-11dc-be42-000e0c431b58-BhyB-FfmQ-AZew-DFZP-C5tn-JwOK', 'copy1-fea6c189-5ab6-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fea6c189-5ab6-11dc-be42-000e0c431b58-BlqX-Fc9H-A18q-DWX8-C4uP-JKu1', 'copy1-fea6c189-5ab6-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'хром', ''),
('fea6c189-5ab6-11dc-be42-000e0c431b58-Bn9l-FTRe-AsE8-DyO4-C3fq-J5dz', 'copy1-fea6c189-5ab6-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсал.', ''),
('fea6c189-5ab6-11dc-be42-000e0c431b58-BRwB-F8IZ-A5BK-DJM5-C0Hh-Jmge', 'copy1-fea6c189-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fea6c189-5ab6-11dc-be42-000e0c431b58-BUX2-FehD-AZhL-D8Jr-Cbxp-JDG8', 'copy1-fea6c189-5ab6-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('fea6c18b-5ab6-11dc-be42-000e0c431b58-BA72-FhWp-ArBI-D4r7-CDXG-JX3Z', 'copy1-fea6c18b-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fea6c18b-5ab6-11dc-be42-000e0c431b58-BBtg-Fb5I-A2fg-DaxJ-CpdM-JpyJ', 'copy1-fea6c18b-5ab6-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'золото', ''),
('fea6c18b-5ab6-11dc-be42-000e0c431b58-BInw-FKPd-ADS1-DQHe-Cv4E-Jy2M', 'copy1-fea6c18b-5ab6-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('fea6c18b-5ab6-11dc-be42-000e0c431b58-Bmwx-F9F4-A3IJ-DQVn-CHdQ-J5ng', 'copy1-fea6c18b-5ab6-11dc-be42-000e0c431b58', 'd17cb785-d20b-11e4-9be0-005056be1f7c', '520', 'мл'),
('fea6c18b-5ab6-11dc-be42-000e0c431b58-BpJU-FfT6-An4b-Dcms-CVnc-J3FW', 'copy1-fea6c18b-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fea6c18b-5ab6-11dc-be42-000e0c431b58-BqUv-FQQ9-A6jL-Dht7-CejY-Jdhu', 'copy1-fea6c18b-5ab6-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fea6c18b-5ab6-11dc-be42-000e0c431b58-BTfT-Fv96-AdUj-D6Mp-CSNl-JKu8', 'copy1-fea6c18b-5ab6-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсал.', ''),
('fea6c18b-5ab6-11dc-be42-000e0c431b58-Bzb0-F9Vq-A6YD-DBw7-CbGc-Ju2a', 'copy1-fea6c18b-5ab6-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('fea6c18d-5ab6-11dc-be42-000e0c431b58-B0R0-FALs-ALKF-DdJg-CpU7-JFk9', 'copy1-fea6c18d-5ab6-11dc-be42-000e0c431b58', 'd17cb785-d20b-11e4-9be0-005056be1f7c', '520', 'мл'),
('fea6c18d-5ab6-11dc-be42-000e0c431b58-BA8K-FCqA-Apgd-DO9A-Cvn1-JOch', 'copy1-fea6c18d-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fea6c18d-5ab6-11dc-be42-000e0c431b58-Bc7z-F7Ky-A77b-DwL5-CU3n-JTiI', 'copy1-fea6c18d-5ab6-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('fea6c18d-5ab6-11dc-be42-000e0c431b58-BLZZ-FQC8-A4yu-Dgw6-CMLJ-JNQE', 'copy1-fea6c18d-5ab6-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('fea6c18d-5ab6-11dc-be42-000e0c431b58-Bozc-Fzrd-AQc8-Dv7w-CjNk-JKgO', 'copy1-fea6c18d-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fea6c18d-5ab6-11dc-be42-000e0c431b58-BPAM-FYDa-ADUp-Dqv7-C0O4-JzKD', 'copy1-fea6c18d-5ab6-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fea6c18d-5ab6-11dc-be42-000e0c431b58-Brt0-Fpe6-AcDJ-DCOp-CQOm-JbQS', 'copy1-fea6c18d-5ab6-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсал.', ''),
('fea6c18d-5ab6-11dc-be42-000e0c431b58-BRxl-FSnz-Ab7B-Ds1n-C1ci-Jbhh', 'copy1-fea6c18d-5ab6-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'медь', ''),
('fea6c18f-5ab6-11dc-be42-000e0c431b58-BA88-FwRG-AlZS-DRc1-C1lt-JAiN', 'copy1-fea6c18f-5ab6-11dc-be42-000e0c431b58', 'd17cb785-d20b-11e4-9be0-005056be1f7c', '520', 'мл'),
('fea6c18f-5ab6-11dc-be42-000e0c431b58-BDZp-F5Xc-Al7x-Dsu8-CLgF-Jnvj', 'copy1-fea6c18f-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fea6c18f-5ab6-11dc-be42-000e0c431b58-BgRl-FUAW-ASM4-DX1o-C8aD-JWHb', 'copy1-fea6c18f-5ab6-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсал.', ''),
('fea6c18f-5ab6-11dc-be42-000e0c431b58-BJ3K-F8dI-AxVw-D0qC-C3Vh-JasX', 'copy1-fea6c18f-5ab6-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('fea6c18f-5ab6-11dc-be42-000e0c431b58-BKOx-F3sf-AvHR-DDL9-CtsQ-JVCQ', 'copy1-fea6c18f-5ab6-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', ''),
('fea6c18f-5ab6-11dc-be42-000e0c431b58-BkZZ-FrXx-AHWs-Des3-CYwR-JDqp', 'copy1-fea6c18f-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fea6c18f-5ab6-11dc-be42-000e0c431b58-BrUd-FkrT-APpt-DTB1-CvLF-JiEx', 'copy1-fea6c18f-5ab6-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fea6c18f-5ab6-11dc-be42-000e0c431b58-BwHb-FOe7-AnzH-D9YZ-C95X-JWK5', 'copy1-fea6c18f-5ab6-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'белый матовый', ''),
('fea6c191-5ab6-11dc-be42-000e0c431b58-B61D-FGBo-AlO0-DzEj-CARy-JxIn', 'copy1-fea6c191-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'наружные работы', ''),
('fea6c191-5ab6-11dc-be42-000e0c431b58-BerG-Fygz-Aldy-DBuz-Crqp-Juwr', 'copy1-fea6c191-5ab6-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 'универсал.', ''),
('fea6c191-5ab6-11dc-be42-000e0c431b58-Bhuf-FM3b-ALnu-DGfN-C9Oq-Jefz', 'copy1-fea6c191-5ab6-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 'эмаль', ''),
('fea6c191-5ab6-11dc-be42-000e0c431b58-BMOx-F2zq-AidU-Dzsw-C80Z-JRBp', 'copy1-fea6c191-5ab6-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'внутренние работы', ''),
('fea6c191-5ab6-11dc-be42-000e0c431b58-BQmT-FCQo-AzXK-DLle-CNUO-JzjL', 'copy1-fea6c191-5ab6-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'черный матовый', ''),
('fea6c191-5ab6-11dc-be42-000e0c431b58-BW6G-FK72-AAnh-DpYU-CXxs-JTN6', 'copy1-fea6c191-5ab6-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 'Россия', ''),
('fea6c191-5ab6-11dc-be42-000e0c431b58-BYHV-FFaL-AApU-DIDD-COky-Juxr', 'copy1-fea6c191-5ab6-11dc-be42-000e0c431b58', 'd17cb785-d20b-11e4-9be0-005056be1f7c', '520', 'мл'),
('fea6c191-5ab6-11dc-be42-000e0c431b58-BZX7-FZMA-A0NR-DxBZ-CafG-JgUn', 'copy1-fea6c191-5ab6-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 'KUDO', '');

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

-- --------------------------------------------------------

--
-- Структура таблицы `ShopLogsActionType`
--

CREATE TABLE IF NOT EXISTS `ShopLogsActionType` (
  `type` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
('4dc0750a-691d-11e0-adb9-001cc494be80', 'VIP', 0),
('feff0694-99ab-11db-937f-000e0c431b33', 'TestPrise', 0),
('feff0694-99ab-11db-937f-000e0c431b59', 'Оптовая', 0);

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
('0569475c-1474-11e3-82b9-0050569a1080', 'Тип', 'groupSelect', 'varchar', 0),
('0a552a3f-3bb7-11e3-80e1-005056be1f7a', 'Цвет', 'groupSelect', 'varchar', 0),
('0beb7c10-76ad-11e3-8868-005056be1f7a', 'Износоустойчивость', 'groupSelect', 'varchar', 0),
('0e31c585-9718-11e4-9be0-005056be1f7c', 'Ширина (м.)', 'intRange', 'float', 0),
('1452d640-9718-11e4-9be0-005056be1f7c', 'Толщина (м.)', 'intRange', 'float', 0),
('1d08380b-ce34-11e4-a80e-005056be1f7a', 'Вес (гр.)', 'intRange', 'float', 0),
('1ea6fcc4-d206-11e4-9be0-005056be1f7c', 'Размер зерна (мм)', 'intRange', 'float', 0),
('24cace4a-9718-11e4-9be0-005056be1f7c', 'Высота (м.)', 'intRange', 'float', 0),
('27c97b3a-3bc1-11e3-80e1-005056be1f7a', 'Область применения', 'groupSelect', 'varchar', 0),
('42d0b52f-970f-11e4-9be0-005056be1f7c', 'Вид', 'groupSelect', 'varchar', 0),
('5ca72995-ad9a-11e3-b114-005056be1f7c', 'Диаметр (м.)', 'intRange', 'float', 0),
('618eeb90-3bc1-11e3-80e1-005056be1f7a', 'Особенности', 'groupSelect', 'varchar', 0),
('6cd386f1-3a4b-11e3-88c8-005056be1f7a', 'Объем (л.)', 'intRange', 'float', 0),
('6e62ed56-970e-11e4-9be0-005056be1f7c', 'Упаковка', 'groupSelect', 'varchar', 0),
('a34e94dc-9f77-11e3-9686-005056be1f7c', 'Морозостойкость', 'groupSelect', 'varchar', 0),
('bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 'Назначение', 'groupSelect', 'varchar', 0),
('c17ab514-3bbc-11e3-80e1-005056be1f7a', 'Блеск', 'groupSelect', 'varchar', 0),
('c2267174-970e-11e4-9be0-005056be1f7c', 'Длина (м.)', 'intRange', 'float', 0),
('cce0ab91-6a67-11e4-8945-005056be1f7a', 'Страна-производитель', 'groupSelect', 'varchar', 0),
('d17cb785-d20b-11e4-9be0-005056be1f7c', 'Объем (мл.)', 'intRange', 'float', 0),
('d624040a-3bb6-11e3-80e1-005056be1f7a', 'Основа', 'groupSelect', 'varchar', 0),
('e2e87ce8-ad99-11e3-b114-005056be1f7c', 'Расход', 'intRange', 'float', 0),
('e765ba72-107d-11e3-8a5d-0050569a1080', 'База', 'groupSelect', 'varchar', 0),
('e765ba75-107d-11e3-8a5d-0050569a1080', 'Вес (кг.)', 'intRange', 'float', 0),
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
('01f691f1-87cd-11de-8f0e-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 1),
('01f691f1-87cd-11de-8f0e-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', 3),
('01f691f1-87cd-11de-8f0e-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 4),
('01f691f2-87cd-11de-8f0e-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 1),
('01f691f2-87cd-11de-8f0e-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 5),
('01f691f2-87cd-11de-8f0e-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 2),
('01f691f2-87cd-11de-8f0e-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 4),
('01f691f2-87cd-11de-8f0e-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 3),
('076d216a-4380-11de-8f53-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 1),
('076d216a-4380-11de-8f53-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 2),
('076d216a-4380-11de-8f53-000e0c431b58', 'd17cb785-d20b-11e4-9be0-005056be1f7c', 3),
('27566c6a-9ed8-11e3-96ad-005056be1f7b', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 1),
('27566c6a-9ed8-11e3-96ad-005056be1f7b', '1ea6fcc4-d206-11e4-9be0-005056be1f7c', 9),
('27566c6a-9ed8-11e3-96ad-005056be1f7b', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 2),
('27566c6a-9ed8-11e3-96ad-005056be1f7b', '42d0b52f-970f-11e4-9be0-005056be1f7c', 8),
('27566c6a-9ed8-11e3-96ad-005056be1f7b', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 4),
('27566c6a-9ed8-11e3-96ad-005056be1f7b', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 6),
('27566c6a-9ed8-11e3-96ad-005056be1f7b', 'e765ba75-107d-11e3-8a5d-0050569a1080', 5),
('75d66d49-99a5-11db-937f-000e0c431b59', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 2),
('75d66d49-99a5-11db-937f-000e0c431b59', 'e8287600-ad96-11e3-b114-005056be1f7c', 1),
('9291c606-5ab3-11dc-be42-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 1),
('9291c606-5ab3-11dc-be42-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 5),
('9291c606-5ab3-11dc-be42-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 4),
('9291c606-5ab3-11dc-be42-000e0c431b58', 'd17cb785-d20b-11e4-9be0-005056be1f7c', 7),
('9291c606-5ab3-11dc-be42-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 3),
('9291c607-5ab3-11dc-be42-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 1),
('9291c607-5ab3-11dc-be42-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 3),
('9291c607-5ab3-11dc-be42-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 2),
('a6f80c91-516a-11dd-a89a-000e0c431b58', '0a552a3f-3bb7-11e3-80e1-005056be1f7a', 3),
('a6f80c91-516a-11dd-a89a-000e0c431b58', '27c97b3a-3bc1-11e3-80e1-005056be1f7a', 4),
('a6f80c91-516a-11dd-a89a-000e0c431b58', '42d0b52f-970f-11e4-9be0-005056be1f7c', 10),
('a6f80c91-516a-11dd-a89a-000e0c431b58', '618eeb90-3bc1-11e3-80e1-005056be1f7a', 6),
('a6f80c91-516a-11dd-a89a-000e0c431b58', '6cd386f1-3a4b-11e3-88c8-005056be1f7a', 7),
('a6f80c91-516a-11dd-a89a-000e0c431b58', 'bbea9c1a-3a4b-11e3-88c8-005056be1f7a', 8),
('a6f80c91-516a-11dd-a89a-000e0c431b58', 'd624040a-3bb6-11e3-80e1-005056be1f7a', 1),
('a6f80c91-516a-11dd-a89a-000e0c431b58', 'e765ba72-107d-11e3-8a5d-0050569a1080', 2),
('f8e15f34-b217-11dd-8051-000e0c431b58', 'cce0ab91-6a67-11e4-8945-005056be1f7a', 2),
('f8e15f34-b217-11dd-8051-000e0c431b58', 'e8287600-ad96-11e3-b114-005056be1f7c', 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `TemplateBlocks`
--

INSERT INTO `TemplateBlocks` (`id`, `block`, `template`, `description`) VALUES
(1, 'test', 'apelsinShop', NULL),
(2, 'ShopNavigationPanel', 'apelsinShop', NULL);

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
('apelsinShop', 'Апельсин', 'Compu Project', 'v1.0', 'Основной шаблон сайта', 1, 'index.php', 'mobile.php', 'print.php');

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
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор элемента меню';
--
-- AUTO_INCREMENT для таблицы `ModulesDepends`
--
ALTER TABLE `ModulesDepends`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `ModulesInBlocks`
--
ALTER TABLE `ModulesInBlocks`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
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
MODIFY `sequence` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT для таблицы `TemplateBlocks`
--
ALTER TABLE `TemplateBlocks`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
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
