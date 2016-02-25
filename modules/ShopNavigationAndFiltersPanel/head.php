<script type="text/javascript">
var shopItemsListTimer; // Таймер для запроса данных по задержке;
var shopItemsListTime = 2000; // время на задержку при запросе данных;
var shopItemsListTimeShort = 500; // время на задержку при запросе данных;
var shopItemsPageLoadTimer; // Таймер для запроса данных по задержке;
var shopItemsPageLoadTime = 1000; // время на задержку при запросе данных;
var loadPageTrigger = true; // время на задержку при запросе данных;
var ShopFilterGroupSelectShortValueTextLimit = 100;
    
jQuery(document).ready(function() {

    cutLongStringAll();
    
    jQuery("form.ShopPropertiesFilterForm .selectBox").change(function(){
        clearTimeout(shopItemsListTimer);
        getShopItemsList();
    });
    jQuery("form.ShopPropertiesFilterForm .FilterTypeBool").change(function(){
        clearTimeout(shopItemsListTimer);
        getShopItemsList();
    });
    jQuery("form.ShopPropertiesFilterForm .FilterTypeGroupSelect").change(function(){
        setGroupSelectValueStringInBlock(this);
        clearTimeout(shopItemsListTimer);
        shopItemsListTimer = setTimeout(getShopItemsList, shopItemsListTimeShort);
    });
    jQuery("form.ShopPropertiesFilterForm .FilterTypeRange ").keyup(function(){
        clearTimeout(shopItemsListTimer);
        shopItemsListTimer = setTimeout(getShopItemsList, shopItemsListTime);
    });
    jQuery("form.ShopPropertiesFilterForm .ScalingSelect").change(function(){
        clearTimeout(shopItemsListTimer);
        getShopItemsList();
    });
    jQuery("form.ShopPropertiesFilterForm .FilterTypeText ").keyup(function(){
        clearTimeout(shopItemsListTimer);
        shopItemsListTimer = setTimeout(getShopItemsList, shopItemsListTime);
    });
    
    jQuery('form.ShopPropertiesFilterForm .FilterTypeRange').keypress(function(e) {
        if (!(e.which==8 || e.which==46 ||(e.which>47 && e.which<58))) return false;
//        if (!(e.which==8 || e.which==44 ||e.which==45 ||e.which==46 ||(e.which>47 && e.which<58))) return false;
    });
    
    jQuery('.shopItemAmountBuy').keypress(function(e) {
        if (!(e.which == 8 || (e.which > 47 && e.which < 58))) return false;
    });
    
    
    jQuery('.ShopFilterGroupSelectShortValueMoreButton').click(function(){
        var blockId = '#' + $(this).attr('blockId');
        var show = !$(blockId).hasClass('SHOWN');
        $('.ShopFilterGroupSelectElementsBlock').removeClass('SHOWN');
        if(show) {
            $(blockId).addClass('SHOWN');
        }
    });
    jQuery('.ShopFilterGroupSelectElementsBlockCloseButton').click(function(){
        $('.ShopFilterGroupSelectElementsBlock').removeClass('SHOWN');
    });
    
    jQuery('.ShopFilterElementUnsetButton').click(function(){
        var propertyId = $(this).attr('propertyId');
        unsetFilterValueForPropId(propertyId);
    });
});

function cutLongStringAll(){
    $(".ShopFilterGroupSelectShortValue div").each(function() {
        cutLongString($(this), ShopFilterGroupSelectShortValueTextLimit, true);
    });
}

/**
* Функция для сокращения длинного текста
* @var object element - элемент, в котором необходимо укоротить текст
* @var int count_lit - лимит символов
* @var bool light - true|false задать осветление последних символов или нет
*/
function cutLongString(element, count_lit, light){
    var text = element.html();
    var all_len = text.length;
    var new_text;
    if (all_len > count_lit){
        new_text = text.substr(0, (count_lit - 3)) + '...';
        if(light){
            var first_part_text = new_text.substr(0, (count_lit - 10));
            var light_part_text = new_text.substr((count_lit - 10), count_lit);
            var light_text = "";
            var array_color = ["#444444", "#545454", "#646464", "#747474", "#848484", "#949494", "#a4a4a4", "#b4b4b4", "#c4c4c4", "#d4d4d4"];
            for(var i = 0; i < 10; i ++){
                light_text += "<span style='color: " + array_color[i] + "'>" + light_part_text.substr(i, 1) + "</span>";
            }
            new_text = first_part_text + light_text;
        }
        element.html(new_text);
    }
}


function unsetLoadPageTrigger(){
    loadPageTrigger = true;
    var clientHeight = document.documentElement.clientHeight ? document.documentElement.clientHeight : document.body.clientHeight;
    var documentHeight = document.documentElement.scrollHeight ? document.documentElement.scrollHeight : document.body.scrollHeight;
    var scrollTop = window.pageYOffset ? window.pageYOffset : (document.documentElement.scrollTop ? document.documentElement.scrollTop : document.body.scrollTop);
    if((documentHeight - clientHeight) <= scrollTop + 200 ) {
        scrolling();
    }
}

