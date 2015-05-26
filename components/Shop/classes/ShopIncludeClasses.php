<?php

class ShopIncludeClasses {
    private static $notIncluded = true;
    
    public static function includeAllClasses() {
        if(self::$notIncluded) {
            self::$notIncluded = false;
            include_once './components/Shop/classes/ShopGroupsHelper.php';
            include_once './components/Shop/classes/ShopGroupsDataHelper.php';
            include_once './components/Shop/classes/ShopPageInfoHelper.php';
            include_once './components/Shop/classes/ShopGroupsUrlHelper.php';
            include_once './components/Shop/classes/ShopGroupsIcons.php';
            include_once './components/Shop/classes/ShopGroupsPathPanelHelper.php';
            include_once './components/Shop/classes/ShopPropertiesFilterType.php';
            include_once './components/Shop/classes/ShopPropertiesFilterSerchArray.php';
            include_once './components/Shop/classes/ShopHelperSQL.php';
            include_once './components/Shop/classes/ShopGroupsItemList.php';
            include_once './components/Shop/classes/ShopMainClass.php';
            include_once './components/Shop/classes/ShopItem.php';
            include_once './components/Shop/classes/ShopGroupsPageNavigator.php';
            include_once './components/Shop/classes/ShopGroupPriceType.php';
            include_once './components/Shop/classes/ShopItemAmountScale.php';
            include_once './components/Shop/classes/ShopGroupPropertyValue.php';
            include_once './components/Shop/classes/ShopBasketHelper.php';
            include_once './components/Shop/classes/ShopBasket.php';

            include_once './modules/ShopNavigationPanel/classes/ShopNavigationPanel.php';
            include_once './modules/ShopNavigationPanel/classes/ShopNavigationPanel_Menu.php';
            include_once './modules/ShopNavigationPanel/classes/ShopNavigationPanel_Filter.php';
            include_once './modules/ShopNavigationPanel/classes/ShopNavigationPanel_ThisGroupIconPanel.php';
        }
    }
}