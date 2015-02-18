<script type="text/javascript" src="./modules/authorizationUserPanel/js/LoginPanel.js"></script>
<link rel="stylesheet" href="./modules/authorizationUserPanel/css/AuthorizationForm.css" type="text/css" />

<script type='text/javascript'>
    function DropDownLoginPanel(el) {
        this.LoginPanelBlock = el;
        this.initEvents();
    }
    
    DropDownLoginPanel.prototype = {
        initEvents : function() {
            var obj = this;
            obj.LoginPanelBlock.on('click', function(event){
                $(this).toggleClass('active');
                $('.LoginPanelBlock').addClass('active');
                event.stopPropagation();
            });	
        }
    }
    
    $(function() {
        var LoginPanelBlock = new DropDownLoginPanel( $('#LoginPanelBlock') );
        $(document).click(function() {
            // all dropdowns
            $('.LoginPanelBlock').removeClass('active');
        });

    });
</script>