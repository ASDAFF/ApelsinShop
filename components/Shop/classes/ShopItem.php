<?php
/**
 * класс отображения информации по одному товару
 * @author Максим
 */
class ShopItem {
    private $SQL_HELPER;
    private $elementID;
    private $HTML;
    
    /**
     * Конструктор класса
     * @global type $_SQL_HELPER
     */
    public function __construct() {
        global $_SQL_HELPER;
        $this->SQL_HELPER = $_SQL_HELPER;
        $this->elementID = ShopPageInfoHelper::shopPageUrlElement();
        if($this->checkElementID()) {
            $this->generateHtml();
        } else {
            $this->generateUrlErrorHtml();
        }
    }
    
    /**
     * Проверяем есть ил даныне по такому товару
     * @return boolean
     */
    private function checkElementID() {
        if($this->elementID !== NULL) {
            $query = "SELECT count(`id`) as amount FROM `ShopItems` WHERE `id`='".$this->elementID."';";
            $rezult = $this->SQL_HELPER->select($query,1);
            return $rezult['amount'] === '1';
        } else {
            return FALSE;
        }
    }
    
    /**
     * Генерируем HTML в случае ошибки в URL строке браузера
     */
    private function generateUrlErrorHtml() {
        $this->HTML = '';
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
