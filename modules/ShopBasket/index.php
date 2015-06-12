<?php
include_once './modules/ShopBasket/classes/ShopBasketModule.php';
$basket = new ShopBasketModule();
echo $basket->getHtml();
