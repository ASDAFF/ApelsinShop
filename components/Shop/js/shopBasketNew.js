/*~~~~~~~~~~~~~~~~ ПЕРЕМЕННЫЕ ~~~~~~~~~~~~~~~~*/
var displayOneItemInBasketTimer;
var displayOneItemInBasketTime = 2000;
var correctShopItemZeroAmountTimer;
var correctShopItemZeroAmountTime = 500;



/*~~~~~~~~~~~~~~~~ ФУНКЦИИ ВСПОМОГАТЕЛЬНЫЕ ~~~~~~~~~~~~~~~~*/
// Перзаписываем количество товаров в модуле корзины
function getShopItemAmountBuy() {
    $.ajax({
        type: "POST",
        url: "./components/Shop/script/getShopItemAmountBuy.php",
        cache: false,
        success: function(result) {
            $(".ShopBasketModuleBlockBasketUnit").html(result);
        }
    });
}
// Перзаписываем общуюу стоимость корзины для модуля и компоненты корзины
function getCurentTotalInBasket() {
    $.ajax({
        type: "POST",
        url: "./components/Shop/script/getCurentTotalInBasket.php",
        cache: false,
        success: function(result) {
            $(".ShopBasketModuleBlockBasket .ShopBasketModuleBlockBasketTotal").html(result);
            $(".ShopBasketBlock .ShopBasketItemPayInfoBlock .price").html(result);
        }
    });
}
// Перзаписываем общуюу стоимость корзины для модуля и компоненты корзины
function getCurentItemTotalInBasket(id) {
    $.ajax({
        type: "POST",
        url: "./components/Shop/script/getCurentItemTotalInBasket.php",
        cache: false,
        data: {
            "id":id
        },
        success: function(result) {
            $("#allPriceValue_" + id).html(result);
        }
    });
}
// Удаляет кнопку добавления товара в корзину и показывает кнопку "товар в корзине"
function showShopItemBasketButton () {
    $('.ShopItemBuyButtonBlock.BuyBlock').remove();
    $('.ShopItemBuyButtonBlock.BasketBlock').show();
}
// Всплывающее окно с товаром в корзине
function displayOneItemInBasket(id, amount) {
    $.ajax({
        type: "POST",
        url: "./modules/ShopBasket/script/oneItemInBasket.php",
        cache: false,
        data: {
            "id":id,
            "amount":amount
        },
        success: function(result) {
                    $('#ShopBasketModuleOneItemInBasket').html(result);
                    clearTimeout(displayOneItemInBasketTimer);
                    correctShopItemZeroAmountTimer = setTimeout(animateOneItemInBasketHide, displayOneItemInBasketTime);
                }
    });
    return false;
};
// Анимация исчезновения блока с добавленным товаром
function animateOneItemInBasketHide() {
    $("#ShopBasketModuleOneItemInBasket").animate({ opacity: "hide" }, 2000);
}
// Удаляем HTML блок с товаром
function deleteItem(item) {
    getCurentTotalInBasket();
    getShopItemAmountBuy();
    $('#ShopBasketItemBlock_' + item).remove();
}



