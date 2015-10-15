<?php

class ShopGroupsItemList {

    private $SQL_HELPER;
    private $groupID;
    private $page;
    private $showInformation;
    private $urlHelper;
    private $itemsList;
    private $HTML;
    private $imageItemPath;
    private $defaultImageItemPath;

    public function __construct($page = 1, $groupID = 'none', $showInformation = true) {
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

    public function setImagePath($imageItemPath = './resources/Components/Shop/Image/ITEMS/', $defaultImageItemPath = './resources/Components/Shop/Image/ITEMS/defaultIcon_100x100.png') {
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
        $imageName = $itemId . "_100x100";
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
        $item['action'] === 1 ? $itemClass = 'ActionItem' : $itemClass = 'NormalItem';
        $item['amount'] > 0 ? $availableClass = 'Available' : $availableClass = 'NotAvailable';
        $out = '';
        $out .= "<div class='ShopItemElement " . $itemClass . " " . $availableClass . "'>";
        if ($item['action'] == 1) {
            $out .= "<div class='ActionItemLable'></div>";
        }
        $out .= "<a href='" . $itemURL . "'>";
        $out .= $this->getItemImage($item['id']);
        $out .= "<div class='ShopItemElement_ItemName'><div>" . $item['itemName'] . "</div></div>";
        $out .= ShopItemAmountScale::getAmountScale($item['amount'], $item['minAmount']);
        $out .= "<div class='ShopItemElement_PriceValue'>" . TextGenerator::formattingPrices_RUB($item['priceValue']) . "</div>";
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
