<?php
header("Content-type: text/html; charset=UTF-8");
@session_start();
include_once '../../../ROOT/functions/includeSistemClasses.php';
includeSistemClasses('../../../ROOT/');
include_once '../../../components/Shop/classes/ShopIncludeClasses.php';
ShopIncludeClasses::includeAllClasses("../../../components/Shop/","../../ShopNavigationPanel/");

global $_SQL_HELPER;
$_SQL_HELPER = new MysqliHelper();

global $_SITECONFIG;
$_SITECONFIG = new SiteConfig();

$urlParams = new UrlParams();
global $_URL_PARAMS;
$_URL_PARAMS = $urlParams->getUrlParam();

$urlHelper = new UrlHelper();

if (isset($_POST['data']) && isset($_POST['data']) && $_POST['data'] != "") {
    $data = $_POST['data'];
    $adres = $urlHelper->pageUrl(ShopPageInfoHelper::getShopPageAlias(),array());
    $searchParam = array("ItemName" => array("type" => 'main',"value" => $data));
    ShopPropertiesFilterSerchArray::setArrayGroup(null, $searchParam);
    echo '<script language="JavaScript">';
    echo 'window.location.href = "'.$adres.'";';
    echo '</script>';
}
