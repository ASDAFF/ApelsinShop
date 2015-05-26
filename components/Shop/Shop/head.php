<script type="text/javascript">
function getShopItemAmountBuy(id) {  
    var amount = document.getElementById("shopItemAmountBuy").value;
    $.ajax({
        type: "POST",
        url: "./components/Shop/script/shopItemAmountBuy.php",
        data: {"id":id,
                "amount":amount
                },
        cache: false,						
        success: function(result) {
               $('.ShopItemBuyButtonBlock').html(result);
       }
    });
    return false;	
};
</script>
<?php
include_once './components/Shop/classes/ShopIncludeClasses.php';
ShopIncludeClasses::includeAllClasses();