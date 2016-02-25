<?php
ini_set("display_errors", 1);
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

if (isset($_GET['groupID']) && $_GET['groupID'] != "") {
    $groupID = $_GET['groupID'];
} else {
    $groupID = NULL;
}
if (isset($_GET['page']) && $_GET['page'] != "") {
    $page = $_GET['page'];
    $showInformation = false;
} else {
    $page = 1;
    $showInformation = true;
}
if (!(isset($_GET['noPostData']) && $_GET['noPostData'] === 'yes')) {
    ShopPropertiesFilterTypeGetPostData::getPostData($groupID);
}
$shopGroupsItemList = new ShopGroupsItemList($page, $groupID, $showInformation);
$imageItemPath = '../../../resources/Components/Shop/Image/ITEMS/';
$defaultImageItemPath = '../../../resources/Components/Shop/Image/ITEMS/defaultIcon_150x150.png';
$shopGroupsItemList->setImagePath($imageItemPath, $defaultImageItemPath);
$shopGroupsItemList->get();
?>
<script type="text/javascript">
    setAmountOfPage(<?php echo ShopPropertiesFilterSerchArray::getArrayGroupAmauntOfPage($groupID) ?>);
</script>