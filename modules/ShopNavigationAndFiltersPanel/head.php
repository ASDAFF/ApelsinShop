<?php
include_once './components/Shop/classes/ShopIncludeClasses.php';
ShopIncludeClasses::includeAllClasses();
?>
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
            var bloksWidth = 0;
            $(blockId).addClass('SHOWN');
            $(blockId).find('.ShopFilterGroupSelectElement').each(function (){
                bloksWidth += $(this).outerWidth(true);
            });
            bloksWidth += $(blockId).find('.ShopFilterGroupSelectElementsBlockCloseButton').outerWidth(true);
            if(bloksWidth > 480) {
                bloksWidth = 480;
            }
            $(blockId).width(bloksWidth);
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
    $(".ShopFilterGroupSelectShortValue .ShopFilterElementBlock").each(function() {
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

function unsetFilterValueForPropId(propertyId, update) {
    var filterType = $('#ShopFilterElementValueBlockConteiner_' + propertyId).attr('filterType');
    if(filterType == 'ItemName') {
        unsetFilterValue_ItemName(update);
    } else if (filterType == 'Action') {
        unsetFilterValue_Action(update);
    } else if (filterType == 'InStock') {
        unsetFilterValue_InStock(update);
    } else if(filterType == 'ItemPrise') {
        unsetFilterValue_ItemPrise(update);
    } else if(filterType == 'Subgroup') {
        unsetFilterValue_Subgroup(update);
    } else if(filterType == 'text') {
        unsetFilterValue_text($('#ShopFilterElementValueBlockConteiner_' + propertyId), update);
    } else if(filterType == 'select') {
        unsetFilterValue_select($('#ShopFilterElementValueBlockConteiner_' + propertyId), update);
    } else if(filterType == 'range') {
        unsetFilterValue_range($('#ShopFilterElementValueBlockConteiner_' + propertyId), update);
    } else if(filterType == 'groupSelect') {
        unsetFilterValue_groupSelect($('#ShopFilterElementValueBlockConteiner_' + propertyId), update);
    } else if(filterType == 'bool') {
        unsetFilterValue_bool($('#ShopFilterElementValueBlockConteiner_' + propertyId), update);
    }
}

function unsetFilterValueElementForPropId(propertyId, value, update) {
    var filterType = $('#ShopFilterElementValueBlockConteiner_' + propertyId).attr('filterType');
    if(filterType == 'groupSelect') {
        unsetFilterValue_groupSelectElement($('#ShopFilterElementValueBlockConteiner_' + propertyId),value);
    } else {
        if(update) {
            getShopItemsList();
        }
    }
}

function unsetFilterValue_bool(obj, update) {
    $(obj).find('.FilterTypeBool').removeAttr("checked");
    if(update) {
        getShopItemsList();
    }
}

function unsetFilterValue_groupSelect(obj, update) {
    $(obj).find('.FilterTypeGroupSelect').removeAttr("checked");
    $(obj).find('.ShopFilterGroupSelectShortValue div').html('');
    if(update) {
        getShopItemsList();
    }
}

function unsetFilterValue_groupSelectElement(obj, value, update) {
    $(obj).find('.FilterTypeGroupSelect').each(function () {
        if($(this).val() == value) {
            $(this).removeAttr("checked");
            setGroupSelectValueStringInBlock (this);
        }
    });
    if(update) {
        getShopItemsList();
    }
}

function unsetFilterValue_range(obj, update) {
    $(obj).find('.MINrange').val('');
    $(obj).find('.MAXrange').val('');
    if(update) {
        getShopItemsList();
    }
}

function unsetFilterValue_select(obj, update) {
    $(obj).find('.selectBox').val('');
    if(update) {
        getShopItemsList();
    }
}

function unsetFilterValue_text(obj, update) {
    $(obj).find('.FilterTypeText').val('');
    if(update) {
        getShopItemsList();
    }
}

function unsetFilterValue_ItemName(update) {
    $('.ShopFilterElementValueBlock #ItemName').val('');
    if(update) {
        getShopItemsList();
    }
}

function unsetFilterValue_Action(update) {
    $('.ShopFilterElementValueBlock #Action').val('all');
    if(update) {
        getShopItemsList();
    }
}

function unsetFilterValue_InStock(update) {
    $('.ShopFilterElementValueBlock #InStock').val('inStockAndOrder');
    if(update) {
        getShopItemsList();
    }
}

function unsetFilterValue_ItemPrise(update) {
    $('.ShopFilterElementValueBlock #ItemPrise_min').val('');
    $('.ShopFilterElementValueBlock #ItemPrise_max').val('');
    if(update) {
        getShopItemsList();
    }
}

function unsetFilterValue_Subgroup(update) {
    var thisGroup = '<?php echo ShopPageInfoHelper::shopPageGroupId();?>';
    if(thisGroup == '') {
        thisGroup = 'SYSTEM_ROOT_GROUP';
    }
    $('.ShopFilterElementValueBlock #Subgroup').val(thisGroup);
    if(update) {
        getShopItemsList();
    }
}


function cleanAllFiltersValueInPanel() {
    $(".ShopPropertiesFilterForm .ShopFilterElementBlock").each(function() {
        var propertyId = $(this).attr('propertyId');
        unsetFilterValueForPropId(propertyId, false);
        updateShopItemsList();
    });
}

</script>

<?php
global $ShopNavigationAndFiltersPanel;
if(!isset($ShopNavigationAndFiltersPanel) || $ShopNavigationAndFiltersPanel === null) {
    $ShopNavigationAndFiltersPanel = new ShopNavigationAndFiltersPanel();
}
// AJAX добавление товаров в список при прокрутке страницы
echo ShopJsHelper::shopSearchResoultForScrols();