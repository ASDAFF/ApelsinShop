<?php
class ShopGroupsItemList {
    private $SQL_HELPER;
    private $groupID;
    private $page;
    private $urlHelper;
    private $itemsList;
    private $HTML;
    private $imageItemPath = './resources/Components/Shop/Image/ItemsImage/';
    private $defaultImageItemPath = './resources/Components/Shop/Image/ItemsImage/defaultIcon_100x100.png';
    
    public function __construct($page=1) {
        global $_SQL_HELPER;
        $this->SQL_HELPER = $_SQL_HELPER;
        $this->page = $page;
        $this->urlHelper = new UrlHelper();
        $this->setGroupID();
        $this->getPageData();
        $this->generateHTML();
    }
    
    private function setGroupID() {
        $groupID = ShopPageInfoHelper::shopPageGroupId();
        if($groupID!=='' && $groupID!==NULL) {
            $this->groupID = $groupID;
        } else {
            $this->groupID = 'root';
        }
    }
    
    private function getPageData() {
        if(!ShopPropertiesFilterSerchArray::issetGroupData($this->groupID)) {
            ShopPropertiesFilterSerchArray::setArrayGroup($this->groupID, array());
        }
        $sql = ShopPropertiesFilterSerchArray::getArrayGroupSQL_ForPage($this->groupID, $this->page);
        if($sql !== NULL) {
            $this->itemsList = $this->SQL_HELPER->select($sql);
        } else {
            $this->itemsList = array();
        }
    }
    
    private function getItemImage($itemId) {
        $imageName = $itemId."_100x100";
        $background = BackgroundGeneratorHelper::getBackgroundStyleImg($this->imageItemPath, $imageName, $this->defaultImageItemPath);
        return '<div class="ShopItemElement_Image" '.$background.'></div>';
    }
    
    private function generateHTML() {
        $this->HTML = "<div class='ShopItemsListBlock'>";
            $this->HTML .= $this->getPageNavigator();
            $this->HTML .= "<div class='ShopItemsList'>";
            foreach ($this->itemsList as $item) {
                $this->HTML .= $this->getItemHTML($item);
            }
            $this->HTML .= "</div>";
            $this->HTML .= $this->getPageNavigator();
            $this->HTML .= "<div class='ItemsFound'>";
            $this->HTML .= "Найдено товаров: ".ShopPropertiesFilterSerchArray::getArrayGroupAmauntOfItems($this->groupID);
            $this->HTML .= "</div>";
        $this->HTML .= "</div>";
    }
    
    private function getItemHTML($item) {
        $itemURL = $this->urlHelper->chengeParams(array('item',$item['id']));
        $item['action'] === 1 ? $itemClass = 'ActionItem' : $itemClass = 'NormalItem';
        $out = '';
        $out .= "<div class='ShopItemElement ".$itemClass."'>";
        if($item['action'] == 1) {
            $out .= "<div class='ActionItemLable'></div>";
        }
        $out .= "<a href='".$itemURL."'>";
            $out .= $this->getItemImage($item['id']);
            $out .= "<div class='ShopItemElement_ItemName'><div>".$item['itemName']."</div></div>";
            $out .= ShopItemAmountScale::getAmountScale($item['amount'], $item['minAmount']);
            $out .= "<div class='ShopItemElement_PriceValue'>".$item['priceValue']."</div>";
        $out .= "</a>";
        $out .= "</div>";
        return $out;
    }
    
    private function getPageNavigator() {
        $shopGroupsPageNavigator = new ShopGroupsPageNavigator($this->groupID, $this->page);
        $out = $shopGroupsPageNavigator->getHtml();
        return $out;
    }
    
    public function get() {
        echo $this->HTML;
    }
    
    public function getHtml() {
        return $this->HTML;
    }
}
