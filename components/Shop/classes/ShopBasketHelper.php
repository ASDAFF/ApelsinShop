<?php

class ShopBasketHelper {
    
    static private $object;
    static private $urlHelper;
    static private $shopPageAlias;
    
    private function __construct() {
        self::$urlHelper = new UrlHelper();
        self::clearShopBasket();
        self::$shopPageAlias = ShopPageInfoHelper::getShopPageAlias();
    }
    
    /**
     * создание объекта
     */
    private static function createObject() {
        if(!isset(self::$object)) {
            self::$object = new ShopGroupsUrlHelper();
        }
    }
    
    public static function clearShopBasket() {
        self::createObject();
        $_SESSION['ShopBasket'] = array();
    }
    
    public static function checkItemInTheShopBasket($itemID) {
        self::createObject();
        return isset($_SESSION['ShopBasket'][$itemID]);
    }
    
    public static function addItemToTheShopBasket($itemID, $amount = 1) {
        self::createObject();
        if($amount > 0) {
            if(self::checkItemInTheShopBasket($itemID)) {
                self::aditItemAmountInTheShopBasket($itemID, $amount);
            } else {
                $_SESSION['ShopBasket'][$itemID]['id'] = $itemID;
                $_SESSION['ShopBasket'][$itemID]['amount'] = $amount;
                $_SESSION['ShopBasket'][$itemID]['itemUrl'] = self::$urlHelper->pageUrl(self::$shopPageAlias, array('item',$itemID));
            }
        }
    }
    
    public static function aditItemAmountInTheShopBasket($itemID, $amount) {
        self::createObject();
        if(self::checkItemInTheShopBasket($itemID)) {
            $oldAmount = self::getItemAmountInTheShopBasket($itemID);
            if($oldAmount + $amount < 1) {
                self::deleteItemFromShopBasket($itemID);
            } else {
                $_SESSION['ShopBasket'][$itemID]['amount'] += $amount;
            }
        } else {
            self::addItemToTheShopBasket($itemID, $amount);
        }
    }
    
    public static function getItemAmountInTheShopBasket($itemID) {
        self::createObject();
        if(self::checkItemInTheShopBasket($itemID)) {
            $item = self::getItemFromShopBasket($itemID);
            return $item['amount'];
        } else {
            return 0;
        }
    }
    
    public static function deleteItemFromShopBasket($itemID) {
        self::createObject();
        unset($_SESSION['ShopBasket'][$itemID]);
    }
    
    public static function getItemFromShopBasket($itemID) {
        self::createObject();
        if(self::checkItemInTheShopBasket($itemID)) {
            return $_SESSION['ShopBasket'][$itemID];
        } else {
            return NULL;
        }
    }
    
    /**
     * Формат возвращаемого массива:
     * $rezult[<itemID>]['id'] - id товара
     * $rezult[<itemID>]['amount'] - количество товара;
     * $rezult[<itemID>]['itemUrl'] - ссылка на страницу товара
     * @return array()
     */
    public static function getAllItemsFromShopBasket() {
        self::createObject();
        return $_SESSION['ShopBasket'];
    }
    
    
}