/*~~~~~~~~~~~~~~~~ ФУНКЦИИ ОСНОВНЫЕ ~~~~~~~~~~~~~~~~*/
// Добавляет товар в корзину
function addItemInBasket (id) {
    var amount = $(".shopItemAmountBuy").val();
    $.ajax({
        type: "POST",
        url: "./components/Shop/script/shopItemAmountBuy.php",
        data: {
            "id":id,
            "amount":amount
        },
        cache: false,
        success: function() {
                showShopItemBasketButton ();
                getCurentTotalInBasket();
                getShopItemAmountBuy();
                displayOneItemInBasket(id, amount);
       }
    });
    return false;
};
// очищение корзины
function shopBasketClearItems() {
    $.ajax({
        url: "./components/Shop/script/shopBasketItemClearButton.php",
        cache: false,
        success:  function() {
            $('.ShopBasketBlock').remove();
            $('.ShopBasketBlockEmpty').css('display', 'block');
            getCurentTotalInBasket();
            getShopItemAmountBuy();
        }
    });
    return false;
};
// удаление товара из корзины
function deleteItemInBasket(id) {
    var countUnit = $(".ShopBasketModuleBlockBasketUnit").html();
    if (confirm("Вы подтверждаете удаление товара?")) {
        $.ajax({
            type: "POST",
            url: "./components/Shop/script/shopItemDeleteItem.php",
            data: {
                "id":id
            },
            cache: false,
            success:  function() {
                $('.ShopBasketModuleBlockBasketUnit').html(--countUnit);
                if (countUnit > 0) {
                    deleteItem(id);
                } else {
                    shopBasketClearItems();
                }
            }
        });
        return false;
    }
};
// обновление товара
function updateItemInBasket(id, amount) {
    $.ajax({
        type: "POST",
        url: "./components/Shop/script/shopItemUpdateItem.php",
        data: {
            "id":id,
            "amount":amount
        },
        cache: false,
        success: function() {
            getCurentTotalInBasket();
            getCurentItemTotalInBasket(id);
        }
    });
    return false;
};
// Корректировка значения количества для одного товара
function correctShopItemZeroAmount(obj,id) {
    $(obj).val('1');
    updateItemInBasket(id,'1');
}
// Корректировка значения количества для всех товаров
function correctShopItemAmountBuy() {
    $('.shopItemAmountBuy').each(function() {
        var thisVal = parseInt($(this).val());
        if (isNaN(thisVal) || thisVal < 1) {
            var id = $(this).attr('id');
            correctShopItemZeroAmount(this,id);
        }
    });
}
// обрабртка данных из формы подтверждения заказа
function shopOrderFormHandling() {
    var data = $('.shopOrderFormMain').serialize();
    $.ajax({
        type: "POST",
        url: "./components/Shop/script/shopOrderFormHandling.php",
        cache: false,
        data: data,
        success: function(result) {
               $('.shopOrderFormMain').html(result);
            }
    });
    return false;
};


/*~~~~~~~~~~~~~~~~ СОБЫТИЯ ~~~~~~~~~~~~~~~~*/
jQuery(document).ready(function() {
    
    jQuery('#shopItemAmountBuyDelButton').click(function() {
        var inputValue = $('#shopItemAmountBuy').val();
        var amount = --inputValue;
        if (amount < 1) {
            amount = 1;
        }
        $('#shopItemAmountBuy').val(amount);
    });

    jQuery('#shopItemAmountBuyAddButton').click(function() {
        var inputValue = $('#shopItemAmountBuy').val();
        var amount = ++inputValue;
        $('#shopItemAmountBuy').val(amount);
    });
    
    
    // обработка кнопка "КУПИТЬ" - в "ТОВАР В КОРЗИНЕ"
    jQuery('.ShopItemBuy').click(function() {
        var id = $(this).attr('id');
        addItemInBasket(id);
    });
    // очищение корзины
    jQuery('.ShopBasketItemClearButton').click(function() {
        shopBasketClearItems();
    });
    // удаление товара из корзины
    jQuery('.DeleteButtonBlock').click(function() {
        var id = $(this).attr('idDel');
        deleteItemInBasket(id);
    });
    
    // обработка кнопки "-" в корзине
    jQuery('.shopItemAmountBuyDelButton').click(function() {
        var itemID = $(this).attr("itemID");
        var itemVal = $('#' + itemID).val();
        var amount = --itemVal;
        if(amount > 0) {
            $('#' + itemID).val(amount);
        } else {
            amount = 1;
        }
        updateItemInBasket(itemID, amount) ;
    });
    // обработка кнопки "+" в корзине
    jQuery('.shopItemAmountBuyAddButton').click(function() {
        var itemID = $(this).attr("itemID");
        var itemVal = $('#' + itemID).val();
        var amount = ++itemVal;
        $('#' + itemID).val(amount);
        updateItemInBasket(itemID, amount) ;
    });
    // обработка незаполненного поля input
    jQuery(document).click(function() {
        correctShopItemAmountBuy();
    });
    // обработка заполненного поля input
    jQuery('.shopItemAmountBuy').keyup(function() {
        var id = $(this).attr('id');
        var amount = parseInt($(this).val());
        clearTimeout(correctShopItemZeroAmountTimer);
        if (isNaN(amount) || amount < 1) {
            correctShopItemZeroAmountTimer = setTimeout(correctShopItemZeroAmount, correctShopItemZeroAmountTime, this, id);
        } else {
            correctShopItemZeroAmountTimer = setTimeout(updateItemInBasket, correctShopItemZeroAmountTime, id, amount);
        }
    });
    // печать PDF - файла, очищение корзины, переход на главную
    jQuery('#openFilePDF').click(function() {
        shopOrderFormHandling();
        shopBasketClearItems();
    });
});