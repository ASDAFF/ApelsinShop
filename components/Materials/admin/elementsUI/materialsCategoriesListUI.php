<?php
    include_once './components/Materials/admin/classes/AP_MaterialsInListCategoriesDelete.php';
    include_once './components/Materials/admin/classes/AP_MaterialsCategoriesInListEdit.php';
    include_once './components/Materials/admin/classes/AP_MaterialsCategoriesInListAdd.php';
    include_once './components/Materials/admin/classes/AP_MaterialsCategoriesInListMain.php';
    $ap_MaterialsCategoriesInListMain = new AP_MaterialsCategoriesInListMain();
    echo $ap_MaterialsCategoriesInListMain->getHtml();
?>