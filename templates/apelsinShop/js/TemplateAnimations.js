jQuery(document).ready(function() {
 
    jQuery(".to-top").click(function(){ 
        jQuery('html, body').animate({scrollTop: "0px"}, 500);
    });
    
    jQuery(".BeforeContentButtonText").click(function(){ 
        if($(".BeforeContentButtonText").hasClass("HideText")) {
            $('.BeforeContentButtonText').removeClass('HideText');
            $('.BeforeContentButtonText').addClass('ShowText');
            $('.BeforeContentWraper').hide("normal");
        } else {
            $('.BeforeContentButtonText').removeClass('ShowText');
            $('.BeforeContentButtonText').addClass('HideText');
            $('.BeforeContentWraper').show("normal");
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
});

// Requires jQuery!
jQuery.ajax({
            url: "http://compuproject.com:8085/s/6592ff192f8e5fd64268f5f0ab3fe646-T/ru_RU382ewm/64020/4/1.4.25/_/download/batch/com.atlassian.jira.collector.plugin.jira-issue-collector-plugin:issuecollector-embededjs/com.atlassian.jira.collector.plugin.jira-issue-collector-plugin:issuecollector-embededjs.js?locale=ru-RU&collectorId=7015c86e",
        type: "get",
    cache: true,
    dataType: "script"
});