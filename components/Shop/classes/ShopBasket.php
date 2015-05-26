<?php

class ShopBasket {
    private $SQL_HELPER;
    private $HTML;
    private $items;

    /**
     * Конструктор класса
     * @global type $_SQL_HELPER
     */
    public function __construct() {
        $this->setTestData();
        global $_SQL_HELPER;
        $this->SQL_HELPER = $_SQL_HELPER;
        $this->items = ShopBasketHelper::getAllItemsFromShopBasket();
        $this->generateHtml();
    }
    
    private function setTestData() {
//        ShopBasketHelper::clearShopBasket();
//        ShopBasketHelper::addItemToTheShopBasket('3409410b-5b1f-11e2-8bea-005056be271d', 5);
//        ShopBasketHelper::addItemToTheShopBasket('e242e97f-f29b-11dd-9439-000e0c431b58', 3);
    }


    /**
     * Генерируем HTML информации о товаре
     */
    private function generateHtml() {
        $this->HTML = '<div class="ShopBasketBlock">';
        foreach ($this->items as $item) {
            $this->HTML .= '<div class="ShopBasketItem">';
                $this->HTML .= '<div class="itemName"><a href="'.$item['itemUrl'].'">'.$item['itemName'].'</a></div>';
                $this->HTML .= '<div class="groupName"><a href="'.$item['groupUrl'].'">'.$item['groupName'].'</a></div>';
                $this->HTML .= '<div class="priceValue">'.$item['priceValue'].'</div>';
                $this->HTML .= '<div class="allPriceValue">'.$item['allPriceValue'].'</div>';
                $this->HTML .= '<div class="amount">'.$item['amount'].'</div>';
                $this->HTML .= ShopItemAmountScale::getAmountScale($item['maxAmount'] - $item['amount'], $item['minAmount']);
                if(mb_strlen($item['note']) > 0) {
                    $this->HTML .= '<div class="note">'.$item['note'].'</div>';
                }
            $this->HTML .= '</div>';
        }
        $this->HTML .= '</div>';
    }
    
    /**
     * выводим HTML
     */
    public function get() {
        echo $this->HTML;
    }
    
    /**
     * Возвращаем HTML
     * @return string $this->HTML - сгенерированный HTML
     */
    public function getHtml() {
        return $this->HTML;
    }
}
