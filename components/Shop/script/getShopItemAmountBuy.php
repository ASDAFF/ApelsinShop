<?php
// Включить отображение ошибок
ini_set("display_errors",1);
error_reporting(E_ALL);

header("Content-type: text/html; charset=UTF-8");
@session_start();
include_once '../../../ROOT/functions/includeSistemClasses.php';
includeSistemClasses('../../../ROOT/');
// Инициализация конфигурации
global $_SITECONFIG;
$_SITECONFIG = new SiteConfig();
// Создание помошника базы данных
global $_SQL_HELPER;
$_SQL_HELPER = new MysqliHelper();

include_once '../classes/ShopIncludeClasses.php';
ShopIncludeClasses::includeAllClasses('../', '../../../modules/ShopNavigationPanel/');
echo count(ShopBasketHelper::getAllItemsFromShopBasket());