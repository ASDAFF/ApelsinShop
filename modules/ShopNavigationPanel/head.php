<?php
include_once './components/Shop/classes/ShopGroupsHelper.php';
include_once './components/Shop/classes/ShopGroupsDataHelper.php';
include_once './components/Shop/classes/ShopPageInfoHelper.php';
include_once './components/Shop/classes/ShopGroupsUrlHelper.php';
include_once './components/Shop/classes/ShopGroupsIcons.php';
include_once './components/Shop/classes/ShopGroupsPathPanelHelper.php';
include_once './components/Shop/classes/ShopPropertiesFilterType.php';
include_once './components/Shop/classes/ShopPropertiesFilterSerchArray.php';

include_once './modules/ShopNavigationPanel/classes/ShopNavigationPanel.php';
include_once './modules/ShopNavigationPanel/classes/ShopNavigationPanel_Menu.php';
include_once './modules/ShopNavigationPanel/classes/ShopNavigationPanel_Filter.php';
include_once './modules/ShopNavigationPanel/classes/ShopNavigationPanel_ThisGroupIconPanel.php';




global $shopNavigationPanel;
if(!isset($shopNavigationPanel) || $shopNavigationPanel === null) {
    $shopNavigationPanel = new ShopNavigationPanel();
}