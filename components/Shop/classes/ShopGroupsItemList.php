<?php

class ShopGroupsItemList {

    private $SQL_HELPER;
    private $groupID;
    private $page;
    private $showInformation;
    private $urlHelper;
    private $itemsList = array();
    private $HTML;
    private $imageItemPath;
    private $defaultImageItemPath;
    private $statusToCSS;

    public function __construct($page = 1, $groupID = 'none', $showInformation = true) {
        $this->statusToCSS['Возится и в наличии']['css'] = "status_available";
        $this->statusToCSS['Возится и в наличии']['ItemLable']['css'] = "status_available";
        $this->statusToCSS['Возится и в наличии']['ItemLable']['Available'] = false;
        $this->statusToCSS['Возится и в наличии']['ItemLable']['NotAvailable'] = true;
        $this->statusToCSS['Возится и в наличии']['ItemLable']['actionPriority'] = false;
        $this->statusToCSS['Возится под заказ']['css'] = "status_for_order";
        $this->statusToCSS['Возится под заказ']['ItemLable']['css'] = "status_for_order";
        $this->statusToCSS['Возится под заказ']['ItemLable']['Available'] = true;
        $this->statusToCSS['Возится под заказ']['ItemLable']['NotAvailable'] = true;
        $this->statusToCSS['Возится под заказ']['ItemLable']['actionPriority'] = true;
        $this->statusToCSS['Распродается, возится под заказ']['css'] = "status_sold_out";
        $this->statusToCSS['Распродается, возится под заказ']['ItemLable']['css'] = "status_sold_out";
        $this->statusToCSS['Распродается, возится под заказ']['ItemLable']['Available'] = true;
        $this->statusToCSS['Распродается, возится под заказ']['ItemLable']['NotAvailable'] = true;
        $this->statusToCSS['Распродается, возится под заказ']['ItemLable']['actionPriority'] = true;
        $this->statusToCSS['Снят с производства, распродается']['css'] = "status_out_of_production";
        $this->statusToCSS['Снят с производства, распродается']['ItemLable']['css'] = "status_out_of_production";
        $this->statusToCSS['Снят с производства, распродается']['ItemLable']['Available'] = true;
        $this->statusToCSS['Снят с производства, распродается']['ItemLable']['NotAvailable'] = true;
        $this->statusToCSS['Снят с производства, распродается']['ItemLable']['actionPriority'] = true;
        $this->setImagePath();
        global $_SQL_HELPER;
        $this->SQL_HELPER = $_SQL_HELPER;
        $this->page = $page;
        $this->showInformation = $showInformation;
        $this->urlHelper = new UrlHelper();
        $this->setGroupID($groupID);
        $this->getPageData();
        $this->generateHTML();
    }

    public function setImagePath($imageItemPath = './resources/Components/Shop/Image/ITEMS/', $defaultImageItemPath = './resources/Components/Shop/Image/ITEMS/defaultIcon_150x150.png') {
        $this->imageItemPath = $imageItemPath;
        $this->defaultImageItemPath = $defaultImageItemPath;
        if (isset($this->HTML) && $this->HTML !== NULL && $this->HTML !== '') {
            $this->generateHTML();
        }
    }

    private function setGroupID($groupID) {
        if ($groupID === 'none') {
            $groupID = ShopPageInfoHelper::shopPageGroupId();
            if ($groupID !== '' && $groupID !== NULL) {
                $this->groupID = $groupID;
            } else {
                $this->groupID = 'root';
            }
        } else {
            if ($groupID !== '' && $groupID !== NULL) {
                $this->groupID = $groupID;
            } else {
                $this->groupID = 'root';
            }
        }
    }

    private function getPageData() {
        if (!ShopPropertiesFilterSerchArray::issetGroupData($this->groupID)) {
            ShopPropertiesFilterSerchArray::setArrayGroup($this->groupID, array());
        }
        $sql = ShopPropertiesFilterSerchArray::getArrayGroupSQL_ForPage($this->groupID, $this->page);
        if ($sql !== NULL) {
            $this->itemsList = $this->SQL_HELPER->select($sql);
        } else {
            $this->itemsList = array();
        }
    }

