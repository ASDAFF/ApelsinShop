<?php
include_once './components/Shop/admin/classes/AP_ChangeGroupShop.php';
include_once './components/Shop/admin/classes/AP_ChangeGroupEdit.php';
$changeGroupShop = new AP_ChangeGroupShop();
echo $changeGroupShop->getHtml();
