<?php
header("Content-type: text/html; charset=UTF-8");
@session_start();
include_once '../../../ROOT/functions/includeSistemClasses.php';
includeSistemClasses('../../../ROOT/');
include_once '../classes/ShopSearchItem.php';
include_once '../../../components/Shop/classes/ShopPageInfoHelper.php';

global $_SQL_HELPER;
$_SQL_HELPER = new MysqliHelper();

global $_SITECONFIG;
$_SITECONFIG = new SiteConfig();

$urlParams = new UrlParams();
global $_URL_PARAMS;
$_URL_PARAMS = $urlParams->getUrlParam();

if (isset($_POST['chars']) && isset($_POST['chars'])  && $_POST['chars'] != "") {
    $chars = $_POST['chars'];
    $search = new ShopSearchItem($chars);
    echo $search->getSearchResult();
}