function setGroupSelectValueStringInBlock (obj) {
    var ShortBlockId = $(obj).attr('ShortBlockId');
    var ThisBlockId = $(obj).attr('ThisBlockId');
    var valString = '';
    $("#"+ThisBlockId + ' .FilterTypeGroupSelect').each(function() {
        if($(this).is(':checked')) {
            valString = valString + $(this).val() + ", ";
        }
    });
    $("#"+ShortBlockId+ " .ShopFilterGroupSelectShortValue div").html(valString);
    cutLongString($("#"+ShortBlockId+ " .ShopFilterGroupSelectShortValue div"), ShopFilterGroupSelectShortValueTextLimit, true);
}

function unsetFilterValueForPropId(propertyId) {
    var filterType = $('#ShopFilterElementValueBlockConteiner_' + propertyId).attr('filterType');
    if(filterType == 'ItemName') {
        unsetFilterValue_ItemName();
    } else if (filterType == 'Action') {
        unsetFilterValue_Action();
    } else if (filterType == 'InStock') {
        unsetFilterValue_InStock();
    } else if(filterType == 'ItemPrise') {
        unsetFilterValue_ItemPrise();
    } else if(filterType == 'Subgroup') {
        unsetFilterValue_Subgroup();
    } else if(filterType == 'text') {
        unsetFilterValue_text($('#ShopFilterElementValueBlockConteiner_' + propertyId));
    } else if(filterType == 'select') {
        unsetFilterValue_select($('#ShopFilterElementValueBlockConteiner_' + propertyId));
    } else if(filterType == 'range') {
        unsetFilterValue_range($('#ShopFilterElementValueBlockConteiner_' + propertyId));
    } else if(filterType == 'groupSelect') {
        unsetFilterValue_groupSelect($('#ShopFilterElementValueBlockConteiner_' + propertyId));
    } else if(filterType == 'bool') {
        unsetFilterValue_bool($('#ShopFilterElementValueBlockConteiner_' + propertyId));
    }
}

function unsetFilterValueElementForPropId(propertyId, value) {
    var filterType = $('#ShopFilterElementValueBlockConteiner_' + propertyId).attr('filterType');
    if(filterType == 'groupSelect') {
        unsetFilterValue_groupSelectElement($('#ShopFilterElementValueBlockConteiner_' + propertyId),value);
    } else {
        getShopItemsList();
    }
}

function unsetFilterValue_bool(obj) {
    $(obj).find('.FilterTypeBool').removeAttr("checked");
    getShopItemsList();
}

function unsetFilterValue_groupSelect(obj) {
    $(obj).find('.FilterTypeGroupSelect').removeAttr("checked");
    $(obj).find('.ShopFilterGroupSelectShortValue div').html('');
    getShopItemsList();
}
function unsetFilterValue_groupSelectElement(obj, value) {
    $(obj).find('.FilterTypeGroupSelect').each(function () {
        if($(this).val() == value) {
            $(this).removeAttr("checked");
            setGroupSelectValueStringInBlock (this);
        }
    });
    getShopItemsList();
}

function unsetFilterValue_range(obj) {
    $(obj).find('.MINrange').val('');
    $(obj).find('.MAXrange').val('');
    getShopItemsList();
}

function unsetFilterValue_select(obj) {
    $(obj).find('.selectBox').val('');
    getShopItemsList();
}

function unsetFilterValue_text(obj) {
    $(obj).find('.FilterTypeText').val('');
    getShopItemsList();
}

function unsetFilterValue_ItemName() {
    $('.ShopFilterElementValueBlock #ItemName').val('');
    getShopItemsList();
}

function unsetFilterValue_Action() {
    $('.ShopFilterElementValueBlock #Action').val('all');
    getShopItemsList();
}

function unsetFilterValue_InStock() {
    $('.ShopFilterElementValueBlock #InStock').val('inStockAndOrder');
    getShopItemsList();
}

function unsetFilterValue_ItemPrise() {
    $('.ShopFilterElementValueBlock #ItemPrise_min').val('');
    $('.ShopFilterElementValueBlock #ItemPrise_max').val('');
    getShopItemsList();
}

function unsetFilterValue_Subgroup() {
    var thisGroup = '<?php echo ShopPageInfoHelper::shopPageGroupId();?>';
    if(thisGroup == '') {
        thisGroup = 'SYSTEM_ROOT_GROUP';
    }
    $('.ShopFilterElementValueBlock #Subgroup').val(thisGroup);
    getShopItemsList();
}
</script>

<?php
include_once './components/Shop/classes/ShopIncludeClasses.php';
ShopIncludeClasses::includeAllClasses();

global $ShopNavigationAndFiltersPanel;
if(!isset($ShopNavigationAndFiltersPanel) || $ShopNavigationAndFiltersPanel === null) {
    $ShopNavigationAndFiltersPanel = new ShopNavigationAndFiltersPanel();
}
// AJAX добавление товаров в список при прокрутке страницы
echo ShopJsHelper::shopSearchResoultForScrols();