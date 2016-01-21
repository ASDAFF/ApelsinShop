<?php

include_once './components/Shop/admin/classes/AP_ImportImages.php';
include_once './components/Shop/admin/classes/AP_ImportItemsGroup.php';
include_once './components/Shop/admin/classes/StatisticsFiles.php';
include_once './components/Shop/admin/classes/MakeMiniature.php';
include_once './components/Shop/admin/classes/ImportImage.php';
$mainPanelUI = new AdminPanel_ComponentPanelUI_Main();
$mainPanelUI->addElement('importImages', 'Загрузка изображений товаров', 'importImagesUI.php');
$mainPanelUI->addElement('importGroups', 'Загрузка изображений групп', 'importGroupsUI.php');
$mainPanelUI->addElement('workingWithShopCatalog', 'Работа с каталогами магазина', 'workingWithShopCatalogUI.php');
$mainPanelUI->addElement('workingWithShopCatalogProperty', 'Работа с свойствами каталогов магазина', 'workingWithShopCatalogPropertyUI.php');
$mainPanelUI->getUI();
