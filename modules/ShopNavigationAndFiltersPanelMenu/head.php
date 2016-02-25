<script type="text/javascript">
    jQuery(document).ready(function() {
        $(".ShopNavigationAndFiltersPanelMenuBlock .ShopNavigationAndFiltersPanelMenuElement").click(function(){
            if( $(this).hasClass("thisOpen") ) {
                CloseContentLeftPanel();
            } else {
                ShowContentLeftPanel($(this).attr('blockId'));
            }
        });
        
        $("#ShopNavigationAndFiltersPanelButtonClose").click(function(){
            CloseContentLeftPanel();
        });
        
        ShowHideContentLeftPanelOnLoad();
        
    });
    
    function ShowContentLeftPanel(blockId) {
        $('.ShopNavigationAndFiltersPanelMenuBlock .ShopNavigationAndFiltersPanelMenuElement').removeClass("thisOpen");
        $('.ShopNavigationAndFiltersPanelMenuElement.me' + blockId).addClass("thisOpen");
        $('.ShopNavigationAndFiltersPanelElement').hide();
        $('.ShopNavigationAndFiltersPanelElement.' + blockId).show();
        ShowHideContentLeftPanel(true);
        $('.ShopNavigationAndFiltersPanelMenuBlock .ShopNavigationAndFiltersPanelMenuElement.closeButton').show();
        $.cookie('ContentLeftPanelOnLoad', blockId, { expires: 1, path: '/' });
    }
    
    function CloseContentLeftPanel() {
        $('.ShopNavigationAndFiltersPanelMenuBlock .ShopNavigationAndFiltersPanelMenuElement').removeClass("thisOpen");
        ShowHideContentLeftPanel(false);
        $('.ShopNavigationAndFiltersPanelElement').hide();
        $.cookie('ContentLeftPanelOnLoad', 'Hide', { expires: 1, path: '/' });
    }
    
    function ShowHideContentLeftPanel(show) {
        if( $('.Wraper .ContentMainBlock .ContentMainBlockLeft').hasClass("leftPanelShown") ) {
            if(!show) {
                $('.Wraper .ContentMainBlock .ContentMainBlockLeft').removeClass("leftPanelShown");
                $('.Wraper .ContentMainBlock .ContentMainBlockRight').removeClass("leftPanelShown");
                $('.Wraper .ContentMainBlock .ContentMainBlockLeft').removeClass("CatalogList");
                $('.Wraper .ContentMainBlock .ContentMainBlockRight').removeClass("CatalogList");
                $('.Wraper .ContentMainBlock .ContentMainBlockLeft').removeClass("NoCatalogList");
                $('.Wraper .ContentMainBlock .ContentMainBlockRight').removeClass("NoCatalogList");
            }
        } else {
            if(show) {
                $('.Wraper .ContentMainBlock .ContentMainBlockLeft').addClass("leftPanelShown");
                $('.Wraper .ContentMainBlock .ContentMainBlockRight').addClass("leftPanelShown");
                if($('*').is('.c_block.Shop .ShopItemsListBlock .ShopItemsList')) {
                    $('.Wraper .ContentMainBlock .ContentMainBlockLeft').addClass("CatalogList");
                    $('.Wraper .ContentMainBlock .ContentMainBlockRight').addClass("CatalogList");
                } else {
                    $('.Wraper .ContentMainBlock .ContentMainBlockLeft').addClass("NoCatalogList");
                    $('.Wraper .ContentMainBlock .ContentMainBlockRight').addClass("NoCatalogList");
                }
            }
        }
    }
    
    function ShowHideContentLeftPanelOnLoad() {
        var condition=$.cookie('ContentLeftPanelOnLoad');
        if(!navigator.cookieEnabled || typeof condition === "undefined" || condition=="" || condition=="Hide") {
            CloseContentLeftPanel();
        } else {
            if($('*').is('.c_block.Shop .ShopItemsListBlock .ShopItemsList')) {
                ShowContentLeftPanel(condition);
            }
        }
    }

</script>
<link rel="stylesheet" href="./modules/ShopNavigationAndFiltersPanelMenu/css/ShopNavigationAndFiltersPanelMenu.css" type="text/css" />