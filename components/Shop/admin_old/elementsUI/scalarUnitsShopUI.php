<?php
include_once './components/Shop/admin/classes/AP_ScalarUnitsAdd.php';
include_once './components/Shop/admin/classes/AP_ScalarUnitsEdit.php';
include_once './components/Shop/admin/classes/AP_ScalarUnitsDelite.php';
include_once './components/Shop/admin/classes/AP_ScalarUnitsMain.php';
$scalarUnitsMain = new AP_ScalarUnitsMain();
echo $scalarUnitsMain->getHtml();
