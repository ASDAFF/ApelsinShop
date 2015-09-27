<?php
include_once './components/Shop/admin/classes/AP_PrefixesScalarUnitsAdd.php';
include_once './components/Shop/admin/classes/AP_PrefixesScalarUnitsEdit.php';
include_once './components/Shop/admin/classes/AP_PrefixesScalarUnitsDelite.php';
include_once './components/Shop/admin/classes/AP_PrefixesScalarUnitsMain.php';
$prefixesScalarUnitsMain = new AP_PrefixesScalarUnitsMain();
echo $prefixesScalarUnitsMain->getHtml();

