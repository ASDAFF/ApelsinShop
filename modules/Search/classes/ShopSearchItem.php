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

    public function __construct($searchQuery) {
        $this->searchQuery = $searchQuery;
        global $_SQL_HELPER;
        $this->SQL_HELPER = $_SQL_HELPER;
        $this->urlHelper = new UrlHelper();
        $this->getData();
    }

    private function getData() {
        $query = "SELECT `groupName`, `id` FROM `ShopGroups` WHERE `groupName` LIKE '%".$this->searchQuery."%';";
        $groups = $this->SQL_HELPER->select($query);
        foreach ($groups as $group) {
            $this->data[ShopPageInfoHelper::CatalogPage][$group['id']] = $group['groupName'];
        }
        $query = "SELECT `itemName`, `id` FROM `ShopItems` WHERE `itemName` LIKE '%".$this->searchQuery."%';";
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
                        $this->html .= '<a class="searchOneItem" href="'.$this->urlHelper->pageUrl(ShopPageInfoHelper::getShopPageAlias(),array($pageName, $idUnit)).'" >';
                        $this->html .= '<p>'.$nameUnit.'</p>';
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
}
