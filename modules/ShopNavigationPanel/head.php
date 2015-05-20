<?php
include_once './components/Shop/classes/ShopIncludeClasses.php';
ShopIncludeClasses::includeAllClasses();

global $shopNavigationPanel;
if(!isset($shopNavigationPanel) || $shopNavigationPanel === null) {
    $shopNavigationPanel = new ShopNavigationPanel();
}