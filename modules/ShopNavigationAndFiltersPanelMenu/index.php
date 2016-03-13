<?php
global $_URL_PARAMS;
$page = $_URL_PARAMS['page'];
$params = $_URL_PARAMS['params'];
echo "<div class='ShopNavigationAndFiltersPanelMenuMainBlock'>";
    
if ($page == 'shop') {
    if(!isset($params[0])|| (isset($params[0]) && $params[0] === ShopPageInfoHelper::getCatalogPage())|| (isset($params[0]) && $params[0] === 'p')) {
        echo "<div class='ShopNavigationAndFiltersPanelMenuBlock'>";
        echo "<div class='ShopNavigationAndFiltersPanelMenuElement meShopNavigationMenuBlock' blockId='ShopNavigationMenuBlock'>каталог <span class='ShopFilterBlockCloseButton'>X</span></div>";
        echo "<div class='ShopNavigationAndFiltersPanelMenuElement meShopFilterBlock' blockId='ShopFilterBlock'>фильтры <span class='ShopFilterBlockCloseButton'>X</span></div>";
        echo "</div>";
    } else if(isset($params[0]) && $params[0] === ShopPageInfoHelper::getItemPage()) {
        echo "<div class='ShopNavigationAndFiltersPanelMenuBlock ItemBack'>";
//        echo "<div class='BackOutFromItemPage' onclick='history.back();'>На предыдущую страницу</div>";
        echo "<div class='BackOutFromItemPage' onclick='history.back();'>Назад</div>";
//        echo "<div class='ShopNavigationAndFiltersPanelMenuElement' onclick='history.back();'>В корень</div>";
        echo "</div>";
    }
} 
    include_once './components/Shop/classes/ShopIncludeClasses.php';
    ShopIncludeClasses::includeAllClasses();
    echo ShopGroupsPathPanelHelper::getPanel();
    echo "<div class='clear'></div>";
    echo "</div>";