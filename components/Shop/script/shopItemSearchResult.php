<?php
ini_set("display_errors",1);
error_reporting(E_ALL);
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

if(isset($_GET['groupID'])) {
    $groupID = $_GET['groupID'];
} else {
    $groupID = NULL;
}
ShopPropertiesFilterTypeGetPostData::getPostData($groupID);
$shopGroupsItemList = new ShopGroupsItemList(1,$groupID);
$imageItemPath = '../../../resources/Components/Shop/Image/ItemsImage/';
$defaultImageItemPath = '../../../resources/Components/Shop/Image/ItemsImage/defaultIcon_100x100.png';
$shopGroupsItemList->setImagePath($imageItemPath, $defaultImageItemPath);
$shopGroupsItemList->get();

//var_dump($_POST);