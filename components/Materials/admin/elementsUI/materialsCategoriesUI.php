<?php
    include_once './components/Materials/admin/classes/AP_MaterialsCategoriesDelete.php';
    include_once './components/Materials/admin/classes/AP_MaterialsCategoriesEdit.php';
    include_once './components/Materials/admin/classes/AP_MaterialsCategoriesAdd.php';
    include_once './components/Materials/admin/classes/AP_MaterialsCategoriesMain.php';
    $ap_MaterialsCategoriesMain = new AP_MaterialsCategoriesMain();
    echo $ap_MaterialsCategoriesMain->getHtml();
?>
