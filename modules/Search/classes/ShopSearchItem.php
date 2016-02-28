<?php

/**
 * Description of ShopSearchItem
 *
 * @author olga
 */
class ShopSearchItem {

    private $searchQuery;
    private $html;
    private $data;
    private $SQL_HELPER;
    private $urlHelper;
    private $imgSize = "50x50";
    private $defaultIcon = "defaultIcon_50x50.png";
    private $dir = './resources/Components/Shop/Image/';

    public function __construct($searchQuery) {
        $this->searchQuery = $searchQuery;
        global $_SQL_HELPER;
        $this->SQL_HELPER = $_SQL_HELPER;
        $this->urlHelper = new UrlHelper();
        $this->getData();
    }

    private function getData() {
        $query = "SELECT `groupName`, `id` FROM `ShopGroups` WHERE `groupName` LIKE '%" . $this->searchQuery . "%' AND `systemGroup` < 1;";
        $groups = $this->SQL_HELPER->select($query);
        foreach ($groups as $group) {
            $this->data[ShopPageInfoHelper::CatalogPage][$group['id']] = $group['groupName'];
        }
        $query = "SELECT `itemName`, `id` FROM `ShopItems` WHERE `itemName` LIKE '%" . $this->searchQuery . "%' AND `group` NOT IN (SELECT `id` FROM `ShopGroups` WHERE `systemGroup` > 0);";
        $items = $this->SQL_HELPER->select($query);
        foreach ($items as $item) {
            $this->data[ShopPageInfoHelper::ItemPage][$item['id']] = $item['itemName'];
        }
    }

    public function getSearchResult() {
        $this->html = "";
        $i = 0;
        if (count($this->data) > 0 && !empty($this->data)) {
            $this->html .= '<div class="searchModuleResultContent">';
            foreach ($this->data as $pageName => $unit) {
                foreach ($unit as $idUnit => $nameUnit) {
                    if ($i < 10) {
                        $this->html .= '<a class="searchOneItem" href="' . $this->urlHelper->pageUrl(ShopPageInfoHelper::getShopPageAlias(), array($pageName, $idUnit)) . '" >';
                        $this->html .= '<div class="elementImage">';
                        $this->html .= '<img src="' . $this->getImage($pageName, $idUnit) . '">';
                        $this->html .= '</div>';
                        $this->html .= '<div class="elementName">' . $nameUnit . '</div>';
                        $this->html .= '</a>';
                        $i++;
                    } else {
                        continue;
                    }
                }
            }
            $this->html .= '</div>'; // shopSearchModuleResultContent
        }
        return $this->html;
    }

    private function getImage($imageDir, $item) {
        if ($imageDir == 'catalog') {
            $imageDir = $this->dir . 'GROUPS/';
        } else {
            $imageDir = $this->dir . 'ITEMS/';
        }
        if (file_exists('../../../'.$imageDir . $item . '_' . $this->imgSize . '.jpg')) {
            $image = $item . '_' . $this->imgSize . '.jpg';
        } else if (file_exists('../../../'.$imageDir . $item . '_' . $this->imgSize . '.jpeg')) {
            $image = $item . '_' . $this->imgSize . '.jpeg';
        } else if (file_exists('../../../'.$imageDir . $item . '_' . $this->imgSize . '.png')) {
            $image = $item . '_' . $this->imgSize . '.png';
        } else {
            $image = $this->defaultIcon;
        }
        return $imageDir . $image;
    }

    private function getUnitImage($dir, $idUnit) {
        if ($dir == 'catalog') {
            $imageDir = $this->dir . 'GROUPS';
        } else {
            $imageDir = $this->dir . 'ITEMS';
        }
        $this->getImage($imageDir, $idUnit);
    }

}
