<script type="text/javascript">
var shopItemsListTimer; // Таймер для запроса данных по задержке;
var shopItemsListTime = 2000; // время на задержку при запросе данных;
var shopItemsListPage = 1;
    
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

$(document).on("scroll", scrolling);

function scrolling(){
    if(shopItemsListThisPage < shopItemsListLastPage) {
        
        var clientHeight = document.documentElement.clientHeight ? document.documentElement.clientHeight : document.body.clientHeight;
        var documentHeight = document.documentElement.scrollHeight ? document.documentElement.scrollHeight : document.body.scrollHeight;
        var scrollTop = window.pageYOffset ? window.pageYOffset : (document.documentElement.scrollTop ? document.documentElement.scrollTop : document.body.scrollTop);
     
        if((documentHeight - clientHeight) <= scrollTop + 200 ) {
            getShopItemListPage();
        }
    }
}


</script>


<?php
include_once './components/Shop/classes/ShopIncludeClasses.php';
ShopIncludeClasses::includeAllClasses();

global $shopNavigationPanel;
if(!isset($shopNavigationPanel) || $shopNavigationPanel === null) {
    $shopNavigationPanel = new ShopNavigationPanel();
}