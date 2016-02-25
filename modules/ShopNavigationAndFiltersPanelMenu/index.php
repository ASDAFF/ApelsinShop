<?php
global $_URL_PARAMS;
$page = $_URL_PARAMS['page'];
$params = $_URL_PARAMS['params'];
echo "<div class='ShopNavigationAndFiltersPanelMenuMainBlock'>";
    
if (
        $page == 'shop' && 
        (
                (!isset($params[0])) || 
                (isset($params[0]) && $params[0] === ShopPageInfoHelper::getCatalogPage()) || 
                (isset($params[0]) && $params[0] === 'p')
        )
    ) {
    echo "<div class='ShopNavigationAndFiltersPanelMenuBlock'>";
    echo "<div class='ShopNavigationAndFiltersPanelMenuElement meShopFilterBlock' blockId='ShopFilterBlock'>фильтры <span class='ShopFilterBlockCloseButton'>X</span></div>";
    echo "<div class='ShopNavigationAndFiltersPanelMenuElement meShopNavigationMenuBlock' blockId='ShopNavigationMenuBlock'>навигация <span class='ShopFilterBlockCloseButton'>X</span></div>";
    echo "</div>";
}
    include_once './components/Shop/classes/ShopIncludeClasses.php';
    ShopIncludeClasses::includeAllClasses();
    echo ShopGroupsPathPanelHelper::getPanel();
    echo "<div class='clear'></div>";
    echo "</div>";