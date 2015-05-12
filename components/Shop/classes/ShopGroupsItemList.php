<?php
class ShopGroupsItemList {
    private $SQL_HELPER;
    private $groupID;
    private $page;
    private $itemsList;
    private $HTML;
    
    public function __construct($page=1) {
        global $_SQL_HELPER;
        $this->SQL_HELPER = $_SQL_HELPER;
        $this->page = $page;
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
    
    private function generateHTML() {
        $this->HTML = "<div class='ShopItemsList'>";
        $this->HTML .= "Найдено товаров: ".ShopPropertiesFilterSerchArray::getArrayGroupAmauntOfItems($this->groupID);
        $this->HTML .= "<hr>";
        $this->HTML .= $this->getPageNavigator();
        $this->HTML .= "<hr>";
        foreach ($this->itemsList as $item) {
            $this->HTML .= $this->getItemHTML($item);
        }
        $this->HTML .= "</div>";
        $this->HTML .= $this->getPageNavigator();
    }
    
    private function getItemHTML($item) {
        $out = '';
        $out .= "<div class='ShopItemElement'>";
        $out .= "<div class='ShopItemElement_ID'>".$item['id']."</div>";
        $out .= "<div class='ShopItemElement_ItemName'>".$item['itemName']."</div>";
        if($item['action'] === 1) {
            $out .= "<div class='ShopItemElement_Action'>Акция</div>";
        }
        $out .= "<div class='ShopItemElement_PriceValue'>".$item['priceValue']."</div>";
        $out .= "</div>";
        $out .= "<hr>";
        return $out;
    }
    private function getPageNavigatorElementURl($page) {
        if( $this->groupID !== 'root' ) {
            return ShopGroupsUrlHelper::getUrl(array('catalog', $this->groupID, 'p', $page));
        } else {
            return ShopGroupsUrlHelper::getUrl(array('p', $page));
        }
    }
    
    private function getPageNavigator() {
        $amauntOfPage = ShopPropertiesFilterSerchArray::getArrayGroupAmauntOfPage($this->groupID);
        $out = "<ul class='ShopItemsListNav'>";
        for ($i = 1; $i <= $amauntOfPage; $i++) {
            if($this->page == $i) {
                $out .= $this->getPageNavigator_ThisPage($i);
            } else {
                $out .= $this->getPageNavigator_OtherPage($i);
            }
        }
        $out .= "</ul>";
        return $out;
    }
    private function getPageNavigator_ThisPage($page) {
        $out = "<li class='ShopItemsListNavElement ThisPageNavElement'>";
        $out .= $page;
        $out .= "</li>";
        return $out;
    }
    private function getPageNavigator_OtherPage($page) {
        $out = "<li class='ShopItemsListNavElement'>";
        $out .= "<a href='".$this->getPageNavigatorElementURl($page)."'>".$page."</a>";
        $out .= "</li>";
        return $out;
    }
    
    public function get() {
        echo $this->HTML;
    }
    
    public function getHtml() {
        return $this->HTML;
    }
}
