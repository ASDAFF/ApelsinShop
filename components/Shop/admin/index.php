<?php
function createdDir($dirUpload) {
    if (!file_exists($dirUpload)) { 
        mkdir($dirUpload, 0777, true);
        chmod($dirUpload, 0777);
    }
}
$path = './resources/Components/Shop/';
$dirs = array('ImportFilesMySQL', 'ImportFilesXML', 'ImportLogsHtml', 'ImportLogsText');
foreach ($dirs as $value) {
    createdDir($path.$value);
}
$mainPanelUI = new AdminPanel_ComponentPanelUI_Main();
$mainPanelUI->addElement('importUnloadingShop', 'Импортировать выгрузку', 'shopImportXMLtoMYSQL.php');
$mainPanelUI->addElement('restartImportShop', 'Повторный запуск импорта', 'restartImportShopUI.php');
$mainPanelUI->addElement('removeUnloadingShop', 'Удалить выгрузку (backUp)', 'removeUnloadingShopUI.php');
$mainPanelUI->addElement('viewLogsShop', 'Просмотр логов', 'viewLogsShopUI.php');
$mainPanelUI->getUI();