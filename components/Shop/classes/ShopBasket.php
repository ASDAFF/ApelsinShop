<?php

class ShopBasket {
    private $SQL_HELPER;
    private $HTML;
    private $items;
    private $imageDir = './resources/Components/Shop/Image/ItemsImage/';
    private $imgSize = "50x50";
    private $defaultIcon = "defaultIcon_50x50.png";
    private $defaultBigIcon = "defaultIcon.png";

    /**
     * Конструктор класса
     * @global type $_SQL_HELPER
     */
    public function __construct() {
        $this->defaultIcon = "defaultIcon_".$this->imgSize.".png";
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
    
    private function getImage($item) {
        if (file_exists($this->imageDir.$item.'_'.$this->imgSize.'.jpg'))  {
            $image = $item.'_'.$this->imgSize.'.jpg';
        } elseif (file_exists($this->imageDir.$item.'_'.$this->imgSize.'.png'))  {
            $image = $item.'_'.$this->imgSize.'.png';
        } else {
            $image = $this->defaultIcon;
        }
        return $this->imageDir.$image;
    }
    
    private function getBigImage($item) {
        if (file_exists($this->imageDir.$item.'.jpg'))  {
            $image = $item.'.jpg';
        } elseif (file_exists($this->imageDir.$item.'.png'))  {
            $image = $item.'.png';
        } else {
            $image = $this->defaultBigIcon;
        }
        return $this->imageDir.$image;
    }
    
    private function getImageHTML($item,$itemName) {
        $out = '<a class="fancybox-gallery" href="'.$this->getBigImage($item).'">';
        $out .= '<img src="'.$this->getImage($item).'" alt="'.$itemName.'" title="'.$itemName.'">';
        $out .= '</a>';
        return $out;
    }
    
    public static function getShopItemAmountForBuy($itemID, $disabledWrite = false, $value) {
        if($disabledWrite) {
            $disSTR = 'disabled';
        } else {
            $disSTR = '';
        }
        $out = '<div id="shopItemAmountBuyBlock_'.$itemID.'" class="shopItemAmountBuyBlock">';
        $out .= '<div id="shopItemAmountBuyDelButton_'.$itemID.'" class="shopItemAmountBuyDelButton">-</div>';
        $out .= '<input type="text" '
                . 'name="shopItemAmountBuy" '
                . 'id="shopItemAmountBuy_'.$itemID.'" '
                . 'class="shopItemAmountBuy" '
                . 'value="'.$value.'" '.$disSTR.'>';
        $out .= '<div id="shopItemAmountBuyAddButton_'.$itemID.'" class="shopItemAmountBuyAddButton">+</div>';
        $out .= '</div>';
        return $out;
    }

    /**
     * Генерируем HTML информации о товаре
     */
    private function generateHtml() {
        $this->HTML = '<div class="ShopBasketBlock">';
        foreach ($this->items as $item) {
            $this->HTML .= $this->generateItemHtml($item);
        }
        $this->HTML .= $this->generateBuyHtml();
        $this->HTML .= '</div>';
    }
    
    private function generateItemHtml($item) {
        $out = '<div class="ShopBasketItemBlock" title="'.$item['note'].'">';
            $out .= '<div class="ShopBasketItemImageInfoBlock">';
                $out .= '<div class="itemImage">';
                $out .= $this->getImageHTML($item['id'],$item['itemName']);
                $out .= '</div>';
                $out .= ShopItemAmountScale::getAmountScale($item['maxAmount'], $item['minAmount']);
            $out .= '</div>';
            $out .= '<div class="ShopBasketItemTextInfoBlock">';
                $out .= '<div class="itemName"><a href="'.$item['itemUrl'].'">'.$item['itemName'].'</a></div>';
            $out .= '</div>';
            $out .= '<div class="ShopBasketItemPriceInfoBlock">';
                $out .= '<div class="priceValue"><span>'.$item['priceValue'].'</span></div>';
                $out .= '<div class="allPriceValue"><span>'.$item['allPriceValue'].'</span></div>';
            $out .= '</div>';
            $out .= '<div class="ShopBasketItemButtonBlock">';
                $out .= '<div class="AmountButtonBlock">';
                $out .= $this->getShopItemAmountForBuy($item['id'], true, $item['amount']);
                $out .= '</div>';
                $out .= '<div class="DeleteButtonBlock">';
                    $out .= '<div class="DeleteButton">Удалить</div>';
                $out .= '</div>';
            $out .= '</div>';
        $out .= '</div>';
        return $out;
    }
    private function generateBuyHtml() {
        $pay = 0;
        foreach ($this->items as $item) {
            $pay += $item['allPriceValue'];
        }
        $out = '<div class="ShopBasketItemBuyBlock">';
            $out .= '<div class="ShopBasketItemBuyButton">Купить</div>';
            $out .= '<div class="ShopBasketItemPayInfoBlock"><span class="text">Итого:</span> <span class="price">'.$pay.'</span></div>';
        $out .= '</div>';
        return $out;
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
