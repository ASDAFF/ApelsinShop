<?php
include_once './components/Shop/admin/classes/ShopImportData.php';
include_once './components/Shop/admin/classes/ShopImportData_MySQL.php';
include_once './components/Shop/admin/classes/ShopImportData_XML.php';
include_once './components/Shop/admin/classes/ShopImportDataCheckHelper.php';
include_once './components/Shop/admin/classes/AP_ViewLogsShop.php';
$viewLogsShop = new AP_ViewLogsShop();
echo $viewLogsShop->getHtml();
