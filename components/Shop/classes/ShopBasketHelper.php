<?php

class ShopBasketHelper {
    
    static private $object;
    static private $SQL_HELPER;
    static private $urlHelper;
    static private $shopPageAlias;
    static private $priceTypeID;
    
    private function __construct() {
        global $_SQL_HELPER;
        self::$SQL_HELPER = $_SQL_HELPER;
        self::$urlHelper = new UrlHelper();
        self::createShopBasketArray();
        self::$priceTypeID = ShopGroupPriceType::getPriceTypeID();
        self::$shopPageAlias = ShopPageInfoHelper::getShopPageAlias();
    }
    
    /**
     * создание объекта
     */
    private static function createObject() {
        if(!isset(self::$object)) {
            self::$object = new ShopBasketHelper();
        }
    }
    
    private static function getItemData($itemID) {
        $query = "SELECT 
            SI.`id`, 
            SI.`itemName`, 
            SI.`group`, 
            SI.`groupName`, 
            SI.`action`, 
            SI.`amount` as maxAmount,
            SI.`minAmount`,
            SI.`description`, 
            SI.`shown`,
            SIP.`value` as priceValue
            FROM ( 
                SELECT 
                SI.`id`, 
                SI.`itemName`, 
                SI.`group`, 
                SG.`groupName`, 
                SI.`action`, 
                SI.`amount`,
                SI.`minAmount`,
                SI.`description`, 
                SI.`shown`
                FROM `ShopItems` as SI
                LEFT JOIN `ShopGroups` as SG
                ON SI.`group` = SG.`id`
                WHERE SI.`id` = '".$itemID."'
            ) as SI
            LEFT JOIN `ShopItemsPrices` as SIP
            ON SI.`id` = SIP.`item`
            WHERE SIP.`price` = '".self::$priceTypeID."';";
        return self::$SQL_HELPER->select($query,1);
    }
    
    private static function createShopBasketArray() {
        if(!isset($_SESSION['ShopBasket'])) {
            $_SESSION['ShopBasket'] = array();
        }
    }
    
    public static function clearShopBasket() {
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
                self::editItemAmountInTheShopBasket($itemID, $amount);
            } else {
                $itemData = self::getItemData($itemID);
                $itemData['action'] = $itemData['action'] > 0;
                $itemData['shown'] = $itemData['shown'] > 0;
                if($itemData['shown']) {
                    $_SESSION['ShopBasket'][$itemID] = $itemData;
                    $_SESSION['ShopBasket'][$itemID]['amount'] = $amount;
                    $_SESSION['ShopBasket'][$itemID]['allPriceValue'] = $itemData['priceValue'] * $amount;
                    $_SESSION['ShopBasket'][$itemID]['itemUrl'] = self::$urlHelper->pageUrl(self::$shopPageAlias, array('item',$itemID));
                    $_SESSION['ShopBasket'][$itemID]['groupUrl'] = self::$urlHelper->pageUrl(self::$shopPageAlias, array('catalog',$itemData['group']));
                    if($amount > $itemData['maxAmount']) {
                        $_SESSION['ShopBasket'][$itemID]['note'] = 'Количество заказаного товара превышает доступное, уточните наличие товара в магазине.';
                    } else {
                        $_SESSION['ShopBasket'][$itemID]['note'] = '';
                    }
                }
            }
        }
    }
    
    public static function editItemAmountInTheShopBasket($itemID, $amount) {
        self::createObject();
        if(self::checkItemInTheShopBasket($itemID)) {
            $oldAmount = self::getItemAmountInTheShopBasket($itemID);
            if($oldAmount + $amount < 1) {
                self::deleteItemFromShopBasket($itemID);
            } else {
                $_SESSION['ShopBasket'][$itemID]['amount'] += $amount;
                $_SESSION['ShopBasket'][$itemID]['allPriceValue'] = $_SESSION['ShopBasket'][$itemID]['priceValue'] * $_SESSION['ShopBasket'][$itemID]['amount'];
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
     * $rezult[<itemID>]['itemName'] - название товара
     * $rezult[<itemID>]['group'] - id группы товара
     * $rezult[<itemID>]['groupName'] - названеи группы товара
     * $rezult[<itemID>]['action'] - TRUE | FALSE - акционный ли товар
     * $rezult[<itemID>]['maxAmount'] - сколько всего товара доступно
     * $rezult[<itemID>]['minAmount'] - минимальный порог товаров
     * $rezult[<itemID>]['description'] - описание товара
     * $rezult[<itemID>]['shown'] - TRUE | FALSE - доступен ли товар дял заказа
     * $rezult[<itemID>]['priceValue'] - цена товара
     * $rezult[<itemID>]['allPriceValue'] - цена товара * количество товара
     * $rezult[<itemID>]['amount'] - количество товара в заказе
     * $rezult[<itemID>]['itemUrl'] - ссылка на страницу товара
     * $rezult[<itemID>]['groupUrl'] - ссылка на страницу каталога
     * $rezult[<itemID>]['note'] - заметка к заказу
     * @return array()
     */
    public static function getAllItemsFromShopBasket() {
        self::createObject();
        return $_SESSION['ShopBasket'];
    }
    
    public static function getDysplayButtonBuy($itemID) {
        self::createObject();
        $maxAmount = self::getItemFromShopBasket($itemID);
        $html = '';
        if (ShopBasketHelper::checkItemInTheShopBasket($itemID) ) {
            $html .= '<div class="ShopItemBuyButtonBlock">';
                $html .= '<a href="'.self::$urlHelper->pageUrl(ShopPageInfoHelper::getShopPageAlias(), array('shopbasket')).'">';
                    $html .= '<div class="ShopItemBuyButton" >';
                        $html .= 'Товар в корзине';
                    $html .= '</div>';  // ShopItemBuyButton
                $html .= '</a>';
            $html .= '</div>';  // ShopItemBuyButtonBlock
        } else {
            $html .= '<div class="ShopItemBuyButton" onclick="getShopItemAmountBuy( \''.$itemID.'\');">';
                $html .= 'Купить';
            $html .= '</div>';  // ShopItemBuyButton
            $html .= '<input type="number" name="shopItemAmountBuy" id="shopItemAmountBuy" class="shopItemAmountBuy" value="1" min="1" max="'.$maxAmount['maxAmount'].'" >';
        }
        return $html;
    }
}
