<script type="text/javascript">

function updateBasket() {
    $.ajax({
        url: "./modules/ShopBasket/script/updateBasket.php",
        cache: false,
        success: function(result) {
               $('#ShopBasketModule').html(result);
            }
    });
    return false;
};

</script>
<?php
