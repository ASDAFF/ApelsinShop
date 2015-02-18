<?php
//    include_once './components/Materials/admin/classes/AP_MaterialEdit.php';
//    include_once './components/Materials/admin/classes/AP_MaterialAdd.php';
//    include_once './components/Materials/admin/classes/AP_MaterialMain.php';
//    $ap_MaterialMain = new AP_MaterialMain();
//    echo $ap_MaterialMain->getHtml();

$mainPanelUI = new AdminPanel_ComponentPanelUI_Main();
$mainPanelUI->addElement('material', 'Редактирование материалов', 'materialUI.php');
$mainPanelUI->addElement('categories', 'Редактирование категорий материалов', 'materialsCategoriesUI.php');
$mainPanelUI->addElement('lists', 'Редактирование списков категорий', 'materialsCategoriesListUI.php');
$mainPanelUI->getUI();
?>