<?php
class ShopGroupsItemList {
    private $SQL_HELPER;
    private $groupID;
    private $page;
    private $urlHelper;
    private $itemsList;
    private $HTML;
    
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
        $itemURL = $this->urlHelper->chengeParams(array('item',$item['id']));
        $out = '';
        $out .= "<div class='ShopItemElement'>";
        $out .= "<div class='ShopItemElement_ID'><a href='".$itemURL."'>".$item['id']."</a></div>";
        $out .= "<div class='ShopItemElement_ItemName'>".$item['itemName']."</div>";
        if($item['action'] === 1) {
            $out .= "<div class='ShopItemElement_Action'>Акция</div>";
        }
        $out .= "<div class='ShopItemElement_PriceValue'>".$item['priceValue']."</div>";
        $out .= "</div>";
        $out .= "<hr>";
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
