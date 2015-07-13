<?php
class ShopBasketModuleUpdate {

    private $html;
    private $SQL_HELPER;
    private $items;
    private $imgSize = "50x50";
    private $defaultIcon = "defaultIcon_50x50.png";

    public function __construct($imageDir) {
        $this->imageDir = $imageDir;
        $this->defaultIcon = "defaultIcon_".$this->imgSize.".png";
        global $_SQL_HELPER;
        $this->SQL_HELPER = $_SQL_HELPER;
        $this->items = ShopBasketHelper::getAllItemsFromShopBasket();
        $this->generationHtml();
    }

    public function getHtml() {
        return $this->html;
    }

    private function generationHtml() {
        $this->html = '<div class="ShopBasketModuleWrapper" id="ShopBasketModuleWrapper">';
            $this->html .= '<div class="ShopBasketModuleContent" id="ShopBasketModuleContent">';
            foreach ($this->items as $item) {
                $this->html .= $this->generateItemHtml($item);
            }
            $this->html .= '</div>';
            $this->html .= $this->generateBuyHtml();
        $this->html .= '</div>';
    }

    private function getImageHTML($item,$itemName) {
        $out = '<img src="'.$this->getImage($item).'" alt="'.$itemName.'" title="'.$itemName.'">';
        return $out;
    }

    private function getImage($item) {
        if (file_exists($this->imageDir.$item.'_'.$this->imgSize.'.jpg')) {
            $image = $item.'_'.$this->imgSize.'.jpg';
        } elseif (file_exists($this->imageDir.$item.'_'.$this->imgSize.'.png')) {
            $image = $item.'_'.$this->imgSize.'.png';
        } else {
            $image = $this->defaultIcon;
        }
        return $this->imageDir.$image;
    }

    private function generateItemHtml($item) {
        $out = '<div class="ShopBasketBlockItem" id="ShopBasketBlockItem_'.$item['id'].'" title="'.$item['note'].'">';
            $out .= '<div class="ShopBasketLeftBlock">';
                $out .= '<div class="itemImage">';
                $out .= $this->getImageHTML($item['id'],$item['itemName']);
                $out .= '</div>';
            $out .= '</div>';
            $out .= '<div class="ShopBasketCenterBlock">';
                $out .= '<div class="itemName">'.$item['itemName'].'</div>';
            $out .= '</div>';
            $out .= '<div class="ShopBasketRightBlock">';
                $out .= '<div class="ShopBasketItemAmountBlock">';
                    $out .= $item['amount'];
                $out .= '</div>';
                $out .= '<div class="ShopBasketItemPriceInfoBlock">';
                    $out .= '<div class="priceValue">';
                        $out .= '<span >'.TextGenerator::formattingPrices_RUB($item['priceValue']).'</span>';
                    $out .= '</div>';
                    $out .= '<div class="allPriceValue">';
                        $out .= '<span >'.TextGenerator::formattingPrices_RUB($item['allPriceValue']).'</span>';
                    $out .= '</div>';
                $out .= '</div>';
            $out .= '</div>';
        $out .= '</div>';
        return $out;
    }

    private function generateBuyHtml() {
        $total = ShopBasketHelper::getTotal();
        $urlHelper = new UrlHelper();
        if (!empty($total)) {
            $out = '<a href="'.$urlHelper->pageUrl(ShopPageInfoHelper::getShopPageAlias(), array('shopbasket')).'">';
            $out .= '<div class="ShopBasketButton"><span>В корзину</span>';
            $out .= '</div>';
            $out .= '</a>';
        }
        return $out;
    }
}
