<?php
/**
 * Description of ShopBasketModuleOneItem
 *
 * @author olga
 */
class ShopBasketModuleOneItem {

    private $html;
    private $item;
    private $imgSize = "50x50";
    private $defaultIcon = "defaultIcon_50x50.png";

    public function __construct($itemID, $imageDir) {
        $this->item = ShopBasketHelper::getItemFromShopBasket($itemID);
        $this->imageDir = $imageDir;
        $this->defaultIcon = "defaultIcon_".$this->imgSize.".png";
        $this->generationHtml();
    }

    public function getHtml() {
        return $this->html;
    }

    private function generationHtml() {
        $this->html .= '<div class="ShopBasketModuleOneItemInBasketWrapper">';
            $this->html .= '<div class="ShopBasketModuleOneItemTitle">Добавлен товар:</div>';
            $this->html .= '<div class="ShopBasketBlockItem">';
                $this->html .= '<div class="ShopBasketLeftBlock">';
                    $this->html .= '<div class="itemImage">';
                    $this->html .= '<img src="'.$this->getImage($this->item['id']).'">';
                    $this->html .= '</div>';
                $this->html .= '</div>';
                $this->html .= '<div class="ShopBasketCenterBlock">';
                    $this->html .= '<div class="itemName">'.$this->item['itemName'].'</div>';
                $this->html .= '</div>';
                $this->html .= '<div class="ShopBasketRightBlock">';
                    $this->html .= '<div class="ShopBasketItemPriceInfoBlock">';
                        $this->html .= '<div class="ShopBasketItemAmountBlock">';
                            $this->html .= $this->item['amount'];
                        $this->html .= '</div>';
                            $this->html .= '<div class="priceValue"><span >'.$this->item['priceValue'].'</span></div>';
                        $this->html .= '</div>';
                    $this->html .= '</div>';
                $this->html .= '</div>';
        $this->html .= '</div>';
        $this->html .= '<div class="allPriceValue">';
            $this->html .= '<span >'.$this->item['allPriceValue'].'</span>';
        $this->html .= '</div>';
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
}
