<?php
header("Content-type: text/html; charset=UTF-8");
@session_start();
include_once '../../../ROOT/functions/includeSistemClasses.php';
includeSistemClasses('../../../ROOT/');
include_once '../../../components/Shop/classes/ShopBasketHelper.php';
include_once '../../../components/Shop/classes/ShopGroupPriceType.php';
include_once '../../../components/Shop/classes/ShopPageInfoHelper.php';
include_once '../../../modules/ShopBasket/classes/ShopBasketModuleOneItem.php';

global $_SQL_HELPER;
$_SQL_HELPER = new MysqliHelper();
global $_SITECONFIG;
$_SITECONFIG = new SiteConfig();
$urlParams = new UrlParams();
global $_URL_PARAMS;
$_URL_PARAMS = $urlParams->getUrlParam();
$imageDir = '../../../resources/Components/Shop/Image/ItemsImage/';

if (isset($_POST['amount']) && isset($_POST['id'])  &&
        $_POST['amount'] != "" && $_POST['id'] != "" &&
        $_POST['amount'] != null && $_POST['id'] != null) {
    $itemID = $_POST['id'];
    $amount = $_POST['amount'];
    $basket = new ShopBasketModuleOneItem($itemID, $imageDir);
    echo $basket->getHtml();
}
