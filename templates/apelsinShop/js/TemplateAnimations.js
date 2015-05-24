jQuery(document).ready(function() {
 
    jQuery(".to-top").click(function(){ 
        jQuery('html, body').animate({scrollTop: "0px"}, 500);
    });
    
    jQuery(".BeforeContentButtonText").click(function(){ 
        if($(".BeforeContentButtonText").hasClass("HideText")) {
            $('.BeforeContentButtonText').removeClass('HideText');
            $('.BeforeContentButtonText').addClass('ShowText');
            $('.BeforeContentWraper').hide("normal");
//            $('.BeforeContentWraper').fadeOut(300);
        } else {
            $('.BeforeContentButtonText').removeClass('ShowText');
            $('.BeforeContentButtonText').addClass('HideText');
            $('.BeforeContentWraper').show("normal");
//            $('.BeforeContentWraper').fadeIn(300);
        }
        
        
//        jQuery('.BeforeContentWraper').hide();
    });
    
    jQuery(".BeforeContentButtonText.ShowText").click(function(){ 
        alert('test');
//        jQuery('.BeforeContentButtonText').removeClass('ShowText');
//        jQuery('.BeforeContentButtonText').addClass('HideText');
//        jQuery('.BeforeContentWraper').show();
    });
 
});