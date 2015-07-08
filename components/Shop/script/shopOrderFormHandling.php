<?php
header("Content-type: text/html; charset=UTF-8");
@session_start();
include_once '../../../ROOT/functions/includeSistemClasses.php';
includeSistemClasses('../../../ROOT/');

include_once '../classes/ShopIncludeClasses.php';
ShopIncludeClasses::includeAllClasses('../', '../../../modules/ShopNavigationPanel/');

global $_SQL_HELPER;
$_SQL_HELPER = new MysqliHelper();
global $_SITECONFIG;
$_SITECONFIG = new SiteConfig();
$urlParams = new UrlParams();
global $_URL_PARAMS;
$_URL_PARAMS = $urlParams->getUrlParam();
$urlHelper = new UrlHelper();
if ($_POST) {
    $data = $_POST;
} else {
    $data = [];
}
$orderID = ShopOrderManagementHelper::getThisOrderID();
$message = new ShopOrderMessage($data, $orderID);
echo $message->get();
ShopOrderManagementHelper::clearThisOrderID();
$adres = $urlHelper->pageUrl(ShopPageInfoHelper::getShopPageAlias(),array());
echo '';
echo '<script  type="text/javascript">';
echo 'window.location.href = "'.$adres.'";';
echo '</script>';
