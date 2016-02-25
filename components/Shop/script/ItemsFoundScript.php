<?php
ini_set("display_errors",1);
error_reporting(E_ALL);
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

if(isset($_GET['groupID'])) {
    $groupID = $_GET['groupID'];
} else {
    $groupID = NULL;
}


echo "<span class='property'>Найдено товаров:</span> <span class='value'>".ShopPropertiesFilterSerchArray::getArrayGroupAmauntOfItems($groupID)."</span>";
