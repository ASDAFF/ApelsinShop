<?php

class ShopIncludeClasses {
    private static $notIncluded = true;
    
    public static function includeAllClasses($componentPath = './components/Shop/', $modulesPath = './modules/ShopNavigationPanel/') {
        if(self::$notIncluded) {
            self::$notIncluded = false;
            include_once $componentPath.'classes/ShopGroupsHelper.php';
            include_once $componentPath.'classes/ShopGroupsDataHelper.php';
            include_once $componentPath.'classes/ShopPageInfoHelper.php';
            include_once $componentPath.'classes/ShopGroupsUrlHelper.php';
            include_once $componentPath.'classes/ShopGroupsIcons.php';
            include_once $componentPath.'classes/ShopGroupsPathPanelHelper.php';
            include_once $componentPath.'classes/ShopPropertiesFilterType.php';
            include_once $componentPath.'classes/ShopPropertiesFilterTypeJSGenerator.php';
            include_once $componentPath.'classes/ShopPropertiesFilterTypeGetPostData.php';
            include_once $componentPath.'classes/ShopPropertiesFilterSerchArray.php';
            include_once $componentPath.'classes/ShopHelperSQL.php';
            include_once $componentPath.'classes/ShopGroupsItemList.php';
            include_once $componentPath.'classes/ShopMainClass.php';
            include_once $componentPath.'classes/ShopItem.php';
            include_once $componentPath.'classes/ShopGroupsPageNavigator.php';
            include_once $componentPath.'classes/ShopGroupPriceType.php';
            include_once $componentPath.'classes/ShopItemAmountScale.php';
            include_once $componentPath.'classes/ShopGroupPropertyValue.php';
            include_once $componentPath.'classes/ShopBasketHelper.php';
            include_once $componentPath.'classes/ShopBasket.php';
            include_once $componentPath.'classes/ShopItemsPropertiesMeasureScaling.php';

            include_once $modulesPath.'classes/ShopNavigationPanel.php';
            include_once $modulesPath.'classes/ShopNavigationPanel_Menu.php';
            include_once $modulesPath.'classes/ShopNavigationPanel_Filter.php';
            include_once $modulesPath.'classes/ShopNavigationPanel_ThisGroupIconPanel.php';
        }
    }
}