    private function getItemImage($itemId) {
        $imageName = $itemId . "_150x150";
        $background = '';
        $img = '<img src="' . $this->getImage($imageName) . '">';
        return '<div class="ShopItemElement_Image" ' . $background . '>' . $img . '</div>';
    }

    private function getImage($item) {
        if (file_exists($this->imageItemPath . $item . '.jpg')) {
            return $this->imageItemPath . $item . '.jpg';
        } elseif (file_exists($this->imageItemPath . $item . '.png')) {
            return $this->imageItemPath . $item . '.png';
        }
        return $this->defaultImageItemPath;
    }

    private function generateHTML() {
        $this->HTML = "<div class='ShopItemsListBlock'>";
        if ($this->showInformation) {
            $this->HTML .= ShopGroupPropertyValue::getPropertyValueForGroup($this->groupID);
        }
//            $this->HTML .= $this->getPageNavigator();
        $this->HTML .= "<div class='ShopItemsList'>";
        foreach ($this->itemsList as $item) {
            $this->HTML .= $this->getItemHTML($item);
        }
        $this->HTML .= "</div>";
//            $this->HTML .= $this->getPageNavigator();
//            $this->HTML .= "<div class='ItemsFound'>";
//            $this->HTML .= "Найдено товаров: ".ShopPropertiesFilterSerchArray::getArrayGroupAmauntOfItems($this->groupID);
//            $this->HTML .= "</div>";
        $this->HTML .= "<div class='clear'></div>";
        $this->HTML .= "</div>";
    }

    private function getItemHTML($item) {
        $itemURL = $this->urlHelper->chengeParams(array('item', $item['id']));
        $item['action'] > 0 ? $itemClass = 'ActionItem' : $itemClass = 'NormalItem';
        $item['action'] > 0 ? $itemLableClass_action = 'action' : $itemLableClass_action = 'no_action';
        
        $item['totalAmount'] > 0 ? $availableClass = 'Available' : $availableClass = 'NotAvailable';
        $item['totalAmount'] > 0 ? $itemLableClass_amount = 'amount_available' : $itemLableClass_amount = 'amount_not_available';
        
        if(isset($this->statusToCSS[$item['status']]['css'])) {
            $statusClass = $this->statusToCSS[$item['status']]['css'];
        } else {
            $statusClass = "status_default";
        }
        $out = '';
        $out .= "<div class='ShopItemElement " . $itemClass . " " . $statusClass. " " . $availableClass . "'>";
        if(isset($this->statusToCSS[$item['status']]['ItemLable']['css'])) {
            $itemLableStatusCss = $this->statusToCSS[$item['status']]['ItemLable']['css'];
        } else {
            $itemLableStatusCss = "status_default";
        }
        $out .= "<div class='ItemLable ".$itemLableStatusCss." ".$itemLableClass_amount." ".$itemLableClass_action."'></div>";
        $out .= "<a href='" . $itemURL . "'>";
        $out .= $this->getItemImage($item['id']);
        $out .= "<div class='ShopItemElement_ItemName'><div>" . $item['itemName'] . "</div></div>";
        $out .= ShopItemAmountScale::getAmountScale($item['totalAmount'], $item['minAmount']);
        $out .= "<div class='ShopItemElement_PriceValue'>" . TextGenerator::formattingPrices_RUB($item['priceValue']) . "</div>";
        $out .= "</a>";
        $out .= "</div>";
        return $out;
    }
    
    private function checkStatusToCSS_ItemLable($status, $availableClass) {
        return isset($this->statusToCSS[$status]['ItemLable'][$availableClass]) && $this->statusToCSS[$status]['ItemLable'][$availableClass];
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
