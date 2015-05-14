<?php
include_once './components/Shop/admin/classes/AP_ChangeProductShop.php';
include_once './components/Shop/admin/classes/AP_ChangeProductShopEdit.php';
include_once './components/Shop/admin/classes/MakeMiniature.php';
$changeProductShop = new AP_ChangeProductShop();
echo $changeProductShop->getHtml();
