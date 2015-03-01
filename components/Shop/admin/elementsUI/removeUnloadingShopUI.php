<?php
include_once './components/Shop/admin/classes/ShopImportData.php';
include_once './components/Shop/admin/classes/ShopImportData_MySQL.php';
include_once './components/Shop/admin/classes/ShopImportData_XML.php';
include_once './components/Shop/admin/classes/ShopImportDataCheckHelper.php';
include_once './components/Shop/admin/classes/AP_RemoveUnloadingShop.php';
$removeUnloadingShop = new AP_RemoveUnloadingShop();
echo $removeUnloadingShop->getHtml();
