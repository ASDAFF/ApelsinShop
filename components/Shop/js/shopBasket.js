// хранит текущее значение количества товара
var oldValue = 0;
var correctShopItemZeroAmountTimer; // Таймер для запроса данных по задержке;
var correctShopItemZeroAmountTime = 1000; // время на задержку при запросе данных;

jQuery(document).ready(function() { 
    
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
        // редактируем
        editBasket(amount, itemID); 
    });  
    
    // обработка кнопки "+" в корзине
    jQuery('.shopItemAmountBuyAddButton').click(function() {
        var itemID = $(this).attr("itemID");
        var itemVal = $('#' + itemID).val();
        var amount = ++itemVal;
        $('#' + itemID).val(amount);
        // редактируем
        editBasket(amount, itemID); 
    });
    
    // обработка незаполненного поля input
    jQuery(document).click(function() {
        correctShopItemAmountBuy();
    });
    
    // обработка заполненного поля input
    $('.shopItemAmountBuy').keyup(function() {
        var id = $(this).attr('id');
        // получаем значение input            
        var amount = parseInt($(this).val());
        clearTimeout(correctShopItemZeroAmountTimer);
        if (isNaN(amount) || amount < 1) {
            correctShopItemZeroAmountTimer = setTimeout(correctShopItemZeroAmount, correctShopItemZeroAmountTime, this, id);
        } else {
            editBasket(amount, id);
        }
        return false; 
    });
    
    // обработка кнопка "КУПИТЬ" - в "ТОВАР В КОРЗИНЕ"
    jQuery('.ShopItemBuy').click(function() {
        var id = $(this).attr('id');
        correctShopItemAmountBuy();
        getShopItemAmountBuy(id);
    });
    
    jQuery('.ShopBasketItemBuyButton').click(function() {
        clearTimeout(correctShopItemZeroAmountTimer);
        correctShopItemAmountBuy();
    });
    
    // удаление товара из корзины
    jQuery('.DeleteButtonBlock').click(function() {
        var id = $(this).attr('idDel');
        deleteItemAndChangeTotal(id);
    });
    
});

function correctShopItemZeroAmount(obj,id) {
    $(obj).val(1);
    var amount = 1;
    editBasket(amount, id);
    return false;
}

function correctShopItemAmountBuy() {
    $('.shopItemAmountBuy').each(function() {
        var thisVal = parseInt($(this).val());
        if (isNaN(thisVal) || thisVal < 1) {
            var id = $(this).attr('id');
            $(this).val('1');
            editBasket('1', id);
        } 
    });
}

// ----------- кнопка "КУПИТЬ" - в "ТОВАР В КОРЗИНЕ" ---------    
function getShopItemAmountBuy(id) { 
    var amount = $("#shopItemAmountBuy").val();
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

// ---------- РАБОТА В КОРЗИНЕ -----------------
// редактирование товара в корзине
function updateItemAndChangeTotal(id, amount) {  
    $.ajax({
        type: "POST",
        url: "./components/Shop/script/shopItemUpdateItem.php",
        data: {"id":id,
                "amount":amount 
                },
        cache: false,						
        success: function() {
                    getSubTotal(id, amount);
                }      
    });
    return false;	
};

// перезаписывание количества товара в корзине
function editBasket(amount, id) {
    if (oldValue !== amount) {
        oldValue = amount; 
        updateItemAndChangeTotal(id, amount); 
    }
}

// новый подитог
function getSubTotal(id, amount) {
    var cost; var newSubtotal; var oldSubtotal;
    // получаем старый подитог
    oldSubtotal = $("#allPriceValue_" + id).html();
    // получаем стоимость
    cost = $("#priceValue_" + id).html();
    // вычисляем новый подитог
    newSubtotal = cost * amount;
    // записываем его
    $("#allPriceValue_" + id).html(newSubtotal);
    // вычисляем разницу между итогами 
    var dif = oldSubtotal - newSubtotal;
    // вычисляем новый итог
    setTotal(dif);
}

// новый итог
function setTotal(dif) {
    var oldTotal; var total;
    // получаем старый итог
    oldTotal = $(".price").html();
    // вычисляем новый итог
    total = oldTotal - dif;
    // записываем его
    if (isNaN(total)) {
        $('.price').html(oldTotal);
    } else {
        $('.price').html(total);
    }
}

//----------  СЧЕТЧИК  для покупки ОДНОГО товара -----------
$( document ).ready(function() {
    var inputValue; var amount;
    $('#shopItemAmountBuyDelButton').click(function() {
        inputValue = $('#shopItemAmountBuy').val();
        amount = --inputValue;
        if (amount < 1) {
            amount = 1;
        }
        $('#shopItemAmountBuy').val(amount);
    });

    $('#shopItemAmountBuyAddButton').click(function() {
        inputValue = $('#shopItemAmountBuy').val();
        amount = ++inputValue;
        $('#shopItemAmountBuy').val(amount);
    });
});

// --------- УДАЛЕНИЕ ----------
// удаление товара из корзины
function deleteItemAndChangeTotal(id) {
    if (confirmDelete()) {
        $.ajax({
            type: "POST",
            url: "./components/Shop/script/shopItemDeleteItem.php",
            data: {"id":id },
            cache: false,						
            success:  function() {
                        deleteItem(id);
                    }      
        });
        return false;
    }
};

// уточнение удаления товара
function confirmDelete() {
    if (confirm("Вы подтверждаете удаление?")) {
        return true;
    } else {
        return false;
    }
}

// удаление блок с "нулевым товаром"
function deleteItem(item) {
    var oldSubtotal;
    // получаем старый подитог
    oldSubtotal = $("#allPriceValue_" + item).html();
    // вычисляем новый итог
    setTotal(oldSubtotal);
    // удаляем блок с "нулевым товаром"
    $('#ShopBasketItemBlock_' + item).remove();
} 
