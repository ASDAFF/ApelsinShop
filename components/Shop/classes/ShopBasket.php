<?php
class ShopBasket {

    private $SQL_HELPER;
    private $HTML;
    private $items;
    private $imgSizeSmall = "_50x50";
    private $imgSizeMidle = "_100x100";
    private $data;

    /**
     * Конструктор класса
     * @global type $_SQL_HELPER
     */
    public function __construct() {
        global $_SQL_HELPER;
        $this->SQL_HELPER = $_SQL_HELPER;
        $this->items = ShopBasketHelper::getAllItemsFromShopBasket();
        $this->generateHtml();
    }

    private function getDataItem($item) {
        $query = "SELECT * FROM `ShopItems` WHERE `id` = '".$item."';";
        $this->data = $this->SQL_HELPER->select($query,1);
    }

    private function getImageHTML($item, $itemName) {
        $out = '<a class="fancybox-gallery" href="'.ShopItemDataHelper::getImage($item, '').'">';
        $out .= '<img src="'.ShopItemDataHelper::getImage($item, $this->imgSizeSmall).'" alt="'.$itemName.'" title="'.$itemName.'">';
        $out .= '</a>';
        return $out;
    }

    public static function getShopItemAmountForBuy($itemID, $value) {
        $out = '<div class="shopItemAmountBuyBlock">';
        $out .= '<button class="shopItemAmountBuyDelButton" itemID="'.$itemID.'">-</button>';
        $out .= '<input type="text" name="shopItemAmountBuy" id="'.$itemID.'" '
                . 'class="shopItemAmountBuy" maxlength="5" value="'.$value.'">';
        $out .= '<button class="shopItemAmountBuyAddButton" itemID="'.$itemID.'">+</button>';
        $out .= '</div>';
        return $out;
    }

    /**
     * Генерируем HTML информации о товаре
     */
    private function generateHtml() {
        if (!empty($this->items)) {
            $this->HTML .= '<div class="ShopBasketBlock">';
                foreach ($this->items as $item) {
                    $this->HTML .= $this->generateItemHtml($item);
                }
                $this->HTML .= $this->generateBuyHtml();
            $this->HTML .= '</div>';
            $style = 'none';
        } else {
            $style = 'display';
        }
        $this->HTML .= '<div class="ShopBasketBlockEmpty" style="display: '.$style.'">Товары в корзине отсутствуют.</div>';
    }

    private function generateItemHtml($item) {
        $out = '<div class="ShopBasketItemBlock" id="ShopBasketItemBlock_'.$item['id'].'" title="'.$item['note'].'">';
            $out .= '<div class="ShopBasketItemImageInfoBlock">';
            $out .= '<div class="itemImage">';
            $out .= $this->getImageHTML($item['id'], $item['itemName']);
            $out .= '</div>';
            $out .= ShopItemAmountScale::getAmountScale($item['maxAmount'], $item['minAmount']);
            $out .= '</div>';
            $out .= '<div class="ShopBasketItemTextInfoBlock">';
            $out .= $this->getMoreInfo($item);
            $out .= '</div>';
            $out .= '<div class="ShopBasketItemPriceInfoBlock">';
            $out .= '<div class="priceValue"><span id="priceValue_'.$item['id'].'">'.TextGenerator::formattingPrices_RUB($item['priceValue']).'</span></div>';
            $out .= '<div class="allPriceValue"><span id="allPriceValue_'.$item['id'].'">'.TextGenerator::formattingPrices_RUB($item['allPriceValue']).'</span></div>';
            $out .= '</div>';
            $out .= '<div class="ShopBasketItemButtonBlock">';
            $out .= '<div class="AmountButtonBlock">';
            $out .= $this->getShopItemAmountForBuy($item['id'], $item['amount']);
            $out .= '</div>';
            $out .= '<div class="DeleteButtonBlock" idDel="'.$item['id'].'">';
            $out .= '<button class="DeleteButton">Удалить</button>';
            $out .= '</div>';
            $out .= '</div>';
        $out .= '</div>';
        return $out;
    }

    private function getMoreInfo($item) {
        $this->getDataItem($item['id']);
        $property = ShopItemDataHelper::getProperty($item['id'], $this->data['group']);
        $out = '<a class="fancybox-doc" href="#itemMoreInfo_'.$item['id'].'">';
            $out .= '<div class="itemName" title="подробнее">'.$item['itemName'].'</div>';
        $out .= '</a>';
            $out .= '<div class="doc_div" id="itemMoreInfo_'.$item['id'].'" style="display: none;">';
                $out .= '<div class="itemMoreInfoWrapper">';
                    $out .= ShopGroupsPathPanelHelper::getPanel($item['group']);
                    $out .= '<img src="'.ShopItemDataHelper::getImage($item['id'], $this->imgSizeMidle).'" alt="'.$item['itemName'].'" title="'.$item['itemName'].'">';
                    $out .= '<div class="itemMoreInfoWrapperNameDescription">';
                    $out .= '<div class="titleName">'.$item['itemName'].'</div>';
                    $out .= '<div class="ShopItemDescription">';
                    $out .= $this->data['description'];
                    $out .= '</div>';
                    $out .= '</div>';
                    $out .= '<div class="clear"></div>';
                    $out .= '<div class="itemMoreInfoWrapperLine"></div>';
                    $out .= '<div class="ShopItemParams">';
                    foreach ($property as $property) {
                        $out .= '<div class="ShopItemParam">';
                            $out .= '<div class="ShopItemParamName"><div>';
                                $out .= $property['propertyName'].' :';
                            $out .= '</div></div>';
                            $out .= '<div class="ShopItemParamValue"><div>';
                                $out .= ShopItemDataHelper::getHtmlAllValue($property, $property['oneOfAllValues'] === "1");
                            $out .= '</div></div>';
                        $out .= '</div>';
                    }
                    $out .= '</div>';
                $out .= '</div>';
            $out .= '</div>';
        return $out;
    }

    private function generateBuyHtml() {
        $price = 0;
        $out = '';
        if (!empty($this->items)) {
            foreach ($this->items as $item) {
                $price += $item['allPriceValue'];
            }
            $out = '<div class="ShopBasketItemBuyBlock">';
                $out .= '<div class="ShopBasketItemClearButton ShopBasketItemBuyButton">Очистить</div>';
                $urlHelper = new UrlHelper();
                $out .= '<a href="'.$urlHelper->pageUrl(ShopPageInfoHelper::getShopPageAlias(), [ShopPageInfoHelper::ShopbasketPage, 'buy']).'">';
                    $out .= '<div class="ShopBasketItemBuyButton" id="ShopItemBuyButton">Купить</div>';
                $out .= '</a>';
                $out .= '<div class="ShopBasketItemPayInfoBlock"><span class="text">Итого:</span> <span class="price">'.TextGenerator::formattingPrices_RUB($price).'</span></div>';
            $out .= '</div>';
        }
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
