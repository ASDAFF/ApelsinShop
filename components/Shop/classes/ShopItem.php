<?php
/**
 * класс отображения информации по одному товару
 * @author Максим
 */
class ShopItem {

    private $SQL_HELPER;
    private $elementID;
    private $HTML;
    private $data;
    private $price;
    private $property;
    private $imgSizeMidle = "_200x200";

    /**
     * Конструктор класса
     * @global type $_SQL_HELPER
     */
    public function __construct() {
        global $_SQL_HELPER;
        $this->SQL_HELPER = $_SQL_HELPER;
        $this->elementID = ShopPageInfoHelper::shopPageUrlElement();
        $this->getDataItem();
        if ($this->checkElementID()) {
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
        $this->HTML .= '<div class="UrlErrorHtml">';
            $this->HTML .= 'Такого товара в данном разделе нет.';
        $this->HTML .= '</div>';
    }

    /**
     * Получение данных Item
     */
    private function getDataItem() {
        $query = "SELECT * FROM `ShopItems` WHERE `id` = '".$this->elementID."';";
        $this->data = $this->SQL_HELPER->select($query,1);
    }

    /**
     * Получение цены
     */
    private function getPrice() {
        $id = ShopGroupPriceType::getPriceTypeID();
        $query = "SELECT `value` FROM `ShopItemsPrices` WHERE `price` = '".$id."' AND `item` = '".$this->elementID."';";
        $this->price = $this->SQL_HELPER->select($query,1);
    }

    /**
     * Генерируем HTML информации о товаре
     */
    private function generateHtml() {
        $this->getPrice();
        $this->property = ShopItemDataHelper::getProperty($this->elementID, $this->data['group']);
        $this->HTML = '<div class="ShopItemMainWrapper">';
            $this->HTML .= '<div class="ShopItemLeftBlock">';
            $this->HTML .= '<div class="ShopItemIMG">';
            $this->HTML .= '<a class="fancybox-gallery" href="'.ShopItemDataHelper::getBigImage($this->elementID).'">';
            $this->HTML .= '<img src="'.ShopItemDataHelper::getImage($this->elementID, $this->imgSizeMidle).'" alt="'.$this->data['itemName'].'" title="'.$this->data['itemName'].'">';
            $this->HTML .= '</a>';
            $this->HTML .= '</div>';  // ShopItemIMG
            $this->HTML .= '<div class="ShopItemName">';
            $this->HTML .= $this->data['itemName'];
            $this->HTML .= '</div>';  // ShopItemName
            $this->HTML .= '<div class="ShopItemPrice">';
            $this->HTML .= $this->price['value'];
            $this->HTML .= '</div>';  // ShopItemPrice
            $this->HTML .= ShopItemAmountScale::getAmountScale($this->data['amount'], $this->data['minAmount']);
            $this->HTML .= '<div class="ShopItemBuyButtonBlock">';
            if ($this->data['amount'] > 0) {
                $this->HTML .= ShopBasketHelper::getDysplayButtonBuy($this->elementID);
            } else {
                $this->HTML .= 'Товара нет. <br />Уточняйте у менеджера.';
            }
            $this->HTML .= '</div>';  // ShopItemBuyButtonBlock
            $this->HTML .= '</div>';  // ShopItemLeftBlock
            $this->HTML .= '<div class="ShopItemMainBlock">';
            $this->HTML .= '<div class="ShopItemDescription">';
            $this->HTML .= $this->data['description'];
            $this->HTML .= '</div>';  // ShopItemDescription
            $this->HTML .= '<div class="ShopItemParams">';
            foreach ($this->property as $property) {
                $this->HTML .= '<div class="ShopItemParam">';
                $this->HTML .= '<div class="ShopItemParamName"><div>';
                $this->HTML .= $property['propertyName'].' :';
                $this->HTML .= '</div></div>';  // ShopItemParamName
                $this->HTML .= '<div class="ShopItemParamValue"><div>';
                $this->HTML .= ShopItemDataHelper::getHtmlAllValue($property, $property['oneOfAllValues'] === "1");
                $this->HTML .= '</div></div>';  // ShopItemParamValue
                $this->HTML .= '</div>';  // ShopItemParam
            }
            $this->HTML .= '</div>';  // ShopItemParams
            $this->HTML .= '</div>';  // ShopItemMainBlock
            $this->HTML .= '<div class="clear"></div>';
        $this->HTML .= '</div>';  // ShopItemMainWrapper
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
