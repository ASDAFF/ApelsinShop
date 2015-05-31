<script type="text/javascript">
var shopItemsListTimer; // Таймер для запроса данных по задержке;
var shopItemsListTime = 2000; // время на задержку при запросе данных;
    
jQuery(document).ready(function() {
    jQuery("form.ShopPropertiesFilterForm .selectBox").change(function(){
        clearTimeout(shopItemsListTimer);
        getShopItemsList();
    });
    jQuery("form.ShopPropertiesFilterForm .FilterType_bool").change(function(){
        clearTimeout(shopItemsListTimer);
        getShopItemsList();
    });
    jQuery("form.ShopPropertiesFilterForm .FilterType_groupSelect").change(function(){
        clearTimeout(shopItemsListTimer);
        getShopItemsList();
    });
    jQuery("form.ShopPropertiesFilterForm .FilterType_intRange ").keyup(function(){
        clearTimeout(shopItemsListTimer);
        shopItemsListTimer = setTimeout(getShopItemsList, shopItemsListTime);
    });
    jQuery("form.ShopPropertiesFilterForm .FilterType_text ").keyup(function(){
        clearTimeout(shopItemsListTimer);
        shopItemsListTimer = setTimeout(getShopItemsList, shopItemsListTime);
    });
    
    jQuery('form.ShopPropertiesFilterForm .FilterType_intRange').keypress(function(e) {
        if (!(e.which==8 || e.which==44 ||e.which==45 ||e.which==46 ||(e.which>47 && e.which<58))) return false;
    });
});
</script>


<?php
include_once './components/Shop/classes/ShopIncludeClasses.php';
ShopIncludeClasses::includeAllClasses();

global $shopNavigationPanel;
if(!isset($shopNavigationPanel) || $shopNavigationPanel === null) {
    $shopNavigationPanel = new ShopNavigationPanel();
}