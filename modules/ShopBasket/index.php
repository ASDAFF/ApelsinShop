<?php
include_once './modules/ShopBasket/classes/ShopBasketModule.php';
include_once './components/Shop/classes/ShopIncludeClasses.php';
ShopIncludeClasses::includeAllClasses();
$basket = new ShopBasketModule();
echo $basket->getHtml();
