-- phpMyAdmin SQL Dump
-- version 4.2.10.1
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Май 21 2015 г., 12:55
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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
