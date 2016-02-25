<?php
header("Content-type: text/html; charset=UTF-8");
@session_start();
include_once '../../../ROOT/functions/includeSistemClasses.php';
includeSistemClasses('../../../ROOT/');
include_once '../classes/ShopIncludeClasses.php';
ShopIncludeClasses::includeAllClasses('../', '../../../modules/ShopNavigationAndFiltersPanel/');

global $_SQL_HELPER;
$_SQL_HELPER = new MysqliHelper();
global $_SITECONFIG;
$_SITECONFIG = new SiteConfig();
$urlParams = new UrlParams();
global $_URL_PARAMS;
$_URL_PARAMS = $urlParams->getUrlParam();
if (isset($_POST['id'])  && $_POST['id'] != "" && $_POST['id'] != null) {
    $itemID = $_POST['id'];
    ShopBasketHelper::deleteItemFromShopBasket($itemID);
}
