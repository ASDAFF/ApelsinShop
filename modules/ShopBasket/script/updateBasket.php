<?php
header("Content-type: text/html; charset=UTF-8");
@session_start();
include_once '../../../ROOT/functions/includeSistemClasses.php';
includeSistemClasses('../../../ROOT/');
include_once '../../../components/Shop/classes/ShopBasketHelper.php';
include_once '../../../components/Shop/classes/ShopGroupPriceType.php';
include_once '../../../components/Shop/classes/ShopPageInfoHelper.php';
include_once '../../../modules/ShopBasket/classes/ShopBasketModuleUpdate.php';

global $_SQL_HELPER;
$_SQL_HELPER = new MysqliHelper();
global $_SITECONFIG;
$_SITECONFIG = new SiteConfig();
$urlParams = new UrlParams();
global $_URL_PARAMS;
$_URL_PARAMS = $urlParams->getUrlParam();
$imageDir = '../../../resources/Components/Shop/Image/ITEMS/';

$basket = new ShopBasketModuleUpdate($imageDir);
echo $basket->getHtml();
