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
        global $_SQL_HELPER;
        $this->SQL_HELPER = $_SQL_HELPER;
        $this->generateHtml();
        $this->items = ShopBasketHelper::getAllItemsFromShopBasket();
    }


    /**
     * Генерируем HTML информации о товаре
     */
    private function generateHtml() {
        $this->HTML = '';
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
