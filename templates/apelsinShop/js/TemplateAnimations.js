jQuery(document).ready(function() {
 
    jQuery(".to-top").click(function(){ 
        jQuery('html, body').animate({scrollTop: "0px"}, 500);
    });
    
    jQuery(".BeforeContentButtonText").click(function(){ 
        if($(".BeforeContentButtonText").hasClass("HideText")) {
            hideBeforeContentWraper(true);
        } else {
            showBeforeContentWraper(true);
        }
    });
    
    jQuery(".shopNavigationPanelSwitchButtonToFilter").click(function(){
        if($(".shopNavigationPanelSwitchButtonToFilter").hasClass("noChecked")) {
            $('.shopNavigationPanelSwitchButtonToFilter').removeClass('noChecked');
            $('.shopNavigationPanelSwitchButtonToFilter').addClass('checked');
            $('.shopNavigationPanelSwitchButtonToMenu').removeClass('checked');
            $('.shopNavigationPanelSwitchButtonToMenu').addClass('noChecked');
            $('.ShopNavigationPanel_Menu').hide("normal");
            $('.ShopNavigationPanel_Filter').show("normal");
        }
    });
    
    jQuery(".shopNavigationPanelSwitchButtonToMenu").click(function(){
        if($(".shopNavigationPanelSwitchButtonToMenu").hasClass("noChecked")) {
            $('.shopNavigationPanelSwitchButtonToMenu').removeClass('noChecked');
            $('.shopNavigationPanelSwitchButtonToMenu').addClass('checked');
            $('.shopNavigationPanelSwitchButtonToFilter').removeClass('checked');
            $('.shopNavigationPanelSwitchButtonToFilter').addClass('noChecked');
            $('.ShopNavigationPanel_Filter').hide("normal");
            $('.ShopNavigationPanel_Menu').show("normal");
        }
    });
    
    jQuery(".ShopPropertiesFilterBlockName").click(function(){
        var blockID = $(this).attr('blockID');
        if($(this).hasClass("clicked")) {
            $('#' + blockID).hide("normal");
            $(this).removeClass('clicked');
        } else {
            $('#' + blockID).show("normal");
            $(this).addClass('clicked');
        }
    });
    ShowHideBeforeContentWraper();
    $(window).scroll(function() {
        var top = $(document).scrollTop();
        if (top > 100) {
            $(".Wraper .MenuWraper").addClass('sticky');
        } else {
            $(".Wraper .MenuWraper").removeClass('sticky');
        }
    });
});

function ShowHideBeforeContentWraper() {
    var condition=$.cookie('BeforeContentWraperСondition');
    if(!navigator.cookieEnabled || typeof condition === "undefined" || condition=="" || condition=="Show") {
        showBeforeContentWraper(false);
    } else {
        hideBeforeContentWraper(false);
    }
}

function hideBeforeContentWraper(animate) {
    $('.BeforeContentButtonText').removeClass('HideText');
    $('.BeforeContentButtonText').addClass('ShowText');
    if(animate) {
        $('.BeforeContentWraper').hide("normal");
    } else {
        $('.BeforeContentWraper').hide();
    }
    $.cookie('BeforeContentWraperСondition', 'Hide', { expires: 1, path: '/' });
}
function showBeforeContentWraper(animate) {
    $('.BeforeContentButtonText').removeClass('ShowText');
    $('.BeforeContentButtonText').addClass('HideText');
    if(animate) {
        $('.BeforeContentWraper').show("normal");
    } else {
        $('.BeforeContentWraper').show();
    }
    $.cookie('BeforeContentWraperСondition', 'Show', { expires: 1, path: '/' });
}